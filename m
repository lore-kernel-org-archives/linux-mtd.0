Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E72C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:58:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3672206E6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:58:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dSMKtL6F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3672206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dwuGf+3UeDyVd9a/9DtM1StE1lTj9xkG5oABuONc9s=; b=dSMKtL6Fm7sYwH
	G4rbph6f5AioXoMJSQErapbKokjno3aJQm1in6RPnnEH1tFSlYKp1oblsAkx9UIHivdz/0A9BHq9A
	XY1HGbjRAPDzMDwPvr+Pi2/E8Uq1xNRNGWU46x8bElLkzV917jvGSGr+6vvuQQhtLu4L6Qf0av0E1
	3U180IEM0e0RDmYA9AiZU8oZOYh/tydApXQvl/jpB+JYhB1NWEfgidUWfACN+tCg9wHoSrCotrEIo
	SbV1KIdEPdjsGpWc4P9U1LQGCRIZaZeBYPk7QoBfjnotnzu9m+lrqPc5+CuTq7zDxACibyalGAM5f
	evWxmyt0xZu4yjvH0dyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVWve-0005Qu-0B; Mon, 04 May 2020 08:58:22 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVWun-0004jI-WA
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 08:57:41 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 189CAFF822;
 Mon,  4 May 2020 08:57:11 +0000 (UTC)
Date: Mon, 4 May 2020 10:57:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 10/13] mtd: rawnand: jedec: Adapt the parameter page
 read to constraint controllers
Message-ID: <20200504105710.34c392ab@xps13>
In-Reply-To: <20200504105144.6273643b@collabora.com>
References: <20200504082414.7327-1-miquel.raynal@bootlin.com>
 <20200504082414.7327-11-miquel.raynal@bootlin.com>
 <20200504105144.6273643b@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_015731_601625_4F203B0C 
X-CRM114-Status: GOOD (  23.66  )
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
 Richard Weinberger <richard@nod.at>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 4 May
2020 10:51:44 +0200:

> On Mon,  4 May 2020 10:24:11 +0200
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
> > Let's use a regular PARAMETER PAGE READ operation for the first
> > iteration and use eithe a CHANGE READ COLUMN or a simple DATA READ
> > operation for the following copies, depending on what the controller
> > supports. The default for non-exec-op compliant drivers remains
> > unchanged: use a SIMPLE READ.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/nand_jedec.c | 34 ++++++++++++++++++++-----------
> >  1 file changed, 22 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
> > index 63069f1948a8..be270b36317e 100644
> > --- a/drivers/mtd/nand/raw/nand_jedec.c
> > +++ b/drivers/mtd/nand/raw/nand_jedec.c
> > @@ -25,8 +25,9 @@ int nand_jedec_detect(struct nand_chip *chip)
> >  {
> >  	struct mtd_info *mtd = nand_to_mtd(chip);
> >  	struct nand_memory_organization *memorg;
> > -	struct nand_jedec_params *p;
> > +	struct nand_jedec_params *p = NULL, *pbuf;
> >  	struct jedec_ecc_info *ecc;
> > +	bool use_datain = false;
> >  	int jedec_version = 0;
> >  	char id[5];
> >  	int i, val, ret;
> > @@ -40,25 +41,32 @@ int nand_jedec_detect(struct nand_chip *chip)
> >  		return 0;
> >  
> >  	/* JEDEC chip: allocate a buffer to hold its parameter page */
> > -	p = kzalloc(sizeof(*p), GFP_KERNEL);
> > -	if (!p)
> > +	pbuf = kzalloc(sizeof(*pbuf) * JEDEC_PARAM_PAGES, GFP_KERNEL);
> > +	if (!pbuf)
> >  		return -ENOMEM;
> >  
> > -	ret = nand_read_param_page_op(chip, 0x40, NULL, 0);
> > -	if (ret) {
> > -		ret = 0;
> > -		goto free_jedec_param_page;
> > -	}
> > +	if (!nand_has_exec_op(chip) ||
> > +	    (nand_read_data_op(chip, &pbuf[0], sizeof(*pbuf), true, true) == 0))
> > +		use_datain = true;
> >  
> >  	for (i = 0; i < JEDEC_PARAM_PAGES; i++) {
> > -		ret = nand_read_data_op(chip, p, sizeof(*p), true, false);
> > +		if (!i)
> > +			ret = nand_read_param_page_op(chip, 0x40, &pbuf[i],
> > +						      sizeof(*pbuf));
> > +		else if (use_datain)
> > +			ret = nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf),
> > +						true, false);
> > +		else
> > +			ret = nand_change_read_column_op(chip, sizeof(*pbuf) * i,
> > +							 &pbuf[i], sizeof(*pbuf),
> > +							 true);  
> 
> Now that you only ever read a page at a time, and given you don't do
> the majority_bit() thing when all pages are corrupted, I'd suggest
> sticking to one sizeof(*p) allocation and getting rid of the pbuf var.

Agreed, this is not truly necessary, but I am sure the majority_bit
calculation could definitely fit here so I was hoping it could get
added someday?
 
> 
> But it's not a big deal, so feel free to add
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> if you don't want to send a new version.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
