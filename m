Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF610C7EE23
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 06:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPmA4tI8g5hLUByOnnFmI8j2rppdona36fF7jM3y3KM=; b=Wj3kIgNVwS91KO
	GUjidQJ0LmUj6HZ6RA0uekFH5UThb6AmdLJlZ02I0Nmk6vECAExomgsbAwAS0ZCkCXVw0gI8DjY+5
	rtwRI3C0rkYAVf6RhiQ9xIbLeCO52wL6HL4w+p7lShwnCbQIhzJV53d/my39P3zjpQd0aRXhRpVWI
	yPl83hklzD0+DO75dIZCSLRgUetT3j9IHxCAz6SIxo8OHZPT1hMdcudAVrktNCDMPPzYmElnVxrHq
	dAtLnCuY8dhKleDjLrxUk1F/dy8QKNSwLlEYLoWepou5TPhxE0MpbeeUfj87SDZnu9LATrq7vE15b
	vS+WXZ2HWqddTLTsPPUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q79Y7-008JrT-3B;
	Thu, 08 Jun 2023 06:55:11 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q79Y3-008Jpt-0J;
	Thu, 08 Jun 2023 06:55:09 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686207302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWXRdGGmZzI4Wh/27K2Er33T4VOE2lP1R5sKn6cAeUI=;
	b=cIHM8Ny2Ggz/XxrcksVYSha0jPw2RudbIikuhNwLP87L6c5T/dO0nLCnq7/t2dd4tuSSZx
	eH2FRbTb9fk0peNC1dTrsP3lXpOyrbMkcf3Pme0TXwZZBt133gJn2epruYfxUYYda/BwDx
	zd/LGcC3575sLCjmAbBWgWtywY5j/TJvgPMzaJqWNPHe1HBikwmVUod87l7q/qlZ0ojWMZ
	X9xIk5VKS2wletCOvV4fyyAxTwr7a8ab9nJgZ56+1uVRDUQ1jJ9poPf+PknDHj1VGYx/82
	2Wf6bLXhhSJ19RWZwTs6f0MGRspKwqM1D2rrru8YkiaD/q+hiCRcxEIYzaKrHQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE64BC0009;
	Thu,  8 Jun 2023 06:54:59 +0000 (UTC)
Date: Thu, 8 Jun 2023 08:54:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, oxffffaa@gmail.com,
 kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: meson: check buffer length
Message-ID: <20230608085458.449a24c0@xps-13>
In-Reply-To: <7903580d-685c-14e6-5572-81a4cb31cced@amlogic.com>
References: <20230606101644.3297859-1-AVKrasnov@sberdevices.ru>
	<9adef6da-5930-dcaa-f148-e4a398d39f2d@sberdevices.ru>
	<3a9470ed-d7ad-6cae-0d58-732399590272@sberdevices.ru>
	<7903580d-685c-14e6-5572-81a4cb31cced@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_235507_591552_E82FA781 
X-CRM114-Status: GOOD (  24.99  )
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

SGkgTGlhbmcsCgpsaWFuZy55YW5nQGFtbG9naWMuY29tIHdyb3RlIG9uIFRodSwgOCBKdW4gMjAy
MyAxNDo0Mjo1MyArMDgwMDoKCj4gSGkgQXJzZW5peSwKPiAKPiBPbiAyMDIzLzYvOCA1OjE3LCBB
cnNlbml5IEtyYXNub3Ygd3JvdGU6Cj4gPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiA+IAo+ID4gSGkg
YWdhaW4gTWlxdWVsLCBMaWFuZyEKPiA+IAo+ID4gV2hhdCBkbyBZb3UgdGhpbmsgYWJvdXQgdGhp
cyBwYXRjaD8KPiA+IAo+ID4gVGhhbmtzLCBBcnNlbml5Cj4gPiAKPiA+IE9uIDA2LjA2LjIwMjMg
MTk6MjksIEFyc2VuaXkgS3Jhc25vdiB3cm90ZTogIAo+ID4+IFNvcnJ5LCBoZXJlIGlzIGNoYW5n
ZWxvZzoKPiA+PiB2MSAtPiB2MjoKPiA+PiAqIE1vdmUgY2hlY2tzIGZyb20gJ3N3aXRjaC9jYXNl
JyB3aGljaCBleGVjdXRlcyBjb21tYW5kcyBpbiAnbWVzb25fbmZjX2V4ZWNfb3AoKScgdG8gYSBz
cGVjaWFsCj4gPj4gICAgc2VwYXJhdGVkIGZ1bmN0aW9uICdtZXNvbl9uZmNfY2hlY2tfb3AoKScg
d2hpY2ggaXMgY2FsbGVkIGJlZm9yZSBjb21tYW5kcyBwcm9jZXNzaW5nLgo+ID4+Cj4gPj4gT24g
MDYuMDYuMjAyMyAxMzoxNiwgQXJzZW5peSBLcmFzbm92IHdyb3RlOiAgCj4gPj4+IE1lc29uIE5B
TkQgY29udHJvbGxlciBoYXMgbGltaXRlZCBidWZmZXIgbGVuZ3RoLCBzbyBjaGVjayBpdCBiZWZv
cmUKPiA+Pj4gY29tbWFuZCBleGVjdXRpb24gdG8gYXZvaWQgbGVuZ3RoIHRyaW0uIEFsc28gY2hl
Y2sgTVREIHdyaXRlIHNpemUgb24KPiA+Pj4gY2hpcCBhdHRhY2guCj4gPj4+Cj4gPj4+IFNpZ25l
ZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+ID4+
PiAtLS0KPiA+Pj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA0NyArKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tCj4gPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQyIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNv
bl9uYW5kLmMKPiA+Pj4gaW5kZXggMjNhNzMyNjg0MjFiLi5kYjZiMTg3NTMwNzEgMTAwNjQ0Cj4g
Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ID4+PiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+Pj4gQEAgLTExMSw2ICsxMTEsOCBA
QAo+ID4+Pgo+ID4+PiAgICNkZWZpbmUgUEVSX0lORk9fQllURSAgICAgICAgICAgICAgIDgKPiA+
Pj4KPiA+Pj4gKyNkZWZpbmUgTkZDX0NNRF9SQVdfTEVOICAgICBHRU5NQVNLKDEzLCAwKQo+ID4+
PiArCj4gPj4+ICAgc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgewo+ID4+PiAgICAgICBzdHJ1
Y3QgbGlzdF9oZWFkIG5vZGU7Cj4gPj4+ICAgICAgIHN0cnVjdCBuYW5kX2NoaXAgbmFuZDsKPiA+
Pj4gQEAgLTI4NCw3ICsyODYsNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9uZmNfY21kX2FjY2Vzcyhz
dHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCBpbnQgcmF3LCBib29sIGRpciwKPiA+Pj4KPiA+Pj4gICAg
ICAgaWYgKHJhdykgewo+ID4+PiAgICAgICAgICAgICAgIGxlbiA9IG10ZC0+d3JpdGVzaXplICsg
bXRkLT5vb2JzaXplOwo+ID4+PiAtICAgICAgICAgICAgY21kID0gKGxlbiAmIEdFTk1BU0soMTMs
IDApKSB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsKPiA+Pj4gKyAgICAgICAgICAgIGNtZCA9
IGxlbiB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsKPiA+Pj4gICAgICAgICAgICAgICB3cml0
ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOyAgCj4gCj4gSSB0aGluayB3ZSBj
b3VsZCBrZWVwICImIEdFTk1BU0soMTMsIDApIi4gaXQgaXMgYmV0dGVyIGhlcmUgdG8gaW5kaWNh
dGUgaG93IG1hbnkgYml0cyBvZiBsZW5ndGggaW4gdGhpcyBjb21tYW5kIGFuZCBkb24ndCBkZXN0
b3J5IHRoZSBjb21tYW5kIG9uY2Ugd2UgZG9uJ3QgY2hlY2sgdGhlICJsZW4iIG91dHNpZGUgb2Yg
dGhpcyBmdW5jdGlvbi4gb3IgdGhlIGNvZGUgImlmIChsZW4gPiAgTkZDX0NNRF9SQVdfTEVOKSIg
aXMgYmV0dGVyIHRvIHB1dCBpbnNpZGUgdGhpcyBmdW5jdGlvbiBuZWFybHkuIFRoYW5rcy4KCkl0
IGRlcGVuZHMgd2hvIGNhbGxzIHRoaXMgaGVscGVyLiBJZiBvbmx5IHVzZWQgaW5zaWRlIGV4ZWNf
b3AsCml0J3Mgbm90IHVzZWZ1bC4gSWYgdXNlZCBvdXRzaWRlLCB0aGVuIGlmIHlvdSB3YW50IHRv
IGNsYXJpZnkKdGhpbmdzIHlvdSBtYXkgd2FudCB0byB1c2U6CgojZGVmaW5lIE5GQ19DTURfT1Bf
TEVOKGNtZCkgRklFTERfUFJFUChHRU5NQVNLKDEzLCAwKSwgKGNtZCkpCgpUaGlzIGlzIGJ5IGZh
ciBteSBmYXZvcml0ZSBjb25zdHJ1Y3Rpb24uIENvdWxkIGFwcGx5IHRvIG1hbnkgb3RoZXIKZmll
bGRzLCBsaWtlIERNQV9ESVIsIHNjcmFtYmxlciwgZXRjLgoKPiA+Pj4gICAgICAgICAgICAgICBy
ZXR1cm47Cj4gPj4+ICAgICAgIH0KPiA+Pj4gQEAgLTU3Myw3ICs1NzUsNyBAQCBzdGF0aWMgaW50
IG1lc29uX25mY19yZWFkX2J1ZihzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLCBpbnQg
bGVuKQo+ID4+PiAgICAgICBpZiAocmV0KQo+ID4+PiAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+
ID4+Pgo+ID4+PiAtICAgIGNtZCA9IE5GQ19DTURfTjJNIHwgKGxlbiAmIEdFTk1BU0soMTMsIDAp
KTsKPiA+Pj4gKyAgICBjbWQgPSBORkNfQ01EX04yTSB8IGxlbjsKPiA+Pj4gICAgICAgd3JpdGVs
KGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPiA+Pj4KPiA+Pj4gICAgICAgbWVz
b25fbmZjX2RyYWluX2NtZChuZmMpOwo+ID4+PiBAQCAtNTk3LDcgKzU5OSw3IEBAIHN0YXRpYyBp
bnQgbWVzb25fbmZjX3dyaXRlX2J1ZihzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLCBp
bnQgbGVuKQo+ID4+PiAgICAgICBpZiAocmV0KQo+ID4+PiAgICAgICAgICAgICAgIHJldHVybiBy
ZXQ7Cj4gPj4+Cj4gPj4+IC0gICAgY21kID0gTkZDX0NNRF9NMk4gfCAobGVuICYgR0VOTUFTSygx
MywgMCkpOwo+ID4+PiArICAgIGNtZCA9IE5GQ19DTURfTTJOIHwgbGVuOwo+ID4+PiAgICAgICB3
cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+ID4+Pgo+ID4+PiAgICAg
ICBtZXNvbl9uZmNfZHJhaW5fY21kKG5mYyk7Cj4gPj4+IEBAIC0xMDA3LDYgKzEwMDksMzEgQEAg
bWVzb25fbmFuZF9vcF9wdXRfZG1hX3NhZmVfb3V0cHV0X2J1Zihjb25zdCBzdHJ1Y3QgbmFuZF9v
cF9pbnN0ciAqaW5zdHIsCj4gPj4+ICAgICAgICAgICAgICAga2ZyZWUoYnVmKTsKPiA+Pj4gICB9
Cj4gPj4+Cj4gPj4+ICtzdGF0aWMgaW50IG1lc29uX25mY19jaGVja19vcChzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
bmFuZF9vcGVyYXRpb24gKm9wKQo+ID4+PiArewo+ID4+PiArICAgIGludCBvcF9pZDsKPiA+Pj4g
Kwo+ID4+PiArICAgIGZvciAob3BfaWQgPSAwOyBvcF9pZCA8IG9wLT5uaW5zdHJzOyBvcF9pZCsr
KSB7Cj4gPj4+ICsgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9vcF9pbnN0ciAqaW5zdHI7
Cj4gPj4+ICsKPiA+Pj4gKyAgICAgICAgICAgIGluc3RyID0gJm9wLT5pbnN0cnNbb3BfaWRdOwo+
ID4+PiArCj4gPj4+ICsgICAgICAgICAgICBzd2l0Y2ggKGluc3RyLT50eXBlKSB7Cj4gPj4+ICsg
ICAgICAgICAgICBjYXNlIE5BTkRfT1BfREFUQV9JTl9JTlNUUjoKPiA+Pj4gKyAgICAgICAgICAg
IGNhc2UgTkFORF9PUF9EQVRBX09VVF9JTlNUUjoKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAg
aWYgKGluc3RyLT5jdHguZGF0YS5sZW4gPiBORkNfQ01EX1JBV19MRU4pCj4gPj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9UU1VQUDsKPiA+Pj4gKwo+ID4+PiArICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+Pj4gKyAgICAgICAgICAgIGRlZmF1bHQ6Cj4gPj4+
ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4+PiArICAgICAgICAgICAgfQo+ID4+PiAr
ICAgIH0KPiA+Pj4gKwo+ID4+PiArICAgIHJldHVybiAwOwo+ID4+PiArfQo+ID4+PiArCj4gPj4+
ICAgc3RhdGljIGludCBtZXNvbl9uZmNfZXhlY19vcChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLAo+
ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9vcGVyYXRp
b24gKm9wLCBib29sIGNoZWNrX29ubHkpCj4gPj4+ICAgewo+ID4+PiBAQCAtMTAxNSwxMCArMTA0
MiwxMiBAQCBzdGF0aWMgaW50IG1lc29uX25mY19leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKm5h
bmQsCj4gPj4+ICAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0ciA9IE5VTEw7
Cj4gPj4+ICAgICAgIHZvaWQgKmJ1ZjsKPiA+Pj4gICAgICAgdTMyIG9wX2lkLCBkZWxheV9pZGxl
LCBjbWQ7Cj4gPj4+ICsgICAgaW50IGVycjsKPiA+Pj4gICAgICAgaW50IGk7Cj4gPj4+Cj4gPj4+
IC0gICAgaWYgKGNoZWNrX29ubHkpCj4gPj4+IC0gICAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4g
KyAgICBlcnIgPSBtZXNvbl9uZmNfY2hlY2tfb3AobmFuZCwgb3ApOwo+ID4+PiArICAgIGlmIChl
cnIgfHwgY2hlY2tfb25seSkKPiA+Pj4gKyAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gPj4+Cj4g
Pj4+ICAgICAgIG1lc29uX25mY19zZWxlY3RfY2hpcChuYW5kLCBvcC0+Y3MpOwo+ID4+PiAgICAg
ICBmb3IgKG9wX2lkID0gMDsgb3BfaWQgPCBvcC0+bmluc3Ryczsgb3BfaWQrKykgewo+ID4+PiBA
QCAtMTI5Myw2ICsxMzIyLDcgQEAgc3RhdGljIGludCBtZXNvbl9uYW5kX2F0dGFjaF9jaGlwKHN0
cnVjdCBuYW5kX2NoaXAgKm5hbmQpCj4gPj4+ICAgICAgIHN0cnVjdCBtZXNvbl9uZmNfbmFuZF9j
aGlwICptZXNvbl9jaGlwID0gdG9fbWVzb25fbmFuZChuYW5kKTsKPiA+Pj4gICAgICAgc3RydWN0
IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChuYW5kKTsKPiA+Pj4gICAgICAgaW50IG5zZWN0
b3JzID0gbXRkLT53cml0ZXNpemUgLyAxMDI0Owo+ID4+PiArICAgIGludCByYXdfd3JpdGVzaXpl
Owo+ID4+PiAgICAgICBpbnQgcmV0Owo+ID4+Pgo+ID4+PiAgICAgICBpZiAoIW10ZC0+bmFtZSkg
ewo+ID4+PiBAQCAtMTMwNCw2ICsxMzM0LDEzIEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9hdHRh
Y2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+ID4+PiAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9NRU07Cj4gPj4+ICAgICAgIH0KPiA+Pj4KPiA+Pj4gKyAgICByYXdfd3Jp
dGVzaXplID0gbXRkLT53cml0ZXNpemUgKyBtdGQtPm9vYnNpemU7Cj4gPj4+ICsgICAgaWYgKHJh
d193cml0ZXNpemUgPiBORkNfQ01EX1JBV19MRU4pIHsKPiA+Pj4gKyAgICAgICAgICAgIGRldl9l
cnIobmZjLT5kZXYsICJ0b28gYmlnIHdyaXRlIHNpemUgaW4gcmF3IG1vZGU6ICVkID4gJWxkXG4i
LAo+ID4+PiArICAgICAgICAgICAgICAgICAgICByYXdfd3JpdGVzaXplLCBORkNfQ01EX1JBV19M
RU4pOwo+ID4+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPj4+ICsgICAgfQo+ID4+
PiArCj4gPj4+ICAgICAgIGlmIChuYW5kLT5iYnRfb3B0aW9ucyAmIE5BTkRfQkJUX1VTRV9GTEFT
SCkKPiA+Pj4gICAgICAgICAgICAgICBuYW5kLT5iYnRfb3B0aW9ucyB8PSBOQU5EX0JCVF9OT19P
T0I7Cj4gPj4+ICAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
