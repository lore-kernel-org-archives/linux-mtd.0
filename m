Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrMTM-0001k2-HZ
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 08:52:45 +0000
Date: Wed, 28 Oct 2015 09:52:22 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH] mtd: ofpart: drop undocumented, nonfunctional 'lock'
 property
Message-ID: <20151028095222.0d61fb05@bbrezillon>
In-Reply-To: <20151027183244.GU13239@google.com>
References: <1445910966-11415-1-git-send-email-computersforpeace@gmail.com>
 <20151027071106.GI25308@pengutronix.de>
 <20151027183244.GU13239@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Tue, 27 Oct 2015 11:32:44 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi Sascha,
> 
> On Tue, Oct 27, 2015 at 08:11:06AM +0100, Sascha Hauer wrote:
> > On Mon, Oct 26, 2015 at 06:56:06PM -0700, Brian Norris wrote:
> > > The 'lock' property of a partition does nothing, because it effectively
> > > only sets the flags for the partition device, not the master device. And
> > > no MTD driver checks for MTD_POWERUP_LOCK in the partition device, only
> > > the master device.
> > 
> > This is not true. The flag gets checked in add_mtd_device:
> > 
> > 	/* Some chips always power up locked. Unlock them now */
> > 	if ((mtd->flags & MTD_WRITEABLE) && (mtd->flags & MTD_POWERUP_LOCK)) {
> > 		error = mtd_unlock(mtd, 0, mtd->size);
> > 		...
> > 	}
> > 
> > add_mtd_device() is called either for the master mtd device or for each
> > partition (if there are partitions). The flow is like that:
> > 
> > - Some flash devices come up locked from power on. Drivers for these
> >   devices set the MTD_POWERUP_LOCK flag (cfi_cmdset_0001.c,
> >   cfi_cmdset_0002.c)
> > - The partitions inherit the flags from the master device, but not the
> >   ones set in mask_flags:
> > 
> > 	ofpart.c:
> > 
> > 	if (of_get_property(pp, "lock", &len))
> > 		(*pparts)[i].mask_flags |= MTD_POWERUP_LOCK;
> > 
> > 	mtdpart.c:
> > 
> > 	slave->mtd.flags = master->flags & ~part->mask_flags;
> > 
> > - So if the lock property is not set then the MTD_POWERUP_LOCK flag is
> >   still set in add_mtd_device() for the partition and the corresponding
> >   partition is not unlocked. Otherwise the partition is unlocked.
> 
> Wow, you're absolutely correct, and I'm not sure how I overlooked that.
> So I guess this patch [1] should be rewritten to be clearer, and the
> $subject patch dropped.
> 
> > So how I see it the mechanism is still functional, except that it's
> > broken when the recently introduced option MTD_PARTITIONED_MASTER is
> > set. When it's set then add_mtd_device() is called for the master device
> > aswell and the whole device gets unlocked. When the partitions are
> > registered later then it makes no difference whether they are unlocked
> > or not, they are already unlocked anyway.
> 
> It's also broken for overlapping partitions. Similarly to some previous
> proposals for per-partition ECC handling for NAND, I think.

But do we really care about this case? I mean, if someone is stupid
enough to put different values for two overlapping partitions it
won't work correctly. The only thing we could do is complain loudly
about this mismatch.
For the per-partition proposal I posted a few weeks ago I assumed
overlapping partitions with different ECC configs were valid, which
means data will only be readable from one of the partitions: the one
who last wrote data on it (note that this is not true if you're using
raw access mode).

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
