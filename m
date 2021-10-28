Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4B0C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 09:28:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0343610CB
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 09:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0343610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJeCKgc5TbEcJK2m0Vng7XQNj+kkhvW4wasEnqCfXps=; b=duI0gPbm3RLEzn
	AoIsdFNf3pPw1ntuH5EjC1pBszbRr44Z3C7DlpWGyD99j1SBTlHyXbKPNzGPZeHfvJ/n9R05HtuBe
	MqlsQGiQuJl8f/JneKiDR+UCpIM3WktwHYsxn/tWfJJ+KsqqQFucWUkfQaEETyBA2Bp7HCz1534vB
	KGGmCsibzba+kxWBl+oAK356VmQjYVS0t2LfSw/HvMFg+wfPDUM/ynHdpJ7QKaBIuvacGcvdWEQvM
	KmYqi7PKFNkaWmuTcocgJLgliPajGex/g7AT89MLgPUR8ijPjyCqV7Y4Cx1Z2MWOTTbDlQoK6PM1h
	EAZ8GYRRQkb2IU+Awzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg1hi-007O87-HZ; Thu, 28 Oct 2021 09:28:10 +0000
Received: from mickerik.phytec.de ([195.145.39.210])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg1he-007O6E-Qc
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 09:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1635413281; x=1638005281;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+zuhO3EDMZpgS2WRXvSyjYKEKAoqRmqu4/Sb5oVb3qA=;
 b=A2WFoQpA2ejeO+bus3wQfy/xcHXwvGZDUWLhq71NxJE3vkvK14bmRhnHWOFSjKkF
 cc0sWzmv2zaLQhvKEpdZyyq6tufLELdfxRN/Pn8MxQI4gh85lAkxd2NCm0CsWwUz
 eutSP6l0ir9SMi9aIHYnf70OiFBbIFusUr2SVYBPP1I=;
X-AuditID: c39127d2-c275470000001d24-7c-617a6d21aab8
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 1A.CF.07460.12D6A716;
 Thu, 28 Oct 2021 11:28:01 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 28 Oct
 2021 11:28:01 +0200
Received: from Berlix.phytec.de ([fe80::6d58:38d4:5df2:e4ad]) by
 berlix.phytec.de ([fe80::6d58:38d4:5df2:e4ad%3]) with mapi id 15.01.2308.014; 
 Thu, 28 Oct 2021 11:28:01 +0200
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
Thread-Index: AQHXv0fgZeaCUwiGl02m7VsJcpCtpKvQPsMAgA5jlgCAAGGdAIAJGCUA
Date: Thu, 28 Oct 2021 09:28:00 +0000
Message-ID: <3c7415036ad62278e144da43198490c3c57d5721.camel@phytec.de>
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
Content-ID: <C4B9DFF29DABD94197F2C76DCF5C1C7D@phytec.de>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsWyRoChVFcxtyrRYM1HCYvVLdMZLRp7rzNa
 7Hi1hdFi4Y8GZovdTcvYLU41trJYHG7fx2rxd/smFgcOj7Uf77N6HFuzmdVj3ppqj02rOtk8
 Ni+p99j4bgeTR/9fgwD2KC6blNSczLLUIn27BK6M+wuOshSc0q/Y1XObpYFxjV4XIyeHhICJ
 xLnr15i7GLk4hASWM0k0d21nBEkICTxilGjdpQ2R2MQosWL6FCaQBJuAi8Tntm9sILaIgKrE
 2wcNTCBFzAIzmCVW/toB1i0sECFxeNcBZoiiSIn+6y/YIWw3iTk3l4LVsAA1//v8AayGFyh+
 +8RsNohtG5kkLn6fD7aBU8Bc4s/O6ywgNqOArERnwzuwK5gFxCU2PfvOCvGDgMSSPeeZIWxR
 iZeP/0HFFSTaejqB6jmA6jUl1u/Sh2i1kDi69yELhK0oMaX7ITvEDYISJ2c+YZnAKD4LyYZZ
 CN2zkHTPQtI9C0n3AkbWVYxCuZnJ2alFmdl6BRmVJanJeimpmxiBMX14ovqlHYx9czwOMTJx
 MB5ilOBgVhLhvTyvPFGINyWxsiq1KD++qDQntfgQozQHi5I47/0epkQhgfTEktTs1NSC1CKY
 LBMHp1QDo9zvwoVTeaYG9j75cpxPbr7qlOyO/+K29X9499e8/2QrkBrg8bO5JW1K7ekbumt2
 35gkGv06eYEK+95lGTzZ7l/9/myuXcio9zvrtihXepTevi0/VjhVSP669vnCSw6Xcn7nqrRT
 dyO7pgab3pF04RL5IC11L1RvwdPv0519ZjBMsuZpWnBTQImlOCPRUIu5qDgRAC/GRorXAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_022807_212495_7616FBDA 
X-CRM114-Status: GOOD (  37.16  )
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
IHdpbGwgYWZmZWN0IGkuTVg3DQoNCkFueSB1cGRhdGVzIHlldD8NCg0KVGhhbmtzLA0KU3RlZmFu
DQoNCj4gDQo+ID4gT3IgZG8gd2UgbmVlZCBhbm90aGVyIG1hY3JvIGZvciBpLk1YIDZVTC9VTEwg
YXMgQ2hyaXN0aWFuIGhhcyBzdWdnZXN0ZWQNCj4gPiBlYXJsaWVyPw0KPiA+IA0KPiA+IFRoYW5r
cywNCj4gPiBTdGVmYW4NCj4gPiANCj4gPiA+ID4gKwkJcmV0ID0gX19ncG1pX2VuYWJsZV9jbGso
dGhpcywgZmFsc2UpOw0KPiA+ID4gPiArCQlpZiAocmV0KQ0KPiA+ID4gPiArCQkJcmV0dXJuIHJl
dDsNCj4gPiA+ID4gKwl9DQo+ID4gPiA+ICANCj4gPiA+ID4gIAljbGtfc2V0X3JhdGUoci0+Y2xv
Y2tbMF0sIGh3LT5jbGtfcmF0ZSk7DQo+ID4gPiA+ICANCj4gPiA+ID4gKwlpZiAoR1BNSV9JU19N
WDZRKHRoaXMpKSB7DQo+ID4gPiA+ICsJCXJldCA9IF9fZ3BtaV9lbmFibGVfY2xrKHRoaXMsIHRy
dWUpOw0KPiA+ID4gPiArCQlpZiAocmV0KQ0KPiA+ID4gPiArCQkJcmV0dXJuIHJldDsNCj4gPiA+
ID4gKwl9DQo+ID4gPiA+ICsNCj4gPiA+ID4gIAl3cml0ZWwoaHctPnRpbWluZzAsIGdwbWlfcmVn
cyArIEhXX0dQTUlfVElNSU5HMCk7DQo+ID4gPiA+ICAJd3JpdGVsKGh3LT50aW1pbmcxLCBncG1p
X3JlZ3MgKyBIV19HUE1JX1RJTUlORzEpOw0KPiA+ID4gPiAgDQo+ID4gPiA+IEBAIC03MzksNiAr
NzUyLDggQEAgc3RhdGljIHZvaWQgZ3BtaV9uZmNfYXBwbHlfdGltaW5ncyhzdHJ1Y3QNCj4gPiA+
ID4gZ3BtaV9uYW5kX2RhdGEgKnRoaXMpDQo+ID4gPiA+ICANCj4gPiA+ID4gIAkvKiBXYWl0IGZv
ciB0aGUgRExMIHRvIHNldHRsZS4gKi8NCj4gPiA+ID4gIAl1ZGVsYXkoZGxsX3dhaXRfdGltZV91
cyk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlyZXR1cm4gMDsNCj4gPiA+ID4gIH0NCj4gPiA+ID4g
IA0KPiA+ID4gPiAgc3RhdGljIGludCBncG1pX3NldHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLCBpbnQgY2hpcG5yLA0KPiA+ID4gPiBAQCAtMjI3MSw3ICsyMjg2LDkgQEAgc3Rh
dGljIGludCBncG1pX25mY19leGVjX29wKHN0cnVjdCBuYW5kX2NoaXANCj4gPiA+ID4gKmNoaXAs
DQo+ID4gPiA+ICAJICovDQo+ID4gPiA+ICAJaWYgKHRoaXMtPmh3Lm11c3RfYXBwbHlfdGltaW5n
cykgew0KPiA+ID4gPiAgCQl0aGlzLT5ody5tdXN0X2FwcGx5X3RpbWluZ3MgPSBmYWxzZTsNCj4g
PiA+ID4gLQkJZ3BtaV9uZmNfYXBwbHlfdGltaW5ncyh0aGlzKTsNCj4gPiA+ID4gKwkJcmV0ID0g
Z3BtaV9uZmNfYXBwbHlfdGltaW5ncyh0aGlzKTsNCj4gPiA+ID4gKwkJaWYgKHJldCkNCj4gPiA+
ID4gKwkJCXJldHVybiByZXQ7DQo+ID4gPiA+ICAJfQ0KPiA+ID4gPiAgDQo+ID4gPiA+ICAJZGV2
X2RiZyh0aGlzLT5kZXYsICIlczogJWQgaW5zdHJ1Y3Rpb25zXG4iLCBfX2Z1bmNfXywgb3AtDQo+
ID4gPiA+ID5uaW5zdHJzKTsNCj4gPiA+ID4gLS0gDQo+ID4gPiA+IDIuMjUuMQ0KPiA+ID4gPiAN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
