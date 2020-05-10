Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6F2C35280
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 06:31:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D33E20722
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 06:31:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qbrSiG4Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D33E20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jc88V03pjQQGYrXhZAnS6aWi5SW/2bTzFOYI3Vo+LN8=; b=qbrSiG4Zaow9gL
	Z6KYupLqbUJpF6+NGkNIM5v3PNoXEeZKvx2rHUfU9hMDKclPfsLGMQdGHVJjdo+maUP8xJRs9mD5e
	n6B/FMliLWVj075pNV4Wz39Vd98oD8/vDTDUWAOJWCyNT6Ah1y66qJu7sszeAMVo7Gd8PE5mUmBFt
	m92P3+NAkFP7zJ3ZWrtuKJfiyoDoTXEdemtcLgpGKu3mpFjTVJWQIJWaJLbKgshE0AGoIhGAAzHRX
	vcZ/2rCA9RzlRNRH9ZbiZYj6u/Nmp7ddyjRSxUpV79wZuhgIdjLjuiw9jkrNegP1r5PKaQCB1U6ge
	y2cXa5evpRI/IeMncjTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXfUY-0006ne-3h; Sun, 10 May 2020 06:31:14 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXfUV-0006n9-7e
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 06:31:13 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 669E32A0825;
 Sun, 10 May 2020 07:31:09 +0100 (BST)
Date: Sun, 10 May 2020 08:31:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v2 00/19] mtd: rawnand: cafe: Convert to exec_op() (and
 more)
Message-ID: <20200510083105.4bcfa71b@collabora.com>
In-Reply-To: <20200509202855.GB524772@furthur.local>
References: <20200505220152.GA157445@furthur.local>
 <20200506083209.57c85ad9@collabora.com>
 <20200506155359.GA183666@furthur.local>
 <20200506181153.4643fbe1@collabora.com>
 <20200506203635.GA207924@furthur.local>
 <20200506233552.0ef6a865@collabora.com>
 <20200507134708.GA303404@furthur.local>
 <20200507221257.75e400a8@collabora.com>
 <20200509193440.GA524772@furthur.local>
 <20200509220102.59f36689@collabora.com>
 <20200509202855.GB524772@furthur.local>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_233111_539773_2BF08EE9 
X-CRM114-Status: GOOD (  34.87  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 9 May 2020 22:28:55 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> On Sat, May 09, 2020 at 10:01:02PM +0200, Boris Brezillon wrote:
> > On Sat, 9 May 2020 21:34:40 +0200
> > Lubomir Rintel <lkundrak@v3.sk> wrote:
> >   
> > > On Thu, May 07, 2020 at 10:12:57PM +0200, Boris Brezillon wrote:  
> > > > On Thu, 7 May 2020 15:47:08 +0200
> > > > Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > >     
> > > > > On Wed, May 06, 2020 at 11:35:52PM +0200, Boris Brezillon wrote:    
> > > > > > On Wed, 6 May 2020 22:36:35 +0200
> > > > > > Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > > > >       
> > > > > > > > We really should mask IRQs (AKA disable IRQs in my naming convention
> > > > > > > > :-)) here, unless we want to switch to interrupt-based waits (which
> > > > > > > > would be a good thing when we have DMA or WAIT_RDY involved). Having an
> > > > > > > > interrupt handler in the current implementation doesn't make any sense
> > > > > > > > (that's assuming the IRQ_STATUS bits are updated even if the interrupts
> > > > > > > > are disabled, which am not sure is a valid assumption in this case).        
> > > > > > > 
> > > > > > > I have no idea why the interrupt handler is there. Perhaps some
> > > > > > > interrupts can't be masked and need an ack or something.      
> > > > > > 
> > > > > > Can you try to set NAND_IRQ_MASK to 0x0 and see if that still works.
> > > > > > Can you also check the number of NAND interrupts when set to 0x0? It's
> > > > > > hard to tell exactly what caused the interrupt handler to be called
> > > > > > since this is a shared interrupt.      
> > > > > 
> > > > > When it's set to 0, I get an interrupt with CAFE_NAND_IRQ=0x40000000
> > > > > (CAFE_NAND_IRQ_FLASH_RDY) right off the bat. That doesn't happen with
> > > > > a mask of 0xffffffff.
> > > > > 
> > > > > When changing the handler to always ack CAFE_NAND_IRQ_FLASH_RDY I've
> > > > > also seen CAFE_NAND_IRQ=0x80000000 (CAFE_NAND_IRQ_CMD_DONE) suggesting
> > > > > that other interrupts aren't masked either.
> > > > > 
> > > > > It seems to be that ones indeed mask interrupts but just can't be
> > > > > masked (CAFE_NAND_IRQ_CMD_DONE or CAFE_NAND_IRQ_DMA_DONE), perhaps
> > > > > due to hardware bugs.
> > > > >     
> > > > 
> > > > I pushed a new version with some interrupt-related changes [1].
> > > > 
> > > > [1]https://github.com/bbrezillon/linux/commits/nand/cafe-nand-exec-op-debug    
> > > 
> > > Works with one fix:
> > > 
> > > diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
> > > index 591d79730961..e37737b7b089 100644
> > > --- a/drivers/mtd/nand/raw/cafe_nand.c
> > > +++ b/drivers/mtd/nand/raw/cafe_nand.c
> > > @@ -801,6 +801,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
> > >         if (!cafe)
> > >                 return  -ENOMEM;
> > >  
> > > +       init_completion(&cafe->complete);  
> > 
> > Oops, indeed.
> >   
> > >         mtd = nand_to_mtd(&cafe->nand);
> > >         mtd->dev.parent = &pdev->dev;
> > >         nand_set_controller_data(&cafe->nand, cafe);
> > > 
> > > However, the mount JFFS2 mount takes about twice as long as it did with
> > > the polling version:  
> > 
> > Yes, that's not surprising. At the same time, using atomic-polling for
> > something that's expected to take hundreds of microseconds is not that
> > great. That means your CPU is not doing anything useful while you wait
> > for the read/write/erase operation to finish.  
> 
> Yes. But this really is too much of a slowdown:
> 
>   bash-5.0# time dd count=65536 bs=2k if=/dev/mtd0 of=/dev/null
>   65536+0 records in
>   65536+0 records out
>   
>   real    0m20.191s
>   user    0m0.346s
>   sys     0m10.366s
> 
> vs (previously):
>   
>   bash-5.0# time dd count=65536 bs=2k if=/dev/mtd0 of=/dev/null
>   65536+0 records in
>   65536+0 records out
>   
>   real    0m7.629s
>   user    0m0.010s
>   sys     0m7.500s
>   bash-5.0#

Almost a factor 3. I was definitely not expecting interrupt-based waits
to have such a huge impact on the perfs.

> 
> Note that your CPU can't be doing anything useful before the program and
> its data is loaded from the storage :)

Well, that's only true at mount time (and if you delay the mount after
the boot, your CPU might already have other things to do), but any
erase/write operations are likely to monopolize your CPU for no good
reason.

> 
> I suppose that if someone really prefers to avoid hogging the CPU at
> this cost, then it makes sense to add a knob (a module parameter or
> something) that would enable the interrupt-driven operation, but
> keep polling as a default.

Let's not add more module params than we already have, it just
confuses users and deciding how to wait on HW events doesn't sounds
like something they should be able to choose anyway (just like passing
the timing params, this should be calculated by the driver). Oh well,
I'll drop the patch adding interrupt-based waits. Having the driver
converted to exec_op() is more than enough :-).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
