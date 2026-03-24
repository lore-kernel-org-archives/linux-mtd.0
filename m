Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C716FEC104
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2026 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+K1sZj+/Qx66N4jZpD/NAlWBigvvTQbaKUWgRlfXlNY=; b=ydlAhfMzCUixpq
	Q9Jxp4RDTek0S2U7MFe7ROU7AiBom5BRML6Ku1LaxxM5eqLGdVvW8155GA9bntIwU4FBoOH/EansW
	SL1TgFf9vTJnkvU95c7SQnMMrJYdIiG1cELx/1IWvkCHEaYlEccx5IYMVJuDyyJnBpb7Qr9/PdPqF
	jeZ0H363buqkQ3VBB77S8QY/WXWSujZmhKbHqglkoU9WM2etIFH0klEaAt8qrgfIEWVYQMlCwRJrn
	VzpY43slpNerQmRmQzViv/fJ31PavNRVSt8iXlqB/4n00jxQDcjAz4d3iX6pozKRHXSmP4rCKs61p
	lJCFmG4AQBWMgOX57Wyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5A45-00000002IbU-1kY0;
	Tue, 24 Mar 2026 22:17:33 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5A3I-00000002IZ0-3YeW
	for linux-mtd@lists.infradead.org;
	Tue, 24 Mar 2026 22:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/T5ayKE7BYb4nT9XbZGCaMgTRPyZIWrwKpmI5qD7vbFbjJ5ipCMXeV76iUy4I0MXaDYvxdc4yx/dG66RCJcbGTIF0ZHBZ2nxG6CZ/6JUKai1xNtWClBPBQi/i5ueYcDgruakHdNdTujz4aEauks4HdzHdeAiiC1IB2eSgeWKYuCJzeQAuuPHQ92NdyakHHdN2yvjwQgfW1RpBRjVGSAv6EQin4+kitnw/8QIRzS3AqVOD4CDmGyW6nJk3dnllX4Zlcs9xS+5Ex4NpQMMZH/SccLCDCUVOe2Vvs+kMCeNuYBNVrx8W5KzrbPT44zO715y9AVEYdzebR2UyTkvgw1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XdaA+k68s0tYxK0jkzsDRt9feWNxPfSKV+WzcpjgKA=;
 b=GcrhMVLFrSWm44CJGgW3RJfdHDIJnKsfKeIJyyG5O0oAe+IVhR/uMuFSOOikk1CRK/Iy3ncTO7DYCJXrB/Nj8mfKWdkQ9Q0jprYhjYWkkSQKEZLFl5gUo3UCp9t9jrkQWSjFmIo3QUcH/SjQpGnP40VW5xfXEiqrLJH6etHOZKdF+bp4Bp5qL5ISyNElwyMT6SFBtuVFHPO87gd7A7gYr0xCtceKmC+q4h3lDzInp6kuEuwx+p3w3e3usoJmh9AtQksFEw0QXHwL2oiYT/pE7bzvTOVnC2maBSWrwaDE+OR7ImV6BA6ALCoiZQt0X6UVmBQ9oS44Z/+SNMeV7SnBqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XdaA+k68s0tYxK0jkzsDRt9feWNxPfSKV+WzcpjgKA=;
 b=I7+P3TJJMv9p3esXRT7NRb6dKm9NgsyDOIde6Damq+dJqGkOBiroq8hAWljyuMxdon8OD5/uKUwXasKc2NZ4U+SJSNUGGZzFkMK3vfjLv320+xP67/tsN4VLwehDFz5hOdEnu2Syj2Zy2bKJtWtb+NYLoWm7Mejw8x8SfR036KSyOcbRrrfZgGI5FkAs2/xxWPh3K/lawS8NmTwnnk6nWavCIs1neqF55U2U3xfo8ZSD/ysIMpdL9Xo4d2BtIqqwmIAy+oie7eSUGoayL/k7fvvIPsFC/jUL4jZEK+I3PfHtMq/lLOYs7ARr3JV+DXJv/TDdsX7kN4TNNeJA+pXtuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8128.eurprd04.prod.outlook.com (2603:10a6:102:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 22:16:38 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 22:16:30 +0000
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
Subject: [PATCH v3 1/3] dt-bindings: mtd: refactor NAND bindings and add nand-controller-legacy.yaml
Date: Tue, 24 Mar 2026 18:16:18 -0400
Message-ID: <20260324221624.2424092-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: SN1PR12CA0075.namprd12.prod.outlook.com
 (2603:10b6:802:20::46) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d144dda-8f85-4005-73a2-08de89f2ffa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|376014|19092799006|38350700014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: v7sPT55uLBBvs2IPwn+10isyiYKTb6VXlRqxwTU/SZLCC39fBWXhf/OFRY6VtiDx4vFD9PdtB8y0pvQxdEV8vp3URUVNCIwmHJ0gbmPksYSe+SgXslbnciCv1YN0v1R9Gk4NhpiqpkWmokFvedcJMpqiYjT0k56ddqiBCGaNISdxZEIqpKHrV/zrIa2LGtM1Sh+k3tv19dAbMQxU3c9wnH+4w+y2+/bdQbIAHl+znbZtNfabMeLwDwbQ/QmPXkw3xSmYaAHQHkOP+X7Z7ANwKPrC5GsqZfdMUtHXAVkF1vG3663lAJxFBu/SKTjssrJZF5zYlEfUHhfGlPLwZIjwtQiqcBwdJyyxI/zY0PaiL5wTmW8xtLVgCzsYexQmfGh/FJ0WUS1mokpwoz1FBYxk8G0uoE+nn8jFRv1dYJDGidkm3AIzzhkCWmNM2umK7Y/rxaGFNbKjc0PkILhc9tL+1Uzi/92lejbnAF8j3sUDWmGRM2HaCT9OmU1nVW1Kad1drXDnWPxY3HJJvOhWOFNvFXztxh/m8KNIFHyDJqopYPPMQFa/SLuj4LZmzui8dvQs/DWmz2+EVIOcXqs+/AEX9ibeT8B9kAFzw6/UvgXAo6q9+9d55udJ1aZTXg4GFZObcFaZVqSNoqypfvpbm7vyFLMCpe4kRnxVlRf1PNMFBDG8afZfDoe3BwGQZp/NBx9P4z8zujE0cPzGKNvtGZZfqv4UChiJmZO8u1IMd+ofeuM5+QazSQ0VI6vpSwiDhITi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(376014)(19092799006)(38350700014)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VsEcXwxhYe81dK1DyV1y2ykgHBk+D3xKF7icqEHmzRTqTDdOjscpfijH1xHB?=
 =?us-ascii?Q?JNx4Xnj3o2NbeZzbs+uWXDAdeXj95ePwLAKZY6zTRfQjZMGvTNz9sz3BQpN2?=
 =?us-ascii?Q?6LeP3mneJOn8COs6CXwwPjkuofT1+i5CUEBwRL6HxAXKsGJC+vhboLvBzHdx?=
 =?us-ascii?Q?eCPIU8CxKg8674uappakg0uU4KKVTcHbnGFbfen5VmmS7mrPQAIKHITkwhea?=
 =?us-ascii?Q?SYtjK7kkNgEzKqRU4IxWC/WW5qGNnN5MORroYgtkEcd6g/aKNz2/SajGzY4z?=
 =?us-ascii?Q?O4c37j4q0I3DSnJHZSh3iRLQy9GwL7GNZQQvsi/bl7AxM6chk9+P/8Ra70qY?=
 =?us-ascii?Q?WhPV747JGrIBvLyuDiSGMl2M17Ax8HMN/elQhHNdOLfIE/xr7hh09I7F09U/?=
 =?us-ascii?Q?r+B20tAKxQ9iN51Qy9RdvdMlxUxzSORWfu7MipjUhakgSCnz82ABRWkVGDtf?=
 =?us-ascii?Q?s9wTFP2vjVZNXpGYZVFswM9eJHmKHIfAnaxxxtQXjOySBC6WE1yrdczXehpl?=
 =?us-ascii?Q?ZZFk/DcdpO5pEhmgN9cV+VLNcbBOlaLAzW6mwAwK4MsTlyiNWrEVxbiK9ARK?=
 =?us-ascii?Q?R9yzvNsQ9YdRrmXOmjRxEnlT3xMFM3XXw+F+DOTj0x1MJeqJnP4XFRN7wwYZ?=
 =?us-ascii?Q?U8xKVrp7DXI5FSqsBlAbiWOfPH6zrFvY4WlsMDLGUMNI2BzqpZDVs7ExV+nS?=
 =?us-ascii?Q?iPX/RHmcoFb5xnt4UrJQ0MzSfqUYwE8Z/CR2gTGZ8QXyX+dGB6ZzLcP388aZ?=
 =?us-ascii?Q?aCNu1tj8kICknBN5hECrCOcIJDhg+OBv9VL6c2odyucuhrJ+35twDndNHSXU?=
 =?us-ascii?Q?+QwD9w9fUYtRgrS7Y4Gl+KQ2JJ4iAf+VOYWrJl642Wf3Ou8WL8uXGwiu7n+O?=
 =?us-ascii?Q?WyAdbcJubMdNZSx4Nwjgwh7s5B0SZiCb8a7xZF6UbcOFBHHCfVInV646jwb5?=
 =?us-ascii?Q?hfGJb6mPwiuYupTjNTBMfglaUhvQ24YVHkIX0Tek2EzkCHff0AIIsptzv54O?=
 =?us-ascii?Q?dSw4VXlCSg1A1g1WY2KGxO6SdZMqHWIVakcVoOKY39apRHPH4ypg1IeaTfwC?=
 =?us-ascii?Q?DRPqcg7sxiiuQ9lmSo4axlmbC0dP543RLlj4Eixb54df9ZkPINyQ4m7rf2oM?=
 =?us-ascii?Q?o+ctOjaLFBeho1HdFN2K9LMIXzA+szqWfKVDhGHnEZv5JnXeU97D7LAwD4OW?=
 =?us-ascii?Q?lKD097QIu22mbm6P2WCh+C7DeugdfkTmCeE6q0mCerYpIHkz7nP0Ob5xSMAM?=
 =?us-ascii?Q?7EpugHAXGCRTJpRq7z6DUjc6llrNcPPHqJInpJg6S7PFjFRAdMvhRH4ZihT9?=
 =?us-ascii?Q?die9zlRmcN8/Mke1iBQpL0q0TjaQTYCOe8xwQI/yKfILnaIx8+gnLtHiVSkw?=
 =?us-ascii?Q?xKQUlRRYS8Y1o8/aaVx965ojDd1PZnGcqix0yLuodwLiH/T6xOuV8hK9NgC8?=
 =?us-ascii?Q?tTqGG2U9d9yET46utyjEccFyaZ5Akqc3aKJIujVBYM2w/s4LvGWN/BWEVQuh?=
 =?us-ascii?Q?T+rvj9PRj/oEOLJArxv8UDsVffYG0fZ55COXVVODFhjrJgd9LZIBfY3zIQTv?=
 =?us-ascii?Q?q02/NVxkdH14nsFaXm3iqK3QoqQo3onHpuN7JCOo7qImFIQScZPjgrSJKtH1?=
 =?us-ascii?Q?3oWV5tjDScfwyc20NGURm1tDN72xbzfP0PShhq8Yi7rC2WX3AZZfY8pYhvUX?=
 =?us-ascii?Q?jWB4qXaNKZ55bV6NGDSyd45F1cfLetKdiSKvYsQI5RRYgvEgpPtaMm1PcMly?=
 =?us-ascii?Q?EooS194qKw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d144dda-8f85-4005-73a2-08de89f2ffa2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 22:16:29.8609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +u0ES1UNL6wFycWqT8iRtOqJg1gXiGuLqya7LDtSsBXOF+8bj+ueZWCkrZSezIXUBp9DAvCFCB6r47uATtAIfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_151645_058894_9BD9AF08 
X-CRM114-Status: GOOD (  20.82  )
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
within the controller node because those controllers support only a single
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
change in v3
- use select: false
- s/under/within/
- s/property/properties/

two problem left:
1. about "^nand@[a-f0-9]$" in nand-controller-legacy.yaml

allow dts to do mirgeration from legacy layout to modern layouts for different
boards, which use the same compatible string.

2. ref to mtd.yaml

mtd.yaml force node name as flash@, nand@  ..., but here is parent node
name is nand-controller@.  Only two properties, duplicate these should be
simple and clean enough now.

change in v2
- none

change dts layout break boot
https://lore.kernel.org/imx/177281063848.253518.12995342124719933118.b4-ty@nxp.com/T/#t
---
 .../devicetree/bindings/mtd/nand-chip.yaml    | 46 +-----------
 ...oller.yaml => nand-controller-legacy.yaml} | 46 +++++-------
 .../bindings/mtd/nand-controller.yaml         |  2 +
 .../{nand-chip.yaml => nand-property.yaml}    | 14 +---
 .../bindings/mtd/raw-nand-chip.yaml           | 74 +------------------
 ...-nand-chip.yaml => raw-nand-property.yaml} | 15 +---
 6 files changed, 27 insertions(+), 170 deletions(-)
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
index 28167c0cf2719..0aa61d5fa50b1 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -16,6 +16,8 @@ description: |
   children nodes of the NAND controller. This representation should be
   enforced even for simple controllers supporting only one chip.
 
+select: false
+
 properties:
   $nodename:
     pattern: "^nand-controller(@.*)?"
diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-property.yaml
similarity index 89%
copy from Documentation/devicetree/bindings/mtd/nand-chip.yaml
copy to Documentation/devicetree/bindings/mtd/nand-property.yaml
index 609d4a4ddd80e..55488a4b15487 100644
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
+  This file covers the generic properties of a NAND chip. It implies that the
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
