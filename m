Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4A8EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 15:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rby76OgaO0mzB3TzFs6P74a/7XKGfHlTxbNDkNd9twA=; b=U6o2hNROBDm+O0
	3WhXrDJ0z86+i761+tRTZBxS9AB+dGoNbOEyZnAtNYvLFP3WgT5lsAeF1rHzq4St8Kg+t/IkPcxE5
	NYAyg+H1ofCr5QQZuEwiKS0vyM3uBdokDNVW5boEleKPIq7ueI43khaj+gY8klCj1XJwQNOMdajpR
	uJyNORBH3oJvgmzU8uQyAtEArU+zwRg8oehiI8y14JQklxSkgX1adVqE0TUiuK6zH+GE1hkfGcc/D
	yG6G5naZbFa+umstggkaBAXtEB1cbi1DuqAmABusMRLZ1yMbwaeZTpqkKlNW07HJZbh7wbHOiYS6H
	Bw42KI4yWGDILzNThZ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhuu-00Deol-29;
	Tue, 04 Jul 2023 15:26:12 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhur-00Deo1-27
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2023 15:26:11 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688484367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O5qqU0Kxcet4KnwRLYAfKVI4AV4hzg5i/RVgRnzmxGo=;
	b=DTuSkRut6d2zmR+QLC356DceKemf8eFqnjdqrLQjyKbT5Y1e+DeqXx0oTqytEN6A8HYcDJ
	bK6nwL9BwtfIK4bayKvc6tFGZJmHH4j/vM4WY9Nb01SPL9SeZ1fqb9bGY8kBwPmnxic1Ij
	wJCItyIbgdBfHhSMxEti1k8WMY58DpmkUR+o2hZwc0weZx7ZPVoAZ6IEM73xRn9Mh2UMPc
	LEhyLh10p5bojoP9RFZsG5M3GFB2Txq1kLQIp62UowGfjnipDGJ6ZVN6f6pG2iMuHgk15a
	rxphBspFw/6E76rN3KxNWYQPpmv9Ry8N2xbkI8APSjdy5bqd5Ww1O8l2s1cNMw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id E673B1BF206;
	Tue,  4 Jul 2023 15:26:05 +0000 (UTC)
Date: Tue, 4 Jul 2023 17:26:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Linux MTD
 List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, Florian Fainelli
 <florian.fainelli@broadcom.com>, linux-kernel@vger.kernel.org, Vignesh
 Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Kamal
 Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v3 3/5] mtd: rawnand: brcmnand: Fix crash during the
 panic_write
Message-ID: <20230704172604.6924d2af@xps-13>
In-Reply-To: <20230627193738.19596-4-william.zhang@broadcom.com>
References: <20230627193738.19596-1-william.zhang@broadcom.com>
	<20230627193738.19596-4-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_082609_991712_55A62ACC 
X-CRM114-Status: GOOD (  19.38  )
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
SnVuIDIwMjMgMTI6Mzc6MzYgLTA3MDA6Cgo+IER1cmluZyB0aGUgcGFuaWMgd3JpdGUgcGF0aCB0
byBleGVjdXRlIGFub3RoZXIgbmFuZCBjb21tYW5kLCBpZgo+IHRoZXJlIGlzIGEgcGVuZGluZyBj
b21tYW5kLCB3ZSBzaG91bGQgd2FpdCBmb3IgdGhlIGNvbW1hbmQgaW5zdGVhZCBvZgo+IGNhbGxp
bmcgQlVHX09OIHNvIHdlIGRvbid0IGNyYXNoIHdoaWxlIGNyYXNoaW5nLgo+IAo+IEZpeGVzOiAy
N2M1YjE3Y2QxYjEgKCJtdGQ6IG5hbmQ6IGFkZCBOQU5EIGRyaXZlciAibGlicmFyeSIgZm9yIEJy
b2FkY29tIFNUQiBOQU5EIGNvbnRyb2xsZXIiKQoKVGhlIEZpeGVzIHRhZyBsb29rcyB3cm9uZy4K
Cj4gU2lnbmVkLW9mZi1ieTogV2lsbGlhbSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJv
YWRjb20uY29tPgo+IFJldmlld2VkLWJ5OiBLdXJzYWQgT25leSA8a3Vyc2FkLm9uZXlAYnJvYWRj
b20uY29tPgo+IFJldmlld2VkLWJ5OiBLYW1hbCBEYXN1IDxrYW1hbC5kYXN1QGJyb2FkY29tLmNv
bT4KPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHYzOiBOb25lCj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+
IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMTIgKysrKysr
KysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gaW5kZXggMzdj
MmM3Y2ZhMDBlLi5lYTAzMTA0NjkyYmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JyY21uYW5kLmMKPiBAQCAtMTYwOCw3ICsxNjA4LDE3IEBAIHN0YXRpYyB2b2lkIGJyY21u
YW5kX3NlbmRfY21kKHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0LCBpbnQgY21kKQo+ICAKPiAg
CWRldl9kYmcoY3RybC0+ZGV2LCAic2VuZCBuYXRpdmUgY21kICVkIGFkZHIgMHglbGx4XG4iLCBj
bWQsIGNtZF9hZGRyKTsKPiAgCj4gLQlCVUdfT04oY3RybC0+Y21kX3BlbmRpbmcgIT0gMCk7Cj4g
KwkvKgo+ICsJICogSWYgd2UgY2FtZSBoZXJlIHRocm91Z2ggX3BhbmljX3dyaXRlIGFuZCB0aGVy
ZSBpcyBhIHBlbmRpbmcKPiArCSAqIGNvbW1hbmQsIHRyeSB0byB3YWl0IGZvciBpdC4gSWYgaXQg
dGltZXMgb3V0LCByYXRoZXIgdGhhbgo+ICsJICogaGl0dGluZyBCVUdfT04sIGp1c3QgcmV0dXJu
IHNvIHdlIGRvbid0IGNyYXNoIHdoaWxlIGNyYXNoaW5nLgo+ICsJICovCj4gKwlpZiAob29wc19p
bl9wcm9ncmVzcykgewo+ICsJCWlmIChjdHJsLT5jbWRfcGVuZGluZyAmJgo+ICsJCQliY21uYW5k
X2N0cmxfcG9sbF9zdGF0dXMoY3RybCwgTkFORF9DVFJMX1JEWSwgTkFORF9DVFJMX1JEWSwgMCkp
Cj4gKwkJCXJldHVybjsKPiArCX0gZWxzZQo+ICsJCUJVR19PTihjdHJsLT5jbWRfcGVuZGluZyAh
PSAwKTsKPiAgCWN0cmwtPmNtZF9wZW5kaW5nID0gY21kOwo+ICAKPiAgCXJldCA9IGJjbW5hbmRf
Y3RybF9wb2xsX3N0YXR1cyhjdHJsLCBOQU5EX0NUUkxfUkRZLCBOQU5EX0NUUkxfUkRZLCAwKTsK
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
