From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 17 Mar 2003 08:54:21 -0700
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <20030312154316.X1745@brecis.com>
References: <20030312102735.U1745@brecis.com>
 <002701c2e8ba$8690e8c0$1200a8c0@JOHNB>  <20030312154316.X1745@brecis.com>
Message-ID: <1047916461.11517.85.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-cETyYQUhDowe+f8spAYE
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-03-12 at 14:43, Steve Wahl wrote:
> On Wed, Mar 12, 2003 at 12:12:12PM -0500, John Burch wrote:

<snip>

> > The status register (including DQ5) won't reflect actual data until
> > a reset command is issued,
>=20
> This I think is a misunderstanding or misstatement on your part.  The
> reads WILL return to actual data without a reset upon successful
> completion of the operation.  Only on a failure does software need to
> issue the reset to return to reading data!

Big question: how is it know if status bits are being read or the real
data that was written to an address?  I have read many data sheets and I
don't recall any of them discussing this concern.

> --> Steve
>=20
> > John
> >=20
> > >From AMD's cfiflash.c:
> >=20
> > /*********************************************************************/
> > /* Flash_status utilizes the DQ6, DQ5, and DQ3 polling algorithms    */
> > /* described in the flash data book.  It can quickly ascertain the   */
> > /* operational status of the flash device, and return an             */
> > /* appropriate status code (defined in flash.h)                      */
> > /*********************************************************************/
> > =20
> > int flash_status(word far *fp)
> > {
> > 	 unsigned char d, t;
> > 	 int retry =3D 1;
> >=20
> > again:
> >=20
> > 	 d =3D *fp;        /* read data */
> > 	 t =3D d ^ *fp;    /* read it again and see what toggled */
> >=20
> > 	 if (t =3D=3D 0) {           /* no toggles, nothing's happening */
> > 		return STATUS_READY;
> > 	 }
> > 	 else if (t =3D=3D 0x04) { /* erase-suspend */
> > 		if (retry--) goto again;    /* may have been write
> > completion */
> > 		return STATUS_ERSUSP;
> > 	 }
> > 	 else if (t & 0x40) {
> > 		if (d & 0x20) {     /* timeout */
> > 		  return STATUS_TIMEOUT;
> > 		}
> > 		else {
> > 		  return STATUS_BUSY;
> > 		}
> > 	 }
> >=20
> > 	 if (retry--) goto again;    /* may have been write completion
> > */
> >=20
> > 	 return STATUS_ERROR;
> > }
> >=20
> >=20
> >=20
> > > -----Original Message-----
> > > From: linux-mtd-admin at lists.infradead.org=20
> > > [mailto:linux-mtd-admin at lists.infradead.org] On Behalf Of Steve Wahl
> > > Sent: Wednesday, March 12, 2003 11:28 AM
> > > To: Thayne Harbaugh
> > > Cc: linux-mtd at lists.infradead.org
> > > Subject: Re: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy=20
> > > Queen 5 warning)
> > >=20
> > >=20
> > > Thayne,=20
> > >=20
> > > I have a patch that I was given permission to check in, but=20
> > > never got around to it, that covers a similar "DQ5 raised" problem.
> > >=20
> > > I would wager you are running into the same problem I did,=20
> > > and that your chips compatibly support DQ5, if not as a=20
> > > watchdog, at least by holding it low while programming.
> > >=20
> > > Can you look at my previous posts on this, try my patch (if=20
> > > you don't have interleaved chips -- contact me if you do),=20
> > > and see if it works for you?
> > >=20
> > > http://lists.infradead.org/pipermail/linux-mtd/2003-January/00
> > > 6780.html
> > >=20
> > > --> Steve
> > >=20
> > >=20
> > > On Tue, Mar 11, 2003 at 05:25:15PM -0700, Thayne Harbaugh wrote:
> > > > For some reason I am confused: I get the feeling that what=20
> > > I'm trying=20
> > > > to understand is obvious - I just can't see the forest for=20
> > > the trees. =20
> > > > Will someone help me understand?
> > > >=20
> > > > cfi_cmdset_0002.c has several functions that use dq5 and dq6 for=20
> > > > monitoring the status of erase and write operations:
> > > >=20
> > > > dq6 =3D CMD(1<<6);
> > > > dq5 =3D CMD(1<<5);
> > > >=20
> > > > Apparently, from the code dq6 toggles during erase/read=20
> > > operations and=20
> > > > dq5 is low until the erase/read operation times out and=20
> > > then goes high=20
> > > > (somewhat like a watchdog bit).
> > > >=20
> > > > My understanding, at least for the SST 49LF040 and PMC Pm49L004 is=20
> > > > that dq6 toggles during erase/write and dq7 is inverted until the=20
> > > > erase/write operation completes.  This causes me to expect=20
> > > to see the=20
> > > > following code rather than what is written above (not to=20
> > > mention that=20
> > > > most everything in do_write_one_word() should be adapted for dq7=20
> > > > invert):
> > > >=20
> > > > dq7 =3D CMD(1<<7); /* invert */
> > > > dq6 =3D CMD(1<<6); /* toggle */
> > > >=20
> > > > The differences give me the feeling that there really are two=20
> > > > different classes of cfi_cmdset_0002 - those devices that=20
> > > have a dq5=20
> > > > watchdog and those devices that don't have the watchdog, but have a=
=20
> > > > bit inverter on dq7.
> > > >=20
> > > > Am I not understanding what happens on bits 0-5 during an=20
> > > erase/write=20
> > > > operation?  The PMC and SST chips don't mention a thing about dq5=20
> > > > behavior.  If they don't have the dq5 watchdog timer then they will=
=20
> > > > behave in an undefined way (depending on the state of bit 5 in the=20
> > > > written word) with the current dq5 checking.  This explains=20
> > > the many=20
> > > > warnings I see with the SST and PMC chips in do_write_oneword(),
> > > >=20
> > > > "Warning: DQ5 raised while program operation was in=20
> > > progress, however=20
> > > > operation completed OK"
> > > >=20
> > > > Around here we refer to this as the "Dairy Queen 5" warning.
> > > >=20
> > > > Obviosly, during an erase that completes prior to dq5 being=20
> > > read-back,=20
> > > > dq5 will be high and the current algorithm is erroneously correct. =
=20
> > > > This can explain why I have not seen the same message in=20
> > > > do_erase_oneblock().
> > > >=20
> > > > Furthermore, the SST documentation on page 10 refers to "spurios=20
> > > > rejection" of good writes - differentiating between a write that=20
> > > > succeeds that appears to fail and a write that fails.  It=20
> > > says that a=20
> > > > write that appears to fail needs to be read back two more times=20
> > > > successfully to filter out spurious rejection.
> > > >=20
> > > > Comments?  What should change to improve the operation completion=20
> > > > check?  Should cfi_cmdset_0002 be adapted to handle=20
> > > multiple types of=20
> > > > polling or should another command set be written?
> > > >=20
> > > > --
> > > > Thayne Harbaugh
> > > > Linux Networx
> > >=20
> > >=20
> > >=20
> > > ______________________________________________________
> > > Linux MTD discussion mailing list
> > > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > >=20
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
--=20
Thayne Harbaugh
Linux Networx

--=-cETyYQUhDowe+f8spAYE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+de+tfsBPTKE6HMkRAjjgAJ9QETLlxInaPZtW4W/5BY3vz7dU8ACfTnFo
tZfaspvL/3AAR1ebfrQDwjU=
=pFkZ
-----END PGP SIGNATURE-----

--=-cETyYQUhDowe+f8spAYE--
