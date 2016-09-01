Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfOu6-0002Lu-Ua
 for linux-mtd@lists.infradead.org; Thu, 01 Sep 2016 10:07:29 +0000
Received: by mail-wm0-x242.google.com with SMTP id w207so7642661wmw.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Sep 2016 03:07:06 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Micron qspi nor flash and UBIFS
From: Andras Szemzo <szemzo.andras@gmail.com>
In-Reply-To: <CAFLxGvzmRPaNFqzYubCo2_mB9W4inja_J9YM7rUay_9TpJBmCA@mail.gmail.com>
Date: Thu, 1 Sep 2016 12:07:03 +0200
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A60106E3-04B6-4CC0-A3DE-14B6D98CC332@gmail.com>
References: <EB1698FB-FF63-4FC1-A706-A81DB9E655DD@gmail.com>
 <CAFLxGvzmRPaNFqzYubCo2_mB9W4inja_J9YM7rUay_9TpJBmCA@mail.gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Not sure, need more info first.
> Can you add some debug prints to figure where exactly the write =
happens?
>=20

Maybe these debug infos will be helpfull.

ubi0: default fastmap pool size: 45
ubi0: default fastmap WL pool size: 22
ubi0: attaching mtd2
UBI DBG gen (pid 1): sizeof(struct ubi_ainf_peb) 48
UBI DBG gen (pid 1): sizeof(struct ubi_wl_entry) 20
UBI DBG gen (pid 1): min_io_size      1
UBI DBG gen (pid 1): max_write_size   256
UBI DBG gen (pid 1): hdrs_min_io_size 1
UBI DBG gen (pid 1): ec_hdr_alsize    64
UBI DBG gen (pid 1): vid_hdr_alsize   64
UBI DBG gen (pid 1): vid_hdr_offset   64
UBI DBG gen (pid 1): vid_hdr_aloffset 64
UBI DBG gen (pid 1): vid_hdr_shift    0
UBI DBG gen (pid 1): leb_start        128
UBI DBG gen (pid 1): max_erroneous    95
UBI DBG gen (pid 1): process PEB 0
UBI DBG bld (pid 1): scan PEB 0
UBI DBG io (pid 1): read EC header from PEB 0
UBI DBG io (pid 1): read 64 bytes from PEB 0:0
UBI DBG io (pid 1): read VID header from PEB 0
UBI DBG io (pid 1): read 64 bytes from PEB 0:64
UBI DBG bld (pid 1): no VID header found at PEB 0, only 0xFF bytes
UBI DBG bld (pid 1): add to free: PEB 0, EC 1
UBI DBG gen (pid 1): process PEB 1
UBI DBG bld (pid 1): scan PEB 1
UBI DBG io (pid 1): read EC header from PEB 1
UBI DBG io (pid 1): read 64 bytes from PEB 1:0
UBI DBG io (pid 1): read VID header from PEB 1
UBI DBG io (pid 1): read 64 bytes from PEB 1:64
UBI DBG bld (pid 1): no VID header found at PEB 1, only 0xFF bytes
UBI DBG bld (pid 1): add to free: PEB 1, EC 1
...
UBI DBG gen (pid 1): process PEB 957
UBI DBG bld (pid 1): scan PEB 957
UBI DBG io (pid 1): read EC header from PEB 957
UBI DBG io (pid 1): read 64 bytes from PEB 957:0
UBI DBG io (pid 1): read VID header from PEB 957
UBI DBG io (pid 1): read 64 bytes from PEB 957:64
UBI DBG bld (pid 1): no VID header found at PEB 957, only 0xFF bytes
UBI DBG bld (pid 1): add to free: PEB 957, EC 0
ubi0: scanning is finished
UBI DBG gen (pid 1): max. sequence number:       108
UBI DBG gen (pid 1): check layout volume
UBI DBG io (pid 1): read 22016 bytes from PEB 257:128
UBI DBG io (pid 1): read 22016 bytes from PEB 258:128
UBI DBG wl (pid 1): add PEB 257 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 258 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 303 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 304 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 305 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 287 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 302 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 306 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 307 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 288 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 341 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 342 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 346 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 344 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 259 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 347 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 350 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 349 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 348 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 351 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 354 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 353 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 352 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 355 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 358 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 357 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 356 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 359 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 362 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 361 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 360 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 363 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 366 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 365 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 364 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 367 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 370 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 369 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 368 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 371 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 374 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 373 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 372 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 260 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 282 EC 0 to the used tree
UBI DBG wl (pid 1): add PEB 266 EC 0 to the used tree
UBI DBG wl (pid 1): found 958 PEBs
UBI DBG eba (pid 1): initialize EBA sub-system
UBI DBG eba (pid 1): EBA sub-system is initialized
UBI DBG gen (pid 1): ubi0 major is 251
UBI DBG gen (pid 1): add volume 0
ubi0: attached mtd2 (name "qspi-rootfs", size 59 MiB)
ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
ubi0: VID header offset: 64 (aligned 64), data offset: 128
ubi0: good PEBs: 958, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence =
number: 581993421
ubi0: available PEBs: 0, total reserved PEBs: 958, PEBs reserved for bad =
PEB handling: 0
ubi0: background thread "ubi_bgt0d" started, PID 46
at91_rtc 400e1860.rtc: setting system clock to 2012-01-01 00:00:05 UTC =
(1325376005)
UBI DBG gen (pid 1): open volume ubi0:rootfs, mode 1
UBI DBG gen (pid 1): open device 0, volume rootfs, mode 1
UBI DBG gen (pid 1): open device 0, volume 0, mode 1
UBI DBG gen (pid 1): open device 0, volume 0, mode 2
UBI DBG gen (pid 1): test LEB 0:0
UBI DBG gen (pid 1): read 4096 bytes from LEB 0:0:0
UBI DBG eba (pid 1): read 4096 bytes from offset 0 of LEB 0:0, PEB 303
UBI DBG io (pid 1): read 4096 bytes from PEB 303:128
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 47
UBI DBG gen (pid 1): read 65408 bytes from LEB 0:1:0
UBI DBG eba (pid 1): read 65408 bytes from offset 0 of LEB 0:1, PEB 304
UBI DBG io (pid 1): read 65408 bytes from PEB 304:128
UBI DBG gen (pid 1): read 65408 bytes from LEB 0:2:0
UBI DBG eba (pid 1): read 65408 bytes from offset 0 of LEB 0:2, PEB 305
UBI DBG io (pid 1): read 65408 bytes from PEB 305:128
UBI DBG gen (pid 1): read 68 bytes from LEB 0:13:192
UBI DBG eba (pid 1): read 68 bytes from offset 192 of LEB 0:13, PEB 288
UBI DBG io (pid 1): read 68 bytes from PEB 288:320
UBI DBG gen (pid 1): read 11 bytes from LEB 0:6:9032
UBI DBG eba (pid 1): read 11 bytes from offset 9032 of LEB 0:6, PEB 302
UBI DBG io (pid 1): read 11 bytes from PEB 302:9160
UBI DBG gen (pid 1): unmap LEB 0:7
UBI DBG gen (pid 1): write 512 bytes to LEB 0:1:23040
UBI DBG eba (pid 1): write 512 bytes at offset 23040 of LEB 0:1, PEB 304
UBI DBG io (pid 1): write 512 bytes to PEB 304:23168
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/mtd/spi-nor/spi-nor.c:1177 =
spi_nor_write+0x57/0xea
Writing at offset 128 into a NOR page. Writing partial pages may =
decrease reliability and increase wear of NOR flash.
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.8.0-rc2 #53
Hardware name: Atmel SAMx7
[<7000c5d9>] (unwind_backtrace) from [<7000b3ab>] (show_stack+0xb/0xc)
[<7000b3ab>] (show_stack) from [<7000f095>] (__warn+0x89/0xb0)
[<7000f095>] (__warn) from [<7000f0db>] (warn_slowpath_fmt+0x1f/0x28)
[<7000f0db>] (warn_slowpath_fmt) from [<70127e8d>] =
(spi_nor_write+0x57/0xea)
[<70127e8d>] (spi_nor_write) from [<70124593>] (part_write+0x27/0x2a)
[<70124593>] (part_write) from [<70122717>] (mtd_write+0x53/0x68)
[<70122717>] (mtd_write) from [<70130d6b>] (ubi_io_write+0x263/0x448)
[<70130d6b>] (ubi_io_write) from [<7012e9b5>] =
(ubi_eba_write_leb+0x99/0x638)
[<7012e9b5>] (ubi_eba_write_leb) from [<7012dbeb>] =
(ubi_leb_write+0x9b/0xbc)
[<7012dbeb>] (ubi_leb_write) from [<7009dd9d>] =
(ubifs_leb_write+0x65/0xb4)
[<7009dd9d>] (ubifs_leb_write) from [<7009edf3>] =
(ubifs_write_node+0xf7/0x124)
[<7009edf3>] (ubifs_write_node) from [<700a2945>] =
(ubifs_write_master+0x91/0xc8)
[<700a2945>] (ubifs_write_master) from [<7009c64f>] =
(ubifs_mount+0xebf/0x1020)
[<7009c64f>] (ubifs_mount) from [<700555e9>] (mount_fs+0x9/0x60)
[<700555e9>] (mount_fs) from [<7006427b>] (vfs_kern_mount+0x33/0xc0)
[<7006427b>] (vfs_kern_mount) from [<700664c9>] (do_mount+0x599/0x788)
[<700664c9>] (do_mount) from [<7006682b>] (SyS_mount+0x4f/0x6a)
[<7006682b>] (SyS_mount) from [<702d08d1>] (mount_block_root+0xa9/0x1e8)
[<702d08d1>] (mount_block_root) from [<702d0ab1>] =
(prepare_namespace+0x4d/0xf0)
[<702d0ab1>] (prepare_namespace) from [<702d0731>] =
(kernel_init_freeable+0x105/0x14c)
[<702d0731>] (kernel_init_freeable) from [<701c7c6b>] =
(kernel_init+0x7/0xa0)
[<701c7c6b>] (kernel_init) from [<70009c49>] (ret_from_fork+0x11/0x28)
---[ end trace 03245f884d3f082f ]---
UBI DBG gen (pid 1): write 512 bytes to LEB 0:2:23040
UBI DBG eba (pid 1): write 512 bytes at offset 23040 of LEB 0:2, PEB 305
UBI DBG io (pid 1): write 512 bytes to PEB 305:23168
UBI DBG gen (pid 1): read 12 bytes from LEB 0:6:9163
UBI DBG eba (pid 1): read 12 bytes from offset 9163 of LEB 0:6, PEB 302
UBI DBG io (pid 1): read 12 bytes from PEB 302:9291
UBI DBG gen (pid 1): read 12 bytes from LEB 0:6:9151
UBI DBG eba (pid 1): read 12 bytes from offset 9151 of LEB 0:6, PEB 302
UBI DBG io (pid 1): read 12 bytes from PEB 302:9279
UBI DBG gen (pid 1): read 12 bytes from LEB 0:6:9099
UBI DBG eba (pid 1): read 12 bytes from offset 9099 of LEB 0:6, PEB 302
UBI DBG io (pid 1): read 12 bytes from PEB 302:9227
UBI DBG gen (pid 1): read 12 bytes from LEB 0:6:9059
UBI DBG eba (pid 1): read 12 bytes from offset 9059 of LEB 0:6, PEB 302
UBI DBG io (pid 1): read 12 bytes from PEB 302:9187
UBI DBG gen (pid 1): read 16 bytes from LEB 0:6:9043
UBI DBG eba (pid 1): read 16 bytes from offset 9043 of LEB 0:6, PEB 302
UBI DBG io (pid 1): read 16 bytes from PEB 302:9171
UBI DBG gen (pid 1): read 65408 bytes from LEB 0:4:0
UBI DBG eba (pid 1): read 65408 bytes from offset 0 of LEB 0:4, PEB 287
UBI DBG io (pid 1): read 65408 bytes from PEB 287:128
UBI DBG gen (pid 1): read 65408 bytes from LEB 0:5:0
UBI DBG eba (pid 1): read 65408 bytes from offset 0 of LEB 0:5 =
(unmapped)
UBI DBG gen (pid 1): read 34024 bytes from LEB 0:49:31384
UBI DBG eba (pid 1): read 34024 bytes from offset 31384 of LEB 0:49, PEB =
259
UBI DBG io (pid 1): read 34024 bytes from PEB 259:31512
UBI DBG gen (pid 1): read 61064 bytes from LEB 0:79:4344
UBI DBG eba (pid 1): read 61064 bytes from offset 4344 of LEB 0:79, PEB =
282
UBI DBG io (pid 1): read 61064 bytes from PEB 282:4472
UBI DBG gen (pid 1): read 12 bytes from LEB 0:6:9087
UBI DBG eba (pid 1): read 12 bytes from offset 9087 of LEB 0:6, PEB 302
UBI DBG io (pid 1): read 12 bytes from PEB 302:9215
UBI DBG gen (pid 1): read 16 bytes from LEB 0:6:9071
UBI DBG eba (pid 1): read 16 bytes from offset 9071 of LEB 0:6, PEB 302
UBI DBG io (pid 1): read 16 bytes from PEB 302:9199
UBI DBG gen (pid 1): read 12 bytes from LEB 0:6:9139
UBI DBG eba (pid 1): read 12 bytes from offset 9139 of LEB 0:6, PEB 302
UBI DBG io (pid 1): read 12 bytes from PEB 302:9267
UBI DBG gen (pid 1): read 12 bytes from LEB 0:6:9127
UBI DBG eba (pid 1): read 12 bytes from offset 9127 of LEB 0:6, PEB 302
UBI DBG io (pid 1): read 12 bytes from PEB 302:9255
UBI DBG gen (pid 1): read 16 bytes from LEB 0:6:9111
UBI DBG eba (pid 1): read 16 bytes from offset 9111 of LEB 0:6, PEB 302
UBI DBG io (pid 1): read 16 bytes from PEB 302:9239
UBI DBG gen (pid 1): unmap LEB 0:8
UBI DBG gen (pid 1): unmap LEB 0:9
UBI DBG gen (pid 1): unmap LEB 0:81
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS (ubi0:0): LEB size: 65408 bytes (63 KiB), min./max. I/O unit =
sizes: 8 bytes/256 bytes
UBIFS (ubi0:0): FS size: 61614336 bytes (58 MiB, 942 LEBs), journal size =
3074176 bytes (2 MiB, 47 LEBs)
UBIFS (ubi0:0): reserved for root: 2910196 bytes (2841 KiB)
UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), UUID =
C08619AC-1227-4D3B-884F-7E5677BE00AB, small LPT model
