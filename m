Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32728D1038C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Nov 2025 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Qvj/7UBFZFQoMmleywOdVUMWV6oRUfq2bRvLoJwJOM=; b=g3dmapQIIjw7ql
	1FpsQMeezjnZrpF5V9T1uNnA7N2CN/vUwqwoFdJxy1x6K4CU+OihpACVCjPtq312z6ZhmdaiMqqLY
	v6XNC/qTBORRnyKK0hzCOf7G7xC9X4X+GXgejwoLi/s4FzhCdCkHwRQkvtmFpSkMkJoamH+hArcYH
	Y997Hch/bP/2hRAcOiOg0Pza3bidvLiS9Boxb2WPaoKT7z5zUMQeso74hCY06WRMk9BclQpd+8Dy6
	IQeN8Ts/elsGNweUEXRB/r54gkjFaUJeQv+CnZhDnUTYn6ixplvVrkB8hfPr8wocw24YviW/qkA/I
	PRgKItRW3hFHgEQSoqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAYD-0000000EZYi-0qGt;
	Wed, 26 Nov 2025 08:06:57 +0000
Received: from mail-westus2azon11010007.outbound.protection.outlook.com ([52.101.46.7] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAYB-0000000EZXM-0grB
	for linux-mtd@lists.infradead.org;
	Wed, 26 Nov 2025 08:06:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+oGBhYoSOQHrnZh4THGruZzFyyLaYKD4FRXJbrTvIXXBqCo+/uHeFMJkBQQdPL6ozJyvv0qHVYcd08AraM7kpjU+HcQad0pYjBSfEeBuEaVf6rqm0+B4yrOUeRsYHaq2Yo3zCqoYIrnmATOmltx+JYH9MrkmceRxbZZmYNUvZ1N3Vey5LAp7AG+antPZfokWSofc+V4NXXtaDWmaJSe51n6nGCM5evf8tIcvcC2nHKeg/HEPHKA7SAvXow4eTHpe1pQopeFzAB9t3HNSDWSOHQF6B7sVdh9EQIQ5ogG0Jo/RQ0VG3ce9k8NgH+g1muz+t8Zv7GycfA1Mtz4rtnNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vlI5YqNHKd0caiGBZbrmZ2HeCX+dgPP1vQ160UNfJ8=;
 b=EAhjjdqsFniY12K2f47E1mv3PO5cEpG7BirXZ3jAGAYgEgRO6fAMbb3Oks1iAQcNlzbQ2/pUME/2AoymwqlCyek9VXuyl0m+v3RgUrhWLvczmk8GIxsO1kFmk+Ncv7a0+OhveJtrHhGyK1y8og3zAnwy+Yhn8N82IcZTvaz9sZBvTQnX57GUBAtVprMukiw+ntHj7aKhiOA2OtqrVHTQqtF0qFJ7fdtb+zCKaM0dlH9odVqtauqEl282/I/CteGCXfNmz+48ml5d8RZ9oeNKOyVzjS5wr1N2OjGW92Sf6IcVdTOaOaY3+L9ikGc1bfSAwAVMIZ5Av63WWkvCv+BV2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vlI5YqNHKd0caiGBZbrmZ2HeCX+dgPP1vQ160UNfJ8=;
 b=XhkV5307I+6h5LTuNphC9KHDu1WRiMP68S1lJCKKMG4Ee2uXfYm/EtkehcuZQJ4PUIhqSIQwbDFGA68zD8N8O/msgFXVE9MXI5A2zfBKzAzRPDuDs+pZuxoBzWsm129zu3PMxyhoaDfIGWtWl+JtOrQY2dFQ4lEEZ+yNzsLg66HEvV1MTjD/PJdtQcBYSPkIzpP2MgMq6ayRq20iO6n/ckX9gY/6pzVIMaHCSS87qZAnV3jWh2IZYm4y0lUU/U1KxHshVM1DCf2VCYIxKT3BvqgnykEtNjYGCJIyks3vua5jh0xvZalmd11Tx8XySVOYXoIp1hTD8WThObYFyXkTEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 by SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 08:06:50 +0000
Received: from MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419]) by MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 08:06:50 +0000
From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Subject: [PATCH 3/3] arm64: dts: socfpga: agilex5: Add dma-coherent property
Date: Wed, 26 Nov 2025 16:06:24 +0800
Message-ID: <4517536b397e5c63cac287174fad167a29b2173c.1764143105.git.khairul.anuar.romli@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1764143105.git.khairul.anuar.romli@altera.com>
References: <cover.1764143105.git.khairul.anuar.romli@altera.com>
X-ClientProxiedBy: SJ0PR05CA0202.namprd05.prod.outlook.com
 (2603:10b6:a03:330::27) To MN2PR03MB4927.namprd03.prod.outlook.com
 (2603:10b6:208:1a8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB4927:EE_|SJ0PR03MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d36bfa-ed75-4e47-0bb2-08de2cc2c08c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M7WjAS/F2CLBLctmdIF5GRZwhr8665zTUEMBYAV6+q6NXGtBMDyjxhl5YPZh?=
 =?us-ascii?Q?cBqsPQ5+DC0AMJ/hjENubVIJnjLe4HkRsXfU7nRlWiumorRoxjbQI82YkQWt?=
 =?us-ascii?Q?Kuz2K3KSQnlj5w6DgYnaGBjo0fBnkwRjgrZD2igDQMA+9Os/LDcOkAj9oZ1b?=
 =?us-ascii?Q?nxDvoVN7VhaNrlzMmlIWhd2PxRbHeYME3KOcKyIHplHb8SlIZnlBDfKMSGO7?=
 =?us-ascii?Q?X3E9EaiOkh/JWy6tX4zrIHPaHwc4n4hUftzfHmrluk3tr6Cd5s4yWRc1Qdsc?=
 =?us-ascii?Q?ljO08tTEX+BqJ+prW1/S73Vu7z4PIqbay4zYQeK+7momCKXovmpPvpsOGNaU?=
 =?us-ascii?Q?tdxhpPGsWBdluEIj4skKvFuiylhFK8nKjEknIDq4koy3o/R7PcSi9YmMoKQm?=
 =?us-ascii?Q?0llJxaZxRSPHchNT6Fqb3BHKNsmhMK8vYzCi24K+SXbUDy/AWiKqHkc+/5N3?=
 =?us-ascii?Q?KH9YbuCanQAxjTRlnTQorlRXWOa0IN2zKBYzACzNT8yN7f8fYNRH1bTgEJGr?=
 =?us-ascii?Q?fL5DMQmmfVjHKuYO7DqzWIKoOqJl08Z0b2IIUyTQY7ppdfkXlK5qxmkFIM6d?=
 =?us-ascii?Q?z+uGSpWAzW/AoAtUvsYh3iASgWOt4Ro7B5dXDAQtZ86V2BEOTBRQIw4O+itL?=
 =?us-ascii?Q?Ly/mOkEu+04hD7t57elsmL66UUCmUTejCA9nVL8jdPcads9kKmUva2JZCxAw?=
 =?us-ascii?Q?vT9wH/okf7K8CJ6CfQd3cjJLRck8lunw5zHRuGKJ0UroldGekvgqr9GSJgAS?=
 =?us-ascii?Q?1bpovSVb6811dDen/LrS+T5zrNuZbgpz+MEt7y9NV2fz2fOW9WPHo8n07A9G?=
 =?us-ascii?Q?uRK/h/2NmtEQJiBBM0j72pvbG8DWcxWJRJSOdJnV82k+2nOlzBn280/jUtg3?=
 =?us-ascii?Q?gV7Im6uESdVusjDiT+E4u7r8yoVoMURlLzySeaiABW3oHHwYQqUsrlG3HNdP?=
 =?us-ascii?Q?8Ay3qVb/aTbYEi1aa73YJAcuX8RuC7srZDiLq48M2XFvNM145mHQ2iVmNQSX?=
 =?us-ascii?Q?4IntziyGSZY08XkJqp8hXj8FXHpqqBWZKD4BI3gNsCY1sKDuuAeJMbZu8fNA?=
 =?us-ascii?Q?4MCgxfeKH9py2sEQMc8A35CRboh8RM0Y7y+AZa2JyV6nC8UHYN96Eot/y4e3?=
 =?us-ascii?Q?5ffkmOW3eN6nDii8zKyTBHEOGtwOgH4E/hAZixPKAsWSv0+y9Ehyh607bq07?=
 =?us-ascii?Q?iAFuypb4WEMavXRxEEI5hHzt0V1JdnL72QHA8kmx78Pst4gt2HbrkkQcmiZt?=
 =?us-ascii?Q?ZYmti+oG6Jsu/xg1K3LpOTz/DPhx+P9IO9y/C8jrhuCRnjMAegqzmrScescM?=
 =?us-ascii?Q?y3+WVjJFhdMJWIjumJOrQjZ9g2X91Ag89oGDtlreIAarHSt47CiKANPe1zpb?=
 =?us-ascii?Q?p+SDiJCC0mhjvdnHonzb4dRCVQa8sNA8dWWk0Im6jJeIx3XlEyyrVAiLOSIQ?=
 =?us-ascii?Q?oCQC/K/72nKXNyWvzzsLMnQ1qDmsheU/U1rM2rm+UO/4MKRq5md9YI88aCqh?=
 =?us-ascii?Q?qeydwG13duf1jws=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB4927.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uZw4tKijFNMHORYEARoslQ6xQMiEH7syBy06pvvS3yZBxsEjicR9mqx3AGO7?=
 =?us-ascii?Q?nExt16J9Iz0V2qcVQ2VWPAI4mi1Zm6Tcy1nJ4DPXLIyu4QErAZ5BrSUZbOdR?=
 =?us-ascii?Q?yGnOOsyRvPnKlL74UI+UhpedC33rvTWn3MZDZP8ppQpRzyGWlwC276qhRzWV?=
 =?us-ascii?Q?rm+F60cK/oeSUXmj4sfLIBFqnOuZtbHX6YXBHMhQBi71uA4lx/QT0AJhN1ht?=
 =?us-ascii?Q?sv3vV3OkHnNIjftYjr27/mCCrrZMuxe+zel4jsuX5BZaeFF/3YdCCNs/lZs/?=
 =?us-ascii?Q?Va4qcYtV7qIKhTw0cL/p67IsCP9xcKErhAeoy7dgjp9n0YLz3a34LHJt+wv5?=
 =?us-ascii?Q?c6vbKxS1zjeXmhGErBxW/Ta15E/iElS4V0pLYgkSKy1hoXHfyg0atXNqPIXk?=
 =?us-ascii?Q?q5wRUfmObtah9LLrWB6yRCDRrReiwxzhknkVgj/sk+270S18QVtseeB5LJuV?=
 =?us-ascii?Q?l71aLzsTuAC2R0VLQyjUTFGhEPaDZciBDJA8qJ8oHAEPvnlCsOf46347YsGa?=
 =?us-ascii?Q?rwH+2PMgMKcEg10PA1tVl7SKtEFs/W/tFj7uG5iLUHR6lcPM5fqe/nOa2UdV?=
 =?us-ascii?Q?aKruL86tX/mpbITimbH/3MJdgy4JQfSUlhFi2JLcN/wKFeERJNL4Old0723n?=
 =?us-ascii?Q?0nEyj8XUgf8qzbyPk+fxHkeRxuDQbpT4SaOmGA4mCmYBgQTMBUWwAzK5na5B?=
 =?us-ascii?Q?m53TnAEyxSW/MmZzmXUSWokC1xHaB4mOZdnkGih7nEnn58mBtSJbhpMrowiD?=
 =?us-ascii?Q?X1945QDjr/E3omqvzYap9gH2FrB+SKfugpjLrPS2T6aUiDxUmI4+TwR5fwMk?=
 =?us-ascii?Q?Kj2cg8i9Aa9FJha372Go7oJUxtx9D1SMgda0oEQyio67vFcep4Wjo1NgQB+t?=
 =?us-ascii?Q?3QpDQhyYp+ZdNQaeUWALaYWculZ8SgwE5Pgmt2CIKZkX+agNPy82chcKPfWl?=
 =?us-ascii?Q?Ovh4VmvxEYXFlGXh7YVKP+0XC1s0kWw6gKu/6YPjUWz/XyEeQCPULOv72HGu?=
 =?us-ascii?Q?2fUeS5tFGu9YSJpG1IzPfpzTKA9pQOp2/zdHd/JPZ17Xe4e0ZQYRkVKu5Qlg?=
 =?us-ascii?Q?Sut59cdGC+cFG/Q3ez/BUlkvZ7Rmwe2/MLvH1YjUIcXJxAQ5BovV6KTLYZqY?=
 =?us-ascii?Q?+5YSpejVjeoa8S2onxZGBM3BYmOYoE55lNA4WwLJ8PDem6kQsfpqEj9Yjq0F?=
 =?us-ascii?Q?ApAiS3lA8DjMvnDuq7k3V2QBgx8tp9VvE+XRceanZqs6nX2vQz38KYcZp/8y?=
 =?us-ascii?Q?6mYkdj4RQzMa/Z7xEGf4aIeUjf/7Z15cpZwTxc/56OB7mRvCQ+sN0yPNd6RY?=
 =?us-ascii?Q?E836hHj20g7d8ADMjqhatlKTrMIcOlHggKDYeMacqPbcOHf+wuDPG0mq8ipQ?=
 =?us-ascii?Q?9HTFxqMRdkrhuQONZNcEi93SMvffhNFGSez8NCGqEf6TxXjC/ThtGrK/ug3I?=
 =?us-ascii?Q?OV8S75yg+ikZ5GYlFcO/jkaPUf2dtnpJYYuBz1nWvee9obIUuygjV0qAzsLd?=
 =?us-ascii?Q?/VxC52ETXR5CoZDAelos7NYFJ+5WnwBC08anJ57heMHti8fVkBaz23KrPJ9U?=
 =?us-ascii?Q?8F8IDLhrK2Hfjjzq9KIdvy+ceh05CSdbO3J9WFxytWUKyyArJdr3Wl29lxDN?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d36bfa-ed75-4e47-0bb2-08de2cc2c08c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB4927.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:06:50.1876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7yJyB9yUjPWAPhXDX/BJg7mDSibQVATWpmwAB/KW5Cd3u6VWzWsrSdj7ke1DYWPYJGyTb2fsA8vtZwjuAYIBtctp/sBWUv0b779fCQFOAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_000655_218521_B58DA433 
X-CRM114-Status: UNSURE (   9.70  )
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

Add the `dma-coherent` property to these device nodes to inform the
kernel and DMA subsystem that the devices support hardware-managed
cache coherence.

Changes:
 - Add `dma-coherent` to `cdns,hp-nfc`
 - Add `dma-coherent` to both `snps,axi-dma-1.01a` instances
   (dmac0, dmac1)

This aligns the Agilex5 device tree with the coherent DMA-capable
devices accordingly.

Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 1f5d560f97b2..d6a2fe445fa6 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -324,6 +324,7 @@ nand: nand-controller@10b80000 {
 			clock-names = "nf_clk";
 			cdns,board-delay-ps = <4830>;
 			iommus = <&smmu 4>;
+			dma-coherent;
 			status = "disabled";
 		};
 
@@ -351,6 +352,7 @@ dmac0: dma-controller@10db0000 {
 			snps,priority = <0 1 2 3>;
 			snps,axi-max-burst-len = <8>;
 			iommus = <&smmu 8>;
+			dma-coherent;
 		};
 
 		dmac1: dma-controller@10dc0000 {
@@ -369,6 +371,7 @@ dmac1: dma-controller@10dc0000 {
 			snps,priority = <0 1 2 3>;
 			snps,axi-max-burst-len = <8>;
 			iommus = <&smmu 9>;
+			dma-coherent;
 		};
 
 		rst: rstmgr@10d11000 {
-- 
2.43.7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
