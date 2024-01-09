-- Kullanýcýlar Tablosu
CREATE TABLE Kullanicilar
(
    KullaniciID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciAdi NVARCHAR(50) NOT NULL,
    Sifre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    ProfilResmi NVARCHAR(255),
    IkiFaktorDogrulamaKodu NVARCHAR(10), -- Ýki faktörlü doðrulama kodu
    IkiFaktorDogrulamaDurumu BIT DEFAULT 0, -- Ýki faktörlü doðrulama durumu
    CONSTRAINT UQ_KullaniciAdi UNIQUE (KullaniciAdi),
    CONSTRAINT UQ_Email UNIQUE (Email),
	CevrimIciDurumu BIT DEFAULT 0,
    SonGorulmeTarihi DATETIME
);

-- Arkadaþlýk Ýliþkileri Tablosu
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
    MesajTuru INT NOT NULL, -- Örneðin, 1: Metin, 2: Fotoðraf, 3: Video, 4: Ses
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
	OlusturanID INT
);

-- Grup Üyeleri Tablosu
CREATE TABLE GrupUyeleri
(
    GrupUyeID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    GrupID INT FOREIGN KEY REFERENCES Gruplar(GrupID),
    CONSTRAINT FK_GrupKullanici FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(KullaniciID),
    CONSTRAINT FK_Grup FOREIGN KEY (GrupID) REFERENCES Gruplar(GrupID)
);

-- Grup Mesajlarý Tablosu
CREATE TABLE GrupMesajlari
(
    GrupMesajID INT PRIMARY KEY IDENTITY(1,1),
    GrupID INT FOREIGN KEY REFERENCES Gruplar(GrupID),
    GonderenID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    MesajTuru INT NOT NULL, -- Örneðin, 1: Metin, 2: Fotoðraf, 3: Video, 4: Ses
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
    HakkimdaYazisi NVARCHAR(MAX), -- Kullanýcýnýn hakkýnda yazdýðý metin
    HakkimdaAyar BIT DEFAULT 1, -- Hakkýnda yazýsýnýn görünürlük ayarý (1: Göster, 0: Gizle)
    CevrimiciAyar BIT DEFAULT 1, -- Çevrim içi durumunun görünürlük ayarý (1: Göster, 0: Gizle)
    CONSTRAINT FK_AyarlarKullanici FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(KullaniciID)
);
