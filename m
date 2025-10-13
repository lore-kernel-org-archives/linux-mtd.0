Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A22CCD185
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 05:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vda5s4KTFWA9Vj2GjRwN7GEhhsJ9n0iyDR4PP4SylM=; b=rAlGGr2gqkt3o8
	eT10evsXThFdLuKv3F2MCsks15o9Iz5KOUkCh2pNeKQ1GekOLU8lZi52HKzgLewSJSrsfYR2ray7u
	irEyUfiKLIiZkdJLvmXdgscdnA3iITfxesOMjBoRxgGJMfPcwTHqXLu0L1Z/+cj4W6qzBAU+ItGmm
	WDjUrGjrqtNK61OUP9r70r3+zwGMZhkPjATlFa9SI+5iriTjUsv205SNWgLbHJ+z4C32PKeg4UdAf
	ths2emXfAWNEOo2DtYrR3hGHF6jbyJtIL555ihd6LYU7Pr9DUJ6w3PZT6UbN9hsx+XezV9O2AxYRx
	r1TV4cJN967EWtfSa+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Awn-0000000CEcc-1flZ;
	Mon, 13 Oct 2025 05:18:13 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Awk-0000000CEZL-2UVm
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 05:18:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nv//q/z7/jdakPGMHEtLmX391Z3RzYbt+wI42J9GtgpzWBsOzRtmbsUH2t4RUTcJeTegAgyEDzIPnnNgLbevKnWlXxRar8mn/ZwRr3Qcntadegfk1DG+uKiQ0xDHEcOrPRX5gLNboVmIjWZa4PZqk8WqaJHdpIvoOa6fHY0msLXNQJSGWQ9FdMzx8335ONXlQc5g9lHxagXFnkcD6jXWpob14CMyhZfY/QcdimH5QLdrHtxm6HbnND0ODit8abh7tUWJao3+JdTL0FQFAQhIGjgDvqjQETeYujPFRGrEJqpqvDD7n/isSkO1OUtZeaz67aiEVJxBb5SAh3VmGYZ0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nT9Yh41e14dlPS4HKX2DO3kdwkILvE/xjpgSSYD9ww=;
 b=Rk77cz3Qf16hzufWsfTdEb1+V21eFylKoyt0nVKOp7X4iax7DWc7VKA/abYH6hWP8tjoXA4+nhbWciTY35pRb1rTSrvXsH9L5c/9cCcw7T+k7NebqmRgaS1loGHa6V+siPAESqfMoKtUkiRprkt2CFOGBSHcxC+D6Hmn60cb2rlPhi1A9up0Ne/5r+xmaTgQx3ElHbs7FaJWfL80ktwuYwIvvz0B5f0DmC54/+1tTZHB8vfA7e2GsCI40VPlE6+LKVO3zBkRifptmzTcxLn+e91Tbdjy48pmhUq8u4TlK+mcLeffJ3i7MAGo/I0zwzsR9Vf1Ws2tgacdVOezTKPAeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nT9Yh41e14dlPS4HKX2DO3kdwkILvE/xjpgSSYD9ww=;
 b=Z1RgyOeI+miALN+hHgTV92zNQt2hBhwEVOtKYXIxQxBWt6NyuffCjB0bMljO93lWB3M5Q+MpHBYZCWjimfysmk1mZZglaZNnheNWggkfrcF4k9CgjMuf8vqnZ4CdL0GM1QbrkA7BoAgcAc1IXQ9Cn82HEHO7r0ew1VfPyrkt5JkFHs4FYb9I9TId3bN/y7verW6b+kW+LZr8KAcgqs9qZ7bpoP+/XxHb0TzFO0/tQE0y4XgGZCs+yb9IFKVROiwVlVd1TvolQampKoDSHlHa/oH7WSnbGZp5dY1eTRNAMK3S7VZHOMZeIVx9JW/o2JuiJyFzluSw1DykugCp5/Y+/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 by SJ2PR03MB7450.namprd03.prod.outlook.com (2603:10b6:a03:561::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 05:18:06 +0000
Received: from MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419]) by MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 05:18:05 +0000
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
Subject: [PATCH v2 3/3] arm64: dts: socfpga: agilex5: Add SMMU nodes
Date: Mon, 13 Oct 2025 13:17:38 +0800
Message-Id: <efa78dc7e87af4524b7a6273daaff336b3e7b07c.1760331941.git.khairul.anuar.romli@altera.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1760331941.git.khairul.anuar.romli@altera.com>
References: <cover.1760331941.git.khairul.anuar.romli@altera.com>
X-ClientProxiedBy: BY5PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::38) To MN2PR03MB4927.namprd03.prod.outlook.com
 (2603:10b6:208:1a8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB4927:EE_|SJ2PR03MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4001c9-3d22-42a6-66ab-08de0a17e3a8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZgtOy/7a5pahaxbQDdbxWQTWFOBZ4AzmoEzRqXRj12bLtUZr6yNMCLjBJWzJ?=
 =?us-ascii?Q?zWgBIJgB+BgrXsMJ+LHEOZrlgrL9uTDz44rI5/ULVmw9qSLTKUwvfMTZFhfE?=
 =?us-ascii?Q?IBuffQUo+N+A36KEHuzsRyFQCqctrYdjvwHR46L6tGDxTKAqiKRQOZ4PDjGk?=
 =?us-ascii?Q?qbNtSdVVAofr0C6/WWgk/Z49jgKGs8umAJ16JZf3OSdM4J3Hmh4SrDdnDXEp?=
 =?us-ascii?Q?bFJG3+tgWH/lKXSpo59/fW5ZCGeoWG3FOJV2wKZ6gQskNvU62kZhFmqZ8Ovq?=
 =?us-ascii?Q?tmGI2yYaKnxXC8CAMe0Vr6RWkxN/uNHIIoat3sOzwqmOycacvVSGGp3LmZgV?=
 =?us-ascii?Q?Gxl4z+LTfLwD4TKx3SBQyq9BaW9oZkN5ENRXruR5cCZ6bMKRB4T5BaSkRPAD?=
 =?us-ascii?Q?Ftq5KSqzTzrWGFkCB3v22CgHxKFh1L4BrHhxudw/8Eh8qAG6/vPRJh0Cpyp8?=
 =?us-ascii?Q?CMH8cYgkDdTHIShaJvmcagJc0/fnXN/c/mNUonO94uRg/BLOEv9yikpcr2W/?=
 =?us-ascii?Q?+NZwhhig1tsx9gsOTIKwe4GCGkY2JzU9y9Kb3xxpfHLQcBDswqKwVPcnYfZu?=
 =?us-ascii?Q?uZ5ELkbD9sYGZBsdmX7ejjHFmNnpUORqYrQ/vEr5uCq2JhQFcL5JLzfV8Fyw?=
 =?us-ascii?Q?eDyDEaes5FgOwMsNzu9ZIk6n3IdQu4hpP12A0Pscq3dWKL8JMZXsPXQwKbBT?=
 =?us-ascii?Q?wayo1HN4BzczEGjBuPhf0HpPdF7DHW9r/T6lkngqBT7+uLEyCpT4vO306y7c?=
 =?us-ascii?Q?VBf3EtFK8p3BBGpx/fGEHAHv/RERUYdx5vmY3QsaeEKBLbFCN02HSs2ZrVVC?=
 =?us-ascii?Q?/PSfoYrYmhITgJgSIP3bEb7dk9BGX2Yf9JoC1ug4WdZEkNHIrHWrgt728ZLq?=
 =?us-ascii?Q?6ForcnUdSNuCbCZ18Fy8B1ESV6/ALQz7br/CiUsBIV+KNE1bJ0xx8jO4F20v?=
 =?us-ascii?Q?XO/VhM5mma2uGtXnWNS9w1zsdmJVS7cLhiHLIm2lizQPQVhy/V/TrinymoIx?=
 =?us-ascii?Q?UpbklZwql3/yayU8EMZ9ULYjIigg62bf6XG+QDXKoZV9z++9ZGa6SHNY1M7K?=
 =?us-ascii?Q?rVw+O8ZRuPofFN4G6nmzdfihAKJ0cbq1IhyIQIVEus1HnSM83MfeRK3zlShA?=
 =?us-ascii?Q?jvcblhHWpvO4Kpxzk+DIkrhL6HEaJKgIANiGBKBxD2CRi0GMTQ88SVYOWUii?=
 =?us-ascii?Q?ilvgGXxWwnFBXxTPqI5NSosRTpb0ScGP/OtgnpjCc+MTFY1Z2QlmorVG2Cnt?=
 =?us-ascii?Q?PeQpgLqW29bAI/CpTNQYDLbZmZrxJjyFfSalB+m/O6MjIhAUt/WGkE9KTJjt?=
 =?us-ascii?Q?uZlf6E+sAndZYW3NuoxuaoRbSbME8Y8wJRFQY6++RB8i7cDhIn2iBZYDPaxA?=
 =?us-ascii?Q?/S0lz5uNexwUb6c+sSiMykh5/mG/IurlySSLMGqNww1jzKH4FDHBg6etbS5H?=
 =?us-ascii?Q?1Wc5cXIv5LCOAe/0X76Mfe3acL35JHdmfu2mp1Mb1PPRWHdljW/+QTXsEW6T?=
 =?us-ascii?Q?t37Wee3jdeZYVUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB4927.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RiXmjQcOglQGXi7yDZMax+4hDm1Cut7LSttmiJqbPJO4AdQ25dbIPFX7hNCT?=
 =?us-ascii?Q?BfwKd61y+f38RqqdM875yXRWKO30ROWAwo5cwzIrtxgWtUKUuO+zzuYC37wq?=
 =?us-ascii?Q?TNdi/GmFsl8a1yFzWa75QLlGPMvbGXZEOlJAnuEWMs6UmlJ/aCbR4aQynTH4?=
 =?us-ascii?Q?TYQNKwp2uD++gqOvWOL2ZVPedR6MAEWb5BmTbbjcKYRGTAm27/YFgLXEKmfz?=
 =?us-ascii?Q?ucODwmrGaLSzQ89B9I2UdzjYaIPsNRnmsd8RGe/GPoXjybghOoSBN5wNtwJu?=
 =?us-ascii?Q?XWnhMMKr2qIj7HfEEMjgwBRYsIz8f6RiKH7kttsimJJh/LdShUP7U61W+ItJ?=
 =?us-ascii?Q?QLjitnhbZqNnhjCB0UoW0pwQl4kr0+GCIcY3+kH3IjL+yzWsO2Tcag38en3y?=
 =?us-ascii?Q?Gzy7VEa43WkvNvhJ4YKuMm9abbbMuJTpWtP1NqjoH6zFIG50s7+tx0OzsxJ8?=
 =?us-ascii?Q?olp0LdR+PYjZiagZNboywyMy8Dg5ZAifEKA+xB/O5DDD7znqUhLHvCwggpNL?=
 =?us-ascii?Q?X0YGfIJnNcUekegG2HPIWDGIk1AperKt3HvmgaBwQF4D3mwSRygBSvsBPX7E?=
 =?us-ascii?Q?ZTP2XwhT4A83lyvV5/eYqS/4efv3cFQPXJwU0CVOyuHjlLsa8rt3fCoXctC4?=
 =?us-ascii?Q?ne5iBsEFLn3aIQhMxgE58kJnxJPSFiFjHgAjhjDztDo4KNwFnB1rul9kSS57?=
 =?us-ascii?Q?8tKOPobv97LfVHLY5wk32RCAy3nb5QPzWKb1WQo318uxNi7fShBBqFfQ1zLn?=
 =?us-ascii?Q?aBKeCY5TGO5oqfp7UHtTf2nUku8jLakKLHfGc4bMUQ3EqcVju8mxow7urSSY?=
 =?us-ascii?Q?x3A8sXx8uHox3Cq7WJRfsKGraVdCOVDab71q/YaPeg1fk48Mtn84lAX6fb6P?=
 =?us-ascii?Q?qFDAFRrl5QofUwukuweJRPSrXesA6pGFQKQ3VdPozLmcW7HfppdFw9WqZyTS?=
 =?us-ascii?Q?eixwtNv2P8TmtWuzNImnCV0vCquSeWXEm70t+wsXoXOrEti2kjvKcoqRwYDm?=
 =?us-ascii?Q?8sWG08gsEnabj/4hs+g29ZU4blxJ+M83XMhKFVLygpCzuCMaTtHGz4mEupnv?=
 =?us-ascii?Q?mRNZrbMH/fivehKModjTJP91lUtuo+Lnk8JI+FwOhBpY2kWBb0E/n2aE5766?=
 =?us-ascii?Q?O0cSbLevis+vFlR8dc9E9pZdD9tALKzU+TUo0kTd2+odM3vxLlbiNRkI5MpC?=
 =?us-ascii?Q?B1cSsSgplbkV92j4Old7u2w0cWQI3t2s+ug07/Przxp4rpGwWI1MkkpoqVIF?=
 =?us-ascii?Q?oU/c2ROy5RzeO/Mkb6dfSb+WpNm9CTMvcy2uiSoW46eOuCmW3jWcQpHVEBtm?=
 =?us-ascii?Q?eOkayrys8tFIR5Ee9ogRC3NUfC5y2PKut0a01Tg6DhCSU88exQ4iaOwcohPM?=
 =?us-ascii?Q?5UDHQOwQDzl4e9xOrlMuwQpS1rDhPlQUNZeuPDoOIciqieHwjTtUraGkDUW+?=
 =?us-ascii?Q?58TDuUGgYy2Xvp9Nqd5ah2963D1WHTmPVraqGX8Q0IFlXKNev/MsajoInlFO?=
 =?us-ascii?Q?DN4cUheNGR87ZNEkzhL7uNIFmYMWXMlhqPmgekjqvmL7hDTVno1eDJsHVD6s?=
 =?us-ascii?Q?s6DNix48bEfs+IJ+niINSdKGOaXo8/ldZxNVWQX+ofWyYlsbIh5zENCzmbVy?=
 =?us-ascii?Q?1w=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4001c9-3d22-42a6-66ab-08de0a17e3a8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB4927.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 05:18:05.7692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: di73qgEg1YyOA1O5+VYm+BLbl45QntDTG3U+QsSO7GDkV5dkmaCyGbWU4jIPZYjXSnVuP0vsYtdr3ubrxG/vK/j+g1C6wu2krtFZrl118DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7450
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_221810_627448_B14F59F8 
X-CRM114-Status: UNSURE (   8.30  )
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

Add SMMU nodes for Agilex5. This SMMU nodes is compatible with arm,smmu-v3.

Add IOMMU property to the supported nodes.
- nand-controller
- dma-controller 0 and dma-controller 1
- usb

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 04e99cd7e74b..a22cf6a211e2 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -272,6 +272,7 @@ nand: nand-controller@10b80000 {
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkmgr AGILEX5_NAND_NF_CLK>;
 			cdns,board-delay-ps = <4830>;
+			iommus = <&smmu 4>;
 			status = "disabled";
 		};
 
@@ -298,6 +299,7 @@ dmac0: dma-controller@10db0000 {
 			snps,block-size = <32767 32767 32767 32767>;
 			snps,priority = <0 1 2 3>;
 			snps,axi-max-burst-len = <8>;
+			iommus = <&smmu 8>;
 		};
 
 		dmac1: dma-controller@10dc0000 {
@@ -315,6 +317,7 @@ dmac1: dma-controller@10dc0000 {
 			snps,block-size = <32767 32767 32767 32767>;
 			snps,priority = <0 1 2 3>;
 			snps,axi-max-burst-len = <8>;
+			iommus = <&smmu 9>;
 		};
 
 		rst: rstmgr@10d11000 {
@@ -323,6 +326,18 @@ rst: rstmgr@10d11000 {
 			#reset-cells = <1>;
 		};
 
+		smmu: iommu@16000000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x16000000 0x30000>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror", "priq";
+			dma-coherent;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
 		spi0: spi@10da4000 {
 			compatible = "snps,dw-apb-ssi";
 			reg = <0x10da4000 0x1000>;
@@ -423,6 +438,7 @@ usb0: usb@10b00000 {
 			phy-names = "usb2-phy";
 			resets = <&rst USB0_RESET>, <&rst USB0_OCP_RESET>;
 			reset-names = "dwc2", "dwc2-ecc";
+			iommus = <&smmu 6>;
 			clocks = <&clkmgr AGILEX5_USB2OTG_HCLK>;
 			clock-names = "otg";
 			status = "disabled";
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
