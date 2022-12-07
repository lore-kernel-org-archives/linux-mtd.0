Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D1AC3A5A7
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Dec 2022 02:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUN5C806f/QBZFOpo5EdgbNYrDrpRTWBteke1IZPSP4=; b=XerO9pxafwKDLt
	vxWUxAfc65JMi5SlsbpVILjCIZW8X/WNjW9t1vWKkBD1WobiihX1WK4wpCD/ijHh24V+fzRaRU6h6
	WW3joJRMi4jGxuV8HMT9N08wEyAgfiFQnwpsb5/7lAjToGb3bxuBK9k93frMTzobCXUuuDm9rXAut
	EA5JHe2OlWGy6PagyyfT2aiWfUWEtTHMT20jxXquzH9343Cjr2+gDC44atbXhjpzGgJC3/0rPmB+j
	GHi+TshgzsGm5bIvmZ2GUdkHPXZ9rBuylSMgI5TRyWQ4s72CgZHzLkiiTrwPoMvMGv7JIsr9FbHax
	7YmzaEy4+MPrEn3RikYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2kDS-008ZVI-E6; Wed, 07 Dec 2022 02:31:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2kDB-008ZR8-Lv; Wed, 07 Dec 2022 02:31:09 +0000
X-UUID: 73dff6b1a90f41e7beb4c2385a62844f-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=tLcsdQttYtBjvNgPbYCqz8lYylBy7mROqOeoE3qwbrY=;
	b=Okh9tfI1S0g3PCr2tJVXkA7Fexxig5fln5myHlsU4GcM5ZdaZkR8RJjcjYRsQu7MetrwWuWJXv/ja6LtaSHx26KZk/1YT2Ks/7mvHRzcXrsdfLe7CxABgPI03Cs6TiHG9sNIQfd0rJTdPUWsLeDbdAulcSOxqaDH/QsrMOkh4xM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:fb0c41d1-abf8-47be-8e46-bc986083aced,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:8368c016-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 73dff6b1a90f41e7beb4c2385a62844f-20221206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1014114298; Tue, 06 Dec 2022 19:30:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 7 Dec 2022 10:00:20 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 7 Dec 2022 10:00:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISosMI9/bPAtE3+as9+Pu/zAy7mmV0R3Ne+YjKHropqF9kSnnrvcZHslZqtRoXaMdRhcbYhGwVzb73AgxmSEMJdhZhpxivUqUzNYp382OJxqMLlRo2nkLHQwT2stzdVfYkO894fgfLVQ7M2n30mDOLNccqZZl2hxDIb9c8QS1vv1TLCuubx8WJpNLgF4wBgjFnSpHqC2wVnYR4j+rbgnfzDZV2rGvHaJtjBO1Y6BChOo2W2C2SlXGTI1Ys86K0rIdwJR+bkfx+p/8uz+SQweGbgTwpYnLVb1fMi1JOJ/eUQZEydliNqJfhjEyfwx7CoYgkXiur5A/qI8+ZV+nv4R1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLcsdQttYtBjvNgPbYCqz8lYylBy7mROqOeoE3qwbrY=;
 b=a8Kj1onSv3x9Gv/STYQeN61HL9+7hqdZ+gS5Fyd32ADiICMf6m+g3Z4RQs2MS5w3Npj6x+shNfmh1tF8wyhniNetoDx67ZprF8/eLFZEh7AfXm3vwFGwNSj8aKaUvKaiiogVePsbJNBxWwu7jt2sOgZVCtzQPU6de+jp47mhHc0D6zik86Bk2sacsWMAeT30+oTeqhEpCr+4vvnD3rmX0Mu+Yqel8KMWIKmSwgIPxVIpQF56yjAUYWChSRj4QSz3trSJNruaTJyOPAkuzHOvyH+0fwH1TOHAJKNsxYXEr03sB69hYmC0Uc62+FVCwjdQRa3AOJT70Ig6n5qbaBzubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLcsdQttYtBjvNgPbYCqz8lYylBy7mROqOeoE3qwbrY=;
 b=WmB+Sv9cQnp4/GmFQZwZwNHF2gtJLWyT4NB97cO8JOhoJd4t1IQ9VZHCB193p63mHfuY9+eUklb9kkl4ChNbaIDVvRnIhtKBLK91nSF5BxW//IM9ViybbgAI0+essFA8C4zP9KfahqEgrJe10BjzH1jPIB0Yp8cRAjkSYIFe+O4=
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com (2603:1096:4:84::10) by
 KL1PR0302MB5201.apcprd03.prod.outlook.com (2603:1096:820:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 02:00:18 +0000
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::3d3b:d288:88e3:59c7]) by SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::3d3b:d288:88e3:59c7%6]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 02:00:18 +0000
From: =?utf-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
	<Xiangsheng.Hou@mediatek.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "gch981213@gmail.com" <gch981213@gmail.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "richard@nod.at" <richard@nod.at>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
	<Benliang.Zhao@mediatek.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QmluIFpoYW5nICjnq6Dmlowp?=
	<bin.zhang@mediatek.com>
Subject: Re: [PATCH v2 7/9] dt-bindings: spi: mtk-snfi: Add read latch latency
 property
Thread-Topic: [PATCH v2 7/9] dt-bindings: spi: mtk-snfi: Add read latch
 latency property
Thread-Index: AQHZCHcIWFb1SQ8l7UecaYFwLXxxLa5fWMwAgAE5uQCAADahgIAA5TqA
Date: Wed, 7 Dec 2022 02:00:17 +0000
Message-ID: <e2ccf42f94152ccacad3a2eaec234ae0566474ec.camel@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
	 <20221205065756.26875-8-xiangsheng.hou@mediatek.com>
	 <ce449a0c-efcc-0ac1-fb8e-c2b4148a5bc1@collabora.com>
	 <a8f706b37f5decf91bfa9a9ac8cf04be4346dd85.camel@mediatek.com>
	 <9992c9a5-059a-9396-32ce-7ed63cd12a96@collabora.com>
In-Reply-To: <9992c9a5-059a-9396-32ce-7ed63cd12a96@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4565:EE_|KL1PR0302MB5201:EE_
x-ms-office365-filtering-correlation-id: 6f42e044-b26b-4b0d-9479-08dad7f6ca32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6FfU7HoKHAwFSLu++P40Dkhwxd1wUMvwgAgIS9erVT6aqQMaMIbeO/WAqTpXxoP9PywVD5nhh4i0L4036YdLzGJzNY0wkUzwhSL3hcLb+yiDCIfPQh99ZdYoUYzGXdqjSOcH/N4yYSFz/o9+Fth/CtJGxZm6LtZ2g1/hhg6DfdoZKmr8YR4SPFO9h4EhCZ5Bqs+E0lyms4Sef5IUdK5JJsmo0HMhd1hjVD3t9iFpqTu/TWvG0kVmG1mfiXthtDUyUP38Tj8Fok16i3fOWqXdXMljW4XlISLsr+lii8WN2ZgaJn4HQNPdmF04lByNA9N4kHo/cglxQvdJFXO3KJ6AyfX74UksW+D6t1tC2BIYMaPhIEOIYxo4LivKFvduzHtqHJ7oG31H8w1dUKwZCgtHddeO/UT8Ik3O4iPoW/tYdTIrBR3YA6pqsrTA2q6RqJcF9hUTTBUzLpPYK2jeAriPxzn9GodKuewXXZ5VrAIc9EfPqGN60T86/dUVUniF+GWCgDs6kbBLvWYijp5/ZjSA92G+ozQsmLWhIKjqAU2LEenFWEKRqGk2DV2LeaWEasCy0mxFsCFJMDvS7cw/CtVQcHykunPb2kVqudwEoTsqp485AulejTDH6ggmND/R4OaiZDhoENiIlX3dlkKzv70WrSRQlkrNsYEnyKLN0tj9tciDWp0YR/kYgJT4/tHLUvh0I77IGo0ImTyMFZKTU3Y5l28heURYhnKzmtq6UVXIjHmizp/SY431u2hyMpHmD7qj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB4565.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199015)(122000001)(83380400001)(38100700002)(7416002)(66476007)(8936002)(4326008)(38070700005)(86362001)(66946007)(64756008)(2906002)(76116006)(66446008)(41300700001)(66556008)(8676002)(478600001)(5660300002)(26005)(71200400001)(6512007)(6506007)(107886003)(186003)(316002)(2616005)(110136005)(6486002)(54906003)(36756003)(85182001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0VnZ3VkT2c4MkFSc3MrbFp1Ym5ram9GOFh1RExQNXN2aGdSUDVjcGxWOHha?=
 =?utf-8?B?MUhXRkhpS29ycEo1akUyeFc4ekVvTmJjTUdDVVlGaTFSdFNCRTlIbjdRcmlK?=
 =?utf-8?B?cEQ2Ym5UOEduT043RDd0Z2V4bnp2RzZpTHd5aHJpdTdFVzUzd09LOXBvQ3p4?=
 =?utf-8?B?UWtyS3Fhd0tLdE5qQk9Pa3UrN1JNQTRRb0cwN2k1bWM4RFZDNHdWYkpWVklC?=
 =?utf-8?B?WXpYdUJSZGpCS01xYzZMaDZ5YW1WK2ZvbStmTVlMc2JkY3BVa1Mwb094N0s0?=
 =?utf-8?B?SDRLb0ZHRndIcXA3S0p3UEhIVUV5b04raUFrbzlJcVp6aDZrV0NucUVXeFlX?=
 =?utf-8?B?TVczaFY1ZGs1UWdXUWQ2S0hjTUJCL2dHVFVGT3E2NDhabDdUM2xyNDFPc1lB?=
 =?utf-8?B?QThYbm5NUUJXZFdIRGZ0SEgvUnhnTEVDdFdqM1diNVY3SEpqQkZkUFNWalVy?=
 =?utf-8?B?N2J2Vmt0eFBOU001aTlDc0xwdE1jM2wzcGxDTlZQajN1dnRISEJxdEFIbmh0?=
 =?utf-8?B?aE1rV0ZuZ2ZvNXZEYTB6a1ZLbDA5aHpTTk8vVUxWZEM2S0N6cE1YK2tCNkRa?=
 =?utf-8?B?aVFVcEhWUzMrUGFuU0FCdzdobFJCeklORmJyOERRNS9CemhPTTdjZE5rTXRm?=
 =?utf-8?B?SjN1ZFBCTUlMbHFraVJ5Q0pBZmZ4aGN4dUVvcXJ1SjhWV2Z2ZVhZR2tweXE3?=
 =?utf-8?B?Sy9nVGJZWmZaeS9oVUE5b3RkWTBQYnhRWEVUUjFPT3FKcmxmSGhlVHRrSkRU?=
 =?utf-8?B?d01IREVuVCtXZU03bExaeTZWeFJrKzdTT0lkb0RETnNKK2wyUDdnbzc4dDF1?=
 =?utf-8?B?RlJjQnV1QWx1Qkt5UTVKUnZXWkhjUXAxemNobExRSEhKTm8rUmdkOFVnbEFv?=
 =?utf-8?B?UVhCT29jVVFTSFpTRGttblJpYU5LZVhhMGx5ZXJBS2hKUkd1ZFd0eHYzS3Yv?=
 =?utf-8?B?amFCUUFzdXR6NHlCSXVQbFpxcFJka0s5K08yYXBZUm9QZ1RGQ1ZiamRJb0Fp?=
 =?utf-8?B?Z0J1em9ldldyVE8rMWRpbHd3K1FIOGJCN3k1M3MrSTk4TDhsZXBIdzFvbmNs?=
 =?utf-8?B?V3J0emVBNlg3Z2RnRlk4algrcjAzRllXT0NGdi90YUFQTmtTb1RNYk5wL2FI?=
 =?utf-8?B?cG9LSlFLUHJwMkRFSEtvMEhNU2ZOV1doc1BETjZKRkI3YW5hR0ZweWZiUVp3?=
 =?utf-8?B?LzhLaHhKazM5T3V2Wm1qdXozdnlMK1ZxZDE4aW1CYkhad05jOTgrei9kV3J0?=
 =?utf-8?B?TW5oRmJhUnlkY2NsakJLN2Y0WXZBcGswWFNWa0tMQTlVRExreThHRXRkUDhr?=
 =?utf-8?B?bzNZU0pvMDdzcWZZdlBTVDRhS0dBWUxuL0t4dWtucjI4eWk0ZGVoREpvbHFE?=
 =?utf-8?B?d252cEtJWmY4STBCNWhTajBRMXZKNlJ2UGM2Q3d0NVRSbWlBYXJKOE5zK2lT?=
 =?utf-8?B?NGI4UGFRcldMeE1QSmJ6ZWpCWk14N09vYllGUHRtUkxFbHRZN2hxYkI0eG1y?=
 =?utf-8?B?WlRURTd4eVhUSEZZUDNISUU2bkx2YlR6VENPdDNpcEtzRGdUd0cydGNGNHVS?=
 =?utf-8?B?cWxzaUhjQlYyVklCK0ROTHVkUEY3VDdaYjJsMURYUURIOFFzUmU3cUQvZFpv?=
 =?utf-8?B?U3RzTFN4Ui9qeEpMZEw0SEpRc0gxMVZTb3dKOUptZmtMcVRUL2l2QU5SU0I3?=
 =?utf-8?B?Yk45dVNDYmdqaXF6Y3FqcHpmOTg4QzNkalQyVEhpUnh0Ry9uSUNmM0Jkb2tZ?=
 =?utf-8?B?STZTdGJOUzBWazBRZ1JzcEd6SHBWemhRU21PRHJkUDJBVmJES2tIV1B0TXNY?=
 =?utf-8?B?dWxrSWhQRzI0c3VXSHQvd2UzYm9OenFXVFdrbmY2ZmNQMXBMVXlYamlmYlVB?=
 =?utf-8?B?UERtL1RtZGxzczFXU2I2dXhTWFFLbndXazlnL2JneXBkVGQreTlKbzJXT280?=
 =?utf-8?B?c0ZIbzVrL0tjWk41OGtHRGIwVjNGU000Zzh2c3RORVQ2N1l5clFZWDRlMW0x?=
 =?utf-8?B?N2wwc2hNZUZkVVI2UHVsN2FEc3ozL2ptd0NIOHRWUlhUb1B1bm11MU5DYlJt?=
 =?utf-8?B?cmxZdFVtamcycVNqOGVWVzVTaG56bFJVa3BURFlmV2JKeE1OR1NnWjZLZFhK?=
 =?utf-8?B?aVVWL2V3MjBPd1RrTFQ4MTBhMFlYZHNtSkEvdUR5VDlEeFR5am9UU25Pa3NK?=
 =?utf-8?Q?I8KRjTAbSRaxUqBBF2jDuB4=3D?=
Content-ID: <020B1A5085A28E46B9BA99C5C762A7DE@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4565.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f42e044-b26b-4b0d-9479-08dad7f6ca32
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 02:00:17.9960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPY0TXyKxGvDBbltYrfr/qwkM/k1hr+eR9HP0MMkwy6uvdNHly8Lzs6RXHwsaCxz4uplw5IgC9hIWJHxVedY14rRD+61KxALjBHwHm0MYJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_183105_757121_22686836 
X-CRM114-Status: GOOD (  21.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Angelo,

On Tue, 2022-12-06 at 13:19 +0100, AngeloGioacchino Del Regno wrote:
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > > > mtk-snfi.yaml
> > > > b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > > > mtk-snfi.yaml
> > > > index bab23f1b11fd..6e6ff8d73fcd 100644
> > > > --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
> > > > snfi.yaml
> > > > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
> > > > snfi.yaml
> > > > @@ -45,6 +45,13 @@ properties:
> > > >        description: device-tree node of the accompanying ECC
> > > > engine.
> > > >        $ref: /schemas/types.yaml#/definitions/phandle
> > > >    
> > > > +  mediatek,rx-latch-latency:
> > > > +    description: Rx delay to sample data with this value, the
> > > > value
> > > > +                 unit is clock cycle.
> > > 
> > > Can't we use nanoseconds or microseconds as a unit here, instead
> > > of
> > > clock cycles?
> > 
> > The clock cycle will be various with MediaTek SPI NAND controller
> > which
> > clock frequency can support 26/52/68/81/104MHz...
> > It`s may be easy to configure and understand with clock cycle in
> > unit.
> > 
> 
> Yes, but whatever clock frequency we use, the target is to always
> wait for
> X nanoseconds, right?
> 
> Waiting for 5 clock cycles at 104MHz is obviously not the same as
> waiting
> for the same 5 clock cycles at 26MHz: in that case, expressing the
> value
> in nanoseconds or microseconds would make that independent from the
> controller's clock frequency as the calculation from `time` to
> `cycles`
> would be performed inside of the driver.

There have two rx related timing properties in spi-peripheral-props.
The rx-sample-delay-ns have been used in Mediatek snfi driver to adjust
controller sample delay.
However another spi-rx-delay-us is in microseconds. Take 52MHz for
example, the clock cycle will be 19.23ns which lower than 1us. This may
not easy to by one clock cycle.

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
