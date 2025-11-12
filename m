Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A75CD13D3
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 06:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GCewBWXrp9vGauPU4chzXJjkfBw3f75WYuPO9hbIZIY=; b=VhWaq2cnAvYGXW3FQIx93r7lIw
	2dQBQv7YblP22hMsXVsfpdPUSEpXtgfsrFMetCx4yT07k1UwpU7aLvys5WdGeIaxM+5Gqnrt5Pspf
	9F67tLG2+3Py5vrHt3NCYlumaR1ZkzTiXkqAuUbaurE4DVL2BRP2vscjPMReqBkl3tpYB6Rnyv3cX
	YSpdaEVynBQkZyEKwk26/CaJgO4/Wq7DiEJ1V1iaEvyIoyQrUvJgX6FTXL/BpBS6N3ui++AVvQMqa
	aEqVxOMT6CUknVUjF/+2eabm9mV0H060qnqVe/3WWayrqQBZHcJOZsInouyz6smAntbByXIgH4nyF
	GkLmoYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4Sm-00000008CeT-2K4j;
	Wed, 12 Nov 2025 06:36:16 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4Sj-00000008Cct-41Lw
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 06:36:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/1LiZEsorOfpbFcmrjAxF0+2fJfIpkzDSkflS8VJA+L/o+ZAWFFvKpqteAJfFtAdwt4PVsBkgWETldhFvBZ+uD/KENncFPToA/COLYC8Xs82WYUITiZQOXaOL4EPNZC4bCZ6kIJwQu+/EpbW17P+kRdQw8LDuxrGWaNxBIsDWiuzeCuRX27iw6ikPvPwtQh07rovasRGfUKmKAlFEWyLdeWJ0/lfSz56eWNnTAEdZ0ZwQasro2WkKW0y7X66jcesMW/y/poymWMQDWKpmtD9hmr9uIDDm7LDx4eAecpAq82npMM9XdnCYNX1s+DdCgg+qHW8IHS1cZivgbsFbw+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/UaVx79feLzt/kwGhD1/HTo9b4GEKUxtKNcavU67kw=;
 b=EfSGBfAnR6Fex83ojIp1fxvz2CAcED5kT8DN99UIKDzXzcvdMyEquv4bC8mnu43uxwUOyhpMZuSoOp9Khnmybg0HtTZFeekgEEEnmMLS3ARupDaL2SxAxyiM2C3XPUonGTwwLNyBmKHCV5Kc6qwIwBMTXnSMTMDt5ZoH9t/sytbqBrtv7XHNVrHtf01IJmsriSHb9wXuewRJtNxOTh+ovWhLZqxR9fTK3epQLPzxil51Uql/qnRPNMkEaZw2Su4g5JJWN0yFbOc1WbS3vlasN51LSIiE4i+7GG2TX1RfB3GuoO1MK8WKRVooXeEPonxAgrmlfmPQqfp4BYw+6sdY9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/UaVx79feLzt/kwGhD1/HTo9b4GEKUxtKNcavU67kw=;
 b=OYfHEYuAYMlNIZ+KLIhbpnHPVMnrWELTPI8YRC4LGEfoEN2RIVQtJK4dbK7vxpcYUYahCnm1oFJJi4WtSqGDEcXoLbWizW+HqP7CMq1WgQfochApsHTDCf0Dtw6cocZPPrDQ5vnl/mblULC7fAmJzIHpAqbFiOpZmRQ2F6QdHAF/R8ovGz0wOkr3AenLcrTNtHLO1B0m+brV30KRJ66V6Mq9Dwis46z+1j+EXoT8Zls/XS7LTsO63vSK6IRMzjHxi4wrVT2LYkTidi/LrO5lulRuiVlsZR8qZIf8kjr01BvoY8VhR0/kATuqB048R6V2lZd9A6FuUJSJ62h8UKVlug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by DB9PR04MB8187.eurprd04.prod.outlook.com (2603:10a6:10:24a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 06:36:08 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 06:36:08 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Wed, 12 Nov 2025 14:36:19 +0800
Subject: [PATCH v2 1/5] mtd: spi-nor: micron-st: rename the die_late_init
 functions
Message-Id: <20251112-nor-v2-1-8699383714b9@nxp.com>
References: <20251112-nor-v2-0-8699383714b9@nxp.com>
In-Reply-To: <20251112-nor-v2-0-8699383714b9@nxp.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>, imx@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762929419; l=3812;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=SM+ARwu3tWLUueEvcjbe4AknlOqtRSUPy4ZdW/TaTcg=;
 b=OOD4+T9VsfOtJCrkUSOe+zj6RZ9D7hed3RYI8cVDgp8V4H9swcDUdf58XysNmQ/Aw929r82Y5
 X+H0Q0xl33kAAbZnGjQyDLEoN8EvnFrB6xtUbe/FhmnXMGXV3/D4jXV
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|DB9PR04MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e675e3e-51aa-417d-b691-08de21b5c342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0s1aUEzMzNtYkNyMm1XSGZDalY0T1FTWVVrOHQ5dVNFdWl1TTZscXN4Wkoz?=
 =?utf-8?B?ZWx6ajIxMUFPdGJvNXZvUHJ1ZVMxV1JKQnN4ejJMSG40K0ZNRzBlSHFIMlBZ?=
 =?utf-8?B?RGw0TDZxL0s4NS9Ybk9maTBlVXNjd3E5NklmcnZmdlkrVzFOcW95RnlpaEJp?=
 =?utf-8?B?cFBFeXBJRlpsZGR6NTFKRWZ3YVhQektMbUZxTEFUbWxpRkEyR0ZZbVVhcWx6?=
 =?utf-8?B?Q3c1Z1Q1SWoxeGlrQ2hYbFRaZVlUeEh4UUt2eURjUXV1Q3ZWa3VhK1BTeWly?=
 =?utf-8?B?NVR1ZFFTS3o4bXZ6OEJUUUVtWjBvM296TTlHZzc2cjZKVXNOWVhsb1lFdURl?=
 =?utf-8?B?ZTJkWlRuNzNmWVFsZzlRRThmWHpqSWtJNmovYjNJQllzR1hiSlFNM3A4akQ2?=
 =?utf-8?B?T2RBVTI1ZVNVQXJLWUlRSEVkVHlOcm9Hb2VVU0d0cVdZc1NzcjV1VG1TTDcw?=
 =?utf-8?B?Vmp4NXZuMDY4QXZWTk9samF1aDBXQm1US2VNWXRuRkFXeXZwdmxaRzJuTmJS?=
 =?utf-8?B?RVdyTDh0OHBHdkIyMHFZa0U3TTdXdHFLQjA4aVR3NkpzdE1Gd3FjWUI3dlR5?=
 =?utf-8?B?Y0pzN09UZWhod1RlT3I0eVFHK3loWjlkTWpHUVN0dHYzdjYrbU9UNHNXYmNj?=
 =?utf-8?B?RzZjTHQ4U2U4VmlQTVlrSC91Q3ZtdzVVU25EeWcxTmg2TjR4dmlheHFBRm1t?=
 =?utf-8?B?YlM2bnorUU82c2FnZ2RDWHFpWUZoQ01mWFVnRjdPUS9xQmFtazlFc0lZT1VX?=
 =?utf-8?B?TWFXS2VaZzlpMTd3UHVoTVhSUmRTdHdtOHpmL08wYTFpV3ZETXQ0QStXc0Zh?=
 =?utf-8?B?cFpaamh5UWdrWHp5eVhSVzJuVHlVdG5BdzE0aFV6NDNHTkhESXZ6OXE2U1No?=
 =?utf-8?B?bHFRZ0pSUUsyTmN3eU91V0hELzdQV0VIYXpqNnd3YmtxRzhib1YxTDA1SFVt?=
 =?utf-8?B?MlFxei9wT2NPcXBTY1pCa25pNGIxRnpSMEtUWE0wR3VTdHN4YnFXZlBOaXNl?=
 =?utf-8?B?ek4vRzZ1Z3VDL2pTUjZVT3V5MkxRUllvTTlHQXdyVU51aVVZclJ5UEdRallO?=
 =?utf-8?B?d2hucHZnNExCRzI4WCtoSWRDaEowZVlLcGh1aTNzQXRoUG1hRnhKcGxFazVw?=
 =?utf-8?B?TSthZ3BzZDY2UFlIVEhCc1BlOFlvUGNqSjVIeVVlVmhtR25ySTFqdHZ4Y1Fp?=
 =?utf-8?B?OTM3QjI2Nm9BZTY1cUtZMVFQWjZhaVJvN2hvQTJyVXNmdHVXK2xLZ2JKOXlI?=
 =?utf-8?B?VThMcGc0R0JHQVBKWHdhN2c4Q3Vwd0QxKzMwWUMwUWc2eTBnR0JMNTVqK0VE?=
 =?utf-8?B?eHZWbHUyMVBPVUo4R0ZiSTZJSGkwTlRrLzY5NjMwMjJVV2V1SFBWSzJDSVlK?=
 =?utf-8?B?RWhYTzlZQ0FHZG5FSXNtY0k5T3BFeWZiTytORWViYWdBazlLSzFiSnRkMk5N?=
 =?utf-8?B?Q3ZoSHhCTnJUbWNZVm4zMURjY05WMDRZb2JKVDJXMWFMVzRNSzJpSDkvbC9Z?=
 =?utf-8?B?ckNyaFZsKzR4WHVVWk9yOFdnNGE2bmxVckErV2RxdkNMVDFxYUVpUTNrTTdh?=
 =?utf-8?B?dTZWL3gvUGtSQnpjZm42UXBoZEVRVUY4SDYybmo1bU4zNmtZL2dVeEV1MW1Q?=
 =?utf-8?B?ditmcysyUG1PaW80RFREalVKL3lFN1Z5ZGhGYWhTTi9YNGU3aTJlNXpheE0x?=
 =?utf-8?B?MS9mc3RwUVdGY3JocWp4ajJ6ajJMNlJHRGgwb3lxdDB5QWZoNmU4ZCsyRFFl?=
 =?utf-8?B?SHhlSXN2ZFFDeEIyV1Jkai9XdUJVME1TUXlNTlBMclhXQ3hpa2hjSTNNc3pj?=
 =?utf-8?B?aWluQTlPcVBPNHdsY29BWkRndVZvQWg3akZ6S3JLZGdOQkxVQ3RHTnhyaVJT?=
 =?utf-8?B?cVZURXo4czRFTzVxYlFNL0VybysrVTh1eVZNQXIzV0ljQTMweTVUNmZqUE5Y?=
 =?utf-8?B?NDlCeldFcEJBRDM2eExGRU45U2JWbmhCZmxKM1dBRkUvZUo0YmFQU0t5Qm5j?=
 =?utf-8?B?am1zZWZtREp3WjM0M092S3BRRG5XSlh1TmZ5UDh0V3VMWTNsWXZBeXNOT3Mx?=
 =?utf-8?Q?s9Wvtd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck1idEhsYjczQmtkUkFTV1d6Z2hIcWJnTFhKeDNUcW1BSm1LOEt5Z09xTyto?=
 =?utf-8?B?dWc3cG1jYTlTVHFZMlpwNE4yZUFaaW5IYUZQc0dtdWJnVTNnRUYzRFBEczdX?=
 =?utf-8?B?NEoyY0xnNUZYQmVGUDh1Z0RSb3pBNHBlV1lpSXI5SGJSUUFuajZUZWJkeWtO?=
 =?utf-8?B?RWN5NkQ0NEhyUWVTa1RQcXcvbUF3TS80WFdNb2lKUjEzZXZqRlVFeDZ0T2NU?=
 =?utf-8?B?Yld2eWRIVExXYUVJaCtMOEh3aTlrNUFSdHFsWFVkWXp4MzVIRnhYL1FzeEln?=
 =?utf-8?B?ck9SSmRNem5ZRUp5dUdaQ3FTT1owTUp1MEdKbmQzb1I4OERwZTRDYXl5MEZt?=
 =?utf-8?B?Wk5WUzB0bW8yVzFscXJaalJxTFNvQ2dROVVQT1BETERhMDBmd2pIL2F1TmVJ?=
 =?utf-8?B?TlpQb3hQL1FjMlVQc0w4M1lJcXdESnNoem5lTlRuN0Y2M0JYdHB0am1OS09X?=
 =?utf-8?B?d1ZtcENPMnFXSnJJZDhKUTFEYk1GT0VXSnQ5RUV2MDg2T1pKN0NYbUo1bFN1?=
 =?utf-8?B?cHRoeEFrRnhSangwcFpGd0VoNWxGZmxwS0JETDJmTEVMYzN5a2J3TkZFcDlB?=
 =?utf-8?B?Nm01OHJ2Q1VuRGxaeEw1Smx1VFdtdWExWjcwempma2dnK3VIaDVpZ3JoaEVr?=
 =?utf-8?B?UVA4SWJzby9MNmVRcnZva0wxWlVsSlI3c1FXU1BSSDFBcXozN05QNFRqRGZE?=
 =?utf-8?B?ZHl2SWViOGFxN20veEtnVElVUlBucTFyL3BHNkVDTEZ6VjIrS1VqblZrcFkw?=
 =?utf-8?B?eVdMeGFyMGdvcmtnczg1UzJnUGRSczFyNGVEcldlTjYyaUh2T25mWnBEcEJn?=
 =?utf-8?B?UDc2VkZmZFZvM2NCUDNOS1pBdHVWL1dZc2p2TXFyNXMyZUxONjVJcmRaY0xi?=
 =?utf-8?B?RmF3RU5FNk4zeXh6ajhRd2RVc3JqODI0aEoxdTBqTVZDWXRhaFF1UUtKbGd4?=
 =?utf-8?B?b2tLK2IvWjVGRHhUelpSaHV5UnRMcVduTTBPMGJaRVhWT1ZLUGY1K2xiN2M4?=
 =?utf-8?B?M1J3bUk5U2l1cTJ2T1RVemNwRmkvMFpSRHUvT293NDZpVEpPVzRGaEZOcndx?=
 =?utf-8?B?S3JzVnBCQjJQRUtON2hqVTdsb0M0QmE0MUgzRXlZZll0VEF3dk9SNXY1aEJU?=
 =?utf-8?B?U0p3VEphdmNIK1hrQUkrRFdLaUtPSlJoM01ZOGZGTk14dE83MTJvaWQzdERZ?=
 =?utf-8?B?bkpBVGUwTHV3K0I2WSt5NDhQS0YxeExpY0h6UzZQd21UZTFuYUdsc280eDRE?=
 =?utf-8?B?UE9oTUJRTHVEemNXeEpiSWE2a0ROdnV3cGM1UDhzOUJrZUhJb3B2V0RIL1R3?=
 =?utf-8?B?TmRIVTY3Zk81K0hxUC9XamRTZThGMHNuWWdoWlliQUROTlJaa0lhQzhwU3hl?=
 =?utf-8?B?UXhEdWVWczlUS3FCQUhScnVtWnh4eFZBMTJhRENYNGNsMGl6cDFwWm80L3BZ?=
 =?utf-8?B?QlMyQTlWTTBmT1Q1K0lRcDJSYW5lS0NsS1N4bklmWEhIT0lkVDFyOHc3NGF4?=
 =?utf-8?B?bVRwQjZYbFlEVjBkWGt6RjNuWDlsS1VnbmtRayswWEZycTQvb3FSemJpTDUw?=
 =?utf-8?B?L2hmSHM3T0VBVVMvZ3pvOG1XY0dKZzN1OUlzMkZCam82VUxoZllPMVU0N21v?=
 =?utf-8?B?Ti9GcjN0Z0YrKzZHYm5uTEg2blN2MHljOHVPYllVeG9vTWhIMWVRL3o4NXlP?=
 =?utf-8?B?cERaSFF0cG44eC8yd0g4SFFQQ1FTMklXbDRvV2tndzRWTWpHeUZXeEdPdmtx?=
 =?utf-8?B?bks3WFdmOU9QdGFVak5LeDdrN3V0Y0Iyd2Z3QmZIR1dNbjJ3dHpQMWxSOUNL?=
 =?utf-8?B?cjVjUVFob296RnRhdDZLWnBOMEZaK0tvNml0QldVbFdxT0tPbG8wZGxmaXl4?=
 =?utf-8?B?dzVaYUJxQzdyYXlwQ3V1QjRHVkZvOHM2UzNrRldaZ2cvblEya1dmNm1RYVho?=
 =?utf-8?B?R1RSeFJIeGt3L2orNkFJTVJIa2hNcURsTi92SzdXUkZPelBvMzEvanlTM2Qv?=
 =?utf-8?B?d1hsYnI2YzN3WjdwQnllMDRncVRVSTJoQVl3ZkhMQVl6TERaelhObnFCK042?=
 =?utf-8?B?Y2l3dTFDOUxGd0J3YUFXRzBMc05JOXNuUHBRVnptVFkxc3hzZ2Y0elJhbFVR?=
 =?utf-8?Q?9H3y3GoaNJCtls3utb3G52OpZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e675e3e-51aa-417d-b691-08de21b5c342
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 06:36:08.3994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZs7XdusIZQE9AZ16q9UumQJhxcZGaqVzjupb9T6ETbmHYzsptO/H690UMdqYLHW475jqU7+AwXkI1B5jF5omA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_223614_005656_A0049774 
X-CRM114-Status: GOOD (  13.53  )
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

st_nor_two/four_die_late_init() also suit for micron chips,
so rename to micron_st_nor_two/four_die_late_init(), and move
these functions up, then micron can use these function without
declaration.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/mtd/spi-nor/micron-st.c | 70 ++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 187239ccd549510c6e9a6eacf4ae41158287e077..92eb14ca76c57f29ece1edb3fe652c56d1c2888f 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -127,6 +127,38 @@ static int micron_st_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 			micron_st_nor_octal_dtr_dis(nor);
 }
 
+static int micron_st_nor_four_die_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
+	params->n_dice = 4;
+
+	/*
+	 * Unfortunately the die erase opcode does not have a 4-byte opcode
+	 * correspondent for these flashes. The SFDP 4BAIT table fails to
+	 * consider the die erase too. We're forced to enter in the 4 byte
+	 * address mode in order to benefit of the die erase.
+	 */
+	return spi_nor_set_4byte_addr_mode(nor, true);
+}
+
+static int micron_st_nor_two_die_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
+	params->n_dice = 2;
+
+	/*
+	 * Unfortunately the die erase opcode does not have a 4-byte opcode
+	 * correspondent for these flashes. The SFDP 4BAIT table fails to
+	 * consider the die erase too. We're forced to enter in the 4 byte
+	 * address mode in order to benefit of the die erase.
+	 */
+	return spi_nor_set_4byte_addr_mode(nor, true);
+}
+
 static void mt35xu512aba_default_init(struct spi_nor *nor)
 {
 	nor->params->set_octal_dtr = micron_st_nor_set_octal_dtr;
@@ -193,48 +225,16 @@ static const struct spi_nor_fixups mt25qu512a_fixups = {
 	.post_bfpt = mt25qu512a_post_bfpt_fixup,
 };
 
-static int st_nor_four_die_late_init(struct spi_nor *nor)
-{
-	struct spi_nor_flash_parameter *params = nor->params;
-
-	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
-	params->n_dice = 4;
-
-	/*
-	 * Unfortunately the die erase opcode does not have a 4-byte opcode
-	 * correspondent for these flashes. The SFDP 4BAIT table fails to
-	 * consider the die erase too. We're forced to enter in the 4 byte
-	 * address mode in order to benefit of the die erase.
-	 */
-	return spi_nor_set_4byte_addr_mode(nor, true);
-}
-
-static int st_nor_two_die_late_init(struct spi_nor *nor)
-{
-	struct spi_nor_flash_parameter *params = nor->params;
-
-	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
-	params->n_dice = 2;
-
-	/*
-	 * Unfortunately the die erase opcode does not have a 4-byte opcode
-	 * correspondent for these flashes. The SFDP 4BAIT table fails to
-	 * consider the die erase too. We're forced to enter in the 4 byte
-	 * address mode in order to benefit of the die erase.
-	 */
-	return spi_nor_set_4byte_addr_mode(nor, true);
-}
-
 static const struct spi_nor_fixups n25q00_fixups = {
-	.late_init = st_nor_four_die_late_init,
+	.late_init = micron_st_nor_four_die_late_init,
 };
 
 static const struct spi_nor_fixups mt25q01_fixups = {
-	.late_init = st_nor_two_die_late_init,
+	.late_init = micron_st_nor_two_die_late_init,
 };
 
 static const struct spi_nor_fixups mt25q02_fixups = {
-	.late_init = st_nor_four_die_late_init,
+	.late_init = micron_st_nor_four_die_late_init,
 };
 
 static const struct flash_info st_nor_parts[] = {

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
