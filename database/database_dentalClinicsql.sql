-- Bảng Bác sĩ
CREATE TABLE Doctors (
    DoctorId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Specialty NVARCHAR(100), -- Ví dụ: 'Chỉnh nha', 'Nhổ răng'
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    IsActive BIT DEFAULT 1 -- Đánh dấu bác sĩ còn làm việc
);

-- Bảng Bệnh nhân
CREATE TABLE Patients (
    PatientId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Gender NVARCHAR(10), -- 'Male', 'Female', 'Other'
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Address NVARCHAR(200),
    MedicalHistory NVARCHAR(MAX) -- Lịch sử bệnh án dạng text/JSON
);

-- Bảng Lịch hẹn
CREATE TABLE Appointments (
    AppointmentId INT PRIMARY KEY IDENTITY(1,1),
    PatientId INT NOT NULL,
    DoctorId INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Duration INT DEFAULT 30, -- Đơn vị: phút
    Status NVARCHAR(20) DEFAULT 'Pending', -- 'Pending', 'Confirmed', 'Cancelled', 'Completed'
    Notes NVARCHAR(500),
    FOREIGN KEY (PatientId) REFERENCES Patients(PatientId),
    FOREIGN KEY (DoctorId) REFERENCES Doctors(DoctorId)
);

-- Bảng Dịch vụ điều trị
CREATE TABLE Treatments (
    TreatmentId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL, -- Ví dụ: 'Trám răng', 'Niềng răng'
    Description NVARCHAR(500),
    Cost DECIMAL(10, 2) NOT NULL
);

-- Bảng Chi tiết hóa đơn
CREATE TABLE Invoices (
    InvoiceId INT PRIMARY KEY IDENTITY(1,1),
    PatientId INT NOT NULL,
    AppointmentId INT,
    IssueDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10, 2),
    Status NVARCHAR(20) DEFAULT 'Unpaid', -- 'Unpaid', 'Paid', 'Cancelled'
    FOREIGN KEY (PatientId) REFERENCES Patients(PatientId),
    FOREIGN KEY (AppointmentId) REFERENCES Appointments(AppointmentId)
);

-- Bảng liên kết nhiều-nhiều giữa Hóa đơn và Dịch vụ
CREATE TABLE InvoiceTreatments (
    InvoiceTreatmentId INT PRIMARY KEY IDENTITY(1,1),
    InvoiceId INT NOT NULL,
    TreatmentId INT NOT NULL,
    Quantity INT DEFAULT 1,
    FOREIGN KEY (InvoiceId) REFERENCES Invoices(InvoiceId),
    FOREIGN KEY (TreatmentId) REFERENCES Treatments(TreatmentId)
);

INSERT INTO Doctors (Name, Specialty, Phone, Email, IsActive)
VALUES
    (N'Nguyễn Văn A', N'Răng hàm mặt', '0912345678', 'dr.nguyenvana@example.com', 1),
    (N'Trần Thị B', N'Chỉnh nha', '0987654321', 'dr.tranthib@example.com', 1),
    (N'Lê Hoàng C', N'Nha khoa trẻ em', '0978123456', 'dr.lehoangc@example.com', 1),
    (N'Phạm Minh D', N'Phục hình răng', '0965432187', 'dr.phamminhd@example.com', 1),
    (N'Vũ Thị E', N'Cấy ghép Implant', '0932165498', 'dr.vuthie@example.com', 1),
    (N'Đặng Văn F', N'Nội nha', '0945678123', 'dr.dangvanf@example.com', 1),
    (N'Hoàng Thị G', N'Nha chu', '0923456789', 'dr.hoangthig@example.com', 1),
    (N'Ngô Văn H', N'Răng giả tháo lắp', '0956781234', 'dr.ngovanh@example.com', 1),
    (N'Bùi Thị K', N'Tẩy trắng răng', '0918273645', 'dr.buithik@example.com', 1),
    (N'Mai Văn L', N'Điều trị tủy', '0998765432', 'dr.maivanl@example.com', 1);


INSERT INTO Patients (Name, DateOfBirth, Gender, Phone, Email, Address, MedicalHistory)
VALUES
    (N'Phạm Văn X', '1990-05-15', N'Nam', '0901122334', 'patientx@example.com', N'Hà Nội', N'Sâu răng hàm số 6'),
    (N'Nguyễn Thị Y', '1985-08-22', N'Nữ', '0912233445', 'patienty@example.com', N'TP.HCM', N'Viêm nướu nhẹ'),
    (N'Trần Văn Z', '2000-03-10', N'Nam', '0923344556', 'patientz@example.com', N'Đà Nẵng', N'Răng khôn mọc lệch'),
    (N'Lê Thị M', '1978-11-30', N'Nữ', '0934455667', 'patientm@example.com', N'Hải Phòng', N'Mất răng cửa do tai nạn'),
    (N'Hoàng Văn N', '1995-07-25', N'Nam', '0945566778', 'patientn@example.com', N'Cần Thơ', N'Răng sứ cần thay mới'),
    (N'Vũ Thị P', '1982-09-18', N'Nữ', '0956677889', 'patientp@example.com', N'Nghệ An', N'Tụt lợi chân răng'),
    (N'Đặng Văn Q', '1993-12-05', N'Nam', '0967788990', 'patientq@example.com', N'Bình Dương', N'Niềng răng chỉnh nha'),
    (N'Bùi Thị R', '2005-04-20', N'Nữ', '0978899001', 'patientr@example.com', N'Khánh Hòa', N'Răng sữa chưa rụng'),
    (N'Mai Văn S', '1970-06-12', N'Nam', '0989900112', 'patients@example.com', N'Lâm Đồng', N'Răng giả toàn hàm'),
    (N'Ngô Thị T', '1988-02-28', N'Nữ', '0990011223', 'patientt@example.com', N'Bà Rịa - Vũng Tàu', N'Viêm tủy răng');


-- Thêm cột CreatedDate với giá trị mặc định là ngày hiện tại
ALTER TABLE Patients
ADD CreatedDate DATETIME NOT NULL DEFAULT GETDATE();

GO
-- Thêm cột LastAppointment cho phép NULL
ALTER TABLE Patients
ADD LastAppointment DATETIME NULL;

UPDATE p
SET p.LastAppointment = a.LastAppointmentDate
FROM Patients p
OUTER APPLY (
    SELECT MAX(AppointmentDate) AS LastAppointmentDate
    FROM Appointments
    WHERE PatientId = p.PatientId
) a;


---TRIGGER
GO
CREATE TRIGGER trg_UpdateLastAppointment
ON Appointments
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Cập nhật cho các bệnh nhân có thay đổi lịch hẹn
    UPDATE p
    SET p.LastAppointment = (
        SELECT MAX(AppointmentDate) 
        FROM Appointments 
        WHERE PatientId = p.PatientId
    )
    FROM Patients p
    WHERE p.PatientId IN (
        SELECT PatientId FROM inserted
        UNION
        SELECT PatientId FROM deleted
    );
END;