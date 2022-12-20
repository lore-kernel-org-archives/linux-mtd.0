Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53BDC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Dec 2022 02:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPFSnH+9gaEXVZKdoz173lbZ3/0wOZWRhr82lufH4z4=; b=jeV1UG0cz0FITX
	7Ijga1OcEHQaqN6Q/coa2RG+HyysPDpum2e+7Zod6MUwXaylGeexykWfCJISMMKyG2ClUojKB5hgD
	VmL7bedrxsz+AMYPMRzr1MQ3dPC37xn3QfgAhLIOkDm/RU6TgAx7ZtGT6AmwJgZ/lcWzJEh9SU9FR
	/slp9IuGgvXFwx4HV+MmJo2ZSosLWjhw/aAJO9XxcpFfLZOunD2giIG5NDxLGYK+f7bAnWDH+U+UG
	4/EJB6R+X4iZzgJbIn243OtXzY8+Nbropu6wfXEu7lE+AQtS2mM8APjqGp23Vmqiexap9sX4dSfin
	x7x72p2Z+XeTLuM03uZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7S5O-006rAv-Ue; Tue, 20 Dec 2022 02:10:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7S56-006qpw-VU; Tue, 20 Dec 2022 02:10:15 +0000
X-UUID: a5c35a70778a4330a3babcdf4e666e32-20221219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Rxq5GbgXkwqoTxsnfUluTCBpYdkufBZKnqiG84oXhOA=;
	b=EbzrGyXEXpdjgFRH31FolXaUnhiOjJP5DtqVYKqsmNbuDHpHhs18WAzYXGFHeCYiZm3THHvWbyuB3s41az7/TgVEgmwXnQb2xTxHtiE9IjqAlX/56AsD3c+X/ZJ4A573z42SlpM38KiQIaG87bi3yaVOQ5wZ19tIOyBc9v2cCxg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:b4dd1f5e-e30b-46c8-af17-98dff5a5a0e9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:1d3ad489-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a5c35a70778a4330a3babcdf4e666e32-20221219
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 689844283; Mon, 19 Dec 2022 19:10:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 20 Dec 2022 09:59:32 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 20 Dec 2022 09:59:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feGf5eY/2cP2U+qpucr4Q025DXfXl6ludv1J830/Fwn4nhaOJDmAKNFRWCwcMDp8FN65hAvLiMcnx4QyOxeFTxWv4jHTdm+CZySBnhj/11momBvyu+Fm7gWNVH42XuHUR/6VYHREng88fhWDIq7eqJScBy4TspGnA9ija4s5T+yuyt71gyIyyX0bVZR7hHH2wf7g8WN3dEFrHmZ3ExA6UXVIYLdxA2T3ylPP4KONY97hDlr0EyxxrvMm20sdEWahAEBP4ngS4BKWyT6MdzNSXYkMaJmEb7xXFA/Cki0xiirTJlwRu4/yeA7Ci+Wch3JOfLBkDsRecn9LSwcrqztAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rxq5GbgXkwqoTxsnfUluTCBpYdkufBZKnqiG84oXhOA=;
 b=bUWA+Smm/OpL/f33zTdOx9afD+J/XNCFp9luNg2GmTzCw5nrQz+jvFq66omm9IOIRHDJXaDxDZNMPsLLRI0nhCBFV+rw9/Mfm3E3jr7/sjlvfX6H6SPOeODdLdhPdql1ZgKfyfvZE7IxNULegNRbtSN4sf+VbEoo024c3lTmUXNIcXI5qCgOgtI74qQUMeiF9fugrJB0I9HwiWiLeTkpu28vhgkKY0cnQMguASJt1jF7K2bpdAYYEXRUUz8Hb6gbyz23hXXh+i8yrq8/1/h94hE6g7BW4HYeas4fP2KDFUYZLYxbBG+Op8ggQsfyUTfEmlwBh81C+KX39Ke3E1nUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rxq5GbgXkwqoTxsnfUluTCBpYdkufBZKnqiG84oXhOA=;
 b=LDSJH/VYuiV1ePtkxAb5KrB2wzdNxYQaLUmkmSvvS9FLWC17XLhT7Ugige9ga3w/lvYJkcKKJXNDSoT3md0J+iRh8UeAhC5Z883/m9hnqjDCypmQKigGKJBcuC0dTA50zYVM5mx0PT2GfgqKGX0X6xKf6LhlbVdKAi0DyeRCXuQ=
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com (2603:1096:4:84::10) by
 TYZPR03MB6766.apcprd03.prod.outlook.com (2603:1096:400:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 01:59:31 +0000
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::3d3b:d288:88e3:59c7]) by SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::3d3b:d288:88e3:59c7%6]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 01:59:31 +0000
From: =?utf-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
	<Xiangsheng.Hou@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
	<Benliang.Zhao@mediatek.com>, "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?QmluIFpoYW5nICjnq6Dmlowp?=
	<bin.zhang@mediatek.com>, "gch981213@gmail.com" <gch981213@gmail.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH v5 06/10] dt-bindings: spi: mtk-snfi: Add read latch
 latency property
Thread-Topic: [PATCH v5 06/10] dt-bindings: spi: mtk-snfi: Add read latch
 latency property
Thread-Index: AQHZE1NlW1LZ/Cebdk+J+RhG49Nd1a51WUWAgACteQA=
Date: Tue, 20 Dec 2022 01:59:31 +0000
Message-ID: <9ec0b502a15bfe5717a5659b3c597b6dd6f0b629.camel@mediatek.com>
References: <20221219024019.31974-1-xiangsheng.hou@mediatek.com>
	 <20221219024019.31974-7-xiangsheng.hou@mediatek.com>
	 <20221219153837.GA1426412-robh@kernel.org>
In-Reply-To: <20221219153837.GA1426412-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4565:EE_|TYZPR03MB6766:EE_
x-ms-office365-filtering-correlation-id: 645d9a69-608f-4e3f-f06c-08dae22dd5ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PB0qkL0VlOiNaf++ew3UVf9OuT+nMgjSAe+VfXvrXX00vW8msnVAY+IFE1rIoinXyl4Irv0UNN++P4E3XsaUOwjUFeSMzp31H8Q+eSLDl3ONPvNtK0WvfoixHAqIQpkKrBwCc5VvOUJ5VAEt9Qt0SGUcjStYJsgWQ8cV8n3p6aRZhgf0MWDhU7j3S/W0MCNJqIJwWxwi1xKhaiKgjY/ZktIfathmlSFN3qzCq0hyghz+rybpCgxj9B0nDU+KgaQfjg5ORIBw/lTDvLptvs3biabSO+7EGfkVORR4Y4OxJMeXr3U8cLKTyn32CPI+RwxJ19KN4JvVyFSCB9/GISYh8Wn6CCzmq8NnypnN8h5KwcKilzGjEDSxDGP+esEwFDVGShNFWTLLxRjxfrZK0Wzq4zVpUaPxSReFwYDahY1aptdTAIVOUhX/RdYfdQWV8A9HQtrezLtvMMLI9k5kBbv59LvY9m1ZpU1dwsEDhMVfcKhPAgZRDamQQypn4nsT1wogK3JzWz4pdUhVy22YgfDchj47G17NW5YoC8wEkid8o7/WQY0qiOEYG8QcIaEMSYCaMNss+TfnhjrcDcBA3VpqgTG1O9sKhFVY+2nT2zhfplwsruuYss2YEwdbIUIMA1TpvIc8miYo4PA+1pZByCAySejjpfKAzAPafe4fJt6fsZxoeLXUPV0K0G37NhDGAUzmipGUWTzYelR3vYMvn1NqRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB4565.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199015)(478600001)(6486002)(6506007)(26005)(6512007)(186003)(4326008)(66946007)(316002)(66476007)(66446008)(91956017)(66556008)(8676002)(6916009)(54906003)(76116006)(71200400001)(64756008)(122000001)(38100700002)(2616005)(41300700001)(2906002)(4001150100001)(7416002)(8936002)(5660300002)(85182001)(86362001)(36756003)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjVjWVZTSVM2YzdGejloMTc3aGR1RjdIanA4d0I1d0lORW16MGIxMWNXVzdW?=
 =?utf-8?B?cTcxbzB4Ym9Fc3BPZnl3NE1ieVdzWXpNRENUMlFQYzJPM1hid0x1N3R1UVJI?=
 =?utf-8?B?azlzaXFsUjZVeXYxS3B4UVk0cFBqc0FWVmorbzU4aDdPcHRCd1FvRTVZNkRQ?=
 =?utf-8?B?Y2xVNkowSVFQZ3h4b2syNjVxWVdkRXc2SktKWHdrUHoyWWZWV2tDOTVqOVIz?=
 =?utf-8?B?RmNOVlNKNjlIZU9SY3BudzJrS3JnYmgyK2ZLaFBzQ2pvdzB6cU91NFJUdUNW?=
 =?utf-8?B?QVpWdjcxKzBkc0RBM2tsa2g1Y0R4WUtadCsrMSthK0ZkMXZ6RnVYakJKUG44?=
 =?utf-8?B?REFSU09nU3B0amV3aEc3Q0hESEN1bHVyVmgzQlNTWXhxYUtSem0yOEJtdXdX?=
 =?utf-8?B?S0dBay9HcHRmQ0dkSG9KcGJaTjlvUU9sd3VFNDZyY0NRRGxkR0xwRlVrVUQ3?=
 =?utf-8?B?aXNzZGcybHgvTVc3VGc3a2haYmQ5WWZiN3ZaUmY3ZWFIZjdBZXROb2FqZkF1?=
 =?utf-8?B?eTdHYWlYOUMrWERWZjJFb3NNdDRjOHVlRXlCQTk4QU9lUE9mQTBmVm5HS0Fo?=
 =?utf-8?B?Mk1OdEo1Z3hrbzNPMHZDQTlGbkdMK1NKMTUwSlpsNGZLRm1CY2ZrU1pmS0Jx?=
 =?utf-8?B?S3ZIVkVxc2p6Y1kwQVRFSzl3RkdZOGRZRE02NG1lUDNuTk1wbSt4eUVLV0ZE?=
 =?utf-8?B?NyszU29nc1pHNUdUU1RGd1dFemJOYmJrMTdITDNYMFFqUEp3alVPNjZQaDNK?=
 =?utf-8?B?cFRwMVFsY1pYN0gwUkdkUDFZQzc0c05FRU5HVHJudndOUzFzbm1qSk5Odndl?=
 =?utf-8?B?Sm4ySi9QcUhaaTUzL05UZXl5ejY3ZDk3STdJSDU4ZTdRdDVtM0JUMlk4RXV4?=
 =?utf-8?B?OTNpVHdYR2lwZTR4S2FXLzZVcXpiVFFSK2hndTkzNStnaFZkNVdGMGxQV2Fq?=
 =?utf-8?B?UWxzaXdRbzVobGx3aXpybllrUHh2dVYvT25adDJselVPbjJHZldqU1dOeUVC?=
 =?utf-8?B?UDFuZnNidkxrbmtBeVFQTWlLRXBCdFBZRjBTSExhV0Z3MVNCNnM2Uk1rdDk5?=
 =?utf-8?B?VGJUcEduNG54ZTF5ejFMa1hLdXFIQWJEOVBoclcwZFU5RHlXb1NpVjRXU2c3?=
 =?utf-8?B?NFZZdVpabXdXWGR2Nldqb054L1NwdG5MLytwUXhJaE1UdUE3b3Ftb0pqRFhn?=
 =?utf-8?B?Y2tONkM3ZXg1RndpT2FLM0k0dVZTN0R4SGpsekNSRzVHRStuT0d3TVdIMGMy?=
 =?utf-8?B?QUw2dHZyb3I4bnpXd3h3ZkFyaVZMaDJUVGplYXB6ZG9LYUE5SXNsUDVleVJK?=
 =?utf-8?B?eXRtL3c2Qnp4a05YU3ZkV2lJdGdhV0laRTNRQm85MHpSazkwRmluSG54MndU?=
 =?utf-8?B?Njl4UlRDZmhWanl6QzZrQWtzVnFlbkxvQlF3VTlPcEhCa3J4U2RwdG91NVgr?=
 =?utf-8?B?YnhZRnFCTTlZT2lBTytrRFZQOGJYNkFjdXhVaTZ0MDhUTzlVWlVmT1VwVmVM?=
 =?utf-8?B?YlloY2hvVGcrc2xQQ1dsa2U1R1JjVE9XZnFMRklZZUVod2J4SUJPbS9Fb3dz?=
 =?utf-8?B?dlJzMXhLeWhVTlNKalpMMTh0WWVPOWpjTm1hTUJZTWFRMHlNZ0E3NytqZG52?=
 =?utf-8?B?ZjdlWEhYWHNlOUdDUGFUTU1qVEYwZ3l1YTFsdWM3ZFBLM1pHT1QvRU1QSzVk?=
 =?utf-8?B?bCtmOVcwYXdHMWd1bGFVb0JEc0s3TUNmbC9KYnMxaHJiYWxLQkZERlJpMlow?=
 =?utf-8?B?b3BSZ0RvV3JEWFN5WCtnTXZZdjU3N2pJK3RxS0wvdkRjTWFNclNBek1Jb2x1?=
 =?utf-8?B?L1huYnY2MTF1YjExMG41Y01GbDZIOGE4K1ZFMHpnZXNJRXgvZzQrcVNMUHJz?=
 =?utf-8?B?cGVJcGtMNk1kekcxYytwSmRSL0Z1REdOUnl4U29aNEZvbXN3ZmVsWjRuUWZE?=
 =?utf-8?B?M2hpalIyTzZ3ZDAzMjBPK0NOeEU1RWJYS3JoaHZ0eS9VaVFwNTFkMGs0dlpY?=
 =?utf-8?B?WXVyWnhrM3U0a1FjVTNZWGUyMTZ3Y3Vra081cGtwc2RQS25GZ3Zvbjh2SEla?=
 =?utf-8?B?UEZEc292MlhCcnNQSnRrczU5cStjWVFjd2gxZU5GZWJCL2VVd1RGc1pHNjZQ?=
 =?utf-8?B?M3lGSEhNaUo1YlV6djBlUGlzKzZoZnhHRHlFM255WXB4Rm9aOTBKUTNmSzRl?=
 =?utf-8?Q?O0iDlNbvwaeLE0cMgcIWz74=3D?=
Content-ID: <21B9D70D938D13438A8137B012F905C1@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4565.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645d9a69-608f-4e3f-f06c-08dae22dd5ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 01:59:31.2007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kHSp5yxP/8U4VWLNcF/o9irI/IKN/UxbkRAMpSymVwi7n/Uvm255ClIKePpPEUNPL8xFjYCMifkQmHwLXmqi+5KvZ42LXE+Bjl2KUtKAQFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_181013_212487_DCC3C764 
X-CRM114-Status: GOOD (  14.08  )
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

Hi Rob,

On Mon, 2022-12-19 at 09:38 -0600, Rob Herring wrote:
> On Mon, Dec 19, 2022 at 10:40:15AM +0800, Xiangsheng Hou wrote:
> > Add mediatek,rx-latch-latency-ns property which adjust data read
> > latch latency in the unit of nanoseconds.
> > 
> > Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml         | 3
> > +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mtk-snfi.yaml
> > index bab23f1b11fd..1e5e89a693c3 100644
> > --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
> > snfi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
> > snfi.yaml
> > @@ -45,6 +45,9 @@ properties:
> >      description: device-tree node of the accompanying ECC engine.
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >  
> > +  mediatek,rx-latch-latency-ns:
> > +    description: Data read latch latency, unit is nanoseconds.
> 
> Doesn't the common 'rx-sample-delay-ns' work for you?

The driver need two timing related parameter, one for sample delay
which have been used by rx-sample-delay-ns. Another is read latency,
just introduce this private timing property since the common spi-rx-
delay-us is microsecond in unit.

Thanks
XIangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
