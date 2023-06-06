Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E38C7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 07:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oe+BIWKwzPWEvGd+bEHFDqSoLAn5NV9lgjulln7JHWs=; b=X3r4P+DXIq/iR/
	y1iRPzAGJgy7DOlRfjuFTXyB8lAv4UGMzRr+5KKMtG8et0pcHF8O9M/x9G8Vgk0Lmy44lgHi+gijI
	85H/fnv/IDxT8u4gFOB7GjJhkPwPVJkFRhtDtF4evd/LPQ8v8RW3jFqduBSEdtsV0m+0pRgoP9rEW
	qFvgRVh3duBYWMmZg7nNVS36Aj9wc+afh4d6dB6uC7RNfUxyG4eOHKNNY9RsJxprj/Uc4A9sEwByj
	b5gaYA8gWgL2pHmmb73zr8agNE1A9kR5Ex8kptmgAcx3n98b9bBJu0KHqv80iPQm7FBFMqD0ZCTHc
	9jotnbCmXcLHuPS2FELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RSe-000fv8-1E;
	Tue, 06 Jun 2023 07:50:36 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RSZ-000frm-0i;
	Tue, 06 Jun 2023 07:50:34 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686037827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2KqMPztr7hiHXP+1Ynp2WQJHqpjlFJterm7Ue0Xb7a8=;
	b=efYk/mp/GqY2gaRAM1u4E0/RnjrIyAEdu5r9KXTgGSS0a0rXNYb5NlcR40VTUAcAmmrl/A
	ZMep28lJje1jervWCmxNuG/l8taN7DRFLDxix/hnfmxOjYo7SRS8+9mGXVD8D1jM94ln4r
	GXdVHXlpQbmfwITCcqhtCU+Hgw/8SxyK1AOeBBulXhB4Fi9Wxc9S+TwrxJ3YyyQQMwm5Cf
	doRidcuGQic8YBihUi3NKHDQ3oXCNdDaoWIEHaQ/pFIO76eO0i6HwA53t3dIuMKuCVwTef
	F2wiU9KLNKV5x6E3BOj4iknEskYATxSRbYIVq06s/L3z44RAZEiZjY8XuykZyg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id C751360003;
	Tue,  6 Jun 2023 07:50:24 +0000 (UTC)
Date: Tue, 6 Jun 2023 09:50:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] mtd: rawnand: meson: check buffer length
Message-ID: <20230606095023.26a056a3@xps-13>
In-Reply-To: <e31be327-b351-3a94-b2d8-0867f29bb9ec@sberdevices.ru>
References: <20230605191047.1820016-1-AVKrasnov@sberdevices.ru>
	<20230606091607.7b7b6814@xps-13>
	<e31be327-b351-3a94-b2d8-0867f29bb9ec@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_005031_521735_9C8280B8 
X-CRM114-Status: GOOD (  22.60  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDYgSnVu
IDIwMjMgMTA6Mzc6NDMgKzAzMDA6Cgo+IE9uIDA2LjA2LjIwMjMgMTA6MTYsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4gPiBBVktyYXNub3ZAc2JlcmRldmljZXMu
cnUgd3JvdGUgb24gTW9uLCA1IEp1biAyMDIzIDIyOjEwOjQ2ICswMzAwOgo+ID4gICAKPiA+PiBN
ZXNvbiBOQU5EIGNvbnRyb2xsZXIgaGFzIGxpbWl0ZWQgYnVmZmVyIGxlbmd0aCwgc28gY2hlY2sg
aXQgYmVmb3JlCj4gPj4gY29tbWFuZCBleGVjdXRpb24gdG8gYXZvaWQgbGVuZ3RoIHRyaW0uIEFs
c28gY2hlY2sgTVREIHdyaXRlIHNpemUgb24KPiA+PiBjaGlwIGF0dGFjaC4gIAo+ID4gCj4gPiBB
bG1vc3QgdGhlcmUgOikgIAo+IAo+IEhlbGxvIE1pcXVlbCEKPiAKPiBZb3UgbWVhbiB0byByZXBo
cmFzZSBpdD8gOikKCk5vdCBhdCBhbGwsIEkgbWVhbnQ6IHRoZXJlIGlzIHNvbWV0aGluZyB0byBj
aGFuZ2UgaW4gdGhpcyBmaWxlIChzZWUKYmVsb3cpIGJ1dCB0aGUgcGF0Y2ggaXMgY2xvc2UgdG8g
YmUgcmVhZHkuCgo+IAo+IFRoYW5rcywgQXJzZW5peQo+IAo+ID4gICAKPiA+Pgo+ID4+IFNpZ25l
ZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+ID4+
IC0tLQo+ID4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCAyMiArKysrKysr
KysrKysrKysrKysrLS0tCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L21lc29uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ID4+IGlu
ZGV4IDA3NGUxNDIyNWMwNi4uYmZiNTM2M2NhYzIzIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L21lc29uX25hbmQuYwo+ID4+IEBAIC0xMDgsNiArMTA4LDggQEAKPiA+PiAgCj4gPj4gICNkZWZp
bmUgUEVSX0lORk9fQllURQkJOAo+ID4+ICAKPiA+PiArI2RlZmluZSBORkNfQ01EX1JBV19MRU4J
R0VOTUFTSygxMywgMCkKPiA+PiArCj4gPj4gIHN0cnVjdCBtZXNvbl9uZmNfbmFuZF9jaGlwIHsK
PiA+PiAgCXN0cnVjdCBsaXN0X2hlYWQgbm9kZTsKPiA+PiAgCXN0cnVjdCBuYW5kX2NoaXAgbmFu
ZDsKPiA+PiBAQCAtMjgwLDcgKzI4Miw3IEBAIHN0YXRpYyB2b2lkIG1lc29uX25mY19jbWRfYWNj
ZXNzKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIGludCByYXcsIGJvb2wgZGlyLAo+ID4+ICAKPiA+
PiAgCWlmIChyYXcpIHsKPiA+PiAgCQlsZW4gPSBtdGQtPndyaXRlc2l6ZSArIG10ZC0+b29ic2l6
ZTsKPiA+PiAtCQljbWQgPSAobGVuICYgR0VOTUFTSygxMywgMCkpIHwgc2NyYW1ibGVyIHwgRE1B
X0RJUihkaXIpOwo+ID4+ICsJCWNtZCA9IGxlbiB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsK
PiA+PiAgCQl3cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+ID4+ICAJ
CXJldHVybjsKPiA+PiAgCX0KPiA+PiBAQCAtNTQ0LDcgKzU0Niw3IEBAIHN0YXRpYyBpbnQgbWVz
b25fbmZjX3JlYWRfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsIGludCBsZW4p
Cj4gPj4gIAlpZiAocmV0KQo+ID4+ICAJCWdvdG8gb3V0Owo+ID4+ICAKPiA+PiAtCWNtZCA9IE5G
Q19DTURfTjJNIHwgKGxlbiAmIEdFTk1BU0soMTMsIDApKTsKPiA+PiArCWNtZCA9IE5GQ19DTURf
TjJNIHwgbGVuOwo+ID4+ICAJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01E
KTsKPiA+PiAgCj4gPj4gIAltZXNvbl9uZmNfZHJhaW5fY21kKG5mYyk7Cj4gPj4gQEAgLTU2OCw3
ICs1NzAsNyBAQCBzdGF0aWMgaW50IG1lc29uX25mY193cml0ZV9idWYoc3RydWN0IG5hbmRfY2hp
cCAqbmFuZCwgdTggKmJ1ZiwgaW50IGxlbikKPiA+PiAgCWlmIChyZXQpCj4gPj4gIAkJcmV0dXJu
IHJldDsKPiA+PiAgCj4gPj4gLQljbWQgPSBORkNfQ01EX00yTiB8IChsZW4gJiBHRU5NQVNLKDEz
LCAwKSk7Cj4gPj4gKwljbWQgPSBORkNfQ01EX00yTiB8IGxlbjsKPiA+PiAgCXdyaXRlbChjbWQs
IG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4gPj4gIAo+ID4+ICAJbWVzb25fbmZjX2Ry
YWluX2NtZChuZmMpOwo+ID4+IEBAIC05MzYsNiArOTM4LDkgQEAgc3RhdGljIGludCBtZXNvbl9u
ZmNfZXhlY19vcChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLAo+ID4+ICAJCQlicmVhazsKPiA+PiAg
Cj4gPj4gIAkJY2FzZSBOQU5EX09QX0RBVEFfSU5fSU5TVFI6Cj4gPj4gKwkJCWlmIChpbnN0ci0+
Y3R4LmRhdGEubGVuID4gTkZDX0NNRF9SQVdfTEVOKQo+ID4+ICsJCQkJcmV0dXJuIC1FSU5WQUw7
ICAKPiA+IAo+ID4gWW91IG5lZWQgdG8gcmVmdXNlIHRoZSBvcGVyYXRpb24gZWFybGllci4gVGhh
dCdzIHdoYXQgdGhlIGNoZWNrX29wCj4gPiBib29sZWFuIGlzIGFib3V0LiBNYXliZSB5b3UgY2Fu
IHRha2UgaW5zcGlyYXRpb24gZnJvbSBhbmZjX2NoZWNrX29wKCkKPiA+IGluIHRoZSBhcmFzYW4g
Y29udHJvbGxlci4gIAo+IAo+IE9rISBUaGFua3MhCj4gCj4gPiAgIAo+ID4+ICsKPiA+PiAgCQkJ
YnVmID0gbWVzb25fbmFuZF9vcF9nZXRfZG1hX3NhZmVfaW5wdXRfYnVmKGluc3RyKTsKPiA+PiAg
CQkJaWYgKCFidWYpCj4gPj4gIAkJCQlyZXR1cm4gLUVOT01FTTsKPiA+PiBAQCAtOTQ0LDYgKzk0
OSw5IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqbmFu
ZCwKPiA+PiAgCQkJYnJlYWs7Cj4gPj4gIAo+ID4+ICAJCWNhc2UgTkFORF9PUF9EQVRBX09VVF9J
TlNUUjoKPiA+PiArCQkJaWYgKGluc3RyLT5jdHguZGF0YS5sZW4gPiBORkNfQ01EX1JBV19MRU4p
Cj4gPj4gKwkJCQlyZXR1cm4gLUVJTlZBTDsgIAo+ID4gCj4gPiBTYW1lLgo+ID4gICAKPiA+PiAr
Cj4gPj4gIAkJCWJ1ZiA9IG1lc29uX25hbmRfb3BfZ2V0X2RtYV9zYWZlX291dHB1dF9idWYoaW5z
dHIpOwo+ID4+ICAJCQlpZiAoIWJ1ZikKPiA+PiAgCQkJCXJldHVybiAtRU5PTUVNOwo+ID4+IEBA
IC0xMTgxLDYgKzExODksNyBAQCBzdGF0aWMgaW50IG1lc29uX25hbmRfYXR0YWNoX2NoaXAoc3Ry
dWN0IG5hbmRfY2hpcCAqbmFuZCkKPiA+PiAgCXN0cnVjdCBtZXNvbl9uZmNfbmFuZF9jaGlwICpt
ZXNvbl9jaGlwID0gdG9fbWVzb25fbmFuZChuYW5kKTsKPiA+PiAgCXN0cnVjdCBtdGRfaW5mbyAq
bXRkID0gbmFuZF90b19tdGQobmFuZCk7Cj4gPj4gIAlpbnQgbnNlY3RvcnMgPSBtdGQtPndyaXRl
c2l6ZSAvIDEwMjQ7Cj4gPj4gKwlpbnQgcmF3X3dyaXRlc2l6ZTsKPiA+PiAgCWludCByZXQ7Cj4g
Pj4gIAo+ID4+ICAJaWYgKCFtdGQtPm5hbWUpIHsKPiA+PiBAQCAtMTE5Miw2ICsxMjAxLDEzIEBA
IHN0YXRpYyBpbnQgbWVzb25fbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5k
KQo+ID4+ICAJCQlyZXR1cm4gLUVOT01FTTsKPiA+PiAgCX0KPiA+PiAgCj4gPj4gKwlyYXdfd3Jp
dGVzaXplID0gbXRkLT53cml0ZXNpemUgKyBtdGQtPm9vYnNpemU7Cj4gPj4gKwlpZiAocmF3X3dy
aXRlc2l6ZSA+IE5GQ19DTURfUkFXX0xFTikgewo+ID4+ICsJCWRldl9lcnIobmZjLT5kZXYsICJ0
b28gYmlnIHdyaXRlIHNpemUgaW4gcmF3IG1vZGU6ICVkID4gJWxkXG4iLAo+ID4+ICsJCQlyYXdf
d3JpdGVzaXplLCBORkNfQ01EX1JBV19MRU4pOwo+ID4+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4+
ICsJfQo+ID4+ICsKPiA+PiAgCWlmIChuYW5kLT5iYnRfb3B0aW9ucyAmIE5BTkRfQkJUX1VTRV9G
TEFTSCkKPiA+PiAgCQluYW5kLT5iYnRfb3B0aW9ucyB8PSBOQU5EX0JCVF9OT19PT0I7Cj4gPj4g
ICAgCj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAgCgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
