Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C02C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:08:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 784F2206D9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:08:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fTWKlezB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="0MHLujA+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 784F2206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9GUa+Ougo8dXfH/OEkkigmKs2ogeJlJky+UDdyWiQo=; b=fTWKlezBN+4DMq
	gBsxKWyp46fWzRILw6u4TY2gz0ceox2SX92EXnFRulu9+GkgZRrwxGPXP/RO/G+I1XOGe/6cEbLmS
	KRLhDGpM9TpZ4Gg5Nte3qn/6IAYcTqjgRCx4elZDxNCHS8nxx96143HFAiU2+j77pLWkOVmKEBlcK
	PpTVOAWLoQl77vJduWoXrzuqgcPe1G+Uo0DlagCDzAVhLNoTBGFclFV/BJ/+wWP4G+VNLzIzjhSiL
	CF0DI+k4RpWnqpr7qJXw3NYdg1k2Navcqvt9reWc1+wXejfhUUlKeNRs9rZcxNBJGVV7yn16XibGZ
	8z6AVpNbfMEF2HOwZ4sQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVW9Y-0006fK-On; Mon, 04 May 2020 08:08:40 +0000
Received: from mail-eopbgr690074.outbound.protection.outlook.com
 ([40.107.69.74] helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVW9W-0006ea-8W
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 08:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frUZmalfmpna5EWJjUmnw/1YuOdqcn6H+ta/YLVd1pqD+OIccRrzucB8FiL7LX5YO4N1QAmWYCeIeA26E2+EIbFo0XVMNjowCOsdzmT769AIeWmlMno6Zhjv6bSATTYTj+6p+50rw8rN1tXSTiAhWAT1vVople0UyXN60yY1E41rhLYHJRrZZxuotNCzJO8ydRxbSMyNtWeLQ0DneXn43my+K6tlSFILECc+ADyRfjzxIr/bSf/345uaWcfHedC8X8MKQvzuXOQtc9PS+E2DVK/3CDEPSNJqplpFKTuIs/aM0MF50sQwn1h1pMptxUnE9lbcJJjrbTNGqC9cq/nbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLxiO6OeGEpvcFQ0rIZ6pb2wFqEgeCDKEwDN+FagoHA=;
 b=TI4exBn8QGNMQNjjhWRQQ72+DRY7HwPSbM8nFJpdN5lNVAKBDEpRHhjFshYN09wNc/zn2FIvBdLgwXtrblIJoBXNa5Tfm4Gyz0yoeZmeDq+ikjBXng7gglV6YiJe0EPUpeTYl1upHNE6n0dKGKYK7cLqPwiFIXuG7elZViVG460GmoolOFoOl7PPp6TagMbEFeMW+LeWA6TBquvBguhOLVelqZ2IgEmdvO0+hrbmkvcEhJJ9pj1sBRD79au5rNnv8z4mc6EI1kobVo5EztfHyuW4Xe8nk6IdbrFBns4IhDQ+XIc5vLEHeKK7/23NNw5YKo7hlXqBl1VoMT4Wjm03YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLxiO6OeGEpvcFQ0rIZ6pb2wFqEgeCDKEwDN+FagoHA=;
 b=0MHLujA+0euKweqPhF9hjNvylPG/ivwQEsFL6NCcAI1EwbC9q74FWdG8GEBm1KsxkUv4oCo2UXQzSw/Kxq1j795hs8O+gJ5IcTUHmrG1dX3unU9frDnbmJZD9+XEa6jzXORUH9Jq6r7PYzRsKdDpXsJKYFDAKepClhrufIkn0zw=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (2603:10b6:408:35::23)
 by BN7PR08MB5059.namprd08.prod.outlook.com (2603:10b6:408:2e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Mon, 4 May
 2020 08:08:34 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c%4]) with mapi id 15.20.2958.029; Mon, 4 May 2020
 08:08:34 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, "Wojtaszczyk, Piotr"
 <WojtaszczykP@cumminsallison.com>
Subject: RE: [EXT] Re: [RFC PATCH 0/3] Fix proposal for the Micron shallow
 erase issue
Thread-Topic: [EXT] Re: [RFC PATCH 0/3] Fix proposal for the Micron shallow
 erase issue
Thread-Index: AQHVwZw7boiSZwlyIUywMobHbQb1lqfp8jmAgADB5ICAALu0AIAABEiAgKuE3xeAAVGIwA==
Date: Mon, 4 May 2020 08:08:34 +0000
Message-ID: <BN7PR08MB568404414BA497C387EB913BDBA60@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20191231192656.16376-1-miquel.raynal@bootlin.com>
 <a2199251-882a-5067-fe4c-47f1c8a252fe@gmail.com>
 <20200114101219.4b951dfe@xps13>
 <8fac8e86-3455-271d-2fcb-c2a6070e8127@cumminsallison.com>
 <20200115085806.218b6b32@collabora.com>	<20200115091325.667c06a8@xps13>
 <c2bf2161-7122-4d59-3e51-57db27654685@cumminsallison.com>
 <20200503132913.40b739a3@xps13>
In-Reply-To: <20200503132913.40b739a3@xps13>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTcxMmJkMTYwLThkZGUtMTFlYS04Yjk1LWRjNzE5NjFmOWRkM1xhbWUtdGVzdFw3MTJiZDE2MS04ZGRlLTExZWEtOGI5NS1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjYyOSIgdD0iMTMyMzMwNTMzMTE5OTc0NTYyIiBoPSIzcjJZd1dJUVhrenVhdEJoNUtnRU9MVGVJZ3M9IiBpZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFIQUFBQUNpM0kwejZ5SFdBYzgzY3ZENVpYZGt6emR5OFBsbGQyUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFCQUFBQWYzT0VLUUFBQUFBQUFBQUFBQUFBQUE9PSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=micron.com;
x-originating-ip: [165.225.81.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd3e4766-7461-4d69-c4b6-08d7f0025784
x-ms-traffictypediagnostic: BN7PR08MB5059:|BN7PR08MB5059:|BN7PR08MB5059:|BN7PR08MB5059:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR08MB5059ADDF034D0171E1E82D0DDBA60@BN7PR08MB5059.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03932714EB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S8k8YahFB7uXsV7bfvPcvwCH2n1OZLlfEo5VC6yyOF34vGulpKwwLj0m+Johcqu4p6LqVdL9i1ye+LbYUWGrc/UrjvFibOyTwXMEDk6NusnF4tzUPMOPgItGSl//hgCP957UqtZ8KHDQraZPd+7sGJwl38D4+4u/0XGg5774bZLiruR5YwByCY47LO4m7o/+e6ECnt8/XIRO5zeMl3KoRYWFeLhEyFoaRBG+Qzj0g+EtOk6FJH/nt6HPlafVRnq7N2a6eqiUIwMFl4/6NTxr/NrptN64LbZQRIadLMpUSDlTd+5TJcjDF6+ELfVrdSZQzL/ifriJCDOI1n9zXD4yrrTUu8i/H81LgqWRJmUViYoOQJyQ+mzZgI7ddBEINXidjXPBa1P+wanbQErCx2CzBOg3P1FX2Ao2dm6LiksX07k9rAhnY+afEVOzmDVYwWZe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR08MB5684.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(66556008)(66476007)(186003)(71200400001)(54906003)(7416002)(110136005)(26005)(66446008)(52536014)(64756008)(86362001)(55016002)(8676002)(7696005)(66946007)(9686003)(33656002)(66574012)(76116006)(8936002)(4326008)(6506007)(316002)(55236004)(2906002)(478600001)(5660300002)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: cZKD2syuFYyyE2aA9+pA+rfY0J0fyVI3g/vG5qz5T89FrJvpseOMUc3f+pK7d2jHCAXN/oFI5s8povwximyp9u2L/b18Jz1rsGTE6fzMmx4VF0mQhJuIpSCdcgjhhoybDShfUz7wuvytqLHuoPbHAgAd75sRJxdIuSkNYUm64ikqmIcwo9pcNVfMdm6eM/3oIIskfL/WjXOlxKKT2dROYdQYW8/9nJiEKVO+mBbFTdA0atel4YD2sZ0E8MepNm2cy05rqn5yYikQD404oiaBVMMovbKmVGIhzxy1cbhgkFOzbjVKEQHSpgdzHYlRpETQ9BwMD2qgfkhiu+d21/GHkaxT8l57epc2A6FoORM80XUjmR50p01r038VfoK6KFpnHOXDQewxWsnWycF/TNH7IiCrSxEyKxwpXSZ2MZoL6cHSsO5ygwOgPtF78ZcedLVPiLRycHZ7H34FXoW3fjoM4yNB8Wvi93AyRNNNKk7sz4fM9X3UYJ8OwpE+Ury2VgsoifUp7ee3cxyE4mnP+h0lMGT3BDiu1uKR/TZUJwGdcIjoP9ZZLL4pYbVx6CZ/A+nRCw3HaIG+pUWcuewtQAP9GhNxKtye7uu10+xw9ET0QIZ/eAYmRk34Wfsqgh/O6IcPxj+vavLzRrbZ9tDZ+S7krJVSUv0TmkAR5waUU8JgykSGKgCFdvnxCxkHZGhSVQ2KPa+HtcwsWi5YNqqozqG73cZ4qLBHDSOFElW9R18NFUeByQrS98jOxKUY9BEsybMBWgXX1S+dMW9BVptulFpuX1o3GWoSVXjuwz7gb7p4bG0=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3e4766-7461-4d69-c4b6-08d7f0025784
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2020 08:08:34.3455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QHxbxcaWAZn9gFUMe59aVm9a/3ote5Mqh2Ebo8WUGhacaC/l6Tdo1b0xq8VPrZWyxdpmksvpgKPHZxfUUZaa3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB5059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_010838_366984_A3FBDB38 
X-CRM114-Status: UNSURE (   8.03  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, "Zoltan
 Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiANCj4gU28gdGhlIHF1ZXN0aW9ucyBhcmU6DQo+IA0KPiAxLyBXaGF0IHNob3VsZCB3ZSB3cml0
ZSBleGFjdGx5Og0KPiAgICAgLT4gdGhlIG1haW4gYXJlYQ0KPiAgICAgLT4gdGhlIE9PQiBhcmVh
DQo+ICAgICAtPiBib3RoDQo+ICAgID8NCg0KVGhlIE1haW4gYXJlYSBpcyBvay4NCg0KPiANCj4g
Mi8gU2hhbGwgd2UgcHJlZmVyIHdyaXRpbmcgOCBldmVuL29kZCBwYWdlcyBzdGFydGluZyBmcm9t
Og0KPiAgICAgLT4gdGhlIGJlZ2lubmluZyBvZiB0aGUNCj4gICAgIC0+IHRoZSBtaWRkbGUgb2Yg
dGhlIGJsb2NrDQo+ICAgICAtPiB3ZSBkbyBub3QgY2FyZQ0KPiAgICA/DQo+IA0KRm9sbG93IHRo
ZSBzZXF1ZW5jZSBvZiBibG9jayBwcm9ncmFtbWluZywgZnJvbSB0aGUgbG93ZXN0IHRvIHRoZSBo
aWdoZXN0IHBhZ2UgYWRkcmVzcy4NClRoaXMgaXMgbm9ybWFsIHByb2dyYW1taW5nIHNlcXVlbmNl
LiAgdGhlIGJlZ2lubmluZyBvZiB0aGUgYmxvY2sgbWFrZSBzZW5zZS4NCg0KPiBUaGFua3MsDQo+
IE1pcXXDqGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
