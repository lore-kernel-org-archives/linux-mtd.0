Return-Path: <SRS0=1hFJ=W5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6DBC3A59B
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 06:54:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF48521881
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 06:54:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JbmpYtnZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF48521881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFbMng7tWyHIZHVfWItMDDnQTgx3rophYSt/Y1Iff/Q=; b=JbmpYtnZXH7tY5
	GE/yWjw4N1OXG7kXbW50UJZMYum8rpAGcbzr5tcr/shX6hapBFgkhaneQ+WdAqjFLeMTERJPe8TBz
	iN3XyuOOUtF9W7l30p61gaAYhNU3W9JmPcRm//46VMj805WnF8JfE9bZ4O9KH+MONoCPvpnIHFYi2
	hIvE48504tK7I0QI66n4xGFe6d0Inh2LTLgdAapoACAqk7/Hu8OKIO0EEumOPXxkfbsG92YMd7PXz
	3xVyXtqWto4OiAsrsSQT0A0M4F/21ZzXzjs6gWcq6kakMulGbMwpqzcZ+7ORdVBkqS18qPV9k2tZx
	7mmMddI6j5ozNRWooV/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4gEA-00008h-51; Mon, 02 Sep 2019 06:54:14 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4gE7-00008A-6I
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2019 06:54:12 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x826r6WT086056;
 Mon, 2 Sep 2019 14:53:06 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 47C3EA819EB3BFC4B9A5;
 Mon,  2 Sep 2019 14:53:07 +0800 (CST)
In-Reply-To: <20190830115100.3fec9bf1@xps13>
References: <1566280428-4159-1-git-send-email-masonccyang@mxic.com.tw>	<20190824130329.68f310aa@xps13>
 <OF22C5A579.E2E7676F-ON48258465.002F7F69-48258465.00322849@mxic.com.tw>
 <20190830115100.3fec9bf1@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] Add support for Macronix NAND randomizer
MIME-Version: 1.0
X-KeepSent: 08E1C5EC:4DAEB179-48258469:0025AFFA;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF08E1C5EC.4DAEB179-ON48258469.0025AFFA-48258469.0025D2F2@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 2 Sep 2019 14:53:08 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/09/02 PM 02:53:07,
 Serialize complete at 2019/09/02 PM 02:53:07
X-MAIL: TWHMLLG3.macronix.com x826r6WT086056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_235411_503500_06D5B146 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: kstewart@linuxfoundation.org, vigneshr@ti.com, bbrezillon@kernel.org,
 juliensu@mxic.com.tw, richard@nod.at, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, tglx@linutronix.de, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel, 

 
> > > > 
> > > > If subpage write not available with hardware ECC, for example,
> > > > NAND chip options NAND_NO_SUBPAGE_WRITE be set in driver and
> > > > randomizer function is recommended for high-reliability.
> > > > Driver checks byte 167 of Vendor Blocks in ONFI parameter page 
table
> > > > to see if this high-reliability function is supported.
> > > > 
> > > 
> > > You did not flagged this patch as a v2 and forgot about the 
changelog.
> > > You did not listen to our comments in the last version neither. I 
was
> > > open to a solution with a specific DT property for warned users but 
I
> > > don't see it coming.
> > > 
> > 
> > Based on your comments by specific DT property for randomizer support.
> > to add a new property in children nodes:
> > 
> > i.e,.
> > 
> > nand: nand-controller@43c30000 {
> > 
> >                 nand@0 {
> >                         reg = <0>;
> >                         nand-reliability = "randomizer";
> 
>                           mxic,enable-randomizer-otp;
> 
> Would be better (with the proper documentation in the bindings).
> 

okay, thanks for your opinions.

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
