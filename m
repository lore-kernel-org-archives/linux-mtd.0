Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84E2C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 10:03:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713C92087F
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 10:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dnMP/osy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713C92087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6UT2b/pTTBt/HCyK6Nv1T2q4pCrMl9jLGDalpYQHSI=; b=dnMP/osytALoc2
	AJpDKyIXOUiMey17zpFJhb7fz4Qza54DPump0pwonEqHngIchCcPmseU71IBP2sbwe2xovoLy+zq/
	rwsANmUlBW1JaHtrWQjrHRgLtVpi6tB7kWOMGb+1QZ9yFgoP/E/xDCbCbU+ZMyuRL5JzXW8FUHH3O
	l2IEn3XJ+mXdNJCQImctUuQW6SlCvlJAIr/1ATZI7ru46yMwaho+lGv/o5ofQe5kWkEgqyZ1Zm7VX
	c0oaxa9sXuQb5u15AnoFfcezofaUS4429w9HUVnsk8Vol/En11t0O1LFxlOarjOTYu6qpS3coy3p8
	e8c8TVI/SJNww5R5thOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go3l1-0005p0-Ce; Mon, 28 Jan 2019 10:03:11 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3ky-0005oY-B3
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 10:03:09 +0000
X-Originating-IP: 90.88.29.206
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F2C48C002A;
 Mon, 28 Jan 2019 10:02:54 +0000 (UTC)
Date: Mon, 28 Jan 2019 11:02:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2 v2] mtd: rawnand: fsmc: Reset NAND timings on resume()
Message-ID: <20190128110254.76c16e41@xps13>
In-Reply-To: <20190126131056.11364-1-linus.walleij@linaro.org>
References: <20190126131056.11364-1-linus.walleij@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_020308_527869_D1F1AAF6 
X-CRM114-Status: GOOD (  11.03  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGludXMsCgpMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3Rl
IG9uIFNhdCwgMjYgSmFuIDIwMTkKMTQ6MTA6NTUgKzAxMDA6Cgo+IFdoZW4gd2UgZ28gdGhyb3Vn
aCBhIHN1c3BlbmQvcmVzdW1lIGN5Y2xlIHRoZSBOQU5ECj4gdGltaW5ncyBhbmQgb3RoZXIgc2V0
dGluZ3MgbWF5IGhhdmUgYmVlbiBsb3N0IHNvIHJlc2V0Cj4gdGhlIGNoaXAgdG8gYnJpbmcgaXQg
dXAgaW4gYSBrbm93biB3b3JraW5nIHN0YXRlLgo+IAo+IFRoZSBGU01DIG9ubHkgc3VwcG9ydHMg
c2luZ2xlIENTIGNoaXBzIHNvIHdlIG9ubHkgbmVlZAo+IHRvIGNhbGwgbmFuZF9yZXNldChjaGlw
LCAwKS4KPiAKPiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
Cj4gLS0tCgpCb3RoIHBhdGNoZXMgYXBwbGllZCB0byBuYW5kL25leHQuCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
