Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32477C7EE23
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 06:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9vaq559FXRghbwFR70B+ySq6oxhsKP3A0uUfJB+gMU=; b=21sy3THbW5qGxO
	RjB2kMV+GdQjJPY+RX+jQsfgX3lQ4kealo9afIbwlE0cGHbhYIHNQKx4wPb6IwmZ0XOOyjju5VUJL
	xnkILrKgSSfb/b9yt3Oaxnb6MWWHdgeh+mgmq5wMOabUNIlCnLodI4Vfn45rDOdk7F+3vokCHVriy
	XhqFSVd6OcjxST4VG4siZhrDHhpjoq73MSUUaOqXSPRVeyapIu17xlv/wHTkssaax0Uur7dh21BtI
	rWljB7CoOGI2YiTkjcv4Lh1U6qi5c+ueSbqOxAHiaqEwfhlJ9UXLThXjCqTay4m5D7fRVgbX+/OeK
	oLpQXA2aYn1iMOX12XVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q78rO-008DKV-0z;
	Thu, 08 Jun 2023 06:11:02 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q78rJ-008DIj-31;
	Thu, 08 Jun 2023 06:11:00 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686204642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L997pm3OZhsNoBTfFX2W/lctWbOsQWynn+RPco5OgpU=;
	b=MGa3vCMTokL6CKkH9wvmJbz/uqjVPW+/NE9H5ZTV6JyvdoH1/KXwWnGdMGOFxoid3HIsN1
	dSd3H2nMXLjvBy58xkjO7mhm45DBk1I2k2/AcUPbVr/kmGuCIjqN4Q3hwUar0k6h3DE5F/
	O5LcFMphiqp8AR7fAC/CXbTAZRiuirmVtLLDU30slKulDO732zi/vHyuvYr+vEtbwqesEz
	VAIJnv7zPP3cTDvJe8S1G0VgsHnO8BFMQa55JX2ObQkpzTVpF1VgHq23y46h+hu1nJs6Rg
	niJZUOw/HQ8A2+C4kNDeW8iWUkA36ParRGKITkIbLdkVVXaxjdjMMqoBiSyOiQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 526B01C000F;
	Thu,  8 Jun 2023 06:10:41 +0000 (UTC)
Date: Thu, 8 Jun 2023 08:10:40 +0200
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
Subject: Re: [PATCH v2] mtd: rawnand: meson: check buffer length
Message-ID: <20230608081040.78e74eb1@xps-13>
In-Reply-To: <3a9470ed-d7ad-6cae-0d58-732399590272@sberdevices.ru>
References: <20230606101644.3297859-1-AVKrasnov@sberdevices.ru>
	<9adef6da-5930-dcaa-f148-e4a398d39f2d@sberdevices.ru>
	<3a9470ed-d7ad-6cae-0d58-732399590272@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_231058_241946_57B680F4 
X-CRM114-Status: GOOD (  25.25  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUaHUsIDggSnVu
IDIwMjMgMDA6MTc6MzUgKzAzMDA6Cgo+IEhpIGFnYWluIE1pcXVlbCwgTGlhbmchCj4gCj4gV2hh
dCBkbyBZb3UgdGhpbmsgYWJvdXQgdGhpcyBwYXRjaD8KCkkgcmVhbGx5IGFwcHJlY2lhdGUgYWxs
IHRoZSBlZmZvcnQgeW91IGFyZSBwdXR0aW5nIGludG8gdGhpcyBidXQKcGxlYXNlIGNvbnNpZGVy
IGdpdmluZyBtZSBhIGxpdHRsZSBiaXQgb2YgYWlyIGFzIHdlbGwsIEknbSBhbHJlYWR5CnNwZW5k
aW5nIGEgbG90IG9mIHRpbWUgcmV2aWV3aW5nIGFsbCB5b3VyIHBhdGNoZXMuIFBsZWFzZSBtaW5k
IGEgcGluZwppcyBub3QgcmVsZXZhbnQgYmVmb3JlIGEgY291cGxlIG9mIHdlZWtzIGluIGdlbmVy
YWwuCgpJbiB0aGlzIGNhc2UgSSBoYWQgaXQgaW4gbXkgInRvIGFwcGx5IiBsaXN0IGJ1dCBhY3R1
YWxseSBsb29raW5nIGF0IGl0CmFnYWluIEkgaGF2ZSBhIG1pbm9yIGNvbW1lbnQgYmVsb3cuCgo+
IAo+IFRoYW5rcywgQXJzZW5peQo+IAo+IE9uIDA2LjA2LjIwMjMgMTk6MjksIEFyc2VuaXkgS3Jh
c25vdiB3cm90ZToKPiA+IFNvcnJ5LCBoZXJlIGlzIGNoYW5nZWxvZzoKPiA+IHYxIC0+IHYyOgo+
ID4gKiBNb3ZlIGNoZWNrcyBmcm9tICdzd2l0Y2gvY2FzZScgd2hpY2ggZXhlY3V0ZXMgY29tbWFu
ZHMgaW4gJ21lc29uX25mY19leGVjX29wKCknIHRvIGEgc3BlY2lhbAo+ID4gICBzZXBhcmF0ZWQg
ZnVuY3Rpb24gJ21lc29uX25mY19jaGVja19vcCgpJyB3aGljaCBpcyBjYWxsZWQgYmVmb3JlIGNv
bW1hbmRzIHByb2Nlc3NpbmcuCj4gPiAKPiA+IE9uIDA2LjA2LjIwMjMgMTM6MTYsIEFyc2VuaXkg
S3Jhc25vdiB3cm90ZTogIAo+ID4+IE1lc29uIE5BTkQgY29udHJvbGxlciBoYXMgbGltaXRlZCBi
dWZmZXIgbGVuZ3RoLCBzbyBjaGVjayBpdCBiZWZvcmUKPiA+PiBjb21tYW5kIGV4ZWN1dGlvbiB0
byBhdm9pZCBsZW5ndGggdHJpbS4gQWxzbyBjaGVjayBNVEQgd3JpdGUgc2l6ZSBvbgo+ID4+IGNo
aXAgYXR0YWNoLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxBVkty
YXNub3ZAc2JlcmRldmljZXMucnU+Cj4gPj4gLS0tCj4gPj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3
L21lc29uX25hbmQuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiA+PiAg
MSBmaWxlIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPj4KPiA+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPj4gaW5kZXggMjNhNzMyNjg0MjFiLi5kYjZi
MTg3NTMwNzEgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFu
ZC5jCj4gPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPj4gQEAg
LTExMSw2ICsxMTEsOCBAQAo+ID4+ICAKPiA+PiAgI2RlZmluZSBQRVJfSU5GT19CWVRFCQk4Cj4g
Pj4gIAo+ID4+ICsjZGVmaW5lIE5GQ19DTURfUkFXX0xFTglHRU5NQVNLKDEzLCAwKQo+ID4+ICsK
PiA+PiAgc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgewo+ID4+ICAJc3RydWN0IGxpc3RfaGVh
ZCBub2RlOwo+ID4+ICAJc3RydWN0IG5hbmRfY2hpcCBuYW5kOwo+ID4+IEBAIC0yODQsNyArMjg2
LDcgQEAgc3RhdGljIHZvaWQgbWVzb25fbmZjX2NtZF9hY2Nlc3Moc3RydWN0IG5hbmRfY2hpcCAq
bmFuZCwgaW50IHJhdywgYm9vbCBkaXIsCj4gPj4gIAo+ID4+ICAJaWYgKHJhdykgewo+ID4+ICAJ
CWxlbiA9IG10ZC0+d3JpdGVzaXplICsgbXRkLT5vb2JzaXplOwo+ID4+IC0JCWNtZCA9IChsZW4g
JiBHRU5NQVNLKDEzLCAwKSkgfCBzY3JhbWJsZXIgfCBETUFfRElSKGRpcik7Cj4gPj4gKwkJY21k
ID0gbGVuIHwgc2NyYW1ibGVyIHwgRE1BX0RJUihkaXIpOwo+ID4+ICAJCXdyaXRlbChjbWQsIG5m
Yy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4gPj4gIAkJcmV0dXJuOwo+ID4+ICAJfQo+ID4+
IEBAIC01NzMsNyArNTc1LDcgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcmVhZF9idWYoc3RydWN0
IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1ZiwgaW50IGxlbikKPiA+PiAgCWlmIChyZXQpCj4gPj4g
IAkJZ290byBvdXQ7Cj4gPj4gIAo+ID4+IC0JY21kID0gTkZDX0NNRF9OMk0gfCAobGVuICYgR0VO
TUFTSygxMywgMCkpOwo+ID4+ICsJY21kID0gTkZDX0NNRF9OMk0gfCBsZW47Cj4gPj4gIAl3cml0
ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+ID4+ICAKPiA+PiAgCW1lc29u
X25mY19kcmFpbl9jbWQobmZjKTsKPiA+PiBAQCAtNTk3LDcgKzU5OSw3IEBAIHN0YXRpYyBpbnQg
bWVzb25fbmZjX3dyaXRlX2J1ZihzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLCBpbnQg
bGVuKQo+ID4+ICAJaWYgKHJldCkKPiA+PiAgCQlyZXR1cm4gcmV0Owo+ID4+ICAKPiA+PiAtCWNt
ZCA9IE5GQ19DTURfTTJOIHwgKGxlbiAmIEdFTk1BU0soMTMsIDApKTsKPiA+PiArCWNtZCA9IE5G
Q19DTURfTTJOIHwgbGVuOwo+ID4+ICAJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19S
RUdfQ01EKTsKPiA+PiAgCj4gPj4gIAltZXNvbl9uZmNfZHJhaW5fY21kKG5mYyk7Cj4gPj4gQEAg
LTEwMDcsNiArMTAwOSwzMSBAQCBtZXNvbl9uYW5kX29wX3B1dF9kbWFfc2FmZV9vdXRwdXRfYnVm
KGNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0ciwKPiA+PiAgCQlrZnJlZShidWYpOwo+
ID4+ICB9Cj4gPj4gIAo+ID4+ICtzdGF0aWMgaW50IG1lc29uX25mY19jaGVja19vcChzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLAo+ID4+ICsJCQkgICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9vcGVyYXRp
b24gKm9wKQo+ID4+ICt7Cj4gPj4gKwlpbnQgb3BfaWQ7Cj4gPj4gKwo+ID4+ICsJZm9yIChvcF9p
ZCA9IDA7IG9wX2lkIDwgb3AtPm5pbnN0cnM7IG9wX2lkKyspIHsKPiA+PiArCQljb25zdCBzdHJ1
Y3QgbmFuZF9vcF9pbnN0ciAqaW5zdHI7Cj4gPj4gKwo+ID4+ICsJCWluc3RyID0gJm9wLT5pbnN0
cnNbb3BfaWRdOwo+ID4+ICsKPiA+PiArCQlzd2l0Y2ggKGluc3RyLT50eXBlKSB7Cj4gPj4gKwkJ
Y2FzZSBOQU5EX09QX0RBVEFfSU5fSU5TVFI6Cj4gPj4gKwkJY2FzZSBOQU5EX09QX0RBVEFfT1VU
X0lOU1RSOgo+ID4+ICsJCQlpZiAoaW5zdHItPmN0eC5kYXRhLmxlbiA+IE5GQ19DTURfUkFXX0xF
TikKPiA+PiArCQkJCXJldHVybiAtRU5PVFNVUFA7Cj4gPj4gKwo+ID4+ICsJCQlicmVhazsKPiA+
PiArCQlkZWZhdWx0Ogo+ID4+ICsJCQlicmVhazsKPiA+PiArCQl9Cj4gPj4gKwl9Cj4gPj4gKwo+
ID4+ICsJcmV0dXJuIDA7Cj4gPj4gK30KPiA+PiArCj4gPj4gIHN0YXRpYyBpbnQgbWVzb25fbmZj
X2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiA+PiAgCQkJICAgICBjb25zdCBzdHJ1
Y3QgbmFuZF9vcGVyYXRpb24gKm9wLCBib29sIGNoZWNrX29ubHkpCj4gPj4gIHsKPiA+PiBAQCAt
MTAxNSwxMCArMTA0MiwxMiBAQCBzdGF0aWMgaW50IG1lc29uX25mY19leGVjX29wKHN0cnVjdCBu
YW5kX2NoaXAgKm5hbmQsCj4gPj4gIAljb25zdCBzdHJ1Y3QgbmFuZF9vcF9pbnN0ciAqaW5zdHIg
PSBOVUxMOwo+ID4+ICAJdm9pZCAqYnVmOwo+ID4+ICAJdTMyIG9wX2lkLCBkZWxheV9pZGxlLCBj
bWQ7Cj4gPj4gKwlpbnQgZXJyOwo+ID4+ICAJaW50IGk7Cj4gPj4gIAo+ID4+IC0JaWYgKGNoZWNr
X29ubHkpCj4gPj4gLQkJcmV0dXJuIDA7Cj4gPj4gKwllcnIgPSBtZXNvbl9uZmNfY2hlY2tfb3Ao
bmFuZCwgb3ApOwo+ID4+ICsJaWYgKGVyciB8fCBjaGVja19vbmx5KQo+ID4+ICsJCXJldHVybiBl
cnI7CgpGb3IgdGhlIHNha2Ugb2YgcmVhZGFiaWxpdHkgaXQgaXMgcmVhbGx5IGltcG9ydGFudCB0
aGF0IHdlIGtlZXAgdXNpbmcKc3RhbmRhcmQgY29uc3RydWN0aW9ucywgc28gZG9uJ3QgbWl4IG9y
dGhvZ29uYWwgY2hlY2tzIGFuZCBwbGVhc2UgdXNlCnNvbWV0aGluZyBsaWtlOgoKCWVyciA9IGNo
ZWNrKCk7CglpZiAoZXJyKQoJCXJldHVybiBlcnI7CgoJaWYgKGNoZWNrX29ubHkpCgkJcmV0dXJu
IDA7Cgo+ID4+ICAKPiA+PiAgCW1lc29uX25mY19zZWxlY3RfY2hpcChuYW5kLCBvcC0+Y3MpOwo+
ID4+ICAJZm9yIChvcF9pZCA9IDA7IG9wX2lkIDwgb3AtPm5pbnN0cnM7IG9wX2lkKyspIHsKPiA+
PiBAQCAtMTI5Myw2ICsxMzIyLDcgQEAgc3RhdGljIGludCBtZXNvbl9uYW5kX2F0dGFjaF9jaGlw
KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQpCj4gPj4gIAlzdHJ1Y3QgbWVzb25fbmZjX25hbmRfY2hp
cCAqbWVzb25fY2hpcCA9IHRvX21lc29uX25hbmQobmFuZCk7Cj4gPj4gIAlzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCA9IG5hbmRfdG9fbXRkKG5hbmQpOwo+ID4+ICAJaW50IG5zZWN0b3JzID0gbXRkLT53
cml0ZXNpemUgLyAxMDI0Owo+ID4+ICsJaW50IHJhd193cml0ZXNpemU7Cj4gPj4gIAlpbnQgcmV0
Owo+ID4+ICAKPiA+PiAgCWlmICghbXRkLT5uYW1lKSB7Cj4gPj4gQEAgLTEzMDQsNiArMTMzNCwx
MyBAQCBzdGF0aWMgaW50IG1lc29uX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAq
bmFuZCkKPiA+PiAgCQkJcmV0dXJuIC1FTk9NRU07Cj4gPj4gIAl9Cj4gPj4gIAo+ID4+ICsJcmF3
X3dyaXRlc2l6ZSA9IG10ZC0+d3JpdGVzaXplICsgbXRkLT5vb2JzaXplOwo+ID4+ICsJaWYgKHJh
d193cml0ZXNpemUgPiBORkNfQ01EX1JBV19MRU4pIHsKPiA+PiArCQlkZXZfZXJyKG5mYy0+ZGV2
LCAidG9vIGJpZyB3cml0ZSBzaXplIGluIHJhdyBtb2RlOiAlZCA+ICVsZFxuIiwKPiA+PiArCQkJ
cmF3X3dyaXRlc2l6ZSwgTkZDX0NNRF9SQVdfTEVOKTsKPiA+PiArCQlyZXR1cm4gLUVJTlZBTDsK
PiA+PiArCX0KPiA+PiArCj4gPj4gIAlpZiAobmFuZC0+YmJ0X29wdGlvbnMgJiBOQU5EX0JCVF9V
U0VfRkxBU0gpCj4gPj4gIAkJbmFuZC0+YmJ0X29wdGlvbnMgfD0gTkFORF9CQlRfTk9fT09COwo+
ID4+ICAgIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
