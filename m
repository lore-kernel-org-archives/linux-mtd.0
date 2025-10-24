Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0C9CCD1BF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 07:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1iHN4XPE2jdaGNi3o5FBeR4D1Rcn2pf+EbEKW+VI3sM=; b=s/u+/B+5ROq12U
	9+0EMpuR2sJGH6A3TIuJ3zbGkbqulLElhkUEVo39FZeMvKr+/tRI9dJi2gzTuskuAYnw0OXUlap54
	EjkeqXBq1joXLo5jM9TSnpZVqxgAv7lsXp9W5BM5hM4rNFVkApyAyP6igPVFDeioFJUudk8pJ18nY
	a3tAvY1gyUZZO/XrY+fxYNMgaEL9AHFs7c9DdqYT7i5BDpANUaxDfkiq/Hmhvq/ylO70z2oQ0zQGA
	PL1pae554kBGFKR3qgyH2evRIuLP6+Ecfth8W7bxUgPRm1Fxq2B5tgaQ9jFKjgMcnVxIdi2BkD3JO
	rzA7OMwwnlMCPvhPEpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCC76-00000008TSD-1xzx;
	Fri, 24 Oct 2025 07:21:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCC71-00000008TMl-1m0I;
	Fri, 24 Oct 2025 07:21:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F1D0D4E412CE;
	Fri, 24 Oct 2025 07:21:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4F6760703;
	Fri, 24 Oct 2025 07:21:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EB30102F244A;
	Fri, 24 Oct 2025 09:21:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761290478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=n2SfjqX6lNSkj1H/YLHGctb/htiBAD/kfjrbeKtoNe8=;
	b=puPpxBP2v/7GBLcTgiHZwflmwE+c7IIPgQnODmI+9FPa5WOXR1bQd1A8CnbxM3Q5gmoVsN
	W11z0YLDO+Hyl0+f1X0L3BRgUfkWUSA0Nk5meqcbJoQjvbpBVFLrkmhPMY5WtbbqkVsEBb
	g3D1EP4iu7g1a4P90Fi3n8fG/OTWe3/qunL0k9zXx3auk86Ki2ksYKvUxD6D1OCs3N/B+G
	kOfBP/AWnWTknh6ErkZfBhvn30fLexAoFDqVkvGnVnzcW1Ope7DSeuv1ahBltn9ngXH36U
	agAthTSviB78yes0nszNAjig8JoB75pyIOsYrn9m+byEn2fvIXgiWILHHQCr2A==
Message-ID: <f076f6a6-372a-41ff-a78a-48d1af4ec33d@bootlin.com>
Date: Fri, 24 Oct 2025 09:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] mtd: rawnand: sunxi: introduce reg_user_data in
 sunxi_nfc_caps
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
 <20251020101311.256819-5-richard.genoud@bootlin.com>
 <87y0p3tiz9.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <87y0p3tiz9.fsf@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_002123_625325_C28F8110 
X-CRM114-Status: GOOD (  17.06  )
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

SGksCkxlIDIyLzEwLzIwMjUgw6AgMTA6NTQsIE1pcXVlbCBSYXluYWwgYSDDqWNyaXTCoDoKPiBI
aSBSaWNoYXJkLAo+IAo+IE9uIDIwLzEwLzIwMjUgYXQgMTI6MTM6MDAgKzAyLCBSaWNoYXJkIEdl
bm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+IHdyb3RlOgo+IAo+PiBUaGUgSDYvSDYx
NiBVU0VSX0RBVEEgcmVnaXN0ZXIgaXMgbm90IGF0IHRoZSBzYW1lIG9mZnNldCBhcyB0aGUKPj4g
QTEwL0EyMyBvbmUsIHNvIG1vdmUgaXRzIG9mZnNldCBpbnRvIHN1bnhpX25mY19jYXBzCj4+Cj4+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEdlbm91
ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25h
bmQvcmF3L3N1bnhpX25hbmQuYyB8IDEzICsrKysrKysrKy0tLS0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3Vu
eGlfbmFuZC5jCj4+IGluZGV4IDAyODVlNGQwY2E3Zi4uOGY1ZDhkZjE5ZTMzIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4+IEBAIC00OCw3ICs0OCw4IEBACj4+ICAgI2RlZmlu
ZSBORkNfUkVHX0RFQlVHCQkweDAwM0MKPj4gICAjZGVmaW5lIE5GQ19SRUdfQTEwX0VDQ19FUlJf
Q05UCTB4MDA0MAo+PiAgICNkZWZpbmUgTkZDX1JFR19FQ0NfRVJSX0NOVChuZmMsIHgpCSgobmZj
LT5jYXBzLT5yZWdfZWNjX2Vycl9jbnQgKyAoeCkpICYgfjB4MykKPj4gLSNkZWZpbmUgTkZDX1JF
R19VU0VSX0RBVEEoeCkJKDB4MDA1MCArICgoeCkgKiA0KSkKPj4gKyNkZWZpbmUgTkZDX1JFR19B
MTBfVVNFUl9EQVRBCTB4MDA1MAo+PiArI2RlZmluZSBORkNfUkVHX1VTRVJfREFUQShuZmMsIHgp
CShuZmMtPmNhcHMtPnJlZ191c2VyX2RhdGEgKyAoKHgpICogNCkpCj4+ICAgI2RlZmluZSBORkNf
UkVHX1NQQVJFX0FSRUEJMHgwMEEwCj4+ICAgI2RlZmluZSBORkNfUkVHX1BBVF9JRAkJMHgwMEE0
Cj4+ICAgI2RlZmluZSBORkNfUkVHX01ETUFfQUREUgkweDAwQzAKPj4gQEAgLTIxNCw2ICsyMTUs
NyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBzdW54aV9uYW5kX2NoaXAgKnRvX3N1bnhpX25hbmQo
c3RydWN0IG5hbmRfY2hpcCAqbmFuZCkKPj4gICAgKgkJCXRocm91Z2ggTUJVUyBvbiBBMjMvQTMz
IG5lZWRzIGV4dHJhIGNvbmZpZ3VyYXRpb24uCj4+ICAgICogQHJlZ19pb19kYXRhOglJL08gZGF0
YSByZWdpc3Rlcgo+PiAgICAqIEByZWdfZWNjX2Vycl9jbnQ6CUVDQyBlcnJvciBjb3VudGVyIHJl
Z2lzdGVyCj4+ICsgKiBAcmVnX3VzZXJfZGF0YToJVXNlciBkYXRhIHJlZ2lzdGVyCj4+ICAgICog
QGRtYV9tYXhidXJzdDoJRE1BIG1heGJ1cnN0Cj4+ICAgICogQGVjY19zdHJlbmd0aHM6CUF2YWls
YWJsZSBFQ0Mgc3RyZW5ndGhzIGFycmF5Cj4+ICAgICogQG5zdHJlbmd0aHM6CQlTaXplIG9mIEBl
Y2Nfc3RyZW5ndGhzCj4+IEBAIC0yMjIsNiArMjI0LDcgQEAgc3RydWN0IHN1bnhpX25mY19jYXBz
IHsKPj4gICAJYm9vbCBoYXNfbWRtYTsKPj4gICAJdW5zaWduZWQgaW50IHJlZ19pb19kYXRhOwo+
PiAgIAl1bnNpZ25lZCBpbnQgcmVnX2VjY19lcnJfY250Owo+PiArCXVuc2lnbmVkIGludCByZWdf
dXNlcl9kYXRhOwo+PiAgIAl1bnNpZ25lZCBpbnQgZG1hX21heGJ1cnN0Owo+PiAgIAljb25zdCB1
OCAqZWNjX3N0cmVuZ3RoczsKPj4gICAJdW5zaWduZWQgaW50IG5zdHJlbmd0aHM7Cj4+IEBAIC03
MjMsOCArNzI2LDggQEAgc3RhdGljIHZvaWQgc3VueGlfbmZjX2h3X2VjY19nZXRfcHJvdF9vb2Jf
Ynl0ZXMoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKm9vYiwKPj4gICB7Cj4+ICAgCXN0cnVj
dCBzdW54aV9uZmMgKm5mYyA9IHRvX3N1bnhpX25mYyhuYW5kLT5jb250cm9sbGVyKTsKPj4gICAK
Pj4gLQlzdW54aV9uZmNfdXNlcl9kYXRhX3RvX2J1ZihyZWFkbChuZmMtPnJlZ3MgKyBORkNfUkVH
X1VTRVJfREFUQShzdGVwKSksCj4+IC0JCQkJICAgb29iKTsKPj4gKwlzdW54aV9uZmNfdXNlcl9k
YXRhX3RvX2J1ZihyZWFkbChuZmMtPnJlZ3MgKwo+PiArCQkJCQkgTkZDX1JFR19VU0VSX0RBVEEo
bmZjLCBzdGVwKSksCj4+IG9vYik7Cj4gCj4gTWlub3Igbml0LCBjb2x1bW4gbGltaXQgaXMgMTAw
IG5vdywgc28gdHlwaWNhbGx5IGZvciB0aGlzIGtpbmQgb2YKPiBzaXR1YXRpb24gZXZlcnl0aGlu
ZyB3b3VsZCBmaXQgb24gYSBzaW5nbGUgbGluZS4KSW5kZWVkLCB0aGUgODAgY29sdW1uIGxpbWl0
IGhhcyBiZWVuIGxvb3NlbmVkIChidXQgYnJhaWxsZSBkaXNwbGF5cyBhcmUgCnN0aWxsIDgwIGNl
bGxzIG1heCBBRkFJSykuCkFueXdheSwgeW91J3JlIHJpZ2h0LCB0aGUgODAtcnVsZSBjb3VsZCBi
ZSBiZW50IGhlcmUgZm9yIHJlYWRhYmlsaXR5LgoKPiAKPiBEb24ndCByZXNwaW4ganVzdCBmb3Ig
dGhhdCBpZiB0aGVyZSBpcyBub3RoaW5nIGVsc2UgbGF0ZXIsIGJ1dCBpZiBhIHY0Cj4gaXMgbmVl
ZGVkIHlvdSBjYW4gY2hhbmdlIGl0Lgo+IAo+IExvb2tzIG5lYXQgb3RoZXJ3aXNlIHNvIGZhci4K
PiAKPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzIQoKCi0tIApSaWNoYXJkIEdlbm91ZCwgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
