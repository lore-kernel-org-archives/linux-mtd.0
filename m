Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA60D33998
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2024 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKn7WawczQZGW3t2+F4m7EWhKXboDgHbgFIc+sCplHs=; b=pxQegw8mZrKM1G
	sNdhpvv/dsc054Ia1w6Q9cxA1e3RUqVmqOvj5SZq26ykMUkO8Olr6hBFs7GnU+Z5aJSsXFX0Ex/Sg
	NyQh5A0q/OyrEEjdCRFnWnAXL4r/W133pWOxvw3XTgjMwogxvkL8X8eT0Tp+GQBtbR/bgvcxEL8Fz
	LO6NmRjMAdWHV9mEMMQQpeqfJJnCQsHcoHyXsBKwVKIR4lzhD7ihxtt65Ys04IqOdAy4sqZmnNtPH
	rFekawAXFnptS9IxXriBCl6ifJg/ar03lq2lJSbTZupXs1U4hf8mqjpOXlG8Tw+a7Kfa7u+cLo0SH
	2og1j0KHLY7+S0ne4qng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5S4P-0000000BNc3-32u3;
	Mon, 28 Oct 2024 15:54:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RdE-0000000BIrd-0G1G;
	Mon, 28 Oct 2024 15:26:13 +0000
X-UUID: f25b6030954011ef82ff63e91e7eb18c-20241028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=slDlURqNAZgnWBhcHL7h13UMJpYsooCmrGxImD8Il20=;
	b=ppjQI54ScM+uxdtm36PcUolORPLKBdb78YJXuiDsxswrzih4PFygiwh1pUk77EzgYuFqxNdjtZ8xU8euiPnSrs+Jl8Ep3R0D8UlaM5DpqNZcYEhdXk1a6PTMUXTUe59X3TrF69nmHgZvGbBFDkXBdKbQgosEpsQFoeJiEIxKtzg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:0556100e-b5fe-4a45-9ed6-ef004a5966b8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:bb853b2e-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f25b6030954011ef82ff63e91e7eb18c-20241028
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1392435302; Mon, 28 Oct 2024 08:26:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 08:26:02 -0700
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Oct 2024 23:26:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynN49N0Sth/8xPqGtgKYUh8hHtjb76u1UcuA9DQBhbPuZMs4N2UnjY5rURaZwNfXRkvHLdPiu5qjjMRTrYb82MlIr4L3InCbLHKMBJbuDGKcwl4XXFel/aOFmNy6pF+XTdV62sUGVfWNu/Xpj5tbylb3MOlwMVJF/nmZJ2HTyy3n4IDZWQDVf4lti/aUOtapm4e8M9/TQizlSUS856G1rAl6iOpEGvsV76T/HhmylXQnncuHl9nHqQ4YVwHwEsy/F230j1y3JWhlYOjFBgEOP7GNTVK7qnPyxOH16XAYXlT2Y61CNlf1WeSddTiYyHq4fR+yX2ZzGtXGfJVLTpRMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slDlURqNAZgnWBhcHL7h13UMJpYsooCmrGxImD8Il20=;
 b=nUQsA01BOuC8z2fKHvc1n8zaWqDkZAWd0Gyp1Yw6KrpKerZhyKwsKfdabNVpnIDw9AZ+gm+z6oAx+hqlHDKTOeAqhksAk4UqyLQcHwtEm4/OHx8HmkpPjks9a9NxI38JTqQLuJYP96BklyHb1qWUPzmrWbzT+21v6hCLrVjQTP4wps8Hnd9Qt2jILON9YXA8kS8Uq1UzdO0PXdw8iXEuKsrB7Xc2Xd7XEDkDhtpjsP5PzX2oNem5+cu99StCBK6uLIxAaKVpSLU9FX5WPqqA0aOaJBrBQJITDmwKmzN2RHTcObqhCfVUe4hvvEZuY+QgamqdOpASX0KoU3xFeMquag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slDlURqNAZgnWBhcHL7h13UMJpYsooCmrGxImD8Il20=;
 b=ONOYQb2hxsCbxNiEv42v7RO5AZnrOohF4pJjeBxyJqW+AFHweBMQWjg4DocZpZP8BIzAmCoFoLBFA1W9okFlA4xxBdZuNQU81zJZdyqRCh33Q2aGTk9pxHlb2qT0nzNmAdyqW236Ba7/YQu9nFn+Zz0OQ72nItq/r5XmUrOnBIs=
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com (2603:1096:820:8c::14)
 by TY0PR03MB8197.apcprd03.prod.outlook.com (2603:1096:405:1a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 15:25:59 +0000
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3]) by KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3%4]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 15:25:59 +0000
From: =?utf-8?B?U2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKQ==?=
	<SkyLake.Huang@mediatek.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"acelan.kao@canonical.com" <acelan.kao@canonical.com>,
	"chengminglin@mxic.com.tw" <chengminglin@mxic.com.tw>,
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "daniel@makrotopia.org" <daniel@makrotopia.org>,
	"vigneshr@ti.com" <vigneshr@ti.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "richard@nod.at" <richard@nod.at>
Subject: Re: [RFC PATCH nand/next 0/4] mtd: nand: spi: Add CASN page support
Thread-Topic: [RFC PATCH nand/next 0/4] mtd: nand: spi: Add CASN page support
Thread-Index: AQHbIvPeZSyVhSH6jEWOSv7DrSm/prKcVXeA
Date: Mon, 28 Oct 2024 15:25:59 +0000
Message-ID: <e8c1ea093943141b431d8eb3ed3831c50601dfb1.camel@mediatek.com>
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
In-Reply-To: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6226:EE_|TY0PR03MB8197:EE_
x-ms-office365-filtering-correlation-id: 95e949be-9d66-4575-0fea-08dcf764d331
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?T0xYcDlGV0tsY1ozZGJJVG5BdnZPd1cvYmlWR1VDM09tSE95ekE0NDlxTy9H?=
 =?utf-8?B?WnZZY25JY0Y5RGMrV25LL1FIU0h2cG43dklVTHlMZU1FbE53MU5Va1dab21Z?=
 =?utf-8?B?QzROVFQrY0dmcFQxd1VWYVVLck9PZURNK2pPY1ArUmpCcEJnLzlaSldGT3lQ?=
 =?utf-8?B?MlhwMFpUb0FtSkMwaTN0VmJHVkdONytkd3hxdHE0MlFpNDdTTTVwZWduTHhK?=
 =?utf-8?B?WjRIOUxwVzJlb3FKVS9rejV3TTdPRkI1MXRVSnlCS0E4NlpnbzVraEJNeDB6?=
 =?utf-8?B?ZllhbkxjRGJCR3RzMlJGSHVPNldwcTJnY1RJVFdvNUMzNFh1UkNoa0dUNnJ1?=
 =?utf-8?B?dExtNEhjaXBneFBRaEJIT2R3dkdlckZjUjk3RUJmclRlcWZUZkwyMGFvaGtO?=
 =?utf-8?B?VUNvOXZCUERESkhiTDY2NmJoSVMvRHdyWTB3WDZxN0pRNkg0SVVDVXZYajlU?=
 =?utf-8?B?T3hnakVVcFVHTUZYQWFMd0dmVGJjbVZoNS9RbGlsaXRTM2hQNVlnRzdPZzkr?=
 =?utf-8?B?Uk4wN3VJNlprVFJjUHQ1ZXhvSDNaS0RIaDJiM0JtM3FYL1VsbCtxNEtOUHoz?=
 =?utf-8?B?Vy9pTHJiYmREZXhxRHRyalpaTnhqcGRFTUZQWEhRTENidFhSWFhHVTQ0SHl3?=
 =?utf-8?B?ZTRuTlhaVS9HRnJUNXVLTnhYS2daTi9JRFFaTEs4aHFBK2V1b2VrTy9wSEU0?=
 =?utf-8?B?Q2RWalVIWTdISTlUbjhVZi9uZHVuS3QxT3RGL3RkWCtxQ1ZRaXFGc0hqVjJY?=
 =?utf-8?B?NHIxTVIvdFlaWmdqeVlhUjhXazZmL3ZkcW0xT2ZKL0piMm5FZHJtOHRlWGlK?=
 =?utf-8?B?SURSTjZMbVRQczJKQVpzT08rMzNqNjQ1REIyWEV0TEM0blZXOFN3VlpJQUh1?=
 =?utf-8?B?V1VCaGk1Z1dyN0U4NkpXOXNzSVBKU2RiTDdYdHA2U0d2TU1ocnpJMVNCZXFD?=
 =?utf-8?B?dWJrRmpDdVQxeG9CY0c5RkhrZ2NMVTdHenJYZGNZMkk2emNKeFZzL3dHQ043?=
 =?utf-8?B?THh2dmV3ZXpuMDhpTzAwRjRZU3RYVnhuTFpySzZQQkVvbUVkZEhEb3VyVU1t?=
 =?utf-8?B?T0FibThyNms2aUp4dS80alR2bmtvOUlzQk8vWGNkekI0NG12b1IxNXp0a29M?=
 =?utf-8?B?U1RiTGtFaW4rT003MW16cmZKV29WeVEzK2tuUXhXMzVmOHlURmdGRlYreXdJ?=
 =?utf-8?B?RGs0aSszTzZrYUxXRFJycDQ0MlJRZ3R1aG82QVozV2l2N0hzMEV3bmhnR1cv?=
 =?utf-8?B?TGxES0lSendheE1QazJGUGhqQjRTQzVCc2QwK2RCL1dJd2VGeU1kSHNSNFhz?=
 =?utf-8?B?TSsydHowU1pKUzl6c2psb1d3TEc2cjNlSlZZRUtaOVFuYWVTVU1sQi96a0ZL?=
 =?utf-8?B?bThXUG9QY1FzRkNZSjlZOC9RdGhUSTF5dUFZM1l4UFRLbmdLaUw2Z2xpcTB0?=
 =?utf-8?B?NGcwM2g2d3ludFptT21peWdmZExSQU0rUS9SbDZmazdEV2FGOEVqTmVnS2gw?=
 =?utf-8?B?M0hSK05Cb1lKeGpRejBkaUdVN1RNdk82N1JiMUo0OFJST2xDWC80MXNjbTJU?=
 =?utf-8?B?emlYNFdJUTFTeDVGLzN2bGxHQXJHUFhsZ2RBSW9LMnMrbTRhL3FUaHNodDdK?=
 =?utf-8?B?YXhYckJqdEozMm5TREJtTlRjZUVSR0VJNUxibElUSzRpS2RBd3VJRTJnOTdr?=
 =?utf-8?B?RDZ4N1FFRlhEcnp3aUVsVXVJOGY5dUhYdUxJZDgzbmk1eVdtWUhPRVdjMWlu?=
 =?utf-8?B?Y3NUTjNDbXVrQkt1a3ErY3RhMHFkb1dCcE1ZYkwyRzRoYy8wZDBMQ01jNnlx?=
 =?utf-8?B?TFdRVlc2REhYWmQrd1FpTWY1ZzR5QzVzandHVHFieDRXY1hJVmtLN1R4cm50?=
 =?utf-8?Q?Htt/SQDq5wZ34?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V055d1NCVWYzcmNZQVUrYW81YnMxMkhEK2hPK0E1T1lMZ1ludnd0MXdzSDJl?=
 =?utf-8?B?OXpkMnc4ZVZiTXhkWTRRcGV1d1JWc3pHdW8ybXVtZkdzaEZCNk00eEtGRU56?=
 =?utf-8?B?bi9reUFtSjdkT2ZnalpkMUlldkRGZll3emxXSW5Fbms0dnhWWDU3d3ZHemVU?=
 =?utf-8?B?eW9kVldlTU1PUGpoTDdaWDJqZndDLzNlTld2cTFKZi8xWEszcm1aWHZNZmNN?=
 =?utf-8?B?S2dEeEhSZmlBTHhqaE5ISW9PRDhvckNOWGpTTjJLcktOL2VKcmxsdUNETFRp?=
 =?utf-8?B?b0NGMmpuanpsdTNRL3BHR3lXVnAxQkhGT1JSZjVQR2YrQjRpMTVXQnpQVXpZ?=
 =?utf-8?B?OHduRjNtT1pRMHVpeVBMdDR4M25lVGV4QVJON08wNE9aNG45Ymp1VXdaTENj?=
 =?utf-8?B?OHJoUlVORDQ2eGV4WitZdVltVWdRbTRmbVFsTnBtT0U4MjhMYzJLdm9nZ1p0?=
 =?utf-8?B?Y2NDMDZUclFtYi8rUXdtT2RsOFNLQXgrOEM0enNUVmgxSFdJSUFFWnNYbzZj?=
 =?utf-8?B?MTlTRS9JRkNFK0VDd0Rkc1lXQ2lSMjlYcnAxQURZV2hCUDVQY2RFMXlqMGxk?=
 =?utf-8?B?UnpoZWs4RWFiZ1RCaldxeXR0Q29NczNvNGxaVitVelhNdXVZWHZ5T2owKzBM?=
 =?utf-8?B?UVFMK3c1TTVkL0NHdXBDQk81akdzaVcwOFZMa2J3dTdXcytPYXF2N29VWUxC?=
 =?utf-8?B?aGpOMW9HYXNqR2J4RC8rOE5PZnprUmhqV1dCTTlzTU1YdWt5dkJBaHZ2UG53?=
 =?utf-8?B?MmlBbXhFYm94RWdFbTYzUU5WV3R0QjY1OXpnSVU1L1ZsTE9mOVk1ZFJ4QU1K?=
 =?utf-8?B?aDhkR3ZzbG1iNDcxdk15SndkYmdtTThOeHp3dFJiMTUvUUpVNWNhRjNETGlX?=
 =?utf-8?B?amJxaVl2WTZRMWFlUVBVK0lXZU50MVFucllLS0lUTTl1VHIvZWk1MmVlaDRS?=
 =?utf-8?B?Y3dUU1VrTjVienJIK3RqL3ZCbWRZbnVuZXRvVWd0WmFGc2Z0N21oRjB2ZUZq?=
 =?utf-8?B?eVpDN3lHYlNPWkNJYzh0TERkN3poNlNFbEUyNDN2L2VDS1kxQ1Q0S3FZOU9l?=
 =?utf-8?B?a2VwWEVnbmZpT1d2MTVqSnFJYU1NTlpLUWdSQTZTMFVpTStaTkpNVUJUUzli?=
 =?utf-8?B?eFN0UVpFSUphNkZybjl1S0xXOWdVUUJ1bm1SWDVyRXhtTXJiK1FhTmY5S2FG?=
 =?utf-8?B?YTMvYnFCSXNWdGo2aFBOVHMwV2pKTStOZlRxVjRaWEwwdGtCbDErNFRCZ1Ji?=
 =?utf-8?B?aTBmLzJ6cE1oQ0VWRExyV3F3QmQzMFIrTmtJSC9IZ0k0OGx1MnhpM25UblF2?=
 =?utf-8?B?WHJHckNKcmE4Q010OHdsb0NkQlVUMzduTHRsOWoybVRnUExmQkNEMTRieHR6?=
 =?utf-8?B?TzY1SVBGYkp1M1d3UlZBMzJ1cE9XNDFWQlhzY1V3MzlCdHh6ZXphaHJOV0xj?=
 =?utf-8?B?aGVFeFZaZURGOWZoQ2RhVnlta1RadmhRL3FsdWZjTFhKNHpmMTRFVklQMVYv?=
 =?utf-8?B?Q0dxKzUzanJQN01sQUJ5K1hYQUhyOVlZZGZ0M08vVFpKN21kR1NLSnNNREFT?=
 =?utf-8?B?UkVWYWRXWlZEQndOR3phemhxVW9LNndjK2JwemJUenE0Rnk0MVk1cTVNeE0y?=
 =?utf-8?B?SW83dkxrb3BjSmlnOThZUVo1L1BURklZTStDeVM2VHFQdGdOOG02alpGTmFX?=
 =?utf-8?B?T3JUUGVXeURrZGxCRXF5dUtCdDZLRnhBcUl6eDk1MTFuelBEV2dyMVVtVzZB?=
 =?utf-8?B?U25XUmEyeUdRdlhHSUZsWndhWDBkT0o3YVljeEkzTkpFeTV4U2d0MjZYUHZK?=
 =?utf-8?B?a0lObkNlUFFaTUlmd1Z4UWtUOGZxVThNbm5aN295OUtJRGVwN3J4SFQrNXBo?=
 =?utf-8?B?cFNLNENkaWl0dHVlZGhrVDBEb0Ezc2hoNnRnVzBlVHN2bzhmY3A0a0xmMVp4?=
 =?utf-8?B?dVI4V09tdmpvb1JRV1F3ZXNKY2NhWmZhL1FmNkJidG4yMWFPSFV4M2hjMytq?=
 =?utf-8?B?eVNkdDFiRlJMS3h3cHVRWnFqYVJaQ3RXdGtpR2tsZ2NoSU91aDR5eituaktK?=
 =?utf-8?B?R2hzRm5FVVo4MU13eWZsUjk4WFJhYkVmZ3B3cjQzd3VGQ255M1huTkdRS2VV?=
 =?utf-8?B?Vy9lVHBJdklQcjgyYnRaYVZoV3hYVW91QkZnVk4vQ2pGaUNTVkkvQ0tHbXhj?=
 =?utf-8?B?UkE9PQ==?=
Content-ID: <7B37B1BA5F46464AB5F771522F653BD9@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e949be-9d66-4575-0fea-08dcf764d331
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 15:25:59.1626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J9rS66EJ+/76mVrsSFUEQBLk2d4Uanqt0D40Z1q9GESJBmMwzAsLLUsRAvni6xZyCptX8Vd3d+lxInjtc+JA4ZZCvjPAgAw3Fy0NHenwXII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_082612_184359_CCB5E2C7 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

On Sun, 2024-10-20 at 21:27 +0800, Sky Huang wrote:
> From: "Sky Huang" <skylake.huang@mediatek.com>
> 
> Hi, this is Qi-Ze Huang(Sky Huang) from MediaTek. On our router
> platforms
> chips, we have to quality lots of SPI-NAND devices and are eager for
> a standard so that we don't need to maintain trivial flash ID table
> anymore. I also noticed a talk in 2019 Embedded Linux Conference,
> Memory Technology Devices: what's new, which mentioned "ONFI for
> SPI-NANDs? Maybe, maybe not".
> 
> So earlier this year, I proposed a bold idea, CASN page (Common
> Attributes
> for SPI-NAND). I worked together with top 3 SPI-NAND market share
> flash
> vendors and other vendors to integrate CASN page on their SPI-NAND
> devices
> including but not limited to:
> 
gentle ping

BRs,
Sky
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
