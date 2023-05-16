Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEAAC77B7F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 May 2023 21:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHl4JnEFtzLY9pjh746r/MADXmFwqDtSWO4CJExMiCo=; b=oTMOB5cq1hOE36
	Oz3XmMt5+pbiPxOJ5Hr1TzIq5JRjb75tcDYOv/IWiCEw7zDK3XaHaGLSGnMVke1Wmh7Lu6gchdQQU
	THRpfZuaWz6/gRZfYngIUU54TTOoGI05AdEfL/Xl+NdprmCe3ulOgTcvNVhgSAKBtKZgCvaisiIs1
	q+wM8WJyKAjQcNzYAzVKkQL2OAwGcUBgJFyYRTB0qWaFYWurTmDxwDTGLNNgwkIlIb/exmVfKCqMw
	lPICijGTsv/EYlTRyZzBI+DV939IAH0zVQzFhLJt92m9QrOqS3ttpR/FV4wV+UV1jOBFaI4uiLv6R
	3Sl2LGKxsXc0ijBQ99ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz1vD-0078W6-0x;
	Tue, 16 May 2023 21:09:27 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz1v9-0078Us-1f
	for linux-mtd@lists.infradead.org;
	Tue, 16 May 2023 21:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1684271349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZotjqSno6mlnSCl5RmCgXDL7y9mTXfMTXPW1dTQHAV8=;
	b=kzi9D6d8/kUP+OHe+02DGcYjw1n+dLg+P+bihL2p4w9Bm0iBJpGxEb/xoh13bTboropQLZ
	ygJllG6vg94bilMDWjdq6r2OGvBBNEwDqsnGqbb0yPGXdL0O3BRncl5T1Xhdz3VgAJJwNw
	qUhI8paElVeY3NuHvSgdkK8Cp8S3BXk=
Message-ID: <7dc34b53bc464cdaae3aea75814625c60315f2ca.camel@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: fix empty stub helper definitions
From: Paul Cercueil <paul@crapouillou.net>
To: Arnd Bergmann <arnd@kernel.org>, Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 16 May 2023 23:09:07 +0200
In-Reply-To: <20230516202133.559488-1-arnd@kernel.org>
References: <20230516202133.559488-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_140923_731778_C730622E 
X-CRM114-Status: GOOD (  11.80  )
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

SGksCgpMZSBtYXJkaSAxNiBtYWkgMjAyMyDDoCAyMjoyMSArMDIwMCwgQXJuZCBCZXJnbWFubiBh
IMOpY3JpdMKgOgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gQSBm
ZXcgZnVuY3Rpb25zIHByb3ZpZGUgYW4gZW1wdHkgaW50ZXJmYWNlIGRlZmluaXRpb24gd2hlbgo+
IENPTkZJR19NVERfTkFORF9JTkdFTklDX0VDQyBpcyBkaXNhYmxlZCwgYnV0IHRoZXkgYXJlIGFj
Y2lkZW50YWxseQo+IGRlZmluZWQgYXMgZ2xvYmFsIGZ1bmN0aW9ucyBpbiB0aGUgaGVhZGVyOgo+
IAo+IGRyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5pY19lY2MuaDozOTo1OiBlcnJv
cjogbm8gcHJldmlvdXMKPiBwcm90b3R5cGUgZm9yICdpbmdlbmljX2VjY19jYWxjdWxhdGUnCj4g
ZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX2VjYy5oOjQ2OjU6IGVycm9yOiBu
byBwcmV2aW91cwo+IHByb3RvdHlwZSBmb3IgJ2luZ2VuaWNfZWNjX2NvcnJlY3QnCj4gZHJpdmVy
cy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX2VjYy5oOjUzOjY6IGVycm9yOiBubyBwcmV2
aW91cwo+IHByb3RvdHlwZSBmb3IgJ2luZ2VuaWNfZWNjX3JlbGVhc2UnCj4gZHJpdmVycy9tdGQv
bmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX2VjYy5oOjU3OjIxOiBlcnJvcjogbm8gcHJldmlvdXMK
PiBwcm90b3R5cGUgZm9yICdvZl9pbmdlbmljX2VjY19nZXQnCj4gCj4gVHVybiB0aGVtIGludG8g
J3N0YXRpYyBpbmxpbmUnIGRlZmluaXRpb25zIGluc3RlYWQuCj4gCj4gRml4ZXM6IDE1ZGU4YzZl
ZmQwZSAoIm10ZDogcmF3bmFuZDogaW5nZW5pYzogU2VwYXJhdGUgdG9wLWxldmVsIGFuZAo+IFNv
QyBzcGVjaWZpYyBjb2RlIikKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPgoKR29vZCBjYXRjaC4KClJldmlld2VkLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4KCkNoZWVycywKLVBhdWwKCj4gLS0tCj4gwqBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9pbmdlbmljL2luZ2VuaWNfZWNjLmggfCA4ICsrKystLS0tCj4gwqAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfZWNjLmgKPiBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2luZ2VuaWMvaW5nZW5pY19lY2MuaAo+IGluZGV4IDJjZGE0MzliNWUxMS4uMDE3ODY4
ZjU5ZjIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5p
Y19lY2MuaAo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5pY19lY2Mu
aAo+IEBAIC0zNiwyNSArMzYsMjUgQEAgaW50IGluZ2VuaWNfZWNjX2NvcnJlY3Qoc3RydWN0IGlu
Z2VuaWNfZWNjICplY2MsCj4gwqB2b2lkIGluZ2VuaWNfZWNjX3JlbGVhc2Uoc3RydWN0IGluZ2Vu
aWNfZWNjICplY2MpOwo+IMKgc3RydWN0IGluZ2VuaWNfZWNjICpvZl9pbmdlbmljX2VjY19nZXQo
c3RydWN0IGRldmljZV9ub2RlICpucCk7Cj4gwqAjZWxzZSAvKiBDT05GSUdfTVREX05BTkRfSU5H
RU5JQ19FQ0MgKi8KPiAtaW50IGluZ2VuaWNfZWNjX2NhbGN1bGF0ZShzdHJ1Y3QgaW5nZW5pY19l
Y2MgKmVjYywKPiArc3RhdGljIGlubGluZSBpbnQgaW5nZW5pY19lY2NfY2FsY3VsYXRlKHN0cnVj
dCBpbmdlbmljX2VjYyAqZWNjLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpbmdlbmljX2VjY19wYXJhbXMgKnBhcmFtcywKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCB1OCAq
YnVmLCB1OCAqZWNjX2NvZGUpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PREVW
Owo+IMKgfQo+IMKgCj4gLWludCBpbmdlbmljX2VjY19jb3JyZWN0KHN0cnVjdCBpbmdlbmljX2Vj
YyAqZWNjLAo+ICtzdGF0aWMgaW5saW5lIGludCBpbmdlbmljX2VjY19jb3JyZWN0KHN0cnVjdCBp
bmdlbmljX2VjYyAqZWNjLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHN0cnVjdCBpbmdlbmljX2VjY19wYXJhbXMgKnBhcmFtcywgdTggKmJ1ZiwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1OCAqZWNjX2Nv
ZGUpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PREVWOwo+IMKgfQo+IMKgCj4g
LXZvaWQgaW5nZW5pY19lY2NfcmVsZWFzZShzdHJ1Y3QgaW5nZW5pY19lY2MgKmVjYykKPiArc3Rh
dGljIGlubGluZSB2b2lkIGluZ2VuaWNfZWNjX3JlbGVhc2Uoc3RydWN0IGluZ2VuaWNfZWNjICpl
Y2MpCj4gwqB7Cj4gwqB9Cj4gwqAKPiAtc3RydWN0IGluZ2VuaWNfZWNjICpvZl9pbmdlbmljX2Vj
Y19nZXQoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgaW5n
ZW5pY19lY2MgKm9mX2luZ2VuaWNfZWNjX2dldChzdHJ1Y3QKPiBkZXZpY2Vfbm9kZSAqbnApCj4g
wqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwo+IMKgfQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
