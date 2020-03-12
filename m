Return-Path: <SRS0=7qHi=45=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C761FC2BAEE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 01:49:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDCB320739
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 01:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e7CRLLkt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDCB320739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqGFawpdmWAAnEHlu11tBAPuAvsIjfiMrIdXc6PGul0=; b=e7CRLLktbEcS4d
	pmW/vymazK3rCqrFbyqQI6Ynj3iXTsLqU52pjZDGJLo2mHuXbuPOz6Ijc0+tyYvP5Zixexwefkn9X
	rxPcgDjU1eRgXTMvJwbd1E2P9NbfwcT22YTQO312EAtyWr0Zdf4W2Jt6SuTaIycm08nDnwK0dz91D
	5HDgcA37hdqABW/OAgOtUjM+umq7QAnDHQNTCz1RIHHMUgYcBsx/SZ/BDg+w35QREzezGVj1d5GTN
	1FZE3KcM6Fq2P0xOTZLen7BJuhM/onLS6Cb8zpkkkxhMSQIDfWHcP1kRqzWx1B5XzjHNedAp9ML8O
	SGSQ8yS39XGtCHA4j0YA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCCyK-0007Lw-Qh; Thu, 12 Mar 2020 01:49:16 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCCyH-0007LU-Fe
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2020 01:49:15 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 02C1mcxx043812;
 Thu, 12 Mar 2020 09:48:38 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 43F1EBB4C362905B2749;
 Thu, 12 Mar 2020 09:48:38 +0800 (CST)
In-Reply-To: <20200311090101.5ac66997@collabora.com>
References: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>	<1583220084-10890-4-git-send-email-masonccyang@mxic.com.tw>
 <20200310203930.2b8c0cfb@collabora.com>	<20200310204142.540fc7c4@collabora.com>
 <OF4AD2D1A1.2B35FBFA-ON48258528.0021AD65-48258528.00223C9B@mxic.com.tw>
 <20200311090101.5ac66997@collabora.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 3/4] mtd: rawnand: Add support manufacturer specific
 suspend/resume operation
MIME-Version: 1.0
X-KeepSent: 618C17D0:837A4D16-48258529:0009AFE3;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF618C17D0.837A4D16-ON48258529.0009AFE3-48258529.0009F227@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Thu, 12 Mar 2020 09:48:38 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/03/12 AM 09:48:38,
 Serialize complete at 2020/03/12 AM 09:48:38
X-MAIL: TWHMLLG3.macronix.com 02C1mcxx043812
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_184913_778429_E23570A3 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de, rfontana@redhat.com,
 linux-mtd@lists.infradead.org, stefan@agner.ch, miquel.raynal@bootlin.com,
 tglx@linutronix.de, allison@lohutok.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Boris,

> > > > > ---
> > > > >  drivers/mtd/nand/raw/nand_base.c | 11 ++++++++---
> > > > >  include/linux/mtd/rawnand.h      |  4 ++++
> > > > >  2 files changed, 12 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/mtd/nand/raw/nand_base.c 
> > b/drivers/mtd/nand/raw/nand_base.c
> > > > > index 769be81..b44e460 100644
> > > > > --- a/drivers/mtd/nand/raw/nand_base.c
> > > > > +++ b/drivers/mtd/nand/raw/nand_base.c
> > > > > @@ -4327,7 +4327,9 @@ static int nand_suspend(struct mtd_info 
*mtd)
> > > > >     struct nand_chip *chip = mtd_to_nand(mtd);
> > > > > 
> > > > >     mutex_lock(&chip->lock);
> > > > > -   chip->suspended = 1;
> > > > > +   if (chip->_suspend)
> > > > > +      if (!chip->_suspend(chip))
> > > > > +         chip->suspended = 1; 
> > > 
> > > Shouldn't you propagate the error to the caller if chip->_suspend()
> > > fails? 
> > 
> > Currently, chip->suspend() just do sending command to nand chip and
> > I think caller could check chip->suspend = 1 or 0 to know the status
> > of nand chip.
> 
> No, it can't. The caller (AKA the MTD layer) has no idea about this
> chip->suspend field, actually it doesn't even know about the nand_chip
> struct. The mtd->_suspend() hook is here to abstract HW details, so
> it's the raw NAND framework responsibility to propagate the error code
> returned by chip->suspend().

Got it, thanks!

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
