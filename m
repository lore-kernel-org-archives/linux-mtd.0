Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F662C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 06:33:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 499A12184E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 06:33:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OIlgWQBN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="H3lk377j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 499A12184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAVWjMGh4iMEaGbrYbram9K/MV91DXiT7VIrs/6PyjM=; b=OIlgWQBNlPGqaE
	n0zxznVQBDhZiKiGd6IAot1qEaotd7omvO8Ik1N1+dtnTI94Yp2hNqLIhVemkAi/grfQzXnXztuKP
	oeczhDx53CY1ShYqcTcTpYDTTK+MIV4jFDet5yWMoqQliaepOX0JWdYFwPqSaEYeaWVGvFVhVlY/c
	kbCLgyDcxQ2qA0idseexsIGLN1RJxt41arUMPHXTXkff/Mwn4gufb3M86DPCxN4IohZRfOpvtMfqa
	eYtIZgEDxHgv16/LR1QHfn9wQTPPLgiZh8lPPn6Ef7OiMueSyixYLxYEgdjQwDxglLasFBlxPGVxb
	FwVsy49QwrJ7k5hZE/eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6UnJ-0007JT-Ss; Wed, 20 Mar 2019 06:33:45 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6UnF-0007J5-LN
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 06:33:44 +0000
X-IronPort-AV: E=Sophos;i="5.60,247,1549954800"; d="scan'208";a="25730326"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 19 Mar 2019 23:33:25 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 19 Mar 2019 23:33:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcQMSuTP4o2/sqJQJOiAGuyo+BkwfyVifAyu75CJUXA=;
 b=H3lk377jSyypziVsByojJI/Z/zCJ5+hFJtP9s5R0GmSmHHo/d88MT9XEKsFDVZvJ4W6wKs8OLQ4E644Ax1DEpBQkP0AyG/BQg91fTY/QHII6skBxUt/lupu4MEh1hlqVFBvozjag25FDmqMiqCXiJOCJ8xDcrXxaJLSdF/sz9TU=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1732.namprd11.prod.outlook.com (10.175.99.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.15; Wed, 20 Mar 2019 06:33:23 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Wed, 20 Mar
 2019 06:33:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <jonas@norrbonn.se>, <Yong.Qin@cypress.com>, <James.Tomasetta@cypress.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Topic: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Index: AQHUuB8ZhXd2N1Mh6EWe4SXNj0Cyz6YE33oAgAAMRYCAAcsCAIAAWT4wgADr6oCAAKGJ4IAKNP4AgAAD8ACAAYb4AA==
Date: Wed, 20 Mar 2019 06:33:22 +0000
Message-ID: <64b52a54-94a0-4b0b-683c-41eb07d5b09a@microchip.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
 <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
 <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
 <6e20b1c1-4eaf-bdcc-aec4-59dcbe2a8a34@microchip.com>
 <BYAPR06MB5893F6DEA9B0965E234983CD8F480@BYAPR06MB5893.namprd06.prod.outlook.com>
 <4ddb8f33-93b1-9aa4-3fdd-c60cfa1d1d7d@microchip.com>
 <BYAPR06MB58937598257ADB18DAF344C38F490@BYAPR06MB5893.namprd06.prod.outlook.com>
 <41859b7a-98ad-fc6d-242e-6e9ab810e038@microchip.com>
 <9fcc328f-ae13-a294-a56c-0b5a6247b26a@norrbonn.se>
In-Reply-To: <9fcc328f-ae13-a294-a56c-0b5a6247b26a@norrbonn.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0070.eurprd09.prod.outlook.com
 (2603:10a6:802:29::14) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da3668e5-21a9-4075-2b24-08d6acfdf306
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1732; 
x-ms-traffictypediagnostic: BN6PR11MB1732:
x-microsoft-antispam-prvs: <BN6PR11MB1732F14FF1334BD4784A1B22F0410@BN6PR11MB1732.namprd11.prod.outlook.com>
x-forefront-prvs: 098291215C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(366004)(346002)(376002)(136003)(13464003)(189003)(199004)(305945005)(102836004)(229853002)(186003)(478600001)(14454004)(14444005)(93886005)(99286004)(7736002)(5660300002)(105586002)(6116002)(86362001)(386003)(36756003)(3846002)(31696002)(52116002)(6506007)(76176011)(31686004)(54906003)(81156014)(106356001)(72206003)(5024004)(446003)(256004)(81166006)(66066001)(110136005)(11346002)(53546011)(2616005)(476003)(316002)(8676002)(486006)(2906002)(6512007)(2501003)(8936002)(6436002)(25786009)(6246003)(97736004)(6486002)(26005)(68736007)(53936002)(4326008)(2201001)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1732;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a/7fDAYUXAehLH2EN3UmIAvo/NAIrjjBCa6VIe2KDmLfK7iNzbs0z4nQ+6xPSEpgLwArpAo68Hh19fpOJsmTcO+RjitBGn/+XZoqnAMRPxZsOfTcapRTU6iIvPLY+Vem1++ZIcQwNhZ9N02nOniY9WP326xs7MMB9sjPrwfPwBSIcZabHE4+Agmsj9GsF5591CHcDXmmeRBW9LO9o6WcL2FLbluA7QyUPF6zqUtSwumVtFLm5VH0X6HLUCxR3CbKsCPddhlJ0d+pv3vqj/pzjJ8Iy2V5lzjcGE93E5DC4sBaukoDFULxRiZbcY0xP/QDhYiyHooAE//ZxEn0nAKQJhS5gzGRMhxAIW2hfEFGyX76D8RS65FNUT10lxYOV9vYJ0YZ0JznPOnM7bVRe4AxVY/4qB2YAMHvcHpJ3InFB8U=
Content-ID: <F148F979B52087418DA566DA6C98C8A2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: da3668e5-21a9-4075-2b24-08d6acfdf306
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2019 06:33:22.8839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1732
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_233341_802983_5C71C1DF 
X-CRM114-Status: GOOD (  19.00  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sm9uYXMsDQoNCk9uIDAzLzE5LzIwMTkgMDk6MTMgQU0sIEpvbmFzIEJvbm4gd3JvdGU6DQo+IA0K
PiBPbiAxOS8wMy8yMDE5IDA3OjU5LCBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6
DQo+PiBKb25hcywgWW9uZywNCj4+DQo+PiBPbiAwMy8xMi8yMDE5IDA5OjI3IFBNLCBZb25nIFFp
biB3cm90ZToNCj4+PiBIaSBUdWRvciwNCj4+Pg0KPj4+IEdvb2QgcXVlc3Rpb24uDQo+Pj4NCj4+
PiBUaGUgV1AjIGZ1bmN0aW9uIGlzIG5vdCBhdmFpbGFibGUgd2hlbiB0aGUgUXVhZCBtb2RlIGlz
IGVuYWJsZWQgKENSWzFdPTEpLiBUaGUgV1AjIGZ1bmN0aW9uIGlzIHJlcGxhY2VkIGJ5IElPMiBm
b3IgaW5wdXQgYW5kIG91dHB1dCBkdXJpbmcgUXVhZCBtb2RlLiBXaXRoIHRoYXQgc2FpZCwgaWYg
Q1JbMV0gaXMgc2V0IHRvIDEgKFF1YWQgbW9kZSBlbmFibGVkKSwgdGhlIHJlZ2lzdGVycyB3aWxs
IG5vdCBiZSBwcm90ZWN0ZWQuDQo+Pj4NCj4+PiBUZWNobmljYWxseSBkZWZhdWx0IFNSV0QgYml0
IGNhbiBiZSBzZXQgYXMgZWl0aGVyIDAgb3IgMS4gSG93ZXZlciwgYXMgbW9zdCBjdXN0b21lcnMg
KGFwcGxpY2F0aW9ucykgZG9uJ3QgdXNlIHRoaXMgZmVhdHVyZSB0byBwcm90ZWN0IHJlZ2lzdGVy
cywgdGhlIGRlZmF1bHQgU1JXRCBiaXQgc2V0IHRvIDAgbWlnaHQgYmUgYSBiZXR0ZXIgY2hvaWNl
LCBhbmQgcmVzZXJ2ZSB0aGUgb3B0aW9uIHRvIGNoYW5nZSB0byAxIGZvciB0aGUgYXBwbGljYXRp
b25zIGRvIG5lZWQgdGhpcyBmZWF0dXJlLg0KPj4NCj4+IEkgdGhpbmsgSSBmb3VuZCB0aGUgcmVh
c29uIHdoeSBTUldEIGJpdCBpcyBjb25maWd1cmFibGUsIGFuZCBkaXNhYmxlZCBieQ0KPj4gZGVm
YXVsdDogPT4gdG8gYWxsb3cgdGhlIGluc3RhbGxhdGlvbiBvZiB0aGUgZmxhc2ggaW4gYSBzeXN0
ZW0gd2l0aCBhIGdyb3VuZGVkDQo+PiBXUCMgcGluIHdoaWxlIHN0aWxsIGVuYWJsaW5nIHdyaXRl
IHRvIHRoZSBCUCBiaXRzLg0KPiANCj4gSSB0aGluayB0aGlzIGlzIGJvZ3VzLsKgIFdoeSB3b3Vs
ZCB5b3UgZ3JvdW5kIHRoZSBTUldEIHBpbj/CoCBUaGF0J3MgYSBkZXNpZ24gZXJyb3IuDQoNCkkn
dmUgdGFsa2VkIHdpdGggTWljcm9jaGlwIGhhcmR3YXJlIHRlYW0sIHdlIGhhdmUgdGhpcyBmZWF0
dXJlIG9uIHNzdDI2IGZsYXNoZXMgdG9vLg0KDQpHcm91bmRpbmcgV1Agd291bGQgbm90IG5lY2Vz
c2FyaWx5IGJlIGEgZGVzaWduIGVycm9yLiBUaGUgaW50ZW50aW9uIGlzIHRoYXQgc29tZQ0KdXNl
cnMgbWlnaHQgY2hvb3NlIHRvIHBvcHVsYXRlIHRoZSBGbGFzaCBjaGlwIG9udG8gdGhlaXIgUENC
LCBwcm9ncmFtIHRoZSBtZW1vcnkNCmluLWNpcmN1aXQsIGFuZCB0aGVuIGxvY2sgZG93biB0aGUg
d3JpdGUgcHJvdGVjdGlvbiB0byB1c2UgdGhlIGNoaXAgbGlrZSBhIFJPTS4NCkdyb3VuZGluZyBX
UCBhbGxvd3MgdGhlbSB0byBkbyB0aGlzLiBTaW5jZSBTUldEIGlzIHNldCB0byAnMCcgZnJvbSB0
aGUgZmFjdG9yeSwNCnNvIHVzZXJzIGNhbiBwcm9ncmFtIHRoZSBtZW1vcnksIHNldCB0aGUgYmxv
Y2sgcHJvdGVjdGlvbiAoQlApIGJpdHMgdG8gcHJvdGVjdA0KdGhlIG1lbW9yeSwgYW5kIHRoZW4g
c2V0IHRoZSBTUldEIGJpdCB0byBlbmFibGUgdGhlIGdyb3VuZGVkIFdQIGlucHV0IGFuZA0KcHJl
dmVudCBjaGFuZ2luZyB0aGUgQlAgYml0cy4NCg0KVGhlIGdyb3VuZGVkIFdQIHBpbiArIFNSV0Qg
Yml0IG1ldGhvZCBpcyBhbiBvbGRlciwgbGVnYWN5IGFwcHJvYWNoIHRvIHRoZQ0KcHJvYmxlbS4g
V2UgZG9uJ3Qga25vdyBob3cgbWFueSB1c2VycyBhY3R1YWxseSBncm91bmQgdGhlIFdQIHBpbiBp
biB0aGlzIG1hbm5lciwNCmJ1dCB0aGVyZSBhcmUgcHJvYmFibHkgc29tZSB1c2VycyBvdXQgdGhl
cmUgd2hvIGRvLg0KDQpDaGVlcnMsDQp0YQ0KDQo+IA0KPiAvSm9uYXMNCj4gDQo+Pg0KPj4gSm9u
YXMsIFlvbmcsIHdoYXQgZG8geW91IHRoaW5rPw0KPj4NCj4+IENoZWVycywNCj4+IHRhDQo+Pg0K
Pj4+DQo+Pj4gVGhhbmtzLA0KPj4+IFlvbmcNCj4+Pg0KPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+Pj4gRnJvbTogVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIDxUdWRvci5BbWJh
cnVzQG1pY3JvY2hpcC5jb20+DQo+Pj4gU2VudDogVHVlc2RheSwgTWFyY2ggMTIsIDIwMTkgNToz
MCBBTQ0KPj4+IFRvOiBZb25nIFFpbiA8WW9uZy5RaW5AY3lwcmVzcy5jb20+OyBqb25hc0Bub3Jy
Ym9ubi5zZTsgSmFtZXMgVG9tYXNldHRhIDxKYW1lcy5Ub21hc2V0dGFAY3lwcmVzcy5jb20+DQo+
Pj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBiYnJlemlsbG9uQGtlcm5lbC5v
cmc7IHJpY2hhcmRAbm9kLmF0OyBtYXJlay52YXN1dEBnbWFpbC5jb207IGNvbXB1dGVyc2ZvcnBl
YWNlQGdtYWlsLmNvbTsgZHdtdzJAaW5mcmFkZWFkLm9yZw0KPj4+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMS8zXSBtdGQ6IHNwaS1ub3I6IGFsd2F5cyByZXNwZWN0IHdyaXRlLXByb3RlY3QgaW5w
dXQNCj4+Pg0KPj4+IEhpLCBZb25nLA0KPj4+DQo+Pj4gVGhhbmsgeW91IGZvciB0aGUgZXhwbGFu
YXRpb24uIFRoZXJlIGFyZSBzdGlsbCBmZXcgdGhpbmdzIHRvIGNsYXJpZnkuDQo+Pj4NCj4+PiBP
biAwMy8xMS8yMDE5IDEwOjE0IFBNLCBZb25nIFFpbiB3cm90ZToNCj4+Pj4gU1JXRCBiaXQgKGFs
b25nIHdpdGggV1AjKSBwcm92aWRlcyBhIHdheSB0byBwcm90ZWN0IFN0YXR1cyBhbmQgQ29uZmln
dXJhdGlvbiBSZWdpc3RlcnMgZnJvbSBiZWVuIG1vZGlmaWVkIHVuaW50ZW5kZWRseSBvciBieSBh
IG1hbGljaW91cyBhY3Rvci4NCj4+Pj4NCj4+Pj4gQnkgZGVmYXVsdCwgU1JXRCBiaXQgaXMgMCwg
d2hpY2ggbWVhbnMgbm8gcHJvdGVjdGlvbiBvbiByZWdpc3RlcnMgYWx0ZXJuYXRpb25zLiBSZWdp
c3RlcnMgY2FuIGJlIG1vZGlmaWVkIGVhc2lseSBieSBXUlIgY29tbWFuZC4gKHRoaXMgaXMgbW9z
dCBvZiB0aGUgYXBwbGljYXRpb24gdXNlIGNhc2VzKS4NCj4+Pj4NCj4+Pj4gSWYgc2V0IFNSV0Qg
Yml0IHRvIDEsIHRoZW4gd2hlbiBXUCMgaXMgZHJpdmVuIGxvdyBkdXJpbmcgV1JSIGNvbW1hbmQs
IFdSUiBjb21tYW5kIHdpbGwgYmUgaWdub3JlZCBhbmQgUmVnaXN0ZXJzIGNhbid0IGJlIG1vZGlm
aWVkLiBUaGlzIHByb3ZpZGVzIGEgd2F5IHRvIHByb3RlY3QgUmVnaXN0ZXJzLCBtZWFud2hpbGUg
c3RpbGwgcmVzZXJ2ZSB0aGUgY2FwYWJpbGl0eSB0byBtb2RpZnkgUmVnaXN0ZXJzIHdoZW4gbmVj
ZXNzYXJ5IGJ5IGRyaXZpbmcgV1AjIHRvIGhpZ2ggZHVyaW5nIFdSUiBjb21tYW5kLg0KPj4+DQo+
Pj4gRG9lcyB0aGUgU1JXRCBiaXQgcHJvdGVjdCB0aGUgU3RhdHVzIGFuZCBDb25maWd1cmF0aW9u
IFJlZ2lzdGVyIGJpdHMgZXZlbiB3aGVuIGluIFF1YWQgTW9kZT8gV1AjIGZ1bmN0aW9uIGlzIG5v
dCBhdmFpbGFibGUgaW4gUXVhZCBtb2RlLiBIb3cgY2FuIG9uZSByZWxlYXNlIHRoaXMgcHJvdGVj
dGlvbiB3aGVuIGluIFF1YWQgTW9kZSBhbmQgU1JXRCBzZXQgdG8gMT8NCj4+Pg0KPj4+IElmIFNS
V0QgYml0IGlzIGlnbm9yZWQgaW4gUXVhZCBNb2RlLCB0aGVuIHdoeSBkaWRuJ3QgQ3lwcmVzcyBl
bmFibGUgU3RhdHVzIGFuZCBDb25maWd1cmF0aW9uIFJlZ2lzdGVyIGJpdHMgcHJvdGVjdGlvbiBi
eSBkZWZhdWx0PyBJLmUuLCByZW1vdmUgU1JXRCBiaXQgZnJvbSBTUjEsIG1ha2UgQklUKDcpIGEg
Tk9QLCBhbmQgY29uc2lkZXIgdGhlIFN0YXR1cyBhbmQgQ29uZmlndXJhdGlvbiBSZWdpc3RlciBi
aXRzIHByb3RlY3Rpb24gZW5hYmxlZCBieSBkZWZhdWx0IHdoZW4gbm90IGluIFF1YWQgTW9kZS4N
Cj4+Pg0KPj4+IENoZWVycywNCj4+PiB0YQ0KPj4+DQo+Pj4gVGhpcyBtZXNzYWdlIGFuZCBhbnkg
YXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGZyb20gQ3lw
cmVzcyBvciBpdHMgc3Vic2lkaWFyaWVzLiBJZiBpdCBoYXMgYmVlbiByZWNlaXZlZCBpbiBlcnJv
ciwgcGxlYXNlIGFkdmlzZSB0aGUgc2VuZGVyIGFuZCBpbW1lZGlhdGVseSBkZWxldGUgdGhpcyBt
ZXNzYWdlLg0KPj4+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
