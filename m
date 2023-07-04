Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45556EB64DA
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 08:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXMlsJPc2GUWuOU2vvLnIX1rnb+v0tAGq5BxCmPWYPo=; b=SyOhckpgnpWpX2
	/hPjyfiRqSyYCTDdtiv78YHTLY6OSHeKGDRUtm1dhruQF0TudOW/sdTeIOsjwu4QW8S2dWtPFb5D+
	NEoit1w3CIk3RIZiN/AWXvM3urTFRYl6ywxF8wBN2nJdqDjM4m+bxqylg8NuNlJV1QTBN1pMWS3GJ
	G4QuELvyNJnZUqG7Y00FvNUsFOcoLONFO9ZmqHdkEIlNWWatULd19Z8DXrH2J/FbglD+RVNuQNsj2
	14aOf7YiSVQwa2oixA8ZpT9BYMnTXjo9Kr13No71kUzSsEZPJPZbqpmFArYgZz+oIV607yI+Ui1dZ
	Co/399eLRIJz8XYtLjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbVH-00CaFB-0s;
	Tue, 04 Jul 2023 08:35:19 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbVC-00CaDV-2z;
	Tue, 04 Jul 2023 08:35:16 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688459709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvAuV/3iJvCMZubcgL+XBZbe9I+F9An23rR/WG2KkOk=;
	b=dxbyvJLoyuSTWV6OoUQLs5km4NhJfItKwdpPLbWEoSMn4YYLpHNtrpn3X2vfqcm10LDd9P
	VwQn7C0FuRxtjywGTEPSXFR7rJDE5uF40cEnDBZqY30xynnH31H7hYHDhedGMQA7uXMPbJ
	cGJRG1BPCDOElaTv2jP7FYC4JBmcEe7Q9aP9oYBjFyoiQjq77NOUr/unh97rT7JK8TUQY1
	wLNt7PA08ttZuGWeUAFhb2y38b3eYURhXy8065r4iL4e9jqHcudpsNyMcYhbDta9xOlu7b
	kSMZ8iih7rDyoQaggWYn2Hyz8vqAw2ZOt7/xDsAW3pnnJLKHpkqbCYnpB2L8Sw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D814E240009;
	Tue,  4 Jul 2023 08:35:03 +0000 (UTC)
Date: Tue, 4 Jul 2023 10:35:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v1 1/2] dt-bindings: nand: meson: support for 512B
 ECC step size
Message-ID: <20230704103502.299ac7de@xps-13>
In-Reply-To: <20230628092937.538683-2-AVKrasnov@sberdevices.ru>
References: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
	<20230628092937.538683-2-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_013515_231029_06B679A3 
X-CRM114-Status: GOOD (  14.01  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDI4IEp1
biAyMDIzIDEyOjI5OjM1ICswMzAwOgoKPiBNZXNvbiBOQU5EIHN1cHBvcnRzIGJvdGggNTEyQiBh
bmQgMTAyNEIgRUNDIHN0ZXAgc2l6ZSwgc28gcmVwbGFjZQo+ICdjb25zdCcgZm9yIG9ubHkgMTAy
NEIgc3RlcCBzaXplIHdpdGggZW51bSBmb3IgYm90aCBzaXplcy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4KPiAtLS0KPiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFt
bCB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwKPiBpbmRleCAzYmVjOGFmOTFiYmIuLmQ0
MmRhYTI4NWQxNyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbAo+IEBAIC00OSw3ICs0
OSw3IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ICAgICAgICAgIGNvbnN0OiBodwo+ICAKPiAgICAg
ICAgbmFuZC1lY2Mtc3RlcC1zaXplOgo+IC0gICAgICAgIGNvbnN0OiAxMDI0Cj4gKyAgICAgICAg
ZW51bTogWzUxMiwgMTAyNF0KCkkgYmVsaWV2ZSB5b3Ugc2hvdWxkIGFzIHdlbGwgbWVudGlvbiB0
aGUgZGVmYXVsdCB2YWx1ZS4KCj4gICAgICAgIG5hbmQtZWNjLXN0cmVuZ3RoOgo+ICAgICAgICAg
IGVudW06IFs4LCAxNiwgMjQsIDMwLCA0MCwgNTAsIDYwXQo+IEBAIC05Myw2ICs5Myw3IEBAIGV4
YW1wbGVzOgo+ICAgICAgICBuYW5kQDAgewo+ICAgICAgICAgIHJlZyA9IDwwPjsKPiAgICAgICAg
ICBuYW5kLXJiID0gPDA+Owo+ICsgICAgICAgIG5hbmQtZWNjLXN0ZXAtc2l6ZSA9IDwxMDI0PjsK
CkFuZCBJIGRvbid0IHRoaW5rIHRoaXMgbGluZSBpcyByZWFsbHkgcmVxdWlyZWQsIGJ1dCBJIGRv
bid0IG1pbmQuCgo+ICAgICAgICB9Owo+ICAgICAgfTsKPiAgCgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
