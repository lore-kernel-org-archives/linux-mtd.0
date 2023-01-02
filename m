Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D8AC3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 17:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lDB4HcHIs0nScVhpyxjwlhQQtPxF5UJx3hAtBSsY/Q=; b=g3py7sAENG5uwS
	z/i3npfqAD/3CUns6laYMgOA//iPBivZRR+26fE0b9iMWOh2IiAnZFVYsm+Tu8+cNAnHB3OImD5bl
	vPNUk3nWxUA11EvIQIf2hyVkOwnB/dm4Vci/SRf5grP6y8ifdV35Da+wG/1+0RJGtnztt2iKXel58
	4u9/l511YiHVjc1aG9qI8wFAKlcUoAaQvppEH0s7FFAvkgFw2PT6S1JuTrBenUo6H57IsoJ1g2oYE
	dUDGi3NmN5N6s0hymFnt7Q7ptJisIpeiFmGK7D5XlRyHVgeWcbpaZRbwalcIniJQ+Pnc7cFqfoSuH
	9KtkYx/grfiWjzyNGnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCOHG-00Cxvp-Qx; Mon, 02 Jan 2023 17:07:11 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCOGa-00Cxib-By; Mon, 02 Jan 2023 17:06:30 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 207E45C0096;
	Mon,  2 Jan 2023 12:06:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 02 Jan 2023 12:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672679183; x=
	1672765583; bh=ubVMmek62b2FW/lrihLkt+k98Rt0VqU7QHx3G8jOQhs=; b=T
	DLBM0ZlpSQ5f13Md/yEmLhdRczLe83CukeKYPEHYQZQrHnwBes+mVchAGa9A6FfD
	1b7PAxouNYAjvWhwLFIXNIzZpa97wBI/6tYKcL592zM0kSINNNexh7qwNAE5VvEU
	dKEWL82+abmQFj8ysaXF98kBjCiL0sbM9DyYpQsQd8vShzzyTTIFaE7s0RuXhh+b
	BPWNwWW5yvqX9u/TmqFzFwfnbM4zMF7an1Y5zwI9UfkcJN5D/bNV6aJemREN8/7U
	WCQ648+RHHIR3kxmgPHs06AWRu9XKHSkmyRImL+s72wZggvzSpQydFoWVKPKJojv
	jcoyLieHnBpZbp1n5brFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672679183; x=
	1672765583; bh=ubVMmek62b2FW/lrihLkt+k98Rt0VqU7QHx3G8jOQhs=; b=S
	zUpkNhzIQneZi19EAmLimcWQzfkUj8LuN2QZQFec/YH2ig1DXjW7S6X51e+UgAhh
	XbCRfm4Ia7nb7PgBh95W+tHf1Y5wuIBGU7mcuVNBQjfxIhSLd7NUE6acdYgoYC3O
	OHk0NXSYPsFYY9SGfe1UVHRz0Wh2gHtIRp9VZcm7/ionYqQHCs9XtguuxAV4Sd8C
	Z5mM4jwUzuEFN9g/m5X8o8nfKFEFzLk5NbP0Fa6IK/HTVRKrJJLlV7cKBOMhkMMp
	q+zvYWcaSW2fivGJ9pU4z1uDhENbeQVwczqUE1KgVt+fU3dVASn3PE1gLrShW9j7
	uVCV/boYenu4dOHhayJlA==
X-ME-Sender: <xms:Dg-zY8MpW6yCKogrqcM9EEEsh3QWyf3DD1i6PPasguXY7SC9shvteg>
    <xme:Dg-zYy8WECzYL7C8jRwCYpoyBKVtXPqLFAmgvR9Vw0-xaKk2maJVHh-7CwS4pL6ZB
    _cLsInSBt-FMDe8Yg>
X-ME-Received: <xmr:Dg-zYzQEfGMAn7wHWugogLoxtPJa_7OxxgJl9jqw6X9UXpniZNYKd2JI5Dt1jf490olxJ5ozpUygbWylt_ajdTRCTyqv8LEHPWdBs3vshwMEcGkK3KwRNMGEWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgeeikeeufedvvdeuteeivdeiffdtgfdtfeejgfetfeefgeffgfdv
    ffehjedvueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:Dg-zY0vuZwSK3RZNsqLxyt6rnHVL7NF-ZI2lAButE5mG1jxY2i9T9w>
    <xmx:Dg-zY0ecvzM1g_7fY28XtzbsBJFFyLS9_sUyHjJOppGmqOKkCt8asw>
    <xmx:Dg-zY43wV1PVXa1Ow8CJf4DtXkQyVBnhl4dTX08m31gewxc7ZAghhw>
    <xmx:Dw-zY843USXsLuUw53gyd5fle5_8r8DnqnRKEUE1O3obbHO46GDs9w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jan 2023 12:06:21 -0500 (EST)
Message-ID: <6940e60e-834d-9cc6-c3b8-657b100ea5db@sholland.org>
Date: Mon, 2 Jan 2023 11:06:20 -0600
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
 <20221229181526.53766-5-samuel@sholland.org> <20230102101132.66aa1a1d@xps-13>
 <4207d4eb-31d5-31c0-1a7f-67ec00b63f58@sholland.org>
 <20230102174517.1ccb3654@xps-13>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 4/7] mtd: rawnand: sunxi: Fix ECC strength maximization
In-Reply-To: <20230102174517.1ccb3654@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_090629_401340_8085EDFA 
X-CRM114-Status: GOOD (  23.34  )
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

SGkgTWlxdcOobCwKCk9uIDEvMi8yMyAxMDo0NSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+PiBU
aGlzIGlzIGFscmVhZHkgYWNjb3VudGVkIGZvciBpbiB0aGUgc3VidHJhY3Rpb24gZm9yIE9PQiwg
c2luY2UgdGhlIEJCTQo+Pj4+IG92ZXJsYXBzIHRoZSBmaXJzdCBPT0IgZHdvcmQuIFdpdGggdGhp
cyBjaGFuZ2UsIHRoZSBkcml2ZXIgcGlja3MgdGhlCj4+Pj4gc2FtZSBFQ0Mgc3RyZW5ndGggYXMg
dGhlIHZlbmRvciBkcml2ZXIuCj4+Pj4KPj4+PiBGaXhlczogNDc5NmQ4NjU1OTE1ICgibXRkOiBu
YW5kOiBzdW54aTogU3VwcG9ydCBFQ0MgbWF4aW1pemF0aW9uIikKPj4+PiBTaWduZWQtb2ZmLWJ5
OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KPj4+PiAtLS0KPj4+Pgo+Pj4+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMgfCAzICstLQo+Pj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvc3VueGlfbmFuZC5jCj4+Pj4gaW5kZXggMWJkZGViMWJlNjZmLi4xZWNmMmNlZTM0M2Ig
MTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4+Pj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4+Pj4gQEAgLTE2NDMsOCAr
MTY0Myw3IEBAIHN0YXRpYyBpbnQgc3VueGlfbmFuZF9od19lY2NfY3RybF9pbml0KHN0cnVjdCBu
YW5kX2NoaXAgKm5hbmQsCj4+Pj4gIAkJZWNjLT5zaXplID0gMTAyNDsKPj4+PiAgCQluc2VjdG9y
cyA9IG10ZC0+d3JpdGVzaXplIC8gZWNjLT5zaXplOwo+Pj4+ICAKPj4+PiAtCQkvKiBSZXNlcnZl
IDIgYnl0ZXMgZm9yIHRoZSBCQk0gKi8KPj4+PiAtCQlieXRlcyA9IChtdGQtPm9vYnNpemUgLSAy
KSAvIG5zZWN0b3JzOwo+Pj4+ICsJCWJ5dGVzID0gbXRkLT5vb2JzaXplIC8gbnNlY3RvcnM7ICAK
Pj4+Cj4+PiBJJ20gc29ycnkgYnV0IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIG1ha2UgdGhpcyB3b3Jr
LiBUaGlzIGNoYW5nZSB3b3VsZAo+Pj4gYnJlYWsgYWxsIGV4aXN0aW5nIHVzZXJzLi4uICAKPj4K
Pj4gT0ssIGl0IGlzIG5vdCB0b28gbXVjaCBvZiBhbiBpc3N1ZSBiZWNhdXNlIEkgY2FuIG1hbnVh
bGx5IHNwZWNpZnkgdGhlCj4+IEVDQyBwYXJhbWV0ZXJzIGluIHRoZSBkZXZpY2V0cmVlLiBEbyB5
b3UgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gZml4Cj4+IHRoaXMgd2hlbiBhZGRpbmcgbmV3IGhh
cmR3YXJlIHZhcmlhbnRzL2NvbXBhdGlibGUgc3RyaW5ncz8KPiAKPiBBY3R1YWxseSwgbG9va2lu
ZyBhdCB0aGUgY29kZSBhZ2FpbiwgSSBkb24ndCBnZXQgaG93IHRoZSBhYm92ZSBkaWZmCj4gY291
bGQgYmUgdmFsaWQuIFRoZSAibWF4aW1pemUgc3RyZW5ndGgiIGxvZ2ljIChpbiB3aGljaCB0aGlz
IGRpZmYgaXMpCj4gbG9va3MgZm9yIHRoZSBiaWdnZXN0IHJlZ2lvbiB0byBzdG9yZSBFQ0MgYnl0
ZXMuIFRoZXNlIGJ5dGVzIGNhbm5vdAo+IGJlIHN0b3JlZCBvbiB0aGUgQkJNLCB3aGljaCAibXRk
LT5vb2JzaXplIC0gMiIgdHJpZXMgdG8gYXZvaWQsIHNvIHdlCj4gY2Fubm90IGdldCByaWQgb2Yg
dGhpcy4KClJpZ2h0LCB3ZSBjYW5ub3Qgb3ZlcmxhcCB0aGUgQkJNLCBidXQgdGhlIEJCTSBpcyBh
Y2NvdW50ZWQgZm9yIGluIHRoZQpsaW5lIGJlbG93OgoKICAvKiA0IG5vbi1FQ0MgYnl0ZXMgYXJl
IGFkZGVkIGJlZm9yZSBlYWNoIEVDQyBieXRlcyBzZWN0aW9uICovCiAgYnl0ZXMgLT0gNDsKCk5v
cm1hbGx5IHRob3NlIDQgYnl0ZXMgYXJlIGFsbCBmcmVlIE9PQiwgYnV0IGZvciB0aGUgZmlyc3Qg
RUNDIHN0ZXAsCnRob3NlIGFyZSBzcGxpdCBpbnRvIDIgZnJlZSBieXRlcyBhbmQgMiBCQk0gYnl0
ZXM6CgogIC8qCiAgICogVGhlIGZpcnN0IDIgYnl0ZXMgYXJlIHVzZWQgZm9yIEJCIG1hcmtlcnMs
IGhlbmNlIHdlCiAgICogb25seSBoYXZlIDIgYnl0ZXMgYXZhaWxhYmxlIGluIHRoZSBmaXJzdCB1
c2VyIGRhdGEKICAgKiBzZWN0aW9uLgogICAqLwogIGlmICghc2VjdGlvbiAmJiBlY2MtPmVuZ2lu
ZV90eXBlID09IE5BTkRfRUNDX0VOR0lORV9UWVBFX09OX0hPU1QpIHsKICAgICAgICAgIG9vYnJl
Z2lvbi0+b2Zmc2V0ID0gMjsKICAgICAgICAgIG9vYnJlZ2lvbi0+bGVuZ3RoID0gMjsKCiAgICAg
ICAgICByZXR1cm4gMDsKICB9CgpTbyBpZiB3ZSBzdWJ0cmFjdCA0IGJ5dGVzIGZvciB0aGUgZWFj
aCBmcmVlIE9PQiBhcmVhLCBpbmNsdWRpbmcgdGhlCmZpcnN0IG9uZSwgYW5kIGFsc28gc3VidHJh
Y3QgMiBieXRlcyBmb3IgdGhlIEJCTSwgd2UgYXJlIGRvdWJsZS1jb3VudGluZwp0aGUgQkJNLiBJ
IHNob3VsZCBoYXZlIG1hZGUgbXkgY29tbWl0IG1lc3NhZ2UgY2xlYXJlci4gQnV0IEkgYW0gZ29p
bmcgdG8KZHJvcCB0aGlzIHBhdGNoIGFueXdheS4KClJlZ2FyZHMsClNhbXVlbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
