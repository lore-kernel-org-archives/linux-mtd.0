Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B041ECD6F2
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 21:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Xopn8UqZDo5HQFEL3tC0XXeaUZFuq3x0zIyGjEhar3I=; b=3IudrwmDbtbP5cDhacnHzHdiMt
	m7DSjDbMOKjjVJrIjvrUU+TZeYn2vCyqRGV2ilm6EwnyiNSzjYGd2bvksxGsHe0aNXM+qoxYMyKQK
	4wECCxb82yF06DYiY3JcWJHSnp8/IdgFSFiz1swjiLJ+/I2GoG+IH/2NZzjfX7nBr4kr9R3eHJ+2r
	xtmflWxmLgdNh7Szog+wUrxS7lQGR+oLXGki5HJMeTBbU4GAqNLve31DOSN7ZlC5FwpSCZnM/y/X3
	z/62qbM7tdA1d/WtqWZRGTiGEeDZM2IBgRw2fnGA1VOh2yueXQ8s4ktPZzLTtwUXVbEkO5yW6+FIh
	je+pmXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHd5-000000014Qt-2Wlg;
	Wed, 11 Feb 2026 21:20:11 +0000
Received: from mail-westeuropeazon11011020.outbound.protection.outlook.com ([52.101.70.20] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHd2-000000014LP-2UQq;
	Wed, 11 Feb 2026 21:20:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5kbCocSIWjRENym/2Sk704KsUvsE1+fh1FRwDM9CQnLhkQbSAVKSXuJJSmn2pgGDONBDlZoo4QKNdb4IxDit0F4IorqhQogdApPMtdg6s4TFNocM6NOMif3oU6jSA8PrzyP5f9nJX6XyGNyoW8XO0rTHOGBk9+68He3MdjuupavQ9KXRQWyEB+uqXZtcfn6wR58QXkUEXbXKes0qcI3HLajt84/2E4iWIY4ZP72OdYtpix1Kdi/9Krf9jDWaqm1hcunNrZ2m9LYO4AT4f3T8qohInZof9lYmH8Rz8iseELDcgoUZultoqe4vu5uHI9LrJtR7AVpnsFd0Gvv/om9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgIOKeeRnrex68JvOkoq750WfaQW5NP7dKQ0ECXK4q0=;
 b=QSpMF+3+YnSvq5acreQ1q6EA8AX6FkJ1Qns52KXQhXoj181ss/F95vSirSnKDebct63k2Ot8s3lVJZenMltJhpYKnXVTuEdtTZKaRbtNcCaT6SsWv8mmtt3qIJrrl4xkmhY1KtEB2AN9k1dqy3PN2241GwtcPl2JzPYSGDJiJs+N/3BqeogHRQZqTiKidKXQLOrAPMphYISnuNM2G4rTumi9PIW6ICFLxU/KkscqJrzcsG5eC/vnCkB6iBL08THykIT817CSjwxzYrAgQikjCF0NgtNptb/eVKOlALHPUtAmMs2OmWuS7jGet0OX6zQ89GCfdZvwxvaChh9D8Q9a+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgIOKeeRnrex68JvOkoq750WfaQW5NP7dKQ0ECXK4q0=;
 b=A9i4C5FdlIYCI+TvoEBWFn0dgQvR9C3HqlqcrNSy8SIeK2x0Shra6UeDd9fZKtGC/zZVS9rdKxxJq8HVJIt/70AvjJzPx74xfFWpRjCnkD1n+XIJunh0UilZyGiiWuRaBv0Sck02VBH4T2pM6MsmDUhANXqetRmMgO76IR16DbApN+E7WoRCR63lwnXkTRreNMmdb4dE5+sYsGgq3Fe/BAQZVbIQLKctRbTbyQMleJk8asWQ7hbwLfjfdcpXfSUQnjRDlzWWGlb/qSwkEdsT9lnf/GlQMO0WyQ4VXyghCh+JUKCI1jaF7zMCp6i1QnhrmBqnpJTNaExFEFwU35GZyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10154.eurprd04.prod.outlook.com (2603:10a6:150:1ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Wed, 11 Feb
 2026 21:20:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 21:20:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Feb 2026 16:19:41 -0500
Subject: [PATCH 3/3] ARM: dts: imx: move NAND properties under nand@0 node
Message-Id: <20260211-imx25_nand_dtb_warnings-v1-3-2f06aaa1e3b9@nxp.com>
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770844791; l=7421;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=HLpfWEidVWNsJL6AWYNVrrjkGfTQ+GVwYBT+LSc/oE0=;
 b=o82MDND6q+FIMfA5fJSpkHxgB8J1erTwDEUumH5uqHDj4FdmYudMp4+QwMc6sPtT4cQc5YNX7
 wi5Duiyp7T9CzULil7Hs3OvHKa3edJDVEl3XlcU9nOYqC/qvjN8v9+J
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10154:EE_
X-MS-Office365-Filtering-Correlation-Id: 13996487-0104-49ce-b683-08de69b35324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWk5RlRvaS9zUnFmNzk3MDlLWWFFcEc1eWd4TGFPUWdwS21DbnRuR3JhdTUr?=
 =?utf-8?B?SWc0UWM4NnY3MHl2cjIycUNqK0ZyelVNWHlsWS8vRVlTbm1RQ0poSXpkT29r?=
 =?utf-8?B?WHd0Y0I4RGVLcXdhR1VJRWZXZFZvTXdiend6NU1neUMzcUxkditMOStIMHd1?=
 =?utf-8?B?NUF4SDFPeEkxdnFWdkZTaC9iMkJZeHBDdXJvYVdUaU4ySmNrTjBaUTdTUlFl?=
 =?utf-8?B?Mm9tdm1aRHdESjAwUzBVb2ZPeGRiaG9zN2J1bXFrSURIMnlJTlN2eHU0OW9i?=
 =?utf-8?B?cHVmU25NUjB6WUZ0bDBsWVZnM0gyRk0zYi9CSVRXb0o3RXZQbkJuNkkweTdY?=
 =?utf-8?B?Mnpodjk5blBHSWxST0F1STBMUFpJVHF4Rzc1cE9laXBXVTh5dDRadFhOdGNU?=
 =?utf-8?B?bWh2YUJ1dzRRSFVxUk5vWWE5dHJSemJNZkowSTlhZUl6dC83aWhqcnVPSFdn?=
 =?utf-8?B?MnZkQTRGN25qQlpHT2VGNTNSSTVuak9ZUmwwdGc4Zy9vVDdySUdKSXozWmlF?=
 =?utf-8?B?dCtuWDNaMjY0bWYrYkZLZDd6cTNrREVyaFNWdEtFVDBUMGoxcHo4a2dPQkpU?=
 =?utf-8?B?alpwcUFRWmtUTkl6VXR2cTUwaE1wYWdJVUtQMFVxODVnaG5zc2NMSlVGYnk3?=
 =?utf-8?B?bGhGWTkrbTdzZmRhY202VXJWMStkaXhyTk1HcnNKMElQL2lGd0F2bi8zWnZ1?=
 =?utf-8?B?dWJOOXJJb2hzTG5nbG1jMEw2c1ZqTVdlY01BQldhQklmYjRhYlg5b2VhaHRw?=
 =?utf-8?B?UC8xK3FSbGF3cys1K2NTTWZOMmcvVmdxdENnM1ZyL2ZQd1hDUW5KeVQ3b2JM?=
 =?utf-8?B?NGtUeHkwZjEzNS9Ua2poeDZoWU8zbVVaWStJaUVkMmxrdFBGREpqbWw0bVBL?=
 =?utf-8?B?b2d6UnFBVmR1TmM4MmlBZDJMM2hBdHh5bU9LeVpQNjhFNGMxRzNMKzlZM0Jw?=
 =?utf-8?B?ZG1EQ29ueUVwem5CY1hxbzhNZm51SG1aN0lUUWxNbllGTml3alNDRXdNTzNQ?=
 =?utf-8?B?Ly9KZnp1UFN5Nlg3dzZXTWx3TmdYbWlkUElCUzd0ZHJTV25seGtxY2RaVGNS?=
 =?utf-8?B?SnJBTWh2Q21BdVEzT0hob211SVJNblRXcFQvenlmWGZvMUNpMEUwR3U4OWxQ?=
 =?utf-8?B?UnBkSTZJTWxoR2k0WU40TU55L1g5RWpOYkRHbkRheWxybmdJbjd3Qmx5cUFI?=
 =?utf-8?B?QmtOWmhlSXFHZkN5ek1Nczc2TzZYSmRCSURkRkxBbGgwaWZySitoM3ptVFNM?=
 =?utf-8?B?M21BUVpWWi9XYjBTRXZlaXF2ZUV1UDhBRzdMMThWRCtGeU9CYStXOWM3TERz?=
 =?utf-8?B?djZ0Z3B6amFmYW1YZTl6WldaTWU5VzZFUXJPQ0tLL2RzRVE1MlN4cVdHdTdi?=
 =?utf-8?B?RmNnaXMyeDY3cDNRV3p6MHJHaEx4eExiOVhNdXUydXJsVmV6ZmNWN0RKaWpx?=
 =?utf-8?B?cGVHNmtRbm5VRmpiVUJMYUVFVzdseEQ4dW5rb0hrZmRLanc1eGZtcGFndUN0?=
 =?utf-8?B?dzMwTllxK2NyWE5GejYyYjN1TFMxUkFMMjlPYVlzYUtQdTBPMWxWRDdwdVQw?=
 =?utf-8?B?QW1SbHovRE0weFk3bkpvT2Y5UnA0enRMYXVpdG9oY2QzbjN4ZVg2L2NlTkdL?=
 =?utf-8?B?NDBKL2VHTzJDZmJMclFHb01zTDRvL3l5UnRFZG5mak03UkF1a1M1MVVXV2Fo?=
 =?utf-8?B?VXJ5OEVQOU0vVGJFZWFwV3FnNGVHTWJkZU9ybGVrV1FwYmk1RGZ1azRYa3Qv?=
 =?utf-8?B?ZlUzc3Z6bGtMNFV2L0toN0VETnNDQ01MaEZFbDFMcUVpL29xa3Z3WkErM29Q?=
 =?utf-8?B?SWpPR0xUaVlUVW54MEJqbG9iVldNYWFzS0pxTWw5K0JkVWZKUzF2L1BPODlj?=
 =?utf-8?B?Z3Z3Uzl2Q2ZsYUpQejkvMU9tcVBvaTlTRUZ0ZHg4bzR0TGQ0NFpHMHdrSzgy?=
 =?utf-8?B?K0JTYmxRTVlUQ3FjYjdSUXVQenRyejJCbWV1WE5ac01aZlFMQmkxVjZtZFdV?=
 =?utf-8?B?ekx0RkFnK2I1WCs0V0Vub2tnL1lOZG1nYjZnbTV0ZEs4TmZLOVNuWlhBNzB4?=
 =?utf-8?B?VnJ6YUFZZURpbmVGNm9qOXRsWHVVN2xIc2RxUnNvbThieGZ6ZEI1blRZRncx?=
 =?utf-8?Q?pdNXBBv2seJPoLtNZ2l/k8hke?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlYwaXhxS1BBRlp2eU05KzZwNXlUeGlnZUpoaVJMOCtiVzhYZnZFeENCWmFB?=
 =?utf-8?B?Y0dZUHErMEVwbmdkRUw2bUZueTEvUllpRUJKTFBydXB1MTJnZjF1OWNvVzJT?=
 =?utf-8?B?aVRYNlRHekNqclBSRnZDeHQ4UHkzR2tSVkRoNGhYWWR1aHMvV3A4OFJaTXB5?=
 =?utf-8?B?aUlqbDJtUmJmNjJmZ1JiYktzd0N0WlFlQWNDRXBiUENQRzY0RFl4MmJCOVZr?=
 =?utf-8?B?ZlVVbkN5RkMwdTVJVllsK3FrclpxQTNybXpyV1lxRGVCVlpjSTMrR09sNkQz?=
 =?utf-8?B?VnAzdGJUc3R0YlV2Sm1iaithQldpY29rS05pVGJFYXFrU0lZWGtQVU8vZ3Ny?=
 =?utf-8?B?TXBEV2w3YXFhVG54c04rTjk1Slk0WTA4ejdwOU5vOE9jeWphSDMwSy82bysz?=
 =?utf-8?B?dUppTm5DTkhmbkJwc3cwMG5YZ0lsVlQySFBYL0FJTU5JMExwOW5MUlRvVFl3?=
 =?utf-8?B?aUh4K0FRaThVTS9UR3VLRkg3L1FQV3JrMFA1YlBhbENuRTRIekliR2NFZHVp?=
 =?utf-8?B?S3JvOGRxUzJZMmM4THV6QWc3dlJFTENqbkxEU0FNWlFUY3NqV2hXQVhoOVlF?=
 =?utf-8?B?VjN2SjBtcEVFL2EzYmFhSXZIUDFoY3VnN24yejM2TGdubG9pd2RzTTZxRHBo?=
 =?utf-8?B?SUF6YXVtQ3pPSlpKL1hUOGMxbzdvYkE2ZnZNb3l5UHByaTV3aHg4OFZBTW9W?=
 =?utf-8?B?QUdONWR2N1hZbHpOWFlEZThBNEpPSmxDcmh6TzRNY0gzdGdmdnNyNzhUc2pr?=
 =?utf-8?B?VWNra2h3QndZMUFVNXJ1RGtBYU4yZWF4cmlMSWdwQ1ZLUFBCRmVQa1ZKczZO?=
 =?utf-8?B?OERETXIrRk4zSkFGK25rU1BxV0pzNXdGOVlvZlBjM1FEYldOTUtJYmdlZEps?=
 =?utf-8?B?R0hBSWRnV0s4Q1JUSDVrMDBSMnA4QWQzYWVFN0VnMWwyZFk5cVZmWVNKd3cw?=
 =?utf-8?B?TXlkRUVMSkFBbFdxemQ2K1p4UDYzNnRjUXIzRzVSY3VOb0thMjJoeWFYSFpx?=
 =?utf-8?B?UHhLK1BvM1M4MDVwQmdGa3dUN1BrYTVWNFVweUNUV2Vzd05XOG1vekEzM2J5?=
 =?utf-8?B?ZzZqNS83NDVjR0I0WjRpdUpTc25CYURuT2RUdXZEUDJBejVjMGNEZGw3T1hK?=
 =?utf-8?B?L2NSRWVGU1VUeXBLZUhvakJCMWtqU1JsU1cyRDZlSkt4RDF0RUlnK3F4bDBW?=
 =?utf-8?B?dEEvOTVlS28reEY2bWs5dFlnTTZoVzZVRm9pc0dFMlZxY3NwSkpac1ZvWXRs?=
 =?utf-8?B?QndnZ1M3bFlvNjFaU3ZRNXlHUEVaeU0vU3FKNkxyWUUvTVF0eVUxTDdrQmNo?=
 =?utf-8?B?b1dIM0h1QjM4Z1ZzQ0hSTW1ka0JtQ1dnKzB3WTBVbkZMdk90dkpkNEFSSlVW?=
 =?utf-8?B?ckdMYzNMM2UwdHIySFVINi9tRzZiVGdXdWFVZVpJbm9vS2NZWWdXNlRXRmJs?=
 =?utf-8?B?S2hUYW5LQWdjWGZkdXJnTDhoa2trS0tQK1F1TmNUWmRYR1dwR3BVc2RlVFIw?=
 =?utf-8?B?Tkc1c0t0M2pkTFZXZXduU2htaVNCRlVYeVUwMHhEM3dNYndKUHl2c0tYNS9N?=
 =?utf-8?B?STh2bmRhUE9uK29nc2pjWkhCV2F0bzR2amUxQmhiNndjb0s1MEVHWlE1R01X?=
 =?utf-8?B?elIvWXhsR0NpaXN4Q1IyMGlKaGJ1OHRHdW9WZjY2dFlWY3c1TlI1ZC9NckFZ?=
 =?utf-8?B?b0wvY3NxU1YzamdPUGJVQ05Db1ZsZ0lDUHFObTdwOU4xYzltenZGRFd2cWhV?=
 =?utf-8?B?VUNlOVIxYlEzM0NyNS81RmYxY1gzUkdzUVZPa0JHQTU5QVBmWTk2cWlPNmdY?=
 =?utf-8?B?YU5BV0QvV1U1eVdwY0tDY2g5QkJlN1NIR2Frc0kwM2l1OW9adm1JWk90WTVX?=
 =?utf-8?B?dlNzV21NNVdRVkxOODVwTjlub2NIMzYzZnVOaktxREJ5dS83ZUpzVXc5SjYv?=
 =?utf-8?B?ZXN5TjdzL0loeEg3T05VTjZEUGpqY2dwak5IbnlFYnowZk1EVXpyT1d4OUlO?=
 =?utf-8?B?SlpXNUxZczdTYkFIWXVHWWh5b2k1bnhBekVIWENmemZJRGlkTGJENW03Y3Qz?=
 =?utf-8?B?RjVWOFRBNko2NXliaEx6RlF4Vm11bnd6NlBFM21rc21sRFl0Q2xxNko2Yi81?=
 =?utf-8?B?R0g4Q3pxYzZWckcwMEFzL3NYU2lvUDdzdWxITWwveTl1UVRrVXd3YVZkZ3Zy?=
 =?utf-8?B?NDIvUWQvZm9lbjd2UEk4K0xmVklmNjI4bE9ZTnRuQmxiNWg4WG5ZWmNpSHBq?=
 =?utf-8?B?RTU0dXQxSTlDbUhZcmpqa0x5R1NtUkZhOXNoNWlOcyt5SFpyRGM2L2M0YTJa?=
 =?utf-8?Q?GCuwkpN6Vt1yNRh0rG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13996487-0104-49ce-b683-08de69b35324
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:20:04.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUHqy+0Gjir0d9xAwoRX5dQ+pFHpaCQjhAej9BqLz1C4p54vecoytWWdojd4OLtndl62IgYE9GU3uB+kyGOQZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_132008_658223_A48B7866 
X-CRM114-Status: GOOD (  11.81  )
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

Move NAND flash properties under the nand@0 node and place partition
properties under the partitions node.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: nand-controller@d8000000 (fsl,imx27-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000', 'partition@200000', 'partition@280000', 'partition@300000', 'partition@800000' were unexpected)
        from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi    | 10 ++-
 arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts      | 10 ++-
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts            |  6 +-
 arch/arm/boot/dts/nxp/imx/imx27-apf27.dts          | 82 ++++++++++++----------
 .../boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi    | 10 ++-
 arch/arm/boot/dts/nxp/imx/imx27-pdk.dts            |  8 ++-
 .../dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi    | 10 ++-
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi | 10 ++-
 8 files changed, 92 insertions(+), 54 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi
index 31dc2a6403628db1527a1707460afbf9de893abd..29a7f99842e3a70c5dc7ce70c547afce2ed73f9f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi
@@ -57,8 +57,12 @@ MX25_PAD_I2C1_DAT__I2C1_DAT		0x80000000
 };
 
 &nfc {
-	nand-bus-width = <8>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts b/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
index 458b94d3d4ed4c97adc5b9f2597698f22edb9350..7fd8656f529b1a9f3a4cacc68fe63ad0f23571dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
@@ -94,8 +94,12 @@ &fec {
 &nfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_nfc>;
-	nand-on-flash-bbt;
-	nand-ecc-mode = "hw";
-	nand-bus-width = <8>;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-on-flash-bbt;
+		nand-ecc-mode = "hw";
+		nand-bus-width = <8>;
+	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts b/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
index a35778ba6ffa0474d67f77005dfa4299b27d947c..04183ee7ff6851fc26874a640002bf702fe7aa07 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
@@ -245,8 +245,12 @@ &lcdc {
 };
 
 &nfc {
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-on-flash-bbt;
+	};
 };
 
 &kpp {
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts b/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts
index b67bb21af3dedf1124ccdff6a1ac3ef703a6e22d..a61b0afa958ad304338192d8b8eb76a5c2004e3a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts
@@ -69,42 +69,52 @@ &fec {
 
 &nfc {
 	status = "okay";
-	nand-bus-width = <16>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 
-	partition@0 {
-		label = "u-boot";
-		reg = <0x0 0x100000>;
-	};
-
-	partition@100000 {
-		label = "env";
-		reg = <0x100000 0x80000>;
-	};
-
-	partition@180000 {
-		label = "env2";
-		reg = <0x180000 0x80000>;
-	};
-
-	partition@200000 {
-		label = "firmware";
-		reg = <0x200000 0x80000>;
-	};
-
-	partition@280000 {
-		label = "dtb";
-		reg = <0x280000 0x80000>;
-	};
-
-	partition@300000 {
-		label = "kernel";
-		reg = <0x300000 0x500000>;
-	};
-
-	partition@800000 {
-		label = "rootfs";
-		reg = <0x800000 0xf800000>;
+	nand@0 {
+		reg = <0>;
+		nand-bus-width = <16>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0 0x100000>;
+			};
+
+			partition@100000 {
+				label = "env";
+				reg = <0x100000 0x80000>;
+			};
+
+			partition@180000 {
+				label = "env2";
+				reg = <0x180000 0x80000>;
+			};
+
+			partition@200000 {
+				label = "firmware";
+				reg = <0x200000 0x80000>;
+			};
+
+			partition@280000 {
+				label = "dtb";
+				reg = <0x280000 0x80000>;
+			};
+
+			partition@300000 {
+				label = "kernel";
+				reg = <0x300000 0x500000>;
+			};
+
+			partition@800000 {
+				label = "rootfs";
+				reg = <0x800000 0xf800000>;
+			};
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
index 3df70ed6056c4d122c83f9d6dd1ec1af3c64ff0b..bc28250df7a7fb729c2ef76b1f4b3c1199e7f1ba 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
@@ -42,10 +42,14 @@ rtc@51 {
 &nfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_nfc>;
-	nand-bus-width = <8>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+	};
 };
 
 &owire {
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts b/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts
index 2fc4ea5b9501f4765624b42f8badf013fbcdad6f..a1e3b387ba8ee290746fb094903989366a9968fb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts
@@ -88,9 +88,13 @@ MATRIX_KEY(2, 3, KEY_F10)
 &nfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_nand>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+	};
 };
 
 &uart1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi
index 2f60b3809f39b2f2c92cdb6a61664103380e3478..ba6cf03b60057af41f291a2c760efeeecf064301 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi
@@ -150,10 +150,14 @@ MX27_PAD_USBH2_DATA7__USBH2_DATA7	0x0
 &nfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_nfc>;
-	nand-bus-width = <8>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+	};
 };
 
 &usbotg {
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
index 7d5d24c781b9834dbf8834c798b923829fd98444..cfa833cf0c114d987821ec563c7af5053b153a62 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
@@ -280,10 +280,14 @@ MX27_PAD_USBOTG_DATA7__USBOTG_DATA7 0x0
 &nfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_nfc>;
-	nand-bus-width = <8>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+	};
 };
 
 &ssi1 {

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
