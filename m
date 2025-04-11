Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85488C369A2
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Apr 2025 20:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=04FricyDKSUj7oC6QD2yphfmRYjQexC0WR0rKJzCcFg=; b=JqL7K9NpZjeSgL
	NF8EGcup1mk8GLfMGzZD12a9Kdf7+0V7KJNQiMvVOUWkDYFx/2GV1kt3kZ9FzjGDXiuUl9za4IGdT
	j8xXsdk5f7UO8SP/hYJ814hEqjmirNmAl1p8fCx3Ce9OCGSBeS5byuEoUOQZJhwgALpIusTV6A7I4
	MlKBTMHB3DTQ2ljrKkd0BPJJffx3bzqwHUy6B9lESqNZMu/fIIwue4Qr22YQtpLtm6ADo17OggTLa
	S9S2uPRanv2tBrMjsBm09AqLdkTCw/evcvVTRbqczWv4PofmjkXXkE1fS4h0evq5fjhMdTAzDmfMQ
	ixHe+Ur+w+Z0PYO+iclA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Kgp-0000000EmjG-1KQg;
	Fri, 11 Apr 2025 20:09:27 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Kgm-0000000Emin-2J5h
	for linux-mtd@lists.infradead.org;
	Fri, 11 Apr 2025 20:09:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVFuuk8mWuNINi1Lk35jLQI4xk7LBBUazhtPdExUNzbb3kGZbcdrm3ONLCSPY7hBu0wCfCmjBAh7iNQ64UhoqordBcXNOtleopNaBod94ty6aPduYvwvydD4OcWQlAJCynouqLsFn6rjW3kMpMoEUmiidOE8Yc+uiqgAPg63KxFG32VT2skmgXV55ZzdrU3YWU/OvTUy3SkbC4al1uaDRZ2YvzxxGzDB2NP8tHVUcox+2TklgG/L7E14PHfRaObeCZwnlc60EVCwMi534ZQdN3CrCWKKDHotK4xMzNabcu9VUwc6mX+B0J5nCKqPNqK9ar6kwvb8DVFrvSX/KgNK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7g/IZ8frgnKkeAnyvygKxshp2ICmyVxWQWJz8F7Yqg=;
 b=VoDU2Ab3Nxs9Bt3pSEWfo3EWCHJWfHJZaxqlibVAXrKIT/EJzRpVy/aItgO026KA9l66Ebqc+i1FP6k/z6P179TZHkwE7xgi6eKPM9qSScfVBjCrVJLLXn8UoylksJS+is+ZWqVJ6K3q3JON+E6YzEhTETeDsY1IbgAovgFHCJORAAWNtuNWNVU191KTtef6PMVXUswkfG23F692jQwrRmkgkot8L3yyRcckleEayGGSQON7rMjVhvlZvLDXzv5tk8vow4StMuWc2SYlyRBEptMytE8LF4rsARXXH+xiLoRzuMOXXayS3b52izPFVTxMCuVGHhZcgXaGYMOQx+ctmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7g/IZ8frgnKkeAnyvygKxshp2ICmyVxWQWJz8F7Yqg=;
 b=eM3oApI0QryXHS4gXQcvKVXE+CTaRkJ/8Xextb6188X+RRRJjEOEwy6895WnRoJsawD7iSvy64kNa3Xg7TW+2KJEKDInpU3szRCTvN95Mndmy60kA6I/iHehR7H+ytXANGX9+Os5sEep9tmRVvZ7fkY5qWdhRsBtilXLo/8HCt8Fajo/zf8/G1mtyh3DT2pQsSp8vaJc3q0db0FD/zuYbFFuGnrijCkYvAitZPME/O1J0j88Q2mAZUPIMLy7bdlw1MvliOsZn9ig4CFU2PFEEiNXWs/YYoouLPS5hcp3iHkXV8/xGRiXqx7tDFZrcLT4O/Txc596soSKFAyaa2K6oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7633.eurprd04.prod.outlook.com (2603:10a6:20b:2d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 20:09:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 20:09:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org
Cc: Frank.Li@nxp.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	krzk+dt@kernel.org,
	linux-mtd@lists.infradead.org,
	masahiroy@kernel.org,
	miquel.raynal@bootlin.com,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	richard@nod.at,
	vigneshr@ti.com
Subject: [PATCH v2 1/1] dt-bindings: mtd: convert vf610-nfc to yaml format
Date: Fri, 11 Apr 2025 16:08:58 -0400
Message-Id: <20250411200858.3266447-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2f348d-3623-47f0-b899-08dd7934bcd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eGHUaUhpE1/aO/rk0dLm2nWifLVQplM1k1q37dV4mRel84TwbCxS8uujE3ya?=
 =?us-ascii?Q?+fmub6JwBmWK41FbA7dBV8jWcEpzkPGKWhe0r/GYy9fHmamdHuNt2GEBmQyB?=
 =?us-ascii?Q?550ytCkszNlUd2jyZSOlfHXUoEgrd67lxIF5iLREuOH7DQwGMIHXobdrAaOa?=
 =?us-ascii?Q?4qRrnc1A7OJAA5Z52+p5siKTc9C8+tAjkujaXnJIEmK3DOSdw5xARtFFs1+5?=
 =?us-ascii?Q?o8H+7OCwhy9TaDzjuBi9FEnRyPSK4Y7cloVqC/kwhptHzAt3+L4btKTfEbNB?=
 =?us-ascii?Q?Em02NSClv/+nMU9rDKUUiktSCNsS7HEJJakccBPGO8GlP6iT1KYehC5PcoxX?=
 =?us-ascii?Q?bX/8jojm8OiZmBjEtmbdyVV79aE2TMi+r/h/k+h99e4WJ3qUPVz5vbhTSMge?=
 =?us-ascii?Q?jqEPhcelMj1/VVYV/H5C56KSihyWvYwZ6TWVc4moUSxeOolJFkaR5rJhjPuG?=
 =?us-ascii?Q?nnNYUizCtmBvzWEj1xC8jLZVTQxKKJCOVpRXslJlrbDJa/jY1AdIQMwm0H35?=
 =?us-ascii?Q?3l1BtipvpvDd3Tm9i3IYaXxRb7QQzTqUB/gawHF8gKZ2KruahdphqoJtWlw/?=
 =?us-ascii?Q?wZDvwC6FeTF1EaOSf19edzCegYHvWFRY9+IQejqeKNBV4Djz3SWTFWWTuabi?=
 =?us-ascii?Q?3OfgydARvY3UFPr7Z58PIA1k++V1HqykqBf6qdq9NSIcxxBan/vtk1W2bgTJ?=
 =?us-ascii?Q?EoEmMdZzhYS07Wmka990yjzK8fXA2JQofS6NH67RBVOkRbUA6mMfZx/rqhIY?=
 =?us-ascii?Q?VC4w884zCYfXdlY6k7ejPOn+XhXzui3VeyCHgjE/ll7nIhuYO243NzZUYyQt?=
 =?us-ascii?Q?otTY/bt4RZlshonb63ui8r1W7AJvf36awJkXOJ//lQdLl0WJJzT+PjX+xZJT?=
 =?us-ascii?Q?7dz4ugqzXJa/5y0zA7M4KeuGyZAB8s3v4bR91fCqtN+x2upy203rnlOL8S52?=
 =?us-ascii?Q?uqsQG76Yx3f5S25CD6aIDe/RDiaSxeZYGwnFnZKpHiSWGofWqbC9M7ZK6rYO?=
 =?us-ascii?Q?WaweOxFjxX+F+hIpmPeXYsSqbm8PtL7owF0mOl3bL6gt/l64KHcLXHzYl5P2?=
 =?us-ascii?Q?BnqV8cFIxKrv5M067rpfGwLtVqZThGPUTxkfIJ1sDhOW9l1/BhjA/hsow0bf?=
 =?us-ascii?Q?uyiwgrDa26jyZJEipRA2/1hiewJxy7IQcn6rSScE4PXxfu5O52z2Cpfn6BUB?=
 =?us-ascii?Q?Mx/Dd7R2WX0ZdwAnLSEVmVWC7avK60ifEZvGqZTefvKAllhvdC1k5Nr7G2Cb?=
 =?us-ascii?Q?xQYaMJS/RMp9XU2sfTq0F50Ds+uPl8dIqyiFJOQnHKI1cCKw1wt9lIsTZtkD?=
 =?us-ascii?Q?u93XbiqLVWqOWKV72y9RlD6pqffcajZIwdW+CJR27SP5OogxiTnF4IijtghB?=
 =?us-ascii?Q?yDPwL2XLnxcNr03535Ggs0l+fFyyk+24pshwo/+S4uo9HurC/U3QwLiBsRpT?=
 =?us-ascii?Q?piAh9CHaPyU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KdkzUX4zZVp/4QxOVQ4uYaCVwknfEVq44w1us8uQ6QDV0iD3h1Jvm5q/GPTP?=
 =?us-ascii?Q?vnnjYKbCz2Jw8YQWJ1DcV33SUhRh3LLLPNCBBJmdognKpT85s6OsSescgEmr?=
 =?us-ascii?Q?0tvmqb0bYsXi8Ph1cA4vwdPq4DozgBWLHr46AHFV1gspvqSPZHPbqItlGkl/?=
 =?us-ascii?Q?aHZj9hSq1/e/89JTGqmLdUWDR/MfWRyWFozvL3bGhEpiKalm4C4LXiKbtvpQ?=
 =?us-ascii?Q?5nVUEs8q7NRUvbTAt3+V1EK+NlZVRmsu0HTdUJRBdUth0tOlHF/9krm6jhjm?=
 =?us-ascii?Q?b/+ZNp0s9ggijB29tHrmjfJHOJct18jard3FfBmuGPFL0dq4jLaHofCd6UfF?=
 =?us-ascii?Q?cUXJMTAIbHIFWtL5MXvz9ocDSKkNCT4bgFJK0Ln7IxtD+GtTWL5wk5Fx9gaJ?=
 =?us-ascii?Q?aOLlPDBTx8Q6ty69ytEgE2m+d8k83w4dn3EWD7zDonsQ1jp5Ge1kbrtsxduC?=
 =?us-ascii?Q?L6qWnYsFgUoRkV04MZEM5UuK0wV1st0Mn96Xh/wR2JOrGGqMWovvC9lgVljw?=
 =?us-ascii?Q?B0BfReOjPPWp5Qs01LIJUELv+39qV287vEmp+TeXZaNVsIQbVdBQREWWGNgf?=
 =?us-ascii?Q?JPPcquzFY6AZgRfA8CPfROHW2r/TXHJJ1XT9qw67bcm8IyKbdn5CCommgHue?=
 =?us-ascii?Q?Zbz39MyMevFNpktn9Z2l+4zn48F6lYzGrTcyIvJ6Z7zZN7WlrcJ0fwUih9DF?=
 =?us-ascii?Q?4GxStBN8SPea0q/4Ey7v9ApcnXowFo8RV2J63fs2qRHrzV5gzhCQ2r2YFWwq?=
 =?us-ascii?Q?CVybVNh9AB4Y7ZNNAf+iBE8jyhIYWUHQbGnLp0dkrmu3sesC1pvXXFP1M94s?=
 =?us-ascii?Q?CjU55VolDNvqLBid/y2FqdW1UAXFXLbiwvKH5QVLZ+182ysSqUutnneV0KJ2?=
 =?us-ascii?Q?72d+yvtLkYSSK41GxPBaTBDAmjMT4sv0tlXDBM+Ehicw4h00XlWCX+qp1+z0?=
 =?us-ascii?Q?8QUcoRATVfpqf4oy9D/updLTVIayphT4LOmg0dJOVgyeb8yxpqzbHsRTfKmx?=
 =?us-ascii?Q?GsWXjk3H7doz7oUsY/UeDlok0bHRyDvzmQEyQitIWnSLg0r9GuQVA8w+OFzQ?=
 =?us-ascii?Q?bxAJ5o1OUMiyHCHVeU1cYHCa6Kq+k9flwsO2GTL1eiKyHizch8mitoOwwoCs?=
 =?us-ascii?Q?GAHGslMF4HS1FJ9ztm5ETD4ZLi5+szKAugEpgmfIXLLoWPaRt4u34uv7nPA1?=
 =?us-ascii?Q?OWSU0AkyeVd+L4kS/+vX7faJAt8CQX6/H91KTGEFVCE4qyZzwxNvPgV/xIqM?=
 =?us-ascii?Q?XPzmEgSOxmzo0mcshyd4ewAbfPBF4upgrYaj1p8/o6TnN5NowuLTkEhVoFw4?=
 =?us-ascii?Q?55qQ/azf4a6oX4j7rHupH01jfQ1D/DG//THgVTvrtGLJroPTYcUkWg3yg2a2?=
 =?us-ascii?Q?1dzpCgnTo0uALTA8qGXTxM1DGY8qk/x1dYz8e7oDXYNkGX3GPjyHN/ZCwPWd?=
 =?us-ascii?Q?ZZglEm3GZZ475f0TQsD/gMKdEtvJM8fiolE7SD1H2/D1MbNmRdvrv95PK/lw?=
 =?us-ascii?Q?Hha/4mJVTqbHTJiZLh0VQdP0KVv8kO7X02zo3HDbn0+rcOatqznY4yWHJvOe?=
 =?us-ascii?Q?RJE2vQOr5sGmcXTZrr0/Dzj4vF7dcgGXAr3Fqwzv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2f348d-3623-47f0-b899-08dd7934bcd3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 20:09:17.2167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VskcPikWMHejJMwkuQjcUsABi9kLTYB/yENPfN8FUChJi7BavJtMSbXe4lLK0WNU8kF9uu7Ofb+ufmTSxYg6Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_130924_615234_71C96700 
X-CRM114-Status: GOOD (  17.71  )
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

Convert binding doc vf610-nfc to yaml format.

Additional changes:
- ref to nand-controller.yaml.
- include arm-gic.h and vf610-clock.h in examples.
- add clocks and clock-names description.
- remove #address-cells, #size-cells assigned-clocks and
assigned-clock-rates.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- add blank line
- remove accident change makefile
- correct head file name in commit message
---
 .../bindings/mtd/fsl,vf610-nfc.yaml           | 89 +++++++++++++++++++
 .../devicetree/bindings/mtd/vf610-nfc.txt     | 59 ------------
 2 files changed, 89 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/vf610-nfc.txt

diff --git a/Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml b/Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml
new file mode 100644
index 0000000000000..480a5c87859d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale's NAND flash controller (NFC)
+
+description:
+  This variant of the Freescale NAND flash controller (NFC) can be found on
+  Vybrid (vf610), MPC5125, MCF54418 and Kinetis K70.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,vf610-nfc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: nfc
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    $ref: raw-nand-chip.yaml
+
+    properties:
+      compatible:
+        const: fsl,vf610-nfc-nandcs
+
+      reg:
+        const: 0
+
+      nand-ecc-strength:
+        enum: [24, 32]
+
+      nand-ecc-step-size:
+        const: 2048
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - $ref: nand-controller.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/vf610-clock.h>
+
+    nand-controller@400e0000 {
+        compatible = "fsl,vf610-nfc";
+        reg = <0x400e0000 0x4000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks VF610_CLK_NFC>;
+        clock-names = "nfc";
+        assigned-clocks = <&clks VF610_CLK_NFC>;
+        assigned-clock-rates = <33000000>;
+
+        nand@0 {
+            compatible = "fsl,vf610-nfc-nandcs";
+            reg = <0>;
+            nand-bus-width = <8>;
+            nand-ecc-mode = "hw";
+            nand-ecc-strength = <32>;
+            nand-ecc-step-size = <2048>;
+            nand-on-flash-bbt;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
deleted file mode 100644
index 7db5e6e609df6..0000000000000
--- a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-Freescale's NAND flash controller (NFC)
-
-This variant of the Freescale NAND flash controller (NFC) can be found on
-Vybrid (vf610), MPC5125, MCF54418 and Kinetis K70.
-
-Required properties:
-- compatible: Should be set to "fsl,vf610-nfc".
-- reg: address range of the NFC.
-- interrupts: interrupt of the NFC.
-- #address-cells: shall be set to 1. Encode the nand CS.
-- #size-cells : shall be set to 0.
-- assigned-clocks: main clock from the SoC, for Vybrid <&clks VF610_CLK_NFC>;
-- assigned-clock-rates: The NAND bus timing is derived from this clock
-    rate and should not exceed maximum timing for any NAND memory chip
-    in a board stuffing. Typical NAND memory timings derived from this
-    clock are found in the SoC hardware reference manual. Furthermore,
-    there might be restrictions on maximum rates when using hardware ECC.
-
-- #address-cells, #size-cells : Must be present if the device has sub-nodes
-  representing partitions.
-
-Required children nodes:
-Children nodes represent the available nand chips. Currently the driver can
-only handle one NAND chip.
-
-Required properties:
-- compatible: Should be set to "fsl,vf610-nfc-cs".
-- nand-bus-width: see nand-controller.yaml
-- nand-ecc-mode: see nand-controller.yaml
-
-Required properties for hardware ECC:
-- nand-ecc-strength: supported strengths are 24 and 32 bit (see nand-controller.yaml)
-- nand-ecc-step-size: step size equals page size, currently only 2k pages are
-    supported
-- nand-on-flash-bbt: see nand-controller.yaml
-
-Example:
-
-	nfc: nand@400e0000 {
-		compatible = "fsl,vf610-nfc";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x400e0000 0x4000>;
-		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clks VF610_CLK_NFC>;
-		clock-names = "nfc";
-		assigned-clocks = <&clks VF610_CLK_NFC>;
-		assigned-clock-rates = <33000000>;
-
-		nand@0 {
-			compatible = "fsl,vf610-nfc-nandcs";
-			reg = <0>;
-			nand-bus-width = <8>;
-			nand-ecc-mode = "hw";
-			nand-ecc-strength = <32>;
-			nand-ecc-step-size = <2048>;
-			nand-on-flash-bbt;
-		};
-	};
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
