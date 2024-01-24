Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEE3C46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gaCVTeS8GuJZelyMgoxdgUK1QbvGZxTJLh9bJCmX7d0=; b=nRmuHsQr93Pvja
	SetTk2DBE8ZpWo6wC4Dsjng3TRsaJOLXXGYc+StRedjIpCClU3wDA/u2zj1IggKotsPqO5e0ySTbK
	/HVSH5jxmUid2VS1VImJO+pA5aWSqeGQ0a95AEbMs0/AATeQ50FUBNqaqsSWAa5hb9HpiZ1S3rUTu
	1kT6ulCkrkiEV9nUwzfKckUBE5uBidmAjs76AePKal4cOPa/++Tcy/0RDlnlJMbWD84db+05D2XYe
	x0wxrG0MLrBRQ2azBcVArISnQjPMQpIn9ouMmH3GD78HgpdGCi/qJ0WTc1+YvdYo5i7Uh9AW/V6W3
	5ht3Tx4gfLb0vNsbMr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShAA-004WK3-0R;
	Wed, 24 Jan 2024 17:35:46 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShA5-004WHy-2X;
	Wed, 24 Jan 2024 17:35:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1155240005;
	Wed, 24 Jan 2024 17:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706117738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUMjqltwkIGVr7cFCX5WkgROIhujwD7bw8iY8cVcYnM=;
	b=fAUNnz0lT02RNbFe+TtyyeFJHlgzG9bLlwev2ehLoX6Nl7HuRJBwws5I9TWunSP2b8F3nJ
	xK7rsOABn3wt45eQ1AHREyLC+6lukhXhiOtFSKnOjQLM7tcS747iQQdC78kCB9gOGPAjFG
	XYRfV1kcvF/CJ8seJ+MRpoyqmHNJwA8KSYRNzhb6Fn2JYa71urEkQXesDhGaFeC+D7Grxq
	AQY46I5oqCGVL+GeaxH4Y47BYJ4d2KP02GYuszr2brpDpVBIJfKlwBnksc4XTmiy6QVRUd
	sds8jC7NEZ1YB0Qyku34SVwir/+bvZsDTFof7lGqXFDJVe8OOEkpuwTjwCyXGA==
Date: Wed, 24 Jan 2024 18:35:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: dregan@mail.com, richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, anand.gore@broadcom.com,
 kursad.oney@broadcom.com, florian.fainelli@broadcom.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@linaro.org
Subject: Re: [PATCH v3 08/10] mtd: rawnand: brcmnand: exec_op helper
 functions return type fixes
Message-ID: <20240124183532.7f03a0f7@xps-13>
In-Reply-To: <20240124030458.98408-9-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
	<20240124030458.98408-9-dregan@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_093542_095574_61EEE201 
X-CRM114-Status: GOOD (  18.91  )
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

SGkgRGF2aWQsCgpkcmVnYW5AYnJvYWRjb20uY29tIHdyb3RlIG9uIFR1ZSwgMjMgSmFuIDIwMjQg
MTk6MDQ6NTYgLTA4MDA6Cgo+IGZpeCByZXR1cm4gdHlwZSBmb3IgZXhlY19vcCByZXNldCBhbmQg
c3RhdHVzIGRldGVjdCBoZWxwZXIgZnVuY3Rpb25zCgpTdHlsZSwgcGxlYXNlLgoKRml4CQkJCQkJ
CQktLT4gLgoKPiAKPiBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBs
aW5hcm8ub3JnPgo+IENsb3NlczogaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWls
L2xpbnV4LW10ZC8yMDIzLURlY2VtYmVyLzEwMjQyMy5odG1sCj4gRml4ZXM6IDNjYzQ3MThmYTY0
NCAoIm10ZDogcmF3bmFuZDogYnJjbW5hbmQ6IGV4ZWNfb3AgaW1wbGVtZW50YXRpb24iKQo+IFNp
Z25lZC1vZmYtYnk6IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20uY29tPgo+IFJldmlld2Vk
LWJ5OiBXaWxsaWFtIFpoYW5nIDx3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbT4KPiAtLS0KPiBD
aGFuZ2VzIGluIHYzOiBOb25lCj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIEFkZGVkIHRvIHBh
dGNoIHNlcmllcwo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFu
ZC5jIHwgMTUgKysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNt
bmFuZC5jCj4gaW5kZXggOWE5MDRjN2M2ZGFkLi42YjVkNzZlZmYwZWMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBAQCAtNjI1LDcgKzYyNSw3IEBAIGVu
dW0gewo+ICAvKiBPbmx5IGZvciB2Ny4yICovCj4gICNkZWZpbmUJQUNDX0NPTlRST0xfRUNDX0VY
VF9TSElGVAkJMTMKPiAgCj4gLXN0YXRpYyB1OCBicmNtbmFuZF9zdGF0dXMoc3RydWN0IGJyY21u
YW5kX2hvc3QgKmhvc3QpOwo+ICtzdGF0aWMgaW50IGJyY21uYW5kX3N0YXR1cyhzdHJ1Y3QgYnJj
bW5hbmRfaG9zdCAqaG9zdCk7Cj4gIAo+ICBzdGF0aWMgaW5saW5lIGJvb2wgYnJjbW5hbmRfbm9u
X21taW9fb3BzKHN0cnVjdCBicmNtbmFuZF9jb250cm9sbGVyICpjdHJsKQo+ICB7Cj4gQEAgLTE3
NDksNyArMTc0OSw3IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfd2FpdGZ1bmMoc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCkKPiAgCQkJCSBJTlRGQ19GTEFTSF9TVEFUVVM7Cj4gIH0KPiAgCj4gLXN0YXRp
YyB1OCBicmNtbmFuZF9zdGF0dXMoc3RydWN0IGJyY21uYW5kX2hvc3QgKmhvc3QpCj4gK3N0YXRp
YyBpbnQgYnJjbW5hbmRfc3RhdHVzKHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0KQo+ICB7Cj4g
IAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gJmhvc3QtPmNoaXA7Cj4gIAlzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+IEBAIC0xNzYwLDcgKzE3NjAsNyBAQCBzdGF0
aWMgdTggYnJjbW5hbmRfc3RhdHVzKHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0KQo+ICAJcmV0
dXJuIGJyY21uYW5kX3dhaXRmdW5jKGNoaXApOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdTggYnJjbW5h
bmRfcmVzZXQoc3RydWN0IGJyY21uYW5kX2hvc3QgKmhvc3QpCj4gK3N0YXRpYyBpbnQgYnJjbW5h
bmRfcmVzZXQoc3RydWN0IGJyY21uYW5kX2hvc3QgKmhvc3QpCj4gIHsKPiAgCXN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAgPSAmaG9zdC0+Y2hpcDsKPiAgCj4gQEAgLTI0OTIsMTEgKzI0OTIsMTQgQEAg
c3RhdGljIGludCBicmNtbmFuZF9leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIAo+
ICAJaWYgKGJyY21uYW5kX29wX2lzX3N0YXR1cyhvcCkpIHsKPiAgCQlzdGF0dXMgPSBvcC0+aW5z
dHJzWzFdLmN0eC5kYXRhLmJ1Zi5pbjsKPiAtCQkqc3RhdHVzID0gYnJjbW5hbmRfc3RhdHVzKGhv
c3QpOwo+ICsJCXJldCA9IGJyY21uYW5kX3N0YXR1cyhob3N0KTsKPiArCQlpZiAocmV0IDwgMCkK
PiArCQkJcmV0dXJuIHJldDsKPiArCj4gKwkJKnN0YXR1cyA9IHJldCAmIDB4RkY7Cj4gIAo+ICAJ
CXJldHVybiAwOwo+IC0JfQo+IC0JZWxzZSBpZiAoYnJjbW5hbmRfb3BfaXNfcmVzZXQob3ApKSB7
Cj4gKwl9IGVsc2UgaWYgKGJyY21uYW5kX29wX2lzX3Jlc2V0KG9wKSkgewo+ICAJCXJldCA9IGJy
Y21uYW5kX3Jlc2V0KGhvc3QpOwo+ICAJCWlmIChyZXQgPCAwKQo+ICAJCQlyZXR1cm4gcmV0OwoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
