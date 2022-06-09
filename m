Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0303C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 10:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Ogn6IyiXhtU1c/TIeaCbzY7N2Ny3xL2XoaUbN066s4=; b=gJafEzjmgkCjLA
	xsVaA3fibDPdgZuI0m4oV7A47BQAFj5RpdtAfYN3q93Rz4SEZaIPQtnBNWyijMAKRLvtatLE774+l
	uU+PU4yZ9wHcWsSr0dpnBymyp8DviLvKMXEovTPYYVAIep/yqW4zRORfhtKd+p12/DJ0z5ROcy6Cs
	X93ld21fnRdf2JpwiLJI8Rtrm8ar96aQDKgUt2jZsD59dcNRrMtxeCa3j4kfkJbH/9VSGwNMtN9jA
	nSXMD4YEyAGvEuviMji6xD+q/N9hyKHIUBxhQWzOG5DOtiiLgMUdjYN1MUIU9HjehSlHsjEQ8wVxG
	NC/gt9tlIsR+1x6MtFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFiO-0017sl-FQ; Thu, 09 Jun 2022 10:48:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFiK-0017qL-5c
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 10:48:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81AA561DAA;
	Thu,  9 Jun 2022 10:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD59C34114;
	Thu,  9 Jun 2022 10:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654771710;
	bh=fzrWexAskT7761OX6YVLpBV0uk5ZpeEoL980M4D3UYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4tHsGIzjTjEj6emD016kI2+9negOY8WK6XJwW/Czy9mjKVCilf0dspL6QLJFZWMe
	 m/CXhgKNyia+kNN0KG6CRloxkv7yPn49QagcfAqgIyRDAf24xpG/aXzFzZ1i78HO7y
	 AYVe/KlZWI8JRsW2V9sjLlbXWu6RqSdy4uLMHQpAnWg5uuH00l8FwYEd4suhPZkSU6
	 boPl/mJpnbPGuJDl0zt1eGK25+lf73zfFT1bJR3f0nfcGAufXq9qGYHuxiUywTFBsN
	 7wM8DR015BDwak8YJkABHrI2Yqjkvpri32Rh8KX/rXAkY2rJm1sQ/cr+RkeiAo/id0
	 aJOkyEuolb2YA==
Date: Thu, 9 Jun 2022 16:18:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] mtd: nand: raw: qcom_nandc: reorder
 qcom_nand_host struct
Message-ID: <20220609104818.GE2758@thinkpad>
References: <20220608001030.18813-1-ansuelsmth@gmail.com>
 <20220608001030.18813-4-ansuelsmth@gmail.com>
 <20220609072240.GB2758@thinkpad>
 <62a1caf0.1c69fb81.a67af.bdf8@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62a1caf0.1c69fb81.a67af.bdf8@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_034832_287771_66B7BCE9 
X-CRM114-Status: GOOD (  23.11  )
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

T24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMTI6MjY6NTNQTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IE9uIFRodSwgSnVuIDA5LCAyMDIyIGF0IDEyOjUyOjQwUE0gKzA1MzAsIE1hbml2YW5u
YW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+IE9uIFdlZCwgSnVuIDA4LCAyMDIyIGF0IDAyOjEwOjMw
QU0gKzAyMDAsIEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+ID4gUmVvcmRlciBxY29tX25hbmRfaG9z
dCB0byBzYXZlIGhvbGVzIGluIHRoZSBzdHJ1Y3QuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBBbnN1ZWwgU21pdGggPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+ID4gCj4gPiBJZiB0aGlzIHBh
dGNoIGdldHMgbW92ZWQgdG8gMi8zLCB5b3UgY291bGQgc2F2ZSBmZXcgY2hhbmdlcy4gQWxzbywg
ZG8gdGhlIHNhbWUKPiA+IGZvciBvdGhlciBzdHJ1Y3RzIGFzIHdlbGwuCj4gPiAKPiA+IFRoYW5r
cywKPiA+IE1hbmkKPiA+Cj4gCj4gU2luY2UgMi8zIGFscmVhZHkgaGFkIGxvdHMgb2YgY2hhbmdl
cyBkaWRuJ3Qgd2FudCB0byBwdXQgYSBzdHJ1Y3QKPiByZW9yZGVyIGluIGl0IHNpbmNlIGl0IGRv
ZXMgdG91Y2ggYWxzbyBvdGhlciB2YWx1ZXMuIFRlbGwgbWUgaWYgSSBzaG91bGQKPiBzcXVhc2gg
dGhlIDIgY29tbWl0Lgo+IAoKTm90IHNxdWFzaGluZyBidXQgSSBtZWFuIHRvIG1vdmUgdGhpcyBw
YXRjaCBiZWZvcmUgdGhlIGRyaXZlciBjaGFuZ2UgKDEvMyksIHNvCnRoYXQgImNvZGV3b3JkX2Zp
eHVwIiBjYW4gYmUgYWRkZWQgaW4gdGhlIGNvcnJlY3QgcGxhY2UuCgpBbHNvIG1vdmUgdGhlIHJl
c3BlY3RpdmUgS2RvYyBjb21tZW50cy4KClRoYW5rcywKTWFuaQoKPiA+ID4gLS0tCj4gPiA+ICBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCA3ICsrKystLS0KPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPiA+IGluZGV4IDA2ZWU5YTgzNmEzYi4uMTEwZjgz
OWM5ZTUxIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMKPiA+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPiA+IEBA
IC00NzUsMTEgKzQ3NSwxMyBAQCBzdHJ1Y3QgcWNvbV9uYW5kX2hvc3Qgewo+ID4gPiAgCWludCBj
czsKPiA+ID4gIAlpbnQgY3dfc2l6ZTsKPiA+ID4gIAlpbnQgY3dfZGF0YTsKPiA+ID4gLQlib29s
IHVzZV9lY2M7Cj4gPiA+IC0JYm9vbCBiY2hfZW5hYmxlZDsKPiA+ID4gIAlpbnQgZWNjX2J5dGVz
X2h3Owo+ID4gPiAgCWludCBzcGFyZV9ieXRlczsKPiA+ID4gIAlpbnQgYmJtX3NpemU7Cj4gPiA+
ICsKPiA+ID4gKwlib29sIGNvZGV3b3JkX2ZpeHVwOwo+ID4gPiArCWJvb2wgdXNlX2VjYzsKPiA+
ID4gKwlib29sIGJjaF9lbmFibGVkOwo+ID4gPiAgCXU4IHN0YXR1czsKPiA+ID4gIAlpbnQgbGFz
dF9jb21tYW5kOwo+ID4gPiAgCj4gPiA+IEBAIC00OTAsNyArNDkyLDYgQEAgc3RydWN0IHFjb21f
bmFuZF9ob3N0IHsKPiA+ID4gIAl1MzIgY2xyZmxhc2hzdGF0dXM7Cj4gPiA+ICAJdTMyIGNscnJl
YWRzdGF0dXM7Cj4gPiA+ICAKPiA+ID4gLQlib29sIGNvZGV3b3JkX2ZpeHVwOwo+ID4gPiAgCWlu
dCBucl9ib290X3BhcnRpdGlvbnM7Cj4gPiA+ICAJc3RydWN0IHFjb21fbmFuZF9ib290X3BhcnRp
dGlvbiAqYm9vdF9wYXJ0aXRpb25zOwo+ID4gPiAgfTsKPiA+ID4gLS0gCj4gPiA+IDIuMzYuMQo+
ID4gPiAKPiA+IAo+ID4gLS0gCj4gPiDgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k
4K6+4K6a4K6/4K614K6u4K+NCj4gCj4gLS0gCj4gCUFuc3VlbAoKLS0gCuCuruCuo+Cuv+CuteCu
o+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
