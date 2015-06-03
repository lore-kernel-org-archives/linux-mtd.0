Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yzw7V-0000Da-Hl
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2015 00:01:22 +0000
Received: by qkhq76 with SMTP id q76so82096646qkh.2
 for <linux-mtd@lists.infradead.org>; Tue, 02 Jun 2015 17:00:59 -0700 (PDT)
Date: Tue, 2 Jun 2015 17:00:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/4] mtd: propagate error codes from add_mtd_device()
Message-ID: <20150603000054.GB4917@ld-irv-0074>
References: <1433200640-17858-1-git-send-email-computersforpeace@gmail.com>
 <1433200640-17858-2-git-send-email-computersforpeace@gmail.com>
 <556D6333.3040209@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <556D6333.3040209@nod.at>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 02, 2015 at 10:02:59AM +0200, Richard Weinberger wrote:
> Am 02.06.2015 um 01:17 schrieb Brian Norris:
> > It makes more sense to return error statuses, not 1/0.
> > 
> > At the same time, note a few places where error handling is not
> > currently done.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/mtdcore.c | 18 +++++++++++-------
> >  drivers/mtd/mtdpart.c |  2 ++
> >  2 files changed, 13 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index f3ca97f139bc..8bbbb751bf45 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -379,8 +379,7 @@ static int mtd_reboot_notifier(struct notifier_block *n, unsigned long state,
> >   *
> >   *	Add a device to the list of MTD devices present in the system, and
> >   *	notify each currently active MTD 'user' of its arrival. Returns
> > - *	zero on success or 1 on failure, which currently will only happen
> > - *	if there is insufficient memory or a sysfs error.
> > + *	zero on success or non-zero on failure.
> >   */
> >  
> >  int add_mtd_device(struct mtd_info *mtd)
> > @@ -394,8 +393,10 @@ int add_mtd_device(struct mtd_info *mtd)
> >  	mutex_lock(&mtd_table_mutex);
> >  
> >  	i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
> > -	if (i < 0)
> > +	if (i < 0) {
> > +		error = i;
> >  		goto fail_locked;
> > +	}
> >  
> >  	mtd->index = i;
> >  	mtd->usecount = 0;
> > @@ -424,6 +425,8 @@ int add_mtd_device(struct mtd_info *mtd)
> >  			printk(KERN_WARNING
> >  			       "%s: unlock failed, writes may not work\n",
> >  			       mtd->name);
> > +		/* Ignore unlock failures? */
> > +		error = 0;
> >  	}
> >  
> >  	/* Caller should have set dev.parent to match the
> > @@ -434,7 +437,8 @@ int add_mtd_device(struct mtd_info *mtd)
> >  	mtd->dev.devt = MTD_DEVT(i);
> >  	dev_set_name(&mtd->dev, "mtd%d", i);
> >  	dev_set_drvdata(&mtd->dev, mtd);
> > -	if (device_register(&mtd->dev) != 0)
> > +	error = device_register(&mtd->dev);
> > +	if (error)
> >  		goto fail_added;
> >  
> >  	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
> > @@ -458,7 +462,7 @@ fail_added:
> >  	idr_remove(&mtd_idr, i);
> >  fail_locked:
> >  	mutex_unlock(&mtd_table_mutex);
> > -	return 1;
> > +	return error;
> >  }
> >  
> >  /**
> > @@ -514,8 +518,8 @@ static int mtd_add_device_partitions(struct mtd_info *mtd,
> >  
> >  	if (nbparts == 0 || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
> >  		ret = add_mtd_device(mtd);
> > -		if (ret == 1)
> > -			return -ENODEV;
> > +		if (ret)
> > +			return ret;
> >  	}
> >  
> >  	if (nbparts > 0) {
> > diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> > index cafdb8855a79..f7aa944bc6e9 100644
> > --- a/drivers/mtd/mtdpart.c
> > +++ b/drivers/mtd/mtdpart.c
> > @@ -610,6 +610,7 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
> >  	list_add(&new->list, &mtd_partitions);
> >  	mutex_unlock(&mtd_partitions_mutex);
> >  
> > +	/* FIXME: handle errors */
> >  	add_mtd_device(&new->mtd);
> >  
> >  	mtd_add_partition_attrs(new);
> > @@ -671,6 +672,7 @@ int add_mtd_partitions(struct mtd_info *master,
> >  		list_add(&slave->list, &mtd_partitions);
> >  		mutex_unlock(&mtd_partitions_mutex);
> >  
> > +		/* FIXME: handle errors */
> >  		add_mtd_device(&slave->mtd);
> >  		mtd_add_partition_attrs(slave);
> >  
> > 
> 
> Do you want this FIXME's have fixed in the 4.2 merge window?
> Adding new FIXME's is IMHO not nice.

Not sure. I really wasn't planning on it, and I admit this was a little
lazy of me.

Now, we're really in no worse of a condition regarding error-handling,
as this was already ignoring error-handling, and to drop this patch
entirely actually masks another class of bugs. But I am adding a new
return condition that would make this deficiency more important in the
next patches...

So which of these options do you like best?
1. take this patch as-is and
   a. fix them in the 4.2 cycle
   b. fix them "sometime" (i.e., never)
2. take this patch without the FIXME's
3. don't take this patch until the FIXME's are resolved

Personally, I guess I'd lean toward #2, and then don't take the next
patches that add new error return cases until I can work out all the
other deficient code paths.

> Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks!

Brian
