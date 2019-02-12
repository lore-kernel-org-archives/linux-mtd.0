Return-Path: <SRS0=ca8F=QT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831A6C282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 14:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3092C214DA
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 14:31:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cuUZ/8by"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3092C214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chDKIcTKXp6wzrAePHdBI1OVVqI3Y/RkpzbU9brNdmw=; b=cuUZ/8byOERDpC
	GJGAfuP5pa7c8SKYoHiTi8Xb6BMzY0PE04U7ghLj0SD05B2WMm28Puu92xEMsh/iSgB3nVezRmNuG
	o6TfePXthrQ4MdK/MHpQq6MO/THp2K0mYhYhtDmQ0zIJzCMLjcO0TzJqgNeWK9Tuio715GurDVNI7
	DTDtOjrfO/VRkqtdtoZjqc+dQPZ64eYzX7+QXsBt6zTuSD8d9e3erK4lN1wJqb5mG8irGJEoaTymB
	WxsJqox1LUC2ZP6MnsGHfPBsqKeYl+pqg4t1LvCckq8B3++ui0VU7vG/g2hcvqxcEhpavWNlouhVV
	PQxNZejDrZ+ctbITKRHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtZ6G-0007Db-5r; Tue, 12 Feb 2019 14:31:52 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtZ68-0007Cv-Fg
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2019 14:31:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86C08A78;
 Tue, 12 Feb 2019 06:31:41 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32BE43F589;
 Tue, 12 Feb 2019 06:31:41 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 86C3E6800F7; Tue, 12 Feb 2019 14:31:39 +0000 (GMT)
Date: Tue, 12 Feb 2019 14:31:39 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] mtd: afs: simplify partition parsing
Message-ID: <20190212143139.GW25147@e110455-lin.cambridge.arm.com>
References: <20190128135449.15555-1-linus.walleij@linaro.org>
 <20190128135449.15555-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190128135449.15555-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_063144_613087_12E2E2BB 
X-CRM114-Status: GOOD (  32.84  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Ryan Harkin <ryan.harkin@linaro.org>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgMDI6NTQ6NDRQTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBUaGlzIHNpbXBsaWZpZXMgdGhlIEFGUyBwYXJ0aXRpb24gcGFyc2luZyB0byBtYWtl
IHRoZSBjb2RlCj4gbW9yZSBzdHJhaWdodC1mb3J3YXJkIGFuZCByZWFkYWJsZS4KPiAKPiBCZWZv
cmUgdGhpcyBwYXRjaCB0aGUgY29kZSB0cmllZCB0byBjYWxjdWxhdGUgdGhlIG1lbW9yeSByZXF1
aXJlZAo+IHRvIGhvbGQgdGhlIHBhcnRpdGlvbiBpbmZvIGJ5IGFkZGluZyB1cCB0aGUgc2l6ZXMg
b2YgdGhlIHN0cmluZ3MKPiBvZiB0aGUgbmFtZXMgYW5kIGFkZGluZyB0aGF0IHRvIGEgc2luZ2xl
IG1lbW9yeSBhbGxvY2F0aW9uLAo+IGluZGV4aW5nIHRoZSBuYW1lIHBvaW50ZXJzIGluIGZyb250
IG9mIHRoZSBzdHJ1Y3QgbXRkX3BhcnRpdGlvbgo+IGFsbG9jYXRpb25zIHNvIGFsbCBhbGxvY2F0
ZWQgZGF0YSB3YXMgaW4gb25lIGNodW5rLgo+IAo+IFRoaXMgaXMgb3ZlcnplYWxvdXMuIEluc3Rl
YWQgdXNlIGtzdHJkdXAgYW5kIGJhaWwgb3V0LAo+IGtmcmVlKCk6aW5nIHRoZSBtZW1vcnkgdXNl
ZCBmb3IgTVREIHBhcnRpdGlvbnMgYW5kIG5hbWVzIGFsaWtlCj4gb24gdGhlIGVycm9ycGF0aC4K
PiAKPiBJbiB0aGUgcHJvY2VzcyByZW5hbWUgdGhlIGluZGV4IHZhcmlhYmxlIGZyb20gaWR4IHRv
IGkuCj4gCj4gQ2M6IFJ5YW4gSGFya2luIDxyeWFuLmhhcmtpbkBsaW5hcm8ub3JnPgo+IENjOiBM
aXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCkZvciB0aGUgd2hvbGUgc2VyaWVzOgoK
QWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgoKQmVzdCByZWdhcmRz
LApMaXZpdQoKPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL3BhcnNlcnMvYWZzLmMgfCA2NyArKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMyIGlu
c2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9wYXJzZXJzL2Fmcy5jIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9hZnMuYwo+IGluZGV4IDM2Nzll
MWQyMjU5NS4uYzQ4OTkzOGNkNjY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMv
YWZzLmMKPiArKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL2Fmcy5jCj4gQEAgLTE2Niw5ICsxNjYs
OSBAQCBzdGF0aWMgaW50IHBhcnNlX2Fmc19wYXJ0aXRpb25zKHN0cnVjdCBtdGRfaW5mbyAqbXRk
LAo+ICAJCQkJc3RydWN0IG10ZF9wYXJ0X3BhcnNlcl9kYXRhICpkYXRhKQo+ICB7Cj4gIAlzdHJ1
Y3QgbXRkX3BhcnRpdGlvbiAqcGFydHM7Cj4gLQl1X2ludCBtYXNrLCBvZmYsIGlkeCwgc3o7Cj4g
Kwl1X2ludCBtYXNrLCBvZmYsIHN6Owo+ICAJaW50IHJldCA9IDA7Cj4gLQljaGFyICpzdHI7Cj4g
KwlpbnQgaTsKPiAgCj4gIAkvKgo+ICAJICogVGhpcyBpcyB0aGUgYWRkcmVzcyBtYXNrOyB3ZSB1
c2UgdGhpcyB0byBtYXNrIG9mZiBvdXQgb2YKPiBAQCAtMTgxLDc4ICsxODEsNzUgQEAgc3RhdGlj
IGludCBwYXJzZV9hZnNfcGFydGl0aW9ucyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPiAgCSAqIHBh
cnRpdGlvbiBpbmZvcm1hdGlvbi4gIFdlIGluY2x1ZGUgaW4gdGhpcyB0aGUgc2l6ZSBvZgo+ICAJ
ICogdGhlIHN0cmluZ3MuCj4gIAkgKi8KPiAtCWZvciAoaWR4ID0gb2ZmID0gc3ogPSAwOyBvZmYg
PCBtdGQtPnNpemU7IG9mZiArPSBtdGQtPmVyYXNlc2l6ZSkgewo+IC0JCXN0cnVjdCBpbWFnZV9p
bmZvX3YxIGlpczsKPiArCWZvciAoaSA9IG9mZiA9IHN6ID0gMDsgb2ZmIDwgbXRkLT5zaXplOyBv
ZmYgKz0gbXRkLT5lcmFzZXNpemUpIHsKPiAgCQl1X2ludCBpaXNfcHRyLCBpbWdfcHRyOwo+ICAK
PiAgCQlyZXQgPSBhZnNfcmVhZF9mb290ZXJfdjEobXRkLCAmaW1nX3B0ciwgJmlpc19wdHIsIG9m
ZiwgbWFzayk7Cj4gIAkJaWYgKHJldCA8IDApCj4gLQkJCWJyZWFrOwo+ICsJCQlyZXR1cm4gcmV0
Owo+ICAJCWlmIChyZXQpIHsKPiAtCQkJcmV0ID0gYWZzX3JlYWRfaWlzX3YxKG10ZCwgJmlpcywg
aWlzX3B0cik7Cj4gLQkJCWlmIChyZXQgPCAwKQo+IC0JCQkJYnJlYWs7Cj4gLQkJCWlmIChyZXQg
PT0gMCkKPiAtCQkJCWNvbnRpbnVlOwo+IC0KPiAgCQkJc3ogKz0gc2l6ZW9mKHN0cnVjdCBtdGRf
cGFydGl0aW9uKTsKPiAtCQkJc3ogKz0gc3RybGVuKGlpcy5uYW1lKSArIDE7Cj4gLQkJCWlkeCAr
PSAxOwo+ICsJCQlpICs9IDE7Cj4gIAkJfQo+ICAJfQo+ICAKPiAtCWlmICghc3opCj4gLQkJcmV0
dXJuIHJldDsKPiArCWlmICghaSkKPiArCQlyZXR1cm4gMDsKPiAgCj4gIAlwYXJ0cyA9IGt6YWxs
b2Moc3osIEdGUF9LRVJORUwpOwo+ICAJaWYgKCFwYXJ0cykKPiAgCQlyZXR1cm4gLUVOT01FTTsK
PiAgCj4gLQlzdHIgPSAoY2hhciAqKShwYXJ0cyArIGlkeCk7Cj4gLQo+ICAJLyoKPiAgCSAqIElk
ZW50aWZ5IHRoZSBwYXJ0aXRpb25zCj4gIAkgKi8KPiAtCWZvciAoaWR4ID0gb2ZmID0gMDsgb2Zm
IDwgbXRkLT5zaXplOyBvZmYgKz0gbXRkLT5lcmFzZXNpemUpIHsKPiArCWZvciAoaSA9IG9mZiA9
IDA7IG9mZiA8IG10ZC0+c2l6ZTsgb2ZmICs9IG10ZC0+ZXJhc2VzaXplKSB7Cj4gIAkJc3RydWN0
IGltYWdlX2luZm9fdjEgaWlzOwo+ICAJCXVfaW50IGlpc19wdHIsIGltZ19wdHI7Cj4gIAo+ICAJ
CS8qIFJlYWQgdGhlIGZvb3Rlci4gKi8KPiAgCQlyZXQgPSBhZnNfcmVhZF9mb290ZXJfdjEobXRk
LCAmaW1nX3B0ciwgJmlpc19wdHIsIG9mZiwgbWFzayk7Cj4gIAkJaWYgKHJldCA8IDApCj4gLQkJ
CWJyZWFrOwo+ICsJCQlnb3RvIG91dF9mcmVlX3BhcnRzOwo+ICAJCWlmIChyZXQgPT0gMCkKPiAg
CQkJY29udGludWU7Cj4gIAo+ICAJCS8qIFJlYWQgdGhlIGltYWdlIGluZm8gYmxvY2sgKi8KPiAg
CQlyZXQgPSBhZnNfcmVhZF9paXNfdjEobXRkLCAmaWlzLCBpaXNfcHRyKTsKPiAgCQlpZiAocmV0
IDwgMCkKPiAtCQkJYnJlYWs7Cj4gKwkJCWdvdG8gb3V0X2ZyZWVfcGFydHM7Cj4gIAkJaWYgKHJl
dCA9PSAwKQo+ICAJCQljb250aW51ZTsKPiAgCj4gLQkJc3RyY3B5KHN0ciwgaWlzLm5hbWUpOwo+
ICsJCXBhcnRzW2ldLm5hbWUgPSBrc3RyZHVwKGlpcy5uYW1lLCBHRlBfS0VSTkVMKTsKPiArCQlp
ZiAoIXBhcnRzW2ldLm5hbWUpIHsKPiArCQkJcmV0ID0gLUVOT01FTTsKPiArCQkJZ290byBvdXRf
ZnJlZV9wYXJ0czsKPiArCQl9Cj4gIAo+IC0JCXBhcnRzW2lkeF0ubmFtZQkJPSBzdHI7Cj4gLQkJ
cGFydHNbaWR4XS5zaXplCQk9IChpaXMubGVuZ3RoICsgbXRkLT5lcmFzZXNpemUgLSAxKSAmIH4o
bXRkLT5lcmFzZXNpemUgLSAxKTsKPiAtCQlwYXJ0c1tpZHhdLm9mZnNldAk9IGltZ19wdHI7Cj4g
LQkJcGFydHNbaWR4XS5tYXNrX2ZsYWdzCT0gMDsKPiArCQlwYXJ0c1tpXS5zaXplCQk9IChpaXMu
bGVuZ3RoICsgbXRkLT5lcmFzZXNpemUgLSAxKSAmIH4obXRkLT5lcmFzZXNpemUgLSAxKTsKPiAr
CQlwYXJ0c1tpXS5vZmZzZXQJPSBpbWdfcHRyOwo+ICsJCXBhcnRzW2ldLm1hc2tfZmxhZ3MJPSAw
Owo+ICAKPiAgCQlwcmludGsoIiAgbXRkJWQ6IGF0IDB4JTA4eCwgJTVsbHVLaUIsICU4dSwgJXNc
biIsCj4gLQkJCWlkeCwgaW1nX3B0ciwgcGFydHNbaWR4XS5zaXplIC8gMTAyNCwKPiAtCQkJaWlz
LmltYWdlTnVtYmVyLCBzdHIpOwo+IC0KPiAtCQlpZHggKz0gMTsKPiAtCQlzdHIgPSBzdHIgKyBz
dHJsZW4oaWlzLm5hbWUpICsgMTsKPiAtCX0KPiArCQkJaSwgaW1nX3B0ciwgcGFydHNbaV0uc2l6
ZSAvIDEwMjQsCj4gKwkJCWlpcy5pbWFnZU51bWJlciwgcGFydHNbaV0ubmFtZSk7Cj4gIAo+IC0J
aWYgKCFpZHgpIHsKPiAtCQlrZnJlZShwYXJ0cyk7Cj4gLQkJcGFydHMgPSBOVUxMOwo+ICsJCWkg
Kz0gMTsKPiAgCX0KPiAgCj4gIAkqcHBhcnRzID0gcGFydHM7Cj4gLQlyZXR1cm4gaWR4ID8gaWR4
IDogcmV0Owo+ICsJcmV0dXJuIGk7Cj4gKwo+ICtvdXRfZnJlZV9wYXJ0czoKPiArCXdoaWxlIChp
ID49IDApIHsKPiArCQlpZiAocGFydHNbaV0ubmFtZSkKPiArCQkJa2ZyZWUocGFydHNbaV0ubmFt
ZSk7Cj4gKwkJaS0tOwo+ICsJfQo+ICsJa2ZyZWUocGFydHMpOwo+ICsJKnBwYXJ0cyA9IE5VTEw7
Cj4gKwlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBtdGRfcGFyc2VyX2Fmc19vZl9tYXRjaF90YWJsZVtdID0gewo+IC0tIAo+IDIuMjAuMQo+
IAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhl
IHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291
cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8KvCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
