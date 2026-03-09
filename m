Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15B9FCA17D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 20:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0WbDXREOTuqZUyuBkGxXYR0BWrU+LLwL3hNPWt6MnkA=; b=yk0QCNqmtY2QaJ
	SlDW9gFy8CUBKTQ0mBFtWLihoZcixE4EoNVF8R8j4T8tUgGO4AgzRM7w++qyn348U41MCuKIgBSr4
	hdKM8h7Am47ZiquzauBN2zeqqJ/pDUMGRFIn+cqSR7Iwb9DtEPuOkLpf8KdPVI8j7bx8STJ5hOLj2
	i0xKqgZqdtYlwUsiFoP64MRQusfR6CRjCV2f7DUwlPECGhheGQpvhn3RbrOgL60nrCwrXOxbPReM5
	0fRuf4j6OniIoJtXhlKogVbgUh4LlRBtPXaOI4o6jSgY5D0mrnUdnwL9of50KrVusAXmbSuz3khaG
	2I/Rc1YHntvsmwikTlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgq8-000000086E2-1iua;
	Mon, 09 Mar 2026 20:04:32 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgq4-000000086DL-4907
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 20:04:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6QhJsrfXBxf/QI0NZjLWMQ++EaBxIYcJBh1io3YxBrPge707G3TfRZv7YLDaKBSxs/fDUjz+aCP1pWyLTWnS8bd1rTlRzfJonyiVbAUHmidnGZYoQ1E3xJ0/LDkyf8+rvSgRMncDui+9MfXU/1+uNV4xcOUMg55rYfMAQn7Y2ksFUgF9YH9nBR7NH2Ar+MdDioU+RkYQGJ5mvcR2cCyoFdJjYKf6cG9BeTP/TDRMjNPT+BtTXmPqgys2uK0HT3uCGOac/tp6rbrM6K39xx0VWXCDk150A0izYIoAgBx26QLGLVkeDBUrwotBXV9tBpOd4pcD6INFrov6swn9Do4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iGWj0n11IaMOv92dLR6ist5yPEOF1ruAucm/hKJkks=;
 b=dlWlBLvrX8nYQYOF6xvq/DgeJN3z2LZtcj6Y9wE6DvDzVTW8vJrkmlDyIxNwoJQuWiQDcsCNFhYxAqaY/OYMkhpyV1IisXgKdYz+174xNH1YTHKYjVFi39yAoN+crJ/bQc0dvv7r7xFklACtjtFJoHeLQl1Y+p0D9ApRGq9RJJDZpFJ1dE4vcWN8vXwugfou4v7IGjDo5li+LYYJse0LsHkNEvJ1UjRJRu0aE82XNF2GXBAleyFFejLgZaPf8s18uhw2xBgctp3Y+m++4+451k6y8Vu48UKw6AIyXr90/51ZYhHSuPKRbjSwAC5tPz3+EBph70HiK+BH2k8THhq9ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iGWj0n11IaMOv92dLR6ist5yPEOF1ruAucm/hKJkks=;
 b=gkuUanR3CMxlN7YKiH70VDVDeHbWPyx6HfY8QJBIsnTGPoXaoLIVg8RDqaCVaKGYK5LTWS+ot31SR/sWnyqGWdQiBFK82mIfa4DzAXl4pfFfOqFyKHEgvFgyNxPVllCAR6TxepNxlkMFED2tC4/DGxagFuXAOHsRUe7yxXJ1t++M0QM9QMNzjpwA2BcsK6tI/cRlqH19Yg3QmNGaLppNhpnVWkWmfKhXhbO1oZuxgMIGgWYRqb/fUkBZ+pDMYVpyKUYkrREDkbm5YWEDjcyVgvSnSIrNSrYIGne+dK32MUXopJVoDotgBw/fcdAamkU2GrJj3M9+GxOoV7qNtI2svQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB11934.eurprd04.prod.outlook.com (2603:10a6:150:2f3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 20:04:23 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 20:04:19 +0000
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
Subject: [PATCH v2 1/3] dt-bindings: mtd: refactor NAND bindings and add nand-controller-legacy.yaml
Date: Mon,  9 Mar 2026 16:03:42 -0400
Message-ID: <20260309200351.1791162-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB11934:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c1de43-6029-42f5-9fab-08de7e170610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|366016|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: s+kNz44AW4vJIYyLEIGpUTTLWICWLGNLZqk8fmpmav0JLivWwTmMbNy7h7R8+lslD/gcOcNh90+bI8qB41dvhOs3hRAIwBs3dd+D16OdnFOKTedGng51lWu6/39nKGlccsSztKSU4MCEB3A+1650YJEHYR/CI0L6BvVPO88edEl2rqGroNo5L00z5sRsmZMPY/3907EATEyuo+gz4zLFedakDkfjgdhRWik2dNHY6IkFs6VKfYmoaKCWbDSfIEr3jJPJiDSpGaEYrNpjzvJNqpIJhRrxyniWxXZNq03nYGyYEOjbmSlrYeRz+8PRQBnbYZ5xOLJE0eaSTbonICiPF8H7etJowPH3mQ2QxdpaF6liGn6wUyZHblTG7r48n0W2/v3h6D+APYQiphIFKV2gGAJRJSNqCQrJ9pY4ixsekUT0NHFHaGDH660xxuPT2IYqvnZWX5OmcEauD7pRILibPZli8f5cpTuBXIVWs7M2ooQk4TXMVnh5DjZkrdVP2oW1Uv6BaovQL6qSPCS8si7gs23z6v/QYau/szrGdl2zEeT8oTZ0Coo+ZjBttqsgTXl84qJPsq1YCVIEs/8J2IgDOsW3lGIw+w3yh1ceJ9fY2YGPbq+BeQozsvF/Hc3dHVuNrgOIhVoLYCzeQsd+HX7PpRrL9VeE2tS8bB+D0cFJHh/wFENzrGuuwFKbr3ztcOjB/9jb8OXPTgc6wvi6ugzMs5Ris4PhUwJHDTkGhwm3ds+b95ylxatrvLfx95L3iXoI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(366016)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EOi41fELC27EaYyHC+aS+ygUDxomTtuxaZGfrMzDSFxwWHcV3askk26Q8pKU?=
 =?us-ascii?Q?Gzqw//82D0joBzhhB5zOTnXSx2HJCRlzwW4E6HdjlEcOADlfmxmKKgEMfXL6?=
 =?us-ascii?Q?dlRd8ZzDv+nLzcSTrytDhLBnZbSW06/1Vw4jZ/TSzwXexsUKRlEKOhXRLs1f?=
 =?us-ascii?Q?7C6uQnbWhRzKzcIleClvDqIKEQ8N2ssi0tlXSY89ZM7p3UJxIstoAoZh+b1R?=
 =?us-ascii?Q?LQ7/aiKhNvuujz9AlAJJ45ZEicpmFGx4O3uUbbPumcunL8Nmk+2ADCGWimbU?=
 =?us-ascii?Q?/2CSB+yYt28V33T7sTCCmZOjb4e5P49o7anvjQykiBzoy2fvBQAC/pHTbpY7?=
 =?us-ascii?Q?cID66hQ6YYJnQ4lxVcxBOUmGcvHMdMtrrmNbg1liOKeTvmNDUF4g5vJa6pz5?=
 =?us-ascii?Q?xWLsQWWH2THI1MsEVppAHjO6bAYVzRFQsorojHRNdvi+jh9CuDKRGhn1W8FY?=
 =?us-ascii?Q?1ijD+bHiR+sVBcbNxiLA9VXZf2HLnhjjVe5dk+36Rmc+89SYub0H01K2dKaU?=
 =?us-ascii?Q?Q0VtOXlyKDeYn+b6EvzjosB+VX8oAdKpu5ZiVeAf6BufF9YZoeHeATeoBVmc?=
 =?us-ascii?Q?IiAIha2TCJh2hDLn/OkLLjlieqOXkQhRZk7yLWIJ/A0mkD0boJNTejPuW938?=
 =?us-ascii?Q?ee8DLQqpCVhWQv3+F7fCOs/tw5g65ThyEAFV15w41hoHsL11bCG0ryUOBEqi?=
 =?us-ascii?Q?n9/b51z2Emvc5yWkmeghcBjIL1GnZThCEWT8nNnOaEPydJ8zlkIMt8MVTCKR?=
 =?us-ascii?Q?QInoViEYi74dzH0Jfa6mZDN+cEIuUAWHKq1c3uR+jwyeijxubrmqq+zTFd7+?=
 =?us-ascii?Q?2jN9M9YrFk5nwsWtPtnAWdwjMKVIm6Z91W+lx183E7RdqL5wU0+4bDF4Gzuy?=
 =?us-ascii?Q?gCahU1Y6DdyeQX5dCXPfd4GcJZPnVijzPza5yon510bNLZ7+QwSJi0jXd3lj?=
 =?us-ascii?Q?ozOGc1HJv8hr7eOmRWlBmowCZbhLcVKy2lA7NZTyY0VNc12pA7rf62Ie4Apf?=
 =?us-ascii?Q?h99Q3oMqSOzYrvS3k5/3c+GUY+RPe7pTqrIkxY30foHJPpXfWXquDSpaIesN?=
 =?us-ascii?Q?VEYaDFzcNI17SL+F5njbTdaJpjuPzJJN8TQ/yuxCo5BXWPgCEfqVQfydpW8h?=
 =?us-ascii?Q?mvy+PL2YC/eg6THHixY6AR8dSpHnDTFcXvw92WCVA4Z5Tm1tqXXWffcRD5CE?=
 =?us-ascii?Q?oJ02soY/s8HFQOzGPNnAfBCBDXIA988Z880WZsSwW9jWVKxXovhRfeLBsuQk?=
 =?us-ascii?Q?6Flmp0jv6nJZ6EH2rdGKrgkEg+NfLvzZgg+t1/BELMsKuqG99sRkfVx76SGC?=
 =?us-ascii?Q?68/K/xUl04/IGoCIZQwilkNVjQ9y8qhjgGSawB0ukgUg3eu58xMxFuat7X28?=
 =?us-ascii?Q?n1aFPIRa4FMckgYE77XFA/F7wetPxfxPuXVPYiy01rkCvIam9Zy4E6ISbadN?=
 =?us-ascii?Q?dffWqKV1NyuXidL0JpnmubFICFpZTTBN3zU7RAAeubq/6FlJb0lWQFwtyIfE?=
 =?us-ascii?Q?NnptzQ8CI4zvwjV3B20OI5Oul4ZELTf9No0wNV2U+teC/i8y5HohIWPC+rrL?=
 =?us-ascii?Q?Hv7r3S5HHMqC/aAnI9Pv6EJvZie7ypZPDMmKXUWD+QZGch0JDQ46YZNjsHXu?=
 =?us-ascii?Q?AURCjEUFQAlXtLcq9TL4mRj+Zs+5cNa/zlSpKa6q8ibOn8Q+Ihb20ZtghoK7?=
 =?us-ascii?Q?iyVEWHk1ZGBNnrA7m1Tzv5f/Xb2alPcrytmHelwmcmvquTUi6E07/JzTWMXS?=
 =?us-ascii?Q?Vfs6K/E3JA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c1de43-6029-42f5-9fab-08de7e170610
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:04:19.5719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YmPzaafGUXFkFDwGLZOb0KZg6wPLCdg9Lk9k1RVq/rcfI3liUH1E4Rq0CpwkkJAUpF8k9Rt4+t+6+Aqv7Hi6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11934
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_130429_220278_29493062 
X-CRM114-Status: GOOD (  19.95  )
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
change in v2
- none

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
