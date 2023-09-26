Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D52E7E644
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Sep 2023 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmyXc8L3XPzXvCwWAq/wT40b06FlJr20/IO/Rv4JM9I=; b=WQLRN38k9YmHSy
	tf1f6L7WFoZwVQp0Z/kCMDpTbJesMrvrlfgS0o4+wV9Tt6ahNgqVUoGFOz55yiBOxdRAvYqqsbC5O
	kIwrbUCkUSPTKySz/h82M2V3/98euQX2uy9Sc5959jIOlnTMw+vwQq8dvFlr4xVEYiJfuewVxJEq2
	x/LLs8jEIU0zo2jqyEKfk1O2GHRcHnFSbw3xOTOlCNwHk4ldWWclNEYdLKCVRxF5nHK75ifaDhOyS
	GbwVA+fwUsYIvAvtdZVMTDgxmBudJHDB4tmlbYu9zmrrBkD0SDXPrnOoCrXhi19pz3KCR1FLfAMzt
	MtzJBhp17e7YGwYwMf4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9YD-00Gasl-2F;
	Tue, 26 Sep 2023 15:00:37 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9YA-00GasG-1g
	for linux-mtd@lists.infradead.org;
	Tue, 26 Sep 2023 15:00:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29229C000A;
	Tue, 26 Sep 2023 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695740429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuPGXLVaSDHXAHbIs3PBMkUJ0VTgpIqbXQr/JvmT/A0=;
	b=ivss2K8J2OaaCadLDsrUyzCskrQfx0O4W92qee1tNrZCmKMLTQmOjYxLl8KUL8ebR+iTRf
	+ZDs8U9FnVJR2GIg3wBtW8YpgUAIbir14e3HJfpejusJMgW5CDkHwHRx23u4ys3ZwCPRHW
	eMm4vexQSL5mHk7Nvxd3Bsq8A8GqfWp6N8gaQICh5I6+Mpinvln+/hmUSijBIO7tWNTuvl
	P3L3m0CVWFGGEYncvu/WvZqhT147236fRRBSTzXdIOhNUbocN3dPCZdD2Srj7BzjE4ONaE
	mVY8/aor9JfJ+8he+Nt3PuXtXbEdEAuPKljnZ+Ygfm/Cs1GtGNXGef2+N2ETrg==
Date: Tue, 26 Sep 2023 17:00:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: <vigneshr@ti.com>, <git@amd.com>, <michal.simek@amd.com>,
 <richard@nod.at>, <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <akumarma@amd.com>,
 <amitrkcian2002@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: arasan: Check for bitflips in page data &
 its ECC data
Message-ID: <20230926170025.298663fd@xps-13>
In-Reply-To: <20230926121352.2250115-1-amit.kumar-mahapatra@amd.com>
References: <20230926121352.2250115-1-amit.kumar-mahapatra@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_080035_012399_C491A099 
X-CRM114-Status: GOOD (  22.03  )
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

SGkgQW1pdCwKCmFtaXQua3VtYXItbWFoYXBhdHJhQGFtZC5jb20gd3JvdGUgb24gVHVlLCAyNiBT
ZXAgMjAyMyAxNzo0Mzo1MiArMDUzMDoKCj4gRHVyaW5nIHBhZ2UgcmVhZCBpbiBIVy1FQ0MgbW9k
ZSB0aGUgZHJpdmVyIGNoZWNrcyBmb3IgYml0ZmxpcHMgdG8gY29uZmlybQo+IHRoYXQgdGhlIHBh
Z2UgaXMgZXJhc2VkIG9uZSBvciBub3QsIGN1cnJlbnRseSB0aGlzIGNoZWNrIGlzIG9ubHkgZm9y
IHBhZ2UKPiBkYXRhIGFuZCBub3QgZm9yIEVDQyBkYXRhIG9mIHRoYXQgcGFnZS4gRHVlIHRvIHRo
aXMsIGluIGNhc2Ugb2YgRUNDCj4gY29ycnVwdGlvbiwgdGhlIGRyaXZlciBjb25zaWRlcnMgc29t
ZSBvZiB0aGUgcGFnZSBkYXRhIGFzIGVyYXNlZCBwYWdlIGRhdGEKPiBhbmQgb3ZlcndyaXRlcyB0
aGUgdmFsaWQgZGF0YSB3aXRoIDB4RkYuIFVwZGF0ZSB0aGUgZHJpdmVyIHRvIGluY2x1ZGUgdGhl
Cj4gRUNDIGJpdGZsaXBzIGNoZWNrIGFsb25nIHdpdGggcGFnZSBkYXRhIHdoaWxlIGNoZWNraW5n
IGZvciBlcmFzZWQgRUNDIGRhdGEKPiBjaHVuay4KClRoZSBkaWZmIGJlbG93IGlzIGZpbmUgYnV0
IHRoZSBjb21taXQgbG9nIGlzIHdyb25nLiBJIHdvdWxkIHByb3Bvc2U6CgoiCkZvbGxvd2luZyBh
biBFQ0MgZmFpbHVyZSBjb25kaXRpb24gdXBvbiBwYWdlIHJlYWRzLCB3ZSBzaGFsbCBkaXN0aW5n
dWlzaApiZXR3ZWVuIGEgcmVhbCBFQ0MgZmFpbHVyZSBhbmQgYW4gZW1wdHkgcGFnZS4gVGhpcyBp
cyBoYW5kbGVkIHdpdGggYQpjYWxsIHRvIG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuaygpIHdo
aWNoIGxvb2tzIGF0IHRoZSBkYXRhIGFuZApjb3VudHMgdGhlIG51bWJlciBvZiBiaXRzIHdoaWNo
IGFyZSBub3QgJ29uZXMnLiBJZiB3ZSBnZXQgbGVzcyB6ZXJvcwp0aGFuIHRoZSBFQ0Mgc3RyZW5n
dGgsIHdlIGFzc3VtZSB0aGUgcGFnZSB3YXMgZXJhc2VkIGFuZCB3ZSBhcmUgaW4gdGhlCnByZXNl
bmNlIG9mIG5hdHVyYWwgYml0ZmxpcHMuIE90aGVyd2lzZSwgaWYgd2UgYXJlIGFib3ZlLCB3ZSBh
c3N1bWUKc29tZSBkYXRhIHdhcyB3cml0dGVuIGFuZCB0aGUgRUNDIGVuZ2luZSBjb3VsZCBub3Qg
cmVjb3ZlciBpdCBhbGwsIHNvIHdlCnJlcG9ydCBhbiBFQ0MgZmFpbHVyZS4KCkluIG9yZGVyIGZv
ciB0aGlzIGxvZ2ljIHRvIGJlIGFzIGNsb3NlIGFzIHRoZSByZWFsaXR5IGFzIHdlIGNhbiAodGhp
cwppcyBhbHJlYWR5IGEgc2ltcGxpZmllZCBjb25kaXRpb24gYnV0IHdlIGNhbiBoYXJkbHkgYmUg
bW9yZSBwcmVjaXNlKSwgd2UKc2hvdWxkIGNoZWNrIGFsbCB0aGUgZGF0YSB0aGF0IGlzIGNvdmVy
ZWQgYnkgdGhlIEVDQyBzdGVwIG5vdCBvbmx5IHRoZQppbi1iYW5kIGRhdGEsIHNvIHdlIHNob3Vs
ZCBhbHNvIGluY2x1ZGUgdGhlIEVDQyBzeW5kcm9tZSBpbiB0aGUgY2hlY2suCiIKCkluIHByYWN0
aWNlIGl0J3MgdW5saWtlbHkgdGhhdCB0aGlzIHdpbGwgbWFrZSBhIHJlYWwgZGlmZmVyZW5jZSB1
bmxlc3MKdGhlIE5BTkQgY2hpcCBpcyBvbGQvd2VhcmVkLCBidXQgaXQncyBkZWZpbml0ZWx5IHdv
cnRoIGFkZGluZy4KCj4gRml4ZXM6IDg4ZmZlZjFiNjVjZiAoIm10ZDogcmF3bmFuZDogYXJhc2Fu
OiBTdXBwb3J0IHRoZSBoYXJkd2FyZSBCQ0ggRUNDIGVuZ2luZSIpCj4gU2lnbmVkLW9mZi1ieTog
QW1pdCBLdW1hciBNYWhhcGF0cmEgPGFtaXQua3VtYXItbWFoYXBhdHJhQGFtZC5jb20+Cj4gLS0t
Cj4gQlJBTkNIOiBuYW5kL25leHQKPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2Fu
LW5hbmQtY29udHJvbGxlci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
YXJhc2FuLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5h
bmQtY29udHJvbGxlci5jCj4gaW5kZXggNDYyMWVjNTQ5Y2M3Li41NDdjYzgyYjVkODAgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jCj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jCj4gQEAg
LTQ4MSw3ICs0ODEsNyBAQCBzdGF0aWMgaW50IGFuZmNfcmVhZF9wYWdlX2h3X2VjYyhzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLCB1OCAqYnVmLAo+ICAJCX0KPiAgCj4gIAkJYmYgPSBuYW5kX2NoZWNr
X2VyYXNlZF9lY2NfY2h1bmsocmF3X2J1ZiwgY2hpcC0+ZWNjLnNpemUsCj4gLQkJCQkJCSBOVUxM
LCAwLCBOVUxMLCAwLAo+ICsJCQkJCQkgYW5hbmQtPmh3X2VjYywgY2hpcC0+ZWNjLmJ5dGVzLCBO
VUxMLCAwLAo+ICAJCQkJCQkgY2hpcC0+ZWNjLnN0cmVuZ3RoKTsKPiAgCQlpZiAoYmYgPiAwKSB7
Cj4gIAkJCW10ZC0+ZWNjX3N0YXRzLmNvcnJlY3RlZCArPSBiZjsKCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
