Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D87CA90AF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 19:50:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04DF1206DD
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 19:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UnSFDCC2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04DF1206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBIOGJRDEzEvqxvQZtWsMv4svdsjw2PLsp/dAD5qkjI=; b=UnSFDCC21YK0wI
	dAQyYBwLvtEIYmmdfNe1BGy067ygoyKkFtfSIwW/60ss9O2vtlHy26mXcd603GQTiw8VC6duUKHS8
	mi9NFUOb85aFJrAlDLYXH4O7OQ1GGBXfyzOsZq8xf86DHtHKMPPs241dBmcLD/WA/wibu/KXCRnrn
	G5Fs/L0S4jqKL/0B0SVTYQO1zYZ8d8oR5LJHkYyV76evRLxrKdSBhuCZlZ8+qxN3a5cOMsEqhr7Y5
	mvldZBkZ+ynseSoXksUlwumF83cQug8VLLG1Q1wgIRJCQyZo7W5prYpjg1ihohaV22rNF3IMXKouH
	cXIzXifAPCIkZNwk/+sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYavH-0004UZ-6b; Tue, 12 May 2020 19:50:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYavD-0004QK-Qq
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 19:50:37 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0DE9D2A22AA;
 Tue, 12 May 2020 20:50:33 +0100 (BST)
Date: Tue, 12 May 2020 21:50:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v2 00/19] mtd: rawnand: cafe: Convert to exec_op() (and
 more)
Message-ID: <20200512215029.6db95d4b@collabora.com>
In-Reply-To: <20200512164057.GC604838@furthur.local>
References: <20200507134708.GA303404@furthur.local>
 <20200507221257.75e400a8@collabora.com>
 <20200509193440.GA524772@furthur.local>
 <20200509220102.59f36689@collabora.com>
 <20200509202855.GB524772@furthur.local>
 <20200510083105.4bcfa71b@collabora.com>
 <20200510084541.29e4069e@collabora.com>
 <20200510072108.GA587379@furthur.local>
 <20200510093549.56f74e61@collabora.com>
 <20200511102305.7d843fbc@collabora.com>
 <20200512164057.GC604838@furthur.local>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_125036_006853_5F1BB47D 
X-CRM114-Status: GOOD (  21.98  )
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

On Tue, 12 May 2020 18:40:57 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> > > > 
> > > > As you correctly pointed out; the source of the interrupts I'm seeing
> > > > could be something else than the CAFE chip -- the camera or the MMC
> > > > card. I'm not sure though; camera is certainly off and there shouldn't
> > > > be much going on about the MMC card. I'm testing with a init=/bin/bash
> > > > installation off a SD-card currently. I guess I can try switching to the
> > > > USB flash stick and disable the camera and MMC altogether.    
> > > 
> > > Okay, if that happens that would be a HW bug (or an interrupt coming
> > > from somewhere else, maybe PCI errors?)? Can you print the values of
> > > CAFE_GLOBAL_IRQ and CAFE_GLOBAL_IRQ_MASK in your irq handler?  
> > 
> > If you think that's less risky, I can drop "mtd: rawnand: cafe: Return
> > IRQ_HANDLED when appropriate" and go for your initial fix (avoid
> > clearing FLSH_READY interrupt). It just feels like the current
> > implementation is papering over a bug.  
> 
> I don't really mind the patch; I was just not sure why you removed the
> acks and re-set the mask and suspected that maybe it was not
> intentional.
> 
> That said, I've now disabled the camera and mmc and did my usual test
> of mounting the filesystem and I'm seeing zero interrupts.
> 
> I suppose it's safe to assume that contrary to what I was imagining,
> the masking works well and the interrupts I was seeing are indeed from
> elsewhere (I guess the MMC driver polling the controller or something).
> 
> Also, the re-set of the mask from the interrupt handler is not realy
> necessary (but I certainly wouldn't complain if you keep it in place).

Indeed. It was needed for the interrupt-based wait, but I've dropped
that patch. I guess we can simply get rid of the irq handler and the
request_irq() call.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
