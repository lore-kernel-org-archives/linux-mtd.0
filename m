Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB4EC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 08:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wcpz5YP/mTRip9bFn5vFDMaWYNPl7Fwxrnx6ipR4R/A=; b=YTUD6d9zp16YVg
	yBWl/KNq7rovHivSgp3qxeblaNtdWUS+KCjFm5yV7WnVMHDT3S98ca8w6l1pDvfKlWfV78r5D8zYN
	gkX9qjUJOwfBbeopGLN1zk1LwAo0ZJELa0/eh8Zrtj7Cej6ex6q67kqegHNTVjKE0M7WCsoXYRTQX
	2PQtyGDiKB/I42laMds2XNoQvgdmXt0qvfXQz2J2p3jL4ENYfiCqgobCwyCtLgXPiPwNT3d9Ej09S
	8gvj5TGYPmij2EKJwsTNaWEXaqrMLyXb1Yinfvh8SKICuQsME0SHrEn3PZlLhvumC6YlxKXJiLDJu
	g7SwtIaliXJUW3+F8SZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWvxS-00D2oO-1x; Wed, 23 Mar 2022 08:03:06 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWvxO-00D2ns-R9
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 08:03:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EDC91C0002;
 Wed, 23 Mar 2022 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648022579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9sVDkIiOMdy3kH3SuKZF9DD/nNXHOdSC209DztGJaKs=;
 b=oQawn6kounG/xhSwpVw2H5HhT90tWQpGkNxEWe5bjG1d9UGWDhIw09ohxLk72FTh8I1ng3
 3WVIDsnvy2O/E2oPWpdnIgIubigvngeRp7iNpESrq+gwvh0kK1uGUrKTJRz83gr3amruK5
 1PSEIGxEqcuYqXskYvx7VJK07xQ5eEQ3AI93ti+sn3LcHsN604WwIGAMRez0jN9uvxq6W9
 dFAP0NQesigfGpCBuVWFJFzNT7F1S5mdKAYFD2HkWvBUCZWLHKGLdOmbWIUOpMn3s/RHJ8
 aAYjZbID47ijhqj9ZhKLE3yBcim8C6ILRjewZhNbDH15stNj5eHdnegsBZM9Cg==
Date: Wed, 23 Mar 2022 09:02:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v6 3/3] mtd: cfi_cmdset_0002: Rename chip_ready
 variables and add ID definition
Message-ID: <20220323090257.298130d3@xps13>
In-Reply-To: <20220322234952.25520-1-ikegami.t@gmail.com>
References: <20220322234952.25520-1-ikegami.t@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_010303_414150_251DD92A 
X-CRM114-Status: GOOD (  21.09  )
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

SGkgVG9rdW5vcmksCgppa2VnYW1pLnRAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMjMgTWFyIDIw
MjIgMDg6NDk6NTIgKzA5MDA6Cgo+IFRoZSBkZWZpbml0aW9uIGlzIGZvciB0aGUgUzI5R0wwNjRO
IG1vZGVsIG51bWJlciAwMSwgMDIsIFYxIGFuZCBWMi4KClBsZWFzZSBrZWVwIHJlc2VuZGluZyB0
aGUgZW50aXJlIHNlcmllcy4KCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9rdW5vcmkgSWtlZ2FtaSA8
aWtlZ2FtaS50QGdtYWlsLmNvbT4KPiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KPiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiBD
YzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+IENjOiBsaW51eC1tdGRA
bGlzdHMuaW5mcmFkZWFkLm9yZwoKWW91IGRvbid0IG5lZWQgYWxsIHRoZXNlIENjIHRoZXJlLCBq
dXN0IGFkZCB0aGVtIHdoZW4gc2VuZGluZwpldmVyeXRoaW5nIHdpdGggZ2l0LWZvcm1hdC1wYXRj
aC4gSSBiZWxpZXZlIHlvdSBjYW4gdXNlIHRoZXNlIGZpZWxkcwpqdXN0IGZvciAiZXh0cmEiIHBl
b3BsZSB3aGljaCBhcmUgbm90IG5vdGFibHkgZXhwZWN0ZWQuCgo+IC0tLQo+ICBkcml2ZXJzL210
ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYyB8IDE5ICsrKysrKysrKystLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIGIvZHJpdmVycy9tdGQv
Y2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiBpbmRleCA1OTMzNDUzMGRkNDYuLjY3NDUzZjU5YzY5
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gQEAgLTQ4LDYgKzQ4LDcg
QEAKPiAgI2RlZmluZSBTU1Q0OUxGMDQwQgkJMHgwMDUwCj4gICNkZWZpbmUgU1NUNDlMRjAwOEEJ
CTB4MDA1YQo+ICAjZGVmaW5lIEFUNDlCVjY0MTYJCTB4MDBkNgo+ICsjZGVmaW5lIFMyOUdMMDY0
Tl9NTjEyCQkweDBjMDEKPiAgCj4gIC8qCj4gICAqIFN0YXR1cyBSZWdpc3RlciBiaXQgZGVzY3Jp
cHRpb24uIFVzZWQgYnkgZmxhc2ggZGV2aWNlcyB0aGF0IGRvbid0Cj4gQEAgLTQ0NSw3ICs0NDYs
NyBAQCBzdGF0aWMgdm9pZCBmaXh1cF9xdWlya3Moc3RydWN0IG10ZF9pbmZvICptdGQpCj4gIAlz
dHJ1Y3QgbWFwX2luZm8gKm1hcCA9IG10ZC0+cHJpdjsKPiAgCXN0cnVjdCBjZmlfcHJpdmF0ZSAq
Y2ZpID0gbWFwLT5mbGRydl9wcml2Owo+ICAKPiAtCWlmIChjZmktPm1mciA9PSBDRklfTUZSX0FN
RCAmJiBjZmktPmlkID09IDB4MGMwMSkKPiArCWlmIChjZmktPm1mciA9PSBDRklfTUZSX0FNRCAm
JiBjZmktPmlkID09IFMyOUdMMDY0Tl9NTjEyKQo+ICAJCWNmaS0+cXVpcmtzIHw9IENGSV9RVUlS
S19EUV9UUlVFX0RBVEE7Cj4gIH0KPiAgCj4gQEAgLTQ3NSw3ICs0NzYsNyBAQCBzdGF0aWMgc3Ry
dWN0IGNmaV9maXh1cCBjZmlfZml4dXBfdGFibGVbXSA9IHsKPiAgCXsgQ0ZJX01GUl9BTUQsIDB4
MDA1NiwgZml4dXBfdXNlX3NlY3NpIH0sCj4gIAl7IENGSV9NRlJfQU1ELCAweDAwNUMsIGZpeHVw
X3VzZV9zZWNzaSB9LAo+ICAJeyBDRklfTUZSX0FNRCwgMHgwMDVGLCBmaXh1cF91c2Vfc2Vjc2kg
fSwKPiAtCXsgQ0ZJX01GUl9BTUQsIDB4MGMwMSwgZml4dXBfczI5Z2wwNjRuX3NlY3RvcnMgfSwK
PiArCXsgQ0ZJX01GUl9BTUQsIFMyOUdMMDY0Tl9NTjEyLCBmaXh1cF9zMjlnbDA2NG5fc2VjdG9y
cyB9LAo+ICAJeyBDRklfTUZSX0FNRCwgMHgxMzAxLCBmaXh1cF9zMjlnbDA2NG5fc2VjdG9ycyB9
LAo+ICAJeyBDRklfTUZSX0FNRCwgMHgxYTAwLCBmaXh1cF9zMjlnbDAzMm5fc2VjdG9ycyB9LAo+
ICAJeyBDRklfTUZSX0FNRCwgMHgxYTAxLCBmaXh1cF9zMjlnbDAzMm5fc2VjdG9ycyB9LAo+IEBA
IC04MzMsNyArODM0LDcgQEAgc3RhdGljIGludCBfX3hpcHJhbSBjaGlwX3JlYWR5KHN0cnVjdCBt
YXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAo+ICAJCQkgICAgICAgdW5zaWduZWQg
bG9uZyBhZGRyLCBtYXBfd29yZCAqZXhwZWN0ZWQpCj4gIHsKPiAgCXN0cnVjdCBjZmlfcHJpdmF0
ZSAqY2ZpID0gbWFwLT5mbGRydl9wcml2Owo+IC0JbWFwX3dvcmQgZCwgdDsKPiArCW1hcF93b3Jk
IG9sZGQsIGN1cmQ7CgpBbGwgdGhlIGNoYW5nZXMgaGVyZSBhbmQgYmVsb3cgaGF2ZSBub3RoaW5n
IHRvIGRvIHdpdGggdGhpcyBjb21taXQuIFlvdQpjYW4gcmVuYW1lIHZhcmlhYmxlcyBpZiB5b3Ug
d2lzaCwgYnV0IHRoYXQgaXMgYSBzZXBhcmF0ZSBjb21taXQuCgo+ICAJaW50IHJldDsKPiAgCj4g
IAlpZiAoY2ZpX3VzZV9zdGF0dXNfcmVnKGNmaSkpIHsKPiBAQCAtODQ0LDIwICs4NDUsMjAgQEAg
c3RhdGljIGludCBfX3hpcHJhbSBjaGlwX3JlYWR5KHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1
Y3QgZmxjaGlwICpjaGlwLAo+ICAJCSAqLwo+ICAJCWNmaV9zZW5kX2dlbl9jbWQoMHg3MCwgY2Zp
LT5hZGRyX3VubG9jazEsIGNoaXAtPnN0YXJ0LCBtYXAsIGNmaSwKPiAgCQkJCSBjZmktPmRldmlj
ZV90eXBlLCBOVUxMKTsKPiAtCQl0ID0gbWFwX3JlYWQobWFwLCBhZGRyKTsKPiArCQljdXJkID0g
bWFwX3JlYWQobWFwLCBhZGRyKTsKPiAgCj4gLQkJcmV0dXJuIG1hcF93b3JkX2FuZGVxdWFsKG1h
cCwgdCwgcmVhZHksIHJlYWR5KTsKPiArCQlyZXR1cm4gbWFwX3dvcmRfYW5kZXF1YWwobWFwLCBj
dXJkLCByZWFkeSwgcmVhZHkpOwo+ICAJfQo+ICAKPiAtCWQgPSBtYXBfcmVhZChtYXAsIGFkZHIp
Owo+IC0JdCA9IG1hcF9yZWFkKG1hcCwgYWRkcik7Cj4gKwlvbGRkID0gbWFwX3JlYWQobWFwLCBh
ZGRyKTsKPiArCWN1cmQgPSBtYXBfcmVhZChtYXAsIGFkZHIpOwo+ICAKPiAtCXJldCA9IG1hcF93
b3JkX2VxdWFsKG1hcCwgZCwgdCk7Cj4gKwlyZXQgPSBtYXBfd29yZF9lcXVhbChtYXAsIG9sZGQs
IGN1cmQpOwo+ICAKPiAgCWlmICghcmV0IHx8ICFleHBlY3RlZCkKPiAgCQlyZXR1cm4gcmV0Owo+
ICAKPiAtCXJldHVybiBtYXBfd29yZF9lcXVhbChtYXAsIHQsICpleHBlY3RlZCk7Cj4gKwlyZXR1
cm4gbWFwX3dvcmRfZXF1YWwobWFwLCBjdXJkLCAqZXhwZWN0ZWQpOwo+ICB9Cj4gIAo+ICBzdGF0
aWMgaW50IF9feGlwcmFtIGNoaXBfZ29vZChzdHJ1Y3QgbWFwX2luZm8gKm1hcCwgc3RydWN0IGZs
Y2hpcCAqY2hpcCwKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
