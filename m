Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FE6EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOmGZm92+/7OZRSMgFAl7QdP+BwF1T57wyqMl2Ezjqw=; b=X5DUQWOz9B+hhH
	4+BzNvjM4IqYO/QsXst0AFB0J3G+IhjcDc4E1CJ42MnAohMev8TrYNHeWtnPJb/1WmHVFkdtW4MRB
	tmBFHXO9MIv60T9ioKdkHKUQZz8m1XJ152tKdfqo9f5M+LQ6Hk+fl6BDBCFzidvdtZmgcXE6HV9+B
	esVG6sVdO9+r6863ZD2qKT4VG62zdogKNHunW6Wz57Zzfp1dV9WGfOMisxmfcgUV6n9I4o9fRhNIt
	2eWgh5X5vbDsb7ck96hl/57bskIAFG4z0TRPu36GJobLdyEXzsJeecxCGjfIo4gM5k+oWybjnP7RW
	lsJPDMk6oRq4P6qvCPyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhZC-00DarI-0W;
	Tue, 04 Jul 2023 15:03:46 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhZ7-00Daps-30;
	Tue, 04 Jul 2023 15:03:44 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688483018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8ZiWkw6IBpKG50zIyLyU+jiftpJ82AROu6SkrKwfwg=;
	b=LWX3IDTrOPsRhKGhQr/GX/zJ9BYGijrfq5Bcu9sImmDOBKiP1LgjkqfkBSLUHrL5wKT/9f
	kAkEbbvo7+ilIRp0XLlfvpSsIV89TczcafFhWxmgxXPcqV9iER5sS/9LOORpVPMqTR+/Tw
	oaCnhqbuO4meQoccNvu2XMTFfuYYWsmHyh0yHY8Kq2+s3Cszj6lJ08pYfvMAK31shCura9
	U3Qm7FdvSX7TRFnG1+rFAFpP5iRxXZKk+wROrHe104zENZHGCKB+QGMOV6D2Im/aq4Fgd2
	7vf3RcwU/iCIrtxFPDm5a3Alu4Kz2GZZ6N5Xrr1lIEADshzr7Yl59Q93eDGiKw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B32D1C000A;
	Tue,  4 Jul 2023 15:03:37 +0000 (UTC)
Date: Tue, 4 Jul 2023 17:03:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
Subject: Re: [PATCH v3 1/3] mtd: rawnand: rockchip-nand-controller: fix
 oobfree offset and description
Message-ID: <20230704170336.7e46911f@xps-13>
In-Reply-To: <dfb76ad5-b62a-3f1d-494e-cd17d57945ae@gmail.com>
References: <0047fc52-bc45-a768-8bdd-c0f12cddc17e@gmail.com>
	<dfb76ad5-b62a-3f1d-494e-cd17d57945ae@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_080342_282321_A457F455 
X-CRM114-Status: GOOD (  29.80  )
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

SGkgSm9oYW4sCgpXb3VsZCB5b3UgbWluZCByZWR1Y2luZyB0aGUgc3ViamV0cyB3aXRoCnMvcm9j
a2NoaXAtbmFuZC1jb250cm9sbGVyL3JvY2tjaGlwLz8KCmpieDYyNDRAZ21haWwuY29tIHdyb3Rl
IG9uIFRodSwgMTUgSnVuIDIwMjMgMTk6MzQ6MDEgKzAyMDA6Cgo+IFRoZSBNVEQgZnJhbWV3b3Jr
IHJlc2VydmVzIDEgb3IgMiBieXRlcyBmb3IgdGhlIGJhZCBibG9jayBtYXJrZXIKPiBkZXBlbmRp
bmcgb24gdGhlIGJ1cyBzaXplLiBUaGUgcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyIGRyaXZlcgo+
IGN1cnJlbnRseSBvbmx5IHN1cHBvcnRzIGEgOCBiaXQgYnVzLCBidXQgcmVzZXJ2ZXMgc3RhbmRh
cmQgMiBieXRlcwo+IGZvciB0aGUgQkJNIGluIHRoZSBjaGlwLT5vb2JfcG9pIGJ1ZmZlci4gVGhl
IGZpcnN0IGZyZWUgT09CIGJ5dGUgaXMKPiB0aGVyZWZvcmUgT09CMiBhdCBvZmZzZXQgMi4KCkFn
YWluLCBJIGRvbid0IHRoaW5rIGl0J3MgZXZlciBiZWVuIGEgc2luZ2xlIGJ5dGUuIFBsZWFzZSBk
cm9wIHRoaXMKcGFyYWdyYXBoLCBpdCBkb2VzIG5vdCBqdXN0aWZ5IGFueXRoaW5nIGJlbG93LiBX
aGF0IGlzIGltcG9ydGFudCBoZXJlCmlzIHRoZSBQQSB0aGluZyBJIGd1ZXNzLgoKPiBQYWdlIEFk
ZHJlc3MgKFBBKSBieXRlcyBhcmUgbG9jYXRlZCBhdCB0aGUKCk1heWJlIHlvdSBjYW4gYnJpZWZs
eSBleHBsYWluIHdoYXQgdGhlIFBBIGJ5dGVzIGFyZSBhYm92ZS4KCj4gbGFzdCA0IHBvc2l0aW9u
cyBiZWZvcmUgRUNDLiBUaGUgY3VycmVudCBhZHZlcnRpc2VkIGZyZWUgT09CIGFyZWEgaGFzCj4g
YW4gb2Zmc2V0IHRoYXQgc3RhcnRzIGF0IE9PQjYgYW5kIGEgbGVuZ3RoIHRoYXQgb3ZlcmxhcHMg
d2l0aCB0aGUgc3BhY2UKCkxldCBtZSB0cnkgdG8gcmVwaHJhc2UgdGhpczoKCiIKVGhlIGN1cnJl
bnRseSBhZHZlcnRpc2VkIGZyZWUgT09CIGFyZWEgc3RhcnRzIGF0IG9mZnNldCA2LCBsaWtlCmlm
IDQgUEEgYnl0ZXMgd2VyZSBsb2NhdGVkIHJpZ2h0IGFmdGVyIHRoZSBCQk0uIFRoaXMgaXMgd3Jv
bmcgYXMgdGhlClBBIGJ5dGVzIGFyZSBsb2NhdGVkIHJpZ2h0IGJlZm9yZSB0aGUgRUNDIGJ5dGVz
LgoKRml4IHRoZSBsYXlvdXQgYnkgYWxsb3dpbmcgYWNjZXNzIHRvIGFsbCBieXRlcyBiZXR3ZWVu
IHRoZSBCQk0gYW5kIHRoZQpQQSBieXRlcyBpbnN0ZWFkIG9mIHJlc2VydmluZyA0IGJ5dGVzIHJp
Z2h0IGFmdGVyIHRoZSBCQk0uCgo+IHJlc2VydmVkIGZvciB0aGUgUEEgYnl0ZXMuIFdyaXRpbmcg
dW5yZWxhdGVkIGRhdGEgdG8gYSByZXNlcnZlZCBzcGFjZQo+IHdpdGggYSBzcGVjaWZpYyB0YXNr
IGNhbiBjb3JydXB0IG91ciBib290IGJsb2NrIHBhZ2UgcmVhZCBvcmRlci4KCiJvdXIiPwoKPiBG
aXggYnkgY2hhbmdpbmcgdGhlIGZyZWUgT09CIG9mZnNldCB0byAyLgo+IAo+IFRoaXMgY2hhbmdl
IGJyZWFrcyBleGlzdGluZyBqZmZzMiB1c2Vycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBK
b25rZXIgPGpieDYyNDRAZ21haWwuY29tPgoKUGxlYXNlIGFkZCBhIEZpeGVzIHRhZywgbm93IHRo
YXQgSSBsb29rIGF0IGl0IGFnYWluLCBpdCBsb29rcyBsaWtlCnRoZSBvcmlnaW5hbCBhdXRob3Ig
ZGlkIHRyeSB0byBwcm90ZWN0IHRoZXNlIFBBIGJ5dGVzLCBidXQgZmFpbGVkLgoKPiAtLS0KPiAK
PiBDaGFuZ2VkIFYzOgo+ICAgQ2hhbmdlIHByZWZpeGVzCj4gICBSZXdvcmQKPiAgIFN0YXRlIGJy
ZWFrIGV4aXN0aW5nIHVzZXJzLgo+IAo+IC0tLQo+IAo+IEV4YW1wbGU6Cj4gCj4gV3JvbmcgZnJl
ZSBPT0Igb2Zmc2V0IHN0YXJ0cyBhdCBPT0I2Ogo+IG9vYl9yZWdpb24tPm9mZnNldCA9IE5GQ19T
WVNfREFUQV9TSVpFICsgMjsKPiAgICAgICAgICAgICAgICAgICAgPSA0ICsgMgo+ICAgICAgICAg
ICAgICAgICAgICA9IDYKPiAKPiBvb2JfcmVnaW9uLT5sZW5ndGggPSBya25hbmQtPm1ldGFkYXRh
X3NpemUgLSBORkNfU1lTX0RBVEFfU0laRSAtIDI7Cj4gICAgICAgICAgICAgICAgICAgID0gMzIg
LSA0IC0gMgo+ICAgICAgICAgICAgICAgICAgICA9IDI2Cj4gCj4gVG9nZXRoZXIgd2l0aCB0aGlz
IGxlbmd0aCBhYm92ZSBpdCBvdmVybGFwcyBhIHJlc2VydmVkIHNwYWNlIGZvciB0aGUKPiBib290
IGJsb2NrcyBQYWdlIEFkZHJlc3MoUEEpCj4gCj4gY2hpcC0+b29iX3BvaSBidWZmZXIgbGF5b3V0
IGZvciA4IHN0ZXBzOgo+IAo+IEJCTTAgICBCQk0xICBPT0IyICBPT0IzICB8IE9PQjQgIE9PQjUg
IE9PQjYgIE9PQjcKPiAKPiBPT0I4ICAgT09COSAgT09CMTAgT09CMTEgfCBPT0IxMiBPT0IxMyBP
T0IxNSBPT0IxNQo+IE9PQjE2ICBPT0IxNyBPT0IxOCBPT0IxOSB8IE9PQjIwIE9PQjIxIE9PQjIy
IE9PQjIzCj4gCj4gT09CMjQgIE9PQjI1IE9PQjI2IE9PQjI3IHwgUEEwICAgUEExICAgUEEyICAg
UEEzCj4gCj4gRUNDMCAgIEVDQzEgIEVDQzIgIEVDQzMgIHwgLi4uICAgLi4uICAgLi4uICAgLi4u
Cj4gCj4gRml4IGJ5IG5ldyBvZmZzZXQgYXQgT09CMjoKPiBvb2JfcmVnaW9uLT5vZmZzZXQgPSAy
Owo+IAo+IFRoZSBmdWxsIHJhbmdlIG9mIGZyZWUgT09CIHdpdGggOCBzdGVwcyBydW5zIGZyb20g
T09CMgo+IHRpbGwvaW5jbHVkaW5nIE9PQjI3Lgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYyB8IDExICsrKystLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMKPiBpbmRleCAyMzEyZTI3
MzYuLjM3ZmMwN2JhNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hp
cC1uYW5kLWNvbnRyb2xsZXIuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3JvY2tjaGlw
LW5hbmQtY29udHJvbGxlci5jCj4gQEAgLTU2Miw5ICs1NjIsMTAgQEAgc3RhdGljIGludCBya19u
ZmNfd3JpdGVfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdTggKmJ1ZiwK
PiAgCQkgKiAgICBCQk0gIE9PQjEgT09CMiBPT0IzIHwuLi4uLi58ICBQQTAgIFBBMSAgUEEyICBQ
QTMKPiAgCQkgKgo+ICAJCSAqIFRoZSBya19uZmNfb29ibGF5b3V0X2ZyZWUoKSBmdW5jdGlvbiBh
bHJlYWR5IGhhcyByZXNlcnZlZAo+IC0JCSAqIHRoZXNlIDQgYnl0ZXMgd2l0aDoKPiArCQkgKiB0
aGVzZSA0IGJ5dGVzIHRvZ2V0aGVyIHdpdGggMiBieXRlcyBmb3IgQkJNCj4gKwkJICogYnkgcmVk
dWNpbmcgaXQncyBsZW5ndGg6Cj4gIAkJICoKPiAtCQkgKiBvb2JfcmVnaW9uLT5vZmZzZXQgPSBO
RkNfU1lTX0RBVEFfU0laRSArIDI7Cj4gKwkJICogb29iX3JlZ2lvbi0+bGVuZ3RoID0gcmtuYW5k
LT5tZXRhZGF0YV9zaXplIC0gTkZDX1NZU19EQVRBX1NJWkUgLSAyOwo+ICAJCSAqLwo+ICAJCWlm
ICghaSkKPiAgCQkJbWVtY3B5KHJrX25mY19vb2JfcHRyKGNoaXAsIGkpLAo+IEBAIC05MzMsMTIg
KzkzNCw4IEBAIHN0YXRpYyBpbnQgcmtfbmZjX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5m
byAqbXRkLCBpbnQgc2VjdGlvbiwKPiAgCWlmIChzZWN0aW9uKQo+ICAJCXJldHVybiAtRVJBTkdF
Owo+IAo+IC0JLyoKPiAtCSAqIFRoZSBiZWdpbm5pbmcgb2YgdGhlIE9PQiBhcmVhIHN0b3JlcyB0
aGUgcmVzZXJ2ZWQgZGF0YSBmb3IgdGhlIE5GQywKPiAtCSAqIHRoZSBzaXplIG9mIHRoZSByZXNl
cnZlZCBkYXRhIGlzIE5GQ19TWVNfREFUQV9TSVpFIGJ5dGVzLgo+IC0JICovCj4gIAlvb2JfcmVn
aW9uLT5sZW5ndGggPSBya25hbmQtPm1ldGFkYXRhX3NpemUgLSBORkNfU1lTX0RBVEFfU0laRSAt
IDI7Cj4gLQlvb2JfcmVnaW9uLT5vZmZzZXQgPSBORkNfU1lTX0RBVEFfU0laRSArIDI7Cj4gKwlv
b2JfcmVnaW9uLT5vZmZzZXQgPSAyOwo+IAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAtLQo+IDIuMzAu
Mgo+IAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
