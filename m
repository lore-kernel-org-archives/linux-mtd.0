Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEA1C54E49
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 07:36:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B7C20801
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 07:36:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QN3xr/Yc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08B7C20801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJJLNth1ybwa276h3XUcdcS18iOE7Qnla1RKe4vgsCw=; b=QN3xr/Yc5mt0ol
	jIfWufZAPpEzP/+ATZGak4fsBqOdCjdZogty5VG/9bRmNlETY5ZN4JiPVOJArtVLEVojB6WPNsbac
	iiOrIVZ8YJ76qpmnEVT3FZo9Kv+D1zJ1cfnZnKEXI7u3jy3E/XGaxNKm1HorhNw49k5Pb3KgcQB/Z
	8JFujrSlpqsXswuTVxjUx9JUBUvS1e36XCv++BwnJsnToz4X8rQMKAImda7BrGXGjydzfLx+XXXG1
	qFrt6Nk5Z+qBpP4LW+mYDYsSfFUQ89O7WxshwX97c8pbodpYgZKlHJIok88Myqjtrf1oHdKT6SvrY
	v5Ei10bo9+dp1naDp6hQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXgVB-0004uw-IV; Sun, 10 May 2020 07:35:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgV8-0004uU-4I
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 07:35:56 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 196632A034B;
 Sun, 10 May 2020 08:35:52 +0100 (BST)
Date: Sun, 10 May 2020 09:35:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v2 00/19] mtd: rawnand: cafe: Convert to exec_op() (and
 more)
Message-ID: <20200510093549.56f74e61@collabora.com>
In-Reply-To: <20200510072108.GA587379@furthur.local>
References: <20200506181153.4643fbe1@collabora.com>
 <20200506203635.GA207924@furthur.local>
 <20200506233552.0ef6a865@collabora.com>
 <20200507134708.GA303404@furthur.local>
 <20200507221257.75e400a8@collabora.com>
 <20200509193440.GA524772@furthur.local>
 <20200509220102.59f36689@collabora.com>
 <20200509202855.GB524772@furthur.local>
 <20200510083105.4bcfa71b@collabora.com>
 <20200510084541.29e4069e@collabora.com>
 <20200510072108.GA587379@furthur.local>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_003554_433612_AD4C6631 
X-CRM114-Status: GOOD (  43.28  )
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

On Sun, 10 May 2020 09:21:08 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> On Sun, May 10, 2020 at 08:45:41AM +0200, Boris Brezillon wrote:
> > On Sun, 10 May 2020 08:31:05 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >   
> > > On Sat, 9 May 2020 22:28:55 +0200
> > > Lubomir Rintel <lkundrak@v3.sk> wrote:
> > >   
> > > > On Sat, May 09, 2020 at 10:01:02PM +0200, Boris Brezillon wrote:    
> > > > > On Sat, 9 May 2020 21:34:40 +0200
> > > > > Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > > >       
> > > > > > On Thu, May 07, 2020 at 10:12:57PM +0200, Boris Brezillon wrote:      
> > > > > > > On Thu, 7 May 2020 15:47:08 +0200
> > > > > > > Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > > > > >         
> > > > > > > > On Wed, May 06, 2020 at 11:35:52PM +0200, Boris Brezillon wrote:        
> > > > > > > > > On Wed, 6 May 2020 22:36:35 +0200
> > > > > > > > > Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > > > > > > >           
> > > > > > > > > > > We really should mask IRQs (AKA disable IRQs in my naming convention
> > > > > > > > > > > :-)) here, unless we want to switch to interrupt-based waits (which
> > > > > > > > > > > would be a good thing when we have DMA or WAIT_RDY involved). Having an
> > > > > > > > > > > interrupt handler in the current implementation doesn't make any sense
> > > > > > > > > > > (that's assuming the IRQ_STATUS bits are updated even if the interrupts
> > > > > > > > > > > are disabled, which am not sure is a valid assumption in this case).            
> > > > > > > > > > 
> > > > > > > > > > I have no idea why the interrupt handler is there. Perhaps some
> > > > > > > > > > interrupts can't be masked and need an ack or something.          
> > > > > > > > > 
> > > > > > > > > Can you try to set NAND_IRQ_MASK to 0x0 and see if that still works.
> > > > > > > > > Can you also check the number of NAND interrupts when set to 0x0? It's
> > > > > > > > > hard to tell exactly what caused the interrupt handler to be called
> > > > > > > > > since this is a shared interrupt.          
> > > > > > > > 
> > > > > > > > When it's set to 0, I get an interrupt with CAFE_NAND_IRQ=0x40000000
> > > > > > > > (CAFE_NAND_IRQ_FLASH_RDY) right off the bat. That doesn't happen with
> > > > > > > > a mask of 0xffffffff.
> > > > > > > > 
> > > > > > > > When changing the handler to always ack CAFE_NAND_IRQ_FLASH_RDY I've
> > > > > > > > also seen CAFE_NAND_IRQ=0x80000000 (CAFE_NAND_IRQ_CMD_DONE) suggesting
> > > > > > > > that other interrupts aren't masked either.
> > > > > > > > 
> > > > > > > > It seems to be that ones indeed mask interrupts but just can't be
> > > > > > > > masked (CAFE_NAND_IRQ_CMD_DONE or CAFE_NAND_IRQ_DMA_DONE), perhaps
> > > > > > > > due to hardware bugs.
> > > > > > > >         
> > > > > > > 
> > > > > > > I pushed a new version with some interrupt-related changes [1].
> > > > > > > 
> > > > > > > [1]https://github.com/bbrezillon/linux/commits/nand/cafe-nand-exec-op-debug        
> > > > > > 
> > > > > > Works with one fix:
> > > > > > 
> > > > > > diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
> > > > > > index 591d79730961..e37737b7b089 100644
> > > > > > --- a/drivers/mtd/nand/raw/cafe_nand.c
> > > > > > +++ b/drivers/mtd/nand/raw/cafe_nand.c
> > > > > > @@ -801,6 +801,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
> > > > > >         if (!cafe)
> > > > > >                 return  -ENOMEM;
> > > > > >  
> > > > > > +       init_completion(&cafe->complete);      
> > > > > 
> > > > > Oops, indeed.
> > > > >       
> > > > > >         mtd = nand_to_mtd(&cafe->nand);
> > > > > >         mtd->dev.parent = &pdev->dev;
> > > > > >         nand_set_controller_data(&cafe->nand, cafe);
> > > > > > 
> > > > > > However, the mount JFFS2 mount takes about twice as long as it did with
> > > > > > the polling version:      
> > > > > 
> > > > > Yes, that's not surprising. At the same time, using atomic-polling for
> > > > > something that's expected to take hundreds of microseconds is not that
> > > > > great. That means your CPU is not doing anything useful while you wait
> > > > > for the read/write/erase operation to finish.      
> > > > 
> > > > Yes. But this really is too much of a slowdown:
> > > > 
> > > >   bash-5.0# time dd count=65536 bs=2k if=/dev/mtd0 of=/dev/null
> > > >   65536+0 records in
> > > >   65536+0 records out
> > > >   
> > > >   real    0m20.191s
> > > >   user    0m0.346s
> > > >   sys     0m10.366s
> > > > 
> > > > vs (previously):
> > > >   
> > > >   bash-5.0# time dd count=65536 bs=2k if=/dev/mtd0 of=/dev/null
> > > >   65536+0 records in
> > > >   65536+0 records out
> > > >   
> > > >   real    0m7.629s
> > > >   user    0m0.010s
> > > >   sys     0m7.500s
> > > >   bash-5.0#    
> > > 
> > > Almost a factor 3. I was definitely not expecting interrupt-based waits
> > > to have such a huge impact on the perfs.
> > >   
> > > > 
> > > > Note that your CPU can't be doing anything useful before the program and
> > > > its data is loaded from the storage :)    
> > > 
> > > Well, that's only true at mount time (and if you delay the mount after
> > > the boot, your CPU might already have other things to do), but any
> > > erase/write operations are likely to monopolize your CPU for no good
> > > reason.
> > >   
> > > > 
> > > > I suppose that if someone really prefers to avoid hogging the CPU at
> > > > this cost, then it makes sense to add a knob (a module parameter or
> > > > something) that would enable the interrupt-driven operation, but
> > > > keep polling as a default.    
> > > 
> > > Let's not add more module params than we already have, it just
> > > confuses users and deciding how to wait on HW events doesn't sounds
> > > like something they should be able to choose anyway (just like passing
> > > the timing params, this should be calculated by the driver). Oh well,
> > > I'll drop the patch adding interrupt-based waits. Having the driver
> > > converted to exec_op() is more than enough :-).  
> > 
> > Just pushed a new version. If it works for you I'll send a v3.  
> 
> Thank you. That's b6b10b45dd9 in nand/cafe-nand-exec-op-debug of
> https://github.com/bbrezillon/linux/ I suppose?
> 
> Without the readl_poll_timeout() -> readl_poll_timeout_atomic() change
> it's still very slow.

Should be fixed now.

> 
> Also, commit f89355b6b6 ("mtd: rawnand: cafe: Return IRQ_HANDLED when
> appropriate") looks somewhat suspicious to me. Previously it wrote the
> pending interrupt bits back into CAFE_NAND_IRQ, now you're masking them
> out in CAFE_NAND_IRQ_MASK (which already should be 0xffffffff) at this
> point. Why?

If interrupts are masked we don't need to clear them. We only clear
them before executing an operation to start from a fresh state.

> I thought the write back to CAFE_NAND_IRQ serves to ack the
> interrupts that came up but we don't handle elsewhere because we weren't
> expecting them.

If we reach the handler and all our irqs are masked, that means the irq
was not for us, which is possible since the irq line is shared. We
really should to return IRQ_NONE in that case, and clearing pending
interrupts is useless, since they are masked anyway. Since we read
the interrupt status from exec_op(), I thought it'd be better to never
clear any interrupt bits instead of clearing all bits but the CMD_DONE,
DMA_DONE and FLASH_RDY.

> 
> As you correctly pointed out; the source of the interrupts I'm seeing
> could be something else than the CAFE chip -- the camera or the MMC
> card. I'm not sure though; camera is certainly off and there shouldn't
> be much going on about the MMC card. I'm testing with a init=/bin/bash
> installation off a SD-card currently. I guess I can try switching to the
> USB flash stick and disable the camera and MMC altogether.

Okay, if that happens that would be a HW bug (or an interrupt coming
from somewhere else, maybe PCI errors?)? Can you print the values of
CAFE_GLOBAL_IRQ and CAFE_GLOBAL_IRQ_MASK in your irq handler?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
