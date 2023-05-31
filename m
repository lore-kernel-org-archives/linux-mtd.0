Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9133C7EE24
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 07:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0yAg0WJpjhhPePHT8dJtALBTQ8ePPHCNzRKxoLrzJQ=; b=zCZAxbIcESdKFT
	Woth94Z7czDnWkaMUaboVGxnH61Go4iJRzASGsiTCm0MJ0w3PaXAuZj+cuvMqaWrsxBP/+HRu8ILj
	fJ+uCh8Gnunp/IxAGEk2QdlaxfrrvPv5VylP+uaaUoV2UWBmNv/C+14IgTAeNFSI+yXCW83LILs/8
	QQmu8js6JcsdXH312xCnUBb0pb3RUiCJ4+gpjLkmINddIFYdZdgyrXQa4zzN9rkeA8Fvlk/JVSwOr
	hxBjcfs0aWiwJ4IlJE+zSLAO6Uv0g/Ikf7jk6aF/bKabSwzPfvfBZT62sa9ePcnXn/qo3v/9s27Nu
	SniA5GTpP5D2wrdh+mew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GKt-00GSO1-2N;
	Wed, 31 May 2023 07:33:35 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GKq-00GSMj-2Q;
	Wed, 31 May 2023 07:33:34 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685518409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bb4lcxo6KJyRdv/YgpViXadSVJCkTncR89slgKCigfI=;
	b=fboRmsByi86S6b3FgQOOllfZLVlm1OSKDQ1ieRrq4Qibk6LaT0ZOGYeJqxE9dBpI+Lfdmn
	1FlU5ZtzZ06CTEUdqkx0H174cfXXYGrpgJ3XetyqzyGP0awsTHtdq9QZqVA8hOf3dNzoQz
	yAh/1r+JXL2qWt6dYwN5ladiu7KIHVXHcL58ywY012Iuh5rOHLOp2RteGMiZnDXPGkLnbn
	4UN0vXnhD2JeIxLfXW59ARmwOJuSKgstlnNR53ulViUlDb1xV1L2iTMv2iRQaFEiPG0nso
	yr12dYK+fy5gQbPEf/eyZP5Rz7eZjPQsRfrsZravIPP+dSZ5darBQkb3Y+m35w==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C24BFF80D;
	Wed, 31 May 2023 07:33:27 +0000 (UTC)
Date: Wed, 31 May 2023 09:33:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andrew@lunn.ch,
 gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 enachman@marvell.com
Subject: Re: [PATCH v7 4/4] dt-bindings: mtd: marvell-nand: Remove
 deprecated compatibles
Message-ID: <20230531093326.26b6ced7@xps-13>
In-Reply-To: <20230530235456.1009082-5-chris.packham@alliedtelesis.co.nz>
References: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
	<20230530235456.1009082-5-chris.packham@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_003333_103280_CDE0D78F 
X-CRM114-Status: GOOD (  13.51  )
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

SGkgQ2hyaXMsCgpjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gV2Vk
LCAzMSBNYXkgMjAyMyAxMTo1NDo1NgorMTIwMDoKCj4gUmVtb3ZlIGNvbXBhdGlibGUgdmFsdWVz
IHRoYXQgd2VyZSBtYXJrZWQgYXMgZGVwcmVjYXRlZCBpbiB0aGUgb2xkIHRleHQKPiBiaW5kaW5n
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVk
dGVsZXNpcy5jby5uej4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL21hcnZl
bGwsbmFuZC1jb250cm9sbGVyLnlhbWwgICAgICAgfCAzIC0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9tYXJ2ZWxsLG5hbmQtY29udHJvbGxlci55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tYXJ2ZWxsLG5hbmQtY29udHJvbGxlci55YW1sCj4g
aW5kZXggN2NkNGEyZTk5MzQzLi44MGNlODU0MjkxY2IgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tYXJ2ZWxsLG5hbmQtY29udHJvbGxlci55YW1s
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tYXJ2ZWxsLG5h
bmQtY29udHJvbGxlci55YW1sCj4gQEAgLTE4LDkgKzE4LDYgQEAgcHJvcGVydGllczoKPiAgICAg
ICAgLSBlbnVtOgo+ICAgICAgICAgICAgLSBtYXJ2ZWxsLGFybWFkYTM3MC1uYW5kLWNvbnRyb2xs
ZXIKPiAgICAgICAgICAgIC0gbWFydmVsbCxweGEzeHgtbmFuZC1jb250cm9sbGVyCj4gLSAgICAg
ICAgICAtIG1hcnZlbGwsYXJtYWRhLThrLW5hbmQKPiAtICAgICAgICAgIC0gbWFydmVsbCxhcm1h
ZGEzNzAtbmFuZAo+IC0gICAgICAgICAgLSBtYXJ2ZWxsLHB4YTN4eC1uYW5kCgpOb3Qgc3VyZSB3
aGF0IHlvdSdyZSBkb2luZyBoZXJlPyBJIHdvdWxkIGFjdHVhbGx5IGV4cGVjdCB0aGVzZSB0aHJl
ZQpsaW5lcyB0byBoYXZlIHNvbWV0aGluZyBhbG9uZzoKCiAgICAgICAgICAgICAgICAgZGVwcmVj
YXRlZDogdHJ1ZQoKYW5kIHRoaXMgc2hvdWxkIGJlIHBhcnQgb2YgdGhlIGNvbnZlcnNpb24gdG8g
eWFtbC4gT3IgcGVyaGFwcyBJIGFtCm1pc3Npbmcgc29tZXRoaW5nPwoKVGhlIHJlc3Qgb2YgdGhl
IHNlcmllcyBsb29rcyBnb29kIHRvIG1lLgoKPiAgCj4gICAgcmVnOgo+ICAgICAgbWF4SXRlbXM6
IDEKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
