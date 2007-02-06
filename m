Received: from svits26.main.ad.rit.edu ([129.21.18.136])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HEXFi-0001G8-4k
	for linux-mtd@lists.infradead.org; Tue, 06 Feb 2007 15:49:25 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: re-formatting a Disk-on-Chip without going to DOS
Date: Tue, 6 Feb 2007 15:49:20 -0500
Message-ID: <06CCEA2EB1B80A4A937ED59005FA855101199C07@svits26.main.ad.rit.edu>
From: "Christopher E Piggott" <cepasp@rit.edu>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I did something with a bit too much haste, and I erased my DOC2000-D08
chip. =20
=20
Before I did this, I attempted to save something that I could use later
as an backup:
=20
    dd if=3D/dev/mtd0 of=3Dbackup.img bs=3D8k
=20
The file I got makes sense, at least in that it has the ANAND in it at
offsets 0xC000 and 0xE000... which makes me think I saved my bad block
map.
=20
My trick now is how to put it back.  Linux sees the chip, but not as a
DoC:
=20
    Using configured DiskOnChip probe address 0xd0000
    DiskOnChip found at 0xd0000
    NAND device: Manufacturer ID: 0x98, Chip ID: 0xe6 (Toshiba NAND 8MiB
3,3V 8-bit)
    ECC error scanning DOC at 0xc000
    ECC error scanning DOC at 0xe000
    DiskOnChip ANAND Media Header not found.

This means that there is no /dev/mtd0 to put it back.
=20
Is it even possible to do this without going back to DOS?  That is a
problem for me as the systems I have with DoC sockets don't have the
ability to boot off of a FreeDOS floppy or CD-ROM.  It MAY be possible
to do something using an external hard drive, putting freedos on that,
and going on from there ... but life would be much simpler for me if
there were a way to do this entirely from linux, considering that I
saved the image before I started.
=20
Any ideas or tricks?
=20
--Chris
=20
=20
