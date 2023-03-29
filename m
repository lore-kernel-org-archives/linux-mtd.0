Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA531C761A6
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZHcOtMxLCUkH6RvTuwH6TBAH9if+0pahQHIxabVU+0=; b=uBrl15Y6LfxMgv
	vG83y0tl8SwV/CNGkVbBS73oIuYQBpCTnUH4x5ZemvRe32r9N8k/jEj5/MrWakwVgO5dVRF6E6Rcw
	2jwOT9du2bMMwlFRSyFCvSIyaUpNgtEXb4OBhRpU7dKu6l0fewblw6CXzLVeWQ0+e4dJLb/0io1M3
	WQxykD6oprll30ACYUdAZR0jQH4OeZWrMwrIv/x/nzqSJqj6owAJ46fyM5qXhm3/agRATKazgW75f
	aK72TU7mkqYfFrwSN72Va/zUQfdHjgC14GKSkwiZ8UtWdqcY4NNc4Mc3YNe9zykVVzpKqeakLjjRp
	xCzynL/Dks6DcS6c/TSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phRg9-00HEwT-2P;
	Wed, 29 Mar 2023 09:01:13 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRg3-00HEt4-17;
	Wed, 29 Mar 2023 09:01:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DB9F3C0003;
	Wed, 29 Mar 2023 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680080459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0zatGGQG54bItvUiWFNeQvKWMpLA6rN2JrESMa0BVeA=;
	b=I2DMStzPVY2slXtlPUjHVjnyfnYeLkaLt/n979HwUmcswJ7bxx8q72zGmzWp/37MQZZCw7
	OKY9LNr6x87vhklaiKX0RR00tK51SYUrBzATjoIJOrGxbA3j1/bEthZHFb4IBnubLAhxeC
	dtegH2RO24TjDk2XL4NKYNp5h3FgYba6ROtFakEVFbBLusHZuIzRV8UpKal0KZWqzFx476
	mTjLMhb7DWjsrvHKraCL/XFERW1VbPxH9B3Hm6sSVGlwCVoDs3g/1t2FXANFU6t6cN/Kf3
	Sevj3YUn3Qq3t9qDR0WXKLTdIJqan/QmjEPhOwUPHWP5dtFriEt8YecoGQ6a4w==
Date: Wed, 29 Mar 2023 11:00:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Liang Yang
 <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@sberdevices.ru>, <oxffffaa@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: meson: fix bitmask for length in
 command word
Message-ID: <20230329110054.68455418@xps-13>
In-Reply-To: <c110bd0f-f25a-a74a-07cb-4c3fdb8ef306@sberdevices.ru>
References: <3794ffbf-dfea-e96f-1f97-fe235b005e19@sberdevices.ru>
	<447abc1b-b4a3-5848-c99a-ecbff11486fe@linaro.org>
	<c110bd0f-f25a-a74a-07cb-4c3fdb8ef306@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_020107_676617_5A1FB03A 
X-CRM114-Status: GOOD (  26.09  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDI5IE1h
ciAyMDIzIDExOjMzOjM4ICswMzAwOgoKPiBPbiAyOS4wMy4yMDIzIDExOjA5LCBUdWRvciBBbWJh
cnVzIHdyb3RlOgo+ID4gCj4gPiAKPiA+IE9uIDMvMjkvMjMgMDg6NDcsIEFyc2VuaXkgS3Jhc25v
diB3cm90ZTogIAo+ID4+IFZhbGlkIG1hc2sgaXMgMHgzRkZGLCB3aXRob3V0IHRoaXMgcGF0Y2gg
dGhlIGZvbGxvd2luZyBwcm9ibGVtcyB3ZXJlCj4gPj4gZm91bmQ6Cj4gPj4KPiA+PiAxKSBbICAg
IDAuOTM4OTE0XSBDb3VsZCBub3QgZmluZCBhIHZhbGlkIE9ORkkgcGFyYW1ldGVyIHBhZ2UsIHRy
eWluZwo+ID4+ICAgICAgICAgICAgICAgICAgIGJpdC13aXNlIG1ham9yaXR5IHRvIHJlY292ZXIg
aXQKPiA+PiAgICBbICAgIDAuOTQ3Mzg0XSBPTkZJIHBhcmFtZXRlciByZWNvdmVyeSBmYWlsZWQs
IGFib3J0aW5nCj4gPj4KPiA+PiAyKSBSZWFkIHdpdGggZGlzYWJsZWQgRUNDIG1vZGUgd2FzIGJy
b2tlbi4KPiA+Pgo+ID4+IEZpeGVzOiA4ZmFlODU2YzUzNTAgKCJtdGQ6IHJhd25hbmQ6IG1lc29u
OiBhZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBOQU5EIGZsYXNoIGNvbnRyb2xsZXIiKQo+ID4+IENj
OiA8U3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEty
YXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4KPiA+PiAtLS0KPiA+PiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgNiArKystLS0KPiA+PiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9t
ZXNvbl9uYW5kLmMKPiA+PiBpbmRleCBhMjg1NzRjMDA5MDAuLjA3NGUxNDIyNWMwNiAxMDA2NDQK
PiA+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+PiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+PiBAQCAtMjgwLDcgKzI4MCw3IEBA
IHN0YXRpYyB2b2lkIG1lc29uX25mY19jbWRfYWNjZXNzKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQs
IGludCByYXcsIGJvb2wgZGlyLAo+ID4+ICAKPiA+PiAgCWlmIChyYXcpIHsKPiA+PiAgCQlsZW4g
PSBtdGQtPndyaXRlc2l6ZSArIG10ZC0+b29ic2l6ZTsKPiA+PiAtCQljbWQgPSAobGVuICYgR0VO
TUFTSyg1LCAwKSkgfCBzY3JhbWJsZXIgfCBETUFfRElSKGRpcik7Cj4gPj4gKwkJY21kID0gKGxl
biAmIEdFTk1BU0soMTMsIDApKSB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsgIAo+ID4gCj4g
PiBXaGF0IGhhcHBlbnMgd2hlbiBsZW4gPiBHRU5NQVNLKDEzLCAwKT8gRG8geW91IGNoZWNrIHRo
aXMgc29tZXdoZXJlPyAgCj4gCj4gJ2xlbicgd2lsbCBiZSB0cmltbWVkLiBJJ20gbm90IHN1cmUg
dGhhdCB0aGlzIGNhc2UgaXMgcG9zc2libGUgaGVyZSwgYmVjYXVzZSBHRU5NQVNLKDEzLCAwKQo+
IGlzIGhhcmR3YXJlIGxpbWl0IGZvciB0aGlzIE5BTkQgY29udHJvbGxlciwgc28gJ3dyaXRlc2l6
ZScgYW5kICdvb2JzaXplJyB3aWxsIGJlIGluaXRpYWxpemVkCj4gdG8gZml0IHRoaXMgdmFsdWUu
IE1vcmVvdmVyIEdFTk1BU0soMTMsIDApIGlzIDE2S2IgLSBpIHRoaW5rIGl0IGlzIGJpZyBlbm91
Z2ggZm9yIHNpbmdsZQo+IHJlYWQuIEFsc28gaSdtIG5vdCBzdXJlIHRoYXQgaXQgaXMgZ29vZCBh
cHByb2FjaCB0byBjaGVjayAnbGVuJyBoZXJlIC0gd2UgYXJlIGluIHRoZSBtaWRkbGUKPiBvZiBO
QU5EIHJlYWQgcHJvY2Vzc2luZy4KCk5vLCB5b3Ugc2hvdWxkIGNoZWNrIHRoZSBwYWdlIHNpemUg
d2lsbCBub3QgZXhjZWVkIHRoaXMgbGltaXQgaW4gdGhlCmF0dGFjaCBob29rLCBsaWtlbHkuCgpZ
b3Ugc2hvdWxkIGFsc28gcmVmdXNlIGV4ZWNfb3Agb3BlcmF0aW9ucyB3aXRoIGEgZGF0YSBsZW5n
dGggYmlnZ2VyCnRoYW4gMTZrIChlaXRoZXIgd2l0aCBhIG1hbnVhbCBjaGVjayBpbiB5b3VyIG93
biBwYXJzZXIgb3IganVzdCBieQpwcm92aWRpbmcgdGhlIG1heCBzaXplIHRvIHRoZSBwYXJzZXIg
dGFibGUsIGRlcGVuZGluZyBvbiB3aGF0J3MgdXNlZCkuCgo+IAo+ID4gCj4gPiBQbGVhc2UgaW50
cm9kdWNlIGEgbWFjcm8vZmllbGQgZm9yIEdFTk1BU0soMTMsIDApLCBoYXZpbmcgc3VjaCBtYXNr
Cj4gPiBzY2F0dGVyZWQgYWxvbmcgdGhlIGNvZGUgbG9va3MgaGFja2lzaCBhbmQgZG9lc24ndCBo
ZWxwIHJlYWRhYmlsaXR5Lgo+ID4gWW91J2xsIGdldCB0byB1c2UgRklFTERfUFJFUCBhcyB3ZWxs
LiAgCj4gCj4gQWNrLCBpJ2xsIGRvIGl0IGluIHYzCj4gCj4gVGhhbmtzLCBBcnNlbml5Cj4gCj4g
PiAgIAo+ID4+ICAJCXdyaXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4g
Pj4gIAkJcmV0dXJuOwo+ID4+ICAJfQo+ID4+IEBAIC01NDQsNyArNTQ0LDcgQEAgc3RhdGljIGlu
dCBtZXNvbl9uZmNfcmVhZF9idWYoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1ZiwgaW50
IGxlbikKPiA+PiAgCWlmIChyZXQpCj4gPj4gIAkJZ290byBvdXQ7Cj4gPj4gIAo+ID4+IC0JY21k
ID0gTkZDX0NNRF9OMk0gfCAobGVuICYgR0VOTUFTSyg1LCAwKSk7Cj4gPj4gKwljbWQgPSBORkNf
Q01EX04yTSB8IChsZW4gJiBHRU5NQVNLKDEzLCAwKSk7Cj4gPj4gIAl3cml0ZWwoY21kLCBuZmMt
PnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+ID4+ICAKPiA+PiAgCW1lc29uX25mY19kcmFpbl9j
bWQobmZjKTsKPiA+PiBAQCAtNTY4LDcgKzU2OCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3dy
aXRlX2J1ZihzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLCBpbnQgbGVuKQo+ID4+ICAJ
aWYgKHJldCkKPiA+PiAgCQlyZXR1cm4gcmV0Owo+ID4+ICAKPiA+PiAtCWNtZCA9IE5GQ19DTURf
TTJOIHwgKGxlbiAmIEdFTk1BU0soNSwgMCkpOwo+ID4+ICsJY21kID0gTkZDX0NNRF9NMk4gfCAo
bGVuICYgR0VOTUFTSygxMywgMCkpOwo+ID4+ICAJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSAr
IE5GQ19SRUdfQ01EKTsKPiA+PiAgCj4gPj4gIAltZXNvbl9uZmNfZHJhaW5fY21kKG5mYyk7ICAK
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
