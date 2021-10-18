Return-Path: <SRS0=Otrq=PG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB149C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Oct 2021 01:44:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AAB5604D2
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Oct 2021 01:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AAB5604D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:Cc:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aImljpOmmgVcPnp73UvNy0s3qCe4vaxKFr4o6mS9TTs=; b=3cgvD8WX4gvFms
	qHOuOPDEGVfnkNgv73llr2agZY3g8rXqH/B/YoEV3brTaN77aXvzz2v2VwpH1Xql3KjHOuJdY4j9N
	V0m3ci/ZMvWVES0AEvMXcK3qq2JZ1ylKgNbnbdHbXlf2TtgP+KgGAUwFSGhHZdJN1qKROSY+Z7pPa
	kRt2pIUg3pE4YjHokmlAKqMJZYAqjhvNgx7ZfM3zShQZz9gBmoBGojJTlLdqfpj8ojAuUlKGMKyF4
	74r93dE8p+lvfEf4Pz9spj9IQmgaqQHObvn1AZIXs8HulhovrsOpck9v88RaW7ss6TWdx3s3KK+Vd
	rZ0m/z7rwv2Macszy0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcHgI-00Djnu-2S; Mon, 18 Oct 2021 01:43:14 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcHgD-00Djiv-8q
 for linux-mtd@lists.infradead.org; Mon, 18 Oct 2021 01:43:11 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 19I1gdGm015281;
 Mon, 18 Oct 2021 09:42:39 +0800 (GMT-8)
 (envelope-from jaimeliao@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id D550E851C17E8086009A;
 Mon, 18 Oct 2021 09:42:39 +0800 (CST)
In-Reply-To: <YWC8jgI74FgTudSD@robh.at.kernel.org>
References: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
 <20211008162228.1753083-4-miquel.raynal@bootlin.com>
 <YWC8jgI74FgTudSD@robh.at.kernel.org>
To: "Rob Herring" <robh@kernel.org>
Cc: "Boris Brezillon" <bbrezillon@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, devicetree@vger.kernel.org,
 juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Tudor Ambarus" <Tudor.Ambarus@microchip.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Xiangsheng Hou" <Xiangsheng.Hou@mediatek.com>
Subject: =?Big5?B?pl6rSDogUmU6IFtSRkMgUEFUQ0ggMDMvMTBdIGR0LWJpbmRpbmdzOiB2ZW5kb3It?=
 =?Big5?B?cHJlZml4ZXM6IFVwZGF0ZSBNYWNyb25peCBwcmVmaXg=?=
MIME-Version: 1.0
X-KeepSent: 9A15BF2B:E4A73AE9-48258772:00093984;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF9A15BF2B.E4A73AE9-ON48258772.00093984-48258772.00096628@mxic.com.tw>
From: jaimeliao@mxic.com.tw
Date: Mon, 18 Oct 2021 09:42:39 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/10/18 AM 09:42:39,
 Serialize complete at 2021/10/18 AM 09:42:39
X-MAIL: TWHMLLG3.macronix.com 19I1gdGm015281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_184309_626015_747AD1D1 
X-CRM114-Status: GOOD (  16.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Rob

> 
> Re: [RFC PATCH 03/10] dt-bindings: vendor-prefixes: Update Macronix 
prefix
> 
> On Fri, Oct 08, 2021 at 06:22:21PM +0200, Miquel Raynal wrote:
> > When looking at compatible prefixes, Macronix is sometimes referred as
> > mxicy:
> > - mxicy,mx25r1635f
> > - mxicy,mx25u6435f
> > - mxicy,mx25v8035f
> > - mxicy,mx25f0a-spi
> > and sometimes as mxic:
> > - mxic,multi-itfc-v009-nand-controller
> > - mxic,enable-randomizer-otp
> > 
> > It looks like the more up-to-date way is mxic so declare this prefix 
and
> > mark the other one as deprecated.
> 
> mxicy is more widely used with flash parts. There's not a single dts 
> file with 'mxic' which only seems to be some nand controller.
Yes, you are right.

Hi Miquel

Please keep using "mxicy,*" consistently for the compatible property, 
thanks.

> 
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-
> prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index b868cefc7c55..013a87850cd5 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -758,8 +758,11 @@ patternProperties:
> >      description: Mundo Reader S.L.
> >    "^murata,.*":
> >      description: Murata Manufacturing Co., Ltd.
> > +  "^mxic,.*":
> > +    description: Macronix International Co., Ltd.
> >    "^mxicy,.*":
> >      description: Macronix International Co., Ltd.
> > +    deprecated: true
> >    "^myir,.*":
> >      description: MYIR Tech Limited
> >    "^national,.*":
> > -- 
> > 2.27.0
> > 
> > 


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
