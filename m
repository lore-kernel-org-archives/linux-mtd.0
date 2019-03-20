Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1326FC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:33:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D630D2184D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZhIwmrH0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="bF8Wf5Pc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D630D2184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+OtxA6hiskGZqN9ReUkayypW+TkeN52ae/rBgYNQcI=; b=ZhIwmrH07oDbOB
	tiIuqdtuHUhYRpKCM3d7RlN21wlyzpKE7ClS30cSp/x5GNfP4CxqayPAqAmfAQ02IeCJNELBSWF2R
	JwXOWixCc0JyqlRRDHwednzBAsnAj1NHODdFgWgjN7+4rqdVsRqdGH2dTMWa3N0kvpaD4ySeySbl6
	nN4YSx+9tZ6sdU8huRwJtrg5aKbgexi74W3tCTC0ziDiwneA/5ZQaz175hYo51zi1vw0UGLKGDdil
	AVLXa0/m64k0X1wIr/82/ZX73UqJHtNj0w67pQK8QIfvZK99YZeqofmKPQCAdWt/Z3e3ycBRSHjil
	igyvEmIg/3M2AGz628OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Viy-0005YE-7B; Wed, 20 Mar 2019 07:33:20 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Viu-0005Xp-MB
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 07:33:18 +0000
X-IronPort-AV: E=Sophos;i="5.60,248,1549954800"; d="scan'208";a="26581614"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 20 Mar 2019 00:33:16 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 20 Mar 2019 00:33:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK2XrSGHO1WpPYFNXGOhXkAYGxSXg9iX/KPtrEhCgjg=;
 b=bF8Wf5PcZXKaNORjlTxNAHG8alP6fRWwztWs7FwYzhADfJfvclbwwvsRCb9s7zubeQ+lacAngYghhin9t+gCmgBiUHJkQqykZgNM4F1UH4tG2fP3qeKkO1aPE6lQujQm294XaLsVy3QTUTth3t/404G4N9HaUb+FG1vtvqP3nOU=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1460.namprd11.prod.outlook.com (10.172.21.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.15; Wed, 20 Mar 2019 07:33:09 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Wed, 20 Mar
 2019 07:33:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <jonas@norrbonn.se>, <Yong.Qin@cypress.com>, <James.Tomasetta@cypress.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Topic: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Index: AQHUuB8ZhXd2N1Mh6EWe4SXNj0Cyz6YE33oAgAAMRYCAAcsCAIAAWT4wgADr6oCAAKGJ4IAKNP4AgAAD8ACAAYb4AIAACVgAgAAHWoA=
Date: Wed, 20 Mar 2019 07:33:09 +0000
Message-ID: <5d342253-1ca2-4673-7560-6698cc71696e@microchip.com>
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
 <64b52a54-94a0-4b0b-683c-41eb07d5b09a@microchip.com>
 <37e1a622-1bb9-0104-c35d-8d7b6c6fcd73@norrbonn.se>
In-Reply-To: <37e1a622-1bb9-0104-c35d-8d7b6c6fcd73@norrbonn.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VE1PR08CA0028.eurprd08.prod.outlook.com
 (2603:10a6:803:104::41) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9b5b7d2-258c-49d2-8e7e-08d6ad064cb0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1460; 
x-ms-traffictypediagnostic: BN6PR11MB1460:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB146097BAA88262E7737F1F02F0410@BN6PR11MB1460.namprd11.prod.outlook.com>
x-forefront-prvs: 098291215C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(396003)(346002)(376002)(136003)(199004)(13464003)(189003)(53936002)(476003)(6246003)(2906002)(6116002)(3846002)(71190400001)(71200400001)(6306002)(6512007)(68736007)(105586002)(106356001)(7736002)(305945005)(36756003)(97736004)(66066001)(72206003)(2616005)(478600001)(966005)(2201001)(5024004)(14444005)(256004)(14454004)(31696002)(86362001)(81156014)(8676002)(81166006)(8936002)(5660300002)(25786009)(11346002)(446003)(486006)(76176011)(186003)(6506007)(53546011)(386003)(229853002)(99286004)(316002)(93886005)(26005)(31686004)(6486002)(110136005)(52116002)(102836004)(2501003)(6436002)(54906003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1460;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z/j+4iyEcNfBstCwXgXF/39/iaM7UCXAkPVLJ1MR4Aka2DcTiFpMU4CSp9+jTln2E/Gn63eSTc0wdRfEWg+DwtwFiIDhzdJHYickxY3Zbb5Wy/NWl98nHxhFdmiTtTDJhDj/vAz808XBGOc2CiUJs94puEfFkpSJuwHs6+81f1pk+WPQP4GPLH+//dNWoYxMEG/RI5g5Znp3oTcMN2Okeepev5hwfBwbIMfzn6x56DsNcV/LvdGFoSJhbDPnHpWCoeQa8KT6WY6xMDybco1eXf00Gh1r/cowEVVApXl+GGqVl5JjxUaOvrFwpKxyN6lYZ0S8CLIJH1sjtGLc/ljCJqNJDDJs+wm2/QV3gjaLIRmRgNGwVQ211OE6Gph7dZk6g6WwDjjAO3kOIG7l53qHusHMbhKxcu23WaCuXDsxStg=
Content-ID: <924C8AC66D676544BC05EDE70D3A015D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b5b7d2-258c-49d2-8e7e-08d6ad064cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2019 07:33:09.6479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1460
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_003316_841865_72C82D60 
X-CRM114-Status: GOOD (  23.68  )
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

DQoNCk9uIDAzLzIwLzIwMTkgMDk6MDYgQU0sIEpvbmFzIEJvbm4gd3JvdGU6DQo+IEV4dGVybmFs
IEUtTWFpbA0KPiANCj4gDQo+IA0KPiBPbiAyMC8wMy8yMDE5IDA3OjMzLCBUdWRvci5BbWJhcnVz
QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBKb25hcywNCj4+DQo+PiBPbiAwMy8xOS8yMDE5IDA5
OjEzIEFNLCBKb25hcyBCb25uIHdyb3RlOg0KPj4+DQo+Pj4gT24gMTkvMDMvMjAxOSAwNzo1OSwg
VHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+PiBKb25hcywgWW9uZywNCj4+
Pj4NCj4+Pj4gT24gMDMvMTIvMjAxOSAwOToyNyBQTSwgWW9uZyBRaW4gd3JvdGU6DQo+Pj4+PiBI
aSBUdWRvciwNCj4+Pj4+DQo+Pj4+PiBHb29kIHF1ZXN0aW9uLg0KPj4+Pj4NCj4+Pj4+IFRoZSBX
UCMgZnVuY3Rpb24gaXMgbm90IGF2YWlsYWJsZSB3aGVuIHRoZSBRdWFkIG1vZGUgaXMgZW5hYmxl
ZCAoQ1JbMV09MSkuIFRoZSBXUCMgZnVuY3Rpb24gaXMgcmVwbGFjZWQgYnkgSU8yIGZvciBpbnB1
dCBhbmQgb3V0cHV0IGR1cmluZyBRdWFkIG1vZGUuIFdpdGggdGhhdCBzYWlkLCBpZiBDUlsxXSBp
cyBzZXQgdG8gMSAoUXVhZCBtb2RlIGVuYWJsZWQpLCB0aGUgcmVnaXN0ZXJzIHdpbGwgbm90IGJl
IHByb3RlY3RlZC4NCj4+Pj4+DQo+Pj4+PiBUZWNobmljYWxseSBkZWZhdWx0IFNSV0QgYml0IGNh
biBiZSBzZXQgYXMgZWl0aGVyIDAgb3IgMS4gSG93ZXZlciwgYXMgbW9zdCBjdXN0b21lcnMgKGFw
cGxpY2F0aW9ucykgZG9uJ3QgdXNlIHRoaXMgZmVhdHVyZSB0byBwcm90ZWN0IHJlZ2lzdGVycywg
dGhlIGRlZmF1bHQgU1JXRCBiaXQgc2V0IHRvIDAgbWlnaHQgYmUgYSBiZXR0ZXIgY2hvaWNlLCBh
bmQgcmVzZXJ2ZSB0aGUgb3B0aW9uIHRvIGNoYW5nZSB0byAxIGZvciB0aGUgYXBwbGljYXRpb25z
IGRvIG5lZWQgdGhpcyBmZWF0dXJlLg0KPj4+Pg0KPj4+PiBJIHRoaW5rIEkgZm91bmQgdGhlIHJl
YXNvbiB3aHkgU1JXRCBiaXQgaXMgY29uZmlndXJhYmxlLCBhbmQgZGlzYWJsZWQgYnkNCj4+Pj4g
ZGVmYXVsdDogPT4gdG8gYWxsb3cgdGhlIGluc3RhbGxhdGlvbiBvZiB0aGUgZmxhc2ggaW4gYSBz
eXN0ZW0gd2l0aCBhIGdyb3VuZGVkDQo+Pj4+IFdQIyBwaW4gd2hpbGUgc3RpbGwgZW5hYmxpbmcg
d3JpdGUgdG8gdGhlIEJQIGJpdHMuDQo+Pj4NCj4+PiBJIHRoaW5rIHRoaXMgaXMgYm9ndXMuwqAg
V2h5IHdvdWxkIHlvdSBncm91bmQgdGhlIFNSV0QgcGluP8KgIFRoYXQncyBhIGRlc2lnbiBlcnJv
ci4NCj4+DQo+PiBJJ3ZlIHRhbGtlZCB3aXRoIE1pY3JvY2hpcCBoYXJkd2FyZSB0ZWFtLCB3ZSBo
YXZlIHRoaXMgZmVhdHVyZSBvbiBzc3QyNiBmbGFzaGVzIHRvby4NCj4+DQo+PiBHcm91bmRpbmcg
V1Agd291bGQgbm90IG5lY2Vzc2FyaWx5IGJlIGEgZGVzaWduIGVycm9yLiBUaGUgaW50ZW50aW9u
IGlzIHRoYXQgc29tZQ0KPj4gdXNlcnMgbWlnaHQgY2hvb3NlIHRvIHBvcHVsYXRlIHRoZSBGbGFz
aCBjaGlwIG9udG8gdGhlaXIgUENCLCBwcm9ncmFtIHRoZSBtZW1vcnkNCj4+IGluLWNpcmN1aXQs
IGFuZCB0aGVuIGxvY2sgZG93biB0aGUgd3JpdGUgcHJvdGVjdGlvbiB0byB1c2UgdGhlIGNoaXAg
bGlrZSBhIFJPTS4NCj4+IEdyb3VuZGluZyBXUCBhbGxvd3MgdGhlbSB0byBkbyB0aGlzLiBTaW5j
ZSBTUldEIGlzIHNldCB0byAnMCcgZnJvbSB0aGUgZmFjdG9yeSwNCj4+IHNvIHVzZXJzIGNhbiBw
cm9ncmFtIHRoZSBtZW1vcnksIHNldCB0aGUgYmxvY2sgcHJvdGVjdGlvbiAoQlApIGJpdHMgdG8g
cHJvdGVjdA0KPj4gdGhlIG1lbW9yeSwgYW5kIHRoZW4gc2V0IHRoZSBTUldEIGJpdCB0byBlbmFi
bGUgdGhlIGdyb3VuZGVkIFdQIGlucHV0IGFuZA0KPj4gcHJldmVudCBjaGFuZ2luZyB0aGUgQlAg
Yml0cy4NCj4gDQo+IEFnYWluLCB0aGlzIGlzIGJvZ3VzLsKgIFRoZSBTUldEIGJpdCBpcyBub24t
dm9sYXRpbGUgc28ganVzdCByZXNldHRpbmcgdGhlIGZsYXNoIGNsZWFycyB0aGUgYml0IGFuZCB0
aGUgQlAgYml0cyBjYW4gYmUgY2hhbmdlZC7CoCBUaGlzIGRvZXMgbm90IG1hZ2ljYWxseSB0dXJu
IHRoZSBmbGFzaCBpbnRvIGEgUk9NLsKgIEdyb3VuZGVkIG9yIG5vdCwgdGhlIFdQIyBpcyBOT1Qg
cmVzcGVjdGVkIHVudGlsIHRoZSBTUldEIGJpdCBpcyBzZXQ7IHdoYXQgeW91J3ZlIGRlc2NyaWJl
ZCBpcyB5ZXQgYW5vdGhlciByZWFzb24gdG8gZGVmYXVsdCB0aGUgU1JXRCB0byBzZXQuDQoNClNS
V0QgaXMgYSBub24tdm9sYXRpbGUgYml0OiBkZWZhdWx0IGF0IHBvd2VyLXVwIHdpbGwgYmUgdGhl
IHNldHRpbmcgcHJpb3IgdG8NCnBvd2VyLWRvd24uDQoNCkNoZWVycywNCnRhDQoNCj4gDQo+IFdp
dGggdGhlIEJQTlYgYml0IChzZWUgcGF0Y2ggMyB0aGF0IEkgcG9zdGVkIGluIHRoZSB2MiBzZXJp
ZXMpLCBhdCBsZWFzdCB0aGUgZmxhc2ggY2FuIGJlIG1hZGUgdG8gc3RhcnQgdXAgd3JpdGUtcHJv
dGVjdGVkOyBob3dldmVyLCB0aGVyZSBpcyBub3RoaW5nIHByZXZlbnRpbmcgbW9kaWZpY2F0aW9u
IG9mIHRoZSBQUk9UZWN0aW9uIGJpdHMgdW50aWwgU1JXRCBpcyBzZXQgQU5EIFdQIyBpcyBhc3Nl
cnRlZCAodGhyb3VnaCBncm91bmRpbmcgb3Igb3RoZXJ3aXNlKS7CoCBMaW51eCBjdXJyZW50bHkg
ZGVmYXVsdHMgU1JXRCB0byBjbGVhcmVkIHdoaWNoIGlzICJ1bnByb3RlY3RlZCIsIGlycmVnYXJk
bGVzcyBvZiB0aGUgc3RhdGUgb2YgV1AjLg0KPiANCj4+DQo+PiBUaGUgZ3JvdW5kZWQgV1AgcGlu
ICsgU1JXRCBiaXQgbWV0aG9kIGlzIGFuIG9sZGVyLCBsZWdhY3kgYXBwcm9hY2ggdG8gdGhlDQo+
PiBwcm9ibGVtLiBXZSBkb24ndCBrbm93IGhvdyBtYW55IHVzZXJzIGFjdHVhbGx5IGdyb3VuZCB0
aGUgV1AgcGluIGluIHRoaXMgbWFubmVyLA0KPj4gYnV0IHRoZXJlIGFyZSBwcm9iYWJseSBzb21l
IHVzZXJzIG91dCB0aGVyZSB3aG8gZG8uDQo+IA0KPiBJZiB0aGV5IGRvIHNvLCB0aGV5IGFyZSBm
b29saW5nIHRoZW1zZWx2ZXMuLi4gb3IgdGhleSBhcmUgcnVubmluZyBhIHBhdGNoZWQga2VybmVs
ISA6KQ0KPiANCj4gL0pvbmFzDQo+IA0KPiANCj4gDQo+IA0KPj4NCj4+IENoZWVycywNCj4+IHRh
DQo+Pg0KPj4+DQo+Pj4gL0pvbmFzDQo+Pj4NCj4+Pj4NCj4+Pj4gSm9uYXMsIFlvbmcsIHdoYXQg
ZG8geW91IHRoaW5rPw0KPj4+Pg0KPj4+PiBDaGVlcnMsDQo+Pj4+IHRhDQo+Pj4+DQo+Pj4+Pg0K
Pj4+Pj4gVGhhbmtzLA0KPj4+Pj4gWW9uZw0KPj4+Pj4NCj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+Pj4+PiBGcm9tOiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gPFR1ZG9y
LkFtYmFydXNAbWljcm9jaGlwLmNvbT4NCj4+Pj4+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDEyLCAy
MDE5IDU6MzAgQU0NCj4+Pj4+IFRvOiBZb25nIFFpbiA8WW9uZy5RaW5AY3lwcmVzcy5jb20+OyBq
b25hc0Bub3JyYm9ubi5zZTsgSmFtZXMgVG9tYXNldHRhIDxKYW1lcy5Ub21hc2V0dGFAY3lwcmVz
cy5jb20+DQo+Pj4+PiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGJicmV6aWxs
b25Aa2VybmVsLm9yZzsgcmljaGFyZEBub2QuYXQ7IG1hcmVrLnZhc3V0QGdtYWlsLmNvbTsgY29t
cHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tOyBkd213MkBpbmZyYWRlYWQub3JnDQo+Pj4+PiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyIDEvM10gbXRkOiBzcGktbm9yOiBhbHdheXMgcmVzcGVjdCB3cml0
ZS1wcm90ZWN0IGlucHV0DQo+Pj4+Pg0KPj4+Pj4gSGksIFlvbmcsDQo+Pj4+Pg0KPj4+Pj4gVGhh
bmsgeW91IGZvciB0aGUgZXhwbGFuYXRpb24uIFRoZXJlIGFyZSBzdGlsbCBmZXcgdGhpbmdzIHRv
IGNsYXJpZnkuDQo+Pj4+Pg0KPj4+Pj4gT24gMDMvMTEvMjAxOSAxMDoxNCBQTSwgWW9uZyBRaW4g
d3JvdGU6DQo+Pj4+Pj4gU1JXRCBiaXQgKGFsb25nIHdpdGggV1AjKSBwcm92aWRlcyBhIHdheSB0
byBwcm90ZWN0IFN0YXR1cyBhbmQgQ29uZmlndXJhdGlvbiBSZWdpc3RlcnMgZnJvbSBiZWVuIG1v
ZGlmaWVkIHVuaW50ZW5kZWRseSBvciBieSBhIG1hbGljaW91cyBhY3Rvci4NCj4+Pj4+Pg0KPj4+
Pj4+IEJ5IGRlZmF1bHQsIFNSV0QgYml0IGlzIDAsIHdoaWNoIG1lYW5zIG5vIHByb3RlY3Rpb24g
b24gcmVnaXN0ZXJzIGFsdGVybmF0aW9ucy4gUmVnaXN0ZXJzIGNhbiBiZSBtb2RpZmllZCBlYXNp
bHkgYnkgV1JSIGNvbW1hbmQuICh0aGlzIGlzIG1vc3Qgb2YgdGhlIGFwcGxpY2F0aW9uIHVzZSBj
YXNlcykuDQo+Pj4+Pj4NCj4+Pj4+PiBJZiBzZXQgU1JXRCBiaXQgdG8gMSwgdGhlbiB3aGVuIFdQ
IyBpcyBkcml2ZW4gbG93IGR1cmluZyBXUlIgY29tbWFuZCwgV1JSIGNvbW1hbmQgd2lsbCBiZSBp
Z25vcmVkIGFuZCBSZWdpc3RlcnMgY2FuJ3QgYmUgbW9kaWZpZWQuIFRoaXMgcHJvdmlkZXMgYSB3
YXkgdG8gcHJvdGVjdCBSZWdpc3RlcnMsIG1lYW53aGlsZSBzdGlsbCByZXNlcnZlIHRoZSBjYXBh
YmlsaXR5IHRvIG1vZGlmeSBSZWdpc3RlcnMgd2hlbiBuZWNlc3NhcnkgYnkgZHJpdmluZyBXUCMg
dG8gaGlnaCBkdXJpbmcgV1JSIGNvbW1hbmQuDQo+Pj4+Pg0KPj4+Pj4gRG9lcyB0aGUgU1JXRCBi
aXQgcHJvdGVjdCB0aGUgU3RhdHVzIGFuZCBDb25maWd1cmF0aW9uIFJlZ2lzdGVyIGJpdHMgZXZl
biB3aGVuIGluIFF1YWQgTW9kZT8gV1AjIGZ1bmN0aW9uIGlzIG5vdCBhdmFpbGFibGUgaW4gUXVh
ZCBtb2RlLiBIb3cgY2FuIG9uZSByZWxlYXNlIHRoaXMgcHJvdGVjdGlvbiB3aGVuIGluIFF1YWQg
TW9kZSBhbmQgU1JXRCBzZXQgdG8gMT8NCj4+Pj4+DQo+Pj4+PiBJZiBTUldEIGJpdCBpcyBpZ25v
cmVkIGluIFF1YWQgTW9kZSwgdGhlbiB3aHkgZGlkbid0IEN5cHJlc3MgZW5hYmxlIFN0YXR1cyBh
bmQgQ29uZmlndXJhdGlvbiBSZWdpc3RlciBiaXRzIHByb3RlY3Rpb24gYnkgZGVmYXVsdD8gSS5l
LiwgcmVtb3ZlIFNSV0QgYml0IGZyb20gU1IxLCBtYWtlIEJJVCg3KSBhIE5PUCwgYW5kIGNvbnNp
ZGVyIHRoZSBTdGF0dXMgYW5kIENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIgYml0cyBwcm90ZWN0aW9u
IGVuYWJsZWQgYnkgZGVmYXVsdCB3aGVuIG5vdCBpbiBRdWFkIE1vZGUuDQo+Pj4+Pg0KPj4+Pj4g
Q2hlZXJzLA0KPj4+Pj4gdGENCj4+Pj4+DQo+Pj4+PiBUaGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRh
Y2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gZnJvbSBDeXByZXNz
IG9yIGl0cyBzdWJzaWRpYXJpZXMuIElmIGl0IGhhcyBiZWVuIHJlY2VpdmVkIGluIGVycm9yLCBw
bGVhc2UgYWR2aXNlIHRoZSBzZW5kZXIgYW5kIGltbWVkaWF0ZWx5IGRlbGV0ZSB0aGlzIG1lc3Nh
Z2UuDQo+Pj4+Pg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdA0KPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
