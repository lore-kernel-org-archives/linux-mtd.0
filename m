Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFC2C46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NV6cFeSfgMq/VMZXs3vGsIU5/1so0JQK+CLCg6PriMI=; b=G8amezU9Uyw106
	7053BOeu41vjOzfnB/GBbM/bQCbCEQQ9AhTkX0RTV72hcvQH5NbiYLcuOwvqZzit1HYz3jkdtbONU
	R+B/CXKeMCTGxdJA96cu7tDwQwruUkLb9jQqAledIyB7H/D5v56h4Y3Uy7HYriE9fl74WKXeWQk0E
	L7HjQPTkpXARiKTbPK/3Un2vJIxORl1EMdTEtBc8XK6sjXqum0u1kER1p1OQJKIUXi+6EVP/CMJ56
	KD7yt/bdco8VUBWw+a++QLmO4nINqjooOEW3Ig11WTHSoZ0NMa2Ojxe8VjWlrCtLSagJv3IighxDk
	nuWhUjXq6ck0xVKsUGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShEr-004XSG-1Q;
	Wed, 24 Jan 2024 17:40:37 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShEn-004XRE-1s;
	Wed, 24 Jan 2024 17:40:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCF851BF20E;
	Wed, 24 Jan 2024 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706118030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9fxvXwre8RvANs3toNyR8cUFT2cBUQEnb6nLZSDgnE=;
	b=GTartNSV42U1nllXnMMP3aHwlGI/uQS1npcEBCAhl82CqzmhpWZyy0umHbMQZvndvILcei
	+MzcRQdSS1m/SffVGt+DBHi1UneiynjaI+ZoON+wxOloCR1MWHkivqQcex1aGBj2A4otll
	BKR/wB/kNds+aHS8FpUH6HuTLci1NVg33cDOFWLZV+H+RaIadaxRap2pgvkPlgtMunlB6r
	pCCb/fPnrzaV1a6Iz7PjlF9c0IXZ7Xr8iup3NuWDjy6TqJ1akkpsAuYCEc2DbHQdrTmdhI
	v9okB9VMwgbEDboKsfT0uyjTvjB7gPsEWBA7obVIB1ACu54CKMnVzexPyged5g==
Date: Wed, 24 Jan 2024 18:40:27 +0100
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
Subject: Re: [PATCH v3 10/10] mtd: rawnand: brcmnand: allow for on-die ecc
Message-ID: <20240124184027.712b1e47@xps-13>
In-Reply-To: <20240124030458.98408-11-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
	<20240124030458.98408-11-dregan@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_094033_918677_D7E53B16 
X-CRM114-Status: GOOD (  17.78  )
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
MTk6MDQ6NTggLTA4MDA6Cgo+IEFsbG93IHNldHRpbmdzIGZvciBvbi1kaWUgZWNjIHN1Y2ggdGhh
dCBpZiBvbi1kaWUgRUNDIGlzIHNlbGVjdGVkCj4gZG9uJ3QgZXJyb3Igb3V0IGJ1dCByZXF1aXJl
IEVDQyBzdHJhcCBzZXR0aW5nIG9mIHplcm8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBSZWdh
biA8ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiBSZXZpZXdlZC1ieTogV2lsbGlhbSBaaGFuZyA8d2ls
bGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+IC0t
LQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBBZGRlZCB0byBwYXRjaCBzZXJpZXMKPiAtLS0KPiAgZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDE0ICsrKysrKysrKystLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IGluZGV4IGE0ZTMxMWI2
Nzk4Yy4uNDI1MjZmMzI1MGM5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Jy
Y21uYW5kL2JyY21uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9i
cmNtbmFuZC5jCj4gQEAgLTI3MjcsOSArMjcyNywxMSBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3Nl
dHVwX2RldihzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCkKPiAgCWNmZy0+YmxrX2Fkcl9ieXRl
cyA9IGdldF9ibGtfYWRyX2J5dGVzKG10ZC0+c2l6ZSwgbXRkLT53cml0ZXNpemUpOwo+ICAKPiAg
CWlmIChjaGlwLT5lY2MuZW5naW5lX3R5cGUgIT0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fSE9T
VCkgewo+IC0JCWRldl9lcnIoY3RybC0+ZGV2LCAib25seSBIVyBFQ0Mgc3VwcG9ydGVkOyBzZWxl
Y3RlZDogJWRcbiIsCj4gLQkJCWNoaXAtPmVjYy5lbmdpbmVfdHlwZSk7Cj4gLQkJcmV0dXJuIC1F
SU5WQUw7Cj4gKwkJaWYgKGNoaXAtPmVjYy5zdHJlbmd0aCkgewo+ICsJCQlkZXZfZXJyKGN0cmwt
PmRldiwgIkVSUk9SISEhIEhXIEVDQyBtdXN0IGJlIHNldCB0byB6ZXJvIGZvciBub24taGFyZHdh
cmUgRUNDOyBzZWxlY3RlZDogJWRcbiIsCj4gKwkJCQljaGlwLT5lY2Muc3RyZW5ndGgpOwoKQ2Fu
IHlvdSB1c2UgYSBtb3JlIGZvcm1hbCBzdHJpbmc/IEFsc28gY2xhcmlmeSBpdCBiZWNhdXNlIEkg
ZG9uJ3QKcmVhbGx5IHVuZGVyc3RhbmQgd2hhdCBpdCBsZWFkcyB0by4KCj4gKwkJCXJldHVybiAt
RUlOVkFMOwo+ICsJCX0KPiAgCX0KPiAgCj4gIAlpZiAoY2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9F
Q0NfQUxHT19VTktOT1dOKSB7Cj4gQEAgLTI3OTcsNyArMjc5OSwxMSBAQCBzdGF0aWMgaW50IGJy
Y21uYW5kX3NldHVwX2RldihzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCkKPiAgCWlmIChyZXQp
Cj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQlicmNtbmFuZF9zZXRfZWNjX2VuYWJsZWQoaG9zdCwg
MSk7Cj4gKwlpZiAoY2hpcC0+ZWNjLmVuZ2luZV90eXBlID09IE5BTkRfRUNDX0VOR0lORV9UWVBF
X09OX0RJRSkgewo+ICsJCWRldl9kYmcoY3RybC0+ZGV2LCAiRGlzYWJsZSBIVyBFQ0MgZm9yIG9u
LWRpZSBFQ0NcbiIpOwoKTm90IG5lZWRlZC4KCj4gKwkJYnJjbW5hbmRfc2V0X2VjY19lbmFibGVk
KGhvc3QsIDApOwo+ICsJfSBlbHNlCj4gKwkJYnJjbW5hbmRfc2V0X2VjY19lbmFibGVkKGhvc3Qs
IDEpOwoKU3R5bGUgaXMgd3JvbmcsIGJ1dCBvdGhlcndpc2UgSSB0aGluayBFQ0Mgc2hvdWxkIGJl
IGtlcHQgZGlzYWJsZWQgd2hpbGUKbm90IGluIGFjdGl2ZSB1c2UsIHNvIEkgYW0gYSBiaXQgc3Vy
cHJpc2VkIGJ5IHRoaXMgbGluZS4KCj4gIAo+ICAJYnJjbW5hbmRfcHJpbnRfY2ZnKGhvc3QsIG1z
ZywgY2ZnKTsKPiAgCWRldl9pbmZvKGN0cmwtPmRldiwgImRldGVjdGVkICVzXG4iLCBtc2cpOwoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
