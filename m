Received: from pproxy.gmail.com ([64.233.166.181])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FKAAT-0004Xu-AP
	for linux-mtd@lists.infradead.org; Fri, 17 Mar 2006 03:18:44 -0500
Received: by pproxy.gmail.com with SMTP id x31so903813pye
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Mar 2006 00:18:40 -0800 (PST)
Message-ID: <6d6a94c50603170012l62ee51dfxe0b33166398ad88d@mail.gmail.com>
Date: Fri, 17 Mar 2006 16:12:13 +0800
From: Aubrey <aubreylee@gmail.com>
To: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
In-Reply-To: <38F58D7B92CB20438DF49D28B572CC6F13C4A4@budgw09a.ww300.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <38F58D7B92CB20438DF49D28B572CC6F13C4A4@budgw09a.ww300.siemens.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: why can't kernel read from NAND/SMC device?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Did you erase the whole root file system partition before you write
the filesystem image to it?

Regards,
-Aubrey

On 3/16/06, Selmeci, Tamas <tamas.selmeci@siemens.com> wrote:
> Hello!
>
> After spending a few hours examining S3C2410 NAND-code, I could successfu=
lly bring to life the NAND subsystem of the S3C2410 processor. (I'm working=
 with 2.6.15-5 kernel). The following appears:
>
> ------
> s3c2410-nand: Tacls=3D3, 30ns Twrph0=3D7 70ns, Twrph1=3D7 70ns
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB 3,=
3V 8-bit)
> Scanning device for bad blocks
> nand_read_oob: from =3D 0x00000000, len =3D 16
> ...
> (media check, not too interesting)
> ------
>
> After the check has finished, it assigns every partition to an MTD:
>
> ------
> Creating 4 MTD partitions on "NAND 128MiB 3,3V 8-bit":
> 0x00000000-0x00020000 : "vivi"
> mtd: Giving out device 0 to vivi
> 0x00020000-0x00030000 : "param"
> mtd: Giving out device 1 to param
> 0x00030000-0x000f0000 : "kernel"
> mtd: Giving out device 2 to kernel
> 0x00100000-0x00240000 : "root"
> mtd: Giving out device 3 to root
> ------
>
> (this partition structure is made by vivi to the SMC and compiled in the =
board's machine file (in s3c2410_nand_set structure) )
>
> cramfs, romfs and jffs2 support is compiled in the kernel, FTL and NFTL n=
ot.
>
> If I give the kernel the root=3D/dev/mtdblock3 parameter, then this can b=
e seen:
>
> ------
> mtdblock_open
> ok
> mtdblock: read on "root" at 0x0, size 0x200
> nand_read_ecc: from =3D 0x00100000, len =3D 512
> nand_read_ecc: Failed ECC read, page 0x00000800
> nand_read_ecc: Failed ECC read, page 0x00000800
> end_request: I/O error, dev mtdblock3, sector 0
> Buffer I/O error on device mtdblock3, logical block 0
> mtdblock: read on "root" at 0x0, size 0x200
> nand_read_ecc: from =3D 0x00100000, len =3D 512
> nand_read_ecc: Failed ECC read, page 0x00000800
> nand_read_ecc: Failed ECC read, page 0x00000800
> end_request: I/O error, dev mtdblock3, sector 0
> Buffer I/O error on device mtdblock3, logical block 0
> mtdblock: read on "root" at 0x1000, size 0x200
> nand_read_ecc: from =3D 0x00101000, len =3D 512
> mtdblock: read on "root" at 0x1200, size 0x200
> nand_read_ecc: from =3D 0x00101200, len =3D 512
> nand_read_ecc: Failed ECC read, page 0x00000809
> end_request: I/O error, dev mtdblock3, sector 8
> Buffer I/O error on device mtdblock3, logical block 1
> mtdblock: read on "root" at 0x1000, size 0x200
> nand_read_ecc: from =3D 0x00101000, len =3D 512
> mtdblock: read on "root" at 0x1200, size 0x200
> nand_read_ecc: from =3D 0x00101200, len =3D 512
> nand_read_ecc: Failed ECC read, page 0x00000809
> end_request: I/O error, dev mtdblock3, sector 8
> Buffer I/O error on device mtdblock3, logical block 1
> mtdblock: read on "root" at 0x2000, size 0x200
> nand_read_ecc: from =3D 0x00102000, len =3D 512
> nand_read_ecc: Failed ECC read, page 0x00000810
> end_request: I/O error, dev mtdblock3, sector 16
> Buffer I/O error on device mtdblock3, logical block 2
> mtdblock: read on "root" at 0x2000, size 0x200
> nand_read_ecc: from =3D 0x00102000, len =3D 512
> nand_read_ecc: Failed ECC read, page 0x00000810
> end_request: I/O error, dev mtdblock3, sector 16
> Buffer I/O error on device mtdblock3, logical block 2
> mtdblock: read on "root" at 0x3000, size 0x200
> nand_read_ecc: from =3D 0x00103000, len =3D 512
> nand_read_ecc: Failed ECC read, page 0x00000818
> nand_read_ecc: Failed ECC read, page 0x00000818
> end_request: I/O error, dev mtdblock3, sector 24
> Buffer I/O error on device mtdblock3, logical block 3
> mtdblock: read on "root" at 0x3000, size 0x200
> nand_read_ecc: from =3D 0x00103000, len =3D 512
> nand_read_ecc: Failed ECC read, page 0x00000818
> nand_read_ecc: Failed ECC read, page 0x00000818
> end_request: I/O error, dev mtdblock3, sector 24
> Buffer I/O error on device mtdblock3, logical block 3
> mtdblock_release
> nand_sync: called
> ok
> VFS: tried fs_name =3D <cramfs> err=3D -22
> mtdblock_open
> ok
> mtdblock: read on "root" at 0x0, size 0x200
> nand_read_ecc: from =3D 0x00100000, len =3D 512
> nand_read_ecc: Failed ECC read, page 0x00000800
> nand_read_ecc: Failed ECC read, page 0x00000800
> end_request: I/O error, dev mtdblock3, sector 0
> romfs: unable to read superblock
> mtdblock_release
> nand_sync: called
> ok
> VFS: tried fs_name =3D <romfs> err=3D -22
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block=
(31,3)
> ------
> There are ECC error messages and I/O errors when reading the SmartMedia c=
ard, but in the last line (unknown-block(31,3) ) the device ID seems to be =
OK. The NAND device is recognized but works improperly. Why can't be the pa=
rtition read?
>
> With root=3D/dev/mtd3 setting:
> ------
> VFS: test name =3D </dev/root>
> VFS: fs_name =3D <cramfs>
> VFS: fs_name =3D <romfs>
> VFS: tried fs_name =3D <cramfs> err=3D -6
> VFS: Cannot open root device "mtd3" or unknown-block(0,0)
> Please append a correct "root=3D" boot option
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block=
(0,0)
> ------
>
> There are absolutely no ECC error messages - because /dev/mtd3 refers to =
no device (unknown-block(0,0) ), I suppose.
>
> I don't know what's the problem with the NAND card (it's a rather new one=
, with only one bad eraseblock) or driver... those ECC errors are not too n=
ice (in the kernel I switched off S3C2410 NAND hardware ECC option). Does a=
nybody know what to do now, or any good advices?
>
> Many thanks
>
> Bye
> --
> Tamas Selmeci
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
