Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D840C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:54:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDC81206B8
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:54:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NEbTAbs1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDC81206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjeOtiImFOTXVIxA9GqGqSllpjadEAJ5ex6S0Gc9fM0=; b=NEbTAbs1h2wk2L
	HhqiiohDz8CEBpUh6P3QTE/Us1gZF4hzP2Qi1/zpOkL2LbphEdqB92I+UBKvUmrhiAKPdhChj6RrQ
	5Jlmti90qfiyPXYEXOyYbyzujrB1Mygab4+PUA3R3tROEkZO01ygCTmrJA1C6q5/U1v2n3XWWRuBv
	WBhiKHX9kaE2NaWzo5YZNr6CCDMddCpnVcyXqI4f61sy89ejTUbSpCwGMq5K0yuV6l782lAMqC/fi
	hxq1ZX77KwW/8C4sPvwGXpHdrQQKdjtFSr39tGVk2xbI6fjuYVXvXkC3WzrPnk4QA81vIrLZwlEel
	azdDy4e1dA13e54Re/xQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9pJ-0006V7-9f; Mon, 27 Apr 2020 19:54:01 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9pG-0006UR-2y
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:53:59 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 33DC5C0006;
 Mon, 27 Apr 2020 19:53:55 +0000 (UTC)
Date: Mon, 27 Apr 2020 21:53:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 12/17] mtd: rawnand: cafe: Don't split things when
 reading/writing a page
Message-ID: <20200427215353.3ced34d3@xps13>
In-Reply-To: <20200427082028.394719-13-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-13-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_125358_264075_31CE9B5D 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDI3IEFwcgoyMDIwIDEwOjIwOjIyICswMjAwOgoKPiBDYWxsaW5nIG5h
bmRfcmVhZF9wYWdlX29wKHBhZ2VzaXplKS9uYW5kX3Byb2dfcGFnZV9iZWdpbl9vcChwYWdlc2l6
ZSkKPiBhbmQgZXhwZWN0aW5nIHRvIGdldCBhIHBhZ2VzaXplK29vYnNpemUgcmVhZCBmcm9tL3dy
aXR0ZW4gdG8gdGhlCj4gcmVhZC93cml0ZSBidWZmZXIgaXMgZnJhZ2lsZSBhbmQgb25seSB3b3Jr
cyBiZWNhdXNlIG9mIGhhY2tzIGRvbmUKPiBpbiBjbWRmdW5jKCkuIExldCdzIHJlYWQvd3JpdGUg
dGhlIHBhZ2UgaW4gb25lIGdvLCB1c2luZyB0aGUgcGFnZQo+IGNhY2hlIGJ1ZmZlciBhcyBhIGJv
dW5jZSBidWZmZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvY2Fm
ZV9uYW5kLmMgfCAxNiArKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9jYWZlX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jCj4g
aW5kZXggMzE0OTNhMjAxYTAyLi5lZGY2NTE5NzYwNGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZl
X25hbmQuYwo+IEBAIC00NzIsNiArNDcyLDcgQEAgc3RhdGljIGludCBjYWZlX25hbmRfcmVhZF9w
YWdlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVpbnQ4X3QgKmJ1ZiwKPiAgewo+ICAJc3RydWN0
IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiAgCXN0cnVjdCBjYWZlX3ByaXYg
KmNhZmUgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gKwl2b2lkICpwYWdlYnVm
ID0gbmFuZF9nZXRfZGF0YV9idWYoY2hpcCk7Cj4gIAl1bnNpZ25lZCBpbnQgbWF4X2JpdGZsaXBz
ID0gMDsKPiAgCXUzMiBlY2NfcmVzdWx0LCBzdGF0dXM7Cj4gIAo+IEBAIC00NzksOCArNDgwLDEx
IEBAIHN0YXRpYyBpbnQgY2FmZV9uYW5kX3JlYWRfcGFnZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlw
LCB1aW50OF90ICpidWYsCj4gIAkJY2FmZV9yZWFkbChjYWZlLCBOQU5EX0VDQ19SRVNVTFQpLAo+
ICAJCWNhZmVfcmVhZGwoY2FmZSwgTkFORF9FQ0NfU1lOX1JFRygwKSkpOwo+ICAKPiAtCW5hbmRf
cmVhZF9wYWdlX29wKGNoaXAsIHBhZ2UsIDAsIGJ1ZiwgbXRkLT53cml0ZXNpemUpOwo+IC0JY2hp
cC0+bGVnYWN5LnJlYWRfYnVmKGNoaXAsIGNoaXAtPm9vYl9wb2ksIG10ZC0+b29ic2l6ZSk7Cj4g
KwluYW5kX3JlYWRfcGFnZV9vcChjaGlwLCBwYWdlLCAwLCBwYWdlYnVmLAo+ICsJCQkgIG10ZC0+
d3JpdGVzaXplICsgbXRkLT5vb2JzaXplKTsKPiArCj4gKwlpZiAoYnVmICE9IHBhZ2VidWYpCj4g
KwkJbWVtY3B5KGJ1ZiwgcGFnZWJ1ZiwgbXRkLT53cml0ZXNpemUpOwo+ICAKPiAgCWVjY19yZXN1
bHQgPSBjYWZlX3JlYWRsKGNhZmUsIE5BTkRfRUNDX1JFU1VMVCk7Cj4gIAlzdGF0dXMgPSBDQUZF
X0ZJRUxEX0dFVChOQU5EX0VDQ19SRVNVTFQsIFNUQVRVUywgZWNjX3Jlc3VsdCk7Cj4gQEAgLTY0
MiwxNSArNjQ2LDE3IEBAIHN0YXRpYyBpbnQgY2FmZV9uYW5kX3dyaXRlX3BhZ2Uoc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwKPiAgewo+ICAJc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210
ZChjaGlwKTsKPiAgCXN0cnVjdCBjYWZlX3ByaXYgKmNhZmUgPSBuYW5kX2dldF9jb250cm9sbGVy
X2RhdGEoY2hpcCk7Cj4gKwl2b2lkICpwYWdlYnVmID0gbmFuZF9nZXRfZGF0YV9idWYoY2hpcCk7
Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCW5hbmRfcHJvZ19wYWdlX2JlZ2luX29wKGNoaXAsIHBhZ2Us
IDAsIGJ1ZiwgbXRkLT53cml0ZXNpemUpOwo+IC0JY2hpcC0+bGVnYWN5LndyaXRlX2J1ZihjaGlw
LCBjaGlwLT5vb2JfcG9pLCBtdGQtPm9vYnNpemUpOwo+ICsJaWYgKHBhZ2VidWYgIT0gYnVmKQo+
ICsJCW1lbWNweShwYWdlYnVmLCBidWYsIG10ZC0+d3JpdGVzaXplKTsKPiAgCj4gIAkvKiBTZXQg
dXAgRUNDIGF1dG9nZW5lcmF0aW9uICovCj4gIAljYWZlLT5jdGwyIHw9IENBRkVfTkFORF9DVFJM
Ml9BVVRPX1dSSVRFX0VDQzsKPiAgCj4gLQlyZXQgPSBuYW5kX3Byb2dfcGFnZV9lbmRfb3AoY2hp
cCk7Cj4gKwlyZXQgPSBuYW5kX3Byb2dfcGFnZV9vcChjaGlwLCBwYWdlLCAwLCBwYWdlYnVmLAo+
ICsJCQkJbXRkLT53cml0ZXNpemUgKyBtdGQtPm9vYnNpemUpOwo+ICAKPiAgCS8qCj4gIAkgKiBB
bmQgY2xlYXIgaXQgYmVmb3JlIHJldHVybmluZyBzbyB0aGF0IGZvbGxvd2luZyB3cml0ZSBvcGVy
YXRpb25zCgoKWW91IGFyZSByZXBsYWNpbmcgLT5yZWFkL3dyaXRlX2J1ZigpIGNhbGxzIGludG8g
bWVtY3B5KCkgY2FsbHMsCnNob3VsZG4ndCB0aGlzIGJlIGNsZWFuZWQgYmVmb3JlPyBvciBhdCBs
ZWFzdCBtZW50aW9uZWQ/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
