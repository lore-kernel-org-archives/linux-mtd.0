Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDD6C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jun 2022 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/MsOxEvkGD/xtNOw+LT9CC8dL8K8lN5K/OK1Mk/ZPQ=; b=rkJ7A4yDsejK2K
	JOrA1lyspwjvlwTJGJMipg8NEbPwb2HuhaemBe4NVmmVpFhsuz9Cu8VvMBmzcFiqa9YAYLcfvob9P
	lOHIVahZA7bDTQI8jvC6yK/dYr1I5nPGp2IB/NS7QC4iB3ZTp9JdoKAyWIMurHVqMmyf56VLNjv+j
	7dLep2d5faIFkeXyyTuQIYYi7rS/CIRU4Rwcw5VfRAfVtsIp1IuH4HLhvqIexWliuUTPQJg7rnoJY
	FQRwVUzu2y/qOUXh5AcL+uBWT+qFXG7Upr7kkdNuT/j/fJQy6II8HuXcviifdPc23elvSyCoqUk5l
	R93mRXdY71Kab1q4JIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6q0u-00G82K-Fh; Thu, 30 Jun 2022 08:59:04 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6q0q-00G7zW-NT
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2022 08:59:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5DED124000F;
	Thu, 30 Jun 2022 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656579535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89fMKXThRMbfnxK3x4C5LtcV95DQSbT+9sICTdF5QyA=;
	b=KNbtNjU4PuHLFcDfwedq/EcJljUhoSqijcpl2WajqxXPMaPk0wdAbJvjtDaTWp/69E0cXt
	vY0hMypuvNSQDdpdohMihglIP8Zbw97JEW28DQYGdoqETX/ZdnRYjZ8SLhvKoLw5iROm6t
	QkYmRgG3tNRSdfm3y1yvadZ7VH42oS+U0huISZ5mLAucGCV9rNYzO1NaWo13HzyHUkJtqO
	IiXJ3N5sb5qj2ZNzJd7AXcFd+Xz4byy2Aalrz8fwEchtc3pli1tW5g+KcD3YXPnLCkNd9h
	o94lHBHCKC3KNZV/ZPqD0l2Tgg3jLpTiuYi5RtFfK0rLFWGAnb/2jjCMVfe41A==
Date: Thu, 30 Jun 2022 10:58:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Vignesh Raghavendra
 <vigneshr@ti.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Richard Weinberger
 <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] memory: renesas-rpc-if: Pass device instead of
 rpcif to rpcif_*()
Message-ID: <20220630105851.59e12f77@xps-13>
In-Reply-To: <2df6673b-6f8d-19c2-90ca-342e3ba72040@linaro.org>
References: <cover.1656341824.git.geert+renesas@glider.be>
	<e313b7f9a856fd8546aabb20d44d10e3af6676c6.1656341824.git.geert+renesas@glider.be>
	<20220630092552.68a8b3ff@xps-13>
	<2df6673b-6f8d-19c2-90ca-342e3ba72040@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_015901_226043_AF6DF228 
X-CRM114-Status: GOOD (  24.85  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFRo
dSwgMzAgSnVuIDIwMjIgMTA6NDY6NTEgKzAyMDA6Cgo+IE9uIDMwLzA2LzIwMjIgMDk6MjUsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBLcnp5c3p0b2YsCj4gPiAKPiA+IGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlIHdyb3RlIG9uIE1vbiwgMjcgSnVuIDIwMjIgMTc6MzE6MTMgKzAyMDA6Cj4g
PiAgIAo+ID4+IE1vc3QgcnBjaWZfKigpIEFQSSBmdW5jdGlvbnMgZG8gbm90IG5lZWQgYWNjZXNz
IHRvIGFueSBvdGhlciBmaWVsZHMgaW4KPiA+PiB0aGUgcnBjaWYgc3RydWN0dXJlIHRoYW4gdGhl
IGRldmljZSBwb2ludGVyLiAgU2ltcGxpZnkgZGVwZW5kZW5jaWVzIGJ5Cj4gPj4gcGFzc2luZyB0
aGUgZGV2aWNlIHBvaW50ZXIgaW5zdGVhZC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gPj4gLS0tCj4gPj4gIGRy
aXZlcnMvbWVtb3J5L3JlbmVzYXMtcnBjLWlmLmMgfCAzMiArKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLQo+ID4+ICBkcml2ZXJzL210ZC9oeXBlcmJ1cy9ycGMtaWYuYyAgIHwgMTggKysr
KysrKysrLS0tLS0tLS0tICAKPiA+IAo+ID4gWy4uLl0KPiA+ICAgCj4gPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL2h5cGVyYnVzL3JwYy1pZi5jIGIvZHJpdmVycy9tdGQvaHlwZXJidXMvcnBj
LWlmLmMKPiA+PiBpbmRleCBkMDBkMzAyNDM0MDMwYjIwLi40MTczNGUzMzdhYzAwZTQwIDEwMDY0
NAo+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL2h5cGVyYnVzL3JwYy1pZi5jCj4gPj4gKysrIGIvZHJp
dmVycy9tdGQvaHlwZXJidXMvcnBjLWlmLmMKPiA+PiBAQCAtNTYsNyArNTYsNyBAQCBzdGF0aWMg
dm9pZCBycGNpZl9oYl9wcmVwYXJlX3JlYWQoc3RydWN0IHJwY2lmICpycGMsIHZvaWQgKnRvLAo+
ID4+ICAJb3AuZGF0YS5uYnl0ZXMgPSBsZW47Cj4gPj4gIAlvcC5kYXRhLmJ1Zi5pbiA9IHRvOwo+
ID4+ICAKPiA+PiAtCXJwY2lmX3ByZXBhcmUocnBjLCAmb3AsIE5VTEwsIE5VTEwpOwo+ID4+ICsJ
cnBjaWZfcHJlcGFyZShycGMtPmRldiwgJm9wLCBOVUxMLCBOVUxMKTsKPiA+PiAgfQo+ID4+ICAK
PiA+PiAgc3RhdGljIHZvaWQgcnBjaWZfaGJfcHJlcGFyZV93cml0ZShzdHJ1Y3QgcnBjaWYgKnJw
YywgdW5zaWduZWQgbG9uZyB0bywKPiA+PiBAQCAtNzAsNyArNzAsNyBAQCBzdGF0aWMgdm9pZCBy
cGNpZl9oYl9wcmVwYXJlX3dyaXRlKHN0cnVjdCBycGNpZiAqcnBjLCB1bnNpZ25lZCBsb25nIHRv
LAo+ID4+ICAJb3AuZGF0YS5uYnl0ZXMgPSBsZW47Cj4gPj4gIAlvcC5kYXRhLmJ1Zi5vdXQgPSBm
cm9tOwo+ID4+ICAKPiA+PiAtCXJwY2lmX3ByZXBhcmUocnBjLCAmb3AsIE5VTEwsIE5VTEwpOwo+
ID4+ICsJcnBjaWZfcHJlcGFyZShycGMtPmRldiwgJm9wLCBOVUxMLCBOVUxMKTsKPiA+PiAgfQo+
ID4+ICAKPiA+PiAgc3RhdGljIHUxNiBycGNpZl9oYl9yZWFkMTYoc3RydWN0IGh5cGVyYnVzX2Rl
dmljZSAqaGJkZXYsIHVuc2lnbmVkIGxvbmcgYWRkcikKPiA+PiBAQCAtODEsNyArODEsNyBAQCBz
dGF0aWMgdTE2IHJwY2lmX2hiX3JlYWQxNihzdHJ1Y3QgaHlwZXJidXNfZGV2aWNlICpoYmRldiwg
dW5zaWduZWQgbG9uZyBhZGRyKQo+ID4+ICAKPiA+PiAgCXJwY2lmX2hiX3ByZXBhcmVfcmVhZCgm
aHlwZXJidXMtPnJwYywgJmRhdGEsIGFkZHIsIDIpOwo+ID4+ICAKPiA+PiAtCXJwY2lmX21hbnVh
bF94ZmVyKCZoeXBlcmJ1cy0+cnBjKTsKPiA+PiArCXJwY2lmX21hbnVhbF94ZmVyKGh5cGVyYnVz
LT5ycGMuZGV2KTsKPiA+PiAgCj4gPj4gIAlyZXR1cm4gZGF0YS54WzBdOwo+ID4+ICB9Cj4gPj4g
QEAgLTk0LDcgKzk0LDcgQEAgc3RhdGljIHZvaWQgcnBjaWZfaGJfd3JpdGUxNihzdHJ1Y3QgaHlw
ZXJidXNfZGV2aWNlICpoYmRldiwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4+ICAKPiA+PiAgCXJw
Y2lmX2hiX3ByZXBhcmVfd3JpdGUoJmh5cGVyYnVzLT5ycGMsIGFkZHIsICZkYXRhLCAyKTsKPiA+
PiAgCj4gPj4gLQlycGNpZl9tYW51YWxfeGZlcigmaHlwZXJidXMtPnJwYyk7Cj4gPj4gKwlycGNp
Zl9tYW51YWxfeGZlcihoeXBlcmJ1cy0+cnBjLmRldik7Cj4gPj4gIH0KPiA+PiAgCj4gPj4gIHN0
YXRpYyB2b2lkIHJwY2lmX2hiX2NvcHlfZnJvbShzdHJ1Y3QgaHlwZXJidXNfZGV2aWNlICpoYmRl
diwgdm9pZCAqdG8sCj4gPj4gQEAgLTEwNSw3ICsxMDUsNyBAQCBzdGF0aWMgdm9pZCBycGNpZl9o
Yl9jb3B5X2Zyb20oc3RydWN0IGh5cGVyYnVzX2RldmljZSAqaGJkZXYsIHZvaWQgKnRvLAo+ID4+
ICAKPiA+PiAgCXJwY2lmX2hiX3ByZXBhcmVfcmVhZCgmaHlwZXJidXMtPnJwYywgdG8sIGZyb20s
IGxlbik7Cj4gPj4gIAo+ID4+IC0JcnBjaWZfZGlybWFwX3JlYWQoJmh5cGVyYnVzLT5ycGMsIGZy
b20sIGxlbiwgdG8pOwo+ID4+ICsJcnBjaWZfZGlybWFwX3JlYWQoaHlwZXJidXMtPnJwYy5kZXYs
IGZyb20sIGxlbiwgdG8pOwo+ID4+ICB9Cj4gPj4gIAo+ID4+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IGh5cGVyYnVzX29wcyBycGNpZl9oYl9vcHMgPSB7Cj4gPj4gQEAgLTEzMCw5ICsxMzAsOSBAQCBz
dGF0aWMgaW50IHJwY2lmX2hiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
Pj4gIAo+ID4+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaHlwZXJidXMpOwo+ID4+ICAK
PiA+PiAtCXJwY2lmX2VuYWJsZV9ycG0oJmh5cGVyYnVzLT5ycGMpOwo+ID4+ICsJcnBjaWZfZW5h
YmxlX3JwbShoeXBlcmJ1cy0+cnBjLmRldik7Cj4gPj4gIAo+ID4+IC0JZXJyb3IgPSBycGNpZl9o
d19pbml0KCZoeXBlcmJ1cy0+cnBjLCB0cnVlKTsKPiA+PiArCWVycm9yID0gcnBjaWZfaHdfaW5p
dChoeXBlcmJ1cy0+cnBjLmRldiwgdHJ1ZSk7Cj4gPj4gIAlpZiAoZXJyb3IpCj4gPj4gIAkJZ290
byBvdXRfZGlzYWJsZV9ycG07Cj4gPj4gIAo+ID4+IEBAIC0xNTAsNyArMTUwLDcgQEAgc3RhdGlj
IGludCBycGNpZl9oYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4+ICAJ
cmV0dXJuIDA7Cj4gPj4gIAo+ID4+ICBvdXRfZGlzYWJsZV9ycG06Cj4gPj4gLQlycGNpZl9kaXNh
YmxlX3JwbSgmaHlwZXJidXMtPnJwYyk7Cj4gPj4gKwlycGNpZl9kaXNhYmxlX3JwbShoeXBlcmJ1
cy0+cnBjLmRldik7Cj4gPj4gIAlyZXR1cm4gZXJyb3I7Cj4gPj4gIH0gIAo+ID4gCj4gPiBUaGlz
IHdpbGwgb25seSBhcHBseSBvbiB0b3Agb2YgbXRkL25leHQsIGJlY2F1c2UgdGhhdAo+ID4gcnBj
aWZfZGlzYWJsZV9ycG0oKSBiYWxhbmNlIGNhbGwgd2FzIHZlcnkgcmVjZW50bHkgY29udHJpYnV0
ZWQgYnkgR2VlcnQ6Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvZjMwNzBl
MWFmNDgwY2IyNTJhZTE4M2Q0NzlhNTkzZGJiZjk0NzY4NS4xNjU1NDU3NzkwLmdpdC5nZWVydCty
ZW5lc2FzQGdsaWRlci5iZS8KPiA+IAo+ID4gU28gd2UgbmVlZCB0byBmaXJzdCBzaGFyZSBhbiBp
bW11dGFibGUgdGFnIG9uIHRoZSBjdXJyZW50IG10ZC9uZXh0Cj4gPiBicmFuY2guIFJpY2hhcmQs
IHRoYXQgaXMgbXkgdmFjYXRpb24gZ2lmdCBmb3IgeW91IDopICAKPiAKPiBJIGRvbid0IHdhbnQg
ZW50aXJlIG10ZC9uZXh0LiBJIGNvdWxkIHRha2UgUmVuZXNhcyBoeXBlcmJ1cyBzcGVjaWZpYwo+
IGNvbW1pdHMuCgpJIGFwcGxpZWQgdGhpcyBwYXRjaCBhIHdlZWsgYWdvIGFuZCBkaWQgbm90IHJl
bWVtYmVyZWQgdGhlcmUgd2FzIGEKcG9zc2libHkgY29uZmxpY3Rpbmcgc2VyaWVzIGFzaWRlLgoK
PiBBbm90aGVyIHNvbHV0aW9uIGlzIG1lIHRvIHJlYmFzZSBvbiBzb21lIHJjWCwgaWYgdGhhdCBj
b21taXQKPiB3YXMgc2VudCBhcyBmaXggZm9yIGN1cnJlbnQgY3ljbGUuCgpVbmZvcnR1bmF0ZWx5
LCBuby4KCj4gVGhlIHRoaXJkIG9wdGlvbiBpcyB0byBzaW1wbHkgcmVzb2x2ZSBhIGNvbmZsaWN0
IC0gd2hpY2ggc2hvdWxkIGxvb2tzCj4gcHJldHR5IGVhc3kgYW5kIGNvbXBpbGUtdGVzdGFibGUu
IEluIHRoYXQgY2FzZSB0aGUgY29tbWl0IHNob3VsZCBiZQo+IHJlYmFzZWQgb24gbXkgdjUuMTkt
cmMxLgoKSSBiZWxpZXZlIGl0IHNob3VsZCB3b3JrLiBBcyB0aGlzIGlzIG1vc3RseSBhIGNsZWFu
dXAsIHlvdSBjYW4gYWxzbwp3YWl0IDUuMjAtcmMxLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
