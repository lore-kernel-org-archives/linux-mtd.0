Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95001EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7hSoRcJedxZgHWNMYBVRr/ZEvehJxC2wES1Uibsn4g=; b=fJbN+Pb1H0L96s
	6FErS+/h6qwsnzk3t20msrbSFhkn1O3q9uCk6k8Rlmzo5zFY3ye9FFKFnSlMW7CekD1Z2yTilEACI
	uIhThQb096AbuDtYgDqHnFyQ7ShMabttpeNeT1eM26L5TOWFjdDqfFqHppXoA+yYEgt8Uzat0QbN9
	ktSWalT7jyEhwV0NDMInTlQe1rozdQ3WLprpYN0SOfUhu0EuQiLZ+7u09SuZKtVI7ULw2LsMxlttt
	KCHPXSkUYE/bAnr2fQUVwbEcO7TLN+3EOp12752fremFDLiTBlh/2WjcXxaiKKNB63M+DZ6Qiie2Y
	UdgDkx6Rq+B4W439/nHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxnC-00FCC0-2o;
	Wed, 05 Jul 2023 08:23:18 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxn8-00FC7T-1D;
	Wed, 05 Jul 2023 08:23:16 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688545378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rydOgVNykw77d4FJDzENpk9IP9/IhrYgK2eGBj+DtDo=;
	b=f7GkieLtVuK91DIemhGTaVzwZ65cQ3DEVfd/8UNvgdZ8qCyHjuqj9fwfYIVIRyCrozRBF4
	g3NATy9M3Z27XB/jzpWAjFCjwvAyJIWV66A7TQl6pK79srxl7lU7NsQbVsbXNREj2wt3rA
	g0FrNqsc+yg6ryTQ3qkalrjhezmZm+ydJH0l2BO56yVWQ48E6Hcp7Yzzwbv2JJeGNAcVLP
	+tR776beHA4wQxRana4fVs8xujefzWiM4oKX6MmIHf6vDnS5yez9clfALcUsI2EhMNKmoD
	mcw1FjIASORh7mw8SYkni/S35iWzuzu0DF1z/CDlFe9TnWZQu8AW+b6cWjbcNg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A6694000B;
	Wed,  5 Jul 2023 08:22:55 +0000 (UTC)
Date: Wed, 5 Jul 2023 10:22:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
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
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: nand: meson: support for 512B
 ECC step size
Message-ID: <20230705102254.0aeb94ea@xps-13>
In-Reply-To: <365898fb-3719-38e0-4383-e04ccc0b475b@sberdevices.ru>
References: <20230705065434.297040-1-AVKrasnov@sberdevices.ru>
	<20230705065434.297040-2-AVKrasnov@sberdevices.ru>
	<20230705093702.6c0421d7@xps-13>
	<365898fb-3719-38e0-4383-e04ccc0b475b@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_012314_833561_7D06C6D8 
X-CRM114-Status: GOOD (  28.80  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDUgSnVs
IDIwMjMgMTE6MDM6MzAgKzAzMDA6Cgo+IE9uIDA1LjA3LjIwMjMgMTA6MzcsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4gPiBBVktyYXNub3ZAc2JlcmRldmljZXMu
cnUgd3JvdGUgb24gV2VkLCA1IEp1bCAyMDIzIDA5OjU0OjMzICswMzAwOgo+ID4gICAKPiA+PiBN
ZXNvbiBOQU5EIHN1cHBvcnRzIGJvdGggNTEyQiBhbmQgMTAyNEIgRUNDIHN0ZXAgc2l6ZSwgc28g
cmVwbGFjZQo+ID4+ICdjb25zdCcgZm9yIG9ubHkgMTAyNEIgc3RlcCBzaXplIHdpdGggZW51bSBm
b3IgYm90aCBzaXplcy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8
QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+ID4+IC0tLQo+ID4+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sIHwgNCArKystCj4g
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+
ID4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2Ft
bG9naWMsbWVzb24tbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbAo+ID4+IGluZGV4IDNiZWM4YWY5MWJiYi4uODFj
YTg4Mjg3MzFhIDEwMDY0NAo+ID4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwKPiA+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4gPj4gQEAg
LTQ5LDcgKzQ5LDggQEAgcGF0dGVyblByb3BlcnRpZXM6Cj4gPj4gICAgICAgICAgY29uc3Q6IGh3
Cj4gPj4gIAo+ID4+ICAgICAgICBuYW5kLWVjYy1zdGVwLXNpemU6Cj4gPj4gLSAgICAgICAgY29u
c3Q6IDEwMjQKPiA+PiArICAgICAgICBlbnVtOiBbNTEyLCAxMDI0XQo+ID4+ICsgICAgICAgIGRl
ZmF1bHQ6IDEwMjQgIAo+ID4gCj4gPiBJIHdhcyBhY3R1YWxseSB3cm9uZyBpbiBteSBwcmV2aW91
cyByZXZpZXcsIHRoZXJlIGlzIG5vIHN0cm9uZyBkZWZhdWx0Cj4gPiBoZXJlIGFzIHRoZSBleGlz
dGluZyBiaW5kaW5nIChhbmQgY29kZSkgdHJ5IHRvIHVzZSB0aGUgY2xvc2VzdAo+ID4gcGFyYW1l
dGVycyByZXF1aXJlZCBieSB0aGUgTkFORCBjaGlwOiB3ZSBwaWNrIHRoZSAib3B0aW1hbCIKPiA+
IGNvbmZpZ3VyYXRpb24uIFNvIGlmIHlvdSBkb24ndCBwcm92aWRlIGFueSB2YWx1ZSBoZXJlLCB3
ZSBleHBlY3QKPiA+IHRoZSBzdHJlbmd0aCBhbmQgc3RlcCBzaXplIGFkdmVydGl6ZWQgYnkgdGhl
IGNoaXAgdG8gYmUgdXNlZC4gVGhpcyBpcyBhCj4gPiBjb21tb24gZGVmYXVsdCBpbiB0aGUgcmF3
IE5BTkQgc3Vic3lzdGVtLgo+ID4gCj4gPiBQbGVhc2UgZHJvcCB0aGUgZGVmYXVsdCBsaW5lLCBy
ZS1pbnRlZ3JhdGUgdGhlIG1pc3NpbmcgUi1ieSB0YWcgZnJvbQo+ID4gUm9iIGFuZCBpbiBhIHNl
cGFyYXRlIHBhdGNoIHBsZWFzZSBtYXJrIG5hbmQtZWNjLXN0ZXAtc2l6ZSBhbmQKPiA+IG5hbmQt
ZWNjLXN0cmVuZ3RoIG1hbmRhdG9yeSBpZiB0aGUgb3RoZXIgaXMgcHJvdmlkZS4gSU9XLCB3ZSBl
eHBlY3QKPiA+IGVpdGhlciBib3RoLCBvciBub25lIG9mIHRoZW0sIGJ1dCBub3QgYSBzaW5nbGUg
b25lLiAgCj4gCj4gSSBzZWUsIG5vIHByb2JsZW0hICJtYW5kYXRvcnkiIG1lYW5zIHVwZGF0ZSBk
ZXNjcmlwdGlvbiBvZiBib3RoIGZpZWxkcyBsaWtlOgo+IAo+ICAgICBkZXNjcmlwdGlvbjogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAg
ICAgIE1hbmRhdG9yeSBpZiBuYW5kLWVjYy1zdGVwLXNpemUgaXMgc2V0LgoKTm9wZSA6LSkKClNv
bWV0aGluZyBhbG9uZzoKCmFsbE9mOgogIC0gaWY6CiAgICA8bmFuZC1jaGlwPjoKICAgICAgcHJv
cGVydGllczoKICAgICAgICBjb250YWluczoKICAgICAgICAgIC0gbmFuZC1lY2Mtc3RlcC1zaXpl
CiAgICB0aGVuOgogICAgICByZXF1aXJlZDoKICAgICAgICA8bmFuZC1jaGlwPjoKICAgICAgICAg
IHByb3BlcnRpZXM6CiAgICAgICAgICAgIC0gbmFuZC1lY2Mtc3RyZW5ndGgKCkFuZCBzYW1lIHdp
dGggdGhlIG9wcG9zaXRlIGxvZ2ljLgoKPiAKPiBldGMuCj4gCj4gPwo+IAo+ID4gICAKPiA+PiAg
Cj4gPj4gICAgICAgIG5hbmQtZWNjLXN0cmVuZ3RoOgo+ID4+ICAgICAgICAgIGVudW06IFs4LCAx
NiwgMjQsIDMwLCA0MCwgNTAsIDYwXQo+ID4+IEBAIC05Myw2ICs5NCw3IEBAIGV4YW1wbGVzOgo+
ID4+ICAgICAgICBuYW5kQDAgewo+ID4+ICAgICAgICAgIHJlZyA9IDwwPjsKPiA+PiAgICAgICAg
ICBuYW5kLXJiID0gPDA+Owo+ID4+ICsgICAgICAgIG5hbmQtZWNjLXN0ZXAtc2l6ZSA9IDwxMDI0
PjsgIAo+ID4gCj4gPiBTbyBpbiB0aGUgZW5kIHRoaXMgbGluZSBpcyB3cm9uZyBhbmQgb25jZSB5
b3UgZ2V0IHRoZSBkZXNjcmlwdGlvbiByaWdodAo+ID4gYXMgSSBtZW50aW9uZWQgaXQgYWJvdmUs
IHRoaXMgd2lsbCBmYWlsIHRvIHBhc3MKPiA+IGBtYWtlIERUX1NDSEVNQV9GSUxFUz1Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkLyBkdF9iaW5pZG5nX2NoZWNrYAo+ID4gUGxl
YXNlIGRyb3AgaXQgZnJvbSB0aGUgZXhhbXBsZSwgZG9uJ3QgYWRkIHRoZSBzZWNvbmQgcHJvcGVy
dHkgaGVyZSwKPiA+IGl0J3MgYmVzdCB0byBzaG93IGEgY2xlYW4gZXhhbXBsZSB3aGVyZSBwZW9w
bGUgc3RvcCB0YW1wZXJpbmcgZm9yIG5vCj4gPiByZWFzb24gd2l0aCB0aGUgb3B0aW1hbCB2YWx1
ZXMuICAKPiAKPiBPayEKPiAKPiBUaGFua3MsIEFyc2VuaXkKPiAKPiA+ICAgCj4gPj4gICAgICAg
IH07Cj4gPj4gICAgICB9Owo+ID4+ICAgIAo+ID4gCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXD
qGwgIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
