Received: from mail.thorsis.com ([213.211.200.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eP3nv-0005S5-GP
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 09:58:22 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 6868B3A39ED
 for <linux-mtd@lists.infradead.org>; Wed, 13 Dec 2017 10:49:35 +0100 (CET)
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZpvwrD644_8 for <linux-mtd@lists.infradead.org>;
 Wed, 13 Dec 2017 10:49:33 +0100 (CET)
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: bad PEBs reservation
Date: Wed, 13 Dec 2017 10:47:38 +0100
Message-ID: <45856732.e5dT5jgfIB@ada>
In-Reply-To: <CAFLxGvxwpRxecRAxtKcsFUoVZwkEOZnnNvuJGTpX0rhdKruLJQ@mail.gmail.com>
References: <e7616db0-aa5a-5270-7bab-55838ec28792@nedap.com>
 <CAFLxGvxwpRxecRAxtKcsFUoVZwkEOZnnNvuJGTpX0rhdKruLJQ@mail.gmail.com>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hei hei,

I hook into this, if you don't mind.

Am Dienstag, 12. Dezember 2017, 17:29:52 CET schrieb Richard Weinberger:
> On Tue, Dec 12, 2017 at 2:14 PM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> > If I see this in my dmesg
> > 
> > ubi0 warning: ubi_eba_init: cannot reserve enough PEBs for bad PEB
> > handling, reserved 35, need 75
> > 
> > Should I worry?
> 
> Yes.

I see this every single boot on systems which have no problems with UBIFS in general.


atmel_nand 40000000.nand: No DMA support for NAND access.
nand: Could not find valid ONFI parameter page; aborting
nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
nand: Hynix NAND 256MiB 3,3V 8-bit
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
atmel_nand 40000000.nand: Use On Flash BBT
Bad block table found at page 131008, version 0x01
Bad block table found at page 130944, version 0x01
nand_read_bbt: bad block at 0x000008a00000
12 cmdlinepart partitions found on MTD device atmel_nand
Creating 12 MTD partitions on "atmel_nand":
0x000000000000-0x000000020000 : "bootstrap"
0x000000020000-0x0000000a0000 : "uboot"
0x0000000a0000-0x0000000e0000 : "env1"
0x0000000e0000-0x000000120000 : "env2"
0x000000120000-0x000000320000 : "kernel_rec"
0x000000320000-0x000000360000 : "fpga_rec"
0x000000360000-0x000003560000 : "rootfs_rec"
0x000003560000-0x000003760000 : "kernel"
0x000003760000-0x0000037a0000 : "fpga"
0x0000037a0000-0x00000ffa0000 : "filesystem"
0x00000ffa0000-0x00000ffc0000 : "rootfs_update_script"
0x00000ffc0000-0x000010000000 : "free"
rtc rtc0: invalid alarm value: 1900-1-14 0:0:0
rtc-at91sam9 fffffd20.rtc: rtc core: registered fffffd20.rtc as rtc0
NET: Registered protocol family 17
ubi0: attaching mtd6
ubi0: MTD device 6 is write-protected, attach in read-only mode
ubi0: scanning is finished
ubi0 warning: 0xc01eba48: cannot reserve enough PEBs for bad PEB handling, reserved 20, need 100
ubi0: attached mtd6 (name "rootfs_rec", size 50 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 512
ubi0: VID header offset: 512 (aligned 512), data offset: 2048
ubi0: good PEBs: 400, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number: 1277399758
ubi0: available PEBs: 0, total reserved PEBs: 400, PEBs reserved for bad PEB handling: 20
ubi0: background thread "ubi_bgt0d" started, PID 39
ubi1: attaching mtd9
ubi1: scanning is finished
ubi1 warning: 0xc01eba48: cannot reserve enough PEBs for bad PEB handling, reserved 74, need 98
ubi1: attached mtd9 (name "filesystem", size 200 MiB)
ubi1: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
ubi1: min./max. I/O unit sizes: 2048/2048, sub-page size 512
ubi1: VID header offset: 512 (aligned 512), data offset: 2048
ubi1: good PEBs: 1598, bad PEBs: 2, corrupted PEBs: 0
ubi1: user volume: 3, internal volumes: 1, max. volumes count: 128
ubi1: max/mean erase counter: 291/181, WL threshold: 4096, image sequence number: 1958819541
ubi1: available PEBs: 0, total reserved PEBs: 1598, PEBs reserved for bad PEB handling: 74
ubi1: background thread "ubi_bgt1d" started, PID 40
input: gpio_keys as /devices/soc0/gpio_keys/input/input0
rtc-at91sam9 fffffd20.rtc: setting system clock to 2017-12-13 09:39:56 UTC (1513157996)
UBIFS (ubi1:1): recovery needed
UBIFS (ubi1:1): recovery deferred
UBIFS (ubi1:1): UBIFS: mounted UBI device 1, volume 1, name "rootfs2", R/O mode
UBIFS (ubi1:1): LEB size: 129024 bytes (126 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
UBIFS (ubi1:1): FS size: 40642560 bytes (38 MiB, 315 LEBs), journal size 5548032 bytes (5 MiB, 43 LEBs)
UBIFS (ubi1:1): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi1:1): media format: w4/r0 (latest is w4/r0), UUID 0AB90A4C-B52A-4FF7-A94D-3311B0AE7CBB, small LPT model
VFS: Mounted root (ubifs filesystem) readonly on device 0:12.
devtmpfs: mounted
Freeing unused kernel memory: 148K
This architecture does not have kernel memory protection.
init started: BusyBox v1.27.2 ()
mounting filesystems...UBIFS (ubi1:2): background thread "ubifs_bgt1_2" started, PID 48
UBIFS (ubi1:2): recovery needed
UBIFS (ubi1:2): recovery completed
UBIFS (ubi1:2): UBIFS: mounted UBI device 1, volume 2, name "data"
UBIFS (ubi1:2): LEB size: 129024 bytes (126 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
UBIFS (ubi1:2): FS size: 89800704 bytes (85 MiB, 696 LEBs), journal size 4515840 bytes (4 MiB, 35 LEBs)
UBIFS (ubi1:2): reserved for root: 4241509 bytes (4142 KiB)
UBIFS (ubi1:2): media format: w4/r0 (latest is w4/r0), UUID C6EEA4E3-F0C1-4350-843D-BACA69995837, small LPT model
done.
remounting root rw...UBIFS (ubi1:1): completing deferred recovery
UBIFS (ubi1:1): background thread "ubifs_bgt1_1" started, PID 51
UBIFS (ubi1:1): deferred recovery completed
done


What is it UBIFS complains about here? In which way is this worrying?

And what can I do about it?

Greets
Alex
