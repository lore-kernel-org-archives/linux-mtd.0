Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DF2EB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 07:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcFrhw2daJh/va73MbIrrbri9uOOlYNGYiVT2TYSUf4=; b=UCUUsKcLX+XKAo
	3Joreoq9Pzugo8a8tDGCMnszcepdCdWPTbZx43wR8OuoqCYVrs638f8kTCh1mDDVRcs53EwyEoPqg
	wkASPXVKqaWa0H7+hiP4Oozfwlmt5giS3uud0oJXTMUdCJAlQkm2tpdeZDd+gAyIBGG0ZwNQ2yR5M
	eNjpucVwuScEE24tWhqdjUSiDgXkd3G5t4RysqxcbZ+k/55TZcaCWiJtV6eESVVGQXY4lWQ8ov6OS
	LDhll4YOmFVOj9JsywVhyCpZ3h4eMMvK0tga3EeZ11jkBLhoB4DJoFjo3casMD9xDAAFFGjk1mljF
	tvzc8yXVbILn8JfhRgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB9AU-007gFb-2a;
	Mon, 19 Jun 2023 07:19:18 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB9AS-007gEY-13
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 07:19:17 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687159152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k1veaGQ2wOdpEaAy0NCuYfkXutrbxrLHWI4Iiw5PKCg=;
	b=nW4j5Mnd/ro6eB9V51g+7y+suGmrcIdQbF8ApvvKPRYCKs4aFfRYQ/4kZMbaJmFT94vnKh
	b9auw/VPpGZ+2zD5IIxGC5Ak77WS/6/7Ejm+KnzCMgCKkmiwQCwAHFX6wr1O+stPNmtMaC
	U2vRZZkEbwioM5BX/zdPYiJpDpoTr3U5ePkiM+vJYdblEFfG/aw2/SsHO8oNqiIPT8qtAJ
	zMQk03U6jkaZLBMlkRErsvN8Ak9eMY1qSMTNbGSwcq4bfkVHgKr4MDdpjZ7f1isPl6j7AA
	UQ/iXSYfioSCzi/bgiweeP/a37mN3kmnX0/sFYQwktp128iy5lvdB/v5jwnbEg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EBEE1BF20F;
	Mon, 19 Jun 2023 07:19:09 +0000 (UTC)
Date: Mon, 19 Jun 2023 09:19:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 05/17] dt-bindings: mtd: qcom: Fix a property
 position
Message-ID: <20230619091909.179a29ec@xps-13>
In-Reply-To: <3f4f4beb-4136-312a-be0b-5ec018b4329d@linaro.org>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
	<20230606175246.190465-6-miquel.raynal@bootlin.com>
	<3f4f4beb-4136-312a-be0b-5ec018b4329d@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_001916_778634_F80BC81A 
X-CRM114-Status: GOOD (  21.80  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIE1v
biwgMTkgSnVuIDIwMjMgMDg6NTQ6MTMgKzAyMDA6Cgo+IE9uIDA2LzA2LzIwMjMgMTk6NTIsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBxY29tLGJvb3QtcGFydGl0aW9ucyBpcyBhIE5BTkQgY2hp
cCBwcm9wZXJ0eSwgbm90IGEgTkFORCBjb250cm9sbGVyCj4gPiBwcm9wZXJ0eS4gTW92ZSB0aGUg
ZGVzY3JpcHRpb24gb2YgdGhlIHByb3BlcnR5IGludG8gdGhlIE5BTkQgY2hpcAo+ID4gc2VjdGlv
biBhbmQganVzdCBlbmFibGUgdGhlIHByb3BlcnR5IGluIHRoZSBpZi9lbHNlIGJsb2NrLgo+ID4g
Cj4gPiBGaXhlczogNTI3OGNjOTNhOTdmICgiZHQtYmluZGluZ3M6IG10ZDogcWNvbV9uYW5kYzog
ZG9jdW1lbnQgcWNvbSxib290LXBhcnRpdGlvbnMgYmluZGluZyIpCj4gPiBDYzogTWFuaXZhbm5h
biBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbCAgIHwgNDEgKysrKysrKysrKystLS0t
LS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMo
LSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcWNvbSxuYW5kYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9xY29tLG5hbmRjLnlhbWwKPiA+IGluZGV4IDA3MDI0ZWU0NTk1MS4uNzIxN2Q4YTY0ZDE0
IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9x
Y29tLG5hbmRjLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcWNvbSxuYW5kYy55YW1sCj4gPiBAQCAtNDUsNiArNDUsMjIgQEAgcGF0dGVyblByb3Bl
cnRpZXM6Cj4gPiAgICAgICAgICBlbnVtOgo+ID4gICAgICAgICAgICAtIDUxMgo+ID4gIAo+ID4g
KyAgICAgIHFjb20sYm9vdC1wYXJ0aXRpb25zOgo+ID4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLW1hdHJpeAo+ID4gKyAgICAgICAgaXRlbXM6
Cj4gPiArICAgICAgICAgIGl0ZW1zOgo+ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IG9m
ZnNldAo+ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IHNpemUKPiA+ICsgICAgICAgIGRl
c2NyaXB0aW9uOgo+ID4gKyAgICAgICAgICBCb290IHBhcnRpdGlvbiB1c2UgYSBkaWZmZXJlbnQg
bGF5b3V0IHdoZXJlIHRoZSA0IGJ5dGVzIG9mIHNwYXJlCj4gPiArICAgICAgICAgIGRhdGEgYXJl
IG5vdCBwcm90ZWN0ZWQgYnkgRUNDLiBVc2UgdGhpcyB0byBkZWNsYXJlIHRoZXNlIHNwZWNpYWwK
PiA+ICsgICAgICAgICAgcGFydGl0aW9ucyBieSBkZWZpbmluZyBmaXJzdCB0aGUgb2Zmc2V0IGFu
ZCB0aGVuIHRoZSBzaXplLgo+ID4gKwo+ID4gKyAgICAgICAgICBJdCdzIGluIHRoZSBmb3JtIG9m
IDxvZmZzZXQxIHNpemUxIG9mZnNldDIgc2l6ZTIgb2Zmc2V0MyAuLi4+Cj4gPiArICAgICAgICAg
IGFuZCBzaG91bGQgYmUgZGVjbGFyZWQgaW4gYXNjZW5kaW5nIG9yZGVyLgo+ID4gKwo+ID4gKyAg
ICAgICAgICBSZWZlciB0byB0aGUgaXBxODA2NCBleGFtcGxlIG9uIGhvdyB0byB1c2UgdGhpcyBz
cGVjaWFsIGJpbmRpbmcuCj4gPiArCj4gPiAgYWxsT2Y6Cj4gPiAgICAtICRyZWY6ICJuYW5kLWNv
bnRyb2xsZXIueWFtbCMiICAKPiAKPiBBbHNvIGJhc2VkIG9uIHNvbWUgb2xkIHRyZWUuCgpJIGRv
IGhhdmUgCgoxZjc5YTYxMWU3NGMgKCJkdC1iaW5kaW5nczogbXRkOiBEcm9wIHVubmVlZGVkIHF1
b3RlcyIpCgppbiBteSBsb2csIHNvIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgcXVvdGVzLiBXaGVu
IEkgcmUtZ2VuZXJhdGUgdGhlCnBhdGNoZXMsIHRoZXkgbm8gbG9uZ2VyIGFwcGVhci4gSSBtdXN0
IGhhdmUgZG9uZSBzb21ldGhpbmcgc2lsbHkgYXQKc29tZSBwb2ludCB3aXRob3V0IG5vdGljaW5n
LiBNeSBhcG9sb2dpZXMuIEknbGwgInRyeSIgYWdhaW4uCgo+IFJldmlld2VkLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IEtyenlzenRvZgo+IAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
