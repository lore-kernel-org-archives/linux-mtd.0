Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EC2C04AB4
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 01:30:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A85692084A
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 01:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tGygZBK8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A85692084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCEIxHeZ8Eb3dFohGB85VAuhdKCAJ7MY++p3in5k3eI=; b=tGygZBK8i71w4C
	1PZalQAJMTG/yhRPu0fornZiLYPZI3ieLovdYW/QcVdueMYK5iE+/TspRNtosWmRrPZd0uH4EfAD2
	lTZjqLE2BSdk7cS5j7fy6u4dXVZ81WF1gBPNlcPdsDFfWAQu416dU0/lXcBML+V5/tFPCWb7cb56N
	EWG4xJTBcY23HDXPm3R+MoR3j/Ly007890CDoJ2IImSr5JnZ9VX4RBF46eNGwVs416lcrhQmsdrQT
	eDvOMAnZAzmdApQqmUcjySCcXVyifn30lNGYO72pUm7e+KrUZlqQ+782tJWjXT9MjPdHOWZZ/qUv0
	EqVzOmaZj3rwRgVXv7RQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQikq-0007Ri-3C; Wed, 15 May 2019 01:30:48 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQiki-0007Kj-B0
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 01:30:46 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x4F1U0ch051830;
 Wed, 15 May 2019 09:30:00 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id A36C041D2DF341FE82B2;
 Wed, 15 May 2019 09:30:00 +0800 (CST)
In-Reply-To: <20190514094100.34d2a6ba@windsurf.home>
References: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>	<20190510153704.33de9568@windsurf.home>
 <OF1EDBA487.7723094D-ON482583F9.00297ABF-482583F9.0029E3EE@mxic.com.tw>	<20190513114059.3934b0bb@windsurf.home>
 <OFB5D53BFC.6B44E7E0-ON482583FA.00090982-482583FA.000A5E93@mxic.com.tw>
 <20190514094100.34d2a6ba@windsurf.home>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v1] mtd: rawnand: Add Macronix NAND read retry support
MIME-Version: 1.0
X-KeepSent: 337888B3:25F9D561-482583FB:00070B62;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF337888B3.25F9D561-ON482583FB.00070B62-482583FB.00083D9C@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 15 May 2019 09:30:01 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/05/15 AM 09:30:00,
 Serialize complete at 2019/05/15 AM 09:30:00
X-MAIL: TWHMLLG3.macronix.com x4F1U0ch051830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_183040_674834_95413E96 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Thomas,

> 
> > > > 
-------------------------------------------------------------------
> > > >  static void macronix_nand_onfi_init(struct nand_chip *chip)
> > > >  {
> > > >           struct nand_parameters *p = &chip->parameters;
> > > >           struct nand_onfi_vendor_macronix *mxic = (void 
> > > > *)p->onfi->vendor; 
> > > 
> > > Why cast to void*, instead of casting directly to struct
> > > nand_onfi_vendor_macronix * ? 
> > 
> > Due to got a warning:
> > 
> >  warning: initialization from incompatible pointer type
> >   struct nand_onfi_vendor_macronix *mxic = p->onfi->vendor;
> 
> You didn't look at my code, I suggested:
> 
>    mxic = (struct nand_onfi_vendor_macronix *) p->info->vendor;

Oops, sorry that I did not pay attention to it.

Will patch it by your comments.

  static void macronix_nand_onfi_init(struct nand_chip *chip)
  {
          struct nand_parameters *p = &chip->parameters;
          struct nand_onfi_vendor_macronix *mxic;
 
          if (!p->onfi)
                  return;
 
          mxic = (struct nand_onfi_vendor_macronix *) p->onfi->vendor;
          if ((mxic->reliability_func & MACRONIX_READ_RETRY_BIT) == 0)
                  return;
 
          chip->read_retries = MACRONIX_READ_RETRY_MODE;
          chip->setup_read_retry = macronix_nand_setup_read_retry;
 
          if (p->supports_set_get_features) {
                  bitmap_set(p->set_feature_list,
                             ONFI_FEATURE_ADDR_READ_RETRY, 1);
                  bitmap_set(p->get_feature_list,
                             ONFI_FEATURE_ADDR_READ_RETRY, 1);
          }
  }


thanks & best regards,
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
