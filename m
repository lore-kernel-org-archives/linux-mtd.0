Received: from [97.65.115.18] (helo=mail.grid-net.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T82gH-0006UD-34
 for linux-mtd@lists.infradead.org; Sun, 02 Sep 2012 05:25:10 +0000
Message-ID: <5042EC5D.1010207@grid-net.com>
Date: Sat, 1 Sep 2012 22:19:25 -0700
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: RCU warning during UBI file system mount
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
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

I am running 3.6-rc4 kernel on my MX28 based board and every time I 
mount UBI file system I see following warning.
Anybody else seen this errors, particularly those running it on MXS 
platform?

I haven't debugged RCU warnings before any clues as to what is the 
source of this warning is, should I be looking at 
start_dma_without_bch_irq() code? Would appreciate any pointers in 
fixing this...

[    4.280000] WARNING: at /opt/git/kernel-mainline/kernel/rcutiny.c:75 
rcu_idle_enter_common.clone.7+0x90/0xac()
[    4.280000] Current pid: 1 comm: swapper / Idle pid: 0 comm: swapper
[    4.280000] Modules linked in:
[    4.280000] [<c0014eec>] (unwind_backtrace+0x0/0x130) from 
[<c001dd94>] (warn_slowpath_common+0x4c/0x64)
[    4.280000] [<c001dd94>] (warn_slowpath_common+0x4c/0x64) from 
[<c001de40>] (warn_slowpath_fmt+0x30/0x40)
[    4.280000] [<c001de40>] (warn_slowpath_fmt+0x30/0x40) from 
[<c0061618>] (rcu_idle_enter_common.clone.7+0x90/0xac)
[    4.280000] [<c0061618>] (rcu_idle_enter_common.clone.7+0x90/0xac) 
from [<c0061670>] (rcu_irq_exit+0x3c/0x78)
[    4.280000] [<c0061670>] (rcu_irq_exit+0x3c/0x78) from [<c000fe90>] 
(handle_IRQ+0x34/0x84)
[    4.280000] [<c000fe90>] (handle_IRQ+0x34/0x84) from [<c000ec34>] 
(__irq_svc+0x34/0x58)
[    4.280000] [<c000ec34>] (__irq_svc+0x34/0x58) from [<c0394c4c>] 
(schedule_timeout+0xdc/0x16c)
[    4.280000] [<c0394c4c>] (schedule_timeout+0xdc/0x16c) from 
[<c0395f34>] (wait_for_common+0xb4/0x160)
[    4.280000] [<c0395f34>] (wait_for_common+0xb4/0x160) from 
[<c02579d0>] (start_dma_without_bch_irq+0x6c/0xa8)
[    4.280000] [<c02579d0>] (start_dma_without_bch_irq+0x6c/0xa8) from 
[<c0258660>] (gpmi_send_command+0x120/0x154)
[    4.280000] [<c0258660>] (gpmi_send_command+0x120/0x154) from 
[<c0256fb4>] (gpmi_cmd_ctrl+0x44/0x6c)
[    4.280000] [<c0256fb4>] (gpmi_cmd_ctrl+0x44/0x6c) from [<c024f8e0>] 
(nand_command_lp+0xe8/0x270)
[    4.280000] [<c024f8e0>] (nand_command_lp+0xe8/0x270) from 
[<c0251e00>] (nand_do_read_ops+0x124/0x444)
[    4.280000] [<c0251e00>] (nand_do_read_ops+0x124/0x444) from 
[<c0252558>] (nand_read+0x54/0x78)
[    4.280000] [<c0252558>] (nand_read+0x54/0x78) from [<c02499a4>] 
(part_read+0x48/0x80)
[    4.280000] [<c02499a4>] (part_read+0x48/0x80) from [<c0246910>] 
(mtd_read+0x88/0xb4)
[    4.280000] [<c0246910>] (mtd_read+0x88/0xb4) from [<c026b188>] 
(ubi_io_read+0xb0/0x3e8)
[    4.280000] [<c026b188>] (ubi_io_read+0xb0/0x3e8) from [<c026740c>] 
(ubi_eba_read_leb+0x198/0x4bc)
[    4.280000] [<c026740c>] (ubi_eba_read_leb+0x198/0x4bc) from 
[<c0266800>] (ubi_leb_read+0xf4/0x16c)
[    4.280000] [<c0266800>] (ubi_leb_read+0xf4/0x16c) from [<c0155550>] 
(ubifs_leb_read+0x24/0x88)
[    4.280000] [<c0155550>] (ubifs_leb_read+0x24/0x88) from [<c01572f8>] 
(ubifs_read_node+0xa8/0x2e4)
[    4.280000] [<c01572f8>] (ubifs_read_node+0xa8/0x2e4) from 
[<c0153c50>] (ubifs_read_sb_node+0x54/0x78)
[    4.280000] [<c0153c50>] (ubifs_read_sb_node+0x54/0x78) from 
[<c0154940>] (ubifs_read_superblock+0xc8c/0x133c)
[    4.280000] [<c0154940>] (ubifs_read_superblock+0xc8c/0x133c) from 
[<c01520ac>] (ubifs_mount+0x73c/0x1bc0)
[    4.280000] [<c01520ac>] (ubifs_mount+0x73c/0x1bc0) from [<c00a49ec>] 
(mount_fs+0x44/0x184)
[    4.280000] [<c00a49ec>] (mount_fs+0x44/0x184) from [<c00baf90>] 
(vfs_kern_mount+0x4c/0xc0)
[    4.280000] [<c00baf90>] (vfs_kern_mount+0x4c/0xc0) from [<c00bb1a0>] 
(do_kern_mount+0x34/0xd0)
[    4.280000] [<c00bb1a0>] (do_kern_mount+0x34/0xd0) from [<c00bc93c>] 
(do_mount+0x15c/0x73c)
[    4.280000] [<c00bc93c>] (do_mount+0x15c/0x73c) from [<c00bcfa0>] 
(sys_mount+0x84/0xc4)
[    4.280000] [<c00bcfa0>] (sys_mount+0x84/0xc4) from [<c04e4a04>] 
(do_mount_root+0x24/0xb0)
[    4.280000] [<c04e4a04>] (do_mount_root+0x24/0xb0) from [<c04e4b78>] 
(mount_block_root+0xe8/0x214)
[    4.280000] [<c04e4b78>] (mount_block_root+0xe8/0x214) from 
[<c04e4e28>] (prepare_namespace+0x8c/0x180)
[    4.280000] [<c04e4e28>] (prepare_namespace+0x8c/0x180) from 
[<c04e4894>] (kernel_init+0x16c/0x1b4)
[    4.280000] [<c04e4894>] (kernel_init+0x16c/0x1b4) from [<c000ff70>] 
(kernel_thread_exit+0x0/0x8)
[    4.280000] ---[ end trace 4d36b722759fdc4f ]---
[    4.950000] UBIFS DBG (pid 58): ubifs_bg_thread: background thread 
"ubifs_bgt0_0" started, PID 58

-Subodh
