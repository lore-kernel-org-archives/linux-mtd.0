Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D3ACCFA1E
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 06:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wm0mQk15YYU3wfV70OevpiysQ6t9pB/aIHwoSM1qBn4=; b=EVmO4hwjlHbFttQbHln7Wu8hwQ
	enZ5x6eTP/XjaLI7iY6Cyx6EH5rR7BQUUvzILVLpzekbfBngJdLjaZC9yLKFWE8QtqpTFBCMDmlag
	1epNM7/JIthbboFZqUZu3dyi0VoCPH9YyXgoqsWkbsJ3lSNjQawA1wpL1ID+GywmXEF155n2iUtlX
	JEbzL6OmkNKnx0lbKmz2FfGN4G/oY3J4ZTJMuB8tCbCtgJHvHfjXLoGfHjYGRvcAzGpFea3B2+AYd
	M6t6g1vLA/L8PecgPqh9Ivql8vkI6/ZC3yyDQrNRRSDdz9793vmF1rkBn3jfPEr3yHmaLBQ3GGvZq
	jZxSyTGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4eI-00000008Dwi-28bs;
	Wed, 12 Nov 2025 06:48:10 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4eG-00000008DrU-0Y4I
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 06:48:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDZsrkno45+zZeQ7gLhkJywyxYjtC9b/7YG6P4kZixTbC0O1K2uZH6uYZKT8rkWZOZRZegHDTBZwtN6yXR3G4RaEI09S23FnGd/7goNrqq/zGdCCssiQxYm1ZVj2pTR1g90zfLRUlfFQ/AvatbV6H9OA+/Ed1DRsEXiwD+0OOEc3MezjlaaBvQWlcXX6XtuWVxzR2Si3F3dnLYwYk+Xq4TDo0H/CXY+QWcZYXgDdHjFrGSVVN0uVfUh6IOA6PfJEtl8wMd6ZfYluJfMr8sq67PcocgxP0SjVwYpOM5U0J61OPI+PjLkmhvNnW0YhBJ20S/11yvPuzt4KKgN23+NHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eX4kqjDY0jruqmVRdcCosn1GDDY+gOWBSEX2M7rpJQ=;
 b=WWcZdp+7DAzaP8dX8PYIR5ZO8TqD1KKReXZ0Ckt4UULZtnNqFT2mrUlM0s2EbbQnfWJO+cpMo8YB23XQ+/4/MV1jYTFce0bfVMoOT6dJLKUOmEa2rykDpbX/rLeu8XlwQtEHifDYW2aMMpAd5yulhT9qJDw4FjcFCGVfN57o5p55UcYnp0n6f/iUQPc7nckptfpmFAwlA+ighp8I0FuzoXODdqoSfwcUc7FCYxF2/iLN4KWDJJBWNmCq/Ty54Lfa3zDJOL3Oq2pD1YOs4iY6+MfmxRTB1qd7C3SA5i2JZfcRy/mlDUKv34lQloiiLdtWo+Y2kzlaGZKd2G0Ly2Pp/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eX4kqjDY0jruqmVRdcCosn1GDDY+gOWBSEX2M7rpJQ=;
 b=EV1BOBuukSCN98AmFZ1UJ5daz3ks3SDgmRojPy2DimEC5TBoiluaqASioybFf5xFBO0j03RB2nBYmCs+NT6DN35Ua2EtG1ObhpN5tsyj6FAZO8rfwSBQz+eUAJ93YgABvt2gLApCOMBDnKdD9puciv3niUomsC38rUJNAr+cz3HrPeu/wL5xrnzUSMC7YSjeAiQeNcTLx4h3gA4mi5ZYdfbT09KzXalBoAI/imOleDkxc7daPSwWy3k3UUpOyNe3GnzIkRhtSdQPouAvhNP8xG3lDdF/X6LC5UEihCbgCD7rO2zlDj45v5FHM+v0kQvco6j2aNYU4HVX2ObKbn0KTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by VI0PR04MB11939.eurprd04.prod.outlook.com (2603:10a6:800:307::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 06:47:54 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 06:47:54 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Wed, 12 Nov 2025 14:48:05 +0800
Subject: [PATCH v3 2/5] mtd: spi-nor: micron-st: move set_octal_dtr to
 late_init()
Message-Id: <20251112-nor-v3-2-20aaff727c7d@nxp.com>
References: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
In-Reply-To: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>, imx@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762930121; l=1595;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=2EB7Ai4+LOqBTDtJ7dyGev0P9V3FvwX1/NfQjgUawFQ=;
 b=Jjk2gv8ONuZjfhq3y96oiqT94NiE5Evjs2UeETd2Hpy9h1Mzoqvhj5EeuaGUFatklfT/jIsPi
 VktvVHxzrRgB4AooK52joHFUsg6cfq5LKgctziYv6u7nsF9Y7i1SotB
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2P153CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096::21) To
 DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|VI0PR04MB11939:EE_
X-MS-Office365-Filtering-Correlation-Id: 47724a86-46b3-4a2e-1fee-08de21b76814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2VrSUdvNHBTUkdZN3VSVGREb3I1Y1ArSWxqT1RUcWlaQ1BvVC91dnZVcGVZ?=
 =?utf-8?B?dlkweGxHYTFCeGpPZFlCcmhJQlpzVVNVakc3T1MvczNDMlV0YTl3S3BZUGIz?=
 =?utf-8?B?cklIRCtyUVBDYlNvN1VIbGhqTDBJa29aaXRCZkthMEhjOXpxTlpwaEEzanUw?=
 =?utf-8?B?b1lKZXlUY0tLbFB0SkliT1pPc0pjeWhEdUhYMzZBdHZ3YmFFeWNzN0hyN2N4?=
 =?utf-8?B?ZHNwaE9USVpaN1RaYjAwVE9GOUdDSXRKL1JrZEtKSmZ4bjlCdWIycm5zaU45?=
 =?utf-8?B?bUh1QTJ5OVpOM05GdkxKY21UdmZTblVJa0Z1anlEWC82VmRtakM2YkpGNFBU?=
 =?utf-8?B?Y3Ywc0RSZ0k0elhsb0ptVHVaMWhDZmhkUndBWm53bTNEdGtsL2hBa25PRzRR?=
 =?utf-8?B?ZGlCbFJDRS84R0JvS2lRUnVGTUFid0pkeStsZ0QvVm5rY0dTVy8wY05BL2FM?=
 =?utf-8?B?UjJIaGVBN25BR1lKemVJYUFzNU51MFE2WXFySEtDMlVETk9pVW42Tm1KZkVZ?=
 =?utf-8?B?QWlxVXJHakNiN0IzRlRHZWZKQ05ndmZGZENZZWFGVlJUTUpiSW14ZTdUSm5C?=
 =?utf-8?B?b2R2b0Jqd0MyeERwTFRvUkcvcWdOUHlIMFNBaGYxZndNNk4xUHVtZy9PQmR2?=
 =?utf-8?B?QjZKOUF1TnVwczdFK0dmZHhqRGRjTmpxaFJzcDcrOXNuZ2hVU2RWenlCNVI5?=
 =?utf-8?B?dG9IYkl5YjhPaWVsNGdNajcvNEUwSWpzVU92VmJkTFp5N0YvNkpIc2JLZkpH?=
 =?utf-8?B?K2wwSTBFbnZWQXFDL2x1WnB0cG4zZHpDTWZYQ1I0NUxBNE1qNHJUTWhKSmNS?=
 =?utf-8?B?d2dpVDR1QkJYZWdrTjhnek9VL1dtTFBGZCtYMXljaUYvRmpPVVdZN1FFcFdQ?=
 =?utf-8?B?QkVXbWhQdXBpOElQMDR6VEpwTjhINkZYb3A5V3ozNDdiMDRIM3RFUkowSS9J?=
 =?utf-8?B?NENqZm85SEd1ZzFRZVF4QWorSnJTOXkxdW55K0xHZHdqcGtUSGRVOFZoclp0?=
 =?utf-8?B?TXBTNVFWL3plSVhxRUNQaTJncWJKOFNwREx3UU15azRRdnMwaDVmVEZhOEJJ?=
 =?utf-8?B?aDIzWmo5b05ubGtQL0ZIU053OC9qUVJBZjRmMldQUzBpblZpL21oWWFYbU5S?=
 =?utf-8?B?M2pNWStwaE1Zd0xzZEU5L1hMZGdIbGdLQmVPd2h5SURNYlpBSWVETks3SFBQ?=
 =?utf-8?B?MHBDcngvSVlJWHNWdnJwdmppNlROYXdTVGZSeXVURkdmRGxKM1pDR281SzVw?=
 =?utf-8?B?V21XdW1Ndi9SbGhXdXkrL2VqOUNyVVd5MEdnWkxkTmNpZFI5MHh3ZXpqRGI1?=
 =?utf-8?B?TElJbjU4MG5rSjNGVk91R2RuMFBMaWxDcTJLSDU0cDNaNjIxL2dCQXlHY09l?=
 =?utf-8?B?V2l2WGZ3bWNXK3dLcGxOTHYxMGVGOFVjR3RKQXZWb090d1RuNWZtTzBGVHYz?=
 =?utf-8?B?K2pac0NZZVpXS2tpcHVWUkM1WmlWTWtsNCs5eFI1MjBUbzkwZW1MQWNzZG1C?=
 =?utf-8?B?em90cDJqQmlGWk9reWJiNkJkSHZHTUEzWkpFbUs2a0FmTmhIOWI5WGRsdEZV?=
 =?utf-8?B?Mit3RURZczl2UDBlc2duZVJ5ZjZJMHp2aGQ4R3E2Um5QSzh6YmZoUnVxVTdr?=
 =?utf-8?B?cDE3aGJXRzdya0MwVDBaaDhwaVY2WDNFd2hFdThNYkkwYjdjZHJERDg3UHBj?=
 =?utf-8?B?U0xDeWdUZStKZk4rZ3lyNDRwd005dzM4bG40dVhZZGxtUjhEcExYMkl4a245?=
 =?utf-8?B?MVNGUzFPbmNKS2lxcGZ6T2hZNW9IOEo5c0pGamhUZEZHVG1IRjNKVVllbHV0?=
 =?utf-8?B?THNGNktRQkVaYjJvREVCMnN0d3ZQU0J2Z2k2cm9sZmZTNjVlenFSV2NTL2Ix?=
 =?utf-8?B?YkhHbUZnRDN0SHVHVFRmVEZQcGdvdnJ5VEVQS2hMY0kyWlVmY1hpUC8wWGpx?=
 =?utf-8?B?ZW9TbUx6bnhoZlM5QTZsR0dUNmk0K3NGL25rdjRqWWk3ZlVmYVZaVnFaNE9U?=
 =?utf-8?B?bFZLdk1DY3FjUU81bkdRNFltU2k5M1F1S21KT3FvMHFueXArOUFNSndKd0pI?=
 =?utf-8?Q?cHaklX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk91akpsMEFMdTNyY1ZmRVRVWCt3WmpPZU1xYjYrQXpVL0JLcnlMTkJJWVJY?=
 =?utf-8?B?QUlPUUo1Wng0MmxEY293QXpsbExEWmdHVW9oQmtvc1VjbFRTaGlvdlNYTXRk?=
 =?utf-8?B?a0E0WkFNUzlpbGcxZGZTdE5taHlhaXFTckJBTFRkaUZaQjIyV2RELzZHeEJQ?=
 =?utf-8?B?dnYxSjZOcDdCYS9uYjgrNVFTS0pUdjNsaGRNUStSejhKdjdraTlKOWFpNHJr?=
 =?utf-8?B?UjRZbmVzRWhOa2NlampxS0o4TVdvdnhlY3VMY3FhbzF4akZON3NtMDdQZExJ?=
 =?utf-8?B?N0ZtK3BuODNVcUJGZUozYkc4WGEyVE12YWtXRUVZUC9ja3k2eEt4M1dUeTYw?=
 =?utf-8?B?TjlJNG1zWFBLeWxFck41OXE1ZHNTSU5qaUVoOUJaR2dOcVJFYW5mWjBGRjhP?=
 =?utf-8?B?N2xpZ1YzN2Y5QTZVa1hZYVYrUUczNmFTQk9XZmNXVDI5R3RRMXZMS1VteVVk?=
 =?utf-8?B?dGh3b0daOHlwYnhmMEJqc2pHaHN5TnZNU2pOQ1FIbWRHTFR0THZmMVlZTjk0?=
 =?utf-8?B?cllwdE1VNGVGVFZOVmNpOGxua1VaTmNOekRzWDZQQU9PN0s5MWVwUkZXR1gz?=
 =?utf-8?B?ZW1NR2p2a3FNTlpyWjIzOFVDYXNvK3BJK28yTngybW5wcEpmVVdjUFpselIz?=
 =?utf-8?B?aytzRjFsR0l6LzYwSU8zNzBEN0N2NXl0Y1FNYjNsVXVFMy8va0luN21yYzJF?=
 =?utf-8?B?bHA5clhqbkd0N3NFM1lPaXhuZGxTcExTMGJjVkdCOVJoYU9McjRuOGs1L2RW?=
 =?utf-8?B?bHRkeE12UU5PeGhOQmxRc1k2NjFPZnpWTVV5VDYwN29tR3ViVEkzNTZiTnE4?=
 =?utf-8?B?YjBXQjdUVWVBdUZMaG9WY3ZKNTgvM09xb2hqOGNnTXZyeTdzM0hRdmx4dGpD?=
 =?utf-8?B?VUZLbGpNZVdyYVExaUtKbmV6Yk9peERndTZVSkswRDFPNnJGczN2VU9XZ0E0?=
 =?utf-8?B?M0dLa0tXVFJuS3A2YzZOUVliOFNhY3MxMm4vN1RhNjJ6eWlKUkcxTzV2MzBW?=
 =?utf-8?B?S1plRndiemV3VWVZTTJlQ29oQ3dwUGViVzI1NVYvZ3NWM21nczJZWkRhQVZ2?=
 =?utf-8?B?bUIrclZDY2x3TWtZbCtKYjVzSGhFSHJGWWc5NHFBbHl0eStwend3SkhHaFI1?=
 =?utf-8?B?RFk4b0Y5RDZvU0ptSEsrblR6eVN0WE93L3VGbVpQQTltSTNENzcwVUdFSHl0?=
 =?utf-8?B?NmtNdFhZOVdVUWp4TFg1cENKa0JvejZQVWg4ektSWVJkSDU2bFBYQWJMbmt1?=
 =?utf-8?B?WWlQSWkxWldpdW5EVWNEdkIxdWR1d0NpYmg3eEIrVjhLKzVpWXlqM2dQRzFJ?=
 =?utf-8?B?SHRYbUpTUjMwakUwcWRwcDQyZWZ5OFpRaEx0aS9ka1ZsRkdvbHlwZysrYjF0?=
 =?utf-8?B?TDhBTktRZEIwOTBDcEQyVUFDVkdOMUEvVzBwaXU1TW1ad2lKNXh2UGJKa29n?=
 =?utf-8?B?K3dvTDQ0ZnlVMVdrcFZhdFVQbnN3N1doRlQwR1YwVjEvNTd3L3FJTWwwVW9x?=
 =?utf-8?B?Y2diQUphOUVGeTFkNU5yUjRsdG4wT0pHdFNtc0J5VVJhTGNCMXJESWVuRDdx?=
 =?utf-8?B?QVhuODRmc0FMRHdWcjYzUFVpaXpiUVpRcUh2QkRhT3FMeUlkb3hjdEp4dy9K?=
 =?utf-8?B?d080aFRKOVRiakZTTFdMMHVpeWFxSmNrRU1nSmV1Umg3a0dZOXViVVpKVnlS?=
 =?utf-8?B?Rk5iSWVLZEVnVSs2SmdKbjBiNjFsajBEQ0VtWGFNQlliYTdEUVdxVFpXSUxp?=
 =?utf-8?B?M2RRby9ub2g1azJtTmFtRXlKTHowYnJ2TjdiclN6aFN2dW9sQmViUkhTMVQ1?=
 =?utf-8?B?Y25PMFV6cDc5czZzbTh5Mzgrc0lJeEdzOWRtak03NmtWRHErbG5TMUVXeVBQ?=
 =?utf-8?B?WGJzU3VCUCtPbkNzajhwcWJJTVVhNDcrZFlyT213TDJiZlJXQUNOanltLzdq?=
 =?utf-8?B?WVRFRkJ5YzE4ZWRyQk1abWF2cG40akVobm5SY0FQbXNwOG05ZTU4RExpTUQ2?=
 =?utf-8?B?OC9TT2RkUTBaSFdka3h2RkVCWEhVS0VXdklUU29oZE1FTzBUazErTTNkditW?=
 =?utf-8?B?TnhoUmZxOFRZVERNK1FrYXRPRDNlcTU2bXMvdEVxc2hSTjd6TmdXc3ZwVlVF?=
 =?utf-8?Q?kDU+WSIdXX9DkqMOid/jQUxo3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47724a86-46b3-4a2e-1fee-08de21b76814
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 06:47:54.5214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6afc8Om0FKkdxwDlht92X7Lplcn19+Pq8rgtWIi1WEE9yprUIyAldMBdrXELJ/8k4kQ8gwLuV4W3PLypLbT42A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11939
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_224808_171896_089818A6 
X-CRM114-Status: GOOD (  12.00  )
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

Move params->set_octal_dtr from flash_info->fixups->default_init()
to spi_nor_manufacturer-> fixups-> late_init(), this can cover
all Micorn and ST chips without repeat in each chip's flash_info.

With this, we can also remove flash_info->size if chip has SFDP.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/mtd/spi-nor/micron-st.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 92eb14ca76c57f29ece1edb3fe652c56d1c2888f..81a9bead1434056cce0893c97bd35ea248c15894 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -159,11 +159,6 @@ static int micron_st_nor_two_die_late_init(struct spi_nor *nor)
 	return spi_nor_set_4byte_addr_mode(nor, true);
 }
 
-static void mt35xu512aba_default_init(struct spi_nor *nor)
-{
-	nor->params->set_octal_dtr = micron_st_nor_set_octal_dtr;
-}
-
 static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 {
 	/* Set the Fast Read settings. */
@@ -187,7 +182,6 @@ static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 }
 
 static const struct spi_nor_fixups mt35xu512aba_fixups = {
-	.default_init = mt35xu512aba_default_init,
 	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
 };
 
@@ -635,6 +629,8 @@ static int micron_st_nor_late_init(struct spi_nor *nor)
 	if (!params->set_4byte_addr_mode)
 		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;
 
+	params->set_octal_dtr = micron_st_nor_set_octal_dtr;
+
 	return 0;
 }
 

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
