Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CAAC10F25
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 05:42:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D86CD208E4
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 05:42:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jdKQs/bg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D86CD208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZxipX4xO0IZraTZ+PTevimzeo8GO8hSirDlZItOkTE=; b=jdKQs/bgtkERVU
	ncRV+/4yanZTx2ZMTpz+kyPqnAzs0OyXnJ4LaonBBZADjfcdbnQgEKiXERyG/0HJMYKW80bMhmMv7
	qxrIhkMpQ2kX8pEVs+vyHAXmOoHHdhwmnpJBPRWkAM81XpdYV0/K+f+RFBGCHlFYmRio8uUNElIaM
	lQ28g6geb6DVIU0vC+KffdaGnkU4x2PMIKn9o9DHWTscZ+UTLRcEfi+5LGjudjrjTI85LYbVt5kxX
	HcFzDCi6ClGIInxNHswN++UX8xJcNDCzn9ZUkSj8vQnDb/N0m55rRZm8NkGnA0YgZ15z8pUbr+vkx
	4WK152uPx2O7g6SFNGxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBu8M-0003iY-4K; Wed, 11 Mar 2020 05:42:22 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBu8I-0003i4-8K
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 05:42:19 +0000
Received: from twhfm1p2.macronix.com (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 02B5eqqO017241;
 Wed, 11 Mar 2020 13:40:52 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 5E352C261D4C595B36D3;
 Wed, 11 Mar 2020 13:40:52 +0800 (CST)
In-Reply-To: <20200310203310.5fe74c57@collabora.com>
References: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>	<1583220084-10890-4-git-send-email-masonccyang@mxic.com.tw>
 <20200310203310.5fe74c57@collabora.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 3/4] mtd: rawnand: Add support manufacturer specific
 suspend/resume operation
MIME-Version: 1.0
X-KeepSent: 5C883176:AD73134D-48258528:000F5185;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF5C883176.AD73134D-ON48258528.000F5185-48258528.001F3544@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 11 Mar 2020 13:40:52 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/03/11 PM 01:40:52,
 Serialize complete at 2020/03/11 PM 01:40:52
X-MAIL: TWHMLLG4.macronix.com 02B5eqqO017241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_224218_572581_4659F2CA 
X-CRM114-Status: GOOD (  11.69  )
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

> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index bc2fa3c..c0055ed 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -1064,6 +1064,8 @@ struct nand_legacy {
> >   * @lock:      lock protecting the suspended field. Also used to
> >   *         serialize accesses to the NAND device.
> >   * @suspended:      set to 1 when the device is suspended, 0 when 
it's not.
> > + * @_suspend:      [REPLACEABLE] specific NAND device suspend 
operation
> > + * @_resume:      [REPLACEABLE] specific NAND device resume operation
> >   * @bbt:      [INTERN] bad block table pointer
> >   * @bbt_td:      [REPLACEABLE] bad block table descriptor for flash
> >   *         lookup.
> > @@ -1119,6 +1121,8 @@ struct nand_chip {
> > 
> >     struct mutex lock;
> >     unsigned int suspended : 1;
> > +   int (*_suspend)(struct nand_chip *chip);
> > +   void (*_resume)(struct nand_chip *chip);
> 
> I thought we agreed on not prefixing new hooks with _ ?

For [PATCH v2] series, you mentioned to drop the _ prefix 
of _lock/_unlock only and we finally patched to lock_area/unlock_area.

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
