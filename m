Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB8DC7EE30
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jun 2025 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8iQEBkbbKU3MB34Em5zYaoQkY3Fgw28fWttwTuOJBMQ=; b=4D2GQ15Ohn2y5d
	ftsS6JxbQE5D7seMxmNuJlpEQc8K8flUEJVOPZZSTw+P/fhZSWAYqoUQ68dFBalpq5mVFo7qYpug0
	INdx9sH/Ht2K92keeeO7ldo66ELaeH6xp49y1QdNLNtbEM3BGsH6W5GaE/84djxsYnilpzBH3EEcA
	zzKUmhhqx+gQb39qM7xEppIfx4z/qftey89N4z2cqwAnOTLF9H/uriTa6Xdu2NWDmPObUuCUqZG5i
	p0MsqPmyzqffoAZr44R6O3goji63o7cDXtnEIpgAD8iCueBfM6LD9XyHMKPF/AXq5DRFiYgtaUqUy
	vUHK7ITTiNhafb/Ldj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgSu-00000002jCQ-1Bnl;
	Mon, 23 Jun 2025 12:40:00 +0000
Received: from mail-bn8nam12on20615.outbound.protection.outlook.com ([2a01:111:f403:2418::615] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTepN-00000002RqV-1uzU
	for linux-mtd@lists.infradead.org;
	Mon, 23 Jun 2025 10:55:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUfqVekl+YtTV+U5mMK73ttZuHceyGghEJKgU+Vu3SVRZvgI+a2NlGysXwGuXriX4QHs3GG6mYgwupzte4RDjfjAI/W4s9SX3HY0asydvm5S9x4ZVl6wpnXq5qKa1yNhu8jmG5/2obrZgRctCXyZwYM+udTBTVzA1Trj6PSJyHNTaqkHaK8l6gjHgJgvWJgK8/jQLADg0IvYGnguHg5U9NtstXj0gorIPx6naAUIFAErGWIUn+t7aCynOUUDuIOYUgzAp+/kFjA2cyZGqDeb1YW1SH0M9MTqHpzqA53H5F09oP149igJ+UqomflL4HhpskrtjnEw2KRv2XBuE3lk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07bqDF6NJsV60aR26XaGJpMTVrEdYlO5M/5TPYeLStM=;
 b=mzMSoXr/eK413H1qZkGkW+3wBSTNlpztHgoIpGegSmob+qYW63tPCR05cPYK+CxxojDt8dMWOxOor/SydCTYpFHfLd76nND3QCZsT3zyFZn7iT2mz0au/S8FP4xoDm7/YOdgxIhGXrzGbYH8/bBjae0O6WL20Kxf6HP2RLkX8VuplWG/zjvkqRngIZEK0IPfzoz/7fcUR5b1nrrKOZWiaqTWyj5Y2eW1fpEajZNmqCgc76QwknMN+UHt+VLpeGwdNYSFx/CAc0JDuHQ40gk8B7XQDL+9GpdFFU4LuA9mphJ0+27Fz+B/vvzvQA1Gm1zdzt3IaHcFghs4kdexmyinIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07bqDF6NJsV60aR26XaGJpMTVrEdYlO5M/5TPYeLStM=;
 b=QA5rBx65TEdW9QGf6ZAkLSDCPMWP2RPbIUnxA+3Uozi4KvZGmpbQ1IDtL3adp9I+spVO1UW7/FWpmRG/ogmxRYAYzqNOxF8bim6LP7n5hnBsHp0v9DdBLMreFD4Iy41yqB6ePdEfceMLERZMwfC8CMH6hFoopgCZVYkYLPTio/8=
Received: from CY5P221CA0138.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:1f::29)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 10:54:57 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:1f:cafe::b4) by CY5P221CA0138.outlook.office365.com
 (2603:10b6:930:1f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 10:54:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 10:54:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 05:54:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 05:54:54 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Jun 2025 05:54:51 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [PATCH v14 1/3] dt-bindings: mtd: Describe MTD partitions concatenation
Date: Mon, 23 Jun 2025 16:24:43 +0530
Message-ID: <20250623105445.2394825-2-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623105445.2394825-1-amit.kumar-mahapatra@amd.com>
References: <20250623105445.2394825-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|MN2PR12MB4222:EE_
X-MS-Office365-Filtering-Correlation-Id: 53514971-8992-4726-2c4d-08ddb24463f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pwp8YQfGejLGIv37HchE03FEHL6fP5OUJzE3DUGQgb7LgaqVmzx+EwMbFIUE?=
 =?us-ascii?Q?2NIH7doxD1FfHcWos73mWHfFExlYOsS2EGHaeAG7SzMZriaPZxWQep19BcIO?=
 =?us-ascii?Q?xJ19/exoxEAULfbdD4721mB/it4cBIif7M+EtAFgP/+4CckXD0NfpYZ8Ngn9?=
 =?us-ascii?Q?3X2mXwV9UPYwKadALlZZeW5S6vsi+khb5iP9eMTBMJ/ATSjl3ftNfAmp8cXf?=
 =?us-ascii?Q?VczhWXgTH5JCThwCk3hvMicbDptaI64HPHQkc2AB2Cscr5ecHu+ahYBm4qHl?=
 =?us-ascii?Q?LsN0qga8NAxVRlp9VKoiDZgnFRNPTs/F5kQnN8ULbmCHbIVO3YIgSmWdngT7?=
 =?us-ascii?Q?vi9ZiXIAobXtWzBepGm6Qw9W6uvD/cuKTqQBh/ThB4QmD4sjkjO6d5GAlvS3?=
 =?us-ascii?Q?M1gbDnp6tCqb/G7+3KwF+Zso6dz1E/SJfqNQRZjcGu2shfb6Ryn+DryT2nuU?=
 =?us-ascii?Q?6br3Mz2b2mYErpwyvkx701C7Xk03GLZGMyS7jOPdSOcrJE/H3bXz139hyFYn?=
 =?us-ascii?Q?goV4UH7jlTEatdSgqtDK7mAGyiyFRcvRdtyZOTbn8VpQxicK+JHyhCFtLaU0?=
 =?us-ascii?Q?HAY+2L1wB1iBq8PZcwvXxVCWmkpU78XSEMVPFqn6xF0AQggLDoXautavEl4Z?=
 =?us-ascii?Q?ssbDYedXXhRsMg1C+zGk0w5XmQrLPid8sggFhVVbnyaCn6tan1E8uioBiByp?=
 =?us-ascii?Q?YWJMT8bPWwLxGT4EbbaOMcv30Ay0oXGxL30Mo06Tt6Q2N4bwVmxHXbsWdEK8?=
 =?us-ascii?Q?4LNls6R2BhzsGsSkUwrdIFTHk/hQcSRQEoo5LUVylRKOhYHG0WvCXgRfIG+m?=
 =?us-ascii?Q?Gb9/xkAndvdFDINCkLiP9r56mTR5+OgOiL0U78QDC578BTJsti/6kPZp+nb3?=
 =?us-ascii?Q?t7G8zFAELvPH4m+xm/XZLQbRVoGNmyhirur13kdAHreSUgPQwMPEsy/wR/tq?=
 =?us-ascii?Q?nHZ87njPocEqnzh5rSKZJ70z7aIQHwumWYdAdhCgQkhprQVg5/6xFjybTEZD?=
 =?us-ascii?Q?/AK90jmT/gveGIpFkrT9KWtErOLWB5bzZ6nJ41b6UPc6kIkNdMEJ3vXRsNC9?=
 =?us-ascii?Q?oGggLGQUp/RPNSZzgb+A9ybK1CxW2MIu6xhlljZNX1ToQLhY95r4R54Xng/7?=
 =?us-ascii?Q?kwCIse5WSEKwjLfTG4BQqXgRZRfNO1dTAF1Nck4sQjZh0Rxt1QxR9gpiFg2Y?=
 =?us-ascii?Q?63etI5yB2+fJUCr5ToLEVfvLCVzL0SBf7X/K2OEKOIRs2umpK8nbeYIYcZxI?=
 =?us-ascii?Q?dUHjQnHgJA2Rimt2HXHPyRdPGz9GkSpXmsIktjkhZhAFv+OJZDWRKcvM5Xlr?=
 =?us-ascii?Q?P+7/73oDkJsinPH3zNKuDungFMj/KVoHlaSqOgTQRnpC/fMUOKzIetYTrBNP?=
 =?us-ascii?Q?W1WK3KM3Gtnjj6aU2c8rKk2Q3UAwwheUnS+3ewG5bxytXtFnPxDdyX+4kmHf?=
 =?us-ascii?Q?TuoTNIhDsEbIY2+o3mUopQ1+JBE7OLmIEB4s9zT4nm8xFaoPVwkG2ouRf8MB?=
 =?us-ascii?Q?lwRTRZwGZ2DwpB2LFIESJx+gXjm4ahhNZtxK77df0aoNFrG6Pr0ygSG/QA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:54:56.0069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53514971-8992-4726-2c4d-08ddb24463f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_035505_513867_331DD7CF 
X-CRM114-Status: GOOD (  12.75  )
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

The AMD QSPI controller supports an advanced connection modes called
Stacked mode which allow the controller to treat two different flashes
as one storage.

In Stacked connection mode flashes share the same SPI bus, but different CS
line, controller driver asserts the CS of the flash to which it needs to
communicate. Stacked mode is a software abstraction rather than a
controller feature or capability. At any given time, the controller
communicates with one of the two connected flash devices, as determined by
the requested address and data length. If an operation starts on one flash
and ends on the other, the mtd layer needs to split it into two separate
operations and adjust the data length accordingly. For more information on
the modes please feel free to go through the controller flash interface
below [1].

To support stacked mode, the existing MTD concat driver has been extended
to be more generic, enabling multiple sets of MTD partitions to be
virtually concatenated, with each set forming a distinct logical MTD
device.

A new Device Tree property is introduced to facilitate this, containing
phandles of the partitions to be concatenated with the one where the
property is defined. This approach supports multiple sets of concatenated
partitions.

[1] https://docs.amd.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Device-Interface

Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 .../bindings/mtd/partitions/partition.yaml    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index 80d0452a2a33..c9aba6838b3c 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -57,6 +57,15 @@ properties:
       user space from
     type: boolean
 
+  part-concat-next:
+    description: List of phandles to MTD partitions that need be concatenated
+      with the current partition.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 16
+    items:
+      maxItems: 1
+
   align:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 2
@@ -138,4 +147,15 @@ examples:
             reg = <0x200000 0x100000>;
             align = <0x4000>;
         };
+
+        part0: partition@400000 {
+            part-concat-next = <&part1>;
+            label = "part0_0";
+            reg = <0x400000 0x100000>;
+        };
+
+        part1: partition@800000 {
+            label = "part0_1";
+            reg = <0x800000 0x800000>;
+        };
     };
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
