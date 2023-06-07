Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798B6C7EE23
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 07:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlVMMrml4l1om2ibnkx2kuqGUf3ZCtxonBJVlDWn7WY=; b=0tWwVwd+HCk/Gv
	9+5169VGt1GeGlZxNbyWmUw1p1gD6om8gGD6hIcsEOkvXU4ZoHVsszYo4ToQS873fVlmhckAQfOzL
	hvPissUH884bJgX/mtXwgrZiAexgbsZXGmYqCPP+rnZGU9IBaVJz4I8JwrlWZXBvgXE8g/dVR9PB1
	1V8Fd9nDBuv7MVJ7GnBNfmfaXLVUhrrtq4isGrKAS1/gT/ZobXGGn9E0JMHj13voUWxyS4npaBxVG
	GPCBzm0WEiNdFdjn27sInqz7Ncfy+nFCdEUK2+RUJI2qLxWWqMi4vwJAABmbkAaY+qfazhrtF7S/1
	ub3m4bJQrF+rdH+SfYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nz9-004p03-2G;
	Wed, 07 Jun 2023 07:53:39 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nz5-004oyD-2E
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 07:53:37 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686124408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcLRZhDifkjO9el4TbmvvBrGVYIDPPuPnUdWOdVzOlc=;
	b=bsUNg6sge6L1MvYN7SL9TM4wSWi11Ohh/2Zvqnb5kpaZfcySdP8scKqX2oAVVaIZ8cbUnO
	LBbtOp3OQxUJ5iNHpKi7jcHY2lpDAOUPwlQlnA0VP+abt/iHuXSbX1Eosdn03MKylQQHY5
	bIwO3/qAT+59Qk1DIsZ97LnevKPzXq80lhB4mbN3siqn0ACNM+UxW1g7vcaL+VKghA5gCD
	fmutkzZTuafujRw0zD93ZKQQOnEjUAbP3KmAcDurl/sLr+bi7COGh22OFJTwP0nt46WjTA
	K8x2v4sgM+J0+6VlNRKgx1Nv9QTEtjZbBV6fsbtnvV1zFMyYGIst6FPGt3J8xA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60F29240005;
	Wed,  7 Jun 2023 07:53:25 +0000 (UTC)
Date: Wed, 7 Jun 2023 09:53:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, "Michael Walle" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Rob
 Herring <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 06/17] dt-bindings: mtd: qcom: Prevent NAND chip
 unevaluated properties
Message-ID: <20230607095325.36cacdc1@xps-13>
In-Reply-To: <6bfc7652-ab2b-3a22-8ef7-7ba421eb4d93@alliedtelesis.co.nz>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
	<20230606175246.190465-7-miquel.raynal@bootlin.com>
	<6bfc7652-ab2b-3a22-8ef7-7ba421eb4d93@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_005336_125551_DBC03A35 
X-CRM114-Status: GOOD (  20.37  )
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

SGkgQ2hyaXMsCgpDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gVHVl
LCA2IEp1biAyMDIzIDIyOjI3OjIzCiswMDAwOgoKPiBPbiA3LzA2LzIzIDA1OjUyLCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOgo+ID4gTGlzdCBhbGwgdGhlIHBvc3NpYmxlIHByb3BlcnRpZXMgaW4gdGhl
IE5BTkQgY2hpcCBhcyBwZXIgdGhlIGV4YW1wbGUgYW5kCj4gPiBzZXQgdW5ldmFsdWF0ZWRQcm9w
ZXJ0aWVzIHRvIGZhbHNlIGluIHRoZSBOQU5EIGNoaXAgc2VjdGlvbi4KPiA+Cj4gPiBDYzogTWFu
aXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sIHwgNCAr
KysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFt
bAo+ID4gaW5kZXggNzIxN2Q4YTY0ZDE0Li41ODE5NzNmNDUyZmYgMTAwNjQ0Cj4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbAo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlh
bWwKPiA+IEBAIC0zNCw3ICszNCw5IEBAIHByb3BlcnRpZXM6Cj4gPiAgIHBhdHRlcm5Qcm9wZXJ0
aWVzOgo+ID4gICAgICJebmFuZEBbYS1mMC05XSQiOgo+ID4gICAgICAgdHlwZTogb2JqZWN0Cj4g
PiArICAgICRyZWY6IHJhdy1uYW5kLWNoaXAueWFtbAo+ID4gICAgICAgcHJvcGVydGllczoKPiA+
ICsKPiA+ICAgICAgICAgbmFuZC1idXMtd2lkdGg6Cj4gPiAgICAgICAgICAgY29uc3Q6IDgKPiA+
ICAgCj4gPiBAQCAtNjEsNiArNjMsOCBAQCBwYXR0ZXJuUHJvcGVydGllczoKPiA+ICAgCj4gPiAg
ICAgICAgICAgICBSZWZlciB0byB0aGUgaXBxODA2NCBleGFtcGxlIG9uIGhvdyB0byB1c2UgdGhp
cyBzcGVjaWFsIGJpbmRpbmcuCj4gPiAgIAo+ID4gKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6
IGZhbHNlCj4gPiArCj4gPiAgIGFsbE9mOgo+ID4gICAgIC0gJHJlZjogIm5hbmQtY29udHJvbGxl
ci55YW1sIyIKPiA+ICAgICAKPiAKPiBUaGlzIGRvZXNuJ3QgYXBwZWFyIHRvIGJlIHdvcmtpbmcg
YXMgaW50ZW5kZWQuIElmIEkgYWRkIHRoZSBmb2xsb3dpbmcKPiAKPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwgCj4gYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbAo+IGlu
ZGV4IDU4MTk3M2Y0NTJmZi4uN2E5MTBhNjJjN2I4IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwKPiBAQCAtMjIw
LDYgKzIyMCw3IEBAIGV4YW1wbGVzOgo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwYXJ0aXRpb25AMCB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbGFiZWwgPSAiYm9vdC1uYW5kIjsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWcgPSA8MCAweDU4YTAwMDA+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBub25zZW5zZTsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfTsKPiAKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFydGl0aW9u
QDU4YTAwMDAgewo+IAo+IAo+IFRoZW4gSSdkIGV4cGVjdCB0byBnZXQgYSBjb21wbGFpbnQgZnJv
bSBgbWFrZSBtcnByb3BlcjsgbWFrZSAKPiBEVF9DSEVDS0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdf
Y2hlY2sgRFRfU0NIRU1BX0ZJTEVTPXFjb20sbmFuZGMueWFtbGAgCj4gYnV0IGl0IHNlZW1zIHRv
IGxldCB0aGlzIHRocm91Z2guCgpJIGFtIGp1c3QgZml4aW5nIHRoZSBOQU5EIGNoaXAgbm9kZSB3
aGlsZSB0aGlzIGlzIGEgcGFydGl0aW9uIG5vZGUuIFdlCm5lZWQgdG8gY29uc3RyYWluIG1vcmUg
YWxsIHRoZSBzY2hlbWFzLCBsZXQncyBzdGFydCB3aXRoIHRoZSBiZWdpbm5pbmcKOikKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
