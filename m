Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqFLf-0007gE-Kv
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 08:41:05 +0000
Date: Tue, 21 Mar 2017 09:40:32 +0100
From: Rabin Vincent <rabin.vincent@axis.com>
To: Richard Weinberger <richard@nod.at>
Cc: dedekind1@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubi: fastmap: fix slab corruption
Message-ID: <20170321084032.GA9695@axis.com>
References: <1490023026-6327-1-git-send-email-rabin.vincent@axis.com>
 <3aa6a9f4-97a2-9fc9-9080-6a86ff51bcd8@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aa6a9f4-97a2-9fc9-9080-6a86ff51bcd8@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 20, 2017 at 05:22:24PM +0100, Richard Weinberger wrote:
> Am 20.03.2017 um 16:17 schrieb Rabin Vincent:
> > From: Rabin Vincent <rabinv@axis.com>
> > 
> > Booting with UBI fastmap and SLUB debugging enabled results in the
> > following splats.  The problem is that ubi_scan_fastmap() moves the
> > fastmap blocks from the scan_ai (allocated in scan_fast()) to the ai
> > allocated in ubi_attach().  This results in two problems:
> > 
> >  - When the scan_ai is freed, aebs which were allocated from its slab
> >    cache are still in use.
> > 
> >  - When the other ai is being destroyed in destroy_ai(), the
> >    arguments to kmem_cache_free() call are incorrect since aebs on its
> >    ->fastmap list were allocated with a slab cache from a differnt ai.
> > 
> > Fix this by making a copy of the aebs in ubi_scan_fastmap() instead of
> > moving them.
> 
> Is this new in 4.9? I'm a bit confused because I fixed such SLUB related
> issues some time ago already in Fastmap.

I don't know if it's new on 4.9, I haven't tested fastmap on older kernel
versions.

But it's definitely still present on latest mainline.  Here's an unmodified
v4.11-rc3 on QEMU/kvm with nandsim.

(The lockdep splat seems to be triggered by the slub BUG)

/ # cat /proc/cmdline 
root=/dev/sda console=ttyS0 ip=172.20.0.2 nandsim.first_id_byte=0x20 nandsim.second_id_byte=0x71 ubi.fm_autoconvert=1
/ # ubiattach -p /dev/mtd0 && ubimkvol /dev/ubi0 -N volume_name -s 8MiB && ubidetach -p /dev/mtd0 && ubiattach -p /dev/mtd0
[   10.700709] ubi0: default fastmap pool size: 25
[   10.700947] ubi0: default fastmap WL pool size: 12
[   10.701186] ubi0: attaching mtd0
[   10.702500] ubi0: scanning is finished
[   10.702692] ubi0: empty MTD device detected
[   10.705592] ubi0: attached mtd0 (name "mtdram test device", size 64 MiB)
[   10.705931] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 130944 bytes
[   10.706269] ubi0: min./max. I/O unit sizes: 1/64, sub-page size 1
[   10.706571] ubi0: VID header offset: 64 (aligned 64), data offset: 128
[   10.706892] ubi0: good PEBs: 512, bad PEBs: 0, corrupted PEBs: 0
[   10.707189] ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
[   10.707545] ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 1852986376
[   10.707996] ubi0: available PEBs: 506, total reserved PEBs: 6, PEBs reserved for bad PEB handling: 0
[   10.708494] ubi0: background thread "ubi_bgt0d" started, PID 478
UBI device number 0, total 512 LEBs (67043328 bytes, 63.9 MiB), available 506 LEBs (66257664 bytes, 63.2 MiB), LEB size 130944 bytes (127.9 KiB)
Volume ID 0, size 65 LEBs (8511360 bytes, 8.1 MiB), LEB size 130944 bytes (127.9 KiB), dynamic, name "volume_name", alignment 1
[   10.724388] ubi0: detaching mtd0
[   10.726189] ubi0: mtd0 is detached
[   10.727762] ubi0: default fastmap pool size: 25
[   10.728147] ubi0: default fastmap WL pool size: 12
[   10.728477] ubi0: attaching mtd0
[   10.729687] ubi0: attached by fastmap
[   10.729939] ubi0: fastmap pool size: 25
[   10.730192] ubi0: fastmap WL pool size: 12
[   10.730525] 
[   10.730630] =============================================
[   10.730985] [ INFO: possible recursive locking detected ]
[   10.731337] 4.11.0-rc3 #415 Not tainted
[   10.731592] ---------------------------------------------
[   10.731999] ubiattach/487 is trying to acquire lock:
[   10.732053]  (&(&n->list_lock)->rlock){-.-...}, at: [<ffffffff811901ea>] get_partial_node.isra.72+0x4a/0x4c0
[   10.732053] 
[   10.732053] but task is already holding lock:
[   10.732053]  (&(&n->list_lock)->rlock){-.-...}, at: [<ffffffff81193f8e>] __kmem_cache_shutdown+0x6e/0x430
[   10.732053] 
[   10.732053] other info that might help us debug this:
[   10.732053]  Possible unsafe locking scenario:
[   10.732053] 
[   10.732053]        CPU0
[   10.732053]        ----
[   10.732053]   lock(&(&n->list_lock)->rlock);
[   10.732053]   lock(&(&n->list_lock)->rlock);
[   10.732053] 
[   10.732053]  *** DEADLOCK ***
[   10.732053] 
[   10.732053]  May be due to missing lock nesting notation
[   10.732053] 
[   10.732053] 4 locks held by ubiattach/487:
[   10.732053]  #0:  (ubi_devices_mutex){+.+.+.}, at: [<ffffffff814b10a8>] ctrl_cdev_ioctl+0xa8/0x180
[   10.732053]  #1:  (cpu_hotplug.dep_map){.+.+.+}, at: [<ffffffff8105ae07>] get_online_cpus+0x17/0x70
[   10.732053]  #2:  (slab_mutex){+.+.+.}, at: [<ffffffff8116daf9>] kmem_cache_destroy+0x29/0x120
[   10.732053]  #3:  (&(&n->list_lock)->rlock){-.-...}, at: [<ffffffff81193f8e>] __kmem_cache_shutdown+0x6e/0x430
[   10.732053] 
[   10.732053] stack backtrace:
[   10.732053] CPU: 0 PID: 487 Comm: ubiattach Not tainted 4.11.0-rc3 #415
[   10.732053] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.10.1-0-g8891697-prebuilt.qemu-project.org 04/01/2014
[   10.732053] Call Trace:
[   10.732053]  dump_stack+0x85/0xc2
[   10.732053]  __lock_acquire+0x11f4/0x1ae0
[   10.732053]  lock_acquire+0xcb/0x230
[   10.732053]  ? get_partial_node.isra.72+0x4a/0x4c0
[   10.732053]  _raw_spin_lock+0x3b/0x50
[   10.732053]  ? get_partial_node.isra.72+0x4a/0x4c0
[   10.732053]  get_partial_node.isra.72+0x4a/0x4c0
[   10.732053]  ___slab_alloc.constprop.76+0x1e1/0x4d0
[   10.732053]  ? __kmem_cache_shutdown+0x159/0x430
[   10.732053]  ? find_next_bit+0xb/0x10
[   10.732053]  ? cpumask_next_and+0x30/0x50
[   10.732053]  ? smp_call_function_many+0x62/0x250
[   10.732053]  ? __kmem_cache_shutdown+0x159/0x430
[   10.732053]  __slab_alloc.isra.73.constprop.75+0x55/0xa0
[   10.732053]  __kmalloc+0x1a4/0x2c0
[   10.732053]  ? __kmem_cache_shutdown+0x159/0x430
[   10.732053]  __kmem_cache_shutdown+0x159/0x430
[   10.732053]  kmem_cache_destroy+0x50/0x120
[   10.732053]  destroy_ai+0x2b9/0x2f0
[   10.732053]  ubi_attach+0x37c/0x3d0
[   10.732053]  ubi_attach_mtd_dev+0x5c2/0xdd0
[   10.732053]  ctrl_cdev_ioctl+0xba/0x180
[   10.732053]  do_vfs_ioctl+0x91/0x6a0
[   10.732053]  ? kmem_cache_free+0x28a/0x2c0
[   10.732053]  ? entry_SYSCALL_64_fastpath+0x5/0xc2
[   10.732053]  ? trace_hardirqs_on_caller+0x151/0x1e0
[   10.732053]  SyS_ioctl+0x41/0x70
[   10.732053]  entry_SYSCALL_64_fastpath+0x1f/0xc2
[   10.732053] RIP: 0033:0x7f86e36296c7
[   10.732053] RSP: 002b:00007ffc21cfa4b8 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
[   10.732053] RAX: ffffffffffffffda RBX: 0000000001e54190 RCX: 00007f86e36296c7
[   10.732053] RDX: 00007ffc21cfa4e8 RSI: 0000000040186f40 RDI: 0000000000000003
[   10.732053] RBP: 0000000000000003 R08: 0000000001e54190 R09: 00007ffc21cf9cf1
[   10.732053] R10: 00007ffc21cfa260 R11: 0000000000000206 R12: 00007ffc21cfa3c8
[   10.732053] R13: 00007f86e3ada6a8 R14: 0000000000000000 R15: 0000000000000000
[   10.732053] =============================================================================
[   10.732053] BUG ubi_aeb_slab_cache (Not tainted): Objects remaining in ubi_aeb_slab_cache on __kmem_cache_shutdown()
[   10.732053] -----------------------------------------------------------------------------
[   10.732053] 
[   10.732053] INFO: Slab 0xffffea0000211e80 objects=10 used=1 fp=0xffff88000847a7b0 flags=0x4000000000000100
[   10.732053] CPU: 0 PID: 487 Comm: ubiattach Tainted: G    B           4.11.0-rc3 #415
[   10.732053] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.10.1-0-g8891697-prebuilt.qemu-project.org 04/01/2014
[   10.732053] Call Trace:
[   10.732053]  dump_stack+0x85/0xc2
[   10.732053]  slab_err+0xa1/0xb0
[   10.732053]  ? __kmalloc+0x14c/0x2c0
[   10.732053]  ? __kmem_cache_shutdown+0x159/0x430
[   10.732053]  __kmem_cache_shutdown+0x17d/0x430
[   10.732053]  kmem_cache_destroy+0x50/0x120
[   10.732053]  destroy_ai+0x2b9/0x2f0
[   10.732053]  ubi_attach+0x37c/0x3d0
[   10.732053]  ubi_attach_mtd_dev+0x5c2/0xdd0
[   10.732053]  ctrl_cdev_ioctl+0xba/0x180
[   10.732053]  do_vfs_ioctl+0x91/0x6a0
[   10.732053]  ? kmem_cache_free+0x28a/0x2c0
[   10.732053]  ? entry_SYSCALL_64_fastpath+0x5/0xc2
[   10.732053]  ? trace_hardirqs_on_caller+0x151/0x1e0
[   10.732053]  SyS_ioctl+0x41/0x70
[   10.732053]  entry_SYSCALL_64_fastpath+0x1f/0xc2
[   10.732053] RIP: 0033:0x7f86e36296c7
[   10.732053] RSP: 002b:00007ffc21cfa4b8 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
[   10.732053] RAX: ffffffffffffffda RBX: 0000000001e54190 RCX: 00007f86e36296c7
[   10.732053] RDX: 00007ffc21cfa4e8 RSI: 0000000040186f40 RDI: 0000000000000003
[   10.732053] RBP: 0000000000000003 R08: 0000000001e54190 R09: 00007ffc21cf9cf1
[   10.732053] R10: 00007ffc21cfa260 R11: 0000000000000206 R12: 00007ffc21cfa3c8
[   10.732053] R13: 00007f86e3ada6a8 R14: 0000000000000000 R15: 0000000000000000
[   10.732053] INFO: Object 0xffff88000847a318 @offset=792
[   10.732053] INFO: Allocated in ubi_alloc_aeb+0x22/0x40 age=0 cpu=0 pid=487
[   10.732053] 	___slab_alloc.constprop.76+0x447/0x4d0
[   10.732053] 	__slab_alloc.isra.73.constprop.75+0x55/0xa0
[   10.732053] 	kmem_cache_alloc+0x160/0x280
[   10.732053] 	ubi_alloc_aeb+0x22/0x40
[   10.732053] 	scan_peb+0x3c8/0x6d0
[   10.732053] 	ubi_attach+0x1b5/0x3d0
[   10.732053] 	ubi_attach_mtd_dev+0x5c2/0xdd0
[   10.732053] 	ctrl_cdev_ioctl+0xba/0x180
[   10.732053] 	do_vfs_ioctl+0x91/0x6a0
[   10.732053] 	SyS_ioctl+0x41/0x70
[   10.732053] 	entry_SYSCALL_64_fastpath+0x1f/0xc2
[   10.773394] kmem_cache_destroy ubi_aeb_slab_cache: Slab cache still has objects
[   10.773876] CPU: 0 PID: 487 Comm: ubiattach Tainted: G    B           4.11.0-rc3 #415
[   10.774372] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.10.1-0-g8891697-prebuilt.qemu-project.org 04/01/2014
[   10.775114] Call Trace:
[   10.775278]  dump_stack+0x85/0xc2
[   10.775493]  kmem_cache_destroy+0x10d/0x120
[   10.775767]  destroy_ai+0x2b9/0x2f0
[   10.775993]  ubi_attach+0x37c/0x3d0
[   10.776009]  ubi_attach_mtd_dev+0x5c2/0xdd0
[   10.776009]  ctrl_cdev_ioctl+0xba/0x180
[   10.776009]  do_vfs_ioctl+0x91/0x6a0
[   10.776009]  ? kmem_cache_free+0x28a/0x2c0
[   10.776009]  ? entry_SYSCALL_64_fastpath+0x5/0xc2
[   10.776009]  ? trace_hardirqs_on_caller+0x151/0x1e0
[   10.776009]  SyS_ioctl+0x41/0x70
[   10.776009]  entry_SYSCALL_64_fastpath+0x1f/0xc2
[   10.776009] RIP: 0033:0x7f86e36296c7
[   10.776009] RSP: 002b:00007ffc21cfa4b8 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
[   10.776009] RAX: ffffffffffffffda RBX: 0000000001e54190 RCX: 00007f86e36296c7
[   10.776009] RDX: 00007ffc21cfa4e8 RSI: 0000000040186f40 RDI: 0000000000000003
[   10.776009] RBP: 0000000000000003 R08: 0000000001e54190 R09: 00007ffc21cf9cf1
[   10.776009] R10: 00007ffc21cfa260 R11: 0000000000000206 R12: 00007ffc21cfa3c8
[   10.776009] R13: 00007f86e3ada6a8 R14: 0000000000000000 R15: 0000000000000000
[   10.784528] ubi0: attached mtd0 (name "mtdram test device", size 64 MiB)
[   10.784969] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 130944 bytes
[   10.785406] ubi0: min./max. I/O unit sizes: 1/64, sub-page size 1
[   10.785793] ubi0: VID header offset: 64 (aligned 64), data offset: 128
[   10.786208] ubi0: good PEBs: 512, bad PEBs: 0, corrupted PEBs: 0
[   10.786592] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
[   10.787050] ubi0: max/mean erase counter: 2/1, WL threshold: 4096, image sequence number: 1852986376
[   10.787635] ubi0: available PEBs: 441, total reserved PEBs: 71, PEBs reserved for bad PEB handling: 0
[   10.789008] ubi0: background thread "ubi_bgt0d" started, PID 515
UBI device number 0, total 512 LEBs (67043328 bytes, 63.9 MiB), available 441 LEBs (57746304 bytes, 55.1 MiB), LEB size 130944 bytes (127.9 KiB)
