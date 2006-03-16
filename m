Received: from mxs1.siemens.at ([194.138.12.131])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FJurz-0001hn-VK
	for linux-mtd@lists.infradead.org; Thu, 16 Mar 2006 10:58:40 -0500
Received: from vies1kbx.sie.siemens.at ([158.226.129.82])
	by mxs1.siemens.at  with ESMTP id k2GFwA6i026096
	for <linux-mtd@lists.infradead.org>; Thu, 16 Mar 2006 16:58:10 +0100
Received: from nets138a.ww300.siemens.net ([158.226.129.98])
	by vies1kbx.sie.siemens.at (8.12.11/8.12.1) with ESMTP id
	k2GFw6M0004604
	for <linux-mtd@lists.infradead.org>; Thu, 16 Mar 2006 16:58:10 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Mar 2006 16:57:49 +0100
Message-ID: <38F58D7B92CB20438DF49D28B572CC6F13C4A4@budgw09a.ww300.siemens.net>
From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
To: <linux-mtd@lists.infradead.org>
Subject: why can't kernel read from NAND/SMC device?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

After spending a few hours examining S3C2410 NAND-code, I could =
successfully bring to life the NAND subsystem of the S3C2410 processor. =
(I'm working with 2.6.15-5 kernel). The following appears:

------
s3c2410-nand: Tacls=3D3, 30ns Twrph0=3D7 70ns, Twrph1=3D7 70ns
NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB =
3,3V 8-bit)
Scanning device for bad blocks
nand_read_oob: from =3D 0x00000000, len =3D 16
...
(media check, not too interesting)
------

After the check has finished, it assigns every partition to an MTD:

------
Creating 4 MTD partitions on "NAND 128MiB 3,3V 8-bit":
0x00000000-0x00020000 : "vivi"
mtd: Giving out device 0 to vivi
0x00020000-0x00030000 : "param"
mtd: Giving out device 1 to param
0x00030000-0x000f0000 : "kernel"
mtd: Giving out device 2 to kernel
0x00100000-0x00240000 : "root"
mtd: Giving out device 3 to root
------

(this partition structure is made by vivi to the SMC and compiled in the =
board's machine file (in s3c2410_nand_set structure) )

cramfs, romfs and jffs2 support is compiled in the kernel, FTL and NFTL =
not.

If I give the kernel the root=3D/dev/mtdblock3 parameter, then this can =
be seen:

------
mtdblock_open
ok
mtdblock: read on "root" at 0x0, size 0x200
nand_read_ecc: from =3D 0x00100000, len =3D 512
nand_read_ecc: Failed ECC read, page 0x00000800
nand_read_ecc: Failed ECC read, page 0x00000800
end_request: I/O error, dev mtdblock3, sector 0
Buffer I/O error on device mtdblock3, logical block 0
mtdblock: read on "root" at 0x0, size 0x200
nand_read_ecc: from =3D 0x00100000, len =3D 512
nand_read_ecc: Failed ECC read, page 0x00000800
nand_read_ecc: Failed ECC read, page 0x00000800
end_request: I/O error, dev mtdblock3, sector 0
Buffer I/O error on device mtdblock3, logical block 0
mtdblock: read on "root" at 0x1000, size 0x200
nand_read_ecc: from =3D 0x00101000, len =3D 512
mtdblock: read on "root" at 0x1200, size 0x200
nand_read_ecc: from =3D 0x00101200, len =3D 512
nand_read_ecc: Failed ECC read, page 0x00000809
end_request: I/O error, dev mtdblock3, sector 8
Buffer I/O error on device mtdblock3, logical block 1
mtdblock: read on "root" at 0x1000, size 0x200
nand_read_ecc: from =3D 0x00101000, len =3D 512
mtdblock: read on "root" at 0x1200, size 0x200
nand_read_ecc: from =3D 0x00101200, len =3D 512
nand_read_ecc: Failed ECC read, page 0x00000809
end_request: I/O error, dev mtdblock3, sector 8
Buffer I/O error on device mtdblock3, logical block 1
mtdblock: read on "root" at 0x2000, size 0x200
nand_read_ecc: from =3D 0x00102000, len =3D 512
nand_read_ecc: Failed ECC read, page 0x00000810
end_request: I/O error, dev mtdblock3, sector 16
Buffer I/O error on device mtdblock3, logical block 2
mtdblock: read on "root" at 0x2000, size 0x200
nand_read_ecc: from =3D 0x00102000, len =3D 512
nand_read_ecc: Failed ECC read, page 0x00000810
end_request: I/O error, dev mtdblock3, sector 16
Buffer I/O error on device mtdblock3, logical block 2
mtdblock: read on "root" at 0x3000, size 0x200
nand_read_ecc: from =3D 0x00103000, len =3D 512
nand_read_ecc: Failed ECC read, page 0x00000818
nand_read_ecc: Failed ECC read, page 0x00000818
end_request: I/O error, dev mtdblock3, sector 24
Buffer I/O error on device mtdblock3, logical block 3
mtdblock: read on "root" at 0x3000, size 0x200
nand_read_ecc: from =3D 0x00103000, len =3D 512
nand_read_ecc: Failed ECC read, page 0x00000818
nand_read_ecc: Failed ECC read, page 0x00000818
end_request: I/O error, dev mtdblock3, sector 24
Buffer I/O error on device mtdblock3, logical block 3
mtdblock_release
nand_sync: called
ok
VFS: tried fs_name =3D <cramfs> err=3D -22
mtdblock_open
ok
mtdblock: read on "root" at 0x0, size 0x200
nand_read_ecc: from =3D 0x00100000, len =3D 512
nand_read_ecc: Failed ECC read, page 0x00000800
nand_read_ecc: Failed ECC read, page 0x00000800
end_request: I/O error, dev mtdblock3, sector 0
romfs: unable to read superblock
mtdblock_release
nand_sync: called
ok
VFS: tried fs_name =3D <romfs> err=3D -22
Kernel panic - not syncing: VFS: Unable to mount root fs on =
unknown-block(31,3)
------
There are ECC error messages and I/O errors when reading the SmartMedia =
card, but in the last line (unknown-block(31,3) ) the device ID seems to =
be OK. The NAND device is recognized but works improperly. Why can't be =
the partition read?

With root=3D/dev/mtd3 setting:
------
VFS: test name =3D </dev/root>=20
VFS: fs_name =3D <cramfs>=20
VFS: fs_name =3D <romfs>=20
VFS: tried fs_name =3D <cramfs> err=3D -6
VFS: Cannot open root device "mtd3" or unknown-block(0,0)
Please append a correct "root=3D" boot option
Kernel panic - not syncing: VFS: Unable to mount root fs on =
unknown-block(0,0)
------

There are absolutely no ECC error messages - because /dev/mtd3 refers to =
no device (unknown-block(0,0) ), I suppose.=20

I don't know what's the problem with the NAND card (it's a rather new =
one, with only one bad eraseblock) or driver... those ECC errors are not =
too nice (in the kernel I switched off S3C2410 NAND hardware ECC =
option). Does anybody know what to do now, or any good advices?

Many thanks

Bye
--
Tamas Selmeci
