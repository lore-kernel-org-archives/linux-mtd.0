Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0AFC38A2D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 10:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9LuFx0CTMoYFoT39PbBImB+txwlmYb3VikRELGcK3A=; b=GSNKpqZ72Z8KV9
	epT9n4TB7Ko/ZfAeu6iGPdqRBKWz1gvQzHhhzMsCQ1bR0sDSmmuWKq77MqG/D9D+ST6fu7iIPARnZ
	d0k+y1gSBEZEQHBI9p77zagh9ZKc7BT9qKVrwZ9to9PDddDCLjicE/lzIebJusycvCwnGEP/fINra
	YBi4nTTjfb2gHfRCnjO3ZTebfmELfSlnt1KU5Ma1mR38Z70tEDyu5BzuRWkPkJX6Y/nOr2QIDd0Nh
	tC+f8+qPk6HX1zG/DER5Kgsz5yj+EY2TXOXWdJGt762bXWaCIioyxmUZYAZpauDOpazxVDGMfBuox
	2tuKtu3KItZsoiuqSqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onH0r-004j0i-Ft; Tue, 25 Oct 2022 10:18:25 +0000
Received: from mail-db5eur02on2112.outbound.protection.outlook.com ([40.107.249.112] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onH0d-004iuZ-GU; Tue, 25 Oct 2022 10:18:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVDFdosfl9lcxttBQGpwtfwv4RRtsGwmgtLCSBhviXBP9Y5Wvj5xJczThU8Sui/0ngfj0YMzWV9WvTEUOCwEw2Xsyo1UNZvn9Qb64il9tF72rEv+Pcssv93nP3kpjgLkziLUYCbbCYKdB02an2whzgR87lvCVSmjSmACHEs1AL0IzqdiSsAbIrU8HbnAQBnwFSJiqZQNXXYQA0MVf1E7UriV1ySp58guk+XKfVYnEdVrebN7T9DfKnzEfkSF/lOzQ+oTlC4xaE/qYm4NYYwPdwWQt35ZPhvzS9DMGZMO/xuUO1cHdFv3rGmFriNGw/a7e6nMdtil83qpjYcgavD/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQfE0CYlWPJ/xPsuL9EtH9SgU8dna71cdVrF/KPF7ZI=;
 b=oKb2V+t6VD0nHkplviOmnsKZIYuPta4q+g4aKz48T7FcPkRnHPPpEyA8pfbIETg7nEgrzGZxt2mcceNzEmLzOzbiuLTg5tuQQEW+o0NXcNb0S/fiQTehr4C+nPfibQz/xVg88NTGEG+a9LJ98j3/enCt+BGJHBM6jaVv+CKnLdBjl1Zmj3b3frSbrt0FRPDgji4uzGMnZ5EvzMD4RmOKrNIDdZiZpmWYaEcjK7tQKPRbkHXs8EkrWcmSeO33lIou3sSUgA/cFW9qBdHJtANv0x/JawsQShHZkT4R0TwED6cz06sexSSLm+6zXWX1bJF5WAyhFnueqehMlSQ6eNDAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQfE0CYlWPJ/xPsuL9EtH9SgU8dna71cdVrF/KPF7ZI=;
 b=ZgnNO8vhAwyb5TVwf+87vutUKpHa9ot1SiDjThosHJ+lf2e1mh9g33ThuLkZ6CbtXQDIAeAgm2UszM4Cms4RUOSEFcfpz6wcwvgMCskmDGlWzG4PPqq/NQENYxE6Allg71od6aUVvDumNdZQiNzw1qPY2g16bM/bSHZmQP3Gvds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=plvision.eu;
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:38::26)
 by VI1P190MB0733.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:121::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 10:18:07 +0000
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::2b03:a6ec:3529:b969]) by VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::2b03:a6ec:3529:b969%5]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 10:18:07 +0000
From: Vadym Kochan <vadym.kochan@plvision.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Elad Nachman <enachman@marvell.com>,
	Vadym Kochan <vadym.kochan@plvision.eu>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT scheme
Date: Tue, 25 Oct 2022 13:17:10 +0300
Message-Id: <20221025101713.11893-2-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221025101713.11893-1-vadym.kochan@plvision.eu>
References: <20221025101713.11893-1-vadym.kochan@plvision.eu>
X-ClientProxiedBy: FR3P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::18) To VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:38::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P190MB0317:EE_|VI1P190MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2c051d-3a45-41c9-53e4-08dab67235b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ywk3RQdmhgmetWTRy1foH2K2cotDe+87INiF6XKOZ4G8LeDcbMhz6R/d0d224jNfxKWwZdO4+XxduCysU6Lcoz21482nrsAsJeKnkYzLC+j/zJXzQg+vL7gzRcN6rcMC90QQ8JKfz6OvK1hSvrCv1My142KP82jkUJ3tn52HHGiikXs5az7mPRdBfrATkQ9xyE7dip9ArFzWdv94OfLrNVVyWAThc01xWeze2V6Drp9NYaSZlL3CzFuEC65wpo7bIa6VvsdNkGmt0hWzQ0J1zT6CIkAp9KBSCRUSvE83gNeWD0ujvRDHykyDIjEQDfIbINZMBkpxONlV/nTUI20SufTGQkX4TPx0p4hE4T2FAuFk+zCvDz9uAASd08ot4HjCrh0g1mDy3E8NQ3YkusETXyA4iqQlGd8USQAdrB/Y/AinoJCj1YBRZBxVAkhDlm+bAIj6lImfEg2dAQuczkC93VDF8EUArkVBThxVRT3JX3ZjfLRLXR/9vjzWS/FwjQEvgU1j1GAchmRUlvTbIBY4GTLebgvp7Gcn03ZV01dLPW2Gh/5jt3KcTlbDCqoAcD4dt7prKYUWuCnPSMpDvyQksOE3BcV7XhfVJj7CcsP52QChMWN6IV5e4Uj63C/y8KtmTdlH4ZI0xhR0VQbiCbB91/JGKIe4oKxaIagerewjdbGvXWoKTeMkmSiMihanq1dMkbIc57Ob7OyNJPUoKcj32ZW+gtFbaQipZtqh1B9XBuOqlwTh4h+pVkL4PC/fTYQAQyrYgahg5wP2jE0Ipu3bVT1sMFdijvQq0wJtdggG8Wz0p0VBk7svVfJCVEKI7pAR
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P190MB0317.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(34036004)(396003)(39830400003)(346002)(136003)(451199015)(86362001)(36756003)(38100700002)(38350700002)(921005)(2906002)(5660300002)(7416002)(83380400001)(44832011)(8936002)(41320700001)(30864003)(6666004)(52116002)(6506007)(186003)(2616005)(1076003)(26005)(6512007)(66946007)(110136005)(54906003)(8676002)(508600001)(316002)(66556008)(66476007)(6486002)(966005)(41300700001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?LpI8+ZcAfHb7ehoK8MfiND+POJDgs+eD0yFAme0DW+2HZSEG4A3IBJK//2Q5?=
 =?us-ascii?Q?6T54+sGZz3uMDV3awIIgFqWvzuw5RYt97emEI3LenDR4fDvH3uYa2WpCUnDf?=
 =?us-ascii?Q?JV2YijAGmX4bpu5Hxpqpa0lAxxoAdURwTI/KF8pTh71Lweb9Cpt4rOhGZzjM?=
 =?us-ascii?Q?uYP20cEEvtnFZVX+hXt4uRlpn9FD4vVoG5BezWEgJ8S6mPTwGPRyHA/VUeOG?=
 =?us-ascii?Q?7Rkb4av3r1YWuy4m5ARQ4qda6UzN5WRn8GwERVAa7L5ifrEyPxfMVQ2hK8cf?=
 =?us-ascii?Q?EXrcs0V7yhJks/M1iXrcRQcpYTdqEZnPazk8zmz2q1KhpXxj7a8av4EcnZsC?=
 =?us-ascii?Q?j1e4vnFRIvHwSgGIOEede17VMicg86vyUq/3qJf9NFoxZ6YIqzLss9eG+h6Z?=
 =?us-ascii?Q?b5TcbktmuIgrbcxNjul2wmlTw7Blrkg34GTEG/wVdMwypP3Rgq6gZZbgC3gY?=
 =?us-ascii?Q?FgP6EhDoj8fD1YQ6cQy08lTmHpx8jaItiymjoU8qK8FcpoWyhAYr9N6VipO5?=
 =?us-ascii?Q?7fdpHzuGdkzbWZJS5lpX2FnGzEDzDmoMhWfCPC1N236Qb3/EobfYRWgwFXjs?=
 =?us-ascii?Q?McArJOVcEQUkHFQ04+/+dz84H+6MKykXrhARAcYWrngthWlT0xcBYaFH03/g?=
 =?us-ascii?Q?eixDRgD8DOOcH+FC7vg6munOdPPvShuiBILASoFYNZdAF1y7SumycDsKkXnz?=
 =?us-ascii?Q?zMMVaafl7ZN+4nul7gXZrk5+VNuY0mI8H+qjFPX5NNoWdVfqmZMlGToEgnAC?=
 =?us-ascii?Q?PfbVRycxpaqF34nJDKesTp8tbb2GRwMwcFFYDjkxegEzsNe4nMMrZhbkaHVH?=
 =?us-ascii?Q?595Ya5w96oLD0zkXHKuTKn9f9EXllVqVDYNO2GYgdXCK/UKUvjkwXE/D7laR?=
 =?us-ascii?Q?5NAn2jaF2ZXJDNoUC49ET827yVntHmzvJo61bk/DzjcfqV7Jl1yviG2fwLbL?=
 =?us-ascii?Q?MRbu1prnWhYoyEQwaDGz8ul5cHozf0sbaRmkWfarYJeHAPbxLm6LGiGMKrmd?=
 =?us-ascii?Q?UxZIQd1dKG2nZNxszwDKM1QJ1IPqgDDUsWZPUuNwgTeNaPcRGMgXUEmE+A46?=
 =?us-ascii?Q?LvaZ+VveiGT8bF78C7fSn2WE46vf3uplWctc4z1/GCVASNtmh/Wci3U1IkI3?=
 =?us-ascii?Q?E0nTkaVETKz8L2eoOpJWwu1rJl+GFwjG80/sHxG4t5RZ4ODRVUGAoCdQGVuv?=
 =?us-ascii?Q?M4REyphSUKmLtoljWDHVOP1e8ZDiuinZ7U1sVtlIVObwR/6ee8nM11rI0Ddj?=
 =?us-ascii?Q?37hXjVRJK5iZrLNfzSqopf0YwhUi09mPwzOqFr+Ayhly7xuz5SnCX3IDNVTZ?=
 =?us-ascii?Q?GJwmBSGBkJ5J9a91Rh/Tth9VA7Nb/lgviYXljSYp0aZFBqfr22xAKdc+3FKE?=
 =?us-ascii?Q?NjWZa/VibyCM9cdipXX6thD7Dfgk54OylSA7Cu3D0qTzeA0SKt++5QEhjrwu?=
 =?us-ascii?Q?ZcYIauTm1bkUAfGH0I99eHkjlg1Mjj2z34HiqPuqSxGpPp+9jib9bcZP0fPZ?=
 =?us-ascii?Q?8CUbKByCrTRJXjhq4CS0UdVKBhb+w1NJoyqmY8ITFZTsx45RYb4HcXqAx4K9?=
 =?us-ascii?Q?0WGtkkwWxUtcqPaoqcO2/87aD1dUzJrXuzGMkTw1nrM/tDPzrbT7EAEM1u0M?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2c051d-3a45-41c9-53e4-08dab67235b1
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 10:18:07.1093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Oz/CAlO5YXDwyoII9u2j+vEnrR6hcb2IXKlVfGjzGEzpNFIjmCB+cdZFj69pJcKonKDRCosc7AbTShOsBf1lhrxqTRnZZwwtW/ZnfOk9J8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_031811_589750_D679B357 
X-CRM114-Status: GOOD (  22.48  )
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

Switch the DT binding to a YAML schema to enable the DT validation.

Dropped deprecated compatibles and properties described in txt file.

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
---

v4:
   1) Remove "label" and "partitions" properties

   2) Use 2 clocks for A7K/8K platform which is a requirement

v3:
  1) Remove txt version from the MAINTAINERS list

  2) Use enum for some of compatible strings

  3) Drop:
        #address-cells
        #size-cells:

     as they are inherited from the nand-controller.yaml

  4) Add restriction to use 2 clocks for A8K SoC

  5) Dropped description for clock-names and extend it with 
     minItems: 1

  6) Drop description for "dmas"

  7) Use "unevalautedProperties: false"

  8) Drop quites from yaml refs.

  9) Use 4-space indentation for the example section

v2:
  1) Fixed warning by yamllint with incorrect indentation for compatible list

 .../bindings/mtd/marvell,nand-controller.yaml | 187 ++++++++++++++++++
 .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ------------
 MAINTAINERS                                   |   1 -
 3 files changed, 187 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
new file mode 100644
index 000000000000..71c870867552
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/marvell,nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell NAND Flash Controller (NFC)
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: marvell,armada-8k-nand-controller
+          - const: marvell,armada370-nand-controller
+      - enum:
+          - marvell,armada370-nand-controller
+          - marvell,pxa3xx-nand-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description:
+      Shall reference the NAND controller clocks, the second one is
+      is only needed for the Armada 7K/8K SoCs
+
+  clock-names:
+    items:
+      - const: core
+      - const: reg
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    items:
+      - const: rxtx
+
+  marvell,system-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Syscon node that handles NAND controller related registers
+
+patternProperties:
+  "^nand@[0-3]$":
+    type: object
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+
+      nand-rb:
+        minimum: 0
+        maximum: 1
+
+      nand-ecc-strength:
+        enum: [1, 4, 8]
+
+      nand-on-flash-bbt: true
+
+      nand-ecc-mode: true
+
+      nand-ecc-algo:
+        description: |
+          This property is essentially useful when not using hardware ECC.
+          Howerver, it may be added when using hardware ECC for clarification
+          but will be ignored by the driver because ECC mode is chosen depending
+          on the page size and the strength required by the NAND chip.
+          This value may be overwritten with nand-ecc-strength property.
+
+      nand-ecc-step-size:
+        description: |
+          Marvell's NAND flash controller does use fixed strength
+          (1-bit for Hamming, 16-bit for BCH), so the actual step size
+          will shrink or grow in order to fit the required strength.
+          Step sizes are not completely random for all and follow certain
+          patterns described in AN-379, "Marvell SoC NFC ECC".
+
+      marvell,nand-keep-config:
+        description: |
+          Orders the driver not to take the timings from the core and
+          leaving them completely untouched. Bootloader timings will then
+          be used.
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      marvell,nand-enable-arbiter:
+        description: |
+          To enable the arbiter, all boards blindly used it,
+          this bit was set by the bootloader for many boards and even if
+          it is marked reserved in several datasheets, it might be needed to set
+          it (otherwise it is harmless) so whether or not this property is set,
+          the bit is selected by the driver.
+        $ref: /schemas/types.yaml#/definitions/flag
+        deprecated: true
+
+    required:
+      - reg
+      - nand-rb
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: marvell,pxa3xx-nand-controller
+    then:
+      required:
+        - dmas
+        - dma-names
+    else:
+      properties:
+        dmas: false
+        dma-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: marvell,armada-8k-nand-controller
+    then:
+      required:
+        - marvell,system-controller
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+        marvell,system-controller: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    nand_controller: nand-controller@d0000 {
+        compatible = "marvell,armada370-nand-controller";
+        reg = <0xd0000 0x54>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&coredivclk 0>;
+
+        nand@0 {
+            reg = <0>;
+            label = "main-storage";
+            nand-rb = <0>;
+            nand-ecc-mode = "hw";
+            marvell,nand-keep-config;
+            nand-on-flash-bbt;
+            nand-ecc-strength = <4>;
+            nand-ecc-step-size = <512>;
+
+            partitions {
+                compatible = "fixed-partitions";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partition@0 {
+                    label = "Rootfs";
+                    reg = <0x00000000 0x40000000>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/marvell-nand.txt b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
deleted file mode 100644
index a2d9a0f2b683..000000000000
--- a/Documentation/devicetree/bindings/mtd/marvell-nand.txt
+++ /dev/null
@@ -1,126 +0,0 @@
-Marvell NAND Flash Controller (NFC)
-
-Required properties:
-- compatible: can be one of the following:
-    * "marvell,armada-8k-nand-controller"
-    * "marvell,armada370-nand-controller"
-    * "marvell,pxa3xx-nand-controller"
-    * "marvell,armada-8k-nand" (deprecated)
-    * "marvell,armada370-nand" (deprecated)
-    * "marvell,pxa3xx-nand" (deprecated)
-  Compatibles marked deprecated support only the old bindings described
-  at the bottom.
-- reg: NAND flash controller memory area.
-- #address-cells: shall be set to 1. Encode the NAND CS.
-- #size-cells: shall be set to 0.
-- interrupts: shall define the NAND controller interrupt.
-- clocks: shall reference the NAND controller clocks, the second one is
-  is only needed for the Armada 7K/8K SoCs
-- clock-names: mandatory if there is a second clock, in this case there
-  should be one clock named "core" and another one named "reg"
-- marvell,system-controller: Set to retrieve the syscon node that handles
-  NAND controller related registers (only required with the
-  "marvell,armada-8k-nand[-controller]" compatibles).
-
-Optional properties:
-- label: see partition.txt. New platforms shall omit this property.
-- dmas: shall reference DMA channel associated to the NAND controller.
-  This property is only used with "marvell,pxa3xx-nand[-controller]"
-  compatible strings.
-- dma-names: shall be "rxtx".
-  This property is only used with "marvell,pxa3xx-nand[-controller]"
-  compatible strings.
-
-Optional children nodes:
-Children nodes represent the available NAND chips.
-
-Required properties:
-- reg: shall contain the native Chip Select ids (0-3).
-- nand-rb: see nand-controller.yaml (0-1).
-
-Optional properties:
-- marvell,nand-keep-config: orders the driver not to take the timings
-  from the core and leaving them completely untouched. Bootloader
-  timings will then be used.
-- label: MTD name.
-- nand-on-flash-bbt: see nand-controller.yaml.
-- nand-ecc-mode: see nand-controller.yaml. Will use hardware ECC if not specified.
-- nand-ecc-algo: see nand-controller.yaml. This property is essentially useful when
-  not using hardware ECC. Howerver, it may be added when using hardware
-  ECC for clarification but will be ignored by the driver because ECC
-  mode is chosen depending on the page size and the strength required by
-  the NAND chip. This value may be overwritten with nand-ecc-strength
-  property.
-- nand-ecc-strength: see nand-controller.yaml.
-- nand-ecc-step-size: see nand-controller.yaml. Marvell's NAND flash controller does
-  use fixed strength (1-bit for Hamming, 16-bit for BCH), so the actual
-  step size will shrink or grow in order to fit the required strength.
-  Step sizes are not completely random for all and follow certain
-  patterns described in AN-379, "Marvell SoC NFC ECC".
-
-See Documentation/devicetree/bindings/mtd/nand-controller.yaml for more details on
-generic bindings.
-
-
-Example:
-nand_controller: nand-controller@d0000 {
-	compatible = "marvell,armada370-nand-controller";
-	reg = <0xd0000 0x54>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&coredivclk 0>;
-
-	nand@0 {
-		reg = <0>;
-		label = "main-storage";
-		nand-rb = <0>;
-		nand-ecc-mode = "hw";
-		marvell,nand-keep-config;
-		nand-on-flash-bbt;
-		nand-ecc-strength = <4>;
-		nand-ecc-step-size = <512>;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "Rootfs";
-				reg = <0x00000000 0x40000000>;
-			};
-		};
-	};
-};
-
-
-Note on legacy bindings: One can find, in not-updated device trees,
-bindings slightly different than described above with other properties
-described below as well as the partitions node at the root of a so
-called "nand" node (without clear controller/chip separation).
-
-Legacy properties:
-- marvell,nand-enable-arbiter: To enable the arbiter, all boards blindly
-  used it, this bit was set by the bootloader for many boards and even if
-  it is marked reserved in several datasheets, it might be needed to set
-  it (otherwise it is harmless) so whether or not this property is set,
-  the bit is selected by the driver.
-- num-cs: Number of chip-select lines to use, all boards blindly set 1
-  to this and for a reason, other values would have failed. The value of
-  this property is ignored.
-
-Example:
-
-	nand0: nand@43100000 {
-		compatible = "marvell,pxa3xx-nand";
-		reg = <0x43100000 90>;
-		interrupts = <45>;
-		dmas = <&pdma 97 0>;
-		dma-names = "rxtx";
-		#address-cells = <1>;
-		marvell,nand-keep-config;
-		marvell,nand-enable-arbiter;
-		num-cs = <1>;
-		/* Partitions (optional) */
-       };
diff --git a/MAINTAINERS b/MAINTAINERS
index d7d76760ef93..9b165112be3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12344,7 +12344,6 @@ MARVELL NAND CONTROLLER DRIVER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/mtd/marvell-nand.txt
 F:	drivers/mtd/nand/raw/marvell_nand.c
 
 MARVELL OCTEONTX2 PHYSICAL FUNCTION DRIVER
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
