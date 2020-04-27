Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FE5C4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:51:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6396206B8
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rYVd5Lyn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6396206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFON4P69qU6MUG/BJm402PV3w5wat8eXvetHvLWr7Gk=; b=rYVd5LynGGyvIM
	WT+acn4JtH6GyyLUCSsZM1fuwtuX1kyiiBQG9YaSROaNW7diT0AKzfyjtV4i3Icw2DM7so/sG11xX
	veYUTS2x2XmGMYF089dn9pdZGjDQqLjlXPDz+TNn4ZbE1J8u+tTCaY/UNAVvMFRNQRduC2eXDjKQS
	9MKnq+a/AyHShiJ0gp5KGyYEC8vKGSAU6pX+ihhaN0IyQZoV70VvSAwtkyFDWxPbkYhJ1o+6YE5lM
	OkmhWV2QZ868Fk0Cien95n8tdFrk8gldVwx5YMnGcKPu2Olbo73RpfKJKh1VRjTPVh2jEUehybNWy
	psS+xXiPl7AvvhuuMdUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9n1-0005j6-Eg; Mon, 27 Apr 2020 19:51:39 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9my-0005iK-EW
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:51:37 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 58C2520002;
 Mon, 27 Apr 2020 19:51:33 +0000 (UTC)
Date: Mon, 27 Apr 2020 21:51:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 11/17] mtd: rawnand: cafe: Don't leave ECC enabled in
 the write path
Message-ID: <20200427215132.1331d4f5@xps13>
In-Reply-To: <20200427082028.394719-12-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-12-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_125136_622884_A9FACD1D 
X-CRM114-Status: GOOD (  15.22  )
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
PiB3cm90ZSBvbiBNb24sIDI3IEFwcgoyMDIwIDEwOjIwOjIxICswMjAwOgoKPiBjYWZlX25hbmRf
d3JpdGVfcGFnZV9sb3dsZXZlbCgpIHNldHMgdGhlIEVDQyBhdXRvLWdlbmVyYXRpb24gZmxhZyBi
dXQKCklJUkMgeW91IHJlbmFtZWQgdGhpcyBmdW5jdGlvbiBpbiBwYXRjaCAxIHNvIG5vdyBpdCBp
cyBuYW1lZAoiX3dyaXRlX3BhZ2UoKSIuCgo+IG5ldmVyIGNsZWFycyBpdCwgdGh1cyBmb3JjaW5n
IHRoZSBjYWZlX25hbmRfY21kZnVuYygpIHRvIGNsZWFyIGl0Cj4gaW4gY2VydGFpbiBjaXJjdW1z
dGFuY2VzLiBMZXQncyBqdXN0IGNsZWFyIHRoaXMgZmxhZyBpbgo+IGNhZmVfbmFuZF93cml0ZV9w
YWdlX2xvd2xldmVsKCkgaW5zdGVhZC4KClNhbWUgaGVyZSAgICAgICAgICAgICAgXgoKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYyB8IDExICsrKysr
KysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMKPiBpbmRleCAyODI1NDg5YTcxYjguLjMxNDkz
YTIwMWEwMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYwo+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jCj4gQEAgLTI2MSw3ICsyNjEs
NiBAQCBzdGF0aWMgdm9pZCBjYWZlX25hbmRfY21kZnVuYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlw
LCB1bnNpZ25lZCBjb21tYW5kLAo+ICAJCQkgICAgQ0FGRV9GSUVMRF9QUkVQKE5BTkRfQ1RSTDIs
IENNRDIsIGNvbW1hbmQpLAo+ICAJCQkgICAgTkFORF9DVFJMMik7Cj4gIAkJY3RsMSA9IGNhZmUt
PmN0bDE7Cj4gLQkJY2FmZS0+Y3RsMiAmPSB+Q0FGRV9OQU5EX0NUUkwyX0FVVE9fV1JJVEVfRUND
Owo+ICAJCWRldl9kYmcoJmNhZmUtPnBkZXYtPmRldiwgIkNvbnRpbnVlIGNvbW1hbmQsIGN0bDEg
JTA4eCwgI2RhdGEgJWRcbiIsCj4gIAkJCWNhZmUtPmN0bDEsIGNhZmUtPm5yX2RhdGEpOwo+ICAJ
CWdvdG8gZG9fY29tbWFuZDsKPiBAQCAtNjQzLDYgKzY0Miw3IEBAIHN0YXRpYyBpbnQgY2FmZV9u
YW5kX3dyaXRlX3BhZ2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgewo+ICAJc3RydWN0IG10
ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiAgCXN0cnVjdCBjYWZlX3ByaXYgKmNh
ZmUgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gKwlpbnQgcmV0Owo+ICAKPiAg
CW5hbmRfcHJvZ19wYWdlX2JlZ2luX29wKGNoaXAsIHBhZ2UsIDAsIGJ1ZiwgbXRkLT53cml0ZXNp
emUpOwo+ICAJY2hpcC0+bGVnYWN5LndyaXRlX2J1ZihjaGlwLCBjaGlwLT5vb2JfcG9pLCBtdGQt
Pm9vYnNpemUpOwo+IEBAIC02NTAsNyArNjUwLDE0IEBAIHN0YXRpYyBpbnQgY2FmZV9uYW5kX3dy
aXRlX3BhZ2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgCS8qIFNldCB1cCBFQ0MgYXV0b2dl
bmVyYXRpb24gKi8KPiAgCWNhZmUtPmN0bDIgfD0gQ0FGRV9OQU5EX0NUUkwyX0FVVE9fV1JJVEVf
RUNDOwo+ICAKPiAtCXJldHVybiBuYW5kX3Byb2dfcGFnZV9lbmRfb3AoY2hpcCk7Cj4gKwlyZXQg
PSBuYW5kX3Byb2dfcGFnZV9lbmRfb3AoY2hpcCk7Cj4gKwo+ICsJLyoKPiArCSAqIEFuZCBjbGVh
ciBpdCBiZWZvcmUgcmV0dXJuaW5nIHNvIHRoYXQgZm9sbG93aW5nIHdyaXRlIG9wZXJhdGlvbnMK
PiArCSAqIHRoYXQgZG8gbm90IGludm9sdmUgRUNDIGRvbid0IGdlbmVyYXRlIEVDQyBieXRlcy4K
PiArCSAqLwo+ICsJY2FmZS0+Y3RsMiAmPSB+Q0FGRV9OQU5EX0NUUkwyX0FVVE9fV1JJVEVfRUND
OwoKSSBsaWtlIHNwYWNlcyBiZWZvcmUgcmV0dXJuaW5nLCBidXQgYWdhaW4gaXQncyByZWFsbHkg
YSBuaXRwaWNrLCB5b3UKY2FuIGlnbm9yZSB0aGF0IDopCgo+ICsJcmV0dXJuIHJldDsKPiAgfQo+
ICAKPiAgLyogRl8yW1hdLyhYKio2K1grMSkgICovCgoKV2l0aCB0aGUgY29tbWl0IGxvZyB1cGRh
dGVkCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
