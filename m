From: jburch@vincisystems.com (John Burch)
Date: Wed, 12 Mar 2003 10:44:06 -0500
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <1047428715.11517.50.camel@tubarao>
Message-ID: <001401c2e8ae$37e20cb0$1200a8c0@JOHNB>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org


> -----Original Message-----
> From: linux-mtd-admin at lists.infradead.org=20
> [mailto:linux-mtd-admin at lists.infradead.org] On Behalf Of=20
> Thayne Harbaugh
> Sent: Tuesday, March 11, 2003 7:25 PM
> To: linux-mtd at lists.infradead.org
> Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
>=20
>=20
> For some reason I am confused: I get the feeling that what=20
> I'm trying to understand is obvious - I just can't see the=20
> forest for the trees.  Will someone help me understand?
>=20
> cfi_cmdset_0002.c has several functions that use dq5 and dq6=20
> for monitoring the status of erase and write operations:
>=20
> dq6 =3D CMD(1<<6);
> dq5 =3D CMD(1<<5);
>=20
> Apparently, from the code dq6 toggles during erase/read=20
> operations and dq5 is low until the erase/read operation=20
> times out and then goes high (somewhat like a watchdog bit).
>=20
> My understanding, at least for the SST 49LF040 and PMC=20
> Pm49L004 is that dq6 toggles during erase/write and dq7 is=20
> inverted until the erase/write operation completes.  This=20
> causes me to expect to see the following code rather than=20
> what is written above (not to mention that most everything in=20
> do_write_one_word() should be adapted for dq7 invert):
>=20
> dq7 =3D CMD(1<<7); /* invert */
> dq6 =3D CMD(1<<6); /* toggle */
>=20
> The differences give me the feeling that there really are two=20
> different classes of cfi_cmdset_0002 - those devices that=20
> have a dq5 watchdog and those devices that don't have the=20
> watchdog, but have a bit inverter on dq7.
>=20
> Am I not understanding what happens on bits 0-5 during an=20
> erase/write operation?  The PMC and SST chips don't mention a=20
> thing about dq5 behavior.  If they don't have the dq5=20
> watchdog timer then they will behave in an undefined way=20
> (depending on the state of bit 5 in the written word) with=20
> the current dq5 checking.  This explains the many warnings I=20
> see with the SST and PMC chips in do_write_oneword(),
>=20
> "Warning: DQ5 raised while program operation was in progress,=20
> however operation completed OK"
>=20
> Around here we refer to this as the "Dairy Queen 5" warning.
>=20
> Obviosly, during an erase that completes prior to dq5 being=20
> read-back, dq5 will be high and the current algorithm is=20
> erroneously correct.  This can explain why I have not seen=20
> the same message in do_erase_oneblock().
>=20
> Furthermore, the SST documentation on page 10 refers to=20
> "spurios rejection" of good writes - differentiating between=20
> a write that succeeds that appears to fail and a write that=20
> fails.  It says that a write that appears to fail needs to be=20
> read back two more times successfully to filter out spurious=20
> rejection.
>=20
> Comments?  What should change to improve the operation=20
> completion check?  Should cfi_cmdset_0002 be adapted to=20
> handle multiple types of polling or should another command=20
> set be written?

The attached app note from AMD explains things in detail relative
to AMD devices.  I'm not sure how it applies to PMC and SST
devices or not.  It seems as though DQ7 polling or DQ6 polling,
by themselves, give a simple pass/fail/busy result; while DQ7 or DQ6
polling in combination with DQ5 and DQ2 polling give pass/fail/
erase suspended/timeout/busy result.

John

>=20
> --=20
> Thayne Harbaugh
> Linux Networx
>=20
