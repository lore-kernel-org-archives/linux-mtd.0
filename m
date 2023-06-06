Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B09CC7EE2A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Lp4gO0Zv7nEevgby68bKfSAQZqSXDeG31Yrv1UUHHI=; b=pgz7O9/RTBLA5d
	M3FJ4n36/mpe2EQHLFb+R96pc9hfwcd+vp08IAgEL/gJ/xPyT25reMz9qqLSvqV8IeBK4T6pd7Fey
	HWEE8cVSP7Fbc1Hu2kPcvR7PUwhCW9x96ImbNG8rhDHVeftTtJujVz5FvuAjmiN/2ZTr1KZ75y1Fm
	t9pDu56oc6jRyZ9N/RAZQJVWWBvKzJF8WCbXIUu+WeALufkQ7nAvB58uvNIX7CDwPv4HALhoneiOP
	U+IDSOWGOwB0fjx0oF9GQBjQEufAyi0q4xg3RsRnBuUyucRgNCgQmberm+fX937Nf7n+Ey7K0BUXU
	GSK3KAOXAh1yBDf+Ra7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RXt-000hTl-28;
	Tue, 06 Jun 2023 07:56:01 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RXp-000hQy-1t;
	Tue, 06 Jun 2023 07:55:59 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686038152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUxPIpvbFeVKFbvXsT93sPgr2hxk0tuN/r+2D9z+hgY=;
	b=AZi1yqEmOO7yWD2SfDQF1XWxP6bA5kqUoPmcUIUcaDYS5cRVLDzw6bhralT+2uJ80VxdsW
	ACkxqmFJACimzyvoR5syFfe3vTex/B0sCKDAvmDS/luHOZA2gJrDHwTQqPNGezAF+CK24q
	3OSlmaYhAEGW0tV5L/v+t7qhuIusIwmju08CdVB5NbFZGQ/nP+U7W+FkXE7Y0G0o2tfZUV
	TvyXWwxUOVEz0uPXLE84HO6dorN5sMbIR5SI5kHXsHCTFcdSs80sKB5oeRTArmf8TbReDg
	fQrlEXY1PJwX7EWuT0LMR0EbSfYVPNEAtCxbGxNEZCnMeatm6fHTdfgreDzJig==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99A97C0009;
	Tue,  6 Jun 2023 07:55:49 +0000 (UTC)
Date: Tue, 6 Jun 2023 09:55:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v5 2/6] mtd: rawnand: meson: wait for command in
 polling mode
Message-ID: <20230606095548.6257b271@xps-13>
In-Reply-To: <19eeb588-f909-8aad-b68c-bcfea8f2e926@sberdevices.ru>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
	<20230601061850.3907800-3-AVKrasnov@sberdevices.ru>
	<20230601100751.41c3ff0b@xps-13>
	<9e106d50-2524-c999-48b1-a20760238aaf@sberdevices.ru>
	<20230605110546.6cb00a8d@xps-13>
	<2a755783-1d56-9842-2eee-b5ab41152c81@amlogic.com>
	<163e0684-caff-77d0-1eaf-9a58290c200d@amlogic.com>
	<c316961d-6021-1cb4-9ff4-22fe9ca5a18a@sberdevices.ru>
	<20230606090344.3aca96c8@xps-13>
	<19eeb588-f909-8aad-b68c-bcfea8f2e926@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_005557_896129_E42DC3CF 
X-CRM114-Status: GOOD (  41.41  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDYgSnVu
IDIwMjMgMTA6NDA6MjEgKzAzMDA6Cgo+IE9uIDA2LjA2LjIwMjMgMTA6MDMsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4gPiBhdmtyYXNub3ZAc2JlcmRldmljZXMu
cnUgd3JvdGUgb24gTW9uLCA1IEp1biAyMDIzIDE5OjU4OjAyICswMzAwOgo+ID4gICAKPiA+PiBP
biAwNS4wNi4yMDIzIDE2OjMwLCBMaWFuZyBZYW5nIHdyb3RlOiAgCj4gPj4+Cj4gPj4+Cj4gPj4+
IE9uIDIwMjMvNi81IDIxOjE5LCBMaWFuZyBZYW5nIHdyb3RlOiAgICAKPiA+Pj4+IEhpIE1pcXVl
bCBhbmQgQXJzZW5peSwKPiA+Pj4+Cj4gPj4+Pgo+ID4+Pj4gT24gMjAyMy82LzUgMTc6MDUsIE1p
cXVlbCBSYXluYWwgd3JvdGU6ICAgIAo+ID4+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+ID4+Pj4+
Cj4gPj4+Pj4gSGkgQXJzZW5peSwKPiA+Pj4+PiAgICAKPiA+Pj4+Pj4+PiBAQCAtMTQxMiw2ICsx
NDE5LDggQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiA+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4g
Pj4+Pj4+Pj4gwqDCoMKgIH0KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+ICvCoCBuZmMtPnVzZV9wb2xs
aW5nID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwgInBvbGxpbmciKTsgICAg
Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gVGhpcyBpcyBhIHByb2JsZW0uIFlvdSBjYW5ub3QgYWRkIGEg
cG9sbGluZyBwcm9wZXJ0eSBsaWtlIHRoYXQuCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gVGhlcmUgaXMg
YWxyZWFkeSBhIG5hbmQtcmIgcHJvcGVydHkgd2hpY2ggaXMgc3VwcG9zZWQgdG8gY2FycnkgaG93
IGFyZQo+ID4+Pj4+Pj4gd2lyZWQgdGhlIFJCIGxpbmVzLiBJIGRvbid0IHNlZSBhbnkgaW4tdHJl
ZSB1c2VycyBvZiB0aGUgY29tcGF0aWJsZXMsIEkKPiA+Pj4+Pj4+IGRvbid0IGtub3cgaG93IGFj
Y2VwdGFibGUgaXQgaXMgdG8gY29uc2lkZXIgdXNpbmcgc29mdCBmYWxsYmFjayB3aGVuCj4gPj4+
Pj4+PiB0aGlzIHByb3BlcnR5IGlzIG1pc3NpbmcsIG90aGVyd2lzZSB0YWtlIHRoZSB2YWx1ZXMg
b2YgdGhlIHJiIGxpbmVzCj4gPj4+Pj4+PiBwcm92aWRlZCBpbiB0aGUgRFQgYW5kIHVzZXIgaGFy
ZHdhcmUgY29udHJvbCwgYnV0IEkgd291bGQgZGVmaW5pdGVseQo+ID4+Pj4+Pj4gcHJlZmVyIHRo
YXQuICAgIAo+ID4+Pj4+Pgo+ID4+Pj4+PiBJIHNlZS4gU28gaSBuZWVkIHRvIGltcGxlbWVudCBw
cm9jZXNzaW5nIG9mIHRoaXMgcHJvcGVydHkgaGVyZT8gQW5kIGlmIGl0Cj4gPj4+Pj4+IGlzIG1p
c3NlZCAtPiB1c2Ugc29mdHdhcmUgd2FpdGluZy4gSSB0aGluayBpbnRlcmVzdGluZyB0aGluZyB3
aWxsIGJlIHRoYXQ6Cj4gPj4+Pj4+Cj4gPj4+Pj4+IDEpIEV2ZW4gd2l0aCBzdXBwb3J0IG9mIHRo
aXMgcHJvcGVydHkgaGVyZSwgSSByZWFsbHkgZG9uJ3Qga25vdyBob3cgdG8gcGFzcwo+ID4+Pj4+
PiDCoMKgwqAgUkIgdmFsdWVzIHRvIHRoaXMgY29udHJvbGxlciAtIEkganVzdCBoYXZlIGRlZmlu
ZSBmb3IgUkIgY29tbWFuZCBhbmQgdGhhdCdzCj4gPj4+Pj4+IMKgwqDCoCBpdC4gSSBmb3VuZCB0
aGF0IHRoaXMgcHJvcGVydHkgaXMgYW4gYXJyYXkgb2YgdTMyIC0gSUlVQyBlYWNoIGVsZW1lbnQg
aXMKPiA+Pj4+Pj4gwqDCoMKgIFJCIHBpbiBwZXIgY2hpcC4gTWF5IGJlIGkgbmVlZCB0byBkaXZl
IGludG8gdGhlIG9sZCB2ZW5kb3IncyBkcml2ZXIgdG8gZmluZAo+ID4+Pj4+PiDCoMKgwqAgaG93
IHRvIHVzZSBSQiB2YWx1ZXMgKGFsdGhvdWdoIHRoaXMgZHJpdmVyIHVzZXMgc29mdHdhcmUgd2Fp
dGluZyBzbyBJJ20gbm90Cj4gPj4+Pj4+IMKgwqDCoCBzdXJlIHRoYXQgSSdsbCBmaW5kIHNvbWV0
aGluZyBpbiBpdCkuICAgIAo+ID4+Pj4+Cj4gPj4+Pj4gTGlhbmcsIGNhbiB5b3UgcGxlYXNlIGdp
dmUgdXNlIHRoZSByZWxldmFudCBpbmZvcm1hdGlvbiBoZXJlPyBIb3cgZG8gd2UKPiA+Pj4+PiB0
YXJnZXQgUkIwIGFuZCBSQjE/IEl0IHNlZW1zIGxpa2UgeW91IHVzZSB0aGUgQ1MgYXMgb25seSBp
bmZvcm1hdGlvbgo+ID4+Pj4+IGxpa2UgaWYgdGhlIFJCIGxpbmVzIHdoZXJlIGhhcmR3aXJlZCBp
bnRlcm5hbGx5IHRvIGEgQ1MuIENhbiB3ZSBpbnZlcnQKPiA+Pj4+PiB0aGUgbGluZXMgd2l0aCBh
IHNwZWNpZmljIGNvbmZpZ3VyYXRpb24/ICAgIAo+ID4+Pj4KPiA+Pj4+IENvbnRyb2xsb3IgaGFz
IG9ubHkgb25lIGV4dGVybmFsIFJCIHBpbm11eCAoTkFORF9SQjApLiBhbGwgdGhlIFJCIHBpbnMK
PiA+Pj4+IG9mIGRpZmZlcmVudCBDRXMgbmVlZCB0byBiZSBib3VuZCBpbnRvIG9uZSB3aXJlIGFu
ZCBjb25uZWN0IHdpdGgKPiA+Pj4+IE5BTkRfUkIwIGlmIHdhbnQgdG8gdXNlIGNvbnRyb2xsZXIg
cG9sbGluZyByYi4gdGhlIGN1cnJlbnQgb3BlcmF0aW5nCj4gPj4+PiBDRSBvZiBOQU5EIGlzIGRl
Y2lkZWQgdG8gImNoaXBfc2VsZWN0Iiwgb2YgY291cnNlIGNvbnRyb2xsZXIgaW50ZXJuYWxseSBo
YXMgZGlmZmVyZW50IG5mYyBjb21tYW5kcyB0byByZWdjb25pemUgd2hpY2ggQ2UncyBSQiBzaWdu
YWwgaXMgcG9sbGluZy4KPiA+Pj4+Cj4gPj4+PiA8Jm5hbmRfcGlucz4gaW4gZHRzL3lhbWwgc2hv
dWxkIGluY2x1ZGUgdGhlIE5BTkRfUkIwIGlmIGhhcmR3YXJlIGNvbm5lY3RzLCBvciB1c2Ugc29m
dHdhcmUgcG9sbGluZyBoZXJlLgo+ID4+Pj4KPiA+Pj4+IEBBcnNlbml5LCBzb3JyeSwgaSBkb24n
dCB0cmF2ZWwgYWxsIHRoZSBpbmZvcm1hdGlvbnMgeWV0LiBidXQgd2h5IGRvbid0IHlvdSB1c2Ug
dGhlIG5ldyBSQl9JTlQgY29tbWFuZCB3aXRoIGlycSB0aGF0IGkgcHJvdmlkZWQgaW4gYW5vdGhl
ciB0aHJlYWQuIHRoZSBuZXcgUkJfSU5UIGNvbW1hbmQgZG9lc24ndCBkZXBlbmQgb24gdGhlIHBo
eXNpY2FsIFJCIHdpcmVzLCBpdCBhbHNvIHNlbmQgdGhlIFJFQUQgc3RhdHVzIGNvbW1hbmQoMHg3
MCkgYW5kIHdhaXQgZm9yIHRoZSBpcnEgd2FrZSB1cCBjb21wbGV0aW9uLiAgICAKPiA+Pgo+ID4+
IFRlY2huaWNhbGx5IG5vIHByb2JsZW0hIEkgY2FuIHVzZSBuZXcgUkJfSU5UIGluc3RlYWQgb2Yg
J25hbmRfc29mdF93YWl0cmR5KCknIGFzIHNvZnR3YXJlIGZhbGxiYWNrLCBhbmQgY3VycmVudGx5
Cj4gPj4gaW1wbGVtZW50ZWQgUkJfSU5UIGFzIGludGVycnVwdCBkcml2ZW4gd2F5LiBXaGF0IGRv
IFlvdSB0aGluayBNaXF1ZWwgPwo+ID4+ICAKPiA+Pj4KPiA+Pj4gVXNlICJuYW5kLXJiIiBpbiBk
dHMgdG8gZGVjaWRlIG9sZCBSQl9JTlQocGh5c2ljYWwgUkIgd2lyZXMgaXMgbmVlZGVkKSBvciBu
ZXcgUkJfSU5UKG5vIHBoeXNpY2FsIFJCIHdpcmVzKS4gdGhlIG5ldyBSQl9JTlQgY29tbWFuZCBk
ZWNpZGVzIHRoZSBSQjAgb3IgUkIxIGJ5IHRoZSBwcmV2aW91cyBjb21tYW5kIHdpdGggY2UgYXJn
cy4KPiA+Pj4gICAgIAo+ID4+Cj4gPj4gU28gSSBjYW4gaW1wbGVtZW50ICJuYW5kLXJiIiBpbiBk
dHMgYXMgYm9vbGVhbiB2YWx1ZSAtICJmYWxzZSIgb3IgbWlzc2luZyBtZWFucyB1c2UgIm5vIHBo
eXNpY2FsIFJCIHdpcmVzIiwgInRydWUiIC0gbWVhbnMgdXNlICJwaHlzaWNhbCBSQiB3aXJlcyIg
PyAgCj4gPiAKPiA+IEFzIGxvbmcgYXMgaXQgd29ya3MgYW5kIGRvZXMgbm90IGNvbnRhaW4gYW55
IGV4dHJlbWVseSBzdHJhbmdlIFJFQUQwIG9yCj4gPiBSRUFEX1NUQVRVUyBpbiB0aGUgbWlkZGxl
IG9mIG5vdGhpbmcsIEknbSBmaW5lLCB0YWtlIHRoZSBzaW1wbGVzdAo+ID4gYXBwcm9hY2ggd2hp
Y2ggd2lsbCB3b3JrIGZvciBhbGwuICAKPiAKPiAiZXh0cmVtZXRlbHkgc3RyYW5nZSBSRUFEMCIg
aXMgbWV0aG9kIHdoaWNoIHVzZXMgU1RBVFVTLCBpbnRlcnJ1cHQsIFJFQUQwPyBUaGlzIG1ldGhv
ZCB3YXMKPiBkZXNjcmliZWQgYnkgTGlhbmcuCgpJdCBuZWVkcyB0byBiZSB2ZXJ5IHdlbGwgY29u
dGFpbmVkIGluIGRlZGljYXRlZCBoZWxwZXJzIGFuZCBkb2N1bWVudGVkLgpZb3UgY2hvb3NlIHdo
YXQgaXMgZWFzaWVyIGZvciB5b3UgKExpYW5nJ3MgbWV0aG9kIG9yCm5hbmRfc29mdF93YWl0cmR5
KCkpLCBidXQgSSBkb24ndCB3YW50IHRvIHNlZSBzcHVyaW91cyBSRUFEMCBvcgpSRUFEX1NUQVRV
UyBjYWxscyBpbnNpZGUgcmVhZC93cml0ZV9wYWdlIGhlbHBlcnMgbGlrZSBiZWZvcmUuCgo+IEFu
ZCBZb3UgbWVhbiB0byB1c2UgdGhlIGZvbGxvd2luZyBsb2dpYzoKPiBpZiAoIm5hbmQtcmIiID09
IHRydWUpCj4gICAgIHVzZSBSQl9JTlQgd2hpY2ggcmVxdWlyZXMgd2lyZQo+IGVsc2UKPiAgICAg
dXNlICduYW5kX3NvZnRfd2FpdHJkeSgpJwo+IAo+ID8KPiAKPiBUaGFua3MsIEFyc2VuaXkKPiAK
PiA+ICAgCj4gPj4KPiA+PiBUaGFua3MsIEFyc2VuaXkKPiA+PiAgCj4gPj4+PiAgICAKPiA+Pj4+
PiBBcnNlbml5LCBpZiB0aGUgYW5zd2VyIHRvIG15IGFib3ZlIHF1ZXN0aW9uIGlzIG5vLCB0aGVu
IHlvdSBzaG91bGQKPiA+Pj4+PiBleHBlY3QgdGhlIG5hbmQtcmIgYW5kIHJlZyBhcnJheXMgdG8g
YmUgaWRlbnRpY2FsLiBJZiB0aGV5IGFyZSBub3QsCj4gPj4+Pj4gdGhlbiB5b3UgY2FuIHJldHVy
biAtRUlOVkFMLgo+ID4+Pj4+Cj4gPj4+Pj4gSWYgdGhlIG5hbmQtcmIgcHJvcGVydHkgaXMgbWlz
c2luZywgdGhlbiBmYWxsYmFjayB0byBzb2Z0d2FyZSB3YWl0Lgo+ID4+Pj4+ICAgIAo+ID4+Pj4+
PiAyKSBJIGNhbid0IHRlc3QgUkIgbW9kZSAtIEkgZG9uJ3QgaGF2ZSBzdWNoIGRldmljZSA6KAo+
ID4+Pj4+Pgo+ID4+Pj4+PiBBbHNvIGZvciBleGFtcGxlIGluIGFyYXNhbi1uYW5kLWNvbnRyb2xs
ZXIuYyBwYXJzZWQgJ25hbmQtcmInIHZhbHVlcyBhcmUgdXNlZAo+ID4+Pj4+PiBpbiBjb250cm9s
bGVyIHNwZWNpZmljIHJlZ2lzdGVyIGZvciB3YWl0aW5nIChJIGd1ZXNzIE1lc29uIGNvbnRyb2xs
ZXIgaGFzIHNvbWV0aGluZwo+ID4+Pj4+PiBsaWtlIHRoYXQsIGJ1dCBJIGRvbid0IGhhdmUgZG9j
KS4gV2hpbGUgaW4gbWFydmVsbF9uYW5kLmMgaXQgbG9va3MgbGlrZSB0aGF0IHRoZXkgcGFyc2UK
PiA+Pj4+Pj4gJ25hbmQtcmInIHByb3BlcnR5LCBidXQgbmV2ZXIgdXNlIGl0LiAgICAKPiA+Pj4+
Pgo+ID4+Pj4+IFllcywgdGhlIGxvZ2ljIGFyb3VuZCB0aGUgc2Vjb25kIFJCIGxpbmUgKHRha2lu
ZyBjYXJlIG9mIENTMS9DUzMpIGlzCj4gPj4+Pj4gc2xpZ2h0bHkgYnJva2VuIG9yIGF0IGxlYXN0
IGJhZGx5IGRvY3VtZW50ZWQsIGFuZCB0aHVzIHNob3VsZCBub3QgYmUKPiA+Pj4+PiB1c2VkLgo+
ID4+Pj4+ICAgIAo+ID4+Pj4+Pj4gSW4gYW55IGNhc2UgeW91J2xsIG5lZWQgYSBkdC1iaW5kaW5n
IHVwZGF0ZSB3aGljaCBtdXN0IGJlIGFja2VkIGJ5Cj4gPj4+Pj4+PiBkdC1iaW5kaW5nIG1haW50
YWluZXJzLiAgICAKPiA+Pj4+Pj4KPiA+Pj4+Pj4gWW91IG1lYW4gdG8gYWRkIHRoaXMgcHJvcGVy
dHkgZGVzYyB0byBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMs
bWVzb24tbmFuZC55YW1sID8gICAgCj4gPj4+Pj4KPiA+Pj4+PiBZZXMuIEluIGEgZGVkaWNhdGVk
IHBhdGNoLiBTb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzOgo+ID4+Pj4+Cj4gPj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoCBuYW5kLXJiOiB0cnVlCj4gPj4+Pj4KPiA+Pj4+PiBpbnNpZGUgdGhlIG5hbmQg
Y2hpcCBvYmplY3Qgc2hvdWxkIGJlIGZpbmUuIEFuZCBmbGFnIHRoZSBjaGFuZ2UgYXMgYQo+ID4+
Pj4+IGZpeCBiZWNhdXNlIHdlIHNob3VsZCBoYXZlIHVzZWQgYW5kIHBhcnNlZCB0aGlzIHByb3Bl
cnR5IHNpbmNlIHRoZQo+ID4+Pj4+IGJlZ2lubmluZy4KPiA+Pj4+Pgo+ID4+Pj4+IFRoYW5rcywK
PiA+Pj4+PiBNaXF1w6hsICAgIAo+ID4gCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwgIAoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
