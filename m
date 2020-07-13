Return-Path: <SRS0=9vQs=AY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05099C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 05:59:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C212D2073A
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 05:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PzgZjMAa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C212D2073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:Subject:To:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SrorWmUmnF0Cc9JU24EozVg6unN34ISOmoHIG6bHIYo=; b=PzgZjMAa1QLQ1vQYIGHpzXOFj
	FmoKLA1Y0LYusSXqwXVRTZUMI5BTZFQ+P9TApax1IdPj1skDW9HxRiI9w0DxQE0LUv1Jlt7/MtWcz
	jFjo3OrQ6EFcTVpoEwSELgB5dxwMJBg3w1IYqgTn0ugEXyIyGQQg6QrUxUw4rGfZjLWWTSyY5KoCq
	w/DC0Su//IHlsi08GDhLUnnzg/uy9fmEG7uBFznCsN9WXxGd+Po1Y3NdRPYKc5s8z9vHGj/mo7lzE
	UI52mxq58NlUpOh5mr9ab6/u/Dl07jGxG/4WqhC6Olnm0Dqv1wZvrxkDSwNm/0PhmUOpZk7o1bRg/
	O+mfEn7vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurUJ-0007em-O4; Mon, 13 Jul 2020 05:58:51 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurUH-0007dv-MM
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2020 05:58:50 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 06D5wVAs075451;
 Mon, 13 Jul 2020 13:58:31 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id B08C44370D23BF98939D;
 Mon, 13 Jul 2020 13:58:31 +0800 (CST)
In-Reply-To: <1590737775-4798-7-git-send-email-masonccyang@mxic.com.tw>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
 <1590737775-4798-7-git-send-email-masonccyang@mxic.com.tw>
To: ycllin@mxic.com.tw
Subject: Re: [PATCH v4 6/7] spi: mxic: patch for octal DTR mode support
MIME-Version: 1.0
X-KeepSent: 82B441C6:DBA1A48E-482585A4:0020C734;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF82B441C6.DBA1A48E-ON482585A4.0020C734-482585A4.0020D2E6@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 13 Jul 2020 13:58:31 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/07/13 PM 01:58:31,
 Serialize complete at 2020/07/13 PM 01:58:31
X-MAIL: TWHMLLG3.macronix.com 06D5wVAs075451
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_015850_149971_C3B934DA 
X-CRM114-Status: UNSURE (   3.06  )
X-CRM114-Notice: Please train this message.
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 boris.brezillon@collabora.com, matthias.bgg@gmail.com, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


+ YC Lin in loop,

--
> 
> Subject
> 
> [PATCH v4 6/7] spi: mxic: patch for octal DTR mode support
> 
> Driver patch for octal 8D-8D-8D mode support.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---


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
