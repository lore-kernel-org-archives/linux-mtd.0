Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C94C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 07:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbTwQQVNt95SSRoNTfuFrshkYy8OH1GZGw0vzcVv7ts=; b=pykCskdYWJKpZv
	L5Hc27Ppp8KLqwM5VUAEwVJM19F2aq9h7BFLdOUGcXCKoMnXb1qZndGZnynUtNLGK0rpo+0BrzoRW
	sXxWF89/YWKkOq1GXWNp5R13BKsaAaIkMDFV/8ygIOxQQ8V8SzoHbA/r1IBcp9SPoefWUetCeVIoB
	5X1Lba1ETfg1moRrrbpBk2w0Bokp+/FibjQ5wTYAr77/BXxG8m5dHWQpuYnawdUNz40lXNAmg0EB8
	vUSzIyGXpCkKKulQnCrmCorQKMHXQiSuNFks8CywXl6hr7Ji9gkrob44oabt7oHoWBvl8ONLHaH8M
	wrpfCJpsP6KezrzXCqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QjX-000TAu-0u;
	Tue, 06 Jun 2023 07:03:59 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QjS-000T91-2C;
	Tue, 06 Jun 2023 07:03:56 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686035029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reafBMrUZj+7Va9OhYXaqDy3QOGdwu434t/u9hYeCkc=;
	b=fnifd9QSx/KpYKg+eS5X/XcAS3vs+xQ765oNv2AoThbgpBo4q/8H4ROsyNwUKf7a+GaNXU
	ihJW2gBv4OxsC7hs5iP1ukBE9v6lXuY/9lU7+ycDkRCe0k4mk0g0SrzPY3WtdGc4HPRB5m
	sksNXL/kJl9/jfeSV/ShbSMAm1zEUcF2pBjItDgHftHEf887pHrpPsyNMFgJQvUk9P5V4J
	YPqDsV70g4NU9caJyKhE2dnCmoDnkno6IRXzarZlDCjR8sXA1iIj4bhAez1YEsxc0VLaSR
	gW2mch4tYmr5PIRuFzvD6mRZrl/ufF0FkfBDayJpmkRBOUiLhO3CcxMDYvmF+A==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2734820010;
	Tue,  6 Jun 2023 07:03:46 +0000 (UTC)
Date: Tue, 6 Jun 2023 09:03:44 +0200
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
Message-ID: <20230606090344.3aca96c8@xps-13>
In-Reply-To: <c316961d-6021-1cb4-9ff4-22fe9ca5a18a@sberdevices.ru>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
	<20230601061850.3907800-3-AVKrasnov@sberdevices.ru>
	<20230601100751.41c3ff0b@xps-13>
	<9e106d50-2524-c999-48b1-a20760238aaf@sberdevices.ru>
	<20230605110546.6cb00a8d@xps-13>
	<2a755783-1d56-9842-2eee-b5ab41152c81@amlogic.com>
	<163e0684-caff-77d0-1eaf-9a58290c200d@amlogic.com>
	<c316961d-6021-1cb4-9ff4-22fe9ca5a18a@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_000355_026441_6C62E4C4 
X-CRM114-Status: GOOD (  40.16  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBNb24sIDUgSnVu
IDIwMjMgMTk6NTg6MDIgKzAzMDA6Cgo+IE9uIDA1LjA2LjIwMjMgMTY6MzAsIExpYW5nIFlhbmcg
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
dXAgY29tcGxldGlvbi4gIAo+IAo+IFRlY2huaWNhbGx5IG5vIHByb2JsZW0hIEkgY2FuIHVzZSBu
ZXcgUkJfSU5UIGluc3RlYWQgb2YgJ25hbmRfc29mdF93YWl0cmR5KCknIGFzIHNvZnR3YXJlIGZh
bGxiYWNrLCBhbmQgY3VycmVudGx5Cj4gaW1wbGVtZW50ZWQgUkJfSU5UIGFzIGludGVycnVwdCBk
cml2ZW4gd2F5LiBXaGF0IGRvIFlvdSB0aGluayBNaXF1ZWwgPwo+IAo+ID4gCj4gPiBVc2UgIm5h
bmQtcmIiIGluIGR0cyB0byBkZWNpZGUgb2xkIFJCX0lOVChwaHlzaWNhbCBSQiB3aXJlcyBpcyBu
ZWVkZWQpIG9yIG5ldyBSQl9JTlQobm8gcGh5c2ljYWwgUkIgd2lyZXMpLiB0aGUgbmV3IFJCX0lO
VCBjb21tYW5kIGRlY2lkZXMgdGhlIFJCMCBvciBSQjEgYnkgdGhlIHByZXZpb3VzIGNvbW1hbmQg
d2l0aCBjZSBhcmdzLgo+ID4gICAKPiAKPiBTbyBJIGNhbiBpbXBsZW1lbnQgIm5hbmQtcmIiIGlu
IGR0cyBhcyBib29sZWFuIHZhbHVlIC0gImZhbHNlIiBvciBtaXNzaW5nIG1lYW5zIHVzZSAibm8g
cGh5c2ljYWwgUkIgd2lyZXMiLCAidHJ1ZSIgLSBtZWFucyB1c2UgInBoeXNpY2FsIFJCIHdpcmVz
IiA/CgpBcyBsb25nIGFzIGl0IHdvcmtzIGFuZCBkb2VzIG5vdCBjb250YWluIGFueSBleHRyZW1l
bHkgc3RyYW5nZSBSRUFEMCBvcgpSRUFEX1NUQVRVUyBpbiB0aGUgbWlkZGxlIG9mIG5vdGhpbmcs
IEknbSBmaW5lLCB0YWtlIHRoZSBzaW1wbGVzdAphcHByb2FjaCB3aGljaCB3aWxsIHdvcmsgZm9y
IGFsbC4KCj4gCj4gVGhhbmtzLCBBcnNlbml5Cj4gCj4gPj4gIAo+ID4+PiBBcnNlbml5LCBpZiB0
aGUgYW5zd2VyIHRvIG15IGFib3ZlIHF1ZXN0aW9uIGlzIG5vLCB0aGVuIHlvdSBzaG91bGQKPiA+
Pj4gZXhwZWN0IHRoZSBuYW5kLXJiIGFuZCByZWcgYXJyYXlzIHRvIGJlIGlkZW50aWNhbC4gSWYg
dGhleSBhcmUgbm90LAo+ID4+PiB0aGVuIHlvdSBjYW4gcmV0dXJuIC1FSU5WQUwuCj4gPj4+Cj4g
Pj4+IElmIHRoZSBuYW5kLXJiIHByb3BlcnR5IGlzIG1pc3NpbmcsIHRoZW4gZmFsbGJhY2sgdG8g
c29mdHdhcmUgd2FpdC4KPiA+Pj4gIAo+ID4+Pj4gMikgSSBjYW4ndCB0ZXN0IFJCIG1vZGUgLSBJ
IGRvbid0IGhhdmUgc3VjaCBkZXZpY2UgOigKPiA+Pj4+Cj4gPj4+PiBBbHNvIGZvciBleGFtcGxl
IGluIGFyYXNhbi1uYW5kLWNvbnRyb2xsZXIuYyBwYXJzZWQgJ25hbmQtcmInIHZhbHVlcyBhcmUg
dXNlZAo+ID4+Pj4gaW4gY29udHJvbGxlciBzcGVjaWZpYyByZWdpc3RlciBmb3Igd2FpdGluZyAo
SSBndWVzcyBNZXNvbiBjb250cm9sbGVyIGhhcyBzb21ldGhpbmcKPiA+Pj4+IGxpa2UgdGhhdCwg
YnV0IEkgZG9uJ3QgaGF2ZSBkb2MpLiBXaGlsZSBpbiBtYXJ2ZWxsX25hbmQuYyBpdCBsb29rcyBs
aWtlIHRoYXQgdGhleSBwYXJzZQo+ID4+Pj4gJ25hbmQtcmInIHByb3BlcnR5LCBidXQgbmV2ZXIg
dXNlIGl0LiAgCj4gPj4+Cj4gPj4+IFllcywgdGhlIGxvZ2ljIGFyb3VuZCB0aGUgc2Vjb25kIFJC
IGxpbmUgKHRha2luZyBjYXJlIG9mIENTMS9DUzMpIGlzCj4gPj4+IHNsaWdodGx5IGJyb2tlbiBv
ciBhdCBsZWFzdCBiYWRseSBkb2N1bWVudGVkLCBhbmQgdGh1cyBzaG91bGQgbm90IGJlCj4gPj4+
IHVzZWQuCj4gPj4+ICAKPiA+Pj4+PiBJbiBhbnkgY2FzZSB5b3UnbGwgbmVlZCBhIGR0LWJpbmRp
bmcgdXBkYXRlIHdoaWNoIG11c3QgYmUgYWNrZWQgYnkKPiA+Pj4+PiBkdC1iaW5kaW5nIG1haW50
YWluZXJzLiAgCj4gPj4+Pgo+ID4+Pj4gWW91IG1lYW4gdG8gYWRkIHRoaXMgcHJvcGVydHkgZGVz
YyB0byBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24t
bmFuZC55YW1sID8gIAo+ID4+Pgo+ID4+PiBZZXMuIEluIGEgZGVkaWNhdGVkIHBhdGNoLiBTb21l
dGhpbmcgYWxvbmcgdGhlIGxpbmVzOgo+ID4+Pgo+ID4+PiDCoMKgwqDCoMKgwqDCoMKgIG5hbmQt
cmI6IHRydWUKPiA+Pj4KPiA+Pj4gaW5zaWRlIHRoZSBuYW5kIGNoaXAgb2JqZWN0IHNob3VsZCBi
ZSBmaW5lLiBBbmQgZmxhZyB0aGUgY2hhbmdlIGFzIGEKPiA+Pj4gZml4IGJlY2F1c2Ugd2Ugc2hv
dWxkIGhhdmUgdXNlZCBhbmQgcGFyc2VkIHRoaXMgcHJvcGVydHkgc2luY2UgdGhlCj4gPj4+IGJl
Z2lubmluZy4KPiA+Pj4KPiA+Pj4gVGhhbmtzLAo+ID4+PiBNaXF1w6hsICAKCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
