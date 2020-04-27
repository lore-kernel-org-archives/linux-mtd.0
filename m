Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC572C4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:30:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97AA4214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ta4oZnEQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97AA4214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsGKxxOtaxmfcFuPF44TnbhweA+cxdWqiTWm1/MT6gs=; b=ta4oZnEQTNgNLi
	CkcBi+T0Tj+m7yDmDiRttKHuqZdKC0mFfEg5Qq9mLOySsvQbOebdfS6CBTQI/iZ/xCPy7bF1mk+dN
	U9NJEzhjK8LBHzDubEbPOKMqdMK2R4EgfeRh/x7hubjQ++YBlZFfzyq5mQ6slbuaNGOPlKRWRxaZi
	Z/+qCmC93PaRE9h4QQ5YuXiktStfoE6W9EeuxyV9Q6ELQwfhEiz+aAqFB9ArTUFvoYzUR8UmPjFBX
	f2u0pIuaDaywkXicbxI2gZuUB/p2I3Pv3oJHPcV3PJMS0aDNWJ9ZUmjgi0DAd/PvD/0LCpxJ/O+lJ
	pgGrtJS6zMLejBjKifhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9SI-000160-8H; Mon, 27 Apr 2020 19:30:14 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9S9-0007xM-5r
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:30:07 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7243C240004;
 Mon, 27 Apr 2020 19:30:02 +0000 (UTC)
Date: Mon, 27 Apr 2020 21:30:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 3/3] mtd: rawnand: diskonchip: Set the NAND_NO_BBM_QUIRK
 flag
Message-ID: <20200427213001.17a6eaa8@xps13>
In-Reply-To: <20200427072453.375642-3-boris.brezillon@collabora.com>
References: <20200427072453.375642-1-boris.brezillon@collabora.com>
 <20200427072453.375642-3-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_123005_432431_94FF5423 
X-CRM114-Status: GOOD (  13.72  )
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
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDI3IEFwcgoyMDIwIDA5OjI0OjUzICswMjAwOgoKPiBXZSBoYXZlIGEg
ZHVtbXkgYmxvY2tfYmFkKCkgaW1wbGVtZW50YXRpb24gcmV0dXJuaW5nIDAuIExldCdzIHNldCB0
aGUKPiBOQU5EX05PX0JCTV9RVUlSSyBmbGFnIGFuZCBsZXQgdGhlIGNvcmUgdGFrZSBjYXJlIG9m
IHRoYXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29uY2hp
cC5jIHwgMTAgKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDkg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Rpc2tv
bmNoaXAuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Rpc2tvbmNoaXAuYwo+IGluZGV4IGMyYTM5
MWFkMmMzNS4uNGMzZDA0ZGE0Y2VlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2Rpc2tvbmNoaXAuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Rpc2tvbmNoaXAuYwo+
IEBAIC03NzYsMTMgKzc3Niw2IEBAIHN0YXRpYyBpbnQgZG9jMjAweF9kZXZfcmVhZHkoc3RydWN0
IG5hbmRfY2hpcCAqdGhpcykKPiAgCX0KPiAgfQo+ICAKPiAtc3RhdGljIGludCBkb2MyMDB4X2Js
b2NrX2JhZChzdHJ1Y3QgbmFuZF9jaGlwICp0aGlzLCBsb2ZmX3Qgb2ZzKQo+IC17Cj4gLQkvKiBU
aGlzIGlzIG91ciBsYXN0IHJlc29ydCBpZiB3ZSBjb3VsZG4ndCBmaW5kIG9yIGNyZWF0ZSBhIEJC
VC4gIEp1c3QKPiAtCSAgIHByZXRlbmQgYWxsIGJsb2NrcyBhcmUgZ29vZC4gKi8KPiAtCXJldHVy
biAwOwo+IC19Cj4gLQo+ICBzdGF0aWMgdm9pZCBkb2MyMDB4X2VuYWJsZV9od2VjYyhzdHJ1Y3Qg
bmFuZF9jaGlwICp0aGlzLCBpbnQgbW9kZSkKPiAgewo+ICAJc3RydWN0IGRvY19wcml2ICpkb2Mg
PSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEodGhpcyk7Cj4gQEAgLTE1NzgsNyArMTU3MSw2IEBA
IHN0YXRpYyBpbnQgX19pbml0IGRvY19wcm9iZSh1bnNpZ25lZCBsb25nIHBoeXNhZHIpCj4gIAlu
YW5kLT5sZWdhY3kuY21kX2N0cmwJCT0gZG9jMjAweF9od2NvbnRyb2w7Cj4gIAluYW5kLT5sZWdh
Y3kuZGV2X3JlYWR5CT0gZG9jMjAweF9kZXZfcmVhZHk7Cj4gIAluYW5kLT5sZWdhY3kud2FpdGZ1
bmMJPSBkb2MyMDB4X3dhaXQ7Cj4gLQluYW5kLT5sZWdhY3kuYmxvY2tfYmFkCT0gZG9jMjAweF9i
bG9ja19iYWQ7Cj4gIAluYW5kLT5lY2MuaHdjdGwJCT0gZG9jMjAweF9lbmFibGVfaHdlY2M7Cj4g
IAluYW5kLT5lY2MuY2FsY3VsYXRlCT0gZG9jMjAweF9jYWxjdWxhdGVfZWNjOwo+ICAJbmFuZC0+
ZWNjLmNvcnJlY3QJPSBkb2MyMDB4X2NvcnJlY3RfZGF0YTsKPiBAQCAtMTU5MCw3ICsxNTgyLDcg
QEAgc3RhdGljIGludCBfX2luaXQgZG9jX3Byb2JlKHVuc2lnbmVkIGxvbmcgcGh5c2FkcikKPiAg
CW5hbmQtPmVjYy5vcHRpb25zCT0gTkFORF9FQ0NfR0VORVJJQ19FUkFTRURfQ0hFQ0s7Cj4gIAlu
YW5kLT5iYnRfb3B0aW9ucwk9IE5BTkRfQkJUX1VTRV9GTEFTSDsKPiAgCS8qIFNraXAgdGhlIGF1
dG9tYXRpYyBCQlQgc2NhbiBzbyB3ZSBjYW4gcnVuIGl0IG1hbnVhbGx5ICovCj4gLQluYW5kLT5v
cHRpb25zCQl8PSBOQU5EX1NLSVBfQkJUU0NBTjsKPiArCW5hbmQtPm9wdGlvbnMJCXw9IE5BTkRf
U0tJUF9CQlRTQ0FOIHwgTkFORF9OT19CQk1fUVVJUks7Cj4gIAo+ICAJZG9jLT5waHlzYWRyCQk9
IHBoeXNhZHI7Cj4gIAlkb2MtPnZpcnRhZHIJCT0gdmlydGFkcjsKCgpSZXZpZXdlZC1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
