Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAC2C3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 16:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1R7ks+bEvGvMp2sgTX+yup3WwbBx3n5cafdMhQUjuM=; b=xJ1uuDRQ11a9xA
	2H4ZCs4btxezUxtFMY68BJ9MTPLqJJ5shOLH2fSdEnQzsci3OjxpxSN8j1mzxE2LtqkYPhZAPGjkA
	xH9Q5q23/+sFYBtKKrk61qUoOzt7+IuxD0SPqokqMBedVc7GwVGdRiMVs3ipvoB4q8uihV17sNqlc
	wLZL4CgOnFJnlVTyo1ZLv4F1Y4Wh+LMa/9BUvQBrkvF4bHfYlUOQuUEf7T1WjvZjLUZm7GvsBEx4M
	kwTRHh9FVnfFOJwH8idjFbBsDi/7Tm4TtGSZm15HiJpXGjHBf2ErH/R37Cgu8ZUlq8znoo+GrJ7gB
	RaW3pfMWTDbvUMhAYGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNgC-00CkNV-F7; Mon, 02 Jan 2023 16:28:52 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNeF-00CjlO-B6; Mon, 02 Jan 2023 16:26:53 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 6E37A5C0066;
	Mon,  2 Jan 2023 11:26:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 02 Jan 2023 11:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672676810; x=
	1672763210; bh=9SnjoCxG6lJy1Dd9d7mL56nMbg9UksLtOGhA65L1Kn0=; b=x
	KrbRR/ZdOi8eGOcYKwhsEjQVptwFPha0v/MoxmypCLM+LSfQUFxTUH6Cr2we/g6N
	IrCC71Dr0FbNtZP/uZTphJ2KAvS6euiV8S1Glfl0u5+zFiH+ak3dIhpDA3XBw9lU
	FCIRZpDRSAuIg4gTBxU9kT6Uc4nhaNEUpo2fGK4l684MQNBnqs1XsDoG+kfP4IFC
	hSFatowXm5ghgCMG5xEOdqpLEL3ZysR2e2qgQrZ6uWCBTxtOGpx17D5lPyAUQQiq
	4qnuVy7H4ptjfl5DTWlSF9L0mCQgAsPZA5QpdcTCNAK/D7A+/OWgynwOdp24FwcN
	HWejGwSsDwjmgXMSHC4MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672676810; x=
	1672763210; bh=9SnjoCxG6lJy1Dd9d7mL56nMbg9UksLtOGhA65L1Kn0=; b=c
	yrsp4gZcmHkoD8wOYxkCrQQ3cqqGJ8UI6NIIfsnngQNOhlgGxLmjzFruFeXvNK+L
	Ug49ZxUZGHAefZ4Wx9JSON3RgLxSVs3/xJo2W3BJsXlimC/0EoRTlArraaSNXFs1
	gP43NBla16mG//viKkkbNWs9MKt5ZiXCFYqhoHzq3x6FmSQs+yZlBK+FVFGHe42b
	8zpH2eVTk3gy2twCmwBwIplVdkFGvD2dS9hggdvtCnaMCIXmuvgaUwlZLZMWhv3E
	KObnJpnzsEGw0PILnm1xih6rSedpuXHugMFBRk+xwBHpjP86rMPhGN0bKLMpygYI
	UGNrVfU5xX/9899vhu0XQ==
X-ME-Sender: <xms:yQWzY7LqfHoQPy9Uga2nhdISMaseOUnCfPj5czN5vHks-VmyWD250Q>
    <xme:yQWzY_L1GWLESmwmONkKBkUCccwfpyoJZm8bzxVLnevLBMZoqXt0PAF0z5vvtHjAL
    XAN3vC3d8ypmHzyKA>
X-ME-Received: <xmr:yQWzYzt8faa2X2ClP23oFt2jsWZQUwhoU9owaqzw4INqNF56DN5iTlSIzP9gBwOgE6z4Pphu6YKafV3iOYANGgwiqD_TCWjIVa1imfcs_VNzAj10OCtkTV0pbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgeeikeeufedvvdeuteeivdeiffdtgfdtfeejgfetfeefgeffgfdv
    ffehjedvueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:yQWzY0ZTUpYipH2Wc7Tt0TqsErPiKmeLbUsObUj6R03D1zUe_GQCEQ>
    <xmx:yQWzYyYdqqxXo98MrcGndfDopwVLohXCqTk1Zil9CZ01d3jdSuwFNQ>
    <xmx:yQWzY4Apja5s1FHpfCdAqG-XkIRPpMQlrusIG4nUklMERkgZLW3bLA>
    <xmx:ygWzY4nRWuhQ4U4VVcZOaCXZlsB6XDVfceKomJDPgmaWrtGamCAPiQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jan 2023 11:26:49 -0500 (EST)
Message-ID: <e21aba9f-1afd-2615-fe00-3ee4176b9080@sholland.org>
Date: Mon, 2 Jan 2023 10:26:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20221229181526.53766-1-samuel@sholland.org>
 <20221229181526.53766-7-samuel@sholland.org> <20230102102123.511d337d@xps-13>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 6/7] mtd: rawnand: sunxi: Update OOB layout to match
 hardware
In-Reply-To: <20230102102123.511d337d@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_082651_529075_9728E967 
X-CRM114-Status: GOOD (  22.47  )
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

SGkgTWlxdcOobCwKCk9uIDEvMi8yMyAwMzoyMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBT
YW11ZWwsCj4gCj4gc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZSBvbiBUaHUsIDI5IERlYyAyMDIy
IDEyOjE1OjI1IC0wNjAwOgo+IAo+PiBXaGVuIHVzaW5nIHRoZSBoYXJkd2FyZSBFQ0MgZW5naW5l
LCB0aGUgT09CIGRhdGEgaXMgbWFkZSBhdmFpbGFibGUgaW4KPj4gdGhlIE5GQ19SRUdfVVNFUl9E
QVRBIHJlZ2lzdGVycywgb25lIDMyLWJpdCB3b3JkIHBlciBFQ0Mgc3RlcC4gQW55Cj4+IGFkZGl0
aW9uYWwgYnl0ZXMgYXJlIG9ubHkgYWNjZXNzaWJsZSB0aHJvdWdoIHJhdyByZWFkcyBhbmQgc29m
dHdhcmUKPj4gZGVzY3JhbWJsaW5nLiBGb3IgZWZmaWNpZW5jeSwgYW5kIHRvIG1hdGNoIHRoZSB2
ZW5kb3IgZHJpdmVyLCBpZ25vcmUKPj4gdGhlc2UgZXh0cmEgYnl0ZXMuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPgo+PiAtLS0KPj4KPj4g
IGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyB8IDcgKysrKysrKwo+PiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5j
Cj4+IGluZGV4IDhlODczZjRmZWM5YS4uYTNiYzlmN2Y5ZTVhIDEwMDY0NAo+PiAtLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvc3VueGlfbmFuZC5jCj4+IEBAIC0xNjA0LDYgKzE2MDQsMTMgQEAgc3RhdGljIGludCBzdW54
aV9uYW5kX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwK
Pj4gIAkJcmV0dXJuIDA7Cj4+ICAJfQo+PiAgCj4+ICsJLyoKPj4gKwkgKiBUaGUgY29udHJvbGxl
ciBkb2VzIG5vdCBwcm92aWRlIGFjY2VzcyB0byBPT0IgYnl0ZXMKPj4gKwkgKiBwYXN0IHRoZSBl
bmQgb2YgdGhlIEVDQyBkYXRhLgo+PiArCSAqLwo+PiArCWlmIChzZWN0aW9uID09IGVjYy0+c3Rl
cHMgJiYgZWNjLT5lbmdpbmVfdHlwZSA9PSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9IT1NUKQo+
PiArCQlyZXR1cm4gLUVSQU5HRTsKPiAKPiBBZ2FpbiwgSSBhbSBzb3JyeSBidXQgSSBjYW5ub3Qg
dGFrZSB0aGlzIGNoYW5nZSwgaXQgd291bGQgdHlwaWNhbGx5Cj4gYnJlYWsgamZmczIgdXNlcnMg
KGlmIGFueT8pIDooCgpDb25zaWRlcmluZyB0aGUgYnVnIEkgZml4ZWQgaW4gdGhlIHByZXZpb3Vz
IHBhdGNoLCBhbmQgdGhlIGZhY3QgdGhhdAptdGRfb29ibGF5b3V0X2ZyZWUoKSB6ZXJvZXMgb3V0
IHRoZSBzdHJ1Y3R1cmUgYmVmb3JlIGNhbGxpbmcgdGhlIC5mcmVlCmNhbGxiYWNrLCB0aGF0IHJl
Z2lvbiB3YXMgYmVpbmcgcmVwb3J0ZWQgd2l0aCBhIGxlbmd0aCBvZiB6ZXJvIGFscmVhZHkuClNv
IEkgZG9uJ3QgdGhpbmsgYW55b25lIGNvdWxkIGhhdmUgYmVlbiB1c2luZyB0aG9zZSBieXRlcyBh
bnl3YXkuCgpJIGFtIGxvb2tpbmcgZm9yIGEgc29sdXRpb24gaGVyZSBiZWNhdXNlIHRoZSBFQ0Mv
c2NyYW1ibGluZyBlbmdpbmUKcmVhbGx5IHByb3ZpZGVzIG5vIHdheSB0byBhY2Nlc3MgdGhlc2Ug
Ynl0ZXMuIFJlYWRpbmcgdGhlbSByZXF1aXJlcwp0dXJuaW5nIG9mZiB0aGUgRUNDIGVuZ2luZSwg
cGVyZm9ybWluZyBhbm90aGVyIHJlYWQgY29tbWFuZCwgYW5kIHRoZW4KZGVzY3JhbWJsaW5nIGlu
IHNvZnR3YXJlLiBTbyB3ZSBhcmUgc29ydCBvZiBseWluZyB3aGVuIHdlIGNsYWltIHRob3NlCmJ5
dGVzIGFyZSBhdmFpbGFibGUgd2l0aCBoYXJkd2FyZSBFQ0MgZW5hYmxlZC4KCklmIHRoaXMgY2hh
bmdlIGNhbm5vdCBiZSBtYWRlIGFzLWlzLCBpcyB0aGVyZSBhbnkgd2F5IHRoZSB1c2VyIGNvdWxk
IG9wdAppbiB0byB0aGUgbmV3IGxheW91dCwgdG8gZ2V0IHRoZSBpbXByb3ZlZCBwZXJmb3JtYW5j
ZT8KClJlZ2FyZHMsClNhbXVlbAoKPj4gIAlvb2JyZWdpb24tPm9mZnNldCA9IHNlY3Rpb24gKiAo
ZWNjLT5ieXRlcyArIDQpOwo+PiAgCj4+ICAJaWYgKHNlY3Rpb24gPCBlY2MtPnN0ZXBzKQo+IAo+
IAo+IFRoYW5rcywKPiBNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
