-- Kullan�c�lar Tablosu
CREATE TABLE Kullanicilar
(
    KullaniciID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciAdi NVARCHAR(50) NOT NULL,
    Sifre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    ProfilResmi NVARCHAR(255),
    IkiFaktorDogrulamaKodu NVARCHAR(10), -- �ki fakt�rl� do�rulama kodu
    IkiFaktorDogrulamaDurumu BIT DEFAULT 0, -- �ki fakt�rl� do�rulama durumu
    CONSTRAINT UQ_KullaniciAdi UNIQUE (KullaniciAdi),
    CONSTRAINT UQ_Email UNIQUE (Email),
	CevrimIciDurumu BIT DEFAULT 0,
    SonGorulmeTarihi�DATETIME
);

-- Arkada�l�k �li�kileri Tablosu
CREATE TABLE KullaniciArkadaslar
(
    ArkadaslikID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID1 INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    KullaniciID2 INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    CONSTRAINT FK_Kullanici1 FOREIGN KEY (KullaniciID1) REFERENCES Kullanicilar(KullaniciID),
    CONSTRAINT FK_Kullanici2 FOREIGN KEY (KullaniciID2) REFERENCES Kullanicilar(KullaniciID),
    CONSTRAINT UQ_Arkadaslik UNIQUE (KullaniciID1, KullaniciID2)
);

-- Mesajlar Tablosu
CREATE TABLE Mesajlar
(
    MesajID INT PRIMARY KEY IDENTITY(1,1),
    GonderenID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    AliciID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    MesajTuru INT NOT NULL, -- �rne�in, 1: Metin, 2: Foto�raf, 3: Video, 4: Ses
    Icerik NVARCHAR(MAX) NOT NULL,
    ZamanDamgasi DATETIME DEFAULT GETDATE(),
    OkunduDurumu BIT DEFAULT 0,
    CONSTRAINT FK_Gonderen FOREIGN KEY (GonderenID) REFERENCES Kullanicilar(KullaniciID),
    CONSTRAINT FK_Alici FOREIGN KEY (AliciID) REFERENCES Kullanicilar(KullaniciID)
);

-- Gruplar Tablosu
CREATE TABLE Gruplar
(
    GrupID INT IDENTITY(1, 1) PRIMARY KEY,
    GrupAdi NVARCHAR(50) NOT NULL,
    CONSTRAINT UQ_GrupAdi UNIQUE (GrupAdi),
	OlusturanID�INT
);

-- Grup �yeleri Tablosu
CREATE TABLE GrupUyeleri
(
    GrupUyeID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    GrupID INT FOREIGN KEY REFERENCES Gruplar(GrupID),
    CONSTRAINT FK_GrupKullanici FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(KullaniciID),
    CONSTRAINT FK_Grup FOREIGN KEY (GrupID) REFERENCES Gruplar(GrupID)
);

-- Grup Mesajlar� Tablosu
CREATE TABLE GrupMesajlari
(
    GrupMesajID INT PRIMARY KEY IDENTITY(1,1),
    GrupID INT FOREIGN KEY REFERENCES Gruplar(GrupID),
    GonderenID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    MesajTuru INT NOT NULL, -- �rne�in, 1: Metin, 2: Foto�raf, 3: Video, 4: Ses
    Icerik NVARCHAR(MAX) NOT NULL,
    ZamanDamgasi DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_GrupMesajGrup FOREIGN KEY (GrupID) REFERENCES Gruplar(GrupID),
    CONSTRAINT FK_GrupMesajGonderen FOREIGN KEY (GonderenID) REFERENCES Kullanicilar(KullaniciID)
);
-- Ayarlar Tablosu
CREATE TABLE Ayarlar
(
    AyarID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    HakkimdaYazisi NVARCHAR(MAX), -- Kullan�c�n�n hakk�nda yazd��� metin
    HakkimdaAyar BIT DEFAULT 1, -- Hakk�nda yaz�s�n�n g�r�n�rl�k ayar� (1: G�ster, 0: Gizle)
    CevrimiciAyar BIT DEFAULT 1, -- �evrim i�i durumunun g�r�n�rl�k ayar� (1: G�ster, 0: Gizle)
    CONSTRAINT FK_AyarlarKullanici FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(KullaniciID)
);
