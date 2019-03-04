Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB76CC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 10:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 896B2206B8
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 10:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GzHuXE1j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 896B2206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gCiEPi7tRMqVsPoIKEy7bzkRON56rJ/sMUjfm5V3S0=; b=GzHuXE1jRfQAu0
	k7TbUkBQu/DxIrEFNuHpY90OOv2K5K0hShH5OkKsmRFaMH/gzuX44qdVB2Gt0VCrJleOfZL49X+ZM
	LdzpR1Lr3YuhXJqAU28vLLGm2tWe6uRmRfx6cZmaqhYmmlCcavo8f57u8mlICe3cHrWykpg0ram4B
	9FmvcR9KPi5Mkrq3yf24lwGYa+Wz2hPRpruuBExApyrOgLqtlwxYvW5IPuWAETKuzDRiEIJN1JW38
	ZeOSBWZGJAszOe1eXM/McSx/0S5RPLD6CoP8PaelZpubsGl3k1mU3p4Dv+5VFPUiOHkDWXqsjwrl2
	AXppFE4kRnbvXjwUHCgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0lJN-00073b-VO; Mon, 04 Mar 2019 10:59:09 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0lJK-0006zx-Ja
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 10:59:08 +0000
X-Originating-IP: 90.88.147.150
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D2353FF80F;
 Mon,  4 Mar 2019 10:58:54 +0000 (UTC)
Date: Mon, 4 Mar 2019 11:58:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v4 2/7] mtd: onenand: Store bad block marker position in
 chip struct
Message-ID: <20190304115853.35216632@xps13>
In-Reply-To: <20190218104122.18788-3-frieder.schrempf@kontron.de>
References: <20190218104122.18788-1-frieder.schrempf@kontron.de>
 <20190218104122.18788-3-frieder.schrempf@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_025906_944115_8D778E42 
X-CRM114-Status: GOOD (  18.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRnJpZWRlciwKClNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5k
ZT4gd3JvdGUgb24gTW9uLCAxOCBGZWIKMjAxOSAxMDo0Mjo0MSArMDAwMDoKCj4gRnJvbTogRnJp
ZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPgo+IAo+IFRoZSBpbmZv
cm1hdGlvbiBhYm91dCB3aGVyZSB0aGUgbWFudWZhY3R1cmVyIHB1dHMgdGhlIGJhZCBibG9jawo+
IG1hcmtlcnMgaW5zaWRlIHRoZSBiYWQgYmxvY2sgYW5kIGluIHRoZSBPT0IgZGF0YSBpcyBzdG9y
ZWQgaW4KPiBkaWZmZXJlbnQgcGxhY2VzLiBMZXQncyBtb3ZlIHRoaXMgaW5mb3JtYXRpb24gdG8g
dGhlIGNoaXAgc3RydWN0LAo+IGFzIHdlIGRpZCBpdCBmb3IgcmF3bmFuZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+Cj4g
LS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyB8IDUgKysrKy0K
PiAgZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmJ0LmMgIHwgMyAtLS0KPiAgaW5j
bHVkZS9saW51eC9tdGQvb25lbmFuZC5oICAgICAgICAgICAgIHwgMyArKysKPiAgMyBmaWxlcyBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25h
bmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwo+IGluZGV4IDRjYTRiMTk0ZTdkNy4uZjQxZDc2MjQ4
NTUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2Uu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwo+IEBAIC0y
NDU4LDcgKzI0NTgsNyBAQCBzdGF0aWMgaW50IG9uZW5hbmRfZGVmYXVsdF9ibG9ja19tYXJrYmFk
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2ZzKQo+ICAgICAgICAgICAgICAgICAgYmJt
LT5iYnRbYmxvY2sgPj4gMl0gfD0gMHgwMSA8PCAoKGJsb2NrICYgMHgwMykgPDwgMSk7Cj4gIAo+
ICAgICAgICAgIC8qIFdlIHdyaXRlIHR3byBieXRlcywgc28gd2UgZG9uJ3QgaGF2ZSB0byBtZXNz
IHdpdGggMTYtYml0IGFjY2VzcyAqLwo+IC0gICAgICAgIG9mcyArPSBtdGQtPm9vYnNpemUgKyAo
YmJtLT5iYWRibG9ja3BvcyAmIH4weDAxKTsKPiArICAgICAgICBvZnMgKz0gbXRkLT5vb2JzaXpl
ICsgKHRoaXMtPmJhZGJsb2NrcG9zICYgfjB4MDEpOwo+ICAJLyogRklYTUUgOiBXaGF0IHRvIGRv
IHdoZW4gbWFya2luZyBTTEMgYmxvY2sgaW4gcGFydGl0aW9uCj4gIAkgKiAJICAgd2l0aCBNTEMg
ZXJhc2VzaXplPyBGb3Igbm93LCBpdCBpcyBub3QgYWR2aXNhYmxlIHRvCj4gIAkgKgkgICBjcmVh
dGUgcGFydGl0aW9ucyBjb250YWluaW5nIGJvdGggU0xDIGFuZCBNTEMgcmVnaW9ucy4KPiBAQCAt
Mzk2Nyw2ICszOTY3LDkgQEAgaW50IG9uZW5hbmRfc2NhbihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwg
aW50IG1heGNoaXBzKQo+ICAJaWYgKCEodGhpcy0+b3B0aW9ucyAmIE9ORU5BTkRfU0tJUF9JTklU
SUFMX1VOTE9DS0lORykpCj4gIAkJdGhpcy0+dW5sb2NrX2FsbChtdGQpOwo+ICAKPiArCS8qIFNl
dCB0aGUgYmFkIGJsb2NrIG1hcmtlciBwb3NpdGlvbiAqLwo+ICsJdGhpcy0+YmFkYmxvY2twb3Mg
PSBPTkVOQU5EX0JBREJMT0NLX1BPUzsKPiArCj4gIAlyZXQgPSB0aGlzLT5zY2FuX2JidChtdGQp
Owo+ICAJaWYgKCghRkxFWE9ORU5BTkQodGhpcykpIHx8IHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYnQuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2JidC5jCj4gaW5kZXggZGRlMjA0ODc5Mzdk
Li41N2MzMWM4MWJlMTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29u
ZW5hbmRfYmJ0LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYnQu
Ywo+IEBAIC0xOTAsOSArMTkwLDYgQEAgc3RhdGljIGludCBvbmVuYW5kX3NjYW5fYmJ0KHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9iYnRfZGVzY3IgKmJkKQo+ICAJaWYgKCFiYm0t
PmJidCkKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiAgCj4gLQkvKiBTZXQgdGhlIGJhZCBibG9jayBw
b3NpdGlvbiAqLwo+IC0JYmJtLT5iYWRibG9ja3BvcyA9IE9ORU5BTkRfQkFEQkxPQ0tfUE9TOwo+
IC0KPiAgCS8qIFNldCBlcmFzZSBzaGlmdCAqLwo+ICAJYmJtLT5iYnRfZXJhc2Vfc2hpZnQgPSB0
aGlzLT5lcmFzZV9zaGlmdDsKPiAgCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL29u
ZW5hbmQuaCBiL2luY2x1ZGUvbGludXgvbXRkL29uZW5hbmQuaAo+IGluZGV4IDBhYWE5OGIyMTlh
NC4uZTAzYWVhN2Y3ZTYxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL29uZW5hbmQu
aAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbXRkL29uZW5hbmQuaAo+IEBAIC05NCw2ICs5NCw3IEBA
IHN0cnVjdCBvbmVuYW5kX2NoaXAgewo+ICAJdW5zaWduZWQgaW50CQl0ZWNobm9sb2d5Owo+ICAJ
dW5zaWduZWQgaW50CQlkZW5zaXR5X21hc2s7Cj4gIAl1bnNpZ25lZCBpbnQJCW9wdGlvbnM7Cj4g
KwlpbnQJCQliYWRibG9ja3BvczsKCkFueSByZWFzb24gbm90IHRvIHVuc2lnbiB0aGlzIGZpZWxk
PwoKPiAgCj4gIAl1bnNpZ25lZCBpbnQJCWVyYXNlX3NoaWZ0Owo+ICAJdW5zaWduZWQgaW50CQlw
YWdlX3NoaWZ0Owo+IEBAIC0xODgsNiArMTg5LDggQEAgc3RydWN0IG9uZW5hbmRfY2hpcCB7Cj4g
IC8qIENoZWNrIGJ5dGUgYWNjZXNzIGluIE9uZU5BTkQgKi8KPiAgI2RlZmluZSBPTkVOQU5EX0NI
RUNLX0JZVEVfQUNDRVNTKGFkZHIpCQkoYWRkciAmIDB4MSkKPiAgCj4gKyNkZWZpbmUgT05FTkFO
RF9CQURCTE9DS19QT1MJCTAKPiArCj4gIC8qCj4gICAqIE9wdGlvbnMgYml0cwo+ICAgKi8KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
