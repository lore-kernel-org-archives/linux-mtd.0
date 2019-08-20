Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9EBC3A589
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 08:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C09CF239BA
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 08:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lvMJuuCA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C09CF239BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UP5fgfD4sjh6fwqvbvIiCbWuzE8X/6UlEmJmOkr9EE=; b=lvMJuuCAooBYFI
	DFJYs4rBC0xEa/IsLXo9fLEZmmVbtLIB1zqN1BSGXcGUj9ApiUaBuKx4RB4QB513CNpC31EejHyQb
	34ySqy9Va1bTyNDQfcNVOr57l0IJFP0JicShK8HphxXl0L3iOoNbxSHFu6MUoqsb79a9r/0KDWg9B
	xSeH98Yj6S3jj8HqhVPeCPk4g4dtLmHPC2jjkwsIRMxSdOFzFduaD27G0480+R5P5tkXfoQbiLgSy
	E5547p35VaeDDT2GYuKkx9pnBloRry6EdragpWPoCQPAM4JBbJQPSI1G0UE7a/Mdwuy0fp634uGqW
	PCEGe44ZH3ZLAfYzxYFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzzZi-0008Bx-Ou; Tue, 20 Aug 2019 08:33:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzzZf-0008BV-EY
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 08:33:04 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5D3541BF20D;
 Tue, 20 Aug 2019 08:32:54 +0000 (UTC)
Date: Tue, 20 Aug 2019 10:32:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Message-ID: <20190820103253.090f88ee@xps13>
In-Reply-To: <20190820082837.rvk2itycnka4vo6a@pengutronix.de>
References: <20190814082232.2119-1-m.felsch@pengutronix.de>
 <20190819101718.39b3a5ca@xps13>
 <20190820082837.rvk2itycnka4vo6a@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_013303_639827_36DB2909 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: bbrezillon@kernel.org, richard@nod.at,
 Marco Felsch <m.felsch@pengutronix.de>, frieder.schrempf@kontron.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVXdlLAoKVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5k
ZT4gd3JvdGUgb24gVHVlLCAyMCBBdWcKMjAxOSAxMDoyODozNyArMDIwMDoKCj4gSGVsbG8gTWlx
dcOobCwKPiAKPiBPbiBNb24sIEF1ZyAxOSwgMjAxOSBhdCAxMDoxNzoxOEFNICswMjAwLCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gTWFyY28gRmVsc2NoIDxtLmZlbHNjaEBwZW5ndXRyb25peC5k
ZT4gd3JvdGUgb24gV2VkLCAxNCBBdWcgMjAxOQo+ID4gMTA6MjI6MzIgKzAyMDA6ICAKPiA+ID4g
K3N0YXRpYyBpbnQgbXQyOWYxZzAxYWFhZGRfb29ibGF5b3V0X2VjYyhzdHJ1Y3QgbXRkX2luZm8g
Km10ZCwgaW50IHNlY3Rpb24sCj4gPiA+ICsJCQkJCXN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVn
aW9uKQo+ID4gPiArewo+ID4gPiArCWlmIChzZWN0aW9uID4gMykKPiA+ID4gKwkJcmV0dXJuIC1F
UkFOR0U7Cj4gPiA+ICsKPiA+ID4gKwlyZWdpb24tPm9mZnNldCA9IChzZWN0aW9uICogMHgxMCkg
KyA4OyAgCj4gPiAKPiA+IEFueSByZWFzb24gdG8gdXNlIGhleCBoZXJlPyAgICAgICAgIF4KPiA+
IAo+ID4gSWYgbm90IEkgd291bGQgcHJlZmVyIGRlY2ltYWwgbnVtYmVycy4gIAo+IAo+IElNSE8g
aXQgaXMgcXVpdGUgY29tbW9uIHRvIHVzZSBoZXhhZGVjaW1hbCBhbHNvIGZvciByZWdpc3RlciBv
ZmZzZXRzLAo+IG5vdCBvbmx5IGZvciByZWdpc3RlciB2YWx1ZXMuCj4gCj4gSSBjaGVja2VkIGEg
ZmV3IGRyaXZlcnMgKGRyaXZlcnMvbXRkL25hbmQvcmF3L214Y19uYW5kLmMsCj4gZHJpdmVycy9j
bGsvbWVzb24vZzEyYS5jLCBkcml2ZXJzL2dwaW8vZ3Bpby1zY2guYykgYW5kIHRoZXkgYWxsIHVz
ZSBoZXgKPiBhbHNvIGZvciB0aGUgb2Zmc2V0cywgc28gaXQgc2VlbXMgdG8gYmUgYXQgbGVhc3Qg
dXN1YWwuIEFsc28gYXMgb2Zmc2V0cwo+IGZvciByZXBlYXRpbmcgcmVnaXN0ZXJzIGFyZSB1c3Vh
bGx5IHBvd2VycyBvZiB0d28sIGhleGFkZWNpbWFsIGNvbnN0YW50cwo+IGFyZSBtb3JlIHN1aXRh
YmxlIElNSE8uCgpBYnNvbHV0ZWx5LiBCdXQgaGVyZSByZWdpb24tPm9mZnNldCBpcyBub3QgYSBy
ZWdpc3RlciBvZmZzZXQgYXQgYWxsLCBpdAppcyBhbiBpbmRpY2F0aW9uIGZvciB0aGUgdXBwZXIg
bGF5ZXJzIG9mIHRoZSBwb3NpdGlvbiBvZiBhbiBhcmVhIHdpdGhpbgphIGJpZ2dlciBidWZmZXIg
KGhlcmU6IHdoZXJlIGFyZSB0aGUgRUNDIGJ5dGVzIGluIG15IGJ1ZmZlciBpbiBSQU0pLiBJCmRv
bid0IHRoaW5rIGhleGFkZWNpbWFsIG51bWJlcnMgaGF2ZSBhbnkgaW50ZXJlc3QgaGVyZS4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
