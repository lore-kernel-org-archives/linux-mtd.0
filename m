Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBAFEB64DD
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUmwk4V/f9BNyT/PibeMw2VGd5ynhxhfOG9HFwzhGHI=; b=buWA5NWyGsvRsi
	D17lZrWeJvD8lFEwYSbEroCWd38xteLSzIHrlFLp5pnHC0/R1uK2ke0foNQkCO616hByTWfvWCxX4
	fvP54K8cJmI/8DmU2+KqhrCVo/zspupApkL1VvT8stgMpurj87iJSEkgHx+1fbIsT/BYqgJkGHKcc
	WB3TY8jk6ZlNzDBdbjmXnCqNjWa6p0OPkuA6IcfZFmVW1cyHA+SRQ+H0vpWqudbCSlxetJkx6PLG9
	TaPZWIheN1MUwBr+HhMzPmxTw3EHoXqXxMExH63/yvc013X7Zxjs3r+H13wj+4fj0qVyGS/JiyMRc
	n3bqbRDj+/ZDPz0h8adA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwdw-00F0KB-1k;
	Wed, 05 Jul 2023 07:09:40 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwdt-00F0IT-2D
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 07:09:39 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688540973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=arY/aOqhycKUtUZKFsYeswU3gpzt6jGjmjUY7iJ7cWw=;
	b=NXaZQXW9D8gXPIcIeDy4cxkZz2tXlxYlab3MLyguLJqt4GjErwsnZuh6xPOVco95/DgfbT
	lKNQX+7RgCuoPUJjpU0xDJBGqtSnv64W6gn+UasRrgUx1f/jRU7F06Rh2+bRkNfM270qjj
	IvavsO4jmpvpqPG9DgjHxkb3RBY6U/vZD451ETnzFVPi25gz3Mj7SyBIXkbQBs8IPfeJ/7
	gB6nceBUwaXzItP03TXdDSOUryumTb4ed+URP6RfDJY2zJPdAMKQYkSKybcNj6lvAzJ2ZZ
	8QYYsdJbrGIpvMsPTeY58w0UrVmyzzFgeF7cq/Dxj/c1nxhuRbXvWP9kW6hbtg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 894C9E0008;
	Wed,  5 Jul 2023 07:09:31 +0000 (UTC)
Date: Wed, 5 Jul 2023 09:09:30 +0200
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
Message-ID: <20230705090930.45d8f1f3@xps-13>
In-Reply-To: <287ecf48-9a8b-6cca-2888-37f6c71c4b39@broadcom.com>
References: <20230627193738.19596-1-william.zhang@broadcom.com>
	<20230627193738.19596-4-william.zhang@broadcom.com>
	<20230704172604.6924d2af@xps-13>
	<287ecf48-9a8b-6cca-2888-37f6c71c4b39@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_000937_983564_F21B3123 
X-CRM114-Status: GOOD (  24.55  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIFR1ZSwgNCBK
dWwgMjAyMyAxNzo0MDowMyAtMDcwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIDA3LzA0LzIwMjMg
MDg6MjYgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBXaWxsaWFtLAo+ID4gCj4gPiB3
aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbSB3cm90ZSBvbiBUdWUsIDI3IEp1biAyMDIzIDEyOjM3
OjM2IC0wNzAwOgo+ID4gICAKPiA+PiBEdXJpbmcgdGhlIHBhbmljIHdyaXRlIHBhdGggdG8gZXhl
Y3V0ZSBhbm90aGVyIG5hbmQgY29tbWFuZCwgaWYKPiA+PiB0aGVyZSBpcyBhIHBlbmRpbmcgY29t
bWFuZCwgd2Ugc2hvdWxkIHdhaXQgZm9yIHRoZSBjb21tYW5kIGluc3RlYWQgb2YKPiA+PiBjYWxs
aW5nIEJVR19PTiBzbyB3ZSBkb24ndCBjcmFzaCB3aGlsZSBjcmFzaGluZy4KPiA+Pgo+ID4+IEZp
eGVzOiAyN2M1YjE3Y2QxYjEgKCJtdGQ6IG5hbmQ6IGFkZCBOQU5EIGRyaXZlciAibGlicmFyeSIg
Zm9yIEJyb2FkY29tIFNUQiBOQU5EIGNvbnRyb2xsZXIiKSAgCj4gPiAKPiA+IFRoZSBGaXhlcyB0
YWcgbG9va3Mgd3JvbmcuCj4gPiAgIAo+IFRoZSBicmNtbmFuZF9zZW5kX2NtZCBmdW5jdGlvbiBh
bmQgQlVHX09OIGxpbmUgd2VyZSBhZGRlZCBieSB0aGlzIGNvbW1pdCBhbmQgdGhlIGZ1bmN0aW9u
IGRpZG4ndCBjaGFuZ2VkIG11Y2ggc2luY2UgdGhlbi4gTm90IHN1cmUgd2h5IHlvdSB0aGluayBp
dCBpcyB3cm9uZz8KCk9rLCB0aGUgdGl0bGUgb2YgdGhhdCBjb21taXQgbGV0IG1lIHRoaW5rIGl0
IHdhcyBtb3ZpbmcgY29kZSByYXRoZXIKdGhhbiBhZGRpbmcgaXQuIEFscmlnaHQuCgo+ID4+IFNp
Z25lZC1vZmYtYnk6IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tPgo+
ID4+IFJldmlld2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmbG9yaWFuLmZhaW5lbGxpQGJyb2Fk
Y29tLmNvbT4KPiA+PiBSZXZpZXdlZC1ieTogS3Vyc2FkIE9uZXkgPGt1cnNhZC5vbmV5QGJyb2Fk
Y29tLmNvbT4KPiA+PiBSZXZpZXdlZC1ieTogS2FtYWwgRGFzdSA8a2FtYWwuZGFzdUBicm9hZGNv
bS5jb20+Cj4gPj4gLS0tCj4gPj4KPiA+PiBDaGFuZ2VzIGluIHYzOiBOb25lCj4gPj4gQ2hhbmdl
cyBpbiB2MjogTm9uZQo+ID4+Cj4gPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9i
cmNtbmFuZC5jIHwgMTIgKysrKysrKysrKystCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9i
cmNtbmFuZC9icmNtbmFuZC5jCj4gPj4gaW5kZXggMzdjMmM3Y2ZhMDBlLi5lYTAzMTA0NjkyYmYg
MTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
Ywo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+
PiBAQCAtMTYwOCw3ICsxNjA4LDE3IEBAIHN0YXRpYyB2b2lkIGJyY21uYW5kX3NlbmRfY21kKHN0
cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0LCBpbnQgY21kKSAgCj4gPj4gICA+PiAgIAlkZXZfZGJn
KGN0cmwtPmRldiwgInNlbmQgbmF0aXZlIGNtZCAlZCBhZGRyIDB4JWxseFxuIiwgY21kLCBjbWRf
YWRkcik7Cj4gPj4gICA+PiAtCUJVR19PTihjdHJsLT5jbWRfcGVuZGluZyAhPSAwKTsgIAo+ID4+
ICsJLyoKPiA+PiArCSAqIElmIHdlIGNhbWUgaGVyZSB0aHJvdWdoIF9wYW5pY193cml0ZSBhbmQg
dGhlcmUgaXMgYSBwZW5kaW5nCj4gPj4gKwkgKiBjb21tYW5kLCB0cnkgdG8gd2FpdCBmb3IgaXQu
IElmIGl0IHRpbWVzIG91dCwgcmF0aGVyIHRoYW4KPiA+PiArCSAqIGhpdHRpbmcgQlVHX09OLCBq
dXN0IHJldHVybiBzbyB3ZSBkb24ndCBjcmFzaCB3aGlsZSBjcmFzaGluZy4KPiA+PiArCSAqLwo+
ID4+ICsJaWYgKG9vcHNfaW5fcHJvZ3Jlc3MpIHsKPiA+PiArCQlpZiAoY3RybC0+Y21kX3BlbmRp
bmcgJiYKPiA+PiArCQkJYmNtbmFuZF9jdHJsX3BvbGxfc3RhdHVzKGN0cmwsIE5BTkRfQ1RSTF9S
RFksIE5BTkRfQ1RSTF9SRFksIDApKQo+ID4+ICsJCQlyZXR1cm47Cj4gPj4gKwl9IGVsc2UKPiA+
PiArCQlCVUdfT04oY3RybC0+Y21kX3BlbmRpbmcgIT0gMCk7Cj4gPj4gICAJY3RybC0+Y21kX3Bl
bmRpbmcgPSBjbWQ7ICAKPiA+PiAgID4+ICAgCXJldCA9IGJjbW5hbmRfY3RybF9wb2xsX3N0YXR1
cyhjdHJsLCBOQU5EX0NUUkxfUkRZLCBOQU5EX0NUUkxfUkRZLCAwKTsgIAo+ID4gCj4gPiAKPiA+
IFRoYW5rcywKPiA+IE1pcXXDqGwKPiA+ICAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
