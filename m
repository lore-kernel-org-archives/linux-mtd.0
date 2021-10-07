Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A05C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:19:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECFFE60F90
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECFFE60F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwOnIZM3KqH3wDpPmgIbXy106b59T+cNRNAT66Yu3QQ=; b=e+/KXbwrLNGM1k
	LscIcbKuuzmplHmx/iTVbzFV1t4lDOV6gSNDQWShSbmVN0x3ooH6CoFOCWI/XGWnIM9+F4Lyh9INq
	A+gRmgWwpeLzocmmViIgMjD+VYs9cWxRMzcU0oqHqdygsxtl/C/OrY/xkY0wfSWr7PSn8Y+J3761c
	8jvvsJF524VwM0CEEzUAEaAgMxUQYylz8Z0gDdQ/U2cgefe+YWYx5i2PAHIqOrwtCyZ1x8Gs/vAWl
	YDxKBA8SNu6tFbS9iSA4Tn7Bfg/xkyi3it7uO6LbgV1+EVZdFo+Ojmoiv1AdzlMyGlGYgySQEuliI
	YUGrrdE1YbhnH2PeOqvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYSMj-00HEgN-F6; Thu, 07 Oct 2021 12:19:13 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYSMd-00HEf4-Qd
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 12:19:10 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7BFC71F450CC;
 Thu,  7 Oct 2021 13:19:04 +0100 (BST)
Date: Thu, 7 Oct 2021 14:18:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: use mutex to protect access while in
 suspend
Message-ID: <20211007141858.314533f2@collabora.com>
In-Reply-To: <20211007114351.3nafhtpefezxhanc@skn-laptop>
References: <20211004065608.3190348-1-sean@geanix.com>
 <20211004104147.579f3b01@collabora.com>
 <20211004085509.iikxtdvxpt6bri5c@skn-laptop>
 <20211004115817.18739936@collabora.com>
 <20211004101246.kagtezizympxupat@skn-laptop>
 <20211004134700.26327f6f@collabora.com>
 <20211005070930.epgxb5qzumk4awxq@skn-laptop>
 <20211005102300.5da6d480@collabora.com>
 <20211005084938.jcbw24umhehoiirs@skn-laptop>
 <20211005105836.6c300f25@collabora.com>
 <20211007114351.3nafhtpefezxhanc@skn-laptop>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_051908_218774_D57E641C 
X-CRM114-Status: GOOD (  58.45  )
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

On Thu, 7 Oct 2021 13:43:51 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> On Tue, Oct 05, 2021 at 10:58:36AM +0200, Boris Brezillon wrote:
> > On Tue, 5 Oct 2021 10:49:38 +0200
> > Sean Nyekjaer <sean@geanix.com> wrote:
> >   
> > > On Tue, Oct 05, 2021 at 10:23:00AM +0200, Boris Brezillon wrote:  
> > > > On Tue, 5 Oct 2021 09:09:30 +0200
> > > > Sean Nyekjaer <sean@geanix.com> wrote:    
> > > 
> > > [ ... ]
> > >   
> > > > > 
> > > > > Have you seen the reproducer script?    
> > > > 
> > > > How would I know about this script or your previous attempt (mentioned
> > > > at the end of this email) given I was not Cc-ed on the previous
> > > > discussion, and nothing mentions it in this RFC...
> > > >     
> > > 
> > > That's why I shared it here ;)
> > > Initially I thought this was a bug introduced by exec_op.
> > >   
> > > > > ---
> > > > > root@iwg26-v1:/data/root# cat /data/crash.sh
> > > > > #!/bin/sh -x
> > > > > 
> > > > > echo enabled > /sys/devices/platform/soc/2100000.bus/21f4000.serial/tty/ttymxc4/power/wakeup
> > > > > 
> > > > > rm /data/test50M
> > > > > dd if=/dev/urandom of=/tmp/test50M bs=1M count=50
> > > > > cp /tmp/test50M /data/ &
> > > > > sleep 1
> > > > > echo mem > /sys/power/state
> > > > > ---
> > > > > 
> > > > > As seen in the log above disk is synced before suspend.
> > > > > cp is continuing to copy data to ubifs.
> > > > > And then user space processes are frozen.
> > > > > At this point the kernel thread would have unwritten data.
> > > > > 
> > > > > We tried to solve this with:
> > > > > https://lkml.org/lkml/2021/9/1/280    
> > > > 
> > > > I see. It's still unclear to me when the write happens. Is it in the
> > > > suspend path (before the system is actually suspended), or in the
> > > > resume path (when the system is being resumed).
> > > > 
> > > > Anyway, let's admit writing to a storage device while it's suspended is
> > > > a valid use case and requires the storage layer to put this request on
> > > > old. This wait should not, IMHO, be handled at the NAND level, but at
> > > > the MTD level (using a waitqueue, and an atomic to make
> > > > suspended/resumed transitions safe). And abusing a mutex to implement
> > > > that is certainly not a good idea.    
> > > 
> > > I did't say this was the right solution ;) I actually asked in the RFC:
> > > "Should we introduce a new mutex? Or maybe a spin_lock?"
> > > 
> > > What are you proposing, a waitqueue in mtd_info? That gets checked in
> > > mtd_write()/mtd_read()?  
> > 
> > Yes, and replacing the suspended state by an atomic, and providing a
> > helper to wait on the device readiness. Helper you will call in every
> > path involving a communication with the HW, not just mtd_read/write()
> > (you're missing erase at least, and I fear there are other hooks that
> > might lead to commands being issued to the device). But before we get
> > there, I think it's important to understand what the kernel expects.
> > IOW, if and when threads can do a request on a suspended device, and
> > when it's acceptable to wait (vs returning -EBUSY), otherwise I fear
> > we'll end up with deadlocks in the suspend/resume path.  
> 
> I have a proposal [0] and yes I have ended up in many deadlocks during
> testing. The hardest part is the locking when going into suspend.
> I'm not sure the wait_queue is initialized the right place :)
> And I'm kinda abusing the nand_get_device() for this...
> 
> Who do you think we should add to the discussion?
> 
> /Sean
> 
> [0]:
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 3d6c6e880520..735dfff18143 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c

As I said previously, I think this should be handled MTD level
(drivers/mtd/mtdcore.c) not in the raw NAND framework.

> @@ -337,11 +337,10 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
>   */
>  static int nand_get_device(struct nand_chip *chip)
>  {
> +       struct mtd_info *mtd = nand_to_mtd(chip);
> +
> +       wait_event(mtd->wait_queue, atomic_read(&chip->suspended) == 0);
>         mutex_lock(&chip->lock);
> -       if (chip->suspended) {
> -               mutex_unlock(&chip->lock);
> -               return -EBUSY;
> -       }

There's a race here: the device might enter suspend again before you're
able to acquire the lock.

>         mutex_lock(&chip->controller->lock);
> 
>         return 0;
> @@ -4562,11 +4561,15 @@ static int nand_suspend(struct mtd_info *mtd)
>         struct nand_chip *chip = mtd_to_nand(mtd);
>         int ret = 0;
> 
> +       atomic_inc(&chip->suspended);
>         mutex_lock(&chip->lock);

And it's racy here as well: you mark the device as suspended before you
even acquired the lock.

>         if (chip->ops.suspend)
>                 ret = chip->ops.suspend(chip);
> -       if (!ret)
> -               chip->suspended = 1;
> +       if (ret) {
> +               /* Wake things up again if suspend fails */
> +               atomic_dec(&chip->suspended);
> +               wake_up(&mtd->wait_queue);
> +       }
>         mutex_unlock(&chip->lock);
> 
>         return ret;
> @@ -4581,10 +4584,12 @@ static void nand_resume(struct mtd_info *mtd)
>         struct nand_chip *chip = mtd_to_nand(mtd);
> 
>         mutex_lock(&chip->lock);
> -       if (chip->suspended) {
> +       if (atomic_read(&chip->suspended)) {
>                 if (chip->ops.resume)
>                         chip->ops.resume(chip);
> -               chip->suspended = 0;
> +
> +               atomic_dec(&chip->suspended);
> +               wake_up(&mtd->wait_queue);
>         } else {
>                 pr_err("%s called for a chip which is not in suspended state\n",
>                         __func__);
> @@ -5099,6 +5104,9 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>         pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
>                 (int)(targetsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
>                 mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
> +
> +       init_waitqueue_head(&mtd->wait_queue);
> +

It's an MTD field. It should be initialized somewhere in mtdcore.c.

>         return 0;
> 
>  free_detect_allocation:
> @@ -6264,6 +6272,8 @@ static int nand_scan_tail(struct nand_chip *chip)
>         if (chip->options & NAND_SKIP_BBTSCAN)
>                 return 0;
> 
> +       atomic_set(&chip->suspended, 0);
> +
>         /* Build bad block table */
>         ret = nand_create_bbt(chip);
>         if (ret)
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 88227044fc86..f7dcbc336170 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -360,6 +360,8 @@ struct mtd_info {
>         int (*_get_device) (struct mtd_info *mtd);
>         void (*_put_device) (struct mtd_info *mtd);
> 
> +       wait_queue_head_t wait_queue;
> +

wait_queue doesn't really describe what this waitqueue is used for
(maybe resume_wq), and the suspended state should be here as well
(actually, there's one already).

Actually, what we need is a way to prevent the device from being
suspended while accesses are still in progress, and new accesses from
being queued if a suspend is pending. So, I think you need a readwrite
lock here:

* take the lock in read mode for all IO accesses, check the
  mtd->suspended value
  - if true, release the lock, and wait (retry on wakeup)
  - if false, just do the IO

* take the lock in write mode when you want to suspend/resume the
  device and update the suspended field. Call wake_up_all() in the
  resume path

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
