Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6321C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBihTtU2/Hkbk6y2WoNovvKPPx0sVzcWsfIZxCn1Q7s=; b=fgxllp9oYnKb3J
	xc1arOxQVd9md4LeicvziwUq3WOsWQHfFjRxymljez/k4D9b7KVnd+PUmTxbJOlnXAZ9gnlMXTN1b
	Tx0oN7P6oTvOXNhyGJhxr+nw/th2Br8UmXtxEUunUbSTopi+gJdofj0IAAV0hzaPPSIPmDCtXy/jl
	4xFSepytUXWulXqM6nRFKKt0Aw26FJ4M7mq+Z4Rhpcwlx4W3dj3pY/d7MLKhzucot7pkzJjMkmM1u
	imKbn0UXy0vlmC/1dOyBgS2Oi4rUojsOEWQmHWUe3RMectwDXbVmn9298lj+RBGlv7D6piP43Vnan
	WDd3cSaWH05th1WaIUIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxlnl-0043K2-0T; Thu, 16 Dec 2021 08:07:45 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxlni-0043G3-SF
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 08:07:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 78D2CE0009;
 Thu, 16 Dec 2021 08:07:31 +0000 (UTC)
Date: Thu, 16 Dec 2021 09:07:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael
 Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 12/13] spi: mxic: Use spi_mem_generic_supports_op()
Message-ID: <20211216090730.17cc5619@xps13>
In-Reply-To: <Ybo/r8neydqTxN6N@sirena.org.uk>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-13-miquel.raynal@bootlin.com>
 <20211214172410.2b26c17e@collabora.com>
 <20211215184426.67fd3912@xps13>
 <20211215200548.75630b61@collabora.com>
 <Ybo/r8neydqTxN6N@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_000743_073901_33C72A62 
X-CRM114-Status: GOOD (  13.33  )
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

SGkgQm9yaXMsIE1hcmssCgpicm9vbmllQGtlcm5lbC5vcmcgd3JvdGUgb24gV2VkLCAxNSBEZWMg
MjAyMSAxOToxOToxMSArMDAwMDoKCj4gT24gV2VkLCBEZWMgMTUsIDIwMjEgYXQgMDg6MDU6NDhQ
TSArMDEwMCwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IAo+ID4gVGhlcmUncyBhbHNvIGEgc2Vj
b25kIG9wdGlvbiB0aGF0IGRvZXNuJ3QgaW52b2x2ZSBwYXRjaGluZyBleGlzdGluZwo+ID4gdXNl
cnM6IGFkZCBhIHNwaV9tZW1fY29udHJvbGxlcl9jYXBzIHRvIHRoZSBzcGlfY29udHJvbGxlciBz
dHJ1Y3QsIGFuZAo+ID4gY2hlY2sgdGhpcyBpbnN0YW5jZSBpbiB5b3VyIHNwaV9tZW1fZGVmYXVs
dF9zdXBwb3J0c19vcCgpCj4gPiBpbXBsZW1lbnRhdGlvbi4gTm90ZSB0aGF0IHRoZSBidXN3aWR0
aCBjaGVjayBkb25lIGluIHRoZSBnZW5lcmljCj4gPiBoZWxwZXIgaXMgYWxyZWFkeSBiYXNlZCBv
biBjYXBzIGV4cG9zZWQgYnkgdGhlIGNvbnRyb2xsZXIKPiA+IHRocm91Z2ggc3BpX2NvbnRyb2xs
ZXIubW9kZV9iaXRzICh7UlgvVFh9X3tEVUFMLFFVQUQsT0NUQUx9IGJpdHMpLiAgCj4gCj4gVGhp
cyBhcHByb2FjaCBpcyBxdWl0ZSBuaWNlIGZvciB0aGluZ3MgbGlrZSB0aGlzIC0gaGF2aW5nIHRo
aW5ncyBhcyBkYXRhCj4gcmF0aGVyIHRoYW4gY29kZS4gIFRoZSBvbmx5IGlzc3VlIGlzIGlmIGFu
eSBvZiB0aGUgY2FwcyBlbmQgdXAgdmFyeWluZwo+IGJ5IG9wZXJhdGlvbiBhbmQgd2UgbmVlZCBk
aWZmZXJlbnQgY2FwYWJpbGl0aWVzIGJ1dCB0aGF0IGRvZXNuJ3QgbG9vawo+IHRvbyBsaWtlbHkg
aGVyZSBJIHRoaW5rPwoKU3VyZSwgdGhhdCdzIGEgZ29vZCBpZGVhLCBJJ2xsIGxvb2sgaW50byBp
dC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
