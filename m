Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80360C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jun 2022 07:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpiiCJEjDaMgBVgfF5fhJQDU+CjfIVV3N96KafdbLMw=; b=ai/WBOJxm1HvST
	PXwWbNqzotqrfwdh1RGxb9wxo2qjjhK2Pk8ZL670jZerRm7HgRL7KiPCOGQtUMehBlczA3U33qgrG
	LD/4Vww6Uavkwuxn6w4PERDlb4rmTaf2SciwgVXj4pyXNyoyqyEr0IFRNJjdEazX9+OKNk54im7Wa
	Byz/wypuJuCYssK9+9cHz/Miu5czb58Dp6XmXTpP1ibzxP5G8t55kLw/mjkWCdGEkLJchY4Z00Vyr
	dLkURuRF6dZEbsfjZxtOzTrc1nwju4hmnn+nZG19zk5UVALDHJuaz8ykkvW9cUni7MlJtsNBB8vE6
	USGfmylYS7v5lTN36u8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6oZ5-00FlkE-5J; Thu, 30 Jun 2022 07:26:15 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6oZ1-00FliQ-QZ
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2022 07:26:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5C3B810000C;
	Thu, 30 Jun 2022 07:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656573966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RbHADpDXYr/X5U7Qq4I3DXnnwEmjtF/efxJQ5ykP7Io=;
	b=VherGTDEfCbIuQysIFuAAJsl6Ygh2UoZMdw+yIdXK2X5fZ8d11J5vIhR/7MQtz3xKOt73Y
	K9iEIF+mDDrNpg3TX0aMXuLLE/O/nfzayqXQ/mBvf5ITXEE7cCyzKOguOiTyhaHVoZ8RNq
	yjI3bEpAgxb0qxcHG7QwnMDWdGB9eEqB1NtvIRevfN1BSKWnSHhFvPBgoFt/TYPePBlYAc
	BygPdlDjczkRo9yZCNecazZuGo+pE1TSxp/532OeL3UjaZ7izxi2jFf4lgjHIg7JfBlBc2
	e21eQOgI9zwOz8TA+mBYNx/5PRKQDgGfhKq/Dr1p3oa2cs7pVD9FnHIKbdA/Mg==
Date: Thu, 30 Jun 2022 09:25:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Richard Weinberger
 <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] memory: renesas-rpc-if: Pass device instead of
 rpcif to rpcif_*()
Message-ID: <20220630092552.68a8b3ff@xps-13>
In-Reply-To: <e313b7f9a856fd8546aabb20d44d10e3af6676c6.1656341824.git.geert+renesas@glider.be>
References: <cover.1656341824.git.geert+renesas@glider.be>
	<e313b7f9a856fd8546aabb20d44d10e3af6676c6.1656341824.git.geert+renesas@glider.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_002612_163976_1E3874A9 
X-CRM114-Status: GOOD (  16.61  )
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

SGkgS3J6eXN6dG9mLAoKZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUgd3JvdGUgb24gTW9uLCAyNyBK
dW4gMjAyMiAxNzozMToxMyArMDIwMDoKCj4gTW9zdCBycGNpZl8qKCkgQVBJIGZ1bmN0aW9ucyBk
byBub3QgbmVlZCBhY2Nlc3MgdG8gYW55IG90aGVyIGZpZWxkcyBpbgo+IHRoZSBycGNpZiBzdHJ1
Y3R1cmUgdGhhbiB0aGUgZGV2aWNlIHBvaW50ZXIuICBTaW1wbGlmeSBkZXBlbmRlbmNpZXMgYnkK
PiBwYXNzaW5nIHRoZSBkZXZpY2UgcG9pbnRlciBpbnN0ZWFkLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gLS0tCj4gIGRy
aXZlcnMvbWVtb3J5L3JlbmVzYXMtcnBjLWlmLmMgfCAzMiArKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLQo+ICBkcml2ZXJzL210ZC9oeXBlcmJ1cy9ycGMtaWYuYyAgIHwgMTggKysrKysr
KysrLS0tLS0tLS0tCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvaHlwZXJidXMv
cnBjLWlmLmMgYi9kcml2ZXJzL210ZC9oeXBlcmJ1cy9ycGMtaWYuYwo+IGluZGV4IGQwMGQzMDI0
MzQwMzBiMjAuLjQxNzM0ZTMzN2FjMDBlNDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvaHlw
ZXJidXMvcnBjLWlmLmMKPiArKysgYi9kcml2ZXJzL210ZC9oeXBlcmJ1cy9ycGMtaWYuYwo+IEBA
IC01Niw3ICs1Niw3IEBAIHN0YXRpYyB2b2lkIHJwY2lmX2hiX3ByZXBhcmVfcmVhZChzdHJ1Y3Qg
cnBjaWYgKnJwYywgdm9pZCAqdG8sCj4gIAlvcC5kYXRhLm5ieXRlcyA9IGxlbjsKPiAgCW9wLmRh
dGEuYnVmLmluID0gdG87Cj4gIAo+IC0JcnBjaWZfcHJlcGFyZShycGMsICZvcCwgTlVMTCwgTlVM
TCk7Cj4gKwlycGNpZl9wcmVwYXJlKHJwYy0+ZGV2LCAmb3AsIE5VTEwsIE5VTEwpOwo+ICB9Cj4g
IAo+ICBzdGF0aWMgdm9pZCBycGNpZl9oYl9wcmVwYXJlX3dyaXRlKHN0cnVjdCBycGNpZiAqcnBj
LCB1bnNpZ25lZCBsb25nIHRvLAo+IEBAIC03MCw3ICs3MCw3IEBAIHN0YXRpYyB2b2lkIHJwY2lm
X2hiX3ByZXBhcmVfd3JpdGUoc3RydWN0IHJwY2lmICpycGMsIHVuc2lnbmVkIGxvbmcgdG8sCj4g
IAlvcC5kYXRhLm5ieXRlcyA9IGxlbjsKPiAgCW9wLmRhdGEuYnVmLm91dCA9IGZyb207Cj4gIAo+
IC0JcnBjaWZfcHJlcGFyZShycGMsICZvcCwgTlVMTCwgTlVMTCk7Cj4gKwlycGNpZl9wcmVwYXJl
KHJwYy0+ZGV2LCAmb3AsIE5VTEwsIE5VTEwpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdTE2IHJwY2lm
X2hiX3JlYWQxNihzdHJ1Y3QgaHlwZXJidXNfZGV2aWNlICpoYmRldiwgdW5zaWduZWQgbG9uZyBh
ZGRyKQo+IEBAIC04MSw3ICs4MSw3IEBAIHN0YXRpYyB1MTYgcnBjaWZfaGJfcmVhZDE2KHN0cnVj
dCBoeXBlcmJ1c19kZXZpY2UgKmhiZGV2LCB1bnNpZ25lZCBsb25nIGFkZHIpCj4gIAo+ICAJcnBj
aWZfaGJfcHJlcGFyZV9yZWFkKCZoeXBlcmJ1cy0+cnBjLCAmZGF0YSwgYWRkciwgMik7Cj4gIAo+
IC0JcnBjaWZfbWFudWFsX3hmZXIoJmh5cGVyYnVzLT5ycGMpOwo+ICsJcnBjaWZfbWFudWFsX3hm
ZXIoaHlwZXJidXMtPnJwYy5kZXYpOwo+ICAKPiAgCXJldHVybiBkYXRhLnhbMF07Cj4gIH0KPiBA
QCAtOTQsNyArOTQsNyBAQCBzdGF0aWMgdm9pZCBycGNpZl9oYl93cml0ZTE2KHN0cnVjdCBoeXBl
cmJ1c19kZXZpY2UgKmhiZGV2LCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gIAo+ICAJcnBjaWZfaGJf
cHJlcGFyZV93cml0ZSgmaHlwZXJidXMtPnJwYywgYWRkciwgJmRhdGEsIDIpOwo+ICAKPiAtCXJw
Y2lmX21hbnVhbF94ZmVyKCZoeXBlcmJ1cy0+cnBjKTsKPiArCXJwY2lmX21hbnVhbF94ZmVyKGh5
cGVyYnVzLT5ycGMuZGV2KTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgcnBjaWZfaGJfY29weV9m
cm9tKHN0cnVjdCBoeXBlcmJ1c19kZXZpY2UgKmhiZGV2LCB2b2lkICp0bywKPiBAQCAtMTA1LDcg
KzEwNSw3IEBAIHN0YXRpYyB2b2lkIHJwY2lmX2hiX2NvcHlfZnJvbShzdHJ1Y3QgaHlwZXJidXNf
ZGV2aWNlICpoYmRldiwgdm9pZCAqdG8sCj4gIAo+ICAJcnBjaWZfaGJfcHJlcGFyZV9yZWFkKCZo
eXBlcmJ1cy0+cnBjLCB0bywgZnJvbSwgbGVuKTsKPiAgCj4gLQlycGNpZl9kaXJtYXBfcmVhZCgm
aHlwZXJidXMtPnJwYywgZnJvbSwgbGVuLCB0byk7Cj4gKwlycGNpZl9kaXJtYXBfcmVhZChoeXBl
cmJ1cy0+cnBjLmRldiwgZnJvbSwgbGVuLCB0byk7Cj4gIH0KPiAgCj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaHlwZXJidXNfb3BzIHJwY2lmX2hiX29wcyA9IHsKPiBAQCAtMTMwLDkgKzEzMCw5IEBA
IHN0YXRpYyBpbnQgcnBjaWZfaGJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiAgCj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBoeXBlcmJ1cyk7Cj4gIAo+IC0JcnBj
aWZfZW5hYmxlX3JwbSgmaHlwZXJidXMtPnJwYyk7Cj4gKwlycGNpZl9lbmFibGVfcnBtKGh5cGVy
YnVzLT5ycGMuZGV2KTsKPiAgCj4gLQllcnJvciA9IHJwY2lmX2h3X2luaXQoJmh5cGVyYnVzLT5y
cGMsIHRydWUpOwo+ICsJZXJyb3IgPSBycGNpZl9od19pbml0KGh5cGVyYnVzLT5ycGMuZGV2LCB0
cnVlKTsKPiAgCWlmIChlcnJvcikKPiAgCQlnb3RvIG91dF9kaXNhYmxlX3JwbTsKPiAgCj4gQEAg
LTE1MCw3ICsxNTAsNyBAQCBzdGF0aWMgaW50IHJwY2lmX2hiX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gIAlyZXR1cm4gMDsKPiAgCj4gIG91dF9kaXNhYmxlX3JwbToKPiAt
CXJwY2lmX2Rpc2FibGVfcnBtKCZoeXBlcmJ1cy0+cnBjKTsKPiArCXJwY2lmX2Rpc2FibGVfcnBt
KGh5cGVyYnVzLT5ycGMuZGV2KTsKPiAgCXJldHVybiBlcnJvcjsKPiAgfQoKVGhpcyB3aWxsIG9u
bHkgYXBwbHkgb24gdG9wIG9mIG10ZC9uZXh0LCBiZWNhdXNlIHRoYXQKcnBjaWZfZGlzYWJsZV9y
cG0oKSBiYWxhbmNlIGNhbGwgd2FzIHZlcnkgcmVjZW50bHkgY29udHJpYnV0ZWQgYnkgR2VlcnQ6
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC9mMzA3MGUxYWY0ODBjYjI1MmFlMTgz
ZDQ3OWE1OTNkYmJmOTQ3Njg1LjE2NTU0NTc3OTAuZ2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
LwoKU28gd2UgbmVlZCB0byBmaXJzdCBzaGFyZSBhbiBpbW11dGFibGUgdGFnIG9uIHRoZSBjdXJy
ZW50IG10ZC9uZXh0CmJyYW5jaC4gUmljaGFyZCwgdGhhdCBpcyBteSB2YWNhdGlvbiBnaWZ0IGZv
ciB5b3UgOikKCk90aGVyd2lzZSwKCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
