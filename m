Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB772C7EE23
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CgjlgC26l6QkV7zq1GLnzt9in9gaWO9QrSw1zl9RbE=; b=vZ3z7uyQfcSTPJ
	uODHAB+YGQomJitC90uCg6LMrRZrnIPi0A846aJRtIxOPCLqqBpiJpEZU2xtmvpbGY/JZXjV072IW
	SwxTMWqedcEEIHebptevSojXwiabMe+wuUofBtosw/1SO+OjpQu53MLw1Pu+YbRIVjhvEcu1TojbO
	rbXMIKUa5GYZN4nkq9/EIvtz2Yf+CyOYD0OlTjiqTrGx6gR/mhULawN4v7blj6+/xbMFQx2eylZcs
	C4m7DbMNKKZ2QPY23j9WCSrCLytkxEB22n/0fWj0R6nI/hFPZHflsmqyMkstN+W80hFNzb34D0tRL
	15HC7hv1SLNP3II49xwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6o3X-004pub-0h;
	Wed, 07 Jun 2023 07:58:11 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6o3T-004ptI-19;
	Wed, 07 Jun 2023 07:58:08 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686124684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKG1NX3ZxmRc+PLD+/MdWhbgvUph3jo+duURfanqw8k=;
	b=OXG9qUfFLgGWSo42JBDd7LiRIw2e/RdSt/ppyHO7/uiQLS0JfFs6sf21x40J5mQpTB9qoG
	BkkLUU4css7mTSHTVLl+toSnLLJ2MXk+cJDJXdIm7LB1SMN+g8xHBE7hSlHif/HlEPn4xa
	BdOhDZ86hr9okM2ndhrXRq1xif4NBiQUSv3pzAo6C8zdTonkcTkRz73qBdQaJyX5TFYoyK
	AYEKMzDcdPVuF0hKOgXeviDURHSQ7FxHvTeJM72gwX7kSDZ21C3OwPktQ05SXEopbxAURi
	6u2hCpXQrqPfFUjC4Z9EXpvFGD790UsrHG98wMD+Q7GQxB7qruwOah5gkWw+Mw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72F6224000E;
	Wed,  7 Jun 2023 07:58:03 +0000 (UTC)
Date: Wed, 7 Jun 2023 09:58:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] dt-bindings: nand: meson: Fix 'nand-rb' property
Message-ID: <20230607095802.3adcd4f9@xps-13>
In-Reply-To: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
References: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_005807_690386_2816E0AA 
X-CRM114-Status: GOOD (  16.63  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDYgSnVu
IDIwMjMgMjI6MzU6MDcgKzAzMDA6Cgo+IEFkZCBkZXNjcmlwdGlvbiBvZiAnbmFuZC1yYicgcHJv
cGVydHkuIFVzZSAiRml4ZXMiIGJlY2F1c2UgdGhpcyBwcm9wZXJ0eQo+IG11c3QgYmUgc3VwcG9y
dGVkIHNpbmNlIHRoZSBiZWdpbm5pbmcuIEZvciB0aGlzIGNvbnRyb2xsZXIgJ25hbmQtcmInIGlz
Cj4gc3RvcmVkIGluIHRoZSBjb250cm9sbGVyIG5vZGUgKG5vdCBpbiBjaGlwKSwgYmVjYXVzZSBp
dCBoYXMgb25seSBzaW5nbGUKPiByL2Igd2lyZSBmb3IgYWxsIGNoaXBzLgoKU29ycnkgaWYgSSBt
aXNsZWFkIHlvdSBpbiB0aGUgZmlyc3QgcGxhY2UsIGJ1dCB5b3UgY291bGQgZGVmaW5pdGVseQpo
YXZlIHR3byBjaGlwcyBhbmQgb25seSBvbmUgd2l0aCBSQiB3aXJlZC4gSXQgbmVlZHMgdG8gYmUg
ZGVmaW5lZCBpbgp0aGUgY2hpcHMuCgpQbGVhc2Uga2VlcCB0aGUgYmluZGluZ3MgYW5kIGRyaXZl
ciBjaGFuZ2VzIHJlbGF0ZWQgdG8gdGhpcyBpbiB0aGUgc2FtZQpzZXJpZXMuCgo+IAo+IEZpeGVz
OiBmYmMwMGI1ZTc0NmYgKCJkdC1iaW5kaW5nczogbmFuZDogbWVzb246IGNvbnZlcnQgdHh0IHRv
IHlhbWwiKQo+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJk
ZXZpY2VzLnJ1Pgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L2FtbG9naWMsbWVzb24tbmFuZC55YW1sIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbAo+IGluZGV4IDI4ZmI5YTdk
ZDcwZi4uODY2ZWRmODAwYjgxIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4gQEAg
LTM3LDYgKzM3LDggQEAgcHJvcGVydGllczoKPiAgICAgICAgLSBjb25zdDogY29yZQo+ICAgICAg
ICAtIGNvbnN0OiBkZXZpY2UKPiAgCj4gKyAgbmFuZC1yYjogdHJ1ZQo+ICsKPiAgcGF0dGVyblBy
b3BlcnRpZXM6Cj4gICAgIl5uYW5kQFswLTddJCI6Cj4gICAgICB0eXBlOiBvYmplY3QKPiBAQCAt
ODEsNiArODMsNyBAQCBleGFtcGxlczoKPiAgCj4gICAgICAgIHBpbmN0cmwtMCA9IDwmbmFuZF9w
aW5zPjsKPiAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiArICAgICAgbmFuZC1y
YiA9ICJ0cnVlIjsKPiAgCj4gICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAgICAgICAj
c2l6ZS1jZWxscyA9IDwwPjsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
