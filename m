Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75899C3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 16:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tb7OuKnMk3Cpf9MKHQnjcAau4XoGiOAl88ikOREey0M=; b=PAqFVHVA2u8qwY
	ALc9fLuGk6hrAs3cyzAEqNlNWhTTJXHnaav+YhmMgAzzQ9BT/3fZH3QeThMhmNU2nEQIdae60UW6h
	oJ1R+rr+x3hZEAUEV2LECWo+RO9GWH9U/xzmSTKM1NfLvJ21oWc6bbpSlX+QXDpd47wnnyHTHlbpR
	E16CuubHR9ANNIm4rfkgVjApzjQoMomu35H8ahH+CRB0F8SwACKMTnY7Q36Rt41Aq3VOiKmPXjZhH
	VxSSdx9uHjzTWFPpCzqDCTzN6EhNRqiayD3ufK34MJFLPi0/mJCl8nbweTpmKxys7+Ya1F8Xh3riC
	Lygc+2LGKfBbM30W64YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNwt-00Cq4o-U4; Mon, 02 Jan 2023 16:46:08 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNwH-00CpmH-K2; Mon, 02 Jan 2023 16:45:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 244F7C0009;
	Mon,  2 Jan 2023 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672677922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5O8OXS7nc8duFjds7VaePab6wVG7wkizTo7pWgR7AjU=;
	b=OBqHHGO6YyKEC+KEYE13IBtCFpLbiKK7TaqZsET9nQAswKq0CXiBI4tkhPIX67Hp3HBFDU
	c8h3kNIAuiKq2QHFEgMZXq9HfO7H8QPChWGak6Bbnhe6EIV5NjNPWwerot7QJg3hh8hKc9
	mhrdkTGlJ1LWSNQNuIA7dxShpjeE6in4YcAbFSM6jK144YqIuHMCKAlJWgHZbsM1rM9fpF
	KUv0OXAhO5NwaRoQz+91haa6YXB+SFSd0VvCDSCv2gyC5ZthwtRPSEouxslpwkyw7SCcy/
	2WjXAeHK9z8kzPMbbPTqugOS1Xi7T0InVPvYyGf34PhjA2EWB4HOwa1fhO4Uwg==
Date: Mon, 2 Jan 2023 17:45:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/7] mtd: rawnand: sunxi: Fix ECC strength maximization
Message-ID: <20230102174517.1ccb3654@xps-13>
In-Reply-To: <4207d4eb-31d5-31c0-1a7f-67ec00b63f58@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
	<20221229181526.53766-5-samuel@sholland.org>
	<20230102101132.66aa1a1d@xps-13>
	<4207d4eb-31d5-31c0-1a7f-67ec00b63f58@sholland.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_084530_162681_3EDE4E12 
X-CRM114-Status: GOOD (  25.08  )
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
MDk6NTk6MjkgLTA2MDA6Cgo+IEhpIE1pcXXDqGwsCj4gCj4gT24gMS8yLzIzIDAzOjExLCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgU2FtdWVsLAo+ID4gCj4gPiBzYW11ZWxAc2hvbGxhbmQu
b3JnIHdyb3RlIG9uIFRodSwgMjkgRGVjIDIwMjIgMTI6MTU6MjMgLTA2MDA6Cj4gPiAgIAo+ID4+
IFRoaXMgaXMgYWxyZWFkeSBhY2NvdW50ZWQgZm9yIGluIHRoZSBzdWJ0cmFjdGlvbiBmb3IgT09C
LCBzaW5jZSB0aGUgQkJNCj4gPj4gb3ZlcmxhcHMgdGhlIGZpcnN0IE9PQiBkd29yZC4gV2l0aCB0
aGlzIGNoYW5nZSwgdGhlIGRyaXZlciBwaWNrcyB0aGUKPiA+PiBzYW1lIEVDQyBzdHJlbmd0aCBh
cyB0aGUgdmVuZG9yIGRyaXZlci4KPiA+Pgo+ID4+IEZpeGVzOiA0Nzk2ZDg2NTU5MTUgKCJtdGQ6
IG5hbmQ6IHN1bnhpOiBTdXBwb3J0IEVDQyBtYXhpbWl6YXRpb24iKQo+ID4+IFNpZ25lZC1vZmYt
Ynk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPgo+ID4+IC0tLQo+ID4+Cj4g
Pj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyB8IDMgKy0tCj4gPj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9zdW54aV9uYW5kLmMKPiA+PiBpbmRleCAxYmRkZWIxYmU2NmYuLjFlY2YyY2VlMzQz
YiAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiA+
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiA+PiBAQCAtMTY0Myw4
ICsxNjQzLDcgQEAgc3RhdGljIGludCBzdW54aV9uYW5kX2h3X2VjY19jdHJsX2luaXQoc3RydWN0
IG5hbmRfY2hpcCAqbmFuZCwKPiA+PiAgCQllY2MtPnNpemUgPSAxMDI0Owo+ID4+ICAJCW5zZWN0
b3JzID0gbXRkLT53cml0ZXNpemUgLyBlY2MtPnNpemU7Cj4gPj4gIAo+ID4+IC0JCS8qIFJlc2Vy
dmUgMiBieXRlcyBmb3IgdGhlIEJCTSAqLwo+ID4+IC0JCWJ5dGVzID0gKG10ZC0+b29ic2l6ZSAt
IDIpIC8gbnNlY3RvcnM7Cj4gPj4gKwkJYnl0ZXMgPSBtdGQtPm9vYnNpemUgLyBuc2VjdG9yczsg
IAo+ID4gCj4gPiBJJ20gc29ycnkgYnV0IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIG1ha2UgdGhpcyB3
b3JrLiBUaGlzIGNoYW5nZSB3b3VsZAo+ID4gYnJlYWsgYWxsIGV4aXN0aW5nIHVzZXJzLi4uICAK
PiAKPiBPSywgaXQgaXMgbm90IHRvbyBtdWNoIG9mIGFuIGlzc3VlIGJlY2F1c2UgSSBjYW4gbWFu
dWFsbHkgc3BlY2lmeSB0aGUKPiBFQ0MgcGFyYW1ldGVycyBpbiB0aGUgZGV2aWNldHJlZS4gRG8g
eW91IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGZpeAo+IHRoaXMgd2hlbiBhZGRpbmcgbmV3IGhh
cmR3YXJlIHZhcmlhbnRzL2NvbXBhdGlibGUgc3RyaW5ncz8KCkFjdHVhbGx5LCBsb29raW5nIGF0
IHRoZSBjb2RlIGFnYWluLCBJIGRvbid0IGdldCBob3cgdGhlIGFib3ZlIGRpZmYKY291bGQgYmUg
dmFsaWQuIFRoZSAibWF4aW1pemUgc3RyZW5ndGgiIGxvZ2ljIChpbiB3aGljaCB0aGlzIGRpZmYg
aXMpCmxvb2tzIGZvciB0aGUgYmlnZ2VzdCByZWdpb24gdG8gc3RvcmUgRUNDIGJ5dGVzLiBUaGVz
ZSBieXRlcyBjYW5ub3QKYmUgc3RvcmVkIG9uIHRoZSBCQk0sIHdoaWNoICJtdGQtPm9vYnNpemUg
LSAyIiB0cmllcyB0byBhdm9pZCwgc28gd2UKY2Fubm90IGdldCByaWQgb2YgdGhpcy4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
