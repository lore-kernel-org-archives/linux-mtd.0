Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27E2CCD18F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 01:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjQbcHLWpx1XS2TO6EEx5D3WTVrmygZI4/NlzI9lYmM=; b=onjmUoop7vJ/ME
	5qI6yIkxegXg8YAmLPN5x+UCfl5Ft2fTybxu7Vngxa27CwJ6xbum6tcZ/yFH6NEFIUX9MO+scz1rw
	ymJPyUk8oUfhGnoEdZO1ykAmFmzcW1hEc6V/uUqdarfNvEPU94R7RsMQK6iK4a/dsdWwFkZfWp8eY
	/ICNRCDqjVkO6pp3teDcUjcmfYxjOaBeSz1JULvoSeCL+ba3ZOab+zufjHxH0HGQjPxMCDTZe9xLr
	95c+rDQTwum5FmxG9Zi7BC14SjUbjCXmasvwG82c8+OnUGltv6m7gtqDDmPEULkdwxef7eVoAcNOu
	Kjf6FqH0vGimaKkMxVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8723-0000000C1wl-0lsg;
	Mon, 13 Oct 2025 01:07:23 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8720-0000000C1tn-3eAr
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 01:07:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOJ4a8nEe8jjFIdINl8Qxh6/HwHX9iSCDxYp8SxPr4HPCLHRF8aNWNBMLSQIPD0oaQv+X4RfJ0vfIEANYhPJHcecvUgqa3XATZz7Nqfl1hMam3ieNTdU/DUFs+l9CDzQ6/dp19szVjWlZpEM7Qcyw0RapbrW7Xoypoxr8GalMvNbyDvmBhjmz8RsSaDAZjucjOEOn2PDn8opef6A+h/y+hsN7VjjuRZ0HO2prH57T+pvGi+wRiL1a2Nv7ktK4/AK0e99v8DSKlSq0Snk18HnzEfWocRWUVRrfr0R1x549aygTZWhSoY3doyBSIitsOSZ5ut21PIz7YlefN+JqOth0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ueu16JvUyQ7A8UV8tRomyi7tiRmMi2XbhNn0FZw7idk=;
 b=COwFpK//ym5e53Ctt0FqQIr9m0fOD0D72CjHnnpLIz3OMw7kZzloxUjVW7F2M0c7YjXG6ADS2UaSLUYf+ZsC9zk356eej8vE9Fhlcxo+Mx3FNX6dJvFQQi3ACENBtwLyDOEspnNM1kE/hSH+AGjK6DSQGeLLRF3RMGPy2lM2BBbYMnAvnPxV+ruy2d45T+0tsmTXNsUgqT04UaAANZ4mOiiscyT54uS48UNbD4ctOrmX4OE89KSeok4a7B/YYGteH75QRrrYH+E3pP+sg9Qf91vRH9hwPBUDeOB/IsMpZp4FNQTCWY38gmJ8a9dX52Pz/Lrb3yrFDmFBmMYlfZ09NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ueu16JvUyQ7A8UV8tRomyi7tiRmMi2XbhNn0FZw7idk=;
 b=fpWnLBgTtA0E2WvZc3Lr6X2Y33sNBIbTCxaJix2k95E9yvTyzVmwXwiciixdkpw3G8JaBzkJ2XSyMSry0rU2N4fMxQwHNvJIxuPAno6PjvRnzrF86SzcaMtY6MXb9NIrJyzL0FUZKDknKrPh93UUGLWpHt8gwudm/g3T177GOzmxgDe6gE5nEgp9Dp5JYj9YAczRPUFv0TEHlQhc479kECdpFzAKEqCFC87tgJT8ux9drtPN6uwGG5Y+ESkUO8zmSic4roQAI829DAk89TP2eHYYTSfCIuaSWxnmB8tlIu1gsSNFWFsmioUXs4rDGjDZFab+uHBj2AuL0/2ggYe0RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 by SA2PR03MB5946.namprd03.prod.outlook.com (2603:10b6:806:111::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 01:07:15 +0000
Received: from MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419]) by MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 01:07:15 +0000
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
Subject: [PATCH 2/3] dt-bindings: dma: snps,dw-axi-dmac: Add iommu property
Date: Mon, 13 Oct 2025 09:06:54 +0800
Message-Id: <1907df9cd19df8307932898d1334fc882350a577.1760316996.git.khairul.anuar.romli@altera.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1760316996.git.khairul.anuar.romli@altera.com>
References: <cover.1760316996.git.khairul.anuar.romli@altera.com>
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To MN2PR03MB4927.namprd03.prod.outlook.com
 (2603:10b6:208:1a8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB4927:EE_|SA2PR03MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c7b0a3-fc94-4512-51e2-08de09f4d8fa
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p2AB2sAJFRgKuXQgfhyKraYdfsARWKqhrUyzNU9HzDMaDJHVhwC+j8gqanFJ?=
 =?us-ascii?Q?7lDkW3orlbmVUq8+rqXlIlmD0lKz/jTQszyebKTJEy4iyAIIlGYkHYrBpLYO?=
 =?us-ascii?Q?8ZmyE+gp5XRnu9qa8apfCrd2QF0pConocGMnQxpXrQWbFh6fhCep46jtRDZm?=
 =?us-ascii?Q?TPUfRrzgc3Atuo0y8Yz+8YEl/BujG1+O2DZDTQ63T7aS1ASTuTkcT/JLqr79?=
 =?us-ascii?Q?iq+GvXfmSrJ3T233bdFTxkLC86MEDykj9dxeoeOt2GAkbypJpTZ5yCCKKcWo?=
 =?us-ascii?Q?cUDJ5ezF6XPaFflWMZ/rI0v8t/J2dvbq2f5NWw+LRqZ2IcB5RgomyWnB0kDq?=
 =?us-ascii?Q?MdVdRPCnG3d6u1QLE4jEAH+Xcz0d3LaIAlGb7Sm3e8x8j3mz1k4wiEQzbret?=
 =?us-ascii?Q?rk+Du24D34hcLEWar6XX6FDKUB3kmQULnh2v9Ag7GG2c2ZYW7jPCY+S7vM0i?=
 =?us-ascii?Q?jZl74ttuW/NGTWVo0RAvHOGItlBD3SdORP37+CsSaCCJrc+yAbii5wLeyZKK?=
 =?us-ascii?Q?grqHtlsIBY4gwINy8vnnkhZoS2wqE8ooIN8WQzwuSQyF+0qqPTkgj9zwAPaA?=
 =?us-ascii?Q?A9RB25Z47mQg2E38dAV9PCqGTeb/hEEsrPuS5uvrTyT9N8BuPj1fbyV9tLnr?=
 =?us-ascii?Q?YGdK+J8qPyVAWcaSg3lmGbNPsDv49kq6ULBbosZ9WiRSU1X5+QALuWnuCaZW?=
 =?us-ascii?Q?MqUjPQGxKtMabxsaiLqjsAfHh0UAHFEwMkwzLvRzzyLSOm+1mZ592Qr/DSkA?=
 =?us-ascii?Q?AqOQCsaKSviitX9/VfaRc880xkWnag9CfVFNgDV6lKMg/8NfZ32KW7S8VIn/?=
 =?us-ascii?Q?a1IX918sAidQvnaKfVI8UUWg6+IqR7Mgay9tfgljyMfo22d+/TrEfyqAdmUY?=
 =?us-ascii?Q?BVjxh1sZFQgGnNUjeR1XUsoCP0xYWiZFuOUwiQMhuoySPlo4m45vRrNX5wbl?=
 =?us-ascii?Q?8nQKUlnoboXcFoUy4sT7bVAk1SahZyRn5VVbldch1V5KkwY1QzxsHbGIoewf?=
 =?us-ascii?Q?oga+FrHwdZGF+fZMy5Av3eC8rg3mKOIKA4Gy7YfgTwEDHjxWU8Jh4uncbXJS?=
 =?us-ascii?Q?tueLDCUDR4zQGLV8j8iuWSFf24d8+Z/7t3y7j/jer4CyaQ35PGNxeTL9Yvd6?=
 =?us-ascii?Q?L71nKW/OKY8JiD8CNJ83x/05icOvhFqaQVHIkcMVsjFOEv/O9WahmZnbzerp?=
 =?us-ascii?Q?fiB3OH3eIjJTO0zOm5o5g4uXQUZwXs+7H08DQSHaawDbFK8stQHP5vb0VaLw?=
 =?us-ascii?Q?1Wp3keVDhKBsaXYsFfUxFfrLrqdBfmLyc1MDenWfDom99xNJbSuKlK+y7uFx?=
 =?us-ascii?Q?vj/H/wJSHJDdvohNSDwSZ1lYTCof1dkXCEneiSm7zeDs7VBaoeo3Aw7sOymI?=
 =?us-ascii?Q?6jmq/FU1epj79+JxRE43SRjk71slPgoVISQtNxY+HcSlFu0zJmm5V+codAQ0?=
 =?us-ascii?Q?LbFDHwUiQkp9yXEUCogoZah5gmlWNi+PuBPgTyLS6cjQ1wthek3PdOUW/OJF?=
 =?us-ascii?Q?YA3iEksVprgdqIs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB4927.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D9kUjkMCrnK58QGQof8fURyh+iqkDzuBuKeucIDyXyxsU5B/pOE/rxciBGNp?=
 =?us-ascii?Q?Gm+sM3Y6l3YoXQHXd2sD5bYZRAng1iKqhsW8o5RNX3jNi/G3EMUg7ipD/oSo?=
 =?us-ascii?Q?GhU/uTd3mYkQMss0XdwtGQ++QC1PUFMAVR6iSfJVB4pjyst1jGfU4k//jOBz?=
 =?us-ascii?Q?mv7pZWXFtpQ0eLsg9K1XRoNdxOzgymZz8S47GxYz+6cDKr72tTUFe+lijqj6?=
 =?us-ascii?Q?fX/Rn8paNhSqHaYdwBuccG2z680Xao8sUKTVlXr0wefPtuNWBvF24OjjcT2G?=
 =?us-ascii?Q?/1IJ/cS5isOzejKAVtPETzd/CsZS1rvSl02RFNLjD2WpYqY3DMAfxLw24I6D?=
 =?us-ascii?Q?T8H1vELb1M/e0Fd2eygPRSAsUmZYspxP/9iQ8MScttu2RKSjLZwkV4YA4q77?=
 =?us-ascii?Q?5Zc+znqnFu1oiayAs/MDOu46BHynXeYxqVOafXWCW6ePLYQJFXEEf8HqiZZi?=
 =?us-ascii?Q?tCqc0/txaQfE7VZZVCzTwc8/CH4JjdbDKSWkO8YXtmlpS/r9/FwON8V6oRqp?=
 =?us-ascii?Q?cQTnnqF65egThvpGzXMjYCIKD1k28ArubDlUfTSOYs/23GPAjFLcufJhStPs?=
 =?us-ascii?Q?nnQlx7AkE8+1/rU1FFyJAR0td6I/YQD+n1jl3OnGZGgYT5Ih7jpVyP7kFJTc?=
 =?us-ascii?Q?8BLBQb2+Z0AZ+fsEcvXidywV3LQrIhfAyWW9BpiL+cqOZBbxE+H8Ohse57dF?=
 =?us-ascii?Q?iTpsa7jjo7U6zzd1Hqb9JDVSuxkbg/u0fyy7gq694ZcAyi/H7njLaRv4PXfg?=
 =?us-ascii?Q?Y1bP/IpR6fLjE/DXzLhGndati/kdxAvuP5lr76neHEfm0Knarr81+ihFsfSY?=
 =?us-ascii?Q?gu88xo1zsou1O4DzjVa5+dYviwvq9krj4xLvsuD1Xnh06mEnxQApb3Odr8BM?=
 =?us-ascii?Q?h7erzVS1JoZ2QOntzuCjY2xPpkYYYIkKvKFMyVS5Wuf9NgFAjhS0p3Es7p+S?=
 =?us-ascii?Q?eTBnTRGRwLHcbwvQwVF+NQE//NlNvS8SazonAvRxhTD0Ezt6CF/RQxXyVvXO?=
 =?us-ascii?Q?oGyZjJMUr8KL+L3qksQSiqzb+JjPxbENMGb+6tjGT3tN6jZjgSQPFv/Ryci6?=
 =?us-ascii?Q?JV1HTKKxJ0H/JeHa2GwWTMLsb2yxTDYqYjT6aDTxNA49gk8MzOoN4+FSDE5u?=
 =?us-ascii?Q?qv1DCnREd2r6xjuP7yd/RmgVX5AoHSWYPrqhGuR+SfEN3nGSIvDvuK4Z9ftq?=
 =?us-ascii?Q?HFM3Ke9GLQYxrb8BIQpyggSbD85+qi8aIaXcOpBTshzBpl4CZrpxhdTrfxIU?=
 =?us-ascii?Q?oz35MefOphmUfAj5OzyA1h65NqI0VLT+1HbHumN+GzZ2NNqmCzVJoC4FCgqH?=
 =?us-ascii?Q?fTmfKcVpgOBJVZVfkMWA0LRPCe4eBoMJI/OOFptnRmuL+UsyS4EVDhpmDOV2?=
 =?us-ascii?Q?LYldW6q6L9c4gmATacjtOvj1KqVzaAP+V8Wy6CJrsDKb7ayrhzuoRpSaVWxv?=
 =?us-ascii?Q?Cqlg1lVPRNmahtUJEF8ao7N9OPFtfKZZ1CzER2rWfXPqpxcj9kgbyXH5H7D9?=
 =?us-ascii?Q?rdNDkFsAsUQDd/g8S+L038nCdB4yj0LymrO5xyq6sZIHcZQfzhofUcmPaJ5H?=
 =?us-ascii?Q?39EwFmQ4exGWbfnSdezJ17039A2n4QtvtyZv4eNC3vi79nyK+pdHIqZKVSTN?=
 =?us-ascii?Q?Cg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c7b0a3-fc94-4512-51e2-08de09f4d8fa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB4927.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:07:15.3112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAtkyBRIakwlmnN6Rum6gQvSZ8VnIABAvw4cNDowj0TNB7GtFHlYqfQvEvQL7+3KW6/s0wW2OkmRWuB/v6/4XtzLOdAziGr0H84zzKrjFwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5946
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_180720_964317_D651B363 
X-CRM114-Status: UNSURE (   7.23  )
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

Add iommu as an optional property that can be added to the snps,dw-axi-dmac
compatible node.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 935735a59afd..a393a33c8908 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -42,6 +42,9 @@ properties:
     minItems: 1
     maxItems: 8
 
+  iommus:
+    maxItems: 1
+
   clocks:
     items:
       - description: Bus Clock
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
