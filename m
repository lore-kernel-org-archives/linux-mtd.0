Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FF0C43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:54:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B073E2087E
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:54:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d6ieRkI9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B073E2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxsvvKJ6qpNuzv58/Th7XdEOkRGlsIojBSaePXrJJYU=; b=d6ieRkI99yKAYQ
	5cM0yIXha7ejnekuD41aG3g8CN4W7nJrfozEoSqnNjKvHNB8R4//1Ryq02Vk6Ax+vmPvXBDsqSFpT
	vutJ2rnS1OcA75FejSF3sa/xBlQuDA5j8zveJvPEQz8UcQKmy/qQsjuMXXGjelxF6bSBDqdonIxCd
	NhqzCptxPrGvs3SErdyCcumIEJBvHANCUo8Jux5MmGPLjDj/cdE6uS4CPnH1GxKw3qXftRGHKPraI
	mOkTCfzDZt5xhCtynV7SLeUj4vYgWGrxzmEZlKbYerUF4g2tWhl9F0IDMmMmhKbjQz5J8IwDdv1vg
	l/iq/bc9y1p6GY+4QQQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkPv5-0002bo-0S; Fri, 18 Jan 2019 08:54:31 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkPv2-0002bW-9u
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 08:54:29 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id E04EE207AC; Fri, 18 Jan 2019 09:54:21 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-37-87.w90-88.abo.wanadoo.fr
 [90.88.156.87])
 by mail.bootlin.com (Postfix) with ESMTPSA id A818A206DC;
 Fri, 18 Jan 2019 09:54:21 +0100 (CET)
Date: Fri, 18 Jan 2019 09:54:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH] mtd: nand: jz4740: fix '__iomem *' vs. '* __iomem'
Message-ID: <20190118095421.73387ccc@xps13>
In-Reply-To: <20190117173907.62198-1-luc.vanoostenryck@gmail.com>
References: <20190117173907.62198-1-luc.vanoostenryck@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_005428_473646_D0B7BDBF 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Lars-Peter Clausen <lars@metafoo.de>,
 linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTHVjLAoKTHVjIFZhbiBPb3N0ZW5yeWNrIDxsdWMudmFub29zdGVucnlja0BnbWFpbC5jb20+
IHdyb3RlIG9uIFRodSwgMTcgSmFuCjIwMTkgMTg6Mzk6MDcgKzAxMDA6Cgo+IFRoZSBmdW5jdGlv
biBqel9uYW5kX2lvcmVtYXBfcmVzb3VyY2UoKSBuZWVkcyBhIHBvaW50ZXIgdG8gYW4gX19pb21l
bQo+IHBvaW50ZXIgYXMgaXRzIGxhc3QgYXJndW1lbnQgYnV0IHRoaXMgYXJndW1lbnQgaXMgZGVj
bGFyZWQgYXM6Cj4gCXZvaWQgKiBfX2lvbWVtICpiYXNlCj4gCj4gRml4IHRoaXMgYnkgdXNpbmcg
dGhlIGNvcnJlY3QgZGVjbGFyYXRpb246Cj4gCXZvaWQgX19pb21lbSAqKmJhc2UKPiB3aGljaCB0
aGVuIGFsc28gcmVtb3ZlcyB0aGUgZm9sbG93aW5nIFNwYXJzZSdzIHdhcm5pbmdzOgo+ICAgMjgy
OjE1OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25tZW50IChkaWZmZXJlbnQgYWRk
cmVzcyBzcGFjZXMpCj4gICAyODI6MTU6ICAgIGV4cGVjdGVkIHZvaWQgKltub2RlcmVmXSA8YXNu
OjI+Cj4gICAyODI6MTU6ICAgIGdvdCB2b2lkIFtub2RlcmVmXSA8YXNuOjI+ICoKPiAgIDMyMjo1
Nzogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgNCAoZGlmZmVyZW50IGFkZHJl
c3Mgc3BhY2VzKQo+ICAgMzIyOjU3OiAgICBleHBlY3RlZCB2b2lkICpbbm9kZXJlZl0gPGFzbjoy
PiAqYmFzZQo+ICAgMzIyOjU3OiAgICBnb3Qgdm9pZCBbbm9kZXJlZl0gPGFzbjoyPiAqKgo+ICAg
NDAyOjY3OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhcmd1bWVudCA0IChkaWZmZXJlbnQg
YWRkcmVzcyBzcGFjZXMpCj4gICA0MDI6Njc6ICAgIGV4cGVjdGVkIHZvaWQgKltub2RlcmVmXSA8
YXNuOjI+ICpiYXNlCj4gICA0MDI6Njc6ICAgIGdvdCB2b2lkIFtub2RlcmVmXSA8YXNuOjI+ICoq
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTHVjIFZhbiBPb3N0ZW5yeWNrIDxsdWMudmFub29zdGVucnlj
a0BnbWFpbC5jb20+Cj4gLS0tCgpBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4KCkJvcmlzLCBkbyB5b3Ugd2FudCB0byB0YWtlIGl0IGluIHlvdXIgZml4
ZXMgYnJhbmNoPwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
