Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B40C88E45
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0chZkMDHOsl2TI65LcslvXPpl+aJG226xGc1/vXask=; b=uUzYsQh6ALhE9h
	FbzUkGFbbfuEbJ5eyFc06mnHZmfum2lIYjQ8w9/hasol9lVffU3Yl8urDg8pE89YgrLMtBd9f7rMh
	wYvqfJ13lo96GwvLj47QbSWWMIoYSNDNsRz7LvkUioG9K7eNwndCN+Euzu7VaErMroOdlZ1q6dX9k
	GgUHsPgs8N5GoU5Va3VQ29o9Pu4FqpQnSHQu2kotVInvgjAt3qzYAJFaPVRpXcWO1InHTLUwKBSx7
	1DErD78btIxwoOF5eS3NdIiY3BxAYGr9MYXb3CSbXUd8s6AF9u4NkQ/oMWjTeJcPNlITuq68YWbMo
	GjGrAgiT+FCvebuIuJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52RN-0000000GwLP-0zBf;
	Fri, 11 Sep 2026 14:41:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52RJ-0000000GwKc-1R2r
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 14:41:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C3951A010A;
	Fri, 11 Sep 2026 14:41:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0CF1601DE;
	Fri, 11 Sep 2026 14:41:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1838E11C7AFAC;
	Fri, 11 Sep 2026 16:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789137668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v3N881ANTbgSYUw2pUytXhs3TJN2uAHfgP2ZynhyqsU=;
	b=pOxEdfZTZ+Rk89EO3XgzuvvZZ9NobasjADmGMXj/DnIHiaSGikgGzjV4lKR4AJwUX3y6WG
	FxYmIjzwpYQl31pSYb9cSFS2KEdGsGLib5ut4rEGDv6Wo4/ogak5sOMoBKF7QmPLf3L11X
	BcyNYQDOvZJnoLLQduFmbdQD4asTBmKuCEwqRjaaQUOl8irNOWrnk1/MmDflDvxvmVkzLO
	r3aQJwqT9hR5aE1xetvX5x6yrRQDiBkyzXimopJ0+GK6MbSOQCBOXzBQoZZwS80RYHmsoB
	WHNIro1Kx5YFrbAaIupES3IZoxVQSAjvEB958Fs9lBWPZG+9A7svTiJcfoS/iw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Michael Walle" <mwalle@kernel.org>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,
  linux-mtd@lists.infradead.org,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Jon Hunter" <jonathanh@nvidia.com>,
  linux-kernel@vger.kernel.org,  "Steam Lin" <STLin2@winbond.com>
Subject: Re: [PATCH v3] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
In-Reply-To: <20260911142254.EF8021F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 11 Sep 2026 14:22:54
	+0000")
References: <20260911-perso-fix-spi-nor-qe-mxic-v3-1-2ecaefb2ef2c@bootlin.com>
	<20260911142254.EF8021F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 16:41:02 +0200
Message-ID: <87se3fq29t.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_074117_519669_D7C24613 
X-CRM114-Status: GOOD (  18.60  )
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

T24gMTEvMDkvMjAyNiBhdCAxNDoyMjo1NCBHTVQsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3Jv
dGU6Cgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+Cj4gUHJlLWV4aXN0aW5n
IGlzc3VlczoKPiAtIFtIaWdoXSBTcHVyaW91cyAtRUlPIGZhaWx1cmUgZHVyaW5nIHdyaXRlIHZl
cmlmaWNhdGlvbiBpbgo+IHNwaV9ub3Jfd3JpdGVfc3IxX2FuZF9zcjJfYW5kX2NoZWNrKCkgZm9y
IGZsYXNoZXMgd2l0aCBRRVI9NCBvciA1IChlLmcuLAo+IEJGUFRfRFdPUkQxNV9RRVJfU1IyX0JJ
VDFfTk9fUkQpLgo+IC0tCj4KPiBjb21taXQgNjVmODg1ZGEzNjc4MTRiOTg1Mjk4MzBkOTc0Mzhm
OTZiNmYyOWFhMAo+IEF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KPgo+IG10ZDogc3BpLW5vcjogRml4IHF1YWQtZW5hYmxlIGZvciBmbGFzaGVzIHdpdGgg
UUVSIGJpdCBpbiBTUjEKPgo+IFRoaXMgY29tbWl0IGF0dGVtcHRzIHRvIGZpeCBxdWFkLWVuYWJs
ZSBmb3IgZmxhc2hlcyBsYWNraW5nIGFuIFNSMiByZWdpc3Rlcgo+IGJ5IGhhdmluZyB0aGUgZ2Vu
ZXJpYyBoZWxwZXIgcmV0dXJuIDAgd2hlbiBTUjIgcmVhZHMgYXJlIHVuc3VwcG9ydGVkLiBJdCBh
bHNvCj4gdXBkYXRlcyB0aGUgU0ZEUCBwYXJzaW5nIHN0ZXAgdG8gYXNzZXJ0IHRoYXQgbm8gY2hp
cCBoYXMgYW4gU1IyIHdyaXRlIHBhdGgKPiB3aXRob3V0IGFuIFNSMiByZWFkIHBhdGguCj4KPiBS
ZXBvcnRlZC1ieTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+Cj4gQ2xvc2VzOgo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8xNzg4NzY3MTkyMzIuMzU0MzkwMi4x
NDQ1MTYyNTAzNzY3NjQyMTI1NC5iNC10eUBiNC9ULyNtNWJjNGJhNjc3NjQzNmYyODcwY2VkMGVi
NTc4OWQyMjkwMzdhZDg0MAo+IEZpeGVzOiA2MzQ4OTAwMmQzOTcgKCJtdGQ6IHNwaS1ub3I6IFJl
ZmFjdG9yIFJlYWQgU3RhdHVzL1dyaXRlIFN0YXR1cyBzdXBwb3J0IikKPgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
Ywo+PiBpbmRleCBlMmI2ZWZhZmRkOGQwLi42MmI1MzkzMzkyN2YyIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2Nv
cmUuYwo+PiBAQCAtODY0LDcgKzg2NSwxMiBAQCBpbnQgc3BpX25vcl9yZWFkX3NyMV9hbmRfc3Iy
KHN0cnVjdCBzcGlfbm9yICpub3IsIHU4ICpzcikKPj4gIAlpZiAocmV0KQo+PiAgCQlyZXR1cm4g
cmV0Owo+PiAgCj4+IC0JcmV0dXJuIHNwaV9ub3JfcmVhZF9zcjIobm9yLCAmc3JbMV0pOwo+PiAr
CWlmIChub3ItPnBhcmFtcy0+b3Bjb2Rlcy5yZWFkX3NyMikKPj4gKwkJcmV0ID0gc3BpX25vcl9y
ZWFkX3NyMihub3IsICZzclsxXSk7Cj4+ICsJZWxzZQo+PiArCQlzclsxXSA9IDA7Cj4KPiBbU2V2
ZXJpdHk6IEhpZ2hdCj4gVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgZm9y
Y2luZyBzclsxXSB0byAwIGhlcmUgY2F1c2UgYQo+IHNwdXJpb3VzIC1FSU8gZmFpbHVyZSBkb3du
c3RyZWFtIGR1cmluZyB3cml0ZSB2ZXJpZmljYXRpb24/Cj4KPiBGb3IgZmxhc2hlcyB3aXRoIFFF
Uj00IG9yIDUgKGUuZy4sIEJGUFRfRFdPUkQxNV9RRVJfU1IyX0JJVDFfTk9fUkQpLCBTRkRQCj4g
cGFyc2luZyBkaXNhYmxlcyByZWFkaW5nIFNSMiAocmVhZF9zcjIgPSAwKSBidXQgcmV0YWlucyBh
IDE2LWJpdCB3cml0ZSBwYXRoCj4gdmlhIHdyaXRlX3NyMV9hbmRfc3IyIGFuZCBzZXRzIHFlX21h
c2tbMV0gPSBCSVQoMSkuCj4KPiBEdXJpbmcgcXVhZCBlbmFibGUsIHNyWzFdIGdldHMgcG9wdWxh
dGVkIHdpdGggQklUKDEpIGFuZCBpcyB3cml0dGVuIHVzaW5nIHRoZQo+IDE2LWJpdCBjb21tYW5k
LiBIb3dldmVyLCBzcGlfbm9yX3dyaXRlX3NyMV9hbmRfc3IyX2FuZF9jaGVjaygpIHZlcmlmaWVz
IHRoZQo+IHdyaXRlIGJ5IGNhbGxpbmcgdGhpcyBmdW5jdGlvbiwgd2hpY2ggZm9yY2VmdWxseSBz
ZXRzIHRtcFsxXSA9IDAuCj4KPiBUaGUgY2hlY2sgaWYgKHNyWzBdICE9IHRtcFswXSB8fCBzclsx
XSAhPSB0bXBbMV0pIHRoZW4gY29tcGFyZXMgc3JbMV09MHgwMgo+IGFnYWluc3QgdG1wWzFdPTB4
MDAsIGZhaWxzLCBhbmQgcmV0dXJucyAtRUlPLiBUaGlzIGxlYXZlcyBwcm9iaW5nIGNvbXBsZXRl
bHkKPiBicm9rZW4gZm9yIHRoZXNlIGZsYXNoZXMuCgpNaWNoYWVsIHlvdSB0aG91Z2h0IHdlIGhh
ZCBjaXJjbGVkIGJhY2sgdG8gdGhlIHByZXZpb3VzIHZlcnNpb24sIHlvdQp3ZXJlIGFsbW9zdCBy
aWdodCwgYnV0IHdpdGggdGhpcyBuZXcgZmVlZGJhY2ssIG5vdyB3ZSBoYXZlIDotKQoKQnV0IEkg
c2VlIGFuIGVhc3kgd2F5IGZvcndhcmQgdGhhdCBjYW4ga2VlcCB0aGUgYXRyb2Npb3VzIGhhY2sg
aW4gc3dwLmMKbGlrZSB5b3Ugd2FudDoKCi0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5j
CisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCkBAIC05NjYsNyArOTY2LDEwIEBAIGlu
dCBzcGlfbm9yX3dyaXRlX3NyMV9hbmRfc3IyX2FuZF9jaGVjayhzdHJ1Y3Qgc3BpX25vciAqbm9y
LCBjb25zdCB1OCAqc3IpCiAgICAgICAgaWYgKHJldCkKICAgICAgICAgICAgICAgIHJldHVybiBy
ZXQ7CiAKLSAgICAgICBpZiAoc3JbMF0gIT0gdG1wWzBdIHx8IHNyWzFdICE9IHRtcFsxXSkKKyAg
ICAgICBpZiAoc3JbMF0gIT0gdG1wWzBdKQorICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87CisK
KyAgICAgICBpZiAobm9yLT5wYXJhbXMtPm9wY29kZXMucmVhZF9zcjIgJiYgc3JbMV0gIT0gdG1w
WzFdKQogICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87CiAKICAgICAgICByZXR1cm4gMDsKCkJh
c2ljYWxseSB3ZSBjYW4ganVzdCBzdGF0ZSB0aGF0IGlmIHdlIGNhbm5vdCByZWFkIFNSMiB0aGVy
ZSBpcyBqdXN0IG5vCnBvaW50IGluIGNvbXBhcmluZyBpdHMgY29udGVudC4gSXQncyBwcm9iYWJs
eSBtb3JlIGFjY3VyYXRlIGFueXdheSB0byBkbwppdCB0aGlzIHdheS4KCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5j
Cj4+IGluZGV4IGMyMWE2OTUzZGI5NjAuLjY0MWYxN2FkNTFhMDkgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2Zk
cC5jCj4+IEBAIC02NTYsNyArNjU2LDggQEAgc3RhdGljIGludCBzcGlfbm9yX3BhcnNlX2JmcHQo
c3RydWN0IHNwaV9ub3IgKm5vciwKPj4gIAo+PiAgCS8qIG9wY29kZXMgc2FuaXR5IGNoZWNrICov
Cj4+ICAJV0FSTl9PTighcGFyYW1zLT5vcGNvZGVzLnJlYWRfc3IxIHx8Cj4+IC0JCSghcGFyYW1z
LT5vcGNvZGVzLndyaXRlX3NyMSAmJiAhcGFyYW1zLT5vcGNvZGVzLndyaXRlX3NyMV9hbmRfc3Iy
KSk7Cj4+ICsJCSghcGFyYW1zLT5vcGNvZGVzLndyaXRlX3NyMSAmJiAhcGFyYW1zLT5vcGNvZGVz
LndyaXRlX3NyMV9hbmRfc3IyKSB8fAo+PiArCQkoIXBhcmFtcy0+b3Bjb2Rlcy5yZWFkX3NyMiAm
JiBwYXJhbXMtPm9wY29kZXMud3JpdGVfc3IyKSk7Cj4KPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gVGhp
cyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIHRoaXMgc2Fu
aXR5IGNoZWNrIGZhaWwgdG8KPiBhY2NvdW50IGZvciB3cml0ZV9zcjFfYW5kX3NyMj8KPgo+IEEg
Y2hpcCBjYW4gbGFjayByZWFkX3NyMiAocmVhZF9zcjIgPSAwKSBhbmQgd3JpdGVfc3IyICh3cml0
ZV9zcjIgPSAwKSwgcGFzc2luZwo+IHRoaXMgV0FSTl9PTiwgYnV0IHN0aWxsIHBvc3Nlc3MgYSB2
YWxpZCBTUjIgd3JpdGUgcGF0aCB2aWEKPiB3cml0ZV9zcjFfYW5kX3NyMi4KPgo+IEZvciBRRVI9
NCBvciA1LCB0aGlzIG1lYW5zIHdlIGNhbiB3cml0ZSB0byBTUjIgd2l0aG91dCBiZWluZyBhYmxl
IHRvIHJlYWQgaXQsCj4gd2hpY2ggdGhlIFdBUk5fT04gZmFpbHMgdG8gY2F0Y2gsIGdpdmluZyBh
IGZhbHNlIHNlbnNlIG9mIHNhZmV0eS4KClRoaXMgb25lIGhvd2V2ZXIgaXMgYSBmYWxzZSBwb3Np
dGl2ZS4gV2UgYWxyZWFkeSBoYW5kbGUgdGhhdCBjYXNlCnByb3Blcmx5LgoKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
