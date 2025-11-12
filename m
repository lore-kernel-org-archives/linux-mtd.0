Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF54CCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jQYGtWkBOju5x+vLpZ5l1dqJKhzUdrPUdANgi2kM3K0=; b=Bi0sq/+dHGVKBYfKX3FQ7/SpSr
	xvLnQiwYK4YP8j91PgQSRibxtanORT3fgpucXzgRHW/WFH3ld+RRXXJeyweB7TlBnUrA+YHKiEFrm
	Po1k3c3fLY7LEQqPEFxMIXfVDUr5oHfufmZPe3OzeGQFLWwKszV+coCjxJIU+s44N6zfSn+QPAn64
	1bXi7uQ/otVxJyQLodgf9vFdmrdiAZc1XPeGH5ZEaMRqrEJ/mG5CIdUuVdyuRM5wZ1pSAtJKHHXJN
	5wnzR3pWIT3Eqmq1hlvcW/TrZCnpBhSLzAEyab50WU2ZKfsP+3Lau9BR8vpVnkGpSmwxq1dvI8UtL
	6SMVJqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8f7-00000008dMq-2Y29;
	Wed, 12 Nov 2025 11:05:17 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8f5-00000008dKA-13nm
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 11:05:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPSxNzOYjYdgszUvddTDTU6VC7fQK80rPllhqyuHNdHl95j+8fJfC7AXa0/3lgXLT2069ylskSWkX+USB+rAbUB+yElJy7AElXrdBEUwxblSo6eS32sRDLPX1N+pzSIXDmv1MyLpOwjtg9iNGGrzpyJn6tShyBLwN8X0ERZAqyUO0M9P16I6JEyql2zS/xwRzn33RzPETbFFJzFI7dEZrLRBMo1M0R2Q/jaPJ1PlWs/ZMxeoMZdN98haC7/+BZ+dMBCIT3JEpdpGBqBxSE7doSTLobFMHL7Efs4PsKAx232BsR+nXJyG/JZNHf74BLcyZ5sBX6itq6uVdiaLVmMJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7w8Q5bE3cE3zMBTDLMPoqpoSkD5XOY8cPoh7vt6omU=;
 b=OqJ/IvVekxgpPoXlONw0aNhH5yi+28qZ2AjjlH3NyuMz2OG3MHOR6VNkkwhyB7LmYrzvGAgflU2S7ROLcVs1vXmDlljA70gTtanXq7aUnjJFTrskXqadGxbtHQC/mncGDDr87EaRWdOtaPhrBlFNGZKGRSSBicv1q8bW7fW0bUPzmMMv8jtUu2jCjj51gdZyCOmLEE80HS5zLm2QnfX45n8zVHdnIFHn9BAxF5NWMpQDduhnuxgSncVrfce+R9iNaU+rsZsRTRZy+4QQBajKxtPAjJmYOYNV0qmclYP7YvEZvTVqndTzP/4xiTRECz4U1KFCnVyiGWew5Z5i/F2E0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7w8Q5bE3cE3zMBTDLMPoqpoSkD5XOY8cPoh7vt6omU=;
 b=npZs/cUEhP1q8VoLTN+hz5EGyXWjhyM7lPrJ2ZZH57SLzUOlMuWVLBp+r17tGjK4lE4TKMCw7I2rYc/jI9VXOByNYqCBN4wwQEnWOTM4PFD05yBTVBxHU6IDpg5b+29gCdLbBjhFMC2PMfcCxz6hlWdDwQUSUd4N+mzB/wLpnMxJ9nbzsUJymzucQ14I/qZOAISjIj7rCnVuafdcj8EbRxTVFNeY8aITxT4JeE/IPeG8atR44i6ZHW9ulN1XFp4Eh9JCWSeMzc7hUB8D+cpFBMvTogf/3n/uTgklyEAqOfcXoK0DXVJAydCl5Nng/Gb/KhlZtAEDfijQbHjg/fdA9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 11:05:11 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 11:05:10 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Wed, 12 Nov 2025 19:05:11 +0800
Subject: [PATCH v4 3/5] mtd: spi-nor: micron-st: use SFDP of mt35xu512aba
Message-Id: <20251112-nor-v4-3-e4637be82a0a@nxp.com>
References: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
In-Reply-To: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>, imx@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762945552; l=6895;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=0iACaAqcREU23OpWEXvL6Fl/wMEeQx/37dCz+D/spcQ=;
 b=85CdYCr6ptkxb3A0BmwzoOz9H0zJXX1n2PfnTpKZjT8H0F4jAvussO2zdUSxr0UHjH/LePnQ8
 k1dOE6oivH/B2ZwTGILOvucqkiPx/RkeEtHVwPMPKYGCqgAsFWUqBlV
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:3:18::26) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS4PR04MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d28af57-695d-4110-ac32-08de21db58a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1VwYUw3NkM1VUkycDdsK01mRjFCc05RbFlXMGZvUnZUa1h1S09YMElvZ1px?=
 =?utf-8?B?WXFob3FqMzQ2ZmpTVlBjRVJaK2taVTA4RmZPUVBKYzJ3Sll0a0ZNWHlsT1FW?=
 =?utf-8?B?eGV4d1plblhmOHkvd3JaZ3k3RDNEM0loSEJublRLaWtTL1hERU56Q0dLeGNH?=
 =?utf-8?B?cnYvVHJqa0RpTE5FZ0hYZytMNEVlZ0ZiQUhlV3R6eE9FRkN1cVpueFVQeHZu?=
 =?utf-8?B?ekpyRm56WUo5NE5MMXB5MzVaZGJKTTh3LzJHbm1oTXhCN0JiUHI3QXJRSHlM?=
 =?utf-8?B?RHliMnEvKyt4NEhYTjhIOGN3UVZ1QTRMQk03SWUwVmlCOERacnVNNGFVZGVi?=
 =?utf-8?B?SVhUaWszWjlNWVRHUVRlY0R1VEt4OXg5MGF1cGp5ZnZldnVsRWZjUFRRZmdl?=
 =?utf-8?B?b0ZxUWFxMlZOZVIveUMrYlQ2TVFEMXA3T1pzWGF5UjlSckg4cENYcE11ZlpL?=
 =?utf-8?B?WG55TTFna2FtWTlyLzcyTk4wcnpIS2N2dDRYcm5VbnFwYisrZlNuallzZFVJ?=
 =?utf-8?B?cGhmWjFOZXRsWDJSNTJEWjdwTm4yOCtORTExWmhIN2VwTzRycVFxamk3YTV3?=
 =?utf-8?B?SjBZZ3FXR1RldnlhN092WTRCVjNpRHM4ZE1RMCswMThnREpmZGJnWVcrZVQ0?=
 =?utf-8?B?SE9sY01sSVpwdDNUWFZrcjVkUkw0Nk1QWnpXbWpvMWdrZit6TzhVbXpMY2I2?=
 =?utf-8?B?YU1TR1pBVTg0Qm9neWQvcXdBWjlNTUVYSEY4MDE5M1JwMnY4Y2xRd0xjQ0JR?=
 =?utf-8?B?TW0rRkxIQ1dQVVdLYUxtVUlZeFJpVEg0bHhYQjRpY3ZIZ2R6aHJBS3g3T3ZR?=
 =?utf-8?B?S016Q3d6ZDV4bS9KbWNBYW84VHJ0bFkrd25FTVA4cHpOVUdHZG1tWXd5eHNx?=
 =?utf-8?B?MDI5cjVDbTJaS0FtbThrZ2UwcFZtYzhTRDhLQTlhbXJZbWVpc01qNmg3U1J1?=
 =?utf-8?B?NjZQTzNXTUNRTGNUeVFkdTdIaFpMdFdZdnVScE9FSVlFTWtJNkRvWGdQSkhY?=
 =?utf-8?B?cld5UUZkK3p5NHlMQStTbGYyTlJoeVVYY1REbTQ4eDVTVllLL0NhbzdhcUsr?=
 =?utf-8?B?UzhiTXgydk9iV1hPOWVFZlowOXNlcXhMWUxYRzNFZm1Za3M3ckxPNzVqT2l3?=
 =?utf-8?B?UklrcDV1ak15UlNxVk1sR1ZhWkduQjFJajZaQUl3eGJCYndyc2pmUWZBWS9M?=
 =?utf-8?B?OEtuTXJ4OGRIN0JSRzR2YzVCQ1hPV1NTaGxsbm1oampzVWtXTnNZSmtUMnk5?=
 =?utf-8?B?UnBDbytzYkJrSmNwd0NvY24zWVc2U3hodHZ1MzB4dE5tQlR6TWI4WStNSlMr?=
 =?utf-8?B?aXNoU1I3S1ZCLzNwQms0bnF4ZGl4Z0pDaW9VZ0h6ai9DcS9Xbkd5dHJicFpa?=
 =?utf-8?B?aXBxTktoZk1QTFlUWlRKSUNhZlZyWFBxdXNRanV6ZDNZeG52OEtjR2FhVUE4?=
 =?utf-8?B?bEowT2hiajhzWGo1bmkwSmk5bzZFVUJhNzZEaFQxekpYN09yNmg0c2JYbGRU?=
 =?utf-8?B?dDIwVDNNa0JudDRDS1VQd0o1TDNXQkU3UkovZVo0Q1QwK1NGcnJDVzVQMjRE?=
 =?utf-8?B?ZXpzMFdXWjdqZkdmdDNqQzl1RndxdmthckxxZUVld0lvcjlISDBQR01YNTJv?=
 =?utf-8?B?eVRwcTg5VGRQTjNDa21zZHIyQldzdFJtckdUS1dWdTZwOXZibGR2OWdmNDdl?=
 =?utf-8?B?c0kvLzNxcDFIL1NpeVZUYVdZdWZWaFhsUTNxN0dHK0pGalhPMW9IUE1QREZx?=
 =?utf-8?B?RXZLdEtER0dMVXhrU3A2RHFoNFphUnJrWGFzelJZTlJucldjemNwdndWWlYr?=
 =?utf-8?B?OW9CR0FDemR2Wnl5ZmhpcTJNaUNIQ1pYT2laMUtmMUZYUEltbGY2eXBuMGw3?=
 =?utf-8?B?dHNMd0Y1bGc4Lzg3YkxmcXExMkF4WElkNUZZK3ZycnYwYjRyaTBNa2Jsaks1?=
 =?utf-8?B?cTc5S1JNMG5pWWRQaXZ1bDN6V09QNzNCNit2QkhuV0lZQkFiT1hNVGFnbFk4?=
 =?utf-8?B?TUR6NFAwcEJJRlVwektLS2RKMjNYelhxVlBvdEJETEZYVmROaHhEVmY3MTlz?=
 =?utf-8?Q?T2dnb9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3Y2WWlLVDFVWnJsTnBvYzNtRUV3L2lpWEtaNFpTMW0zS21Fck9GbkNwaEM4?=
 =?utf-8?B?MGhodElYR0ZOZ3ZlNXFTRTJJeVJpaG5kdGI2TGpyaUpYNkw3UkswbWtqbXRH?=
 =?utf-8?B?VzRua1dFbVVzU3NMcXhZVG5pMll0cEUxZ1ZSc1ZwM2MvMHJ5TVN5aGlRMVlp?=
 =?utf-8?B?WS8xREFHSkt0UEJlZjgxalB4dHQ5K0NjZVBpV08rdC85NHVDekVSRm1WcWV5?=
 =?utf-8?B?UHlpcjAzK1lNMkJ4RFRsVlNlMzBUM1VFY0UzNjhYUUtTTGMwYXhkbXoxQUNH?=
 =?utf-8?B?eGhveGlIbzd3QUNDSEpDQ0tjUldMQjZvK3Y4bXY4dUFlejQzSGc0Qlh4Vi9D?=
 =?utf-8?B?czQvNi9LQUwxekpJWGFxUWlXdGFPWGpMKzdrZytxdUs0aDd5OVFCVWN1d08x?=
 =?utf-8?B?OUw2ZlhKQ2NVMkhBQzhTMHJ5VmhzVldOYlhoOVVWL0FYbTZCazdINzhtTDlN?=
 =?utf-8?B?TTB6Y01GMlJmQmtIRS9qcGIwS3pLVlF0aVRtVTNYeGdaNWl0OVpybVFDcTFu?=
 =?utf-8?B?YkFBZXJ0YUNPNGZtK2tseGd5NzBBci9ma2N0S04xc0xOTHFWUFZVVXhjTFRI?=
 =?utf-8?B?bmtROEJKd0ZYcHhFcnczU3duWDhXdnMrV3o5K0FNZHFBZGErc09BNE9KQmZn?=
 =?utf-8?B?TVExZGoyMmRhRDU2TUFrek16ck00K1U0RUUwTDkwWmRtSE9PTEFJeWJCRjRj?=
 =?utf-8?B?di9wVWppeEpCVFBOcXQvUHdtNnNjTWFjek1lSEY4VmdTd1FVcUJmQTd2a2V4?=
 =?utf-8?B?UGJpYk1BMGZYS0xiTWpZd1pyTk9mUHdtOERKYXJtQVdLaXk1c1NRTk82Q0hZ?=
 =?utf-8?B?VmwxMFpsMDVBTFNHR0t3ZjdwaFczMTN5ODNGV0M4UU1LRG9Sa0dSazlGMjc1?=
 =?utf-8?B?Sng2V0ZST3hnUUpWdktlVEF5OWxxNStjTDg4S0dYVUhXMGFUOWNjanNPQi9F?=
 =?utf-8?B?VWNuT1UyVWJlclpxVUVxUXk1ZnRNQ1JZTDRCQ3dyTTFuTVpsME95blBBMlIr?=
 =?utf-8?B?QWtWckczWTF3SVJDb2FNNHREbXdRNDViV2RVeS9uSzhuaUVHbVpXRlFsTmtM?=
 =?utf-8?B?ZGk3SzlneHE1YlB4bUxGdm14cmZwTWFhaHpBclkzN1RxK09ibHNyalN1aWs1?=
 =?utf-8?B?dWZ5T3FCYnREVEdVWlkvcjBqUzZxbFUrUzQrR2pTc1Z1aEZ2aXRBbCtJWWpr?=
 =?utf-8?B?OXY3NVA1VlVqNHlPOW9pMHQ2ZjNQUTJmVk5YcWpXY2g2bkhyalBBUmNScDNF?=
 =?utf-8?B?NHpmMmZvQTVkM0w2cGo0c2J2M0dMd0xEMHpLU3F1OHZ0bDFMVHNsWGY1dVZO?=
 =?utf-8?B?c0VLNTkzTXNrbkhONHlTTitwNlhMa20xbDEzWVF6Q3doamUxelhXTm9TMjdu?=
 =?utf-8?B?elE5VjRQUUo4R1dkcDBHYXUvYnhRV2lzemhaVk8rRHRYSUkrcXZjZWJMSkxV?=
 =?utf-8?B?SGJEd1R3RkxtRG03NUxuQ1V4QTQyeDNmSTZDVkw0UzhpTngvUHQ2L0xoc0dX?=
 =?utf-8?B?bG5aWmZlbzhuc3Rwci90eDdhZTYvSktGd09KV3pTSjJETWpyb3UrcXJVWHZx?=
 =?utf-8?B?RjZmdXhMKzE5L3pHcnZhL0tDWGhJRnZmN2FJSXZyQlIzbVowN09HNFhvcm9J?=
 =?utf-8?B?eSt1U1VxTThRSjJEN2JNQUV3MnVsMFRZVTJMRm45dVBWcHFXT1Y4M2hxeTNV?=
 =?utf-8?B?NDdzR1laNFZ0SkEwQlFNOVNJMTM5UmpTU0FoYUxTdGtYVlJLMFVUTy9QQWpx?=
 =?utf-8?B?K0xNWnpmVEpxV3paT0pUMFo2aEdPRW56TkM4TEhHdllBZGUwYzQ3S1BKVVVT?=
 =?utf-8?B?N2lQUjFuRUloNVRsdXZieVNncURQOE8randtUG1VaGVoN3Q1bmhrQ3lucm90?=
 =?utf-8?B?MWlRU1VIdjJkWVh0TFg1czQzcFZvOHl1SmU5OXgrcDBqYXArcmh6M2xIRnlE?=
 =?utf-8?B?SUhBRmk3TG9TYytmSThBb2lXR0xqTUJuaFZ5d3hPcDJmb2Z4MG40cm5zRUd0?=
 =?utf-8?B?N2xPcDUzMVBHNEFxd3d2RnI2dkR2c0IxMEFqOUsrNXhIMWRjVEFYQW1CMUlu?=
 =?utf-8?B?VHRNRFo0Y2F4Ym0vdk1ld3A0a3ZJdmdkZU5PQ0MrNU9Xa3JNV1pHbGhZVWE3?=
 =?utf-8?Q?r2OFGppXpF/uk9lJjtGpLke7E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d28af57-695d-4110-ac32-08de21db58a0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 11:05:10.3509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AtJSjXgx64ryYG9U7ERcDNIecjzV6I9fG9sTu11ejacINc0C78Pe9XVe0G+j8j4UdpZDX1rZctA5a3sXHXoBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_030515_476046_06F754BF 
X-CRM114-Status: UNSURE (   9.68  )
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

mt35xu512aba has SFDP, already contain the necessary
information, so remove size and some flags here.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

---
1) This mt35xu512aba is populated on the imx943-evk board, was
   tested at 200MHz using nxp,imx94-xspi SPI controller.
2) root@imx943evk:~# cat /sys/bus/spi/devices/spi8.0/spi-nor/jedec_id
   2c5b1a
   root@imx943evk:~# cat /sys/bus/spi/devices/spi8.0/spi-nor/manufacturer
   micron
   root@imx943evk:~# hexdump -Cv /sys/bus/spi/devices/spi8.0/spi-nor/sfdp
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
   root@imx943evk:~# sha256sum /sys/bus/spi/devices/spi8.0/spi-nor/sfdp
   809cbdfc57ae56771e017ff7bfdae7122afcbcbb238f2502420cfe3b2fe20d11  /sys/bus/spi/devices/spi8.0/spi-nor/sfdp
3) root@imx943evk:~# cat /sys/kernel/debug/spi-nor/spi8.0/capabilities
   Supported read modes by the flash
    1S-1S-1S
     opcode        0x13
     mode cycles   0
     dummy cycles  0
    1S-1S-8S
     opcode        0x7c
     mode cycles   1
     dummy cycles  7
    1S-8S-8S
     opcode        0xcc
     mode cycles   1
     dummy cycles  15
    8D-8D-8D
     opcode        0xfd
     mode cycles   0
     dummy cycles  20

   Supported page program modes by the flash
    1S-1S-1S
     opcode        0x12
     8D-8D-8D
     opcode        0x12

   root@imx943evk:~# cat /sys/kernel/debug/spi-nor/spi8.0/params
   name            (null)
   id              2c 5b 1a 10 41 00
   size            64.0 MiB
   write size      1
   page size       256
   address nbytes  4
   flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | IO_MODE_EN_VOLATILE | SOFT_RESET

   opcodes
    read           0xfd
      dummy cycles  20
    erase          0xdc
    program        0x12
    8D extension   repeat

   protocols
    read           8D-8D-8D
    write          8D-8D-8D
    register       8D-8D-8D

   erase commands
    21 (4.00 KiB) [1]
    5c (32.0 KiB) [2]
    dc (128 KiB) [3]
    c7 (64.0 MiB)

   sector map
    region (in hex)   | erase mask | overlaid
    ------------------+------------+----------
    00000000-03ffffff |     [   3] | no
4) root@imx943evk:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
   2+0 records in
   2+0 records out
   2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0213893 s, 98.0 MB/s
   root@imx943evk:~# mtd_debug erase /dev/mtd0 0 2097152
   Erased 2097152 bytes from address 0x00000000 in flash
   root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
   Copied 2097152 bytes from address 0x00000000 in flash to spi_read
   root@imx943evk:~# hexdump spi_read
   0000000 ffff ffff ffff ffff ffff ffff ffff ffff
   *
   0200000
   root@imx943evk:~# sha256sum spi_read
   4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
   root@imx943evk:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
   Copied 2097152 bytes from spi_test to address 0x00000000 in flash
   root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
   Copied 2097152 bytes from address 0x00000000 in flash to spi_read
   root@imx943evk:~# sha256sum spi*
   f7d59270621c04aac29df9fc1742d0a0882047c618833ecf1577a57d109060ab  spi_read
   f7d59270621c04aac29df9fc1742d0a0882047c618833ecf1577a57d109060ab  spi_test
   root@imx943evk:~# mtd_debug erase /dev/mtd0 0 2097152
   Erased 2097152 bytes from address 0x00000000 in flash
   root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
   Copied 2097152 bytes from address 0x00000000 in flash to spi_read
   root@imx943evk:~# sha256sum spi*
   4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
   f7d59270621c04aac29df9fc1742d0a0882047c618833ecf1577a57d109060ab  spi_test
   root@imx943evk:~# hexdump spi_read
   0000000 ffff ffff ffff ffff ffff ffff ffff ffff
   *
   0200000
   root@imx943evk:~# mtd_debug info /dev/mtd0
   mtd.type = MTD_NORFLASH
   mtd.flags = MTD_CAP_NORFLASH
   mtd.size = 67108864 (64M)
   mtd.erasesize = 131072 (128K)
   mtd.writesize = 1
   mtd.oobsize = 0
   regions = 0
   root@imx943evk:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
   Copied 2097152 bytes from spi_test to address 0x00000000 in flash
   root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
   Copied 2097152 bytes from address 0x00000000 in flash to spi_read
   root@imx943evk:~# hexdump spi_read -n 20
   0000000 f3af 8ec6 388f 56a7 4b69 0859 7bde 910b
   0000010 ea09 0762
   0000014
   root@imx943evk:~# flash_erase /dev/mtd0 0 0
   Erasing 65536 Kibyte @ 0 -- 100 % complete
   root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
   Copied 2097152 bytes from address 0x00000000 in flash to spi_read
   root@imx943evk:~# hexdump spi_read
   0000000 ffff ffff ffff ffff ffff ffff ffff ffff
   *
   0200000
---
 drivers/mtd/spi-nor/micron-st.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 81a9bead1434056cce0893c97bd35ea248c15894..9a8f82045e4d89f94d005086eb012cc0b3f11cfd 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -187,14 +187,10 @@ static const struct spi_nor_fixups mt35xu512aba_fixups = {
 
 static const struct flash_info micron_nor_parts[] = {
 	{
+		/* MT35XU512ABA */
 		.id = SNOR_ID(0x2c, 0x5b, 0x1a),
-		.name = "mt35xu512aba",
-		.sector_size = SZ_128K,
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
-				 SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
 		.mfr_flags = USE_FSR,
-		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
 		.fixups = &mt35xu512aba_fixups,
 	}, {
 		.id = SNOR_ID(0x2c, 0x5b, 0x1c),

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
