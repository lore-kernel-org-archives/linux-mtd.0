Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E612DC77B73
	for <linux-mtd@archiver.kernel.org>; Fri, 26 May 2023 12:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbHULpU1db0o4Zwrv8WZkgryhdCj/RYwHO1WRvf8YnQ=; b=GtfGoG6znsFI2q
	vcJjQrmFpYddeS1Y9jgKxgYcD+4sxD5MtSJqzI9TRiGoMGQD/tjbwJGxBUJ34+XNpKPORMUhpTfFS
	wjQBDENU6uy0B/zo0Bp66io/2cJfqTxtz+KP6AOdOiLqYc34up5lnbJDXBEs/6hJNVN3g/qWAUvWs
	BGeAtNOiY7DRizblUINkUs9hXJn8treQrJLQTx2HMg/IVmMcSEB+xL46pAmTJgQ10Nrs4UkmIBqcN
	y60MA5IVz0N7Nc/P8TsHzjpG08aO2JurlRgXQ482FeP8BW0Y4ADv6JmZ81+0j8Qdh4oZ5f1YlBYVm
	YXcjsjhv2bTjM/P2xcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2W95-002PXZ-34;
	Fri, 26 May 2023 12:02:11 +0000
Received: from mail-am6eur05on2071b.outbound.protection.outlook.com ([2a01:111:f400:7e1b::71b] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2W93-002PWP-1j
	for linux-mtd@lists.infradead.org;
	Fri, 26 May 2023 12:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOqbEPm1ezFPH+Yrk4iVCYhMjSLmzN5iRwiyQ8a2DYGI3TMIHK3TALKcYPhxVzx8glzwbPiFB4z/HdeHrZL1XXRDo4AvThuP5Z7ysH8HS3Fqy+Vg4WDly6l/66IeJy/entHuFXG+LZxcXk2izfPVSacQOWEx+/5ft+AMbIIL6hYEAXGBve6F1zGv+ggRU8RA7QWKS20JbCrCXC3aQ5px4TBEZkSm2v6LrXUY8M4JAWJJGsVcuHhIr5v/0+6zVHgHcYdcBZyY6nKKTIYaLc9dxrRLdG18SrNo3u31ELc7VMITZVLsQMeBL6xmIDvujH9q2aQCf4zN6kGLWQznkvp1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gDPAk4gxgf7HtF42qvIHBcx3h97h4jWV6S67/zMkpI=;
 b=Jewyt2REj6Timc07mnQbGmQgoA28rmdWtmwkgnBhOSepUHEvKGua3ZP7mXqHF77UyhauUlh3t/QlQx8LufKCtC9908HwpCghOrO0SvU1C80ARdE3UEjbozB3zbdm3XRkq6Y28whE9x1PQRsYTY3jX47lUQdlMwyNb2eBqRRHIy5DKdskp52zk1Ru9R0ZQjcxFUBUTDam/mweZi566Kye8FiIhfx0B3L1B8a39OEEaQKgJPAMkQYDE9EuVwBBV8/wgFSNikzZsx1mQSLqhCUoSD+VBXIV3dIgh70B7HSDH8yTaS8bkSPrhvMt36h7KamoVw7JWKBthwY2buVhtszDzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gDPAk4gxgf7HtF42qvIHBcx3h97h4jWV6S67/zMkpI=;
 b=EBUdSDQeNGpPzAWuq49enBZsw//QZ4U7gpfKrU6RMYaKiX4ZgCYM+pgTUBwxL1FqafnxjA8zFBzYEMAKlh9nR/xhM7CnAr4UR66klIL5Tf9xJ0SYwo8eZrT9RtJMGRt20BBsXauxaZ8n3LsMIw83JIWzXf3+EDwGYt3+4KnNCQQ=
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:38::26)
 by PA4P190MB1101.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:102::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 12:01:50 +0000
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::398b:5b73:7509:65fc]) by VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::398b:5b73:7509:65fc%3]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 12:01:50 +0000
From: Vadym Kochan <vadym.kochan@plvision.eu>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Roger Quadros
	<rogerq@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Liang Yang <liang.yang@amlogic.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Aviram Dali
	<aviramd@marvell.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Elad Nachman <enachman@marvell.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: marvell: add support for AC5 SoC
Thread-Topic: [PATCH 0/3] mtd: rawnand: marvell: add support for AC5 SoC
Thread-Index: AQHY45PNiQyYrdEWN06hu0A4/jLhu69rf3CAgAJMXSM=
Date: Fri, 26 May 2023 12:01:50 +0000
Message-ID: <VI1P190MB031742E17BBA60A36FEF9CFB95479@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
References: <20221019082046.30160-1-vadym.kochan@plvision.eu>
 <143fb1ff-b2d4-a6fe-e892-b55a7bbf56f8@alliedtelesis.co.nz>
In-Reply-To: <143fb1ff-b2d4-a6fe-e892-b55a7bbf56f8@alliedtelesis.co.nz>
Accept-Language: uk-UA, en-US
Content-Language: uk-UA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=plvision.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0317:EE_|PA4P190MB1101:EE_
x-ms-office365-filtering-correlation-id: 930d2d49-b382-4246-919b-08db5de0fd1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dzOdD0w2sdEK+WXsotD0PZAm8qJmgql5zYGRhoGKLf2GslVSkOYDkVQzQzprFtbwTwhlUei7sC82LItdVebw2nSdH6wdEcTrgplYiwkFF4+mBTYKTaSt+Y8hX9V8TB2NnRbpNeiNNnx1ipysJfsGtmt4z0qoWq4M/NQu+6TooOTTQK65rrhyXZx5L/RxoLFlITWTvUk5gwv0uHV6zJUtHtsH/4RT7V7OyUqEm8WCFsPzitDciCdPIMjyWISS167mH9jLanux0J3UpuhhtIbaEl2qjOBcj2zQZBo3ne8AHvvNjeOneUxlPTIoIHdKByAGxyWvZbxgkLUDYCUUjTezAAn2EWe80Lh6FPbtfvyHMsY6CIHNHvfKEQ5uKY29cxQffEF4S22DeGhnkj4bLbzhUQ4NowSTXv6ESq0G8A6t34vBWdqcwYWT40tO/ndWAIqEFuC1n0gfg9CInPjLhk1bu0zXpAfPLO5FpndVibZZWoaA/7JoNKak3mJy8w3KlkWe7SzvIBHDif2qihGJTFkDft8PqTTAjCktV5UT/b7XZ6ICmXtOf2tNID6N3uI6gvCq/zF73GaoRdQmvEuOPiJ6F4U5CxyB478m516+F5SFUXc9MRyUw9zVg5TIo+RwSS04mN9V2ULDv8LbQ1ZHE1h/hg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P190MB0317.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39830400003)(346002)(136003)(451199021)(2906002)(64756008)(76116006)(66556008)(66946007)(66476007)(66446008)(5660300002)(52536014)(83380400001)(7416002)(8676002)(8936002)(44832011)(316002)(41300700001)(4326008)(91956017)(33656002)(110136005)(478600001)(55016003)(7696005)(71200400001)(9686003)(53546011)(6506007)(921005)(186003)(26005)(38070700005)(86362001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?koi8-u?Q?+YT3yRQoXtCX4cjESbFFkFLJeKFWOeIeHB1MZxrITYIX4t2awEqUItL4akk9Z8?=
 =?koi8-u?Q?ZYDZje/NfJu2osDkOIfiR2tmRHpUixMAK9xLH6SUE88uxujCX4tUm4vfrKTNyB?=
 =?koi8-u?Q?WFba9ek77/TdX6yyAYEJKAL6QuW87q42Ax7fE9A1gT/KOHlMgQqabwlLjjiUU0?=
 =?koi8-u?Q?qYc/pA3uhFlqHnqgmkH3PIEHvUSjtStwFjD2GOrgqqQuCafIunEvf5I/vQChI6?=
 =?koi8-u?Q?gLiyXxUfBrRUxZRtWNLJ6vx3QvVIenN6oCC301QhpWSSRWHPHRmhGY4K7IUx5o?=
 =?koi8-u?Q?S267ynZaZ8GbYenydzmCbYd6nvPfIC6nBM/a8d94jnNwAAyy0UFTLNg8yNF1wU?=
 =?koi8-u?Q?RldoORDIsMqm7Ima5zsKQvB9mCns3gAmYbEu4TRSnzGHLm0IQ7v+ivL32Gnrbi?=
 =?koi8-u?Q?jvZQCQRc67xYOrkuP6XkxawWsyrLVGxACMfRpdwR+W0BgO1Z7dzas4BCJHqe9X?=
 =?koi8-u?Q?9OcS+yARcHLciqXQhNU08EhS7leS63UIWFGG+yc7i2ISvjrYToqhBSdjMCnNAc?=
 =?koi8-u?Q?Qldvz5qGfGusAyy77qv1GoBrQgZSpszJewta6RoiTb1ND6ry4eALyt+xfOO5Lb?=
 =?koi8-u?Q?15kzUNoHrBoiiKDH7YflV9GW5hy8bICDAp6GyyhMILQNtT3ntc6ZgPvf9KZU9d?=
 =?koi8-u?Q?sXamtb/boKJUkqr2GWpGgc1VAt69eQ3uiULn+A3/KcDs46WkRcRWI4RSAA5Btz?=
 =?koi8-u?Q?b52cIIeTPZxOwA25kyiDuJ2KXQIMKh30qpIdjowjHyEPlFM4tkNxHjW4xi9YRI?=
 =?koi8-u?Q?piIgil1D+urdaZiW7C97l2uZGyxJ6IUAUU0qdMDZf50VE5VoqLTT43UoZTIIpE?=
 =?koi8-u?Q?sTcfMe0Qp1aPT8C+kFyBiWrHveZJgEzF4ArYXTQVVsNqO7NhnoEP35Hs/BGywk?=
 =?koi8-u?Q?QK241Pkok/Oc4+6DJnVf801iHihrLjuFR91CSkrdau5OBonnOU3GqmkPv1FQNi?=
 =?koi8-u?Q?b5gEaMDT/oSka5g+gO8owq4NxQ1iC68nQHIFGfs7D/hza5JB9e3vVIvc7JCg2y?=
 =?koi8-u?Q?eltWrU2Uple2I5MF9V23rDA5yPzN87mOJXJpsXxbEtbk2vZgQrMIJeilGlMB1+?=
 =?koi8-u?Q?O42Lyn+EvGw8bLj3jfRHNXktU0VkUM+Nt8VQ25PAK5nXNj4Waj9lWg2x54ZozD?=
 =?koi8-u?Q?iARmi/ZJGrYaNjXKxIIFSRUG3Qqct9VtIHP8jnQKDn6g69h0CFX0Vd+6/qLz3F?=
 =?koi8-u?Q?KpT5r9xW8riTrVJWWYdDYH7Kq3/Ofr2HsJ/XSMwjJpGcP/R8tHL+ZmiMDwiX+6?=
 =?koi8-u?Q?yMEwenUfAnt5qrKssbEd0bifU5oEAxeTC622JACKvq2NzlHmvpGXRJ4Rq7WIST?=
 =?koi8-u?Q?gsFs3ZAcKfFO94aYOKhQMGUHtHoDeurKVUoPw4gW3dsxGCi/SC3bRPp4xIeS2F?=
 =?koi8-u?Q?AI3nQjd36c8fdvAaPp1NxV7vM4Y0LNqTHjduX0mTulIbJHnaqpcyDySmKpiOQW?=
 =?koi8-u?Q?jWEbyOFus7ugKvbejx2Gudso5Rv6oST/YjyRe2ahReNq1j6iKuVx9qX6MNh8K+?=
 =?koi8-u?Q?ZbdwU8SI0cs1+KLcPewLLGbwNPMECpfCEaDsTMCtIneUpfahUL?=
MIME-Version: 1.0
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 930d2d49-b382-4246-919b-08db5de0fd1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 12:01:50.3318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zp8E30ppbzbpI86lkDgsLeQsrTb/MQy/bQEngoz6qlCtnGpLPaHr/7eMlOLUyqRPMa46ticZxJGaguSodW4ip5w9kPngVBxVpF+lFk9gq1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P190MB1101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_050209_596823_5EAB9416 
X-CRM114-Status: GOOD (  16.20  )
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
Content-Type: text/plain; charset="koi8-u"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXMsCgpTb3JyeSBmb3IgdGhlIGRlbGF5LgoKQ3VycmVudGx5IEkgZG8gbm90IHdvcmsg
d2l0aCBNYXJ2ZWxsLCBzbyBJIGNhbid0IGRvIGFueXRoaW5nIHdpdGggdGhhdC4KClJlZ2FyZHMs
ClZhZHltCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCvemxDogQ2hy
aXMgUGFja2hhbSA8Q2hyaXMuUGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56PgruwcSm08zBzs86
IDI1INTSwdfO0SAyMDIzINIuIDM6NTMK68/N1TogVmFkeW0gS29jaGFuOyBNaXF1ZWwgUmF5bmFs
OyBSaWNoYXJkIFdlaW5iZXJnZXI7IFZpZ25lc2ggUmFnaGF2ZW5kcmE7IFJvYiBIZXJyaW5nOyBL
cnp5c3p0b2YgS296bG93c2tpOyBSb2dlciBRdWFkcm9zOyBGbG9yaWFuIEZhaW5lbGxpOyBXb2xm
cmFtIFNhbmc7IExpYW5nIFlhbmc7IFRob21hcyBCb2dlbmRvZXJmZXI7IEF2aXJhbSBEYWxpOyBs
aW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcK68/QptE6IEVsYWQgTmFjaG1hbgr0xc3BOiBS
ZTogW1BBVENIIDAvM10gbXRkOiByYXduYW5kOiBtYXJ2ZWxsOiBhZGQgc3VwcG9ydCBmb3IgQUM1
IFNvQwoKSGkgVmFkeW0sCgpPbiAxOS8xMC8yMiAyMToyMCwgVmFkeW0gS29jaGFuIHdyb3RlOgo+
IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgQUM1IFNvQy4KPgo+IFRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyB3ZXJlIG1hZGUgdG8gYWRkIEFDNSBzdXBwb3J0Ogo+Cj4gICAgIDEpIE1vZGlmeSBN
YXJ2ZWxsIG5hbmQgTkZDIHRpbWluZyBzZXQgZm9yIG1vZGUgMAo+Cj4gICAgIDIpIGZpeCB2YWxp
ZGF0aW9uIGluIEFDNSBOYW5kIGRyaXZlciBmb3IgT05GSSB0aW1pbmdzIHZhbHVlcyBtb2RlcyAx
IGFuZCAzCj4KPiAgICAgMykgcmVtb3ZlIHVubmVjZXNzYXJ5IG5hbmQgdGltaW5nLW1vZGUgaW4g
ZGV2aWNlIHRyZWUgb2YgYWM1LmR0c2kKPgo+ICAgICA0KSBhZGQgbmFuZCBtaXNzaW5nIEFDNVgg
bGF5b3V0cyAsIGFkZCBvcHRpb24gdG8gdXNlIG5kdHIgcHJlZGVmaW5lZCB2YWx1ZXMKPgo+ICAg
ICA1KSBaZXJvIHN0ZXBzIGFuZCB0b3RhbCBmaWVsZHMgb2YgZWNjIGluIGVjYyBjb250cm9sbGVy
IGluaXRpYWxpemF0aW9uIHNvCj4gICAgICAgIG5hbmRfc2Nhbl90YWlsKCkgd2lsbCBjYWxjdWxh
dGUgdGhlc2UgdHdvIGZpZWxkcywgb3RoZXJ3aXNlCj4gICAgICAgIE5BTkQgaW5pdGlhbGl6YXRp
b24gd2lsbCBmYWlsIHdpdGgga2VybmVsIDUuMTUgYW5kIGFib3ZlLgo+Cj4gQXZpcmFtIERhbGkg
KDIpOgo+ICAgIGR0LWJpbmRpbmdzOiBtdGQ6IEFkZCBBQzUgc3BlY2lmaWMgYmluZGluZwo+ICAg
IG10ZDogcmF3bmFuZDogbWFydmVsbDogYWRkIHN1cHBvcnQgZm9yIEFDNSBTb0MKCkFyZSB5b3Ug
c3RpbGwgbG9va2luZyBpbnRvIHRoaXMgc2VyaWVzPyBJIHNlZSBvbmUgcGFydCBtYWRlIGl0IHVw
c3RyZWFtCmFzIGNvbW1pdCA2OGMxOGRhZTY4ODggKCJtdGQ6IHJhd25hbmQ6IG1hcnZlbGw6IGFk
ZCBtaXNzaW5nIGxheW91dHMiKQphbmQgdGhlcmUgd2FzIGFuIG9mZi1zaG9vdCBzZXJpZXMgYXJv
dW5kIGNvbnZlcnRpbmcgdGhlIERUIGJpbmRpbmcuCgo+IFZhZHltIEtvY2hhbiAoMSk6Cj4gICAg
bXRkOiByYXduYW5kOiBQYXJ0aWFsbHkgcmV2ZXJ0IDQxMTRmOTdjNDFjZCAoIm10ZDogcmF3bmFu
ZDogR2V0IHJpZCBvZgo+ICAgICAgYSBmZXcgdW51c2VkIGRlZmluaXRpb25zIikKPgo+ICAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL21hcnZlbGwtbmFuZC50eHQgIHwgICAxICsKPiAgIGRy
aXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgICAgICAgICAgIHwgMjc3ICsrKysr
KysrKysrKysrKystLQo+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF90aW1pbmdzLmMgICAg
ICAgICAgIHwgIDE0ICsKPiAgIGluY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaCAgICAgICAgICAg
ICAgICAgICB8ICAgMyArCj4gICA1IGZpbGVzIGNoYW5nZWQsIDI2NCBpbnNlcnRpb25zKCspLCAz
MyBkZWxldGlvbnMoLSkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
