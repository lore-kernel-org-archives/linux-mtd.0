Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr93T-0007tr-6E
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 18:33:08 +0000
Received: by pabla5 with SMTP id la5so36822981pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2015 11:32:46 -0700 (PDT)
Date: Tue, 27 Oct 2015 11:32:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Michal Suchanek <hramrach@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: ofpart: drop undocumented, nonfunctional 'lock'
 property
Message-ID: <20151027183244.GU13239@google.com>
References: <1445910966-11415-1-git-send-email-computersforpeace@gmail.com>
 <20151027071106.GI25308@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151027071106.GI25308@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

On Tue, Oct 27, 2015 at 08:11:06AM +0100, Sascha Hauer wrote:
> On Mon, Oct 26, 2015 at 06:56:06PM -0700, Brian Norris wrote:
> > The 'lock' property of a partition does nothing, because it effectively
> > only sets the flags for the partition device, not the master device. And
> > no MTD driver checks for MTD_POWERUP_LOCK in the partition device, only
> > the master device.
> 
> This is not true. The flag gets checked in add_mtd_device:
> 
> 	/* Some chips always power up locked. Unlock them now */
> 	if ((mtd->flags & MTD_WRITEABLE) && (mtd->flags & MTD_POWERUP_LOCK)) {
> 		error = mtd_unlock(mtd, 0, mtd->size);
> 		...
> 	}
> 
> add_mtd_device() is called either for the master mtd device or for each
> partition (if there are partitions). The flow is like that:
> 
> - Some flash devices come up locked from power on. Drivers for these
>   devices set the MTD_POWERUP_LOCK flag (cfi_cmdset_0001.c,
>   cfi_cmdset_0002.c)
> - The partitions inherit the flags from the master device, but not the
>   ones set in mask_flags:
> 
> 	ofpart.c:
> 
> 	if (of_get_property(pp, "lock", &len))
> 		(*pparts)[i].mask_flags |= MTD_POWERUP_LOCK;
> 
> 	mtdpart.c:
> 
> 	slave->mtd.flags = master->flags & ~part->mask_flags;
> 
> - So if the lock property is not set then the MTD_POWERUP_LOCK flag is
>   still set in add_mtd_device() for the partition and the corresponding
>   partition is not unlocked. Otherwise the partition is unlocked.

Wow, you're absolutely correct, and I'm not sure how I overlooked that.
So I guess this patch [1] should be rewritten to be clearer, and the
$subject patch dropped.

> So how I see it the mechanism is still functional, except that it's
> broken when the recently introduced option MTD_PARTITIONED_MASTER is
> set. When it's set then add_mtd_device() is called for the master device
> aswell and the whole device gets unlocked. When the partitions are
> registered later then it makes no difference whether they are unlocked
> or not, they are already unlocked anyway.

It's also broken for overlapping partitions. Similarly to some previous
proposals for per-partition ECC handling for NAND, I think.

When first looking at this property (and not understanding how exactly
it worked), I was wondering why there's a per-partition property but not
a per-device property. It seems that if there were a whole device
property, then one could use 'lock' for the whole device (and then
provide partition(s) which do not have the 'lock' property) in order to
get this behavior on PARTITIONED_MASTER.

I guess if one is really interested in fixing 'lock' for
PARTITIONED_MASTER, and we don't want to introduce DT "ABI" changes, we
can just have any partition that has the 'lock' flag mask the
POWERUP_LOCK flag in its parent (master) device. That seems like a
reasonable request.

(It also still seems reasonable to support the 'lock' flag in the parent
device, in case someone is not using ofpart.)

Brian

[1] http://patchwork.ozlabs.org/patch/508356/
