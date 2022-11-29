Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5C2C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Nov 2022 02:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2oCUY864OHFzUa3Aess76FPKK+Q1RTAnhlvrlulfAY=; b=zN2hbCL9OF+keM
	ef4enjs7Js+8nXp8gLaaDXlCY/RcRB8+gmSoptbXpeix8zpwkS2GcZIgp8QzN6Nw/EC3t0FjS+ZRL
	0+c+KqfT+zO8F5e8Vw99GZv4Mkc0qL9aj6UvJxHauV9elEBAGwALeYA2mVg9e/94siNSuHi21gJTj
	rKOPzjVgzkwg30OFCHJT3V1W8iogBQf4z4mFzxiovCt6ErAqo22FiT12ubO/QOwXI0GAvL4IFrj1o
	rIHG0BPE137t5stu15Du33+5S9KVxxmKVO5fRQq1oA9qgiolGk2CbGyzhNEHNDGft7xcymYkaC+LD
	h7ga5toqWAzrXex5sNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqhy-005TVv-Bq; Tue, 29 Nov 2022 02:50:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqhj-005TR5-Oh; Tue, 29 Nov 2022 02:50:41 +0000
X-UUID: 96bc7215a4d94674b60c9d3911f675c8-20221128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=C9CDXHL0X72PQOGlZ07wcv0QDFriiipL+m18OdVMpYI=;
	b=fYkjNPKf+WiLQsN6b+FRrqQ2+S3eagjGp1M5zVdyEJ5O8fBosalgSoaPQry63uBvWC0KeLOA2glmo/sGzXaldw0KyhTmbFYq8SqXYmBzTOzpAAg8TrzUp3lED+vp1YFXABftO0PLLr6jAiLxplD3uFCH30t7DgPyodq3GBfs9C8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:7a8e7cf4-a2d2-4d41-9888-a314d7c20b92,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:a4c01530-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 96bc7215a4d94674b60c9d3911f675c8-20221128
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 770098622; Mon, 28 Nov 2022 19:50:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 29 Nov 2022 10:50:20 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 29 Nov 2022 10:50:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXCHs7MwmP/KZIIf43hc21HNxA/vSIccpBc8CMD2L07bwLTHiugwGTruXGjIxJNdYeCm9U4x+X4AOT0s2Is1PmCwPa45Mjgh48Gy3V5Zml2/THTwI0/eEiNeVLOZuPl3J7T8nXwSeSCFbZlf8B8LGZssQ3qsIcqtB3GmOkaeGNIPl3iqtf3RPuwnRGJcM25K7IRDUyi2CFcEydX/K8Ohkqe0ZIIm/TekRo8PGA3Mi42K4kjTMhwYRjtHhaoMMDu1hzZLbRHTIK5RpW3JuRmz8mtX+ygM03MCMkuUQzc/KqSvOZK+NFtzPaHW7ux91Rty5TxJ+/rz8jtRmQKBH9fq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9CDXHL0X72PQOGlZ07wcv0QDFriiipL+m18OdVMpYI=;
 b=GW1mAHkTYdWbwYP7xvkPuBIJqNeym7vNJZPLwgmFStyfXgXdh3NFxXCnndTk08kHM4raQQD21dzieqIuFJCiMRVhkfrnOni0BCeSpEg/Hm33W2TKNqQu9Rc+OQDDRayN9uInfA7TQUwQTI90f7ibigTHQ2ad6z28/KwjvbpYc0A9a5mlUJzSPE0r9kqeTIMNcObHHXcc/3mC9ne9i6aEqJj8dDcn+llYGfPeOe9TYAtHegH5CfyFRNCGYq30gQtNv2c8ZIyKUTGLyIzD8kIQ04fOYdzlBW/4XtI8h6tHr87GGi/MwV1urv+xOnwbOrnzL92M6k/jUwD0UU7cQdMQvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9CDXHL0X72PQOGlZ07wcv0QDFriiipL+m18OdVMpYI=;
 b=m+xOfecxHvT3i+1IKTqk1FOvRLRJjHjuZi76CBF9Aape3R8BhVvMl2r0u8XNJ13oTxDrtzNkJhFbEe/Rhxt+7O3aWs8F45CuvZIBTIS5oDYxVMJBDCz6GELpgrCZYvo27oMT0CDiG6iBvkk9wtW51hLp8BCughsHP6yLHV628PM=
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com (2603:1096:4:84::10) by
 TYZPR03MB6917.apcprd03.prod.outlook.com (2603:1096:400:28a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 02:50:16 +0000
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::6f36:b7bc:7906:b179]) by SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::6f36:b7bc:7906:b179%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 02:50:16 +0000
From: =?utf-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
	<Xiangsheng.Hou@mediatek.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "gch981213@gmail.com"
	<gch981213@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at"
	<richard@nod.at>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
	<Benliang.Zhao@mediatek.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QmluIFpoYW5nICjnq6Dmlowp?=
	<bin.zhang@mediatek.com>
Subject: Re: [PATCH 8/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Thread-Topic: [PATCH 8/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Thread-Index: AQHZAs5lbo94HNi6n0KZExdn9VwqFa5UDc4AgAEnMoA=
Date: Tue, 29 Nov 2022 02:50:16 +0000
Message-ID: <cba02d8972da75f89d9f0c0e03765cee58b42f57.camel@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
	 <20221128020613.14821-9-xiangsheng.hou@mediatek.com>
	 <69d35231-0ac0-297c-d669-5566a926aac3@linaro.org>
In-Reply-To: <69d35231-0ac0-297c-d669-5566a926aac3@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4565:EE_|TYZPR03MB6917:EE_
x-ms-office365-filtering-correlation-id: 44595c6f-d6c8-453a-98d4-08dad1b47215
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7hFvSaiJd6ePNeGdzQWSDFfkoPeWsomtAn9DYZBGXtGWu9uiJA2gO77/wnHGDLgbANZg6/2xGJKtJeCZzWMk7MrHFWBNT9h3WgpTQpoYrIyRFmy/8N8O1NVPlgRuzbKAyhJrecATyrOzk6ETM7bTl4tS0mJdHUcRChJBFX4jUb0YpxIYI9oDKikiBz7kp7+aa5ylJGeHSFC/hGDeSAWd8ggurwZXo2ZuUDQ6byKIc2AkoDgwhgWh4XswIwvTc7aQ3XjpeVLjZONB0ZWQrcW+fRZ76nkZexa2iKWb+59wSJsneNoES/AHrFqNm0yAAmAiAHxpDqdO8L9CG4crl5JIVh6VfodaVO3LggDYAuNSKoFSgxGhhnnP3T5zO+e9Q3YwSKvIFPOjbF4O+1ieFyFZ5ZZbq34D7QWhv1twvoww8TJAo4OSSDNNfEHRsUK39AHmDi0f9chBNu/CkbXYilOoacxQvsCc/t1rQYUrrhkE1L/qYH4f8MiMY0XRSy1OE2T+V/dCYGNRKQjPY/x1uMSgXPDJYkine/m/l8YYtEs8iQLitlFzlnyywsMyICvylqugKkapE6SMjIMeG9Bzgjs5u5qHfKoKrbwdNLITjhVjiXP7If6FSZYRN0hEg+PQ9eEJFZzquinNr/RB6gXBkgoR3rXVmliDe0p3geAdxXsKztXRrwYrwkRIFjtR7yQmNaHSKeHQ8tBGCs/KF6//fJnSswUU+3k+xgGGaeBlpEnQIzOkQctz5pfYHz/w6vUvsY18
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB4565.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199015)(36756003)(83380400001)(85182001)(8676002)(4326008)(316002)(66476007)(66446008)(64756008)(186003)(66946007)(66556008)(76116006)(2616005)(110136005)(86362001)(54906003)(8936002)(5660300002)(38070700005)(7416002)(4001150100001)(122000001)(2906002)(41300700001)(38100700002)(107886003)(6486002)(71200400001)(478600001)(53546011)(6512007)(26005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFN6K1pJUnIzR0tnc2xnQ1V3MWUxMGVIdlEvV3g5VVFLSDUwZXZGa09NcnNM?=
 =?utf-8?B?d3pCUnF2dGN1blh6YmNNWmUwMmJ1bkwwdUNTRzNqb2pOeWYvbHZ4Ui9LYWZR?=
 =?utf-8?B?WWplRFJ5c29hNzYwYWdTWGx4bnJPQmlGWGd1RUpnd1E2TUsyaTBkK1dnL1h0?=
 =?utf-8?B?VjdObjJnM1p0dWMyZzNsUEpvRlV5eExWSUlhYlB1dHR3U2VpMUpoUHFGK1VC?=
 =?utf-8?B?QXN1Unk0SFpPYjR4c1VvTmJOc01ZZkVyYjExUm8vM1R6WTZqQ3pUSWJTUjFx?=
 =?utf-8?B?MHR1bmNoclptVWNldW9kM1haVG4reWZPZHVSLzBCVDZQczIreHU5N3pzMUJs?=
 =?utf-8?B?TDNYS3l1L0t6YXlnMk93eUpLYmFxQnFadHp1UC94UGw0emhCakpDdmxpUW56?=
 =?utf-8?B?MUJaeTROQVJqdTRnYUlDUktnRVJCbC9tc1JoTUsyb09ycUNSVG40UDJMSUdZ?=
 =?utf-8?B?ZTZQUHhPdGVYcFZmbnJOenZJVlp5R1E4VnBaWU5HWWhvQ3RGSGszc2VMYTdo?=
 =?utf-8?B?OEN3bVM0cGl0VkRxSjRzdVVqVVg5eHJHdGhFM0lpMWh0RGdYQmRsRnF3RHVj?=
 =?utf-8?B?ZjN2VkRRRzE4MXJORDM3bTAxcE1zNEtYR1kxV1dKblg2UmNTaERsdXV5NmJP?=
 =?utf-8?B?UGlmeU5yTUdlOUZOdU0rK1I5d094ZU9lZVcrbXBKNWtsU2VvTWdsQXIrQ2g1?=
 =?utf-8?B?ZmdHbTZuU1dCaXVaZlBmMCtnOEtZcU5uTzdobDB5cWwyQjZNKytVT2hSZmZp?=
 =?utf-8?B?VGF4aTRybU91ajE4ZmJLd2RoUnllZSt0WkJUVmFyNzhWL1Z5YjE0WW5YQ3Zz?=
 =?utf-8?B?QUtjV0dRK0RqYm5YUmdZSEJpRDF1WVpOY010Y3JvYjhVZXpUZEFaMnFRbzJ2?=
 =?utf-8?B?Z0dlOE5GdVIxbXlDZGRZb1g5VG5jbTEycVJ6aWgyMUJXRU1PaFNFMEdRS215?=
 =?utf-8?B?a0VqS0hvL0hkRmVPUlM5ak1mT0ZibGx0alpCenk0UTJhNWpkVXBlMkU5T243?=
 =?utf-8?B?WWNiTzl6QmhwWWlaNVNVbUNtRFhsWTRPZUJYSEFDbzlyOFpEMHhENkR1TW9Y?=
 =?utf-8?B?VXdEdFBQUHNWU3JXU0pLQ0tFR3pVVElSd3hwa0cvWUYwKzhYU0NCcHlwUkZM?=
 =?utf-8?B?OXRrajNzb2VqS3R1ak15eUJ2cVEvNzlKWEtiOGY1ZGtRaENaOE9BR0FZaXEw?=
 =?utf-8?B?aUtBVWYycVplT3hXdXdHL1ZSWVI4K01ZbEF6MkY5cEphQzhBMGNUQWRISHZ5?=
 =?utf-8?B?eW5HZXhubzVsSFFDcGNQRGtaK29RT3VQb1VrMnhyZkt2cmtjNHczeDJiNU1k?=
 =?utf-8?B?QzlDODhmdlA0NWpNdDl6K29HTS9Hc2R0aktoNmh0QllpaWhyQWtSMjY4a0xN?=
 =?utf-8?B?WnF6RGttMkd2RWtodDRGSEwxS1ZNSFZ5NWplTTB6b29iYkdtdGdFT1ArbXN3?=
 =?utf-8?B?K202K3FGM3V6RFNWM1BnQjdBL0sza0RXS2VoaElmS1JYb3k1TXhaa1JSbFV2?=
 =?utf-8?B?M0Jja292amRkMTc3OVEyZ0tZbUx0aWtmdGF5Tzc2U0lrSFlGUnBEbkFNUHN6?=
 =?utf-8?B?NDBBU2g2MXFEN1FWUlBteWtGOGlHcU9FeXEyUnlJWU1mRWNvZkNYV1M5eU4v?=
 =?utf-8?B?S3JIOHpLSFE0OHRTbXg0ZFBPTlU3aXlzY3ZDRmNRY0JScmR0WXJpb1Z2ZS9a?=
 =?utf-8?B?c2hKcFJYVUtKa0NLdVM4SHlMUjRGcEJsSHJkWTlmM0xIaTdTS1FPbFA3OHlz?=
 =?utf-8?B?bnRJaGVJL05tRGErVGFMUEhuSzgzWDJ1SnNPWkRFRTRBRm5lR0k3NTdWeWdq?=
 =?utf-8?B?WHpIM3lqTHIwR2JYTFdxa3JRdThYM3UzS0xRMXhqQkpTZ3NrdVhDYWFmd3Rm?=
 =?utf-8?B?UnU2QjlMdklPYmg4Qyt4NWl6NTh4emFtcXA4eXRNcGFIN3JZME9ya1RwSFk2?=
 =?utf-8?B?QnlsajczNVZZa3pvS0VuQ2FlMFhxZ0t2eDR0YkFSL2ZvTUZJaktUWlRqNEFC?=
 =?utf-8?B?emxLUUdhamFHMlJqYVV3Tlp6UUNYSy85MGEzaGYvNmp2R1Q0K1RnYWkyaEhG?=
 =?utf-8?B?VUN1dzNKZzRpNURzaHFYdzNTa3FzSjFkRzZlMEN4aElxRHNGZ0tsbGl5ZkhX?=
 =?utf-8?B?OFBNV0tSNjNjb0FFV1BxSXRJbEpUaS9mYTlNdGpZS21WaUgrYlBaSGNWRTFk?=
 =?utf-8?B?ZVE9PQ==?=
Content-ID: <AC9C71091DCB0843851F83A1BFE73C8D@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4565.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44595c6f-d6c8-453a-98d4-08dad1b47215
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 02:50:16.4214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0rFdINXRErs1qzql3TbMQwX71Bnxe8jBAl/gq87mXis7tW0PDl22fghXD/eu7vxzSN3aGEYtQvLt5DHjwGsWbgS+cTaEawFkiCU5Bzt0/bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6917
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_185039_839982_E1C40C7A 
X-CRM114-Status: GOOD (  14.24  )
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

Hi Krzysztof,

On Mon, 2022-11-28 at 10:13 +0100, Krzysztof Kozlowski wrote:
> On 28/11/2022 03:06, Xiangsheng Hou wrote:
> > Split MediaTek ECC engine with rawnand controller and convert to
> > YAML schema.
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/mtk,nand-ecc-
> > engine.yaml
> 
> Wrong vendor prefix. Isn't it mediatek?
Yes, will be fixed.

> > +
> > +  reg:
> > +    items:
> > +      - description: Base physical address and size of ECC.
> > +
> > +  interrupts:
> > +    items:
> > +      - description: ECC interrupt
> > +
> > +  clocks:
> > +    minItems: 1
> 
> Drop minItems.
> 
> > +    items:
> > +      - description: clock used for the controller
> 
> Drop items/description - it is obvious, isn't it? Rather maxItems: 1,
> Unless controller is not obvious in this context - about which
> controller you talk about?
Will be dropped and fix other comment in next series.

> > +
> > +
> > +  nand-ecc-engine:
> > +    description: Required ECC Engine node
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> 
> This does not look right. This is a property of NAND chip and
> original
> binding was saying this as well... or was it called ecc-engine in
> original bindings? But your commit msg did not explain any
> differences
> from pure conversion.
The MediaTek NAND controller driver have change ecc-engine to nand-ecc-
engine property. Will dropped and explain the difference in commit msg.

Best regards,
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
