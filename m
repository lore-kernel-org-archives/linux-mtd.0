Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD0ECCA476
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3q7xnWUOztLOFmXqtl0xytLdDWrxiMtXbSvWNazwMo=; b=sOBGjJA/pZhrkS
	r4BRSVLMxxYeKTOsv+tIQ9IcS6ZS0sFyEZvqUvbA2o1YM0OMcPW+FAhyBMymshiuCEbG8AJ1T0WlB
	XJ8DHBk6o8m71FPCkiGC9n5MzNdxRuUkjTbSnymmqVTksJcttHGlrR2eO0vQ1hwuS4pCqAVz9aMhr
	xYcyCGh1HFL04w4PjdmXSEnVXcxeyu7H81CdJeSiIMdTtsYGB1/F2eBdIQgx+THhN+TKtp/TUg8KD
	Dv0OWDVOXaqvs5SJvg6x9tGPcJO0ifYhwV/na8RPqg1F9Rw35S73N7+ku5B60lb4ccsypiBnMO+kb
	93CZy7XXasrmgjNfzkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HDI-0000000D3uJ-3I5f;
	Mon, 13 Oct 2025 11:59:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HDG-0000000D3ta-01wt
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 11:59:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 78DFDC093AB;
	Mon, 13 Oct 2025 11:59:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FDF5606C6;
	Mon, 13 Oct 2025 11:59:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71A00102F225F;
	Mon, 13 Oct 2025 13:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760356774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tqjFs/IyP2PWeKlRmbAAWPZkIsNKkvhn10LBbn1RWTU=;
	b=GFYlkLtBUG+G9nLgkwz6eL7aoFEq9bwW/Eg1h/WvwIYZ9LVvbeHyaHRBLe385PaWd3s8h5
	UETY1QeZcjfoijCgm1DDKE2p2dFQClNkVyRAe7ofxOwWpmIoB1Y/SP5XklpP7KQsj0fTTU
	gUTyHV4zR8cPJm+zwhRuxuHCWP6430R3QBFkM7zQVXsexur57Mf+lPX8Q9bUuPdLB+FPin
	iw4IscQJ0+fIwa8x9vHS+79DPs3ya2WRoJ7FBffSU+U5uAtIle7bDpD87Cd+c1qBWSf8zD
	agAHGAs6+aJ11TmN61BBMWAn2CanGdaZAd4xBZGzFMLSmeCDbH+wzuV126URRQ==
Message-ID: <893f8b18-265e-4351-8d91-bd81f04c6eed@bootlin.com>
Date: Mon, 13 Oct 2025 13:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] arm64: dts: allwinner: h616: add NAND controller
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-4-richard.genoud@bootlin.com>
 <4682810.LvFx2qVVIh@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <4682810.LvFx2qVVIh@jernej-laptop>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_045938_252558_5EE05044 
X-CRM114-Status: GOOD (  15.72  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMTEvMTAvMjAyNSDDoCAxMjozMywgSmVybmVqIMWga3JhYmVjIGEgw6ljcml0wqA6Cj4gRG5l
IHBldGVrLCAxMC4gb2t0b2JlciAyMDI1IG9iIDEwOjQwOjMwIFNyZWRuamVldnJvcHNraSBwb2xl
dG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPj4gVGhlIEg2MTYgaGFzIGEg
TkFORCBjb250cm9sbGVyIHF1aXRlIHNpbWlsYXIgdG8gdGhlIEExMC9BMjMgb25lcywgYnV0Cj4+
IHdpdGggc29tZSByZWdpc3RlciBkaWZmZXJlbmNlcywgbW9yZSBjbG9ja3MgKGZvciBFQ0MgYW5k
IE1CVVMpLCBtb3JlIEVDQwo+PiBzdHJlbmd0aHMsIHNvIHRoaXMgcmVxdWlyZXMgYSBuZXcgY29t
cGF0aWJsZSBzdHJpbmcuCj4+Cj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgTkFORCBjb250cm9sbGVy
IG5vZGUgYW5kIHBpbnMgaW4gdGhlIGRldmljZSB0cmVlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBS
aWNoYXJkIEdlbm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+Cj4+IC0tLQo+PiAgIC4u
Li9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2MTYuZHRzaSB8IDUwICsrKysrKysr
KysrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2MTYuZHRz
aSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNjE2LmR0c2kKPj4gaW5k
ZXggY2VlZGFlOWUzOTliLi42MDYyNmViYTdmN2MgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNjE2LmR0c2kKPj4gKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2MTYuZHRzaQo+PiBAQCAtMjc4LDYgKzI3OCwzNyBA
QCBpcl9yeF9waW46IGlyLXJ4LXBpbiB7Cj4+ICAgCQkJCWZ1bmN0aW9uID0gImlyX3J4IjsKPj4g
ICAJCQl9Owo+PiAgIAo+PiArCQkJbmFuZF9waW5zOiBuYW5kLXBpbnMgewo+PiArCQkJCXBpbnMg
PSAiUEMwIiwgIlBDMSIsICJQQzIiLCAiUEM1IiwgIlBDOCIsICJQQzkiLAo+PiArCQkJCSAgICAg
ICAiUEMxMCIsICJQQzExIiwgIlBDMTIiLCAiUEMxMyIsICJQQzE0IiwKPj4gKwkJCQkgICAgICAg
IlBDMTUiLCAiUEMxNiI7Cj4+ICsJCQkJZnVuY3Rpb24gPSAibmFuZDAiOwo+PiArCQkJfTsKPj4g
Kwo+PiArCQkJbmFuZF9jczBfcGluOiBuYW5kLWNzMC1waW4gewo+PiArCQkJCXBpbnMgPSAiUEM0
IjsKPj4gKwkJCQlmdW5jdGlvbiA9ICJuYW5kMCI7Cj4+ICsJCQkJYmlhcy1wdWxsLXVwOwo+PiAr
CQkJfTsKPj4gKwo+PiArCQkJbmFuZF9jczFfcGluOiBuYW5kLWNzMS1waW4gewo+PiArCQkJCXBp
bnMgPSAiUEMzIjsKPj4gKwkJCQlmdW5jdGlvbiA9ICJuYW5kMCI7Cj4+ICsJCQkJYmlhcy1wdWxs
LXVwOwo+PiArCQkJfTsKPj4gKwo+PiArCQkJbmFuZF9yYjBfcGluOiBuYW5kLXJiMC1waW4gewo+
PiArCQkJCXBpbnMgPSAiUEM2IjsKPj4gKwkJCQlmdW5jdGlvbiA9ICJuYW5kMCI7Cj4+ICsJCQkJ
Ymlhcy1wdWxsLXVwOwo+PiArCQkJfTsKPj4gKwo+PiArCQkJbmFuZF9yYjFfcGluOiBuYW5kLXJi
MS1waW4gewo+PiArCQkJCXBpbnMgPSAiUEM3IjsKPj4gKwkJCQlmdW5jdGlvbiA9ICJuYW5kMCI7
Cj4+ICsJCQkJYmlhcy1wdWxsLXVwOwo+PiArCQkJfTsKPj4gKwo+PiAgIAkJCW1tYzBfcGluczog
bW1jMC1waW5zIHsKPj4gICAJCQkJcGlucyA9ICJQRjAiLCAiUEYxIiwgIlBGMiIsICJQRjMiLAo+
PiAgIAkJCQkgICAgICAgIlBGNCIsICJQRjUiOwo+PiBAQCAtNDQwLDYgKzQ3MSwyNSBAQCBtbWMy
OiBtbWNANDAyMjAwMCB7Cj4+ICAgCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4+ICAgCQl9Owo+PiAg
IAo+PiArCQluZmM6IG5hbmQtY29udHJvbGxlckA0MDExMDAwIHsKPiAKPiBOb2RlcyBhcmUgc29y
dGVkIGJ5IG1lbW9yeSBhZGRyZXNzLiBTbyB0aGlzIG9uZSBzaG91bGQgYmUgbW92ZWQgYmVmb3Jl
Cj4gbW1jMiBhbmQgcG9zc2libHkgb3RoZXJzLgpJbmRlZWQuCkknbGwgZml4IHRoYXQuCgo+IAo+
PiArCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBpLWg2MTYtbmFuZC1jb250cm9sbGVy
IjsKPj4gKwkJCXJlZyA9IDwweDA0MDExMDAwIDB4MTAwMD47Cj4+ICsJCQlpbnRlcnJ1cHRzID0g
PEdJQ19TUEkgMzQgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4+ICsJCQljbG9ja3MgPSA8JmNjdSBD
TEtfQlVTX05BTkQ+LCA8JmNjdSBDTEtfTkFORDA+LAo+PiArCQkJCTwmY2N1IENMS19OQU5EMT4s
IDwmY2N1IENMS19NQlVTX05BTkQ+Owo+PiArCQkJY2xvY2stbmFtZXMgPSAiYWhiIiwgIm1vZCIs
ICJlY2MiLCAibWJ1cyI7Cj4+ICsJCQlyZXNldHMgPSA8JmNjdSBSU1RfQlVTX05BTkQ+Owo+PiAr
CQkJcmVzZXQtbmFtZXMgPSAiYWhiIjsKPj4gKwkJCWRtYXMgPSA8JmRtYSAxMD47Cj4+ICsJCQlk
bWEtbmFtZXMgPSAicnh0eCI7Cj4+ICsJCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+PiAr
CQkJcGluY3RybC0wID0gPCZuYW5kX3BpbnM+LCA8Jm5hbmRfY3MwX3Bpbj4sCj4+ICsJCQkJPCZu
YW5kX2NzMV9waW4+LCA8Jm5hbmRfcmIwX3Bpbj4sCj4+ICsJCQkJPCZuYW5kX3JiMV9waW4+Owo+
IAo+IEFyZSB5b3Ugc3VyZSB0aGF0IGVhY2ggbmFuZCBkZXZpY2Ugd2lsbCB1c2UgZXhhY3RseSB0
aGlzIHBpbiBjb25maWd1cmF0aW9uPwo+IElJVUMsIG5vdCBhbGwgY2hpcHMgd2lsbCBoYXZlIHR3
byBDUyBhbmQgdHdvIFJCIHBpbnMuIElmIHNvLCBwaW5jdHJsIG5vZGVzCj4gc2hvdWxkIGJlIG1v
dmVkIHRvIGRldmljZSBEVCBhbmQgcGlucyBzdWJub2RlcyBzaG91bGQgYmUgbWFya2VkIHdpdGgK
PiAvb21pdC1pZi1uby1yZWYvLgoKWW91J3JlIHJpZ2h0LCBhbGwgcGlucyBtYXkgbm90IGJlIHVz
ZWQuCgpUaGFua3MhCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBKZXJuZWoKPiAKPj4gKwkJCSNhZGRy
ZXNzLWNlbGxzID0gPDE+Owo+PiArCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4+ICsJCX07Cj4+ICsK
Pj4gICAJCXVhcnQwOiBzZXJpYWxANTAwMDAwMCB7Cj4+ICAgCQkJY29tcGF0aWJsZSA9ICJzbnBz
LGR3LWFwYi11YXJ0IjsKPj4gICAJCQlyZWcgPSA8MHgwNTAwMDAwMCAweDQwMD47Cj4+CgotLSAK
UmljaGFyZCBHZW5vdWQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
