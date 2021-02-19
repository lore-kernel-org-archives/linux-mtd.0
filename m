Return-Path: <SRS0=dRpU=HV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFCBC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Feb 2021 02:49:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DDD564ED6
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Feb 2021 02:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DDD564ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:Subject:To:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wOGXAGuKL8tKQckrkg8wsatXTiYP/byDn1uu4U3Aqxw=; b=JK/S2n095RgkVzRE/4wKGN9nM
	slZbjWGv32tEXfk4NiEDTFj+8vlnP8sJYRY3Aj0LUK01dh11UQDZZcUlG4NJcKmdqy9CkidNB+Zvs
	FR8AKiq1f3kIMG7HMikzsxcBQ6purSw1BVwZJUcxG9Tout3hu5qLSwOo2SnPHsIiQx2lHNYRsmUgh
	m2Ur13m+R+9v/CaKubKsi687tn64dx34OWyqOSqogNswfKxBUllJNx1JMm4bGWNpkOEh/K9t2Ko8b
	XxNtffp6ybtwkaHecACm55NLPeF+JgT2pkiEwNS5wtb3nMSyUUAaoN7z+uxFQQtW2bDZ0OkPkRYki
	zQRu1zkMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCvq8-0005dw-N5; Fri, 19 Feb 2021 02:48:20 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCvq5-0005cf-Q0
 for linux-mtd@lists.infradead.org; Fri, 19 Feb 2021 02:48:19 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 11J2m5ms059237;
 Fri, 19 Feb 2021 10:48:05 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 3C031E833E14CF84986F;
 Fri, 19 Feb 2021 10:45:34 +0800 (CST)
In-Reply-To: <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
MIME-Version: 1.0
X-KeepSent: 903090DD:48800B65-48258681:000D205D;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF903090DD.48800B65-ON48258681.000D205D-48258681.000F2882@mxic.com.tw>
From: zhengxunli@mxic.com.tw
Date: Fri, 19 Feb 2021 10:45:34 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/02/19 AM 10:45:34,
 Serialize complete at 2021/02/19 AM 10:45:34
X-MAIL: TWHMLLG4.macronix.com 11J2m5ms059237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_214818_276269_81C9E387 
X-CRM114-Status: GOOD (  25.43  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw, michael@walle.cc,
 linux-mtd@lists.infradead.org, heiko.thiery@gmail.com, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi,

> 
> Subject
> 
> Re: spi-nor: maxronix MX25L12835F support
> 
> On 2/18/21 12:15 PM, Heiko Thiery wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you 
> know the content is safe
> > 
> > Hi Tudor,
> > 
> > [...]
> > 
> >>>> Thinking loud, now we do a static initialization of flash params, 
that
> >>>> can be overwritten dynamically by SFDP. How about doing the params 
init
> >>>> the other way around. Try first to dynamically discover the params 
via
> >>>> SFDP, and if SFDP fails or if it is not defined, do the static init 
via
> >>>> flags. That would spare some code. And new flash IDs will have less 
flags
> >>>> declared, and we'll better track faulty SFDP flashes.
> >>>
> >>> I am a newbie but it sounds reasonable. I made a first attempt and
> >>
> >> Let's first see if all parties find the idea good (I'll have to 
> double check
> >> it myself). Vignesh and others might help.
> >>
> >> Until then can you try the patch form below and see if you can do the
> >> reads in quad mode?
> >>
> >> Cheers,
> >> ta
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index 0522304f52fa..718d0b75df91 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -3099,7 +3099,8 @@ static int spi_nor_init_params(struct spi_nor 
*nor)
> >>         spi_nor_manufacturer_init_params(nor);
> >>
> >>         if ((nor->info->flags & (SPI_NOR_DUAL_READ | 
SPI_NOR_QUAD_READ |
> >> -                                SPI_NOR_OCTAL_READ | 
> SPI_NOR_OCTAL_DTR_READ)) &&
> >> +                                SPI_NOR_OCTAL_READ | 
> SPI_NOR_OCTAL_DTR_READ |
> >> +                                SPI_NOR_AIM_SFDP)) &&
> >>             !(nor->info->flags & SPI_NOR_SKIP_SFDP))
> >>                 spi_nor_sfdp_init_params(nor);
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> >> index 4a3f7f150b5d..3495549815e6 100644
> >> --- a/drivers/mtd/spi-nor/core.h
> >> +++ b/drivers/mtd/spi-nor/core.h
> >> @@ -338,6 +338,11 @@ struct flash_info {
> >>                                          * protection bits. 
> Usually these will
> >>                                          * power-up in a write-
> protected state.
> >>                                          */
> >> +#define SPI_NOR_AIM_SFDP       BIT(23) /* Try to parse SFDP. 
> Used by flashes
> >> +                                        * that share the same 
> JEDEC-ID, but
> >> +                                        * where a flash defines 
> the SFDP tables
> >> +                                        * and the other doesn't.
> >> +                                        */
> >>
> >>         /* Part specific fixup hooks. */
> >>         const struct spi_nor_fixups *fixups;
> >> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-
> nor/macronix.c
> >> index 9203abaac229..1ebce775eae4 100644
> >> --- a/drivers/mtd/spi-nor/macronix.c
> >> +++ b/drivers/mtd/spi-nor/macronix.c
> >> @@ -50,7 +50,8 @@ static const struct flash_info macronix_parts[] = {
> >>         { "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) 
},
> >>         { "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) 
},
> >>         { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) 
},
> >> -       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) 
},
> >> +       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256,
> >> +                             SECT_4K | SPI_NOR_AIM_SFDP) },
> >>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> >>         { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
> >>                               SECT_4K | SPI_NOR_DUAL_READ |
> > 
> > I tried your patch and it works like expected. I can now read the
> > whole flash in ~2sec while without that it was ~6sec.
> > 
> > # time dd if=/dev/mtd0 of=dump.bin
> > 32768+0 records in
> > 32768+0 records out
> > real 0m 2.08s
> > user 0m 0.01s
> > sys 0m 2.06s
> > 
> > vs.
> > 
> > # time dd if=/dev/mtd0 of=dump.bin
> > 32768+0 records in
> > 32768+0 records out
> > real 0m 6.16s
> > user 0m 0.05s
> > sys 0m 6.09s
> > 
> > 
> 
> Great, thanks!
> 
> > Should I prepare a patch with that change or will you do?
> 
> Let's wait for a few days, so others can intervene. I'd like to
> clarify what's happening on mx66l51235l too.

I asked our former colleague and he said that the product
mx66u51235f was discontinued for some reason. And mx25u51245g
uses a new design to replace it.

Thanks,
Zhengxun

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
