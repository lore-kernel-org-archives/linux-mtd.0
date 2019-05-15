Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ADFC04AA7
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 06:47:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC0822084E
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 06:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ePR/ITyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC0822084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPGkwf9xiO6QFihkjJvvChsWOkxcjLheJUZE64snbeU=; b=ePR/ITyiNuMQBM
	a4CBGWVdtXbjIX8ASVQCgZEoxKLOf9LiB2JmMUso/Zn3Yc78dskGwYLRS6wvnT7Wbua99p7WRFvTS
	B5WCIMhY239HzAIcsaCzQn7K6YsmID1lytoq740ZR+OcO2jgD6DQSLYOT6mUPqrUwGQSoGK9ai3bf
	3jWBCctS0/paECkVcnH7AiyV/cB3bUZ7vX/mh49yN1WZLbkroc6slbYYZXx1b1S20AHURrNTE7E6n
	D7lK25jxNv5wIyCXT+kvXPagTP8VIfDfW/l0cehstbw0GoY+XFLKLWozfagKiIvizI0YJP9AfhxIY
	cjiQne+Bm4q3IVFsecSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQngu-0006qU-9t; Wed, 15 May 2019 06:47:04 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQngr-0006q2-MZ
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 06:47:03 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x4F6k794019550;
 Wed, 15 May 2019 14:46:07 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 8F91689F5AB5F1D369B3;
 Wed, 15 May 2019 14:46:07 +0800 (CST)
In-Reply-To: <20190512142835.4caddc8e@xps13>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>	<1555320234-15802-2-git-send-email-masonccyang@mxic.com.tw>
 <20190512142835.4caddc8e@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 1/4]  mfd: Add Macronix MX25F0A MFD controller driver
MIME-Version: 1.0
X-KeepSent: 4F52243F:0954FF8C-482583FB:0023B249;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF4F52243F.0954FF8C-ON482583FB.0023B249-482583FB.00252E6F@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 15 May 2019 14:46:07 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/05/15 PM 02:46:07,
 Serialize complete at 2019/05/15 PM 02:46:07
X-MAIL: TWHMLLG3.macronix.com x4F6k794019550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_234702_027381_AB539293 
X-CRM114-Status: GOOD (  11.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 marcel.ziswiler@toradex.com, paul.burton@mips.com, broonie@kernel.org,
 geert@linux-m68k.org, stefan@agner.ch, linux-mtd@lists.infradead.org,
 richard@nod.at, liang.yang@amlogic.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

 
> > Add a driver for Macronix MX25F0A multifunction device controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  drivers/mfd/Kconfig              |   9 ++
> >  drivers/mfd/Makefile             |   1 +
> >  drivers/mfd/mxic-mx25f0a.c       |  84 +++++++++++++++++++
> >  include/linux/mfd/mxic-mx25f0a.h | 175 
+++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 269 insertions(+)
> >  create mode 100644 drivers/mfd/mxic-mx25f0a.c
> >  create mode 100644 include/linux/mfd/mxic-mx25f0a.h
> > 
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 26ad646..7e99e93 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -823,6 +823,15 @@ config MFD_MAX8998
> >       additional drivers must be enabled in order to use the 
functionality
> >       of the device.
> > 
> > +config MFD_MXIC_MX25F0A
> > +   tristate "Macronix mx25f0a multifunction device support"
> > +   select MFD_CORE
> > +   help
> > +     This supports for Macronix mx25f0a multifunction device 
controller
> > +     for raw nand or spi. You have to select individual components 
like
> 
> Please use upper case for acronyms in plain English: NAND, SPI

okay, will fix.

And I also would like to remove "mx25f0a" char.

patch to:
------------------------------------------------------------------------
config MFD_MXIC_FMC
   tristate "Macronix Flash Memory Controller support"
   select MFD_CORE
   help
     This supports Macronix Flash Memory Controller for raw NAND and SPI.
     You have to select individual components like raw NAND controller
     or SPI host controller under the corresponding  menus.
-------------------------------------------------------------------------

thanks for your review.

best regards,
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
