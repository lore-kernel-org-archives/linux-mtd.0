Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3834E606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=moHDVX/f;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJ9NO4Zl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UZSpnX5WkUYYPzS1wALwrchNklEKALdXeAw8CqN4sBg=; b=moHDVX/flz70jxAK+91MSC7wuq
	0coCL1ubVfF58JD4XRa5wkzM3chuLJYmmBi0FmrA8Hc0kFInCgFwK4cmnICJgQKzx4SEpPkSZqdRE
	LdSoFNTWuwFVc2IF/0jLN6FiTncMj5+/qwcozlOt3uIDl64qxhz3BIQjDU6/2Nt7R1ufd0POG+FiI
	0JsHlZufctlTPmTI6S/y6TrxPJmQp6kUV3AfhcfqnJyoriRwo8QAU2842Z50eGewGyiBUxBcyqM7B
	xy2zqHc1F4mw764yKVenbUj4Zj8lM0RCxDXrtIZC2xcggnaxRB62r7jkpyeY1yiPrYOfmpf1ZSNAW
	RigaNclw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPAK-00000006xGs-2mSD;
	Tue, 17 Nov 2026 19:48:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPAJ-00000006xGY-03t3
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:48:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 497A06133A;
	Tue, 17 Nov 2026 19:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E421F000C4;
	Tue, 17 Nov 2026 19:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944906;
	bh=b5Wxx4zWhhDf+RuDLgEF7ceXAqRFg75DAytW+cm1iZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WJ9NO4ZlAdRKhy1nM5af4nJCWNqRPZBXC4ZtZMisw6d0zMMYzLgrMmJ7RQrX7vnDX
	 7grbIhDw7MTrYLFBdhxwXUTcCb1y6udQ/1zSLEdfVx6p8WiwuRvX7W4svuhO0BTuVK
	 urDWw8VH86kgh/x+BjoE4hHSbR5jMEqIOlbsI+6ZO80+g1rMR5KyGlE50YDQSx7cF3
	 zV6gXW9lezydpnhtV1RWxk308+JZga6BQrAOg8gIVb2HphkgExTdmky98OKf8hTrbH
	 GF+KV1WeiuFca3eQU7E4b06RT9KeBSgoMfY1m9V+jxGKxM7hzw2knqEE1uXASAP1yK
	 9t5j2hyDqjwaQ==
Message-ID: <sashiko-outbox-219524@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/11] nvmem: reference cell entries independently of
 their provider list
To: "James Hilliard" <james.hilliard1@gmail.com>, "Srinivas Kandagatla" <srini@kernel.org>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Michael Walle" <mwalle@kernel.org>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Paul
 Cercueil" <paul@crapouillou.net>, linux-mtd@lists.infradead.org
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-5-3cfbd48812b5@gmail.com>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
 <20261117-submit-nvmem-provider-lifetime-v1-v1-5-3cfbd48812b5@gmail.com>
Date: Tue, 17 Nov 2026 19:48:25 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbQ3JpdGljYWxdIG52bWVtOiBt
aXNzaW5nIGxheW91dCBtb2R1bGUgcmVmZXJlbmNlIGluCiAgbnZtZW1fY2VsbF9nZXRfZnJvbV9s
b29rdXAoKSBbMV0KLS0KCmNvbW1pdCBkY2EwZDQ1YzAxODI5YjI0ZjA2ZjMxZjhmNTUxODE1Yzgw
NGRiN2ExCkF1dGhvcjogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+
Cgpudm1lbTogcmVmZXJlbmNlIGNlbGwgZW50cmllcyBpbmRlcGVuZGVudGx5IG9mIHRoZWlyIHBy
b3ZpZGVyIGxpc3QKClRoaXMgY29tbWl0IGFkZHMgYSBrcmVmIHRvIHN0cnVjdCBudm1lbV9jZWxs
X2VudHJ5IHNvIHRoYXQgY2VsbCBoYW5kbGVzIGhvbGQgYQpyZWZlcmVuY2UgdG8gdGhlaXIgY2Vs
bCBlbnRyeSBpbmRlcGVuZGVudGx5IG9mIHRoZSBwcm92aWRlcidzIGNlbGwgbGlzdC4KCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vY29yZS5jIGIvZHJpdmVycy9udm1lbS9jb3JlLmMKPiBp
bmRleCA2NWQ4OTQ5OGVkZWIzLi43MGI2MTI2ODg2ZDlmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bnZtZW0vY29yZS5jCj4gKysrIGIvZHJpdmVycy9udm1lbS9jb3JlLmMKClsgLi4uIF0KCj4gQEAg
LTE0MDgsOCArMTQyMSwxMCBAQCBudm1lbV9jZWxsX2dldF9mcm9tX2xvb2t1cChzdHJ1Y3QgZGV2
aWNlICpkZXYsIGNvbnN0IGNoYXIgKmNvbl9pZCkKPiAgCQkJCWNlbGwgPSBFUlJfUFRSKC1FTk9F
TlQpOwo+ICAJCQl9IGVsc2Ugewo+ICAJCQkJY2VsbCA9IG52bWVtX2NyZWF0ZV9jZWxsKGNlbGxf
ZW50cnksIGNvbl9pZCwgMCk7Cj4gLQkJCQlpZiAoSVNfRVJSKGNlbGwpKQo+ICsJCQkJaWYgKElT
X0VSUihjZWxsKSkgewo+ICsJCQkJCW52bWVtX2NlbGxfZW50cnlfcHV0KGNlbGxfZW50cnkpOwo+
ICAJCQkJCW52bWVtX2RldmljZV9wdXQobnZtZW0pOwo+ICsJCQkJfQo+ICAJCQl9Cj4gIAkJCWJy
ZWFrOwo+ICAJCX0KCltTZXZlcml0eTogQ3JpdGljYWxdClRoaXMgcHJvYmxlbSB3YXNuJ3QgaW50
cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgZG9lcwpudm1lbV9jZWxsX2dldF9mcm9tX2xvb2t1
cCgpIG1pc3MgYWNxdWlyaW5nIGEgbGF5b3V0IG1vZHVsZSByZWZlcmVuY2UKWzFdIGJlZm9yZSBj
cmVhdGluZyB0aGUgY2VsbD8KClVubGlrZSBvZl9udm1lbV9jZWxsX2dldCgpLCB0aGlzIHBhdGgg
bmV2ZXIgY2FsbHMKbnZtZW1fbGF5b3V0X21vZHVsZV9nZXRfb3B0aW9uYWwoKSwgeWV0IG52bWVt
X2NlbGxfcHV0KCkgdW5jb25kaXRpb25hbGx5IGNhbGxzCm52bWVtX2xheW91dF9tb2R1bGVfcHV0
KG52bWVtKS4gIFJlbGVhc2luZyBhIGNlbGwgb2J0YWluZWQgZnJvbSBhIGxvb2t1cCB0YWJsZQpv
biBhIGRldmljZSB3aXRoIGEgbGF5b3V0IHdpbGwgdW5kZXJmbG93IHRoZSBsYXlvdXQgbW9kdWxl
IHJlZmNvdW50LCBhbGxvd2luZwp0aGUgbW9kdWxlIHRvIGJlIHVubG9hZGVkIHdoaWxlIHN0aWxs
IGluIHVzZS4KClsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xpbnV4LTRkNjU1NzRmLWNk
ZWYtNGJlNy04N2ZmLWIxYzE5N2U2NmMwNAoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTExNy1zdWJtaXQtbnZtZW0tcHJvdmlkZXIt
bGlmZXRpbWUtdjEtdjEtMC0zY2ZiZDQ4ODEyYjVAZ21haWwuY29tP3BhcnQ9NQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
