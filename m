Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecCQn-0003Bh-8f
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 15:48:46 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Bradley Bolen <bradleybolen@gmail.com>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 ezequiel@vanguardiasur.com.ar, stable@vger.kernel.org
Subject: Re: [PATCH] UBI: block: Fix locking for idr_alloc/idr_remove
Date: Thu, 18 Jan 2018 16:49:30 +0100
Message-ID: <1860384.duseTMRpLy@blindfold>
In-Reply-To: <20180118161310.4c1a779a@bbrezillon>
References: <1516283720-11277-1-git-send-email-bbolen@lexmark.com>
 <20180118161310.4c1a779a@bbrezillon>
MIME-Version: 1.0
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

Boris, Bradley,
Am Donnerstag, 18. Januar 2018, 16:13:10 CET schrieb Boris Brezillon:
> On Thu, 18 Jan 2018 08:55:20 -0500
> 
> Bradley Bolen <bradleybolen@gmail.com> wrote:
> > From: Bradley Bolen <bradleybolen@gmail.com>
> > 
> > This fixes a race with idr_alloc where gd->first_minor can be set to the
> > same value for two simultaneous calls to ubiblock_create.  Each instance
> > calls device_add_disk with the same first_minor.  device_add_disk calls
> > bdi_register_owner which generates several warnings.
> > 
> > WARNING: CPU: 1 PID: 179 at kernel-source/fs/sysfs/dir.c:31
> > sysfs_warn_dup+0x68/0x88
> > sysfs: cannot create duplicate filename '/devices/virtual/bdi/252:2'
> > 
> > WARNING: CPU: 1 PID: 179 at kernel-source/lib/kobject.c:240
> > kobject_add_internal+0x1ec/0x2f8
> > kobject_add_internal failed for 252:2 with -EEXIST, don't try to
> > register things with the same name in the same directory
> > 
> > WARNING: CPU: 1 PID: 179 at kernel-source/fs/sysfs/dir.c:31
> > sysfs_warn_dup+0x68/0x88
> > sysfs: cannot create duplicate filename '/dev/block/252:2'
> > 
> > However, device_add_disk does not error out when bdi_register_owner
> > returns an error.  Control continues until reaching blk_register_queue.
> > It then BUGs.
> > 
> > kernel BUG at kernel-source/fs/sysfs/group.c:113!
> > [<c01e26cc>] (internal_create_group) from [<c01e2950>]
> > (sysfs_create_group+0x20/0x24)
> > [<c01e2950>] (sysfs_create_group) from [<c00e3d38>]
> > (blk_trace_init_sysfs+0x18/0x20)
> > [<c00e3d38>] (blk_trace_init_sysfs) from [<c02bdfbc>]
> > (blk_register_queue+0xd8/0x154)
> > [<c02bdfbc>] (blk_register_queue) from [<c02cec84>]
> > (device_add_disk+0x194/0x44c)
> > [<c02cec84>] (device_add_disk) from [<c0436ec8>]
> > (ubiblock_create+0x284/0x2e0)
> > [<c0436ec8>] (ubiblock_create) from [<c0427bb8>]
> > (vol_cdev_ioctl+0x450/0x554)
> > [<c0427bb8>] (vol_cdev_ioctl) from [<c0189110>] (vfs_ioctl+0x30/0x44)
> > [<c0189110>] (vfs_ioctl) from [<c01892e0>] (do_vfs_ioctl+0xa0/0x790)
> > [<c01892e0>] (do_vfs_ioctl) from [<c0189a14>] (SyS_ioctl+0x44/0x68)
> > [<c0189a14>] (SyS_ioctl) from [<c0010640>] (ret_fast_syscall+0x0/0x34)
> > 
> > Locking idr_alloc/idr_remove removes the race and keeps gd->first_minor
> > unique.
> > 
> > Fixes: 2bf50d42f3a4 ("UBI: block: Dynamically allocate minor numbers")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Bradley Bolen <bradleybolen@gmail.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks!

Thanks,
//richard
