Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0B7C04FFE
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2024 18:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATH9pyU6YriPMTfHdYG0bV0M8uXZqnurf9JAb7XixHc=; b=IyF3D03I577j3f
	wu3LAfFwSMJNsbvid+tg14CFRSjcFu1jiEyK+0KKvqcoUWEEn97ZPLkCINLA3qdbDj4lBTJWrh1K9
	DKpSo4EKr1Og05wyJyOMZZxTjsaYJknRAV/HDJ6p/uRWZIHumINvmQCmUjA3UFSxF/xEPR4GokGBq
	4FAPSBFWFD24MI7XuJHWQi8N3WHUOkykQsodOh8ha1aCe9NroPJucqQ7Ay39cbTHfxOcZyIDdMEJ4
	KUQVLLHxbFr/oGaMiny8bWR++blAFvJOBdIdkkD9aTfVXpNJ0U9m5rj7xtTH/0kAlhFp3Gwlr65jh
	etxcz4X7z7I55j3qGwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s82U9-00000008jL8-0hys;
	Fri, 17 May 2024 18:39:17 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s82U4-00000008jKE-2mbL;
	Fri, 17 May 2024 18:39:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6343F60005;
	Fri, 17 May 2024 18:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715971148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQ7u9L9F7F+dadEFYVniuXHGpmQQ9IaDZC1coQKlN20=;
	b=IFUQN0+fQySFvQs40/92OM4Rw9bpLf2T3FAWIbtByl/HZ1fSz6CflMrs1uuekDlGVkf+rH
	XivWXqepQgAO8O4sQ0VXDcPV44h/OSCdX5nA/uaOFb2UxpLSvdL8jE6kSAFhzb2CKVEbaR
	6ghyt/pnaqxnFJD3I9RH4K8ebiojEepfpmBQbqW/COW+Kkcx31zG6RTstU8umeRaBxR6gC
	+Y7kPqIm1RNkrkfSaCRT1n1vgJJ896xM+6Oj6P6+zUv6zZvys4KkePGixR3kvg8RdAUrDI
	Bmb9MSoetIJIzJ6zIbKZFKieN8pF6hNRs579apctpFv2FKMVQrxYoxvcImulDw==
Date: Fri, 17 May 2024 20:39:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Han Xu
 <han.xu@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] mtd: rawnand: gpmi: add iMX8QXP support.
Message-ID: <20240517203904.2879419a@xps-13>
In-Reply-To: <20240517-gpmi_nand-v1-3-73bb8d2cd441@nxp.com>
References: <20240517-gpmi_nand-v1-0-73bb8d2cd441@nxp.com>
	<20240517-gpmi_nand-v1-3-73bb8d2cd441@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_113912_870613_271A5891 
X-CRM114-Status: GOOD (  13.85  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMTcgTWF5IDIwMjQgMTQ6
MDk6NTAgLTA0MDA6Cgo+IEZyb206IEhhbiBYdSA8aGFuLnh1QG54cC5jb20+Cj4gCj4gQWRkICJm
c2wsaW14OHF4cC1ncG1pLW5hbmQiIGNvbXBhdGlibGUgc3RyaW5nLiBpTVg4UVhQIGdwbWkgbmFu
ZCBpcyBzaW1pbGFyCj4gd2l0aCBpTVg3RC4gQnV0IGl0IHVzaW5nIDQgY2xvY2s6ICJncG1pX2lv
IiwgImdwbWlfYXBiIiwgImdwbWlfYmNoIiBhbmQKCiAgdG8/ICAgICAgICAgICAgIGlzICAgICAg
ICAgY2xvY2tzCgo+ICJncG1pX2JjaF9hcGIiLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhhbiBYdSA8
aGFuLnh1QG54cC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyB8
IDIwICsrKysrKysrKysrKysrKysrLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFu
ZC9ncG1pLW5hbmQuaCB8ICA0ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQv
Z3BtaS1uYW5kLmMKPiBpbmRleCBlNzFhZDJmY2VjMjMyLi5mOTBjNTIwN2JhY2I2IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+IEBAIC05ODMsNyAr
OTgzLDggQEAgc3RhdGljIGludCBncG1pX3NldHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLCBpbnQgY2hpcG5yLAo+ICAJCXJldHVybiBQVFJfRVJSKHNkcik7Cj4gIAo+ICAJLyog
T25seSBNWDI4L01YNiBHUE1JIGNvbnRyb2xsZXIgY2FuIHJlYWNoIEVETyB0aW1pbmdzICovCj4g
LQlpZiAoc2RyLT50UkNfbWluIDw9IDI1MDAwICYmICFHUE1JX0lTX01YMjgodGhpcykgJiYgIUdQ
TUlfSVNfTVg2KHRoaXMpKQo+ICsJaWYgKHNkci0+dFJDX21pbiA8PSAyNTAwMCAmJiAhR1BNSV9J
U19NWDI4KHRoaXMpICYmCj4gKwkgICAgIShHUE1JX0lTX01YNih0aGlzKSB8fCBHUE1JX0lTX01Y
OCh0aGlzKSkpCgpGZWVscyBjb21wbGV0ZWx5IHJlZHVuZGFudCwgbm8/IElmIGl0J3Mgbm90IGFu
IGlteDYgbm9yIGFuIGlteDI4LCBpdAphbHJlYWR5IHJldHVybnMgLUVOT1RTVVBQLgoKPiAgCQly
ZXR1cm4gLUVOT1RTVVBQOwoKCkZpbmUgb3RoZXJ3aXNlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
