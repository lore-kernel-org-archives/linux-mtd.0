Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB40C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 19:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFC0F20657
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 19:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r0OOJwSK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFC0F20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yR7oXubBLi7a9jaEqWqZ8HAcN6pajSTh6O/lHEPYr5Q=; b=r0OOJwSKVTttnD
	K7F2uOl7A4rQGWAnD6RT7tqku7sEDIfjNpNTI9pxt+h8xLvHT3FgcZXX9lUQt2TvROXgsiPJpSijT
	nodswLqulhibO57q+3S/kfksJnuSw8OyE98mGxCFwT5TAi6fa5ROijHV40nxx4m41ofN2P9SLxCbr
	pXtEyEVspTh6Q2HISZO+0YZOyNsjqPtuEi1Gqvehtf81NzAIbeySMPS6XGmcdg4s/Ck7ZMr2dRUNr
	c3oIxmnbkKGZ2DMpCukgs2q0FEw6MWlBaiCSp+UknyROlFSmFzZgVPlCloV4NR8dDyfvML9efjHYO
	y7qNvO3fnBXoIAoof2Lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jalsk-0001SI-8e; Mon, 18 May 2020 19:57:02 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jalsd-0001P6-I9
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 19:57:00 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D6A89200005;
 Mon, 18 May 2020 19:56:50 +0000 (UTC)
Date: Mon, 18 May 2020 21:56:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: Re: [PATCH] mtd: Fix mtd not registered due to nvmem name collision
Message-ID: <20200518215649.5273b132@xps13>
In-Reply-To: <CAPybu_3D5p7P5ND5qb8-2QmaQhQuvdEbiNKkeK5PbHdF3s-2Fg@mail.gmail.com>
References: <20200430131721.360064-1-ricardo@ribalda.com>
 <20200504104339.31b4a858@xps13>
 <CAPybu_3D5p7P5ND5qb8-2QmaQhQuvdEbiNKkeK5PbHdF3s-2Fg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_125655_882312_0102608F 
X-CRM114-Status: GOOD (  23.23  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, Alban Bedel <albeu@free.fr>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljYXJkbywKClJpY2FyZG8gUmliYWxkYSBEZWxnYWRvIDxyaWNhcmRvQHJpYmFsZGEuY29t
PiB3cm90ZSBvbiBNb24sIDE4IE1heSAyMDIwCjE2OjAxOjQ3ICswMjAwOgoKPiBIaQo+IAo+IFRo
aXMgaXMganVzdCBhIGZyaWVuZGx5IHBpbmcgYWZ0ZXIgdHdvIHdlZWtzIDspCgpEb24ndCB3b3Jy
eSwgaXQncyBpbiB0aGUgcGlwZSA6KQoKPiAKPiBPbiBNb24sIE1heSA0LCAyMDIwIGF0IDEwOjQ0
IEFNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4K
PiA+IEhpIFJpY2hhcmQsCj4gPgo+ID4gUmljYXJkbyBSaWJhbGRhIERlbGdhZG8gPHJpY2FyZG9A
cmliYWxkYS5jb20+IHdyb3RlIG9uIFRodSwgMzAgQXByIDIwMjAKPiA+IDE1OjE3OjIxICswMjAw
Ogo+ID4gIAo+ID4gPiBGcm9tOiBSaWNhcmRvIFJpYmFsZGEgRGVsZ2FkbyA8cmliYWxkYUBrZXJu
ZWwub3JnPgo+ID4gPgo+ID4gPiBXaGVuIHRoZSBudm1lbSBmcmFtZXdvcmsgaXMgZW5hYmxlZCwg
YSBudm1lbSBkZXZpY2UgaXMgY3JlYXRlZCBwZXIgbXRkCj4gPiA+IGRldmljZS9wYXJ0aXRpb24u
Cj4gPiA+Cj4gPiA+IEl0IGlzIG5vdCB1bmNvbW1vbiB0aGF0IGEgZGV2aWNlIGNhbiBoYXZlIG11
bHRpcGxlIG10ZCBkZXZpY2VzIHdpdGgKPiA+ID4gcGFydGl0aW9ucyB0aGF0IGhhdmUgdGhlIHNh
bWUgbmFtZS4gRWcsIHdoZW4gdGhlcmUgRFQgb3ZlcmxheSBpcyBhbGxvd2VkCj4gPiA+IGFuZCB0
aGUgc2FtZSBkZXZpY2Ugd2l0aCBtdGQgaXMgYXR0YWNoZWQgdHdpY2UuCj4gPiA+Cj4gPiA+IFVu
ZGVyIHRoYXQgY2lyY3Vtc3RhbmNlcywgdGhlIG10ZCBmYWlscyB0byByZWdpc3RlciBkdWUgdG8g
YSBuYW1lCj4gPiA+IGR1cGxpY2F0aW9uIG9uIHRoZSBudm1lbSBmcmFtZXdvcmsuCj4gPiA+Cj4g
PiA+IFdpdGggdGhpcyBwYXRjaCB3ZSB1c2UgdGhlIG10ZFggbmFtZSBpbnN0ZWFkIG9mIHRoZSBw
YXJ0aXRpb24gbmFtZSwKPiA+ID4gd2hpY2ggaXMgdW5pcXVlLgo+ID4gPgo+ID4gPiBbICAgIDgu
OTQ4OTkxXSBzeXNmczogY2Fubm90IGNyZWF0ZSBkdXBsaWNhdGUgZmlsZW5hbWUgJy9idXMvbnZt
ZW0vZGV2aWNlcy9Qcm9kdWN0aW9uIERhdGEnCj4gPiA+IFsgICAgOC45NDg5OTJdIENQVTogNyBQ
SUQ6IDI0NiBDb21tOiBzeXN0ZW1kLXVkZXZkIE5vdCB0YWludGVkIDUuNS4wLXF0ZWMtc3RhbmRh
cmQgIzEzCj4gPiA+IFsgICAgOC45NDg5OTNdIEhhcmR3YXJlIG5hbWU6IEFNRCBEaWJibGVyL0Rp
YmJsZXIsIEJJT1MgMDUuMjIuMDQuMDAxOSAxMC8yNi8yMDE5Cj4gPiA+IFsgICAgOC45NDg5OTRd
IENhbGwgVHJhY2U6Cj4gPiA+IFsgICAgOC45NDg5OTZdICBkdW1wX3N0YWNrKzB4NTAvMHg3MAo+
ID4gPiBbICAgIDguOTQ4OTk4XSAgc3lzZnNfd2Fybl9kdXAuY29sZCsweDE3LzB4MmQKPiA+ID4g
WyAgICA4Ljk0OTAwMF0gIHN5c2ZzX2RvX2NyZWF0ZV9saW5rX3NkLmlzcmEuMCsweGMyLzB4ZDAK
PiA+ID4gWyAgICA4Ljk0OTAwMl0gIGJ1c19hZGRfZGV2aWNlKzB4NzQvMHgxNDAKPiA+ID4gWyAg
ICA4Ljk0OTAwNF0gIGRldmljZV9hZGQrMHgzNGIvMHg4NTAKPiA+ID4gWyAgICA4Ljk0OTAwNl0g
IG52bWVtX3JlZ2lzdGVyLnBhcnQuMCsweDFiZi8weDY0MAo+ID4gPiAuLi4KPiA+ID4gWyAgICA4
Ljk0ODkyNl0gbXRkIG10ZDg6IEZhaWxlZCB0byByZWdpc3RlciBOVk1FTSBkZXZpY2UKPiA+ID4K
PiA+ID4gRml4ZXM6IGM0ZGZhMjVhYjMwNyAoIm10ZDogYWRkIHN1cHBvcnQgZm9yIHJlYWRpbmcg
TVREIGRldmljZXMgdmlhIHRoZSBudm1lbSBBUEkiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSaWNh
cmRvIFJpYmFsZGEgRGVsZ2FkbyA8cmliYWxkYUBrZXJuZWwub3JnPgo+ID4gPiAtLS0KPiA+ID4g
IGRyaXZlcnMvbXRkL210ZGNvcmUuYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiA+IGluZGV4IDI5MTY2
NzQyMDhiMy4uMjlkNDEwMDNkNmUwIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRj
b3JlLmMKPiA+ID4gKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiA+IEBAIC01NTUsNyAr
NTU1LDcgQEAgc3RhdGljIGludCBtdGRfbnZtZW1fYWRkKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+
ID4gPgo+ID4gPiAgICAgICBjb25maWcuaWQgPSAtMTsKPiA+ID4gICAgICAgY29uZmlnLmRldiA9
ICZtdGQtPmRldjsKPiA+ID4gLSAgICAgY29uZmlnLm5hbWUgPSBtdGQtPm5hbWU7Cj4gPiA+ICsg
ICAgIGNvbmZpZy5uYW1lID0gZGV2X25hbWUoJm10ZC0+ZGV2KTsKPiA+ID4gICAgICAgY29uZmln
Lm93bmVyID0gVEhJU19NT0RVTEU7Cj4gPiA+ICAgICAgIGNvbmZpZy5yZWdfcmVhZCA9IG10ZF9u
dm1lbV9yZWdfcmVhZDsKPiA+ID4gICAgICAgY29uZmlnLnNpemUgPSBtdGQtPnNpemU7ICAKPiA+
Cj4gPiBXZSBob3BlIHRoaXMgd2lsbCBkZWZpbml0ZWx5IGZpeCB0aGUgTlZNRU0gZHVwbGljYXRl
IG5hbWUgaXNzdWUuIElmIGl0Cj4gPiBkb2VzIG5vdCByZWxpYWJseSwgd2UgbWlnaHQgd2FudCB0
byByZXZlcnQgdGhpcyBwYXRjaCBhbmQgY3JlYXRlIGFuIE1URAo+ID4gdW5pcXVlIElEIGZpZWxk
IHdoaWNoLCBmb3IgZWFjaCBNVEQgZGV2aWNlLCBjb25jYXRlbmF0ZXMgdGhlIG5hbWUgb2YKPiA+
IGl0cyBwYXJlbnQgYW5kIGl0cyBvd24gbXRkLT5uYW1lLgo+ID4KPiA+IEFja2VkLWJ5OiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4KPiA+IFRoYW5rcywKPiA+
IE1pcXXDqGwgIAo+IAo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
