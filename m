Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8350DC77B73
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 09:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VVOt5OEj8YPgLOgDBzSualsKseVvhPxu9/EFRlpZZw=; b=Xy3QrajWw0ztAL
	ZP6UUCmvq8oR+RrP0IU9MZqUF8W1lBpvOpQ58Kajo9ZanrXR6SQlKL1c3wL98fAnY570S0LIQf+z8
	HbynqUcW9D4Xrfv3EaOvTIL0RTWwnkkF2Wml1zzzCoje/dIp0SSexl7deosgY0trZxKsAaSZDX7uX
	d0vi/rKRfVByXSxjDFnlf7Ozk/UQyW4n0ZksEcqyWAvqb9Q0G0dkb0MpYpvN2OP6Z2ZToZmRdGBUD
	2iIyTI1CduFyL5YaJ15cek5DxVghZ2fh29yb2tPC6fsoQj+8HRngpxVV+1hd5xDqq24w+Xp5avkDH
	BWttAfK3pzAsEImlcAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q66A4-00En5n-2s;
	Mon, 05 Jun 2023 09:06:00 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q66A0-00En2v-2B;
	Mon, 05 Jun 2023 09:05:58 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685955950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1HS5GQheslp9a6/umV1cLiyP8gp9jVsiTEQEBu6cgc=;
	b=fzJ+JgiAN6PVqSgGMobsDNfS4fqwP6UO6mdylIiOlPlxCrDepQdRc4otQfAKJxF8tWSjPv
	dozYQn66toUoD5o9la508y3qkKmb/POcp3sxZd6+4E5vFuVUD2hLKQPy0IBea0oY5xQ9WH
	wsDNycWqbVDsOMOhu50pmb4oHk3HZZMXHcnqh/Y94Rt1NzobU+S/4YR+6Ven7VUUtMOMT2
	zxnq9ReE/PBaXeCMbInpcU1m7wp0uIQ7076OaEPDQ5YMPiiUtnfQv+Dfzw+PCoZHEQ429B
	1QOADvxgg43c2h5f6f5KfpTZJMZEL+R0Y7dTbUYhnoZpjXjhE0flcDCUUXfQzA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0CF1240004;
	Mon,  5 Jun 2023 09:05:47 +0000 (UTC)
Date: Mon, 5 Jun 2023 11:05:46 +0200
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
Subject: Re: [RFC PATCH v5 2/6] mtd: rawnand: meson: wait for command in
 polling mode
Message-ID: <20230605110546.6cb00a8d@xps-13>
In-Reply-To: <9e106d50-2524-c999-48b1-a20760238aaf@sberdevices.ru>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
	<20230601061850.3907800-3-AVKrasnov@sberdevices.ru>
	<20230601100751.41c3ff0b@xps-13>
	<9e106d50-2524-c999-48b1-a20760238aaf@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_020557_118515_7E5E9CDC 
X-CRM114-Status: GOOD (  27.80  )
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

SGkgQXJzZW5peSwKCj4gPj4gQEAgLTE0MTIsNiArMTQxOSw4IEBAIHN0YXRpYyBpbnQgbWVzb25f
bmZjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4gIAkJcmV0dXJuIHJl
dDsKPiA+PiAgCX0KPiA+PiAgCj4gPj4gKwluZmMtPnVzZV9wb2xsaW5nID0gb2ZfcHJvcGVydHlf
cmVhZF9ib29sKGRldi0+b2Zfbm9kZSwgInBvbGxpbmciKTsgIAo+ID4gCj4gPiBUaGlzIGlzIGEg
cHJvYmxlbS4gWW91IGNhbm5vdCBhZGQgYSBwb2xsaW5nIHByb3BlcnR5IGxpa2UgdGhhdC4KPiA+
IAo+ID4gVGhlcmUgaXMgYWxyZWFkeSBhIG5hbmQtcmIgcHJvcGVydHkgd2hpY2ggaXMgc3VwcG9z
ZWQgdG8gY2FycnkgaG93IGFyZQo+ID4gd2lyZWQgdGhlIFJCIGxpbmVzLiBJIGRvbid0IHNlZSBh
bnkgaW4tdHJlZSB1c2VycyBvZiB0aGUgY29tcGF0aWJsZXMsIEkKPiA+IGRvbid0IGtub3cgaG93
IGFjY2VwdGFibGUgaXQgaXMgdG8gY29uc2lkZXIgdXNpbmcgc29mdCBmYWxsYmFjayB3aGVuCj4g
PiB0aGlzIHByb3BlcnR5IGlzIG1pc3NpbmcsIG90aGVyd2lzZSB0YWtlIHRoZSB2YWx1ZXMgb2Yg
dGhlIHJiIGxpbmVzCj4gPiBwcm92aWRlZCBpbiB0aGUgRFQgYW5kIHVzZXIgaGFyZHdhcmUgY29u
dHJvbCwgYnV0IEkgd291bGQgZGVmaW5pdGVseQo+ID4gcHJlZmVyIHRoYXQuICAKPiAKPiBJIHNl
ZS4gU28gaSBuZWVkIHRvIGltcGxlbWVudCBwcm9jZXNzaW5nIG9mIHRoaXMgcHJvcGVydHkgaGVy
ZT8gQW5kIGlmIGl0Cj4gaXMgbWlzc2VkIC0+IHVzZSBzb2Z0d2FyZSB3YWl0aW5nLiBJIHRoaW5r
IGludGVyZXN0aW5nIHRoaW5nIHdpbGwgYmUgdGhhdDoKPiAKPiAxKSBFdmVuIHdpdGggc3VwcG9y
dCBvZiB0aGlzIHByb3BlcnR5IGhlcmUsIEkgcmVhbGx5IGRvbid0IGtub3cgaG93IHRvIHBhc3MK
PiAgICBSQiB2YWx1ZXMgdG8gdGhpcyBjb250cm9sbGVyIC0gSSBqdXN0IGhhdmUgZGVmaW5lIGZv
ciBSQiBjb21tYW5kIGFuZCB0aGF0J3MKPiAgICBpdC4gSSBmb3VuZCB0aGF0IHRoaXMgcHJvcGVy
dHkgaXMgYW4gYXJyYXkgb2YgdTMyIC0gSUlVQyBlYWNoIGVsZW1lbnQgaXMKPiAgICBSQiBwaW4g
cGVyIGNoaXAuIE1heSBiZSBpIG5lZWQgdG8gZGl2ZSBpbnRvIHRoZSBvbGQgdmVuZG9yJ3MgZHJp
dmVyIHRvIGZpbmQKPiAgICBob3cgdG8gdXNlIFJCIHZhbHVlcyAoYWx0aG91Z2ggdGhpcyBkcml2
ZXIgdXNlcyBzb2Z0d2FyZSB3YWl0aW5nIHNvIEknbSBub3QKPiAgICBzdXJlIHRoYXQgSSdsbCBm
aW5kIHNvbWV0aGluZyBpbiBpdCkuCgpMaWFuZywgY2FuIHlvdSBwbGVhc2UgZ2l2ZSB1c2UgdGhl
IHJlbGV2YW50IGluZm9ybWF0aW9uIGhlcmU/IEhvdyBkbyB3ZQp0YXJnZXQgUkIwIGFuZCBSQjE/
IEl0IHNlZW1zIGxpa2UgeW91IHVzZSB0aGUgQ1MgYXMgb25seSBpbmZvcm1hdGlvbgpsaWtlIGlm
IHRoZSBSQiBsaW5lcyB3aGVyZSBoYXJkd2lyZWQgaW50ZXJuYWxseSB0byBhIENTLiBDYW4gd2Ug
aW52ZXJ0CnRoZSBsaW5lcyB3aXRoIGEgc3BlY2lmaWMgY29uZmlndXJhdGlvbj8KCkFyc2VuaXks
IGlmIHRoZSBhbnN3ZXIgdG8gbXkgYWJvdmUgcXVlc3Rpb24gaXMgbm8sIHRoZW4geW91IHNob3Vs
ZApleHBlY3QgdGhlIG5hbmQtcmIgYW5kIHJlZyBhcnJheXMgdG8gYmUgaWRlbnRpY2FsLiBJZiB0
aGV5IGFyZSBub3QsCnRoZW4geW91IGNhbiByZXR1cm4gLUVJTlZBTC4KCklmIHRoZSBuYW5kLXJi
IHByb3BlcnR5IGlzIG1pc3NpbmcsIHRoZW4gZmFsbGJhY2sgdG8gc29mdHdhcmUgd2FpdC4KCj4g
MikgSSBjYW4ndCB0ZXN0IFJCIG1vZGUgLSBJIGRvbid0IGhhdmUgc3VjaCBkZXZpY2UgOiggCj4g
Cj4gQWxzbyBmb3IgZXhhbXBsZSBpbiBhcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgcGFyc2VkICdu
YW5kLXJiJyB2YWx1ZXMgYXJlIHVzZWQKPiBpbiBjb250cm9sbGVyIHNwZWNpZmljIHJlZ2lzdGVy
IGZvciB3YWl0aW5nIChJIGd1ZXNzIE1lc29uIGNvbnRyb2xsZXIgaGFzIHNvbWV0aGluZwo+IGxp
a2UgdGhhdCwgYnV0IEkgZG9uJ3QgaGF2ZSBkb2MpLiBXaGlsZSBpbiBtYXJ2ZWxsX25hbmQuYyBp
dCBsb29rcyBsaWtlIHRoYXQgdGhleSBwYXJzZQo+ICduYW5kLXJiJyBwcm9wZXJ0eSwgYnV0IG5l
dmVyIHVzZSBpdC4KClllcywgdGhlIGxvZ2ljIGFyb3VuZCB0aGUgc2Vjb25kIFJCIGxpbmUgKHRh
a2luZyBjYXJlIG9mIENTMS9DUzMpIGlzCnNsaWdodGx5IGJyb2tlbiBvciBhdCBsZWFzdCBiYWRs
eSBkb2N1bWVudGVkLCBhbmQgdGh1cyBzaG91bGQgbm90IGJlCnVzZWQuCgo+ID4gSW4gYW55IGNh
c2UgeW91J2xsIG5lZWQgYSBkdC1iaW5kaW5nIHVwZGF0ZSB3aGljaCBtdXN0IGJlIGFja2VkIGJ5
Cj4gPiBkdC1iaW5kaW5nIG1haW50YWluZXJzLiAgCj4gCj4gWW91IG1lYW4gdG8gYWRkIHRoaXMg
cHJvcGVydHkgZGVzYyB0byBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2Ft
bG9naWMsbWVzb24tbmFuZC55YW1sID8KClllcy4gSW4gYSBkZWRpY2F0ZWQgcGF0Y2guIFNvbWV0
aGluZyBhbG9uZyB0aGUgbGluZXM6CgoJbmFuZC1yYjogdHJ1ZQoKaW5zaWRlIHRoZSBuYW5kIGNo
aXAgb2JqZWN0IHNob3VsZCBiZSBmaW5lLiBBbmQgZmxhZyB0aGUgY2hhbmdlIGFzIGEKZml4IGJl
Y2F1c2Ugd2Ugc2hvdWxkIGhhdmUgdXNlZCBhbmQgcGFyc2VkIHRoaXMgcHJvcGVydHkgc2luY2Ug
dGhlCmJlZ2lubmluZy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
