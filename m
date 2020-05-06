Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F8DC28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 15:36:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 632D520575
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 15:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pru6V+Gx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="CWHwSIR3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 632D520575
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eru25O1igiv7tnB96DPWhaW97ULOmXPUmiG/qw5DDIg=; b=Pru6V+GxpdlnHK
	Rnr/G24bzQ85Sqk0eNAuomc3CRe27dDIyHMifV/1i6bhouoYzlvmPHj+809Kfj8DCfrG6wFEqbtJU
	Kwgef+z32tH5UK4IrhgiVGii5+Y93vGpytX24WoGn3oe/4EId2/MuFplb/FANPyV6EggmkaHjk7Rx
	sz0UJso+pXhyKdlBHEavAjwHTpb56vpmYDkiicz4y5I0P5PNNNfZJBz/t8jt6W5zYB7Hmas+CF0US
	0TFBkqoWqEAD1fOnhs1biZh6MFdNQJl3tvBKWKCEj62YalSxmW95BWZbN8xmQwSkSxLN6dZbDYxEZ
	9pRs4lYmp9SeTXbchfjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWM61-0001oV-CB; Wed, 06 May 2020 15:36:29 +0000
Received: from mail-mw2nam12on2051.outbound.protection.outlook.com
 ([40.107.244.51] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWM5w-0001nm-RH
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 15:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOLoJgZRh3YBZ3zlNf1/+THK0M3+LC+tcv+A0VdgD6CNT9OJWME32doxYTc/JTlRoNBqrBvVlC61ALkLkGyNahG0Q1A49ycSjyaNxOqh3+wZOhAvhHlH6XNUiigu/WjYGPXmcvzutewdADn5smvHcHUtwSI6XVja8Tpjkr47uT2ssNoYbG3S7Kb1L+vJy6b5pirNB6DXAoGRGwOYcCnWqKvQvlyoF/SuJ5znpa9nIDTYj4IKEDWl2J0m4TOzm+mpcYssdZaD2Bn48Fgs+IQjyVYD1JhiPpThBEydU4UXLWtwTGqZPyxFuBjYuqGKr3ky4o76JMeHuhRMBwLAhqBJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjsEsviVMUns76QuvllxufAyOsdPh3ZrUOckGvxwZrM=;
 b=ev2VSUWuLunr7U7DXh5YCB3N8Qz05GamiN74I3/Yv6PYa6gNR8NSsXDcnXURZi5r1rliKZ2V3CfAmd6wIvinlW/vjfou7csVXYRh5KIZW2qcievTIw37PANtWQmbXOEStJzcsnUmMzB2i/bYxDFzTcwdLTgL0ppFlkI7u2n0Yss51pDVoEZULQKbp7+08531+YVnTXV1FuSWS9SYliZl/4m8eGoXUPOSb383Dj4UbyETHlgGvOCTj2DTzpyiYjwCKPpkKxfG++VVsKBNI1ab4YKO9vPzww7QcupHs8+cGLMeiMri6Fg3yIU8yVJVl+fWbhsqjeL+suBEToUWo1kfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjsEsviVMUns76QuvllxufAyOsdPh3ZrUOckGvxwZrM=;
 b=CWHwSIR3lPVRcuXT54OJ08XCzDTyDD6Q0atcsgNL3GUax7zx1WV0gRjqKaUryNTDOZZ+9lH2d0W1USQe1aJZ5e+9Q0Wtw19z7K+S/QQIUbgKV+tG0ZYUcPew8eCf2HjPWIPDcCB2YT12Zaaltixgup5v0MgiGpEd51Eqr9nWI+o=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (2603:10b6:408:35::23)
 by BN7PR08MB4755.namprd08.prod.outlook.com (2603:10b6:408:22::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Wed, 6 May
 2020 15:36:21 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c%4]) with mapi id 15.20.2958.033; Wed, 6 May 2020
 15:36:21 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: RE: [EXT] Re: [RFC PATCH 0/3] Fix proposal for the Micron shallow
 erase issue
Thread-Topic: [EXT] Re: [RFC PATCH 0/3] Fix proposal for the Micron shallow
 erase issue
Thread-Index: AQHVwZw7boiSZwlyIUywMobHbQb1lqfp8jmAgADB5ICAALu0AIAABEiAgKuE3xeAAVGIwIAADZ4AgAOWJQA=
Date: Wed, 6 May 2020 15:36:21 +0000
Message-ID: <BN7PR08MB5684BF2C51143B741A37A73BDBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20191231192656.16376-1-miquel.raynal@bootlin.com>
 <a2199251-882a-5067-fe4c-47f1c8a252fe@gmail.com>
 <20200114101219.4b951dfe@xps13>
 <8fac8e86-3455-271d-2fcb-c2a6070e8127@cumminsallison.com>
 <20200115085806.218b6b32@collabora.com>	<20200115091325.667c06a8@xps13>
 <c2bf2161-7122-4d59-3e51-57db27654685@cumminsallison.com>
 <20200503132913.40b739a3@xps13>
 <BN7PR08MB568404414BA497C387EB913BDBA60@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200504102612.5ba87dfc@xps13>
In-Reply-To: <20200504102612.5ba87dfc@xps13>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTUzNTE0YWFiLThmYWYtMTFlYS04Yjk2LWRjNzE5NjFmOWRkM1xhbWUtdGVzdFw1MzUxNGFhZC04ZmFmLTExZWEtOGI5Ni1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjE4MTgiIHQ9IjEzMjMzMjUyOTc3ODQ0MjMwMSIgaD0iMEU3RjlpVXR6Zkh1UHJLbVFacDQrVXlwU3pJPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSEFBQUFBOVFLd1Z2Q1BXQVFBNGRBamhBZmRSQURoMENPRUI5MUVBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQkFBQUFmM09FS1FBQUFBQUFBQUFBQUFBQUFBPT0iLz48L21ldGE+
x-dg-rorf: true
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=micron.com;
x-originating-ip: [165.225.81.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8ee3918-2451-42c9-afb3-08d7f1d33a49
x-ms-traffictypediagnostic: BN7PR08MB4755:|BN7PR08MB4755:|BN7PR08MB4755:|BN7PR08MB4755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR08MB4755C8AEBEEFB1DF61570235DBA40@BN7PR08MB4755.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zUedbaQVjAl6GpyCGwxYhAzYylQuWPoMVrFBo3QJp6PxWwsO9lq41wgFSsANkZYDKfOUV5IblyurvlbypCDWZ3ro7O/szEhhtw7kmYqgsz2+3+Un8HZ1ScUow7WKi/q/cfHkvGYLXt6NUejXYxiQ3YCzL1kV0rMHHPAqj4ltJ61E0lgyXnkv9YhZOypRSUsaTR19OsGDt7ewf26vFqwEY2jRnPVujSOl4ChseCl6iqaXjUuYfS9a0gmmOfcp7of6gP5ljjkUu0aVxjIJvuweWFMSkc02S1G0PbP8x8dffbbpIfR5lEIWc6g0HGX9yKJjcPWgA7JenlTbNE3YiRt1HPAdcONouIQgavLg/PvcQrQUw/2CihdFLaiwbRG+E5bWxWX78/860iOxY1JZICTH0rAneTtxgd4tE4rNobbGjiAdgHeSOW5yzSNTKqyDHNFjX+6W0kQm51mQJ+9nx2Rd6zDpXtfnBRS4zDDSmsM35FCcXhDn/YE2XRkXeNkKn4r9817e28oPeJfk45LN0KZz/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR08MB5684.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(33430700001)(5660300002)(33656002)(8676002)(8936002)(71200400001)(26005)(2906002)(55016002)(4326008)(66574014)(55236004)(86362001)(33440700001)(9686003)(186003)(6506007)(66556008)(316002)(7416002)(76116006)(64756008)(66946007)(66476007)(66446008)(6916009)(54906003)(52536014)(478600001)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: BsJlqVo3c6W+N98D+XWm3KECaEBq+YBxbxncNHLZAcXp5kbDfS7KA/PEFhuxtA/ziL60UE/g5xw7DGXkFpMJB+JdfG6YKcI1/urFMK8Ufw2xrF0tNu+mMVx6tL+aJO20jtQ6JRSKjPpc7JPtA4Y6z5d81GMRBAFlkQ49F8BOps2YnesGqLY2IpS+gA5svx0CNoCuB5ESGhgtgdAoUppAFYAG7mfZCGCfzmLYIkuwM2z2TO/Axc1Z4T789gRoZzVvsilmzsuo1IiOagAXE/UMmpvZZoTm0z24LJsRrmFxe/Tu6f4lFuznyqZImmqT+I8PvLck5dwKLw3LA9IbvpoiQ3kR4k4JdI0oLeCS2dNP+eTUtbP8rE1+X7TG1CHuJk6Ern/OuB/L1eUOgvvXaAO/C+7JoI/biJegTWpFJoTDykBShoB2dLukfn9JJPMM8GU4rcEwflu0hbZP3O3IsjsXPWluNH+UAC7frZIlruW35eHhyFeYxgHNAEtve3pXtgL7pUN/ChEoYQqkkgq/V/AS0c5SsVVl9k8gZYjCgTkG9ESEcnBQKaotLY8aCs/ClbaHP+L0V/gZkzg7rA8VIxno2BsmZZSZN8jUvoGW7fBJ/txHn/+IeLs9jLvqEdWSYHwlJGiBK+FwCRU3K3mUjjBundOh0yuMlDGyhBCsdqbKATegVqyPeUC0gEFTy+S/5QcCe9UgOL7s7DNDTbccOltGvCuwVtGEnA3SK+NI5KCN/y7i/f74pANfoDxTj7YizcUEC4GyWUIc0xXIz4ULc/Acla1TVcOdEzPOutsF6Q1wfIQ=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ee3918-2451-42c9-afb3-08d7f1d33a49
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 15:36:21.2946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AFlZ0PsRYDZlynHZxNdl7IQqXaPYLj2XdotGf2MgHLO+qjYjK7gBefdoZwOdyzFCf2SKbZ1eG907ECgl/yEh+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4755
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_083625_140379_7FEA013E 
X-CRM114-Status: GOOD (  15.77  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 Richard Weinberger <richard@nod.at>, Steve deRosier <derosier@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "Wojtaszczyk,
 Piotr" <WojtaszczykP@cumminsallison.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

XSBGaXggcHJvcG9zYWwgZm9yIHRoZSBNaWNyb24gc2hhbGxvdw0KPiBlcmFzZSBpc3N1ZQ0KPiAN
Cj4gSGkgQmVhbiwNCj4gDQo+ICJCZWFuIEh1byAoYmVhbmh1bykiIDxiZWFuaHVvQG1pY3Jvbi5j
b20+IHdyb3RlIG9uIE1vbiwgNCBNYXkgMjAyMA0KPiAwODowODozNCArMDAwMDoNCj4gDQo+ID4g
Pg0KPiA+ID4gU28gdGhlIHF1ZXN0aW9ucyBhcmU6DQo+ID4gPg0KPiA+ID4gMS8gV2hhdCBzaG91
bGQgd2Ugd3JpdGUgZXhhY3RseToNCj4gPiA+ICAgICAtPiB0aGUgbWFpbiBhcmVhDQo+ID4gPiAg
ICAgLT4gdGhlIE9PQiBhcmVhDQo+ID4gPiAgICAgLT4gYm90aA0KPiA+ID4gICAgPw0KPiA+DQo+
ID4gVGhlIE1haW4gYXJlYSBpcyBvay4NCj4gPg0KPiA+ID4NCj4gPiA+IDIvIFNoYWxsIHdlIHBy
ZWZlciB3cml0aW5nIDggZXZlbi9vZGQgcGFnZXMgc3RhcnRpbmcgZnJvbToNCj4gPiA+ICAgICAt
PiB0aGUgYmVnaW5uaW5nIG9mIHRoZQ0KPiA+ID4gICAgIC0+IHRoZSBtaWRkbGUgb2YgdGhlIGJs
b2NrDQo+ID4gPiAgICAgLT4gd2UgZG8gbm90IGNhcmUNCj4gPiA+ICAgID8NCj4gPiA+DQo+ID4g
Rm9sbG93IHRoZSBzZXF1ZW5jZSBvZiBibG9jayBwcm9ncmFtbWluZywgZnJvbSB0aGUgbG93ZXN0
IHRvIHRoZSBoaWdoZXN0DQo+IHBhZ2UgYWRkcmVzcy4NCj4gPiBUaGlzIGlzIG5vcm1hbCBwcm9n
cmFtbWluZyBzZXF1ZW5jZS4gIHRoZSBiZWdpbm5pbmcgb2YgdGhlIGJsb2NrIG1ha2Ugc2Vuc2Uu
DQo+IA0KPiBUaGFua3MgZm9yIGFuc3dlcmluZyEgQW55IGNoYW5jZSB0aGF0IHlvdSBnaXZlIHVz
IG1vcmUgZGV0YWlscyBvbiB0aGUgc2VyaWVzDQo+IHdoaWNoIGFyZSBhZmZlY3RlZD8NCj4gDQo+
IFRoYW5rcywNCj4gTWlxdcOobA0KDQoNCkhpLCBNaXF1ZWwNCg0KDQpNaWNyb24gcmVjb21tZW5k
cyB0byBmaWxsIGF0IGxlYXN0IDE1IHBhZ2VzIGJlZm9yZSBleGVjdXRpbmcgYW4gZXJhc2Ugb3Bl
cmF0aW9uIG9uIGFsbCBwbGFuYXIgU0xDIE5BTkQuIEluIG5vcm1hbCBvcGVyYXRpb24sIGEgTkFO
QyBibG9jaw0Kd2lsbCBiZSBlcmFzZWQgd2hlbiBtYW55IHBhZ2VzIGhhdmUgYmVlbiB3cml0dGVu
IHRvIGl0Lg0KDQpDbGFpbWVkIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uOg0KDQpNeSBwYXRjaCBj
aGVja3MgdGhlIG51bWJlciBvZiBwYWdlcyB0aGF0IGhhdmUgYmVlbiBwcm9ncmFtbWVkIG9uIHRo
ZSBOQU5EIGFuZCBpbiBtb3N0IGNhc2VzIGJlZm9yZSBhbiBlcmFzZSBvcGVyYXRpb24gaXMgZXhl
Y3V0ZWQNCnRoZSBibG9ja3Mgd2lsbCBiZSBmdWxseSBwcm9ncmFtbWVkLiBJbiB0aGUgdmVyeSBy
YXJlIGNhc2Ugd2hlbiBhZGRpdGlvbmFsIHBhZ2VzIG5lZWQgdG8gYmUgd3JpdHRlbiwgdGhlcmUg
d2lsbCBiZSBzb21lIGFkZGl0aW9uYWwgdGltZSByZXF1aXJlZCwNCmhvd2V2ZXIgYXMgZXJhc2Ug
b3BlcmF0aW9ucyBhcmUgaW5mcmVxdWVudGx5IGV4ZWN1dGVkLCB0aGUgY2xhaW1lZCBwZXJmb3Jt
YW5jZSBoaXQgaXMgdW5mb3VuZGVkIGFuZCBpcyBub3Qgc3VwcG9ydGVkIGJ5IGFueSBkYXRhLg0K
UGxlYXNlIHN1cHBvcnQgY2xhaW1zIGJ5IGFjdHVhbCBkYXRhLg0KDQpXZSBoYXZlIGRldmVsb3Bl
ZCBhIHBhdGNoIHRoYXQgZnVsbHkgYWRkcmVzc2VzIHRoZSBpc3N1ZSBhbmQgd2Ugd2lsbCByZWJh
c2UgaXQgd2l0aCB0aGUgbGF0ZXN0IExpbnV4IHJlbGVhc2UuDQoNClRoYW5rcywNCg0KQmVhbg0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
