Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A06C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 22:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QroPov/XeO89UpxbksceVorQHWfmhoCsqmtMklK/qzk=; b=b0KXh5iWwPqpsE
	OslIEkV05eI4RxhByrIfe/IZaV1Vv8bv95QNRARdIXlzYiaXe/fzzkl4n/Bh+JAOkrBnyBUUxF6JW
	qddzInxd70YiNPJehDaLaP/rYp36YPZEdPxNoOjTE8+MNNP9Zel6inW5TkMW9nZIyaSSCpag0Ur3c
	PDWPa2liSKRr5QhEPbnD+/qYHAzoItSEEffygSKMUMsc4iZJg/4IYl+jguM5NG/EmD7uYk6PpJL9p
	mWEYWcFQOGye4epV87UBFvomhWnEXvao2TQDot5Y2lkt+zyKFXP+ydiksdjkxTHvZq+9aRJPTzT7Q
	wJ1b2nbioBXRC05fYiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6f9M-003RGg-01;
	Tue, 06 Jun 2023 22:27:36 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6f9I-003REo-2b
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 22:27:34 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3342E2C00C1;
	Wed,  7 Jun 2023 10:27:24 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1686090444;
	bh=mYtiWhn9+qW2OOJfS+5udoJkMC4R2+qLLoXTTR2vY0U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aofpsQLslR4YdSjC0DRn97unsf8GwNl1RqVR3MJIQyBA2xmyKbSsQEX2ZTHYTfPMc
	 lCZNm3sQqEyEVVjy4zeUE6J15VjCxalIhENXF1fkI1AlZrdF9fIAF71wXQr/08nJgM
	 Ypvev9G48nHrB4vebwo04ovQ6XQxcs/lBER4tomzBzmJ1XtWUCO7B/vh4HSFLgI57n
	 6AyOZX5UhqidI+BZ9UTr5D6DaVT9cD29tt0s/RNF/nQqAz4GfULckOxCYrf22fMnV+
	 mNYFBirBzDmmllz7lOITLBc9JVyaaXJnEYEWFbCE3f5dr1CQjt6dbpxM98mnaClgKT
	 SlmvVwCQeuQ0g==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B647fb2cc0000>; Wed, 07 Jun 2023 10:27:24 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.26; Wed, 7 Jun 2023 10:27:23 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Wed, 7 Jun 2023 10:27:23 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Wed, 7 Jun 2023 10:27:23 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, "Michael
 Walle" <michael@walle.cc>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Manivannan Sadhasivam
	<mani@kernel.org>
Subject: Re: [PATCH v2 06/17] dt-bindings: mtd: qcom: Prevent NAND chip
 unevaluated properties
Thread-Topic: [PATCH v2 06/17] dt-bindings: mtd: qcom: Prevent NAND chip
 unevaluated properties
Thread-Index: AQHZmJ/A/7DdJqfjnkKBhDDDwtPlhq99kbaA
Date: Tue, 6 Jun 2023 22:27:23 +0000
Message-ID: <6bfc7652-ab2b-3a22-8ef7-7ba421eb4d93@alliedtelesis.co.nz>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-7-miquel.raynal@bootlin.com>
In-Reply-To: <20230606175246.190465-7-miquel.raynal@bootlin.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <B58F5EA73DB6C349A07E95BC029F3139@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=CMhUoijD c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=of4jigFt-DYA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=PZ1Ox8NERQV7nhDSNFUA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_152733_021208_BDA6B0A0 
X-CRM114-Status: GOOD (  17.68  )
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

DQpPbiA3LzA2LzIzIDA1OjUyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOg0KPiBMaXN0IGFsbCB0aGUg
cG9zc2libGUgcHJvcGVydGllcyBpbiB0aGUgTkFORCBjaGlwIGFzIHBlciB0aGUgZXhhbXBsZSBh
bmQNCj4gc2V0IHVuZXZhbHVhdGVkUHJvcGVydGllcyB0byBmYWxzZSBpbiB0aGUgTkFORCBjaGlw
IHNlY3Rpb24uDQo+DQo+IENjOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9y
Zz4NCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4NCj4gLS0tDQo+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9x
Y29tLG5hbmRjLnlhbWwgfCA0ICsrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3Fjb20sbmFuZGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcWNvbSxuYW5kYy55YW1sDQo+IGluZGV4IDcyMTdkOGE2NGQxNC4uNTgxOTczZjQ1MmZmIDEw
MDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20s
bmFuZGMueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3Fjb20sbmFuZGMueWFtbA0KPiBAQCAtMzQsNyArMzQsOSBAQCBwcm9wZXJ0aWVzOg0KPiAgIHBh
dHRlcm5Qcm9wZXJ0aWVzOg0KPiAgICAgIl5uYW5kQFthLWYwLTldJCI6DQo+ICAgICAgIHR5cGU6
IG9iamVjdA0KPiArICAgICRyZWY6IHJhdy1uYW5kLWNoaXAueWFtbA0KPiAgICAgICBwcm9wZXJ0
aWVzOg0KPiArDQo+ICAgICAgICAgbmFuZC1idXMtd2lkdGg6DQo+ICAgICAgICAgICBjb25zdDog
OA0KPiAgIA0KPiBAQCAtNjEsNiArNjMsOCBAQCBwYXR0ZXJuUHJvcGVydGllczoNCj4gICANCj4g
ICAgICAgICAgICAgUmVmZXIgdG8gdGhlIGlwcTgwNjQgZXhhbXBsZSBvbiBob3cgdG8gdXNlIHRo
aXMgc3BlY2lhbCBiaW5kaW5nLg0KPiAgIA0KPiArICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczog
ZmFsc2UNCj4gKw0KPiAgIGFsbE9mOg0KPiAgICAgLSAkcmVmOiAibmFuZC1jb250cm9sbGVyLnlh
bWwjIg0KPiAgIA0KDQpUaGlzIGRvZXNuJ3QgYXBwZWFyIHRvIGJlIHdvcmtpbmcgYXMgaW50ZW5k
ZWQuIElmIEkgYWRkIHRoZSBmb2xsb3dpbmcNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sIA0KYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbA0KaW5kZXggNTgxOTczZjQ1
MmZmLi43YTkxMGE2MmM3YjggMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwNCkBAIC0yMjAsNiArMjIwLDcgQEAgZXhh
bXBsZXM6DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFydGl0aW9uQDAgew0K
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFiZWwgPSAiYm9vdC1u
YW5kIjsNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDww
IDB4NThhMDAwMD47DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9u
c2Vuc2U7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsNCg0KIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhcnRpdGlvbkA1OGEwMDAwIHsNCg0KDQpUaGVuIEkn
ZCBleHBlY3QgdG8gZ2V0IGEgY29tcGxhaW50IGZyb20gYG1ha2UgbXJwcm9wZXI7IG1ha2UgDQpE
VF9DSEVDS0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2sgRFRfU0NIRU1BX0ZJTEVTPXFjb20s
bmFuZGMueWFtbGAgDQpidXQgaXQgc2VlbXMgdG8gbGV0IHRoaXMgdGhyb3VnaC4NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
