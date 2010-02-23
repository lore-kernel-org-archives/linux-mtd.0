Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Njrpm-0002lp-9Q
	for linux-mtd@lists.infradead.org; Tue, 23 Feb 2010 10:17:47 +0000
Received: by gwj21 with SMTP id 21so890735gwj.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Feb 2010 02:17:40 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 23 Feb 2010 12:17:40 +0200
Message-ID: <c70ff3ad1002230217x1393c41che316e24a47f577ff@mail.gmail.com>
Subject: suspend to disk hangs when running from ubifs
From: saeed bishara <saeed.bishara@gmail.com>
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

Hi,
I've installed my rootfs on nand flash with ubifs, when trying to
syspend to disk (swap on sata HDD), the system hangs after saving the
image, after two minutes I got the message below, if I manually reset
the system, it succeeds to resume.
please note that the page offset is 0x80000000.

INFO: task echo:612 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
echo          D 8045baa8     0   612    609 0x00020000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8045bcc4>]
(schedule_timeout+0x1c/0x21c)
[<8045bcc4>] (schedule_timeout+0x1c/0x21c) from [<8045b6b0>]
(wait_for_common+0xcc/0x15c)
[<8045b6b0>] (wait_for_common+0xcc/0x15c) from [<800897e4>]
(kthread_stop+0x7c/0xec)
[<800897e4>] (kthread_stop+0x7c/0xec) from [<802d5d88>]
(ubi_reboot_notifier+0x20/0x34)
[<802d5d88>] (ubi_reboot_notifier+0x20/0x34) from [<8008de04>]
(notifier_call_chain+0x2c/0x74)
[<8008de04>] (notifier_call_chain+0x2c/0x74) from [<8008e10c>]
(__blocking_notifier_call_chain+0x4c/0x68)
[<8008e10c>] (__blocking_notifier_call_chain+0x4c/0x68) from
[<8008e140>] (blocking_notifier_call_chain+0x18/0x24)
[<8008e140>] (blocking_notifier_call_chain+0x18/0x24) from
[<80083084>] (kernel_shutdown_prepare+0x20/0x38)
[<80083084>] (kernel_shutdown_prepare+0x20/0x38) from [<800830ac>]
(kernel_power_off+0x10/0x44)
[<800830ac>] (kernel_power_off+0x10/0x44) from [<800a0bac>]
(hibernate+0x128/0x1a4)
[<800a0bac>] (hibernate+0x128/0x1a4) from [<8009f54c>] (state_store+0x50/0xc4)
[<8009f54c>] (state_store+0x50/0xc4) from [<8021d244>]
(kobj_attr_store+0x1c/0x28)
[<8021d244>] (kobj_attr_store+0x1c/0x28) from [<801265a0>]
(sysfs_write_file+0x104/0x13c)
[<801265a0>] (sysfs_write_file+0x104/0x13c) from [<800e4e0c>]
(vfs_write+0xb0/0x160)
[<800e4e0c>] (vfs_write+0xb0/0x160) from [<800e5314>] (sys_write+0x3c/0x6c)
[<800e5314>] (sys_write+0x3c/0x6c) from [<80035e40>] (ret_fast_syscall+0x0/0x2c)

here are the states of all the tasks:
SysRq : Show Blocked State
  task                PC stack   pid father
init          D 8045baa8     0     1      0 0x00020000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
[<8008ffc0>] (refrigerator+0x9c/0xc8) from [<80038750>]
(do_notify_resume+0x48/0x614)
[<80038750>] (do_notify_resume+0x48/0x614) from [<80035e8c>]
(work_pending+0x1c/0x20)
bdi-default   D 8045baa8     0   214      2 0x00000000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
[<8008ffc0>] (refrigerator+0x9c/0xc8) from [<800cfa64>]
(bdi_forker_task+0x198/0x294)
[<800cfa64>] (bdi_forker_task+0x198/0x294) from [<80089a78>] (kthread+0x78/0x80)
[<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
ksuspend_usbd D 8045baa8     0   229      2 0x00000000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
[<8008ffc0>] (refrigerator+0x9c/0xc8) from [<800869bc>]
(worker_thread+0xcc/0x200)
[<800869bc>] (worker_thread+0xcc/0x200) from [<80089a78>] (kthread+0x78/0x80)
[<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
khubd         D 8045baa8     0   234      2 0x00000000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
[<8008ffc0>] (refrigerator+0x9c/0xc8) from [<80319a10>] (hub_thread+0xcc4/0xd5c)
[<80319a10>] (hub_thread+0xcc4/0xd5c) from [<80089a78>] (kthread+0x78/0x80)
[<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
kswapd0       D 8045baa8     0   274      2 0x00000000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
[<8008ffc0>] (refrigerator+0x9c/0xc8) from [<800c7a74>] (kswapd+0x120/0x4c4)
[<800c7a74>] (kswapd+0x120/0x4c4) from [<80089a78>] (kthread+0x78/0x80)
[<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
ubi_bgt0d     D 8045baa8     0   484      2 0x00000000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
[<8008ffc0>] (refrigerator+0x9c/0xc8) from [<802dc64c>] (ubi_thread+0x68/0x138)
[<802dc64c>] (ubi_thread+0x68/0x138) from [<80089a78>] (kthread+0x78/0x80)
[<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
usbhid_resume D 8045baa8     0   569      2 0x00000000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
[<8008ffc0>] (refrigerator+0x9c/0xc8) from [<800869bc>]
(worker_thread+0xcc/0x200)
[<800869bc>] (worker_thread+0xcc/0x200) from [<80089a78>] (kthread+0x78/0x80)
[<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
ubifs_bgt0_0  D 8045baa8     0   601      2 0x00000000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
[<8008ffc0>] (refrigerator+0x9c/0xc8) from [<801d3118>]
(ubifs_bg_thread+0x58/0x108)
[<801d3118>] (ubifs_bg_thread+0x58/0x108) from [<80089a78>] (kthread+0x78/0x80)
[<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
sh            D 8045baa8     0   609      1 0x00020000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
[<8008ffc0>] (refrigerator+0x9c/0xc8) from [<80038750>]
(do_notify_resume+0x48/0x614)
[<80038750>] (do_notify_resume+0x48/0x614) from [<80035e8c>]
(work_pending+0x1c/0x20)
flush-ubifs_0 D 8045baa8     0   610      2 0x00000000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
[<8008ffc0>] (refrigerator+0x9c/0xc8) from [<800ff454>]
(bdi_writeback_task+0x94/0xbc)
[<800ff454>] (bdi_writeback_task+0x94/0xbc) from [<800cf6c0>]
(bdi_start_fn+0x64/0xb8)
[<800cf6c0>] (bdi_start_fn+0x64/0xb8) from [<80089a78>] (kthread+0x78/0x80)
[<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
echo          D 8045baa8     0   612    609 0x00020000
[<8045baa8>] (schedule+0x2e0/0x328) from [<8045bcc4>]
(schedule_timeout+0x1c/0x21c)
[<8045bcc4>] (schedule_timeout+0x1c/0x21c) from [<8045b6b0>]
(wait_for_common+0xcc/0x15c)
[<8045b6b0>] (wait_for_common+0xcc/0x15c) from [<800897e4>]
(kthread_stop+0x7c/0xec)
[<800897e4>] (kthread_stop+0x7c/0xec) from [<802d5d88>]
(ubi_reboot_notifier+0x20/0x34)
[<802d5d88>] (ubi_reboot_notifier+0x20/0x34) from [<8008de04>]
(notifier_call_chain+0x2c/0x74)
[<8008de04>] (notifier_call_chain+0x2c/0x74) from [<8008e10c>]
(__blocking_notifier_call_chain+0x4c/0x68)
[<8008e10c>] (__blocking_notifier_call_chain+0x4c/0x68) from
[<8008e140>] (blocking_notifier_call_chain+0x18/0x24)
[<8008e140>] (blocking_notifier_call_chain+0x18/0x24) from
[<80083084>] (kernel_shutdown_prepare+0x20/0x38)
[<80083084>] (kernel_shutdown_prepare+0x20/0x38) from [<800830ac>]
(kernel_power_off+0x10/0x44)
[<800830ac>] (kernel_power_off+0x10/0x44) from [<800a0bac>]
(hibernate+0x128/0x1a4)
[<800a0bac>] (hibernate+0x128/0x1a4) from [<8009f54c>] (state_store+0x50/0xc4)
[<8009f54c>] (state_store+0x50/0xc4) from [<8021d244>]
(kobj_attr_store+0x1c/0x28)
[<8021d244>] (kobj_attr_store+0x1c/0x28) from [<801265a0>]
(sysfs_write_file+0x104/0x13c)
[<801265a0>] (sysfs_write_file+0x104/0x13c) from [<800e4e0c>]
(vfs_write+0xb0/0x160)
[<800e4e0c>] (vfs_write+0xb0/0x160) from [<800e5314>] (sys_write+0x3c/0x6c)
[<800e5314>] (sys_write+0x3c/0x6c) from [<80035e40>] (ret_fast_syscall+0x0/0x2c)
