Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E12EC34022
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 03:15:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3072D206EF
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 03:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ONLYplmz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3072D206EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzeWE8RqacqP5Q2jvq9J86R8WNWgSCIbfq4EZR8BAO8=; b=ONLYplmz5m7Dwu
	F9s0Jk0m8SgDzPXlOSPzb7uNQpbYK6lAuuj/u64+44zMaIoe4Aufve47QLA8H11JB0BGAj1MY/siy
	n6LbGJEO3Gq/8Q68ykYmJJBC9Lw0GgCwu0cVunmT9QnC29BbWTQVMj1Fc6QVx1cgk8dCYtvFel4bt
	HMH8S00TihxsJIYKAwOzC6HqndiNhqYT3H6sAULcPClE7A4kS/wOiIX2IViumcnrke7mfoXEkv6a3
	oOFSNJa4vMjgSC2uWd4jblJ+Sjpe71zrnfj1Hbppfi/1yWZaHLkbWobhulXvj0nB35cqyFyD2DhbD
	ysmY9B0Kq1JWlGYHcuig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3tLd-0006fA-CU; Tue, 18 Feb 2020 03:14:57 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3tLH-0006Ho-Em
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 03:14:38 +0000
Received: from twhfm1p2.macronix.com (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 01I3Dk5L004086;
 Tue, 18 Feb 2020 11:13:46 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id C236F781A13725FAE6CD;
 Tue, 18 Feb 2020 11:13:46 +0800 (CST)
In-Reply-To: <20200217100124.6ff71191@xps13>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>	<1572256527-5074-2-git-send-email-masonccyang@mxic.com.tw>
 <20200109203055.2370a358@collabora.com>	<OF505D0437.0130F15A-ON48258511.002C7F75-48258511.002D4341@mxic.com.tw>
 <20200217100124.6ff71191@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Add support manufacturer specific
 lock/unlock operatoin
MIME-Version: 1.0
X-KeepSent: 888BBBE2:74456DA3-48258512:0011688B;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF888BBBE2.74456DA3-ON48258512.0011688B-48258512.0011BE25@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 18 Feb 2020 11:13:47 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/02/18 AM 11:13:46,
 Serialize complete at 2020/02/18 AM 11:13:46
X-MAIL: TWHMLLG4.macronix.com 01I3Dk5L004086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_191435_819993_1E363E3F 
X-CRM114-Status: GOOD (  11.37  )
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
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,


> > > >  /* Set default functions */
> > > >  static void nand_set_defaults(struct nand_chip *chip)
> > > >  {
> > > > @@ -5782,8 +5810,8 @@ static int nand_scan_tail(struct nand_chip 
> > *chip)
> > > >     mtd->_read_oob = nand_read_oob;
> > > >     mtd->_write_oob = nand_write_oob;
> > > >     mtd->_sync = nand_sync;
> > > > -   mtd->_lock = NULL;
> > > > -   mtd->_unlock = NULL;
> > > > +   mtd->_lock = nand_lock;
> > > > +   mtd->_unlock = nand_unlock;
> > > >     mtd->_suspend = nand_suspend;
> > > >     mtd->_resume = nand_resume;
> > > >     mtd->_reboot = nand_shutdown;
> > > > diff --git a/include/linux/mtd/rawnand.h 
b/include/linux/mtd/rawnand.h
> > > > index 4ab9bcc..2430ecd 100644
> > > > --- a/include/linux/mtd/rawnand.h
> > > > +++ b/include/linux/mtd/rawnand.h
> > > > @@ -1136,6 +1136,9 @@ struct nand_chip {
> > > >        const struct nand_manufacturer *desc;
> > > >        void *priv;
> > > >     } manufacturer;
> > > > +
> > > > +   int (*_lock)(struct nand_chip *chip, loff_t ofs, uint64_t 
len);
> > > > +   int (*_unlock)(struct nand_chip *chip, loff_t ofs, uint64_t 
len); 
> > > 
> > > Please drop this _ prefix. 
> > 
> > Drop _ prefix of _lock will get compile error due to there is already 
> > defined "struct mutex lock" in struct nand_chip.
> 
> Right!
> 
> > 
> > What about keep this _ prefix or patch it to blocklock/blockunlock,
> > i.e.,
> > int (*blocklock)(struct nand_chip *chip, loff_t ofs, uint64_t len);
> > int (*blockunlock)(struct nand_chip *chip, loff_t ofs, uint64_t len);
> 
> What about lock_area() unlock_area() ? Seems more accurate to me, tell
> me if I'm wrong.

yup, you are right!

Using lock/unlock_area is better, will patch it.

thanks for your comments.
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
