Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C873CD6E2CD
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2024 07:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lPXRIOFmxiN82/ysw9TQl0POcPK+eHnaspT3RGeTew=; b=2bchc3LZYJ17tz
	NLbORXU6MpybIdDagbnXb0b2D3hlxG9w9BowUwzMfLBr2jPMIjZ45tuM3TdGux1F7YGrmnaZzn4oT
	iZTSBmRYPbuMX6LPp7j+xHiVoRNUEL7riKBVV5SqIzTU6cj/G4RNeusOeJ8uPv+ILErXXAfFJPN46
	oI6McvfJCPBibKBtJE95eBpYqKEVyBg71ny/2/ERfqDQ6isRkLTi6Co//m+wus9w06qQfZvf7bDGO
	rzb4J7e6t274NdnPZbq7T+CAma2l/U3eTe4VeaBBfA7ay9SDucYYkQM1mGrbJmPOXg+s27orpxPN1
	HlpGfXUX5GA4OFyeaACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDf5m-0000000Ebq1-0D62;
	Wed, 20 Nov 2024 07:25:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDf4o-0000000Eblc-383k;
	Wed, 20 Nov 2024 07:24:40 +0000
X-UUID: 7eb41712a71011ef9048ed6ed365623b-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wAgjpyrli97RwXxOeKO/1xgYNRa6kPPAvKs9YalEaj0=;
	b=qDhScrsz9x5SGsYoOhReEDIxrbMFPP/TH+tAnsYo7sfEovcjF5taB5xDlUcc12ANyaqH93g7YS9HjAj/naSebSmpmQnvzqv7XNLwcmnaDJDt9y3vMLbxyDUeJCcdFNKnFlEXCenGtXupCJEIHQGUj0k78LeASuINtXowmPmM1tw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:3708b625-d4a9-4692-9849-586fbb7ce069,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:d0c381a0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7eb41712a71011ef9048ed6ed365623b-20241120
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1337875813; Wed, 20 Nov 2024 00:24:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 15:24:32 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 15:24:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/BfqmBoHRizpC/5Ny0xQq/IWip07hhrwaxIH8aLfpftirqXZN9I8+X5NQerjgPWoHwLl0bJN1tWwUrv3ek4iAa4ODeOiX4L4PtHvwty8cyBUciz7Oxhm4P32uxueI48z8y7ciymM+4W0MelmOqnG7ES/8khwlWkfh9DZrsXekJP8I6H0LxpPLPcPjR6OLyY0/yrVIBJZdaCHaXvVOxG0ArgRIvcdLh6h5RKsjWtML46+2aEFpU1iYkaVMHIsBKhjONnUEJO7wqTKp30wCGdMckDHW6ACImW/ekzBqRq/L5Bd7iGkkj65XsUPe8gPUul6WaF3IgZrwgdop6F1E1FEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAgjpyrli97RwXxOeKO/1xgYNRa6kPPAvKs9YalEaj0=;
 b=SwEjH2ydpA2LCf3ul/RNiQxzwSz7+mB7DC+xFhs9HzsvgL6V+u5zUL0tAgFdO0GIkrTcpVeAJ6RCERCPe7KjBuuXHFwMugK/ojJ2wxf2HzSueAThu9KfFoSIIVYsznM8NDe5yzy5wWKcnaUy082cpI5foc1XovjR9VFTnSiPZmDlafuz2bLzEWZ3mrjsoVKDKouYi70rE20Mz8qmroPGK0iI+kRJkW2yOgUdsFKklOEAOrzbhcZ160rH7sWKWEwkH4Ze6CMnSDd3pKp1YfkUdQNT4iv+Q4mjEGvduhVXudt15y9PiB939mcMvmfKrA2fExuodsGQsYHC5yWkTngdxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAgjpyrli97RwXxOeKO/1xgYNRa6kPPAvKs9YalEaj0=;
 b=M/UPe6rcTnhV1iQ38+EubOrfUJcMPaPbgzL5f75IMliCOFXjc77vu4f1SDiLx5DNUKoR9yN8TcKF0xksQfDDNv6I/einND5KT/uKNo1qOoMsYen1ddBW+v/COxVa63t/o/qPWgdamoH9JnqI2iDawcBgSKORtQYdDqPgFhtsARw=
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com (2603:1096:820:8c::14)
 by JH0PR03MB7466.apcprd03.prod.outlook.com (2603:1096:990:a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 07:24:30 +0000
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3]) by KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 07:24:28 +0000
From: =?utf-8?B?U2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKQ==?=
	<SkyLake.Huang@mediatek.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"acelan.kao@canonical.com" <acelan.kao@canonical.com>,
	"chengminglin@mxic.com.tw" <chengminglin@mxic.com.tw>,
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "daniel@makrotopia.org"
	<daniel@makrotopia.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"richard@nod.at" <richard@nod.at>
Subject: Re: [RFC PATCH nand/next 0/4] mtd: nand: spi: Add CASN page support
Thread-Topic: [RFC PATCH nand/next 0/4] mtd: nand: spi: Add CASN page support
Thread-Index: AQHbIvPeZSyVhSH6jEWOSv7DrSm/prK9CooZgALqAwA=
Date: Wed, 20 Nov 2024 07:24:28 +0000
Message-ID: <9880b3b2f71afd1b020c393fd5d4c0c5673df187.camel@mediatek.com>
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
	 <87jzd0zuc0.fsf@bootlin.com>
In-Reply-To: <87jzd0zuc0.fsf@bootlin.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6226:EE_|JH0PR03MB7466:EE_
x-ms-office365-filtering-correlation-id: 39aabead-cecf-4480-aeb7-08dd09345eb0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aEpwMHV2ZDJiTHFlMk5FaHMySHJZZDZrSlNlbTY2UE9jS2JOWlYyU0RSdzZu?=
 =?utf-8?B?UmNjelFSSmJMb1NQYzAyd3hjQ1pPSmtjdENubWJ4ZTNrUm9TOEtVelpQN1N1?=
 =?utf-8?B?VzcrRmFjTlVoNEFMZW1vREgzYm1TUEJrNkxpcXozVFFMZTUrMlRjL05maGxz?=
 =?utf-8?B?RHRoVGVpQkN0M0ZIQ3J1dGV2VWRDblliM3MrQ3NRZk1RZXlqU2kvMW0wUTZY?=
 =?utf-8?B?VVlTOXVmTEs3bDRIUzRCR1dBWjlHYzJKUnJEUU4wcVF5YVhtK1hwT3hjM1dN?=
 =?utf-8?B?NUI5TGlvbEdsQ3ViUjFvT0lnZTVkdjlweFdPTTNMTm1pSVpENnRPVXBkcnlF?=
 =?utf-8?B?Z21veUpKRTJLSm9ZMFJwYzQ2T2d6Mml6M1hGZitaQkFGVTBBbXFGbDN2dW9z?=
 =?utf-8?B?alluWWtTQ3JSOUZiS2FrWHRmUmtwODJYRDVZeHhXOVNrTk1nc0JzVWFLVkF3?=
 =?utf-8?B?WExMT0l1NnNMVzhmU3pJQkh3K0FDRDFvT2crajFHYzFQS29TSjZkZzhZVEd1?=
 =?utf-8?B?V3dkWm1PSHRDT0lZNVhDU1E4UHBoTEdxcm9oQjJWRHQwcEx1ZUVzdXg4a1FO?=
 =?utf-8?B?UlIrNFNFMEpSd3V2S2gxT0kyU0VVdk5UbldDOEVuWmF1WjJTWERYaE9Gc1V2?=
 =?utf-8?B?QTRySWRQZ1R6MkJxeldxTjZjY2lGdEdUdHh2dFBwUGlhajhwSmF6c3NxVllG?=
 =?utf-8?B?NThXQ3dPZ2VlQ04zbHFFUmtoZ09KaEozWDJtK1J3c2dFZzFrUjhMVFR3L0JZ?=
 =?utf-8?B?cjNZYUlmNmJHUUZDZExzaStSdjZHc1QzeWZDNVl4S3BoRUlWc2FFanNaZ1FL?=
 =?utf-8?B?UmlzSHF6VEpRVG9XdzNUY1V5blBRMFQ4YnY4ZWw1ODJOM1FsS2x2NExQVkFm?=
 =?utf-8?B?d1o4dllNYTRQeDZUdFhtM3BrNWlOa0NsQ2pHMTFUWkg2YnBaNjVEYlpVa2da?=
 =?utf-8?B?Tlg3czY4MEtuaHdyWVp4b2JrTFFpcnVwSW1yWlNPOHlMdlE5Y3IwWlk4WTlR?=
 =?utf-8?B?SmRGYkZ1NFg3M3V1Nno1ZlNUOGhLTUZlY3ZoNGxjQkVrcVVjQlI1bU04QmtR?=
 =?utf-8?B?UGVMeTZPUkY3RU42cThqL3Q5TzFEU0oyNWcxMUhCeFRoTHNiUnh0NnVpSy9h?=
 =?utf-8?B?dUw2RFl0TGVqa2VxVm1EWThaN0orMVpQcXVjY1RBZFlnVHNoVGx0RStsN1Zs?=
 =?utf-8?B?R2NlUE5hWXErQnpRUEM1eHlZRGluck1zTzlCUW1lQnhZUkphaG92bjNVUnJj?=
 =?utf-8?B?NVpmM01SUG1hTlNvSUNPN2xxaTUwQmdHZjVUYlRXaFFKbVUwSCttZEVrNVVI?=
 =?utf-8?B?Rm1saUJSb0dyRWExekxrakpiR2o5aFFqT2prSE1nMFFDbDBtdGdqNDdpWFhL?=
 =?utf-8?B?VzJKWnNhY3R4WmVaemtoMXRBMldZeW03djErb3pVYWxVaTIvZ1hqbkwxR0FU?=
 =?utf-8?B?OWQ5WktTRzZpaVZtWllqSk9IRDJOSkhDNS9YQSs0b0h5L1kzYU9lakJ1YkRw?=
 =?utf-8?B?dFhyS1U4cEUyTVE0UTBoZkhkRm5tNjFpWXd3eEJiT0ljaTFaZkJ5L2xrZ2xU?=
 =?utf-8?B?Z2NPVHZRM1Z5WFpuRFpMNFM0dVJyeXJtcW4vdmhuL0tiL1F2YVdodnlIa3Bq?=
 =?utf-8?B?bWZ0aU9yZXM0T3RoTHIrU2tjelVwSFIzNVJPdkhiNXpYNitMVHdienNqTXZL?=
 =?utf-8?B?dlpLU2NqYlJ1MGZRMnljaXQ3RzRNZmdOemlPVkxMaEVUcVZweW1Kb0g0WnNz?=
 =?utf-8?Q?6iRhphLwRN1f/6gTl//klb7Cv+XIZLF6m1TNENr?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1RMUGxYM0JhZFhuN3hPdHVWOWdhM3hsQlRpOHlnR3NQUUoxU1pvdW1NcUpT?=
 =?utf-8?B?ZEdjNG9hUzNDRENaU3hCc0poZTBGZ09KdXI0TmdLY2REZ3kyaGM1dlFURHVG?=
 =?utf-8?B?WnRwVHFPQVI2ZFc4U1AyQmtqS2VsL3hRdFdOUWp0d2xNYWdMaUJFWDVROFkw?=
 =?utf-8?B?QmF6Zm10ek5yQzk2NmxJSEhWQjdNZzlnWjVyT2FiVUJNUWVDYWY0Mi9CQU1I?=
 =?utf-8?B?bEI0UW1XM2tIVW9aOGlDNnJUMldJZ2JJZDdtd3VtYS9GMHAvOU4xVjdzZWE4?=
 =?utf-8?B?SzgvdWt6YVlEVzZVNFF5OFhlTEpuazJJMFlTUVBIaTNuQkRCSGs0TjlmY0RI?=
 =?utf-8?B?MkUxQktnK1NXMmtiaUtwZERxVkZDbVNxT0V5dytXS3NQM0Y4R2ZEaEphU3pm?=
 =?utf-8?B?RWhHZEdJOTY3NHllN2hpS3lTVDQveUFjT0lRSE9mRmlFNDAyNjd5YkVkZkQ0?=
 =?utf-8?B?Z2ZVWE0zd1g5bDZUODQ1dDhDVGtTbEhpSWVOM3ZrQ1NRVC9BeHQ4NitIZTNo?=
 =?utf-8?B?cmpxMzdoQnVqbmtYOGsxVjkvbStzemNYV2hqak1hUGRXdWtVM3lOeHpVTkND?=
 =?utf-8?B?U3dZODQxcUw3cHZad25JT2srVDBZWStGTVY5cjNhR09iLzhWYnc2STE1Q0c5?=
 =?utf-8?B?QWhZams4dS9ZdGVDNlNmcWtUdmVOeHhWUHpSRzd6a1Y1a2V1R3h1bFRIMm5C?=
 =?utf-8?B?YzhuL2doT0IxYWdLbUVhMGR0ZDVUVE1ZQ200VVhFLzdSTHVmbTREK0pEd1A0?=
 =?utf-8?B?c2dTUm90bjZXWXArdWNiNlNFV09tWDBiY0FYWWw2Y0p6bWxVYWJrR0s2bFZt?=
 =?utf-8?B?c0pIWjRMdDFYOEpOYUFEdzFtOVIxRXg1U2FZVjJGVmdodm1xRERYSHR6SFZX?=
 =?utf-8?B?QTRZQTd6aTQzUk1VTW0wd0V2KzZTQ20ycFRwcERRZzJHd08xKzFRSkVscTRI?=
 =?utf-8?B?S0RTUnc1TW1LWndhcTBxOUtrZGo0dWlNQmxNQkwrSTd3Z2kvdW5hN0IvWUJR?=
 =?utf-8?B?a0JLbDBoSzdCcDZkaWRZZ3NrellsVnd0VDBRais1SUpqRGxlZXNDRGZYcXNK?=
 =?utf-8?B?bUFicGZwdXR0N3hOL3F1TTl6M3pjamM0VEtGY1pCenZRUk8wR3BLRmpkbzFp?=
 =?utf-8?B?MjFZcU12ZHdzNUh1TGV0TzBxZ3pCb3pyeGtCUWJQMDdpUUNGV05VV0hoNTRS?=
 =?utf-8?B?YXIyT09zTTBsa1dFWUF6WmdKNTZBV0dvMi9Qbmh6M21VaHZ5K0svYmlJeE1B?=
 =?utf-8?B?Y3lTaEw2VWlycTlpQzM4SGR2S0NtRjN6MzNlRzJDc2g3bk1mV3VkVThpY0Zm?=
 =?utf-8?B?YmZ4V1ptR3ZkTjVGVndvbmZGbWZhdnBya253U1ZGMzB2OVhpbFY2S3dHSS9Q?=
 =?utf-8?B?TnU0Q0ZJKzBUbmhmMHNhc2pIU1FGeFhOeEpVRDBYdlFuZnJOaGpWcUVwRkE1?=
 =?utf-8?B?ZldQSnNpc3VYMm1JYXZCZGE1NXRsRXl3aEJmMDlmTU5MdGRuby8vUmdEQkRF?=
 =?utf-8?B?MFhPUVR1K2FxQzducXMzazhUeE5PVUlKdzlWdW1VeXdUV2lFaXhZRDMrVmJ1?=
 =?utf-8?B?VTJvVGliQWM4VXk0Rk1tSWhpT1dlWTQ0emlTNzgxNE5MeEhrUFd1SE9kYnls?=
 =?utf-8?B?NzFGdVhPaVV1Mm5JVkc3TVlTZ1FuTHh2UGpqdkdCY2VUUE1LZUFQTzhzRzFT?=
 =?utf-8?B?Q1pGaFlXTHVyYlBVSE5XZ0N3bkNheWZSQTl1MktYdWFZWlRzS01hYkJCUEFS?=
 =?utf-8?B?Qi9wb0tBeHpiZWEyZGh5WTZmd095azlqY29JL3JxK2xYMVg1YUdYWU1PSUFL?=
 =?utf-8?B?SGJvY3FtcDlJT2pZM3liRTJUQ21jTFkveGpSUjZLVkwyMjV0MHBRaVVyS3U0?=
 =?utf-8?B?RCs5aFlqN3cwZU5oVGVRK3ByY3hLNmZLd2NEMk92SlBSTjdYOHUvcWtubDhv?=
 =?utf-8?B?R0NLaFd2OXlOdmx3VTRNcFh2Y1ZGMUVIYjltSjBwRUhSS2VWdEhYQ1Exbjk5?=
 =?utf-8?B?VUlEYUtPaHdCZ09vd2d4VVE0ZTYxMkczN1hSdGpueTB5VVZGcXc1YUUrc1lm?=
 =?utf-8?B?Z25QNVZMYnFkSkRlVjNXRDlCWnhhZkJBYUpoN0JVV1dyWGRTckd1azEzcC9y?=
 =?utf-8?B?aGhjNHpjS25QNUNsUlR1OHNYa1VyaWlxaThtYVduazQ2MmdXQlM4VERkcWZQ?=
 =?utf-8?B?ckE9PQ==?=
Content-ID: <F92718A3DDD1DD4C97DD9732E1C0DC2C@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39aabead-cecf-4480-aeb7-08dd09345eb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 07:24:28.7777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6GdFjVPb4nS4HV9MHXNvPXNj0HjInLK2O2ew2l55dI+GJQmlrkfryYDgQIrTDS6gO0rO2r8dt4xMEtVZFBvwomKK/MqxvGzaJLva1eHc/oA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7466
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--32.697300-8.000000
X-TMASE-MatchedRID: nQsCAlAhJHbUL3YCMmnG4t7SWiiWSV/1jLOy13Cgb4/n0eNPmPPe5KWz
	WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2t8Hj/rv1Iph+Mk6ACsw4JrrtDe4+j0ojjsr
	Cld3jQHzJAj0DqSE6m0oqW4Z+e4yoF/w59i1CC3D9v8cXYH6kfi55uU/Xwhqp21it1MEktDcb6C
	1MIj3yEChhyCCeXqSvSsV+UdkECXWXKs94NAOH8qam63kopwnTzJmqByfAaS37n73d09vr9153s
	9SLsy5pEL0DFyAWR7sW+rN4H33dkfZLzntt9uVX//bcUqeMDLE+PfrpHi2PdVc/CedjlcvkbRi+
	x/83WyScNqUppGsmXaYvirLNOpuHjpWp2ocPYLEzw5Ejs3g1lgXAhAGZB7BnQmp51f2+39kle3W
	RDsBectM0+Q5VWFlD3zl+LxKuRBq+Yp4vsvc0tMLPXKYZysJRIWrhso05H/U06dhcpwNHEFjtpr
	j9/vncmkI9m5d6lu03KhLsGCPGMqmurVLksCxGma6DzXaohvM/jXFLwmgQS5soi2XrUn/J+ZL5o
	+vRV7yhMIDkR/KfwI2j49Ftap9EkGUtrowrXLg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--32.697300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0B5F256B437118B638D909F1DB1063A8A0862B24D25B3F21A0FC531CD48C3D162000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_232438_794924_3842376A 
X-CRM114-Status: GOOD (  15.63  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDI0LTExLTE4IGF0IDExOjUzICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IE9uIDIwLzEwLzIwMjQgYXQgMjE6Mjc6MTggKzA4LCBTa3kgSHVhbmcg
PFNreUxha2UuSHVhbmdAbWVkaWF0ZWsuY29tPg0KPiB3cm90ZToNCj4gDQo+ID4gRnJvbTogIlNr
eSBIdWFuZyIgPHNreWxha2UuaHVhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IEhpLCB0aGlz
IGlzIFFpLVplIEh1YW5nKFNreSBIdWFuZykgZnJvbSBNZWRpYVRlay4gT24gb3VyIHJvdXRlcg0K
PiA+IHBsYXRmb3Jtcw0KPiA+IGNoaXBzLCB3ZSBoYXZlIHRvIHF1YWxpdHkgbG90cyBvZiBTUEkt
TkFORCBkZXZpY2VzIGFuZCBhcmUgZWFnZXINCj4gPiBmb3INCj4gPiBhIHN0YW5kYXJkIHNvIHRo
YXQgd2UgZG9uJ3QgbmVlZCB0byBtYWludGFpbiB0cml2aWFsIGZsYXNoIElEIHRhYmxlDQo+ID4g
YW55bW9yZS4gSSBhbHNvIG5vdGljZWQgYSB0YWxrIGluIDIwMTkgRW1iZWRkZWQgTGludXggQ29u
ZmVyZW5jZSwNCj4gPiBNZW1vcnkgVGVjaG5vbG9neSBEZXZpY2VzOiB3aGF0J3MgbmV3LCB3aGlj
aCBtZW50aW9uZWQgIk9ORkkgZm9yDQo+ID4gU1BJLU5BTkRzPyBNYXliZSwgbWF5YmUgbm90Ii4N
Cj4gPiANCj4gPiBTbyBlYXJsaWVyIHRoaXMgeWVhciwgSSBwcm9wb3NlZCBhIGJvbGQgaWRlYSwg
Q0FTTiBwYWdlIChDb21tb24NCj4gPiBBdHRyaWJ1dGVzDQo+ID4gZm9yIFNQSS1OQU5EKS4gSSB3
b3JrZWQgdG9nZXRoZXIgd2l0aCB0b3AgMyBTUEktTkFORCBtYXJrZXQgc2hhcmUNCj4gPiBmbGFz
aA0KPiA+IHZlbmRvcnMgYW5kIG90aGVyIHZlbmRvcnMgdG8gaW50ZWdyYXRlIENBU04gcGFnZSBv
biB0aGVpciBTUEktTkFORA0KPiA+IGRldmljZXMNCj4gPiBpbmNsdWRpbmcgYnV0IG5vdCBsaW1p
dGVkIHRvOg0KPiA+IFtFU01UXQ0KPiA+IEY1MEwxRzQxTEINCj4gPiBGNTBMMkc0MUtBDQo+ID4g
DQo+ID4gW0V0cm9uXQ0KPiA+IEVNNzNDMDQ0VkNGLUgNCj4gPiBFTTczRDA0NFZDTy1IDQo+ID4g
RU03M0UwNDRWQ0UtSA0KPiA+IEVNNzNGMDQ0VkNBLUgNCj4gPiANCj4gPiBbR2lnYURldmljZV0N
Cj4gPiBHRDVGMUdNN1VFDQo+ID4gR0Q1RjFHUTVVRVlJRw0KPiA+IEdENUYyR003VUUNCj4gPiBH
RDVGMkdRNVVFWUlHDQo+ID4gR0Q1RjRHTThVRQ0KPiA+IEdENUY0R1E2VUVZSUcNCj4gPiANCj4g
PiBbTWFjcm9uaXggKE1YSUMpXQ0KPiA+IE1YMzVMRjFHRTRBQlo0SUcNCj4gPiANCj4gPiBbV2lu
Ym9uZF0NCj4gPiBXMjVOMDFHVg0KPiA+IFcyNU4wMUtWDQo+ID4gVzI1TjAyS1YNCj4gPiBXMjVO
MDRLVg0KPiA+IA0KPiA+IEEgZG9jdW1lbnQgb2YgQ0FTTiBpcyBob3N0ZWQgb24gZ2l0aHViKA0K
PiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vbXRrLW9w
ZW53cnQvX187ISFDVFJOS0E5d01nMEFSYnchal9URVM3ZEpfQW4tOXd0eVFxV2dHQkU5b3ZQblVB
LXRETmxaLXBHcFVkWXY0Z3Boelc0djU0RmFsOGlfbkx3U21QQXpLOUFwZ1NCRzFYUV9tUkVkVFMw
WndyQldSQSQNCj4gPiBkb2MvYmxvYi9tYWluL0NBU04lMjBQYWdlJTIwSW50cm9kdWN0aW9uLnBk
ZikgU28gSSdsbCB0cnkgdG8ga2VlcA0KPiA+IGl0DQo+ID4gc2ltcGxlIGhlcmUuDQo+ID4gDQo+
ID4gV2l0aCBDQVNOIHBhZ2UsIHdlIGRvbid0IG5lZWQgdG8gbWFpbnRhaW4gU1BJLU5BTkQgZmxh
c2ggSUQgdGFibGUNCj4gPiBhbnltb3JlLg0KPiA+IEN1cnJlbnRseSwgaXQncyBpbnRlZ3JhdGVk
IGluIDMuM1YgU1BJLU5BTkRzIG9mIHNtYWxsIGRlbnNpdHkgYW5kDQo+ID4gaXQncyBub3QNCj4g
PiBKRURFQyBzdGFuZGFyZCB5ZXQuIEJ1dCBpdCBzaG91bGQgYmUgYWJsZSB0byBoYW5kbGUgMS44
ViBhbmQgY2FuIGJlDQo+ID4gZWFzaWx5DQo+ID4gaW50ZWdyYXRlZCBieSBmbGFzaCB2ZW5kb3Jz
Lg0KPiA+IA0KPiA+IEkgYmVsaWV2ZSB0aGlzIGlkZWEgYW5kIGltcGxlbWVudGF0aW9uIGhhdmUg
cm9vbSBmb3IgaW1wcm92ZW1lbnQuDQo+ID4gSG9wZSB0bw0KPiA+IGhlYXIgeW91IG9wZW4gc291
cmNlIGNvbW11bml0eSdzIGNvbW1lbnRzIHNvb24uDQo+IA0KPiBJIHRoaW5rIHRoaXMgaXMgYSBi
cmlnaHQgaW5pdGlhdGl2ZS4gSSdkIHdlbGNvbWUgc29tZSBzdGFuZGFyZGlzYXRpb24NCj4gb24N
Cj4gdGhlIGRpc2NvdmVyeSBpbmRlZWQuDQo+IA0KPiBCdXQgdG8gYmUgcmVhbGx5IHVzZWZ1bCwg
SSBiZWxpZXZlIHRoaXMgdGFibGUgbXVzdCBiZSByZWFsbHkNCj4gY29tcGxldGUsDQo+IG90aGVy
d2lzZSBJRCdzIHdpbGwgcmVtYWluLiBGb3IgaW5zdGFuY2UgU0RSL0REUiBtb2RlcyBhcmUgbm90
DQo+IGVudGlyZWx5DQo+IGRlZmluZWQgYXMgd2UgYWxyZWFkeSBoYXZlIG1peGVkIG1vZGVzLiBU
aGVyZSBpcyBhbHNvIG5vIGluZm9ybWF0aW9uDQo+IGFib3V0IHdoYXQgbWF4aW11bSBmcmVxdWVu
Y2llcyBjYW4gYmUgdXNlZCB3aXRoIGVhY2ggb3BlcmF0aW9uLiANCg0KTWF4aW11bSBmcmVxdWVu
Y2llcyBhcmUgbGltaXRlZCBieSBTUEkgY29udHJvbGxlcidzIG1heCBmcmVxIG5vdywgSQ0KZ3Vl
c3M/DQoNCj4gQXMNCj4gYW5vdGhlciBleGFtcGxlLCB0aGVyZSBpcyBubyByZWFkIHJldHJ5IGlu
Zm9ybWF0aW9uLg0KV2hhdCB3aWxsIHJldHJ5IGluZm9ybWF0aW9uIGxvb2sgbGlrZT8NCg0KPiBO
b3IgYW55dGhpbmcgYWJvdXQNCj4gdGhlIGZhY3QgdGhhdCB0aGUgb24tZGllIEVDQyBlbmdpbmUg
bWlnaHQgbm90IGJlIGRpc2FibGVkLg0KQXMgZmFyIGFzIEkga25vdywgb25seSBTa3lIaWdoJ3Mg
U1BJLU5BTkQncyBFQ0MgZW5naW5lIGNhbid0IGJlDQpkaXNhYmxlZCBzaW5jZSBpdHMgb24tZGll
IEVDQyBlbmdpbmUgY29udGFpbnMgcmFuZG9taXplci4NCg0KVGhlcmUgYXJlIHNvbWUgcmVzZXJ2
ZWQgZmllbGRzLiBXZSBjYW4gaGFuZGxlIGFib3ZlIHJlcXVpcmVtZW50cyBpbg0KQ0FTTiBWMS4y
IG9yIFYyLiBCdXQgbWF5IEkgYXNrIHdoYXQncyB0aGUgcHVycG9zZSBvZiBpbnZvbHZpbmcgYWJv
dmUNCmluZm9ybWF0aW9uIGluIENBU04/IEFyZSB0aGVyZSBhbnkgcHJhY3RpY2FsIGFwcGxpY2F0
aW9uIHNjZW5hcmlvcz8NCg0KPiANCj4gT3ZlcmFsbCBJIHRoaW5rIHRoaXMgaXMgYW4gaW50ZXJl
c3RpbmcgaW5pdGlhdGl2ZSBidXQgSSB3b3VsZCBsaWtlIGl0DQo+IHRvDQo+IGJlIG1vcmUgYWR2
YW5jZWQuDQpBZ3JlZS4NCg0KPiBJcyB0aGVyZSBhIHBsYW4gb24gZ2V0dGluZyB0aGlzIHN0YW5k
YXJkaXplZCB0aHJvdWdoDQo+IGVnLiBhIEpFREVDIHNwZWM/DQo+IA0KPiBUaGFua3MsDQo+IE1p
cXXDqGwNClllcy4gV2UncmUgd29ya2luZyBvbiBpdC4gQnV0IGl0IHdpbGwgdGFrZSBzb21lIHRp
bWUuIFlvdXIgb3BpbmlvbnMNCm1lYW4gYSBsb3QgdG8gQ0FTTiBwYWdlIHN0YW5kYXJkaXNhdGlv
bi4NCg0KQlJzLA0KU2t5DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
