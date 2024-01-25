Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB391C47258
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 09:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LFCh6Kf+93baYTH3Liz2WN0FSW7EsQcsr8TJHNcBz0=; b=dk5j/oscX3OhWf
	/HCHb7YeJHUI89o8SseizhWSay6A5E3xf+HMPpMb5TcXlsxXeCdKzNHd3eWA24E96iqaAXAuqzzX3
	qTx2bxnr/pUwul4TI56lrRSATjajR6e8owkHesuDTOg/fDWTZZqioMs5YlvIkg/LOOU/YZro97SZw
	kG7VW1LHg5N32ywFNy+LrvfpS14OvcUt5nsb1Kfijff57VaWmXp77t7/SdQYInU0IwSOIIQ74yl6O
	g5FAhfj+WDEIX0uSHUbgBICI84HKrZ5h/Vkty27598v8UBZTK2K50dznNsKw0CHGTDo7oYO3OTaVe
	Vsr/fiY4iKg5CZnZAFYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvip-007T2u-2e;
	Thu, 25 Jan 2024 09:08:31 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvil-007T0Q-2e
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 09:08:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 016271C0013;
	Thu, 25 Jan 2024 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706173702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rm60V/hSeVZarANf9QjFrk14Rowm9GTafsOy25Yi66g=;
	b=PQ7/zBMewnz8DScYEO7nHAFvNC8bSqUu9MXflVeWIaqtA0J+YarVb6AesRLzDHoZQDFGHT
	Fs8EgKlM6CU/lC3yJ9kmsWUgrVrIDS20EMMlhOyZ6AKRHNFphku4WA1EJaWBuBI/WNtjux
	jBa5LmDkqkUJlZeNFYAbjDB9Xo2vuC2xfTxWq6mtNYMQQZNTYDWcRpX+OdJoor8ZKU2dBu
	lbsoSJt8xXjr/whnAnS+Z6gZnZSgPZP4ZrjlxscYfW7SgKppdIZGvgIEaXKznojUy/ZpkB
	GdROEjuho1lwd4Hgi3GC0VJKEixsZm/dTBZgMV4kpStLp2Xggu6RBez5Vqo6vw==
Date: Thu, 25 Jan 2024 10:08:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: jaimeliao@mxic.com.tw, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: spinand: macronix: Fix MX35LFxGE4AD page size
Message-ID: <20240125100820.174eb458@xps-13>
In-Reply-To: <20240125024816.222554-1-jaimeliao.tw@gmail.com>
References: <20240125024816.222554-1-jaimeliao.tw@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_010828_028365_2ADA4345 
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

SGkgSmFpbWUsCgorIGxpbnV4LW10ZCB3aGljaCB3YXMgbWlzc2luZyB0byB5b3VyIGNvbnRyaWJ1
dGlvbi4KCmphaW1lbGlhby50d0BnbWFpbC5jb20gd3JvdGUgb24gVGh1LCAyNSBKYW4gMjAyNCAx
MDo0ODoxNiArMDgwMDoKCj4gRnJvbTogSmFpbWVMaWFvIDxqYWltZWxpYW9AbXhpYy5jb20udHc+
Cj4gCj4gU3VwcG9ydCBmb3IgTVgzNUxGezIsNH1HRTRBRCBjaGlwcyB3YXMgYWRkZWQgaW4gbWFp
bmxpbmUgdGhyb3VnaAo+IHVwc3RyZWFtIGNvbW1pdCA1ZWNlNzhkZTg4NzM5YjRjNjgyNjNlOWYy
NTgyMzgwYzFmZDgzMTRmLgo+IAo+IFRoZSBwYXRjaCB3YXMgbGF0ZXIgYWRhcHRlZCB0byA1LjQu
eSBhbmQgYmFja3BvcnRlZCB0aHJvdWdoCj4gc3RhYmxlIGNvbW1pdCA4NTI1OGFlMzA3MDg0OGQ5
ZDBmNmZiZWUzODViZTJkYjgwZThjZjI2Lgo+IAo+IEZpeCB0aGUgYmFja3BvcnQgbWVudGlvbmVk
IHJpZ2h0IGFib3ZlIGFzIGl0IGlzIHdyb25nOiB0aGUgYmlnZ2VyIGNoaXAKPiBmZWF0dXJlcyA0
a2lCIHBhZ2VzIGFuZCBub3QgMmtpQiBwYWdlcy4KPiAKPiBGaXhlczogODUyNThhZTMwNzA4ICgi
bXRkOiBzcGluYW5kOiBtYWNyb25peDogQWRkIHN1cHBvcnQgZm9yIE1YMzVMRnhHRTRBRCIpCj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2NS40LnkKPiBDYzogTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYWltZUxpYW8gPGph
aW1lbGlhb0BteGljLmNvbS50dz4KCkxvb2tzIGxlZ2l0aW1hdGUuCgpBY2tlZC1ieTogTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCj4gLS0tCj4gSGVsbG8sCj4gCj4g
VGhpcyBpcyBteSB0aGlyZCBhdHRlbXB0IHRvIGZpeCBhIHN0YWJsZSBrZXJuZWwuIFRoaXMgcGF0
Y2ggaXMgbm90IGEKPiBiYWNrcG9ydCBmcm9tIExpbnVzJyB0cmVlIHBlci1zZSwgYnV0IGEgZml4
IG9mIGEgYmFja3BvcnQuIFRoZSBvcmlnaW5hbAo+IG1haW5saW5lIGNvbW1pdCBpcyBmaW5lIGJ1
dCB0aGUgYmFja3BvcnRlZCBvbmUgaXMgbm90LCB3ZSBuZWVkIHRvIGZpeAo+IHRoZSBiYWNrcG9y
dGVkIGNvbW1pdCBpbiB0aGUgNS40Lnkgc3RhYmxlIGtlcm5lbCwgYW5kIHRoaXMgaXMgd2hhdCBJ
IGFtCj4gYXR0ZW1wdGluZyB0byBkby4gTGV0IG1lIGtub3cgaWYgZnVydGhlciBleHBsYW5hdGlv
bnMgYXJlIG5lZWRlZC4KPiAKPiBSZWdhcmRzLAo+IEphaW1lCj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvc3BpL21hY3Jvbml4LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9tYWNyb25peC5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYwo+IGluZGV4IGJi
YjFkNjhiY2U0YS4uZjE4YzZjZmU4ZmY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
c3BpL21hY3Jvbml4LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jCj4g
QEAgLTEyNSw3ICsxMjUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyBtYWNy
b25peF9zcGluYW5kX3RhYmxlW10gPSB7Cj4gIAkJICAgICBTUElOQU5EX0hBU19RRV9CSVQsCj4g
IAkJICAgICBTUElOQU5EX0VDQ0lORk8oJm14MzVsZnhnZTRhYl9vb2JsYXlvdXQsIE5VTEwpKSwK
PiAgCVNQSU5BTkRfSU5GTygiTVgzNUxGNEdFNEFEIiwgMHgzNywKPiAtCQkgICAgIE5BTkRfTUVN
T1JHKDEsIDIwNDgsIDEyOCwgNjQsIDIwNDgsIDQwLCAxLCAxLCAxKSwKPiArCQkgICAgIE5BTkRf
TUVNT1JHKDEsIDQwOTYsIDEyOCwgNjQsIDIwNDgsIDQwLCAxLCAxLCAxKSwKPiAgCQkgICAgIE5B
TkRfRUNDUkVRKDgsIDUxMiksCj4gIAkJICAgICBTUElOQU5EX0lORk9fT1BfVkFSSUFOVFMoJnJl
YWRfY2FjaGVfdmFyaWFudHMsCj4gIAkJCQkJICAgICAgJndyaXRlX2NhY2hlX3ZhcmlhbnRzLAoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
