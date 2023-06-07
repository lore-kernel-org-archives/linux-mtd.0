Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78E9C7EE29
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0LT/Pfrrk0lD5L242rDPfNbAC9Yd9nc9V0QqD+4qtA=; b=tfMHYK3tzZGBqC
	MYCcYiH9HX/tG7bmAF+m4P/jkGSbleSmC7q3+/oXy8D77kRdUiVrGWCH+QcO5UvqLQGhEMwgeQxXi
	1i5O1NTCJMStL5ferGBxu/8OGkQ2LPmDAs0qAXkZszG7KaQ6Vz58YgoDQAVLZ5Lyw2WCJ609j8qQM
	viEcVg2ITEoPrEPFgwBjSeDFBV8WqXPnz1SgyTXLM5T74spfNAcvE7U94NI6wZkY0gXdIiGC4yd1P
	0jau17q9Jv28EmrRvQsCTc219AnTkSuX4g3N3aq1/eQMEpU4iwsACjw2o//6L9vZklnx/5CJiUJjl
	/6QcNq4dHC/+4g8sYUZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6oEF-004si1-03;
	Wed, 07 Jun 2023 08:09:15 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6oEB-004sfj-0y
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 08:09:13 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686125346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uvksj9+UTvDgflRsg73N5TFFbYS+sBxliu8X8GLsizk=;
	b=G59dKWV0vhixhK+7vErxEEZ4NfcDztQRB6cB2HMGjROdt1v88OIGFy+8wrGrQv7FsgbzJf
	2tk+pv6vqg1HIedGRioquJpX3vymzXs16pxp/r667GQXf+G9gxCaK7Kf+UNkwNlYuuMn1O
	A57Jtz0psOH3fWW8tE8v+pIb/zObc3o7A+W3qs/sEPO7oHwBv2uAiKwwL0FwPZ4GnfucgV
	EYmY+k/nNjiWprnS7mBaA4Wrj4WAdQ2pnytjHUyIKfQHGqP6oMulZ0Imp/KXJXqXrQm4LD
	qzfBY7o3uxkC+qFTG11SNmABBplJpAHAdf9w+u85OAVBP8kffmdgvmuO7y1Q7A==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71A6EC0009;
	Wed,  7 Jun 2023 08:09:03 +0000 (UTC)
Date: Wed, 7 Jun 2023 10:09:02 +0200
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
Subject: Re: [PATCH 04/12] mtd: rawnand: brcmnand: Fix potential
 out-of-bounds access in oob write
Message-ID: <20230607100902.4df2bc27@xps-13>
In-Reply-To: <20230606231252.94838-5-william.zhang@broadcom.com>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
	<20230606231252.94838-5-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_010911_609076_93B15912 
X-CRM114-Status: GOOD (  17.62  )
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
SnVuIDIwMjMgMTY6MTI6NDQgLTA3MDA6Cgo+IFdoZW4gdGhlIG9vYiBidWZmZXIgbGVuZ3RoIGlz
IG5vdCBpbiBtdWx0aXBsZSBvZiB3b3JkcywgdGhlIG9vYiB3cml0ZQo+IGZ1bmN0aW9uIGRvZXMg
b3V0LW9mLWJvdW5kcyByZWFkIG9uIHRoZSBvb2Igc291cmNlIGJ1ZmZlciBhdCB0aGUgbGFzdAo+
IGl0ZXJhdGlvbi4gRml4IHRoYXQgYnkgYWx3YXlzIGNoZWNraW5nIGxlbmd0aCBsaW1pdCBvbiB0
aGUgb29iIGJ1ZmZlcgo+IHJlYWQgYW5kIGZpbGwgd2l0aCAweGZmIHdoZW4gcmVhY2hpbmcgdGhl
IGVuZCBvZiB0aGUgYnVmZmVyIHRvIHRoZSBvb2IKPiByZWdpc3RlcnMuCj4gCj4gRml4ZXM6IDI3
YzViMTdjZDFiMSAoIm10ZDogbmFuZDogYWRkIE5BTkQgZHJpdmVyICJsaWJyYXJ5IiBmb3IgQnJv
YWRjb20gU1RCIE5BTkQgY29udHJvbGxlciIpCj4gU2lnbmVkLW9mZi1ieTogV2lsbGlhbSBaaGFu
ZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEZsb3JpYW4gRmFp
bmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPgo+IC0tLQo+IAo+ICBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IGluZGV4IDIwODMyODU3YzRhYS4uZDkyMGU4
OGM3ZjViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4g
QEAgLTE0ODYsMTAgKzE0ODYsMTAgQEAgc3RhdGljIGludCB3cml0ZV9vb2JfdG9fcmVncyhzdHJ1
Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCwgaW50IGksCj4gIAo+ICAJZm9yIChqID0gMDsg
aiA8IHRieXRlczsgaiArPSA0KQo+ICAJCW9vYl9yZWdfd3JpdGUoY3RybCwgaiwKPiAtCQkJCShv
b2JbaiArIDBdIDw8IDI0KSB8Cj4gLQkJCQkob29iW2ogKyAxXSA8PCAxNikgfAo+IC0JCQkJKG9v
YltqICsgMl0gPDwgIDgpIHwKPiAtCQkJCShvb2JbaiArIDNdIDw8ICAwKSk7Cj4gKwkJCQkoKChq
IDwgdGJ5dGVzKSA/IG9vYltqXSA6IDB4ZmYpIDw8IDI0KSB8Cj4gKwkJCQkoKChqICsgMSA8IHRi
eXRlcykgPyBvb2JbaiArIDFdIDogMHhmZikgPDwgMTYpIHwKPiArCQkJCSgoKGogKyAyIDwgdGJ5
dGVzKSA/IG9vYltqICsgMl0gOiAweGZmKSA8PCA4KSB8Cj4gKwkJCQkoKGogKyAzIDwgdGJ5dGVz
KSA/IG9vYltqICsgM10gOiAweGZmKSk7CgpUaGlzIGlzIGEgbG90IG9mIGFkZGl0aW9uYWwgb3Bl
cmF0aW9ucyB3aGljaCBtb3N0IG9mIHRoZSB0aW1lIGFyZSBub3QKcmVsZXZhbnQuIEkgd291bGQg
aW5zdGVhZCBnb3QgZm9yIG9uZSBsZXNzIGl0ZXJhdGlvbiBpbiB0aGUgZm9yIGxvb3AKd2hlbiB0
aGVyZSBpcyB1bmFsaWduZWQgZGF0YSwgYW5kIHRoZW4gZGVkaWNhdGVkIGlmL2Vsc2UgdG8gZmls
bCB0aGUKbWlzc2luZyBieXRlcy4KCj4gIAlyZXR1cm4gdGJ5dGVzOwo+ICB9Cj4gIAoKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
