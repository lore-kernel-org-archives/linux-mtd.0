Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B995C4708E
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHTC0JJNVdXy/h+EVQgAnEhdSh1Pp1u5no1ih95pZG0=; b=awnh609oUEAzvo
	zt+u4WlaP9io8xgWbPZCmsnh5QC/83kxBUz1d98Pz5Ktp7ycVq2ucRySCSipwsXkVvKRXK8ko7Ogx
	NRqpRrljA/pd8ljIrnCLpQyn77yDhutYgcAU78xI/NNvtfgPj4LfDap6rxyTd34jmNsomoI3ySXo7
	KMWqwqkxhrX/bVdLmqnZRIVJL58dogCcmUsA3JUtvAyHKLatVM4PgIBmkDD06FjPLuRVCAXOWm8aJ
	aG4KKg6IcRT7fomTuhfBWWm5OwYCXdzBxn6cQ5OYHssXU5I1FSr0d0JftO+I6AD87eLTyVw3AJyBp
	ZVlKhUWaWHda7sm8P4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2UVq-006OVu-EG; Tue, 06 Dec 2022 09:45:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2UVd-006O8Y-0S; Tue, 06 Dec 2022 09:45:06 +0000
X-UUID: fbca5c8d41f1448e85c60e268e9d0aec-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5Z0CVg6phaVsVtzl8OqwgQ6F25Fdy1cIj/mcSKVeXIQ=;
	b=K29oW0PRDVk83lUoo4uMLlDZyPpWJyRSOkMJs3i8byKR3+N2v6jWisy1gHB1Lg7thR5n1iW3lHRM8wB6/NpTJYUNIGKK6mQWxx6rFZXKd3o0hPGA8AdanuHjUELG8wIBYZSyUOs9AILOdQFHjY1f+NFV2loue0V54qCRKK0aSUc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:fd7056c0-7ca3-4956-bf7f-9499ca8b2aab,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:2f977524-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fbca5c8d41f1448e85c60e268e9d0aec-20221206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1809503193; Tue, 06 Dec 2022 02:44:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 6 Dec 2022 17:04:23 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Dec 2022 17:04:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfDKudQ090/q0W5FzOjmOnpimxHeJWsQionXDZ+C0YvgYasJGUWjyz1qVcpyhnNxAr1NdAwSGPV2ewKNVUDZ5NBmuErU76dZ6BtdmZnflmWQZ5/KvogQKFS9GZrU7USofep5rAwBFtNId8fqlNEVJNyAFHGk7P3jJcp9r4tsRaXtTXeZa9NjkaSWyzCefCn/5eu6OWClWx3vZgSaFhAKucRRH/VWUzhKL1GNdrPG2SDPWNF53jlqrAoT4OV+kxReGDnl6CmlvxMOr9l5oWjTOySF4Zze0BFY8MUSX7IGWfpkmPrhNsQ2T/MEwMxlGaFQnQxioemt+mkJyA1XJFM5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Z0CVg6phaVsVtzl8OqwgQ6F25Fdy1cIj/mcSKVeXIQ=;
 b=JPBYAlO1ZkH+UM6r99foENW19jrzQydTHxtzlLfEJsQFNB71B0AEIjKlN8a2lXWZcjkzkIgZdEeDPF+Rhb2Q+ZgddwiXA4jE4K8hHz3gv4APGAWNL9Hfew8KF/miRIVUrZJibVeZB5A+lfMAWg8codLQ2cAz1sSQZ5J+Ra59j0a5i2uNjBD3D2zr77yf6DJNRQE1scg5kSfV3QixWgYt3k1lgCQ4uAoxSEmzb88deIY9f7y4YW5tKX4WyQhiAxQFSLSQ99/PeWDPUYCGfFqnpjIreOFUC8SN2w6k1XZl/ARyGjq1AVcN8PCnKjhVwaTCLPEha9T6NFYiTl7C0RoPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Z0CVg6phaVsVtzl8OqwgQ6F25Fdy1cIj/mcSKVeXIQ=;
 b=CT2zuZkgTtVJDU7IWMToTC3S1gZ3SQEx/vcGSQEcpU35XUK62jXRl6kA+GAF2VaApmmqs4x7HISAQRdKfhGIs8v3KfJZz94mLxRkYn6OUoXu+zH9xy/oRcFdMjAA62EzhQrrSC4sFybqGKYVsegRnZrKlXtLxzNGAQwQrq5nfh4=
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com (2603:1096:4:84::10) by
 PUZPR03MB6159.apcprd03.prod.outlook.com (2603:1096:301:ba::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Tue, 6 Dec 2022 09:04:22 +0000
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::3d3b:d288:88e3:59c7]) by SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::3d3b:d288:88e3:59c7%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 09:04:21 +0000
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
Thread-Index: AQHZCHcIWFb1SQ8l7UecaYFwLXxxLa5fWMwAgAE5uQA=
Date: Tue, 6 Dec 2022 09:04:21 +0000
Message-ID: <a8f706b37f5decf91bfa9a9ac8cf04be4346dd85.camel@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
	 <20221205065756.26875-8-xiangsheng.hou@mediatek.com>
	 <ce449a0c-efcc-0ac1-fb8e-c2b4148a5bc1@collabora.com>
In-Reply-To: <ce449a0c-efcc-0ac1-fb8e-c2b4148a5bc1@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4565:EE_|PUZPR03MB6159:EE_
x-ms-office365-filtering-correlation-id: 0a1aab08-9931-499a-3075-08dad768dd79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /2Sg5K1bmpxb6IImdSvgU9xYmjnzej7SK1F56OCwgLN+AvcPgA1qvjsRS7JbZbe8X1NEC5uI/QJK3/CCPFIbqiPwi7NBuY5xI9nKtCgabhI1Dx142gUQTGYqmJoT2tg/SltssDcXYm6nnjS1TmLpVoNGGwufIF+yKYnnGhlKZQZiymEHYEoKDNy40rvgykcDFwrHhx2cde34006LEVlMooe+iVVgfTt9sCXdufTtxqpeThH17b46q27afk44zHkdj+kiVC90cOxfLepEiuQCalcB8VNQWx63lTuUrb7MNKVObI7fSsv5D4AhUBFKAlVaTobC7pxEonZ4+O6N3eWz1Ue86uRRZDMVSNI9aYz4YmdtDcSUj5SRvJEAyAvhyDN7jQmcr6rF1PxNk+9Sn5V02utqeHR8MecZlkKEnbZ9XfQFe/G8k9QllynmYKK3T3zWlZef8zLOWdTXp+RX5UMIGTlvyjcrQWEZctpknefKpiThMU6OKQRTuDCgeTfu57Cc/z1m7D1LmgT9+Nl4GiXwQm6bEgBiPuN6ovU6RlkfIbKw9EWNnOT4sUdUak9ic+4ore9hiImlfTH1AfVJYB6M5MsAxat4CYCWE9j77v95aSTbTALAL1RrYj8ZE31RXLNc05IXGhBTo2XEoC39i46XX8NBjkPB/fQv8o8u9r+D3oWigopZ/tL0EAVIbGxicRIIkChQ5DKb2+vsjSEm9ktsag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB4565.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(5660300002)(7416002)(186003)(110136005)(6512007)(26005)(83380400001)(8936002)(54906003)(478600001)(71200400001)(38070700005)(86362001)(316002)(41300700001)(2906002)(107886003)(6486002)(38100700002)(6506007)(36756003)(8676002)(122000001)(66476007)(66446008)(66556008)(64756008)(66946007)(85182001)(2616005)(76116006)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OStta3JJenpYZVpJTkprNE15WG9RSGxySmQ3cW9LZ0szUzd0cDlydWZscjk2?=
 =?utf-8?B?MFJOQXBVSGJiQkppMnNaWnc3OFdNUFdMZ0tXUENmclpoa1VpZUp2b1AyU0xG?=
 =?utf-8?B?b3hFYmxjZ0RQWVpiUVI2MUNkQjlHUUEyL0gwanRKVGxSbXVhelZiVnBVdnRH?=
 =?utf-8?B?RzFhVDhKbG5iZnhQMGovTDNqV1VLREpGcW9nc1FmMHk1dStiS1c0ZTNCSjNM?=
 =?utf-8?B?dDdScDFTekg5L1dMZGJhdWFJSWVvcU5vd1lDSkRwY2lyZDNaVkZLMDZYbmxI?=
 =?utf-8?B?SGxlUzladkNEL0Rpc2Q5d1JiZ0VvQnZKMmMwMi9RTVJyZ0VCNmlmeFJIdmZp?=
 =?utf-8?B?SHIvSkNjbGVTU1pUdkFYYys1R0lFWGFwTXNnUnhaR3dPQyt2aVpNZ3hrT2V1?=
 =?utf-8?B?Qk5ZQWd4L3J6dkVhN2ZxWHN5eHZMajAwNzZwbmh2Y0JkLzJQZnI3eE1NWUZG?=
 =?utf-8?B?M3Rlaktud2d3bDMxSW10TXFJVmVOOVp4WmlRMkZIMEU5R0F2cnRkYVlTYUh0?=
 =?utf-8?B?SFQxRmdxNzdrTGxBekFqbmtDT3FmdGM5ZGNBamczSkNRYWJVL3U0TkRuQTkr?=
 =?utf-8?B?MzFrRnNsaTNoSHYvWEV3Yjl2NEFreVhqWkhIV2dSeHNWSTNhMGZEc1BCKzA3?=
 =?utf-8?B?c3NFVkRvREp6TnREeXROWm9XczRFZTA1SFc1dk5rSWJSamEvMXNMU2dWV3My?=
 =?utf-8?B?ZXQxZHJtWHVvYi9XT3NhOE15dVF1ZkU5RDQ4bzRMcGUyaVZQa1hnU0NqVUxW?=
 =?utf-8?B?TWJoQlpqTDdSWDFzWTdxRnZQTVJwZlpqb0d1WWE4aElNVTFybVgzUkRxc0Z5?=
 =?utf-8?B?LzVaWkVDSVJRd0JOQkJSREVrS2lCNG9WK295VHNmSVQ5WThwcm1wRzZQeXlh?=
 =?utf-8?B?aTUyRFBzV3BMVnNkNlNNZ0xUV0hCQ1NsbHptNGkzVUZtYjNWaWV3NHErYU5u?=
 =?utf-8?B?NHRoamtLczUxRm9TMXdYL2pJalVrY3kvQW5RM25ZSHJPaEtQOUhZaWg2WXlo?=
 =?utf-8?B?dTdKRzgrb1RzdVN4dnNFaVAxbDBqaGllWmRwYTlEZlJqN2JCTm0xTHF4Z3NR?=
 =?utf-8?B?M1VQUEdiclQ2S042UDRhNTdTaXdXTDUyT285eUhvWFdpemc0Q1BpejFscWMv?=
 =?utf-8?B?eVphOEVYN0JTNnNRYjdsV2pCa1dWNGRyVDBrVTM0dCt6Wm1nQ3JsOW5nNk1W?=
 =?utf-8?B?ZVNxcGcvSUtZZGtVN0YrckpJdDRxWS9FcUJ6dkc0dzg1M0ZLb08zdXNrSTZN?=
 =?utf-8?B?dEFZVXc2aU5DTnp4ZFZCdHNrUUQ1UUtMaFBDaWtTaWNjZVpqSzMrL2tNcno5?=
 =?utf-8?B?NzZDcEE4OGpMVDcwd1NIWXZQa0pwbFFXUWJOUVBxWE9VeHIwODZrMTQwc250?=
 =?utf-8?B?ZlFuclJRNENoUWllcDVOcFVWRU5yWks0OHJCQ2s0azNWTExQRTlCNi9rMzFC?=
 =?utf-8?B?NERrNGRTbnNHMCtYUVVpZVBqOXdHcFVhK0ZHYjA1T0FrSnNHVHBBSUU0Sys5?=
 =?utf-8?B?ditob0tSei9SMXhmVFk1aUVIek02MngyZ2JORE4ycmo4S1huT0h2QkdBVGVN?=
 =?utf-8?B?a200N0JPWkhrdS9leHU5VHhRMUdJc2VWbEI1UHJZY3hkd0xWdFV0NUNGbDZ6?=
 =?utf-8?B?aUVsZlhuRW8xM3JZYUJKSVdDM01GVW1sZHhEeTFMdmFGS3dGTDV1TElmMjlJ?=
 =?utf-8?B?N0dFVy80SnBzZ3d0MUtHWitSNS9keDU0M1liTWVCVDV4ZldFanZHVkdlR1hV?=
 =?utf-8?B?TU1oSGZMUW5hVUdvRjkwRTNreE5YdDVVM0VDYlFEWGlrMms4MWNtcWY3YW9K?=
 =?utf-8?B?Y0lKUmpWM1QwTzVFK1UvRXF0QTBtelFkYjJSRUFhek9icGl2Nkx1cFd1a050?=
 =?utf-8?B?bmk3NDY1RENsRmNNVHdwS2Q4OU5pTVhqM1h0bVN6ZmJyNXZ0QSs3TzBYVEFq?=
 =?utf-8?B?TnNTWDRGVVp3NGxOUWxJSjloeHpDSzYzK05ibFBkRVNWZytsd2RWMk5iVWpV?=
 =?utf-8?B?UjRZWjAvUjdiUFhHTVZSTlE2bHhRWFJlOTFJU1BGRjM0NGx4VDZzUzdSd3Fn?=
 =?utf-8?B?WnpIY2llNGFyZlJNdlQxcE5OemM3SlAydldzcE9Qa0lVSGgvajMvL1pnT1lI?=
 =?utf-8?B?MzR0NEhONmozSWtmSHBHdk5PM1lrckxnR2xtdmRWRVpDYktCcmlPd0xydEx6?=
 =?utf-8?B?clE9PQ==?=
Content-ID: <429DB7B772BFC349A678AA44D5ABEB7E@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4565.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1aab08-9931-499a-3075-08dad768dd79
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 09:04:21.8155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G5i8kcNdauIAPmZTYETLbymbKDr/wZL9caZHcyFKR7ZIeONb1M3lfoJWv1m2DE2ZHoaG5VG0nXX83A2ZKE67vss2yGUbPf/fb0oCIp6fjS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_014505_101023_7FE96692 
X-CRM114-Status: GOOD (  13.70  )
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

On Mon, 2022-12-05 at 15:21 +0100, AngeloGioacchino Del Regno wrote:
> Il 05/12/22 07:57, Xiangsheng Hou ha scritto:
> > Add mediatek,rx-latch-latency property which adjust read delay in
> > the
> > unit of clock cycle.
> > 
> > Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >   .../devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml     | 7
> > +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mtk-snfi.yaml
> > index bab23f1b11fd..6e6ff8d73fcd 100644
> > --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
> > snfi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
> > snfi.yaml
> > @@ -45,6 +45,13 @@ properties:
> >       description: device-tree node of the accompanying ECC engine.
> >       $ref: /schemas/types.yaml#/definitions/phandle
> >   
> > +  mediatek,rx-latch-latency:
> > +    description: Rx delay to sample data with this value, the
> > value
> > +                 unit is clock cycle.
> 
> Can't we use nanoseconds or microseconds as a unit here, instead of
> clock cycles?

The clock cycle will be various with MediaTek SPI NAND controller which
clock frequency can support 26/52/68/81/104MHz...
It`s may be easy to configure and understand with clock cycle in unit.

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
