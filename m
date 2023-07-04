Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E56EB64DA
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P59la7EJUx2TZQK/G6xxKkQKVDkseJEdfJOVQ/xqEgQ=; b=aanYAzt79VVAzN
	3n98TEFstgQ97JKdmAo6U2NusUIi1VVjD4KlR5D1JSq1IGOvpl1CGho4wJy5ATug5TBaAE7gA81VG
	M7p7CmTQBf3aXJtQesXv93+zqiqcWaEIgBhDlK7hVYsRGWb/SFDHPEFkUNM8/2Ma8EngwzJncdI1V
	F9FwgUf52XODKTOgVvXwR37Gz3aoEkFHxi94B9ac3ddtapRNMfB4wdaCWhb4tZasmGM69AcUkjtEs
	PHZ4neBYkcZMJBxwR0ghdEXWK8r3OnL3mwKLrDd1gbKfsKqbKszEezUc9X1c+s097X7lupBMpEop4
	nl6BFaykJppqvB+jIogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhzY-00Dfja-0G;
	Tue, 04 Jul 2023 15:31:00 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhzU-00DfiI-36
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2023 15:30:58 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688484652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZX16cb0vysqNBL15q7yQtbXUFPDe1wHeaQILrdlWpc=;
	b=alTsk9caUlt0vIzwV4iDsME7+ossT3XY51toxhwiV9KXtoCzrCr/PnkHy/Y/lWRttvIfQz
	p020Sm1vdFCREet1PQwSNBSIncyv4tBC9tED4Jsvvwaw8lzXNwuQNb1Mw0owQb0+2SIkiU
	C6eVevnS/CCllnnNTCf1WAOFnH6FGvs6ijt1xgtCP5dlhr7aCtkgYt1K2mA6O2LHLgZTuZ
	RIMyOZD14q0WKNNPfg8z3c8Fun0gmYC5OnAbfBXq8hlormHJT47ajC6VXq7oDQFk0P4HIk
	iqZhzHGrQzCvcj1zTuLfzdb8N7WvC+nbAs48vqdiv7dH+mCd0QXeK4T6rNncUg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82425E0011;
	Tue,  4 Jul 2023 15:30:48 +0000 (UTC)
Date: Tue, 4 Jul 2023 17:30:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Linux MTD
 List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon
 <bbrezillon@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v3 5/5] mtd: rawnand: brcmnand: Fix mtd oobsize
Message-ID: <20230704173047.395e445e@xps-13>
In-Reply-To: <20230627193738.19596-6-william.zhang@broadcom.com>
References: <20230627193738.19596-1-william.zhang@broadcom.com>
	<20230627193738.19596-6-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_083057_293326_E337918E 
X-CRM114-Status: GOOD (  22.65  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIFR1ZSwgMjcg
SnVuIDIwMjMgMTI6Mzc6MzggLTA3MDA6Cgo+IGJyY21uYW5kIGNvbnRyb2xsZXIgY2FuIG9ubHkg
YWNjZXNzIHRoZSBmbGFzaCBzcGFyZSBhcmVhIHVwIHRvIGNlcnRhaW4KPiBieXRlcyBiYXNlZCBv
biB0aGUgRUNDIGxldmVsLiBJdCBjYW4gYmUgbGVzcyB0aGFuIHRoZSBhY3R1YWwgZmxhc2ggc3Bh
cmUKPiBhcmVhIHNpemUuIEZvciBleGFtcGxlLCBmb3IgbWFueSBOQU5EIGNoaXAgc3VwcG9ydGlu
ZyBFQ0MgQkNILTgsIGl0IGhhcwo+IDIyNiBieXRlcyBzcGFyZSBhcmVhLiBCdXQgY29udHJvbGxl
ciBjYW4gb25seSB1c2VzIDIxOCBieXRlcy4gU28gYnJjbWFuZAo+IGRyaXZlciBvdmVycmlkZXMg
dGhlIG10ZCBvb2JzaXplIHdpdGggdGhlIGNvbnRyb2xsZXIncyBhY2Nlc3NpYmxlIHNwYXJlCj4g
YXJlYSBzaXplLiBXaGVuIHRoZSBuYW5kIGJhc2UgZHJpdmVyIHV0aWxpemVzIHRoZSBuYW5kX2Rl
dmljZSBvYmplY3QsIGl0Cj4gcmVzZXRzIHRoZSBvb2JzaXplIGJhY2sgdG8gdGhlIGFjdHVhbCBm
bGFzaCBzcGFyZSBhcHJlYSBzaXplIGZyb20KPiBuYW5kX21lbW9yeV9vcmdhbml6YXRpb24gc3Ry
dWN0dXJlIGFuZCBjb250cm9sbGVyIG1heSBub3QgYWJsZSB0byBhY2Nlc3MKPiBhbGwgdGhlIG9v
YiBhcmVhIGFzIG10ZCBhZHZpc2VzLgo+IAo+IFRoaXMgY2hhbmdlIGZpeGVzIHRoZSBpc3N1ZSBi
eSBvdmVycmlkaW5nIHRoZSBvb2JzaXplIGluIHRoZQo+IG5hbmRfbWVtb3J5X29yZ2FuaXphdGlv
biBzdHJ1Y3R1cmUgdG8gdGhlIGNvbnRyb2xsZXIncyBhY2Nlc3NpYmxlIHNwYXJlCj4gYXJlYSBz
aXplLgoKSSBhbSBjbGVhcmx5IG5vdCBhIGJpZyBmYW4gb2YgdGhpcyBzb2x1dGlvbi4gbWVtb3Jn
IHNob3VsZCBiZSBhbmQKcmVtYWluIGEgcmVhZCBvbmx5IG9iamVjdC4gQ2FuIHlvdSBwbGVhc2Ug
ZmluZCBhbm90aGVyIHNvbHV0aW9uPwoKPiAKPiBGaXhlczogYTdhYjA4NWQ3YzE2ICgibXRkOiBy
YXduYW5kOiBJbml0aWFsaXplIHRoZSBuYW5kX2RldmljZSBvYmplY3QiKQo+IFNpZ25lZC1vZmYt
Ynk6IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tPgo+IAo+IC0tLQo+
IAo+IENoYW5nZXMgaW4gdjM6IE5vbmUKPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4gCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCA3ICsrKysrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBpbmRleCA0MDdiZjc5Y2JhZjQuLjM5Yzdm
NTQ3ZGIxZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNt
bmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+
IEBAIC0yNjQ3LDYgKzI2NDcsOCBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3NldHVwX2RldihzdHJ1
Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCkKPiAgCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSAmaG9z
dC0+Y2hpcDsKPiAgCWNvbnN0IHN0cnVjdCBuYW5kX2VjY19wcm9wcyAqcmVxdWlyZW1lbnRzID0K
PiAgCQluYW5kZGV2X2dldF9lY2NfcmVxdWlyZW1lbnRzKCZjaGlwLT5iYXNlKTsKPiArCXN0cnVj
dCBuYW5kX21lbW9yeV9vcmdhbml6YXRpb24gKm1lbW9yZyA9Cj4gKwkJbmFuZGRldl9nZXRfbWVt
b3JnKCZjaGlwLT5iYXNlKTsKPiAgCXN0cnVjdCBicmNtbmFuZF9jb250cm9sbGVyICpjdHJsID0g
aG9zdC0+Y3RybDsKPiAgCXN0cnVjdCBicmNtbmFuZF9jZmcgKmNmZyA9ICZob3N0LT5od2NmZzsK
PiAgCWNoYXIgbXNnWzEyOF07Cj4gQEAgLTI2NjgsMTAgKzI2NzAsMTEgQEAgc3RhdGljIGludCBi
cmNtbmFuZF9zZXR1cF9kZXYoc3RydWN0IGJyY21uYW5kX2hvc3QgKmhvc3QpCj4gIAlpZiAoY2Zn
LT5zcGFyZV9hcmVhX3NpemUgPiBjdHJsLT5tYXhfb29iKQo+ICAJCWNmZy0+c3BhcmVfYXJlYV9z
aXplID0gY3RybC0+bWF4X29vYjsKPiAgCS8qCj4gLQkgKiBTZXQgb29ic2l6ZSB0byBiZSBjb25z
aXN0ZW50IHdpdGggY29udHJvbGxlcidzIHNwYXJlX2FyZWFfc2l6ZSwgYXMKPiAtCSAqIHRoZSBy
ZXN0IGlzIGluYWNjZXNzaWJsZS4KPiArCSAqIFNldCBtdGQgYW5kIG1lbW9yZyBvb2JzaXplIHRv
IGJlIGNvbnNpc3RlbnQgd2l0aCBjb250cm9sbGVyJ3MKPiArCSAqIHNwYXJlX2FyZWFfc2l6ZSwg
YXMgdGhlIHJlc3QgaXMgaW5hY2Nlc3NpYmxlLgo+ICAJICovCj4gIAltdGQtPm9vYnNpemUgPSBj
ZmctPnNwYXJlX2FyZWFfc2l6ZSAqIChtdGQtPndyaXRlc2l6ZSA+PiBGQ19TSElGVCk7Cj4gKwlt
ZW1vcmctPm9vYnNpemUgPSBtdGQtPm9vYnNpemU7Cj4gIAo+ICAJY2ZnLT5kZXZpY2Vfc2l6ZSA9
IG10ZC0+c2l6ZTsKPiAgCWNmZy0+YmxvY2tfc2l6ZSA9IG10ZC0+ZXJhc2VzaXplOwoKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
