Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19116C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uc0GLkDswt8dW+ezsmz5yeCmi8lKFlEBfMZAsuidqd8=; b=HF2cBIyHBHYUdh
	+Kn+DoUUqsOmMyXg4B0sgwJqw16IBLHIcXf5lSGZkOuI+04mEJASHs7bEFfFU+af0ltEYOmv0E1Qe
	8B2GUh++4PPNB4+v7Cic3y/ChC8Hh95Qw0tZDTbpzA0Z15Jf6R0h0b04TNMXItTToe3HClZ6EjDMp
	Vhnx+4FLZENp9p2bWb0hPelj0Ani50ZG1383hfipmkGZsyU30vFCRpbXWSYGJmF2LciAW//Ef+kDp
	lQ+UzseO2r/c1P2GOiHqcdl5VLbmJFCA3BEaWkwaPfWWXqkSzwkprnklblDHXMNs4OymR3vbHNNnl
	xIwSa+oE0Ly9VyEiCHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6oU0-004xHg-12;
	Wed, 07 Jun 2023 08:25:32 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6oTx-004xEd-1f
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 08:25:31 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686126327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HH/cng7bNv0Q6+Hy8DU1tyWKgJYv/7rMDAdOo17bcu8=;
	b=hDR8CVNP6ZJPvLTqE6Op24qxDTLiBo7UozzNueq5MOgC3Ad9IlcFi/fi+lh2PUJOFX/Cze
	JXlgs31bXcuRJBpJ5NHb4sE2+RPFUCaFVlhBDItyM2Ys6LV7Ej7dCUDZDR2b0QtRFvZZXq
	NJBd3agDFDqOMP66UPwiAcrnOxebD/KMtxin/QBOxG531GCFBbfMci8MDYUxBt3bvZaxh5
	69pPSolNkTYcr0zu9uac1psdVbD8IZsVL+7XXHLogE1qAv6d5ctcx7UtQKxqB7qdLsXF6D
	3RkYI1BV2ifZSM+pLOiP/Xcm21FX4qf+kD2rMb9T2NZV+e4pUgZeA/ZP7EN8og==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1BC91C0002;
	Wed,  7 Jun 2023 08:25:25 +0000 (UTC)
Date: Wed, 7 Jun 2023 10:25:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Linux MTD
 List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, linux-kernel@vger.kernel.org, Vignesh
 Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Kamal
 Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 11/12] mtd: rawnand: brcmnand: Add support for getting
 ecc setting from strap
Message-ID: <20230607102524.10a7a928@xps-13>
In-Reply-To: <20230606231252.94838-12-william.zhang@broadcom.com>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
	<20230606231252.94838-12-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_012529_822166_9C73BD18 
X-CRM114-Status: GOOD (  25.92  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIFR1ZSwgIDYg
SnVuIDIwMjMgMTY6MTI6NTEgLTA3MDA6Cgo+IEJDTUJDQSBicm9hZGJhbmQgU29DIGJhc2VkIGJv
YXJkIGRlc2lnbiBkb2VzIG5vdCBzcGVjaWZ5IGVjYyBzZXR0aW5nIGluCj4gZHRzIGJ1dCByYXRo
ZXIgdXNlIHRoZSBTb0MgTkFORCBzdHJhcCBpbmZvIHRvIG9idGFpbiB0aGUgZWNjIHN0cmVuZ3Ro
Cj4gYW5kIHNwYXJlIGFyZWEgc2l6ZSBzZXR0aW5nLiBBZGQgYnJjbSxuYW5kLWVjYy11c2Utc3Ry
YXAgZHRzIHByb3BldHkgZm9yCj4gdGhpcyBwdXJwb3NlIGFuZCB1cGRhdGUgZHJpdmVyIHRvIHN1
cHBvcnQgdGhpcyBvcHRpb24uCj4gCj4gVGhlIGdlbmVyaWMgbmFuZCBlY2Mgc2V0dGluZ3Mgc3Rp
bGwgdGFrZSBwcmVjZWRlbmNlIG92ZXIgdGhpcyBmbGFnLiBGb3IKPiBleGFtcGxlLCBpZiBuYW5k
LWVjYy1zdHJlbmd0aCBpcyBzZXQgaW4gdGhlIGR0cywgdGhlIGRyaXZlciBpZ25vcmVzIHRoZQo+
IHN0cmFwIHNldHRpbmcgYW5kIGZhbGxzIGJhY2sgdG8gb3JpZ2luYWwgYmVoYXZpb3IuIFRoaXMg
bWFrZXMgc3VyZSB0aGF0Cj4gdGhlIGV4aXN0aW5nIEJDTUJDQSBib2FyZCBkdHMgc3RpbGwgd29y
a3MgdGhlIG9sZCB3YXkgZXZlbiB0aGUgc3RyYXAKPiBmbGFnIGlzIHNldCBpbiB0aGUgQkNNQkNB
IGNoaXAgZHRzaS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFtIFpoYW5nIDx3aWxsaWFtLnpo
YW5nQGJyb2FkY29tLmNvbT4KPiAtLS0KPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYyB8IDcyICsrKysrKysrKysrKysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBpbmRleCA2NTZiZTRkNzMwMTYuLjhjN2NlYTM2
YWM3MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFu
ZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IEBA
IC0xMDc2LDYgKzEwNzYsMzggQEAgc3RhdGljIHZvaWQgYnJjbW5hbmRfc2V0X3NlY3Rvcl9zaXpl
XzFrKHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0LCBpbnQgdmFsKQo+ICAJbmFuZF93cml0ZXJl
ZyhjdHJsLCBhY2NfY29udHJvbF9vZmZzLCB0bXApOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IGJy
Y21uYW5kX2dldF9zcGFyZV9zaXplKHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0KQo+ICt7Cj4g
KwlzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCA9IGhvc3QtPmN0cmw7Cj4gKwl1MTYg
YWNjX2NvbnRyb2xfb2ZmcyA9IGJyY21uYW5kX2NzX29mZnNldChjdHJsLCBob3N0LT5jcywKPiAr
CQkJCQkJICBCUkNNTkFORF9DU19BQ0NfQ09OVFJPTCk7Cj4gKwl1MzIgYWNjID0gbmFuZF9yZWFk
cmVnKGN0cmwsIGFjY19jb250cm9sX29mZnMpOwo+ICsKPiArCXJldHVybiAoYWNjJmJyY21uYW5k
X3NwYXJlX2FyZWFfbWFzayhjdHJsKSk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgYnJjbW5hbmRf
Z2V0X2VjY19zdHJlbmd0aChzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCkKPiArewo+ICsJc3Ry
dWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwgPSBob3N0LT5jdHJsOwo+ICsJdTE2IGFjY19j
b250cm9sX29mZnMgPSBicmNtbmFuZF9jc19vZmZzZXQoY3RybCwgaG9zdC0+Y3MsCj4gKwkJCQkJ
CSAgQlJDTU5BTkRfQ1NfQUNDX0NPTlRST0wpOwo+ICsJaW50IHNlY3Rvcl9zaXplXzFrID0gYnJj
bW5hbmRfZ2V0X3NlY3Rvcl9zaXplXzFrKGhvc3QpOwo+ICsJaW50IHNwYXJlX2FyZWFfc2l6ZSwg
ZWNjX2xldmVsLCBlY2Nfc3RyZW5ndGg7Cj4gKwl1MzIgYWNjOwo+ICsKPiArCXNwYXJlX2FyZWFf
c2l6ZSA9IGJyY21uYW5kX2dldF9zcGFyZV9zaXplKGhvc3QpOwo+ICsJYWNjID0gbmFuZF9yZWFk
cmVnKGN0cmwsIGFjY19jb250cm9sX29mZnMpOwo+ICsJZWNjX2xldmVsID0gKGFjYyAmIGJyY21u
YW5kX2VjY19sZXZlbF9tYXNrKGN0cmwpKSA+PiBicmNtbmFuZF9lY2NfbGV2ZWxfc2hpZnQoY3Ry
bCk7Cj4gKwlpZiAoc2VjdG9yX3NpemVfMWspCj4gKwkJZWNjX3N0cmVuZ3RoID0gZWNjX2xldmVs
PDwxOwoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPwoKSWYgeW91
IG1lYW4gIngyIiB0aGVuIGxldCB0aGUgY29tcGlsZXIgZG8gdGhhdC4KCj4gKwllbHNlIGlmIChz
cGFyZV9hcmVhX3NpemUgPT0gMTYgJiYgZWNjX2xldmVsID09IDE1KQo+ICsJCWVjY19zdHJlbmd0
aCA9IDE7IC8qIGhhbW1pbmcgKi8KPiArCWVsc2UKPiArCQllY2Nfc3RyZW5ndGggPSBlY2NfbGV2
ZWw7Cj4gKwo+ICsJcmV0dXJuIGVjY19zdHJlbmd0aDsKPiArfQo+ICsKPiAgLyoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqCj4gICAqIENTX05BTkRfU0VMRUNUCj4gICAqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KPiBAQCAtMjY1Niwx
OSArMjY4OCw0MyBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3NldHVwX2RldihzdHJ1Y3QgYnJjbW5h
bmRfaG9zdCAqaG9zdCkKPiAgCQluYW5kZGV2X2dldF9lY2NfcmVxdWlyZW1lbnRzKCZjaGlwLT5i
YXNlKTsKPiAgCXN0cnVjdCBicmNtbmFuZF9jb250cm9sbGVyICpjdHJsID0gaG9zdC0+Y3RybDsK
PiAgCXN0cnVjdCBicmNtbmFuZF9jZmcgKmNmZyA9ICZob3N0LT5od2NmZzsKPiAtCWNoYXIgbXNn
WzEyOF07Cj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gbmFuZF9nZXRfZmxhc2hfbm9kZShj
aGlwKTsKPiAgCXUzMiBvZmZzLCB0bXAsIG9vYl9zZWN0b3I7Cj4gLQlpbnQgcmV0Owo+ICsJaW50
IHJldCwgc2VjdG9yX3NpemVfMWsgPSAwOwo+ICsJYm9vbCB1c2Vfc3RyYXAgPSBmYWxzZTsKPiAr
CWNoYXIgbXNnWzEyOF07Cj4gIAo+ICAJbWVtc2V0KGNmZywgMCwgc2l6ZW9mKCpjZmcpKTsKPiAr
CXVzZV9zdHJhcCA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImJyY20sbmFuZC1lY2MtdXNl
LXN0cmFwIik7Cj4gKwo+ICsJLyoKPiArCSAqIFNldCBFQ0Mgc2l6ZSBhbmQgc3RyZW5ndGggYmFz
ZWQgb24gaHcgY29uZmlndXJhdGlvbiBmcm9tIHN0cmFwCj4gKwkgKiBpZiBkZXZpY2UgdHJlZSBk
b2VzIG5vdCBzcGVjaWZ5IHRoZW0gYW5kIHVzZSBzdHJhcCBwcm9wZXJ0eSBpcyBzZXQKPiArCSAq
IElmIGVjYyBzdHJlbmd0aCBpcyBzZXQgaW4gZHRzLCBkb24ndCB1c2Ugc3RyYXAgc2V0dGluZy4K
PiArCSAqLwo+ICsJaWYgKGNoaXAtPmVjYy5zdHJlbmd0aCkKPiArCQl1c2Vfc3RyYXAgPSAwOwo+
ICsKPiArCWlmICh1c2Vfc3RyYXApIHsKPiArCQljaGlwLT5lY2Muc3RyZW5ndGggPSBicmNtbmFu
ZF9nZXRfZWNjX3N0cmVuZ3RoKGhvc3QpOwo+ICsJCXNlY3Rvcl9zaXplXzFrID0gYnJjbW5hbmRf
Z2V0X3NlY3Rvcl9zaXplXzFrKGhvc3QpOwo+ICsJCWlmIChjaGlwLT5lY2Muc2l6ZSA9PSAwKSB7
Cj4gKwkJCWlmIChzZWN0b3Jfc2l6ZV8xayA8IDApCj4gKwkJCQljaGlwLT5lY2Muc2l6ZSA9IDUx
MjsKPiArCQkJZWxzZQo+ICsJCQkJY2hpcC0+ZWNjLnNpemUgPSA1MTI8PHNlY3Rvcl9zaXplXzFr
OwoKUGxlYXNlIHJ1biBjaGVja3BhdGNoLnBsIC0tc3RyaWN0Cgo+ICsJCX0KPiArCX0KPiAgCj4g
LQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihuYW5kX2dldF9mbGFzaF9ub2RlKGNoaXApLAo+
IC0JCQkJICAgImJyY20sbmFuZC1vb2Itc2VjdG9yLXNpemUiLAo+IC0JCQkJICAgJm9vYl9zZWN0
b3IpOwo+ICsJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJicmNtLG5hbmQtb29iLXNl
Y3Rvci1zaXplIiwKPiArCQkJICAgJm9vYl9zZWN0b3IpOwo+ICAJaWYgKHJldCkgewo+IC0JCS8q
IFVzZSBkZXRlY3RlZCBzaXplICovCj4gLQkJY2ZnLT5zcGFyZV9hcmVhX3NpemUgPSBtdGQtPm9v
YnNpemUgLwo+IC0JCQkJCShtdGQtPndyaXRlc2l6ZSA+PiBGQ19TSElGVCk7Cj4gKwkJaWYgKHVz
ZV9zdHJhcCkKPiArCQkJY2ZnLT5zcGFyZV9hcmVhX3NpemUgPSBicmNtbmFuZF9nZXRfc3BhcmVf
c2l6ZShob3N0KTsKPiArCQllbHNlCj4gKwkJCS8qIFVzZSBkZXRlY3RlZCBzaXplICovCj4gKwkJ
CWNmZy0+c3BhcmVfYXJlYV9zaXplID0gbXRkLT5vb2JzaXplIC8KPiArCQkJCQkJKG10ZC0+d3Jp
dGVzaXplID4+IEZDX1NISUZUKTsKPiAgCX0gZWxzZSB7Cj4gIAkJY2ZnLT5zcGFyZV9hcmVhX3Np
emUgPSBvb2Jfc2VjdG9yOwo+ICAJfQoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
