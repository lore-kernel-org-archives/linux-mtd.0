Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD1AC3DA7D
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Jan 2023 17:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CSCPcavfD8zj5RubFlkgk8Lq85qOqS8i8AmFay2pKM=; b=UwAPZrWeb30745
	BuO8aAUnedBf//Q1e7JeQW4Omd1/IgvfQVvbS6kGTpaPYi510gIVD6FQNuAmVD3p2O0wEaQAt+nhX
	mr1btejbwGMIgQhoA7qJXaDTStfimv3J68ksKJ3ztWz2s8tFQLqWSJl3UVA98CwOjyoqHWeGzzA6X
	W7jV9R0jhXI96RDZANgiDx7aTSYH0G1oGZiR3cXhw/BUpVhNF3IacxSsMleTk90pYteRmZSV6xAVj
	qZpUCgoE9oY8OUAtMOjjR3RJESm08K3HLzqn13x4ttqN7QAhmRlQ5DXCHAcvZ5BV8wrZDK4jXAKOs
	utN+uJBRM6U1zUl4aI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCl2p-003O64-F3; Tue, 03 Jan 2023 17:25:47 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCiUR-0024d0-K2; Tue, 03 Jan 2023 14:42:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E824924000D;
	Tue,  3 Jan 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672756921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rTMO3TySG46QgZw+qOV1x67KwVNxb2EvI1mr7+JDBlY=;
	b=baEdm2IA5eAa4DvzbMbllbXt8eMiBNwUoF0l5/gM7tLt9Ot8Ap7FMA5x30dtyecLguiDWC
	+mfcg3zF3zln8j648DeTEEjCqgOBA73cd9PkGMe84kQQB2ARMKb/aNWvC53Drltu8V2EXo
	ZRwqCeGg47jMempFyYrDgL1kATygNal+T7387r9/UXb+To6i8aLGo1v6ZlK9F9Rlr8NnRp
	k5T4B9o0cSxFL2P9hP86M6PWtHifg9VO0fVrRGsEDketJgYWTlRnst7p5+ODfCorAag7q9
	h1mgsd54VW2USPLbBFa9R8YsrVBNwK21fcKwgviV8IQ6woar9EHL6x17Cz5P5Q==
Date: Tue, 3 Jan 2023 15:41:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/7] mtd: rawnand: sunxi: Fix ECC strength maximization
Message-ID: <20230103154155.7064e59e@xps-13>
In-Reply-To: <6940e60e-834d-9cc6-c3b8-657b100ea5db@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
	<20221229181526.53766-5-samuel@sholland.org>
	<20230102101132.66aa1a1d@xps-13>
	<4207d4eb-31d5-31c0-1a7f-67ec00b63f58@sholland.org>
	<20230102174517.1ccb3654@xps-13>
	<6940e60e-834d-9cc6-c3b8-657b100ea5db@sholland.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_064208_303481_70305B1C 
X-CRM114-Status: GOOD (  32.16  )
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

SGkgU2FtdWVsLAoKc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZSBvbiBNb24sIDIgSmFuIDIwMjMg
MTE6MDY6MjAgLTA2MDA6Cgo+IEhpIE1pcXXDqGwsCj4gCj4gT24gMS8yLzIzIDEwOjQ1LCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4+Pj4gVGhpcyBpcyBhbHJlYWR5IGFjY291bnRlZCBmb3IgaW4g
dGhlIHN1YnRyYWN0aW9uIGZvciBPT0IsIHNpbmNlIHRoZSBCQk0KPiA+Pj4+IG92ZXJsYXBzIHRo
ZSBmaXJzdCBPT0IgZHdvcmQuIFdpdGggdGhpcyBjaGFuZ2UsIHRoZSBkcml2ZXIgcGlja3MgdGhl
Cj4gPj4+PiBzYW1lIEVDQyBzdHJlbmd0aCBhcyB0aGUgdmVuZG9yIGRyaXZlci4KPiA+Pj4+Cj4g
Pj4+PiBGaXhlczogNDc5NmQ4NjU1OTE1ICgibXRkOiBuYW5kOiBzdW54aTogU3VwcG9ydCBFQ0Mg
bWF4aW1pemF0aW9uIikKPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11
ZWxAc2hvbGxhbmQub3JnPgo+ID4+Pj4gLS0tCj4gPj4+Pgo+ID4+Pj4gIGRyaXZlcnMvbXRkL25h
bmQvcmF3L3N1bnhpX25hbmQuYyB8IDMgKy0tCj4gPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54
aV9uYW5kLmMKPiA+Pj4+IGluZGV4IDFiZGRlYjFiZTY2Zi4uMWVjZjJjZWUzNDNiIDEwMDY0NAo+
ID4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gPj4+PiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiA+Pj4+IEBAIC0xNjQzLDggKzE2
NDMsNyBAQCBzdGF0aWMgaW50IHN1bnhpX25hbmRfaHdfZWNjX2N0cmxfaW5pdChzdHJ1Y3QgbmFu
ZF9jaGlwICpuYW5kLAo+ID4+Pj4gIAkJZWNjLT5zaXplID0gMTAyNDsKPiA+Pj4+ICAJCW5zZWN0
b3JzID0gbXRkLT53cml0ZXNpemUgLyBlY2MtPnNpemU7Cj4gPj4+PiAgCj4gPj4+PiAtCQkvKiBS
ZXNlcnZlIDIgYnl0ZXMgZm9yIHRoZSBCQk0gKi8KPiA+Pj4+IC0JCWJ5dGVzID0gKG10ZC0+b29i
c2l6ZSAtIDIpIC8gbnNlY3RvcnM7Cj4gPj4+PiArCQlieXRlcyA9IG10ZC0+b29ic2l6ZSAvIG5z
ZWN0b3JzOyAgICAKPiA+Pj4KPiA+Pj4gSSdtIHNvcnJ5IGJ1dCBJIGRvbid0IHRoaW5rIHdlIGNh
biBtYWtlIHRoaXMgd29yay4gVGhpcyBjaGFuZ2Ugd291bGQKPiA+Pj4gYnJlYWsgYWxsIGV4aXN0
aW5nIHVzZXJzLi4uICAgIAo+ID4+Cj4gPj4gT0ssIGl0IGlzIG5vdCB0b28gbXVjaCBvZiBhbiBp
c3N1ZSBiZWNhdXNlIEkgY2FuIG1hbnVhbGx5IHNwZWNpZnkgdGhlCj4gPj4gRUNDIHBhcmFtZXRl
cnMgaW4gdGhlIGRldmljZXRyZWUuIERvIHlvdSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBmaXgK
PiA+PiB0aGlzIHdoZW4gYWRkaW5nIG5ldyBoYXJkd2FyZSB2YXJpYW50cy9jb21wYXRpYmxlIHN0
cmluZ3M/ICAKPiA+IAo+ID4gQWN0dWFsbHksIGxvb2tpbmcgYXQgdGhlIGNvZGUgYWdhaW4sIEkg
ZG9uJ3QgZ2V0IGhvdyB0aGUgYWJvdmUgZGlmZgo+ID4gY291bGQgYmUgdmFsaWQuIFRoZSAibWF4
aW1pemUgc3RyZW5ndGgiIGxvZ2ljIChpbiB3aGljaCB0aGlzIGRpZmYgaXMpCj4gPiBsb29rcyBm
b3IgdGhlIGJpZ2dlc3QgcmVnaW9uIHRvIHN0b3JlIEVDQyBieXRlcy4gVGhlc2UgYnl0ZXMgY2Fu
bm90Cj4gPiBiZSBzdG9yZWQgb24gdGhlIEJCTSwgd2hpY2ggIm10ZC0+b29ic2l6ZSAtIDIiIHRy
aWVzIHRvIGF2b2lkLCBzbyB3ZQo+ID4gY2Fubm90IGdldCByaWQgb2YgdGhpcy4gIAo+IAo+IFJp
Z2h0LCB3ZSBjYW5ub3Qgb3ZlcmxhcCB0aGUgQkJNLCBidXQgdGhlIEJCTSBpcyBhY2NvdW50ZWQg
Zm9yIGluIHRoZQo+IGxpbmUgYmVsb3c6Cj4gCj4gICAvKiA0IG5vbi1FQ0MgYnl0ZXMgYXJlIGFk
ZGVkIGJlZm9yZSBlYWNoIEVDQyBieXRlcyBzZWN0aW9uICovCj4gICBieXRlcyAtPSA0Owo+IAo+
IE5vcm1hbGx5IHRob3NlIDQgYnl0ZXMgYXJlIGFsbCBmcmVlIE9PQiwgYnV0IGZvciB0aGUgZmly
c3QgRUNDIHN0ZXAsCj4gdGhvc2UgYXJlIHNwbGl0IGludG8gMiBmcmVlIGJ5dGVzIGFuZCAyIEJC
TSBieXRlczoKPiAKPiAgIC8qCj4gICAgKiBUaGUgZmlyc3QgMiBieXRlcyBhcmUgdXNlZCBmb3Ig
QkIgbWFya2VycywgaGVuY2Ugd2UKPiAgICAqIG9ubHkgaGF2ZSAyIGJ5dGVzIGF2YWlsYWJsZSBp
biB0aGUgZmlyc3QgdXNlciBkYXRhCj4gICAgKiBzZWN0aW9uLgo+ICAgICovCj4gICBpZiAoIXNl
Y3Rpb24gJiYgZWNjLT5lbmdpbmVfdHlwZSA9PSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9IT1NU
KSB7Cj4gICAgICAgICAgIG9vYnJlZ2lvbi0+b2Zmc2V0ID0gMjsKPiAgICAgICAgICAgb29icmVn
aW9uLT5sZW5ndGggPSAyOwo+IAo+ICAgICAgICAgICByZXR1cm4gMDsKPiAgIH0KPiAKPiBTbyBp
ZiB3ZSBzdWJ0cmFjdCA0IGJ5dGVzIGZvciB0aGUgZWFjaCBmcmVlIE9PQiBhcmVhLCBpbmNsdWRp
bmcgdGhlCj4gZmlyc3Qgb25lLCBhbmQgYWxzbyBzdWJ0cmFjdCAyIGJ5dGVzIGZvciB0aGUgQkJN
LCB3ZSBhcmUgZG91YmxlLWNvdW50aW5nCj4gdGhlIEJCTS4gSSBzaG91bGQgaGF2ZSBtYWRlIG15
IGNvbW1pdCBtZXNzYWdlIGNsZWFyZXIuIEJ1dCBJIGFtIGdvaW5nIHRvCj4gZHJvcCB0aGlzIHBh
dGNoIGFueXdheS4KCkFoLCB5ZXMsIHlvdSBhcmUgYWJzb2x1dGVseSByaWdodCwgdGhlbi4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
