Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27585ECD6F0
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 21:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Cd919Nt1BVBMqyvQR2K1nGtCQtYHblGGKQo9lkkdVo=; b=I3lbHloL7UZiJx
	uCp9/U9QVECeL2QYdQrenDZ/kWATvzArynT+LoMkVPHEBcrSVpjPK2xxnyxT72EsalDfTMLXPSBcr
	7OFbyj7Ce/kpSWu2pF2+42x5UXZmfjaQ89vZ9OhNfJFN7RhiKOmeRJV38q2kfNWA+tKH2YMdRUZOV
	xqdHOZUgOr1SNBmxd67i0QZ1Y9SqNPomRPOA84AHN8ku8oHtC/jzs3t302TxpkLSOrhYwmmKO97r1
	1GFuAvJI6D7scTrxzV9nDAtHRdJ02IHGdpDI/7Hx/rvYt5gsrqQbwzKK1Owlu5vVKzMMcYUzBzZY5
	smJz8eYVwF6G8elFs/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHd0-000000014MN-09D4;
	Wed, 11 Feb 2026 21:20:06 +0000
Received: from mail-westeuropeazon11011020.outbound.protection.outlook.com ([52.101.70.20] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHcv-000000014LP-3iKo;
	Wed, 11 Feb 2026 21:20:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOAWgciUbf/GuMlPmV4vD8TvxV5mb8O1k9sfxUPjvxUuSJl9jtENzIs1xphp+Abtp8F6zFka5NOp+2s6lyv6SD3ruQOsf13ibOVrLQfJgxgw3r0E1CsPhYTqObCEb07cPVJh88XUbyl/bUKSw/vJyJanFcq0Etlvcf4YBi0XfH7QMMH+XYg4Rp5f0x0Xm74S0/qAmSSBWUgz/9BbRK2bHoxILOaPgPVs3Q+/pbJK8Goo+J/5k3NIr33n6HEoGC9HJkWgcVGwCdBo6SqpBr/Q8keCnRSdaPoZHKyAZr9dtqq/iKHNv+C0Z6oY04owMI+Ux2oDZBYiIUdEmH7nWpKMaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8zcEVTTye1uWz/RT0KXk0qKSU2GsUnqg/F1IOLx8Es=;
 b=aB22uYtZ74vJQbTQrEwSba6X/+xgOpQC2pzOlryWyPMRIzvt1slsFTr9UBGais8oIx+9fdp3aGfIF9tVDMMp41vvWye1KcQ3WgQ7u5NcUu/lxVCBhP1zbjsof3gmjLOVX62ojGgCfrtN7BKcHvPTTRfh/X+9vT1JUMqWvPaMBIpOefgT7+pHd4DswidQylhwwp1aOOF8X6v57cTh0Egd4KlcxmnNrNOj/P0JO+DJHCZ34z4Hp1Mj4sHat5+m3qEai0db/RG8oS1jQdT43YLY9s3JSS4oRy3HJBANRrXsJbST350TjDG/lpONVR8xymhSIZLAzRh1wc8w5uOvZtq18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8zcEVTTye1uWz/RT0KXk0qKSU2GsUnqg/F1IOLx8Es=;
 b=IXboSRPcz4+c9ho2ypMq6D8HrwO8L6bBVX8vOcd+AYgvET6nlROSvOvZRm4z9KgCC5lj2vHHW5CXJiQfXsAvmejDXORIJwrIlGKwWfajRelgkzn6qfacl9/EYnehptvYrUKovHH0V6I2V4WowzzSYf3/Kmo86gzM6+HJw7kVq7R1jTcsLj1Hpz6X93GmUZOhikKILlphzkHdPcNdC9R0RyVVY0di0ExCG2HcyU2rgDxzq2NiwpkyPteH8wLgnZDGCx9Cm1vYOq8v3JQvjIK/9UczCyOEHUlAbDwm9AtU/VQnpBTlFAStlGHfT3+ZroDnCCiZ7ExKpe4qx8rjEc9HlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10154.eurprd04.prod.outlook.com (2603:10a6:150:1ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Wed, 11 Feb
 2026 21:19:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 21:19:54 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/3] ARM: dts: imx: clean up imx2* NAND CHECK_DTBS warnings
Date: Wed, 11 Feb 2026 16:19:38 -0500
Message-Id: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
X-B4-Tracking: v=1; b=H4sIAGryjGkC/x3MQQqDMBBA0avIrA0kI2rxKiIhaaZ2Fh0lEQ0E7
 97g8i3+L5AoMiWYmgKRTk68SYVpG3h/naykOFQDahw0GqP4l7G34iTYcHh7uSgsa1Lj2Bv/8pq
 w66DWe6QP5+c8L/f9B9UzhCdpAAAA
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
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770844791; l=1463;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=++KpJgIOnbg6I0AT6sim0dysyaJtje18yds2MnGEIbg=;
 b=n8oWKoddXzlkp+1bAcqMyjnDYGv2TvY05QaNnrPGurtxKZoB+YS3Wbmb8GUF4UCm3nS6F/OPd
 RwgREWIxzNwCYHeeULpBvxetJfkBQaXZlpghK3ZfKGigioKPBXSBNOq
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10154:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5c4e51-82ee-4eaf-22bf-08de69b34cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWNPTVlZV3hqM0RSRWY1OW9jQURqLzd4bWxDMmV2cDgvK29TQ0VGUjF2Z0t2?=
 =?utf-8?B?MHBXT2ZkYVdOcUp3WjlCaXFDQVRxM1p3T09TcWUxVnYxVUVUMFJ4WUU0MWFL?=
 =?utf-8?B?RmJVc0wzV0tSN3l6M2ZHS1ZXY05FcVlDb0xraWQ5Rlk0NGJmY3Jzd3JnaU1W?=
 =?utf-8?B?QkZLZFdvQmp0Q0ZNaU1ZTjgvbVlPQ25lbDFwTzdlTkdPRFpOSWJ5YStYb2pN?=
 =?utf-8?B?WG9KQjN1VGk0R0E5VTUyanNmbDRwVEJVYUZib000NXRzUktmTUVVaVVMKzBx?=
 =?utf-8?B?ZU1CY3I1Y1FLYUE5YUc2aXFWOGM4R25scFpmbkNJV044MEZ0dng0N3dtMndT?=
 =?utf-8?B?R0l6cVZ2cy9xNy9qb3B2cGdvQnpVTWRnM0tCSFZiZzlQamhwOXRzaHl2UTcr?=
 =?utf-8?B?S214T0dla0hSeDFPVUljdThPL1RXRjJwa21YQ3dnY0trMnJISWlFSm1sb2pw?=
 =?utf-8?B?ZzFML2pZUXcrN3pLSElUanN5MlVxR3grM0dJaEoyOThnNDVqTGpqZ29PWHA3?=
 =?utf-8?B?MnU1ZEFtblZ5TkkrOW9iKy9McXdsZHZ3SGZqS0FGd1JkbkhLV1g0ODlUZS8r?=
 =?utf-8?B?anlhVWVQSGxsQ1NiQmR1TXl1L0RjMXpLbXVRNlAyQVBQYll1aFY0UDJDamNx?=
 =?utf-8?B?MDRsRVA4SVdjYTdqbXVuTDUzTHNGWktQamlrTjVzcVVVSGZSc2ZiT1ZxbER4?=
 =?utf-8?B?T1ZzV1RFcUxxWXFXQng4Ny9GMnNRV25lbDNmaXgxNXVRVmsrZStDZkNlUjNL?=
 =?utf-8?B?U2k5K0VIRjkwOVY1T1dFektlR2JVK01rMEJqNG5oRHU4VlBDWXNjZXkvVUVo?=
 =?utf-8?B?Y3oxRXdHTGV1UXMyQXp2WWlySXNSVUZYd0paR0Fqa0dXOU5lUHpTSW9rZ2Zu?=
 =?utf-8?B?UklMb3BNTkMzZUpsRFhSTXlGTnVUeVBIdnQyMzhBRDZUMTkxeXg3SHp5WGtY?=
 =?utf-8?B?YmYvaW9ZUTdNMktXREplZHRqelR2SVlxeGZoVFJDWVJVR3c5bEsyZmF4N1BX?=
 =?utf-8?B?dXJSMlJlNmVTOXI4eTM2d3lMaW5BUnpycUNKWFdHQWVYYlNDYjlFVUVBMXFG?=
 =?utf-8?B?YmhFVGh6YTFhR3VKZkpEYlNYWUo0YnQxOEtLS205NUJ2OXpRcjZSVzdHTzRy?=
 =?utf-8?B?Z3AxK1ptSS9jRTRWa3JjUGh0QTdVNkFwWlFWTUNuYW1Icm5EWFhQYVRXdnc1?=
 =?utf-8?B?UnREZm9EMHFLNEk4Vk12QkE4eHd5dGNwZ2NiS2FjaGZJajFIZVdXYVlhQ3Fx?=
 =?utf-8?B?ZjR4WHRUb3Z6NEVUYVFKN05ZV3FXRTNKeEF6d1FPYWhMelg3eERlWjk4eXcx?=
 =?utf-8?B?ZStOUmQ0L25DZlIwaHp1dTFaNjNGOUNYMlh1K3AzY1JlclZTRGlOMEFiRVFn?=
 =?utf-8?B?cDdTdFZXLy9MUmU1R1RrQmdBWlRacExZUVhha1BYaVpmMXM3d3hTam5kY1Rx?=
 =?utf-8?B?eThIc3BYUUVjRFdLTnA5RzFtTGlQY0ZwZXBrMHFZemZBdGphb2s1d1lhVDR1?=
 =?utf-8?B?WmNDMmVOT1NORkdvZE00akVTS1ZLWVo4eFJxaEZmbzM3VGhFaEVaY0pONDRl?=
 =?utf-8?B?a052aFpXT05LTjdPZ0YwTi9tV1FNSGN4YUV4R01VY2dYNGVSa1hWVHBkZGx6?=
 =?utf-8?B?RmNua2kvSXZVeEFBdTVNTCtINTMrZFFGeTVIdlU4Uyt5QTVJQnpNRm1KVzdj?=
 =?utf-8?B?a3QyRm1vMkord1d5b1VsUVo5UENrMVkvMk4zYkRVQ3hxOTQ4SWpwK2crb0JF?=
 =?utf-8?B?OWwrSEJwVExyWW4xQ293R1pVanpzNVZkUmoxbVN3WStTSGEvQmFtK25FS3hk?=
 =?utf-8?B?WXFLRHNaNHVtQWl3aHZjZTFtU09LeFIzWDJCVjVtWVZPZURYNEZWcmtNYVFL?=
 =?utf-8?B?bXhlTlYvTlVBTy9WdzZOVjVxUHc1bzJCOFZsdzZZWWE0aFVmVjNzbVM5bHBo?=
 =?utf-8?B?V2tQdHdzVWcwbmtibVVwM1ZlYzBHNFFMT292UHNNbWpjZlZNRENQT1R0SnFI?=
 =?utf-8?B?Z0Z5b3pKNXZTMjBoeUMrZjdzZTArYjhnYXB6cFc4aU5ocEYrZ1Q5RTZYdmFT?=
 =?utf-8?B?aFpRU3ZjZmVaU3VoVmxFMzVSOHprd2NSKzh5cnBKRmZvVG1FWGVGc2NyMHkr?=
 =?utf-8?B?aHd2VUVXQmxwQThHQzBMVWNhVEQ1TFB0UWE2Q3BOcWx0OUJRbkNrTGdkTlJT?=
 =?utf-8?Q?asIf89hv5/mSMQ1sAQ+GbhKyDI7q2cn/9xu6nCmsget8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1paUStTeXk4Y2VVS2pUMThyMU16c3prcmVHT2wrajF2OXFMWENTRG44RGRH?=
 =?utf-8?B?UFJRSzVGZGo5WmQ3TGxpSVBJRU43d3ZHcHgxREVsV3M1diswMlVVZUphV2tp?=
 =?utf-8?B?TDZhUVRxUjdCSTVQc3FQbldUaUs0SElaWGUyZjNDMUFheG9TZFQ2S3BVYjZE?=
 =?utf-8?B?elhDMnZRYXExbVpzNktlYXNWQWhqWVJiQnZWVnY5ZEwrNG1PZjJZZllwckVx?=
 =?utf-8?B?WWo3SlVwUEExdDZnZDlHSDdGalV1bHVwSlAxNG5oSFdzSzFveWd1ZlZ4UmJl?=
 =?utf-8?B?QmdNRWJ6YXRNcjB3OXNZem5FQXRNRzBRcHZyUXh4ZzBqak9VZ3plb0pFTWxJ?=
 =?utf-8?B?Um1SQjNrbzBmSVZXOTR6MG1WMzQyUjU4UVlTM21ZSVJWQWp2dnptMmhUOHdo?=
 =?utf-8?B?RXZuTnc0NzZ4QkIzQzcyTndaQk9yOWhQSmI0WUdxVHhucGVnRUh4YXQxTy9B?=
 =?utf-8?B?NitwcFNEOU5LaW5RNVdTN3BPYmVRTCtjR3BKdFpXUnczdEEwcjR5ZEdvaVJj?=
 =?utf-8?B?d3lsbDNUbEF2Q1lkbkt5aWQvWlJEVzNyeldjUU0ycFZsTzd3NFF1dzZyYm43?=
 =?utf-8?B?cllBYit6YzdkQmpjMTNTb0JiU1NHVjFWMURnQVJvelByYlNVb2JwMDZGZTJX?=
 =?utf-8?B?OHE3d0NVMkdZQjZUQlhRT0prQUJvWURiNkM1QnF5OHJ6ODMvWnFqcXRzTENl?=
 =?utf-8?B?SXdVOUo1VTdxVi8rZWhQOTBNQ29HUVBYMEhrRFUxL29Yd2o5WndwYjVGWVov?=
 =?utf-8?B?dWxSRG90cXBIQnpnNGREUkloL0lMRHFkblhwTnhOSEFzNTl5aEVUU2VVK0U2?=
 =?utf-8?B?V01oQWJteWJGVng4N0MrNGxFOVZsYXpyVXR0QnlsR3dDTzFSNDVVMHhFQ01L?=
 =?utf-8?B?ZWYwRGNiMUJrbisrOWRiOTkyaVdaUUpNR01ZQ3BzR2VHQXIzVVRva3o3bmxD?=
 =?utf-8?B?eWxwQ2I4U3BDUHdtWERGVVhZRVV6WHRIVVlZdnNvVS9qQTdXYll1K1R1NmY3?=
 =?utf-8?B?WkY1RE9oV01Talczc2JkdWU5d2s3bGp4VTFRT1lSQm5QRHB2dEhyR0F1ay82?=
 =?utf-8?B?c01Oemw2c2RhSi9yNlFEYmNSaGJhZ0JnTlF3TlFtdmVwWFRuQlJRSFE1MWps?=
 =?utf-8?B?NWRZbG05TjJic3dPaVpJODFJcjhQTUhzTEthT1ZOTE9yTC9XeEZDTlhUY3Vh?=
 =?utf-8?B?RCt3VVBHUE9pZHdDL2ZaYnBhb2p2YUswdTBGcm5VdXR6M2h3cTZyKzhmdnpz?=
 =?utf-8?B?NndOVWFEUXAxWFpMUXdiZUx1OThWQ21KRTUxd0JHM1prcE1GZlgzOEdWenBz?=
 =?utf-8?B?a3IzZFpjRHpBLzV0aFFSU28vNzIvVW90WXdpUktRTE5ZK3Z6Qjc2dEdqMWpz?=
 =?utf-8?B?N2lpNG5KZHRnOTAzNSsza05UazhxUGtFdllSdDArdzZyQXJ1S3FJcjVQYWlI?=
 =?utf-8?B?REFhZmNqTWlGenhCVWQyaDFOdUk3M2RvRFJORkpqRjBFeUZ0aXV3cVhiQUdB?=
 =?utf-8?B?bEFrbDhhNVl3dEpXQklNMGdLNk9tY2dqQUs2M3ExTHZCVjVFSytGd0E3cjZS?=
 =?utf-8?B?N1NhanBKLzhYT0VCNjErdThoK0Y4Q3NTVW5lNWdNZDhBRmNNVVpTZEpMcU5i?=
 =?utf-8?B?MDBQWndzWnJhbUhmUDRJYm9zcm1UYURrVCt0UE44bXZmb2dxK2VObG1xaEZn?=
 =?utf-8?B?aEFYZVF1azFaU0FtL1hPZTJIRWs2dEx2MncvWmN4QXpQZXEvbG9nUDNsNVkr?=
 =?utf-8?B?Vk00VzdiM1dCaHJUejA3eVcxaTVUUmc5Qlp1MTlCZXNHYUxLS3J3dTN4eC9w?=
 =?utf-8?B?VmE1TUFYRGloZUdudjFTUG1vTnkyZS9KWDJXb3RSbDQyVVlkd0lxU21BUGZX?=
 =?utf-8?B?T3ZUQ3dpakxCRjBmeUlMa1AzUGZKWlgrOUJWQVBpdVRwc2xJTFVHMU85YzRM?=
 =?utf-8?B?RWNGK0RNcU45czhONCsrdGZWd2FSb0tBYk0yR2JuMVI0MENGSk9mMThOMnp3?=
 =?utf-8?B?Z0tLMmcvVTlmS0ZMZExhNW12SE5LME1zUGRXMjFXSVBqZEYvcGNwRG1jMUY0?=
 =?utf-8?B?RTlKZFdUUXhEZmsrV1d5V3dPWitrWVRtK0svS2gzcHFOQmdtVllLYXZPMzVW?=
 =?utf-8?B?SmxLNy81Vy8xMHk4VkZiNXdOYlVxQ2l1OVlPWFI4Tk1wRDhQNkRBWFNUa2NF?=
 =?utf-8?B?bmp3d2E2QnY3czlVTVQ3d0pwRjR6WVIyYXBmSGRBYWoxZ3JUemxwc0VLa0xj?=
 =?utf-8?B?UUU2cDRXL3BMUVFNL3hmTEl1UkxKdlhabUNhUnEreGgwQzV4cjY0ZjNSbGNi?=
 =?utf-8?Q?ikdFXc4RZ33bpCrTp0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5c4e51-82ee-4eaf-22bf-08de69b34cdb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:19:54.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrlhNbSwGD1T7h9b4SpbGliXg9elHa1GhjLrNrLi9TEIHDINhAkwAbjwO21ywtWHn+yHQapImlhnCFZbuAPhTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_132001_935412_174271BD 
X-CRM114-Status: UNSURE (   9.10  )
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
Frank Li (3):
      dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27 nand support
      RM: dts: imx: set #size-cells to 0 to align with nand-controller.yaml
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
