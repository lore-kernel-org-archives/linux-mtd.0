Return-Path: <SRS0=pV2g=VP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4558FC76191
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2019 14:14:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B61217F4
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2019 14:14:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KaVfTnem"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B61217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nLidHZaPkglmdwxvFYkqvY0hjYAajPsCmpNFXke7D7Y=; b=KaVfTnemIKsKfO
	8MF0hPqnvGIMbQQd4f4Nbao22qnDC1i437YKbpoavE/hMyOvnZdeYo2luBtk8JzrvfShVRUbXeAzR
	nQ/JJ8/LaicLi2dtlNtIzKMmWj0h+w7eYcofBJcmM/g4ZEZdokeYnmhOt5ycj26RoPq15nF2R/JeI
	pDOWaPvV+HS7cPfS0OOTIVnInl5Dl02Q+qhCqDuX1BvSGE13valNVl3CKIR2MIzdBPrJPNh9LwVQv
	SosKlktEJnjmalqxSpmfqYZze7Mxm+LYv7MoB3xB1GrW3jnoE0tqztJr2V09uLAWC0t8ICfzgWIRN
	L5D7SK5a3DVcGk+80Dow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ho7Ac-0005Yf-Ov; Thu, 18 Jul 2019 14:14:06 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho7AY-0005Y3-6v
 for linux-mtd@lists.infradead.org; Thu, 18 Jul 2019 14:14:04 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ho7AP-0007gV-51; Thu, 18 Jul 2019 16:13:53 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1ho7AN-0000Po-FZ; Thu, 18 Jul 2019 16:13:51 +0200
Date: Thu, 18 Jul 2019 16:13:51 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: ubiupdatevol breaks ubi?
Message-ID: <20190718141351.ya7bnhhwgnc2qz56@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190718_071402_426244_4E7E500F 
X-CRM114-Status: GOOD (  10.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Richard,

after the short and incomplete report in #mtd here a more detailed
report of what I did to trigger an assertion in ubifs:

I created an ubifs image using:

	mkfs.ubifs -r "debian" -m 2048 -e 126976 -c 6000 "debian.ubifs"

and put it on flash using:

	~ # mtdinfo -u /dev/mtd0
	mtd0
	Name:                           nand-flash
	Type:                           nand
	Eraseblock size:                131072 bytes, 128.0 KiB
	Amount of eraseblocks:          4096 (536870912 bytes, 512.0 MiB)
	Minimum input/output unit size: 2048 bytes
	Sub-page size:                  2048 bytes
	OOB size:                       128 bytes
	Character device major/minor:   90:0
	Bad blocks are allowed:         true
	Device is writable:             true
	Default UBI VID header offset:  2048
	Default UBI data offset:        4096
	Default UBI LEB size:           126976 bytes, 124.0 KiB
	Maximum UBI volumes count:      128

	~ # flash_erase /dev/mtd0 0 0
	Erasing 128 Kibyte @ 1ff60000 -- 99 % complete flash_erase: Skipping bad b=
lock at 1ff80000
	flash_erase: Skipping bad block at 1ffa0000
	flash_erase: Skipping bad block at 1ffc0000
	flash_erase: Skipping bad block at 1ffe0000
	Erasing 128 Kibyte @ 1ffe0000 -- 100 % complete =


	~ # ubiformat /dev/mtd0
	ubiformat: mtd0 (nand), size 536870912 bytes (512.0 MiB), 4096 eraseblocks=
 of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
	libscan: scanning eraseblock 4095 -- 100 % complete
	ubiformat: 4092 eraseblocks are supposedly empty
	ubiformat: 4 bad eraseblocks found, numbers: 4092, 4093, 4094, 4095
	ubiformat: formatting eraseblock 4095 -- 100 % complete

	~ # ubiattach -m 0
	[ 2855.917293] ubi0: default fastmap pool size: 200
	[ 2855.922410] ubi0: default fastmap WL pool size: 100
	[ 2855.928311] ubi0: attaching mtd0
	[ 2857.929408] ubi0: scanning is finished
	[ 2857.986063] ubi0: attached mtd0 (name "nand-flash", size 512 MiB)
	[ 2857.992723] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 by=
tes
	[ 2857.999992] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 20=
48
	[ 2858.006964] ubi0: VID header offset: 2048 (aligned 2048), data offset: =
4096
	[ 2858.013983] ubi0: good PEBs: 4092, bad PEBs: 4, corrupted PEBs: 0
	[ 2858.020237] ubi0: user volume: 0, internal volumes: 1, max. volumes cou=
nt: 128
	[ 2858.027624] ubi0: max/mean erase counter: 0/0, WL threshold: 4096, imag=
e sequence number: 1042070777
	[ 2858.036916] ubi0: available PEBs: 4010, total reserved PEBs: 82, PEBs r=
eserved for bad PEB handling: 76
	[ 2858.055801] ubi0: background thread "ubi_bgt0d" started, PID 317
	UBI device number 0, total 4092 LEBs (519585792 bytes, 495.5 MiB), availab=
le 4010 LEBs (509173760 bytes, 485.6 MiB), LEB size 126976 bytes (124.0 KiB)

	~ # ubimkvol /dev/ubi0 -N root --maxavsize
	Set volume size to 509173760
	Volume ID 0, size 4010 LEBs (509173760 bytes, 485.6 MiB), LEB size 126976 =
bytes (124.0 KiB), dynamic, name "root", alignment 1

	~ # ubiupdatevol /dev/ubi0_0 /debian.ubifs

then booting into this System results in:

	[    0.000000] Linux version 4.19.32...
	...
	[    0.000000] Kernel command line:  console=3Dttymxc0,115200n8 ubi.mtd=3D=
0 root=3Dubi0:root rootfstype=3Dubifs rw                                   =
      =

	...
	[    2.652695] nand: device found, Manufacturer ID: 0x01, Chip ID: 0xdc   =
                                                                           =

	[    2.659453] nand: AMD/Spansion S34ML04G2                               =
                                                                           =

	[    2.663687] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, O=
OB size: 128                                                               =

	[    2.677412] Bad block table found at page 262080, version 0x01         =
                                                                           =

	[    2.684913] Bad block table found at page 262016, version 0x01         =
                                                                           =

	[    2.693595] 1 fixed-partitions partitions found on MTD device gpmi-nand=
                                                                           =

	[    2.700543] Creating 1 MTD partitions on "gpmi-nand":                  =
                                                                           =

	[    2.705928] 0x000000000000-0x000020000000 : "nand-flash"               =
                                                                           =

	...
	[    5.119700] ubi0: default fastmap pool size: 200
	[    5.125013] ubi0: default fastmap WL pool size: 100
	[    5.130267] ubi0: attaching mtd0
	...
	[   11.890830] ubi0: scanning is finished
	[   11.960839] ubi0: attached mtd0 (name "nand-flash", size 512 MiB)
	[   11.967337] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 by=
tes
	[   11.974453] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 20=
48
	[   11.981465] ubi0: VID header offset: 2048 (aligned 2048), data offset: =
4096
	[   11.988644] ubi0: good PEBs: 4092, bad PEBs: 4, corrupted PEBs: 0
	[   11.994957] ubi0: user volume: 1, internal volumes: 1, max. volumes cou=
nt: 128
	[   12.002391] ubi0: max/mean erase counter: 1/0, WL threshold: 4096, imag=
e sequence number: 1042070777
	[   12.011737] ubi0: available PEBs: 0, total reserved PEBs: 4092, PEBs re=
served for bad PEB handling: 76
	[   12.021618] ubi0: background thread "ubi_bgt0d" started, PID 100
	...
	[   12.082030] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, P=
ID 101
	[   12.201559] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name=
 "root"
	[   12.209370] UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max.=
 I/O unit sizes: 2048 bytes/2048 bytes
	[   12.219503] UBIFS (ubi0:0): FS size: 506507264 bytes (483 MiB, 3989 LEB=
s), journal size 9023488 bytes (8 MiB, 72 LEBs)
	[   12.230399] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
	[   12.236429] UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0), UUID=
 57568ADB-C618-49CE-9F05-9C40E27BAB39, small LPT model
	[   12.257593] VFS: Mounted root (ubifs filesystem) on device 0:14.
	[   12.273445] devtmpfs: mounted
	[   12.308377] Freeing unused kernel memory: 1024K
	[   12.314667] Run /sbin/init as init process
	...
	[   57.807978] UBIFS error (ubi0:0 pid 262): ubifs_assert_failed: UBIFS as=
sert failed: c->lhead_lnum !=3D c->ltail_lnum, in fs/ubifs/log.c:412
	[   57.854475] UBIFS warning (ubi0:0 pid 262): ubifs_ro_mode.part.0: switc=
hed to read-only mode, error -22
	[   57.876467] CPU: 0 PID: 262 Comm: dpkg Not tainted 4.19.32-20190328-1 #1
	[   57.883251] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
	[   57.889527] [<80112e78>] (unwind_backtrace) from [<8010dac0>] (show_sta=
ck+0x20/0x24)
	[   57.897346] [<8010dac0>] (show_stack) from [<80a06ae0>] (dump_stack+0xa=
8/0xdc)
	[   57.904647] [<80a06ae0>] (dump_stack) from [<8042fcf0>] (ubifs_ro_mode.=
part.0+0x4c/0x54)
	[   57.912807] [<8042fcf0>] (ubifs_ro_mode.part.0) from [<8042fdd4>] (ubif=
s_ro_mode+0x24/0x28)
	[   57.921225] [<8042fdd4>] (ubifs_ro_mode) from [<8045044c>] (ubifs_asser=
t_failed+0x68/0x74)
	[   57.929560] [<8045044c>] (ubifs_assert_failed) from [<8043a588>] (ubifs=
_log_start_commit+0x31c/0x374)
	[   57.938849] [<8043a588>] (ubifs_log_start_commit) from [<8043b3c4>] (do=
_commit+0x1d0/0x7b4)
	[   57.947267] [<8043b3c4>] (do_commit) from [<8043bbf4>] (ubifs_run_commi=
t+0xa0/0xf0)
	[   57.954992] [<8043bbf4>] (ubifs_run_commit) from [<80422ce0>] (make_res=
ervation+0x1d0/0x3d8)
	[   57.963503] [<80422ce0>] (make_reservation) from [<804244cc>] (ubifs_jn=
l_rename+0x138/0x974)
	[   57.972006] [<804244cc>] (ubifs_jnl_rename) from [<8042a784>] (do_renam=
e+0x4ec/0x7dc)
	[   57.979897] [<8042a784>] (do_rename) from [<8042ab00>] (ubifs_rename+0x=
8c/0x3bc)
	[   57.987358] [<8042ab00>] (ubifs_rename) from [<802a7bf8>] (vfs_rename+0=
x3a0/0x7d4)
	[   57.994996] [<802a7bf8>] (vfs_rename) from [<802aa1f8>] (do_renameat2+0=
x4a8/0x4e8)
	[   58.002633] [<802aa1f8>] (do_renameat2) from [<802ab38c>] (sys_rename+0=
x34/0x3c)
	[   58.010093] [<802ab38c>] (sys_rename) from [<80101000>] (ret_fast_sysca=
ll+0x0/0x28)
	[   58.017799] Exception stack(0x8d947fa8 to 0x8d947ff0)
	[   58.022912] 7fa0:                   012aaf90 005093c8 012adc08 012adb08=
 f8add500 0066d000
	[   58.031151] 7fc0: 012aaf90 005093c8 0066cff4 00000026 0129c708 00509448=
 00509428 0000000a
	[   58.039379] 7fe0: 00000026 7e83827c 76e818ab 76e53746                  =
                                                                           =

	[   58.249535] UBIFS error (ubi0:0 pid 262): do_commit: commit failed, err=
or -30                                                                     =

	...

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
