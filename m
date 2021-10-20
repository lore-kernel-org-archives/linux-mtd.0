Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D24C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 12:19:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8886135E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 12:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F8886135E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jIvL6Z1EPWX2E4wetfuY87aTq8mzcltgUYeavygutk=; b=qmPbaOFUZ6ZF8M
	Q2KT2bgrmKFbfPrqez5d0zStyxUaLJGMkfHCWP8r/+BTiVYHrwWM85ilInwXC0oApSeA1yrn+W2jT
	srNYLVvEu3YfBs8qPVhX2TkYvz6TTqvhgm9bIpv7hBEGgplSRnImuFYsNLiVgoQsK4FBvOy+dLMFj
	g6qXoZkQ+Ejui5aXWhFfP/XvejVgnrRoHFaStesM+LI5ctFwV9Q4UTndz9VeaW8X3mIc59YrBrO+S
	TxJ5Qf70LafCDC26o1MwR/4hK4q9eCb7SUu68PCROt2AQbkFzZkda5rRJ2iINYw3I5MATD9HcKtPW
	gMeZY+N79LhDLyQvQTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdAYo-004TkV-1r; Wed, 20 Oct 2021 12:19:10 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdAYk-004Tjf-Ji
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 12:19:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6C1CD100005;
 Wed, 20 Oct 2021 12:18:56 +0000 (UTC)
Date: Wed, 20 Oct 2021 14:18:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Mark Brown <broonie@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Michael Walle <michael@walle.cc>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <20211020141855.75f0314d@xps13>
In-Reply-To: <20211020115913.uzo3ogkmrltnb26y@ti.com>
References: <20211013114432.31352-1-mika.westerberg@linux.intel.com>
 <20211013114432.31352-3-mika.westerberg@linux.intel.com>
 <20211020114153.0f99c5df@collabora.com>
 <20211020115913.uzo3ogkmrltnb26y@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_051906_809390_43A73A85 
X-CRM114-Status: GOOD (  29.48  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBXZWQsIDIwIE9jdCAyMDIxIDE3
OjI5OjE1ICswNTMwOgoKPiBPbiAyMC8xMC8yMSAxMTo0MUFNLCBCb3JpcyBCcmV6aWxsb24gd3Jv
dGU6Cj4gPiBPbiBXZWQsIDEzIE9jdCAyMDIxIDE0OjQ0OjMxICswMzAwCj4gPiBNaWthIFdlc3Rl
cmJlcmcgPG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gICAKPiA+
ID4gVGhlIHByZWZlcnJlZCB3YXkgdG8gaW1wbGVtZW50IFNQSS1OT1IgY29udHJvbGxlciBkcml2
ZXJzIGlzIHRocm91Z2ggU1BJCj4gPiA+IHN1YnN1YnN5c3RlbSB1dGlsaXppbmcgdGhlIFNQSSBN
RU0gY29yZSBmdW5jdGlvbnMuIFRoaXMgY29udmVydHMgdGhlCj4gPiA+IEludGVsIFNQSSBmbGFz
aCBjb250cm9sbGVyIGRyaXZlciBvdmVyIHRoZSBTUEkgTUVNIGJ5IG1vdmluZyB0aGUgZHJpdmVy
Cj4gPiA+IGZyb20gU1BJLU5PUiBzdWJzeXN0ZW0gdG8gU1BJIHN1YnN5c3RlbSBhbmQgaW4gb25l
IGdvIG1ha2UgaXQgdXNlIHRoZQo+ID4gPiBTUEkgTUVNIGZ1bmN0aW9ucy4gVGhlIGRyaXZlciBu
YW1lIHdpbGwgYmUgY2hhbmdlZCBmcm9tIGludGVsLXNwaSB0bwo+ID4gPiBzcGktaW50ZWwgdG8g
bWF0Y2ggdGhlIGNvbnZlbnRpb24gdXNlZCBpbiB0aGUgU1BJIHN1YnN5c3RlbS4KPiA+ID4gICAK
PiA+IAo+ID4gSSBza2ltbWVkIG92ZXIgdGhlIGRyaXZlciBjaGFuZ2VzLCBhbmQgSSdtIHNrZXB0
aWNhbCBhYm91dCB0aGlzICJsZXQncwo+ID4gY29udmVydCBhbGwgc3BpLW5vciBjb250cm9sbGVy
IGRyaXZlcnMgaW50byBzcGktbWVtIGRyaXZlcnMgZXZlbiBpZgo+ID4gdGhleSBkb24ndCBmaXQg
dGhlIHNwaS1tZW0gbW9kZWwiIHN0cmF0ZWd5LiBDbGVhcmx5LCB0aGUgaW50ZWwKPiA+IGNvbnRy
b2xsZXIgaXMgbXVjaCBtb3JlIGxpbWl0ZWQgdGhhbiBhbnkgb3RoZXIgc3BpLW1lbSBjb250cm9s
bGVyIChJCj4gPiBtZWFuIGZlYXR1cmUtd2lzZSBub3QgcGVyZi13aXNlIG9mIGNvdXJzZSkuIFRo
ZSBmYWN0IHRoYXQgeW91IGhhdmUgdG8KPiA+IGNoZWNrIHRoZSBvcGNvZGUgdG8gZGVjaWRlIHdo
ZXRoZXIgdGhlIG9wZXJhdGlvbiBpcyBzdXBwb3J0ZWQgb3Igbm90LAo+ID4gb3IgdGhlIHdheSB5
b3UgZGVkdWNlIHdoZW4gdG8gaXNzdWUgYW4gZXJhc2UgdnMgYSByZWd1bGFyIHJlYWQvd3JpdGUg
aXMKPiA+IGtpbmQgb2YgaGFjay1pc2guIE5vdCBzYXlpbmcgd2Ugc2hvdWxkbid0IHN1cHBvcnQg
dGhpcyBjYXNlIGluIHNwaS1tZW0sCj4gPiBidXQgaXQgc2hvdWxkIGF0IGxlYXN0IGJlIGRvbmUg
aW4gYSBtb3JlIGNvbnRyb2xsZWQgd2F5LiBNYXliZSB3aXRoIGFuCj4gPiBleHBsaWNpdCBhcnJh
eSBvZiBzdXBwb3J0ZWQgc3BpX21lbSBvcGVyYXRpb25zLCBhbmQgZHJpdmVyIHNwZWNpZmljCj4g
PiBob29rcyBmb3IgZWFjaCBvZiB0aGVzZSBvcGVyYXRpb25zIHNvIGFueXRoaW5nIGZhbGxpbmcg
b3V0c2lkZSBpcwo+ID4gY2xlYXJseSBpZGVudGlmaWVkIGFuZCByZWplY3RlZCAod2UgaGF2ZSB0
aGlzIHNvcnQgb2YgdGhpbmdzIGluIHRoZSByYXcKPiA+IE5BTkQgZnJhbWV3b3JrKS4gIAo+IAo+
IEkgYW0gY3VyaW91cyBhYm91dCBob3cgd2UgY2FuIHNvbHZlIHRoaXMuIEFueSBwb2ludGVycyB0
byAKPiBmdW5jdGlvbnMvZHJpdmVycyBpbiByYXcgTkFORCBmcmFtZXdvcmsgdGhhdCBmb2xsb3cg
dGhpcyBtb2RlbD8KCi0+ZXhlY19vcCgpIHNob3VsZCBiZSBpbXBsZW1lbnRlZCBieSBjb250cm9s
bGVyIGRyaXZlcnMsIHRoZXJlIGlzIGEKY2hlY2tfb25seSBmbGFnIHRvIHZlcmlmeSB0aGF0IHRo
ZSBvcGVyYXRpb24gaXMgc3VwcG9ydGVkIGJ5IHRoZQpjb250cm9sbGVyLCB0aGUgZW50aXJlIG9w
ZXJhdGlvbiBpcyBwcm92aWRlZCBzbyB0aGF0IHRoZSBjb250cm9sbGVyCmRyaXZlciBrbm93cyBl
eGFjdGx5IHdoZXJlIHdlIGFyZSBnb2luZyBhbmQgZG9lcyBub3QgdHJ5IHRvIGd1ZXNzCmFueXRo
aW5nLiBUaGVyZSBpcyBhbHNvIGEgcGFyc2VyIGluIHRoZSBjb3JlIHRoYXQgYWxsb3dzCiJjb21w
bGljYXRlZCIvImNvbnN0cmFpbmVkIiBkcml2ZXJzIHRvIGp1c3QgZ2l2ZSBhIG51bWJlciBvZiBw
YXR0ZXJucwp0aGV5IHN1cHBvcnQgYW5kIHRoZSBwYXJzZXIgd2lsbCBkbyB0aGUgam9iIG9mIGZp
bmRpbmcgaG93IHRoZQpvcGVyYXRpb24gc2hvdWxkIGJlIHNwbGl0LgoKSSBiZWxpZXZlIHRoaXMg
d2FzIHdoYXQgQm9yaXMgcmVmZXJyZWQgdG8uIElmIG5vdCwgcGxlYXNlIGNvcnJlY3QgbWUuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
