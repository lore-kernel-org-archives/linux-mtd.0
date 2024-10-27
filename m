Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561C7D116FB
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Oct 2024 12:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jI4xD5WNrI70HUKMfHN3FLXC8ZwD8WcepyUr9VNsFxk=; b=dITurU6P0fkLuCBYnrs9b5V64H
	v3RU8eq+baFJRvg5My2hgPD5IkoxlwwDjS9a918XIew6cgjetyUjOEp/SN3UOB6ruNcUTeCOVKsKl
	wN3AFWZBYPWg3gJJkf+A4i1sqiM81IsoeAGAgeO8aTgC1pvQYBA4v25Rl1RKH89ACTUvI3u5q0aKP
	t+mkr32E0un2U4kMn9Jy0bEmK+ZiInAKm1JCndBykCZuhkKOL4rYZAf604BUgdWBCWAR9hUSerT74
	RIj+enhhTFA4muKncycY4Q1MMcPy+vKn+vfkCjHns3nrnFeDeVQyt8gUlG+t48UuJLQMR8wWj1NQH
	KAJgnQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t52Hy-00000008ChP-3YO1;
	Sun, 27 Oct 2024 12:22:34 +0000
Received: from mail-db8eur05on20607.outbound.protection.outlook.com ([2a01:111:f403:2614::607] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t52GN-00000008Cd4-3AMx;
	Sun, 27 Oct 2024 12:20:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h68J9ZVHzsAuDVUFPbathj+gL/1Um6reqxsL0H8vaxoOqhLjDqlMOKKOmsObl/fq3TelMLFzXprQ8s75O9p77ewHPwdk/ak910oTfFVZGRGO5f1eygh+e2nZ8ynpBGYSGB4Nhq1e8vmTUyyHxRJD1J1sxCKBxAEIxEuMtHfVHXnJFyysQU94IrF2jAdLtewOEu/dag28fYIw49UJ0rNEz6hjVJv+uP+7CKACMu0Mok9VHPded3/bbRV6yX42cEdKrZbNrVH45P2YazUN8EDiDLNCjvAnT+26CBH3wjTjvAE+KQxrTWctOBfaq7n+HDsrtPh9xwQewK/iapKVOamGfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntBIkR6CQb9EgDJ+HVm25j2e26/rPxZ/E8QWzwva+Rg=;
 b=T3mX20QcA+5Y9JT3cCPMvj9vebXJJO0qPF0uKl39fz7dIvbiyRM+7Knsn5l9RVg7I+e60UPzrglc8TBWvfExusy5e2tLC57f3uSL7574Fi6Bs9vXsw6dXyM53vfnYxYARu/xN3dgjjrgUt0DQDkKVPKFT0seKtB7xmC1YaHza82+KNxGKwWV9cLvpvwdjKAn2sK54Aydjsc1FXZtI+gXQWEQMmFH+WA7QcQAl0JGulT8PIC4Wv3WGDp/N2mbO7608arL1oO0RjyFHwVdwHffjPncyBOzlUB830WDykTa86mE9+0yKDlqf416+cJoa3U4QrZwtQfLSzHV9wfwV4GuMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntBIkR6CQb9EgDJ+HVm25j2e26/rPxZ/E8QWzwva+Rg=;
 b=ckRVJYtBbUiinlItAVHl166/HgthBYdZeV8di+IWQSVlxErie/p5gk2J6QTGaOlyzPfUmf8J9PISNMVlVUPo/iGVdo4EgsY4N8U29zUpoOj+UBuCjCH17P9tyq0y/mrZolOFI8bMnN2OPqChozsGL6T7jNod1dk/pQKmCn7D6lJPb+Bawfe7qk/VRwLlHB9vzvL7Qczd2knroB5sG1ZX5ZcyUshd7V3E01ME1LsMDDUHc9Re9hfY2N3NzAIcx4M4LOwoZ90xHENzC2lz2JrQ8bRcCeSp0C53yBRV8WsqbN8M7mpm669vFjsvwvY+hTJgvLCQ+MBQfI67FFQnGUv+Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAXPR04MB9596.eurprd04.prod.outlook.com (2603:10a6:102:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Sun, 27 Oct
 2024 12:05:54 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%5]) with mapi id 15.20.8069.016; Sun, 27 Oct 2024
 12:05:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 27 Oct 2024 20:15:59 +0800
Subject: [PATCH v3 1/2] dt-bindings: mtd: jedec,spi-nor: add optional
 vcc-supply
Message-Id: <20241027-spi-v3-1-42e81723bbcc@nxp.com>
References: <20241027-spi-v3-0-42e81723bbcc@nxp.com>
In-Reply-To: <20241027-spi-v3-0-42e81723bbcc@nxp.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730031369; l=989;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=+zZjiMBtljlUWiRlzu0/cJbMN4Q1oe5HlK67nKmWK30=;
 b=8zd6+K3amrU27dVZUdQeR7QlEnyWADASuZRTkQ2cHYs9+2ojyZVjxlQ0nytEW6eiOnXg4Lhr1
 aQNRNsnKfn9D9DmxOgFaHrH6NQDqUdBFYqegrCymUM/zEBOTe8de93E
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:4:91::20) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAXPR04MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2ccc25-565b-4033-aaff-08dcf67fb521
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0dCbERxT2gxcU9IMkp5dzEyUk1SMWZRaXMyUExDLzRzbjM5QU1JNHRWUmRz?=
 =?utf-8?B?bjFrd3o3ZUdXL0xtT2Q4MDdxcG9iVVc0aTJnTjhaWkl4MjVmSGQ1dEI0MWFB?=
 =?utf-8?B?VW1vd0V0YlJ0d0x3bDZyL2hyUlZHdnJEMGFmSlBMUm5yekZyLzk0Y3VKN2tG?=
 =?utf-8?B?bUZKaHo0eVdkVkp5eHdxcmxsK1RsQ2xyUG5NNWp0Q3hNbGloRGNPcWhBYzFJ?=
 =?utf-8?B?TVZ0Wi9xSXBGTkF1bVVUOU92MUpOaE1OSCsyYmlob0pKY3FjUm1pWmQvZkZG?=
 =?utf-8?B?QmRvYW5uSC83dzVNVmdYQWI1YzRTU1EzYXJ0aWduNVRzSEp5TXpkOTZ6NElP?=
 =?utf-8?B?MlgwVy9HS3BQYVJRb1dLR3dKRVVwUE12NHFvWjVHQ0gxZVUxSVlLdlp5TEll?=
 =?utf-8?B?OGxrMUhROXNPR0Nva3p1MTFYWVR5bWxyK09udVk0aytmNXhmbUV5aWVFempT?=
 =?utf-8?B?RlYyb25lQWpQSW9FOWxrTVpOVDMweHBDanU4NEo4T3pqZ2Y3QVVMMlFOKzFZ?=
 =?utf-8?B?VmQwWVIrTGFlb2JMNnI2SUg5MllFRnd1K0xyS0JieGdZa0lmdjlZUUdqSkVZ?=
 =?utf-8?B?eXJqR2JpLy9TVTcwYUdiTUdWaXpaOXZFQldIQVpHYUxreS9USUtnMjYxWmpv?=
 =?utf-8?B?RG5CdFI3YWs4US94WGdOQW1GSU5Qa3pvaG54Y3NkSU5kVkRUcm56WmpQM3NK?=
 =?utf-8?B?Z2tvRUpHU2xqdjF6RExmbkM1ODhNdDFYWXJoS08yQUk2WnpEc1RqdEpOYXJM?=
 =?utf-8?B?ZzVkTW1BMzVpdlpycVE5enBRbzJndWQrNHhpMS9EaEV6R1ZNZURIbFVhWTJQ?=
 =?utf-8?B?dXlRaWdxOVg5bjMyRHI5d05MNHZOVW03K3EzNHlDNE1FU3BBQmtTa0U0cnk5?=
 =?utf-8?B?ZmZIS2NCbFVBOFNFVTJnR2V2SnVtR1gxQUh6TElzemZVRXNYK000WVVJUnl3?=
 =?utf-8?B?NWZVaURZZ0ZmU3lLTTVKMnlUS3FVbmJYcXZpczlOeE9oMERaY0E3Q3pZMUd4?=
 =?utf-8?B?dTc0MjM0ZENaczJNWUgwQ3ZraCtKSERMU3JxV3dpODRPTEZoWjJaMVpJUjRl?=
 =?utf-8?B?MmE0b3JNQmVmbllWM0ZJWlI2YU04Y2VCcjh5b3hnZm5IOXRaaWtqQytwZHQ3?=
 =?utf-8?B?dURiZXpqWjRJQVdTMzhuUUt6UlNGREVhM0ZpRlpWOGx1VHRwLzFRNE1NUjB6?=
 =?utf-8?B?dDJ0dGNRbDV4aHVTYVlQc0dSNlNiYzZQMHBmQnRQeDFpMWRVQXBxcVlreUZt?=
 =?utf-8?B?cVZGeGJ6RTNiajZjNDFPQWU3V2MwdnNOR2QybzdPS3R6a01oR1VDUkNvUnVV?=
 =?utf-8?B?STZhc3NURFpjRnUzNFpBQlhhbWU0Qi9rdnFRL2VYSHVHeWQ3SGkvT0U5Y3Jq?=
 =?utf-8?B?cUE0Rkd0ZlAzUmdXdjhUMGNGbjc1aTJiZ29BMFpDUi9wbW1LU0NFRGxBNWdy?=
 =?utf-8?B?THpMYlR0RVdHamhaMWxLbTQxOHZRaU1yZnM4andmOHI3V1p2bm1jYWMvb2Fj?=
 =?utf-8?B?YnJ2V3d3SHJPSmI3ZW9SVUhhMFhmb1BOMFBqcllFbHlDcWV1V3FzczA3Y0NO?=
 =?utf-8?B?OHprL3E3cStBWnVxQjNTT0VEQlRwZ0FWeUR2WVFqenY3WFZuVlZINDB4TDNH?=
 =?utf-8?B?ZE0yMFBTU3VoQmx0akFnSWR4OWhpTzR6TjZSRS9mZUsvODlNY3VQWGJJWnVW?=
 =?utf-8?B?RjhvOUU3Q3VyRWlVZzdHVnViVml4ZjFGTy9BSWVLN0JxL2RSNWZnRDRCZ21y?=
 =?utf-8?B?M2NXNXlTNTd6RlliNnJQdUg4Qjk2cFBZdUNnQTBHQ2dMVkkvbXJoZFFXVlRD?=
 =?utf-8?B?Y1RvTWorMkFlejJFd1Eya1I1aVh0ckdyT1JEUzdobmE3TEFHYVNkMVp4M0VH?=
 =?utf-8?Q?i5JFIr1meXaXB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmNSbHZDeUx4eUN0M2tOWFhvM0FrK0h6WkluRitEaHZWdHVXUlNoRStwNTNB?=
 =?utf-8?B?bysxWjFtVHVHOXo3VmJmNnB2emtieVdDNTR6dkMwNnFXcXRjVzFpVVlPMkVF?=
 =?utf-8?B?VEJYZWl0L0lBNjFUQm9LOHVHbnlFQTVNSVBZUTJQRS8xTzZEMGdCK3BWbWtl?=
 =?utf-8?B?TS80WDYybnkxaStnc3dDUEVqcXFzdWJuOGgvSUJDZENyeXc4a21VWFp0VzNH?=
 =?utf-8?B?YWtyYjllZDhZRU9YZkhWLzFYdW9OclFYVGtBb2k1RzJFdC9mc1UvOXF2WnBF?=
 =?utf-8?B?SzAxb1ZybzhuSnNLME1RRXVrUkxSWWU0bUZRT0ZLekJPVHB5eTl3c0twN044?=
 =?utf-8?B?Wm1qMmJ3UG1sUXBDM2s3SjVwQ3NGUGpBWFp1V2NhYzg5VDFFRW42SUJXQlJi?=
 =?utf-8?B?VkdsU0ZVV0pYTWhrQ05NQzcyQTBBYVVWclovbmtWMWxPQkRHTDdlSHFKWVlH?=
 =?utf-8?B?T21FVkpZN3R1N3hFazhFVHRBaWtUZm9VUmZ1Y3Vqdm5aZE9aa1ZNWWxUTENr?=
 =?utf-8?B?MzIvQStLQ2NGa2ZiaSt6YkpFTmxUcXpjOHp2Y1N1ODY5UUZ2cmplZEV1a3NS?=
 =?utf-8?B?YnJIcGZXZDdrUjhhVmNUaWczOFRUdjNwR1dpR2dvN1ZlK0xMSjIrdURma3Uv?=
 =?utf-8?B?NFVxVEdoblJLV1FodFdUQTF6blY1Q2JOeXdOcVp5OEZ3TXlJTGF6V0k1ZWVX?=
 =?utf-8?B?NngxQmpneDJvU2J5ekxOTGV5VEkxVWNyTmRDejhKa3dpVmtuclZQbjNuL1pO?=
 =?utf-8?B?cDh1KzN2TCtTUzN4eGg5TmsveUt2VlA4ZkEzdVpDWW9EZTNoNlN6MkRmNUdn?=
 =?utf-8?B?ZXdJWHJ6Y3ZxbUlPdEpJZnpEVThRM3UwZVdwOXBsR0lPL3FBdnpkeVpVemd3?=
 =?utf-8?B?TXNiNHZCWnF1bEJ5YUFQSEE1dmhCVVhPei9NOGh1bE1zQmZtTHBJV2JNVDRE?=
 =?utf-8?B?VllLZzREMmlaSVZxOHBiWWhGUmdZREZhR0RVR2pkcjQ4M3g3cllMalkvM3Iw?=
 =?utf-8?B?MmVkUDZ4ZnZmWWJXeGxFYmlGYUxkM053K3lZTTByVW5nWlYwU3JMblVvcUFG?=
 =?utf-8?B?TjlZaCs0MFJac3lZQ0JpKzFhdjArK3VrQlluSWpKdk5nQWJkdEhHd2hOVTlH?=
 =?utf-8?B?aU5ZcU5jR2xWLzNISVpnQmt0UzhKSTJYVWwxckJVUXlzVGdIYjBJZDhveERG?=
 =?utf-8?B?Wmc3WUdOL3hLYjZCNUJ2WDA5S0dqenBRTHBpVUl4WWNBenJ3V1VKRzN0STdw?=
 =?utf-8?B?aHRFUEJnVHRjR284NG4va3lnZ3lqMGRlUk5YOE1JQWJqclNQalQ2T3RPT0NG?=
 =?utf-8?B?WUFMbkp6VklNWEppUFpXVUlFQm90UkZrTXp1dG5GUzVlMXZWcHVyQ1RvUk02?=
 =?utf-8?B?NEQvVkN6T2tBVGtrUnNZSUtaYVhEN251MHVLalNWMzZNMXdlMTBvUG5qYUxy?=
 =?utf-8?B?U2hlMUNGeEZzOFdZbUMzbVpyQytsR3ZRd203MWJkL1RacGhickZqQUI0Z0Rn?=
 =?utf-8?B?SjZ6MjArOEVsc3hBVnJyRG4rTTNSaEFiRDhLYVRZQktKOTl5OUl3RmZSUzgv?=
 =?utf-8?B?aVRkQTlBQ2RwMDlKWWxPZzg2RXZPVjNaQjIzSmxVMEsybHVmNTRkQ3p3S3F1?=
 =?utf-8?B?bnRwKy9XOHJaWnJIWWs4TEpDZXNmWk1uZjJCWmhKNGxNajM5WlBWRmovUGdD?=
 =?utf-8?B?TVVIZG9GaGNTNjdmRGNUaFNaZVh3dzdBZThoUEFkeG84RUpaMit5a3A1ZVg3?=
 =?utf-8?B?VXMrOEk1WXVYR2FCendtMkJZUHNuZ3BxUUM1R1lIdlMzMGxCbGw2STlMNjNS?=
 =?utf-8?B?bFFDbndTMDh4b0wrZytUd0tveWlRN3RjcCt2cGxibDFnYjdtclcweUpiMmow?=
 =?utf-8?B?dU43clBIcW83TzRyNTJvb25wd1VEQmowc2lkYnpUTmYwQTIxN2RoRFo3SEJJ?=
 =?utf-8?B?clRHYzVhQTJaNTc2YjlDWWtGUkszNTZaRk5pSFVJdmR1NitvVzNzUlQyR0lN?=
 =?utf-8?B?eEUyNmNqSlRiZVI0TTBCS2JaS0R1U0xkcUJ2QXhpcEM3U0lCNk9xL2lwUy80?=
 =?utf-8?B?ZUt5ckVxTm40WEZWZEV2bndLWUpHQ0RmSHBaSGl3aXBlUUc4WmpXV09VQ2RQ?=
 =?utf-8?Q?Qev6vRYv/aomOva/59RaHy/VC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2ccc25-565b-4033-aaff-08dcf67fb521
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2024 12:05:54.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FXH2L5iE41eKlP42K6Vf24zBnag6v/6uPNZtle7nvhrC3lS00SmbWWsFdK0tBL11sKPbnV1QA9DlG3GxxQAPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9596
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_052055_811426_681184DF 
X-CRM114-Status: UNSURE (   7.62  )
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

From: Peng Fan <peng.fan@nxp.com>

Introduce optional vcc-supply property, SPI NOR flashes needs power supply
to work properly. The power supply maybe software controlable per board
design.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 6e3afb42926ea6d22f0dd2ebf39752e115502615..335f8204aa1ebce3d2b4686b2a06d0ea3791667c 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -96,6 +96,10 @@ properties:
       If "broken-flash-reset" is present then having this property does not
       make any difference.
 
+  vcc-supply:
+    description:
+      Supply for the SPI NOR power.
+
   spi-cpol: true
   spi-cpha: true
 

-- 
2.37.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
