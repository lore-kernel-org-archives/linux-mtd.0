Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6196AC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 13:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F224261090
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 13:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F224261090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bA7kOImKN7xvDnNCiNvfsmUwQeF1SULJYZ0TGPl9x+k=; b=lHd3THWTIRNV+Z
	dTPS9ltZuFG/nT+1ckFGzsMfsnrdalVIf5ymNJ+l44oiOkFw/FF8qLUM+i8lJNSujtCKjdOMxVFEH
	4huGem2FdhwksNrvCaBhE3oRL/aZEpwfCZpFbKEWsBTI6UX4A8glaaow4+BAY6mHW/fY5HWO1YvRd
	CszSYsWOC9a7uHvuNpLp0ikkdOI13vLXH6NC8CBxhWaGpkJEa/IfsLhonx8ULYGivcR9OxpDjcOD/
	0HrDsGYotdXNETi834t+pTVHq9aXBHddXrwCK7YdBTtagsLca89Y2iKCJwRgc1qiwoEIKLG0t8Xxn
	sZnWx7/rpyTxg2oHH5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYTEK-00HSEp-S8; Thu, 07 Oct 2021 13:14:36 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYTEF-00HSDA-Fk
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 13:14:36 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 468A31F451F3;
 Thu,  7 Oct 2021 14:14:29 +0100 (BST)
Date: Thu, 7 Oct 2021 15:14:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: use mutex to protect access while in
 suspend
Message-ID: <20211007151426.54db0764@collabora.com>
In-Reply-To: <20211007123916.w4oaooxfbawe6yw3@skn-laptop>
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
 <20211007123916.w4oaooxfbawe6yw3@skn-laptop>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_061431_693232_AA929343 
X-CRM114-Status: GOOD (  29.51  )
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

On Thu, 7 Oct 2021 14:39:16 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> > >         return 0;
> > > 
> > >  free_detect_allocation:
> > > @@ -6264,6 +6272,8 @@ static int nand_scan_tail(struct nand_chip *chip)
> > >         if (chip->options & NAND_SKIP_BBTSCAN)
> > >                 return 0;
> > > 
> > > +       atomic_set(&chip->suspended, 0);
> > > +
> > >         /* Build bad block table */
> > >         ret = nand_create_bbt(chip);
> > >         if (ret)
> > > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > > index 88227044fc86..f7dcbc336170 100644
> > > --- a/include/linux/mtd/mtd.h
> > > +++ b/include/linux/mtd/mtd.h
> > > @@ -360,6 +360,8 @@ struct mtd_info {
> > >         int (*_get_device) (struct mtd_info *mtd);
> > >         void (*_put_device) (struct mtd_info *mtd);
> > > 
> > > +       wait_queue_head_t wait_queue;
> > > +  
> > 
> > wait_queue doesn't really describe what this waitqueue is used for
> > (maybe resume_wq), and the suspended state should be here as well
> > (actually, there's one already).  
> 
> I'll rename to something meaningful.
> > 
> > Actually, what we need is a way to prevent the device from being
> > suspended while accesses are still in progress, and new accesses from
> > being queued if a suspend is pending. So, I think you need a readwrite
> > lock here:
> > 
> > * take the lock in read mode for all IO accesses, check the
> >   mtd->suspended value
> >   - if true, release the lock, and wait (retry on wakeup)
> >   - if false, just do the IO
> > 
> > * take the lock in write mode when you want to suspend/resume the
> >   device and update the suspended field. Call wake_up_all() in the
> >   resume path  
> 
> Could we use the chip->lock mutex for this? It's does kinda what you
> described above?

No you can't. Remember I suggested to move all of that logic to
mtdcore.c, which doesn't know about the nand_chip struct.

> If we introduce a new lock, do we really need to have the suspended as
> an atomic?

Nope, I thought we could do without a lock, but we actually need to
track active IO requests, not just the suspended state.

> 
> I will test with some wait and retry added to nand_get_device().

Again, I think there's a misunderstanding here: if you move it to the
mtd layer, it can't be done in nand_get_device(). But once you've
implemented it in mtdcore.c, you should be able to get rid of the
nand_chip->suspended field.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
