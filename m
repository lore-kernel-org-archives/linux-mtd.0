Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4576DC3601E
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Apr 2025 21:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zP0hpkwyUyT4qnMPa2bFlggxYPbPaVxk4/Cbf7n+Cig=; b=uQ5LeYP6Ii5oLm
	WbuoXU37Sc/pNs5yj55Oujn1xvlLwIYlJFjXVhRb0L2O+m2ZbRjaIjxXZo8zroytP+gRpgk1Wo2Fw
	A0Oimpz5rYu5kfAu078PMvDqrhgp7tZDqh7sKfuiPfKhLI2+T3qqQVGWb+T7VzvIHh0HxSMdRVYLt
	jJfWoi+aYWhZNlzC6pm/w0IRL9J08vj4uhezMdIv0LLMqWZnreIUujMDtfpEubw0fBy0xjrJggo8k
	+DeSNr1HbglQCsDJjIgwiFajAU/axMIN1EhS2Ud/Faz+BdjLC38Q4gcNDZPmbRIutXLilU0m50wpw
	vqndn4HhwvEc4mZbxp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2z4f-0000000BrwF-1Z7X;
	Thu, 10 Apr 2025 21:04:37 +0000
Received: from mail-vi1eur05on20613.outbound.protection.outlook.com ([2a01:111:f403:2613::613] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2z4c-0000000BrvX-30VI
	for linux-mtd@lists.infradead.org;
	Thu, 10 Apr 2025 21:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C50J4TpNaOAX/hDKtCbAvQYmv/eoac6Pj7Y/SkHblpGFZ060sYbeslmD6WfI301OJ96yDOurr+VEu3KLTerGSUQxP5WbnpEvy+1JPDQc5QIYA5szaF2IfCPEtm5ABfwDYnDGC5KLksnRsZsbwFO6vVoFhbdkKTmyoIsZcrLq7nELht3NfTkI1bCcdPhBAJjNYAkUQ/T7lzaQTSpsfHa+DaIZMQvilBL9/BGSggmfU4rr/iI+IT4g/rRI+5RUGENCuV+e9s6SBWSNHTHVn+Sq2+NScwVHr8Xe5Sk4Z+Yw3Fwg2rxaSDYydDpzyhaFPx7AsH+dIUlDSemMfUHQgOzM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=By8w/ai1jGePB47S2IF7IJKaCOdzR4Sjs0qXG8yPSz4=;
 b=iM2yoH2ESFK6vH34VIjfhLi/hDIfvxda47694ZUH0oMw6Hh+a9QcfFenaEcVbkJjhQVIjdWo0tyQZNYmP2g3Es0CRrPfUf0Dtw3aNSm4czx74HJGUwC+f+5EadTQPMJ04ILd30WyMUQH+hNbZu2E2BQnyy1RaDdwOQePiYzr4fBn0o4kFi4fFE6bzPc2f+h9YlhcghVhdHQeVUjuTMkrJq8sE+zy55MD4diD9+ca2jOtrt9eBv1HqolljN0izrK2P6Nne/2pLUFjS5NoGIerAtvUIDhiXcxrvONvW3v4EuFKVZf17wbQVy1Rns8xh10r3okfCvEvW/MPTY+SRL7Wpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=By8w/ai1jGePB47S2IF7IJKaCOdzR4Sjs0qXG8yPSz4=;
 b=bfYNA6SxIg4aa5AbhJCPqlxpgEZScnSmDR1HnWZOlLjNIgvmvjDRDilSMJeHEzaH9Fly2dllfjEAlLVIbr1Yg3v+dyCPBNZOxhCzhJiMu264KN3PrcK1/EzfzfAwHODBMJL/BME6KOBGOIIA7O6Easnd4gkZ+s5EQG87VGSr8hY+T2DjaHbEo3taLa5WRNgEQxPtWwqMOtLkmL65QzMILceNoBuvbyPn8/DkOfnXHr40gzy7+qyIfxL4BghdvZY0WjS8iI+w6NZqCxIcH2TEmtrEDFI4iY1ZH5XYDgaYwphvcIF9fFXmixcg+j9JsoRlENyfNYFL6t7hi9uEvrXTow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10894.eurprd04.prod.outlook.com (2603:10a6:150:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Thu, 10 Apr
 2025 21:04:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 21:04:25 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: mtd: convert vf610-nfc to yaml format
Date: Thu, 10 Apr 2025 17:04:09 -0400
Message-Id: <20250410210409.3234260-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10894:EE_
X-MS-Office365-Filtering-Correlation-Id: cce58e19-8b07-4bdf-c5a8-08dd7873461a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kUXJvggQilmp/0xSppKnSedJUotJrU1jNxtWYM4avO5Kd/JX3GH/mhhVlTWN?=
 =?us-ascii?Q?lqa71KMzzpjsS6i81ANTFV0ETyYdnd0iN/B2Ft2Ff4HQwCJF9f3OjG//WFS5?=
 =?us-ascii?Q?m15mAwfXFLtduR4L/viuO3QJX0445FMrssaVfhR55kiduwY0XJEsyVj2If0S?=
 =?us-ascii?Q?lEChkOwuHyr0lpIko0BUOJgkkyraqCfM3ajsIeCK0+8YSKWJU8x3sEHY6Et9?=
 =?us-ascii?Q?nfSqJR9C2StVJ1TAU8+nOknMA9iOcsCNyZFh15T3woqS1gjyt1tP8Yfd4ldA?=
 =?us-ascii?Q?DINX0DQKW7cwn1/hWbhSBHFciiKnMuqtSkV9VVeRSWM1EayrK6Qli8Z0azeD?=
 =?us-ascii?Q?BnZICrU9Dvxdekvi9cYWVFTy9JaVPzA5a7Wa6xCoLGtZJYe4CTQ6bkUDEPwc?=
 =?us-ascii?Q?brDS8UHJikx9nRQqluLHwVnVGGSe4QYw3eEKhicneup71TWpri9xDxXUpkkK?=
 =?us-ascii?Q?X2E8e/r76rw87QX/xskIhKMXZ1uId31gfxC6aR5vilgCq0KhsPbj7yDInKFd?=
 =?us-ascii?Q?JO+hscvNDeFEVtQqdRTf7uZAIggde4xn6peR4Xyh+fYqz86MNK34XqcSLjNm?=
 =?us-ascii?Q?ybFy3VohYYxryz3M5hXxC6/vEqLjEbeIYfsGA8xexmUe+uFTwYr4GoepAHu/?=
 =?us-ascii?Q?8n7UoX/NKWZOy2hpp+8jaq6J1+nJRhmVGh+h9KeK3tDbWZ+XJHQPRTmi/kHx?=
 =?us-ascii?Q?oxjV21LrGJF2ly9ncnR/rMG62AeKBQ4D+1pCkiCp0VlC09CCFwON54fsIYNG?=
 =?us-ascii?Q?XhGWq+46Vh/BlwHtKiMOsLmO7w5Z0zcVsVmvqEiJgjvKglGPctBFRLTV+KM3?=
 =?us-ascii?Q?zyndRvS82kXlAb5xF2KP6w+Ul6qXyWpdPQGaI6IsKfIvq0j3HfMJe63Txv3j?=
 =?us-ascii?Q?D3najJllRcS5lhKenX4n8bQh0FrytjmVDQpk+jTVtVtdenTm66mQOLil7Sz7?=
 =?us-ascii?Q?jHVoBh53NNjjI5vy5iA++BPfIU2+4kaSDDWb+kRKk1ZDPDpdAltnPpoUS8ZW?=
 =?us-ascii?Q?V76pMcQxclevQulE7XMjlx+zzP+mcZfvEc8qDCUEb6yhc+D7gBwdLf5VBu9k?=
 =?us-ascii?Q?d4Ox/m/YUzx9nwNPHkC6i1mUPH3DpSaUVT6BfSnoTm80sZjMTJldU71RsF1+?=
 =?us-ascii?Q?zhc8hH8iowsWlUjPVFO8UuK5zcdZ6FJp7Rd+EDhcRXETp8ENrEr1lDlbNjCQ?=
 =?us-ascii?Q?9RKKDLYfHCsO6vhB5rAkO08nrEPjnm3Kyk0V2Zy/F9sqBKUjSEiNx0akUfzT?=
 =?us-ascii?Q?MCZWpFKX0WYsl8czI8kXnGm4qlgYYcdAxJqBMyZSgknt27e1cidRrCw2BUox?=
 =?us-ascii?Q?oNkpYSJkrBrYztc89idfmdlRC3K5hMHKLObLhGkXKLd8vrjqbpS2sq8yJBOv?=
 =?us-ascii?Q?P5THLMgvUp5VWVQ+pUgM6Sv88x+LeatmY7EYWFcKQDSxAlhI7Y/i7bNQqQK9?=
 =?us-ascii?Q?DWEKaXT17R3XIcvcIrWQogKIT7Hh/8d2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ExGis3KslUeJZiBPVh9ALYwP9SWBS4V7fOY18eq9ExJti5qDhCPrO5qoc5bT?=
 =?us-ascii?Q?tCKlMCBlfkocFGvDy60amTvC0kmWx1ZqanZIkUp8Q5c5iF3Pl3eWNhsTxB9D?=
 =?us-ascii?Q?vlfTTvA73qA9qgBYuF342i2lhhI4tb9aQQFyOoNGDv+79MSFV0+MiT2Qi6ED?=
 =?us-ascii?Q?WVWcNU62Y4MqJEeeh6IA1NQQedTag9/4XODnbDwTj3hZBbj/XpNMxHndc99b?=
 =?us-ascii?Q?f9OdJ83zXEi8ccHpoM/aWzcf/x0JgOTLBe5suIVJbL7IYGLdK4v7OKOCip/L?=
 =?us-ascii?Q?jT8ua9vUEnUXVXjzQpMXSyQBH+deawqVJSQUcBgXtaJpxO+UgY4RGbgfq1AF?=
 =?us-ascii?Q?HCFWQRfLyTHxU/gm8lfFP5E7s+48hIHWNV6arRV6EnPTZs4uy9r2Rg+H3zhl?=
 =?us-ascii?Q?6kjgFLhdVZ93iRull+L2BCxkEBgzsj20+D0vDlXWuwSvPNHlgb2bGqfj/6QG?=
 =?us-ascii?Q?1WNiF876jBZTrqjwnGGkHybMeW83EWjtr9cXDUFZYRWkpud0yBu1Tb0dLGu8?=
 =?us-ascii?Q?p1Qbe+VuE1fJfNp59UCl2KDzeRNhdgCmPg+9QG5dBxCz6RMEFYX4nPBoq1uT?=
 =?us-ascii?Q?dP4XJ/grAxPdSd/Iyw8SOrPa23aakw2sthvpWAOCohOUWacU12YU1gF+YFLh?=
 =?us-ascii?Q?f24seFSrIfuvEe3DRuEPup9y8vAuBflJsYM4BgsMYBc5qB4G2d1UiJ+tWRlp?=
 =?us-ascii?Q?13Ie+y+sibepWGGIYweaqMF+XpWENyqhl7VgKfE/6HlIRGV8qKN0tNZ16+XJ?=
 =?us-ascii?Q?GIdvDJujF6tqIepmL0dcNomLEdMvT62UHUnUt2+uTzY2QvJNr0bp/6DBN6FU?=
 =?us-ascii?Q?+tU3HOuO3BjQ9c6DA3jcq82lPGuLeLunJ15FKpvQ/0C5eixxQ0b1g+B5X0hA?=
 =?us-ascii?Q?9xv9yCNfeflHOTXYK0jQwH+xsAgj5Thoy7XsNXwQuPTNIXKMQBSYsQNQSAFS?=
 =?us-ascii?Q?GRFx951MEyEHKBDJha0EVUQJAjqmQANTynxjMsGB6l6fWrvDlV0jdRVrcJM0?=
 =?us-ascii?Q?/fpO/31uukMzjipUf5q/PSKNQdIHrNVMjBOE4iFbgan0x4293ynz6N+UUGYM?=
 =?us-ascii?Q?IwfOjOVFpNdfjtgPZueu6WIeFSR7KLJuUMM9huUTbBFm803p9RCUFXhZ+1Ql?=
 =?us-ascii?Q?pdtgzZa44Vt5pEdZYV92R0tECtz5UN0ELir2XGeCEq2UoFmL/+ehIn/0T2K3?=
 =?us-ascii?Q?Gav/BJhPQldNsS0ahmvKzTmkJws58Q/KCwpToqgQTda/4bZViZdjqC1w1gB1?=
 =?us-ascii?Q?7KEq+GaLBg/Vn3pp2FVDOH0M/UlnDgTUi3XsUOEUxUK8x19kGvC784M3MJKU?=
 =?us-ascii?Q?Jm+jLBiIWS3GxCwuZMjK1T1YqwzDqCxnp+QqSdtyOWcCrSsl5rq+sxqnUNXk?=
 =?us-ascii?Q?/DPhwvC4THagHX/qhAI7KkfKSYNuBaD10q0J7t56GLARZ2UglUPJPFB3QGzl?=
 =?us-ascii?Q?EuqXDe13vFLvgSsorsZMr44G902VP79yW7H08ybRSC645wv2hymwD9cy0ex3?=
 =?us-ascii?Q?zwjOiTWYZAr11glqeiGluBfhqkmdoixvHm17c83AHl3cnORF5QYKxoFaQ/rT?=
 =?us-ascii?Q?L4kY8J8OpW6oF429SzXmQGG5BfXa2nbR+A8CWuLk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce58e19-8b07-4bdf-c5a8-08dd7873461a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 21:04:25.1759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtl4sd8Qr4UZqonaxllvcWRJxOwVKv88cIMufXR+7m3c3bzQ6cJ5oncjhpu/jgdhjmtWOVR+fosUAc/N3H6Zsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_140434_757020_C51C40B7 
X-CRM114-Status: GOOD (  18.97  )
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
- include gic.h and clk.h in examples.
- add clocks and clock-names description.
- remove #address-cells, #size-cells assigned-clocks and
assigned-clock-rates.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/mtd/fsl,vf610-nfc.yaml           | 84 +++++++++++++++++++
 .../devicetree/bindings/mtd/vf610-nfc.txt     | 59 -------------
 Makefile                                      |  2 +-
 3 files changed, 85 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/vf610-nfc.txt

diff --git a/Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml b/Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml
new file mode 100644
index 0000000000000..cffa621dbb022
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml
@@ -0,0 +1,84 @@
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
+    properties:
+      compatible:
+        const: fsl,vf610-nfc-nandcs
+      reg:
+        const: 0
+      nand-ecc-strength:
+        enum: [24, 32]
+      nand-ecc-step-size:
+        const: 2048
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
diff --git a/Makefile b/Makefile
index 38689a0c36052..b38f91696c567 100644
--- a/Makefile
+++ b/Makefile
@@ -1466,7 +1466,7 @@ kselftest-merge:
 # Devicetree files
 
 ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/boot/dts/),)
-dtstree := arch/$(SRCARCH)/boot/dts
+dtstree := arch/$(SRCARCH)/boot/dts/nxp
 endif
 
 ifneq ($(dtstree),)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
