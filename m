Return-Path: <SRS0=DY/e=VO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5480C76186
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2019 11:15:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876892173B
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2019 11:15:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SC2kBtUK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="tP7WnEwD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 876892173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKxEpaWs6lXwRWkPCwRo6s4XPzJ/Ex2etYp2hR/hN54=; b=SC2kBtUK9gtXf9
	YvF2w3ag1pJagi3JgVE5KyJl4We7mLhcrx6gmcAmitYOJTtVGhgL+/+d3sR9q2JtttdKs+lPR0vOD
	MV1qtnID9+1gCYrinYHEKXlwgMlJIqT8TdPGXyVh45AnFs/pD4dNQt3iLaT33t3SYDDeKF/RxibPI
	+1fXwcn0+6ke4sHh+/ZghntVPtKUFnQAjs4qcOx9O1ghoZanh5qIrXduznoYskNTPLQIHmRB001MN
	lDEFmHrh+HIcDpUDFdonGQKqbwEvkWhMHdF9EBqZZYI2I3h6r9Gbo9P9ZwIiYGlxr9amYQmPulTdy
	41JNVURTSGzR+BC8H4zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnhu6-0007cB-HT; Wed, 17 Jul 2019 11:15:22 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnhu1-0007aR-Sg
 for linux-mtd@lists.infradead.org; Wed, 17 Jul 2019 11:15:20 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: PkjvMBi+hhJeDYZMKfiG5htAYrKEJgTsjVP64Yw4zel4lKidM5zeKhIWTX9Qr4JS+UwgZb5gdW
 x26ctZK+B6Clg/WMz+Vy8/ccplkB/LmdLX3veVJOlH4wfKOQeMPE1qHN/5MYterrRfJieA+j8r
 DHEjXFFx5MEgFfpVNgmVxz5QtXYo1eig/ZppEDhfv7P0SsRYGt4ncjkllocE5dua96sKRAJT1B
 OqUqW+JUFzQar+aFVYXuaIdleiwCg6b2596sugAUFjJbhTyNZirfsPZvg4Hv2NnF/m5LYknJdx
 hms=
X-IronPort-AV: E=Sophos;i="5.64,274,1559545200"; d="scan'208";a="40906042"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jul 2019 04:15:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 17 Jul 2019 04:15:14 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 17 Jul 2019 04:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGeDnWt16+MyOHrJW+8ThVE++phoDwJqjaYau5TbkL6rjjUfMrsi9HB8zbYp3i3vXemWaE0aE9PI9IDqo2beo7u0VRQp/s74Wcqu0dd//+12/CAkqR840ysCpJPsqUVkoo9nZJ4xSHev46FkvTsmVOaLDrAcziMzEKwNEK/gxxB+RsIeDsUvQBXVYO0HSb6MTMZhcmd9tH+DVbgTADTFLFyAZur01kH6NERzYH+a26RZVmXX9fPNqv00tnytgy+vowdzu3qxny7dWXIoVpUg6jap65cmmpNjnCZVJsRY83n9qBGjKPr8Yyw2iez2VXbWr6VeO/6GKCYwDrugMLhziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxrhLv0BcYeUb3D5Emtt5ctERgY0q5ZQt9b5MR0HiFQ=;
 b=XDqtuQK66kknYDoH3SlYtef3lUgHtkozvB1gIHaNyTnvAqQid0zWc0qA+u666EqtkEQxHL76ycCxRd1BM51alwZLcRzcWN59bu1FHHMIeR4HzMVMeuSPrrlkk6UaKGW5b7g8dL0kyRoJD87ZPM23onjQD1P/Gfp6MD2fnx/ZyG/ebg1wDxkVbMXPY35hoPYaArhXFODACOZfrJNeeRXc0CM06B37qR8XtO+TwmTyYC15nQJBLbfKUFQ7b80WPO/81VrJSUUxOniD8Mjv93UjoHO3/XxurDBSDmuZz1NEktixZNPmQ/+XB5aDdkB8l6c6Ai4sKkI545pfA29CcKBuDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxrhLv0BcYeUb3D5Emtt5ctERgY0q5ZQt9b5MR0HiFQ=;
 b=tP7WnEwDJvGM6gb1RDjRufiZjUwHDx6Q5b8VIyu4WU9/OdhitLw3cbFDRM3W8VTj1FKiybTa+748OXwsF2u/F5yOXt2FbbOhc6NjVLXGsLIvpYHeU/7YFoP3Wbr7btt6i044EItgHig5gUnJTDmSmx2EcH1UzJAiuEOF3S8qyCU=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1396.namprd11.prod.outlook.com (10.173.33.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 11:15:13 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::6515:912a:d113:5102]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::6515:912a:d113:5102%12]) with mapi id 15.20.2073.012; Wed, 17 Jul
 2019 11:15:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <marek.vasut@gmail.com>
Subject: Re: [PATCH 5/5] mtd: spi-nor: add Kconfig option to disable write
 protection at power-up
Thread-Topic: [PATCH 5/5] mtd: spi-nor: add Kconfig option to disable write
 protection at power-up
Thread-Index: AQHVPHxf57xp/vrlsEWVvsFB8NifHqbOqMyA
Date: Wed, 17 Jul 2019 11:15:13 +0000
Message-ID: <0fc5d3bb-aa11-2816-4734-75dc86deb0d2@microchip.com>
References: <20190717084745.19322-1-tudor.ambarus@microchip.com>
 <20190717084745.19322-6-tudor.ambarus@microchip.com>
In-Reply-To: <20190717084745.19322-6-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0802CA0041.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::27) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c60e8cb2-4513-426d-5cbd-08d70aa809ba
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1396; 
x-ms-traffictypediagnostic: BN6PR11MB1396:
x-microsoft-antispam-prvs: <BN6PR11MB1396D891FD702FFC4549200BF0C90@BN6PR11MB1396.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(396003)(376002)(366004)(189003)(199004)(53936002)(5660300002)(14454004)(6486002)(6512007)(6436002)(478600001)(6246003)(6116002)(66066001)(2501003)(186003)(3846002)(86362001)(229853002)(107886003)(66946007)(99286004)(305945005)(36756003)(110136005)(81166006)(2616005)(31696002)(2906002)(102836004)(11346002)(8676002)(81156014)(476003)(26005)(71200400001)(71190400001)(486006)(31686004)(256004)(446003)(25786009)(8936002)(68736007)(316002)(4326008)(386003)(6506007)(66476007)(66446008)(64756008)(66556008)(54906003)(76176011)(53546011)(7736002)(14444005)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1396;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qLpX/sUllvxXCXZF2mCRBFIzsx4X5joa1tqCcUz57E2cYwLOSK/LCneyXNUudESzjH8Sz4vsXM9fZdjaPqr9xLQFO44fmr3EH7MVaMHsKPNvdPzrjf+eqCxeeBRkjjAYVd62OUDhvNq2wvs0MZImOoBOTY9b/s2wXOF91wObN0LxqeFjChfLJPkRg1/+Abb9gv5CYcC5VHUq4f/U5O29OdbjWglAyGbcRF5ve/b9pSjbG8/Y0qr0TzMqv6Q5i5Yc6y3SHBhwNOU9kFQPGitB+LixeN0wyLJ2oyAIoYyjPnkSq9Q88IY2K5mTkTApR+SqjcZcLCvSAZgUHJFlYAeqWnRBtuoh/m1puH96Bj+4Do6vNbxhWANDzNFMs/mtKxHMx2Djd0cxlqMU5SMX0xevv8YGqcq84HY+mqzMXpsBnis=
Content-ID: <6EA44986D3302C4A90449E4E33BD478E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c60e8cb2-4513-426d-5cbd-08d70aa809ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 11:15:13.3125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1396
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190717_041518_041854_48A0E0DD 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: richard@nod.at, linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

DQoNCk9uIDA3LzE3LzIwMTkgMTE6NDggQU0sIFR1ZG9yIEFtYmFydXMgLSBNMTgwNjQgd3JvdGU6
DQo+IEZyb206IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCj4g
DQo+IFNvbWUgc3BpLW5vciBmbGFzaGVzIGNvbWUgd3JpdGUgcHJvdGVjdGVkIGJ5IGRlZmF1bHQg
YWZ0ZXIgYQ0KPiBwb3dlci1vbiBzZXF1ZW5jZSB0byBhdm9pZCBkZXN0cnVjdGluZyBjb21tYW5k
cyAoZXJhc2UsIHdyaXRlKQ0KPiBkdXJpbmcgcG93ZXItdXAuDQo+IA0KPiBCYWNrd2FyZCBjb21w
YXRpYmlsaXR5IGltcG9zZXMgdG8gZGlzYWJsZSB0aGUgd3JpdGUgcHJvdGVjdGlvbg0KPiBhdCBw
b3dlci11cCBieSBkZWZhdWx0LiBBZGQgYSBLY29uZmlnIG9wdGlvbiB0byBsZXQgdGhlIHVzZXIN
Cj4gYmVuZWZpdCBvZiB0aGUgcG93ZXItdXAgd3JpdGUgcHJvdGVjdGlvbi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL0tjb25maWcgICB8IDggKysrKysrKysNCj4gIGRy
aXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIHwgMiArKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspDQoNCkknbGwgaGF2ZSB0byBtYXJrIHNwaV9ub3Jfc3BhbnNpb25fY2xl
YXJfc3JfYnAoKSBhbmQNCnNwaV9ub3JfdW5sb2NrX2dsb2JhbF9ibG9ja19wcm90ZWN0aW9uKCkg
ZGVmaW5pdGlvbnMgYXMgX19tYXliZV91bnVzZWQuDQoNCmRyaXZlcnMvbXRkL3NwaS1ub3Ivc3Bp
LW5vci5jOjE3Mjk6MTI6IHdhcm5pbmc6DQrigJhzcGlfbm9yX3VubG9ja19nbG9iYWxfYmxvY2tf
cHJvdGVjdGlvbuKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dDQog
c3RhdGljIGludCBzcGlfbm9yX3VubG9ja19nbG9iYWxfYmxvY2tfcHJvdGVjdGlvbihzdHJ1Y3Qg
c3BpX25vciAqbm9yKQ0KICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4NCmRyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jOjE2ODc6MTI6IHdhcm5pbmc6
IOKAmHNwaV9ub3Jfc3BhbnNpb25fY2xlYXJfc3JfYnDigJkNCmRlZmluZWQgYnV0IG5vdCB1c2Vk
IFstV3VudXNlZC1mdW5jdGlvbl0NCiBzdGF0aWMgaW50IHNwaV9ub3Jfc3BhbnNpb25fY2xlYXJf
c3JfYnAoc3RydWN0IHNwaV9ub3IgKm5vcikNCiAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
