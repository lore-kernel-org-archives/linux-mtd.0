Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EE9C83004
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:36:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02C6D206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:36:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZLvddc5L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02C6D206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ua+m8lbK4vrgHJRZA8fXBLTnmyPnNyuU39Jax/nS0e8=; b=ZLvddc5LnNdUHe
	LFke11WuxpgGx2MZ5N+2s5m0/vyi1w3PzoiSCTtdjCwWWlLOfOjmin+sde17Vp1zmUFa7NBRckA3W
	8nA5cZYCNFRXRBuMbhf33T9easbxnXUGeuhwHHM5nbCb06OHuYiR0wdzs6ymuWaH90EdrJ7JsETk9
	pM2Cpshqzn1y0DG64wE8cix+wSjIVf7nKFfL1CPKrF/3LkjW3H/52YO+H7mLA+mOI4Iif1o+eGy9d
	K07B5qhcMPTT17SSHLycSoqZx5ylYppHp/1aIplTKrpVYg+wJqsSymUM9VnCBPTNmcCMHkMZnimzg
	AjDuEDk8vXE/h2kN1Ueg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTMfN-00035Z-8e; Tue, 28 Apr 2020 09:36:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMfJ-00034t-FJ
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 09:36:35 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BE1A6FF80F;
 Tue, 28 Apr 2020 09:36:29 +0000 (UTC)
Date: Tue, 28 Apr 2020 11:36:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 5/9] mtd: rawnand: onfi: Define the number of
 parameter pages
Message-ID: <20200428113628.0f9cd8d7@xps13>
In-Reply-To: <20200425102519.367cf1ea@collabora.com>
References: <20200424164042.26572-1-miquel.raynal@bootlin.com>
 <20200424164042.26572-6-miquel.raynal@bootlin.com>
 <20200425102519.367cf1ea@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_023633_783140_FA454DCB 
X-CRM114-Status: GOOD (  19.12  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTYXQsIDI1IEFwcgoyMDIwIDEwOjI1OjE5ICswMjAwOgoKPiBPbiBGcmksIDI0
IEFwciAyMDIwIDE4OjQwOjM4ICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBVc2UgYSBtYWNybyB0byBkZWZpbmUgdGhlIG51bWJl
ciBvZiBwYXJhbWV0ZXIgcGFnZSBpbnN0ZWFkIG9mCj4gPiBoYXJkY29kaW5nIGl0IGV2ZXJ5d2hl
cmUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmku
YyB8IDEwICsrKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9vbmZpLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYwo+ID4gaW5kZXgg
N2Q5YTMxMzA0NDNhLi45ZmUzOWFkYmRlNGMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX29uZmkuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9v
bmZpLmMKPiA+IEBAIC0xNiw2ICsxNiw4IEBACj4gPiAgCj4gPiAgI2luY2x1ZGUgImludGVybmFs
cy5oIgo+ID4gIAo+ID4gKyNkZWZpbmUgT05GSV9QQVJBTV9QQUdFUyAzCj4gPiArCj4gPiAgdTE2
IG9uZmlfY3JjMTYodTE2IGNyYywgdTggY29uc3QgKnAsIHNpemVfdCBsZW4pCj4gPiAgewo+ID4g
IAlpbnQgaTsKPiA+IEBAIC0xNTYsNyArMTU4LDcgQEAgaW50IG5hbmRfb25maV9kZXRlY3Qoc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+ICAJCXJldHVybiAwOwo+ID4gIAo+ID4gIAkvKiBPTkZJ
IGNoaXA6IGFsbG9jYXRlIGEgYnVmZmVyIHRvIGhvbGQgaXRzIHBhcmFtZXRlciBwYWdlICovCj4g
PiAtCXAgPSBremFsbG9jKChzaXplb2YoKnApICogMyksIEdGUF9LRVJORUwpOwo+ID4gKwlwID0g
a3phbGxvYygoc2l6ZW9mKCpwKSAqIE9ORklfUEFSQU1fUEFHRVMpLCBHRlBfS0VSTkVMKTsKPiA+
ICAJaWYgKCFwKQo+ID4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gPiAgCj4gPiBAQCAtMTY2LDcgKzE2
OCw3IEBAIGludCBuYW5kX29uZmlfZGV0ZWN0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gPiAg
CQlnb3RvIGZyZWVfb25maV9wYXJhbV9wYWdlOwo+ID4gIAl9Cj4gPiAgCj4gPiAtCWZvciAoaSA9
IDA7IGkgPCAzOyBpKyspIHsKPiA+ICsJZm9yIChpID0gMDsgaSA8IE9ORklfUEFSQU1fUEFHRVM7
IGkrKykgewo+ID4gIAkJcmV0ID0gbmFuZF9yZWFkX2RhdGFfb3AoY2hpcCwgJnBbaV0sIHNpemVv
ZigqcCksIHRydWUpOwo+ID4gIAkJaWYgKHJldCkgewo+ID4gIAkJCXJldCA9IDA7Cj4gPiBAQCAt
MTgxLDggKzE4Myw4IEBAIGludCBuYW5kX29uZmlfZGV0ZWN0KHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXApCj4gPiAgCQl9Cj4gPiAgCX0KPiA+ICAKPiA+IC0JaWYgKGkgPT0gMykgewo+ID4gLQkJY29u
c3Qgdm9pZCAqc3JjYnVmc1szXSA9IHtwLCBwICsgMSwgcCArIDJ9Owo+ID4gKwlpZiAoaSA9PSBP
TkZJX1BBUkFNX1BBR0VTKSB7Cj4gPiArCQljb25zdCB2b2lkICpzcmNidWZzW09ORklfUEFSQU1f
UEFHRVNdID0ge3AsIHAgKyAxLCBwICsgMn07Cj4gPiAgICAKPiAKPiBNYXliZSBpbml0aWFsaXpl
IHRoZSBzcmNidWZzIGFycmF5IHVzaW5nIGEgZm9yIGxvb3Agc28geW91IGNhbiBlYXNpbHkKPiBj
aGFuZ2UgT05GSV9QQVJBTV9QQUdFUyB3aXRob3V0IGhhdmluZyB0byB0b3VjaCB0aGUgY29kZS4g
TG9va3MgZ29vZAo+IG90aGVyd2lzZSwgc28KPiAKPiBSZXZpZXdlZC1ieTogQm9yaXMgQnJlaWxs
b24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IAoKQWdyZWVkLCBoZXJlIGlzIHRo
ZSBzbmlwcGV0IG9mIGNvZGUgdGhhdCBJIGNoYW5nZWQ6CgpAQCAtMTgxLDExICsxODMsMTUgQEAg
aW50IG5hbmRfb25maV9kZXRlY3Qoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKICAgICAgICAgICAg
ICAgIH0KICAgICAgICB9CiAKLSAgICAgICBpZiAoaSA9PSAzKSB7Ci0gICAgICAgICAgICAgICBj
b25zdCB2b2lkICpzcmNidWZzWzNdID0ge3AsIHAgKyAxLCBwICsgMn07CisgICAgICAgaWYgKGkg
PT0gT05GSV9QQVJBTV9QQUdFUykgeworICAgICAgICAgICAgICAgY29uc3Qgdm9pZCAqc3JjYnVm
c1tPTkZJX1BBUkFNX1BBR0VTXTsKKyAgICAgICAgICAgICAgIGludCBqOworCisgICAgICAgICAg
ICAgICBmb3IgKGogPSAwOyBqIDwgT05GSV9QQVJBTV9QQUdFUzsgaisrKQorICAgICAgICAgICAg
ICAgICAgICAgICBzcmNidWZzW2pdID0gcCArIGo7CiAKICAgICAgICAgICAgICAgIHByX3dhcm4o
IkNvdWxkIG5vdCBmaW5kIGEgdmFsaWQgT05GSSBwYXJhbWV0ZXIgcGFnZSwgdHJ5aW5nIGJpdC13
aXNlIG1ham9yaXR5IHRvIHJlY292ZXIgaXRcbiIpOwotICAgICAgICAgICAgICAgbmFuZF9iaXRf
d2lzZV9tYWpvcml0eShzcmNidWZzLCBBUlJBWV9TSVpFKHNyY2J1ZnMpLCBwLAorICAgICAgICAg
ICAgICAgbmFuZF9iaXRfd2lzZV9tYWpvcml0eShzcmNidWZzLCBPTkZJX1BBUkFNX1BBR0VTLCBw
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoKnApKTsKIAog
ICAgICAgICAgICAgICAgY3JjID0gb25maV9jcmMxNihPTkZJX0NSQ19CQVNFLCAodTggKilwLCAy
NTQpOwoKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
