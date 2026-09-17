Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD14C88E72
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 10:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHtOYP93bVthwybu3jQBcNROjajACu09lptcOcoX0CQ=; b=xB/KPOkN+FwSjq
	/ZSkTWhQKg5OBowK8e8hjGI1G9icczZM979rQnlcadgeduboNR/16KwxNbAfp/SjRzu1zBNzycumr
	8j+7LO4M3YjSaDci5OKeytDwSEvYvCZuHeyECUTrzDRIAn14H2nEZPtYuhgp/UwNWzVhvS/iaZHIt
	tornR0eU9rCC14/bkl79NHRt+qmQtZ752ddBO3qvz319KwqXhRIor7NAq7ngQoNBfMVjrdohRplv9
	4786QhmJ7Ma1DXRymRps+zyKB2FJ5CL5HHBJBEG8XTQ3RU+N9sN7NEY/6SMWvxQBoYbpUbgwB7xaW
	FDu5x6OZrQE+RimmBc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79W6-0000000B7K6-2KZD;
	Thu, 17 Sep 2026 10:38:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79W4-0000000B7Jb-3nsN;
	Thu, 17 Sep 2026 10:38:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D40E43604;
	Thu, 17 Sep 2026 10:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934A81F000FF;
	Thu, 17 Sep 2026 10:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789641536;
	bh=GgiouULxaavrRvEyeFGZnpHW8o/taKt6WxSeZJbXgG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZZOmYDHsEtXapaWj6BjVYo0Egq6UJf0CFI9XwUTH/0eYaTz4mTdcF2MbSXQGd35U
	 os/YSIJxati+HoBjFScUoJWKlIIxg62pWo1ux3sIdGM9TGBeZfAk9XUSop0SjFmMj8
	 HZqMSbAXCdDy5rCvHnJxyFpHEk1xVMKfU55F7chtZ35w0jjJFIYgwEHb/jQ7/EP7n5
	 obNutBYZxKY7GJG11PIC7YaEHuvjjyIflrt8nrHxQ/OQH14964wmRYaCbFgEckUnWl
	 GBzHV6xw+JI5nrWC5vVf1U91z7fqSPN1np3uwU6z5QUXiq6AEUaiVqO9ZBvAgP4JnF
	 MvwXFE+Ha9CFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix HSMC clock leak in legacy
 controller init
To: "Wentao Liang" <vulab@iscas.ac.cn>, alexandre.belloni@bootlin.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, vigneshr@ti.com, claudiu.beznea@tuxon.dev, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nicolas.ferre@microchip.com, bbrezillon@kernel.org, miquel.raynal@bootlin.com, richard@nod.at
In-Reply-To: <20260917102804.2146887-1-vulab@iscas.ac.cn>
References: <20260917102804.2146887-1-vulab@iscas.ac.cn>
Date: Thu, 17 Sep 2026 10:38:55 +0000
Message-Id: <20260917103855.934A81F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiBiYWNrd2FyZCBn
b3RvIGluIGVycm9yIGhhbmRsaW5nIHBhdGggdmlvbGF0ZXMga2VybmVsIHN0eWxlCi0tCgpjb21t
aXQgYWFkOTZlYzQ4ZjliMjcwNTk4ODExZjQwNjU4MjZjNzBmMzc4Njg3YwpBdXRob3I6IFdlbnRh
byBMaWFuZyA8dnVsYWJAaXNjYXMuYWMuY24+CgptdGQ6IHJhd25hbmQ6IGF0bWVsOiBGaXggSFNN
QyBjbG9jayBsZWFrIGluIGxlZ2FjeSBjb250cm9sbGVyIGluaXQKCmF0bWVsX2hzbWNfbmFuZF9j
b250cm9sbGVyX2xlZ2FjeV9pbml0KCkgdGFrZXMgYSByZWZlcmVuY2UgdG8gdGhlCkhTTUMgY2xv
Y2sgd2l0aCBvZl9jbGtfZ2V0KCkgYW5kIGVuYWJsZXMgaXQsIGJ1dCB0aGUgZXJyb3IgcGF0aHMK
dGhhdCBmb2xsb3cgb25seSByZWxlYXNlIHRoZSBkZXZpY2Ugbm9kZSwgc28gYm90aCB0aGUgcmVm
ZXJlbmNlIGFuZAp0aGUgZW5hYmxlIGFyZSBsZWFrZWQgd2hlbmV2ZXIgdGhlIGNvbnRyb2xsZXIg
Y2Fubm90IGJlIGZ1bGx5CmluaXRpYWxpemVkLiBBZGQgYW4gZXJyX2Rpc2FibGVfY2xrIHBhdGgg
dGhhdCBkaXNhYmxlcyBhbmQgcmVsZWFzZXMKdGhlIGNsb2NrIGJlZm9yZSBqdW1waW5nIHRvIHRo
ZSBleGlzdGluZyBvdXQgcGF0aC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2F0bWVsL25hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFu
ZC1jb250cm9sbGVyLmMKPiBpbmRleCA4YTE5NDA4YWJiNjM1Li5iYWZjOGM5OTVlMzc2IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMKWyAuLi4g
XQo+IEBAIC0yMjYwLDYgKzIyNjEsMTIgQEAgYXRtZWxfaHNtY19uYW5kX2NvbnRyb2xsZXJfbGVn
YWN5X2luaXQoc3RydWN0IGF0bWVsX2hzbWNfbmFuZF9jb250cm9sbGVyICpuYykKPiAgCW9mX25v
ZGVfcHV0KG5mY19ucCk7Cj4gIAo+ICAJcmV0dXJuIHJldDsKPiArCj4gK2Vycl9kaXNhYmxlX2Ns
azoKPiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShuYy0+Y2xrKTsKPiArCWNsa19wdXQobmMtPmNs
ayk7Cj4gKwo+ICsJZ290byBvdXQ7CgpbU2V2ZXJpdHk6IExvd10KRG9lcyB0aGlzIGJhY2t3YXJk
IGp1bXAgdG8gdGhlIG91dCBsYWJlbCBpbnRyb2R1Y2UgYSByZWdyZXNzaW9uIGluIHN0YW5kYXJk
Cmtlcm5lbCBjb252ZW50aW9ucyBmb3IgZXJyb3IgaGFuZGxpbmc/CgpXaGlsZSBmdW5jdGlvbmFs
bHkgY29ycmVjdCwganVtcGluZyBiYWNrd2FyZHMgaW5zdGVhZCBvZiBzdHJ1Y3R1cmluZyBjYXNj
YWRpbmcKZXJyb3IgbGFiZWxzIHNvIHRoYXQgdGhlIHN1Y2Nlc3MgcGF0aCBleGl0cyBvciBqdW1w
cyBmb3J3YXJkIG92ZXIgdGhlIGVycm9yCmhhbmRsaW5nIGJsb2NrcyBpbnRyb2R1Y2VzIG5vbi1z
dGFuZGFyZCBjb250cm9sIGZsb3cgaW4gdGhpcyBmdW5jdGlvbi4KCi0tIApTYXNoaWtvIEFJIHJl
dmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTcxMDI4MDQuMjE0
Njg4Ny0xLXZ1bGFiQGlzY2FzLmFjLmNuP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
