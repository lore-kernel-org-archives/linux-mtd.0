Return-Path: <SRS0=1hFJ=W5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61841C3A59B
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 07:40:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC732173E
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 07:40:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hcfU+nwG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC732173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BenbvdVTf16LfSvW88P2AU28Q1YfI/X/4oDupT7KNgc=; b=hcfU+nwGhL1aEA
	gXjbn97bjXN0fjk8sIGEc5VzOsvLBJ8/NRTgsDz2yn6/TdDKdmRp0kEsiH1BiVzPNxfrccWWh6yKe
	P6qzsWWpE1/RHGUCw9wErgcMar4+ZEmbVhiWpsZOU/+EUFCwml3TiOk+cllKZrpUlfztFfyiMEnZR
	AQgyBm8nYCX/XS2wxCjMbBCHk6HqIwlbcEKSLSSQ/oUI7ZN5fIzDVAbwZgsTlCxmsD3jEU7XZOvS+
	S/bCpCH+x206hbKlX+xl+J4e+n5LVRMVYi8leUJSOnQ3dhJ2fT5sNPBS9RA8xCjmMfB6+Lr9bt6OO
	Or6+b3Tz1YqycHmWxZAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4gwX-00016X-DL; Mon, 02 Sep 2019 07:40:05 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4gwT-0000Wy-Ec
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2019 07:40:03 +0000
Received: from twhfmnt1.mxic.com.tw (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id x827dGbd055089;
 Mon, 2 Sep 2019 15:39:16 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id D72D1393744B8AE61146;
 Mon,  2 Sep 2019 15:39:16 +0800 (CST)
In-Reply-To: <CAFLxGvyAk33SZY2J-WYzKMW6N9mKiJ=y0XfmMd8RjUVV2Rp5vg@mail.gmail.com>
References: <1566280428-4159-1-git-send-email-masonccyang@mxic.com.tw>
 <20190824130329.68f310aa@xps13>
 <OF22C5A579.E2E7676F-ON48258465.002F7F69-48258465.00322849@mxic.com.tw>
 <20190830115100.3fec9bf1@xps13>
 <OF08E1C5EC.4DAEB179-ON48258469.0025AFFA-48258469.0025D2F2@mxic.com.tw>
 <CAFLxGvyAk33SZY2J-WYzKMW6N9mKiJ=y0XfmMd8RjUVV2Rp5vg@mail.gmail.com>
To: "Richard Weinberger" <richard.weinberger@gmail.com>
Subject: Re: [PATCH] Add support for Macronix NAND randomizer
MIME-Version: 1.0
X-KeepSent: D9829D6A:151B1372-48258469:0029F27D;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFD9829D6A.151B1372-ON48258469.0029F27D-48258469.002A0CDA@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 2 Sep 2019 15:39:18 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/09/02 PM 03:39:16,
 Serialize complete at 2019/09/02 PM 03:39:16
X-MAIL: TWHMLLG4.macronix.com x827dGbd055089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_004001_819203_4BAC7FC7 
X-CRM114-Status: UNSURE (   7.93  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 juliensu@mxic.com.tw, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, frieder.schrempf@kontron.de,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Richard,
 
> Subject
> 
> Re: [PATCH] Add support for Macronix NAND randomizer
> 
> On Mon, Sep 2, 2019 at 8:54 AM <masonccyang@mxic.com.tw> wrote:
> > > >                 nand@0 {
> > > >                         reg = <0>;
> > > >                         nand-reliability = "randomizer";
> > >
> > >                           mxic,enable-randomizer-otp;
> > >
> > > Would be better (with the proper documentation in the bindings).
> > >
> >
> > okay, thanks for your opinions.
> 
> Please document also when/why one wants to enable the randomizer.

okay, sure.

> 
> -- 
> Thanks,
> //richard

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
