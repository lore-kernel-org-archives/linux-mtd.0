Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C15C169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 11:33:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79C6B217D6
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 11:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eFukj6NC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="OeI2P4zV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79C6B217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9kh20zde9rYv1FYqFytE7sUma9TwcZugPaR5Qt0fL0=; b=eFukj6NCa4J4GB
	oMHWIcfH0z+2t/ds/3M4RQRuv4+YLkjh3tA30DddBYZL8d8FYqWR9fZegLnms7Vi40o2zBbGMFZfH
	8mHjnTsz5byv3a9kY0kSvnGqE/4UJuW5liU+QHOWyJW++W6MN5hmRR7Avo/J6z6O81wXfzTLC5MM7
	CwcnA4CHHcdCxcjIWrzgRjykpHZSPiqPKjoXRWHhWGQz+g7R4bMdzmGtdl3dWnvzxaMhO+lqN8V3f
	uUZ0UqyDThK9+tPx9xL4PyLZ12Bt/FKPbeD7BWJf+pNrxTiGsvVhwQQ10h5if+WRGCff+gVbAIaCZ
	6rRwfl+Z32XfzBupF0JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqG1E-0001h0-04; Sun, 03 Feb 2019 11:33:00 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqG18-0001gA-MJ
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 11:32:58 +0000
X-IronPort-AV: E=Sophos;i="5.56,556,1539673200"; d="scan'208";a="23360631"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES128-SHA;
 03 Feb 2019 04:32:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Sun, 3 Feb 2019 04:32:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCnC2NAYvNoPn8h9AWiWa96pZsvaseI4ykUwkmqcXHI=;
 b=OeI2P4zVaKzWyuymq5puSir5ayibXQOGDW+4iK4vEPn65A7OM75x+0x45Nxg+jfQNf0q174z4LEJc66zIoLWrGnu0VRPeqQRYGMNi80DvhRFRukTElaYIO4tDEDt6C8irXL+EGkZPgrrKlhyqqk/haej4E14AOGOC4FMVse+0fI=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1906.namprd11.prod.outlook.com (10.175.100.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.22; Sun, 3 Feb 2019 11:32:43 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Sun, 3 Feb 2019
 11:32:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miyatsu@qq.com>, <avalentin@marcant.net>, <hauke@hauke-m.de>,
 <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>, <richard@nod.at>
Subject: Re: [PATCH] mtd: spi-nor: Add support for mx25u3235f
Thread-Topic: [PATCH] mtd: spi-nor: Add support for mx25u3235f
Thread-Index: AQHUuFH08CHvFjwC+UiPYjx0kU3PP6XN962A
Date: Sun, 3 Feb 2019 11:32:43 +0000
Message-ID: <ac42a4ed-e7ac-2251-c857-870cca1de23e@microchip.com>
References: <20190130041121.109735-1-miyatsu@qq.com>
In-Reply-To: <20190130041121.109735-1-miyatsu@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0202CA0001.eurprd02.prod.outlook.com
 (2603:10a6:803:14::14) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.121.188.150]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1906;
 6:fb48O+fWIps8xaLWZPcewVum/FMogJ+UL6pjTCebFbZLQCn0CilgyK1g0epIh89VeF8s8IhVB8huQVoEktj9OZaJj21ZRh7xrqMrhWumV2hdXwQCe7fCeiXpV0ZgQqo/n5m2WjsXpy/D93xFIudy5M0Q0sLhBRDsiy6zM8paAVUnRoxl/QO8Iccw7KFDW4Z+dGpdo7GhBWDDu/B/VI+f9W5ncRVXQIyTYGQ8qIB/rK4Ercby6Nup+Yx0+bkjf66cwOL83q2DNCOGiGUlhOnMghyUu7NycgEujJ9b4CliHXeUe2Yv5wXs8DkyiVDL5mtkzVgu8ZX6RrBahtZWxOvIjlQDbnD3BrcQZlyBpNh2sfBClnwbNHZvmENP+4H1jtxKVg6PP/3nZI18E4Ke24aKnWr6vmiK4mYIkooF9JHZZMK0OOyKPQa/YbT8JPtV9b4HbC48F+P1vM+NMHHrregU+A==;
 5:/QZ3xKKLVaQcs3j0HB3ptLmTWPrsA/yMROvAfUrsY/8UM7ms688gxaF1ETSUqWQpP2zFQ+2f6cSJE/46Rs7COC6rr213RqBd1prJAXo5CB2rY/3wIyxcTNqMX7rNvq1RBJ0tHHDaQtVPdKKzRhWRCvn8g6DiNZ/LYHer6mXRnzz37uAuirZx5NXBI9apu95II+ou0kVA8+IHFDjVNxzNaw==;
 7:qraoinCVoH1+v85a0rllbDgDM0ayHH6frn6HMPaZ3wOlghpXAmPjDDsl2M8RR/bSSaMd/4x/Thf2Jj3pT7y6NMipRz7OvyCbyfXvEhNhbqWtei3vXBYp9/D3FyIdH98azlna1U3Qi+tCZZbr5yrxtg==
x-ms-office365-filtering-correlation-id: 3ee760f8-e3fa-4b6d-555e-08d689cb4ffe
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1906; 
x-ms-traffictypediagnostic: BN6PR11MB1906:
x-microsoft-antispam-prvs: <BN6PR11MB1906E9D9C88FBA864FD0CAAAF06C0@BN6PR11MB1906.namprd11.prod.outlook.com>
x-forefront-prvs: 0937FB07C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39850400004)(346002)(376002)(136003)(396003)(54534003)(189003)(199004)(71200400001)(71190400001)(52116002)(102836004)(106356001)(53936002)(81166006)(486006)(31686004)(81156014)(2906002)(105586002)(76176011)(14454004)(7736002)(86362001)(8936002)(6436002)(446003)(8676002)(2201001)(11346002)(305945005)(31696002)(68736007)(229853002)(6486002)(39060400002)(186003)(72206003)(97736004)(36756003)(66574012)(66066001)(4326008)(2501003)(6512007)(2616005)(6116002)(476003)(3846002)(6246003)(25786009)(478600001)(316002)(99286004)(256004)(110136005)(6506007)(386003)(26005)(53546011)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1906;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hECl12xUgJqLw78MPAjog/6MmTIk77M3X3+WKuwj4RP4ogj1jGo5wi+C73I8cnbC2r0k1uvEaOZC6n1ef/qitZVMMXyyV1Ynj08laO/bbXTL7GOx0y7PjlE1vhgqKml6GjS3xKGfRPlLguyV6CoKZ14XwfF8cKOP+1PfAu+Eh/bZ0mM1Qit10/lNxMPHq+P2xLIVbL+3BEsEImAMzsINktrLGu37O7U9uvW2v4KqgoMbUs7o8fSZczlNMhEoSM4DGPenmGcqVdkQhW6jMKMhwtYINtPwG+oaSN2jKesNn5FRwJvbe+NmsPPuIoDkWERDayicBc+Qt/LWrqrQdCCwwywy5Fnn+CxQOx1ahsDfjVU+jx1+ry0t+8/IL3ntilYPZMRnq0V8N79DkhL5vbvspB053vhPbgkF/rgOeUMC3g0=
Content-ID: <DE59AB0E3FB27C4DA7DE5C7AC3FC2122@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee760f8-e3fa-4b6d-555e-08d689cb4ffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2019 11:32:41.8566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1906
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_033254_813019_1D4D6A68 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIEJvcmlzLA0KDQpPbiAwMS8zMC8yMDE5IDA2OjExIEFNLCBEaW5nIFRhbyB3cm90ZToNCj4g
RnJvbTogQW5kcsOpIFZhbGVudGluIDxhdmFsZW50aW5AbWFyY2FudC5uZXQ+DQo+IA0KPiBUaGUg
bXgyNXUzMjM1ZiBpcyBmb3VuZCBvbiB0aGUgWnlYRUwgTkJHNjgxNyByb3V0ZXIsIHRoZXJlZm9y
ZQ0KPiBhZGQgZHJpdmVyIHN1cHBvcnQgZm9yIGl0IHNvIHRoYXQgd2UgY2FuIHVwc3RyZWFtIGJv
YXJkIHN1cHBvcnQuDQo+IA0KPiBNaW5pbWFsIHRlc3RlZCB3aXRoIHUtYm9vdCB0b29scyBmd19w
cmludGVudi9md19zZXRlbnYgb24gR2xvYmFsU2NhbGUNCj4gRVNQUkVTU09iaW4gdjUgYm9hcmQu
DQo+IA0KPiBbbWl5YXRzdUBxcS5jb206IFJlbW92ZSB1bm5lY2Vzc2FyeSB3aGl0ZSBzcGFjZS5d
DQoNCldvdWxkIHlvdSBwbGVhc2UgbW92ZSB0aGlzIGxpbmUgYmV0d2VlbiBBbmRyZSdzIFMtby1i
IGFuZCBEaW5nJ3M/DQoNCj4gU2lnbmVkLW9mZi1ieTogQW5kcsOpIFZhbGVudGluIDxhdmFsZW50
aW5AbWFyY2FudC5uZXQ+DQoNCkRpbmcsDQp5b3VyIGNoYW5nZSBzaG91bGQgYmUgaW5kaWNhdGVk
IGJldHdlZW4gdGhlIGxhc3QgU2lnbmVkLW9mZi1ieSBoZWFkZXIgYW5kIHlvdXJzLA0Kc2VlIERv
Y3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0LiBZb3VyIFRlc3RlZC1i
eSB0YWcgY291bGQgaGF2ZQ0KYmVlbiBoZXJlIHRvby4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBEaW5n
IFRhbyA8bWl5YXRzdUBxcS5jb20+DQoNClJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRv
ci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+DQoNCkFuZHJlIGFuZCBIYXVrZSwgd2Ugd2lsbCB0YWtl
IHRoaXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2gsIGJlY2F1c2UgRGluZyBoYXMgd29ya2VkDQpvbiBp
dCB0b28uDQoNCj4gLS0tDQpjaGFuZ2UgbG9nIHdhcyBuaWNlIHRvIGhhdmUgaGVyZS4NCg0KQ2hl
ZXJzLA0KdGENCg0KPiAgZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCAyICsrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9zcGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0K
PiBpbmRleCA2ZTEzYmJkMWFhYTUuLjAxYWMyZTRiYWJhYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGkt
bm9yLmMNCj4gQEAgLTE4MzYsNiArMTgzNiw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hf
aW5mbyBzcGlfbm9yX2lkc1tdID0gew0KPiAgCXsgIm14MjVsMzI1NWUiLCAgSU5GTygweGMyOWUx
NiwgMCwgNjQgKiAxMDI0LCAgNjQsIFNFQ1RfNEspIH0sDQo+ICAJeyAibXgyNWw2NDA1ZCIsICBJ
TkZPKDB4YzIyMDE3LCAwLCA2NCAqIDEwMjQsIDEyOCwgU0VDVF80SykgfSwNCj4gIAl7ICJteDI1
dTIwMzNlIiwgIElORk8oMHhjMjI1MzIsIDAsIDY0ICogMTAyNCwgICA0LCBTRUNUXzRLKSB9LA0K
PiArCXsgIm14MjV1MzIzNWYiLAkgSU5GTygweGMyMjUzNiwgMCwgNjQgKiAxMDI0LCAgNjQsDQo+
ICsJCQkgU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0s
DQo+ICAJeyAibXgyNXU0MDM1IiwgICBJTkZPKDB4YzIyNTMzLCAwLCA2NCAqIDEwMjQsICAgOCwg
U0VDVF80SykgfSwNCj4gIAl7ICJteDI1dTgwMzUiLCAgIElORk8oMHhjMjI1MzQsIDAsIDY0ICog
MTAyNCwgIDE2LCBTRUNUXzRLKSB9LA0KPiAgCXsgIm14MjV1NjQzNWYiLCAgSU5GTygweGMyMjUz
NywgMCwgNjQgKiAxMDI0LCAxMjgsIFNFQ1RfNEspIH0sDQo+IA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
