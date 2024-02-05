Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495AFC4828D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyJkOubAYQNDrVU1rTFYh5oIK4FVI+lwCJZ4mqirnck=; b=ghnQ5E2vWrHHqO
	SsZA4L1nxroUCapPSkCJDh61XBqYsrSnhQ0HpNU7p6LYDzR7OC3zSLcyFGPq8KJlproAiKrr8Iz+a
	CPh/8RqxkfvG4ngAYQsf8LaYWe7wxJX+ar9Gf52PfREN+so2FpcGEK/dttNLD9GA2LPxt/I/76nlq
	Fj1SCKZfUXyHmI/sIBz4Yx2EDstpLzU4mYdeXwulIRK20NU66j0Nl79lOdVhFbTZDN07Q7M/Lf80m
	51g/rLa3SSnHIkf+9Y00AAZyi3tNC1Q48gemxP9F2T5vOo66vq6B90wgFHVuyMp8QohdNKmHe/g/i
	q8JylBQMm0Qc96l65liA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWtl2-00000002M8Y-2ef8;
	Mon, 05 Feb 2024 07:51:12 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWtky-00000002M6M-3bQI
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 07:51:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E417260008;
	Mon,  5 Feb 2024 07:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707119458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ttQ4uDt0B0MWz9Y2OYBfdOsR8cq/5uUelC94dh61iTE=;
	b=DZZxgC3z/SAhCFg7Oojb3mU4qZ2BwsdhLuZ6dOWjQAMLeIDp1BQ0mP8t2g9uNe0rgLYSRZ
	fgnLj18+PZSCVUwFN77NRnXVob4ElSpA3gq5gpN1UAfcDhuVbnsCIMuYpP2vMfQObTnGBw
	IkFhfuhEFpA+sdBmkEQRKeRRIn0AsgFKYz3hjeZP6BdU688kLWionAXZ+OhV/CodiPMJz1
	CMIN2AJqk4zDYvlZqBpji8zjNLVXASZPQkHbAX4sJQ4ThzJW5VYSQKVfPWuVD22ccpuUht
	EkiHr5ribVdDq/SUp37+DAFUEDXuJOKGb/2Q9Kcdd/QqUudmJZRmbVX2kusISw==
Date: Mon, 5 Feb 2024 08:50:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, Michael Walle
 <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Conor
 Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman
 compatible
Message-ID: <20240205085056.44278f2c@xps-13>
In-Reply-To: <CAFLszTimaFw9sf=JKvQXG4fS6V_2T=2n+pfvYLCiuG1o+7cHPA@mail.gmail.com>
References: <20231116172859.393744-1-sjg@chromium.org>
	<20231208150042.GA1278773-robh@kernel.org>
	<CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
	<CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
	<CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com>
	<20231214172702.GA617226-robh@kernel.org>
	<CAPnjgZ2oJSGPO91Y_aLbe+v250WFrND4n3T0mOvhERYidVu=eQ@mail.gmail.com>
	<CAFLszTizRRVbRO6_ygE2X-Lp5dENWSc4uMGL5GPJAFGAbRdCyQ@mail.gmail.com>
	<CAL_Jsq+j7_KZtQ2ENq9+vsw0LOZF=spu293_G=AxOmBM+m_f-g@mail.gmail.com>
	<CAFLszTimaFw9sf=JKvQXG4fS6V_2T=2n+pfvYLCiuG1o+7cHPA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_235109_203200_6B4F235D 
X-CRM114-Status: GOOD (  48.25  )
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

SGkgU2ltb24sCgpzamdAY2hyb21pdW0ub3JnIHdyb3RlIG9uIFN1biwgNCBGZWIgMjAyNCAwNTow
NzozOCAtMDcwMDoKCj4gSGkgUm9iLAo+IAo+IE9uIFdlZCwgMTcgSmFuIDIwMjQgYXQgMDg6NTYs
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgSmFu
IDQsIDIwMjQgYXQgMzo1NOKAr1BNIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3cm90
ZTogIAo+ID4gPgo+ID4gPiBIaSBSb2IsCj4gPiA+Cj4gPiA+IE9uIFRodSwgRGVjIDE0LCAyMDIz
IGF0IDI6MDnigK9QTSBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4gd3JvdGU6ICAKPiA+
ID4gPgo+ID4gPiA+IEhpIFJvYiwKPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgMTQgRGVjIDIwMjMg
YXQgMTA6MjcsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOiAgCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gT24gRnJpLCBEZWMgMDgsIDIwMjMgYXQgMDM6NTg6MTBQTSAtMDcwMCwgU2lt
b24gR2xhc3Mgd3JvdGU6ICAKPiA+ID4gPiA+ID4gSGkgUm9iLAo+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiBPbiBGcmksIDggRGVjIDIwMjMgYXQgMTQ6NTYsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOiAgCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBPbiBGcmksIERlYyA4
LCAyMDIzIGF0IDExOjQ34oCvQU0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+IHdyb3Rl
OiAgCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSGkgUm9iLAo+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+IE9uIEZyaSwgOCBEZWMgMjAyMyBhdCAwODowMCwgUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6ICAKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+ID4gT24gVGh1LCBOb3YgMTYsIDIwMjMgYXQgMTA6Mjg6NTBBTSAtMDcwMCwgU2ltb24g
R2xhc3Mgd3JvdGU6ICAKPiA+ID4gPiA+ID4gPiA+ID4gPiBBZGQgYSBjb21wYXRpYmxlIHN0cmlu
ZyBmb3IgYmlubWFuLCBzbyB3ZSBjYW4gZXh0ZW5kIGZpeGVkLXBhcnRpdGlvbnMKPiA+ID4gPiA+
ID4gPiA+ID4gPiBpbiB2YXJpb3VzIHdheXMuCj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4K
PiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gPiA+IChubyBjaGFuZ2VzIHNpbmNlIHY1KQo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2NToKPiA+ID4gPiA+ID4gPiA+ID4gPiAtIEFkZCAjYWRk
cmVzcy9zaXplLWNlbGxzIGFuZCBwYXJ0ZXJuUHJvcGVydGllcwo+ID4gPiA+ID4gPiA+ID4gPiA+
IC0gRHJvcCAkcmVmIHRvIGZpeGVkLXBhcnRpdGlvbnMueWFtbAo+ID4gPiA+ID4gPiA+ID4gPiA+
IC0gRHJvcCAnc2VsZWN0OiBmYWxzZScKPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSBDaGFuZ2Ugc3ViamVj
dCBsaW5lCj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiBDaGFuZ2VzIGlu
IHYzOgo+ID4gPiA+ID4gPiA+ID4gPiA+IC0gRHJvcCBmaXhlZC1wYXJ0aXRpb24gYWRkaXRpb25h
bCBjb21wYXRpYmxlIHN0cmluZwo+ID4gPiA+ID4gPiA+ID4gPiA+IC0gRHJvcCBmaXhlZC1wYXJ0
aXRpb25zIGZyb20gdGhlIGV4YW1wbGUKPiA+ID4gPiA+ID4gPiA+ID4gPiAtIE1lbnRpb24gdXNl
IG9mIGNvbXBhdGlibGUgaW5zdGVhZCBvZiBsYWJlbAo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+ID4gPiA+ID4gPiAtIERyb3Ag
bWVudGlvbiBvZiAnZW5oYW5jZWQgZmVhdHVyZXMnIGluIGZpeGVkLXBhcnRpdGlvbnMueWFtbAo+
ID4gPiA+ID4gPiA+ID4gPiA+IC0gTWVudGlvbiBCaW5tYW4gaW5wdXQgYW5kIG91dHB1dCBwcm9w
ZXJ0aWVzCj4gPiA+ID4gPiA+ID4gPiA+ID4gLSBVc2UgcGxhaW4gcGFydGl0aW9uQHh4eCBmb3Ig
dGhlIG5vZGUgbmFtZQo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gIC4u
Li9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbCAgICAgICB8IDY4ICsrKysrKysr
KysrKysrKysrKysKPiA+ID4gPiA+ID4gPiA+ID4gPiAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL3BhcnRpdGlvbnMueWFtbCAgIHwgIDEgKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICBNQUlOVEFJ
TkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKwo+ID4gPiA+ID4g
PiA+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKykKPiA+ID4gPiA+ID4g
PiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbAo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbAo+ID4gPiA+ID4gPiA+ID4gPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXggMDAwMDAwMDAw
MDAwLi4zMjkyMTc1NTBhOTgKPiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+
ID4gPiA+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9wYXJ0aXRpb25zL2Jpbm1hbi55YW1sCj4gPiA+ID4gPiA+ID4gPiA+ID4gQEAgLTAsMCArMSw2
OCBAQAo+ID4gPiA+ID4gPiA+ID4gPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyMgQ29weXJpZ2h0IDIw
MjMgR29vZ2xlIExMQwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiAr
JVlBTUwgMS4yCj4gPiA+ID4gPiA+ID4gPiA+ID4gKy0tLQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi55
YW1sIwo+ID4gPiA+ID4gPiA+ID4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+
ID4gPiA+ID4gK3RpdGxlOiBCaW5tYW4gZmlybXdhcmUgbGF5b3V0Cj4gPiA+ID4gPiA+ID4gPiA+
ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gPiA+ID4gPiA+ID4g
PiArICAtIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+ID4gPiA+ID4gPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiArZGVzY3JpcHRpb246IHwKPiA+ID4gPiA+ID4gPiA+ID4g
PiArICBUaGUgYmlubWFuIG5vZGUgcHJvdmlkZXMgYSBsYXlvdXQgZm9yIGZpcm13YXJlLCB1c2Vk
IHdoZW4gcGFja2FnaW5nIGZpcm13YXJlCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgZnJvbSBtdWx0
aXBsZSBwcm9qZWN0cy4gSXQgaXMgYmFzZWQgb24gZml4ZWQtcGFydGl0aW9ucywgd2l0aCBzb21l
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgZXh0ZW5zaW9ucywgYnV0IHVzZXMgJ2NvbXBhdGlibGUn
IHRvIGluZGljYXRlIHRoZSBjb250ZW50cyBvZiB0aGUgbm9kZSwgdG8KPiA+ID4gPiA+ID4gPiA+
ID4gPiArICBhdm9pZCBwZXJ0dXJiaW5nIG9yIGNvbmZ1c2luZyBleGlzdGluZyBpbnN0YWxsYXRp
b25zIHdoaWNoIHVzZSAnbGFiZWwnIGZvciBhCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgcGFydGlj
dWxhciBwdXJwb3NlLgo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiAr
ICBCaW5tYW4gc3VwcG9ydHMgcHJvcGVydGllcyB1c2VkIGFzIGlucHV0cyB0byB0aGUgZmlybXdh
cmUtcGFja2FnaW5nIHByb2Nlc3MsCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgc3VjaCBhcyB0aG9z
ZSB3aGljaCBjb250cm9sIGFsaWdubWVudCBvZiBwYXJ0aXRpb25zLiBUaGlzIGJpbmRpbmcgYWRk
cmVzc2VzCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgdGhlc2UgJ2lucHV0JyBwcm9wZXJ0aWVzLiBG
b3IgZXhhbXBsZSwgaXQgaXMgY29tbW9uIGZvciB0aGUgJ3JlZycgcHJvcGVydHkKPiA+ID4gPiA+
ID4gPiA+ID4gPiArICAoYW4gJ291dHB1dCcgcHJvcGVydHkpIHRvIGJlIHNldCBieSBCaW5tYW4s
IGJhc2VkIG9uIHRoZSBhbGlnbm1lbnQgcmVxdWVzdGVkCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAg
aW4gdGhlIGlucHV0Lgo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiAr
ICBPbmNlIHByb2Nlc3NpbmcgaXMgY29tcGxldGUsIGlucHV0IHByb3BlcnRpZXMgaGF2ZSBtb3N0
bHkgc2VydmVkIHRoZWlyCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgcHVycG9zZSwgYXQgbGVhc3Qg
dW50aWwgdGhlIGZpcm13YXJlIGlzIHJlcGFja2VkIGxhdGVyLCBlLmcuIGR1ZSB0byBhCj4gPiA+
ID4gPiA+ID4gPiA+ID4gKyAgZmlybXdhcmUgdXBkYXRlLiBUaGUgJ2ZpeGVkLXBhcnRpdGlvbnMn
IGJpbmRpbmcgc2hvdWxkIHByb3ZpZGUgZW5vdWdoCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgaW5m
b3JtYXRpb24gdG8gcmVhZCB0aGUgZmlybXdhcmUgYXQgcnVudGltZSwgaW5jbHVkaW5nIGRlY29t
cHJlc3Npb24gaWYKPiA+ID4gPiA+ID4gPiA+ID4gPiArICBuZWVkZWQuICAKPiA+ID4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gSG93IGlzIHRoaXMgZ29pbmcgdG8gd29yayBleGFjdGx5
PyBiaW5tYW4gcmVhZHMgdGhlc2Ugbm9kZXMgYW5kIHRoZW4KPiA+ID4gPiA+ID4gPiA+ID4gd3Jp
dGVzIG91dCAnZml4ZWQtcGFydGl0aW9ucycgbm9kZXMuIEJ1dCB0aGVuIHlvdSd2ZSBsb3N0IHRo
ZSBiaW5tYW4KPiA+ID4gPiA+ID4gPiA+ID4gc3BlY2lmYyBwYXJ0cyBuZWVkZWQgZm9yIHJlcGFj
a2luZy4gIAo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IE5vLCB0aGV5IGFyZSB0aGUg
c2FtZSBub2RlLiBJIGRvIHdhbnQgdGhlIGV4dHJhIGluZm9ybWF0aW9uIHRvIHN0aWNrCj4gPiA+
ID4gPiA+ID4gPiBhcm91bmQuIFNvIGxvbmcgYXMgaXQgaXMgY29tcGF0aWJsZSB3aXRoIGZpeGVk
LXBhcnRpdGlvbiBhcyB3ZWxsLCB0aGlzCj4gPiA+ID4gPiA+ID4gPiBzaG91bGQgd29yayBPSy4g
IAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSG93IGNhbiBpdCBiZSBib3RoPyBUaGUgcGFy
dGl0aW9ucyBub2RlIGNvbXBhdGlibGUgY2FuIGJlIGVpdGhlcgo+ID4gPiA+ID4gPiA+ICdmaXhl
ZC1wYXJ0aXRpb25zJyBvciAnYmlubWFuJy4gIAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBDYW4g
d2Ugbm90IGFsbG93IGl0IHRvIGJlIGJvdGg/IEkgaGF2ZSB0cmllZCB0byBhZGp1c3QgdGhpbmdz
IGluCj4gPiA+ID4gPiA+IHJlc3BvbnNlIHRvIGZlZWRiYWNrIGJ1dCBwZXJoYXBzIHRoZSBmZWVk
YmFjayB3YXMgbGVhZGluZyBtZSBkb3duIHRoZQo+ID4gPiA+ID4gPiB3cm9uZyBwYXRoPyAgCj4g
PiA+ID4gPgo+ID4gPiA+ID4gU3VyZSwgYnV0IHRoZW4gdGhlIHNjaGVtYSBoYXMgdG8gYW5kIHRo
YXQgbWVhbnMgZXh0ZW5kaW5nCj4gPiA+ID4gPiBmaXhlZC1wYXJ0aXRpb25zLiAgCj4gPiA+ID4K
PiA+ID4gPiBDYW4gd2UgY3Jvc3MgdGhhdCBicmlkZ2UgbGF0ZXI/IFRoZXJlIG1pZ2h0IGJlIHJl
c2lzdGFuY2UgdG8gaXQuIEknbQo+ID4gPiA+IG5vdCBzdXJlLiBGb3Igbm93LCBwZXJoYXBzIGp1
c3QgYSBiaW5tYW4gY29tcGF0aWJsZSB3b3JrcyB3ZWxsIGVub3VnaAo+ID4gPiA+IHRvIG1ha2Ug
cHJvZ3Jlc3MuICAKPiA+ID4KPiA+ID4gSXMgdGhlcmUgYW55IHdheSB0byBtYWtlIHByb2dyZXNz
IG9uIHRoaXM/IEkgd291bGQgbGlrZSB0byBoYXZlCj4gPiA+IHNvZnR3YXJlIHdoaWNoIGRvZXNu
J3QgdW5kZXJzdGFuZCB0aGUgYmlubWFuIGNvbXBhdGlibGUgdG8gYXQgbGVhc3QgYmUKPiA+ID4g
YWJsZSB0byB1bmRlcnN0YW5kIHRoZSBmaXhlZC1wYXJ0aXRpb24gY29tcGF0aWJsZS4gSXMgdGhh
dCBhY2NlcHRhYmxlPyAgCj4gPgo+ID4gVGhlcmUncyBvbmx5IDIgd2F5cyB0aGF0IGl0IGNhbiB3
b3JrLiBFaXRoZXIgYmlubWFuIHdyaXRlcyBvdXQKPiA+IGZpeGVkLXBhcnRpdGlvbiBub2RlcyBk
cm9wcGluZy9yZXBsYWNpbmcgYW55dGhpbmcgb25seSBkZWZpbmVkIGZvcgo+ID4gYmlubWFuIG9y
IGZpeGVkLXBhcnRpdGlvbiBpcyBleHRlbmRlZCB0byBpbmNsdWRlIHdoYXQgYmlubWFuIG5lZWRz
LiAgCj4gCj4gT0ssIHRoZW4gSSBzdXBwb3NlIHRoZSBiZXN0IHdheSBpcyB0byBhZGQgYSBuZXcg
YmlubWFuIGNvbXBhdGlibGUsIGFzCj4gaXMgZG9uZSB3aXRoIHRoaXMgdjYgc2VyaWVzLiBQZW9w
bGUgdGhlbiBuZWVkIHRvIGNob29zZSBpdCBpbnN0ZWFkIG9mCj4gZml4ZWQtcGFydGl0aW9uLgoK
SSdtIHNvcnJ5IHRoaXMgaXMgbm90IGF0IGFsbCB3aGF0IFJvYiBzdWdnZXN0ZWQsIG9yIGRpZCBJ
IHRvdGFsbHkKbWlzdW5kZXJzdGFuZCBoaXMgYW5zd2VyPwoKSW4gYm90aCBjYXNlcyB0aGUgc29s
dXRpb24gaXMgdG8gZ2VuZXJhdGUgYSAiZml4ZWQtcGFydGl0aW9uIiBub2RlLiBOb3cKdXAgdG8g
eW91IHRvIGRlY2lkZSB3aGV0aGVyIGJpbm1hbiBzaG91bGQgYWRhcHQgdGhlIG91dHB1dCB0byB0
aGUKY3VycmVudCBzY2hlbWEsIG9yIGlmIHRoZSBjdXJyZW50IHNjaGVtYSBzaG91bGQgYmUgZXh0
ZW5kZWQgdG8KdW5kZXJzdGFuZCBhbGwgYmlubWFuJ3Mgb3V0cHV0LgoKQXQgbGVhc3QgdGhhdCBp
cyBteSB1bmRlcnN0YW5kaW5nIGFuZCBhbHNvIHdoYXQgSSBraW5kIG9mIGFncmVlIHdpdGguCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
