Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF003C636CD
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Jan 2023 05:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10JtNn3EUKsvbY+wb99T4p3Il6lyyIPZ45NddbE80bg=; b=DIHNmXOv4JiCpR
	Klx+0cDmJXaiBU14xq0MM3KSPHle8hLyFbb+dQwKyiSGQnxUOJqFoCOLKP8RrTh+aQNzJTHLjGYpY
	z80eTchfDAf9hib5JsKjmiQSw7kqrELydoq6Q29c5+FtuSlNpzXGj0Ttkmfy95vTUY5xGqoFbKuks
	iX7CU/r2DOOokQw9V3s0ckRE1nD0xEFe694X9/lF6B3HJGYJKRFS+9fHW5F1gq0S/kkaTCvSCNC6Z
	m3FNTu3JlUUb6zUU1b4mb9HlTRMvG2LQGW/BAU7ZmbG4aXkIZWxTz8kKWBimQmu2ff23RZO69FsAy
	dHtYPRqyrvKfL8UTGOqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMjbo-006MZC-CJ; Tue, 31 Jan 2023 05:55:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMjbc-006MXl-Em; Tue, 31 Jan 2023 05:54:59 +0000
X-UUID: c7bddba6a12b11edbbe3f76fe852e059-20230130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=B4y7xMymI1w+O0jkWE2oeRFBgf46BNBFGmP/9HzvREI=;
	b=ANa5FieT0PialPe58WsF4ZFnjvNWZdy6FwS+aNKEEjsIZVEEfbBLvzGEzGFUCAd4L5z1tUxwSkGswNzIj4nCXATMq9zTdWAbfVHRB6KBylP4srH4133SnG7U4NPrKYOkhlC2JQtVkG1vsQRvj+NmdIKmS41w6V7XP+/CK0YAMtY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:e0a48dc9-1a0f-4413-96a9-3e090c67ba22,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:d881d355-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: c7bddba6a12b11edbbe3f76fe852e059-20230130
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 4138485; Mon, 30 Jan 2023 22:54:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 31 Jan 2023 13:54:17 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 31 Jan 2023 13:54:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyjwFzpEFm1vu9i6ExOir21/9xjhR7r/e5mUnX75vdVb7ayy3KMKRS/JLJ1B3v7+RUZFIH8hq2pDqrM9YRWp8vCU6i5ZAo8G8OuR44CM+shlYJiRdj2cpQHNPQlnHc8dS76kMTlbx9Gha+N9L/S1A8B+K5SUNWpwz7BGZeoSRQq3lLO7ftrZUKT336HIMM8aKnpuwXdk0631DjSsNbzwJlYO8AylMFH0TkAygsqa9HHZjlF78fp3mCvuoRxCP+K0NS7vVqu8V0YWjCsN1X++u1zEeg11aLyh3bMlpaKrjxQ45hQUBN6PZr7OKjs4ElLHP9vb71DM7m7BtIv8ccBeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4y7xMymI1w+O0jkWE2oeRFBgf46BNBFGmP/9HzvREI=;
 b=jPl+2WMrXAlJo60/esvKyKm1Q7MyMepBGe9ofP8OFadidJCIH4iwKP93Lq4wBGByYF45bigOliJzLvZrVr53ZheJ02rXBa7SEvMjRqiiXk5JspQTtasa/yWj00NHQ2jSr6FbkvzPymYcBz4odTwicyhu+PWqUwFne136LvszaqgHBlVAew0IweOBinKEdnljUnWZF8if49SbJop5DodGtLv2espn9J18CPihTDBOzSDY3n3MUx8a2IzbeZzZg1FXlPyZf5SH9o6o4L/gvEq7Qazm+ysK7FJgx0Vbbb3gicw98x0mlSKNzxqv7BiN9NsgWvcgMCQBRbRB3gWJ6b2bdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4y7xMymI1w+O0jkWE2oeRFBgf46BNBFGmP/9HzvREI=;
 b=tJQujZsMOgP87NvjFSotsR3JZlkn5ubv+RCTlpyKDC5UF+FYDCBp1GVU2QZ4Uw2l2f78QWmJ2AYtQ0co71TICkV2/SatTlVTXRpXaQrP9azcto1tv+bacSbspGqoGTLG7Qk+FlwlvBii/r5UOeewlq0uNGXKL3ff7GutO4oTt/0=
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com (2603:1096:4:84::10) by
 TYZPR03MB5341.apcprd03.prod.outlook.com (2603:1096:405:7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36; Tue, 31 Jan 2023 05:54:14 +0000
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::e708:8bc4:ed9d:4037]) by SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::e708:8bc4:ed9d:4037%3]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 05:54:13 +0000
From: =?utf-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
	<Xiangsheng.Hou@mediatek.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"broonie@kernel.org" <broonie@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	=?utf-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
	<Benliang.Zhao@mediatek.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?QmluIFpoYW5nICjnq6Dmlowp?=
	<bin.zhang@mediatek.com>, "gch981213@gmail.com" <gch981213@gmail.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Subject: Re: [RESEND PATCH v5 00/10] Add MediaTek MT7986 SPI NAND and ECC
 support
Thread-Topic: [RESEND PATCH v5 00/10] Add MediaTek MT7986 SPI NAND and ECC
 support
Thread-Index: AQHZNFfxIYva4XnKBkeaWbJ51T67n663ImiAgAACAgCAAAQwgIAA35eA
Date: Tue, 31 Jan 2023 05:54:13 +0000
Message-ID: <9d0a46a269268751538eb43db58473abab8315d0.camel@mediatek.com>
References: <20230130030656.12127-1-xiangsheng.hou@mediatek.com>
	 <20230130171145.2c844d34@xps-13> <Y9ft8BIzESLQ0TTh@sirena.org.uk>
	 <20230130173355.5e65a1c5@xps-13>
In-Reply-To: <20230130173355.5e65a1c5@xps-13>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4565:EE_|TYZPR03MB5341:EE_
x-ms-office365-filtering-correlation-id: ee44cf4d-1df8-41d3-5c78-08db034f94d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JMf/k2y0a0bGc4IguY/Diy9GXvID7XCDCt7JuxfzuenG66yYZmhMfCBoXwXSpZFMD976b1pNAPWQVImpZSeuYtVvfqZKXEgX5chKsqpgbdTRlo6bgJDGsGZ/8B1IK97xlmMc2uTqtgxyqL21k1GGZBVv03HrBvZFOF89jyKyu+obuviVc96gmzE8ytPYtQE1b7Wz6hAuyDocThfNRHsijHSZ2SfsIa0fhN6L1tjsNo+awHfeZodWM2E36iYEZlhLav/0aGznGMXbm0xSDT5zl3pAnWRmK9FQbjokbpBmTxDOxBZdOre+aAgVHBXRMZbeQJf8wkkomi/9LhQxIdsAY8yzBtQdlbE4uEMkz7fLO5GWPUrXcyer5QSKcgc2xLqG9Og0ZYn7q7zJuq229HXl20nFmX9XuSyJ87cdnozxEscCig/IBFG41PVR3Vy5hz+cYSLyDJnQlWQvwEtVd2PHceiVs1d75D+rnPQfnA0GMQrjEsZnZPUsmVdvEAhhdKpK0esNn2UK52uD3G2c71nD99Q4a0LKGtCqf5bOqo/9ImGU1yV3iDjeBWYV4YP5XTEAyscHYrc7mCQqaHjjKKlEulZP5uIy5vjADlojFjIPyr/Fey2CRZWhAAtjQGELTRVDBoSIsTFkfg9fKUTautaFbfeIkWAXL3cprVTJFfLwAgZ4Clq5cmpu2DvLsT0H3CTCzudhpjjwas4W3LF/2JwDsg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB4565.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199018)(54906003)(85182001)(36756003)(66446008)(316002)(66556008)(110136005)(4326008)(64756008)(76116006)(66946007)(66476007)(41300700001)(8936002)(5660300002)(38100700002)(122000001)(86362001)(38070700005)(8676002)(6506007)(71200400001)(6512007)(26005)(186003)(7416002)(2906002)(6486002)(478600001)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0lPZlhnYWhVNitUNFdhRG9iTFN1TUN4eVg5OWJFeXVpZkxEbXlzQk9XVGR1?=
 =?utf-8?B?OXZNMnpaSkVGVzNSWDFUZ0k4d1BHTmhYWjJtQ0s0R0dqZDRhNU0rNlRDbThp?=
 =?utf-8?B?UHJwZkZzalJIVzdhWFA1NHNsRG8xNXNlcnpLOWczSHUxbHJXRkYzOUpVMnVi?=
 =?utf-8?B?VnVNcnRXc3ovZ1h2eGtQbnR3TjcvYVBUQ2lLSXVOVEJWMnJLK2ZHTGVSTlZy?=
 =?utf-8?B?eXhRNk9VcjRHOUFqZS82Z2dSRFJhaE9oTmU1b2J4cC9FUFRkOXFUb3hJOHRu?=
 =?utf-8?B?OGVDK0VBcG1hU0M0dmNjRHhycGQ2L05qeEhmZmRoVHFqWnVNa3RSN21XSm9E?=
 =?utf-8?B?RDlzZmhYQVh5eWNqcjhteTV0Z2F4SDFpa1JYRFpBQzNZYk9NTDUrTGhzNkh6?=
 =?utf-8?B?MDNUUVN4eTBYbWJZcTBlenViUWM3VEpkUm0ySks5VzZmVWhCRDd2ZHVFZytB?=
 =?utf-8?B?U2tXUXR3bUNDMW9hdDlpZWlBdlNROXlIUnlIRm1rcXoxcTdjdXNQQ0RrZGFV?=
 =?utf-8?B?NFZsK0pSUFpTdWtmTXd5eGU0QUllb1VZbGRZZC9rVHdlYk5GUjlDR0d4YVlh?=
 =?utf-8?B?WEFYQW9QMHFkMmR1QWJHc0NJc3VpK3daSzFzSzY3Y2h6Z3FweGdyd0J4N3B0?=
 =?utf-8?B?ZHFPZ3NnaGhxcFMxUW0wOHZxOXBpOUx5amUyY1hkZEtNaytjdXFKTEh5dEJz?=
 =?utf-8?B?eGdGalpGSlJEa2RZU3Y5cWxQMzVLTjExYXNSYXZ0MVF6bFQ5UUhrMGhla2dy?=
 =?utf-8?B?czhOS0hqbFpVNXFvM0RXVm1SRmNsUnlmdWsrN2E0d0dFM3JxMWo3THdha29V?=
 =?utf-8?B?YkEya255Tm8yYTVwZk51MkxFc01NVXBWaHBGcHlxWGt4TTZlRWdmUkdlUGZv?=
 =?utf-8?B?RXUwQ3hHZDUrdU9vSE90dDlGUXN5V3Q4LzFyYXA0c3NCVk9pY1ZJbnI1NDdC?=
 =?utf-8?B?VHRwOGVYc3hpZExWZ0xrZFFWaGRqYnpSWkNVTHF3akpTcU1NWHNmUS92YUdX?=
 =?utf-8?B?eGVuN0RxYVhMc2pObDFQbDVjN3MxSk1NRWpjS2RHSEd0amhLRTNnUE9xY2FU?=
 =?utf-8?B?N0pyQ3RNVVJJSGdlWldZa0plMVZZSUlCa1Z3OVVhN1pTT0J0SnFZS2pxQUto?=
 =?utf-8?B?cGRsVjFhUE1abm5TYUI5ellUNm1rOS84RWg2ajBBZWZka3QzQ2JXMjd5VDho?=
 =?utf-8?B?dlBxbnczRzVoc003aW5PL1RwT1M3aS8va1hmL01aRTQxTWZFdWlZaWFtMlM5?=
 =?utf-8?B?NHBFTFhGUXhaUDIyS21COEJpbDNDMVBhMmRFYXkxVGxvQkNZYVdSK0ViZjd4?=
 =?utf-8?B?aHJlOFh1dmZ1bi9Zd3M2ZU5kRzdRQmlaMmp2amxrR2ZlRDM2V1BWOEVQZW9R?=
 =?utf-8?B?R3NKWFBQdzgvNVZ0VXZjY1dqakRDM0FKZEdsZk9Kdm11T1Bqak94c1hZbmIv?=
 =?utf-8?B?ckRqK1F4NkYxOTJmakt1blhRYkpCN2V5WHBoMGE4YW95bnZTcWs1YkUvcWJl?=
 =?utf-8?B?amxPOFgzNXNCclEyWnJ3RE9vT3pDMzBzRFY2WWNkekFOa0tYK0lyLzlZVWo0?=
 =?utf-8?B?dHhhMXBxLytKVER3cVdqRWs1YnZFU3I5QjlYQXJBZWRzbEhoRWdiV1VPTzhI?=
 =?utf-8?B?NEh0OVR1QlNSckZYYUdvMjI3cEg1SVBPSnVQb3NBSFVRVDBRbTVGaGhPQXZ3?=
 =?utf-8?B?RWYyQzNsbjJlOGtnZkZHR3NiZzdlUGZKN291WXRFbGlidUV0NUJPTmtGMzlU?=
 =?utf-8?B?U3Q1K2NaNmJmajdxUElvRTEvSTdwSjhSVGE4VVhHb3ZqbzhuNmZXZGJLTFZ0?=
 =?utf-8?B?bkVzbEtJamxBMVhPQ2hWSEZIQS8ycy9oL2tBZXpFQlRsbTVTNmdiK3UzcDFN?=
 =?utf-8?B?OFBTdDJmYU0xbzhMQm9KaU1yYUxQbllpZnRqVWtpeGhJNThscUhQdlJReWhB?=
 =?utf-8?B?YXBtU1RJeTlGTFgzVHZQa2ZaK0k5OC9QQnJ0MFRidXFNcTl2ZWl3aTgySEdD?=
 =?utf-8?B?MG8vcGtZM1JNN1lFK3dIY09oVDVSVnhJdmZoRDY3L3dRWmZVK0dxendNNFJh?=
 =?utf-8?B?RE5QbTcyZE03YldJY091dmZvLzdXc0gxc3hYUTdhNjA5MnhaNnlFb0R5c210?=
 =?utf-8?B?M2pWODIxYmpDZ0QxWktzN0ozNnRSTVpLV1NyQUt1TVdUMmpjZlI2d2IrUzRQ?=
 =?utf-8?Q?0XqH/J+SDDdPwP/2PAeMkuI=3D?=
Content-ID: <E0DDB6C7659B40419769E288E7C2DF2B@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4565.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee44cf4d-1df8-41d3-5c78-08db034f94d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 05:54:13.6964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilC8ZgKxJXpU6wsf5XmLbJYMYq4W1FTxRReC8dwQ2amtC6eaI0RLCw5QG4lx3FY/0XXu5suMIOWOFpDRkOzsQvzignezI1PXWtkrADbi3ZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_215456_547408_4AC1FCBF 
X-CRM114-Status: GOOD (  19.59  )
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

Hi Miquel,

On Mon, 2023-01-30 at 17:33 +0100, Miquel Raynal wrote:
> Hi Xiangsheng,
> 
> broonie@kernel.org wrote on Mon, 30 Jan 2023 16:18:56 +0000:
> 
> > On Mon, Jan 30, 2023 at 05:11:45PM +0100, Miquel Raynal wrote:
> > > xiangsheng.hou@mediatek.com wrote on Mon, 30 Jan 2023 11:06:46
> > > +0800:  
> > > > This patch series add MediaTek MT7986 SPI NAND and ECC
> > > > controller
> > > > support, split ECC engine with rawnand controller in bindings
> > > > and
> > > > change to YAML schema.  
> > > I would like to pick-up patches 3, 7 and 10 and apply them in the
> > > mtd
> > > tree as they look completely orthogonal with all the other
> > > (spi/DT)
> > > changes, am I right?  
> > > Mark, is it okay for you?  
> > 
> > That's fine, assuming there's no dependency issues.  Xiangsheng,
> > it's
> > generally best to avoid mixing patches for multiple subsystems into
> > a
> > single series when it's not needed since it makes merging things
> > more
> > complex.
> 
> Well, kernel test robot just reported an issue with a wrong file
> name,
> so let's split the series. I now expect a series with the spi and
> relevant changes (for Mark) and another series with the three mtd
> patches -fixed, of course- which I'll apply on my side.

I will pick-up patches 3, 7, 10 and 8, 9 as a series for you, since
patches 8, 9 change the existing NAND controller node name. And another
patches as a series for Mark.

Thanks
Xiangsheng Hou


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
