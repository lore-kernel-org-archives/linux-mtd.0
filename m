From: jburch@vincisystems.com (John Burch)
Date: Wed, 12 Mar 2003 17:17:21 -0500
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <20030312154316.X1745@brecis.com>
Message-ID: <004301c2e8e5$27e32e70$1200a8c0@JOHNB>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org


> -----Original Message-----
> From: Steve Wahl [mailto:swahl at brecis.com]=20
> Sent: Wednesday, March 12, 2003 4:43 PM
> To: John Burch
> Cc: 'Thayne Harbaugh'; linux-mtd at lists.infradead.org
> Subject: Re: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy=20
> Queen 5 warning)
>=20
>=20
> On Wed, Mar 12, 2003 at 12:12:12PM -0500, John Burch wrote:
> > AMD's own method from code they provide is shown below...
> >=20
> > By the way, AMD specifically mentions having to check DQ6/7 again=20
> > after DQ5=3D1 because of the possibility that DQ5=3D1 simultaneous =
with=20
> > toggling stopping.  The app note I referred to before (attached this
> > time) describes this in some detail.
>=20
> I agree with this.
>=20
> > The status register (including DQ5) won't reflect actual=20
> data until a=20
> > reset command is issued,
>=20
> This I think is a misunderstanding or misstatement on your=20
> part.  The reads WILL return to actual data without a reset=20
> upon successful completion of the operation.  Only on a=20
> failure does software need to issue the reset to return to=20
> reading data!
>=20
> The app note you attached agrees with me on this.

You are correct, sir.

>=20
> > so I think the concern about DQ5=3D1 because erased data=20
> (0xff) is read=20
> > instead of status is not valid.
>=20
> I disagree.  This concern is indeed valid, and is the primary=20
> reason you must check for toggling AFTER noticing DQ5=3D1 in=20
> the first place.

You're right, again.  I'd focused in on the error case where a
reset has to be issued when DQ5 goes high due to an actual
timeout, and not the normal case where the device returns to
"read" mode automatically upon successful completion of the
command.  Thanks for straightening me out.

>=20
> Note that cfiflash below does not handle interleave nor bit=20
> endianness, so you can't adopt it directly.
>=20
> --> Steve
>=20
> > John
> >=20
> > >From AMD's cfiflash.c:
> >=20
> >=20
> /*************************************************************
> ********/
> > /* Flash_status utilizes the DQ6, DQ5, and DQ3 polling=20
> algorithms    */
> > /* described in the flash data book.  It can quickly=20
> ascertain the   */
> > /* operational status of the flash device, and return an   =20
>          */
> > /* appropriate status code (defined in flash.h)            =20
>          */
> >=20
> /*********************************************************************
> > /
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
> > > From: linux-mtd-admin at lists.infradead.org
> > > [mailto:linux-mtd-admin at lists.infradead.org] On Behalf Of=20
> Steve Wahl
> > > Sent: Wednesday, March 12, 2003 11:28 AM
> > > To: Thayne Harbaugh
> > > Cc: linux-mtd at lists.infradead.org
> > > Subject: Re: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy=20
> > > Queen 5 warning)
> > >=20
> > >=20
> > > Thayne,
> > >=20
> > > I have a patch that I was given permission to check in, but
> > > never got around to it, that covers a similar "DQ5=20
> raised" problem.
> > >=20
> > > I would wager you are running into the same problem I did,
> > > and that your chips compatibly support DQ5, if not as a=20
> > > watchdog, at least by holding it low while programming.
> > >=20
> > > Can you look at my previous posts on this, try my patch (if
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
> > > > For some reason I am confused: I get the feeling that what
> > > I'm trying
> > > > to understand is obvious - I just can't see the forest for
> > > the trees.
> > > > Will someone help me understand?
> > > >=20
> > > > cfi_cmdset_0002.c has several functions that use dq5 and dq6 for
> > > > monitoring the status of erase and write operations:
> > > >=20
> > > > dq6 =3D CMD(1<<6);
> > > > dq5 =3D CMD(1<<5);
> > > >=20
> > > > Apparently, from the code dq6 toggles during erase/read
> > > operations and
> > > > dq5 is low until the erase/read operation times out and
> > > then goes high
> > > > (somewhat like a watchdog bit).
> > > >=20
> > > > My understanding, at least for the SST 49LF040 and PMC=20
> Pm49L004 is
> > > > that dq6 toggles during erase/write and dq7 is inverted=20
> until the=20
> > > > erase/write operation completes.  This causes me to expect=20
> > > to see the
> > > > following code rather than what is written above (not to
> > > mention that
> > > > most everything in do_write_one_word() should be adapted for dq7
> > > > invert):
> > > >=20
> > > > dq7 =3D CMD(1<<7); /* invert */
> > > > dq6 =3D CMD(1<<6); /* toggle */
> > > >=20
> > > > The differences give me the feeling that there really are two
> > > > different classes of cfi_cmdset_0002 - those devices that=20
> > > have a dq5
> > > > watchdog and those devices that don't have the=20
> watchdog, but have=20
> > > > a
> > > > bit inverter on dq7.
> > > >=20
> > > > Am I not understanding what happens on bits 0-5 during an
> > > erase/write
> > > > operation?  The PMC and SST chips don't mention a thing=20
> about dq5
> > > > behavior.  If they don't have the dq5 watchdog timer=20
> then they will=20
> > > > behave in an undefined way (depending on the state of=20
> bit 5 in the=20
> > > > written word) with the current dq5 checking.  This explains=20
> > > the many
> > > > warnings I see with the SST and PMC chips in do_write_oneword(),
> > > >=20
> > > > "Warning: DQ5 raised while program operation was in
> > > progress, however
> > > > operation completed OK"
> > > >=20
> > > > Around here we refer to this as the "Dairy Queen 5" warning.
> > > >=20
> > > > Obviosly, during an erase that completes prior to dq5 being
> > > read-back,
> > > > dq5 will be high and the current algorithm is=20
> erroneously correct.
> > > > This can explain why I have not seen the same message in=20
> > > > do_erase_oneblock().
> > > >=20
> > > > Furthermore, the SST documentation on page 10 refers to "spurios
> > > > rejection" of good writes - differentiating between a=20
> write that=20
> > > > succeeds that appears to fail and a write that fails.  It=20
> > > says that a
> > > > write that appears to fail needs to be read back two more times
> > > > successfully to filter out spurious rejection.
> > > >=20
> > > > Comments?  What should change to improve the operation=20
> completion
> > > > check?  Should cfi_cmdset_0002 be adapted to handle=20
> > > multiple types of
> > > > polling or should another command set be written?
> > > >=20
> > > > --
> > > > Thayne Harbaugh
> > > > Linux Networx
> > >=20
> > >=20
> > >=20
> > > ______________________________________________________
> > > Linux MTD discussion mailing list=20
> > > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > >=20
>=20
>=20
>=20
