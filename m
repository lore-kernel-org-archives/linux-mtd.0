Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C56FC5AD55
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QawPjf6sUCIOHMf0nOoQKi1BJULkJw2iXuYKGVXCZfQ=; b=3FUwsw/zglw9R0
	4ibNNP2Z9B0tjGVzNyWtzX/Zm5MKaTuiPKyAVQoIYobJJ6xSqOheafs3SrsBgsHwlIgqsjYwmzu0Q
	gf8x8v50rokEWcUufYi2cEi5Tt3USB2s/D24hXwv3+sTk7HQSIvIWaCQHJF0JYQzADPU21dqGD4HR
	m1bCfspAH80wsdSvpI6+mBdj/ftg/wToNt27vIrDcWFgu4NTYma8WEmXSSTV4K1LL66OUjhCZGk7p
	HH5n44GzwddnoUczvRu5x69tE7MzwKqfr17sUUocaS8C1nx36uJ3WH5Xqz4RUzU9H3VZ/N8nrAZp6
	WeHzEZe/ZVKsdbc44KVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPsg-0000000Bt72-03Jz;
	Mon, 10 Aug 2026 13:17:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPsc-0000000Bt6K-0oLW
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 13:17:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0EFCE4E411A5;
	Mon, 10 Aug 2026 13:17:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D08296033B;
	Mon, 10 Aug 2026 13:17:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEC7211C4A65A;
	Mon, 10 Aug 2026 15:17:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786367837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=veIrzVKVMr9pigOm4HG454bDNTpxR0FzHvBW69eN574=;
	b=evJTD39dtYFM29q3jfcW+0hg3N2g0p1stxZIQvzt4z/ztg7BLxu/XzfoLETi408g4wdbQp
	sudXQsXo38X/YERQh2O19UxGFKTvmGsTxmkXKfcacd9A9lhoUp2BKt9abXjmrXl4S70LVQ
	2JFRqShVoPTpebVh7PeAfRLcWQlDed3WKgw4a1PMEFZHe5wZPJcAL+9fs5//HeSfy8/ShE
	Jan2GjmQzR72m/gQTsqADwqUWwI+iL4Ndvj5+I7je86b+AhTeOzSs9+0b5n2fnig8+rRSN
	VU5ujW9Qiv7b8psuYmKCLbDPgwHfMbx9Y1Xy+Oa/DX1mDmCBaoDPeSlEAzkDzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/30] mtd: spi-nor: winbond: Stop filling the .name entry
In-Reply-To: <DKL30B77Z7QJ.IXPI630PUWTV@kernel.org> (Michael Walle's message
	of "Mon, 10 Aug 2026 09:22:45 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-3-87e5d3122244@bootlin.com>
	<DJRJJB4NEUEP.168MF88DBSFDF@kernel.org> <87mruzeg1p.fsf@bootlin.com>
	<DKL30B77Z7QJ.IXPI630PUWTV@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 10 Aug 2026 15:17:09 +0200
Message-ID: <87bjbaqfmy.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_061726_370985_96C35D8A 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

T24gMTAvMDgvMjAyNiBhdCAwOToyMjo0NSArMDIsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBUaHUgQXVnIDYsIDIwMjYgYXQgMTE6NDcgQU0gQ0VTVCwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+Pj4gUmVwbGFjZSB0aGUgbmFtZXMg
d2l0aCBhIGNvbW1lbnQgYWJvdmUgdGhlIGVudHJ5IHdpdGggdGhlIG5ld2x5IGluc3RhdGVkCj4+
Pj4gbmFtaW5nIHNjaGVtZSB0byBpbmRpY2F0ZSB3aGF0IGNoaXBzIGFyZSBjb3ZlcmVkIGJ5IGVh
Y2ggZW50cnkuCj4+Pgo+Pj4gVGhpcyBpcyBleHBvcnRlZCB2aWEgc3lzZnMsIHNvIHRoaXMgY291
bGQgYmUgYSByZWdyZXNzaW9uLgo+Pgo+PiBXZWxsLCBhY3R1YWxseSBuYW1lcyBhcmUgbm90IGV4
cG9ydGVkIHRocm91Z2ggc3lzZnMuIE9ubHkgdGhlIG10ZCBuYW1lCj4+IGlzIGF2YWlsYWJsZSB0
aHJvdWdoIHN5c2ZzLCBhbmQgaXQgaXMgc2V0IHRvIGBzcGlYLllgLiBUaGF0IG5hbWUgaXMgb25s
eQo+PiBhdmFpbGFibGUgdGhyb3VnaCBkZWJ1Z2ZzLCB3aGljaCBpcyBub3QgcGFydCBvZiB0aGUg
c3RhYmxlIEFQSS4KPj4KPj4gSSBzaG91bGQgaGF2ZSBjaGVja2VkIGJlZm9yZSBkcm9wcGluZyBh
bGwgbXkgcGF0Y2hlcy4uLgo+Cj4gVGhhdCdzIG5vdCBjb3JyZWN0LCBzZWUKPgo+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjEuNy9zb3VyY2UvZHJpdmVycy9tdGQvc3BpLW5v
ci9zeXNmcy5jI0wyMQoKVHJ1ZSwgaXQgaXMgZnVydGhlciBkb3duIHRoZSBzeXNmcyBtYXplOgoK
IyBjYXQgL3N5cy9jbGFzcy9tdGQvbXRkMC9uYW1lIApzcGkwLjAKIyBjYXQgL3N5cy9jbGFzcy9t
dGQvbXRkMC9kZXZpY2Uvc3BpLW5vci9wYXJ0bmFtZSAKRk9PCgpTbyB0aGF0IG1lYW5zIEkgaGF2
ZSB0byBmaW5kIGEgd2F5IHRvIGRyb3AgdGhhdCBuYW1lIGZvciB0aGUgUlYKYWRkaXRpb24uCgpU
aGFua3MhCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
