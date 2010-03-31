Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NwyN1-0003Zi-4g
	for linux-mtd@lists.infradead.org; Wed, 31 Mar 2010 13:54:12 +0000
Subject: Re: suspend to disk hangs when running from ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: saeed bishara <saeed.bishara@gmail.com>
In-Reply-To: <1270042736.15073.28.camel@localhost>
References: <c70ff3ad1002230217x1393c41che316e24a47f577ff@mail.gmail.com>
	<1270042736.15073.28.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 31 Mar 2010 16:51:48 +0300
Message-ID: <1270043508.15073.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-03-31 at 16:38 +0300, Artem Bityutskiy wrote:
> On Tue, 2010-02-23 at 12:17 +0200, saeed bishara wrote:
> > Hi,
> > I've installed my rootfs on nand flash with ubifs, when trying to
> > syspend to disk (swap on sata HDD), the system hangs after saving the
> > image, after two minutes I got the message below, if I manually reset
> > the system, it succeeds to resume.
> > please note that the page offset is 0x80000000.
> 
> I guess it is related to the fact that the "ubi_bgt0d" thread is frozen,
> and then the reboot notifier is called and this notifier tries to stop
> the frozen thread.
> 
> Try to comment out thread stopping in the reboot notifier. It is not
> needed anyway.
> 
> But I think I will remove this UBI reboot notifier, because it does not
> solve any problem, and it seems it actually introduces new problems. See
> this post:
> 
> http://lkml.org/lkml/2010/2/12/114
> 
> Thus, if you confirm that commenting out the stuff in the notifier
> helps, I'll remove it.
> 
> CCing Kevin, the original author of the notifier patch.

Now I am actually CCing him.

> 
> > 
> > INFO: task echo:612 blocked for more than 120 seconds.
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > echo          D 8045baa8     0   612    609 0x00020000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8045bcc4>]
> > (schedule_timeout+0x1c/0x21c)
> > [<8045bcc4>] (schedule_timeout+0x1c/0x21c) from [<8045b6b0>]
> > (wait_for_common+0xcc/0x15c)
> > [<8045b6b0>] (wait_for_common+0xcc/0x15c) from [<800897e4>]
> > (kthread_stop+0x7c/0xec)
> > [<800897e4>] (kthread_stop+0x7c/0xec) from [<802d5d88>]
> > (ubi_reboot_notifier+0x20/0x34)
> > [<802d5d88>] (ubi_reboot_notifier+0x20/0x34) from [<8008de04>]
> > (notifier_call_chain+0x2c/0x74)
> > [<8008de04>] (notifier_call_chain+0x2c/0x74) from [<8008e10c>]
> > (__blocking_notifier_call_chain+0x4c/0x68)
> > [<8008e10c>] (__blocking_notifier_call_chain+0x4c/0x68) from
> > [<8008e140>] (blocking_notifier_call_chain+0x18/0x24)
> > [<8008e140>] (blocking_notifier_call_chain+0x18/0x24) from
> > [<80083084>] (kernel_shutdown_prepare+0x20/0x38)
> > [<80083084>] (kernel_shutdown_prepare+0x20/0x38) from [<800830ac>]
> > (kernel_power_off+0x10/0x44)
> > [<800830ac>] (kernel_power_off+0x10/0x44) from [<800a0bac>]
> > (hibernate+0x128/0x1a4)
> > [<800a0bac>] (hibernate+0x128/0x1a4) from [<8009f54c>] (state_store+0x50/0xc4)
> > [<8009f54c>] (state_store+0x50/0xc4) from [<8021d244>]
> > (kobj_attr_store+0x1c/0x28)
> > [<8021d244>] (kobj_attr_store+0x1c/0x28) from [<801265a0>]
> > (sysfs_write_file+0x104/0x13c)
> > [<801265a0>] (sysfs_write_file+0x104/0x13c) from [<800e4e0c>]
> > (vfs_write+0xb0/0x160)
> > [<800e4e0c>] (vfs_write+0xb0/0x160) from [<800e5314>] (sys_write+0x3c/0x6c)
> > [<800e5314>] (sys_write+0x3c/0x6c) from [<80035e40>] (ret_fast_syscall+0x0/0x2c)
> > 
> > here are the states of all the tasks:
> > SysRq : Show Blocked State
> >   task                PC stack   pid father
> > init          D 8045baa8     0     1      0 0x00020000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
> > [<8008ffc0>] (refrigerator+0x9c/0xc8) from [<80038750>]
> > (do_notify_resume+0x48/0x614)
> > [<80038750>] (do_notify_resume+0x48/0x614) from [<80035e8c>]
> > (work_pending+0x1c/0x20)
> > bdi-default   D 8045baa8     0   214      2 0x00000000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
> > [<8008ffc0>] (refrigerator+0x9c/0xc8) from [<800cfa64>]
> > (bdi_forker_task+0x198/0x294)
> > [<800cfa64>] (bdi_forker_task+0x198/0x294) from [<80089a78>] (kthread+0x78/0x80)
> > [<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
> > ksuspend_usbd D 8045baa8     0   229      2 0x00000000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
> > [<8008ffc0>] (refrigerator+0x9c/0xc8) from [<800869bc>]
> > (worker_thread+0xcc/0x200)
> > [<800869bc>] (worker_thread+0xcc/0x200) from [<80089a78>] (kthread+0x78/0x80)
> > [<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
> > khubd         D 8045baa8     0   234      2 0x00000000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
> > [<8008ffc0>] (refrigerator+0x9c/0xc8) from [<80319a10>] (hub_thread+0xcc4/0xd5c)
> > [<80319a10>] (hub_thread+0xcc4/0xd5c) from [<80089a78>] (kthread+0x78/0x80)
> > [<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
> > kswapd0       D 8045baa8     0   274      2 0x00000000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
> > [<8008ffc0>] (refrigerator+0x9c/0xc8) from [<800c7a74>] (kswapd+0x120/0x4c4)
> > [<800c7a74>] (kswapd+0x120/0x4c4) from [<80089a78>] (kthread+0x78/0x80)
> > [<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
> > ubi_bgt0d     D 8045baa8     0   484      2 0x00000000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
> > [<8008ffc0>] (refrigerator+0x9c/0xc8) from [<802dc64c>] (ubi_thread+0x68/0x138)
> > [<802dc64c>] (ubi_thread+0x68/0x138) from [<80089a78>] (kthread+0x78/0x80)
> > [<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
> > usbhid_resume D 8045baa8     0   569      2 0x00000000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
> > [<8008ffc0>] (refrigerator+0x9c/0xc8) from [<800869bc>]
> > (worker_thread+0xcc/0x200)
> > [<800869bc>] (worker_thread+0xcc/0x200) from [<80089a78>] (kthread+0x78/0x80)
> > [<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
> > ubifs_bgt0_0  D 8045baa8     0   601      2 0x00000000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
> > [<8008ffc0>] (refrigerator+0x9c/0xc8) from [<801d3118>]
> > (ubifs_bg_thread+0x58/0x108)
> > [<801d3118>] (ubifs_bg_thread+0x58/0x108) from [<80089a78>] (kthread+0x78/0x80)
> > [<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
> > sh            D 8045baa8     0   609      1 0x00020000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
> > [<8008ffc0>] (refrigerator+0x9c/0xc8) from [<80038750>]
> > (do_notify_resume+0x48/0x614)
> > [<80038750>] (do_notify_resume+0x48/0x614) from [<80035e8c>]
> > (work_pending+0x1c/0x20)
> > flush-ubifs_0 D 8045baa8     0   610      2 0x00000000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8008ffc0>] (refrigerator+0x9c/0xc8)
> > [<8008ffc0>] (refrigerator+0x9c/0xc8) from [<800ff454>]
> > (bdi_writeback_task+0x94/0xbc)
> > [<800ff454>] (bdi_writeback_task+0x94/0xbc) from [<800cf6c0>]
> > (bdi_start_fn+0x64/0xb8)
> > [<800cf6c0>] (bdi_start_fn+0x64/0xb8) from [<80089a78>] (kthread+0x78/0x80)
> > [<80089a78>] (kthread+0x78/0x80) from [<80036e0c>] (kernel_thread_exit+0x0/0x8)
> > echo          D 8045baa8     0   612    609 0x00020000
> > [<8045baa8>] (schedule+0x2e0/0x328) from [<8045bcc4>]
> > (schedule_timeout+0x1c/0x21c)
> > [<8045bcc4>] (schedule_timeout+0x1c/0x21c) from [<8045b6b0>]
> > (wait_for_common+0xcc/0x15c)
> > [<8045b6b0>] (wait_for_common+0xcc/0x15c) from [<800897e4>]
> > (kthread_stop+0x7c/0xec)
> > [<800897e4>] (kthread_stop+0x7c/0xec) from [<802d5d88>]
> > (ubi_reboot_notifier+0x20/0x34)
> > [<802d5d88>] (ubi_reboot_notifier+0x20/0x34) from [<8008de04>]
> > (notifier_call_chain+0x2c/0x74)
> > [<8008de04>] (notifier_call_chain+0x2c/0x74) from [<8008e10c>]
> > (__blocking_notifier_call_chain+0x4c/0x68)
> > [<8008e10c>] (__blocking_notifier_call_chain+0x4c/0x68) from
> > [<8008e140>] (blocking_notifier_call_chain+0x18/0x24)
> > [<8008e140>] (blocking_notifier_call_chain+0x18/0x24) from
> > [<80083084>] (kernel_shutdown_prepare+0x20/0x38)
> > [<80083084>] (kernel_shutdown_prepare+0x20/0x38) from [<800830ac>]
> > (kernel_power_off+0x10/0x44)
> > [<800830ac>] (kernel_power_off+0x10/0x44) from [<800a0bac>]
> > (hibernate+0x128/0x1a4)
> > [<800a0bac>] (hibernate+0x128/0x1a4) from [<8009f54c>] (state_store+0x50/0xc4)
> > [<8009f54c>] (state_store+0x50/0xc4) from [<8021d244>]
> > (kobj_attr_store+0x1c/0x28)
> > [<8021d244>] (kobj_attr_store+0x1c/0x28) from [<801265a0>]
> > (sysfs_write_file+0x104/0x13c)
> > [<801265a0>] (sysfs_write_file+0x104/0x13c) from [<800e4e0c>]
> > (vfs_write+0xb0/0x160)
> > [<800e4e0c>] (vfs_write+0xb0/0x160) from [<800e5314>] (sys_write+0x3c/0x6c)
> > [<800e5314>] (sys_write+0x3c/0x6c) from [<80035e40>] (ret_fast_syscall+0x0/0x2c)
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
