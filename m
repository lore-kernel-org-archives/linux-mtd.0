Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D156C4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:20:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E17D120857
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:20:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iSvMDqI0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E17D120857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zido5dtwJkiNgce3Nvmb8RX5ruGJFfI/BkVuJpJToIA=; b=iSvMDqI04XZukg
	fqo3VJIUR7O0mffXzWq4SuZtUD+iVLyk7pdFXwyOfO3DBPHyz+Nni+wJr4yFMykAAt9fkp6PRtefu
	YM/x8aITh4ZdAfd0EmlWjGAVDXq1WgU24TxVrjMyyrEjzQvquUs+w1Y+E4PrdPPTaw1DKOPkCQKq6
	0nm3dFjsrR6Q9MlQaf0kD6UTyNI1+Pt5JM5LwQ+z3TuNmQNvw1ocD2RkC0enU307jVTQ0r8QNjPZX
	DwhjniUuGg7Ju55mKCTpNmTwlWmQUYO7J7BEf4rmOGlcK/jypT8fBHZFsEmGEkhXEnma0S/bXwoGg
	kUHees0si6zSGpphi8DQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBEeH-0001ec-6S; Tue, 02 Apr 2019 08:20:01 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBEe1-0001J2-2D; Tue, 02 Apr 2019 08:19:49 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B598C1BF20B;
 Tue,  2 Apr 2019 08:19:41 +0000 (UTC)
Date: Tue, 2 Apr 2019 10:19:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 3/4] ARM: dts: sunxi: Conform to DT spec for NAND
 controller
Message-ID: <20190402101941.3107e4f2@xps13>
In-Reply-To: <44951643435f35ab205abff6dc14f672f27eb896.1554153146.git-series.maxime.ripard@bootlin.com>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
 <44951643435f35ab205abff6dc14f672f27eb896.1554153146.git-series.maxime.ripard@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_011945_572092_8D832C23 
X-CRM114-Status: UNSURE (   7.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWF4aW1lLAoKTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4gd3Jv
dGUgb24gTW9uLCAgMSBBcHIgMjAxOQoyMzoxMzo1NSArMDIwMDoKCj4gVGhlIE5BTkQgY29udHJv
bGxlciBub2RlIG5hbWUgc2hvdWxkIGJlIG5hbmQtY29udHJvbGxlciBhbmQgbm90IG5hbmQgYXMg
d2UKPiB1c2VkIHByZXZpb3VzbHkgYWNjb3JkaW5nIHRvIHRoZSBkZXZpY2V0cmVlIHNwZWNpZmlj
YXRpb24uIExldCdzIGZpeCBvdXIKPiBEVHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJp
cGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
