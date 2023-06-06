Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BD7C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CEpuIb7OOGvR4s0wnjDsQi6TsdC378E8497PLME5rlQ=; b=3mTsWQtax9tnUq
	m5HmHFdXWO3b8PKFBZcfckyG4Ax+cdUOBl77Da4s99NvczxL3lEO9YujVyIK3yzHMdgX426fZjJ4p
	8+br8p5DH6xdX6u56NbixvwMfM8wqhyf9M8A4sdRQoNIiD4XWiBUdK9Q16LmoXtcDhcBkmNbk3/k/
	GQjhC0KEYbH0JFYAxgZr5OEiOmlU0BXDqgIXY/dr3gIPFA2H54wb9Fh4nmiUE1O00OTQanhePv4p0
	yFhN/1Z9uvfuHjd+fQ2qq3CHR49oZfij1zC4vNuaktPU8EFE3RsowEEz7iIq1vpnR+uI+s8j9BeVP
	9kDNDumFS6EObPa+8Ilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VXa-001aH7-2b;
	Tue, 06 Jun 2023 12:11:58 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VXW-001aCH-0P;
	Tue, 06 Jun 2023 12:11:56 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686053508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OWBO6TOl9r9pYNXM6Ryohy3b/2rZwW/+O7pyUi4Us4=;
	b=nxS+sZre0jkLWB+lxBGdNEtsqADaCPi0Xo4Ga1rhJ/sLf0YZrt3eRkt5H6IEGPfKc4lukE
	So6VfIvIxXiV+ImX/ghJOxyZdf2EZgN6QFX3u49HfwveVqT3DvTbufgN9/0ineuZ0pXT2z
	6oGBYgSjw8vt8dTbZlvkYiXaiKoVWB5rsqS3dAgZ4quRoYE5cCi/ZvJbm1mLjV8M9CfpUb
	mZPbVOmmH71HkJXgFG/4YqXnMZtgaWDL+ROcEieA3XZ+NmYxpsw2L9vLNAJCRuU4NjyeFw
	2nefWnXNrKTUK0Z+RbBAbm1hPcGiEFnoudQSTmURiUeLvu1d3zEmvWv0YZjh7Q==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC90C40004;
	Tue,  6 Jun 2023 12:11:46 +0000 (UTC)
Date: Tue, 6 Jun 2023 14:11:45 +0200
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
Message-ID: <20230606141145.59e96064@xps-13>
In-Reply-To: <5c98362c-1808-d7d2-bff8-c2f2f3ae0e89@sberdevices.ru>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
	<20230601061850.3907800-3-AVKrasnov@sberdevices.ru>
	<20230601100751.41c3ff0b@xps-13>
	<9e106d50-2524-c999-48b1-a20760238aaf@sberdevices.ru>
	<20230605110546.6cb00a8d@xps-13>
	<2a755783-1d56-9842-2eee-b5ab41152c81@amlogic.com>
	<163e0684-caff-77d0-1eaf-9a58290c200d@amlogic.com>
	<5c98362c-1808-d7d2-bff8-c2f2f3ae0e89@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_051154_477442_6382002F 
X-CRM114-Status: GOOD (  40.84  )
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
IDIwMjMgMTQ6NDk6MTkgKzAzMDA6Cgo+IE9uIDA1LjA2LjIwMjMgMTY6MzAsIExpYW5nIFlhbmcg
d3JvdGU6Cj4gPiAKPiA+IAo+ID4gT24gMjAyMy82LzUgMjE6MTksIExpYW5nIFlhbmcgd3JvdGU6
ICAKPiA+PiBIaSBNaXF1ZWwgYW5kIEFyc2VuaXksCj4gPj4KPiA+Pgo+ID4+IE9uIDIwMjMvNi81
IDE3OjA1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+
ID4+Pgo+ID4+PiBIaSBBcnNlbml5LAo+ID4+PiAgCj4gPj4+Pj4+IEBAIC0xNDEyLDYgKzE0MTks
OCBAQCBzdGF0aWMgaW50IG1lc29uX25mY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ID4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gPj4+Pj4+
IMKgwqDCoCB9Cj4gPj4+Pj4+Cj4gPj4+Pj4+ICvCoCBuZmMtPnVzZV9wb2xsaW5nID0gb2ZfcHJv
cGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwgInBvbGxpbmciKTsgIAo+ID4+Pj4+Cj4gPj4+
Pj4gVGhpcyBpcyBhIHByb2JsZW0uIFlvdSBjYW5ub3QgYWRkIGEgcG9sbGluZyBwcm9wZXJ0eSBs
aWtlIHRoYXQuCj4gPj4+Pj4KPiA+Pj4+PiBUaGVyZSBpcyBhbHJlYWR5IGEgbmFuZC1yYiBwcm9w
ZXJ0eSB3aGljaCBpcyBzdXBwb3NlZCB0byBjYXJyeSBob3cgYXJlCj4gPj4+Pj4gd2lyZWQgdGhl
IFJCIGxpbmVzLiBJIGRvbid0IHNlZSBhbnkgaW4tdHJlZSB1c2VycyBvZiB0aGUgY29tcGF0aWJs
ZXMsIEkKPiA+Pj4+PiBkb24ndCBrbm93IGhvdyBhY2NlcHRhYmxlIGl0IGlzIHRvIGNvbnNpZGVy
IHVzaW5nIHNvZnQgZmFsbGJhY2sgd2hlbgo+ID4+Pj4+IHRoaXMgcHJvcGVydHkgaXMgbWlzc2lu
Zywgb3RoZXJ3aXNlIHRha2UgdGhlIHZhbHVlcyBvZiB0aGUgcmIgbGluZXMKPiA+Pj4+PiBwcm92
aWRlZCBpbiB0aGUgRFQgYW5kIHVzZXIgaGFyZHdhcmUgY29udHJvbCwgYnV0IEkgd291bGQgZGVm
aW5pdGVseQo+ID4+Pj4+IHByZWZlciB0aGF0LiAgCj4gPj4+Pgo+ID4+Pj4gSSBzZWUuIFNvIGkg
bmVlZCB0byBpbXBsZW1lbnQgcHJvY2Vzc2luZyBvZiB0aGlzIHByb3BlcnR5IGhlcmU/IEFuZCBp
ZiBpdAo+ID4+Pj4gaXMgbWlzc2VkIC0+IHVzZSBzb2Z0d2FyZSB3YWl0aW5nLiBJIHRoaW5rIGlu
dGVyZXN0aW5nIHRoaW5nIHdpbGwgYmUgdGhhdDoKPiA+Pj4+Cj4gPj4+PiAxKSBFdmVuIHdpdGgg
c3VwcG9ydCBvZiB0aGlzIHByb3BlcnR5IGhlcmUsIEkgcmVhbGx5IGRvbid0IGtub3cgaG93IHRv
IHBhc3MKPiA+Pj4+IMKgwqDCoCBSQiB2YWx1ZXMgdG8gdGhpcyBjb250cm9sbGVyIC0gSSBqdXN0
IGhhdmUgZGVmaW5lIGZvciBSQiBjb21tYW5kIGFuZCB0aGF0J3MKPiA+Pj4+IMKgwqDCoCBpdC4g
SSBmb3VuZCB0aGF0IHRoaXMgcHJvcGVydHkgaXMgYW4gYXJyYXkgb2YgdTMyIC0gSUlVQyBlYWNo
IGVsZW1lbnQgaXMKPiA+Pj4+IMKgwqDCoCBSQiBwaW4gcGVyIGNoaXAuIE1heSBiZSBpIG5lZWQg
dG8gZGl2ZSBpbnRvIHRoZSBvbGQgdmVuZG9yJ3MgZHJpdmVyIHRvIGZpbmQKPiA+Pj4+IMKgwqDC
oCBob3cgdG8gdXNlIFJCIHZhbHVlcyAoYWx0aG91Z2ggdGhpcyBkcml2ZXIgdXNlcyBzb2Z0d2Fy
ZSB3YWl0aW5nIHNvIEknbSBub3QKPiA+Pj4+IMKgwqDCoCBzdXJlIHRoYXQgSSdsbCBmaW5kIHNv
bWV0aGluZyBpbiBpdCkuICAKPiA+Pj4KPiA+Pj4gTGlhbmcsIGNhbiB5b3UgcGxlYXNlIGdpdmUg
dXNlIHRoZSByZWxldmFudCBpbmZvcm1hdGlvbiBoZXJlPyBIb3cgZG8gd2UKPiA+Pj4gdGFyZ2V0
IFJCMCBhbmQgUkIxPyBJdCBzZWVtcyBsaWtlIHlvdSB1c2UgdGhlIENTIGFzIG9ubHkgaW5mb3Jt
YXRpb24KPiA+Pj4gbGlrZSBpZiB0aGUgUkIgbGluZXMgd2hlcmUgaGFyZHdpcmVkIGludGVybmFs
bHkgdG8gYSBDUy4gQ2FuIHdlIGludmVydAo+ID4+PiB0aGUgbGluZXMgd2l0aCBhIHNwZWNpZmlj
IGNvbmZpZ3VyYXRpb24/ICAKPiA+Pgo+ID4+IENvbnRyb2xsb3IgaGFzIG9ubHkgb25lIGV4dGVy
bmFsIFJCIHBpbm11eCAoTkFORF9SQjApLiBhbGwgdGhlIFJCIHBpbnMKPiA+PiBvZiBkaWZmZXJl
bnQgQ0VzIG5lZWQgdG8gYmUgYm91bmQgaW50byBvbmUgd2lyZSBhbmQgY29ubmVjdCB3aXRoCj4g
Pj4gTkFORF9SQjAgaWYgd2FudCB0byB1c2UgY29udHJvbGxlciBwb2xsaW5nIHJiLiB0aGUgY3Vy
cmVudCBvcGVyYXRpbmcKPiA+PiBDRSBvZiBOQU5EIGlzIGRlY2lkZWQgdG8gImNoaXBfc2VsZWN0
Iiwgb2YgY291cnNlIGNvbnRyb2xsZXIgaW50ZXJuYWxseSBoYXMgZGlmZmVyZW50IG5mYyBjb21t
YW5kcyB0byByZWdjb25pemUgd2hpY2ggQ2UncyBSQiBzaWduYWwgaXMgcG9sbGluZy4KPiA+Pgo+
ID4+IDwmbmFuZF9waW5zPiBpbiBkdHMveWFtbCBzaG91bGQgaW5jbHVkZSB0aGUgTkFORF9SQjAg
aWYgaGFyZHdhcmUgY29ubmVjdHMsIG9yIHVzZSBzb2Z0d2FyZSBwb2xsaW5nIGhlcmUuCj4gPj4K
PiA+PiBAQXJzZW5peSwgc29ycnksIGkgZG9uJ3QgdHJhdmVsIGFsbCB0aGUgaW5mb3JtYXRpb25z
IHlldC4gYnV0IHdoeSBkb24ndCB5b3UgdXNlIHRoZSBuZXcgUkJfSU5UIGNvbW1hbmQgd2l0aCBp
cnEgdGhhdCBpIHByb3ZpZGVkIGluIGFub3RoZXIgdGhyZWFkLiB0aGUgbmV3IFJCX0lOVCBjb21t
YW5kIGRvZXNuJ3QgZGVwZW5kIG9uIHRoZSBwaHlzaWNhbCBSQiB3aXJlcywgaXQgYWxzbyBzZW5k
IHRoZSBSRUFEIHN0YXR1cyBjb21tYW5kKDB4NzApIGFuZCB3YWl0IGZvciB0aGUgaXJxIHdha2Ug
dXAgY29tcGxldGlvbi4gIAo+ID4gCj4gPiBVc2UgIm5hbmQtcmIiIGluIGR0cyB0byBkZWNpZGUg
b2xkIFJCX0lOVChwaHlzaWNhbCBSQiB3aXJlcyBpcyBuZWVkZWQpIG9yIG5ldyBSQl9JTlQobm8g
cGh5c2ljYWwgUkIgd2lyZXMpLiB0aGUgbmV3IFJCX0lOVCBjb21tYW5kIGRlY2lkZXMgdGhlIFJC
MCBvciBSQjEgYnkgdGhlIHByZXZpb3VzIGNvbW1hbmQgd2l0aCBjZSBhcmdzLgo+ID4gICAKPiA+
PiAgCj4gPj4+IEFyc2VuaXksIGlmIHRoZSBhbnN3ZXIgdG8gbXkgYWJvdmUgcXVlc3Rpb24gaXMg
bm8sIHRoZW4geW91IHNob3VsZAo+ID4+PiBleHBlY3QgdGhlIG5hbmQtcmIgYW5kIHJlZyBhcnJh
eXMgdG8gYmUgaWRlbnRpY2FsLiBJZiB0aGV5IGFyZSBub3QsCj4gPj4+IHRoZW4geW91IGNhbiBy
ZXR1cm4gLUVJTlZBTC4KPiA+Pj4KPiA+Pj4gSWYgdGhlIG5hbmQtcmIgcHJvcGVydHkgaXMgbWlz
c2luZywgdGhlbiBmYWxsYmFjayB0byBzb2Z0d2FyZSB3YWl0Lgo+ID4+PiAgCj4gPj4+PiAyKSBJ
IGNhbid0IHRlc3QgUkIgbW9kZSAtIEkgZG9uJ3QgaGF2ZSBzdWNoIGRldmljZSA6KAo+ID4+Pj4K
PiA+Pj4+IEFsc28gZm9yIGV4YW1wbGUgaW4gYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIHBhcnNl
ZCAnbmFuZC1yYicgdmFsdWVzIGFyZSB1c2VkCj4gPj4+PiBpbiBjb250cm9sbGVyIHNwZWNpZmlj
IHJlZ2lzdGVyIGZvciB3YWl0aW5nIChJIGd1ZXNzIE1lc29uIGNvbnRyb2xsZXIgaGFzIHNvbWV0
aGluZwo+ID4+Pj4gbGlrZSB0aGF0LCBidXQgSSBkb24ndCBoYXZlIGRvYykuIFdoaWxlIGluIG1h
cnZlbGxfbmFuZC5jIGl0IGxvb2tzIGxpa2UgdGhhdCB0aGV5IHBhcnNlCj4gPj4+PiAnbmFuZC1y
YicgcHJvcGVydHksIGJ1dCBuZXZlciB1c2UgaXQuICAKPiA+Pj4KPiA+Pj4gWWVzLCB0aGUgbG9n
aWMgYXJvdW5kIHRoZSBzZWNvbmQgUkIgbGluZSAodGFraW5nIGNhcmUgb2YgQ1MxL0NTMykgaXMK
PiA+Pj4gc2xpZ2h0bHkgYnJva2VuIG9yIGF0IGxlYXN0IGJhZGx5IGRvY3VtZW50ZWQsIGFuZCB0
aHVzIHNob3VsZCBub3QgYmUKPiA+Pj4gdXNlZC4KPiA+Pj4gIAo+ID4+Pj4+IEluIGFueSBjYXNl
IHlvdSdsbCBuZWVkIGEgZHQtYmluZGluZyB1cGRhdGUgd2hpY2ggbXVzdCBiZSBhY2tlZCBieQo+
ID4+Pj4+IGR0LWJpbmRpbmcgbWFpbnRhaW5lcnMuICAKPiA+Pj4+Cj4gPj4+PiBZb3UgbWVhbiB0
byBhZGQgdGhpcyBwcm9wZXJ0eSBkZXNjIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwgPyAgCj4gPj4+Cj4gPj4+IFllcy4gSW4g
YSBkZWRpY2F0ZWQgcGF0Y2guIFNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXM6Cj4gPj4+Cj4gPj4+
IMKgwqDCoMKgwqDCoMKgwqAgbmFuZC1yYjogdHJ1ZQo+ID4+Pgo+ID4+PiBpbnNpZGUgdGhlIG5h
bmQgY2hpcCBvYmplY3Qgc2hvdWxkIGJlIGZpbmUuIEFuZCBmbGFnIHRoZSBjaGFuZ2UgYXMgYQo+
ID4+PiBmaXggYmVjYXVzZSB3ZSBzaG91bGQgaGF2ZSB1c2VkIGFuZCBwYXJzZWQgdGhpcyBwcm9w
ZXJ0eSBzaW5jZSB0aGUKPiA+Pj4gYmVnaW5uaW5nLiAgCj4gCj4gTWlxdWVsLAo+IAo+IFNtYWxs
IHJlbWFyaywgZG8gd2UgcmVhbGx5IG5lZWQgdG8gYWRkIHRoaXMgJ25hbmQtcmInIHRvIHRoZSBj
aGlwIG9iamVjdCwgYXMgTGlhbmcgc2FpZCwKPiB0aGF0IHRoZXJlIGlzIG9ubHkgb25lIFJCIHdp
cmUgKGUuZy4gb25seSBvbmUgb3Igbm90aGluZyk/IE1heWJlIGZvciBNZXNvbiBJIGNhbiBhZGQg
aXQgdG8gdGhlCj4gbWVzb24gY29udHJvbGxlciBzdHJ1Y3R1cmU/CgpZb3Ugb25seSBuZWVkIGEg
Ym9vbGVhbiBpbiB0aGUgY29udHJvbGxlciBzdHJ1Y3R1cmUsIEkgZ3Vlc3MuCgo+IAo+IFRoYW5r
cywgQXJzZW5peQo+IAo+ID4+Pgo+ID4+PiBUaGFua3MsCj4gPj4+IE1pcXXDqGwgIAoKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
