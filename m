Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707F7EEA84E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 17:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XAExVxlu9Amiyu3144aabW0GGPAijg4QTrKnp67zkfA=; b=lXmlVDfZhLBH52
	DW6dxNtfq5nVTibazRJDjimsDpiwTvyPxvaznogITAUoUbNmwfzU+TrWCxbFie8XxYKGfgJXc+iX+
	xtq+mWoZcBeuEfLqsQkc5tRvesd4b+MBkvqm4mtk8DHrJT66inXwms6jkBpleyUCrXWD10ESeI4qp
	19s7QBsJVJmrNDARf4+lcgiQQdpg2Sco0rpC01YUMtqNZOehJ4s1fPUQRlS+DMrLtBFEMP3ZycNPa
	XShYKllcxgf7bLUWOD+h7cOzoI36n5AG0hhN117fvwwB0hf+1kARK2MXQyylBMHCmtICBAtMBRr+p
	F33tXZeyqNFmM+7jm7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwfI-00000003iQL-1eDT;
	Fri, 13 Feb 2026 17:09:12 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwfE-00000003iPW-2WHu;
	Fri, 13 Feb 2026 17:09:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxZEnPtYwWGfSP+cZvWTXTGikrYMjho3vZD2O4mCsZbd3bl+k+M3VSC6YqyqWa/eOmjNnis4/keS3zTl7oGrcJjRIwd1nDkPZKetHFDu7NGN8tiw3rFJox1wgMM1TnxZYvaYgpulJAL+leTUrukF8x3Yx2EJHuyFgllZbYzHTUqEJpnarpEQlXPSjYbAfMt33qLwHxNvCqv5dPgA6an8ItbZ1GpdygqqcxlOMBiq/mKIsVlBHJGRlh2Wk7+vulDkUrdH1Ubj95k1gYAwuVqzZ/oYfON7rt9ujHPxzyYgDQA+EWDdszO3JkQmdioU7lkpK+v7qJYWgWqS+pQdCMq57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ib6O7njrlotHMcnp9WGLeuDlARlRGq7v1LI1jRrPtU=;
 b=JDsNZIk+Te2PE0BxF/9omMJ85XFOhvl5X130y4TiaZCs69uwUFFgZK9u0RF6rybX9KVTlVLj7+hkNBcjPe2MqUhrYGMIiWaKDXe6tWZRD/oJa50aWXieTrPvlp/nC+Yc39oZU/Ea5dI3IDWI2nvGfHwslSlcaEi1EL4ZQww4Q96BG+J3d7771tuIZD9FAyU7vwtdw/6q5yTBDqLYpeJ5ywQAYe9ohzpC8m8L6/Npc4nDkj3h0HPzElSQFwFpqE+rFXmm/L4BiSvPsmA2/aWow9gAtLe9Q63usTdHaYlu2ZlONl5O35Fve/MMB8BjCilijjDTrkvW0sKPdS0V8nAWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ib6O7njrlotHMcnp9WGLeuDlARlRGq7v1LI1jRrPtU=;
 b=dVyFhMjzmExiWNRCA9CC3/OZJOEXU0Go9M4rKBTZ0hRGoCO7zXxaDwtZNWGKVqxfk/JDfdacAIj+NjY+myg1I29dmwEZrZ692oiwqWGFAwhM2UV1lKrk4c4/fETR2U4Ch3VGvzuRJfsZ2qikkTkYpwvpQQOfaUOH7eBrsCuAIoE56zC3grAGpJOx0iI17kFdmWr/lM4odS6F8/I7yIst6FiMoifS9Xqnw/ID5G4MqZuOvnH4M5jOKaj7TKCtXtFdfRHOL356N1SSIdDCaOkN7DY0JphVW+ptIqxlN27TTwLO0jTlCEPlr0mJjnY3jF3l1/FdH/MG8GyFvTUISyqDBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10441.eurprd04.prod.outlook.com (2603:10a6:102:447::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 17:09:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 17:09:03 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/3] ARM: dts: imx: clean up imx2* NAND CHECK_DTBS
 warnings
Date: Fri, 13 Feb 2026 12:08:24 -0500
Message-Id: <20260213-imx25_nand_dtb_warnings-v2-0-f9d4b43bba24@nxp.com>
X-B4-Tracking: v=1; b=H4sIAIlaj2kC/4WNQQ6CMBBFr0JmbU07BFBX3sMQ0sIAs2AgLakYw
 t2tXMDle8l/f4dAninAI9vBU+TAsyTASwbtaGUgxV1iQI2lRmMUTxsWjVjpmm51zdt6YRmCqqr
 CuJvThHkOab146nk7y6868chhnf3nPIrmZ/83o1FaYa9La62h3N2fsi3Xdp6gPo7jCwvLEQu8A
 AAA
X-Change-ID: 20260211-imx25_nand_dtb_warnings-7751b8b0e233
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771002540; l=1720;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=cDWSIsQVu7KMFXHB68pWFrvEwVw991B4ej6mnpQ85+E=;
 b=iBtJ1nn+Zmv0xPzbhkIFnhePzJnq/IbnERzi8JW5oRk+XgWExzYH12JUGZpOrOcmA4aOkQ7Wz
 zdfNaqkf/v4B2LP++AtZiLCIM3K6HIpPjUJ4IROWcpJWolmxUl86kRp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR22CA0013.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10441:EE_
X-MS-Office365-Filtering-Correlation-Id: 55af983d-b64a-4f9a-dd1e-08de6b2296c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUpDTmdHRDNmVVZOSnJZTHNpQ2I0eGZwZnIvNGMxeXFWN1JsTkJpcWZKUlRZ?=
 =?utf-8?B?eFdLNFpQVHQxVnFSK1NWL1Q2eWtIL1pVQytmS2g5YVhCSkJKN3ZVSldoZXZY?=
 =?utf-8?B?SGNYVXFobDh5c25CNURuVEMyS0QwNW9xT0Q2WWxoUzZjMFVMQUw0Mjc5dUE4?=
 =?utf-8?B?Y3ZIdzBWcXBqSWd6bkdXYzFDRUhGcmxEVmpQNkNidFhuckxyMldnbXd2TGNr?=
 =?utf-8?B?VHFPOTBMdC91YXU1OWJmVTYyUHhaV1dzbzZnUy9kV0dnQmMyYm1FamZ1T0lC?=
 =?utf-8?B?S2V0ZlNLM21RempZN3NVUGY1ckhBYjdPeWVFclc0RjFNekMrTW5vMlA1TWU1?=
 =?utf-8?B?NUp5UXlrYUpnOElMaStXTnMzTkZIa3dLRXJrWkZnYXRDOVMrSU83dWdDUGlo?=
 =?utf-8?B?ckxaVnRabjBRZ2JFdExFRW9NbE0zYWp3eGVmWVhpZ3dvYXpUbVYzeVRxbDBW?=
 =?utf-8?B?Y2xuWExJYnJJZC9FeUx1NU5WR2pZdXJsMEdiZER5ZW1nVU5Hb253WUVhU0I3?=
 =?utf-8?B?bmlvK3hTVEdtWEMwVmhyS0lwRnVzaVFvbHdrejRkeE5ybDFjc0MrWlVmNmtF?=
 =?utf-8?B?dUdRZE5Cbkl5cXdPSDlqNHJVYzNjVW9pdzI4d2N5OW1NcnpaNjB6OEt1V1Fr?=
 =?utf-8?B?VFdrUm5KYVJoZ3NYRS81dk9JRUxLSmRvbnI5VnJrSDhzdGthdmxxT0xDVUp1?=
 =?utf-8?B?Y1RKVHNLQUpMc2luVndxdjRUVTJRa0lwRlZXMXlsZ2hLdGxrcDhFL2lpbGNz?=
 =?utf-8?B?Tm96MXFueVVKSEIzVTNNVnU0R3JKN2w1OU9Yd1ZnVGowbXJrN2RRL0dtL1hV?=
 =?utf-8?B?WDRMaVNLbGhpTzdFeHJrNEdjd1lkM2tUVHBPRkY5QThLdHN1V25ld0ZQOGdu?=
 =?utf-8?B?RWxxNE14cENWMDRyWUNVTGFlZDAreTExMlZYRmMxT1Y1bDZ1c0pzR1NFYjhp?=
 =?utf-8?B?aWRzVXBlME5VcHp6SXVOanB4UU9Qcnl0WVVwM2lPSmI0ZkVNR1plWlNIYU5q?=
 =?utf-8?B?UG1iRWRLMlk0bWtLM21lZXI1U1RTOEdpb2Qvby8wMmtwU1YyTTNqYXhnN21U?=
 =?utf-8?B?NFVBZGV6Q0REb2JDZEo4ei9hWkN4SXRTNUViQWVpVnRmSEgvbXdxQURPT0N6?=
 =?utf-8?B?M1BuMXBGclVKUzJ3dW9VVUNkSDZiUnJWdTIzOXlQd0k1dHhNaElaUmhBdFd6?=
 =?utf-8?B?a2dremVQL2JhMGdjZ2NhTkRkMGVVNXpTQ29MTkpBeUU3c29JaVZrMVRHV2Fp?=
 =?utf-8?B?VUh6MTJlQnFQRVlTM1ZSYnJRWk9GdGw4VVE5TFBqL1h3UUFWSHh4RG9wTjIx?=
 =?utf-8?B?N3VuRXdOOWpxMU5NZVE2dXQ1TVF6V0FTelcrZCtDMEo5dERmQlZ4VHJPdGlZ?=
 =?utf-8?B?ejBndm8xQXlvTklFVXNOSWNGSFRxNzRsYlorc1ZIWWZPeXZhWWxEVVlSU2VL?=
 =?utf-8?B?eGxSU09yY2lheXphZm1jWkQxM2J3ME9NTVlrQUlEZzA5RHc3ZTE5dzNjSmYr?=
 =?utf-8?B?OWJXeEU0TFFqays4VTR4dlZXekl6ZEVQL3VJSVA3d1VPVmM3ZndCM1M5TDJr?=
 =?utf-8?B?bEh2em1wNElGMjUrUUxLZU9OTlVuZy9pUzZ0Z3FTZkJkb2FIOVlmTklvMGk0?=
 =?utf-8?B?bEwydVJ1Qjl0YXhiSUI3aGhVQ3o3NVhMREF4YzU5eVowRmd4U215VytHZ1Vq?=
 =?utf-8?B?WGtrdnJ1aE5EeDFaM2RDK0FVWDZJWGhCc1JZK0tqb2szL0NYQUhXWkYxaGNO?=
 =?utf-8?B?ZEcxbUFLS1NmVmhlMGdqWk1GVjNtdzgrRVhocW1jNUpuRFJDSEgvNEdZUkxx?=
 =?utf-8?B?UmgySUxzay9INzZaSmh2dzhQSlZzcUtBZ0w4Y09rS3Y1UGdDUEZLbHlJYy8z?=
 =?utf-8?B?YW9YYzhqdnk4Y0s3cUNCdFpzdHR3cnhKK2JjOE95bnlXeWZmVzN3Zlk3bUZm?=
 =?utf-8?B?NVdQUDQzWnZockFzeVdYTWZYRW9wTmlPSkc4V0N2dkl4MExGWFNtRnhqak9I?=
 =?utf-8?B?TFZaMFdGU2M0a29QQ0FyNHlWeVRSZmlJTTd6MzBQM3hvVldpY256RjJQdmtM?=
 =?utf-8?B?M2ZVdlU4Z2poUDJWa20ycmJaSnpGZTNpbmg2ajBBQ1FZNGc5Y3ZZUitWUmt6?=
 =?utf-8?B?dkhpQUFJKzRQclI0bjViSjNQbjk3OFd2Y1I3U3diWkdibE4xNDUvdWZiSGdv?=
 =?utf-8?Q?ZnL5gSls4IsejKefG3fR2vcU27wuEUfjuO2CgYx9J1JK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW1QLzVXS2hETUg3bDB2ZjdIaElXbW5PcW5jSTROVFFwOGJVTnlIc3l5NUJE?=
 =?utf-8?B?V2ovM0RGRXhSdzBEVVlzeUpyV2pmNUJJbVhhK0pSQkFnbmJVb1drN2xZVG9X?=
 =?utf-8?B?a0M0djNvU3ZQbDdBbmw0NFVwTktqLzJJMXQ2NkROM205eURTOTRVWTBWbHY4?=
 =?utf-8?B?NzdpalVTNXFoMnFRTDVKVjg0OHkyWkthL2o1VjBocTZpOFo4aDhBcXN1V3Q4?=
 =?utf-8?B?am9RRGFkakthMXo0aVAxY2luRmFGYW1Mem1UZGppSW1mRmxidmlWMGdTVWV3?=
 =?utf-8?B?c2lDV2RibEhveEdjbnhPTHpMTUlGT0lCd2JPTGROc040a3psNkVjV2dsV3d5?=
 =?utf-8?B?UGVXNFhIUmZhMWxUZUFrdFJCRDZVMWZHaTVjYWxob3VINjFxUHZDNFBta255?=
 =?utf-8?B?SHhkYUxNYjJDN0dJUnF1Rk9TQnpGKyt1QW8xMlhuTzdTTU9qTStCT1BPU1pX?=
 =?utf-8?B?WjY2RHhFQ3laQ0dwOVIrTVZsVVRkVlB2SC8xUmgrb2VFL3hOVkRaNU5xOXRq?=
 =?utf-8?B?TEJDM1MzWmxaUlgyT0syWVFUUk5tTFBUUkRzOXhadm5mQ0JlQ0g4ZHQ2QUFU?=
 =?utf-8?B?Y2RaYmJCaG40Qnp4cWx4MERFa2h5VlVrc29VNlRKZEtrSno0K1dGVE40S0NT?=
 =?utf-8?B?cUFyeGoranRTWExOYitEK1RKRlJsVFIzakRiTUJHQ1BmM2dmNU0ybk1mSjZR?=
 =?utf-8?B?QVlGNEFtU1BRRENoMWRJbVhGWVYyK2NGUXZZSUFFQmN4UlJNYTNSUW0yMG8r?=
 =?utf-8?B?dSt0RmdjSDBnckV6dFFuNWI3TWZ2Y1pVOTI3UUp1MXpSbWl4SzhBR1htQzY1?=
 =?utf-8?B?ZWk0d21Rak5oQkg5TDY0NGlNZnBjVmhYMmJHbDRpWmV6ckpwT3ZROFlra0FF?=
 =?utf-8?B?ejRnQ09IdVp0bm9uYjhCcklQYjg0VXoxU2grd1pWK3MyTmdsWStzQXRSeVNP?=
 =?utf-8?B?clpVYU1wZ3VucE4vMFZMbWhoRWxWdDQzOHlIeHFkN0gwTk9KdUJ0bnZhVDlt?=
 =?utf-8?B?YmNNWVRTdGJSUlN3bVZSZnlaNHNjcis3TzQzdk5zZEN2TStTS0xaSUVPZkdI?=
 =?utf-8?B?UnhDNXdYUjY1WjdkaWl6UXlGajlycFBkT0R4QnlxRVdSTWlONTE1cy92WnBx?=
 =?utf-8?B?dzBqcnBIaHFnYVdXWGpNNHUwY0V3czVmdSs3OEtYajZlZGFPLzRzWUVZSkkz?=
 =?utf-8?B?aVA5bnAwSHdwYlBFTEtKK1FNNGdBWk9XUHBmeVRVSlVMdXZwZGV6ODB3U0U4?=
 =?utf-8?B?bDJyVEF4akxOcW8yaU1YNFhNeU1vM0FsUHFrZXZDcUw3ZGhKRXFGcndlcGts?=
 =?utf-8?B?enphWjIvRXlJRlRITngrZVdBcGhxOGZYakhNVkRTZlFSQ1NIV0FhMm1oUktC?=
 =?utf-8?B?RXpaMWJiL2tuVEIrWjZXdk9QYk1lL1FpNFdYQzEweDk1cmFzMWVJd2hSU0N0?=
 =?utf-8?B?YlRCY2VTMGFXbjJvUDRQNllIV1dIcmNGV0IxMzZOL25DcGVSYTdSQktmTTYr?=
 =?utf-8?B?S3VpbTVJUXR3VythM0wyTEtERmxYaENqbTAvYkZyaFFhbVp0S2JLbE52a2hL?=
 =?utf-8?B?ZFlUNjNDeVhWOHFTTCtLTlFDS1FtYlF0YlNBdFpuTnpGT1hqVGRaVDcyVFln?=
 =?utf-8?B?YlVEdm80bU03MnRpUWZuOHprU2EwTG5mT0dtQUVwYmtFMHlvS1J2b1RzL3Za?=
 =?utf-8?B?aHhaYmFCM1RpOC83WmUxMCtrK1F0dVNxQW0wK0ZVM2FTVkx0cytQWW1jWW0w?=
 =?utf-8?B?Vk5rMDAvK0NvdTdRSFNWalFPMndYU1R3cEc1eDN6SlZ6V3B1MjljUklnVFVB?=
 =?utf-8?B?UCtWVXVvaE96a0FHS1YySU42Q2R2Vmg3UU5DRkRnWS9HVHBiQUNvRlJISU1S?=
 =?utf-8?B?dUtEVVpCbFRRTkFUNXNUOXl3N0xLVFRjQkg3YzZJMGJBOUxIdTFQemlZS2lx?=
 =?utf-8?B?aFFEbHRCQkl3ekFRajRoSGx2bk4xWVlRci95KzVTYTQ5cnBINDdsQnVpS01S?=
 =?utf-8?B?ME16enpzeURqOVBwYmRLMmU5NTV5Q0E2aE9tWS9RYkZBRHVEalBEazM5RCtz?=
 =?utf-8?B?TTA2NS9WYitRMy9URmJaNnE1SXlZU2F2K2kzL0g0b2VtZGJxTTNqZlZFYjJD?=
 =?utf-8?B?NjRJbm1ndXhGcC9yZU0zUk1TV2g3SUFuZy9IQnZPVGVXazJjTGVIRFdVOHg5?=
 =?utf-8?B?ZFdEYjNuWm9nRnlQbUtHTU52ejVqZUdWM1dqb0FJOFI3VjcxcWZtODhSakdx?=
 =?utf-8?B?TU5TMktzRTZXQTViK3ZWVW1DQURtYjY2akhwSkVTdWsySUtqRkFnZVA3cEk4?=
 =?utf-8?Q?naUlfd7KTlNZywfmR4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55af983d-b64a-4f9a-dd1e-08de6b2296c0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:09:03.7031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zInU9tR8aJjIFzeabLg+dSP6wKo+d5oDmkfPOJcb9GypBmrSyUHocMaRRJTnQIezsSNWkEac3ZXZBJBOCt72yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10441
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_090908_668192_FCF4D32F 
X-CRM114-Status: UNSURE (   8.91  )
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

The nand-controller schema enforces specific node naming. Adjust the
existing DTs instead of modifying the YAML schema to match legacy layouts.

Update the DTs to follow the modern NAND controller layout, which has
been used in the MTD subsystem for many years.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- collect Krzy and Miquel's review by tags
- Fix missed "A" and "l" at commit message
- Add reason why need clocks at binding doc
- Link to v1: https://lore.kernel.org/r/20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com

---
Frank Li (3):
      dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27 nand support
      ARM: dts: imx: set #size-cells to 0 to align with nand-controller.yaml
      ARM: dts: imx: move NAND properties under nand@0 node

 .../devicetree/bindings/mtd/mxc-nand.yaml          |  7 +-
 .../boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi    | 10 ++-
 arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts      | 10 ++-
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts            |  6 +-
 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |  3 +-
 arch/arm/boot/dts/nxp/imx/imx27-apf27.dts          | 82 ++++++++++++----------
 .../boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi    | 10 ++-
 arch/arm/boot/dts/nxp/imx/imx27-pdk.dts            |  8 ++-
 .../dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi    | 10 ++-
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi | 10 ++-
 arch/arm/boot/dts/nxp/imx/imx27.dtsi               |  2 +-
 11 files changed, 100 insertions(+), 58 deletions(-)
---
base-commit: 8202bc92ce172698e940dd75d295c5db24a848a2
change-id: 20260211-imx25_nand_dtb_warnings-7751b8b0e233

Best regards,
--
Frank Li <Frank.Li@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
