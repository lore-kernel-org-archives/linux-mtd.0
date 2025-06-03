Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D85C5AE59
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Jun 2025 19:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcAWN8ndLCQ4WY3WtDokXrXfJwCpQ9vEMQapPpUBaNY=; b=yrlsJDrvTH+Eou
	oaS7qsKlUCefhZMcqCEIt7yz2f6lkN3/bWMZOWNnukHa4xVoXRMSFIQebVZAKIQKO/qG66Ms002hk
	vZatIZwUgCcOOn8oazhHpsQQakbnaEHnJ4HfTiqh05SJeCldB2Td/9bmYJUICfyWUSWRaE7XEk5hJ
	Uk68mX1KIPmn58YwZvEWWj4fjLUwc6uIpKbyBrbvN3QP/gogveu1jZgDEYoa2c75xongqqe1o6XUy
	7PBWlip9XkrKcSgAKEg7yWgkX/tLM1u4PbO4PZST7yYqzE8CSyRBY98YnPfntwm+FZx/reiiiVwHh
	aIEh4jPeYVJLrJwyWeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMXXB-0000000Bjdw-1l1d;
	Tue, 03 Jun 2025 19:42:53 +0000
Received: from mail-dm6nam10on20609.outbound.protection.outlook.com ([2a01:111:f403:2413::609] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMXX8-0000000BjcB-2nFl
	for linux-mtd@lists.infradead.org;
	Tue, 03 Jun 2025 19:42:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLuYvETRddDUUJBv1mk3WV7hFipM8JVpAHNSJf2TAIpdAGAky19ok2QASxuT/En2JhsRXKdHkTzSdzrh6vsqbwTWSsBP1nec5oPIVLpNoTGQ813EJB1ATWJFRoi2DEH8IKFAN6/eWn2NkJDEG/yL1k5ZCTT3JedF90oe6vttsVIn0Ti7rlFalVhOSvZ/j10uX8DTEIoiWxFKeAoqq7ezoyOsoFYCfvcnj7xz0yJ0NQ0UEtUcBuCkCMRhAADiscjgeLrzORmhmI0dilr5YS623QSytFMiVE9Re3PnSu0eMjZn1NizzLealzSc5/3Zhd5vCUXpfU4+FZwqTdwPiAdwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOaCrmzgt3ty3XF3orj5cCWII1wOJJTN56ty7LTSg0w=;
 b=xY0PwWpNjtTUWAfRPc0x/qcqeL6ytBpkESALMqyTgtraPYJEwHjNcNSZ0S1MR/osAIprK3yTKzuIvlzphjCP+llG1KLXVC2LJzMlzLtQ8N3cKu2/KFKvrB68mbTgNOr+lKM1VImVaP+PWQ8S8/mY8p0D8D2RoX/JA4ClGlC4QiD9gKuz59GgnuScZzVuk8oV40bpM0Lwoq2gq/O3gz2EePaL7n1bCR/nS8jR3Qcerg6xyF6gciwcoPNub/TOmOtj61/as5yNyy0gvQDwSFFBFsE/zsNFYleIcHczhjivX4FBChPxz8aOb+jEb/VQZpMXpkYWCq8+mTWuYrCEkeyKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOaCrmzgt3ty3XF3orj5cCWII1wOJJTN56ty7LTSg0w=;
 b=GANB3rVONi00cVhhssjoqOPVVeA/lGW8Dt7/WH1fH1eUD5UzfperXeLP9QJcRl3xvgrHt6Yw4oPfm2WIn24OQn4mbYASPI2fZdB5Az/ctl5N4g45KjmTxRGm36o1eVOiiIKKWXu58wRbGs5Io9bkBiHEAoKBRnysQQgjQ0syYLI=
Received: from MN0P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::30)
 by IA0PR12MB8981.namprd12.prod.outlook.com (2603:10b6:208:484::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 19:42:24 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::2f) by MN0P222CA0028.outlook.office365.com
 (2603:10b6:208:531::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.22 via Frontend Transport; Tue,
 3 Jun 2025 19:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 19:42:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 14:42:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 14:42:21 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 14:42:18 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [PATCH v13 2/3] mtd: Move struct mtd_concat definition to header file
Date: Wed, 4 Jun 2025 01:12:08 +0530
Message-ID: <20250603194209.1341374-3-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
References: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: amit.kumar-mahapatra@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|IA0PR12MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f33bd5-a745-4297-bf06-08dda2d6c311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1KXkgI4O+tzAw1kFnk1lXi3CyLsKAkhhrUllqxkvb/wI8rFANTl024rx8OHx?=
 =?us-ascii?Q?JFekO6qSaTY+QZsgmoBKt0fGFNjACdLgo95iJhufxfRq4d5Ot/DoO+o2BSQJ?=
 =?us-ascii?Q?G4eqVcTwBcZWTqq+rmPcO56qk5B2V7XPArFZH9Eo1vTLWRf3e4FmG58DOqdJ?=
 =?us-ascii?Q?HCedgQQ55iUWIptWmcXHTdGL78vtGPZvaty8YZGsP2t7g03EDUSMAANjs02o?=
 =?us-ascii?Q?HQqwtEALo9EjwOLz1wjuchJzSiH/dCEuSr8HjPRMrRE+3O/jiwLX5woOfoOO?=
 =?us-ascii?Q?0rRNO9YhBGRk1/T/4rJi5g05BRsHz7LAkJsqCGccnLzeREHbFD8QkjJ85lpD?=
 =?us-ascii?Q?0mSGxMJqQ10eSArnwzo5FE65Yc0iYaBsbPIv9A4yGezfXkr1pArCZ5kCLZm/?=
 =?us-ascii?Q?bqF3KDSmXT2pX3dcR7WVoCIC1WgonUUphd+knchudcbDWgWby4pRLnqctUUu?=
 =?us-ascii?Q?vngcDpIcCMA+HYwM4+dpXURaLAZ2bw7KqYzb+KkHuSyOp7Ag36v6jVS97nCO?=
 =?us-ascii?Q?2iJ+tTL4qh6KdESZ1mqn+2GBW1BXys0nER00RkRYcg9jnHiZxSAsNmxsqCMo?=
 =?us-ascii?Q?ArdOS+RqXs06nawiR+iLAzhT02IqCdw9IqC72VaLAM8clexZmeG0vVk4t6Em?=
 =?us-ascii?Q?BmIUK9ZI4oI8WaGjSAYAje/hEfp/bOLDcyz8LIR7hoL1eUPJ06023L9RpCcP?=
 =?us-ascii?Q?WSvXcfJ0PaJTL4cwYYvgnkv6+hCmJsruUSs+KhX7ek5x0M27kbVeMLFJU7GS?=
 =?us-ascii?Q?4cU2YExd2AKi4LDbBdFETHRyxKWfbcLMrqb94ZqMdWQ881wWmqppJOr/2ddG?=
 =?us-ascii?Q?PdYT2nHrr2TmTHWU7zcTl+dv+pT++FwDKeQEb/NWJxmay9CW0/qivicDwndT?=
 =?us-ascii?Q?Pj1jtIO7X01dkwpR/kGPfzaOvDFa+UVXCAoUdRyHOzhOmj7rCMdjxbKVJyOK?=
 =?us-ascii?Q?3R0VWZ4bmlyjcnv+wereBzOjkAd1R3Up6CO1B0Ys21ta4WOkvnf4QCe58AUv?=
 =?us-ascii?Q?rXlG6jCGp2n/gWOixMVCB2CQfUhh3w36YCUqCJikL/GGl5iSlmzay1sxyQqU?=
 =?us-ascii?Q?ygNZLhys7NZD2BG/CrmmdweTmg5cO3XtH1CXzzvNop3ZnUuVqX7bovFywRiC?=
 =?us-ascii?Q?tVxqbmGrZ/0s+4BcSTh5Lb0J37XzIHa9OBZPenrxxyPYhK8bXQ+j40RKM1Tg?=
 =?us-ascii?Q?R2WaOMIs1Elo7UBdARIdl2s7GGFE0f07p+c+r+YSSx3lIGSDZ8vwEGalrPsf?=
 =?us-ascii?Q?4ZAoAy19Lu8Ku/zjr8ZO3FhvVUlurTJ2VGCUa5R87UX6kObqCG+mX1RBTgJM?=
 =?us-ascii?Q?AcxBn1QuRlLq0FesaaJIoJRC7qGJ2tqO4dlJcODedUQIVlV9RFzG8XAkoBrx?=
 =?us-ascii?Q?KjhVRpywrlB8KHGlB7Sv8vKHZtgL4bjmlwcF7RG6vxONr66WlKVWV9FWt6gn?=
 =?us-ascii?Q?UsLBXsc+n5PivRfClJegbcNlSTpGZWxO1vn37noiiebxd/ywgjkUgD15nO/A?=
 =?us-ascii?Q?INsiqDzWDZx0TLXEKFcMtCLyHCSIxi0J38Lk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:42:23.5457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f33bd5-a745-4297-bf06-08dda2d6c311
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8981
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_124250_706619_30D31B7D 
X-CRM114-Status: GOOD (  15.17  )
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
