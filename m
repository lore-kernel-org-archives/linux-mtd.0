From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 17 Mar 2003 08:40:30 -0700
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <20030312102735.U1745@brecis.com>
References: <1047428715.11517.50.camel@tubarao>
 <20030312102735.U1745@brecis.com>
Message-ID: <1047915630.11512.81.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-64s8WUTVLomH51lxT+h7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-03-12 at 09:27, Steve Wahl wrote:
> Thayne,=20
>=20
> I have a patch that I was given permission to check in, but never got
> around to it, that covers a similar "DQ5 raised" problem.

Speaking of never getting around to things - I'm finally replying to
your email.

> I would wager you are running into the same problem I did, and that
> your chips compatibly support DQ5, if not as a watchdog, at least by
> holding it low while programming.

I have sent email to PMC and the official response is that the _only_
bits that reflect erase/write operation status are I/O7 and I/O6
(effectively DQ7 and DQ6).  I/O7 is inverted data during the operation
and I/O6 toggles.  The PMC response was that AMD status bits aren't
supported.  In practice, however, DQ5 is low during erase/write
operations.  I am uneasy about using undocumented features.

> Can you look at my previous posts on this, try my patch (if you don't
> have interleaved chips -- contact me if you do),

No, I don't have interleaved chips.

> and see if it works
> for you?
>=20
> http://lists.infradead.org/pipermail/linux-mtd/2003-January/006780.html

I have looked through your patch and agree that it addresses a legal
state that currently triggers a warning and should not.  I do know,
however, that several manufactures recommend that the final status
should be checked an additional two times before a success is reported.

> --> Steve
>=20
>=20
> On Tue, Mar 11, 2003 at 05:25:15PM -0700, Thayne Harbaugh wrote:
> > For some reason I am confused: I get the feeling that what I'm trying t=
o
> > understand is obvious - I just can't see the forest for the trees.  Wil=
l
> > someone help me understand?
> >=20
> > cfi_cmdset_0002.c has several functions that use dq5 and dq6 for
> > monitoring the status of erase and write operations:
> >=20
> > dq6 =3D CMD(1<<6);
> > dq5 =3D CMD(1<<5);
> >=20
> > Apparently, from the code dq6 toggles during erase/read operations and
> > dq5 is low until the erase/read operation times out and then goes high
> > (somewhat like a watchdog bit).
> >=20
> > My understanding, at least for the SST 49LF040 and PMC Pm49L004 is that
> > dq6 toggles during erase/write and dq7 is inverted until the erase/writ=
e
> > operation completes.  This causes me to expect to see the following cod=
e
> > rather than what is written above (not to mention that most everything
> > in do_write_one_word() should be adapted for dq7 invert):
> >=20
> > dq7 =3D CMD(1<<7); /* invert */
> > dq6 =3D CMD(1<<6); /* toggle */
> >=20
> > The differences give me the feeling that there really are two different
> > classes of cfi_cmdset_0002 - those devices that have a dq5 watchdog and
> > those devices that don't have the watchdog, but have a bit inverter on
> > dq7.
> >=20
> > Am I not understanding what happens on bits 0-5 during an erase/write
> > operation?  The PMC and SST chips don't mention a thing about dq5
> > behavior.  If they don't have the dq5 watchdog timer then they will
> > behave in an undefined way (depending on the state of bit 5 in the
> > written word) with the current dq5 checking.  This explains the many
> > warnings I see with the SST and PMC chips in do_write_oneword(),
> >=20
> > "Warning: DQ5 raised while program operation was in progress, however
> > operation completed OK"
> >=20
> > Around here we refer to this as the "Dairy Queen 5" warning.
> >=20
> > Obviosly, during an erase that completes prior to dq5 being read-back,
> > dq5 will be high and the current algorithm is erroneously correct.  Thi=
s
> > can explain why I have not seen the same message in do_erase_oneblock()=
.
> >=20
> > Furthermore, the SST documentation on page 10 refers to "spurios
> > rejection" of good writes - differentiating between a write that
> > succeeds that appears to fail and a write that fails.  It says that a
> > write that appears to fail needs to be read back two more times
> > successfully to filter out spurious rejection.
> >=20
> > Comments?  What should change to improve the operation completion
> > check?  Should cfi_cmdset_0002 be adapted to handle multiple types of
> > polling or should another command set be written?
> >=20
> > --=20
> > Thayne Harbaugh
> > Linux Networx
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
--=20
Thayne Harbaugh
Linux Networx

--=-64s8WUTVLomH51lxT+h7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+dexufsBPTKE6HMkRAlp6AJ9GWe9I6x7WezK4AZrXLAwosBiwTwCfZQfj
ZOyJRWSWhmCLtdF4/kk084o=
=637Y
-----END PGP SIGNATURE-----

--=-64s8WUTVLomH51lxT+h7--
