From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 11 Mar 2003 17:25:15 -0700
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
Message-ID: <1047428715.11517.50.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-bK4IZ7vhYqXn1yFR9yRW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

For some reason I am confused: I get the feeling that what I'm trying to
understand is obvious - I just can't see the forest for the trees.  Will
someone help me understand?

cfi_cmdset_0002.c has several functions that use dq5 and dq6 for
monitoring the status of erase and write operations:

dq6 =3D CMD(1<<6);
dq5 =3D CMD(1<<5);

Apparently, from the code dq6 toggles during erase/read operations and
dq5 is low until the erase/read operation times out and then goes high
(somewhat like a watchdog bit).

My understanding,@least for the SST 49LF040 and PMC Pm49L004 is that
dq6 toggles during erase/write and dq7 is inverted until the erase/write
operation completes.  This causes me to expect to see the following code
rather than what is written above (not to mention that most everything
in do_write_one_word() should be adapted for dq7 invert):

dq7 =3D CMD(1<<7); /* invert */
dq6 =3D CMD(1<<6); /* toggle */

The differences give me the feeling that there really are two different
classes of cfi_cmdset_0002 - those devices that have a dq5 watchdog and
those devices that don't have the watchdog, but have a bit inverter on
dq7.

Am I not understanding what happens on bits 0-5 during an erase/write
operation?  The PMC and SST chips don't mention a thing about dq5
behavior.  If they don't have the dq5 watchdog timer then they will
behave in an undefined way (depending on the state of bit 5 in the
written word) with the current dq5 checking.  This explains the many
warnings I see with the SST and PMC chips in do_write_oneword(),

"Warning: DQ5 raised while program operation was in progress, however
operation completed OK"

Around here we refer to this as the "Dairy Queen 5" warning.

Obviosly, during an erase that completes prior to dq5 being read-back,
dq5 will be high and the current algorithm is erroneously correct.  This
can explain why I have not seen the same message in do_erase_oneblock().

Furthermore, the SST documentation on page 10 refers to "spurios
rejection" of good writes - differentiating between a write that
succeeds that appears to fail and a write that fails.  It says that a
write that appears to fail needs to be read back two more times
successfully to filter out spurious rejection.

Comments?  What should change to improve the operation completion
check?  Should cfi_cmdset_0002 be adapted to handle multiple types of
polling or should another command set be written?

--=20
Thayne Harbaugh
Linux Networx

--=-bK4IZ7vhYqXn1yFR9yRW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+bn5rfsBPTKE6HMkRAs4BAJ9X+2ohh6yJj0pl/bhoePQkSDI+CQCfacc7
o6FfFw5wUv1dT06gFCcaGnY=
=+ZHx
-----END PGP SIGNATURE-----

--=-bK4IZ7vhYqXn1yFR9yRW--
