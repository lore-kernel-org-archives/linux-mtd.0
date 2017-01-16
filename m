Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cSzqv-0001YJ-U9
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 05:29:11 +0000
Received: by mail-ot0-x244.google.com with SMTP id f9so5640398otd.0
 for <linux-mtd@lists.infradead.org>; Sun, 15 Jan 2017 21:28:48 -0800 (PST)
MIME-Version: 1.0
From: chaitanya vinnakota <chaitanya.sai.v@gmail.com>
Date: Mon, 16 Jan 2017 10:58:47 +0530
Message-ID: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
Subject: UBIFS errors are randomly seen after reboots
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

We are observing  UBIFS and ECC errors randomly even after safe
reboots . We are using a 256M  spansion nand flash and the kernel
version is 3.2.54. These errors disappear upon next reboots and appear
again randomly.

In our test scenario , we've a background process which continuously
writes data to all the available five nand partitions , by creating
files with random sizes in all the partitions. Of all these partitions
rootfs is based on UBIFS and the rest all are yaffs2 based. Now ,
during the file write operation , a reboot is issued . We expect that
file system sync properly happens before the reboot, but at times we
observe UBIFS errors in the subsequent reboots.

We ensured that the reboots are safe based on the umount rc script
which is invoked when reboot is issued. Below is the content of umount
rc script

#!/bin/sh /etc/rc.common
# Copyright (C) 2006 OpenWrt.org

STOP=99
stop() {
        echo "Filesystem sync initiated" > /media/USB/USB1/bootlog
        sync
        echo "Filesystem sync completed" >> /media/USB/USB1/bootlog
        umount -a -d -r
}
When the UBIFS error is reported, mounting the root filesystem fails,
resulting in kernel panic. Strangely , the very next time system
bootup is normal and successful

Below is the UBIFS error log during bootup

[ 6.185055] UBI: default fastmap pool size: 35
[    6.189518] UBI: default fastmap WL pool size: 25
[    6.194238] UBI: attaching mtd4 to ubi0
[    9.453670] UBI: scanning is finished
[    9.508323] UBI: attached mtd4 (name "rootfs1", size 92 MiB) to ubi0
[    9.514704] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    9.521533] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    9.528267] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[    9.535172] UBI: good PEBs: 736, bad PEBs: 0, corrupted PEBs: 0
[    9.541112] UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
[    9.548284] UBI: max/mean erase counter: 21/4, WL threshold: 4096,
image sequence number: 1902060199
[    9.557454] UBI: available PEBs: 0, total reserved PEBs: 736, PEBs
reserved for bad PEB handling: 50
[    9.566652] UBI: background thread "ubi_bgt0d" started, PID 512
[    9.573961] c2k-rtc c2k-rtc: setting system clock to 2012-07-13
12:40:34 UTC (1342183234)
[    9.582193] Registering CPUFreq(comcerto)
[    9.586981] md: Skipping autodetection of RAID arrays.
(raid=autodetect will force)
[   10.428162] UBIFS error (pid 1): ubifs_check_node: bad CRC:
calculated 0xa86e925a, read 0xd9a150bb
[   10.437178] UBIFS error (pid 1): ubifs_check_node: bad node at LEB 526:12240
[   10.444253] UBIFS error (pid 1): ubifs_scanned_corruption:
corruption at LEB 526:12240
[   10.457304] UBIFS error (pid 1): ubifs_scan: LEB 526 scanning failed
[   10.504836] VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0)
[   10.511914] Please append a correct "root=" boot option; here are
the available partitions:
 10.520315] 1f00             512 mtdblock0  (driver?)
[   10.525411] 1f01             512 mtdblock1  (driver?)
[   10.530495] 1f02             128 mtdblock2  (driver?)
[   10.535586] 1f03            8192 mtdblock3  (driver?)
[   10.540669] 1f04           94208 mtdblock4  (driver?)
[   10.545766] 1f05             128 mtdblock5  (driver?)
[   10.550852] 1f06            8192 mtdblock6  (driver?)
[   10.555945] 1f07           94208 mtdblock7  (driver?)
[   10.561027] 1f08             128 mtdblock8  (driver?)
[   10.566117] 1f09            2048 mtdblock9  (driver?)
[   10.571202] 1f0a           12288 mtdblock10  (driver?)
[   10.576379] 1f0b           32768 mtdblock11  (driver?)
[   10.581551] 1f0c            2048 mtdblock12  (driver?)
[   10.586730] 1f0d             128 mtdblock13  (driver?)
[   10.591900] 1f0e             512 mtdblock14  (driver?)
[   10.597079] 1f0f             128 mtdblock15  (driver?)
[   10.602248] 1f10             128 mtdblock16  (driver?)
[   10.607426] 1f11              64 mtdblock17  (driver?)
[   10.612598] 1f12              64 mtdblock18  (driver?)
[   10.617777] 1f13              64 mtdblock19  (driver?)
[   10.622948] 1f14           84320 mtdblock20  (driver?)
[   10.628126] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)
[   10.636423] Backtrace:
[   10.638920] [<c40113a0>] (dump_backtrace+0x0/0x110) from
[<c43fff28>] (dump_stack+0x18/0x1c)
[   10.647393]  r6:c457feb0 r5:e616a000 r4:c45c74f0 r3:c45a2dbc
[   10.653128] [<c43fff10>] (dump_stack+0x0/0x1c) from [<c43fff88>]
(panic+0x5c/0x18c)
[   10.660830] [<c43fff2c>] (panic+0x0/0x18c) from [<c455fd04>]
(mount_block_root+0x23c/0x28c)
[   10.669215]  r3:00000004 r2:00000000 r1:e6035f78 r0:c44ea033
[   10.674948]  r7:c4e25f0d
[   10.677510] [<c455fac8>] (mount_block_root+0x0/0x28c) from
[<c455fe50>] (prepare_namespace+0x98/0x17c)
[   10.686860] [<c455fdb8>] (prepare_namespace+0x0/0x17c) from
[<c455f930>] (kernel_init+0x178/0x1b8)
[   10.695855]  r5:c4587514 r4:c4587514
[   10.699477] [<c455f7b8>] (kernel_init+0x0/0x1b8) from [<c4036bd4>]
(do_exit+0x0/0x6f8)
[   10.707431]  r5:c455f7b8 r4:00000000
[   10.711047] CPU1: stopping
[   10.713763] Backtrace:
[   10.716243] [<c40113a0>] (dump_backtrace+0x0/0x110) from
[<c43fff28>] (dump_stack+0x18/0x1c)
[   10.724707]  r6:fff00100 r5:c45c6ac4 r4:00000001 r3:c45a2dbc
[   10.730442] [<c43fff10>] (dump_stack+0x0/0x1c) from [<c4012e44>]
(handle_IPI+0x100/0x17c)
[   10.738652] [<c4012d44>] (handle_IPI+0x0/0x17c) from [<c4008344>]
(do_IPI+0x10/0x14)
[   10.746420]  r5:60000013 r4:c400e72c
[   10.750029] [<c4008334>] (do_IPI+0x0/0x14) from [<c400d738>]
(__irq_svc+0x38/0x90)
[   10.757624] Exception stack(0xe6067f68 to 0xe6067fb0)
[   10.762696] 7f60:                   00000001 00000000 e6067fb0
00000000 e6066000 c44058a8
[   10.770904] 7f80: c45c6984 c45c6ab4 0400406a 412fc091 00000000
e6067fbc e6067fc0 e6067fb0
[   10.779109] 7fa0: c400e728 c400e72c 60000013 ffffffff
[   10.784185] [<c400e700>] (default_idle+0x0/0x30) from [<c400e90c>]
(cpu_idle+0x84/0xc8)
[   10.792232] [<c400e888>] (cpu_idle+0x0/0xc8) from [<c43fcc0c>]
(secondary_start_kernel+0x140/0x158)
[   10.801306]  r6:10c03c7d r5:c45a8b14 r4:00000002 r3:c45988ac
[   10.807041] [<c43fcacc>] (secondary_start_kernel+0x0/0x158) from
[<043fc4b4>] (0x43fc4b4)
[   10.815244]  r5:00000015 r4:2606806a
[   10.818860] Rebooting in 10 seconds..

Can you please help us in identifying the root cause of this random behavior.

Is the issue with UBIFS or with the nand driver ?

How to ensure that the file system sync and reboot is successful ?

Thanks
Chaitanya
