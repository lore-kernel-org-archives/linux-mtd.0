Return-Path: <SRS0=x2+d=ZK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9A8C432C3
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 17:40:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46AB32190F
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 17:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HiNJy6Sh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46AB32190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZHTyiHkH/og3lc50MDmMtPbP76QmTKKJiyXqDzYPxY=; b=HiNJy6ShhHWFvM
	IU+va7P5O7R63LDXhvCDG8wztAsbjTD4+F/rSj9wOAwNA767CwA9oAwuPFFyaTFjPEbvdpMjC8gQE
	P6lS3MXmzTvCsAMFpBmwnBqNBwBm2AURHS61bWPBaayVq8u2S0DwRno46gb1Up3y0PZqtcF5GdPZG
	osKDJf+ystK7I4IAaTwV0/wWy0Y1X23pnLbR1+LwlMu+gi7ghBTYDZwPK6Hw/YlbQFOdbk1K42HXO
	iqvlZlXnL56R6n3YIj+m2bB87iElGi0jq1R31hnCaLB4dDjEIUMIMCPr3pd5wEm0ih652vpHV1dAS
	zUt8DDlwcl/oXFaGMzEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWl0R-0007rq-IQ; Mon, 18 Nov 2019 17:40:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWl0M-00075e-EG
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2019 17:40:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0A4F728AE9C;
 Mon, 18 Nov 2019 17:39:59 +0000 (GMT)
Date: Mon, 18 Nov 2019 18:39:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [EXT] [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Message-ID: <20191118183954.4091abdc@collabora.com>
In-Reply-To: <20191118140951.dlvsozieeatnmd7d@pengutronix.de>
References: <20191108074852.18507-1-m.felsch@pengutronix.de>
 <DM6PR08MB6396AB87FEE731C7B3588358B84D0@DM6PR08MB6396.namprd08.prod.outlook.com>
 <20191118140951.dlvsozieeatnmd7d@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_094002_759982_1656D204 
X-CRM114-Status: GOOD (  24.97  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "Shivamurthy Shastri \(sshivamurthy\)" <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 18 Nov 2019 15:09:51 +0100
Marco Felsch <m.felsch@pengutronix.de> wrote:

> Hi Shiva,
> 
> On 19-11-18 10:16, Shivamurthy Shastri (sshivamurthy) wrote:
> > Hi Marco,
> >   
> > > 
> > > The MT29F1G01AAADD is a single die, SLC based SPI NAND. It has a
> > > capacity of 1Gb and supports 4-bit ECC. The datasheet can be found [1].
> > > 
> > > Unfortunatly the linked device is marked as EoL, but I will expect that
> > > the MT29F1G01AAADDH4-ITX behaves the same way.
> > > 
> > > [1]
> > > https://nam01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdata
> > > sheet.octopart.com%2FMT29F1G01AAADDH4-IT%3AD-Micron-datasheet-
> > > 11572380.pdf&amp;data=02%7C01%7Csshivamurthy%40micron.com%7C21a
> > > da5347828461980a408d7642021a9%7Cf38a5ecd28134862b11bac1d563c806f%
> > > 7C0%7C1%7C637087961499818902&amp;sdata=%2Fh%2FHfUoSnl8qqSVClVfp
> > > ykvi3UiDEZFTn%2BVCsAf9IaM%3D&amp;reserved=0
> > > 
> > > Cc: Peter Pan <peterpandong@micron.com>
> > > Cc: sshivamurthy@micron.com
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > > v2:
> > > - Convert 0x10 into 16 for ooblayout description
> > > - Don't break web link within commit message
> > > 
> > >  drivers/mtd/nand/spi/micron.c | 68
> > > +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 68 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> > > index 7d7b1f7fcf71..70e278759bd3 100644
> > > --- a/drivers/mtd/nand/spi/micron.c
> > > +++ b/drivers/mtd/nand/spi/micron.c
> > > @@ -34,6 +34,18 @@ static
> > > SPINAND_OP_VARIANTS(update_cache_variants,
> > >  		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
> > >  		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> > > 
> > > +static SPINAND_OP_VARIANTS(read_cache_variants_mt29f1g01aaadd,
> > > +		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> > > +		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> > > +		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL,
> > > 0),
> > > +		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL,
> > > 0));
> > > +
> > > +static SPINAND_OP_VARIANTS(write_cache_variants_mt29f1g01aaadd,
> > > +		SPINAND_PROG_LOAD(true, 0, NULL, 0));
> > > +
> > > +static SPINAND_OP_VARIANTS(update_cache_variants_mt29f1g01aaadd,
> > > +		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> > > +
> > >  static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, int section,
> > >  					struct mtd_oob_region *region)
> > >  {
> > > @@ -90,6 +102,52 @@ static int mt29f2g01abagd_ecc_get_status(struct
> > > spinand_device *spinand,
> > >  	return -EINVAL;
> > >  }
> > > 
> > > +static int mt29f1g01aaadd_ooblayout_ecc(struct mtd_info *mtd, int
> > > section,
> > > +					struct mtd_oob_region *region)
> > > +{
> > > +	if (section > 3)
> > > +		return -ERANGE;
> > > +
> > > +	region->offset = (section * 16) + 8;
> > > +	region->length = 8;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mt29f1g01aaadd_ooblayout_free(struct mtd_info *mtd, int
> > > section,
> > > +					 struct mtd_oob_region *region)
> > > +{
> > > +	if (section > 3)
> > > +		return -ERANGE;
> > > +
> > > +	/* 2 bytes for the BBM + 2 bytes to skip non-ecc memory */
> > > +	region->offset = (section * 16) + 4;
> > > +	region->length = 4;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct mtd_ooblayout_ops mt29f1g01aaadd_ooblayout = {
> > > +	.ecc = mt29f1g01aaadd_ooblayout_ecc,
> > > +	.free = mt29f1g01aaadd_ooblayout_free,
> > > +};
> > > +
> > > +static int mt29f1g01aaadd_ecc_get_status(struct spinand_device *spinand,
> > > +					 u8 status)
> > > +{
> > > +	switch (status & STATUS_ECC_MASK) {
> > > +	case STATUS_ECC_NO_BITFLIPS:
> > > +		return 0;
> > > +	case STATUS_ECC_HAS_BITFLIPS:
> > > +		/* 1 to 4-bit error detected and corrected */
> > > +		return 4;
> > > +	case STATUS_ECC_UNCOR_ERROR:
> > > +		return -EBADMSG;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +}
> > > +
> > >  static const struct spinand_info micron_spinand_table[] = {
> > >  	SPINAND_INFO("MT29F2G01ABAGD", 0x24,
> > >  		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
> > > @@ -100,6 +158,16 @@ static const struct spinand_info
> > > micron_spinand_table[] = {
> > >  		     0,
> > >  		     SPINAND_ECCINFO(&mt29f2g01abagd_ooblayout,
> > >  				     mt29f2g01abagd_ecc_get_status)),
> > > +	SPINAND_INFO("MT29F1G01AAADD", 0x12,
> > > +		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 2, 1, 1),
> > > +		     NAND_ECCREQ(4, 2048),  
> > 
> > I think, this should be NAND_ECCREQ(4, 512).  
> 
> I don't thinks so, according the datasheet [1], section ECC Protection:
> 
> 8<--------------------------------------
> During a PROGRAM operation, the device calculates an ECC code on the 2k
> page in the cache register, before the page is written to the NAND
> Flash array. The ECC code is stored in the spare area of the page.
> 8<--------------------------------------

Looking at "Table 11: ECC Protection" it really seems to be 4bit/512. I
think the sentence you quoted just means the ECC is calculated for each
512 bytes block in the page and written at once (no subpage write).
BTW, there's an easy way to know who's right => nandbiterrs.

> 
> [1] https://datasheet.octopart.com/MT29F1G01AAADDH4-IT:D-Micron-datasheet-11572380.pdf
> 
> Regards,
>   Marco
> 
> >   
> > > +		     SPINAND_INFO_OP_VARIANTS(
> > > +
> > > 	&read_cache_variants_mt29f1g01aaadd,
> > > +
> > > 	&write_cache_variants_mt29f1g01aaadd,
> > > +
> > > 	&update_cache_variants_mt29f1g01aaadd),
> > > +		     0,
> > > +		     SPINAND_ECCINFO(&mt29f1g01aaadd_ooblayout,
> > > +				     mt29f1g01aaadd_ecc_get_status)),
> > >  };
> > > 
> > >  static int micron_spinand_detect(struct spinand_device *spinand)
> > > --
> > > 2.20.1  
> > 
> > Thanks,
> > Shiva
> >   
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
