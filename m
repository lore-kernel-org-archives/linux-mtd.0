Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766A1C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 07:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyzO+yKzc9G6LtkCD6X2dC+X4HnBrw5lcYYdPW9H0G0=; b=lhT+3VbQS18Hs0
	A5Np0IIJ97VmLkB0JJZ8Hd4gM5YmqmQAPTy+KKlffZ5po24ikBkPgxszv9xBNA7f6k8uHGuQjdOHM
	lyFI9XlbVNoTx/2MyBFdhPSL3lDG8bClWAITI05/OTgk/r/QWRmaipZq1/VwlkOBTGmhCHKVltIyN
	o2iWgP66/VYtMq592tOukax4WJdR5ym668F680hy9GwCAREUg9Iv62LxYu5zb0LCubAEWNhlYtZbs
	MBIJElyLgXHGbKHXguMExfl3SWYGbIXDxc8IZWu1+tdEWyWJIA7VK1VcDBQlI+Mxn1O9x3ueMNGDa
	w+UnVoxlGirx4rYkf+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QvS-000VB3-1g;
	Tue, 06 Jun 2023 07:16:18 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QvO-000V9h-0Y;
	Tue, 06 Jun 2023 07:16:15 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686035771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJMd3X39gfloId/A1Wagf/3OEcwUvYfW467X78c7WYQ=;
	b=hlyB8kt5puxkU+DY/1dlQPALXQ2RVeYLgWpRd709I11yU6OwumbyQ1SoMJVnZGPx/LNWX5
	Tchhw7DIg+iEU3VPi1OWBmEO2zkPjPQvPV9vePMLzKx4PQGMFXdJoNIJ2bSQ/FIm8Yorq1
	+Gw4Kr0OcaWDHiSnauJOqpYp+SUu1SAMQmSgpOSKSyRhyzwxwBJJudM2r8F24MD+rwQ2OH
	vV4twKa6ShxXzDLN4bPenrqBkkSyGvLt3ZwA/lE6kJp6EXxkDo28iIP5YxzjSoN+U26Tx5
	nNBUPINAvHSaFT3vS7Cc1iDZRZqp+xeWiaTBHSwDnwGgPI/TuCbi5WUyPxXmew==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 311C4240004;
	Tue,  6 Jun 2023 07:16:09 +0000 (UTC)
Date: Tue, 6 Jun 2023 09:16:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] mtd: rawnand: meson: check buffer length
Message-ID: <20230606091607.7b7b6814@xps-13>
In-Reply-To: <20230605191047.1820016-1-AVKrasnov@sberdevices.ru>
References: <20230605191047.1820016-1-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_001614_516171_C2955566 
X-CRM114-Status: GOOD (  18.30  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBNb24sIDUgSnVu
IDIwMjMgMjI6MTA6NDYgKzAzMDA6Cgo+IE1lc29uIE5BTkQgY29udHJvbGxlciBoYXMgbGltaXRl
ZCBidWZmZXIgbGVuZ3RoLCBzbyBjaGVjayBpdCBiZWZvcmUKPiBjb21tYW5kIGV4ZWN1dGlvbiB0
byBhdm9pZCBsZW5ndGggdHJpbS4gQWxzbyBjaGVjayBNVEQgd3JpdGUgc2l6ZSBvbgo+IGNoaXAg
YXR0YWNoLgoKQWxtb3N0IHRoZXJlIDopCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jh
c25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9tZXNvbl9uYW5kLmMgfCAyMiArKysrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9tZXNvbl9uYW5kLmMKPiBpbmRleCAwNzRlMTQyMjVjMDYuLmJmYjUzNjNjYWMyMyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiBAQCAtMTA4LDYgKzEwOCw4IEBACj4gIAo+ICAj
ZGVmaW5lIFBFUl9JTkZPX0JZVEUJCTgKPiAgCj4gKyNkZWZpbmUgTkZDX0NNRF9SQVdfTEVOCUdF
Tk1BU0soMTMsIDApCj4gKwo+ICBzdHJ1Y3QgbWVzb25fbmZjX25hbmRfY2hpcCB7Cj4gIAlzdHJ1
Y3QgbGlzdF9oZWFkIG5vZGU7Cj4gIAlzdHJ1Y3QgbmFuZF9jaGlwIG5hbmQ7Cj4gQEAgLTI4MCw3
ICsyODIsNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9uZmNfY21kX2FjY2VzcyhzdHJ1Y3QgbmFuZF9j
aGlwICpuYW5kLCBpbnQgcmF3LCBib29sIGRpciwKPiAgCj4gIAlpZiAocmF3KSB7Cj4gIAkJbGVu
ID0gbXRkLT53cml0ZXNpemUgKyBtdGQtPm9vYnNpemU7Cj4gLQkJY21kID0gKGxlbiAmIEdFTk1B
U0soMTMsIDApKSB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsKPiArCQljbWQgPSBsZW4gfCBz
Y3JhbWJsZXIgfCBETUFfRElSKGRpcik7Cj4gIAkJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSAr
IE5GQ19SRUdfQ01EKTsKPiAgCQlyZXR1cm47Cj4gIAl9Cj4gQEAgLTU0NCw3ICs1NDYsNyBAQCBz
dGF0aWMgaW50IG1lc29uX25mY19yZWFkX2J1ZihzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAq
YnVmLCBpbnQgbGVuKQo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIG91dDsKPiAgCj4gLQljbWQgPSBO
RkNfQ01EX04yTSB8IChsZW4gJiBHRU5NQVNLKDEzLCAwKSk7Cj4gKwljbWQgPSBORkNfQ01EX04y
TSB8IGxlbjsKPiAgCXdyaXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4g
IAo+ICAJbWVzb25fbmZjX2RyYWluX2NtZChuZmMpOwo+IEBAIC01NjgsNyArNTcwLDcgQEAgc3Rh
dGljIGludCBtZXNvbl9uZmNfd3JpdGVfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpi
dWYsIGludCBsZW4pCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IC0JY21kID0g
TkZDX0NNRF9NMk4gfCAobGVuICYgR0VOTUFTSygxMywgMCkpOwo+ICsJY21kID0gTkZDX0NNRF9N
Mk4gfCBsZW47Cj4gIAl3cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+
ICAKPiAgCW1lc29uX25mY19kcmFpbl9jbWQobmZjKTsKPiBAQCAtOTM2LDYgKzkzOCw5IEBAIHN0
YXRpYyBpbnQgbWVzb25fbmZjX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiAgCQkJ
YnJlYWs7Cj4gIAo+ICAJCWNhc2UgTkFORF9PUF9EQVRBX0lOX0lOU1RSOgo+ICsJCQlpZiAoaW5z
dHItPmN0eC5kYXRhLmxlbiA+IE5GQ19DTURfUkFXX0xFTikKPiArCQkJCXJldHVybiAtRUlOVkFM
OwoKWW91IG5lZWQgdG8gcmVmdXNlIHRoZSBvcGVyYXRpb24gZWFybGllci4gVGhhdCdzIHdoYXQg
dGhlIGNoZWNrX29wCmJvb2xlYW4gaXMgYWJvdXQuIE1heWJlIHlvdSBjYW4gdGFrZSBpbnNwaXJh
dGlvbiBmcm9tIGFuZmNfY2hlY2tfb3AoKQppbiB0aGUgYXJhc2FuIGNvbnRyb2xsZXIuCgo+ICsK
PiAgCQkJYnVmID0gbWVzb25fbmFuZF9vcF9nZXRfZG1hX3NhZmVfaW5wdXRfYnVmKGluc3RyKTsK
PiAgCQkJaWYgKCFidWYpCj4gIAkJCQlyZXR1cm4gLUVOT01FTTsKPiBAQCAtOTQ0LDYgKzk0OSw5
IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwK
PiAgCQkJYnJlYWs7Cj4gIAo+ICAJCWNhc2UgTkFORF9PUF9EQVRBX09VVF9JTlNUUjoKPiArCQkJ
aWYgKGluc3RyLT5jdHguZGF0YS5sZW4gPiBORkNfQ01EX1JBV19MRU4pCj4gKwkJCQlyZXR1cm4g
LUVJTlZBTDsKClNhbWUuCgo+ICsKPiAgCQkJYnVmID0gbWVzb25fbmFuZF9vcF9nZXRfZG1hX3Nh
ZmVfb3V0cHV0X2J1ZihpbnN0cik7Cj4gIAkJCWlmICghYnVmKQo+ICAJCQkJcmV0dXJuIC1FTk9N
RU07Cj4gQEAgLTExODEsNiArMTE4OSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9hdHRhY2hf
Y2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+ICAJc3RydWN0IG1lc29uX25mY19uYW5kX2No
aXAgKm1lc29uX2NoaXAgPSB0b19tZXNvbl9uYW5kKG5hbmQpOwo+ICAJc3RydWN0IG10ZF9pbmZv
ICptdGQgPSBuYW5kX3RvX210ZChuYW5kKTsKPiAgCWludCBuc2VjdG9ycyA9IG10ZC0+d3JpdGVz
aXplIC8gMTAyNDsKPiArCWludCByYXdfd3JpdGVzaXplOwo+ICAJaW50IHJldDsKPiAgCj4gIAlp
ZiAoIW10ZC0+bmFtZSkgewo+IEBAIC0xMTkyLDYgKzEyMDEsMTMgQEAgc3RhdGljIGludCBtZXNv
bl9uYW5kX2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQpCj4gIAkJCXJldHVybiAt
RU5PTUVNOwo+ICAJfQo+ICAKPiArCXJhd193cml0ZXNpemUgPSBtdGQtPndyaXRlc2l6ZSArIG10
ZC0+b29ic2l6ZTsKPiArCWlmIChyYXdfd3JpdGVzaXplID4gTkZDX0NNRF9SQVdfTEVOKSB7Cj4g
KwkJZGV2X2VycihuZmMtPmRldiwgInRvbyBiaWcgd3JpdGUgc2l6ZSBpbiByYXcgbW9kZTogJWQg
PiAlbGRcbiIsCj4gKwkJCXJhd193cml0ZXNpemUsIE5GQ19DTURfUkFXX0xFTik7Cj4gKwkJcmV0
dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gKwo+ICAJaWYgKG5hbmQtPmJidF9vcHRpb25zICYgTkFORF9C
QlRfVVNFX0ZMQVNIKQo+ICAJCW5hbmQtPmJidF9vcHRpb25zIHw9IE5BTkRfQkJUX05PX09PQjsK
PiAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
