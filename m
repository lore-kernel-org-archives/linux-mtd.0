Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1B5CCD18C
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 05:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JjXi0bv9TMeA3+DHGdWU8UwyLekuq5452bGQHQTgXr0=; b=DaE46v3ktYjTlU
	kOeq0PQRBhEqrgis8vXHScWgxUjuhU8ezlmfg6eGep2u8XI2XPgAjvLMke05WRCTDMIJFAQYHpQ6/
	b7z4Pu5DR/Su+c5JY7igG0M8B6fsebQu9WRe1yBAZ9OmeKIH6Zq2xlTKJC4/6Tq2RBYbqjwZx4uZY
	Q2Sau4HVNTe0PtXo1ZP/UqAn3Ny7/4Nobi2mPaB0rFnu1kQha3nQAGHYvzAWwRYl7OBVNCEdS98vf
	uUrZhCFR+eWUIZckD8JakaPi1I9ezZxbMLim0/DB0tR0vlpbZ+shHcTDiZqdYJZxeWI5xM5D3Mkd8
	dafNp/HQQdnwAg6Kt3zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8AwZ-0000000CEXK-45bU;
	Mon, 13 Oct 2025 05:17:59 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8AwX-0000000CEWa-2lKI
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 05:17:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvGwjc4sUdqv+P8JW7eXYLxKD2mkYXLrHSJJz1DscXvgljzmozn69AcMKHo6Irvmqa6pE9yR312egeqiIxLToMhfGSVALDdKZjvERs1EBzvQ+FJ5vsn8eKde2lQD3CXpYoNijEFpCPwf8rU+4wh1Em8iQW2FZhxLwAPri/TXQZdoJcGUqWTShSAEGWynwaQjTk3/VKTmO5oKO+eN/FMjILT1EBAvEjK80HszVtJiLBIiM9BSeMiPPXptvNXuqo3iGDoIZC/01u4t+eY1Ls/FFq7WyWneKoWzRk9nBMoBnsNwxFQAnzHw0yE4U/awTl7XC1JnZmrWL+a69c+rsDnYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJyJYL//yMzmOhh/HJYdGA7CEwVItE+rfmOIFhT3nEs=;
 b=C+koLQHsLzCbrAou9oZbp3VqdLtSe+eVTpiiUG6lkNwJmCnwGRnE6lbx25zeCyvaJHCTQ+DBR3K+HSYh+mkQHxf+DitqP1D0Z+A0+MdWS/XeX84cou6tBV8jzPpCN5fl0gB9Jq3amXhuTe2/+Kj5LxIgXZijz7Pnu3gnhNJah3r5HCOPTCMajuRwXGbM/0GhlKNzUipr+scmZzqsGpx+o4sxFuzZ/KVWKbZEHhPMTynUdSttmwC0YyvElqnhuexUTQuvWKhKwwPp4/EY5oRWe5RLW1M+EqYREbhiDF/0d5gc74xfmKcfn1CzvVPUbpfikYgp/8T/1p2+z30eDUe+Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJyJYL//yMzmOhh/HJYdGA7CEwVItE+rfmOIFhT3nEs=;
 b=BkOhVJi/dykV4zxHiASCehykoF2SSickYiQjer++hr4fxtKWESk//LuUEtwyNWGIq554tTkgo/+ohtCcmxJpfe2v/tgzyumYaNch7idM3nyDgNL5hm3YwJTSAIvFe3leM+8n3wSJjVoP7BWank1Tx4rklUelmYZrpUeepqzeAMKyX+OpinT5hC0mCn/LxMTWTf89ATbZAW+UBrjhuOy/31zrYsKOuJpwZXQ0NPcnxYkgWCfyyXwBWQJXR5d3a1iN1tQc1o5Y2Fdv9Y8Xn3uVBPjunCtESyYW/YusW0LR0GWxplHcx3UYbUhfGmsomneqdqXMz0jXf4iUWcWCZubxxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 by SJ2PR03MB7450.namprd03.prod.outlook.com (2603:10b6:a03:561::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 05:17:47 +0000
Received: from MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419]) by MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 05:17:47 +0000
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
Subject: [PATCH v2 0/3] Add iommu supports
Date: Mon, 13 Oct 2025 13:17:35 +0800
Message-Id: <cover.1760331941.git.khairul.anuar.romli@altera.com>
X-Mailer: git-send-email 2.35.3
X-ClientProxiedBy: BY5PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::38) To MN2PR03MB4927.namprd03.prod.outlook.com
 (2603:10b6:208:1a8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB4927:EE_|SJ2PR03MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 530a54cf-d920-47d4-6cda-08de0a17d8a6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cDQFuuvL1pAL+T5/evw3wmzywULk4Dq3AaVRhPbO/DLXtfGxnDaFKiXZSPaV?=
 =?us-ascii?Q?DjI/o5dz9y/MiWDS0b4JWql2rYXlA8+QQTLEyg0tjy5Smpu6C8u6m7cjxTki?=
 =?us-ascii?Q?UzkZz8KEB2v/PzsCJjIEvgMoXfHOZKR1MdLWWW636RT32PT+EsZphfg3K3Be?=
 =?us-ascii?Q?FWHQVj5+zB+0X+OIADSuLo5wsAPKNyiJJVNbc3hNW8fqL2vnpCZFqbbtqWRs?=
 =?us-ascii?Q?3b13kjQixrjV4qENV8sDc7oTRRwoceQAxvUHwWzMlao3AVXPZ+Uky/aitAkM?=
 =?us-ascii?Q?fpJ4+6o+ChFVC5YKE3gisV1Dn/44So7yqnxnovwr9Kb0S6cy8OuGJZu6Omnk?=
 =?us-ascii?Q?SxN+h9LSsW4EOZzT4ummnuDOjCntM8zM2WU7+2ObajRLRmP1kUyRyox2rMAb?=
 =?us-ascii?Q?M3761UopFLke/magfb0rn6aRzmf3YlcDDnpFGf5/niKAd3WSPtOA5gNoD2Zc?=
 =?us-ascii?Q?4rcmEE3f41QjsaI0uzHhoCdmY12miH3JtRXJI50Y61yhYLEA9bylY3c0fc/2?=
 =?us-ascii?Q?aNSKo1aDjG6cPgZj0E0aDjgdVtaQ1J7RcK50gQALFHti1r7XAIT3no84bkdX?=
 =?us-ascii?Q?d4hrXFEtN40o/OnWE8DjSETjRBFonU7doN8lNEhYw6cYXmjLATKSrOikYv+s?=
 =?us-ascii?Q?NtuERbuI4L/2oEPaAPx6CaPP6LrxT/xb+0iFr4DtMgPY0FWvdueyUwHrK8ze?=
 =?us-ascii?Q?pB7EKS4WMWkoDdirZ96n5FEFw2FIQpB0xiq4NTOWZ3yfRHLkmeYC/XZqP78v?=
 =?us-ascii?Q?mfyQ6oUfKY5KOXZ+7Q6G440DKqdudmD293WrP4OvxvDdAjHj/H/Ci49tWVPa?=
 =?us-ascii?Q?DvH68l/MgWSN6ecEwlQBXgYJTuMp7n1JsBF2pd0qqRUKL1TzjflYIyOmnI/t?=
 =?us-ascii?Q?fERPYyCkSgfHSQ0pzyrlxHfK3gjXQJwDdG1qI05rd9yQDwDFmt2BuQd0+jv/?=
 =?us-ascii?Q?ZZxQe0of9lPM+t0By4pqi43VtNKlIcqS5Mrq8H4nNWva7ka28OG8Tzow0K1/?=
 =?us-ascii?Q?C7fkyhcQkeH7ML5wDxgZ41TcQlh0GBOxj20v9NrZoj9PyLX4Wg2bglhLXG8e?=
 =?us-ascii?Q?cWTbTwuEtRPob1fM0Vw0xZIuq+o7j6hQ17WEWQhUh1xDFWcDj5IxZwThXow9?=
 =?us-ascii?Q?icgnjEyuF1Rq4FvOIJoXndJZClrSGk3/4PC+kiBK3a5SxgVROEIitWVXmep9?=
 =?us-ascii?Q?BcXf5YVoxs8QyALxm5iylpj4rusFa6BgH7JMPSt5WNvSKcSTZ99h+OWBrsQI?=
 =?us-ascii?Q?lkYRlSILhB7asYwOheV58TOhm6HsQh+G8XW/vUHhnJPZtXAaOxeIoWEnOg/m?=
 =?us-ascii?Q?MrzuGyrHgVZ5UtHT4Z66qHBs2PbcS863R9wQcCBhVg6w03Hg9C+kX1Cdtk+Z?=
 =?us-ascii?Q?ec01m+A0fyDoljcPNT/h5qf6OeqCTl15l+8urS/Cp3sVDQuaoO2bnGtFp7KV?=
 =?us-ascii?Q?nUqAlW1u7GFkj+iOIZ+UP//NvXCHfFEYuYVsdnFOeXKkuA5gLlimWHifIKxP?=
 =?us-ascii?Q?xMEF2WYe/LGBRQk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB4927.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mUvVGI3iXmJLu+QUfG6WvrPro/CQq2DUzzbmZtyFC8gbXsr2PNAkovzkHYAi?=
 =?us-ascii?Q?F69ep1oZM3t+NbUCnBLj2+1WUkPkNpizehQ8KipSqCpviU7paPva8gEaLDno?=
 =?us-ascii?Q?qKIzWhFjK3frGpGUYMeWFaw/bbB9PGxrAgEjU9avc22NOi/i8E1F0k38tjQz?=
 =?us-ascii?Q?uROe17AMrCaN9YmWPEx/wkQH4s5yho8YTy93z+j8NnuJFacdi8oZe+fsVu/X?=
 =?us-ascii?Q?4e328iGi3ROAyU0+MhaTnYpyntLYUR1UK4zBC3m/Lb7awLPubQhdQzEp0uTy?=
 =?us-ascii?Q?BJKmXzB53iYu4gkfMWmeVA6A9iDKGrZrg+qMd6YYYpg14qTUENuA18blGh8C?=
 =?us-ascii?Q?M7ir9oxMGNSGpRbek3cQN/ayOlmpckd/zeA+h+sZWswBtlxeTOd5SnL8Q9cB?=
 =?us-ascii?Q?8iE+9H7L+evKKwXE00IeABskc4Pd5QWO69nyeP/ihEQ7aBTdKfv/ey/5lA8W?=
 =?us-ascii?Q?CWuRZRx4+CF0rVvk+teYH4RpKk+rXP5BlQF96Sn0YQyBaX5MloZ2r1GQx5r0?=
 =?us-ascii?Q?/GmNqeznaIJMr1bVAIMF8k8/iiIeHCMxEvOQ2xSbFmiuLcqj7wL8WIlzRG30?=
 =?us-ascii?Q?OijLVgBvB2Y3SjatI0/6vyp2eUuKgbIhifXqJgwOj0CD2bO/6AwPJSAwHZLy?=
 =?us-ascii?Q?uzDMhrIz+PuUT3FKQWH0bwQb4b5uKPjYGBSAIgvVYRlgictef/HIXud7D1bN?=
 =?us-ascii?Q?BQpZ51fI60F0//z+ZEipz6F1WKjLLOsW2JlYnr/TkeVntcOhC3VYYSqyXbWB?=
 =?us-ascii?Q?En52sEw74SMgPmHps9HOLBdG+PF3FC7x9clHT//ke9qjACh9s4RlnG0SnfVr?=
 =?us-ascii?Q?BF7JuG9RWgpmmgj2/0lOdt9JZBDQixu/kv3nXupZPx7iCtSkgeUgOxaNiGvV?=
 =?us-ascii?Q?1wonRG0VWJl4hhtGTwrHNyiq2v88SexMsgR98mr3HwqUpNncR8D/pQVQCkJA?=
 =?us-ascii?Q?4hFw+2UjmvlahGBwSGmrSIssxiatibCXWAaHJ7Qhyo/gZlgHAPI0/wtuxai7?=
 =?us-ascii?Q?r7JPTPO1VSbLFKCBhv4n4Os9dUsi2tdJNOwveV9bVubwLU3YZ6JujZZPXtBx?=
 =?us-ascii?Q?9475gJj1Jb2FhDnwS9k0ExMN7svxeENROL7TRWsOYjZB1iRUzqcjlErYOquW?=
 =?us-ascii?Q?bYF7Lju4GuuS4mjDInIxgbECaCPfVIDBv6lm+3aIPBLson6QkRG3nnF4eONr?=
 =?us-ascii?Q?Pt/7leqKcBdpc6wy5CYG2x2BjrpTh6H0KOVoN5Uu9sKWZwKKBR8xdVSQajdu?=
 =?us-ascii?Q?GlP18F1PJbmx1+DPISq0drUcX1MWu6vcl4x7U4TVNgRt+JtlSOrymjIOMnJq?=
 =?us-ascii?Q?IcLGd8q+zQ9bRwel+nLYBWqvzSXchhqr+olw12e7q21rlgi3ye7X9K9L2G1V?=
 =?us-ascii?Q?cbYsm1ea7lhauDGfnQnz4C3DB/LJF7R6n3zsKChW2vplO6Rt3sRiLn5PF0ax?=
 =?us-ascii?Q?eKH3CXfEPmjbUPbHSyfX4ITugPatKHKgdyXLscc9uv8/zL1cok/S3o+vnliT?=
 =?us-ascii?Q?28aVzB8NnWmnBpGyiFljxcTPEf7B5j5MA+rbnx10bBEeSp3yBLTtcy2NPMBT?=
 =?us-ascii?Q?ZMzNUqhyf7FMd0WvmEDeFo2+xhUdxRBZmyuRL/ZDfMVIdcJXL2DE9OWBY8NO?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530a54cf-d920-47d4-6cda-08de0a17d8a6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB4927.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 05:17:47.2517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cy36u0xQBd7uzLRNJ3Ej2kFgkNsfeNDg6xMW6D6LC+WASgQ5ZG7Kvy/CEECxe/WSdsaJBZAZFbRsYE6Y1/tCpQmLRUrWibUjsIPci513Kwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7450
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_221757_706420_01937757 
X-CRM114-Status: UNSURE (   7.11  )
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

Add iommu property bindings to cadence hp-nfc and synopsis dw-axi-dmac. 

Add smmu node in Agilex5 dts with the iommu bindings added.

---
Changes in v2:
	- Add more description in the commit message body to clarify device required for this changes.
---
Khairul Anuar Romli (3):
  dt-bindings: mtd: cdns,hp-nfc: Add iommu property
  dt-bindings: dma: snps,dw-axi-dmac: Add iommu property
  arm64: dts: socfpga: agilex5: Add SMMU nodes

 .../bindings/dma/snps,dw-axi-dmac.yaml           |  3 +++
 .../devicetree/bindings/mtd/cdns,hp-nfc.yaml     |  3 +++
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi   | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)

-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
