Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77D2C02192
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2025 14:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzslQ/rKpQzSTSlGjlTP4VzWsKGz5T9SyLrOpjwqewM=; b=AJg1F0YI1Hsxy/
	Xk7nsTQlbJugeLqYCeHPNLMTGkr0w1I3qi3n3NxRW29UYf74WFyOwOvNinp1vNPwbyIdhUfXrYOoA
	Dj7m+A0zGqNCSGDvaK99qsh1hBzlitqx39rZv2KeNhSLKbe580Yw1+4Y7lncotebUZaBW7RZcgRrN
	f/vqjr+u0053ARcNDj+sfIcC9JDWyQkN4KXb5Q6PDppwjL3bUZ0Gu9YAYPe45CijUPrNmJPX9OCxT
	xRPgd966tBJ3gqlleFweUJ1bxte5Gr8B0ChYgVC89+bseOurai1VBtnrOFDJn+ZN4TL8UmxtN3FNE
	yTgnxz0T/LLrD+WN9ZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffxo-00000003TiE-1PZo;
	Wed, 05 Feb 2025 14:01:12 +0000
Received: from mail-mw2nam04on20603.outbound.protection.outlook.com ([2a01:111:f403:240a::603] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffpq-00000003S15-1xoM
	for linux-mtd@lists.infradead.org;
	Wed, 05 Feb 2025 13:52:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5cx7NAB1zWkCpU9/Qv7r7ju+5t1TDAHzIhc9Lum5ZtamKf3ENW7pXMfzgMOBZ4I2QcztMwkMnTk1e7RmnCROw8C5GX7LoEW6aybGhtH+gonxoJQ8zuBafgyB24UYwCrSWpYdjDsivemfxZyUy3Sj09ecTWQhQzkr8Af/OohOPqw4Ukh7Spdvl4CsEC7Q8uLfVMrO0GiWUBPrO0bCoACYjKj3jF9WLbsgzxfMmziFYmiVMvTkJo1KpmA/nHUy5rG6xULOnz9fyj6jbdDkqP5603899GsLmB7xz8AHOTBcvca8Ha5cfh/L9nrtHfeD/1gWbYdWXidi5UqYtiW3A8qGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yObSJOw1LqKBf4W7VNzSzL66WNn1WJS2eGn+hE8X68s=;
 b=pR3AJOpseiqSQgniL/9dJfBm/LTdgYrcs+6MBE3YKeFdtRBKheSC5FuE0MSJC4gWyO2WOCrXueS3LLtH3JVTmp7HE740Ae7udp/JJ5Q15ZWjvNQDjlrhFhrffF65XFxD2NLwBuQEAPMObqwBHe+rY6xqyiZs9IAwfbpEJjjMmdF4qxrvn0WWvo7rDDYZzVjUpkF0Oy4bvB+Hdloc5cCspb3CEEDBLr9deUtnLKw9tPhnUM0vzbNv8eyF2EmJYmBMuXnYbjLvdGohCdTfHo7yOwD8HGG6bNnMjjjqhI2b6/mHGw46Qc8szTtV2EgKYV7/uDDRcmB6ZRzxfgOFDWqx1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yObSJOw1LqKBf4W7VNzSzL66WNn1WJS2eGn+hE8X68s=;
 b=3ZdJJB/V6Irb3ZTk6+qPAuyuPdDsgPOWvGaoGYKJtx5650ubrpEzJcxjjEHT0JZdTc+fi3rFYnGIO4iqoad1nyEb9hsvW64Obxt6znuLOF5LJkZhXpxA8iYAMUNuoa426k1S0vj4kfz2DXgM9kRmO4oGRE8WJgmv+fY6gvlEwRw=
Received: from MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27) by
 LV8PR12MB9418.namprd12.prod.outlook.com (2603:10b6:408:202::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Wed, 5 Feb
 2025 13:37:42 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::e3) by MN2PR01CA0058.outlook.office365.com
 (2603:10b6:208:23f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Wed,
 5 Feb 2025 13:37:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Wed, 5 Feb 2025 13:37:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 07:37:41 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 07:37:40 -0600
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 07:37:36 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [PATCH v12 1/3] dt-bindings: mtd: Describe MTD partitions concatenation
Date: Wed, 5 Feb 2025 19:07:28 +0530
Message-ID: <20250205133730.273985-2-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|LV8PR12MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: f9aaaee9-2829-4150-c608-08dd45ea43cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J9Helc6zmA9V7Ep22rHUvFA4hzrWPwMbLcZvJ76f4UMt5CDsPucWo62SEuCG?=
 =?us-ascii?Q?ST9NYHb0yZsY0PJ7S8g02nOezrXWB+VG9nAuvPt+UxyJOjNtQh4KThtHGq4c?=
 =?us-ascii?Q?Df4hdx+X2FkDaj6CjZyHPRkMrJpMUuwV2x442gTa+N8XOL966p73HQsEtq/E?=
 =?us-ascii?Q?F7V0N6beq65/V+Eh/Xysv6FJAU2fBws+grrdmBjfA6BdO7RAm3X8A5EajDc5?=
 =?us-ascii?Q?f9jvMUIVo2CfpEnJzHQyZQ+4HYVLWx6BsevOIajVyS+aFCyzfcqfzmAFz0pU?=
 =?us-ascii?Q?umy9MPFE5dqerEoH6P+1sMFYezKxoEUyYSwh0px6aSgFUlL4R0Iswrx37dB2?=
 =?us-ascii?Q?s0u+smuxpRoSQPlMaRvN8GcKDWh+8W65Be0SnYD19d18/nOTSsrZcvHRQsgR?=
 =?us-ascii?Q?iYqPSn080bl0sDNYJaJgi5FQdK990L0L4Q7MQ4OyIXpmeuy84LyLZ2T4W5Fh?=
 =?us-ascii?Q?XBUS/P2FuL+FMs4RcggahF96l/KETRtYAxvs3oCT463cK2m/CTbo75FAgnRA?=
 =?us-ascii?Q?F1oIxkF5l2WXmNsvGL/xmUAwk/i8F3DMk6J1Ifr7+Q3u+/P6OwlkFJgl6nQo?=
 =?us-ascii?Q?bNyTeJ1fiY7k/1wQTu1ev3ZBoeMwSNTdnO+9CakgK8a3HEWXJ6l9JZGCZD4p?=
 =?us-ascii?Q?SbjuUBUuIH9KAjBW2onK43bGG5etde0AY4LWfQ+4u6lEVIthZwYP4RndLcpL?=
 =?us-ascii?Q?lcPILUNmFoZ8gS5ZpFNUtwrF0REw/eU6NxFOpyXJgJAwL+cIBDDK6AiM7uYH?=
 =?us-ascii?Q?z6C17owFSaow+uyfJAqotFU31Kw3kV/ODZ5RVTww+MFJYYi5bSy/J8QoIfPd?=
 =?us-ascii?Q?VqcGfsMsRkBJ0eb9X0Sd6CuGwUiL9/G75KiMeO3G8Qepk3IT37esBr1onPez?=
 =?us-ascii?Q?pf67MX1j66jsHsRKRY127jTNElllBQUht2UsRGjCdwr5/8UBLeR7fBVZhBc9?=
 =?us-ascii?Q?KfRSMaCqzX86sINljuSuEuzQBDJkbEATuTZTKrkamad4RXfy41pmBrV8nEqL?=
 =?us-ascii?Q?YavyS7F7l86oNOvJDTPzMtKz40UEW0VI+n7MK9jYzWXDTX/D2g3Zlz+UZNQz?=
 =?us-ascii?Q?DvpuLjyA399eRD68K5CXv7Opqzhdg8tS75OCU9W5zeraBWU3hXquFeT7S38P?=
 =?us-ascii?Q?z7MpKvO8ZgvkOtCScnEOgz78HHpNqkNcP8OnIeEoMYGTJJxKdB0l+QoQS0zM?=
 =?us-ascii?Q?dewUAEJCFdByPoqU83ysWV7lBbbCgml++Dejk6ao3+pltdMiBHOvDhohbd0p?=
 =?us-ascii?Q?3jM+TjXfmeK+oXcE7XzXxDVwjzWkSfBy0TtpG4UrPBHKSkyFttF+1YY5DQSO?=
 =?us-ascii?Q?9KdKsQ7U4VGvN7y66POZqNpXeyV8Acsg3d4gUQEuqWAAHwAtBcWaI5HmgDNa?=
 =?us-ascii?Q?+jS58rH8FifP6hrIDWTfebEErTqRkBJhqGRAhCA19HWHf8deIKLShGChBPPE?=
 =?us-ascii?Q?RAXtWmtZUDs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 13:37:41.8207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9aaaee9-2829-4150-c608-08dd45ea43cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9418
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_055258_506400_DFBEE0E7 
X-CRM114-Status: GOOD (  11.48  )
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

Introduce new DT property to specify which partitions are concatenated to
each other.

    flash@0 {
            reg = <0>;
            partitions {
                    compatible = "fixed-partitions";
                    part-concat = <&flash0_part1>, <&flash1_part0>;

                    flash0_part0: part0@0 {
                            label = "part0_0";
                            reg = <0x0 0x800000>;
                    };

                    flash0_part1: part1@800000 {
                            label = "part0_1";
                            reg = <0x800000 0x800000>;
                    };
            };
    };

    flash@1 {
            reg = <1>;
            partitions {
                    compatible = "fixed-partitions";

                    flash1_part0: part1@0 {
                            label = "part1_0";
                            reg = <0x0 0x800000>;
                    };

                    flash1_part1: part1@800000 {
                            label = "part1_1";
                            reg = <0x800000 0x800000>;
                    };
            };
    };

The partitions that gets created are
part0_0
part1_1
part0_1-part1_0-concat

[1] https://docs.amd.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Device-Interface

Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 .../bindings/mtd/partitions/partition.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index 80d0452a2a33..f77fef368211 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -57,6 +57,12 @@ properties:
       user space from
     type: boolean
 
+  part-concat:
+    description: List of MTD partitions phandles that should be concatenated.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 2
+    maxItems: 16
+
   align:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 2
@@ -125,6 +131,7 @@ examples:
         compatible = "fixed-partitions";
         #address-cells = <1>;
         #size-cells = <1>;
+        part-concat = <&part0>, <&part1>;
 
         partition@100000 {
             compatible = "u-boot";
@@ -138,4 +145,14 @@ examples:
             reg = <0x200000 0x100000>;
             align = <0x4000>;
         };
+
+        part0: partition@400000 {
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
