Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955DCC77B6E
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 09:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GeZaunfXnKPpmtk54qWBsN2hAxpPmO1KjNr3NQk5I4=; b=Kg2o+rvEa7iX8c
	Lj2L1o3Yn30eEv9SYmvvdbL1sgT8pWU+M+SwRXLDcxRUzQtuwJtlpQnqOPgucGYfxULMQmJNZHHAl
	lZdadWIVUYpfUh33NZBBaBgF/XSyXIZSHi6sWYDOhfjHAxkEmpJ+I5W5LRGEiRhISoKf1jhL4bucx
	H1x5YpCFphcXpH8Xh34HiL+rtvhwqvsOlyWaTh4ofPycfyfxKIFXrfCRbYIRSNJrEDGVPiCbRYkjl
	2d/eq3wJ91yNhmAD4ZP+coTKHQU5sUKEXoE4gctf7Ubf/t0021za/KHDpSMs9SQ0ZlKFD5rmFCoxz
	MNig3cJRxUkYKhto9fzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmWub-002PtN-0C;
	Wed, 12 Apr 2023 09:37:09 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmWuW-002PpT-0U;
	Wed, 12 Apr 2023 09:37:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 55AE11C0016;
	Wed, 12 Apr 2023 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681292217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjAW3sbnqjC4RD0jM6Lfr+B+vyxCfa8273h/4IpoFAI=;
	b=W+a/1wnc3Yf9nMGLvyToyer/4s32mDzQcVuiqsEQAORqqeroXYGnnmyqM1luAsPxHGAxY8
	y9wIBoK2H4KBIKbJZAvv10MwQSQssxV8h875/K2cH/NqFtputacVb8EguSdhS5IF/rLYup
	fwa2pexXTUf+TjnIuKLgcARBVScdt8JJWz28ARJ/o+5TsMjwcQBnhzef/pIejEEngIboz7
	kmzxLM9F46nQcW0N/+l1HjLkxoWbBnDkc9qSCs68r+ADXYP3aOBUq65np/DRP49kRSf/1A
	s0HkjTC6qa40BJeB1iI9HRGs1RvQSFjZhEtRYSIZBY0a23YKzl/DiKQ78rXjMw==
Date: Wed, 12 Apr 2023 11:36:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before
 read
Message-ID: <20230412113654.183350d0@xps-13>
In-Reply-To: <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
	<20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
	<20230412094400.3c82f631@xps-13>
	<ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_023704_649963_2D551ED3 
X-CRM114-Status: GOOD (  23.91  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDEyIEFw
ciAyMDIzIDEyOjIwOjU1ICswMzAwOgoKPiBPbiAxMi4wNC4yMDIzIDEwOjQ0LCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+ID4gSGkgQXJzZW5peSwKPiA+IAo+ID4gQVZLcmFzbm92QHNiZXJkZXZpY2Vz
LnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMDk6MTY6NTggKzAzMDA6Cj4gPiAgIAo+ID4+
IFRoaXMgTkFORCByZWFkcyBvbmx5IGZldyB1c2VyJ3MgYnl0ZXMgaW4gRUNDIG1vZGUgKG5vdCBm
dWxsIE9PQiksIHNvICAKPiA+IAo+ID4gIlRoaXMgTkFORCByZWFkcyIgZG9lcyBub3QgbG9vayBy
aWdodCwgZG8geW91IG1lYW4gIlN1YnBhZ2UgcmVhZHMgZG8KPiA+IG5vdCByZXRyaWV2ZSBhbGwg
dGhlIE9PQiBieXRlcywiPwo+ID4gICAKPiA+PiBmaWxsIE9PQiBidWZmZXIgd2l0aCB6ZXJvZXMg
dG8gbm90IHJldHVybiBnYXJiYWdlIGZyb20gcHJldmlvdXMgcmVhZHMKPiA+PiB0byB1c2VyLgo+
ID4+IE90aGVyd2lzZSAnbmFuZGR1bXAnIHV0aWxpdHkgcHJpbnRzIHNvbWV0aGluZyBsaWtlIHRo
aXMgZm9yIGp1c3QgZXJhc2VkCj4gPj4gcGFnZToKPiA+Pgo+ID4+IC4uLgo+ID4+IDB4MDAwMDA3
ZjA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCj4gPj4g
ICBPT0IgRGF0YTogZmYgZmYgZmYgZmYgMDAgMDAgZmYgZmYgODAgY2YgMjIgOTkgY2IgYWQgZDMg
YmUKPiA+PiAgIE9PQiBEYXRhOiA2MyAyNyBhZSAwNiAxNiAwYSAyZiBlYiBiYiBkZCA0NiA3NCA0
MSA4ZSA4OCA2ZQo+ID4+ICAgT09CIERhdGE6IDM4IGExIDJkIGU2IDc3IGQ0IDA1IDA2IGYyIGE1
IDdlIDI1IGViIDM0IDdjIGZmCj4gPj4gICBPT0IgRGF0YTogMzggZWEgZGUgMTQgMTAgZGUgOWIg
NDAgMzMgMTYgNmEgY2MgOWQgYWEgMmYgNWUKPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFyc2Vu
aXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+ID4+IC0tLQo+ID4+ICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA1ICsrKysrCj4gPj4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMK
PiA+PiBpbmRleCBmODRhMTAyMzhlNGQuLmYyZjI0NzJjYjUxMSAxMDA2NDQKPiA+PiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+PiArKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+PiBAQCAtODU4LDkgKzg1OCwxMiBAQCBzdGF0aWMgaW50
IG1lc29uX25mY19yZWFkX3BhZ2Vfc3ViKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4gPj4gIHN0
YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwg
dTggKmJ1ZiwKPiA+PiAgCQkJCSAgIGludCBvb2JfcmVxdWlyZWQsIGludCBwYWdlKQo+ID4+ICB7
Cj4gPj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKG5hbmQpOwo+ID4+ICAJ
dTggKm9vYl9idWYgPSBuYW5kLT5vb2JfcG9pOwo+ID4+ICAJaW50IHJldDsKPiA+PiAgCj4gPj4g
KwltZW1zZXQob29iX2J1ZiwgMCwgbXRkLT5vb2JzaXplKTsgIAo+ID4gCj4gPiBJJ20gc3VycHJp
c2VkIHJhdyByZWFkcyBkbyBub3QgcmVhZCB0aGUgZW50aXJlIE9PQj8gIAo+IAo+IFllcyEgU2Vl
bXMgaW4gY2FzZSBvZiByYXcgYWNjZXNzICh3aGF0IGkgc2VlIGluIHRoaXMgZHJpdmVyKSBudW1i
ZXIgb2YgT09CIGJ5dGVzIHJlYWQKPiBzdGlsbCBkZXBlbmRzIG9uIEVDQyBwYXJhbWV0ZXJzOiBm
b3IgZWFjaCBwb3J0aW9uIG9mIGRhdGEgY292ZXJlZCB3aXRoIEVDQyBjb2RlIHdlIGNhbgo+IHJl
YWQgaXQncyBFQ0MgY29kZSBhbmQgInVzZXIgYnl0ZXMiIGZyb20gT09CIC0gaXQgaXMgd2hhdCBp
IHNlZSBieSBkdW1waW5nIERNQSBidWZmZXIgYnkKPiBwcmludGsoKS4gRm9yIGV4YW1wbGUgSSdt
IHdvcmtpbmcgd2l0aCAySyBOQU5EIHBhZ2VzLCBlYWNoIHBhZ2UgaGFzIDIgeCAxSyBFQ0MgYmxv
Y2tzLgo+IEZvciBlYWNoIEVDQyBibG9jayBJIGhhdmUgMTYgT09CIGJ5dGVzIHdoaWNoIEkgY2Fu
IGFjY2VzcyBieSByZWFkL3dyaXRlLiBFYWNoIDE2IGJ5dGVzCj4gY29udGFpbnMgMiBieXRlcyBv
ZiB1c2VyJ3MgZGF0YSBhbmQgMTQgYnl0ZXMgRUNDIGNvZGVzLiBTbyB3aGVuIEkgcmVhZCBwYWdl
IGluIHJhdyBtb2RlCj4gY29udHJvbGxlciByZXR1cm5zIDMyIGJ5dGVzICgyIHggKDIgKyAxNCkp
IG9mIE9PQi4gV2hpbGUgT09CIGlzIHJlcG9ydGVkIGFzIDY0IGJ5dGVzLgoKSW4gYWxsIG1vZGVz
LCB3aGVuIHlvdSByZWFkIE9PQiwgeW91IHNob3VsZCBnZXQgdGhlIGZ1bGwgT09CLiBUaGUgZmFj
dAp0aGF0IEVDQyBjb3JyZWN0aW9uIGlzIGVuYWJsZWQgb3IgZGlzYWJsZWQgZG9lcyBub3QgbWF0
dGVyLiBJZiB0aGUgTkFORApmZWF0dXJlcyBPT0Igc2VjdGlvbnMgb2YgNjQgYnl0ZXMsIHlvdSBz
aG91bGQgZ2V0IHRoZSA2NCBieXRlcy4KCldoYXQgaGFwcGVucyBzb21ldGltZXMsIGlzIHRoYXQg
c29tZSBvZiB0aGUgYnl0ZXMgYXJlIG5vdCBwcm90ZWN0ZWQKYWdhaW5zdCBiaXRmbGlwcywgYnV0
IHRoZSBwb2xpY3kgaXMgdG8gcmV0dXJuIHRoZSBmdWxsIGJ1ZmZlci4KCj4gCj4gVGhhbmtzLCBB
cnNlbml5Cj4gCj4gPiAgIAo+ID4+ICsKPiA+PiAgCXJldCA9IG1lc29uX25mY19yZWFkX3BhZ2Vf
c3ViKG5hbmQsIHBhZ2UsIDEpOwo+ID4+ICAJaWYgKHJldCkKPiA+PiAgCQlyZXR1cm4gcmV0Owo+
ID4+IEBAIC04ODEsNiArODg0LDggQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcmVhZF9wYWdlX2h3
ZWNjKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsCj4gPj4gIAl1OCAqb29iX2J1ZiA9
IG5hbmQtPm9vYl9wb2k7Cj4gPj4gIAlpbnQgcmV0LCBpOwo+ID4+ICAKPiA+PiArCW1lbXNldChv
b2JfYnVmLCAwLCBtdGQtPm9vYnNpemUpOwo+ID4+ICsKPiA+PiAgCXJldCA9IG1lc29uX25mY19y
ZWFkX3BhZ2Vfc3ViKG5hbmQsIHBhZ2UsIDApOwo+ID4+ICAJaWYgKHJldCkKPiA+PiAgCQlyZXR1
cm4gcmV0OyAgCj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAgCgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
