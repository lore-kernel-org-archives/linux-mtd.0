Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EECEB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsguKUh8yHbRsxGR4AGR+m0CcGibdLb3KzQfJJhoVUE=; b=ZeSEZ9xJA4z7QZ
	/KmrAXFhE/ehsJUk5ANmBFSPHiF2r97BiZXHCInxmegEY67B7HFgIgp06lEgQT8bBGSMxMhlgvRD0
	wGmkVOdWg+28Kmrf7UpvU5wIEAfao+YJIBhRXmF2xP7yBRnUdqfg9jR80bAyATKifmaLSoR/L2tPX
	RVPMzT4dqDhLSttogH9f9TJUrBnG3nVpGL2eFDhpLeou6Q6ixS5X9dbIfi1kxrcO6WCVTjUHg69Q1
	vOexjf4eAiTGFS7iANxaHSUInJS+1SExMbkjCPyfj4mPduP5b5RIwgKigtoHMNbOJGOzjDWHpKXdf
	PcE73kovZPeZ5p9M3xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhsH-00DeQ0-2L;
	Tue, 04 Jul 2023 15:23:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhsF-00DeP2-0Q
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2023 15:23:28 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688484205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=btwb9fDGkDZ7jnV3QokEO1LHIFVROBuBltSAKFFlyfU=;
	b=m/bJrBdiQ4r3dm4fK/+8HHJvPBn/jW8CbISsWJhd6smsSEnAyu39fJ4EvX/BJSWTX773ml
	twRyOvqQBaJbbZyEety5YOKrkg3b4+ZfX1LjVEoBwOHQyHT+6DT+WE7fEdEk4SZfytJN3Y
	Z5k/mkUthbn2bEyUw3McmYKjaTiUTA9lvc5/Rj9PbYblTk5tBDwUbpbUTqf7+jC068UPvQ
	qoy1d6RlDRf1obobZNfiIEgJAmtEj2RYloXeuGtU2yD0EoYWzZFm7FAUbhjLuESlVQwkQA
	zT2bSFYjA8IRwCmXMkQwB1Ds8mL2TngPNtoTFF+Ar4plMPY2H+MoG64a3urs+Q==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BDFC240010;
	Tue,  4 Jul 2023 15:23:24 +0000 (UTC)
Date: Tue, 4 Jul 2023 17:23:23 +0200
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
Message-ID: <20230704172323.2cfe5a89@xps-13>
In-Reply-To: <20230627193738.19596-4-william.zhang@broadcom.com>
References: <20230627193738.19596-1-william.zhang@broadcom.com>
	<20230627193738.19596-4-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_082327_434542_3DACB972 
X-CRM114-Status: GOOD (  19.81  )
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
byBleGVjdXRlIGFub3RoZXIgbmFuZCBjb21tYW5kLCBpZgoKIldoZW4gZXhlY3V0aW5nIGEgTkFO
RCBjb21tYW5kIHdpdGhpbiB0aGUgcGFuaWMgd3JpdGUgcGF0aCwgd2FpdCBmb3IgYW55CnBlbmRp
bmcgY29tbWFuZCBpbnN0ZWFkIG9mIGNhbGxpbmcgQlVHX09OIHRvIGF2b2lkIGNyYXNoaW5nIHdo
aWxlCihhbHJlYWR5KSBjcmFzaGluZy4iCgo+IHRoZXJlIGlzIGEgcGVuZGluZyBjb21tYW5kLCB3
ZSBzaG91bGQgd2FpdCBmb3IgdGhlIGNvbW1hbmQgaW5zdGVhZCBvZgo+IGNhbGxpbmcgQlVHX09O
IHNvIHdlIGRvbid0IGNyYXNoIHdoaWxlIGNyYXNoaW5nLgo+IAo+IEZpeGVzOiAyN2M1YjE3Y2Qx
YjEgKCJtdGQ6IG5hbmQ6IGFkZCBOQU5EIGRyaXZlciAibGlicmFyeSIgZm9yIEJyb2FkY29tIFNU
QiBOQU5EIGNvbnRyb2xsZXIiKQo+IFNpZ25lZC1vZmYtYnk6IFdpbGxpYW0gWmhhbmcgPHdpbGxp
YW0uemhhbmdAYnJvYWRjb20uY29tPgo+IFJldmlld2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxm
bG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbT4KPiBSZXZpZXdlZC1ieTogS3Vyc2FkIE9uZXkg
PGt1cnNhZC5vbmV5QGJyb2FkY29tLmNvbT4KPiBSZXZpZXdlZC1ieTogS2FtYWwgRGFzdSA8a2Ft
YWwuZGFzdUBicm9hZGNvbS5jb20+Cj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+IENo
YW5nZXMgaW4gdjI6IE5vbmUKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYyB8IDEyICsrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYwo+IGluZGV4IDM3YzJjN2NmYTAwZS4uZWEwMzEwNDY5MmJmIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gQEAgLTE2MDgsNyArMTYwOCwxNyBA
QCBzdGF0aWMgdm9pZCBicmNtbmFuZF9zZW5kX2NtZChzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9z
dCwgaW50IGNtZCkKPiAgCj4gIAlkZXZfZGJnKGN0cmwtPmRldiwgInNlbmQgbmF0aXZlIGNtZCAl
ZCBhZGRyIDB4JWxseFxuIiwgY21kLCBjbWRfYWRkcik7Cj4gIAo+IC0JQlVHX09OKGN0cmwtPmNt
ZF9wZW5kaW5nICE9IDApOwo+ICsJLyoKPiArCSAqIElmIHdlIGNhbWUgaGVyZSB0aHJvdWdoIF9w
YW5pY193cml0ZSBhbmQgdGhlcmUgaXMgYSBwZW5kaW5nCj4gKwkgKiBjb21tYW5kLCB0cnkgdG8g
d2FpdCBmb3IgaXQuIElmIGl0IHRpbWVzIG91dCwgcmF0aGVyIHRoYW4KPiArCSAqIGhpdHRpbmcg
QlVHX09OLCBqdXN0IHJldHVybiBzbyB3ZSBkb24ndCBjcmFzaCB3aGlsZSBjcmFzaGluZy4KPiAr
CSAqLwo+ICsJaWYgKG9vcHNfaW5fcHJvZ3Jlc3MpIHsKPiArCQlpZiAoY3RybC0+Y21kX3BlbmRp
bmcgJiYKPiArCQkJYmNtbmFuZF9jdHJsX3BvbGxfc3RhdHVzKGN0cmwsIE5BTkRfQ1RSTF9SRFks
IE5BTkRfQ1RSTF9SRFksIDApKQo+ICsJCQlyZXR1cm47Cj4gKwl9IGVsc2UKPiArCQlCVUdfT04o
Y3RybC0+Y21kX3BlbmRpbmcgIT0gMCk7Cj4gIAljdHJsLT5jbWRfcGVuZGluZyA9IGNtZDsKPiAg
Cj4gIAlyZXQgPSBiY21uYW5kX2N0cmxfcG9sbF9zdGF0dXMoY3RybCwgTkFORF9DVFJMX1JEWSwg
TkFORF9DVFJMX1JEWSwgMCk7CgpMR1RNIG90aGVyd2lzZS4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
