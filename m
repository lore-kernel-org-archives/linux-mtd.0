Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5FDC64ED6
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Feb 2023 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gtJL04iHkZjHIj88cgzw53Lpv9yJprQCurCaTgl3SU=; b=daVYoEYJULtzcB
	TAjvzZHbw/5uaA7okaUTJ/pPew3GH2MoywfkhUBNv4D1JLwTPxhpejV24JnkeCrDQry5DFQV2v8Dj
	nvUdkohgrVau7+82WQ+CnpT6qGZr8BsNKyfcbGzDCbCILs08V3guI+8QhP0lU0edbtrhQNaIabMuX
	49EC9grvoRJzMDcFA4Vhhcwi9vQXf/oXjANvoBkcxW0RhQ7TgXLx+jn/V1LnmMO43CuVfamwLa4B6
	b/hcvHTer672qPvSpmW7g11eg2VaVHtBOaCWmTRmLkneF0x9Dmc1OgUp//XILC/VIuA+h5kzjYlbp
	NPuHNR3qednqSkLp7izQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWabW-009CR5-La; Mon, 27 Feb 2023 10:19:34 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWabI-009CLK-3H; Mon, 27 Feb 2023 10:19:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B22B224001A;
	Mon, 27 Feb 2023 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677493152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyI6AhKtcqX0kbmsp5bQS7/ogwr7y58fU8y2Z142jtw=;
	b=aNVqwRlVeHBdeykUOOqk60lbXvvy3w7ZQvMvcJ6Mq2YeodXVmidT4C9kLfK9d0kS9gCtDq
	PvpUt/h6JWp8HyNb6cIXm6J2zBQax8rJCV80VSDptu+IWAlcT/TML91Cxa91w4hiAJu1P4
	taSF19XQa9YLvEMi4dmibRWKSZ7fZ7nUdzcdCF3QrXEJYM9ArAESVbl2jTgyu8YzBAC3eh
	r/+44vg59I2WJeY9SVPEict4DTmBQUBGIqKQ+HCtkcXUvYl6zf4cvewuHeBPC/NXnya61x
	3FZWWWyqj0AuOPDH2gk2q0Fn8TglU+qU0UEaLZq4FpdBMqAqEaUUH/15GQJa3A==
Date: Mon, 27 Feb 2023 11:19:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@sberdevices.ru>, <oxffffaa@gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: meson: initialize struct with zeroes
Message-ID: <20230227111904.36c0a02d@xps-13>
In-Reply-To: <20230227095906.754178-1-AVKrasnov@sberdevices.ru>
References: <20230227095906.754178-1-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_021920_628606_CA0BD3B3 
X-CRM114-Status: GOOD (  17.25  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBNb24sIDI3IEZl
YiAyMDIzIDEyOjU5OjA2ICswMzAwOgoKPiBUaGlzIHN0cnVjdHVyZSBtdXN0IGJlIHplcm9lZCwg
YmVjYXVzZSBpdCdzIGZpZWxkICdody0+Y29yZScgaXMgdXNlZCBhcwo+ICdwYXJlbnQnIGluICdj
bGtfY29yZV9maWxsX3BhcmVudF9pbmRleCgpJywgYnV0IGl0IHdpbGwgYmUgdW5pbml0aWFsaXpl
ZC4KPiBUaGlzIGhhcHBlbnMsIGJlY2F1c2Ugd2hlbiB0aGlzIHN0cnVjdCBpcyBub3QgemVyb2Vk
LCBwb2ludGVyICdodycgaXMKPiAiaW5pdGlhbGl6ZWQiIGJ5IGdhcmJhZ2UsIHdoaWNoIGlzIHZh
bGlkIHBvaW50ZXIsIGJ1dCBwb2ludHMgdG8gc29tZQo+IGdhcmJhZ2UuIFNvICdodycgd2lsbCBi
ZSBkZXJlZmVyZW5jZWQsIGJ1dCAnY29yZScgY29udGFpbnMgc29tZSByYW5kb20KPiBkYXRhIHdo
aWNoIHdpbGwgYmUgaW50ZXJwcmV0ZWQgYXMgYSBwb2ludGVyLiBUaGUgZm9sbG93aW5nIGJhY2t0
cmFjZSBpcwo+IHJlc3VsdCBvZiBkZXJlZmVyZW5jZSBvZiBzdWNoIHBvaW50ZXI6Cj4gCj4gWyAg
ICAxLjA4MTMxOV0gIF9fY2xrX3JlZ2lzdGVyKzB4NDE0LzB4ODIwCj4gWyAgICAxLjA4NTExM10g
IGRldm1fY2xrX3JlZ2lzdGVyKzB4NjQvMHhkMAo+IFsgICAgMS4wODg5OTVdICBtZXNvbl9uZmNf
cHJvYmUrMHgyNTgvMHg2ZWMKPiBbICAgIDEuMDkyODc1XSAgcGxhdGZvcm1fcHJvYmUrMHg3MC8w
eGYwCj4gWyAgICAxLjA5NjQ5OF0gIHJlYWxseV9wcm9iZSsweGM4LzB4M2UwCj4gWyAgICAxLjEw
MDAzNF0gIF9fZHJpdmVyX3Byb2JlX2RldmljZSsweDg0LzB4MTkwCj4gWyAgICAxLjEwNDM0Nl0g
IGRyaXZlcl9wcm9iZV9kZXZpY2UrMHg0NC8weDEyMAo+IFsgICAgMS4xMDg0ODddICBfX2RyaXZl
cl9hdHRhY2grMHhiNC8weDIyMAo+IFsgICAgMS4xMTIyODJdICBidXNfZm9yX2VhY2hfZGV2KzB4
NzgvMHhkMAo+IFsgICAgMS4xMTYwNzddICBkcml2ZXJfYXR0YWNoKzB4MmMvMHg0MAo+IFsgICAg
MS4xMTk2MTNdICBidXNfYWRkX2RyaXZlcisweDE4NC8weDI0MAo+IFsgICAgMS4xMjM0MDhdICBk
cml2ZXJfcmVnaXN0ZXIrMHg4MC8weDE0MAo+IFsgICAgMS4xMjcyMDNdICBfX3BsYXRmb3JtX2Ry
aXZlcl9yZWdpc3RlcisweDMwLzB4NDAKPiBbICAgIDEuMTMxODYwXSAgbWVzb25fbmZjX2RyaXZl
cl9pbml0KzB4MjQvMHgzMAo+IAo+IEZpeGVzOiAxZTRkM2JhNjY4ODggKCJtdGQ6IHJhd25hbmQ6
IG1lc29uOiBmaXggdGhlIGNsb2NrIikKPiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3Yg
PEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4KPiBBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0aW5n
bCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiAtLS0KClRoZSBjaGFuZ2Vs
b2cgaXMgbWlzc2luZywgSSBuZWVkIHRvIGtub3cgd2hhdCdzIGRpZmZlcmVudC4KCkFsc28gaWYg
eW91IHJlc2VuZCB3aXRoIGEgY2hhbmdlbG9nLCBwbGVhc2UgaW5jbHVkZSBOZWlsJ3MgdGFnLgoK
PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVz
b25fbmFuZC5jCj4gaW5kZXggNWVlMDEyMzFhYzRjLi4zMGUzMjZhZGFiZmMgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gQEAgLTk5MSw3ICs5OTEsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG10ZF9vb2JsYXlvdXRfb3BzIG1lc29uX29vYmxheW91dF9vcHMgPSB7Cj4gIAo+ICBz
dGF0aWMgaW50IG1lc29uX25mY19jbGtfaW5pdChzdHJ1Y3QgbWVzb25fbmZjICpuZmMpCj4gIHsK
PiAtCXN0cnVjdCBjbGtfcGFyZW50X2RhdGEgbmZjX2RpdmlkZXJfcGFyZW50X2RhdGFbMV07Cj4g
KwlzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIG5mY19kaXZpZGVyX3BhcmVudF9kYXRhWzFdID0gezB9
Owo+ICAJc3RydWN0IGNsa19pbml0X2RhdGEgaW5pdCA9IHswfTsKPiAgCWludCByZXQ7Cj4gIAoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
