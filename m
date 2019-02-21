Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC5BC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 10:55:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C9E2086A
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 10:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="td8qvEKw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="deAO1y0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C9E2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpqyEZFa06U3TXmj5xMwWhgkVfgPN5l/n0F5b+HetSQ=; b=td8qvEKwE6kr4j
	GMFLrQ6BvTRnbeL1m8FnRF/KvBgZ+hECB86IGJG45mcHdB8brLKjTJwry/SHYli675WP8ou2h0Pjx
	SazHWugz6+X0tmm5G9uGN78TGwfcM7K8ZCu0WXVyDMmL/vsf5+iRebMJjtrrskM0e2IApLUqdjrCk
	MtX2kRzHMKX8eHQrLzppvSuB/kvu3pO+CdNnNGzhifgBgiEJjiTzIp9YqBnyI1jOzxFWH+4jQJjeb
	0qrvfHFQFMxdf7jaJaI6IfXOnFproehhw8cmkVpJUWeLuS/55cJZeah7W6qtmQa0vvK3uWMZ1TZzY
	aixsAkVT94V593ybapzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwm15-0004bp-V4; Thu, 21 Feb 2019 10:55:47 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwm12-0004bN-Di
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 10:55:46 +0000
X-IronPort-AV: E=Sophos;i="5.58,395,1544511600"; d="scan'208";a="27053149"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES128-SHA;
 21 Feb 2019 03:55:11 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Thu, 21 Feb 2019 03:55:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2G3Mjgq6GB/JQOHcI4N7/0FdoX1IBvmbjRqkjzOQRaU=;
 b=deAO1y0TwnNmW/HGz6r+yrOBPbRF3svyncbq207VBhsO66BxkQ+aC5F0oJZmNkmUFlBPw3hAcQVGAXvxMS4M0yls+elddsjgL+9vdAXH24By2Wc/PPecu480DEfutbFvbvfrt/Xi/SKChgEZvCMqtDUTtM8n29fjUiSuP6W8crs=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1524.namprd11.prod.outlook.com (10.172.22.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.15; Thu, 21 Feb 2019 10:55:09 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%9]) with mapi id 15.20.1643.014; Thu, 21 Feb 2019
 10:55:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <linux-mtd@lists.infradead.org>,
 <bbrezillon@kernel.org>, <marek.vasut@gmail.com>
Subject: Re: About protecting and unprotecting in spi-nor
Thread-Topic: About protecting and unprotecting in spi-nor
Thread-Index: AQHUycCeJ7rarK4ePki1+94WWpKPrqXqFEqA
Date: Thu, 21 Feb 2019 10:55:09 +0000
Message-ID: <b19ed7e6-cef2-15d4-e667-cc997235e8f1@microchip.com>
References: <20190221083558.hphqtaflavieau6l@pengutronix.de>
In-Reply-To: <20190221083558.hphqtaflavieau6l@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0045.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::34) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a381e2f-d2c1-45a1-535c-08d697eb0be9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1524; 
x-ms-traffictypediagnostic: BN6PR11MB1524:
x-ms-exchange-purlcount: 2
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIxNTI0OzIzOjVPREZhKzlYNm1HbFRGMTF0dW5XTlJoZXlX?=
 =?utf-8?B?K0NvZ2VqRHROMU1YSWRZdS95YUxveW1ZQUR6REVTbUEvZDNHQjBxbkt5MUNF?=
 =?utf-8?B?NHczcmV3WGFmVXJ0cWd5ckVrL1JpVnJvTkxBSGd4M2xIRG5MSkVvS2h6TmpK?=
 =?utf-8?B?RkpsMTJWTDlDSFFpOHhWVGJVOXZIRERrS3I1VHhHRVNrQlFoVWUwZ1lSWHkv?=
 =?utf-8?B?Q2tWUTV0SmU1dkdjSWJndnlza0ZTQzhzTC9nMllLY1ZUdmQ0dWxQRUJicjlU?=
 =?utf-8?B?ZHZQWTVLS2hqVXdQWjFtZ0R4aGxOVm9sR2RIY3M0T0lodUdGUHZRemJ4SGtD?=
 =?utf-8?B?QkY5cUVtMXQ0ZUtSRUt1RnZjclJ5VTBGaTNkVUl6UlZacHNNV1NyN05SK0Y3?=
 =?utf-8?B?c1NTK0RlOGZsVHVLOE9OeVJ6amU3YmhvNkdIRTB1RjI2UnVTQUJ3cis0QWJS?=
 =?utf-8?B?bGRlL2gwM0RxTFpYRDliMzNNYnhmbUlqK2pTVHYzZ3QvYUxkK3JWWlloOXd3?=
 =?utf-8?B?MS93V095bjRlWnZLZHdSeHNxRXd1aHRJYmdhbzlydElNWDlMUDZHSDBheUNV?=
 =?utf-8?B?ZXRaZitWcENYMURENzltbmlONTJqSllsVTIxUG8xU1padkRUYVlDZ042MytT?=
 =?utf-8?B?V2ZpeHdkd0JZaldxUXBGU0ROcGRGejFxS1Y0azZjRTJGdFRKQ2dLc1ozd09a?=
 =?utf-8?B?SUN0NDZ3bFpWc2FTTzM4SkxoTGVUOXQySlNnWFhtQkZaTlpJT3NaSTZCaHBL?=
 =?utf-8?B?bGtibjN1YnpjV1dUWlcvYW9iRmtRd2ZWWGxiSFZCYnJqSVdIc2hYTkExSHVu?=
 =?utf-8?B?b3RETkwwdlIxSEVQb2xwSGxuM2RMaHZOMUpQQy9iUm5vQ3hKSm53Z1YzT20y?=
 =?utf-8?B?andLbnVQeHllZnUvSlBUd2dNZ1dnSUF5U0p6WmF4WEEwNTZxWG5TdGNTeE85?=
 =?utf-8?B?SUtoNlRyMm1nZk0zeHQvRVg2cXc0TS81cUtxK2lySCtScFh6dWFaR29pUmxH?=
 =?utf-8?B?UjBwdjl4SWVXVWRLK01BTlJzWXVPcDVIQ2lkQ1dGRzVCZlh1Q3lsRlNkRWRy?=
 =?utf-8?B?TGxvcUVON0FhQlhjOW1QeThpL2JMd21VQXFvWS9paHhpZm9mV0VIdytKcGFT?=
 =?utf-8?B?YTZrcmgxYWk2UWxpTW0vSXNseVM5eE9XTUViNXNDQVBjR3VyaVcrVzRpb0VP?=
 =?utf-8?B?RjdQQ28ya0lSUlNaK1RkWXpQOHp0ZVBzVTBJSmtGdGsvZmpMZmJEYUZzdVRK?=
 =?utf-8?B?dkVxNU56Nzk0T2xVbjcxTkZzODZyN0NqNlhRR3d0VXRJMkpqNUo1N0YwNUxU?=
 =?utf-8?B?UVM5WTdhRVpzUHdzb2dUaEJTZkxFL3FuVnY2alRzb0dOZS9EazNSdzl4RHVj?=
 =?utf-8?B?anZiZ0RVZWpmeG9GU3V6NEFSRlJQN3c5dWdldlpaNmpHai82b2ozb2RvM0NS?=
 =?utf-8?B?T0RWV0Rhc3FzZ2JMYi9DSGJ2RzBqZS9aamczakx2Rk9OcGZRRlAzV2NiQXlo?=
 =?utf-8?B?U1JUZU5pSE4wemljT1dWc29LQ3ZaU2wyM0kyUnUwMG9hZ0R1d2lJVkJVQW8w?=
 =?utf-8?B?M0duaWpvZ2V3OVdWdlBEV1NCb1VHS0ZSbEdmQ05JdDd4MytkVHhKL3VVTDdH?=
 =?utf-8?B?akFoV21hUWlIM3FmWlJRcU9vMTQ5eWk1L1RlNWNqZFEyOVZwSWJBT0kxNDFu?=
 =?utf-8?B?ZjhPTE53WC9wdkRxUnBwVWF0aExnRDJZQ2NyNS9IZWNTRURPcGNkMXI4LzI0?=
 =?utf-8?B?YWxVMnhHS1VYUGVDTTkvc3owMDg4UjhUQzlzaXBpMDR5QzBUOVZ5emRqOGU2?=
 =?utf-8?B?ckZkNTU5YjdEYnNsRVcvM09PQ1V3d1JzcFF6NU8wWVF5L2ZTV0c0YUcwS0NG?=
 =?utf-8?Q?nafhWNf3Pubvm4FmcD3T4PyMCW41Ja+i?=
x-microsoft-antispam-prvs: <BN6PR11MB1524C01BECAC011FB9C5712BF07E0@BN6PR11MB1524.namprd11.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(396003)(346002)(39860400002)(366004)(52314003)(189003)(199004)(105586002)(11346002)(305945005)(25786009)(68736007)(7736002)(71190400001)(66066001)(71200400001)(446003)(316002)(476003)(2616005)(97736004)(486006)(76176011)(14444005)(6246003)(256004)(6506007)(53546011)(386003)(110136005)(106356001)(52116002)(14454004)(102836004)(6486002)(31686004)(99286004)(186003)(4326008)(2906002)(5660300002)(72206003)(229853002)(26005)(8936002)(66574012)(86362001)(2501003)(6512007)(478600001)(36756003)(966005)(6306002)(81166006)(8676002)(53936002)(3846002)(6116002)(31696002)(81156014)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1524;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hPNfjkAjpHYdNGRTC4ZNprWKo2yBB7VBILwquQ50eTDqE5U4h5cAnL4tCfnQKcrCG9rKRI525+iWZg1T5sVCdf71vYr/UyIqzCKPlc99Q62y+kXNaWR1HXEoy2kMSYCmXxxEWQPbgOBvcDPna/gBGFtfxL4cAdcN+4RSgaXnpwQYeBC4UPjjm9Ojvfhd01KrVFcX8ebWwSZuGL/wYH+fuV4d+2pX51VN8CM4sMeKIpRbH3Sd85uYhi8/1erqLObFAMLTvNwn9cg6g8gq15Jx+1t3a4RFo7+q9tORHOJVBoNdgTqN3+fbwvOrluYgzhec9d8tdiZ4bBPzrCdTCaJ/Kxt5nDIwr5hjHUL0HrTZdb/ecMunojo23fadzcl7/4fCkIa42Mj4dfukNU/pHi0Y0cE39JIy9QVrirGHo/1drpw=
Content-ID: <06EB784E53A6EA43B63DE59570686FAD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a381e2f-d2c1-45a1-535c-08d697eb0be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 10:55:08.2915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1524
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_025544_625940_B9759271 
X-CRM114-Status: GOOD (  24.77  )
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksDQoNCk9uIDAyLzIxLzIwMTkgMTA6MzUgQU0sIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0K
PiBIZWxsbywNCj4gDQo+IEkgYWxyZWFkeSBtZW50aW9uZWQgdGhlIHRvcGljIG9mIHRoaXMgbWFp
bCBpbiB0aGUgaXJjIGNoYW5uZWwgI210ZCwgYnV0DQo+IEkgdGhpbmsgaXQgaXMgZWFzaWVyIHRv
IGRpc2N1c3MgaXQgaGVyZS4NCj4gDQo+IEluIHRoZSBwYXN0IHNvbWUgZGV2ZWxvcGVycyBhdCBQ
ZW5ndXRyb25peCBub3RpY2VkIHNldmVyYWwgcHJvYmxlbXMgd2l0aA0KPiB0aGUgY29kZSBpbiB0
aGUgc3BpLW5vciBkcml2ZXIgdGhhdCBoYW5kbGVzIHByb3RlY3RpbmcgYmxvY2tzLiBUaGUNCj4g
cmVzdWx0IGlzIHRoYXQgd2UgZWZmZWN0aXZlbHkgZGlzYWJsZWQgYWxsIHRoZSBsb2dpYyBpbXBs
ZW1lbnRlZCBpbg0KPiBzdG1fbG9jaygpIChtYWtpbmcgaXQgYSBub29wKSBhbmQgc3RtX3VubG9j
aygpIChtYWtpbmcgaXQgdW5wcm90ZWN0IHRoZQ0KPiB3aG9sZSBmbGFzaCkuDQo+IA0KPiBUaGUg
cHJvYmxlbXMgSSdtIGF3YXJlIG9mIGFyZToNCj4gDQo+ICAtIFRoZXJlIGFyZSBwYXJ0cyB3aXRo
IHRocmVlIEJQIGJpdHMgYW5kIG90aGVycyB3aXRoIGZvdXIuIFRoZSBjb2RlDQo+ICAgIG9ubHkg
aGFuZGxlcyB0aG9zZSB3aXRoIHRocmVlLg0KDQo0Yml0IGJsb2NrIHByb3RlY3Rpb24gaXQncyBv
biBpdHMgd2F5Og0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10
ZC9saXN0Lz9zZXJpZXM9ODEzNTkNCg0KPiANCj4gIC0gVGhlIHBvc2l0aW9uIG9mIHRoZSBvcHRp
b25hbCBUQiBiaXQgKHRoYXQgc2VsZWN0cyBsb2NraW5nIGZyb20gdGhlDQo+ICAgIGJvdHRvbSB1
cCBpbnN0ZWFkIG9mIGZyb20gdGhlIHRvcCBkb3duKSBkaWZmZXJzIGJldHdlZW4gcGFydHMuIFRo
ZQ0KPiAgICBjb2RlIG9ubHkgYXNzdW1lcyBhIHNpbmdsZSBwb3NpdGlvbi4NCg0Kd2UgY2FuIGV4
dGVuZCB0aGUgc3VwcG9ydA0KDQo+IA0KPiAgLSBGb3Igc29tZSBwYXJ0cyB0aGUgc21hbGxlc3Qg
cHJvdGVjdGlvbiBhcmVhIGlzIDEvMTYgb2YgdGhlIGRldmljZSwNCj4gICAgb3RoZXJzIGhhdmUg
MS82NCBvciAxLzI1Ni4gVGhlIGNvZGUgb25seSBoYW5kbGVzIDEvNjQuDQo+IA0KPiAgLSBUaGUg
QVBJIHRvIGNhbGwgdGhlIGxvY2tpbmcgY29kZSBpcyBtb3JlIGZsZXhpYmxlIHRoYW4gdGhlIGhh
cmR3YXJlDQo+ICAgIGNhcGFiaWxpdGllcy4gU28gd2l0aCB0aGUgQVBJIHlvdSBjYW4gcmVxdWVz
dCBhbiBhcmJpdHJhcmlseQ0KPiAgICBjb250aW51b3VzIHJhbmdlIG9mIGJsb2NrcyB0byBwcm90
ZWN0IChvciB1bnByb3RlY3QpIHdoaWxlIG1vc3QNCj4gICAgaGFyZHdhcmUgY2FuIG9ubHkgd29y
ayBvbiBzb21lIHBvd2VycyBvZiB0d28gc3RhcnRpbmcgZnJvbSB0aGUgYm90dG9tDQo+ICAgIG9y
IGdvaW5nIHVwIHRvIHRoZSB0b3AuIEZvciBib3RoIGxvY2tpbmcgYW5kIHVubG9ja2luZyB0aGUg
YmVoYXZpb3VyDQo+ICAgIHRvIGhhbmRsZSBub24tbWF0Y2hpbmcgcmVxdWVzdHMgaXMgdG8gbm90
IGFmZmVjdCBibG9ja3Mgb3V0IG9mIHRoZQ0KPiAgICByZXF1ZXN0ZWQgcmFuZ2UgYW5kIGluIGRv
dWJ0IGhhbmRsZSBvbmx5IGEgcGFydCBvZiB0aGUgcmVxdWVzdGVkDQo+ICAgIGFyZWEuIFRoZSBw
cm9ibGVtIGFyaXNpbmcgZnJvbSB0aGF0IGlzIHRoYXQgYXNzdW1pbmcgYSBwYXJ0IHRoYXQgY2Fu
DQo+ICAgIGxvY2sgMS82NCBhbmQgYSAxLzMyIGZyb20gdGhlIHRvcCwgdGhlIGZvbGxvd2luZyBj
YW4gaGFwcGVuIHN0YXJ0aW5nDQo+ICAgIGZyb20gYW4gdW5sb2NrZWQgZmxhc2g6DQo+IA0KPiAg
ICAJbG9jayhsYXN0IDEvNjQpIC0+IHN1Y2Nlc3MsIGxhc3QgMS82NCBsb2NrZWQNCj4gCWxvY2so
dGhlIGxhc3QgYnV0IG9uZSAxLzY0KSAtPiBzdWNjZXNzLCBsYXN0IDEvMzIgbG9ja2VkDQo+IAl1
bmxvY2sobGFzdCAxLzY0KSAtPiAtRUlOVkFMDQo+IA0KPiAgICBTbyB1bmxlc3MgeW91IGhhdmUg
c29tZSBkb21haW4gc3BlY2lmaWMga25vd2xlZGdlIHRoZSBvbmx5IGNoYW5jZSB0bw0KPiAgICBy
ZWxpYWJseSB1bmxvY2sgYSBjZXJ0YWluIGFyZWEgaXMgdG8gdW5sb2NrIHRoZSBjb21wbGV0ZSBj
aGlwLiBEaXR0bw0KPiAgICBmb3IgbG9ja2luZy4NCg0KSSdsbCBzdHVkeSB0aGUgcmVzdCBhbmQg
Z2V0IGJhY2sgdG8geW91Lg0KDQo+IA0KPiAgICBJTUhPIHRoZSBhbGdvcml0aG0gbXVzdCBiZSBj
aGFuZ2VkIHRvIGhhdmUgbG9ja2luZyBhcyBpcyBhbmQNCj4gICAgaW1wbGVtZW50IHVubG9ja2lu
ZyBzdWNoIHRoYXQgYWZ0ZXIgdGhlIGNhbGwgdGhlIHJlcXVlc3RlZCByYW5nZSBpcw0KPiAgICB1
bmxvY2tlZCAobWF5YmUgdW5sb2NraW5nIG1vcmUgdGhhbiByZXF1ZXN0ZWQpLiBUaGlzIG1pZ2h0
IHJlc3VsdCBpbg0KPiAgICBvdGhlciBzdXJwcmlzZXMgdGhvdWdoIGlmIHlvdSByZWx5IG9uIGNl
cnRhaW4gYmxvY2tzIGJlaW5nIGxvY2tlZC4NCj4gICAgQnV0IHRoZW4geW91IGFyZSBpbiB0cm91
YmxlIGFscmVhZHkgdG9kYXkuDQo+IA0KPiBJJ2QgbGlrZSB0byBwcm92ZSB0aGUgZmlyc3QgdGhy
ZWUgaXRlbXMgd2l0aCBzb21lIGRhdGEgc2hlZXRzLCBidXQgdGhlDQo+IGluZm9ybWF0aW9uIHdo
aWNoIHBhcnRzIGFyZSBhZmZlY3RlZCBkaWRuJ3QgbWFrZSBpdCBpbnRvIHRoZSByZXNwZWN0aXZl
DQo+IGNvbW1pdCBpbiBvdXIgdHJlZXMsIHNvIEkgY2Fubm90IHByb3ZpZGUgaXQgd2l0aG91dCBz
b21lIHJlc2VhcmNoLiBNYXliZQ0KPiB5b3UgYmVsaWV2ZSBtZSB3aXRob3V0IHRoaXMgcHJvdmUg
b3IgZXZlbiBub3RpY2VkIHRoZSBzYW1lIHByb2JsZW1zPw0KPiANCj4gSW4gbXkgZXllcyBpdCdz
IHF1ZXN0aW9uYWJsZSBpZiByZXBhaXJpbmcgYWxsIHRoYXQgaXMgc2Vuc2libGUgYW5kIEkNCj4g
d29uZGVyIGhvdyB0aGUgcHJvYmxlbXMgc2hvdWxkIGJlIGFkZHJlc3NlZC4gSSB0ZW5kIHRvIHN1
Z2dlc3QgdXNpbmcgdGhlDQo+IGFwcHJvYWNoIHdlIGNob3NlOiBNYWtlIHN0bV9sb2NrKCkgYSBu
b29wIGFuZCBzdG1fdW5sb2NrKCkgdW5wcm90ZWN0IHRoZQ0KPiB3aG9sZSBjaGlwLg0KPiANCg0K
TXkgZmlyc3QgZmVlbGluZyBpcyB0aGF0IHdlIHNob3VsZCBmb2N1cyBvbiBhZGRpbmcgc3VwcG9y
dCBmb3IgdGhlIHVuYXZhaWxhYmxlDQpmZWF0dXJlcyBhbmQgZml4IHRoZSBidWdzIGlmIHByZXNl
bnQuIFdoZW4gYWxsIHdpbGwgYmUgc29sdmVkIHRoZSAibWFrZQ0Kc3RtX2xvY2soKSBhIG5vb3Ag
YW5kIHN0bV91bmxvY2soKSB1bnByb3RlY3QgdGhlIHdob2xlIGNoaXAiIGFwcHJvYWNoIHdpbGwg
YmUNCnJlbW92ZWQgYW55d2F5LCBzbyB3aHkgYWRkaW5nIGNvZGUgdGhhdCB3aWxsIGJlIHJlbW92
ZWQ/DQoNCk1hbnVmYWN0dXJlcnMgdXN1YWxseSBzaGlwIHRoZSBmbGFzaGVzIHVubG9ja2VkIGJ5
IGRlZmF1bHQsIHlvdSBjYW4gdW5zZXQgdGhlDQpTUElfTk9SX0hBU19MT0NLIGZsYWcgaWYgdGhl
IGFjdHVhbCBjb2RlIGRvZXNuJ3QgbWVldCB0aGUgZmxhc2gncyBleHBlY3RhdGlvbnMuDQoNCldl
IGNhbiB0YWtlIGRvd24gdGhlIHByb2JsZW1zIG9uZSBieSBvbmUgYW5kIGlmIHNvbWV0aGluZyBj
YW4gbm90IGJlIHNvbHZlZCBpbiBhDQpnZW5lcmljIHdheSwgd2UgY2FuIGFkZCBhIHBlci1tYW51
ZmFjdHVyZXIgZml4dXAgaG9vayAoY2hlY2sNCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9saW51eC1tdGQvbGlzdC8/c2VyaWVzPTgwMzUzIHRvIG1ha2UgYW4NCmlkZWEgb2Yg
dGhlIGJpZyBwaWN0dXJlKS4NCg0KV2lsbCBnZXQgYmFjayB0byB0aGlzLA0KdGENCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
