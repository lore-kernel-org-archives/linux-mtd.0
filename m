Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1AECDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdG5RXHi2yjXuzZtjdCGDREmglnAS89omGEtc8kSYSI=; b=VNLEf/zmLGwbNX
	f6WeJRPDB+vn/RbKodhh0YEyA4SwD598U8gqgE1Uhxj2a/AkUiMHWSekQKIq2xx/08MxIp6T6lWMW
	QZkN3E7OqGFy/GhKbysC1RewQOXc9dGiijQupoDamrmiCe2RvrJDZEDHhSQ6LFpv6EKbO5lpwLdrs
	KEM8S24ea3gqmsdPWUjJIobVEBDsdIi+bOonzA2u3xxskMwgXGk1I2xsYf6QQVBmAMoL9qoVk5oZd
	nQpL+SYv3y9DjDpc4zG1TnBVz2zav4Y+OE7I2y/T+OUN3mwCwAHObIvPQl/CO9P6I4v7IYgvuuTJE
	+xhNKw7UzI60detdZEVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqRd-006mwP-32;
	Mon, 23 Oct 2023 08:37:53 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqRb-006mum-0j
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 08:37:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09C1CC0004;
	Mon, 23 Oct 2023 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698050266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v2qWqEWwWxgzTB5vBK4eUVGzwwb4KGMgVk1+rMugYSY=;
	b=I+qXGtKjWACc+95J3bxM740AW7ZhuwMsitmdSpakULn3nkAShIyZmAK/lJnq1wlUd7qNKp
	ToHV1Zz1KfIOmy74YTi2yd0Dm5UQ7Y7NApLfo2z48EbNSxuJKEA0Sh7wT5FBvI1DIByCaz
	IUgnve6EG+gsLFmHDpsuHgWC2YSFPnRBvBejHvqykWy0XjriEmjVqoZiYoIdR3ePVH0MF1
	shAKlro8Chqv6dCsMXzdTXJTIpqDc7Z+Vt0M3HLIN5tDbXJm8j3s45WdvqyN9eJzwk+94m
	H8cKtVya75rHIMRlfJU2ZKdKLm3yUiPq1aHPGSTh+5FIF0SocS1LqmCQOlmkLA==
Date: Mon, 23 Oct 2023 10:37:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Nicolas Pitre
 <nico@fluxnic.net>
Subject: Re: [PATCH v4] mtd: cfi_cmdset_0001: Byte swap OTP info
Message-ID: <20231023103745.054bc2d3@xps-13>
In-Reply-To: <CACRpkdYaq=RxgLJhRanfgw1+280N1K-aRvpy_BTM3SYY9Xtokw@mail.gmail.com>
References: <20231020-mtd-otp-byteswap-v4-1-0d132c06aa9d@linaro.org>
	<20231023102552.4b053b17@xps-13>
	<CACRpkdYaq=RxgLJhRanfgw1+280N1K-aRvpy_BTM3SYY9Xtokw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_013751_559203_57EF405D 
X-CRM114-Status: GOOD (  28.39  )
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

SGkgTGludXMsCgpsaW51cy53YWxsZWlqQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAyMyBPY3Qg
MjAyMyAxMDozNToyNCArMDIwMDoKCj4gT24gTW9uLCBPY3QgMjMsIDIwMjMgYXQgMTA6MjXigK9B
TSBNaXF1ZWwgUmF5bmFsCj4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+IAo+
ID4gbGludXMud2FsbGVpakBsaW5hcm8ub3JnIHdyb3RlIG9uIEZyaSwgMjAgT2N0IDIwMjMgMjI6
MzA6MjkgKzAyMDA6Cj4gPiAgCj4gPiA+IEN1cnJlbnRseSB0aGUgb2Zmc2V0IGludG8gdGhlIGRl
dmljZSB3aGVuIGxvb2tpbmcgZm9yIE9UUAo+ID4gPiBiaXRzIGNhbiBnbyBvdXRzaWRlIG9mIHRo
ZSBhZGRyZXNzIG9mIHRoZSBNVEQgTk9SIGRldmljZXMsCj4gPiA+IGFuZCBpZiB0aGF0IG1lbW9y
eSBpc24ndCByZWFkYWJsZSwgYmFkIHRoaW5ncyBoYXBwZW4KPiA+ID4gb24gdGhlIElYUDR4eCAo
YWRkZWQgcHJpbnRzIHRoYXQgaWxsdXN0cmF0ZSB0aGUgcHJvYmxlbSBiZWZvcmUKPiA+ID4gdGhl
IGNyYXNoKToKPiA+ID4KPiA+ID4gY2ZpX2ludGVsZXh0X290cF93YWxrIHdhbGsgT1RQIG9uIGNo
aXAgMCBzdGFydCBhdCByZWdfcHJvdF9vZmZzZXQgMHgwMDAwMDEwMAo+ID4gPiBpeHA0eHhfY29w
eV9mcm9tIGNvcHkgZnJvbSAweDAwMDAwMTAwIHRvIDB4Yzg4MGRkNzgKPiA+ID4gY2ZpX2ludGVs
ZXh0X290cF93YWxrIHdhbGsgT1RQIG9uIGNoaXAgMCBzdGFydCBhdCByZWdfcHJvdF9vZmZzZXQg
MHgxMjAwMDAwMAo+ID4gPiBpeHA0eHhfY29weV9mcm9tIGNvcHkgZnJvbSAweDEyMDAwMDAwIHRv
IDB4Yzg4MGRkNzgKPiA+ID4gODwtLS0gY3V0IGhlcmUgLS0tCj4gPiA+IFVuYWJsZSB0byBoYW5k
bGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyBkYjAwMDAwMAo+ID4g
PiBbZGIwMDAwMDBdICpwZ2Q9MDAwMDAwMDAKPiA+ID4gKC4uLikKPiA+ID4KPiA+ID4gVGhpcyBo
YXBwZW5zIGluIHRoaXMgY2FzZSBiZWNhdXNlIHRoZSBJWFA0eHggaXMgYmlnIGVuZGlhbiBhbmQK
PiA+ID4gdGhlIDMyLSBhbmQgMTYtYml0IGZpZWxkcyBpbiB0aGUgc3RydWN0IGNmaV9pbnRlbGV4
dF9vdHBpbmZvIGFyZSBub3QKPiA+ID4gcHJvcGVybHkgYnl0ZXN3YXBwZWQuIENvbXBhcmUgdG8g
aG93IHRoZSBjb2RlIGluIHJlYWRfcHJpX2ludGVsZXh0KCkKPiA+ID4gYnl0ZXN3YXBzIHRoZSBm
aWVsZHMgaW4gc3RydWN0IGNmaV9wcmlfaW50ZWxleHQuCj4gPiA+Cj4gPiA+IEFkZGluZyBhIHNt
YWxsIGJ5dGUgc3dhcHBpbmcgbG9vcCBmb3IgdGhlIE9UUCBpbiByZWFkX3ByaV9pbnRlbGV4dCgp
Cj4gPiA+IGFuZCB0aGUgY3Jhc2ggZ29lcyBhd2F5Lgo+ID4gPgo+ID4gPiBUaGUgcHJvYmxlbSB3
ZW50IHVubm90aWNlZCBmb3IgbWFueSB5ZWFycyB1bnRpbCBJIGVuYWJsZWQKPiA+ID4gQ09ORklH
X01URF9PVFAgb24gdGhlIElYUDR4eCBhcyB3ZWxsLCB0cmlnZ2VyaW5nIHRoZSBidWcuCj4gPiA+
Cj4gPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICAKPiA+Cj4gPiBXb3VsZCB5b3UgbGlr
ZSB0byBhZGQgYSBGaXhlcyB0YWcgYXMgd2VsbD8gT3IgaXMgdGhpcyBza2lwcGVkIG9uCj4gPiBw
dXJwb3NlPyAgCj4gCj4gWWVzIHRoZSBhY3R1YWwgY29tbWl0IHByZWRhdGVzIGV4aXN0aW5nIGdp
dCBoaXN0b3J5Li4uIDovCj4gCj4gR2l0IGJsYW1lIGxvb2tzIGxpa2UgdGhhdDoKPiAKPiBeMWRh
MTc3ZTRjM2Y0IChMaW51cyBUb3J2YWxkcyAgICAgICAgIDIwMDUtMDQtMTYgMTU6MjA6MzYgLTA3
MDAgIDQyMykKPiBeMWRhMTc3ZTRjM2Y0IChMaW51cyBUb3J2YWxkcyAgICAgICAgIDIwMDUtMDQt
MTYgMTU6MjA6MzYgLTA3MDAgIDQyNCkKPiAgICAgICAgICAvKiBQcm90ZWN0aW9uIFJlZ2lzdGVy
IGluZm8gKi8KPiBiMzU5ZWQ1MTg0YWViIChKZWFuLVBoaWxpcHBlIEJydWNrZXIgIDIwMjAtMDQt
MTcgMTY6MjM6MjYgKzAyMDAgIDQyNSkKPiAgICAgICAgICBpZiAoZXh0cC0+TnVtUHJvdGVjdGlv
bkZpZWxkcykKPiBiMzU5ZWQ1MTg0YWViIChKZWFuLVBoaWxpcHBlIEJydWNrZXIgIDIwMjAtMDQt
MTcgMTY6MjM6MjYgKzAyMDAgIDQyNikKPiAgICAgICAgICAgICAgICAgIGV4dHJhX3NpemUgKz0g
KGV4dHAtPk51bVByb3RlY3Rpb25GaWVsZHMgLSAxKSAqCj4gYjM1OWVkNTE4NGFlYiAoSmVhbi1Q
aGlsaXBwZSBCcnVja2VyICAyMDIwLTA0LTE3IDE2OjIzOjI2ICswMjAwICA0MjcpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3QgY2ZpX2ludGVsZXh0X290cGlu
Zm8pOwo+IAo+IEplYW4tUGhpbGlwcGUncyBwYXRjaCBpcyBub3QgdGhlIHJvb3QgY2F1c2UgQUZB
SUNULCBidXQgc29tZXRoaW5nCj4gcHJlZGF0aW5nIGl0LCBhbmQgcHJlZGF0aW5nIGdpdCBoaXN0
b3J5Lgo+IAo+IFRoZSBmaXggZWFzaWx5IGFwcGxpZXMgdG8gYWxsIG1haW50YWluZWQgc3RhYmxl
IGtlcm5lbHMuCgpBY2suCgo+ID4gPiBSZXZpZXdlZC1ieTogTmljb2xhcyBQaXRyZSA8bmljb0Bm
bHV4bmljLm5ldD4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPgo+ID4gPiAtLS0KPiA+ID4gQ2hhbmdlTG9nIHYzLT52NDoKPiA+ID4g
LSBDb2xsZWN0ZWQgTmljbydzIEFDSy4KPiA+ID4gLSBTdGFsbGVkIHNpbmNlIGp1bmUhIEhhcyB0
aGlzIGJlZW4gbWlzc2VkPyAgCj4gPgo+ID4gT3VyIGN1cnJlbnQgb3JnYW5pemF0aW9uIHJlbGll
cyBvbiBWaWduZXNoIHRvIHBpY2stdXAgKG9yIHRlbGwgbWUgdG8KPiA+IHBpY2stdXApIGNmaSBw
YXRjaGVzLiBCdXQgaGUgaXMgc2xpZ2h0bHkgbGVzcyBhY3RpdmUgdGhlc2UgZGF5cywgc28gaWYg
SQo+ID4gZG9uJ3QgZ2V0IGFueSBmZWVkYmFjayBmcm9tIGhpbSBzb29uIEkgd2lsbCB0YWtlIGl0
IGZvciB0aGUgbmV4dCBtZXJnZQo+ID4gd2luZG93Lgo+ID4KPiA+IFNvcnJ5IGZvciB0aGUgZGVs
YXkgYW55d2F5LiAgCj4gCj4gTm8gd29ycmllcyBpdCdzIG5vdCBsaWtlIHRoZSBwYXRjaCBpcyB1
cmdlbnQuCgpIYWhhLCB3ZWxsLCB5ZXMgOikKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
