Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A50C88CB2
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qnxtyr+YU4bzPeEUQ8Z+mTgDSkDf+utR0vPxtOTjAP0=; b=CFvbqaTcvNcX9+
	euDQj5fo8bJb22EI/LGydYB6Yz29iWH0KS5JXFWTQxBRZ05+dU2oFlnQqrXbfVJ8NzkzgLxHvY4Fk
	zUriltel1/iuB1jk2xfknoAL9ANANOHv9RsCznHQZPnp+UW1xXd12PsdTgmQ83aUx1lBqGka4jDVj
	4VPOoSCA47WJTMqD7PhvBEk1r8OM1PQzRSUcFrSuXn1/lyOBgHFEJDqPWiBYSjLf19ikJLMljPLtV
	Z/dN/WZXdXMmqMlwbO2tfVBesqdoKPiHIoIvoiwZ1A5yfJSeknwrkpA3aC9Zm3ZVq5rh0XPsS4AxK
	uDaRSpJEAnB/FpuRuW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8lXP-004oAr-2x;
	Mon, 12 Jun 2023 17:41:07 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8lXM-004o9a-0A;
	Mon, 12 Jun 2023 17:41:05 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686591659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DoTTbNvXBcUurbyeVpwbVMaij7JPELHRhQTKrmBNGoU=;
	b=dWOsGXQmoytY91UDXwndQC5STH0UWix9hZNTK5WTNFfo+is61jJkMNrbH7NZ0ypdb7YzH+
	sTcxF80ntZrI3Zj2DlX2xN/VWp4qJov3BKk3GQqrinXhpF3raefjDXCVFiOKziMpFRO0va
	7GpqvqGjXVhHnx5wCUutU95bL/iXELermj5QQrxjp+fCiL1Fvqy3IB7x3Dc21AWlh0V/MH
	I53bJgvIgZ1qivq9npwlFRosVoEmAOt1seJpJfUKLVdOQmXbXuoIVs2H8EeDMLVaZb1c1K
	uZNhEN4+YS72ia5Hjy6zFjL43tjV+vZQSjkgrbnEdN9DvB4aHzPIIVWUhkA5Kg==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 388001C0007;
	Mon, 12 Jun 2023 17:40:58 +0000 (UTC)
Date: Mon, 12 Jun 2023 19:40:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
Subject: Re: [PATCH v2 1/5] mtd: nand: raw: rockchip-nand-controller: copy
 hwecc PA data to oob_poi buffer
Message-ID: <20230612194056.7b27edc5@xps-13>
In-Reply-To: <b4e73d0f-d3de-b3e1-26a4-cce5337fe07e@gmail.com>
References: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
	<b4e73d0f-d3de-b3e1-26a4-cce5337fe07e@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_104104_422685_DE9A1272 
X-CRM114-Status: GOOD (  27.62  )
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

SGkgSm9oYW4sCgpqYng2MjQ0QGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDEyIEp1biAyMDIzIDE3
OjAyOjQwICswMjAwOgoKPiBSb2NrY2hpcCBib290IGJsb2NrcyBhcmUgd3JpdHRlbiBwZXIgNCB4
IDUxMiBieXRlIHNlY3RvcnMgcGVyIHBhZ2UuCj4gRWFjaCBwYWdlIG11c3QgaGF2ZSBhIHBhZ2Ug
YWRkcmVzcyAoUEEpIHBvaW50ZXIgaW4gT09CIHRvIHRoZSBuZXh0IHBhZ2UuCj4gUGFnZXMgYXJl
IHdyaXR0ZW4gaW4gYSBwYXR0ZXJuIGRlcGVuZGluZyBvbiB0aGUgTkFORCBjaGlwIElELgo+IFRo
aXMgbG9naWMgdXNlZCB0byBidWlsZCBhIHBhZ2UgcGF0dGVybiB0YWJsZSBpcyBub3QgZnVsbHkg
ZGlzY2xvc2VkIGFuZAo+IGlzIG5vdCBlYXN5IHRvIGZpdCBpbiB0aGUgTVREIGZyYW1ld29yay4K
PiBUaGUgZm9ybXVsYSBpbiBya19uZmNfd3JpdGVfcGFnZV9od2VjYygpIGZ1bmN0aW9uIGlzIG5v
dCBjb3JyZWN0Lgo+IE1ha2UgaHdlY2MgYW5kIHJhdyBiZWhhdmlvciBpZGVudGljYWwuCj4gR2Vu
ZXJhdGUgYm9vdCBibG9jayBwYWdlIGFkZHJlc3MgYW5kIHBhdHRlcm4gZm9yIGh3ZWNjIGluIHVz
ZXIgc3BhY2UKPiBhbmQgY29weSBQQSBkYXRhIHRvL2Zyb20gdGhlIGxhc3QgNCBieXRlcyBpbiB0
aGUKPiBjaGlwLT5vb2JfcG9pIGRhdGEgbGF5b3V0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvaGFu
IEpvbmtlciA8amJ4NjI0NEBnbWFpbC5jb20+Cj4gLS0tCj4gIC4uLi9tdGQvbmFuZC9yYXcvcm9j
a2NoaXAtbmFuZC1jb250cm9sbGVyLmMgICB8IDM0ICsrKysrKysrKysrKy0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJvbGxlci5jCj4gaW5kZXgg
MjMxMmUyNzM2Li5jYWZjY2MzMjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9y
b2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYwo+IEBAIC01OTcsNyArNTk3LDcgQEAgc3RhdGljIGlu
dCBya19uZmNfd3JpdGVfcGFnZV9od2VjYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCB1
OCAqYnVmLAo+ICAJaW50IHBhZ2VzX3Blcl9ibGsgPSBtdGQtPmVyYXNlc2l6ZSAvIG10ZC0+d3Jp
dGVzaXplOwo+ICAJaW50IHJldCA9IDAsIGksIGJvb3Rfcm9tX21vZGUgPSAwOwo+ICAJZG1hX2Fk
ZHJfdCBkbWFfZGF0YSwgZG1hX29vYjsKPiAtCXUzMiByZWc7Cj4gKwl1MzIgdG1wOwo+ICAJdTgg
Km9vYjsKPiAKPiAgCW5hbmRfcHJvZ19wYWdlX2JlZ2luX29wKGNoaXAsIHBhZ2UsIDAsIE5VTEws
IDApOwo+IEBAIC02MjQsNiArNjI0LDEzIEBAIHN0YXRpYyBpbnQgcmtfbmZjX3dyaXRlX3BhZ2Vf
aHdlY2Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdTggKmJ1ZiwKPiAgCSAqCj4gIAkg
KiAgIDB4RkYgMHhGRiAweEZGIDB4RkYgfCBCQk0gT09CMSBPT0IyIE9PQjMgfCAuLi4KPiAgCSAq
Cj4gKwkgKiBUaGUgY29kZSBoZXJlIGp1c3Qgc3dhcHMgdGhlIGZpcnN0IDQgYnl0ZXMgd2l0aCB0
aGUgbGFzdAo+ICsJICogNCBieXRlcyB3aXRob3V0IGxvc2luZyBhbnkgZGF0YS4KCk1heWJlIHlv
dSBkb24ndCBsb29zZSBhbnkgZGF0YSwgYnV0IHlvdSBiYXNpY2FsbHkgYnJlYWsgYWxsIGV4aXN0
aW5nCmpmZnMyIHVzZXJzLCByaWdodD8gSXMgdGhpcyBwYWdlIGFkZHJlc3Mgb25seSB1c2VmdWwg
b24geW91ciByayBTb0Mgb3IKYXJlIGFsbCB0aGUgU29DcyB1c2luZyB0aGUgc2FtZSBsb2dpYz8K
CkkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0byBmbGFnIHdoZXJlIHRoaXMgaXMgcmVxdWlyZWQg
YW5kIGF2b2lkIGEKbWFzc2l2ZSBpbmNvbXBhdGlibGUgY2hhbmdlIGxpa2UgdGhpcyBvbmUgKGFu
ZCB0aGUgcHJldmlvdXMgb25lKS4gQlRXLAphbnkgcmVhc29uIG5vdCB0byBtZXJnZSB0aGUgdHdv
IGZpcnN0IHBhdGNoZXM/IEl0IHNlZW1zIGxpa2UgdGhlIHNlcmllcwp3b3VsZCBub3QgYmUgYmlz
ZWN0YWJsZSBiZXR3ZWVuIHRoZSB0d28gZmlyc3QgY29tbWl0cy4KClBhdGNoZXMgNCBhbmQgNSBs
b29rIGdvb2QgYXMgdGhleSBhcmUgbm90IGRpcmVjdGx5IHJlbGF0ZWQsIEknbGwgcXVldWUKdGhl
bSwgeW91IGNhbiBhdm9pZCByZS1zZW5kaW5nIHRoZW0uCgo+ICsJICoKPiArCSAqIFRoZSBjaGlw
LT5vb2JfcG9pIGRhdGEgbGF5b3V0Ogo+ICsJICoKPiArCSAqICAgIEJCTSAgT09CMSBPT0IyIE9P
QjMgfC4uLi4uLnwgIFBBMCAgUEExICBQQTIgIFBBMwo+ICsJICoKPiAgCSAqIENvbmZpZ3VyZSB0
aGUgRUNDIGFsZ29yaXRobSBzdXBwb3J0ZWQgYnkgdGhlIGJvb3QgUk9NLgo+ICAJICovCj4gIAlp
ZiAoKHBhZ2UgPCAocGFnZXNfcGVyX2JsayAqIHJrbmFuZC0+Ym9vdF9ibGtzKSkgJiYKPiBAQCAt
NjM0LDIxICs2NDEsMTcgQEAgc3RhdGljIGludCBya19uZmNfd3JpdGVfcGFnZV9od2VjYyhzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCB1OCAqYnVmLAo+ICAJfQo+IAo+ICAJZm9yIChpID0g
MDsgaSA8IGVjYy0+c3RlcHM7IGkrKykgewo+IC0JCWlmICghaSkgewo+IC0JCQlyZWcgPSAweEZG
RkZGRkZGOwo+IC0JCX0gZWxzZSB7Cj4gKwkJaWYgKCFpKQo+ICsJCQlvb2IgPSBjaGlwLT5vb2Jf
cG9pICsgKGVjYy0+c3RlcHMgLSAxKSAqIE5GQ19TWVNfREFUQV9TSVpFOwo+ICsJCWVsc2UKPiAg
CQkJb29iID0gY2hpcC0+b29iX3BvaSArIChpIC0gMSkgKiBORkNfU1lTX0RBVEFfU0laRTsKPiAt
CQkJcmVnID0gb29iWzBdIHwgb29iWzFdIDw8IDggfCBvb2JbMl0gPDwgMTYgfAo+IC0JCQkgICAg
ICBvb2JbM10gPDwgMjQ7Cj4gLQkJfQo+IAo+IC0JCWlmICghaSAmJiBib290X3JvbV9tb2RlKQo+
IC0JCQlyZWcgPSAocGFnZSAmIChwYWdlc19wZXJfYmxrIC0gMSkpICogNDsKPiArCQl0bXAgPSBv
b2JbMF0gfCBvb2JbMV0gPDwgOCB8IG9vYlsyXSA8PCAxNiB8IG9vYlszXSA8PCAyNDsKPiAKPiAg
CQlpZiAobmZjLT5jZmctPnR5cGUgPT0gTkZDX1Y5KQo+IC0JCQluZmMtPm9vYl9idWZbaV0gPSBy
ZWc7Cj4gKwkJCW5mYy0+b29iX2J1ZltpXSA9IHRtcDsKPiAgCQllbHNlCj4gLQkJCW5mYy0+b29i
X2J1ZltpICogKG9vYl9zdGVwIC8gNCldID0gcmVnOwo+ICsJCQluZmMtPm9vYl9idWZbaSAqIChv
b2Jfc3RlcCAvIDQpXSA9IHRtcDsKPiAgCX0KPiAKPiAgCWRtYV9kYXRhID0gZG1hX21hcF9zaW5n
bGUobmZjLT5kZXYsICh2b2lkICopbmZjLT5wYWdlX2J1ZiwKPiBAQCAtODExLDEyICs4MTQsMTcg
QEAgc3RhdGljIGludCBya19uZmNfcmVhZF9wYWdlX2h3ZWNjKHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXAsIHU4ICpidWYsIGludCBvb2Jfb24sCj4gIAkJZ290byB0aW1lb3V0X2VycjsKPiAgCX0KPiAK
PiAtCWZvciAoaSA9IDE7IGkgPCBlY2MtPnN0ZXBzOyBpKyspIHsKPiAtCQlvb2IgPSBjaGlwLT5v
b2JfcG9pICsgKGkgLSAxKSAqIE5GQ19TWVNfREFUQV9TSVpFOwo+ICsJZm9yIChpID0gMDsgaSA8
IGVjYy0+c3RlcHM7IGkrKykgewo+ICsJCWlmICghaSkKPiArCQkJb29iID0gY2hpcC0+b29iX3Bv
aSArIChlY2MtPnN0ZXBzIC0gMSkgKiBORkNfU1lTX0RBVEFfU0laRTsKPiArCQllbHNlCj4gKwkJ
CW9vYiA9IGNoaXAtPm9vYl9wb2kgKyAoaSAtIDEpICogTkZDX1NZU19EQVRBX1NJWkU7Cj4gKwo+
ICAJCWlmIChuZmMtPmNmZy0+dHlwZSA9PSBORkNfVjkpCj4gIAkJCXRtcCA9IG5mYy0+b29iX2J1
ZltpXTsKPiAgCQllbHNlCj4gIAkJCXRtcCA9IG5mYy0+b29iX2J1ZltpICogKG9vYl9zdGVwIC8g
NCldOwo+ICsKPiAgCQkqb29iKysgPSAodTgpdG1wOwo+ICAJCSpvb2IrKyA9ICh1OCkodG1wID4+
IDgpOwo+ICAJCSpvb2IrKyA9ICh1OCkodG1wID4+IDE2KTsKPiAtLQo+IDIuMzAuMgo+IAoKClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
