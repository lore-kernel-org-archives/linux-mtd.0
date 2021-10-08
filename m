Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CA5C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 11:21:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F34D60F5B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 11:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F34D60F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GY277/R5Nt+hFPC+6X0oM56zCXMVnkzvtUHN5MHkp8E=; b=iEedLTBuduN9I7
	RoEMTFr1iwJodvLh0FKH6/pl+qshk5B2k57Ne1EwEpmmJrL3vzNnt5fpchxqUB2w0IQqj8uhTi9m/
	oFSnxSZTo4tRBqArwfde7O+dgmep4h0T78WRfu8g+Bth6bN9Ojwxy79MN6tnAhDrnShbqO+tZ68fz
	HqcX6iSuzobklFX9qT/AtMGM4QrTVYfG1FuJ1Cy4ra13KtwXhfxniIuNbXwNTfVuj9MYMmiMiTlJm
	7WhlYnIuqpe+U5/z+YWI7A7q6SKBa7AEzIgxSljigngxzCYO0ZKOkJQdYvIwk1MLqaGTWeEBZQum3
	Hj3DrKM+3LVuSkeYjYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYnvp-002WUM-7V; Fri, 08 Oct 2021 11:20:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYnvl-002WTf-2o
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 11:20:51 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DB6BF1F457E2;
 Fri,  8 Oct 2021 12:20:43 +0100 (BST)
Date: Fri, 8 Oct 2021 13:20:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: use mutex to protect access while in
 suspend
Message-ID: <20211008132038.77231e2a@collabora.com>
In-Reply-To: <20211008100425.uudzlda2n5ojqjzc@skn-laptop>
References: <20211004101246.kagtezizympxupat@skn-laptop>
 <20211004134700.26327f6f@collabora.com>
 <20211005070930.epgxb5qzumk4awxq@skn-laptop>
 <20211005102300.5da6d480@collabora.com>
 <20211005084938.jcbw24umhehoiirs@skn-laptop>
 <20211005105836.6c300f25@collabora.com>
 <20211007114351.3nafhtpefezxhanc@skn-laptop>
 <20211007141858.314533f2@collabora.com>
 <20211007123916.w4oaooxfbawe6yw3@skn-laptop>
 <20211007151426.54db0764@collabora.com>
 <20211008100425.uudzlda2n5ojqjzc@skn-laptop>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_042049_435278_A43BD1D5 
X-CRM114-Status: GOOD (  51.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sean,

On Fri, 8 Oct 2021 12:04:25 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> On Thu, Oct 07, 2021 at 03:14:26PM +0200, Boris Brezillon wrote:
> > On Thu, 7 Oct 2021 14:39:16 +0200
> > Sean Nyekjaer <sean@geanix.com> wrote:
> >   
> > > > 
> > > > wait_queue doesn't really describe what this waitqueue is used for
> > > > (maybe resume_wq), and the suspended state should be here as well
> > > > (actually, there's one already).    
> > > 
> > > I'll rename to something meaningful.  
> > > > 
> > > > Actually, what we need is a way to prevent the device from being
> > > > suspended while accesses are still in progress, and new accesses from
> > > > being queued if a suspend is pending. So, I think you need a readwrite
> > > > lock here:
> > > > 
> > > > * take the lock in read mode for all IO accesses, check the
> > > >   mtd->suspended value
> > > >   - if true, release the lock, and wait (retry on wakeup)
> > > >   - if false, just do the IO
> > > > 
> > > > * take the lock in write mode when you want to suspend/resume the
> > > >   device and update the suspended field. Call wake_up_all() in the
> > > >   resume path    
> > > 
> > > Could we use the chip->lock mutex for this? It's does kinda what you
> > > described above?  
> > 
> > No you can't. Remember I suggested to move all of that logic to
> > mtdcore.c, which doesn't know about the nand_chip struct.
> >   
> > > If we introduce a new lock, do we really need to have the suspended as
> > > an atomic?  
> > 
> > Nope, I thought we could do without a lock, but we actually need to
> > track active IO requests, not just the suspended state.  
> 
> I have only added wait_queue to read and write operations.

It's still racy (see below).

> I'll have a look into where we should add further checks.
> 
> >   
> > > 
> > > I will test with some wait and retry added to nand_get_device().  
> > 
> > Again, I think there's a misunderstanding here: if you move it to the
> > mtd layer, it can't be done in nand_get_device(). But once you've
> > implemented it in mtdcore.c, you should be able to get rid of the
> > nand_chip->suspended field.  
> 
> I have moved the suspended atomic and wake_queue to mtdcore.c.

That doesn't work (see below).

> And kept
> the suspended variable in nand_base as is fine for chip level suspend
> status.

Why? If you handle that at the MTD level you shouldn't need it at the
NAND level? BTW, would you please care to detail your reasoning when
you say you did or didn't do something. It's a bit hard to guess what
led you to this conclusion...

> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index c8fd7f758938..6492071eb4da 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -42,15 +42,24 @@ static int mtd_cls_suspend(struct device *dev)
>  {
>         struct mtd_info *mtd = dev_get_drvdata(dev);
> 
> -       return mtd ? mtd_suspend(mtd) : 0;
> +       if (mtd) {
> +               atomic_inc(&mtd->suspended);
> +               return mtd_suspend(mtd);
> +       }
> +                                                                                                                                                                                                                                                                                                                                                                                             +       return 0;
>  }
> 
>  static int mtd_cls_resume(struct device *dev)
>  {
>         struct mtd_info *mtd = dev_get_drvdata(dev);
> 
> -       if (mtd)
> +       if (mtd) {
>                 mtd_resume(mtd);
> +               atomic_dec(&mtd->suspended);
> +               wake_up_all(&mtd->resume_wq);
> +       }
> +
>         return 0;
>  }
> @@ -678,6 +687,10 @@ int add_mtd_device(struct mtd_info *mtd)
>         if (error)
>                 goto fail_nvmem_add;
> 
> +       init_waitqueue_head(&mtd->resume_wq);
> +
> +       atomic_set(&mtd->suspended, 0);
> +
>         mtd_debugfs_populate(mtd);
> 
>         device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
> @@ -1558,6 +1571,8 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
>         struct mtd_ecc_stats old_stats = master->ecc_stats;
>         int ret_code;
> 
> +       wait_event(mtd->resume_wq, atomic_read(&mtd->suspended) == 0);

That's racy:

thread A			thread B
			   |
enters mtd_read()	   |
passes the !suspended test |
			   |	enters mtd_suspend()
			   |	sets suspended to 1
			   |
starts the IO		   |
			   |	suspends the device
tries to finish the IO	   |
on a suspended device	   |

			 BOOM!


Using an atomic doesn't solve any of that, you really need to make sure
nothing tries to communicate with the device while you're suspending
it, hence the suggestion to use a rw_semaphore to protect against that.

> +
>         ops->retlen = ops->oobretlen = 0;
> 
>         ret_code = mtd_check_oob_ops(mtd, from, ops);
> @@ -1597,6 +1612,8 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
>         struct mtd_info *master = mtd_get_master(mtd);
>         int ret;
> 
> +       wait_event(mtd->resume_wq, atomic_read(&mtd->suspended) == 0);
> +

Please don't open-code this in every IO path, add helpers hiding all the
complexity.

To sum-up, that's more or less what I add in mind:

static void mtd_start_access(struct mtd_info *mtd)
{
	/*
	 * Don't take the suspend_lock on devices that don't
	 * implement the suspend hook. Otherwise, lockdep will
	 * complain about nested locks when trying to suspend MTD
	 * partitions or MTD devices created by gluebi which are
	 * backed by real devices.
	 */
	if (!mtd->_suspend)
		return;

	/*
	 * Wait until the device is resumed. Should we have a
	 * non-blocking mode here?
	 */
	while (1) {
		down_read(&mtd->suspend_lock);
		if (!mtd->suspended)
			return;

		up_read(&mtd->suspend_lock);
		wait_event(mtd->resume_wq, mtd->suspended == false);
	}
}

static void mtd_end_access(struct mtd_info *mtd)
{
	if (!mtd->_suspend)
		return;

	up_read(&mtd->suspend_lock);
}

static void mtd_suspend(struct mtd_info *mtd)
{
	int ret;

	if (!mtd->_suspend)
		return;

	down_write(&mtd->suspend_lock);
	if (mtd->suspended == false) {
		ret = mtd->_suspend(mtd);
		if (!ret)
			mtd->suspended = true;
	}
	up_write(&mtd->suspend_lock);
}

static void mtd_resume(struct mtd_info *mtd)
{
	if (!mtd->_suspend)
		return;

	down_write(&mtd->suspend_lock);
	if (mtd->suspended) {
		if (mtd->_resume)
			mtd->_resume(mtd);

		mtd->suspended = false;

		/* The MTD dev has been resumed, wake up all waiters. */
		wake_up_all(&mtd->resume_wq)
	}
	up_write(&mtd->suspend_lock);
}

You then need to call mtd_{start,end}_access() in all MTD IO path
(read/write/erase and maybe others too).

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
