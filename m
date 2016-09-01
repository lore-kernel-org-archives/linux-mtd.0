Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfORR-00033T-P0
 for linux-mtd@lists.infradead.org; Thu, 01 Sep 2016 09:37:51 +0000
Received: by mail-wm0-x241.google.com with SMTP id v143so1158234wmv.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Sep 2016 02:37:29 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Micron qspi nor flash and UBIFS
From: Andras Szemzo <szemzo.andras@gmail.com>
In-Reply-To: <CAFLxGvzmRPaNFqzYubCo2_mB9W4inja_J9YM7rUay_9TpJBmCA@mail.gmail.com>
Date: Thu, 1 Sep 2016 11:37:26 +0200
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB87F86A-3E14-4091-B669-6C325085F397@gmail.com>
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

Hi Richard,

>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 97 at drivers/mtd/spi-nor/spi-nor.c:1177 =
0x70126acd
>> Writing at offset 64 into a NOR page. Writing partial pages may =
decrease reliability and increase wear of NOR flash.
>> Modules linked in:
>> CPU: 0 PID: 97 Comm: ubimkvol Not tainted 4.8.0-rc2 #46
>> Hardware name: Atmel SAMx7
>> Function entered at [<7000c539>] from [<7000b30b>]
>> Function entered at [<7000b30b>] from [<7000eff5>]
>> Function entered at [<7000eff5>] from [<7000f03b>]
>> Function entered at [<7000f03b>] from [<70126acd>]
>> Function entered at [<70126acd>] from [<701231d3>]
>> Function entered at [<701231d3>] from [<7012135b>]
>> Function entered at [<7012135b>] from [<7012ee33>]
>> Function entered at [<7012ee33>] from [<7012f1b3>]
>> Function entered at [<7012f1b3>] from [<7012d79f>]
>> Function entered at [<7012d79f>] from [<70127c73>]
>> Function entered at [<70127c73>] from [<701280ad>]
>> Function entered at [<701280ad>] from [<70129123>]
>> Function entered at [<70129123>] from [<7012b331>]
>> Function entered at [<7012b331>] from [<7005b733>]
>> Function entered at [<7005b733>] from [<7005bbed>]
>> Function entered at [<7005bbed>] from [<7005bc2f>]
>> Function entered at [<7005bc2f>] from [<70009b01>]
>=20
> Can you please resolve this addresses or re-try using a kernel with
> debug symbols available?
> I'd like to see which UBI function triggers this exactly.

Sure, here is the warning with symbols:


UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 47
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/mtd/spi-nor/spi-nor.c:1177 =
spi_nor_write+0x57/0xea
Writing at offset 128 into a NOR page. Writing partial pages may =
decrease reliability and increase wear of NOR flash.
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.8.0-rc2 #49
Hardware name: Atmel SAMx7
[<7000c5d9>] (unwind_backtrace) from [<7000b3ab>] (show_stack+0xb/0xc)
[<7000b3ab>] (show_stack) from [<7000f095>] (__warn+0x89/0xb0)
[<7000f095>] (__warn) from [<7000f0db>] (warn_slowpath_fmt+0x1f/0x28)
[<7000f0db>] (warn_slowpath_fmt) from [<70127e8d>] =
(spi_nor_write+0x57/0xea)
[<70127e8d>] (spi_nor_write) from [<70124593>] (part_write+0x27/0x2a)
[<70124593>] (part_write) from [<70122717>] (mtd_write+0x53/0x68)
[<70122717>] (mtd_write) from [<701301f3>] (ubi_io_write+0x23f/0x410)
[<701301f3>] (ubi_io_write) from [<7012e0f7>] =
(ubi_eba_write_leb+0x77/0x5fc)
[<7012e0f7>] (ubi_eba_write_leb) from [<7012d4c1>] =
(ubi_leb_write+0x71/0x8a)
[<7012d4c1>] (ubi_leb_write) from [<7009dd9d>] =
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
[<7006682b>] (SyS_mount) from [<702cd8d1>] (mount_block_root+0xa9/0x1e8)
[<702cd8d1>] (mount_block_root) from [<702cdab1>] =
(prepare_namespace+0x4d/0xf0)
[<702cdab1>] (prepare_namespace) from [<702cd731>] =
(kernel_init_freeable+0x105/0x14c)
[<702cd731>] (kernel_init_freeable) from [<701c67db>] =
(kernel_init+0x7/0xa0)
[<701c67db>] (kernel_init) from [<70009c49>] (ret_from_fork+0x11/0x28)
---[ end trace 2e116942d019d348 ]---
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS (ubi0:0): LEB size: 65408 bytes (63 KiB), min./max. I/O unit =
sizes: 8 bytes/256 bytes
UBIFS (ubi0:0): FS size: 61614336 bytes (58 MiB, 942 LEBs), journal size =
3074176 bytes (2 MiB, 47 LEBs)
UBIFS (ubi0:0): reserved for root: 2910196 bytes (2841 KiB)
UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), UUID =
C08619AC-1227-4D3B-884F-7E5677BE00AB, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:12.
