Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1daR7z-0003fk-UU
 for linux-mtd@lists.infradead.org; Wed, 26 Jul 2017 18:33:51 +0000
Date: Wed, 26 Jul 2017 20:33:26 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: mtd: nand: atmel: probe of Spansion S34ML02G1 fails
Message-ID: <20170726203326.2159f0cc@bbrezillon>
In-Reply-To: <9879279.x3T2Y4a6KK@ada>
References: <5326598.QgYTQxcFMR@ada> <20170725205406.5a946c08@bbrezillon>
 <9879279.x3T2Y4a6KK@ada>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

Le Wed, 26 Jul 2017 10:15:13 +0200,
Alexander Dahl <ada@thorsis.com> a =C3=A9crit :

> Hello,
>=20
> Am Dienstag, 25. Juli 2017, 20:54:06 schrieb Boris Brezillon:
> > Can you try with the following fix? =20
>=20
> I tried. The initialization seems to be successful now, at least there=20
> are no error messages from the nand driver anymore. But later on UBI=20
> fails, which is strange because it does not fail with earlier kernels.=20
> Kernel command line is this:
>=20
> console=3DttyS0,115200 panic=3D1=20
> mtdparts=3Datmel_nand:128k(bootstrap)ro,512k(uboot)ro,256k(env1),256k(env=
2),3M(kernel_rec)ro,768k(fpga_rec)ro,47M(rootfs_rec)ro,3M(kernel),768k(fpga=
),200M(filesystem),128k(rootfs_update_script),-(free)=20
> ubi.mtd=3Drootfs_rec ubi.mtd=3Dfilesystem root=3Dubi1:rootfs1 rootfstype=
=3Dubifs
>=20
> UBI/UBIFS kernel config is like this:
>=20
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D50
> # CONFIG_MTD_UBI_FASTMAP is not set
> # CONFIG_MTD_UBI_GLUEBI is not set
> # CONFIG_MTD_UBI_BLOCK is not set
>=20
> CONFIG_UBIFS_FS=3Dy
> CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> CONFIG_UBIFS_FS_LZO=3Dy
> CONFIG_UBIFS_FS_ZLIB=3Dy
> # CONFIG_UBIFS_ATIME_SUPPORT is not set
> # CONFIG_UBIFS_FS_ENCRYPTION is not set
> CONFIG_UBIFS_FS_SECURITY=3Dy
>=20
> According to the datasheet the NAND flash (Spansion=C2=AE S34ML02G1) supp=
orts=20
> 1-bit ECC. According to the SAM9G20 datasheet the SMC supports ECC-
> enabled NAND flash, but as far as I could see the ECC controller of the=20
> SAM9G20 has no driver and is not used, but ECC is computed in software?
>=20
> The nand node in my dts file is like the one in=20
> arch/arm/boot/dts/at91sam9g20ek_common.dtsi (with different partitions).
>=20
> See the console output:
>=20
> nand: device found, Manufacturer ID: 0x01, Chip ID: 0xda
> nand: AMD/Spansion S34ML02G1
> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> Bad block table found at page 131008, version 0x01
> Bad block table found at page 130944, version 0x01
> 12 cmdlinepart partitions found on MTD device atmel_nand
> Creating 12 MTD partitions on "atmel_nand":
> 0x000000000000-0x000000020000 : "bootstrap"
> 0x000000020000-0x0000000a0000 : "uboot"
> 0x0000000a0000-0x0000000e0000 : "env1"
> 0x0000000e0000-0x000000120000 : "env2"
> 0x000000120000-0x000000420000 : "kernel_rec"
> 0x000000420000-0x0000004e0000 : "fpga_rec"
> 0x0000004e0000-0x0000033e0000 : "rootfs_rec"
> 0x0000033e0000-0x0000036e0000 : "kernel"
> 0x0000036e0000-0x0000037a0000 : "fpga"
> 0x0000037a0000-0x00000ffa0000 : "filesystem"
> 0x00000ffa0000-0x00000ffc0000 : "rootfs_update_script"
> 0x00000ffc0000-0x000010000000 : "free"
> NET: Registered protocol family 17
> ubi0: attaching mtd6
> ubi0: MTD device 6 is write-protected, attach in read-only mode
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 1:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 1:0, read only 64 bytes, retry
> ubi0: fixable bit-flip detected at PEB 1
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 2:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 2:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 2:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 2:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> ubi0: fixable bit-flip detected at PEB 2
> ubi0 warning: scan_all.constprop.0: valid VID header but corrupted EC=20
> header at PEB 2
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 3:0, read only 64 bytes, retry
> ubi0: fixable bit-flip detected at PEB 3
> ubi0: fixable bit-flip detected at PEB 3
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 4:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 4:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 4:0, read only 64 bytes, retry
> ubi0: fixable bit-flip detected at PEB 4
> ubi0: fixable bit-flip detected at PEB 4
> ubi0 warning: scan_all.constprop.0: valid VID header but corrupted EC=20
> header at PEB 4
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 5:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 5:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 5:0, read only 64 bytes, retry
> ubi0: fixable bit-flip detected at PEB 5
> ubi0: fixable bit-flip detected at PEB 5
> ubi0 warning: scan_all.constprop.0: valid VID header but corrupted EC=20
> header at PEB 5
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 6:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 6:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 6:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 6:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> ubi0: fixable bit-flip detected at PEB 6
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 7:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 7:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 7:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 7:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> ubi0: fixable bit-flip detected at PEB 7
> ubi0 warning: scan_all.constprop.0: valid VID header but corrupted EC=20
> header at PEB 7
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 8:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 8:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 8:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 8:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 8:512, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 8:512, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 8:512, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 8:512, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0259200>]=20
> (ubi_io_read_vid_hdr+0xac/0x32c)
> [<c0259200>] (ubi_io_read_vid_hdr) from [<c025f3d8>]=20
> (scan_all.constprop.0+0x208/0xb80)
> [<c025f3d8>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> ubi0: fixable bit-flip detected at PEB 9
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 9:512, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 9:512, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 9:512, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 9:512, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0259200>]=20
> (ubi_io_read_vid_hdr+0xac/0x32c)
> [<c0259200>] (ubi_io_read_vid_hdr) from [<c025f3d8>]=20
> (scan_all.constprop.0+0x208/0xb80)
> [<c025f3d8>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 129024=20
> bytes from PEB 9:2048, read only 129024 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 129024=20
> bytes from PEB 9:2048, read only 129024 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 129024=20
> bytes from PEB 9:2048, read only 129024 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 129024=20
> bytes from PEB 9:2048, read 129024 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c025f468>]=20
> (scan_all.constprop.0+0x298/0xb80)
> [<c025f468>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 10:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 10:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 10:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 10:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 10:512, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 10:512, read only 64 bytes, retry
> ubi0: fixable bit-flip detected at PEB 10
> ubi0 warning: scan_all.constprop.0: valid VID header but corrupted EC=20
> header at PEB 10
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 11:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 11:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 11:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 11:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 11:512, read only 64 bytes, retry
> ubi0: fixable bit-flip detected at PEB 11
> ubi0 warning: scan_all.constprop.0: valid VID header but corrupted EC=20
> header at PEB 11
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 12:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 12:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 12:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 12:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> ubi0: fixable bit-flip detected at PEB 12
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 13:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 13:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 13:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 13:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> ubi0: fixable bit-flip detected at PEB 13
> ubi0 warning: scan_all.constprop.0: valid VID header but corrupted EC=20
> header at PEB 13
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 14:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 14:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 14:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 14:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> ubi0: fixable bit-flip detected at PEB 14
> ubi0 warning: scan_all.constprop.0: valid VID header but corrupted EC=20
> header at PEB 14
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 15:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 15:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 15:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 15:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> ubi0: fixable bit-flip detected at PEB 15
> ubi0 warning: scan_all.constprop.0: valid VID header but corrupted EC=20
> header at PEB 15
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 16:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 16:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 16:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 16:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> ubi0: fixable bit-flip detected at PEB 16
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 17:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 17:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 17:0, read only 64 bytes, retry
> ubi0: fixable bit-flip detected at PEB 17
> ubi0: fixable bit-flip detected at PEB 17
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 18:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 18:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 18:0, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 18:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0258ecc>]=20
> (ubi_io_read_ec_hdr+0xa4/0x32c)
> [<c0258ecc>] (ubi_io_read_ec_hdr) from [<c025f320>]=20
> (scan_all.constprop.0+0x150/0xb80)
> [<c025f320>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 18:512, read only 64 bytes, retry
> ubi0: fixable bit-flip detected at PEB 18
> ubi0 warning: scan_all.constprop.0: valid VID header but corrupted EC=20
> header at PEB 18
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 19:0, read only 64 bytes, retry
> ubi0: fixable bit-flip detected at PEB 19
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 19:512, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 19:512, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 19:512, read only 64 bytes, retry
> __nand_correct_data: uncorrectable ECC error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 19:512, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc2+ #13
> Hardware name: Atmel AT91SAM9
> [<c000f4b8>] (unwind_backtrace) from [<c000d5b4>] (show_stack+0x10/0x14)
> [<c000d5b4>] (show_stack) from [<c0258b4c>] (ubi_io_read+0x214/0x328)
> [<c0258b4c>] (ubi_io_read) from [<c0259200>]=20
> (ubi_io_read_vid_hdr+0xac/0x32c)
> [<c0259200>] (ubi_io_read_vid_hdr) from [<c025f3d8>]=20
> (scan_all.constprop.0+0x208/0xb80)
> [<c025f3d8>] (scan_all.constprop.0) from [<c0260084>]=20
> (ubi_attach+0xa0/0x194)
> [<c0260084>] (ubi_attach) from [<c02524f8>]=20
> (ubi_attach_mtd_dev+0x1f4/0x698)
> [<c02524f8>] (ubi_attach_mtd_dev) from [<c04d1384>]=20
> (ubi_init+0x138/0x1d8)
> [<c04d1384>] (ubi_init) from [<c00096d8>] (do_one_initcall+0xa8/0x158)
> [<c00096d8>] (do_one_initcall) from [<c04b2cf4>]=20
> (kernel_init_freeable+0x104/0x1c0)
> [<c04b2cf4>] (kernel_init_freeable) from [<c0356a94>]=20
> (kernel_init+0x8/0xf0)
> [<c0356a94>] (kernel_init) from [<c000a290>] (ret_from_fork+0x14/0x24)
> __nand_correct_data: uncorrectable ECC error
> __nand_correct_data: uncorrectable ECC error
> __nand_correct_data: uncorrectable ECC error
> __nand_correct_data: uncorrectable ECC error
> __nand_correct_data: uncorrectable ECC error
>=20
> [=E2=80=A6]
>=20
> This goes on forever until I cut power, just interrupted by messages=20
> like this every now and then:
>=20
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 129024=20
> bytes from PEB 19:2048, read only 129024 bytes, retry

Okay, first thing to test: revert f9ce2eddf176 ("mtd: nand: atmel: Add
->setup_data_interface() hooks"). You may have to revert other commits
to compile the driver.

If it works, I'd like you to drop SMC timings in both situations (with
and without this commit).

I'd also like to to dump NAND timings (those passed to
->setup_data_interface()).

Thanks,

Boris
