Received: from guanin.uni-konstanz.de ([134.34.240.60])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7yc6-0003zx-4g
	for linux-mtd@lists.infradead.org; Tue, 01 Aug 2006 14:05:16 -0400
Received: from urania.exp.univie.ac.at (urania.exp.univie.ac.at
	[131.130.45.24])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by guanin.uni-konstanz.de (Postfix) with ESMTP id 6311F1690
	for <linux-mtd@lists.infradead.org>;
	Tue,  1 Aug 2006 20:05:00 +0200 (CEST)
Date: Tue, 1 Aug 2006 20:04:51 +0200
From: Jan Korger <Jan.Korger@uni-konstanz.de>
To: linux-mtd@lists.infradead.org
Subject: "Bad eraseblock" - NAND memory gone bad? (Zaurus, mtdblock)
Message-ID: <20060801200451.26e54e4e@urania.exp.univie.ac.at>
Mime-Version: 1.0
Content-Type: multipart/signed;
	boundary=Signature_Tue__1_Aug_2006_20_04_51_+0200_vPU53iHYsnHxpERb;
	protocol="application/pgp-signature"; micalg=pgp-sha1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature_Tue__1_Aug_2006_20_04_51_+0200_vPU53iHYsnHxpERb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi everyone,
I'm not a kernel developer, but I couldn't find user documentation for
my problem, so I hope someone on this list will kindly provide some
hints. I have asked this question in a Zaurus Forum without getting a
reply.

I own 2.5years old Sharp Zaurus C860, which suddenly stopped working
properly. These devices have a built-in 128MiB NAND. I'm using the
OpenZaurus distribution (OZ version 3.5.4, Linux kernel version 2.6.14),
which uses three partitions, two of them are (read/write) jffs2 mounted
via /dev/mtdblock?. I can find out more details about the system if it
should matter.

Not working "properly" means the device does boot but the GUI (GPE 2.7,
X) is not usable (various minor issues, could be due to lost
configuration data). I can however manage to get a text console with
bash and friends. I saved the output from 'dmesg' after a reboot:
http://www.oesf.org/forums/index.php?act=3DAttach&type=3Dpost&id=3D2744

The interesting part, which makes me think I may have a NAND problem, is
this:

NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB
3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 32 at 0x00080000
Bad eraseblock 3095 at 0x0305c000
Bad eraseblock 3099 at 0x0306c000
Creating 3 MTD partitions on "sharpsl-nand":
0x00000000-0x00700000 : "System Area"
0x00700000-0x03c00000 : "Root Filesystem"
0x03c00000-0x08000000 : "Home Filesystem"

I never inspected the boot messages while the Zaurus worked. ;-(  Thus,
I cannot tell whether this messages have always been there or not.

I understand that NAND chips usually have a few badblocks from the very
beginning, i.e. when they leave the manufacturer, and that NAND wears
out after c. 100'000 write/erase cycles. How can I tell the difference?
Are these worn out NAND blocks and -- if yes -- does this mean I have
already reached the end of the NAND's lifetime?

The only test I did was running md5sum on /dev/mtdblock? (where ? is 0
to 3). For mtdblock1 and mtdblock2 I saw "IO errors", these are the
first two partions on the NAND chip in question, i.e. the kernel
("System area") and the "Root Filesystem". This is exactly where the
badblocks as seen above are. (JFTR, I think mtdblock0 refers to another
ROM.)

If possible, I want to get the Zaurus back to a usable state. I have
backed up my data but I don't want to experiment too much for not to
make things worse. There are three options to operate on the
built-in NAND: (I don't want to disassamble it. I don't have suitable
tools anyways.)

1. While Linux is running through /dev/*. This seems difficult because
the partition in question will be mounted (readonly maybe).
2. By using the Zaurus upgrade procedure, my preferred method. This
involves booting from a SD or CF card and executing a shell script.
OpenZaurus' version of this script is hard to read but it involves
'eraseall', 'nandlogical', 'nandcp' (IIRC 'nandlogical' is something
Sharp invented, used mainly for historic reasons.):
http://www.spacezone.de/zaurus/articles/update.sh.txt
3. By using Zaurus' "Full NAND Restore" feature. This will overwrite the
whole NAND from a binary image file. I don't know how (and if) this
method deals with badblocks. It is designed as a last resort when method
2 fails.

The Zaurus stuff is off-topic here, of course, but I hope I provided
enough information for you to understand my problem. Thanks for taking
your time to read it.

Jan

--Signature_Tue__1_Aug_2006_20_04_51_+0200_vPU53iHYsnHxpERb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFEz5fLMH86Wg1tOQURAhMUAJ9Jsq8BBGkAR04T3LupQ/fk8FVI6ACeIcfz
XWTkeh/3hESagWZMCvvGuEA=
=MD5V
-----END PGP SIGNATURE-----

--Signature_Tue__1_Aug_2006_20_04_51_+0200_vPU53iHYsnHxpERb--
