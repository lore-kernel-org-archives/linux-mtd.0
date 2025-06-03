Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AA5C5AD49
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Jun 2025 19:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcDPgHMmjayHoYFI6mCRZufaANEa6ZnU1VXtjjsYklU=; b=NeXFr4n4WE/DKB
	FcJdpH1ZKbQna/Ezjtszs57xz1wArlP4mc4FkpYjZ3KvNJUZdBF5UX4Dk6LztPPneUCuxiF9JX5Jj
	NuctcbQFcDHey9AyswjL6tuvj/Pe/dyESRtnIKuKh0PyhdpUo3gu7+kM6Z4wENQWY/T5eDmyfBxiW
	5taS6QUtGQL7w/Bqp/DoNtFkYgoF7l+8/ABb5NYb8yy6vF/GJjlA+hQ3ttAX5fisQmpZLs88jhpXh
	13+oPOiVraoVBAldRRywC8laas9+7YIevicPul2+/jWhIz4ve8equwu8jye/2h9iliwWPESSPdtHb
	lL1wOlOWjbNrNEHg0ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMXWp-0000000BjSh-0njl;
	Tue, 03 Jun 2025 19:42:31 +0000
Received: from mail-dm3nam02on20620.outbound.protection.outlook.com ([2a01:111:f403:2405::620] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMXWl-0000000BjR4-1tC6
	for linux-mtd@lists.infradead.org;
	Tue, 03 Jun 2025 19:42:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hC3Q88vSngzE+AOv0WJrOfDUw7+e7JWJ3YuqeuThb/PN5ajpqyennFReJ2KCa8zPtbU27bWTfOMZtvMwVHiJ7d2YjRKEJIUjuGh3DIuikFqMCxHsrzSx30yNNcIWgfHhXlODiUq3ascN/he3eAXJeSrW8hK1PEve30V1csuIaXSValiIncCyra99ipWAjBjfccoH2jXN4gyNeZj86uyGCm5ekrKvI5C3dQGL2HftQVEVIgYbEpz2Oulkg2mgDWRkdb63CPnStlO1NaDDonQ1Opa0jfSzUHYjM9mTrtqCOQO2zsUWxRLshXSk4ttOQDp/rIt7Ud/3IQk3TsUoQIWfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2WZOz/APZgFXSiDnQudSImjZ6lGmJC2RQxBA2ugTLY=;
 b=AFNzSKt9PBiHDfTjyJLud3T7iT6lVimegIq7519hSaVgAR+YEKuh+qeEXjyTC6FFNHzEXCy2efo61r9N92sBjCeX9QlIrG//7Zu9LhwR6awo5M8FSJQzwJXs+nx69icBa+bYZX1zTf8JJA5ARdTjE2il0PBEPZSamnpJLTy5/2+I+xHHiYtvcoMEGHsEJj71bsuFTNqmC69eh8suGXjkvEr4NdPZ6JBTd2VImza24521VAW/h7dQ9GnZZ8FwejHZklILbBZZEjRVoyk/Dd+pvhkvs35gmOxpzQqI59LnwhmlaGZvJq/i3PKBfY5VsNtYB30McV1pwf1rPFOLAJ6LYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2WZOz/APZgFXSiDnQudSImjZ6lGmJC2RQxBA2ugTLY=;
 b=1es27ht0QNs04eMnYUy3BPBJrbqQ4FrpkhesY8lWLyFaSvmXGaniuXzLirJ7UFnusdqm3/gOlbvmG/K8jI0HJCfEHX5HOo0Vb1MI0HmbF72H6mz6JoHmCenQJzhooWrGYxCxzabF7PQPSf2DkWyWw/pw8a5qEIQJoIGbE//GzTw=
Received: from MN0P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::7)
 by SN7PR12MB7954.namprd12.prod.outlook.com (2603:10b6:806:344::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 3 Jun
 2025 19:42:21 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:52e:cafe::d8) by MN0P220CA0008.outlook.office365.com
 (2603:10b6:208:52e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Tue,
 3 Jun 2025 19:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 19:42:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 14:42:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 14:42:18 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 14:42:15 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [PATCH v13 1/3] dt-bindings: mtd: Describe MTD partitions concatenation
Date: Wed, 4 Jun 2025 01:12:07 +0530
Message-ID: <20250603194209.1341374-2-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
References: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: amit.kumar-mahapatra@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|SN7PR12MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfb688f-955a-42d7-84bd-08dda2d6c145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zXiHEmMNB09f6YH1yZice7jhyi/U1u4b5qhusboFR9SkJPziuroWsT2oME7e?=
 =?us-ascii?Q?OMpu/v+zMrXSAyxJsjJbY4ssd95PYKR633ipGu6SzcmDH0qIbq1WcDeqaAK9?=
 =?us-ascii?Q?iQhEhDVj9p+1ZbFfydB7XPc/RrW6OCg5gfCRXkuBdTorLcG58xZACPORzKdg?=
 =?us-ascii?Q?etSSzIRWW/hfEhw8wBxrMo/4Wm7EPyqH4tGmCKRDaIj91S3FFgzGNma0tTh/?=
 =?us-ascii?Q?JSfPRSMhpMqbdIhXK4S/Tg6GH71L15k3KLtGbJnev34ZQMuKoPUfXmozFkZi?=
 =?us-ascii?Q?JR8bBrnizfhlkRRK9X25l/k/ipD4LHcLOtdlkjg+LM8GRcdaX/yht90m6Xuu?=
 =?us-ascii?Q?A3duBWQMlKkjB/7q99cEj3UyoyoNHXr7tmTnC9EQBzCx9m0MwOyHZR8HYLaQ?=
 =?us-ascii?Q?XFvCAbVCATenS95Yd7qVNcOAY3/J6bNwQHF/0EpyGn2mbJhG86lvOCdpUGLM?=
 =?us-ascii?Q?Qsn7VZ2tGe6UBPVoYpWTo69LHfMWLNtUyQSjNnTwP/LnN9T0IvP4kiIE+rvx?=
 =?us-ascii?Q?8S4a0vIoPyNG6T183Fb2DrUO9W+LJbyojLRwFOLLUFVceh54OpTnWGALYpuB?=
 =?us-ascii?Q?Ba5nfRIjlR8s2ItmJsSHBKRxmHoxIQEATw20dOrs7BS0RxrVWoSkCCmtyyvK?=
 =?us-ascii?Q?twOS7cITIhmHB62vRDnZET8k7eabLp9t6/TBeDMAf7A6ePMEwz1gLEoyfcfe?=
 =?us-ascii?Q?kMH33M1h40WVrmVeUO4YaXkxnJzLfGRp3aBE7N1fTXjveZPRRN+ZUAtiSIMA?=
 =?us-ascii?Q?q3L9bsLN1rkoXwBwvIX11/8HDVz1XDSHZY89yBCeZlP2dgMnfCmC/4OF4pEy?=
 =?us-ascii?Q?4sA3xoSOQdVQVQi48av3NaHpf2u6wfdBt8pCHZ5ss4IiHt2Kk7G8UnEPOlMw?=
 =?us-ascii?Q?Z+9/Yn3fMdCFVgdN2e3jIyt9YCMtp7C+vTOn6CH2xattvprk+s319C5hg8h3?=
 =?us-ascii?Q?K1NISHR7CNnQVoJPwCEKLzqLWLnFp6ktFOHattvhg3Pzyt9TntqYkke6JDXe?=
 =?us-ascii?Q?mp1sY7sHMePp1ReMr0ewlG/ZTcHaHkx6QY/+zaNq3wFOu62pKP7w6NI7h4G9?=
 =?us-ascii?Q?64dmmlBhSSJhPRJelLXm3KKcicdUmTGcQPEOKV2Si3+iHqoLKx02CT4aIbwZ?=
 =?us-ascii?Q?AmhXP9LbVN/MRS939RbCp/y1Mn71WWtJaUJcfxkimjC5OqelyIRSRbSL0GRm?=
 =?us-ascii?Q?KDFZxVsqUUYFbdd+kTJRjRuKcD/McJMjLdmIsEtZIOJjVxA+j/gKeXBaJRXr?=
 =?us-ascii?Q?4hqVUfsvZ9zALy/+NgT7ZZUryY1Qw5pVUnYqggCMQoMmnPiO+82qbLbpIIP+?=
 =?us-ascii?Q?imtVWY9NMhO/SJfnlN2gLwR+LgmRf20MBrQNreQV0/cO+8CAryEGIDUTXUXB?=
 =?us-ascii?Q?J5MQKrtTtFANWu8fN5LcT1D1paYd5VI0isREpQLtfLxbmF0hhmjJUOM3CV2Z?=
 =?us-ascii?Q?Ame2xbZzivbjgsH6xP6SPgfPhKvcOJoDXFXlvItBLLRnzCvLeIhG3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:42:20.5287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfb688f-955a-42d7-84bd-08dda2d6c145
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_124227_681724_5498EC8E 
X-CRM114-Status: GOOD (  13.58  )
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
 .../bindings/mtd/partitions/partition.yaml     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index 80d0452a2a33..2ef4bde02cd9 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -57,6 +57,13 @@ properties:
       user space from
     type: boolean
 
+  part-concat-next:
+    description: List of phandles to MTD partitions that need be concatenated
+      with the current partition.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 16
+
   align:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 2
@@ -138,4 +145,15 @@ examples:
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
