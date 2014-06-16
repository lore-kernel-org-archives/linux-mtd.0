Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwRjT-0000Mb-1Y
 for linux-mtd@lists.infradead.org; Mon, 16 Jun 2014 07:53:35 +0000
Received: by mail-pd0-f171.google.com with SMTP id fp1so872841pdb.16
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2014 00:53:12 -0700 (PDT)
From: Kevin Hao <haokexin@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd/ftl: fix the double free of buffers
Date: Mon, 16 Jun 2014 15:52:35 +0800
Message-Id: <1402905157-10330-1-git-send-email-haokexin@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I got the following panic on my fsl p5020ds board.

  Unable to handle kernel paging request for data at address 0x7375627379737465
  Faulting instruction address: 0xc000000000100778
  Oops: Kernel access of bad area, sig: 11 [#1]
  SMP NR_CPUS=24 CoreNet Generic
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.15.0-next-20140613 #145
  task: c0000000fe080000 ti: c0000000fe088000 task.ti: c0000000fe088000
  NIP: c000000000100778 LR: c00000000010073c CTR: 0000000000000000
  REGS: c0000000fe08aa00 TRAP: 0300   Not tainted  (3.15.0-next-20140613)
  MSR: 0000000080029000 <CE,EE,ME>  CR: 24ad2e24  XER: 00000000
  DEAR: 7375627379737465 ESR: 0000000000000000 SOFTE: 1 
  GPR00: c0000000000c99b0 c0000000fe08ac80 c0000000009598e0 c0000000fe001d80 
  GPR04: 00000000000000d0 0000000000000913 c000000007902b20 0000000000000000 
  GPR08: c0000000feaae888 0000000000000000 0000000007091000 0000000000200200 
  GPR12: 0000000028ad2e28 c00000000fff4000 c0000000007abe08 0000000000000000 
  GPR16: c0000000007ab160 c0000000007aaf98 c00000000060ba68 c0000000007abda8 
  GPR20: c0000000007abde8 c0000000feaea6f8 c0000000feaea708 c0000000007abd10 
  GPR24: c000000000989370 c0000000008c6228 00000000000041ed c0000000fe00a400 
  GPR28: c00000000017c1cc 00000000000000d0 7375627379737465 c0000000fe001d80 
  NIP [c000000000100778] .__kmalloc_track_caller+0x70/0x168
  LR [c00000000010073c] .__kmalloc_track_caller+0x34/0x168
  Call Trace:
  [c0000000fe08ac80] [c00000000087e6b8] uevent_sock_list+0x0/0x10 (unreliable)
  [c0000000fe08ad20] [c0000000000c99b0] .kstrdup+0x44/0x90
  [c0000000fe08adc0] [c00000000017c1cc] .__kernfs_new_node+0x4c/0x130
  [c0000000fe08ae70] [c00000000017d7e4] .kernfs_new_node+0x2c/0x64
  [c0000000fe08aef0] [c00000000017db00] .kernfs_create_dir_ns+0x34/0xc8
  [c0000000fe08af80] [c00000000018067c] .sysfs_create_dir_ns+0x58/0xcc
  [c0000000fe08b010] [c0000000002c711c] .kobject_add_internal+0xc8/0x384
  [c0000000fe08b0b0] [c0000000002c7644] .kobject_add+0x64/0xc8
  [c0000000fe08b140] [c000000000355ebc] .device_add+0x11c/0x654
  [c0000000fe08b200] [c0000000002b5988] .add_disk+0x20c/0x4b4
  [c0000000fe08b2c0] [c0000000003a21d4] .add_mtd_blktrans_dev+0x340/0x514
  [c0000000fe08b350] [c0000000003a3410] .mtdblock_add_mtd+0x74/0xb4
  [c0000000fe08b3e0] [c0000000003a32cc] .blktrans_notify_add+0x64/0x94
  [c0000000fe08b470] [c00000000039b5b4] .add_mtd_device+0x1d4/0x368
  [c0000000fe08b520] [c00000000039b830] .mtd_device_parse_register+0xe8/0x104
  [c0000000fe08b5c0] [c0000000003b8408] .of_flash_probe+0x72c/0x734
  [c0000000fe08b750] [c00000000035ba40] .platform_drv_probe+0x38/0x84
  [c0000000fe08b7d0] [c0000000003599a4] .really_probe+0xa4/0x29c
  [c0000000fe08b870] [c000000000359d3c] .__driver_attach+0x100/0x104
  [c0000000fe08b900] [c00000000035746c] .bus_for_each_dev+0x84/0xe4
  [c0000000fe08b9a0] [c0000000003593c0] .driver_attach+0x24/0x38
  [c0000000fe08ba10] [c000000000358f24] .bus_add_driver+0x1c8/0x2ac
  [c0000000fe08bab0] [c00000000035a3a4] .driver_register+0x8c/0x158
  [c0000000fe08bb30] [c00000000035b9f4] .__platform_driver_register+0x6c/0x80
  [c0000000fe08bba0] [c00000000084e080] .of_flash_driver_init+0x1c/0x30
  [c0000000fe08bc10] [c000000000001864] .do_one_initcall+0xbc/0x238
  [c0000000fe08bd00] [c00000000082cdc0] .kernel_init_freeable+0x188/0x268
  [c0000000fe08bdb0] [c0000000000020a0] .kernel_init+0x1c/0xf7c
  [c0000000fe08be30] [c000000000000884] .ret_from_kernel_thread+0x58/0xd4
  Instruction dump:
  41bd0010 480000c8 4bf04eb5 60000000 e94d0028 e93f0000 7cc95214 e8a60008 
  7fc9502a 2fbe0000 419e00c8 e93f0022 <7f7e482a> 39200000 88ed06b2 992d06b2 
  ---[ end trace b4c9a94804a42d40 ]---

It seems that the corrupted partition header on my mtd device triggers a bug
in the ftl. Create a patch to fix this. Also include a minor clean up for
ftl_freepart().

Kevin Hao (2):
  mtd/ftl: drop the useless VirtualPageMap in partition_t
  mtd/ftl: fix the double free of the buffers allocated in build_maps()

 drivers/mtd/ftl.c | 4 ----
 1 file changed, 4 deletions(-)

-- 
1.9.3
