Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5CAC83004
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:23:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39F9B206F0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bMUNLy7F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39F9B206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjHVV2eOvetvJ27XFstsl7epmswyk/TrpXn58eA1FPI=; b=bMUNLy7FpdsXBa
	LfngdFOPm1HyeFjnEWSr8yvD9McP9qMUemNCkfmRPoK4QP+lvz4DrenhKEPwJ5iHkjvWIw+az8+Ur
	Xzo7xCzGw5DaAZP8rVVeGfTolyqWxL5XjCdBcukHe1EXvKcVfSkEAqmoYI6Ry5hYoAqRE+pc2qjkg
	oOALJactNQgv3WhR4NEdsrHiUl9xKMDV8dVyzuVXiEe/RR/XLO+0MbHYFa3STfzcWXr3wiYI7KFew
	WHy84JGHGxTnwGjcgqcPeSpk7X+GV0OE83WrzxK3GMGfv88XeM13qp8vbD1/Yost1mNIagzjW5jwo
	vCeFx55Psi7Gcy87+x7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTpUq-0001iM-HS; Wed, 29 Apr 2020 16:23:40 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTpUo-0001hp-1C
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 16:23:39 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9A549C0002;
 Wed, 29 Apr 2020 16:23:31 +0000 (UTC)
Date: Wed, 29 Apr 2020 18:23:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 08/11] mtd: rawnand: jedec: Adapt the parameter page
 read to constraint controllers
Message-ID: <20200429182330.359cea43@xps13>
In-Reply-To: <20200429180405.5bf69447@collabora.com>
References: <20200429155540.22048-1-miquel.raynal@bootlin.com>
 <20200429155540.22048-9-miquel.raynal@bootlin.com>
 <20200429180405.5bf69447@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_092338_210453_F3BE186E 
X-CRM114-Status: GOOD (  19.62  )
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

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 29 Apr
2020 18:04:05 +0200:

> On Wed, 29 Apr 2020 17:55:37 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > We already know that there are controllers not able to read the three
> > copies of the parameter page in one go. The workaround was to first
> > request the controller to assert command and address cycles on the
> > NAND bus to trigger a parameter page read, and then do a read
> > operation for each page.
> > 
> > But there are also controllers which are not able to split the
> > parameter page read between the command/address cycles and the actual
> > data operation.
> > 
> > All controllers are expected to be able to change the read column
> > though. So let's use a regular parameter page read operation for the
> > first iteration and use a change read column operation for the
> > following copies.
> > 
> > The extra command and address cycles sent over the NAND bus are
> > negligible compared to the amount of data that is being transferred
> > anyway.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/nand_jedec.c | 28 +++++++++++++++-------------
> >  1 file changed, 15 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
> > index 15937e02c64f..b2be9056759a 100644
> > --- a/drivers/mtd/nand/raw/nand_jedec.c
> > +++ b/drivers/mtd/nand/raw/nand_jedec.c
> > @@ -25,7 +25,7 @@ int nand_jedec_detect(struct nand_chip *chip)
> >  {
> >  	struct mtd_info *mtd = nand_to_mtd(chip);
> >  	struct nand_memory_organization *memorg;
> > -	struct nand_jedec_params *p;
> > +	struct nand_jedec_params *p = NULL, *pbuf;  
> 
> Looks like you've merged 2 different commits here. I remember you had a
> separate commit adding pbuf to avoid an extra memcpy().
> 

Oops. Indeed I merged two commits by mistake, this is a leftover of the
operation, I'll fix it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
