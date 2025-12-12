Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA2FD44147
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Dec 2025 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KHE9aYCcoV4qdtKpQPgxiozSLm8XaIwoS/ne9b+RQ9w=; b=u+2CZNblNBRH6q
	+kgT3T3FhJOcry6hEEQNYLPtx57C/5P9GRgqXVuCNnTSg7JgBwujVxL4AA1/FI34t2g77NOyY54WQ
	cUhbCRet0Ayplh6oBZwTH38c+cX/+rfSEP5niXJGpiibYFC2xIjw7F4AQoED0pfUOvuB4hZxdmRZq
	IFQmNH3qCMPtgEnGmNYS7GFI55wQFI1H61TPrhS8d5fIyOEgh9POJZpnZydCnEfOy22G6A6zsRxHz
	E7yQ73wEgNoTWiIJDeUvuxMI6AZXrtiiXozOAimFADos2TAtDqK6EMngbUhgNsc+e3u9MvPRPMRTG
	Yd1BGsfXV1pr882f+DIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTyWy-00000000Ghm-3kbU;
	Fri, 12 Dec 2025 08:29:40 +0000
Received: from mail-northeuropeazon11010056.outbound.protection.outlook.com ([52.101.84.56] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTyWw-00000000GhQ-2sMy
	for linux-mtd@lists.infradead.org;
	Fri, 12 Dec 2025 08:29:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pkm5MaiAmq8u0pfQKXWuC0S4fu2La2O4zeVjzmYn2u2FlC30IYCIN0iJyCGPWwErIU997aLLhs5SiowXCI2BTJewmFs0AVjvpR36lR/2QjVAq1PZGt1BoIHomyDkY8oNs6fJfESu0CbdQ+INRi3Wgq+nf0JRYLk81h+CRu7VjsuvVj4LGgnaS+muKrnkAi1MFYM9L2hxR7NUgPI99Jy0uFFSq3Wi+7i2VIvrPaWfi/5mA1ZKNO2KBVFlbth1l9zV4GlLLYJAqQmksDEuGOCeoKZbOzv7+UXt9OgEj1mDvfHeGY3qpTTdplIxxQZRLzzUZ9OtAfmBHbH20DRtORxp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Yeo7HkYBf/jEgUpMgVBjL+sTJ1UVDeO8GtJ5cBy4xY=;
 b=XBSs+l8FMHGa80N6C5RTX/B8/MsGeE0gUrRq0L2lRmheMpaD5wJ3CUakCrTwZsgxdUnP1uBQrp9/clgOdnnT5M+RSvCSvlXgdemYCydWuBAX0REv2+/yyqeZU2rvrlpbDhtlz87e2SqMIm8JTA5nrYabZZMMZU5XxsbTQ7QmF5O/zpRT8Qid5Gs95LiUM5Ui/+Yk0pcT19aRnwZadoURIP54nbg64KeP00pugyI/LRN9lhNpvNG3hebbglOpwLFzpw1xesvmMwxkbR/87Y6rCXEW0LMucZ1jNA289e+2HuaDfdwrDU1QaxH5Ai3NCJWZlgCB85OG+DbFV7T5T3XEqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Yeo7HkYBf/jEgUpMgVBjL+sTJ1UVDeO8GtJ5cBy4xY=;
 b=Ko9Nip6SrhKv6TVUsAc/rx715JkbaGlFt+XwG3HG9vvHLHVGy1Tq9kwy0sZKZLGumVq83sp0e13CZABwS0g50t/SnhuPVZfRO8lkpe6f6EauLZ5bUIP2AU9WL3vonxJxM7HoE/dTO+hIfqJFtDYf9+eq0CPWHC30DG0gPi19yu1r+yiTnXb1YlRtDHfteJ3rPkDRQqgv4KeIKlz7doQAuvr+n273J7DWAAYtbBFKMOzfpwWfu82Z0UTMou+B2L55Iyb5eYpQg0W14GmDY18dj7GMprTwjRLNUPIXijttdWdEB2O2olp5wMH48exNYan/pEO2UQm22/zklac4sEdo1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AM7PR04MB7159.eurprd04.prod.outlook.com (2603:10a6:20b:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 08:29:33 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 08:29:33 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Fri, 12 Dec 2025 16:30:32 +0800
Subject: [PATCH] Revert "mtd: spi-nor: micron-st: use SFDP of mt35xu512aba"
Message-Id: <20251212-nor-v1-1-20a5a381979c@nxp.com>
X-B4-Tracking: v=1; b=H4sIAKfSO2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mj3bz8Il2jNGPz5DRDo9TU5EQloMqCotS0zAqwKdGxtbUAh2/pOFU
 AAAA=
X-Change-ID: 20251212-nor-2f37cf12eeca
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 han.xu@nxp.com, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765528249; l=3798;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=AMj8o/8Rmjb5G+RWVdYG1caAeXBG+m3H3Y0DmtTqK4s=;
 b=c32alDZzGNu7YuOJLFnJf9wL+Bok7ll2yG6FJs3N1MYSNQ77L9Rk8uN782I4tN7ldZANteLJP
 kI404r4RfGBAHFniaPZQ1ztnpLoYP5G2rpmI7QQNZ8tdIztIKMM7Lcy
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AM7PR04MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c70fcbf-955c-4ed2-0d64-08de39589386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkxRQmNLWGpBOEx3c2RWMlB1Vm5pcUxHZzBiTUhWcEJKcUZTNVRXSzYwZWhJ?=
 =?utf-8?B?SFByQVY5RVd1UHZRa2tuWVdXbS9VNytYeEVxV0N2R0xDZERvTWVhUXJpLzRB?=
 =?utf-8?B?ZnMxMjJYV0t1d2NHc2VzcnY4bFhzWHdwL0NmbXZzVHRHcndhcCtjQjdRdjZL?=
 =?utf-8?B?b3RVVjJyOUxCWWxiTHlzUmlOd1I5a05YQkp4NkpHemViT0JweWNPRk9JamlE?=
 =?utf-8?B?UzlTNjlwNkhuMU1oWTQyTExQQXV3WWovcDJlMUREbTJhSWpsR3BZREpPTUhZ?=
 =?utf-8?B?NXpjUWxxUlYzRlNYQWp1QXdobEN4cHIyVDBVbXc0ZjlXbW9IcWg4WHg3SHBk?=
 =?utf-8?B?SUNQOXdsNDZFaGRJRllRUVpKZVdxV2dyc3VkZFkyeVBSYklycEk4SkthL1RJ?=
 =?utf-8?B?c3QxRVFFK1VtdngzOFFxU2J3QTJzeUdndmovTE9hTGMvb2hJWHJUdldhZEpK?=
 =?utf-8?B?aUkzSGE2SGpnbnZEV0lMS0R4TEpZd1FnUkkvR0NQMEU5bWducnhjZWFiemNJ?=
 =?utf-8?B?eXA1YzJhS1E5UWN3RzNQTVB1V2RORDlEektMSTRmUnZFZGhaQmE3WmRiaEMr?=
 =?utf-8?B?c0FPdU5JNlowUGUyVWE1bmZDcmViN2I2UWJUZE5MbnJSNGtqaERDeGM1NW8w?=
 =?utf-8?B?WWloRjdWQmpUeEtWQnpqRndqcXpUbnNMUWo1a3BjZW9EOEhUZWYzaVBFTWMr?=
 =?utf-8?B?NUVhRzVDbGh5UG5yNTdNL1FqNHBtUVB4SXkrL0s5MEZ5UUN2NnZrMFRUbW14?=
 =?utf-8?B?VDlHaTBGWm9FZ0tGY2I5dnJqWUpOcVBzY3BCWkcxWVcyUzVoQjh6dG1tOGNq?=
 =?utf-8?B?akZqNUZ2ZzBYN2owVGc3M1p2ZnM0TzVXT0lCN1pLVmtFaTBRdjgrZkJjNVUx?=
 =?utf-8?B?T1pwa0xDZFhtQ2FYMkJCY01EcjYxN0ZyWDBKWXRNc2FiMWk4Mzh4UWtDV3Vm?=
 =?utf-8?B?Z2xsM3lIMXY1YWdZaWNzY25Kc25ka3BxQ05IUFpXQUFjcTY2Q2FObU9uV0px?=
 =?utf-8?B?aGhxOVdKcDZQYlJUQ1NtaDBJRG9Uam9QTzEwM3Y5YWtSZGdqTXRkcXpWY0Ns?=
 =?utf-8?B?MDU5T1N6U2p0VU01NGhoeXJxYU9zWTFlV3Z1bzVBMGxyQUFPUjNFWlk1Y0hG?=
 =?utf-8?B?UytpVy9KRFZTdGEzSTdhcWVVaWNyM0l5T29WMUVJT1U3VXFGQmFZeGVpQ2li?=
 =?utf-8?B?ZEtBVThBSHQzRTRDczJZZ1pOUkVWTWFOUDFOLzlGYWVCV3BBdHFtOE1YNWdy?=
 =?utf-8?B?aFd1Q21CSThBWUxtMkNJSVZFL3BLVUNaRjhNWUUvdGZoUVQyUUorWm4zcUFs?=
 =?utf-8?B?OU4rV0ZGNFNiZHd4YzJQTDNmVVAvdnloT0gyQzdXb1AyWGczbGovcEszRUFv?=
 =?utf-8?B?dUNDQ3RxdlFBRVVIVXNvZ05kcmJXeW0zUUdjOUt4eU45eDljOFd2TVdOSFJ4?=
 =?utf-8?B?Rjc5cEVZWFRUL2dBeFRlK3l5N3dLYXFCdXpYOVZYcFNMSStyVTBMallLNmM4?=
 =?utf-8?B?R3IzL3FyUExDUjlrUjBEWFBoMnRLd1l5RnFSYm9BUytJM21ta2luSUpXWk92?=
 =?utf-8?B?YTlOTk1yZGt6T0JZOUF3T1U0ZWlDR29IODBCUDBrMnVsN0VLaFRPRDJtOUxY?=
 =?utf-8?B?YW1jeE16cUhWYUtrdER6eXNBeGZlRDFxSzU2eW9qVkJDbm42M2xlUlg0K1py?=
 =?utf-8?B?VmNrREFUV1VZc3BGQzFvYUR1TVBJTENNZWJKN0pxNWdsUmh5eExCZmlwakR0?=
 =?utf-8?B?WW9vUGNzTTZ3RFRmNHhobzVtcGw1NFdERGg4NWxRZVI1Q3VtSDFRNmVEbXJ5?=
 =?utf-8?B?d0J5QTliY1dHOFlsTWREaERlRUx5WGFNYXJBTm91NzVrQk91bUQybk5NZVJI?=
 =?utf-8?B?ZkxOSitVU1d1ODcwdzU3Qm1TZ2NkQTVybDBEckFLL0hHRFZseXJFMWxzVjBX?=
 =?utf-8?B?MEM3Z1FrU1pXSTFrQi9nUldzbnZmb0dZdFJGUFI2dFdzZUs3cmhBNEs1R1cz?=
 =?utf-8?B?bnQzaWt3REJpdnlSUFNNOW42SlYvUHR0aFZmQ0VKY3JYeW92QmVWdkJ1MEFD?=
 =?utf-8?Q?yTrw1p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajE5d25zeE1CUjc0aXEzTVFFR2R6MGF5SjczQ1QzR1ovR1RycTQyc0pMM2RP?=
 =?utf-8?B?VDU2NmpjbGdFU0ppc3d0UG84OTJadDMyUmVuNXI5K2pMZVJSVjhSZzM4MjY2?=
 =?utf-8?B?M0FmSGZ1SUR5Kzd4d1lwVlJrZkhYRlIzbDUrUUIrZDB1em9LaW5UbmNJWlRI?=
 =?utf-8?B?TjZqNU1wVHdnMWtkb3NyRUVGMFNjREJqeTMwd1Z0dWRNRXdTdW5zOGpjRzhE?=
 =?utf-8?B?LzNHMk1qOFZQUENtY1lIZ2dnQXhVd0NTSkJhNFFNSm1udVMzTi92UGhBWGw2?=
 =?utf-8?B?bXRBTXBJWTQwS3hJQnBFOEozYmJWRzBVRUFJb1dkci9Ma0hRanM2NXIrRlY5?=
 =?utf-8?B?WHJxNFRYczZXK0h0UjAwdGIzYUlDMTV0dnZQUjFCN1Z3bG95enVCNlV3dnZN?=
 =?utf-8?B?UTUxcXBnb1ppMHQ1eVBCdTRyaDZXK0U4eDlIM2ZVZmF2T2IrVkR2UUl0ZlM0?=
 =?utf-8?B?V3RJZU5VdzZXVEFUcThRbHM2VTFEd1FOd05aWDFFN2dMWWEwYlFWRnFyMjgy?=
 =?utf-8?B?VDNHRDhhNmx4andkdis3R3NMQUEzalNIeUlMOHlzakpiU05DdjZqOTB0L0hm?=
 =?utf-8?B?TmhSdVlFSHoxT1h5L21FcUxOV0tYd0prWGZSRmNKcXFFVmNjcFBWb05pcmJv?=
 =?utf-8?B?NUc2TWtDZFFlV1N6NXdVOWxBTTdSNG0wc3gxMmZnQkl6ZCtzWXY2ZHhSTGtT?=
 =?utf-8?B?SGVQSUtBS3ZReTRqbUR4bjBHdWh2UUpHM2FrZHVVUDd1S3ljNzJBVVZIN2tk?=
 =?utf-8?B?RWUwZVk1dzZLTE5OaDcwUFBraWZObk1zSndTNXdadEQ2Q001aVgrZWJUaGpM?=
 =?utf-8?B?dUZkTWlDa0x0M2xyZC9aRmtoanlJVnF2ZmdRZ1gzVnUwWFVIZnhsaUk5akp3?=
 =?utf-8?B?TFFCM0w3c2V1QktwbVB1T2hlR1JMUXR0REJuRnhlQW5VYkpWNW5URTlGeXZx?=
 =?utf-8?B?T0UrYytDYU5qRVRMeFBsdldMTGExTUJObEZxVnFMZHJ6bWJlWUVobk5HZzlV?=
 =?utf-8?B?QzJBUEJBRkt4T2xGcVF0Tk9TejlrS3g2cXBkK3diY3JycmxZYzlZQ0xUVFBS?=
 =?utf-8?B?ei94UXdHVWZhaTBYQ0hPV2ptTXlTOXVrL29qVzJIY1EzSjdsTXZlYlZKK1lJ?=
 =?utf-8?B?K3I1OUZzci9jT2phQkZ1TUdiS3ZtNDA0SktzYUFCTkIydmVkOW5EemQ2VVA1?=
 =?utf-8?B?eEhtYTdCcFZ3MDB5c0hjZ1BBTHJGQkluVEZxQkRuSzNCUEh0RzVnRUc0Qi9m?=
 =?utf-8?B?WFZ6NlE2eUtKaktUdzVidVZOTDdjSkMzejlMU2pkVmZRc0gxbGk3R3grcjVZ?=
 =?utf-8?B?M1E1bFRaZ3Azd0ZmQ2ZkUjliZlNYVDcwb2JLMnhHUEZsNFlQV0xLUndaMFRY?=
 =?utf-8?B?eWxmOEdwa2RyclVMUVJFbThtNFNwUTFTejExYzkwVHhHTTFFeTFSSDdPTnU3?=
 =?utf-8?B?ckgxelRvYzZkbEVBVjhJM01KQ0syY1RQbmJkRGl5SHo2cEtORjVISWR0bEN5?=
 =?utf-8?B?WDJTc2p4V0k4aVFEUjZ5TTdFcEdnNGkzN25aNUI2bEtWbUtrQlo2VWpoK0xV?=
 =?utf-8?B?TUZmYzFmUHhvWTJpdEJrcnV5TXBwMElzOEMwMzVPY0dEZkRGaWpidE95TGh2?=
 =?utf-8?B?a1hlZFJHRk5wQjg2aFpDc2NxOG9SVkNBbmpMTFBHRFcxRVFYNmlWenQyMFBp?=
 =?utf-8?B?MmtrSERBdFpLTE5GcEFpQmtxbU11VHl4M05zcWRGQXAyYUMzNmtLOFdub1dC?=
 =?utf-8?B?MUxWUWVMdHg2S1ZwR2dFNHZzUUwrR2hRYmxsQk41ZGovMVlqUVlGNmJva254?=
 =?utf-8?B?c0Z1NVJsTXAxTHlCSDNsVkIwTVVMOVZXUnE4dWpNR0R1V1ppL2JIQkNHVy9E?=
 =?utf-8?B?TFRpK0NSc3VrK2JaclVhUnFQc2pRSmpkZ3RRU2J4YmRRb0Z1MTdoT01KK3RP?=
 =?utf-8?B?dHRQMnNQclA0citMNzR3S3hVTU51V0RXdWp1cUh6ZXBqMTlZK055UjhlbEdZ?=
 =?utf-8?B?WnlTS01YY0JBT1ZEYUNQMzAzWDRSQkE0K1Z0YmxZSTJLUjZuRXRMZnY5bng2?=
 =?utf-8?B?ejlMVzYzdmRqdVRGV1kzVFp3Mlh3VUZvZ0ZWSk1UU2tNZm1MdERnN0Q3bkFN?=
 =?utf-8?Q?O3sF9NKQzJiO/mliTNsDnZddw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c70fcbf-955c-4ed2-0d64-08de39589386
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 08:29:33.0906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEcRQ82NPqg0hKCsP8KK99qADH72GQNBvi+8vgKMTMpjvgXMWDv1ugFSzz0vfOaaIKyal6npcC9eHHDgZ8f3Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_002938_775375_9B6FFE88 
X-CRM114-Status: GOOD (  12.27  )
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

This reverts commit 44dd635cd632824f412ff2a6b320d9302a277ad0.

Find two batches mt35xu512aba has different SFDP but with same
jedec ID. To make all batches of mt35xu512aba work well and
support OCT DTR mode, back to hardcode the flags.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
mt35xu512aba chip with label 4KA17 RW303:
root@imx943evk:/sys/bus/spi/devices/spi8.0/spi-nor# cat jedec_id
2c5b1a
root@imx943evk:/sys/bus/spi/devices/spi8.0/spi-nor# cat manufacturer
micron
root@imx943evk:/sys/bus/spi/devices/spi8.0/spi-nor# hexdump -Cv sfdp
00000000  53 46 44 50 0a 01 03 ff  00 08 01 17 30 00 00 ff  |SFDP........0...|
00000010  84 00 01 02 90 00 00 ff  05 01 01 06 a0 00 00 ff  |................|
00000020  0a 00 01 08 b0 00 00 ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 8a ff ff ff ff 1f  00 00 00 00 00 00 00 00  |. ..............|
00000040  ee ff ff ff ff ff 00 00  ff ff 00 00 0c 20 11 d8  |............. ..|
00000050  0f 52 00 00 39 61 99 00  87 8e 03 d3 ac a1 27 3d  |.R..9a........'=|
00000060  7a 75 7a 75 fb bd d5 5c  00 00 70 ff 81 50 f8 a1  |zuzu...\..p..P..|
00000070  2f cb 27 8b 00 00 04 01  00 06 01 00 ff ff ff 8e  |/.'.............|
00000080  00 00 00 00 00 00 00 00  00 00 00 00 ff ff ff ff  |................|
00000090  43 0e ff ff 21 dc 5c ff  ff ff ff ff ff ff ff ff  |C...!.\.........|
000000a0  00 0b 80 9e b1 81 b5 85  00 f0 ff 9f 00 0a 00 00  |................|
000000b0  00 0a 1a 88 10 00 00 00  ff ff ff ff ff ff ff ff  |................|
000000c0  00 00 06 01 00 00 00 00  14 01 81 03 00 00 00 00  |................|
000000d0

mt35xu512aba chip with label 0DA15 RW303:
root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# ls
jedec_id  manufacturer  sfdp
root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# cat jedec_id
2c5b1a
root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# cat manufacturer
micron
root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# hexdump -Cv sfdp
00000000  53 46 44 50 06 01 01 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  84 00 01 02 80 00 00 ff  ff ff ff ff ff ff ff ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 8a ff ff ff ff 1f  00 00 00 00 00 00 00 00  |. ..............|
00000040  ee ff ff ff ff ff 00 00  ff ff 00 00 0c 20 11 d8  |............. ..|
00000050  0f 52 00 00 24 5a 99 00  8b 8e 03 e1 ac 01 27 38  |.R..$Z........'8|
00000060  7a 75 7a 75 fb bd d5 5c  00 00 70 ff 81 b0 38 36  |zuzu...\..p...86|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  43 0e ff ff 21 dc 5c ff                           |C...!.\.|
00000088
---
 drivers/mtd/spi-nor/micron-st.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 88033384a71e5d19f5a26ca91f56a49e3017183a..0a67053a60693684080554db5b4688aefc00062e 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -192,10 +192,14 @@ static const struct spi_nor_fixups mt35xu01gbba_fixups = {
 
 static const struct flash_info micron_nor_parts[] = {
 	{
-		/* MT35XU512ABA */
 		.id = SNOR_ID(0x2c, 0x5b, 0x1a),
+		.name = "mt35xu512aba",
+		.sector_size = SZ_128K,
+		.size = SZ_64M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+				 SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
 		.mfr_flags = USE_FSR,
-		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
 		.fixups = &mt35xu512aba_fixups,
 	}, {
 		/* MT35XU01GBBA */

---
base-commit: d9771d0dbe18dd643760431870a6abf9b0866bb0
change-id: 20251212-nor-2f37cf12eeca

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
