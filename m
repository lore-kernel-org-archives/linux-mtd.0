Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KqUBg-0000cR-Rn
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 14:50:53 +0000
Subject: Re: nandwrite/ubi memory corruption?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Michal Ludvig <mludvig@logix.net.nz>
In-Reply-To: <48F71315.5080707@logix.net.nz>
References: <48F71315.5080707@logix.net.nz>
Content-Type: text/plain; charset=utf-8
Date: Thu, 16 Oct 2008 17:49:20 +0300
Message-Id: <1224168560.4466.2.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-10-16 at 23:10 +1300, Michal Ludvig wrote:
> Hi all,
>=20
> I've got an ARM board with 64MB of NAND flash with 3 logical partitions
> and am experiencing (probably) memory corruption of UBI/UBIFS on
> /dev/mtd2 after writing data with nandwrite to /dev/mtd1.
>=20
> These are my logical partitions on NAND:
>=20
> S3C24XX NAND Driver, (c) 2004 Simtec Electronics
> s3c2410-nand s3c2410-nand: Tacls=3D3, 30ns Twrph0=3D7 70ns, Twrph1=3D3 30=
ns
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB
> 3,3V 8-bit)
> Scanning device for bad blocks
> Creating 3 MTD partitions on "NAND 64MiB 3,3V 8-bit":
> 0x00000000-0x00050000 : "boot"
> 0x00050000-0x00220000 : "kernel"
> 0x00220000-0x04000000 : "ubi"
> s3c2410-nand s3c2410-nand: clock idle support enabled
>=20
>=20
>=20
> I use u-boot 1.1.4 as the bootloader and 2.6.27 as the kernel. The
> kernel image size is 1492552 bytes, that should fit into the kernel
> partition as far as I can tell.
>=20
> When I load the kernel in u-boot and write into NAND with 'nandw'
> command of u-boot it works fine.
>=20
> However when I use nandwrite from linux it does "something" but
> 1) the kernel won't boot
> 2) it probably corrupted the 'ubi' partition:
>=20
> ~ # nandwrite -p /dev/mtd1 uimage26
> Writing data to block 0
> Writing data to block 4000
> [...]
> Writing data to block 164000
> Writing data to block 168000
> Writing data to block 16c000
>=20
> ~ # ls
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
> 2414:15360, written 0 bytes
> UBI warning: ubi_eba_write_leb: failed to write data to PEB 2414
> UBI: recover PEB 2414, move data to PEB 2428
> UBI warning: ubi_io_read_vid_hdr: bad magic number at PEB 2414: 00000000
> instead of 55424921
> UBI warning: ubi_ro_mode: switch to read-only mode
> UBIFS error (pid 224): ubifs_wbuf_sync_nolock: cannot write 512 bytes to
> LEB 746:14336
> UBIFS error (pid 224): ubifs_bg_wbufs_sync: cannot sync write-buffer,
> error -5
> UBIFS warning (pid 224): ubifs_ro_mode: switched to read-only mode, error=
 -5

Could you please try ubiformat instead of nandwrite? See here:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_ubierase

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
