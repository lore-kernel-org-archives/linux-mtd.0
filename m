Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E520ACCD183
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWDI0p0sJCw0fxNev6/HNMbCVNBURzJZN9U5EV5mU2g=; b=w7a4CfujhQPAcG
	r5rp1WMAPAGMoh5zB2iF8eR1FmymokwyEMbXdEGtWihn013ZYQInWY64oTvA9974INyJbuWozyO8I
	jRk8f7n/YOHixL16G1ahwAyVxwbZXJUPR2Bp3BVxEYnzudyIQ9/CC0OQ/7/4JGSRA+/wamwVU3ZWS
	Ksh8j/BsZN+t+3eiCCH1bqQqnoBww8vPiM4WvYAjLSXoU2CMOCbqIjsD2E2JPbTlJTsGPiP6eRrhq
	E8pSza1Svzili5SlDJDIbDA/hZ5rqlOOwPh81/9wuebjZG0N3lnwClVcNPMDJYMgnuZbmun+P1q+w
	rSoP0Gc8t0GSN6TOA/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Kxq-0000000DmZf-2H8P;
	Mon, 13 Oct 2025 15:59:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Kxp-0000000DmZ0-0E4p
	for linux-mtd@bombadil.infradead.org;
	Mon, 13 Oct 2025 15:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F9tnRL1o3FmzbH3rPOyKULKn/hk3zU9MNzUIZBbOh80=; b=a3Z/BJnMY/dpnUiU/HS5Whaxys
	QJ+o7tQrrdHCeHkQFS2XtLxAQMjUSMj66LKTty9A8VWTqNPZ15hXAsdTq2mFri6Wh8lEwLQXIp7Nz
	J297HIqI5YkzVmN+4C4aTS4PRDRX1THBFsytePyP/cGuZEcAyUG+xYg+VBCTlFMinlP35/6oYMcI/
	FBnB1mmVq4TLNIXmeULhYf5Agzqth0ABr5xTaJ3Ia/EjAmBsFu+8IS6v+8rNWsx6zg4JJQmQRVMnn
	/lUxahawfGx90NTNHKb53wwNLj2UWG780tkoxXycZFCThUFrtt4fej9walEp5eDrwhp9jpZv+QzoD
	+43UbBCg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Kxk-00000004RiM-3Zy2
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 15:59:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9B6864E41063;
	Mon, 13 Oct 2025 15:59:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 663A66067B;
	Mon, 13 Oct 2025 15:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F18D3102F2273;
	Mon, 13 Oct 2025 17:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760371189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=F9tnRL1o3FmzbH3rPOyKULKn/hk3zU9MNzUIZBbOh80=;
	b=iTUvBUFvI/itbMlmJ0x0WrNzyi3QeiZvBxNdzyILfJ7IH3MWnWJYdtUDDzRm/s1Oe50Qsx
	S50pmM6ZNqZ/t4QvTvRlAE5J968iQN3WpJ8KeQ7Sei/efTMN/EXd4tY9drQHat9TNT63LT
	kJ1dQGrfmrjAuJJ+vZAX9+tkap3RpYHzUGZ/ia9xXCZch8QszvcJrPkyu1TE15dECyKWgF
	igGuZWbbLVAo95qPbdNjUPGGTBhxylCrwmu3DL+6HkZFc/5pR+xyxrgq+U6odYq+7yaR3t
	xJR/eJjTd9DVWPwo4sMzBwBIaRuZeK2fWtLndnSXGUsnJyQl9MZi6mBjU7SVBQ==
Message-ID: <7293f682-7ba7-420c-9997-eec0d5cb09e1@bootlin.com>
Date: Mon, 13 Oct 2025 17:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] arm64: dts: allwinner: h616: add NAND controller
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
 <20251013152645.1119308-16-richard.genoud@bootlin.com>
 <2800174.mvXUDI8C0e@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <2800174.mvXUDI8C0e@jernej-laptop>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_165953_630922_85129105 
X-CRM114-Status: GOOD (  14.74  )
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

TGUgMTMvMTAvMjAyNSDDoCAxNzo0MywgSmVybmVqIMWga3JhYmVjIGEgw6ljcml0wqA6Cj4gRG5l
IHBvbmVkZWxqZWssIDEzLiBva3RvYmVyIDIwMjUgb2IgMTc6MjY6NDUgU3JlZG5qZWV2cm9wc2tp
IHBvbGV0bmkgxI1hcyBqZSBSaWNoYXJkIEdlbm91ZCBuYXBpc2FsKGEpOgo+PiBUaGUgSDYxNiBo
YXMgYSBOQU5EIGNvbnRyb2xsZXIgcXVpdGUgc2ltaWxhciB0byB0aGUgQTEwL0EyMyBvbmVzLCBi
dXQKPj4gd2l0aCBzb21lIHJlZ2lzdGVyIGRpZmZlcmVuY2VzLCBtb3JlIGNsb2NrcyAoZm9yIEVD
QyBhbmQgTUJVUyksIG1vcmUgRUNDCj4+IHN0cmVuZ3Rocywgc28gdGhpcyByZXF1aXJlcyBhIG5l
dyBjb21wYXRpYmxlIHN0cmluZy4KPj4KPj4gQWRkIHRoZSBOQU5EIGNvbnRyb2xsZXIgbm9kZSBh
bmQgcGlucyBpbiB0aGUgZGV2aWNlIHRyZWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQg
R2Vub3VkIDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4KPj4gLS0tCj4+ICAgLi4uL2FybTY0
L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYxNi5kdHNpIHwgNTEgKysrKysrKysrKysrKysr
KysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYxNi5kdHNpIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2MTYuZHRzaQo+PiBpbmRleCBjZWVk
YWU5ZTM5OWIuLmJiNTNjNmM2MzgzNiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9hbGx3aW5uZXIvc3VuNTBpLWg2MTYuZHRzaQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FsbHdpbm5lci9zdW41MGktaDYxNi5kdHNpCj4+IEBAIC0zMDQsNiArMzA0LDQyIEBAIG1tYzJf
cGluczogbW1jMi1waW5zIHsKPj4gICAJCQkJYmlhcy1wdWxsLXVwOwo+PiAgIAkJCX07Cj4+ICAg
Cj4+ICsJCQkvb21pdC1pZi1uby1yZWYvCj4+ICsJCQluYW5kX3BpbnM6IG5hbmQtcGlucyB7Cj4+
ICsJCQkJcGlucyA9ICJQQzAiLCAiUEMxIiwgIlBDMiIsICJQQzUiLCAiUEM4IiwgIlBDOSIsCj4+
ICsJCQkJICAgICAgICJQQzEwIiwgIlBDMTEiLCAiUEMxMiIsICJQQzEzIiwgIlBDMTQiLAo+PiAr
CQkJCSAgICAgICAiUEMxNSIsICJQQzE2IjsKPj4gKwkJCQlmdW5jdGlvbiA9ICJuYW5kMCI7Cj4+
ICsJCQl9Owo+PiArCj4+ICsJCQkvb21pdC1pZi1uby1yZWYvCj4+ICsJCQluYW5kX2NzMF9waW46
IG5hbmQtY3MwLXBpbiB7Cj4+ICsJCQkJcGlucyA9ICJQQzQiOwo+PiArCQkJCWZ1bmN0aW9uID0g
Im5hbmQwIjsKPj4gKwkJCQliaWFzLXB1bGwtdXA7Cj4+ICsJCQl9Owo+PiArCj4+ICsJCQkvb21p
dC1pZi1uby1yZWYvCj4+ICsJCQluYW5kX2NzMV9waW46IG5hbmQtY3MxLXBpbiB7Cj4+ICsJCQkJ
cGlucyA9ICJQQzMiOwo+PiArCQkJCWZ1bmN0aW9uID0gIm5hbmQwIjsKPj4gKwkJCQliaWFzLXB1
bGwtdXA7Cj4+ICsJCQl9Owo+PiArCj4+ICsJCQkvb21pdC1pZi1uby1yZWYvCj4+ICsJCQluYW5k
X3JiMF9waW46IG5hbmQtcmIwLXBpbiB7Cj4+ICsJCQkJcGlucyA9ICJQQzYiOwo+PiArCQkJCWZ1
bmN0aW9uID0gIm5hbmQwIjsKPj4gKwkJCQliaWFzLXB1bGwtdXA7Cj4+ICsJCQl9Owo+PiArCj4+
ICsJCQkvb21pdC1pZi1uby1yZWYvCj4+ICsJCQluYW5kX3JiMV9waW46IG5hbmQtcmIxLXBpbiB7
Cj4+ICsJCQkJcGlucyA9ICJQQzciOwo+PiArCQkJCWZ1bmN0aW9uID0gIm5hbmQwIjsKPj4gKwkJ
CQliaWFzLXB1bGwtdXA7Cj4+ICsJCQl9Owo+PiArCj4+ICAgCQkJL29taXQtaWYtbm8tcmVmLwo+
PiAgIAkJCXNwaTBfcGluczogc3BpMC1waW5zIHsKPj4gICAJCQkJcGlucyA9ICJQQzAiLCAiUEMy
IiwgIlBDNCI7Cj4+IEBAIC0zNzcsNiArNDEzLDIxIEBAIGlvbW11OiBpb21tdUAzMGYwMDAwIHsK
Pj4gICAJCQkjaW9tbXUtY2VsbHMgPSA8MT47Cj4+ICAgCQl9Owo+PiAgIAo+PiArCQluZmM6IG5h
bmQtY29udHJvbGxlckA0MDExMDAwIHsKPj4gKwkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1
bjUwaS1oNjE2LW5hbmQtY29udHJvbGxlciI7Cj4+ICsJCQlyZWcgPSA8MHgwNDAxMTAwMCAweDEw
MDA+Owo+PiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM0IElSUV9UWVBFX0xFVkVMX0hJR0g+
Owo+PiArCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19OQU5EPiwgPCZjY3UgQ0xLX05BTkQwPiwK
Pj4gKwkJCQk8JmNjdSBDTEtfTkFORDE+LCA8JmNjdSBDTEtfTUJVU19OQU5EPjsKPj4gKwkJCWNs
b2NrLW5hbWVzID0gImFoYiIsICJtb2QiLCAiZWNjIiwgIm1idXMiOwo+PiArCQkJcmVzZXRzID0g
PCZjY3UgUlNUX0JVU19OQU5EPjsKPj4gKwkJCXJlc2V0LW5hbWVzID0gImFoYiI7Cj4+ICsJCQlk
bWFzID0gPCZkbWEgMTA+Owo+PiArCQkJZG1hLW5hbWVzID0gInJ4dHgiOwo+PiArCQkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47Cj4+ICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPj4gKwkJfTsKPiAKPiBT
b3JyeSwgZm9yZ290IHRvIG1lbnRpb24uIFRoaXMgc2hvdWxkIGJlIG1hcmtlZCBhcyBkaXNhYmxl
ZCwgYXMgbW9zdCBvZgo+IHRoZSBib2FyZHMgZG9uJ3QgaGF2ZSBOQU5EIGNvbm5lY3RlZC4KYXJn
ISBvZiBjb3Vyc2UsIEkgZm9yZ290IHRoYXQuCgpUaGFua3MhCgo+IAo+IEJlc3QgcmVnYXJkcywK
PiBKZXJuZWoKPiAKPj4gKwo+PiAgIAkJbW1jMDogbW1jQDQwMjAwMDAgewo+PiAgIAkJCWNvbXBh
dGlibGUgPSAiYWxsd2lubmVyLHN1bjUwaS1oNjE2LW1tYyIsCj4+ICAgCQkJCSAgICAgImFsbHdp
bm5lcixzdW41MGktYTEwMC1tbWMiOwo+Pgo+IAo+IAo+IAo+IAoKCi0tIApSaWNoYXJkIEdlbm91
ZCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
