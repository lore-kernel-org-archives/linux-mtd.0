Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUxGb-0004GV-OY
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 07:03:50 +0000
Received: by ewy23 with SMTP id 23so307649ewy.4
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 23:03:44 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <152584231001121615h2b52b7ddv33980c9c4a88f37b@mail.gmail.com>
References: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
	<152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
	<1263271808.30988.38.camel@localhost.localdomain>
	<152584231001121223q123b5b2flbdd9fcde370c3105@mail.gmail.com>
	<1263331836.3445.4.camel@localhost.localdomain>
	<152584231001121615h2b52b7ddv33980c9c4a88f37b@mail.gmail.com>
Date: Wed, 13 Jan 2010 02:03:43 -0500
Message-ID: <152584231001122303g66f776bdo57f6f08307f77dd0@mail.gmail.com>
Subject: Re: Fail to mount ubifs
From: Jon Ringle <jon@ringle.org>
To: dedekind1@gmail.com, Deepak Saxena <dsaxena@mvista.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I believe that there is an alignment problem due to the read function
mapped to ixp4xx_read16.

I enabled the following:
CONFIG_MTD_UBI_DEBUG=y
CONFIG_MTD_UBI_DEBUG_MSG=y
CONFIG_MTD_UBI_DEBUG_MSG_EBA=y

(initramfs) mount -t ubifs ubi0:ubifs /mnt0
[ 1693.480000] UBI DBG (pid 2323): ubi_open_volume_path: open volume
ubi0:ubifs, mode 1
[ 1693.490000] UBI DBG (pid 2323): ubi_open_volume_nm: open device 0,
volume ubifs, mode 1
[ 1693.490000] UBI DBG (pid 2323): ubi_open_volume: open device 0,
volume 2, mode 1
[ 1693.500000] UBI DBG (pid 2323): ubi_open_volume: open device 0,
volume 2, mode 2
[ 1693.510000] UBI DBG (pid 2323): ubi_is_mapped: test LEB 2:0
<snip...>
[ 1694.130000] UBI DBG (pid 2323): ubi_is_mapped: test LEB 2:109
[ 1694.140000] UBI DBG (pid 2323): ubi_leb_change: atomically write
560 bytes to LEB 2:6
[ 1694.150000] UBI DBG (pid 2323): ubi_eba_atomic_leb_change: change
LEB 2:6, PEB -1, write VID hdr to PEB 5
11 bytes starting at LEB 2:6:545 has the following data:
0xb7 0xe2 0x02 0xd5 0x9f 0x00 0x00 0xe0 0x7f 0x00 0x00

<snip...>
[ 1694.520000] UBI DBG (pid 2323): ubi_leb_read: read 11 bytes from LEB 2:6:545
[ 1694.530000] UBI DBG (pid 2323): ubi_eba_read_leb: read 11 bytes
from offset 545 of LEB 2:6, PEB 5
[ 1694.540000] UBIFS error (pid 2323): check_lpt_crc: invalid crc in
LPT node: crc e2e2 calc e2b7
11 bytes starting at LEB 2:6:545 has the following data:
0xe2 0xe2 0x02 0xd5 0x9f 0x00 0x00 0xe0 0x7f 0x00 0x00

[ 1694.550000] [<c01ca2bc>] (unwind_backtrace+0x0/0x160) from
[<bf096a34>] (check_lpt_crc+0x9c/0xb0 [ubifs])
[ 1694.560000] [<bf096a34>] (check_lpt_crc+0x9c/0xb0 [ubifs]) from
[<bf096f44>] (unpack_ltab+0x114/0x118 [ubifs])
[ 1694.570000] [<bf096f44>] (unpack_ltab+0x114/0x118 [ubifs]) from
[<bf097d28>] (lpt_init_rd+0x110/0x6f8 [ubifs])
[ 1694.580000] [<bf097d28>] (lpt_init_rd+0x110/0x6f8 [ubifs]) from
[<bf098e4c>] (ubifs_lpt_init+0x30/0x54 [ubifs])
[ 1694.590000] [<bf098e4c>] (ubifs_lpt_init+0x30/0x54 [ubifs]) from
[<bf076cb8>] (mount_ubifs+0x368/0x1620 [ubifs])
[ 1694.600000] [<bf076cb8>] (mount_ubifs+0x368/0x1620 [ubifs]) from
[<bf078d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
[ 1694.610000] [<bf078d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
from [<bf078f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs])
[ 1694.620000] [<bf078f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs]) from
[<c023d360>] (vfs_kern_mount+0x68/0x12c)
[ 1694.630000] [<c023d360>] (vfs_kern_mount+0x68/0x12c) from
[<c023d468>] (do_kern_mount+0x34/0xdc)
[ 1694.640000] [<c023d468>] (do_kern_mount+0x34/0xdc) from
[<c0255ad0>] (do_mount+0x210/0x244)
[ 1694.650000] [<c0255ad0>] (do_mount+0x210/0x244) from [<c0255ba0>]
(sys_mount+0x9c/0xd0)
[ 1694.660000] [<c0255ba0>] (sys_mount+0x9c/0xd0) from [<c01c49e0>]
(ret_fast_syscall+0x0/0x2c)

Looking into drivers/mtd/maps/ixp4xx.c I see that the read function is
ixp4xx_read16(). It seems to me that there is an alignment problem.
The read starts at offset 545 which in unaligned with a 16-bit read
that is done by ixp4xx_read16().

Jon
