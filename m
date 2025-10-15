Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32B2CCD184
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Oct 2025 00:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=si6AS+Su39wR/x6PknSYsMSc0QjpNzIICEY3ejmhIiU=; b=X7v8U4E8OBjkt6
	1PS6AzTo4pdjcFqI7MtN91vJ0XK9h28gcdxCJEe93+tM7BbQXk4Y8CVrvn9ccgj6Xt6jexLUxkYV0
	0DQHRb5c629k7RqFwSowLmAh6PscwvzOZ3tq29wq++G0YLt6t8nBLmOALLXM7wUudEVkGbriSHKy+
	wLDGIF9pd+aCn0ha0m4JA/o+/dlQk5+T9f9NmnvSb/Cr1fSDpUlx3miFqb493wnbV4MTQ9tF7z4ZC
	vpcxYLFZ2o+NKeG7XWwIrkxh+8mE+omz7BriPzVmRNMEkut+pUSoPS0W5N+XLsvBg+gdSg9xzlTM5
	VgDFOzBHlXvcC9hd9uMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8p9Y-0000000054g-4AB5;
	Wed, 15 Oct 2025 00:14:04 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8p9X-0000000052P-0KbB
	for linux-mtd@lists.infradead.org;
	Wed, 15 Oct 2025 00:14:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbuHJCp3HJewzYD2l8VRB5FfJ8A7bBob22VlhqDBypEFT28KDz98xKGnkIfyPgHfuYJhM7PaH2xcJJfyPHeRrvwNKC1K+OPlCt1Nx2KIIHBsCe8h031QB3eOXcOyFs7HcCuafIO8XV/lhq9xGnSKcUewCBFkjhudEulK/pA6AGc6GY2FUpiMOM0HdlMlQmG9NYVXR9/eQgmXI9GVoHio2CK6jl1Kl29xKp83BCJYGWuzT1s9lSryarZ7nsqYcSO4cjUG97biuHlc/BXuzIXtuOKp9JIR8JWtb4MdyXbUbElxgTYbdUIuWvxW2K2YMyME7pzuSjMLMvZXucI3NwHRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EKIUEqqsFN5N86cWYiBeGmUtu3xJ1x8ISp0qh0jpGA=;
 b=lIaPkaNE+lOBAgANZfYEyzdsOLeg9GSlIYHQmJ3ThcXkD8CkaDOqFZ9p/VY8axfSYgxkDUhcygX2t7NTyU9PvabMIEjGXB5YYpauI0wvANM91nCIh7WpoTbHReCFov+TxdObzB+/AFYExxJHv2EUY8RCl3AQJnpYUGfxazYV+YvTUKJlzgEVU7rzutsyXZowJN2Dy30uD3ZMl5c8/iWda+VLPTktnp2o8VokNFV24gJLruJ4cxkZTuxKXPOIAmQFgRNBZCG8X/2KD3ttfqZ4ikf6QCUSxtAEY8er15daCdXXA/gZddae5dnNLO/2fBqLUuugCGvJEsRCMBGHvaZ98w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EKIUEqqsFN5N86cWYiBeGmUtu3xJ1x8ISp0qh0jpGA=;
 b=u/nMws2126v/n4r2gykIR3pcw6MMOuoopw3YD0caQhUXEWmCaTSQ01W0ODUD35c7LpJfdAgsWyc9k3WXqCnPfGfFj1TMaub9gaGshNtdoVLAl2NAc3ANOuZ5ktc58fSuPIJKOhaFYif3bqPHZH+mS1CUFbp2ZxSjpEBVk6+YA3NPgWCor+TG4r1ihvVyVJX3Twj2xOHIKDHjyPifxFRDOhq5BOr5IY2eXV3yTe5fkQXs5kMe2VgZ/5lvmugzxo9K9VUN/nbsK5UJje1aDK/Q14zPkpJeRt1YhpSLYV+ObIyce47B5wrnjKQjv6uxYiQz9Kst2yGhehT5daJeB6LYKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 by BN9PR03MB6041.namprd03.prod.outlook.com (2603:10b6:408:136::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Wed, 15 Oct
 2025 00:13:53 +0000
Received: from MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419]) by MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 00:13:53 +0000
From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	linux-mtd@lists.infradead.org (open list:CADENCE NAND DRIVER),
	Dinh Nguyen <dinguyen@kernel.org>,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Subject: [PATCH v3 1/3] dt-bindings: mtd: cdns,hp-nfc: Add iommu property
Date: Wed, 15 Oct 2025 08:13:37 +0800
Message-Id: <8f3ebbe7084c8330e9ea05e55b16af1544fa3dd8.1760486497.git.khairul.anuar.romli@altera.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1760486497.git.khairul.anuar.romli@altera.com>
References: <cover.1760486497.git.khairul.anuar.romli@altera.com>
X-ClientProxiedBy: BY5PR16CA0001.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::14) To MN2PR03MB4927.namprd03.prod.outlook.com
 (2603:10b6:208:1a8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB4927:EE_|BN9PR03MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f63fe5-5992-4397-bc83-08de0b7fb965
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aChgBfoGlb/vudtS/r99dMSHpDhHryaX6RlpNiWD6/iET9ZviQUJeYH5HJXb?=
 =?us-ascii?Q?UwJ8HQtdV53R6wM5zPi+a6SRlnjhVWxdNhI9a/Fp0+sl9O/m5HvGAqLxBMFa?=
 =?us-ascii?Q?X+xgJYO/PWQdL9r7LOVLzXOUiDkud6UZ/aqiw5tosKqRqj3W0ino4NGExGdv?=
 =?us-ascii?Q?FGa/vpMSV9A7LXnmF+C38KzzxzWrx2e8GWchdm3nAh9f134Pz+iVOngYjQyy?=
 =?us-ascii?Q?crHjvQSWclH1bRsILdnuFB7dTqFSEsAKnoXS/7eO4s2Lmb0XvmyjsHoZjuhc?=
 =?us-ascii?Q?OQ5ltizD2AtMkUv1ksCuYG5OFZBJsA8/5GhtTaSi33OoWc+glxrVtaf4/afr?=
 =?us-ascii?Q?XrAxkE6S6q9XnIVWZinUIwZv1n0JMPasd0DZ4rzrAbiCpSeDTygt8sc9KuYP?=
 =?us-ascii?Q?wRrL2EdPvEXv7+zNvypqaZjf0f4nRBneZdVlw0MpKfhQlmCwAKNiXbkGBdj+?=
 =?us-ascii?Q?e4GqhWTIpASfxNmu8ENOdIgwLxR0+0Lr0PwT8deo761wSbxI1bUYOa7vjBnL?=
 =?us-ascii?Q?HSDaDQ4szmgDJw9dFbrw0FgG86PA8bjh+a/FBnTzu082bnOcTCgqiCJQUI5q?=
 =?us-ascii?Q?qjiL9Vh5VwkgIN/BxjeK1ezJucTMTJh2DQWuXCaGnTwNjXceQOGxVq7wAOpG?=
 =?us-ascii?Q?qWJzwjJsXbIwRdBcD9QjZ9q5pukkr/B4e2gTWAX0YDDK1rMh4tbv61h0CtMY?=
 =?us-ascii?Q?PzzNz0fspru0oWD9iLULx9ssdLtQ3qho1vbMGpVZc96LVPlpbGtCklFlqix/?=
 =?us-ascii?Q?149mZqd8vqwmOyk08op4fXUFLIywwNP9WsWOoS/X9sn7QHAm8oN8v3YVRDev?=
 =?us-ascii?Q?sqj7EloHEg2xSjsW3RNBsViV0/uJl70tY2DgAdS+mn+wt5//LvMrmxc0tl3X?=
 =?us-ascii?Q?0V+iLny/VlbmUSFPClk9KP0WSlh9gaMbezGzixH3KX1rHWuMFTm9nudsJmF9?=
 =?us-ascii?Q?wIifjJZfaUchiXwbJJ/oFH8WJxA3YLO+Di9U1m3xqImXOsYuSY3uWeZwaeU2?=
 =?us-ascii?Q?WwMZievSOJUl9N+4SNBBS9dca6rcLIlIt0A+WqWRa1HPEvUMcBPbAnmxZ6av?=
 =?us-ascii?Q?9euG7rtAif0N9bu7rj04uWxugZmGiZ/yDr+x3dhg+runY9TFn0ueYMNo15Cg?=
 =?us-ascii?Q?WgL20fIYv09L1Zk8zgDRorHoBKEWccoElmRsCBTUsuxyrpnPdMaPICKtWi08?=
 =?us-ascii?Q?vkwzcRYMaHheBNHhDEp2soZ1ArtLIfnOOjm0mZOEZEE+J9yqpwBj5QDY8kPa?=
 =?us-ascii?Q?Is5IWFNvnCukxoP3yqTLcFFiG+peDRwZURdTns1Ko2X9XahYTac55vSm3Xov?=
 =?us-ascii?Q?1psMUPT8F2Weli53Bwq17aLviiVqG9f6xtY/CPp8Frkr5ld+m3/vYl79nUc3?=
 =?us-ascii?Q?kzPl+fATMBKoue0d9JSPiDHNZohKdPh8iF+NKVwtKROE9kMs6q9S/VuNIH60?=
 =?us-ascii?Q?FEF2w9knJqKECEE6GeHTZQbSO7mmC7FlBlXMsLDdvO3aUQECdVRRaw8/1KZE?=
 =?us-ascii?Q?Phn8X6dXUSN95OM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB4927.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5cWdtek8yyD31PYyBHIpH/v6zrbCNqxcoW353jIeCUb2/81v5xUu94JYosCC?=
 =?us-ascii?Q?Z1WR5MkvdhmNfuHmL4hF9NNeYyD7KXpVMQGxtQppmMSoJaaiOTbbJQZRyjnY?=
 =?us-ascii?Q?FdAO53gAB421ub8FunvVEwUSjv2thk1x79JgsMFXTlZn0FxGZ70lzHFKJH6f?=
 =?us-ascii?Q?Y9QRFYmtsavzS0Pu0tXd4/TdLKOGoTNf6CVNkSH/oRsLFM8E06MERR878T8r?=
 =?us-ascii?Q?OoalWfqlTXFSnr68A2i/bLUSnPnKZQ8GXlZ4dFx7wBOUAweWwTR4dDFHbv+q?=
 =?us-ascii?Q?FiMypWL3uUQ43922nqCZLbjFvuhJHt+ap2SGjzaiVi/9Qwtph14jXBM7rAoR?=
 =?us-ascii?Q?mEJVydWSGpxgp1ZoZfqRtrO0a4a5UdnUh+/Ec/Uah2PIDYoS5X7BZ+r/4pif?=
 =?us-ascii?Q?+Z3QiRjy7F+T9VQulCT2T2edVX/nPFS5S1lr/QMLGDHk51EQSunIQxDMcbgb?=
 =?us-ascii?Q?6eWGB9HwGAFe0C4pAbl4ALB6swA01fjwnATjHUbZtm0GUXbnOPXbaXQbPT6t?=
 =?us-ascii?Q?tFyKs+BOGzFZ4IX4Bhj457Ktbt/hJMYmwYbz/QhfadXEb0sB+g2yV9117nBA?=
 =?us-ascii?Q?kEjoiI48KctzZPh2wFcM7GoQL7h86YuP3CeIAeOfiokx7lA2HtcAWUhpnd23?=
 =?us-ascii?Q?KkBY8g1SfMLgKON58oc97wwMpifw662Hv5T/NQjwmKJ8QdHMJliFbaPIdZaX?=
 =?us-ascii?Q?J+RE6WN2Ey9MvxzMV91HM2pd27K+26F4zM5XF67EfsR2cEBuucUbPjg3fTyX?=
 =?us-ascii?Q?3w8BFa6jkC0FXSZSPJOXpPbTdmcKdsav3GzQ6Xs8Ov2OBHDEZPoQwGHADJxY?=
 =?us-ascii?Q?+E5MgQsrUArJ2C4ZArtX1VuQjFt6IWvmxaCbMhZoW2t/qv2yfb6EXfRoEsFw?=
 =?us-ascii?Q?OH5ANJ24Dir8RsMqtYiO75fcFKuB50vXxaP4JqXIxWCyhwi7Scw2ay516gJg?=
 =?us-ascii?Q?0EqW1w06NHBWBSENAoyRbODGU3kviqADeY5rQo5owGIjtybCJZ7mEr/PqOhd?=
 =?us-ascii?Q?VWHlOaT5CJnI/oCQdbJhyLXv1ECgqbK7RkV5QAXNi0UAdX8UDY9NLDdn7Foo?=
 =?us-ascii?Q?mtD5Cnl25tBh/+Hrwhj0wO9WxWqJPCeFiOlTMwRinal/UKy0/2iaz8kBhAiu?=
 =?us-ascii?Q?pp3YkpzmZdDBYNP3/wpU9jEjUz9WDLKO7F1VuVGUgmHNvpEY/QUvZ7nbX//m?=
 =?us-ascii?Q?/eKyKPJKAVOBaQUBDED8KZ3acgJx/9MC7Y0a5QFGffk4ZD6lH9Mhbxc7EeJ0?=
 =?us-ascii?Q?Sq1h+Va6gZJ44kRNvJRToGU9J8PpubpA+3WYME/nM7XMLg5o5MAYhxh0Aqeo?=
 =?us-ascii?Q?nHec7KfAKgsI8eu8IUvRraYnoT20WKaLy0aNcw7ZnbDasLQKZOpc++teOV0Y?=
 =?us-ascii?Q?mvXIEuiZkA7JPWYYbKkSPnuz7FY9B5xmEUAc9M75bwvg1qP5wu25W7UbiFyG?=
 =?us-ascii?Q?aRalFIWz8yHpahMUonOepGvSLcZhCpunxjH7lddjtJ0wPG1Vnfp3PQtpkreL?=
 =?us-ascii?Q?xo32Q0SwUUEzT5mIz1Tb/dNk7zVX00oByu9j198THJIjFtq7+1etSAuPbgfs?=
 =?us-ascii?Q?rtrzCR6332V6OgghsV30WlFsoC4JROvLyPHD9O8o/4RgiTebo4NcSS1rpTNJ?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f63fe5-5992-4397-bc83-08de0b7fb965
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB4927.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 00:13:53.5817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0cyvqnkDgu7c1UBGLX4K4YQVOGF3/jn5ArSkXHENR5Vlq0y4iCTlBvJEdg1AmDuCPdOsXwpea+zc+9j/BeeLvuvPVs8Y7nrefSIzMrZVZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_171403_119768_FBC14FFB 
X-CRM114-Status: GOOD (  13.52  )
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

Agilex5 integrates an ARM SMMU (System Memory Management Unit) with
Translation Buffer Units (TBUs) assigned to various peripherals,
including the NAND controller.

The Cadence HP NAND controller ("cdns,hp-nfc") on Agilex5 is behind a
TBU connected to the system's SMMUv3. To support this, the controller
requires an `iommus` property in the device tree to properly configure
address translation through the IOMMU framework.

Adding the `iommus` property to the binding schema allows the OS
to associate the NAND controller with its corresponding SMMU stream ID.
This enables:
- DMA address translation between the controller and system memory
- Memory protection for NAND operations
- Proper functioning of the IOMMU framework in secure or virtualized
  environments

This change documents the IOMMU integration for the NAND controller
on platforms like Agilex5 where such hardware is present.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
---
Changes in v3:
	- Refined commit messages with detailed hardware descriptions.
	- Remove redundant commit message and add the hardware used for
	  iommu.
Changes in v2:
	- Updated the commit message to clarify the need for the changes
	  and the hardware used of this changes.
---
 Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml b/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
index e1f4d7c35a88..73dc69cee4d8 100644
--- a/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
+++ b/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
@@ -40,6 +40,9 @@ properties:
   dmas:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+
   cdns,board-delay-ps:
     description: |
       Estimated Board delay. The value includes the total round trip
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
