Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77A3C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:40:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50BCD6105A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50BCD6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klvfw9henW3sGSZr23p10SeqrJqNKvlvLjfJY4wyibw=; b=t9WZoxu8qCazt2
	AVPEQpD9tgK6YYoU3nXNbZqax8mUAsS7HpiDp+G/hV0WZbphFMBOianZ/+L+GruICAe2xmJBhLVQj
	bXIFi4ee6zie6zhYSs2MBq9+r+29J4E5JC0AXPJgyckofMhrgY18OOpiO9AwYM1ZbzzmJltGK24Iq
	3FAnl/U6looYa1uz7VpIysVQ4OR1HMEzqDNFtB61dVls7Zwf0Kcxq7GUUPyJw5EAUnVI1VQRuKUlW
	KXTvs5CcoTmGs3fQ74HRNgLvUn4mA9D4agP2fGoYIcRNWeMEPHsVh/QjTDc1BZjoxU0R3VmM7+RnW
	Z3ljnQJJtSeVsFWNCz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYSgI-00HJ4R-IE; Thu, 07 Oct 2021 12:39:26 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYSgC-00HJ29-4N
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 12:39:22 +0000
Received: from skn-laptop (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 6747FC38AD;
 Thu,  7 Oct 2021 12:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1633610357; bh=gap7Kd40aiSOak1xNMAurxLqrfVo/s5iZGzZdq6IBm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ZtSPiNmlrjmHUMzlTsujBrrcz+58ly2fhLzSb/Vf82OTurAWrbWVfvXDJ3ID7TvCD
 1RWTYm0nUTAgXjThvBXSQ/zqdiYy3VtX10k5F15hfrB5GWEFSzW3G5BjPhooxPWm1k
 JIfVDMSdcawkbZ94mkauxPkw8ret/TPyRpKs6T4ai1SH8Gksw4XWiYOF6wnTQsaXGv
 Hau/mUiH5dlWnAEqmC0BsqfXnRTjdzPljXjK+Gp09KEgJJNocjKdoa7Fdf1FbsRd/l
 iUhj3DhTGkxCrABQEbQ2IOsVSVVugTffuEPB0bO5V1W+TkP8lRJyFW6x1CJ0D6KZ6E
 B+ezAs1wIDjYg==
Date: Thu, 7 Oct 2021 14:39:16 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: use mutex to protect access while in
 suspend
Message-ID: <20211007123916.w4oaooxfbawe6yw3@skn-laptop>
References: <20211004085509.iikxtdvxpt6bri5c@skn-laptop>
 <20211004115817.18739936@collabora.com>
 <20211004101246.kagtezizympxupat@skn-laptop>
 <20211004134700.26327f6f@collabora.com>
 <20211005070930.epgxb5qzumk4awxq@skn-laptop>
 <20211005102300.5da6d480@collabora.com>
 <20211005084938.jcbw24umhehoiirs@skn-laptop>
 <20211005105836.6c300f25@collabora.com>
 <20211007114351.3nafhtpefezxhanc@skn-laptop>
 <20211007141858.314533f2@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007141858.314533f2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_053920_520797_FA1D24C7 
X-CRM114-Status: GOOD (  34.58  )
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

On Thu, Oct 07, 2021 at 02:18:58PM +0200, Boris Brezillon wrote:
> On Thu, 7 Oct 2021 13:43:51 +0200
> Sean Nyekjaer <sean@geanix.com> wrote:
> 

[ ... ]

> > 
> > I have a proposal [0] and yes I have ended up in many deadlocks during
> > testing. The hardest part is the locking when going into suspend.
> > I'm not sure the wait_queue is initialized the right place :)
> > And I'm kinda abusing the nand_get_device() for this...
> > 
> > Who do you think we should add to the discussion?
> > 
> > /Sean
> > 
> > [0]:
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index 3d6c6e880520..735dfff18143 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> 
> As I said previously, I think this should be handled MTD level
> (drivers/mtd/mtdcore.c) not in the raw NAND framework.
> 
> > @@ -337,11 +337,10 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
> >   */
> >  static int nand_get_device(struct nand_chip *chip)
> >  {
> > +       struct mtd_info *mtd = nand_to_mtd(chip);
> > +
> > +       wait_event(mtd->wait_queue, atomic_read(&chip->suspended) == 0);
> >         mutex_lock(&chip->lock);
> > -       if (chip->suspended) {
> > -               mutex_unlock(&chip->lock);
> > -               return -EBUSY;
> > -       }
> 
> There's a race here: the device might enter suspend again before you're
> able to acquire the lock.
> 

Thought so :)

> >         mutex_lock(&chip->controller->lock);
> > 
> >         return 0;
> > @@ -4562,11 +4561,15 @@ static int nand_suspend(struct mtd_info *mtd)
> >         struct nand_chip *chip = mtd_to_nand(mtd);
> >         int ret = 0;
> > 
> > +       atomic_inc(&chip->suspended);
> >         mutex_lock(&chip->lock);
> 
> And it's racy here as well: you mark the device as suspended before you
> even acquired the lock.
> 
> >         if (chip->ops.suspend)
> >                 ret = chip->ops.suspend(chip);
> > -       if (!ret)
> > -               chip->suspended = 1;
> > +       if (ret) {
> > +               /* Wake things up again if suspend fails */
> > +               atomic_dec(&chip->suspended);
> > +               wake_up(&mtd->wait_queue);
> > +       }
> >         mutex_unlock(&chip->lock);
> > 
> >         return ret;
> > @@ -4581,10 +4584,12 @@ static void nand_resume(struct mtd_info *mtd)
> >         struct nand_chip *chip = mtd_to_nand(mtd);
> > 
> >         mutex_lock(&chip->lock);
> > -       if (chip->suspended) {
> > +       if (atomic_read(&chip->suspended)) {
> >                 if (chip->ops.resume)
> >                         chip->ops.resume(chip);
> > -               chip->suspended = 0;
> > +
> > +               atomic_dec(&chip->suspended);
> > +               wake_up(&mtd->wait_queue);
> >         } else {
> >                 pr_err("%s called for a chip which is not in suspended state\n",
> >                         __func__);
> > @@ -5099,6 +5104,9 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
> >         pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
> >                 (int)(targetsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
> >                 mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
> > +
> > +       init_waitqueue_head(&mtd->wait_queue);
> > +
> 
> It's an MTD field. It should be initialized somewhere in mtdcore.c.
> 
> >         return 0;
> > 
> >  free_detect_allocation:
> > @@ -6264,6 +6272,8 @@ static int nand_scan_tail(struct nand_chip *chip)
> >         if (chip->options & NAND_SKIP_BBTSCAN)
> >                 return 0;
> > 
> > +       atomic_set(&chip->suspended, 0);
> > +
> >         /* Build bad block table */
> >         ret = nand_create_bbt(chip);
> >         if (ret)
> > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > index 88227044fc86..f7dcbc336170 100644
> > --- a/include/linux/mtd/mtd.h
> > +++ b/include/linux/mtd/mtd.h
> > @@ -360,6 +360,8 @@ struct mtd_info {
> >         int (*_get_device) (struct mtd_info *mtd);
> >         void (*_put_device) (struct mtd_info *mtd);
> > 
> > +       wait_queue_head_t wait_queue;
> > +
> 
> wait_queue doesn't really describe what this waitqueue is used for
> (maybe resume_wq), and the suspended state should be here as well
> (actually, there's one already).

I'll rename to something meaningful.
> 
> Actually, what we need is a way to prevent the device from being
> suspended while accesses are still in progress, and new accesses from
> being queued if a suspend is pending. So, I think you need a readwrite
> lock here:
> 
> * take the lock in read mode for all IO accesses, check the
>   mtd->suspended value
>   - if true, release the lock, and wait (retry on wakeup)
>   - if false, just do the IO
> 
> * take the lock in write mode when you want to suspend/resume the
>   device and update the suspended field. Call wake_up_all() in the
>   resume path

Could we use the chip->lock mutex for this? It's does kinda what you
described above?
If we introduce a new lock, do we really need to have the suspended as
an atomic?

I will test with some wait and retry added to nand_get_device().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
