Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701ABC83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:55:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA1F2072A
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZceeDtv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CA1F2072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aROVZ/w4C/2Fhz6oDWoxikKJ2bK6MyBAuxStXb7GFhQ=; b=rZceeDtvdkVVfU
	ytk84aq5sDUXb3lR4fOyYJDs5yOcRsh0atOQ7y7PWJJRmc8NNC0ScVmiXzBC34TNBjVDnavK6gnfs
	PCOBwwlYnOtBO6Zu6WG9UHQGAqW9EkgyDD1emuR55q6vWs7g71h17L2Ydug+fTC4Yz5OJGNbyKcxS
	HDWKpUyhbxZC0WG+LcdJL6RreO7h71Ta9YZI8vMLyRrfBdvXt+NCf8t2Yii5tKxCXaq7LIBgDWI6m
	UVkKfXlJ1U9DYqHkVqLlwDrtUW4tZaq5hkcMb/3UTvdOmN5M83TN2V0IUk7jQ2UCLFBMjq+Q9Rqhp
	z/+6MThezFl04kww8AEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTpzU-00064e-1Q; Wed, 29 Apr 2020 16:55:20 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTpzE-0003b7-GV
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 16:55:06 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 42CA4C0007;
 Wed, 29 Apr 2020 16:55:01 +0000 (UTC)
Date: Wed, 29 Apr 2020 18:54:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 03/11] mtd: rawnand: Rename a NAND chip option
Message-ID: <20200429185459.0ce5fc21@xps13>
In-Reply-To: <20200429183642.15e62ae5@collabora.com>
References: <20200429155540.22048-1-miquel.raynal@bootlin.com>
 <20200429155540.22048-4-miquel.raynal@bootlin.com>
 <20200429180816.14f16be0@collabora.com>
 <20200429182200.4240303d@xps13>
 <20200429183231.1a3607c1@collabora.com>
 <20200429183642.15e62ae5@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_095504_900292_CDE6D970 
X-CRM114-Status: GOOD (  19.33  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 29 Apr
2020 18:36:42 +0200:

> On Wed, 29 Apr 2020 18:32:31 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Wed, 29 Apr 2020 18:22:00 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Hi Boris,
> > > 
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 29 Apr
> > > 2020 18:08:16 +0200:
> > >     
> > > > On Wed, 29 Apr 2020 17:55:32 +0200
> > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > >       
> > > > > NAND controller drivers can set the NAND_USE_BOUNCE_BUFFER flag to a
> > > > > chip 'option' field. With this flag, the core is responsible of
> > > > > providing DMA-able buffers.
> > > > > 
> > > > > The current behavior is to not force the use of a bounce buffer when
> > > > > the core thinks this is not needed. So in the end the name is a bit
> > > > > misleading, because in theory we will always have a DMA buffer but in
> > > > > practice it will not always be a bounce buffer.
> > > > > 
> > > > > Rename this flag NAND_USE_DMA_BUFFER to be more accurate.        
> > > > 
> > > > I still think this one should be named NAND_CONTROLLER_USES_DMA.      
> > > 
> > > Actually I want to rework all the flags and prefix them with
> > > NAND_CONTROLLER, that's why I am keeping the NAND_ prefix. I can change
> > > the _USE_DMA_BUFFER into _USES_DMA though.    
> > 
> > Ack on NAND_USES_DMA.  
> 
> But then I wonder if it's really worth renaming this field now if you
> plan to rename it again later :-).

Hehe, well, it "fixes" the meaning of the flag, later changes will only
be "cosmetic" :)

Saying we "use a bounce buffer" is not accurate as the code first checks
if the buffer is compliant with DMA constraints, and uses a bounce
buffer only if it is not.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
