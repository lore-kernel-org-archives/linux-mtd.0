Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE7EC3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/677UTIFRmXRxJYmPEY+j1lhBuAY2P1DrzNYBQetn7A=; b=d6oHjHgscEfDnb
	g+gJoDuKANEjTdNCz1ReJtawpjCbXHlnfQcBeTgpifPJQz7QS6DQvD5BMFe/IQT7BjZWOk7X4DVam
	tmVEN8LWr3wxMh8vs6yyj41pnu9z+NMtE20BJi6i1dTSh3r9aL9yt0zomeAqOFkptc9cskeHJPIec
	7tp/tWesOBlOQKocs72ZZSVn/DcKZbZtrc9eQyj6yHajfPIpRnAq1YvZjeuNw+Np2lmiY3UV49HRk
	1cGAiZ95LVWMSh1PgJhxPl9Dat1lppX2sfaYRYB7SI4x24Y6cj/zNAog5ZIFJXIkjWxwKdHyDwV6m
	UQdfLWvKs4iYz5IWEoNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCGsL-009jbn-AK; Mon, 02 Jan 2023 09:12:57 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCGr4-009imo-AU; Mon, 02 Jan 2023 09:11:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0DF451BF20D;
	Mon,  2 Jan 2023 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672650694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NXQ+pbiHmlKkDQiTKOKup65uhul5WhrNqTkDGnhL3Ks=;
	b=piVyYKp58Y0GOM3O5GKe8o4UOClqfub66InYZ5XpJbqjQ1CFEO2eLu8zEUECeUIELx8HEG
	Xsxrgsl/3SRu2wFFFiJGKpLlnjQ+V7yUHb51LT4XE+HMbhalqwcE+bWVFxg1IKBxxyuRl8
	UJpnmlsWyR58uiGSHpGaPIrghiAvfqyqy+YobwHk2ffW4X5us09LxVMe3aP/SBY5DAWxUd
	8A8BsQUgzQOG5v5aXjXogw7Q7TcwRChdXimH4SLEoGmuokyzwJWP3cis2YT1dw0lUU+cQl
	uNIK2caufx1Ho6doVbvpJ3zATKCR1tU0fc0ThzYEpr5FMvlx1pNrgGYRj6Q2og==
Date: Mon, 2 Jan 2023 10:11:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/7] mtd: rawnand: sunxi: Fix ECC strength maximization
Message-ID: <20230102101132.66aa1a1d@xps-13>
In-Reply-To: <20221229181526.53766-5-samuel@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
	<20221229181526.53766-5-samuel@sholland.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_011138_844313_13036F9E 
X-CRM114-Status: GOOD (  16.87  )
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

SGkgU2FtdWVsLAoKc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZSBvbiBUaHUsIDI5IERlYyAyMDIy
IDEyOjE1OjIzIC0wNjAwOgoKPiBUaGlzIGlzIGFscmVhZHkgYWNjb3VudGVkIGZvciBpbiB0aGUg
c3VidHJhY3Rpb24gZm9yIE9PQiwgc2luY2UgdGhlIEJCTQo+IG92ZXJsYXBzIHRoZSBmaXJzdCBP
T0IgZHdvcmQuIFdpdGggdGhpcyBjaGFuZ2UsIHRoZSBkcml2ZXIgcGlja3MgdGhlCj4gc2FtZSBF
Q0Mgc3RyZW5ndGggYXMgdGhlIHZlbmRvciBkcml2ZXIuCj4gCj4gRml4ZXM6IDQ3OTZkODY1NTkx
NSAoIm10ZDogbmFuZDogc3VueGk6IFN1cHBvcnQgRUNDIG1heGltaXphdGlvbiIpCj4gU2lnbmVk
LW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+Cj4gLS0tCj4gCj4g
IGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3Vu
eGlfbmFuZC5jCj4gaW5kZXggMWJkZGViMWJlNjZmLi4xZWNmMmNlZTM0M2IgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gQEAgLTE2NDMsOCArMTY0Myw3IEBAIHN0YXRpYyBpbnQg
c3VueGlfbmFuZF9od19lY2NfY3RybF9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4gIAkJ
ZWNjLT5zaXplID0gMTAyNDsKPiAgCQluc2VjdG9ycyA9IG10ZC0+d3JpdGVzaXplIC8gZWNjLT5z
aXplOwo+ICAKPiAtCQkvKiBSZXNlcnZlIDIgYnl0ZXMgZm9yIHRoZSBCQk0gKi8KPiAtCQlieXRl
cyA9IChtdGQtPm9vYnNpemUgLSAyKSAvIG5zZWN0b3JzOwo+ICsJCWJ5dGVzID0gbXRkLT5vb2Jz
aXplIC8gbnNlY3RvcnM7CgpJJ20gc29ycnkgYnV0IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIG1ha2Ug
dGhpcyB3b3JrLiBUaGlzIGNoYW5nZSB3b3VsZApicmVhayBhbGwgZXhpc3RpbmcgdXNlcnMuLi4K
Cj4gIAo+ICAJCS8qIDQgbm9uLUVDQyBieXRlcyBhcmUgYWRkZWQgYmVmb3JlIGVhY2ggRUNDIGJ5
dGVzIHNlY3Rpb24gKi8KPiAgCQlieXRlcyAtPSA0OwoKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
