Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BBEC7EE23
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 08:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6Ci9h2ObALqTqZoWQeR4NxVA2L460m+Ui0Eutf9CUg=; b=3NzQzTdp6sPnqA
	V5aQuztayQlCbVsmJJ0P8NEbbTMx3EEKMUakXN93CLin/uwfUKSen98mXppx7/Hel8gL5eKWReO+O
	IgoMC4hz4YjvUE/ImxUXiZ37Lj6jrEHWUzqvKVP0rxh9JhW6MWWNJC6TRPHyMsu5BFMoEkXYxI5xe
	TJgFvW59vYPBQT4k4aTpbDYRvaVGL6eDMq5dhryyK8x0OLVAKsmxtMkNt4xQBLipSzF31fDAfwryd
	0oLLUZ5pbHeeWEz8bHfvvJb1I8bjbYqMZYT/aBhUT/trxmfdzbrXLXgsiYI7EGhKuCUIysxcuHU7r
	Vn64AxHX5GPYcxTGCeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6oBK-004rqE-0V;
	Wed, 07 Jun 2023 08:06:14 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6oBH-004rpQ-0w
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 08:06:12 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686125169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rTWChzRyayI78lhaVUyNkBtUmmWF3hQHhfD/t1f4gmM=;
	b=Sy2QbKFD8xw5UqJnG7YiQuQLZDV5+PmStmjpqY4S/04TYotd2+Ow/S9wQcGptwGnNf1uxM
	SmHzSRTKL5png8d9FrgWQD/RSqjFSxqiwHVI2pXLh1ohRFXtO7vM1HlRPpc7noix8mz32v
	jRyIfPQSMd2J4NTFrXpLj160MPrkOAaoHLtaCDpk33uXpVo36o36+rJRozF7DObYJRQtht
	hyKtFRLxI83vuElPcpfwH2J7JPXETRPYJxAXL/XRtRZ1h1fOSI9b4OMCqwAaY4Kt8OkQHF
	W+TZZdnacem7zQaq3Hu86wbZmIu0ssQFrEvtDuX/4N7moZqqCzPX+fdM9prJ5g==
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
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 431341C0006;
	Wed,  7 Jun 2023 08:06:08 +0000 (UTC)
Date: Wed, 7 Jun 2023 10:06:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Linux MTD
 List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, Florian Fainelli
 <florian.fainelli@broadcom.com>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon
 <bbrezillon@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 01/12] mtd: rawnand: brcmnand: Fix ECC level field
 setting for v7.2 controller
Message-ID: <20230607100607.135bfba4@xps-13>
In-Reply-To: <20230606231252.94838-2-william.zhang@broadcom.com>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
	<20230606231252.94838-2-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_010611_589907_80344DF8 
X-CRM114-Status: GOOD (  17.48  )
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
SnVuIDIwMjMgMTY6MTI6NDEgLTA3MDA6Cgo+IHY3LjIgY29udHJvbGxlciBoYXMgZGlmZmVyZW50
IEVDQyBsZXZlbCBmaWVsZCBzaXplIGFuZCBzaGlmdCBpbiB0aGUgYWNjCj4gY29udHJvbCByZWdp
c3RlciB0aGFuIGl0cyBwcmVkZWNlc3NvciBhbmQgc3VjY2Vzc29yIGNvbnRyb2xsZXIuIEl0IG5l
ZWRzCj4gdG8gYmUgc2V0IHNwZWNpZmljYWxseS4KPiAKPiBGaXhlczogZGVjYmE2ZDQ3ODY5ICgi
bXRkOiBicmNtbmFuZDogQWRkIHY3LjIgY29udHJvbGxlciBzdXBwb3J0IikKPiBTaWduZWQtb2Zm
LWJ5OiBXaWxsaWFtIFpoYW5nIDx3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbT4KPiBSZXZpZXdl
ZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zmxvcmlhbi5mYWluZWxsaUBicm9hZGNvbS5jb20+Cj4g
LS0tCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCAxNCAr
KysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBp
bmRleCAyZTljMmUyZDljOWYuLmIyY2RlMTA4MmIzYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IEBAIC05NzcsMTIgKzk3NywyMCBAQCBzdGF0aWMgaW5s
aW5lIHUzMiBicmNtbmFuZF9lY2NfbGV2ZWxfbWFzayhzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxl
ciAqY3RybCkKPiAgCW1hc2sgPDw9IE5BTkRfQUNDX0NPTlRST0xfRUNDX1NISUZUOwo+ICAKPiAg
CS8qIHY3LjIgaW5jbHVkZXMgYWRkaXRpb25hbCBFQ0MgbGV2ZWxzICovCj4gLQlpZiAoY3RybC0+
bmFuZF92ZXJzaW9uID49IDB4MDcwMikKPiArCWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPT0gMHgw
NzAyKQo+ICAJCW1hc2sgfD0gMHg3IDw8IE5BTkRfQUNDX0NPTlRST0xfRUNDX0VYVF9TSElGVDsK
PiAgCj4gIAlyZXR1cm4gbWFzazsKPiAgfQo+ICAKPiArc3RhdGljIGlubGluZSBpbnQgYnJjbW5h
bmRfZWNjX2xldmVsX3NoaWZ0KHN0cnVjdCBicmNtbmFuZF9jb250cm9sbGVyICpjdHJsKQo+ICt7
Cj4gKwlpZiAoY3RybC0+bmFuZF92ZXJzaW9uID09IDB4MDcwMikKPiArCQlyZXR1cm4gTkFORF9B
Q0NfQ09OVFJPTF9FQ0NfRVhUX1NISUZUOwo+ICsJZWxzZQo+ICsJCXJldHVybiBOQU5EX0FDQ19D
T05UUk9MX0VDQ19TSElGVDsKPiArfQo+ICsKPiAgc3RhdGljIHZvaWQgYnJjbW5hbmRfc2V0X2Vj
Y19lbmFibGVkKHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0LCBpbnQgZW4pCj4gIHsKPiAgCXN0
cnVjdCBicmNtbmFuZF9jb250cm9sbGVyICpjdHJsID0gaG9zdC0+Y3RybDsKPiBAQCAtOTkyLDgg
KzEwMDAsOCBAQCBzdGF0aWMgdm9pZCBicmNtbmFuZF9zZXRfZWNjX2VuYWJsZWQoc3RydWN0IGJy
Y21uYW5kX2hvc3QgKmhvc3QsIGludCBlbikKPiAgCj4gIAlpZiAoZW4pIHsKPiAgCQlhY2NfY29u
dHJvbCB8PSBlY2NfZmxhZ3M7IC8qIGVuYWJsZSBSRC9XUiBFQ0MgKi8KPiAtCQlhY2NfY29udHJv
bCB8PSBob3N0LT5od2NmZy5lY2NfbGV2ZWwKPiAtCQkJICAgICAgIDw8IE5BTkRfQUNDX0NPTlRS
T0xfRUNDX1NISUZUOwo+ICsJCWFjY19jb250cm9sICY9IH5icmNtbmFuZF9lY2NfbGV2ZWxfbWFz
ayhjdHJsKTsKCkNvdWxkIHdlIHVzZSBzdGF0aWMgZHJpdmVyIGRhdGEgaW5zdGVhZD8gTGV0J3Mg
YXZvaWQgbWFraW5nCm5vbi11c2VmdWwgZnVuY3Rpb24gY2FsbHMgd2hlbiB0aGlzIGNhbiBlYXNp
bHkgYmUgYXZvaWRlZC4KCj4gKwkJYWNjX2NvbnRyb2wgfD0gaG9zdC0+aHdjZmcuZWNjX2xldmVs
IDw8IGJyY21uYW5kX2VjY19sZXZlbF9zaGlmdChjdHJsKTsKPiAgCX0gZWxzZSB7Cj4gIAkJYWNj
X2NvbnRyb2wgJj0gfmVjY19mbGFnczsgLyogZGlzYWJsZSBSRC9XUiBFQ0MgKi8KPiAgCQlhY2Nf
Y29udHJvbCAmPSB+YnJjbW5hbmRfZWNjX2xldmVsX21hc2soY3RybCk7CgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
