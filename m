Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8222BC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 13:55:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43CA7206C3
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 13:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uo4rZzSi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43CA7206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XG5ds1boExZsEc7IjkVMPX98C3XEQfozVe0V9tFhr1g=; b=uo4rZzSinldFSb
	9Vs64L0HGot2txd5ZnxqIbEZgW+vO7ktTwttEwGZrq5FgnKAcWDp22FMmMFmArEsUsA32dq6dVJgn
	UKgZPDVeCLCsL1E32un74wiKKkYkoQEx4shm6z3v+E2ECUMUMRk4rvSwoChdNO4626ZTzJJt5osK6
	+xAbfpPUxX/YfXNI3dPvjgMv/wQmmCO4mlYt11dtvpKz8+ABwtWuPPsS7GiWWZyFpX72N+niAhSeg
	HpBtV3o07Jb3k8h8TipGUEIyJprQYcpjkmBXfpgvfEvJzOIc4FSSMqmf6WUOJpiIbPft7xOufeTDI
	dCpPiKtqSukjxBZYWWlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbPC6-0008GS-Ld; Wed, 20 May 2020 13:55:38 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbPC3-0008G0-Nm
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 13:55:37 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A162A240015;
 Wed, 20 May 2020 13:55:30 +0000 (UTC)
Date: Wed, 20 May 2020 15:55:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rickard Andersson <rickaran@axis.com>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: Add a helper for testing data
 interface
Message-ID: <20200520155529.3d959e96@xps13>
In-Reply-To: <20200520133854.25241-1-rickaran@axis.com>
References: <20200520133854.25241-1-rickaran@axis.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_065536_044846_1E7230B8 
X-CRM114-Status: GOOD (  21.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmlja2FyZCwKClJpY2thcmQgQW5kZXJzc29uIDxyaWNrYXJhbkBheGlzLmNvbT4gd3JvdGUg
b24gV2VkLCAyMCBNYXkgMjAyMAoxNTozODo1MyArMDIwMDoKCj4gRnJvbTogUmlja2FyZCB4IEFu
ZGVyc3NvbiA8cmlja2FyYW5AYXhpcy5jb20+Cj4gCj4gVGhpcyBoZWxwZXIgdGVzdHMgdGhlIGN1
cnJlbnQgZGF0YSBpbnRlcmZhY2UgdGltaW5ncy4gSWYKPiB0aGUgY29udHJvbGxlciBkb2VzIG5v
dCBhY2NlcHQgdGhlIHRpbWluZ3MgdGhlbiB0aGUgdGltaW5ncwoKcy9hY2NlcHQvc3VwcG9ydC8K
Cj4gYXJlIGVyYXNlZCBhbmQgb25maSBtb2RlIDAgdGltaW5ncyBhcmUgY2hvc2VuIGF0IGEgbGF0
ZXIKPiBzdGFnZS4KClNlZSBiZWxvdywgSSBkb24ndCB0aGluayB0aGlzIGlzIG5lZWRlZC4KCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUmlja2FyZCB4IEFuZGVyc3NvbiA8cmlja2FyYW5AYXhpcy5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVybmFscy5oIHwgIDEgKwo+ICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVy
bmFscy5oIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZXJuYWxzLmgKPiBpbmRleCA2MTU2Nzc4
MjAzMzguLjdkZjBhOGU2NzRjYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9p
bnRlcm5hbHMuaAo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVybmFscy5oCj4gQEAg
LTEwMCw2ICsxMDAsNyBAQCBpbnQgbmFuZF9yZWFkX3BhcmFtX3BhZ2Vfb3Aoc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCwgdTggcGFnZSwgdm9pZCAqYnVmLAo+ICB2b2lkIG5hbmRfZGVjb2RlX2V4dF9p
ZChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKTsKPiAgdm9pZCBwYW5pY19uYW5kX3dhaXQoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwgdW5zaWduZWQgbG9uZyB0aW1lbyk7Cj4gIHZvaWQgc2FuaXRpemVf
c3RyaW5nKHVpbnQ4X3QgKnMsIHNpemVfdCBsZW4pOwo+ICtpbnQgbmFuZF90ZXN0X2RhdGFfaW50
ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApOwo+ICAKPiAgc3RhdGljIGlubGluZSBib29s
IG5hbmRfaGFzX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgewo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYmFzZS5jCj4gaW5kZXggYzQyY2JlYjdlNDQ2Li4yOWU3YmUzODExZTcgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IEBAIC05NTYsNiArOTU2LDMyIEBAIHN0YXRpYyBp
bnQgbmFuZF9zZXR1cF9kYXRhX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQg
Y2hpcG5yKQo+ICB9Cj4gIAo+ICAvKioKPiArICogbmFuZF90ZXN0X2RhdGFfaW50ZXJmYWNlIC0g
Q2hlY2sgaWYgY29udHJvbGxlciBjYW4gaGFuZGxlIHRoZSBjdXJyZW50CgpJJ20gZmluZSBhZGRp
bmcgYW4gaGVscGVyIGZvciB0aGF0LiBJdCBjb3VsZCBhbHNvIGJlIHVzZWQgZm9yIEREUiB0aW1p
bmcKc3VwcG9ydC4KCldoYXQgYWJvdXQgcmVuYW1pbmcgaXQgIm5hbmRfY29udHJvbGxlcl9zdXBw
b3J0c19kYXRhX2ludGVyZmFjZSgpIj8KCj4gKyAqIHRpbWluZ3MuIENsZWFyIHRpbWluZ3MgaWYg
bm90IHVzYWJsZS4KPiArICoKPiArICogQGNoaXA6IFRoZSBOQU5EIGNoaXAKPiArICovCj4gK2lu
dCBuYW5kX3Rlc3RfZGF0YV9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiArewo+
ICsJaW50IHJldDsKCk1pc3NpbmcgZXh0cmEgbGluZQoKPiArCS8qCj4gKwkgKiBQYXNzIE5BTkRf
REFUQV9JRkFDRV9DSEVDS19PTkxZIHRvIG9ubHkgY2hlY2sgaWYgdGhlCj4gKwkgKiBjb250cm9s
bGVyIHN1cHBvcnRzIHRoZSByZXF1ZXN0ZWQgdGltaW5ncy4KPiArCSAqLwo+ICsJcmV0ID0gY2hp
cC0+Y29udHJvbGxlci0+b3BzLT5zZXR1cF9kYXRhX2ludGVyZmFjZShjaGlwLAo+ICsJCQkJCQkg
TkFORF9EQVRBX0lGQUNFX0NIRUNLX09OTFksCj4gKwkJCQkJCSAmY2hpcC0+ZGF0YV9pbnRlcmZh
Y2UpOwoKQ291bGQgeW91IGFsaWduIHRoZXNlIGxpbmVzIHRvIHRoZSBvcGVuZWQgcGFyZW50aGVz
aXM/Cgo+ICsKPiArCWlmIChyZXQpIHsKPiArCQkvKiBUaGUgcHJvdmlkZWQgZGF0YSBpbnRlcmZh
Y2UgdGltaW5ncyBkaWQgbm90IHdvcmsgKi8KPiArCQltZW1zZXQoJmNoaXAtPmRhdGFfaW50ZXJm
YWNlLCAwLAo+ICsJCSAgICAgICBzaXplb2Yoc3RydWN0IG5hbmRfZGF0YV9pbnRlcmZhY2UpKTsK
CkknbSBub3Qgc3VyZSB0aGlzIGlzIG5lZWRlZC4gSSB0aGluayBpdCB3aWxsIG9ubHkgYmUgbmVj
ZXNzYXJ5IGluIHlvdXIKY2FzZSwgc28gSSB0aGluayBpdCdzIGJldHRlciB0byBtb3ZlIGl0IG91
ZiBvZiB0aGlzIGZ1bmN0aW9uLgoKPiArCX0KPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9CgpNYXli
ZSBpdCBpcyBiZXN0IHRvIG1vdmUgdGhpcyBmdW5jdGlvbiBpbiBpbnRlcm5hbHMuaCBkaXJlY3Rs
eS4KCj4gKwo+ICsvKioKPiAgICogbmFuZF9jaG9vc2VfZGF0YV9pbnRlcmZhY2UgLSBmaW5kIHRo
ZSBiZXN0IGRhdGEgaW50ZXJmYWNlIGFuZCB0aW1pbmdzCj4gICAqIEBjaGlwOiBUaGUgTkFORCBj
aGlwCj4gICAqCj4gQEAgLTk5NCw5ICsxMDIwLDYgQEAgc3RhdGljIGludCBuYW5kX2Nob29zZV9k
YXRhX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAJaWYgKGNoaXAtPnBhcmFt
ZXRlcnMub25maSkgewo+ICAJCW1vZGVzID0gY2hpcC0+cGFyYW1ldGVycy5vbmZpLT5hc3luY190
aW1pbmdfbW9kZTsKPiAgCX0gZWxzZSB7Cj4gLQkJaWYgKCFjaGlwLT5kZWZhdWx0X3RpbWluZ19t
b2RlKQo+IC0JCQlyZXR1cm4gMDsKPiAtCgpUaGlzIHNob3VsZCBub3QgYmUgcmVtb3ZlZAoKPiAg
CQltb2RlcyA9IEdFTk1BU0soY2hpcC0+ZGVmYXVsdF90aW1pbmdfbW9kZSwgMCk7Cj4gIAl9Cj4g
IAo+IEBAIC0xMDA1LDEzICsxMDI4LDggQEAgc3RhdGljIGludCBuYW5kX2Nob29zZV9kYXRhX2lu
dGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAJCWlmIChyZXQpCj4gIAkJCWNvbnRp
bnVlOwo+ICAKPiAtCQkvKgo+IC0JCSAqIFBhc3MgTkFORF9EQVRBX0lGQUNFX0NIRUNLX09OTFkg
dG8gb25seSBjaGVjayBpZiB0aGUKPiAtCQkgKiBjb250cm9sbGVyIHN1cHBvcnRzIHRoZSByZXF1
ZXN0ZWQgdGltaW5ncy4KPiAtCQkgKi8KPiAtCQlyZXQgPSBjaGlwLT5jb250cm9sbGVyLT5vcHMt
PnNldHVwX2RhdGFfaW50ZXJmYWNlKGNoaXAsCj4gLQkJCQkJCSBOQU5EX0RBVEFfSUZBQ0VfQ0hF
Q0tfT05MWSwKPiAtCQkJCQkJICZjaGlwLT5kYXRhX2ludGVyZmFjZSk7Cj4gKwkJLyogQ2hlY2sg
aWYgdGhlIGNvbnRyb2xsZXIgc3VwcG9ydHMgdGhlIHJlcXVlc3RlZCB0aW1pbmdzLiAqLwo+ICsJ
CXJldCA9IG5hbmRfdGVzdF9kYXRhX2ludGVyZmFjZShjaGlwKTsKPiAgCQlpZiAoIXJldCkgewo+
ICAJCQljaGlwLT5kZWZhdWx0X3RpbWluZ19tb2RlID0gbW9kZTsKPiAgCQkJYnJlYWs7CgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
