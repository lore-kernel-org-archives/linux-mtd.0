Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439B4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 09:40:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAFFE60F4F
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 09:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAFFE60F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztSjoa71v7Q0pezN35yZQRHYdEuwZ26S6TO06Aiygdo=; b=adz+D/JWVCAGD4
	kaOvXi53sA1Q83H/4+23aT7hWjC6UhWCipJlaYvzd8j5/d4bpNnaAa2tUdeHQUUyVw2hUCBPYeT6x
	h4FvWs37MzYo12r/POcWjEeb82O8NAxHfCWqjg0gG2KIcLA7kg7llXxG52s8kkTZuDZ9BRL2XPtNj
	QukNQqq6eoGd9F7gioIaPzCVbOaFIJBDNEW+G3VvvV734SppXSirCONuI1eqbgDjbdukri+oXcJ4L
	YNiTTbAEqpSAw2dxE1g4ODiGofssgXu20LHyizBDbw+xakKBGFJ2YEyNSTD/PIw90JW7J2Fc7/P6b
	C+Soccl1dFGajs7bZsuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mewRx-00FzA8-4d; Mon, 25 Oct 2021 09:39:25 +0000
Received: from mickerik.phytec.de ([195.145.39.210])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mewRt-00Fz7F-7m
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 09:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1635154756; x=1637746756;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=86wgo+dENMrmOWgTh02SlSZd41Ja4TOuozw8C8udclw=;
 b=GblZgL3YVBrkB+O0Q3BdqZQ3zKCjkOd+49Zw7+1iDYI6YF1Dco/erCvctEa5vVaS
 8ZbO2Q/gwgbjeTrh2VtmDPra7EioorWHRmYdWxUAaRGHsaqQ3HTOddAfigGLrJQ+
 F0TMKGIBRo4WC3t6lguOb2ch07Jln78Wqlht/5kLWZs=;
X-AuditID: c39127d2-c275470000001d24-62-61767b43d007
Received: from florix.phytec.de (florix.phytec.de [172.16.0.118])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id C1.AC.07460.34B76716;
 Mon, 25 Oct 2021 11:39:16 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Florix.phytec.de
 (172.16.0.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 25 Oct
 2021 11:39:15 +0200
Received: from Berlix.phytec.de ([fe80::6d58:38d4:5df2:e4ad]) by
 berlix.phytec.de ([fe80::6d58:38d4:5df2:e4ad%3]) with mapi id 15.01.2308.014; 
 Mon, 25 Oct 2021 11:39:15 +0200
From: =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To: "han.xu@nxp.com" <han.xu@nxp.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "michael@amarulasolutions.com" <michael@amarulasolutions.com>,
 "ceggers@arri.de" <ceggers@arri.de>, "bbrezillon@kernel.org"
 <bbrezillon@kernel.org>, Christian Hemp <C.Hemp@phytec.de>, "gerg@kernel.org"
 <gerg@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 2/2] gpmi-nand: Add ERR007117 protection for
 nfc_apply_timings
Thread-Topic: [RFC PATCH 2/2] gpmi-nand: Add ERR007117 protection for
 nfc_apply_timings
Thread-Index: AQHXv0fgZeaCUwiGl02m7VsJcpCtpKvQPsMAgA5jlgCAAGGdAIAEZEyA
Date: Mon, 25 Oct 2021 09:39:15 +0000
Message-ID: <a14524533eccd185224e1c2ec61895e1dbbf7ff8.camel@phytec.de>
References: <20211011084607.27a840e0@xps13>
 <20211012090224.4101984-1-s.riedmueller@phytec.de>
 <20211012090224.4101984-2-s.riedmueller@phytec.de>
 <20211013050148.2w373kpbfaeuxbwm@umbrella>
 <92d463460324d4501523f8a1da1f07c12fd6490f.camel@phytec.de>
 <20211022143514.lplk6jaxklq3rxry@umbrella>
In-Reply-To: <20211022143514.lplk6jaxklq3rxry@umbrella>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-ID: <CCF36E6A75DFDE469736204955BAE97E@phytec.de>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsWyRoChTNeluizR4ImJxeqW6YwWjb3XGS12
 vNrCaLHwRwOzxe6mZewWpxpbWSwOt+9jtfi7fROLA4fH2o/3WT2OrdnM6jFvTbXHplWdbB6b
 l9R7bHy3g8mj/69BAHsUl01Kak5mWWqRvl0CV8aRg0uZC/7pVxybztnA+ECvi5GDQ0LARKLn
 h2QXIxeHkMByJok7R6czQTiPGCWmnrzCBuFsYpTYt/w0excjJwebgIvE57ZvbCC2iICqxNsH
 DWAdzAIzmCVW/trBCJIQFoiQOLzrADNEUaRE//UX7BC2m0THtA+sIDYLUHPPxz0sIDYvUPzV
 kXesENs2Mklc/D4fbAOngLnEn53XwYoYBWQlOhveMYHYzALiEpuefQcbJCEgILFkz3lmCFtU
 4uXjf1BxBYm2nk4mkD+ZBTQl1u/Sh2i1kFg16S4zhK0oMaX7ITvEDYISJ2c+YZnAKD4LyYZZ
 CN2zkHTPQtI9C0n3AkbWVYxCuZnJ2alFmdl6BRmVJanJeimpmxiB8Xx4ovqlHYx9czwOMTJx
 MB5ilOBgVhLhtflUkijEm5JYWZValB9fVJqTWnyIUZqDRUmc934PU6KQQHpiSWp2ampBahFM
 lomDU6qBcUKAr8qUaStY5U5POcy3sfn1bX8J/XLLWHZe3Q8M2S5NGRvTJ8zjL62bfNwmtzrl
 bgtz8muddXwxujPbPZnnq3bpBTqzzgqcZHhQb7Eye27ZedZ9U6ZULfohd+3MnrkHXupxC3fZ
 R5yScqm/OJVh1RrFXdcC/qbp3lg8f887qZI57Vf/qS69q8RSnJFoqMVcVJwIAH+OHgXVAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_023921_646650_3ADE40CA 
X-CRM114-Status: GOOD (  36.68  )
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

SGkgSGFuLA0KDQpPbiBGcmksIDIwMjEtMTAtMjIgYXQgMDk6MzUgLTA1MDAsIGhhbi54dUBueHAu
Y29tIHdyb3RlOg0KPiBPbiAyMS8xMC8yMiAwODo0NUFNLCBTdGVmYW4gUmllZG3DvGxsZXIgd3Jv
dGU6DQo+ID4gSGkgSGFuLA0KPiA+IA0KPiA+IHNvcnJ5IGl0IHRvb2sgbWUgc29tZSB0aW1lIHRv
IGdldCBiYWNrIHRvIHlvdS4NCj4gPiANCj4gPiBPbiBXZWQsIDIwMjEtMTAtMTMgYXQgMDA6MDEg
LTA1MDAsIEhhbiBYdSB3cm90ZToNCj4gPiA+IE9uIDIxLzEwLzEyIDExOjAyQU0sIFN0ZWZhbiBS
aWVkbXVlbGxlciB3cm90ZToNCj4gPiA+ID4gQWNjb3JkaW5nIHRvIGkuTVggNiBlcnJhdHVtIEVS
UjAwNzExNyBncG1pIGNsb2NrcyBuZWVkIHRvIGJlIGdhdGVkIG9mZg0KPiA+ID4gPiB3aGVuIGRv
aW5nIGEgZ3BtaV9pbyBjbGsgcmF0ZSBjaGFuZ2UuIFNvIGdhdGUgdGhlIGNsb2NrcyBvZmYgYmVm
b3JlDQo+ID4gPiA+IHRoZSByYXRlIGNoYW5nZSBpbiBuZmNfYXBwbHlfdGltaW5ncyBhbmQgdW5n
YXRlIHRoZW0gYWdhaW4gYWZ0ZXIgdGhlDQo+ID4gPiA+IGNoYW5nZS4NCj4gPiA+ID4gDQo+ID4g
PiA+IE90aGVyd2lzZSB0aGlzIHJhdGUgY2hhbmdlIGNhbiBsZWFkIHRvIGFuIHVucmVzcG9uc2l2
ZSBHUE1JIGNvcmUgd2hpY2gNCj4gPiA+ID4gcmVzdWx0cyBpbiBETUEgdGltZW91dHMgYW5kIGZh
aWxlZCBkcml2ZXIgcHJvYmU6DQo+ID4gPiA+IA0KPiA+ID4gPiBbICAgIDQuMDcyMzE4XSBncG1p
LW5hbmQgMTEyMDAwLmdwbWktbmFuZDogRE1BIHRpbWVvdXQsIGxhc3QgRE1BDQo+ID4gPiA+IC4u
Lg0KPiA+ID4gPiBbICAgIDQuMzcwMzU1XSBncG1pLW5hbmQgMTEyMDAwLmdwbWktbmFuZDogQ2hp
cDogMCwgRXJyb3IgLTExMA0KPiA+ID4gPiAuLi4NCj4gPiA+ID4gWyAgICA0LjM3NTk4OF0gZ3Bt
aS1uYW5kIDExMjAwMC5ncG1pLW5hbmQ6IENoaXA6IDAsIEVycm9yIC0yMg0KPiA+ID4gPiBbICAg
IDQuMzgxNTI0XSBncG1pLW5hbmQgMTEyMDAwLmdwbWktbmFuZDogRXJyb3IgaW4gRUNDLWJhc2Vk
IHJlYWQ6DQo+ID4gPiA+IC0yMg0KPiA+ID4gPiBbICAgIDQuMzg3OTg4XSBncG1pLW5hbmQgMTEy
MDAwLmdwbWktbmFuZDogQ2hpcDogMCwgRXJyb3IgLTIyDQo+ID4gPiA+IFsgICAgNC4zOTM1MzVd
IGdwbWktbmFuZCAxMTIwMDAuZ3BtaS1uYW5kOiBDaGlwOiAwLCBFcnJvciAtMjINCj4gPiA+ID4g
Li4uDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gUmllZG11ZWxsZXIg
PHMucmllZG11ZWxsZXJAcGh5dGVjLmRlPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gSGksDQo+ID4g
PiA+IA0KPiA+ID4gPiBJJ20gbm90IHN1cmUgYWJvdXQgdGhlIGVycm9yIGhhbmRsaW5nIGhlcmUs
IGlmIGl0IGlzIGFjdHVhbGx5DQo+ID4gPiA+IG5lY2Nlc3NhcnkuDQo+ID4gPiA+IFNvIHNvbWUg
ZmVlZGJhY2sgd291bGQgYmUgbmljZSBoZXJlLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhhbmtzLA0K
PiA+ID4gPiBTdGVmYW4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMgfCAyMSArKysrKysrKysrKysrKysrKysrLS0NCj4gPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+
ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFu
ZC9ncG1pLW5hbmQuYw0KPiA+ID4gPiBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9n
cG1pLW5hbmQuYw0KPiA+ID4gPiBpbmRleCBhMWY3MDAwZjAzM2UuLjMyNmM4YTg5NWYxZiAxMDA2
NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFu
ZC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5h
bmQuYw0KPiA+ID4gPiBAQCAtNzEzLDE1ICs3MTMsMjggQEAgc3RhdGljIHZvaWQgZ3BtaV9uZmNf
Y29tcHV0ZV90aW1pbmdzKHN0cnVjdA0KPiA+ID4gPiBncG1pX25hbmRfZGF0YSAqdGhpcywNCj4g
PiA+ID4gIAkJCSAgICAgICh1c2VfaGFsZl9wZXJpb2QgPw0KPiA+ID4gPiBCTV9HUE1JX0NUUkwx
X0hBTEZfUEVSSU9EIDoNCj4gPiA+ID4gMCk7DQo+ID4gPiA+ICB9DQo+ID4gPiA+ICANCj4gPiA+
ID4gLXN0YXRpYyB2b2lkIGdwbWlfbmZjX2FwcGx5X3RpbWluZ3Moc3RydWN0IGdwbWlfbmFuZF9k
YXRhICp0aGlzKQ0KPiA+ID4gPiArc3RhdGljIGludCBncG1pX25mY19hcHBseV90aW1pbmdzKHN0
cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcykNCj4gPiA+ID4gIHsNCj4gPiA+ID4gIAlzdHJ1Y3Qg
Z3BtaV9uZmNfaGFyZHdhcmVfdGltaW5nICpodyA9ICZ0aGlzLT5odzsNCj4gPiA+ID4gIAlzdHJ1
Y3QgcmVzb3VyY2VzICpyID0gJnRoaXMtPnJlc291cmNlczsNCj4gPiA+ID4gIAl2b2lkIF9faW9t
ZW0gKmdwbWlfcmVncyA9IHItPmdwbWlfcmVnczsNCj4gPiA+ID4gIAl1bnNpZ25lZCBpbnQgZGxs
X3dhaXRfdGltZV91czsNCj4gPiA+ID4gKwlpbnQgcmV0Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsJ
aWYgKEdQTUlfSVNfTVg2USh0aGlzKSkgew0KPiA+ID4gDQo+ID4gPiBOb3Qgb25seSBmb3IgNlEg
YnV0IGZvciBHUE1JX0lTX01YNg0KPiA+IA0KPiA+IENhbiB5b3UgY29uZmlybSB0aGF0IGkuTVgg
NlNYIGFuZCBpLk1YIDcgYXJlIGFmZmVjdGVkIGJ5IHRoZSBFUlIwMDcxMTcNCj4gPiBlcnJhdHVt
DQo+ID4gYXMgd2VsbD8gQmVjYXVzZSB0aGUgaS5NWCA2VUwvVUxMIGFyZSBpbmNsdWRlZCBieSB0
aGUgR1BNSV9JU19NWDZRDQo+ID4gYWxyZWFkeS4NCj4gDQo+IGkuTVg2U1ggaGFzIHRoZSBnbGl0
Y2ggaXNzdWUgZm9yIHN1cmUsIGJ1dCBJIGNhbiBkb3VibGUgY2hlY2sgaWYgaXQncyBkdWUgdG8N
Cj4gdGhlDQo+IHNhbWUgZXJyYXRhLiBJIHdpbGwgYWxzbyBnbyBjaGVjayBpZiB0aGUgZXJyYXRh
IHdpbGwgYWZmZWN0IGkuTVg3DQoNClRoYW5rcywgdGhhdCdsbCBiZSBncmVhdCENCg0KSSdsbCB3
YWl0IGZvciB5b3VyIHJlc3BvbnNlLg0KDQpUaGFua3MsDQpTdGVmYW4NCg0KPiANCj4gPiBPciBk
byB3ZSBuZWVkIGFub3RoZXIgbWFjcm8gZm9yIGkuTVggNlVML1VMTCBhcyBDaHJpc3RpYW4gaGFz
IHN1Z2dlc3RlZA0KPiA+IGVhcmxpZXI/DQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IFN0ZWZhbg0K
PiA+IA0KPiA+ID4gPiArCQlyZXQgPSBfX2dwbWlfZW5hYmxlX2Nsayh0aGlzLCBmYWxzZSk7DQo+
ID4gPiA+ICsJCWlmIChyZXQpDQo+ID4gPiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ID4gPiArCX0N
Cj4gPiA+ID4gIA0KPiA+ID4gPiAgCWNsa19zZXRfcmF0ZShyLT5jbG9ja1swXSwgaHctPmNsa19y
YXRlKTsNCj4gPiA+ID4gIA0KPiA+ID4gPiArCWlmIChHUE1JX0lTX01YNlEodGhpcykpIHsNCj4g
PiA+ID4gKwkJcmV0ID0gX19ncG1pX2VuYWJsZV9jbGsodGhpcywgdHJ1ZSk7DQo+ID4gPiA+ICsJ
CWlmIChyZXQpDQo+ID4gPiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ID4gPiArCX0NCj4gPiA+ID4g
Kw0KPiA+ID4gPiAgCXdyaXRlbChody0+dGltaW5nMCwgZ3BtaV9yZWdzICsgSFdfR1BNSV9USU1J
TkcwKTsNCj4gPiA+ID4gIAl3cml0ZWwoaHctPnRpbWluZzEsIGdwbWlfcmVncyArIEhXX0dQTUlf
VElNSU5HMSk7DQo+ID4gPiA+ICANCj4gPiA+ID4gQEAgLTczOSw2ICs3NTIsOCBAQCBzdGF0aWMg
dm9pZCBncG1pX25mY19hcHBseV90aW1pbmdzKHN0cnVjdA0KPiA+ID4gPiBncG1pX25hbmRfZGF0
YSAqdGhpcykNCj4gPiA+ID4gIA0KPiA+ID4gPiAgCS8qIFdhaXQgZm9yIHRoZSBETEwgdG8gc2V0
dGxlLiAqLw0KPiA+ID4gPiAgCXVkZWxheShkbGxfd2FpdF90aW1lX3VzKTsNCj4gPiA+ID4gKw0K
PiA+ID4gPiArCXJldHVybiAwOw0KPiA+ID4gPiAgfQ0KPiA+ID4gPiAgDQo+ID4gPiA+ICBzdGF0
aWMgaW50IGdwbWlfc2V0dXBfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBj
aGlwbnIsDQo+ID4gPiA+IEBAIC0yMjcxLDcgKzIyODYsOSBAQCBzdGF0aWMgaW50IGdwbWlfbmZj
X2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcA0KPiA+ID4gPiAqY2hpcCwNCj4gPiA+ID4gIAkgKi8N
Cj4gPiA+ID4gIAlpZiAodGhpcy0+aHcubXVzdF9hcHBseV90aW1pbmdzKSB7DQo+ID4gPiA+ICAJ
CXRoaXMtPmh3Lm11c3RfYXBwbHlfdGltaW5ncyA9IGZhbHNlOw0KPiA+ID4gPiAtCQlncG1pX25m
Y19hcHBseV90aW1pbmdzKHRoaXMpOw0KPiA+ID4gPiArCQlyZXQgPSBncG1pX25mY19hcHBseV90
aW1pbmdzKHRoaXMpOw0KPiA+ID4gPiArCQlpZiAocmV0KQ0KPiA+ID4gPiArCQkJcmV0dXJuIHJl
dDsNCj4gPiA+ID4gIAl9DQo+ID4gPiA+ICANCj4gPiA+ID4gIAlkZXZfZGJnKHRoaXMtPmRldiwg
IiVzOiAlZCBpbnN0cnVjdGlvbnNcbiIsIF9fZnVuY19fLCBvcC0NCj4gPiA+ID4gPm5pbnN0cnMp
Ow0KPiA+ID4gPiAtLSANCj4gPiA+ID4gMi4yNS4xDQo+ID4gPiA+IA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
