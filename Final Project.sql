CREATE TABLE LaundryCustomer
(
CustomerID CHAR(7) NOT NULL,
CustomerName VARCHAR(50) NOT NULL,
CustomerPhone VARCHAR(13),
CustomerAddress VARCHAR(100) NOT NULL,
Primary key (CustomerID),
CONSTRAINT checkCustomerID check(CustomerID LIKE 'CST[0-9][0-9][0-9][0-9]'),
)

CREATE TABLE LaundryStaff
(
StaffID CHAR(7) NOT NULL,
StaffName VARCHAR(50) NOT NULL,
StaffAddress VARCHAR(100) NOT NULL,
StaffPhone VARCHAR(13),
StaffPosition VARCHAR(50),
StaffGender VARCHAR(10) NOT NULL,
Primary key (StaffID),
CONSTRAINT checkStaffID check(StaffID LIKE 'STF[0-9][0-9][0-9][0-9]'),
CONSTRAINT checkStaffGender check (StaffGender = 'Male' or StaffGender = 'Female')
)

CREATE TABLE LaundryMember
(
CustomerID CHAR(7) NOT NULL,
MembershipID CHAR(7) NOT NULL,
MembershipType VARCHAR(50) NOT NULL,
Primary key (MembershipID), 
CONSTRAINT checkMembershipID check(MembershipID LIKE 'MEM[0-9][0-9][0-9][0-9]'),
FOREIGN KEY (CustomerID) REFERENCES LaundryCustomer (CustomerID)
)

CREATE TABLE LaundryServiceType
(
StaffID CHAR (7) NOT NULL,
ServiceID CHAR(7) NOT NULL,
ServiceType VARCHAR(50) NOT NULL,
ServicePrice VARCHAR(20) NOT NULL,
Primary key (ServiceID),
CONSTRAINT checkServiceID check(ServiceID LIKE 'SRV[0-9][0-9][0-9][0-9]'),
FOREIGN KEY(StaffID) REFERENCES LaundryStaff (StaffID)
)

CREATE TABLE LaundryItemType
(
StaffID CHAR(7) NOT NULL,
ItemID CHAR(7) NOT NULL,
ItemType VARCHAR(50) NOT NULL,
ItemPrice VARCHAR(20) NOT NULL,
Primary key (ItemID),
CONSTRAINT checkItemID check(ItemID LIKE 'ITM[0-9][0-9][0-9][0-9]'),
FOREIGN KEY (StaffID) REFERENCES LaundryStaff (StaffID)
)

CREATE TABLE LaundryDiscountType
(
DiscountID CHAR(7) NOT NULL,
DiscountType VARCHAR(50) NOT NULL,
DiscountName VARCHAR(50) NOT NULL,
Primary key (DiscountID),
CONSTRAINT checkDiscountID check(DiscountID LIKE 'DSC[0-9][0-9][0-9][0-9]'),
)

CREATE TABLE LaundryTransaction
(
TransactionID CHAR(7) NOT NULL,
CustomerID CHAR(7) NOT NULL,
StaffID CHAR(7) NOT NULL,
TransactionDate DATE NOT NULL,
DiscountID CHAR(7) NOT NULL,
TotalPrice VARCHAR(20) NOT NULL,
Primary key (TransactionID),
CONSTRAINT checkTransactionID check(TransactionID LIKE 'TRN[0-9][0-9][0-9][0-9]'),
FOREIGN KEY (CustomerID) REFERENCES LaundryCustomer (CustomerID),
FOREIGN KEY (StaffID) REFERENCES LaundryStaff (StaffID),
FOREIGN KEY (DiscountID) REFERENCES LaundryDiscountType (DiscountID) 
)

CREATE TABLE LaundryDetailTransaction
(
TransactionID CHAR(7) NOT NULL,
StaffID CHAR(7) NOT NULL,
ServiceID CHAR(7) NOT NULL,
ItemID CHAR(7) NOT NULL,
FOREIGN KEY (TransactionID) REFERENCES LaundryTransaction (TransactionID),
FOREIGN KEY (StaffID) REFERENCES LaundryStaff (StaffID),
FOREIGN KEY (ServiceID) REFERENCES LaundryServiceType (ServiceID),
FOREIGN KEY (ItemID) REFERENCES LaundryItemType (ItemID)
)

INSERT INTO LaundryCustomer
VALUES ('CST0001','Scott Lawrence','476478','Bleecker St. 227'),
('CST0002','Jack Ferguson','439434','Orchid Rd. 228'),
('CST0003','Tim Sanders','348346','Manhattan St. 765'),
('CST0004','Lauren Adams','726234','Zancudo Rd. 774'),
('CST0005','Nicholas Evans','743846','Strawberry St. 834'),
('CST0006','Emily Bartels','726323','Rainer Hills 743'),
('CST0007','Diana Chang','437734','Chinatown St. 634'),
('CST0008','Rachel Lodge','472465','Buckley St. 823'),
('CST0009','Aveline Warren','872512','Nirvana Hills 783'),
('CST0010','Stephanie LeBlanc','976543','Vinewood Hills 934')

INSERT INTO LaundryStaff
VALUES ('STF0000','No Name','Not Specified','00000','No Order','Male'),
('STF0001','Tonia Tyler','Windy Rd. 365','879245','Regular Laundry','Female'),
('STF0002','Anya Rickson','Cody Rd. 365','834742','Express Laundry','Female'),
('STF0003','Martha Johnson','Heaven St. 120','845908','High End Laundry','Female'),
('STF0004','Alicia Carol','Middle Ave. 150','890786','Household Laundry','Female'),
('STF0005','Sonya Martina','Victory St. 232','879675','Shoe Laundry','Female')

INSERT INTO LaundryServiceType
VALUES ('STF0000','SRV0000','No Service','0'), 
('STF0001','SRV0001','Regular Laundry','4000'),
('STF0002','SRV0002','Express Laundry','10000')

INSERT INTO LaundryItemType
VALUES ('STF0000','ITM0000','No Item','0'),
('STF0003','ITM0001','High End Laundry','50000'),
('STF0004','ITM0002','Household Laundry','6000'),
('STF0005','ITM0003','Shoe Laundry','75000')

INSERT INTO LaundryMember
VALUES ('CST0010','MEM0001','Gold Membership'),
('CST0002','MEM0002','Silver Membership'),
('CST0004','MEM0003','Silver Membership'),
('CST0009','MEM0004','Bronze Membership'),
('CST0003','MEM0005','Bronze Membership')

INSERT INTO LaundryDiscountType
VALUES('DSC0001', '15% Discount', 'Gold Membership Discount'),
('DSC0002','10% Discount', 'Silver Membership Discount'),
('DSC0003','5% Discount', 'Bronze Membership Discount')

INSERT INTO LaundryTransaction
VALUES ('TRN0001','CST0002','STF0002','2018-12-01','DSC0002','9000'),
('TRN0002','CST0004','STF0004','2018-12-02','DSC0003','5700'),
('TRN0003','CST0002','STF0001','2018-12-02','DSC0002','3600'),
('TRN0004','CST0010','STF0003','2018-12-03','DSC0001','42500'),
('TRN0005','CST0009','STF0002','2018-12-05','DSC0003','71250'),
('TRN0006','CST0003','STF0005','2018-12-08','DSC0003','71250'),
('TRN0007','CST0010','STF0005','2018-12-10','DSC0001','63750'),
('TRN0008','CST0004','STF0002','2018-12-15','DSC0002','9000'),
('TRN0009','CST0009','STF0004','2018-12-15','DSC0002','24000')

INSERT INTO LaundryDetailTransaction
VALUES ('TRN0001','STF0004','SRV0000','ITM0002'),
('TRN0002','STF0005','SRV0000','ITM0003'),
('TRN0003','STF0002','SRV0002','ITM0000'),
('TRN0004','STF0001','SRV0001','ITM0000'),
('TRN0005','STF0002','SRV0002','ITM0000'),
('TRN0006','STF0003','SRV0000','ITM0001'),
('TRN0007','STF0003','SRV0000','ITM0001'),
('TRN0008','STF0002','SRV0002','ITM0000'),
('TRN0009','STF0004','SRV0000','ITM0002')

