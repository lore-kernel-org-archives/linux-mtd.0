Return-Path: <SRS0=wiZC=WP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36262C3A5A0
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 13:31:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038032086C
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 13:31:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o/nmwFyp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038032086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WY0GwFE02+wXtbd/uoRuytQKkR3OvDxmpMN6HRlwYG8=; b=o/nmwFypQzv3ke
	NcBImgwB1aFkt0yFkK/2to8cDaw6JQs866TnTfrfzoxphVMQAQ9ARMCBTlQI2QT5ECilpBFk9pG//
	zcBQRBIPbrdKD1x15FN7EN9efNPtekrG0EFqC9h6a61jZv2j0ZoHaFSeQXu1w28XGQqIrRNf3reJ1
	s2SgN15j8wabRm8PgycwMyueY/ATWpqgWwutlhHAKOTFJ2vgT65GIfe8s9Do+FbTTCJyYZbbc/kvR
	nv7mx3UBPEJ8PXHBoOKQGkcKdESH7EykDGo4WnVhDbKR8Gj+0wMlG4535NlpegzIhUq70kXhlCayS
	2/RzFni1zuFz/jOET+/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzhkR-0007Cr-Eu; Mon, 19 Aug 2019 13:30:59 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzhkK-0007CS-Va
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2019 13:30:56 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1hzhkC-0001Gu-L9; Mon, 19 Aug 2019 15:30:44 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1hzhkA-0000se-7C; Mon, 19 Aug 2019 15:30:42 +0200
Date: Mon, 19 Aug 2019 15:30:42 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Message-ID: <20190819133042.23jpf3eap2u5teuo@pengutronix.de>
References: <20190814082232.2119-1-m.felsch@pengutronix.de>
 <20190819101718.39b3a5ca@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190819101718.39b3a5ca@xps13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:27:45 up 93 days, 19:45, 56 users,  load average: 0.02, 0.03, 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_063053_018196_C087C74E 
X-CRM114-Status: GOOD (  20.68  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, frieder.schrempf@kontron.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On 19-08-19 10:17, Miquel Raynal wrote:
> Hi Marco,
> =

> Marco Felsch <m.felsch@pengutronix.de> wrote on Wed, 14 Aug 2019
> 10:22:32 +0200:
> =

> > The MT29F1G01AAADD is a single die, SLC based SPI NAND. It has a
> > capacity of 1Gb and supports 4-bit ECC. The datasheet can be found [1].
> > =

> > Unfortunatly the linked device is marked as EoL, but I will expect that
> > the MT29F1G01AAADDH4-ITX behaves the same way.
> > =

> > [1] https://datasheet.octopart.com/ \
> >       MT29F1G01AAADDH4-IT:D-Micron-datasheet-11572380.pdf
> > =

> > Cc: Peter Pan <peterpandong@micron.com>
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/mtd/nand/spi/micron.c | 68 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> > =

> > diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micro=
n.c
> > index 7d7b1f7fcf71..9d63450afc69 100644
> > --- a/drivers/mtd/nand/spi/micron.c
> > +++ b/drivers/mtd/nand/spi/micron.c
> > @@ -34,6 +34,18 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
> >  		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
> >  		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> >  =

> > +static SPINAND_OP_VARIANTS(read_cache_variants_mt29f1g01aaadd,
> > +		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> > +		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> > +		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
> > +		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
> > +
> > +static SPINAND_OP_VARIANTS(write_cache_variants_mt29f1g01aaadd,
> > +		SPINAND_PROG_LOAD(true, 0, NULL, 0));
> > +
> > +static SPINAND_OP_VARIANTS(update_cache_variants_mt29f1g01aaadd,
> > +		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> > +
> >  static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, int sect=
ion,
> >  					struct mtd_oob_region *region)
> >  {
> > @@ -90,6 +102,52 @@ static int mt29f2g01abagd_ecc_get_status(struct spi=
nand_device *spinand,
> >  	return -EINVAL;
> >  }
> >  =

> > +static int mt29f1g01aaadd_ooblayout_ecc(struct mtd_info *mtd, int sect=
ion,
> > +					struct mtd_oob_region *region)
> > +{
> > +	if (section > 3)
> > +		return -ERANGE;
> > +
> > +	region->offset =3D (section * 0x10) + 8;
> =

> Any reason to use hex here?         ^
> =

> If not I would prefer decimal numbers.

Since the datasheet describe it in hex to.

Can you have a look on [1] table 11? May we do something like:

	region->offset =3D (section * 0x10) + 0x8;

[1] https://datasheet.octopart.com/MT29F1G01AAADDH4-IT:D-Micron-datasheet-1=
1572380.pdf

> =

> Otherwise looks fine.

Anyway I can change the above code to use only decimal values if you
like it more.

Regards,
  Marco

> =

> Thanks,
> Miqu=E8l
> =


-- =

Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
