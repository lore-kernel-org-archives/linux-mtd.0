Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F011EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 13:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1eby+IAIp+BSCYajBnFN746OhgdME/IXKA7um41CXQ=; b=AWIKJV5e7OqnOl
	52eZYA+5CRn8kUJ34M9HoPqLMEXHK648pcr6HpiLA7tbLilr1kQBIlBvSYHLuJz132HsE5zttt51n
	CaDl5d/VW1z2zNQqtez6JlKjbhvC0UJpM21LAwnMea5eusF+nCA3HV+4CZlJ8AqrtC5gpTCPRsp5m
	y0M4M5EWZbBfnjKCFdESru64/zXM99F2sYYRhvBZDeGza5sQfaqRfBY4GGHQx2LSPNGtfwZfOOGbE
	M+9VmYfA9G8ObbA8GzR0SkgCYdFygRLxxU3hE9I0HcnHjv0T8u//IuLYe9xcskRhkSbPFknBTQzUI
	ThbxWPtG8cpARbUopavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfpc-00DLQA-2S;
	Tue, 04 Jul 2023 13:12:36 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfpY-00DLM4-0B;
	Tue, 04 Jul 2023 13:12:34 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688476344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QmTIXCsuR7evFqUrEQ6bGLpruDNSV/dMDoZ6HLOKO8Y=;
	b=VEpyGf7CsLNXsDsC7lUO/envsUyZw8h/QxCkWw26qtw8Wpg2ySkN4FdU90teNV6LaC8r22
	gRMFwOhZmKn0E3DhOhozrG2IILDmXvxn3391Wi3Z39ETHK43r/h9vmy7gmN8tdnkR7NrdZ
	8JAgJ2lx1oN4PAg6+vuNLcTklEKxQ7E6eVrvh3jAF5Cy45QF9qALH4NkggPtu85GCQt4u0
	kKyhJXe53SoabNH5Rv5muAzfPUZFvy4VE3j8DobujOWwpYUwT2zcZ1MlO1QDcPlQuPaxD+
	r0ZO7nYi4X5ijXfdTRim2Ru0VrZoJRGpdE0KgINYgvh+WV7ZjeWWNbyaf62Dqg==
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
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18DD9FF807;
	Tue,  4 Jul 2023 13:12:21 +0000 (UTC)
Date: Tue, 4 Jul 2023 15:12:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: meson: waiting w/o wired
 ready/busy pin
Message-ID: <20230704151220.67857861@xps-13>
In-Reply-To: <47994f36-27d4-e5e4-73a9-6d4225671eec@sberdevices.ru>
References: <20230608044728.1328506-1-AVKrasnov@sberdevices.ru>
	<20230608044728.1328506-3-AVKrasnov@sberdevices.ru>
	<20230704144357.286281dc@xps-13>
	<47994f36-27d4-e5e4-73a9-6d4225671eec@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_061232_386698_60C7F126 
X-CRM114-Status: GOOD (  24.85  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDQgSnVs
IDIwMjMgMTU6NDY6MTggKzAzMDA6Cgo+IE9uIDA0LjA3LjIwMjMgMTU6NDMsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4gPiBBVktyYXNub3ZAc2JlcmRldmljZXMu
cnUgd3JvdGUgb24gVGh1LCA4IEp1biAyMDIzIDA3OjQ3OjI4ICswMzAwOgo+ID4gICAKPiA+PiBJ
ZiB0aGVyZSBpcyBubyB3aXJlZCByZWFkeS9idXN5IHBpbiwgY2xhc3NpYyB3YXkgdG8gd2FpdCBm
b3IgY29tbWFuZAo+ID4+IGNvbXBsZXRpb24gaXMgdG8gdXNlIGZ1bmN0aW9uICduYW5kX3NvZnRf
d2FpdHJkeSgpJy4gTWVzb24gTkFORCBoYXMKPiA+PiBzcGVjaWFsIGNvbW1hbmQgd2hpY2ggYWxs
b3dzIHRvIHdhaXQgZm9yIE5BTkRfU1RBVFVTX1JFQURZIGJpdCB3aXRob3V0Cj4gPj4gcmVhZGlu
ZyBzdGF0dXMgaW4gYSBzb2Z0d2FyZSBsb29wIChhcyAnbmFuZF9zb2Z0X3dhaXRyZHkoKScgZG9l
cykuIFRvCj4gPj4gdXNlIGl0IHNlbmQgdGhpcyBjb21tYW5kIGFsb25nIHdpdGggTkFORF9DTURf
U1RBVFVTLCB0aGVuIHdhaXQgZm9yIGFuCj4gPj4gaW50ZXJydXB0LCBhbmQgYWZ0ZXIgaW50ZXJy
dXB0IHNlbmQgTkFORF9DTURfUkVBRDAuIFNvIHRoaXMgZmVhdHVyZQo+ID4+IGFsbG93cyB0byB1
c2UgaW50ZXJydXB0IGRyaXZlbiB3YWl0aW5nIHdpdGhvdXQgd2lyZWQgcmVhZHkvYnVzeSBwaW4u
Cj4gPj4KPiA+PiBTdWdnZXN0ZWQtYnk6IExpYW5nIFlhbmcgPGxpYW5nLnlhbmdAYW1sb2dpYy5j
b20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2JlcmRl
dmljZXMucnU+Cj4gPj4gLS0tCj4gPj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
YyB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiA+PiAgMSBmaWxlIGNoYW5n
ZWQsIDczIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jCj4gPj4gaW5kZXggMDc0ZTE0MjI1YzA2Li45ZjA1ZTExM2I0ZWEgMTAw
NjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPj4gKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPj4gQEAgLTM4LDYgKzM4LDcg
QEAKPiA+PiAgI2RlZmluZSBORkNfQ01EX1NDUkFNQkxFUl9ESVNBQkxFCTAKPiA+PiAgI2RlZmlu
ZSBORkNfQ01EX1NIT1JUTU9ERV9ESVNBQkxFCTAKPiA+PiAgI2RlZmluZSBORkNfQ01EX1JCX0lO
VAkJQklUKDE0KQo+ID4+ICsjZGVmaW5lIE5GQ19DTURfUkJfSU5UX05PX1BJTgkoKDB4YiA8PCAx
MCkgfCBCSVQoMTgpIHwgQklUKDE2KSkKPiA+PiAgCj4gPj4gICNkZWZpbmUgTkZDX0NNRF9HRVRf
U0laRSh4KQkoKCh4KSA+PiAyMikgJiBHRU5NQVNLKDQsIDApKQo+ID4+ICAKPiA+PiBAQCAtMTc5
LDYgKzE4MCw3IEBAIHN0cnVjdCBtZXNvbl9uZmMgewo+ID4+ICAJdTMyIGluZm9fYnl0ZXM7Cj4g
Pj4gIAo+ID4+ICAJdW5zaWduZWQgbG9uZyBhc3NpZ25lZF9jczsKPiA+PiArCWJvb2wgbm9fcmJf
cGluOwo+ID4+ICB9Owo+ID4+ICAKPiA+PiAgZW51bSB7Cj4gPj4gQEAgLTM5Miw3ICszOTQsNDIg
QEAgc3RhdGljIHZvaWQgbWVzb25fbmZjX3NldF9kYXRhX29vYihzdHJ1Y3QgbmFuZF9jaGlwICpu
YW5kLAo+ID4+ICAJfQo+ID4+ICB9Cj4gPj4gIAo+ID4+IC1zdGF0aWMgaW50IG1lc29uX25mY19x
dWV1ZV9yYihzdHJ1Y3QgbWVzb25fbmZjICpuZmMsIGludCB0aW1lb3V0X21zKQo+ID4+ICtzdGF0
aWMgaW50IG1lc29uX25mY193YWl0X25vX3JiX3BpbihzdHJ1Y3QgbWVzb25fbmZjICpuZmMsIGlu
dCB0aW1lb3V0X21zLAo+ID4+ICsJCQkJICAgIGJvb2wgbmVlZF9jbWRfcmVhZDApCj4gPj4gK3sK
PiA+PiArCXUzMiBjbWQsIGNmZzsKPiA+PiArCj4gPj4gKwltZXNvbl9uZmNfY21kX2lkbGUobmZj
LCBuZmMtPnRpbWluZy50d2IpOwo+ID4+ICsJbWVzb25fbmZjX2RyYWluX2NtZChuZmMpOwo+ID4+
ICsJbWVzb25fbmZjX3dhaXRfY21kX2ZpbmlzaChuZmMsIENNRF9GSUZPX0VNUFRZX1RJTUVPVVQp
Owo+ID4+ICsKPiA+PiArCWNmZyA9IHJlYWRsKG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NGRyk7
Cj4gPj4gKwljZmcgfD0gTkZDX1JCX0lSUV9FTjsKPiA+PiArCXdyaXRlbChjZmcsIG5mYy0+cmVn
X2Jhc2UgKyBORkNfUkVHX0NGRyk7Cj4gPj4gKwo+ID4+ICsJcmVpbml0X2NvbXBsZXRpb24oJm5m
Yy0+Y29tcGxldGlvbik7Cj4gPj4gKwljbWQgPSBuZmMtPnBhcmFtLmNoaXBfc2VsZWN0IHwgTkZD
X0NNRF9DTEUgfCBOQU5EX0NNRF9TVEFUVVM7Cj4gPj4gKwl3cml0ZWwoY21kLCBuZmMtPnJlZ19i
YXNlICsgTkZDX1JFR19DTUQpOwo+ID4+ICsKPiA+PiArCS8qIHVzZSB0aGUgbWF4IGVyYXNlIHRp
bWUgYXMgdGhlIG1heGltdW0gY2xvY2sgZm9yIHdhaXRpbmcgUi9CICovCj4gPj4gKwljbWQgPSBO
RkNfQ01EX1JCIHwgTkZDX0NNRF9SQl9JTlRfTk9fUElOIHwgbmZjLT50aW1pbmcudGJlcnNfbWF4
Owo+ID4+ICsJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPiA+PiAr
Cj4gPj4gKwlpZiAoIXdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmbmZjLT5jb21wbGV0aW9u
LAo+ID4+ICsJCQkJCSBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXRfbXMpKSkKPiA+PiArCQlyZXR1
cm4gLUVUSU1FRE9VVDsKPiA+PiArCj4gPj4gKwlpZiAobmVlZF9jbWRfcmVhZDApIHsKPiA+PiAr
CQljbWQgPSBuZmMtPnBhcmFtLmNoaXBfc2VsZWN0IHwgTkZDX0NNRF9DTEUgfCBOQU5EX0NNRF9S
RUFEMDsKPiA+PiArCQl3cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+
ID4+ICsJCW1lc29uX25mY19kcmFpbl9jbWQobmZjKTsKPiA+PiArCQltZXNvbl9uZmNfd2FpdF9j
bWRfZmluaXNoKG5mYywgQ01EX0ZJRk9fRU1QVFlfVElNRU9VVCk7Cj4gPj4gKwl9ICAKPiA+IAo+
ID4gSSBmb3Jnb3QgYWJvdXQgdGhpcywgeW91IHNob3VsZCBhdm9pZCBvcGVuIGNvZGluZyBjb3Jl
IGhlbHBlcnMsIGNhbiB5b3UKPiA+IHBsZWFzZSBzZW5kIGEgZm9sbG93dXAgcGF0Y2ggdG8gdXNl
IG5hbmRfc3RhdHVzX29wKCkgYW5kCj4gPiBuYW5kX2V4aXRfc3RhdHVzX29wKCkgPyAgCj4gCj4g
QSBvaywgc286Cj4gMSkgU2VuZGluZyBOQU5EX0NNRF9TVEFUVVMgZ29lcyB0byBuYW5kX3N0YXR1
c19vcCgpCj4gMikgU2VuZGluZyBOQU5EX0NNRF9SRUFEMCBnb2VzIHRvIG5hbmRfZXhpdF9zdGF0
dXNfb3AoKQo+IAo+IE9rLCBubyBwcm9ibGVtISBJJ2xsIHByZXBhcmUgYW5kIHNlbmQgaXQgb24g
dGhpcyB3ZWVrIQoKRXhhY3RseS4gU29ycnkgSSBoYWQgdGhpcyBpbiBtaW5kIGJ1dCBJIGxpa2Vs
eSBmb3Jnb3QgdG8gd3JpdGUgaXQKZG93bi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
