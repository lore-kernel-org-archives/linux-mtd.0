Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xf1Ay-0001JL-R8
 for linux-mtd@lists.infradead.org; Fri, 17 Oct 2014 06:38:13 +0000
Received: by mail-ie0-f173.google.com with SMTP id tp5so168894ieb.4
 for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2014 23:37:51 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 17 Oct 2014 08:29:43 +0200
Message-ID: <CACna6rxV9UbXOtq7w+HGYZQVi8-4v+pZOtK98cGJaCwA+njUVg@mail.gmail.com>
Subject: UBIFS: Does init_constants_early ignore LEBs being erased? Complains
 about amount.
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

I have quite big (123 MiB) partition flashed with a pretty small
(2'228'224) ubinized image. It contains two volumes:
1) rootfs: built from root.squashfs file (1815610)
2) rootfs_data: empty, autoresize, 1MiB

My partition is cleared (contains 0xFF), so scan_peb queues most of
the PEBs for erasing.

There goes a booting log:

UBI: auto-attach mtd13
UBI: attaching mtd13 to ubi0
random: nonblocking pool is initialized
UBI: scanning is finished
UBI: volume 1 ("rootfs_data") re-sized from 9 to 947 LEBs
UBI: attached mtd13 (name "ubi", size 123 MiB) to ubi0
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
UBI: good PEBs: 986, bad PEBs: 0, corrupted PEBs: 0
UBI: user volume: 2, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 1/0, WL threshold: 4096, image sequence
number: 1106356682
UBI: available PEBs: 0, total reserved PEBs: 986, PEBs reserved for
bad PEB handling: 20
UBI: background thread "ubi_bgt0d" started, PID 257
UBI: ubiblock0_0 created from ubi0:0(rootfs)
UBIFS error (pid 1): init_constants_early: too few LEBs (15), min. is 17
*** 5 seconds later ***
UBIFS: default file-system created
UBIFS: background thread "ubifs_bgt0_1" started, PID 302
UBIFS: mounted UBI device 0, volume 1, name "rootfs_data"
UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes:
2048 bytes/2048 bytes
UBIFS: FS size: 118849536 bytes (113 MiB, 936 LEBs), journal size
5967872 bytes (5 MiB, 47 LEBs)
UBIFS: reserved for root: 4952683 bytes (4836 KiB)
UBIFS: media format: w4/r0 (latest is w4/r0), UUID
A3D6B177-D8CC-43AA-A15F-5A0480428338, small LPT model

My guess is there is nothing wrong happening above. I guess UBIFS
aborted because there weren't enough LEBs and later (after UBI
prepared empty LEBs) UBIFS was triggered again.

However this "UBIFS error" looks like a serious error, a bit scary ;)
Would it be possible to detect that there are some LEBs being prepared
and if so, change the above message to something like
"UBIFS: too few LEBs (15), min. is 17, waiting for UBI to prepare more"
?

--=20
Rafa=C5=82
