Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ED0E77183
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 10:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fW7hQ9IgGwL3m3UFCy1K3Cz/9wIPHnKQQuwJ1Wy80us=; b=kZ8hCgbSbe7kJ7
	xEj28/p3kbQF3JNY1a3h/8NaDv/mmcNv83iVi6eYS3EjACgl17H70vVYK3xDhd0hcqC2X5NAJbcOA
	zH64pLLNmo0KLbR/dlpyQnK1fFsQ9xLVZJzg2J2vGYaX8DEHC0v0GJ2vBYo8OHoRQZtEgbIfkuym3
	Z3T0/N71q4+YIVV2mb/0icNYdgDA/qI/f8qPDT9zTYPFrhpC9lT3Mwx0uxhLbcbljuJkQQcdtz1sa
	BX3NUFIPoxD38S1xV2OTVsZH08Gc1DfUcvOObkWTtllezHOCMwzm7W2zXF2QU9CzM1Dyfn4U/JMQg
	zF1UG4jC9sld82Uaq2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN82t-00000009e97-1bnZ;
	Mon, 16 Dec 2024 10:09:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6sP-00000009Sdj-1E9Z
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Dec 2024 08:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=pwUvPeyXT0ja77gdeL6uQGGdqaeRZZByCOzrPHPyQe8=; b=VHpqMLIIXH38cUnBlZ+jp8A6vN
	8Qd6FaEYg+CljB5lW21HpCaeE1Ucl8cxPYy+Qj81J84kiqkMyg0w6lNV9zfbVgDOBRvC6mRgT24F5
	IfvhZ5Pn0wjYPRxez4mayR0yH9XYN7Qu0aDDpiBdW5o4aKkjhHKWAtjvSPO8NhQzrBxJjJ8vVLBov
	X3SGkQ7bz0QpF3uCstAQzNHYcfvQBKIXwbDW6mUbLZYp74T6+euNht+O91XofmSX3nzx9Bp03BjyV
	Ev1vox9DKn5bLQoVFIFzmwKecErN0dX0gVRJfOuO0/LZCsaidzO4Q+P8XOLy+4tRyMkJ0MF1Md1kO
	OLF2M7EA==;
Received: from mail-db5eur02on20611.outbound.protection.outlook.com ([2a01:111:f403:2608::611] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6sL-00000004o6i-2ZLI
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 08:54:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5jL2yIz5qdi7jMxgtk/AUWU8W7i4/BPEY9NFxPd/LhwzGGo6vdod5hAgwf4NLU8Qq8A9+kDiYIl4V9mQd9lAyALo7fkZaTaWoA1PleriLZu1QdmGW+CuzK4b9eEysc2Uad2vmLBfmmTN8Ro/INn/sGefRhe5sdArkA2rq6mM9rT48sD/Wh236xdFfPUQUQZ/nkm30u5EJd4AQuGgqXEnsmlNoLRjkVLJ/dGb3JVPFpLAm7qtL88FUymXMdZga0DWDEdP78ACrefVsCU4cOsvaMg9KdVDlWjSVWaOnD1VcslI0JbcGpHPh43FQRUWJw3M4jRDxLm22XhxCapoH+UuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwUvPeyXT0ja77gdeL6uQGGdqaeRZZByCOzrPHPyQe8=;
 b=bqyJH769G36OIp42ZGRd4VYzVGmcDBJw9ovTwtDk7QVeFK27F1IYT7asgLqlIhd97aZSnjdwhgJALyIvJsdp9MjRsfcv985rWt5Hcjr12r6o7TNPEJCDMpFh+In2BF5thAjiQSqQXzhyGNzJKQvkCDyPLLK7hHQI1ge+R5HlIo7FJOejVVa8QzP5pwTXLaprYalDVYqcgseCgTY5YBO5zyZoOK60z2tIgMQVYAYFuu4++DKL3bguu3hw562ebMaJSpdPTBxHUtdQBAfdGhAzYdUPv0jmpVttOr9TU5Kb8iC0qUyVQ6catvM9rlIZZCsEuWbMjNA8NIx6JlQB8Jsa0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwUvPeyXT0ja77gdeL6uQGGdqaeRZZByCOzrPHPyQe8=;
 b=HR8ElypJEXRUUFI8Ps6QoIS6Gms9ulUz8EVyEE0UAyiX540AJTWNQyp4YXwTFwKUOf3RsP+uHM7CD/F0u7AcoT7fv6Adt0D73QQWnDatdJm/S6Ls9YWGwzVMJIfP0BnKnKI/hZhH1Lc70CYy29uQBeM4iV16NFPtz0FQFl+cpQg=
Received: from DU2PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:10:232::20)
 by DB9PR02MB7962.eurprd02.prod.outlook.com (2603:10a6:10:339::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 08:54:39 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::e6) by DU2PR04CA0075.outlook.office365.com
 (2603:10a6:10:232::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.20 via Frontend Transport; Mon,
 16 Dec 2024 08:54:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Mon, 16 Dec 2024 08:54:38 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 09:54:37 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v5 1/2] ubi: Expose interface for detailed erase counters
Date: Mon, 16 Dec 2024 09:54:19 +0100
Message-ID: <20241216085420.2696104-1-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|DB9PR02MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a47401a-d11c-4174-4a33-08dd1daf460a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b+BgWBM6KJLC9KbuA/zCiS+tt/WptWieNR5tvYOOmMrPDBPE43j0cYeNc7vL?=
 =?us-ascii?Q?0PPnoVIajMgfRLwkf17tXWzv11JW178hFbZyl3Sm/ktognwg8JPBD0cU6A0M?=
 =?us-ascii?Q?lZbkUPBgCpTamyv830mMPDMsTBw/mLlZQkbrUI8EqJDl7UM261F1PrZpJmzT?=
 =?us-ascii?Q?oi7KLXxin0Yw0Gxxr5Yfl/RMwKa7rxM3ziKMcgDwBJBAItdUVZYeYBotmQAr?=
 =?us-ascii?Q?Pbght60+bdOLPpJ97L92Q827yS6o1JzXM4gM5HnP58PJZWiCxHpUAqX/hRbl?=
 =?us-ascii?Q?RDjxjB15s6V0UDJSZXBS4+0p3qlSVCd7ipThrAp42Yzj4hsQ0UDHsw4n+Viq?=
 =?us-ascii?Q?u9h6AFsZcMcMHbzoDUwZQ3fdd9XbMWJnKX/G0pBZSx45o3v5wtdIBS0krUo5?=
 =?us-ascii?Q?thuHEHTeKDUrshUEII8P146IPxqRJAVRsUGUxADxUZF6kXAgne79OVjxrUUn?=
 =?us-ascii?Q?ebdACDtNEPCPuHgAE9p63J2+E4BRN82aml0Q8iB7PI+1tggQ7MjXjtm3RD+0?=
 =?us-ascii?Q?hihzdSXWxWvCEorh4ZrJh+YlEVwwlIc1quIdVmX+xOn5H+KK7eIuNzytaH4S?=
 =?us-ascii?Q?NWrnNLzyH4G0J/qBwEI/0cRG3t3bk+6v8dymrIWvJV4gpH+wQ71dBJ1GBXTN?=
 =?us-ascii?Q?Gcg7mWMPj+WPoDx1hPCZI5lEJ8t0/RcJLnwGIgy9qATum0zwBpoti9yTQ68c?=
 =?us-ascii?Q?U2HQ5P73rH+gGQqmaI/OcdDecVrZ5dokKOcD9uLjZxLf5SyKUcaCGcOwPWQT?=
 =?us-ascii?Q?LwKeWA02d63vk+bi4j6dHt9XlusZSYN24FHuS14LUucs3Q0h9AGjVP569CCC?=
 =?us-ascii?Q?S4bt23YqZzKUa63EmGikc9XelNunXVeWRxtSSuTlwJnZNdLWJtLZLiHBgI8+?=
 =?us-ascii?Q?ghkl3uWpe9N7uUTGcUoull0MfQ9S6kjI3w5PhJfZRjUkluMFVXVZjr5FN8UY?=
 =?us-ascii?Q?POP1LXWEuTgfu1vYZdEzo1XuJBeYyC/AXcKOWvlrXpTsm3WQfUkRJbd5JEc+?=
 =?us-ascii?Q?jJhAW9O346H15yr92FeTRxDX6BIyc9mzydFtY1hZjF6QTu/HxioGb/J+OUM4?=
 =?us-ascii?Q?o51S/BaBRsDGXwr/a8ACNYj5/K5Ph/Zyeic96WGddW5FMCPLDfBYk7FlT/UG?=
 =?us-ascii?Q?o/npN+qhZ3PsQ4opWxE+Km33MdEyfcpLODLfJisYyYoeUWJ0nPH6S2brY1n+?=
 =?us-ascii?Q?8RhKnEwMBPpmofWGTB+1wdlG/g1XIVkb4GdReRq3lh0JcNhUJNql0edL2NIk?=
 =?us-ascii?Q?YCS8t6YpJnqVTosmlLnhq36Jyj1eebv1b0akZNG6ykyR6uwPuG66xlnKFxCO?=
 =?us-ascii?Q?lMLHAl/GMGJ6z6ytXy7fB/cf8PRIjK3ZYymVOnNN+sBCh1xb0Iainn+8GnRb?=
 =?us-ascii?Q?rUEwCpz22FDR70bRq1GL/vE3CsA8P8cWEvoiZAyj7t3BDU1m+hJoSIH9DuLI?=
 =?us-ascii?Q?aWYRU3stTqTmN4jzTXedJSfipJ8seGowbkl8XKqAHlkzHCOk+eIO6nZsYhtn?=
 =?us-ascii?Q?LU4tkbeABv1Lr8A=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 08:54:38.7415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a47401a-d11c-4174-4a33-08dd1daf460a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7962
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_085449_974664_FDFF3D4D 
X-CRM114-Status: GOOD (  14.09  )
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
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
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
