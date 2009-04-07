Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LrDlK-0006eK-9M
	for linux-mtd@lists.infradead.org; Tue, 07 Apr 2009 16:03:05 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: David Brownell <david-b@pacbell.net>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 7 Apr 2009 11:02:40 -0500
Subject: RE: [PATCH] MTD-NAND: Changes to read_page APIs to support
	NAND_ECC_HW_SYNDROME mode on TI DaVinci DM355
Message-ID: <7A436F7769CA33409C6B44B358BFFF0CFFAA90C0@dlee02.ent.ti.com>
References: <1238601784-9563-1-git-send-email-nsnehaprabha@ti.com>
	<200904051556.05368.david-b@pacbell.net>
	<alpine.LFD.2.00.0904070042300.21577@localhost.localdomain>
	<200904061849.23110.david-b@pacbell.net>
In-Reply-To: <200904061849.23110.david-b@pacbell.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas, David,

> -----Original Message-----
> From: David Brownell [mailto:david-b@pacbell.net]
> Sent: Monday, April 06, 2009 9:49 PM
> To: Thomas Gleixner
> Cc: Narnakaje, Snehaprabha; davinci-linux-open-
> source@linux.davincidsp.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] MTD-NAND: Changes to read_page APIs to support
> NAND_ECC_HW_SYNDROME mode on TI DaVinci DM355
>=20
> On Monday 06 April 2009, Thomas Gleixner wrote:
> > David, Sneha,
> >
> > I'm answering both mails in one go.
> >
> > On Sun, 5 Apr 2009, David Brownell wrote:
> >
> > > On Wednesday 01 April 2009, nsnehaprabha@ti.com wrote:
> > > > From: Sneha Narnakaje <nsnehaprabha@ti.com>
> > > >
> > > > The NAND controller on TI DaVinci DM355 supports NAND devices
> > > > with large page size (2K and 4K), but the HW ECC is handled
> > > > for every 512byte read/write chunks. The current HW_SYNDROME
> > > > read_page/write_page APIs in the NAND core (nand_base) use the
> > > > "infix OOB" scheme.
> >
> > For a damned good reason. If you want to use HW_SYNDROME mode then you
> > better have the syndrome right after the data.
> >
> > data - ecc - data - ecc ...
> >
> > That's how HW_SYNDROME generators work. It's not about the write side,
> > It's about the read side. You read n bytes of data and m btes of ecc
> > in _ONE_ go
>=20
> Nit:  the current code issues up to four read_buf() calls there, not
> one; always at least two:  data, prepad, ecc, postpad (pads optional).
> The write side is relevant since it's got to issue matching writes.
>=20
> Which causes another little issue:  the pre-pad may be ECC-protected,
> but parts of the MTD stack don't entirely seem prepared for that.  As
> in, it looks like some code assumes writing prepad won't affect ECC.
> They may write it ... causing up to 8*6 =3D 48 bits of ECC error in this
> case, more than can be corrected.  (I think that would be tools, not
> normal kernel code.)
>=20
>=20
> > and the hardware will tell you whether there is a bit flip
> > or not. You can even do full hardware error correction this way. And
> > it has been done.
> >
> > See also: http://linux-mtd.infradead.org/tech/mtdnand/x111.html#AEN140
>=20
> That information is partially obsolete.  Those NAND_ECC_HWx_y
> constants are gone, the method names changed too.  And I think
> the current code tolerates BCH and other ECC schemes not just
> the Reed-Solomon subset.
>=20
> FWIW, this hardware would be NAND_ECC_HW10_518; not one of those
> now-obsolete constants.  Yes; 518, =3D=3D 512 + 6, so the data and
> "prepad" can all be ECC-protected.
>=20
> And of course, the point of this patch is to support the read
> side *without* forcing that "choice" of "infix OOB".
>=20
>=20
> > > Makes me wonder if there should be a new NAND_ECC_HW_* mode,
> > > which doesn't use "infix OOB" ... since that's the problem.
> > >
> > > Given bugs recently uncovered in that area, it seems that
> > > these DaVinci chips may be the first to use ECC_HW_SYNDROME
> > > in multi-chunk mode (and thus "infix OOB" in its full glory,
> > > rather than single-chunk subset which matches traditional
> > > layout with OOB at the end).
> >
> > Sorry, HW_SYNDROME was used in multi chunk mode from the very
> > beginning. See above.
>=20
> That's hard to believe; 52ff49df7fab18e56fa31b43143c4150c2547836
> merged today.  Lack of that pretty much trashed a 2 GByte NAND
> chip I have ... the standard raw page r/w calls ignored multi chunk
> layout issues, so the BBT detection lost horribly.  Trashed the
> existing BBT table -- EVERY TIME IT BOOTED.  Data corruption bugs
> like that, and "code in use", do not mix at all convincingly.
>=20
> The main current in-tree HW_SYNDROME driver is cafe_nand ... which
> looks to force single-chunk mode.
>=20
> Maybe bugs crept in over time.  The other two drivers using that
> code (referenced in the URL above) are from the days when large
> page chips weren't routine.  Diskonchip is now obsolete (and the
> docs I've found refer to 512 byte pages, single-chunk territory);
> and that "AND" flash (not NAND!) stuff is at best rare.  Hence my
> assumption that multi-chunk mode has never actually been used, even
> if the code has been in place.
>=20
>=20
> > If your device does not do that or you do not want to utilize it for
> > whatever reasons then just use the NAND_ECC_HW mode which lets you
> > place your ECC data where ever you want.
>=20
> So you basically agree with my comment that this shouldn't use
> HW_SYNDROME code paths unless it uses the "infix OOB" scheme.
>=20
>=20
> SEPARATE ISSUE:  when is using that "infix OOB" appropriate?
>=20
> > > > The core APIs overwrite NAND manufacturer's bad block meta
> > > > data, thus complicating the jobs of non-Linux NAND programmers
> > > > (end equipment manufacturering). These APIs also imply ECC
> > > > protection for the prepad bytes, causing nand raw_write
> > > > operations to fail.
> > >
> > > All of those seem like reasons to avoid NAND_ECC_HW_SYNDROME
> > > unless the ECC chunksize matches the page size ... that is,
> > > to only use it when "infix OOB" won't apply.
> >
> > Wrong, see above
>=20
> Hardly.  It's clearly arguable; see my comments above, and even
> yours (!) about not wanting to use it for "whatever reasons".
> Like the reasons quoted right there... there are indeed downsides
> to this "infix OOB" approach, which could make it worth avoiding.
>=20
>=20
> > > I particularly dislike clobbering the bad block data, since
> > > once that's done it can't easily be recovered.  Preferable
> > > to leave those markers in place, so that the chip can still
> > > be re-initialized cleanly.
> >
> > And how do you utilize the "data-ecc-data-ecc..." scheme _WITHOUT_
> > clobbering the bad block marker bytes ???
>=20
> You don't.  You'd use a different scheme.
>=20
>=20
> > That's why we have the bad block table mechanism.
>=20
> Sure, when it works.  Of course it's _nice_ to be able to
> recreate such a table too, and treat a table-in-flash
> as just a boot accelerator.
>=20
> Maybe "nice" matters only during development; maybe not.
> I was able to manually re-mark 256 MBytes as "block not
> actually bad", after hitting that BBT-corrupting bug above.
> (The other blocks ... I won't worry about for now.)
>=20
> Now I think other folk won't see that *same* failure.
> So maybe the backup BBT will suffice to recover from
> such things in the future, in conjunction with system
> software which disallows (re)creation of BBT-in-flash
> from both Linux and the boot loader.
>=20
>=20
> > And this is not a Linux kernel hackers oddity,
> > just have a look at DiskOnChip devices which do exactly the same. It's
> > dictated by the hardware and there is nothing you can do about it -
> > aside of falling back to software ECC and giving up the HW
> > acceleration.
>=20
> Or ... using patches like Sneha provided.
>=20
> Or ... by using hardware like OMAP3, which seems to have
> hardware buffers for the ECC syndrome stuff.  Support for
> "normal" OOB layout (vs infix) from the hardware's BCH
> syndrome calculation/correction module, if I read right.
>=20
> The "infix OOB" is a software policy.  Maybe it's natural
> to choose that with some hardware.  But it's not dictated
> hardware; as shown by Sneha's patches.
>=20
>=20
> > This patch is utter nonsense. The whole functionality is already
> > there. Just use the correct mode: NAND_ECC_HW. Place your ECC data
> > where you want or where your commercial counterparts want them to show
> > up. Using NAND_ECC_HW_SYNDROME for your case is just plain wrong.
>=20
> Well, ISTR that you said otherwise above ... yeah, quoting you (above):
>=20
> > > If your device does not do that or you do not want to utilize it for
> > > whatever reasons then just use the NAND_ECC_HW mode which lets you
> > > place your ECC data where ever you want.
>=20
> And that's exactly what these patches do:  enable just such choices.
> The $SUBJECT patch would be needed to use NAND_ECC_HW with this 4-bit
> ECC hardware, and not be forced to "choose" the infix-OOB policy.

I had looked read_page/write_page APIs of the NAND_ECC_HW mode to see if we=
 can use this mode for DaVinci DM355 device.

The read_page handler for NAND_ECC_HW mode reads the data and ECC from hard=
ware for each chunk. It then reads the OOB and extracts ecc code from it, b=
efore using the ECC from hardware and ecc code from OOB for data correction=
.

On DaVinci DM355 device, we need to pass the ecc code/syndrome extracted fr=
om OOB area, in order to read the HW ECC for each data chunk. This is where=
 we differ from NAND_ECC_HW mode.

The read_page/write_page APIs for NAND_ECC_HW_SYNDROME have the other probl=
em that David mentioned - overwriting NAND manufacturers bad block meta dat=
a, when used with large page NAND chips. These APIs do not handle the "eccs=
teps" properly. The OOB is read/written after every data chunk, thus you ac=
tually have overwritten the factory bad block information, when these APIs =
handle the last data chunk. OOB should be read/written after the entire dat=
a (a page) is read/written.

Thanks
Sneha

>=20
>=20
> How strongly you believe in supporting those choices is yet another
> question.  But you should at least be arguing from real facts, not
> from mis-apprehensions.
>=20
> - Dave
>=20
