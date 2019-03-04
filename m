Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B21CC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 10:21:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B74420823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 10:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mnjyWlwv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B74420823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Irj4jwtXDqi+y+GX5imJ1zSLdmxEsyzub5PnbQtsMjg=; b=mnjyWlwvc8LFN/
	9+nhgo6PfJgY5WMU28aHCuzekv50wrVkgA76Yet7h6knMpt/bWsSS/6D2xvKLGDmJDkPERWFTUqq/
	xeGHYw0TmKJbK8t3ct6GnM64JCDt9MRMV1ktI9JaKjSyfKazBbLSsIwr5HQAk4ETGK82eid1Wvi7l
	faA8q3LpVxDFTscpygSODX0B42SBTxWi6gGFtksYE/caSqfb5fioH0e6ejK4PRm6ojudrjU7shIYQ
	cEBqcHJBpykiTM9tM/xr0jN6kFX0XI0wGzuN7Z/CLngTbxd7pBJ56o4fX9XfWlKSYv/OxWjZH639q
	YVAp2909fNSL7sg7R+6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0kiY-0003TU-LB; Mon, 04 Mar 2019 10:21:06 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0kiV-0003T5-2S
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 10:21:05 +0000
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 54EFA200008;
 Mon,  4 Mar 2019 10:20:59 +0000 (UTC)
Date: Mon, 4 Mar 2019 11:20:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 6/9] mtd: rawnand: ingenic: Separate top-level and
 SoC specific code
Message-ID: <20190304112058.67cd5194@xps13>
In-Reply-To: <20190209192305.4434-6-paul@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-6-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_022103_413707_120952CC 
X-CRM114-Status: GOOD (  25.12  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBT
YXQsICA5IEZlYiAyMDE5IDE2OjIzOjAyCi0wMzAwOgoKPiBUaGUgaW5nZW5pYy1uYW5kIGRyaXZl
ciB1c2VzIGFuIEFQSSBwcm92aWRlZCBieSB0aGUgano0NzgwLWJjaCBkcml2ZXIuCj4gVGhpcyBt
YWtlcyBpdCBkaWZmaWN1bHQgdG8gc3VwcG9ydCBvdGhlciBTb0NzIGluIHRoZSBqejQ3ODAtYmNo
IGRyaXZlci4KPiBUbyB3b3JrIGFyb3VuZCB0aGlzLCB3ZSBzZXBhcmF0ZSB0aGUgQVBJIGZ1bmN0
aW9ucyBmcm9tIHRoZSBTb0Mtc3BlY2lmaWMKPiBjb2RlLCBzbyB0aGF0IHRoZXNlIEFQSSBmdW5j
dGlvbnMgYXJlIFNvQy1hZ25vc3RpYy4KPiAKCkkgbGlrZSB0aGUgaWRlYSwgYWN0dWFsbHkgSSBh
bSB3b3JraW5nIG9uIHRoaXMgc2VwYXJhdGlvbiAoc2VlClsxXSkgYW5kIEkgd291bGQgcmVhbGx5
IGFwcHJlY2lhdGUgdGhhdCB5b3UgdHJ5IHRvIGltcGxlbWVudCB0aGUKaW50ZXJmYWNlIHdoZW4g
aXQgd2lsbCBiZSBhdmFpbGFibGUgKHYyIGlzIGNvbWluZyB0aGlzIHdlZWssIEkgdGhpbmsgdjMK
d2lsbCBiZSB0aGUgb25lIHRvIHRlc3Qgd2hlbiByYXcgTkFORCBkZXZpY2VzIHdpbGwgYmUgcHJv
cGVybHkKc3VwcG9ydGVkKS4gSSB3aWxsIGFkZCB5b3UgaW4gQ2M6IGlmIHlvdSB3YW50IHRvIGZv
bGxvdy9yZXZpZXcuCgpbMV0gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xp
bnV4LW10ZC8yMDE5LUZlYnJ1YXJ5LzA4NzgxNS5odG1sCgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwg
Q2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IC0tLQo+IAo+IHYyOiBBZGQgYW4gb3B0
aW9uYWwgLnByb2JlKCkgY2FsbGJhY2suIEl0IGlzIHVzZWQgZm9yIGluc3RhbmNlIHRvIHNldAo+
ICAgICB0aGUgY2xvY2sgcmF0ZSBpbiB0aGUgSlo0NzgwIGJhY2tlbmQuCj4gCj4gdjM6IFRoZSBj
b21tb24gY29kZSBpcyBub3cgaW5zaWRlIHRoZSBpbmdlbmljLWVjYyBtb2R1bGUuIEVhY2gKPiAg
ICAgU29DLXNwZWNpZmljIEVDQyBjb2RlIGlzIG5vdyBpbiBpdHMgb3duIG1vZHVsZSwgd2hpY2gg
bGVhdmVzIHRvIHRoZQo+ICAgICB1c2VyIHRoZSBjaG9pY2Ugb2Ygd2hpY2ggKGlmIGFueSkgRUND
IGNvZGUgc2hvdWxkIGJlIHN1cHBvcnRlZC4KPiAKPiB2NDogTm8gY2hhbmdlCj4gCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvS2NvbmZpZyAgICAgICAgfCAgMTcgKysrCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvTWFrZWZpbGUgICAgICAgfCAgIDUgKy0KPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX2VjYy5jICB8IDE1NyArKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5pY19lY2Mu
aCAgfCAgODQgKysrKysrKysrKysrKysKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9p
bmdlbmljX25hbmQuYyB8ICAzOCArKystLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2Vu
aWMvano0NzgwX2JjaC5jICAgfCAxNzAgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2p6NDc4MF9iY2guaCAgIHwgIDQwIC0tLS0tLS0K
PiAgNyBmaWxlcyBjaGFuZ2VkLCAzMDggaW5zZXJ0aW9ucygrKSwgMjAzIGRlbGV0aW9ucygtKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmlj
X2VjYy5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmlj
L2luZ2VuaWNfZWNjLmgKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL25hbmQvcmF3
L2luZ2VuaWMvano0NzgwX2JjaC5oCj4gCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2luZ2VuaWMvaW5nZW5pY19uYW5kLmMKPiBpbmRleCA4YzczZjdjNWJlOWEuLjBmNTFmZDE1ZmU3
OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFu
ZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmQuYwo+
IEBAIC0yMiw3ICsyMiw3IEBACj4gIAo+ICAjaW5jbHVkZSA8bGludXgvano0NzgwLW5lbWMuaD4K
PiAgCj4gLSNpbmNsdWRlICJqejQ3ODBfYmNoLmgiCj4gKyNpbmNsdWRlICJpbmdlbmljX2VjYy5o
Igo+ICAKPiAgI2RlZmluZSBEUlZfTkFNRQkiaW5nZW5pYy1uYW5kIgo+ICAKPiBAQCAtNDAsNyAr
NDAsNyBAQCBzdHJ1Y3QgaW5nZW5pY19uYW5kX2NzIHsKPiAgCj4gIHN0cnVjdCBpbmdlbmljX25m
YyB7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gLQlzdHJ1Y3Qgano0NzgwX2JjaCAqYmNoOwo+
ICsJc3RydWN0IGluZ2VuaWNfZWNjICplY2M7Cj4gIAlzdHJ1Y3QgbmFuZF9jb250cm9sbGVyIGNv
bnRyb2xsZXI7Cj4gIAl1bnNpZ25lZCBpbnQgbnVtX2JhbmtzOwo+ICAJc3RydWN0IGxpc3RfaGVh
ZCBjaGlwczsKPiBAQCAtMTI0LDEwICsxMjQsMTAgQEAgc3RhdGljIGludCBpbmdlbmljX25hbmRf
ZWNjX2NhbGN1bGF0ZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCB1OCAqZGF0LAo+ICB7
Cj4gIAlzdHJ1Y3QgaW5nZW5pY19uYW5kICpuYW5kID0gdG9faW5nZW5pY19uYW5kKG5hbmRfdG9f
bXRkKGNoaXApKTsKPiAgCXN0cnVjdCBpbmdlbmljX25mYyAqbmZjID0gdG9faW5nZW5pY19uZmMo
bmFuZC0+Y2hpcC5jb250cm9sbGVyKTsKPiAtCXN0cnVjdCBqejQ3ODBfYmNoX3BhcmFtcyBwYXJh
bXM7Cj4gKwlzdHJ1Y3QgaW5nZW5pY19lY2NfcGFyYW1zIHBhcmFtczsKPiAgCj4gIAkvKgo+IC0J
ICogRG9uJ3QgbmVlZCB0byBnZW5lcmF0ZSB0aGUgRUNDIHdoZW4gcmVhZGluZywgQkNIIGRvZXMg
aXQgZm9yIHVzIGFzCj4gKwkgKiBEb24ndCBuZWVkIHRvIGdlbmVyYXRlIHRoZSBFQ0Mgd2hlbiBy
ZWFkaW5nLCBFQ0MgZG9lcyBpdCBmb3IgdXMgYXMKCiJ0aGUgRUNDIGVuZ2luZSBkb2VzIGl0IGZv
ciB1cyIgd291bGQgYmUgbW9yZSBtZWFuaW5nZnVsLgoKPiAgCSAqIHBhcnQgb2YgZGVjb2Rpbmcv
Y29ycmVjdGlvbi4KPiAgCSAqLwo+ICAJaWYgKG5hbmQtPnJlYWRpbmcpCj4gQEAgLTEzNyw3ICsx
MzcsNyBAQCBzdGF0aWMgaW50IGluZ2VuaWNfbmFuZF9lY2NfY2FsY3VsYXRlKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsIGNvbnN0IHU4ICpkYXQsCj4gIAlwYXJhbXMuYnl0ZXMgPSBuYW5kLT5jaGlw
LmVjYy5ieXRlczsKPiAgCXBhcmFtcy5zdHJlbmd0aCA9IG5hbmQtPmNoaXAuZWNjLnN0cmVuZ3Ro
Owo+ICAKPiAtCXJldHVybiBqejQ3ODBfYmNoX2NhbGN1bGF0ZShuZmMtPmJjaCwgJnBhcmFtcywg
ZGF0LCBlY2NfY29kZSk7Cj4gKwlyZXR1cm4gaW5nZW5pY19lY2NfY2FsY3VsYXRlKG5mYy0+ZWNj
LCAmcGFyYW1zLCBkYXQsIGVjY19jb2RlKTsKPiAgfQo+ICAKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
