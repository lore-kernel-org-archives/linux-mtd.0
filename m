Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0368AEB64D9
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jul 2023 06:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6fuVry4YNe1liuLkofJ4gjw55uwpt22Zoz80+xJ29M=; b=zu+RUnIpcrjddW
	SB1LWMX/HBGdVlGg+NPl1jbhRhdLlDBNwIaT8sw8aZfDhPONVypVQxyh9f9w4sQ5gGwYSFnO8X5b2
	1hOwUwJYe1UJsjkwJM7jcJKpsNyTkbf7R1vRc99cEMSZw1uvaj4qVTSCmjfRu6KHSyknGlJ58t4ah
	DvCj522A47krNamm1JXRDKXkTePu9kAKpWL0vgeEYXxHpUlVOxh17yfRQTu/Q/rE4uz4ofp6sDWds
	BufuMFRjA1VOYP++LKMNl/jcqcJS+hbd5/56c+oLxiYuvHen5vjGeg4eDxqKKkcO/JeBd7dRmIcPF
	r1pIvm/4HX4oJ76VGwAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHI7m-000a1W-2x;
	Thu, 06 Jul 2023 06:05:54 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHI7i-000Zzv-0z;
	Thu, 06 Jul 2023 06:05:52 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688623543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lv0loJdFyoV3AVvlZn4Pmp1SJuFFj/UT8jk6/AKpsHw=;
	b=XSoSSqqmC+dg4D1FnsJ6ZVW/YzNN62aPkQUj3ryPOrMUWEHAzVFi9Rn3GIJj0dGkJYus2Z
	ZUU8RnizTHDhli0m0xi81adQ50HCJsXR0kS7++DOmxVyhktuUKphg2JopBfL41Nrnjxckc
	ovnVM0Pp8b+N/MC/zWCIUeRNrT8/vgduZP/aMJtI5qG353fiM4aa5ksBhFCdJadu36YrCt
	3P3t2XXlAxkvP/DLxXGNwhNo16SHoYQh2ftsVeVyAabBLwvHNAqhP7S3xL9SYCINsvCHmZ
	O3Mofv4k+vNA+HzRLm8qBVndCfhrUQI8Os0Dl97bhZ+B5tYbC/I38teUSg2T1w==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id B87B560005;
	Thu,  6 Jul 2023 06:05:40 +0000 (UTC)
Date: Thu, 6 Jul 2023 08:05:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: nand: meson: support for 512B
 ECC step size
Message-ID: <20230706080539.11b57e10@xps-13>
In-Reply-To: <677b0b16-2bfc-46e5-6029-e3b56abcaa3c@sberdevices.ru>
References: <20230705065434.297040-1-AVKrasnov@sberdevices.ru>
	<20230705065434.297040-2-AVKrasnov@sberdevices.ru>
	<20230705093702.6c0421d7@xps-13>
	<365898fb-3719-38e0-4383-e04ccc0b475b@sberdevices.ru>
	<20230705102254.0aeb94ea@xps-13>
	<677b0b16-2bfc-46e5-6029-e3b56abcaa3c@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_230550_643251_5BD597B0 
X-CRM114-Status: GOOD (  23.61  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUaHUsIDYgSnVs
IDIwMjMgMDg6NTc6MDAgKzAzMDA6Cgo+IE9uIDA1LjA3LjIwMjMgMTE6MjIsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4gPiBhdmtyYXNub3ZAc2JlcmRldmljZXMu
cnUgd3JvdGUgb24gV2VkLCA1IEp1bCAyMDIzIDExOjAzOjMwICswMzAwOgo+ID4gICAKPiA+PiBP
biAwNS4wNy4yMDIzIDEwOjM3LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+IEhpIEFyc2Vu
aXksCj4gPj4+Cj4gPj4+IEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDUg
SnVsIDIwMjMgMDk6NTQ6MzMgKzAzMDA6Cj4gPj4+ICAgICAKPiA+Pj4+IE1lc29uIE5BTkQgc3Vw
cG9ydHMgYm90aCA1MTJCIGFuZCAxMDI0QiBFQ0Mgc3RlcCBzaXplLCBzbyByZXBsYWNlCj4gPj4+
PiAnY29uc3QnIGZvciBvbmx5IDEwMjRCIHN0ZXAgc2l6ZSB3aXRoIGVudW0gZm9yIGJvdGggc2l6
ZXMuCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNu
b3ZAc2JlcmRldmljZXMucnU+Cj4gPj4+PiAtLS0KPiA+Pj4+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sIHwgNCArKystCj4gPj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Pj4K
PiA+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L2FtbG9naWMsbWVzb24tbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbAo+ID4+Pj4gaW5kZXggM2JlYzhhZjkxYmJi
Li44MWNhODgyODczMWEgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4gPj4+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1s
Cj4gPj4+PiBAQCAtNDksNyArNDksOCBAQCBwYXR0ZXJuUHJvcGVydGllczoKPiA+Pj4+ICAgICAg
ICAgIGNvbnN0OiBodwo+ID4+Pj4gIAo+ID4+Pj4gICAgICAgIG5hbmQtZWNjLXN0ZXAtc2l6ZToK
PiA+Pj4+IC0gICAgICAgIGNvbnN0OiAxMDI0Cj4gPj4+PiArICAgICAgICBlbnVtOiBbNTEyLCAx
MDI0XQo+ID4+Pj4gKyAgICAgICAgZGVmYXVsdDogMTAyNCAgICAKPiA+Pj4KPiA+Pj4gSSB3YXMg
YWN0dWFsbHkgd3JvbmcgaW4gbXkgcHJldmlvdXMgcmV2aWV3LCB0aGVyZSBpcyBubyBzdHJvbmcg
ZGVmYXVsdAo+ID4+PiBoZXJlIGFzIHRoZSBleGlzdGluZyBiaW5kaW5nIChhbmQgY29kZSkgdHJ5
IHRvIHVzZSB0aGUgY2xvc2VzdAo+ID4+PiBwYXJhbWV0ZXJzIHJlcXVpcmVkIGJ5IHRoZSBOQU5E
IGNoaXA6IHdlIHBpY2sgdGhlICJvcHRpbWFsIgo+ID4+PiBjb25maWd1cmF0aW9uLiBTbyBpZiB5
b3UgZG9uJ3QgcHJvdmlkZSBhbnkgdmFsdWUgaGVyZSwgd2UgZXhwZWN0Cj4gPj4+IHRoZSBzdHJl
bmd0aCBhbmQgc3RlcCBzaXplIGFkdmVydGl6ZWQgYnkgdGhlIGNoaXAgdG8gYmUgdXNlZC4gVGhp
cyBpcyBhCj4gPj4+IGNvbW1vbiBkZWZhdWx0IGluIHRoZSByYXcgTkFORCBzdWJzeXN0ZW0uCj4g
Pj4+Cj4gPj4+IFBsZWFzZSBkcm9wIHRoZSBkZWZhdWx0IGxpbmUsIHJlLWludGVncmF0ZSB0aGUg
bWlzc2luZyBSLWJ5IHRhZyBmcm9tCj4gPj4+IFJvYiBhbmQgaW4gYSBzZXBhcmF0ZSBwYXRjaCBw
bGVhc2UgbWFyayBuYW5kLWVjYy1zdGVwLXNpemUgYW5kCj4gPj4+IG5hbmQtZWNjLXN0cmVuZ3Ro
IG1hbmRhdG9yeSBpZiB0aGUgb3RoZXIgaXMgcHJvdmlkZS4gSU9XLCB3ZSBleHBlY3QKPiA+Pj4g
ZWl0aGVyIGJvdGgsIG9yIG5vbmUgb2YgdGhlbSwgYnV0IG5vdCBhIHNpbmdsZSBvbmUuICAgIAo+
ID4+Cj4gPj4gSSBzZWUsIG5vIHByb2JsZW0hICJtYW5kYXRvcnkiIG1lYW5zIHVwZGF0ZSBkZXNj
cmlwdGlvbiBvZiBib3RoIGZpZWxkcyBsaWtlOgo+ID4+Cj4gPj4gICAgIGRlc2NyaXB0aW9uOiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4g
Pj4gICAgICAgTWFuZGF0b3J5IGlmIG5hbmQtZWNjLXN0ZXAtc2l6ZSBpcyBzZXQuICAKPiA+IAo+
ID4gTm9wZSA6LSkKPiA+IAo+ID4gU29tZXRoaW5nIGFsb25nOgo+ID4gCj4gPiBhbGxPZjoKPiA+
ICAgLSBpZjoKPiA+ICAgICA8bmFuZC1jaGlwPjoKPiA+ICAgICAgIHByb3BlcnRpZXM6Cj4gPiAg
ICAgICAgIGNvbnRhaW5zOgo+ID4gICAgICAgICAgIC0gbmFuZC1lY2Mtc3RlcC1zaXplCj4gPiAg
ICAgdGhlbjoKPiA+ICAgICAgIHJlcXVpcmVkOgo+ID4gICAgICAgICA8bmFuZC1jaGlwPjoKPiA+
ICAgICAgICAgICBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAgLSBuYW5kLWVjYy1zdHJlbmd0
aAo+ID4gCj4gPiBBbmQgc2FtZSB3aXRoIHRoZSBvcHBvc2l0ZSBsb2dpYy4gIAo+IAo+IEkgc2Vl
LCB0aGFua3MhIEFuZCB0aGlzIHNob3VsZCBiZSBmb3IgYWxsIG5hbmQgY2hpcHMsIG5vdCBvbmx5
IEFtbG9naWM/IEkgbWVhbiBpbgo+IG5hbmQtY2hpcC55YW1sPyAKClNvbWUgZHJpdmVycyBjYW4g
ZGlyZWN0bHkgbWFuYWdlIHRoZSB1c2VyIHJlcXVlc3RzIGluIHRlcm1zIG9mIGVpdGhlcgpzdGVw
IHNpemUgKm9yKiBzdHJlbmd0aCwgc28gSSB3b3VsZCBrZWVwIHRoaXMgaW50byB0aGUgQW1sb2dp
YyBmaWxlIGZvcgpub3cuCgo+IEknbGwgaW5jbHVkZSBpdCBhcyB0aGlyZCBwYXRjaCBpbiB0aGlz
IHBhdGNoc2V0Lgo+IAo+IFRoYW5rcywgQXJzZW5peQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
