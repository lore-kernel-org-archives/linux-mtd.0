Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077A5C2BA19
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 02:17:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE57206D4
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 02:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y7Vy8knI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BE57206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJMMEcWAZqiLjfn/6Yjka1zkI+Lq2EDWjP5HlFaRZIg=; b=Y7Vy8knIfoHLUF
	fAfL/FxN5761uzHda+MH6t0chbzl7YIIUKp+HWNzWUBCNXKRn6y9X9K0JldUInAm+Fx4HfldITv7d
	gvVi0/cTOPLcl2SOT0TRUfnJ+DOpzVl41hopZcJi3WvoYuP4o2Lop9OjGhCRnhRhSWftF07CQMGgs
	D59067NHLOW80HtMhQJXTOzGrh11u0j1DLpz0ApITXsTUzz1ROdmlABuTGZD537zgS6WO+Q7xcQyO
	WYzTq9c19CsUjO6krsABRmOc8Rd1iPzKOaiVXnghZZlqNOJiIDVT3QhlBj7pKIQFqwkNzatiGfzcl
	i84QORJJOOe3oPdktggg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR4ws-0005F6-B1; Wed, 22 Apr 2020 02:17:14 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR4wp-0005Cu-Kc
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 02:17:13 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 03M2GmYg076103;
 Wed, 22 Apr 2020 10:16:48 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id AE49095BC791A1749798;
 Wed, 22 Apr 2020 10:16:48 +0800 (CST)
In-Reply-To: <3097723.HxHl8gbcWJ@192.168.0.120>
References: <1586163611-4565-1-git-send-email-masonccyang@mxic.com.tw>
 <1586163611-4565-3-git-send-email-masonccyang@mxic.com.tw>
 <3097723.HxHl8gbcWJ@192.168.0.120>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add mx25u51245g support
MIME-Version: 1.0
X-KeepSent: 415076FF:CD74781E-48258552:000C02E7;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF415076FF.CD74781E-ON48258552.000C02E7-48258552.000C8626@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 22 Apr 2020 10:16:48 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/04/22 AM 10:16:48,
 Serialize complete at 2020/04/22 AM 10:16:48
X-MAIL: TWHMLLG3.macronix.com 03M2GmYg076103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_191711_956809_50C5C13A 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


 Hi Tudor,

> On Monday, April 6, 2020 12:00:11 PM EEST Mason Yang wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know 
the
> > content is safe
> > 
> > mx25u51245g is a mass production for new design and
> > replace mx66u51235f(phase out).
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  drivers/mtd/spi-nor/macronix.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/macronix.c 
b/drivers/mtd/spi-nor/macronix.c
> > index c864ac8..e685aec 100644
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -73,6 +73,9 @@
> >         { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
> >                               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> >                               SPI_NOR_4B_OPCODES) },
> > +       { "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,
> 
> Shouldn't the ID be 0xc2953a?

no! 
it's 0xc2253a

please refer to Macronix website
https://www.macronix.com/zh-tw/products/NOR-Flash/Serial-NOR-Flash/Pages/spec.aspx?p=MX25U51245G&m=Serial%20NOR%20Flash&n=PM2244 


> 
> We usually don't add new flashes if they are not tested. Please specify 
in the 
> commit message with which controller you tested the flash. Please do the 
same 
> for the previous patch.

okay.

> 
> The minimal test is a read, erase, read back, write and read back. This 
> sequence should verify if read, erase and pp work fine.

sure.

> 
> Cheers,
> ta
> 

thanks for your time & review.
Mason


CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
