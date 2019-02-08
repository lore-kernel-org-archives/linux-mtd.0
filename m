Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF304C169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:21:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5EF7218D9
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:21:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VVyHQ7xM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="NcF0lLY7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5EF7218D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3xQ39j0BhmHSUxRH59mDh/EjhwDIZmAF7DnbG965kI=; b=VVyHQ7xMUPWkUU
	5l7aa8mqZUpBSysuI3rFOSXZKCGCVNZO6sRGcT8Hd3rzhF7Ajx94/NN8wQUF4JfuwxKm9SA663nzf
	Mw9YTTmO8BJjftO8eAM4vN2FxbEDDWrTagbcJpMW/42euvSEHy+r8PUN8vw8D9x726wdCXiVLDGJO
	QXkw39jeiJvblXLvaApveXdWr/4fopATTGazaeUPj8VltJl5UP3rgrXKGACjTg9+uGDRfNtM56I86
	Zv7HY95BYcRyZflr/+beQXtKxHoeVuLHN6Y9oVW17h2cItudarEtgfLQQMUc4bU4q+qYnlvJcShmF
	VfhUQyZ44VI6vZsb/mFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs2LE-000446-2A; Fri, 08 Feb 2019 09:21:00 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs2L8-00043d-DH
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 09:20:57 +0000
X-IronPort-AV: E=Sophos;i="5.58,347,1544511600"; d="scan'208";a="26283903"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 08 Feb 2019 02:20:51 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Fri, 8 Feb 2019 02:20:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pMfSDH7stu96XyVSSnkXSv4rrHFEp7qtUSz8vmTWNg=;
 b=NcF0lLY75ogCOPGZn4D2SgsI80CTXQeVHxlMW65OhudP1euLlbwyDSbnZzJUzhsLVImUALvVRKbMs+/Jg1LEfcAWUYD4nfX6wKF+qQFpg4ZxD4jnpQjGDziSLaQWThqfiUUgv+gLXME3IsJ4Ou4sfDA+txfM3LT7m6A89menuU0=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1971.namprd11.prod.outlook.com (10.175.97.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Fri, 8 Feb 2019 09:20:49 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Fri, 8 Feb 2019
 09:20:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <ahmet.celenk@procenne.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH V3] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
Thread-Topic: [PATCH V3] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
Thread-Index: AQHUvqgtqlPrE+cYqECk98UEglsG76XT/aGAgAFjFQCAAEEZAA==
Date: Fri, 8 Feb 2019 09:20:49 +0000
Message-ID: <0e3a7b2e-6a11-5bb4-032a-d9a3e03d5cd7@microchip.com>
References: <1549518234-15211-1-git-send-email-ahmet.celenk@procenne.com>
 <7b33d1ab-835b-781a-b2e9-f271dc493afa@microchip.com>
 <e885888a-7883-3600-8f75-6bafe12607ad@procenne.com>
In-Reply-To: <e885888a-7883-3600-8f75-6bafe12607ad@procenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::11) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1971;
 6:ASWB+V9Q19A9ia1aAP4SDeXrEAGFl0QxDL9qTyEpUidHF6tWZhimc1+8OrsFyBdaNCOYPmBMAsreTbMPUF/YuwXSEw3XNiI+fIN3+FGXcxjc1WX4xVQwzPVmSqFrZ3TKb7LdpwUyN3HzLAYQjAibrBRD/G0sI5t4dgIBOqSTWjnGIUH+Hh+ff7w/V0sRoQFjxxnJp5ADHFZcWKByqg1O07tUHkKtktX2THLbVfuMBXOnMBtMcRiA6gJTU1ganPWIAc3vrt4xvBZKhJGhH7tqnPN67SeejDyP8Hz9iJHnhVZuRLNJCNJKJZUsLYeUVDTp1/vv8eaLONJ53XtPlZFyk4u30ZaCTAXb5hDaFbC12sRzq36PMdV7zlc8nNd3HqM68HI8ApRbLiU8tqxLyNvCG5vkKHUPrLxX6nOBIkx/+06UEUMXv/kqmUH3wC7QzBh6WB0G/X3GJ+q4h22JsafQEg==;
 5:1uxluwfVJeuMoZDX2C95uJQuvJ/HKEbBH0vJNNTCa2DGbMr23Mmgz1MZM9oRKBbzu0WmrbnIEySkYfluZuNlrL26zKJOgo2a/subxMNef1x5zSeCUHLVZY+VzjJ/zyykLN0avTIfTEFDtRPIeGP8j/HZbxq+K84G7E/tg8l73W0IB/1M0BwShF9RfwjpF4P9bmCwKTw5YJNGVXePCONEGw==;
 7:xfM0H5xp8X5kWTjrKHzsikQ8OQQ0GjE0u4PRzxFIeA+9jJoj90IZcjlfnxmGiIF1Oaj5ZXPEGtnfMYkg+LVdCY0iC1NgvNLG18y8mkniL9S925W7XTZiVgNrHMWd9UbRU9ky8+Kxo/0VkN3lrMNH1g==
x-ms-office365-filtering-correlation-id: 9dd832e4-27a5-4827-9b7d-08d68da6b6aa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1971; 
x-ms-traffictypediagnostic: BN6PR11MB1971:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB19717257CB925BAF242C8B7FF0690@BN6PR11MB1971.namprd11.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(39860400002)(366004)(396003)(189003)(199004)(71200400001)(305945005)(68736007)(6506007)(72206003)(2906002)(97736004)(81156014)(386003)(71190400001)(7736002)(26005)(106356001)(14454004)(476003)(81166006)(52116002)(31686004)(8936002)(186003)(102836004)(8676002)(53546011)(105586002)(478600001)(66066001)(76176011)(2501003)(6116002)(99286004)(3846002)(4326008)(6486002)(53936002)(11346002)(6246003)(256004)(54906003)(446003)(25786009)(14444005)(6436002)(6306002)(86362001)(6512007)(31696002)(36756003)(229853002)(316002)(486006)(2616005)(110136005)(138113003)(98903001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1971;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l2b1I9dm37i1fn2zJpuTYRyq1TgoGLGqud9Bn9iad/q8eLCtw/WrOvMQDZ+szYfxSJ5CbWRQdCpK6Oy2Fjs2s1MMcdtO2e3Qb/fgrphPoq7CUC2kJdoDVQC2BHl6x5mPPioaNbMidRljTB1cFMqcNms6SZmi8qjDfv5/niCOrz5kAkKbzGPgnnVfGJ/oZstY+rh5fD7r7mQCPdpCOsGqECoiEdXwbo/MjzX3ToSD92cfqVjG+20+iDewGxKHlGKeHtv+86OgNkW2+hZOMK1MO/25vge0aiBZALWHwKb+e3lPODUeuczIeUMraflXUqJI8XifGjT4qOCYzHHuc+zJrolUVZj+YUIsrzCwilyYhiwbXax584eGERlKPtWKQIAfdzoer4MxA7dvJBcNdqOujrCSlR/6VCch/NppsxjqJLo=
Content-ID: <476AD285C151B54CA7152B9551EF117C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd832e4-27a5-4827-9b7d-08d68da6b6aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 09:20:48.0479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1971
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_012054_534275_63C959C6 
X-CRM114-Status: GOOD (  15.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marek.vasut@gmail.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksDQoNCk9uIDAyLzA4LzIwMTkgMDc6MjcgQU0sIEEuIENlbGVuayB3cm90ZToNCj4gSGkgVHVk
b3IsDQo+IA0KPiBPbiA3LjAyLjIwMTkgMTE6MTYsIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNv
bSB3cm90ZToNCj4+IEhpLCBBaG1ldCwNCj4+DQo+PiBPbiAwMi8wNy8yMDE5IDA3OjQzIEFNLCBB
LiBDZWxlbmsgd3JvdGU6DQo+Pj4gRnJvbTogIkFobWV0IENlbGVuayIgPGFobWV0LmNlbGVua0Bw
cm9jZW5uZS5jb20+DQo+Pj4NCj4+PiBEdWUgdG8gdHdvIGRpZmZlcmVudCB2ZXJzaW9ucyAoUzI1
RkwxMjhTQUdCSEkyMDAgYW5kIFMyNUZMMTI4U0FHQkhJMjEwKSBvZg0KPj4+IHRoZSBzMjVmbDEy
OHMgcXNwaSBtZW1vcnksIHRoZSBzaW5nbGUgInMyNWZsMTI4cyIgZGV2aWNlIGVudHJ5IG11c3Qg
YmUNCj4+PiBzcGxpdCBpbnRvIHR3byB0byBtYXRjaCB0aGUgY29ycmVjdCBKRURFQyBJRCdzIGZv
ciBlYWNoIHZlcnNpb24uIFNvbHZlcw0KPj4+IHBhZ2luZyByZWxhdGVkIGlzc3VlcyBvZiBTMjVG
TDEyOFNBR0JISTIxMCBjaGlwcy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEFobWV0IENlbGVu
ayA8YWhtZXQuY2VsZW5rQHByb2Nlbm5lLmNvbT4NCj4+PiBDYzogQm9yaXMgQnJlemlsbG9uIDxi
b3Jpcy5icmV6aWxsb25AZnJlZS1lbGVjdHJvbnMuY29tPg0KPj4+IENjOiBNYXJlayBWYXN1dCA8
bWFyZWsudmFzdXRAZ21haWwuY29tPg0KPj4+IC0tLQ0KPj4+IFYzOiBBZGRlZCBtaXNzaW5nIFNQ
SV9OT1JfRFVBTF9SRUFEIGZsYWdzIHRvIG5ldyBlbnRyaWVzDQo+Pj4gVjI6IFJlbW92ZWQgdGhl
IG9sZCBzMjVmbDEyOHMgZW50cnkNCj4+Pg0KPj4+IMKgIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3Bp
LW5vci5jIHwgMyArKy0NCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9z
cGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPj4+IGluZGV4IDZlMTNi
YmQuLjNjZDkwNTIgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9y
LmMNCj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPj4+IEBAIC0xODkx
LDcgKzE4OTEsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gc3BpX25vcl9pZHNb
XSA9IHsNCj4+PiDCoMKgwqDCoMKgIHsgInM3MGZsMDFncyIswqAgSU5GTygweDAxMDIyMSwgMHg0
ZDAwLCAyNTYgKiAxMDI0LCAyNTYsIDApIH0sDQo+Pj4gwqDCoMKgwqDCoCB7ICJzMjVzbDEyODAw
IiwgSU5GTygweDAxMjAxOCwgMHgwMzAwLCAyNTYgKiAxMDI0LMKgIDY0LCAwKSB9LA0KPj4+IMKg
wqDCoMKgwqAgeyAiczI1c2wxMjgwMSIsIElORk8oMHgwMTIwMTgsIDB4MDMwMSzCoCA2NCAqIDEw
MjQsIDI1NiwgMCkgfSwNCj4+PiAtwqDCoMKgIHsgInMyNWZsMTI4cyIswqAgSU5GTzYoMHgwMTIw
MTgsIDB4NGQwMTgwLCA2NCAqIDEwMjQsIDI1NiwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9S
X1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LA0KPj4+ICvCoMKgwqAgeyAiczI1ZmwxMjhzMCIsIElO
Rk82KDB4MDEyMDE4LCAweDRkMDA4MCwgMjU2ICogMTAyNCwgNjQsIFNQSV9OT1JfRFVBTF9SRUFE
IHwgU1BJX05PUl9RVUFEX1JFQUQgfCBVU0VfQ0xTUikgfSwNCj4+PiArwqDCoMKgIHsgInMyNWZs
MTI4czEiLCBJTkZPNigweDAxMjAxOCwgMHg0ZDAxODAsIDY0ICogMTAyNCwgMjU2LCBTUElfTk9S
X0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sDQo+PiBUaGUgcGF0
Y2ggaXMgZ29vZCwgdGhlcmUgYXJlIGZldyBuaXRwaWNrcyBob3dldmVyLiBXb3VsZCB5b3UgcGxl
YXNlIGZpeCB0aGVtPw0KPj4NCj4+IFdoZW4gcnVubmluZyBjaGVja3BhdGNoIEkgZ2V0Og0KPj4g
JCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLXN0cmljdA0KPj4gVjMtbXRkLXNwaS1ub3Itc3Bs
aXQtczI1ZmwxMjhzLWludG8tczI1ZmwxMjhzMC1hbmQtczI1ZmwxMjhzMS5wYXRjaA0KPj4gV0FS
TklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMNCj4+ICM0MzogRklMRTogZHJpdmVycy9tdGQv
c3BpLW5vci9zcGktbm9yLmM6MTg5NDoNCj4+ICvCoMKgwqAgeyAiczI1ZmwxMjhzMCIsIElORk82
KDB4MDEyMDE4LCAweDRkMDA4MCwgMjU2ICogMTAyNCwgNjQsIFNQSV9OT1JfRFVBTF9SRUFEIHwN
Cj4+IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sDQo+IFRoZSBzcGktbm9yLmMgZmls
ZSBoYXMgbG90cyBvZiBvdmVyLTgwLWNoYXJhY3RlcnMgbGluZXMsDQoNCnllcywgYnV0IG5vdyBp
dCdzIGEgZ29vZCB0aW1lIHRvIGZpeCB0aGlzIHBhcnRpY3VsYXIgZW50cnkuDQoNCj4+IFdBUk5J
Tkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzDQo+PiAjNDQ6IEZJTEU6IGRyaXZlcnMvbXRkL3Nw
aS1ub3Ivc3BpLW5vci5jOjE4OTU6DQo+PiArwqDCoMKgIHsgInMyNWZsMTI4czEiLCBJTkZPNigw
eDAxMjAxOCwgMHg0ZDAxODAsIDY0ICogMTAyNCwgMjU2LCBTUElfTk9SX0RVQUxfUkVBRCB8DQo+
PiBTUElfTk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LA0KPj4NCj4+IFBsZWFzZSBjaG9vc2Ug
dGhlIGZvbGxvd2luZyBmb3JtYXQsIGl0IGhhcyBmZXdlciBsaW5lczoNCj4+IMKgwqDCoMKgwqDC
oMKgwqAgeyAiczI1ZmwxMjhzMCIsIElORk82KDB4MDEyMDE4LCAweDRkMDA4MCwgMjU2ICogMTAy
NCwgNjQsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LA0K
Pj4gwqDCoMKgwqDCoMKgwqDCoCB7ICJzMjVmbDEyOHMxIiwgSU5GTzYoMHgwMTIwMTgsIDB4NGQw
MTgwLCA2NCAqIDEwMjQsIDI1NiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwg
VVNFX0NMU1IpIH0sDQo+Pg0KPj4gV2hpbGUgaGVyZSwgd291bGQgeW91IHBsZWFzZSBwbGFjZSB0
aGVzZSAyIGVudHJpZXMgaW4gYWxwaGFiZXRpY2FsIG9yZGVyPyBUaGV5DQo+PiBiZWxvbmcganVz
dCBiZWZvcmUgInMyNWZsMjU2czAiIGVudHJ5Lg0KPiBBbHNvIHRoZSByZXN0IG9mIGVudHJpZXMg
c2VlbXMgbm90IHRvIGJlIGluIGFscGhhYmV0aWNhbCBvcmRlci4NCj4+DQo+PiBUaGFua3MhDQo+
PiB0YQ0KPiANCj4gSSBjYW4gaGFuZGxlIHRoZSB3aG9sZSBjb2RlIGZvciA4MCBjb2x1bW4gZml0
dGluZyBhbmQgYWxwaGFiZXRpY2FsIG9yZGVyaW5nIGxhdGVyLg0KDQpJJ20gbm90IGEgZmFuIG9m
IHRoaXMga2luZCBvZiBwYXRjaGVzLCB3ZSB3aWxsIGZpeCB0aGUgcmVzdCB3aGVuIGFkZGluZyBC
b3JpcydzDQpwZXIgbWFudWZhY3R1cmVyIHNwbGl0IHVwIGNvZGUNCihodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL2xpc3QvP3Nlcmllcz04MDM1MykuDQoNCkZv
ciBub3csIHdvdWxkIHlvdSBzdGlsbCBsaWtlIG1lIHRvIGFwcGx5IHlvdSByZXF1ZXN0cz8gQnV0
IGl0IG1heSBsb29rIHdlaXJkIGluDQp0aGUgcmVzdCBvZiB0aGUgY29kZS4NCg0KWWVzLCBwbGVh
c2UuIExldCdzIG1ha2UgdGhlIGNvZGUgY2xlYW5lciB3aGVuIHdlIHRvdWNoIGl0Lg0KDQpDaGVl
cnMsDQp0YQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
