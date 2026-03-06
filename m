Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71D8F33A92
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2026 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zkKquir7hkVCFG1FgxazFcmYsMnXcXKer4UQ7s4bGVs=; b=mQ+oi0RjU7fiIp
	HS5TMV7jW/CE0STbyBhVyc15SkGQ8Muob1dhGyIbQmaiU7O4uzAWFs9wyp+4gsoHEhEJRjsbM3Bez
	Fr+1S0BOGkP5aHh4ApACt55kbkh8Xrmgx9MxEk3r7+DmsT7fCeNU/2yFT1vGt4fe2lgJBZkn/skQF
	QLhE286KJNQ5OJRE9a69ybUakJG6JpwHmAbcTK3c5GNEQFdN+PIaNzF8xz8v4wKlawDCUiKmjJjcB
	ayxhD/engahs6GT6KGEDzvUrc9T2VU9DyOHX0iTHPCQkfHnShPg91TcnetzHgYURIV2QZJhjlPzBv
	g13STbp+5k8F6m3YhlZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycwe-00000004XlI-1Fbd;
	Fri, 06 Mar 2026 21:42:52 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycwb-00000004Xki-47x6
	for linux-mtd@lists.infradead.org;
	Fri, 06 Mar 2026 21:42:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZIng34v46zLH09QGrTmSsdddUoD3Wjake/TmI1pK+8v8F2fJdcYnVbu9hSyBeJO0HbT37ntJkSB5dM7LJqNjPxoUTmD12TVZJnvAGvm6Be4YvH0UjIJOAFs/wpZWvfCKrsX2cpfzNCg0awwmy/qLbiNLrsM2E4iyS8LF+sUPP7cNk/+zqw43eqvhRiVU3VF6I8TlxgqvxKldT8IMlbVu7IcSTzeBQqlPmb+ZKfPgcX45CnHLTLSlCKBrMh9sPH3TkVuaak72/PLrbW5hrhNr4SeiSgTYO9hLX5cs4HXwYKSCc+aJnT7WJ1SEfNuJ93WvNXa/SvhYwGR2NiiNJWefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=go+rKpUnQRSHC5Sby0tSzop4JGMgH1N4AumI5JCMkNY=;
 b=ChoirK03DBXyR7b8PoiTshRGqJOV+mX9jtgnaB3DkGp3nAhIZvGMDT1SGj+YkPt3721sSqu1n11jqGWaYPV73ECtkQ5fhAJWm/h9/rBOj5IWaC9bwXEtU92p+ZDspxZKKeU3koR/rD4K6CzmVn842pY3ZMu6/xONxhDJxXGIvFdGE/T7TDM+GA/lNOIJEaW6LL5SBFpTkKBVLMOCnBJCiL0CfWwipOEDr3oxHY7QqBcDLWw9xUrfbZM/2sBq6AwF2S46STjSyRupiifvdV19IORPSpNOsjkDAfPvugrccoCXzYdCRnD89/TlmxL9ZJb/49Ypr8R6s5bJ9uQ9Acigsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=go+rKpUnQRSHC5Sby0tSzop4JGMgH1N4AumI5JCMkNY=;
 b=Dfjar9garaN9NPwm77l2IaJAQmfSgpu4nLlOSTTfXFr/h3KFaXTTuuX0JCWRnFzgoCUcDWWnIlE7BHa+wJaU3ZnO42Dn08M0Y5VVJ0/c5DM0eYSqHjLjlj9J3wgUe8vH8lLUaspT4uDH2WBX3brlsFckq4WdYrRIzWO6hXQ8bbTSy0IDs+ZhcBuvu6RBvaKRqTq48VWE3FIslsUpGR96OTSq9+wMTeVeSru+H+ZvORj0BVZmyWDj6aFZFwv+306uNqBs7M6yejJ0/j21DeGTcSyxtHJnQX+dI7ET5Ha98ateR786Rx9wrlXIUyFj6XaukiaQEOyvZQ+xOzJ+pBXXCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6770.eurprd04.prod.outlook.com (2603:10a6:208:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 21:42:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 21:42:45 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/3] dt-bindings: mtd: refactor NAND bindings and add nand-controller-legacy.yaml
Date: Fri,  6 Mar 2026 16:42:17 -0500
Message-ID: <20260306214226.403672-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PH0PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:510:5::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: eda5fbf8-cd02-434f-42f0-08de7bc94dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|19092799006|52116014|376014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: jU2CfNBHjeDilhYqFVAvwkBoKVLPGwlnmbvb8NDh+HSMzeP1bDZo+c+DyW/Y0neOzm1x3fRfY+EC3WfveexwZMWKUJJBFhH96U9VylBnn4QD6BFsgXM2YjhY8JmaBKgk2z+PfsA0aSwrpvx2ilOaoQWvUWcoU2jSmcCWXUafIiDst5UnjxRBTR70+/270VKIh1JBTE8Rhd8GHQlwyRl6RZKKobMm0SLqOCM/rSNRgxoJOHsk6Tm7AKIrvTgOjhDevlBPQzKPBFu3Qt58burxM0ALqqUGRXUCQyJYfQAmJyxakF+rao5p2LA+6OUZixU1DPDX84yh3kYinWrBPjXmJRW6MQOjh6N9HLHiO1qE4sDe0kW+wH4yF/+ZVKNRKRP1YjMzncoZcg3/yOCJEgsbT3JQ+tKGvzv1HSUjLhz8AWEIoLEerFsbBWHM3AOxOktVbyifhXCeTO6JBzcoHeb4p35+XYWyg4EKH/3lwPOsxI7uf4EyyEXxEX0xYBIhG/i909L1s9aw+KeAMgHKaztRd1UCLKMUDBRNI6wh7QYgAYJKhR0PuaYfRTwa3duOZwxhR1ykg6aw879yPqLaQvqFfavhi08D4sFeypXyVPYRmWAFLvZQeZYn3K8ZjnDUc9skkhEsOANP4fszKRafI0tY9SxiQHkXm3dXn41YMYc9xnGm1d+iKVJKJNWk5r37L5bdkOEKpDLQd0KRPaGCPG+XGyMh983nVqbsvREEdJ5f5CIQlF3ZjlgdPAzPKtTfmSGT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(52116014)(376014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RH+MJv74bp3imnE+fR5AFaDgBgXX0MstJg9Vr6yXJBouU5Oe6y/QcDiLt72D?=
 =?us-ascii?Q?7mAWEGfpJ4SmuVmTLxjMWbX7cLgLQxieWh1tkqGFPMmSR0SHTs/V6xYw63wx?=
 =?us-ascii?Q?H87AzjT7sBbPgmLhyoi33h0Cq0oIGhhF7SILGCqQEwAYfHKIcTVMfRyfTqQN?=
 =?us-ascii?Q?9HHF0jVoGSWdfjmr5Ts1yegz9pMtbCstPDsdCKDdxamXwC7KJdff+wsOtsv1?=
 =?us-ascii?Q?FtfJZgRwTZOxKT6rBhKNxiWi33X3bJvI1ug65Z9aMLk754IP2wtkCaVrDA9C?=
 =?us-ascii?Q?cj+vRgWJ0Bz1fTLnArutH8ke4r8oUdrwbBYUV7/CdtQQziOM7YE7f79rVZ/n?=
 =?us-ascii?Q?8E5Sj3nb7a8CHaQiuwEfrw192V52F9AEEmZ1Vb+2Aeu0GvQi7KmXxLqARBK4?=
 =?us-ascii?Q?eRJvIU6yL9NkNQcrDwqCkxetcPP1zvTRlYeBEZbkfpFpxC4nz8NXQpEH3g2K?=
 =?us-ascii?Q?fRvPWindbejx/ECrOtLE7nzPlJ9CB/S7FIMMWMXom98IIIRFwcCgucoCTBC9?=
 =?us-ascii?Q?hTZObrd5Hohz94Z5MFj5csO5VerZS1SBLiWgbvMef1+IR7lSQHet/uARnMEi?=
 =?us-ascii?Q?5PVpCbRrJTdDXea0NA1sEf0q+TNuS8zkigshvO1bhjcpWQT6pp8GT2OjuQkY?=
 =?us-ascii?Q?TmsNFg4gUGhlB4WZdbf/8QT5gnLtEr8UTWk2cnC63ArHAQSy6Jem/Sc/BLAK?=
 =?us-ascii?Q?NZxuN7Uz+z4+eHiu8RrfYUUUzkG2KDI3ZNjKREzCdai0rDeTT5Rq2CoXo2z5?=
 =?us-ascii?Q?Nob3DomlEL2N67+PLFtc6xC6EVLlhU7sY65mT6xU9zHe53LO01xrM0i5/ar3?=
 =?us-ascii?Q?o7Huw3Bc3nm0wd4AB4X1ahC6kK2ayhPxeZwOqqq+pub07KwFsGgy8zlEJZfN?=
 =?us-ascii?Q?y8kjWKH7GYttHT7Ak1ANsUh3uZm0Uf2u9EIIYXndunLXT+VT+H776Oekp518?=
 =?us-ascii?Q?VUndjOSeh5VXuQbvnCyzx58QDxy4G2FpfJKY9lyst9Spc036x/nIPxsqEeNP?=
 =?us-ascii?Q?ZFpnT00oAr4HWQ7KMnF5vRTEc5Mx7Zm8UIliyxpkZIuB+DS/Bzd9eH8mFz1H?=
 =?us-ascii?Q?6g7tboyloMs382r2TmXd7zvMDdNlWhGGnhzoKcSL00+BmvPMPe+ySuwLpe0C?=
 =?us-ascii?Q?YwLSq0nccDeWmS5Py1CdQE0vGo1ySuXJWBqIr9fi7bUPcQCt8Jnf2FFGeQqz?=
 =?us-ascii?Q?OL7nPjRqYOAOMezLYZ+Gk9p3hdSo8IMq8PoKjHubefDD9+Ens5l+ch8qIhjK?=
 =?us-ascii?Q?ATOU1msgiV8JixYaE/aKFeFFxXoLWl+yHfarjEGlDceD9cLh66YNte8IWy0K?=
 =?us-ascii?Q?2q09+Wmq1sK745G0oDVWhmWPyFRHzSfW6Nmih7CCk0oN5w/k44uFW83akoMs?=
 =?us-ascii?Q?h+lTy+j5/Wu/T1/pcFnnvEGE3oqcN12DF11InR6dpHKqMAKRsusIwpmgIN7Z?=
 =?us-ascii?Q?GgUiqr457Z7bISAb5Y7NCbyVZDO7+BZjDQ2W4/CXduIlIruNLRwd1+rOdXJE?=
 =?us-ascii?Q?QiiSk7qR5KhIMKeHmOFSh1/3DO28GuJyVSeenQjhFf2e1Z+x/2vKYJpXjrNl?=
 =?us-ascii?Q?LGpCwRMp4gDNNEgQZ/W6KsKdeoERXy+jUWvBIniLvZVaj7NyrJSTHxE4dVaS?=
 =?us-ascii?Q?07jQ9ZE+kCf++HuBC9AfmavhmRcThjm4aK6Tff+2ReVhsjRr26bV/e36RubR?=
 =?us-ascii?Q?ja4QR0yyzwDd7YzQCDwTSgcC4Vyw8hx8TngwvjakJHPJ2/k8r10fWKNCYi3J?=
 =?us-ascii?Q?HYqrY05WiQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda5fbf8-cd02-434f-42f0-08de7bc94dbf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 21:42:45.9014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmpAp8jHueMh7Pde7lOWpv/idqJAo0tczRLvrdvn2dy4ISBbKSJote/3QNL+f4tanmqumqRw5ZbGDweBf6zXew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_134250_182477_72ED3768 
X-CRM114-Status: GOOD (  19.01  )
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

The modern NAND controller binding requires NAND chips to be described as
child nodes of the controller, for example:

  nand-controller {
          ...
          nand@0 {
                  /* raw NAND chip properties */
          };
  };

However, many existing device trees place NAND chip properties directly
under the controller node because those controllers support only a single
chip. This layout is still widely used by older platforms and by other DT
consumers such as U-Boot. Migrating all existing users to the new layout
will take time.

Several kernel drivers, such as ams-delta.c, davinci_nand.c and
fsmc_nand.c, still expect the legacy layout where raw NAND properties are
defined in the controller node.

To support both layouts during the transition:

- Extract NAND chip-related properties into separate schemas
  (nand-property.yaml and raw-nand-property.yaml) from
  nand-chip.yaml and raw-nand-chip.yaml.
- Introduce nand-controller-legacy.yaml to allow both the
  legacy and modern layouts.
- Add a select condition in nand-controller.yaml to prevent
  node name pattern matching for fsl,* NAND controllers.

Keep compatibility with existing device trees while allowing gradual
migration to the modern binding structure.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change dts layout break boot
https://lore.kernel.org/imx/177281063848.253518.12995342124719933118.b4-ty@nxp.com/T/#t
---
 .../devicetree/bindings/mtd/nand-chip.yaml    | 46 +-----------
 ...oller.yaml => nand-controller-legacy.yaml} | 46 +++++-------
 .../bindings/mtd/nand-controller.yaml         | 11 +++
 .../{nand-chip.yaml => nand-property.yaml}    | 14 +---
 .../bindings/mtd/raw-nand-chip.yaml           | 74 +------------------
 ...-nand-chip.yaml => raw-nand-property.yaml} | 15 +---
 6 files changed, 36 insertions(+), 170 deletions(-)
 copy Documentation/devicetree/bindings/mtd/{nand-controller.yaml => nand-controller-legacy.yaml} (69%)
 copy Documentation/devicetree/bindings/mtd/{nand-chip.yaml => nand-property.yaml} (89%)
 copy Documentation/devicetree/bindings/mtd/{raw-nand-chip.yaml => raw-nand-property.yaml} (94%)

diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 609d4a4ddd80e..8800d1d072665 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: mtd.yaml#
+  - $ref: nand-property.yaml
 
 description: |
   This file covers the generic description of a NAND chip. It implies that the
@@ -22,51 +23,6 @@ properties:
     description:
       Contains the chip-select IDs.
 
-  nand-ecc-engine:
-    description: |
-      A phandle on the hardware ECC engine if any. There are
-      basically three possibilities:
-      1/ The ECC engine is part of the NAND controller, in this
-      case the phandle should reference the parent node.
-      2/ The ECC engine is part of the NAND part (on-die), in this
-      case the phandle should reference the node itself.
-      3/ The ECC engine is external, in this case the phandle should
-      reference the specific ECC engine node.
-    $ref: /schemas/types.yaml#/definitions/phandle
-
-  nand-use-soft-ecc-engine:
-    description: Use a software ECC engine.
-    type: boolean
-
-  nand-no-ecc-engine:
-    description: Do not use any ECC correction.
-    type: boolean
-
-  nand-ecc-algo:
-    description:
-      Desired ECC algorithm.
-    $ref: /schemas/types.yaml#/definitions/string
-    enum: [hamming, bch, rs]
-
-  nand-ecc-strength:
-    description:
-      Maximum number of bits that can be corrected per ECC step.
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 1
-
-  nand-ecc-step-size:
-    description:
-      Number of data bytes covered by a single ECC step.
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 1
-
-  secure-regions:
-    description:
-      Regions in the NAND chip which are protected using a secure element
-      like Trustzone. This property contains the start address and size of
-      the secure regions present.
-    $ref: /schemas/types.yaml#/definitions/uint64-matrix
-
 required:
   - reg
 
diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller-legacy.yaml
similarity index 69%
copy from Documentation/devicetree/bindings/mtd/nand-controller.yaml
copy to Documentation/devicetree/bindings/mtd/nand-controller-legacy.yaml
index 28167c0cf2719..d6e612413df19 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller-legacy.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
+$id: http://devicetree.org/schemas/mtd/nand-controller-legacy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NAND Controller Common Properties
@@ -10,21 +10,22 @@ maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
   - Richard Weinberger <richard@nod.at>
 
-description: |
+description: >
   The NAND controller should be represented with its own DT node, and
   all NAND chips attached to this controller should be defined as
   children nodes of the NAND controller. This representation should be
   enforced even for simple controllers supporting only one chip.
 
+  This is only for legacy nand controller, new controller should use
+  nand-controller.yaml
+
 properties:
-  $nodename:
-    pattern: "^nand-controller(@.*)?"
 
   "#address-cells":
     const: 1
 
   "#size-cells":
-    const: 0
+    enum: [0, 1]
 
   ranges: true
 
@@ -39,33 +40,26 @@ properties:
     minItems: 1
     maxItems: 8
 
+  partitions:
+    type: object
+
+    required:
+      - compatible
+
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
     $ref: raw-nand-chip.yaml#
 
-required:
-  - "#address-cells"
-  - "#size-cells"
+  "^partition@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
+    deprecated: true
+
+allOf:
+  - $ref: raw-nand-property.yaml#
+  - $ref: nand-property.yaml#
 
 # This is a generic file other binding inherit from and extend
 additionalProperties: true
 
-examples:
-  - |
-    nand-controller {
-      #address-cells = <1>;
-      #size-cells = <0>;
-      cs-gpios = <0>, <&gpioA 1>; /* A single native CS is available */
-
-      /* controller specific properties */
-
-      nand@0 {
-        reg = <0>; /* Native CS */
-        /* NAND chip specific properties */
-      };
-
-      nand@1 {
-        reg = <1>; /* GPIO CS */
-      };
-    };
diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 28167c0cf2719..81d4ffc3fc1fa 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -16,6 +16,17 @@ description: |
   children nodes of the NAND controller. This representation should be
   enforced even for simple controllers supporting only one chip.
 
+select:
+  allOf:
+    - properties:
+        $nodename:
+          pattern: "^nand-controller(@.*)?"
+    - not:
+        properties:
+          compatible:
+            contains:
+              pattern: "^fsl,"
+
 properties:
   $nodename:
     pattern: "^nand-controller(@.*)?"
diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-property.yaml
similarity index 89%
copy from Documentation/devicetree/bindings/mtd/nand-chip.yaml
copy to Documentation/devicetree/bindings/mtd/nand-property.yaml
index 609d4a4ddd80e..5bbc93e506fd8 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-property.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mtd/nand-chip.yaml#
+$id: http://devicetree.org/schemas/mtd/nand-property.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NAND Chip Common Properties
@@ -9,19 +9,12 @@ title: NAND Chip Common Properties
 maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
 
-allOf:
-  - $ref: mtd.yaml#
-
 description: |
-  This file covers the generic description of a NAND chip. It implies that the
+  This file covers the generic property of a NAND chip. It implies that the
   bus interface should not be taken into account: both raw NAND devices and
   SPI-NAND devices are concerned by this description.
 
 properties:
-  reg:
-    description:
-      Contains the chip-select IDs.
-
   nand-ecc-engine:
     description: |
       A phandle on the hardware ECC engine if any. There are
@@ -67,8 +60,5 @@ properties:
       the secure regions present.
     $ref: /schemas/types.yaml#/definitions/uint64-matrix
 
-required:
-  - reg
-
 # This file can be referenced by more specific devices (like spi-nands)
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
index 092448d7bfc5c..792de3e3c6eee 100644
--- a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: nand-chip.yaml#
+  - $ref: raw-nand-property.yaml#
 
 description: |
   The ECC strength and ECC step size properties define the user
@@ -31,79 +32,6 @@ properties:
     description:
       Contains the chip-select IDs.
 
-  nand-ecc-placement:
-    description:
-      Location of the ECC bytes. This location is unknown by default
-      but can be explicitly set to "oob", if all ECC bytes are
-      known to be stored in the OOB area, or "interleaved" if ECC
-      bytes will be interleaved with regular data in the main area.
-    $ref: /schemas/types.yaml#/definitions/string
-    enum: [ oob, interleaved ]
-    deprecated: true
-
-  nand-ecc-mode:
-    description:
-      Legacy ECC configuration mixing the ECC engine choice and
-      configuration.
-    $ref: /schemas/types.yaml#/definitions/string
-    enum: [none, soft, soft_bch, hw, hw_syndrome, on-die]
-    deprecated: true
-
-  nand-bus-width:
-    description:
-      Bus width to the NAND chip
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [8, 16]
-    default: 8
-
-  nand-on-flash-bbt:
-    description:
-      With this property, the OS will search the device for a Bad
-      Block Table (BBT). If not found, it will create one, reserve
-      a few blocks at the end of the device to store it and update
-      it as the device ages. Otherwise, the out-of-band area of a
-      few pages of all the blocks will be scanned at boot time to
-      find Bad Block Markers (BBM). These markers will help to
-      build a volatile BBT in RAM.
-    $ref: /schemas/types.yaml#/definitions/flag
-
-  nand-ecc-maximize:
-    description:
-      Whether or not the ECC strength should be maximized. The
-      maximum ECC strength is both controller and chip
-      dependent. The ECC engine has to select the ECC config
-      providing the best strength and taking the OOB area size
-      constraint into account. This is particularly useful when
-      only the in-band area is used by the upper layers, and you
-      want to make your NAND as reliable as possible.
-    $ref: /schemas/types.yaml#/definitions/flag
-
-  nand-is-boot-medium:
-    description:
-      Whether or not the NAND chip is a boot medium. Drivers might
-      use this information to select ECC algorithms supported by
-      the boot ROM or similar restrictions.
-    $ref: /schemas/types.yaml#/definitions/flag
-
-  nand-rb:
-    description:
-      Contains the native Ready/Busy IDs.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
-  rb-gpios:
-    description:
-      Contains one or more GPIO descriptor (the numper of descriptor
-      depends on the number of R/B pins exposed by the flash) for the
-      Ready/Busy pins. Active state refers to the NAND ready state and
-      should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
-
-  wp-gpios:
-    description:
-      Contains one GPIO descriptor for the Write Protect pin.
-      Active state refers to the NAND Write Protect state and should be
-      set to GPIOD_ACTIVE_LOW unless the signal is inverted.
-    maxItems: 1
-
 required:
   - reg
 
diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-property.yaml
similarity index 94%
copy from Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
copy to Documentation/devicetree/bindings/mtd/raw-nand-property.yaml
index 092448d7bfc5c..f853b72426c43 100644
--- a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/raw-nand-property.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
+$id: http://devicetree.org/schemas/mtd/raw-nand-property.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Raw NAND Chip Common Properties
@@ -9,9 +9,6 @@ title: Raw NAND Chip Common Properties
 maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
 
-allOf:
-  - $ref: nand-chip.yaml#
-
 description: |
   The ECC strength and ECC step size properties define the user
   desires in terms of correction capability of a controller. Together,
@@ -24,13 +21,6 @@ description: |
   specify the value(s) they support.
 
 properties:
-  $nodename:
-    pattern: "^nand@[a-f0-9]$"
-
-  reg:
-    description:
-      Contains the chip-select IDs.
-
   nand-ecc-placement:
     description:
       Location of the ECC bytes. This location is unknown by default
@@ -104,8 +94,5 @@ properties:
       set to GPIOD_ACTIVE_LOW unless the signal is inverted.
     maxItems: 1
 
-required:
-  - reg
-
 # This is a generic file other binding inherit from and extend
 additionalProperties: true
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
