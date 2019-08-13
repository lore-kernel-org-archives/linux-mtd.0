Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88489C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 10:46:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 591B320673
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 10:46:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UOKjjtsO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="TH70N2j3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 591B320673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wnegn1u0wokVjAECVjRWiqXfJTsXDVgsUpJQsv40SXk=; b=UOKjjtsOljIM1U
	RwFR8qJZdqwjrkx3USYU6W8QIwzZqNOmh/be9ps+t7egzloYdKsOzxnovpNGcYIb3533L1xEw9FH4
	tnrvWLTUSMVHd8FDjxD3ngC82Jca2NYvJj5dPeiKjR+8/EzXIF9UXwDOaTGWtJ+0QjcEgbesO+FIB
	BQc2IWkACFVulrvfRtugRZT4dtpNLS+uAGFXUd4WyApgcpcILXOdLZuNr6u06lrjkjKbREr4ETGu2
	eAs4tgCBtOwpt90lQL0x9GmjoSdR0/yeeb/pCsQs3fVuX96o/SO7/aYrJrPIFZbEpZhGGFnNfORJy
	WVWmzJljASQwBisIGtmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxUJZ-0006ST-VI; Tue, 13 Aug 2019 10:46:05 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxUJV-0006Ql-Mk; Tue, 13 Aug 2019 10:46:03 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: On6+fIMvi3kJoQPknRhYfjbum87PCsFsDGP3A/vy7pQTzsi7s/s7J99FldMfWdNRFefJAJ6cFF
 lFPGuzn4iTA8WslHNiPO3ed2D9DfaX+Q+ORfbZR4xTTJmcsq0/b7qcTaKh8ZyWXm1OAADRX7kB
 KBpNfngbjEpo2p95KFx+uvrpkGbByPgNqLYuD3s9JbvnMLsN1nXcjB82BcRinuHv0mSLElS+cN
 cb9xTiBfGrmG6IyhOA93xwordN2jAikyW3yQhCR8ZJiO9qwK83cEK0cUX740kcRQLum0Spr1Zv
 owE=
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; d="scan'208";a="44909247"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Aug 2019 03:45:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 13 Aug 2019 03:45:42 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 13 Aug 2019 03:45:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZ/8uG6cN/PVpwg8pXkOV/5zbuL7xzgGpMvZRQ5iql5Ou+rE9FVYZHQCFd+dsZmtyLZvMhMJ6pfbeMSzbIVz2sgwYrWaLoaSXiUG6DyigkZZPWIdsLI7zH2bGZmnEWX921Nr5mLLDfdfRfhqkuq2D/hOD1MMmoH80FWnJDegmADCo+1+WD7SPNUgwPQdNG+MoU5Jb9ETleQWUSQILNG+oOUIh0zNkCDy0o+oNN3sDcOrcoakTrd9pAwcI2pHu8gfi7nfTk0KeTjWaajvEMeEr3GnS/LfzBa80JMaXJA36qWD6OkE3w6Gp9EiYsad9Qa7rW/MVFPsck1wJJhM+KulGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VSjHScuYljh6S7Pkj2cXpHtVdsLAoYeyWePcE3pY40=;
 b=ijhdvlHn0Y00LqAYED/F7ooO84QXozflQ13mW5T+1IVjQSKrBojEonoWbZq0XeRLjihOXfHdPs/cu9O3DCoGbj+BtuZI/WoGwMnnH8eqt/DIPxDsPPWTbg+yE3dOWO0/zKemdzElNZZWq4CGoePd83PHVER2Rl0UE+aU8hx5mimKRV4widzI6iT4haRt+1vGFV+5B6Kssi+mWi7r6YI3tBUmuPKeq4XqAZi7qBfFKEV75LTiXFXptKqO0+u0yr+bU4msZA8qECYpeoVK/84TLG0h7408dmdfF/HspLIIHoTh03SrrGMo5FnbE/Y9P6pGPZpeeforkKhm5iQf2lqPmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VSjHScuYljh6S7Pkj2cXpHtVdsLAoYeyWePcE3pY40=;
 b=TH70N2j3Nq/W8wtXagoQ2/5kSTZaM7D/QdGohhCj78uA+PsHd+XVfvByN5aOXgFvUwFOquQRGt6fKqpLt/m/R22ybkRnEEUSE+4WX/jC2MTgOKy+xyhyLvLw+fBI0qvtmkAYpXUe8sVJNqxSRybHl7juPj/Q1eKaAbI/oo5dkSs=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4383.namprd11.prod.outlook.com (52.135.36.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Tue, 13 Aug 2019 10:45:41 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 10:45:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vadivel.muruganx.ramuthevar@linux.intel.com>,
 <linux-mtd@lists.infradead.org>, <linux-mtd-request@lists.infradead.org>
Subject: Re: Regards-cadence-quadspi changes to be submitted as patch to
 upstream
Thread-Topic: Regards-cadence-quadspi changes to be submitted as patch to
 upstream
Thread-Index: AQHVUb5jYDO8KFwaekOLAgXJa5n2vKb45P0A
Date: Tue, 13 Aug 2019 10:45:40 +0000
Message-ID: <49190c04-fda8-2fff-eb6f-6a67435d5205@microchip.com>
References: <mailman.16568.1565684962.19300.linux-mtd@lists.infradead.org>
 <8bbd71ae-6c3a-6801-8902-ec4cab492d88@linux.intel.com>
In-Reply-To: <8bbd71ae-6c3a-6801-8902-ec4cab492d88@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::13) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc8fb26c-3960-4c40-c5c9-08d71fdb628a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4383; 
x-ms-traffictypediagnostic: MN2PR11MB4383:
x-microsoft-antispam-prvs: <MN2PR11MB4383DE454BCE89200870766FF0D20@MN2PR11MB4383.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(366004)(396003)(136003)(199004)(189003)(229853002)(81156014)(31686004)(8676002)(7736002)(305945005)(316002)(8936002)(110136005)(66066001)(81166006)(2501003)(6116002)(3846002)(478600001)(5660300002)(14454004)(76176011)(14444005)(6506007)(25786009)(26005)(4744005)(2906002)(102836004)(53546011)(6512007)(11346002)(6436002)(256004)(36756003)(6486002)(386003)(71190400001)(2201001)(446003)(31696002)(476003)(2616005)(53936002)(66556008)(64756008)(66946007)(71200400001)(66476007)(186003)(486006)(99286004)(66446008)(52116002)(6246003)(86362001)(60100200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4383;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OE4yuBIkcH9ZVviN5nGzp4kjLzLfyhU/eaMtUDkJf68vOwEQM4kCHJA8Ok2iuYYhvSk+rpCegdPn2wD/p/OPlY3zjQLMeU6wXDlpQ92QAhxHU+BsRi+Ing7CcVY2c7LIEZXKNIqDbS3mNg5Z+KRL6h/3LO4LJ8xUAYkNp+3TEWeuGirvIJfe7d+Aqc3A1LLuTL9Swpbt2SV6SakbAD9PyAppdscl/cqYulNIykpvKolo2xNC+/qpwTVDEBYkj4GCR/zSism9h7zWpDvY+P79DnP87QigBtT1Yb29j7u1Zs3W+feBa56NIClCbe9P0+2icbHUt1/y+lzONpprcZ7pxpx5SvNz1LoFF0gHEnu40BEG9ByHKKhGTshA6y4W9kYSSNETauXTlB84VAcPE4+YdENp1re/XqnIZajMc37DJ1k=
x-ms-exchange-transport-forked: True
Content-ID: <7F559D210EFC6C49BBFFC7E266A1FCE7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8fb26c-3960-4c40-c5c9-08d71fdb628a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 10:45:40.9054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zlxR4jTfqhZVJMiRk9uGIvAfZw98KS9iFKVQmUVWU/HPqymJ1w+Bv43emx0zw52CcdXF9TSWX1OzfQ97UBPt9XsVj9zXgtp573ExpeRafYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4383
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_034601_841949_D09AEAE5 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

SGksIFZhdmlkZWwsDQoNCk9uIDA4LzEzLzIwMTkgMDE6MDMgUE0sIFJhbXV0aGV2YXIsIFZhZGl2
ZWwgTXVydWdhblggd3JvdGU6DQo+IEV4dGVybmFsIEUtTWFpbA0KPiANCj4gDQo+IEhpLA0KPiAN
Cj4gwqDCoCBHb29kIE1vcm5pbmcsIEhvcGUgeW91IGFyZSBkb2luZyB3ZWxsISEhDQo+IA0KPiDC
oMKgIEFzIEkgYW0gc2Vla2luZyBoZWxwIGZyb20geW91LCB0byBzdWJtaXQgbXkga2VybmVsIGRy
aXZlciBwYXRjaGVzIHRvIHVwc3RyZWFtDQo+IMKgwqAgY29tbXVuaXR5LCBoYXZlIG1hZGUgY2hh
bmdlcyBpbiAvZHJpdmVycy9tdGQvc3BpLW5vci9jYWRlbmNlLXF1YWRzcGkuYyB0byBtYWtlIGl0
IHdvcmsNCj4gwqDCoCBvbiBvdXIgaW50ZWwgTEdNIFNvQywgaXQgaXMgd29ya2luZyBmaW5lLg0K
PiANCj4gwqDCoCBOb3cgdGhlIGNoYW5nZXMgdG8gYmUgcHVzaGVkIHRvIHVwc3RyZWFtLCBraW5k
bHkgcmVzcG9uZCB0aGUgZm9sbG93aW5nIHF1ZXJpZXMuDQo+IMKgwqAgMS4gc2hhbGwgSSB1c2Ug
dGhlIGxhdGVzdCA1LjMga2VybmVsIHNvdXJjZSBmcm9twqAga2VybmVsLm9yZz8gKG9yKQ0KPiDC
oMKgIDIuSXMgdGhlcmUgbWFpbnRhaW5lcnMgdHJlZT8gaWYgeWVzLCB0aGVuIGNhbiB5b3UgcGxl
YXNlIHByb3ZpZGUgbWUgdGhlIGxpbmsuDQoNClQ6ICAgICAgZ2l0IGdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHNwaS1ub3IvbmV4dA0K
DQpZb3UgY2FuIGNoZWNrIE1BSU5UQUlORVJTIGZpbGUgd2hlbiBpbiBkb3VidC4NCg0KQ2hlZXJz
LA0KdGENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
