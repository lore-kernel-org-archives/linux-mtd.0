Received: from host11.oneononeinternet.com ([209.239.43.35])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aixa0-0005yz-KL
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 15:14:12 +0000
From: "Mark Richards" <markr@massmicro.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Date: Tue, 20 Jan 2004 10:11:54 -0500
Message-ID: <011b01c3df67$bd65d960$6e01a8c0@solarwave>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1074607648.29472.17.camel@hades.cambridge.redhat.com>
cc: linux-mtd@lists.infradead.org
Subject: RE: MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

Thanks much for the reply and especially for all your hard work on these
drivers.  I was pleased to find them as my beginning work with DOC was
difficult using what the vendor has provided.

> Hit SysRq-P and/or SysRq-T to see precisely where it's locked up.

Invoking sysrq is ineffective.  Seems sysrq was not configured.  I =
searched
my last .config used for the kernel build and there's no instance of =
SYSRQ
there.

I'll build again and then be able to tell you more as my problem is
reproducible.

I also see this in bootup:


Possible DiskOnChip with unknown ChipID 00 found at 0xc8000
Possible DiskOnChip with unknown ChipID B2 found at 0xca000
Possible DiskOnChip with unknown ChipID 83 found at 0xcc000
Possible DiskOnChip with unknown ChipID FF found at 0xce000
Possible DiskOnChip with unknown ChipID 85 found at 0xd0000
Possible DiskOnChip with unknown ChipID BD found at 0xd2000
DiskOnChip Millennium found at address 0xD4000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba:NAND 8MB =
3,3V)
1 flash chips found. Total DiskOnChip size: 8 MiB
mtd: Giving out device 0 to DiskOnChip Millennium
Possible DiskOnChip with unknown ChipID BD found at 0xd6000
Possible DiskOnChip with unknown ChipID FF found at 0xd8000
Possible DiskOnChip with unknown ChipID FF found at 0xda000
Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Possible DiskOnChip with unknown ChipID FF found at 0xde000
Possible DiskOnChip with unknown ChipID FF found at 0xe0000
Possible DiskOnChip with unknown ChipID FF found at 0xe2000
Possible DiskOnChip with unknown ChipID FF found at 0xe4000
Possible DiskOnChip with unknown ChipID FF found at 0xe6000
Possible DiskOnChip with unknown ChipID FF found at 0xe8000
Possible DiskOnChip with unknown ChipID FF found at 0xea000
Possible DiskOnChip with unknown ChipID FF found at 0xec000
Possible DiskOnChip with unknown ChipID FF found at 0xee000
$Id: ftl.c,v 1.45 2003/01/24 23:31:27 dwmw2 Exp $
ftl_cs: FTL header not found.
NFTL driver: nftlcore.c $Revision: 1.87 $, nftlmount.c $Revision: 1.31 $
 nftla: nftla1
usb.c: registered new driver hub

I don't believe I've seen " ftl_cs: FTL header not found." in my =
previous
builds.

Sorry, I don't know enough about the file systems to know if this is =
normal.
Does it look ok to you?

Regarding the compile error, when I build for the sysrq I'll also apply =
the
latest MTD source to the new source tree for 2.4.24 and let you know
specifically what I find.


Mark Richards


> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: Tuesday, January 20, 2004 09:07
> To: Mark Richards
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: MTD - DOC 2000 freezes on umount
>=20
> On Mon, 2004-01-19 at 21:23 -0500, Mark Richards wrote:
> > I've been through several good learning experiences getting my
> development
> > system set up to work with a DOC 2000 for an embedded project.  I've
> finally
> > settled on a RedHat 7.2 distribution and the 2.4.24 kernel.  All =
worked
> well
> > with the MTD drivers in several other setups: RedHat 9, Mandrake =
9.2,
> but
> > for reasons I can't yet fathom, the MTD drivers seem a bit unstable =
in
> this
> > particular kernel.
> >
> > Most frequently when I perform a umount /mnt/doc (doc being the =
mount
> point)
> > the shell session freezes (the umount command does not return a =
prompt).
>=20
> Hit SysRq-P and/or SysRq-T to see precisely where it's locked up.>=20
>=20
> > I tried in one kernel build to apply the latest sources to my source
> tree
> > using the instructions (and the shell script) but this caused a =
compile
> > failure.
>=20
> Insufficient information to diagnose.
>=20
> --
> dwmw2
