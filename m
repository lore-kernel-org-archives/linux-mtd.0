Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14E8C7EE33
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jun 2025 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcAWN8ndLCQ4WY3WtDokXrXfJwCpQ9vEMQapPpUBaNY=; b=bxOYiv6BkgToO6
	rF35UhD9u3IjSnzOI+15mCHihMap5litqlm1qNH9kS1xy1RIVcPD1ztxPxfoRyuMhndsJm2+ksOLf
	chSKbY9fYEfQp36QpmsIkms+5wZ8qgVp9T6mNE/qmzbbOz7aTm+Czsme2ovG37Stxt0h846pWVmFx
	7+9k7r6WuCw0YeAjBXtjq2BA9xeQdsGVyyFRunVXLI4+AbmtpXVwZuA0XCcMMrHpZ2jeVIIPT5n8Z
	Rv90M5IOCcPc661IEcUnyEV75Vfib/ZTdGcSy4wigjDLCZH1rmrebriZtx/64Tz1dnUhc6vehMHJS
	jDP5NAqoEJrzmP0vhh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgSt-00000002jCE-3AkD;
	Mon, 23 Jun 2025 12:39:59 +0000
Received: from mail-dm6nam04on2061a.outbound.protection.outlook.com ([2a01:111:f403:2409::61a] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTepM-00000002Rq5-2eJ7
	for linux-mtd@lists.infradead.org;
	Mon, 23 Jun 2025 10:55:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlAxITTnYlYySXE5Z5nXv1hXB8PhP3DyxujDFbtwndMpBy19v7R0I5vsDG7cojgn7+TsQ7l/EAGKjRqpW5nw3AmtSzC3RMZS+uyrZ6TTpl7F/m9HYoZxS7KYJeIjfhFKHNNjvch+FcE6UzAy240i3l06URZtxfHIVJoCSfr4JLXnZvjgF4XUR0PVJ0UoPEaq6IMHU+Qf0qNvbMFX8oaMwi6l1jVi4oZ2SQF526IrJNm16T7YvgcK9jXXMfre+cu7f8tQbsh6JmxRgEhrOaALvQmXnWhCv3HFBxGJISZyR9ytgdhHDups471tC1lQV0TfyJh38KU9S58BiKYOTehhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOaCrmzgt3ty3XF3orj5cCWII1wOJJTN56ty7LTSg0w=;
 b=e1A1IKtwTaxZkJ/irtzxzmVJmgKH6MqXyViOb/4d/IKQ4k4Qgt2BUB7U3MlHvYSMGEYRqdh1Y97KYV9ChnIG7txfIHI9Wnh5jButo2ZYqJIABIkS6AJ5H9WR7yep7nmAkEZcw9eUa/FUFltb4rMEKI+iJYaCUP5jeHoXwztTYoYj2d4qkr/aY4ICMhtQd7+gfawy4jNboyAraz/wQj/YS4Ugt8XisxzS4hco9cHzKFOMElPmWi70nVk0Dky/Nr3OPXNKbC5O60U4j4uTRDdBk9FaiwL9BYlZUjyOcocFRnfE49+/jN5L11Q1+uZ88CMX9UoqjGj1R0vEWoriuElS9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOaCrmzgt3ty3XF3orj5cCWII1wOJJTN56ty7LTSg0w=;
 b=QsJLhfKnLeJvj/qOeOYEujnUc4QWq1yQh/dp4evgLpFHAJCtW3GHGRglpk0C1+QVuIjvqp8USo8i8YZIuXnO2lIhaYCfXSP7PQ3sCCzipkN2mnUzKQEvXwzzT8k0XIbGnMtOQ6Q76cg8PejKoEbljja0zFljAFEgY7i23tLhthE=
Received: from PH7PR17CA0056.namprd17.prod.outlook.com (2603:10b6:510:325::17)
 by SA1PR12MB8161.namprd12.prod.outlook.com (2603:10b6:806:330::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 10:55:00 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:325:cafe::80) by PH7PR17CA0056.outlook.office365.com
 (2603:10b6:510:325::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 10:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 10:54:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 05:54:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 05:54:57 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Jun 2025 05:54:54 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [PATCH v14 2/3] mtd: Move struct mtd_concat definition to header file
Date: Mon, 23 Jun 2025 16:24:44 +0530
Message-ID: <20250623105445.2394825-3-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623105445.2394825-1-amit.kumar-mahapatra@amd.com>
References: <20250623105445.2394825-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SA1PR12MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: fc88a2cd-61d8-4a11-4558-08ddb244660c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dpu3MuY3F8hSLwt/vmVEI7BPdvvyek7dIdt2YV337OCygdKdLSW15q2Mmk6y?=
 =?us-ascii?Q?57OCpEYjZgTT1KZP+mhuzPLY/iEVpjcW/IzTsvzhihDOR0XuyUSes/c/l1tC?=
 =?us-ascii?Q?C2OqzoMzHAr1Fl4L/KIQDq0d8dJuYXYaOEqYKjV0gmm9s9JBDdpeydINsDl2?=
 =?us-ascii?Q?k+3618Mlz31RbbaR7smJZSh3reBlGegB2nh8ys/9082o48+Vu3V+2hjSXWmD?=
 =?us-ascii?Q?5/2klessg2mOQQItYc5ISidRlZM+t02+VYDo0vVg3OHmA0Riw80r9K4EW3Il?=
 =?us-ascii?Q?bAaOysw87dMmtTXNVxEIceGAZB5DjBoMACEnxqmpLK/M9Dhsng6CP+oJSiEx?=
 =?us-ascii?Q?S3fwkFsHheiHaL2fPCOK7+cDBkhVHl3KjXKMsXKHOBO+Lu7BXa/uSV5K5xlK?=
 =?us-ascii?Q?R3bbY6+C0lyP9YOnrvunANgFDL6OTAv/RYm7zAJTijXr6SK82T1GvKodHDro?=
 =?us-ascii?Q?ACKxTeDfwuReMTdu8ItP6V49oCzdWK9mNgn2lYafWURx42gpeJURnXuhvw2v?=
 =?us-ascii?Q?EWGO6dd5ar1yZTaUXA+qFAQPEIB855OSjkXrz3oRKLaoQgrKyXF/LvRRLxJX?=
 =?us-ascii?Q?/jY+O3xDaIMHifDaItz8qUPRHg7jKVFDOc0nTl8BhrQpsuc+z0YTyCoW+L+v?=
 =?us-ascii?Q?h/U/eVB1/xYig0IogmQj7FkQMqsr3atehVkFBqgc2D3KIGY0bd0PwWztYWbD?=
 =?us-ascii?Q?gee0xGPz49VU/xZotzw5sUhBfR1nVgkr8tpTS9Jd3Sxc0E2TRJ7/GuErAUsm?=
 =?us-ascii?Q?+EsRF42ZdElQM94iVHBOqNoOAFHs0zUsh6L1lpuPVFP4ioYxzQB0dcZo7uTo?=
 =?us-ascii?Q?NfLCcc7dy0pHR3Bdg7JSwhB9sjzONO4uztsY7lCbjmy4I9QfLbyerxRNZx9k?=
 =?us-ascii?Q?GekBvM1QQJDLKOwPQWinLnVJ8MmmWgM/0j3ePOSZzw6QmpNgZTWH7SWNWn5s?=
 =?us-ascii?Q?GYYFzqX6eQzuKPUI5aKr8JV1L6GB9gsQIneptJwxKPOXKOSEbQ+hyyggH+t2?=
 =?us-ascii?Q?AgvlxQzYAr4R6c8D1fb8lxKzt2X0CrKSFRX/hdLqIcKAWwka4CdDgLLVOd3D?=
 =?us-ascii?Q?VK8VCi620KodirVXV4bUp61WKL2GP+uQ622cqWI4B7ApKmitsZm9t7OVulBj?=
 =?us-ascii?Q?kNF7cm0grqX4d7k7vFl0G1jwn/dArSM7n4yQpk/v82dOqfTIrUmKyy9RktuH?=
 =?us-ascii?Q?QwtwRFM0bMY7xqQaM3DGnuN8l8m+BeYHaGrF1MpZY4OGjUPZ4iW4jMJhfy5e?=
 =?us-ascii?Q?om0tD2aZedVbODhTMjISwefPGf1x2sp2oxWeXgdaoYLY1IzEcPvgag2T4PMX?=
 =?us-ascii?Q?4TOg1arHaKb1WgRKI8DJ7+tU6O3pzH6/GvQmEkSpj7oVuuUf5G7Lqm6Y96fR?=
 =?us-ascii?Q?xdOlB3tH982/GLYNpSlJbj9/eVqIbNdjfityLo0Cfk4lV0HH8QTCW8YjOF3x?=
 =?us-ascii?Q?kMVkTgFnd/gYgrZ3GsmdrHvoLtGcGsPIiHzPnuJDxxWUV7IXPXaiA++vgiQM?=
 =?us-ascii?Q?JFz5PLc9mb5AwnO3f4+DmEsfmy2B/U+DhU8d?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:54:59.5183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc88a2cd-61d8-4a11-4558-08ddb244660c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_035504_682402_55D4AEE1 
X-CRM114-Status: GOOD (  14.23  )
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

To enable a more generic approach for concatenating MTD devices,
struct mtd_concat should be accessible beyond the mtdconcat driver.
Therefore, the definition is being moved to a header file.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/mtdconcat.c    | 12 ------------
 include/linux/mtd/concat.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f56f44aa8625..6f2aaceac669 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -20,18 +20,6 @@
 
 #include <asm/div64.h>
 
-/*
- * Our storage structure:
- * Subdev points to an array of pointers to struct mtd_info objects
- * which is allocated along with this structure
- *
- */
-struct mtd_concat {
-	struct mtd_info mtd;
-	int num_subdev;
-	struct mtd_info **subdev;
-};
-
 /*
  * how to calculate the size required for the above structure,
  * including the pointer array subdev points to:
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index d6f653e07426..b42d9af87c4e 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -9,6 +9,18 @@
 #define MTD_CONCAT_H
 
 
+/*
+ * Our storage structure:
+ * Subdev points to an array of pointers to struct mtd_info objects
+ * which is allocated along with this structure
+ *
+ */
+struct mtd_concat {
+	struct mtd_info mtd;
+	int num_subdev;
+	struct mtd_info **subdev;
+};
+
 struct mtd_info *mtd_concat_create(
     struct mtd_info *subdev[],  /* subdevices to concatenate */
     int num_devs,               /* number of subdevices      */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
