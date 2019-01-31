Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0CFC169C4
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 17:13:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3FDE2087F
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 17:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9VRBPbq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3FDE2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsPbKh/j7uOBW8shc2L3NIGICHY5Zm3cCVgxM5un13o=; b=Y9VRBPbq5Z24z/
	hya6hhbqqpsRezH2d/JtTq4OmOl4+qAzbq0JGQmo7+VNNYWyeTQuZNed0K0o6SEORHMjKK5iVctTk
	/hBsWyqJAYOoq2KJJNZUAkH0N64v3XodporX14AZxf+5R8P+Ro6UnRIzUQbz5eBVGN0E6C/XtRE11
	wnNsDaQUHJMeAuRzVZQU392L8uhVjy8vfbVqqOpUlMYBE0uuHlQIhtyhMElhdPDNTdIgBVf7HO6fI
	towRFGitqI182nvhEFIw8o++c1dHnNuTo5coQzGEZQb13YbK66b56ND3hxBMfXh3IYPhwwdNYLrnv
	ujQc9ioOl72kmcP6eeGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpFuA-0008LU-K9; Thu, 31 Jan 2019 17:13:34 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpFu8-0008L6-3C
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2019 17:13:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02DC8A78;
 Thu, 31 Jan 2019 09:13:30 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A19DE3F59C;
 Thu, 31 Jan 2019 09:13:29 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 06AF368218A; Thu, 31 Jan 2019 17:13:27 +0000 (GMT)
Date: Thu, 31 Jan 2019 17:13:27 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] mtd: afs: simplify partition parsing
Message-ID: <20190131171327.GM25147@e110455-lin.cambridge.arm.com>
References: <20190128135449.15555-1-linus.walleij@linaro.org>
 <20190128135449.15555-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190128135449.15555-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_091332_146863_F60F9365 
X-CRM114-Status: GOOD (  34.34  )
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

SGkgTGludXMsCgpPbiBNb24sIEphbiAyOCwgMjAxOSBhdCAwMjo1NDo0NFBNICswMTAwLCBMaW51
cyBXYWxsZWlqIHdyb3RlOgo+IFRoaXMgc2ltcGxpZmllcyB0aGUgQUZTIHBhcnRpdGlvbiBwYXJz
aW5nIHRvIG1ha2UgdGhlIGNvZGUKPiBtb3JlIHN0cmFpZ2h0LWZvcndhcmQgYW5kIHJlYWRhYmxl
Lgo+IAo+IEJlZm9yZSB0aGlzIHBhdGNoIHRoZSBjb2RlIHRyaWVkIHRvIGNhbGN1bGF0ZSB0aGUg
bWVtb3J5IHJlcXVpcmVkCj4gdG8gaG9sZCB0aGUgcGFydGl0aW9uIGluZm8gYnkgYWRkaW5nIHVw
IHRoZSBzaXplcyBvZiB0aGUgc3RyaW5ncwo+IG9mIHRoZSBuYW1lcyBhbmQgYWRkaW5nIHRoYXQg
dG8gYSBzaW5nbGUgbWVtb3J5IGFsbG9jYXRpb24sCj4gaW5kZXhpbmcgdGhlIG5hbWUgcG9pbnRl
cnMgaW4gZnJvbnQgb2YgdGhlIHN0cnVjdCBtdGRfcGFydGl0aW9uCj4gYWxsb2NhdGlvbnMgc28g
YWxsIGFsbG9jYXRlZCBkYXRhIHdhcyBpbiBvbmUgY2h1bmsuCj4gCj4gVGhpcyBpcyBvdmVyemVh
bG91cy4gSW5zdGVhZCB1c2Uga3N0cmR1cCBhbmQgYmFpbCBvdXQsCj4ga2ZyZWUoKTppbmcgdGhl
IG1lbW9yeSB1c2VkIGZvciBNVEQgcGFydGl0aW9ucyBhbmQgbmFtZXMgYWxpa2UKPiBvbiB0aGUg
ZXJyb3JwYXRoLgo+IAo+IEluIHRoZSBwcm9jZXNzIHJlbmFtZSB0aGUgaW5kZXggdmFyaWFibGUg
ZnJvbSBpZHggdG8gaS4KPiAKPiBDYzogUnlhbiBIYXJraW4gPHJ5YW4uaGFya2luQGxpbmFyby5v
cmc+Cj4gQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJp
dmVycy9tdGQvcGFyc2Vycy9hZnMuYyB8IDY3ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLQoKV2hhdCBrZXJuZWwgaXMgdGhpcyBzZXJpZXMgYmFzZWQgb24/IEN1cnJlbnQg
VG9ydmFsZHMnIHRyZWUgaGFzIHRoZQphZnMuYyBmaWxlIGluIGRyaXZlcnMvbXRkIGFuZCBub3Qg
aW4gZHJpdmVycy9tdGQvcGFyc2Vycy8uIElzIHRoZXJlIGEKcGF0Y2ggdGhhdCBJJ20gbWlzc2lu
ZyBtb3ZpbmcgdGhpbmdzIGFyb3VuZD8KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvcGFyc2Vycy9hZnMuYyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvYWZzLmMK
PiBpbmRleCAzNjc5ZTFkMjI1OTUuLmM0ODk5MzhjZDY2NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9wYXJzZXJzL2Fmcy5jCj4gKysrIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9hZnMuYwo+IEBA
IC0xNjYsOSArMTY2LDkgQEAgc3RhdGljIGludCBwYXJzZV9hZnNfcGFydGl0aW9ucyhzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwKPiAgCQkJCXN0cnVjdCBtdGRfcGFydF9wYXJzZXJfZGF0YSAqZGF0YSkK
PiAgewo+ICAJc3RydWN0IG10ZF9wYXJ0aXRpb24gKnBhcnRzOwo+IC0JdV9pbnQgbWFzaywgb2Zm
LCBpZHgsIHN6Owo+ICsJdV9pbnQgbWFzaywgb2ZmLCBzejsKPiAgCWludCByZXQgPSAwOwo+IC0J
Y2hhciAqc3RyOwo+ICsJaW50IGk7Cj4gIAo+ICAJLyoKPiAgCSAqIFRoaXMgaXMgdGhlIGFkZHJl
c3MgbWFzazsgd2UgdXNlIHRoaXMgdG8gbWFzayBvZmYgb3V0IG9mCj4gQEAgLTE4MSw3OCArMTgx
LDc1IEBAIHN0YXRpYyBpbnQgcGFyc2VfYWZzX3BhcnRpdGlvbnMoc3RydWN0IG10ZF9pbmZvICpt
dGQsCj4gIAkgKiBwYXJ0aXRpb24gaW5mb3JtYXRpb24uICBXZSBpbmNsdWRlIGluIHRoaXMgdGhl
IHNpemUgb2YKPiAgCSAqIHRoZSBzdHJpbmdzLgo+ICAJICovCj4gLQlmb3IgKGlkeCA9IG9mZiA9
IHN6ID0gMDsgb2ZmIDwgbXRkLT5zaXplOyBvZmYgKz0gbXRkLT5lcmFzZXNpemUpIHsKPiAtCQlz
dHJ1Y3QgaW1hZ2VfaW5mb192MSBpaXM7Cj4gKwlmb3IgKGkgPSBvZmYgPSBzeiA9IDA7IG9mZiA8
IG10ZC0+c2l6ZTsgb2ZmICs9IG10ZC0+ZXJhc2VzaXplKSB7Cj4gIAkJdV9pbnQgaWlzX3B0ciwg
aW1nX3B0cjsKPiAgCj4gIAkJcmV0ID0gYWZzX3JlYWRfZm9vdGVyX3YxKG10ZCwgJmltZ19wdHIs
ICZpaXNfcHRyLCBvZmYsIG1hc2spOwo+ICAJCWlmIChyZXQgPCAwKQo+IC0JCQlicmVhazsKPiAr
CQkJcmV0dXJuIHJldDsKPiAgCQlpZiAocmV0KSB7Cj4gLQkJCXJldCA9IGFmc19yZWFkX2lpc192
MShtdGQsICZpaXMsIGlpc19wdHIpOwo+IC0JCQlpZiAocmV0IDwgMCkKPiAtCQkJCWJyZWFrOwo+
IC0JCQlpZiAocmV0ID09IDApCj4gLQkJCQljb250aW51ZTsKPiAtCj4gIAkJCXN6ICs9IHNpemVv
ZihzdHJ1Y3QgbXRkX3BhcnRpdGlvbik7Cj4gLQkJCXN6ICs9IHN0cmxlbihpaXMubmFtZSkgKyAx
Owo+IC0JCQlpZHggKz0gMTsKPiArCQkJaSArPSAxOwo+ICAJCX0KPiAgCX0KPiAgCj4gLQlpZiAo
IXN6KQo+IC0JCXJldHVybiByZXQ7Cj4gKwlpZiAoIWkpCj4gKwkJcmV0dXJuIDA7Cj4gIAo+ICAJ
cGFydHMgPSBremFsbG9jKHN6LCBHRlBfS0VSTkVMKTsKPiAgCWlmICghcGFydHMpCj4gIAkJcmV0
dXJuIC1FTk9NRU07Cj4gIAo+IC0Jc3RyID0gKGNoYXIgKikocGFydHMgKyBpZHgpOwo+IC0KPiAg
CS8qCj4gIAkgKiBJZGVudGlmeSB0aGUgcGFydGl0aW9ucwo+ICAJICovCj4gLQlmb3IgKGlkeCA9
IG9mZiA9IDA7IG9mZiA8IG10ZC0+c2l6ZTsgb2ZmICs9IG10ZC0+ZXJhc2VzaXplKSB7Cj4gKwlm
b3IgKGkgPSBvZmYgPSAwOyBvZmYgPCBtdGQtPnNpemU7IG9mZiArPSBtdGQtPmVyYXNlc2l6ZSkg
ewo+ICAJCXN0cnVjdCBpbWFnZV9pbmZvX3YxIGlpczsKPiAgCQl1X2ludCBpaXNfcHRyLCBpbWdf
cHRyOwo+ICAKPiAgCQkvKiBSZWFkIHRoZSBmb290ZXIuICovCj4gIAkJcmV0ID0gYWZzX3JlYWRf
Zm9vdGVyX3YxKG10ZCwgJmltZ19wdHIsICZpaXNfcHRyLCBvZmYsIG1hc2spOwo+ICAJCWlmIChy
ZXQgPCAwKQo+IC0JCQlicmVhazsKPiArCQkJZ290byBvdXRfZnJlZV9wYXJ0czsKPiAgCQlpZiAo
cmV0ID09IDApCj4gIAkJCWNvbnRpbnVlOwo+ICAKPiAgCQkvKiBSZWFkIHRoZSBpbWFnZSBpbmZv
IGJsb2NrICovCj4gIAkJcmV0ID0gYWZzX3JlYWRfaWlzX3YxKG10ZCwgJmlpcywgaWlzX3B0cik7
Cj4gIAkJaWYgKHJldCA8IDApCj4gLQkJCWJyZWFrOwo+ICsJCQlnb3RvIG91dF9mcmVlX3BhcnRz
Owo+ICAJCWlmIChyZXQgPT0gMCkKPiAgCQkJY29udGludWU7Cj4gIAo+IC0JCXN0cmNweShzdHIs
IGlpcy5uYW1lKTsKPiArCQlwYXJ0c1tpXS5uYW1lID0ga3N0cmR1cChpaXMubmFtZSwgR0ZQX0tF
Uk5FTCk7Cj4gKwkJaWYgKCFwYXJ0c1tpXS5uYW1lKSB7Cj4gKwkJCXJldCA9IC1FTk9NRU07Cj4g
KwkJCWdvdG8gb3V0X2ZyZWVfcGFydHM7Cj4gKwkJfQo+ICAKPiAtCQlwYXJ0c1tpZHhdLm5hbWUJ
CT0gc3RyOwo+IC0JCXBhcnRzW2lkeF0uc2l6ZQkJPSAoaWlzLmxlbmd0aCArIG10ZC0+ZXJhc2Vz
aXplIC0gMSkgJiB+KG10ZC0+ZXJhc2VzaXplIC0gMSk7Cj4gLQkJcGFydHNbaWR4XS5vZmZzZXQJ
PSBpbWdfcHRyOwo+IC0JCXBhcnRzW2lkeF0ubWFza19mbGFncwk9IDA7Cj4gKwkJcGFydHNbaV0u
c2l6ZQkJPSAoaWlzLmxlbmd0aCArIG10ZC0+ZXJhc2VzaXplIC0gMSkgJiB+KG10ZC0+ZXJhc2Vz
aXplIC0gMSk7Cj4gKwkJcGFydHNbaV0ub2Zmc2V0CT0gaW1nX3B0cjsKPiArCQlwYXJ0c1tpXS5t
YXNrX2ZsYWdzCT0gMDsKPiAgCj4gIAkJcHJpbnRrKCIgIG10ZCVkOiBhdCAweCUwOHgsICU1bGx1
S2lCLCAlOHUsICVzXG4iLAo+IC0JCQlpZHgsIGltZ19wdHIsIHBhcnRzW2lkeF0uc2l6ZSAvIDEw
MjQsCj4gLQkJCWlpcy5pbWFnZU51bWJlciwgc3RyKTsKPiAtCj4gLQkJaWR4ICs9IDE7Cj4gLQkJ
c3RyID0gc3RyICsgc3RybGVuKGlpcy5uYW1lKSArIDE7Cj4gLQl9Cj4gKwkJCWksIGltZ19wdHIs
IHBhcnRzW2ldLnNpemUgLyAxMDI0LAo+ICsJCQlpaXMuaW1hZ2VOdW1iZXIsIHBhcnRzW2ldLm5h
bWUpOwo+ICAKPiAtCWlmICghaWR4KSB7Cj4gLQkJa2ZyZWUocGFydHMpOwo+IC0JCXBhcnRzID0g
TlVMTDsKPiArCQlpICs9IDE7Cj4gIAl9Cj4gIAo+ICAJKnBwYXJ0cyA9IHBhcnRzOwo+IC0JcmV0
dXJuIGlkeCA/IGlkeCA6IHJldDsKPiArCXJldHVybiBpOwo+ICsKPiArb3V0X2ZyZWVfcGFydHM6
Cj4gKwl3aGlsZSAoaSA+PSAwKSB7Cj4gKwkJaWYgKHBhcnRzW2ldLm5hbWUpCj4gKwkJCWtmcmVl
KHBhcnRzW2ldLm5hbWUpOwo+ICsJCWktLTsKPiArCX0KPiArCWtmcmVlKHBhcnRzKTsKPiArCSpw
cGFydHMgPSBOVUxMOwo+ICsJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgbXRkX3BhcnNlcl9hZnNfb2ZfbWF0Y2hfdGFibGVbXSA9IHsKPiAt
LSAKPiAyLjIwLjEKPiAKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0
byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0
aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4Qp
Xy/CrwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
