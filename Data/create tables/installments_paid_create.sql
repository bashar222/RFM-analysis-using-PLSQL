ALTER TABLE HR.INSTALLMENTS_PAID
 DROP PRIMARY KEY CASCADE;

DROP TABLE HR.INSTALLMENTS_PAID CASCADE CONSTRAINTS;

CREATE TABLE HR.INSTALLMENTS_PAID
(
  INSTALLMENT_ID      NUMBER,
  CONTRACT_ID         NUMBER,
  INSTALLMENT_DATE    DATE,
  INSTALLMENT_AMOUNT  NUMBER(10,2),
  PAID                NUMBER(1)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX HR.INSTALLMENTS_PAID_PK ON HR.INSTALLMENTS_PAID
(INSTALLMENT_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE OR REPLACE TRIGGER HR.INSTALLMENTS_PAID_trig  before insert ON HR.INSTALLMENTS_PAID for each row
begin  :new.INSTALLMENT_ID := INSTALLMENTS_PAID_SEQ.nextval ;   end ;
/


ALTER TABLE HR.INSTALLMENTS_PAID ADD (
  CONSTRAINT INSTALLMENTS_PAID_PK
 PRIMARY KEY
 (INSTALLMENT_ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));

ALTER TABLE HR.INSTALLMENTS_PAID ADD (
  CONSTRAINT INSTALLMENTS_PAID_R01 
 FOREIGN KEY (CONTRACT_ID) 
 REFERENCES HR.CONTRACTS (CONTRACT_ID));