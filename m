Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1565BC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxFvso7A1DD2NvEkNdj7oi6dHlAEf0/JbLl/MQ472Ro=; b=iodhmmOCC+NGLs
	LhBiTzOW4QUdKWYe+XkqUzHNbiKzo+1oFyTeHZ88ZeHlpt/LdQCclrtgBmlTNt0DzVXXIx6THT5p5
	n3dO2UTUxSrrzd4TQeCD3sGCO+ylNxrkTv/Y6T+Q9PWoLemIPcr8JUDi1LFvshYFSoyxS7CmTTaeC
	aUQ8mhn2nT3OzaI7jlvHGrGhx1ib/gq4xkgBsuhnyFjOpIy/Fgn9UzJ4YM8F5K/fX66WTL0ah7r9r
	wky+ts1KfIuIaL2rhiwreb/wtQLsoK0iJT7uyo60v/c1N2cls2NxBUrZ+7MLjvgp95XYcjhdGYkd/
	F1RY+bORAXWJPT4ueN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n02Ru-00AeQq-Gx; Wed, 22 Dec 2021 14:18:34 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n02Rr-00AePk-38
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 14:18:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 77CBEE000D;
 Wed, 22 Dec 2021 14:18:24 +0000 (UTC)
Date: Wed, 22 Dec 2021 15:18:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: krzysztof.kozlowski@canonical.com, tony@atomide.com, robh@kernel.org,
 kishon@ti.com, nm@ti.com, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/4] memory: omap-gpmc: Use a compatible match table
 when checking for NAND controller
Message-ID: <20211222151823.77179b74@xps13>
In-Reply-To: <51b8e895-95e1-0024-1457-ec534985c9f0@kernel.org>
References: <20211221131757.2030-1-rogerq@kernel.org>
 <20211221131757.2030-4-rogerq@kernel.org>
 <51b8e895-95e1-0024-1457-ec534985c9f0@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_061831_452829_42AA9B77 
X-CRM114-Status: GOOD (  22.70  )
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

SGkgUm9nZXIsCgpyb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBUdWUsIDIxIERlYyAyMDIxIDIy
OjAxOjI4ICswMjAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gMjEvMTIvMjAyMSAxNToxNywgUm9n
ZXIgUXVhZHJvcyB3cm90ZToKPiA+IEFzIG1vcmUgY29tcGF0aWJsZXMgY2FuIGJlIGFkZGVkIHRv
IHRoZSBHUE1DIE5BTkQgY29udHJvbGxlciBkcml2ZXIKPiA+IHVzZSBhIGNvbXBhdGlibGUgbWF0
Y2ggdGFibGUuCj4gPiAKPiA+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUXVhZHJvcyA8cm9nZXJxQGtlcm5lbC5v
cmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYyAgICAgICAgICAgICAg
ICAgICB8IDYgKysrKystCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYyAgICAgICAg
ICAgICAgICAgfCA1ICstLS0tICAKPiAKPiBXaWxsIG5lZWQgeW91ciBBY2sgZm9yIHRoaXMgb25l
IGFzIHdlbGwuIFRoYW5rcyA6KQo+IAo+IAo+ID4gIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0
YS9tdGQtbmFuZC1vbWFwMi5oIHwgOSArKysrKysrKy0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pICAKPiAKPiBjaGVlcnMsCj4gLXJvZ2VyCj4g
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYyBiL2RyaXZl
cnMvbWVtb3J5L29tYXAtZ3BtYy5jCj4gPiBpbmRleCA2MjQxNTMwNDgxODIuLmQxOWZmYzg5NWU1
YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jCj4gPiArKysgYi9k
cml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYwo+ID4gQEAgLTIwOTEsNiArMjA5MSw3IEBAIHN0YXRp
YyBpbnQgZ3BtY19wcm9iZV9nZW5lcmljX2NoaWxkKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYsCj4gPiAgCXUzMiB2YWw7Cj4gPiAgCXN0cnVjdCBncGlvX2Rlc2MgKndhaXRwaW5fZGVzYyA9
IE5VTEw7Cj4gPiAgCXN0cnVjdCBncG1jX2RldmljZSAqZ3BtYyA9IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOwo+ID4gKwlib29sIGlzX25hbmQgPSBmYWxzZTsKPiA+ICAKPiA+ICAJaWYgKG9m
X3Byb3BlcnR5X3JlYWRfdTMyKGNoaWxkLCAicmVnIiwgJmNzKSA8IDApIHsKPiA+ICAJCWRldl9l
cnIoJnBkZXYtPmRldiwgIiVwT0YgaGFzIG5vICdyZWcnIHByb3BlcnR5XG4iLAo+ID4gQEAgLTIx
ODMsNyArMjE4NCwxMCBAQCBzdGF0aWMgaW50IGdwbWNfcHJvYmVfZ2VuZXJpY19jaGlsZChzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ID4gIAkJfQo+ID4gIAl9Cj4gPiAgCj4gPiAtCWlm
IChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShjaGlsZCwgInRpLG9tYXAyLW5hbmQiKSkgewo+ID4g
KwlpZiAob2ZfbWF0Y2hfbm9kZShvbWFwX25hbmRfaWRzLCBjaGlsZCkpCj4gPiArCQlpc19uYW5k
ID0gdHJ1ZTsKPiA+ICsKPiA+ICsJaWYgKGlzX25hbmQpIHsKCm5pdHBpY2s6IHdoeSB0aGlzIGlu
dGVybWVkaWF0ZSB2YXJpYWJsZT8KCk90aGVyd2lzZSBmb3IgdGhlIE5BTkQgYml0czoKCkFja2Vk
LWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKPiA+ICAJCS8q
IE5BTkQgc3BlY2lmaWMgc2V0dXAgKi8KPiA+ICAJCXZhbCA9IDg7Cj4gPiAgCQlvZl9wcm9wZXJ0
eV9yZWFkX3UzMihjaGlsZCwgIm5hbmQtYnVzLXdpZHRoIiwgJnZhbCk7Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L29t
YXAyLmMKPiA+IGluZGV4IGIyNmQ0OTQ3YWYwMi4uZTZkZDhiNGNmMGQyIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvb21hcDIuYwo+ID4gQEAgLTIzNTIsMTAgKzIzNTIsNyBAQCBzdGF0aWMgaW50IG9tYXBf
bmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAJcmV0dXJuIHJl
dDsKPiA+ICB9Cj4gPiAgCj4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb21h
cF9uYW5kX2lkc1tdID0gewo+ID4gLQl7IC5jb21wYXRpYmxlID0gInRpLG9tYXAyLW5hbmQiLCB9
LAo+ID4gLQl7fSwKPiA+IC19Owo+ID4gKy8qIG9tYXBfbmFuZF9pZHMgZGVmaW5lZCBpbiBsaW51
eC9wbGF0Zm9ybV9kYXRhL210ZC1uYW5kLW9tYXAyLmggKi8KPiA+ICBNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBvbWFwX25hbmRfaWRzKTsKPiA+ICAKPiA+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBvbWFwX25hbmRfZHJpdmVyID0gewo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvcGxhdGZvcm1fZGF0YS9tdGQtbmFuZC1vbWFwMi5oIGIvaW5jbHVkZS9saW51eC9wbGF0Zm9y
bV9kYXRhL210ZC1uYW5kLW9tYXAyLmgKPiA+IGluZGV4IGRlNmFkYTczOTEyMS4uOTJmMDExODA1
YWQ0IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL210ZC1uYW5k
LW9tYXAyLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9tdGQtbmFuZC1v
bWFwMi5oCj4gPiBAQCAtNyw2ICs3LDcgQEAKPiA+ICAjZGVmaW5lCV9NVERfTkFORF9PTUFQMl9I
Cj4gPiAgCj4gPiAgI2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+Cj4gPiArI2luY2x1
ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgo+ID4gIAo+ID4gICNkZWZpbmUJR1BNQ19CQ0hf
TlVNX1JFTUFJTkRFUgk4Cj4gPiAgCj4gPiBAQCAtNjEsNCArNjIsMTAgQEAgc3RydWN0IGdwbWNf
bmFuZF9yZWdzIHsKPiA+ICAJdm9pZCBfX2lvbWVtCSpncG1jX2JjaF9yZXN1bHQ1W0dQTUNfQkNI
X05VTV9SRU1BSU5ERVJdOwo+ID4gIAl2b2lkIF9faW9tZW0JKmdwbWNfYmNoX3Jlc3VsdDZbR1BN
Q19CQ0hfTlVNX1JFTUFJTkRFUl07Cj4gPiAgfTsKPiA+IC0jZW5kaWYKPiA+ICsKPiA+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvbWFwX25hbmRfaWRzW10gPSB7Cj4gPiArCXsg
LmNvbXBhdGlibGUgPSAidGksb21hcDItbmFuZCIsIH0sCj4gPiArCXt9LAo+ID4gK307Cj4gPiAr
Cj4gPiArI2VuZGlmIC8qIF9NVERfTkFORF9PTUFQMl9IICovCj4gPiAgIAoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
