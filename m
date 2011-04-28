Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QFUI5-0000u6-Ku
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 16:42:10 +0000
Received: from [192.168.0.34] (col31-4-88-188-83-94.fbx.proxad.net
	[88.188.83.94])
	by mail.free-electrons.com (Postfix) with ESMTPSA id A51CF13B
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Apr 2011 18:42:00 +0200 (CEST)
Message-ID: <4DB998E3.6070304@free-electrons.com>
Date: Thu, 28 Apr 2011 18:42:11 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: unsupported subpages: how to be sure/fix ?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I got the infamous -74 error with the 2-planes OneNand chip I'm using
when trying to create a UBI Volume
(Below are the boot messages after flashing a ubinized image ; but I had
the same error with the trio ubiformat/ubiattach/ubimkvol. If I
understand the "programming ubinized images" well, though, using uboot
to flash ubinized images may also create problems, right ?).

So I ran the pagetest and subpagetest (detailed results below) and got a
-74 error during the subpagetest. (I also got a ecc error during the
pagetest, but I guess it's due to u-boot way of erasing ?)

I then used ubiformat/attach/mkvol/updatevol.
When specifying a VID header offset of 4096 (the page size according to
the MTD subsystem) (and modifying the LEB size in the mkfs.ubifs command
accordingly), everything works fine.


So: According to he FAQ, a possibility is that the chip doesn't support
subpages properly. How could I make sure of that ? Is it a bug ?

Cheers,
David.

----------
	* Boot log:
[    0.000000] Kernel command line: mem=512M console=ttyO2,115200n8
omapfb.mode=dvi:1024x768MR-16@60 mpurate=110
mtdparts=omap2-onenand:0x280000(Bootloader)ro,0x400000(Kernel),-(UBI)
ubi.mtd=2 root=ubi0:rootfs rootfstype=ubifs
[...]
[    4.290191] mtdoops: mtd device (mtddev=name/number) must be supplied
[    4.302062] OneNAND driver initializing
[    4.307891] omap2-onenand omap2-onenand: initializing on CS0, phys
base 0x20000000, virtual base e0880000
[    4.318603] Muxed OneNAND(DDP) 512MB 1.8V 16-bit (0x58)
[    4.324188] OneNAND version = 0x0031
[    4.337799] Scanning device for bad blocks
[    4.562805] OneNAND eraseblock 1812 is an initial bad block
[    4.586090] OneNAND eraseblock 1954 is an initial bad block
[    4.821655] OneNAND eraseblock 3860 is an initial bad block
[    4.845001] OneNAND eraseblock 4002 is an initial bad block
[    4.851348] OneNAND eraseblock 4003 is an initial bad block
[    4.868835] 3 cmdlinepart partitions found on MTD device omap2-onenand
[    4.876037] Creating 3 MTD partitions on "omap2-onenand":
[    4.882049] 0x000000000000-0x000000280000 : "Bootloader"
[    4.904785] mtd: Giving out device 0 to Bootloader
[    4.933532] 0x000000280000-0x000000680000 : "Kernel"
[    4.950256] mtd: Giving out device 1 to Kernel
[    4.970245] 0x000000680000-0x000020000000 : "UBI"
[    5.045166] mtd: Giving out device 2 to UBI
[    5.081085] UBI: attaching mtd2 to ubi0
[    5.085601] UBI: physical eraseblock size:   262144 bytes (256 KiB)
[    5.092498] UBI: logical eraseblock size:    258048 bytes
[    5.098449] UBI: smallest flash I/O unit:    4096
[    5.103485] UBI: sub-page size:              1024
[    5.108673] UBI: VID header offset:          1024 (aligned 1024)
[    5.115264] UBI: data offset:                4096
[    5.387451] UBI: max. sequence number:       0
[    5.473144] onenand_write_ops_nolock: verify failed -74
[    5.478881] UBI error: ubi_io_write: error -74 while writing 1024
bytes to PEB 26:1024, written 0 bytes
[    5.489135] UBI warning: ubi_eba_write_leb: failed to write VID
header to LEB 2147479551:0, PEB 26
[    5.498901] UBI warning: ubi_ro_mode: switch to read-only mode
[    5.505401] UBI error: autoresize: cannot auto-resize volume 0
[    5.539733] UBI error: ubi_init: cannot attach mtd2

	* mtd_pagetest test:
ended with 1 error (ecc are not all 0xff) (I don't have the exact
message anymore, sorry)

	* mtd_subpages test:
[ 1532.438568] onenand_write_ops_nolock: verify failed -74
[ 1532.444488] mtd_subpagetest: error: write failed at 0x400
[ 1532.450286] mtd_subpagetest:   write size: 0x400
[ 1532.455413] mtd_subpagetest:   written: 0x0
[ 1532.460113] mtd_subpagetest: error -74 occurred

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
