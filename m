Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C9AD609B0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Nov 2024 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PR0ramdU8Jcx0J/ANQREr4DE6zjUVk3hLmG3IXEY/cg=; b=PaY779IzFJNG9o
	JqoJWsa6HGog1l3g4W3q/gRQxhADDE0WPRgqtkOI9t0m8pJ0aH3O0xHGnsL7evlOf4OBgxBAR9NIY
	9XxZenQ+yw4KvBks0A1R1om1DOcIJ1VUPYNLLDcy7/ufL9n2ek9w5gqTGasDDq2IX15UuYy+WtAb4
	eaT6MIcppmLS+B6oMgr/pWlZFDp4UF7JtKm2G/yTsU63nGn97uC3LZTlWYH9GwMv7RjThC3DCGsoQ
	O0sAYaNwx77iXTUpBKWyGvq+bGuhqpwwpO/SZ+R+BYuzY0wUznvYd7Mh/40v3Lq9kLO7Fx8k+AiIj
	OaSN2FV7+E1uPGxAt5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGE4y-0000000Cffq-2sbg;
	Wed, 27 Nov 2024 09:11:24 +0000
Received: from mail-dbaeur03on20602.outbound.protection.outlook.com ([2a01:111:f403:260d::602] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGE4u-0000000CfdA-3d9Z
	for linux-mtd@lists.infradead.org;
	Wed, 27 Nov 2024 09:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyeijxXiT1klctrQ3VbA8udYRDvXaB1pjpmYpfXy+OU4pIIEqdD5r8W7nsPSHT8QguIusrpmHXIzILWotuyhs02UAsUVPLqhi8Ph4oDTaDPsHsL8Sxh75qXFxfYflJh+0cPfgemrzcr/y/QJ9MeP/Iw+CnBjQ6V3sz0uYwifBlQZAZD+cQH0/osehrr56+bsedqzollPyML+ZZgqIkAipvb9e+BY3P1E0zYfaQ2i2kUuVYjmsA75zTNyYTEw0DlIZIUIbfrIdDfIIo+pD6gkiXisIk7H96BHsPbdbT0usb9kTah2eymPfaSpPVyeYaONkIS2aQokPWHW/Nz9klnrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruyvq/Jckd5pzZOEyjyiErRhWURfGDvGKkRDOFDLCUs=;
 b=GEte8WnfC2NPoRhi7rwoav0MttAiULREqgYb9CFuQQR3cCiZx/w3/jDEStWXmjmqGHHx6ceXzo0TNc9s7/DozB/rnqAZVx9HLOmXZWA36uKLS1+vZdp93UPU2NaYKXv+23KGAjfPHBXbmgSv347RpRB/emcVtc++9t/LeIcyNfEhhv8CjsP2kRs2xiMDKK7F2FrqBQhzSmhXAuBkaXlP+KwXQ+u0I4eLjQsx9AJDtNYgdNt5DPbY2eMWPzqmOL4C5wmxMvES6tzKC9tLPhkLfIhhUTRHGV785i3ReGqyJ/rznF1Z6/tjnii/ZoeTWSSHzqfkJWvHRULkfHVO1saQlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruyvq/Jckd5pzZOEyjyiErRhWURfGDvGKkRDOFDLCUs=;
 b=BwwVdNweuzSv9gdYaB9g7W/kEO5VNYs5Wi8C0Rt+US5VbAyGxORjAFunYwpnhmGiBOdFJxBD9sfdachRy/5vHCLBAKnBLsnlzBDLQS6dAzLRms0ZX+STxcTPbM2i8bD0bwNwYgTt7840CnZ5j+N+vBAt2yYfotZckB6jllKy+E4=
Received: from DB8P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::18)
 by AS1PR02MB7870.eurprd02.prod.outlook.com (2603:10a6:20b:4a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Wed, 27 Nov
 2024 09:11:12 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::ff) by DB8P191CA0008.outlook.office365.com
 (2603:10a6:10:130::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Wed,
 27 Nov 2024 09:11:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Wed, 27 Nov 2024 09:11:11 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 10:11:09 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 1/2] ubi: Expose interface for detailed erase counters
Date: Wed, 27 Nov 2024 10:10:49 +0100
Message-ID: <20241127091050.1254359-1-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|AS1PR02MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f6591f-d35f-471d-d9cb-08dd0ec36fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YIqqXejpiGG0DVyleuXnBBKl2hKrh2bhZkPJTPr8he1xP/qosx9rwUa8blY5?=
 =?us-ascii?Q?4jbxaSyuIz2gga+MZbEdAyHmjQne5yLcYofV4EOCHMvWZ9At8SOhJahtC/EK?=
 =?us-ascii?Q?cwsyy3gkU1PktlsOBvx95pDVDEOE8tiiE6EaUxZmL+14G8bmlPrAm1hxcXtq?=
 =?us-ascii?Q?dVFUKwm6XiC9A53yxdc6f22n2ziakO42DSjGZGN6BNdWyOv7x+utnJe6UiJu?=
 =?us-ascii?Q?/7wYeIRWTcYf/BvIrjIHuETAmz5gcwE3HKy1hc5n9KX8lr9vpVCuPb90/9DJ?=
 =?us-ascii?Q?E203IzXNSIsu2PpB/j6Vf2tRR1qVDzCSir7aXDuaGVx/He7Tb8p7KG8S90Zb?=
 =?us-ascii?Q?FUbLgSAGwPNZKgDV8eBCod2Lrf26QtwLUuAW8vDTe6fpncCAB1U/Xp6cJVgw?=
 =?us-ascii?Q?MYforCeqxV+ypeO9iLD6tlqptheI6RUVfmtFENhrkBh2eTE1wK9PoM6DzzSa?=
 =?us-ascii?Q?9UCisd1iE4Zjh/6q6+vBsDG0PlwGPimzhX0bFfQg4VUDV2wHiAZOTtYlIT1F?=
 =?us-ascii?Q?nsVXq2sLSNcdavvqLdmbys4vq20dfHKFqMORxR6/a5HAOASjE9WMYWGJZqZI?=
 =?us-ascii?Q?yDM+fIcolx/jIlRMnToBrHIUmnYlshgufpm9zZo9pzbcEDs6Q1fLdHK2h46a?=
 =?us-ascii?Q?MFJbQFcf9Mk/1DUDRF3FaV53kE1RS0OC3CBaDHTl9v3XumGBE0mIsSOveFUA?=
 =?us-ascii?Q?dihxaILKJ3bguVLQRgXB2XTRUILJnosXLuZUiUZ0Ckvj+RawWhmBt5agVOFQ?=
 =?us-ascii?Q?hXLGHeJX29MzetbcgvZukZ2W8ZfEFZ23rhjvV4ur6su3cvqfotZm8xh3ENhY?=
 =?us-ascii?Q?9vvCj1Cv6tdXfaviGq4YiKbP3SN1yp1+7ochOcrNMBFD2v1pUbUeAyh9+tu+?=
 =?us-ascii?Q?8C7YD0BgfQ/Z7WRMU63YaC/e33brd3ia6i5onrYZ7hZUHHJ1iEKi2SpEgZzz?=
 =?us-ascii?Q?AlbemPjZo/QX4KlZBnB6rsFh4CRz3FvNTeNdSTgheD6f7C0HN+UO5B5T2nx8?=
 =?us-ascii?Q?DqHCaFQrAXQiUnypPt0GTlM7SOrmzixfs5ZRwnQY55XJngx1Xj1LY+tbvEvT?=
 =?us-ascii?Q?ZtXlPLY54tvl5BBoQgxyExd+S+xKvJeKO55Io0hIWTwVUEcHuZLdr1w1AVt2?=
 =?us-ascii?Q?JoVU1SmZLTtyaXqmylYW606nmey73/4z5UMpzcq6Pog9yVUTBm2snQuQLA2B?=
 =?us-ascii?Q?EAOoE8nRkeJPOHq0ENWtC42hOhqowg79nWF3XsaMqP9tZYz8eoKYKFz+YUMG?=
 =?us-ascii?Q?iFZoc0lZJKxVi53Vl5adwAglXrhyp1PL2FYcKe9G6x4axS3oKb0oa+7r2aBS?=
 =?us-ascii?Q?RAekoxIW5uMIdmKL7Me6kOZcuJ4m4nI8pOKOXxycgS0V0LmzcOS3rBadbgbu?=
 =?us-ascii?Q?SLcYOdtsOt/Ha4juin19IPIgRRI2iFDSKBS60jMaJUrauf3fZrPgBQoNlKV1?=
 =?us-ascii?Q?/dogoVKa7p6P3VkCbsZ3/aVTx3vzBvS7?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 09:11:11.4730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f6591f-d35f-471d-d9cb-08dd0ec36fe7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB7870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_011121_184853_A79E3A4A 
X-CRM114-Status: GOOD (  15.76  )
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

Using the ioctl command 'UBI_IOCECNFO' user space can obtain
detailed erase counter information of all blocks of a device.

Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 include/uapi/mtd/ubi-user.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index e1571603175e..aa872a41ffb9 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -175,6 +175,8 @@
 #define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, __s32)
 /* Force scrubbing on the specified PEB */
 #define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, __s32)
+/* Read detailed device erase counter information */
+#define UBI_IOCECNFO _IOWR(UBI_IOC_MAGIC, 6, struct ubi_ecinfo_req)
 
 /* ioctl commands of the UBI control character device */
 
@@ -412,6 +414,37 @@ struct ubi_rnvol_req {
 	} ents[UBI_MAX_RNVOL];
 } __packed;
 
+/**
+ * struct ubi_ecinfo_req - a data structure used for requesting and receiving
+ * erase block counter information from a UBI device.
+ *
+ * @start: index of first physical erase block to read (in)
+ * @length: number of erase counters to read (in)
+ * @read_length: number of erase counters that was actually read (out)
+ * @padding: reserved for future, not used, has to be zeroed
+ * @erase_counters: array of erase counter values (out)
+ *
+ * This structure is used to retrieve erase counter information for a specified
+ * range of PEBs on a UBI device.
+ * Erase counters are read from @start and attempts to read @length number of
+ * erase counters.
+ * The retrieved values are stored in the @erase_counters array. It is the
+ * responsibility of the caller to allocate enough memory for storing @length
+ * elements in the @erase_counters array.
+ * If a block is bad or if the erase counter is unknown the corresponding value
+ * in the array will be set to -1.
+ * The @read_length field will indicate the number of erase counters actually
+ * read. Typically @read_length will be limited due to memory or the number of
+ * PEBs on the UBI device.
+ */
+struct ubi_ecinfo_req {
+	__s32 start;
+	__s32 length;
+	__s32 read_length;
+	__s8  padding[16];
+	__s32 erase_counters[];
+}  __packed;
+
 /**
  * struct ubi_leb_change_req - a data structure used in atomic LEB change
  *                             requests.
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
