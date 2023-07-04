Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019CEEB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTIc4yX3dp2GxOKinuECdp04wiH7pnUGfmF7Ro0VFSw=; b=TnuomyaQXpvgpT
	Sy13UXAosrEJqR6iIoUEWOhDDAt3ewASqQ9GUpzly2JENJNUyEoNjQtovKTM66YfhtCxb8o/e4ElV
	KWVxczaEKndmEamN96bpBpUgZqu2D5It+naldLdP+CIKIqX6OtN64aEL9qspyIzNONRMsh0HgamAP
	1G0vIIp+hV7xOSM3OBtSMVyLQim5MbwpIkiWVEPGOEQhEQQrgfSJ7C4wEvMdqCHBPC7qoO1qrGFeG
	kURGrVh9Q5Kv0DNz1HsD4yg/QabTk53UxP9WPSQCqOK5rm2lOdoUbe1wuLCDSaOC24UFc5yvn+wDw
	9+oiYnhDip1ZV8E5VLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhx6-00DfDD-3A;
	Tue, 04 Jul 2023 15:28:29 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhx3-00DfBY-2s
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2023 15:28:27 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688484499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKvjqirkVFA+BNwb+44FbYBe7KMP6crTFIpQu43cGgY=;
	b=iqpIQ5dk7iebCcPsVughgIw60V8zQuNfjxJgtFr+44ariRfiXUvU3jwBrrLPh6hPLKK1FZ
	Y4KTfBaa82r2XG0FvFclSrix8rbJBLFZ0EfgqB1WmWrtGepOPOJoN3+89DiiIONOoM4ER8
	ca0mvSsrtVyQwj7C3oLEniPoocrAfwHgv9i3WxMGYvLTzCOgFlmb3W3UJN/lTP/Yvpfav2
	elCYPKab0cTTllKtKQbVBs0L00qRZ45xIrGhy8oGXbmpg5xA8fUoY+8uwhH5XNT7SXBI7u
	hPFwxCC8crVM2pnScZuRzKYCbrktb92AEQAlE38R4sHOCryq7EwMhy+gjURuRw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE7D92000D;
	Tue,  4 Jul 2023 15:28:17 +0000 (UTC)
Date: Tue, 4 Jul 2023 17:28:17 +0200
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
Subject: Re: [PATCH v3 4/5] mtd: rawnand: brcmnand: Fix potential
 out-of-bounds access in oob write
Message-ID: <20230704172817.02e4cdb8@xps-13>
In-Reply-To: <20230627193738.19596-5-william.zhang@broadcom.com>
References: <20230627193738.19596-1-william.zhang@broadcom.com>
	<20230627193738.19596-5-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_082826_241734_704B7DB4 
X-CRM114-Status: GOOD (  21.52  )
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
SnVuIDIwMjMgMTI6Mzc6MzcgLTA3MDA6Cgo+IFdoZW4gdGhlIG9vYiBidWZmZXIgbGVuZ3RoIGlz
IG5vdCBpbiBtdWx0aXBsZSBvZiB3b3JkcywgdGhlIG9vYiB3cml0ZQo+IGZ1bmN0aW9uIGRvZXMg
b3V0LW9mLWJvdW5kcyByZWFkIG9uIHRoZSBvb2Igc291cmNlIGJ1ZmZlciBhdCB0aGUgbGFzdAo+
IGl0ZXJhdGlvbi4gRml4IHRoYXQgYnkgYWx3YXlzIGNoZWNraW5nIGxlbmd0aCBsaW1pdCBvbiB0
aGUgb29iIGJ1ZmZlcgo+IHJlYWQgYW5kIGZpbGwgd2l0aCAweGZmIHdoZW4gcmVhY2hpbmcgdGhl
IGVuZCBvZiB0aGUgYnVmZmVyIHRvIHRoZSBvb2IKPiByZWdpc3RlcnMuCj4gCj4gRml4ZXM6IDI3
YzViMTdjZDFiMSAoIm10ZDogbmFuZDogYWRkIE5BTkQgZHJpdmVyICJsaWJyYXJ5IiBmb3IgQnJv
YWRjb20gU1RCIE5BTkQgY29udHJvbGxlciIpCgpXcm9uZyBGaXhlcy4KCk1pc3NpbmcgQ2Mgc3Rh
YmxlLgoKPiBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFtIFpoYW5nIDx3aWxsaWFtLnpoYW5nQGJyb2Fk
Y29tLmNvbT4KPiBSZXZpZXdlZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zmxvcmlhbi5mYWluZWxs
aUBicm9hZGNvbS5jb20+Cj4gCj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIEZpeCBrZXJu
ZWwgdGVzdCByb2JvdCBzcGFyc2Ugd2FybmluZzoKPiAgICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9i
cmNtbmFuZC9icmNtbmFuZC5jOjE1MDA6NTQ6IHNwYXJzZTogZXhwZWN0ZWQgdW5zaWduZWQgaW50
IFt1c2VydHlwZV0gZGF0YQo+ICAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmM6MTUwMDo1NDogc3BhcnNlOiBnb3QgcmVzdHJpY3RlZCBfX2JlMzIgW3VzZXJ0eXBlXQo+
IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBIYW5kbGUgdGhlIHJlbWFpbmluZyB1bmFsaWduZWQgb29i
IGRhdGEgYWZ0ZXIgdGhlIG9vYiBkYXRhIHdyaXRlIGxvb3AKPiAKPiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDEzICsrKysrKysrKysrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gaW5kZXggZWEwMzEwNDY5MmJmLi40MDdiZjc5
Y2JhZjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5h
bmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBA
QCAtMTQ3NywxOSArMTQ3NywyOCBAQCBzdGF0aWMgaW50IHdyaXRlX29vYl90b19yZWdzKHN0cnVj
dCBicmNtbmFuZF9jb250cm9sbGVyICpjdHJsLCBpbnQgaSwKPiAgCQkJICAgICBjb25zdCB1OCAq
b29iLCBpbnQgc2FzLCBpbnQgc2VjdG9yXzFrKQo+ICB7Cj4gIAlpbnQgdGJ5dGVzID0gc2FzIDw8
IHNlY3Rvcl8xazsKPiAtCWludCBqOwo+ICsJaW50IGosIGsgPSAwOwo+ICsJdTMyIGxhc3QgPSAw
eGZmZmZmZmZmOwo+ICsJdTggKnBsYXN0ID0gKHU4ICopJmxhc3Q7Cj4gIAo+ICAJLyogQWRqdXN0
IE9PQiB2YWx1ZXMgZm9yIDFLIHNlY3RvciBzaXplICovCj4gIAlpZiAoc2VjdG9yXzFrICYmIChp
ICYgMHgwMSkpCj4gIAkJdGJ5dGVzID0gbWF4KDAsIHRieXRlcyAtIChpbnQpY3RybC0+bWF4X29v
Yik7Cj4gIAl0Ynl0ZXMgPSBtaW5fdChpbnQsIHRieXRlcywgY3RybC0+bWF4X29vYik7Cj4gIAo+
IC0JZm9yIChqID0gMDsgaiA8IHRieXRlczsgaiArPSA0KQo+ICsJZm9yIChqID0gMDsgKGogKyAz
KSA8IHRieXRlczsgaiArPSA0KQoKTWF5YmUgYSBjb21tZW50IGhlcmUgYXMgd2VsbCB0byBtZW50
aW9uIHRoYXQgeW91IHN0b3AgYXQgdGhlIGxhc3QKaXRlcmF0aW9uPyBPdGhlcndpc2UsIGp1c3Qg
cmVhZGluZyB0aGUgbGluZSBkb2VzIG5vdCBtYWtlIHlvdSBjaG9pY2UKb2J2aW91cy4KCj4gIAkJ
b29iX3JlZ193cml0ZShjdHJsLCBqLAo+ICAJCQkJKG9vYltqICsgMF0gPDwgMjQpIHwKPiAgCQkJ
CShvb2JbaiArIDFdIDw8IDE2KSB8Cj4gIAkJCQkob29iW2ogKyAyXSA8PCAgOCkgfAo+ICAJCQkJ
KG9vYltqICsgM10gPDwgIDApKTsKPiArCj4gKwl3aGlsZSAoaiA8IHRieXRlcykKPiArCQlwbGFz
dFtrKytdID0gb29iW2orK107Cj4gKwo+ICsJaWYgKHRieXRlcyAmIDB4MykKPiArCQlvb2JfcmVn
X3dyaXRlKGN0cmwsICh0Ynl0ZXMgJiB+MHgzKSwgKF9fZm9yY2UgdTMyKWNwdV90b19iZTMyKGxh
c3QpKTsKPiArCj4gIAlyZXR1cm4gdGJ5dGVzOwo+ICB9Cj4gIAoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
