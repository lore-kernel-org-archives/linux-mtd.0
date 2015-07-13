Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEeCp-0006Rc-Kl
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2015 13:55:40 +0000
Received: by pdrg1 with SMTP id g1so92700150pdr.2
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jul 2015 06:55:18 -0700 (PDT)
Received: from [10.18.0.132] ([115.115.225.206])
 by smtp.googlemail.com with ESMTPSA id si7sm18632895pbc.54.2015.07.13.06.55.16
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jul 2015 06:55:17 -0700 (PDT)
From: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
Subject: UBIFS errors when file-system is full
To: linux-mtd@lists.infradead.org
Message-ID: <55A3C342.9010704@gmail.com>
Date: Mon, 13 Jul 2015 19:25:14 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
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

Facing some issues with UBIFS mounting when NAND flash is almost near to full.

Hardware:
SOC: Freescale Vybrid
COM: Colibri VF50
Flash: Macronic NAND 128MB, 3.3V, 8-Bit

By default the Linux Image flashed on the NAND flash almost occupies ~93% of the flash.
Observed this issue when power resetting the module for about 500 times, with journalctl
enabled, after around 500 power cycles the debug log fills up the nand flash. When the
flash menory is about to full, the ubifs partation is un-mountable.

The nand flash controller driver is under review and passed all MTD tests.
https://lkml.org/lkml/2015/6/18/847


Debug log during UBIFS mounting from U-Boot:

U-Boot 2015.04 (May 18 2015 - 15:37:34)

CPU: Freescale Vybrid VF500 at 396 MHz
Reset cause: POWER ON RESET
DRAM:  128 MiB
NAND:  128 MiB
MMC:   FSL_SDHC: 0
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Model: Toradex Colibri VF50 128MB V1.1A, Serial# 04815679
Net:   FEC
Hit any key to stop autoboot:  0
Booting from NAND...
UBI: default fastmap pool size: 50
UBI: default fastmap WL pool size: 25
UBI: attaching mtd1 to ubi0
UBI: attached by fastmap
UBI: fastmap pool size: 50
UBI: fastmap WL pool size: 25
UBI: attached mtd1 (name "mtd=3", size 126 MiB) to ubi0
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
UBI: good PEBs: 996, bad PEBs: 12, corrupted PEBs: 0
UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 16/1, WL threshold: 4096, image sequence number: 0
UBI: available PEBs: 0, total reserved PEBs: 996, PEBs reserved for bad PEB handling: 8
Error reading superblock on volume 'ubi0:rootfs' errno=-22!
ubifsmount - mount UBIFS volume

Usage:
ubifsmount <volume-name>
     - mount 'volume-name' volume
..

When trying to mount the rootfs from kernel, below are the debug logs:
...
[    2.536651] UBIFS: recovery needed
[    2.748418] UBIFS error (pid 1): ubifs_read_node: bad node type (255 but expected 3)
[    2.766263] UBIFS error (pid 1): ubifs_read_node: bad node at LEB 174:31456, LEB mapping status 1
[    2.785776] Not a node, first 24 bytes:
[    2.789677] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff                          ............
[    2.819565] CPU: 0 PID: 1 Comm: swapper Not tainted 4.0.5-00308-g3f4ae5a-dirty #137
[    2.838793] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[    2.851246] Backtrace:
[    2.859669] [<80011d48>] (dump_backtrace) from [<80011f68>] (show_stack+0x18/0x1c)
[    2.878978]  r7:00000003 r6:00000001 r5:000000ae r4:00007ae0
[    2.890910] [<80011f50>] (show_stack) from [<80659e58>] (dump_stack+0x24/0x28)
[    2.909771] [<80659e34>] (dump_stack) from [<8022fc7c>] (ubifs_read_node+0x270/0x2e8)
[    2.929306] [<8022fa0c>] (ubifs_read_node) from [<8024cc2c>] (ubifs_tnc_read_node+0x128/0x134)
[    2.949832]  r10:85c33800 r9:85c50100 r8:85c33800 r7:87b05000 r6:00000003 r5:85c50100
[    2.970066]  r4:85c33830
[    2.978797] [<8024cb04>] (ubifs_tnc_read_node) from [<80230c80>] (tnc_read_node_nm+0xcc/0x1e4)
[    2.999938]  r7:87b051c0 r6:87b05000 r5:85c50100 r4:85c33830
[    3.012198] [<80230bb4>] (tnc_read_node_nm) from [<80234768>] (ubifs_tnc_next_ent+0x140/0x1a4)
[    3.033218]  r7:87b051c0 r6:87b05000 r5:87849c38 r4:00000030
[    3.045605] [<80234628>] (ubifs_tnc_next_ent) from [<80234880>] (ubifs_tnc_remove_ino+0xb4/0x144)
[    3.067083]  r10:87b05000 r9:00004fa8 r8:ffffffff r7:00000000 r6:0000035a r5:87b05000
[    3.087798]  r4:85c2dda0
[    3.096558] [<802347cc>] (ubifs_tnc_remove_ino) from [<80237338>] (ubifs_replay_journal+0xe68/0x13e4)
[    3.118169]  r10:87b05000 r9:87849d08 r8:85c2dd80 r7:87b05930 r6:0000035a r5:00000000
[    3.138751]  r4:85c2dda0
[    3.147487] [<802364d0>] (ubifs_replay_journal) from [<8022c2d4>] (ubifs_mount+0x10a4/0x165c)
[    3.168197]  r10:87b05190 r9:00000000 r8:00000000 r7:87ba2e00 r6:87b05000 r5:00000000
[    3.188556]  r4:00000000
[    3.197100] [<8022b230>] (ubifs_mount) from [<800c0090>] (mount_fs+0x1c/0xac)
[    3.210325]  r10:00008001 r9:00000060 r8:808ab5fc r7:808ab5fc r6:00008001 r5:87bf9b40
[    3.230371]  r4:87bad240
[    3.238886] [<800c0074>] (mount_fs) from [<800d72b0>] (vfs_kern_mount+0x50/0xfc)
[    3.258022]  r8:00000000 r7:808ab5fc r6:00008001 r5:87bf9b40 r4:87bad240
[    3.271099] [<800d7260>] (vfs_kern_mount) from [<800d9f7c>] (do_mount+0x19c/0x9a4)
[    3.290436]  r9:00000060 r8:87bf9b00 r7:87bf9b40 r6:808a3700 r5:00000000 r4:808ab5fc
[    3.310434] [<800d9de0>] (do_mount) from [<800daac0>] (SyS_mount+0x7c/0xa8)
[    3.323536]  r10:87bf7000 r9:80890ac8 r8:00008001 r7:807b13c8 r6:00000000 r5:87bf9b40
[    3.343701]  r4:87bf9b00
[    3.352210] [<800daa44>] (SyS_mount) from [<808631f0>] (mount_block_root+0x144/0x270)
[    3.371858]  r8:87de9ee0 r7:87bf7000 r6:80890ab8 r5:87bf7000 r4:00008001
[    3.385037] [<808630ac>] (mount_block_root) from [<808635d0>] (prepare_namespace+0xb0/0x1dc)
[    3.405619]  r10:80890a94 r9:808625ec r8:000000bc r7:808d0f80 r6:80890ac8 r5:80890ab8
[    3.425843]  r4:80890ab8
[    3.434380] [<80863520>] (prepare_namespace) from [<80862e98>] (kernel_init_freeable+0x1bc/0x1d0)
[    3.455407]  r6:808d0f80 r5:00000008 r4:80899580
[    3.466313] [<80862cdc>] (kernel_init_freeable) from [<8065755c>] (kernel_init+0x18/0xf0)
[    3.486629]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:80657544
[    3.507136]  r4:808d0f80
[    3.515803] [<80657544>] (kernel_init) from [<8000e8c8>] (ret_from_fork+0x14/0x2c)
[    3.535434]  r5:80657544 r4:00000000
...

Does any one observed the same issue with UBIFS when the flash memory is full?

Best regards,
Bhuvan
