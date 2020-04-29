Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE91C83004
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 19:03:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5359920B1F
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 19:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bmtXxAsI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5359920B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSKX1n6wIJIzsD0q9pGT/FFL3vOa7EsLEFY8d1Jj1/I=; b=bmtXxAsIeFVxO1
	eQiLswcOivnCdWfWZwSeMIxoodV5Mp5gDk3FjyhUxRvfG8Pm0y0wQAJ7sj3XG3nKYM3FIjfIyd2Zb
	4IIN3SVGGzJ6wKaWlKsTD0J32/kU6pErMJHhYdO42f2PGTb9xZSZHXvJlaqKCbhlByufRVh/CHBpf
	Et9qWKAfQsJBCxKz6/a6siUIFr1+F4Of2LC9kj1+z0ypUik+XgflwlcyMqVXCiXqOPwO/qXIuTE+s
	cuc+nN+BRLd/1cYcy6lXlr1SAt1LSdnjBo/8tA9P8D6Li9jcaXZIZphfL+50ebcxiMv3CP6c1659M
	Qlt75YYMtwGIg6jn2qLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTrzW-0007Wy-PT; Wed, 29 Apr 2020 19:03:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTrzT-0007Vl-Lg
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 19:03:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 23C702A2218;
 Wed, 29 Apr 2020 20:03:26 +0100 (BST)
Date: Wed, 29 Apr 2020 21:03:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 09/11] mtd: rawnand: Expose monolithic
 read/write_page_raw() helpers
Message-ID: <20200429210323.41eca2b5@collabora.com>
In-Reply-To: <20200429185252.1b81a3ea@xps13>
References: <20200429155540.22048-1-miquel.raynal@bootlin.com>
 <20200429155540.22048-10-miquel.raynal@bootlin.com>
 <20200429181509.657aa2e5@collabora.com>
 <20200429182631.71cafee4@xps13>
 <20200429183137.026eb5f9@collabora.com>
 <20200429185252.1b81a3ea@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_120327_840084_9D66BE7C 
X-CRM114-Status: GOOD (  24.72  )
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

On Wed, 29 Apr 2020 18:52:52 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 29 Apr
> 2020 18:31:37 +0200:
> 
> > On Wed, 29 Apr 2020 18:26:31 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Hi Boris,
> > > 
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 29 Apr
> > > 2020 18:15:09 +0200:
> > >     
> > > > On Wed, 29 Apr 2020 17:55:38 +0200
> > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > >       
> > > > > The current nand_read/write_page_raw() helpers are already widely used
> > > > > but do not fit the purpose of "constrained" controllers which cannot,
> > > > > for instance, separate command/address cycles with data cycles.
> > > > > 
> > > > > Workaround this issue by proposing alternative helpers that cannot be
> > > > > used by controller drivers instead.
> > > > > 
> > > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > > ---
> > > > >  drivers/mtd/nand/raw/nand_base.c | 60 ++++++++++++++++++++++++++++++++
> > > > >  include/linux/mtd/rawnand.h      |  8 +++--
> > > > >  2 files changed, 66 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > > > > index 15a9189b2307..2e525cb5a4e4 100644
> > > > > --- a/drivers/mtd/nand/raw/nand_base.c
> > > > > +++ b/drivers/mtd/nand/raw/nand_base.c
> > > > > @@ -2629,6 +2629,39 @@ int nand_read_page_raw(struct nand_chip *chip, uint8_t *buf, int oob_required,
> > > > >  }
> > > > >  EXPORT_SYMBOL(nand_read_page_raw);
> > > > >  
> > > > > +/**
> > > > > + * nand_monolithic_read_page_raw - Read raw page data without ECC in one go        
> > > > 
> > > > Maybe
> > > > 
> > > > "Read the full page (data + OOB) with ECC engine disabled"
> > > > 
> > > > ?      
> > > 
> > > This is not accurate as we don't enforce OOB read.    
> > 
> > Right
> >   
> > > 
> > > Don't you find "in one go" explicit enough?    
> > 
> > Well, "raw" and "without ECC" is redundant, that's the part I wanted to
> > see addressed. And the 'in one go' refers to the data/OOB split, which
> > is not clear here.
> >   
> 
> 
> What about
> 
>     "Send a single request to the controller driver to read raw data"
> 
> the end of the sentence might also be
> 
>     "...to read a page plus eventually the OOB area"

I think we should stick to something shorter here, like "Do a monolithic
page read in raw mode" and have a detailed description (basically
defining what 'raw' and 'monolithic' mean in this context) after the
arguments.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
