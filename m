Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0F1E7717D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 11:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fW7hQ9IgGwL3m3UFCy1K3Cz/9wIPHnKQQuwJ1Wy80us=; b=yDJv9yUvTjhsm+
	aIvm5v+GWK4fHY0hnaXkuemuMJ33kZiFsJ1J7s+8buZmRWOgbNwuRpNTfWSz5sNjlUvNBkaanodCi
	bUhyfzIpUYq7obHt4fxdgb4ysmysPhmxQgEApTMT9CmhRxpR6dxkNUjhbqC5yDdWFcMFhyCG8WrUB
	qC/ly2IRpH6CYrrCHV9iHDrV/aUVpqK0M6BrWnR4NxbLcT/XnFkcv9jfmODv8GQzzDDsKefeWDn8V
	h7gqT6vQjZIS4NN1fIwqnDwRQkIQzX/qSwRWsuKHGk1StMKLOxjG2XZUns6ETAr3AbwFZMqQ9K+vR
	7J79MFEoKC+lSujlxWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcGD-00000007YVO-2JA2;
	Mon, 09 Dec 2024 11:49:09 +0000
Received: from mail-am0eur02on2060f.outbound.protection.outlook.com ([2a01:111:f403:2606::60f] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcGB-00000007YUv-0FQq
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 11:49:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amZHukvtl3ciiLyo4OU3tiCwWL6xeNm9n08HD07lTCOjoy4HN5o5wGImdJt1nGIpLUnwNU8cgv98u734MmCaYmk2o/cxL05lw+zC+BW9CTbI6vk2X2DKeV+VYGKLXjDzjliW8da/LzGdebE+r7bRnEpExaFgIBeSQ93QwHF03FhUeScogFi+HGBv4SM4npHxouNqP08YMwzPMcpI+Fkc9p7Rmj7pZeJQzfmozv45ejVGlijOWC2wSTNufflaOe+6AW+99ahaVZhtPpOtMdwYpdVOs2GpxH7WE9+WOe78SaiKxskOQlcggUFK17Ne4rlrL0VvYYzIhaHUnFxf9XizyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwUvPeyXT0ja77gdeL6uQGGdqaeRZZByCOzrPHPyQe8=;
 b=cm6difcGMlVb1XW/jyRud2jitv1d8mBN/kM8DbMXEIqqJD6aXOXgwgT/F36ROvNfZuO1S2OlzAdbzhxtLTZIaHG9UrEpmKJ/GVF/SJGVwuCF99SaKeeveGiaFxb7vXB5tRHoVHNZ4TtPSq4mR8EBdrq92hNHY/xx7fOmJmyCO533JNWiQTJunxTVnFKOVjJzJnN6y9t8qkTA+y4JvLRVYjvPwD4Wru32fLdI78dhLrrM2S5gyONlZ0Zl89XS1T8+7+mfXG5ehcpP3nH5ikJDPDKiYDQMViRMG2um+PSzMeRh5xUR8imbiP/2YpCZ+WR2iBUDqvPhCgCWeNBVUqfhqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwUvPeyXT0ja77gdeL6uQGGdqaeRZZByCOzrPHPyQe8=;
 b=RVZXjG8x2JrFiBnu1aEiN7zZ7JEuVJSeLN5t7n+YnhIETizR1iQL/2e2oKPGC0h5sOXScKzS27QC/nJBN/ugvcnKgDIR4VGNK7YgKtsVPbc6qrbQRCT7pnYbb2mAjyxbNRxD7silWvlztRhLImlvzVMGZkTpPF5T5m5dykbQHq8=
Received: from AS9PR04CA0038.eurprd04.prod.outlook.com (2603:10a6:20b:46a::20)
 by PA6PR02MB10924.eurprd02.prod.outlook.com (2603:10a6:102:3d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Mon, 9 Dec
 2024 11:49:02 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:20b:46a:cafe::fd) by AS9PR04CA0038.outlook.office365.com
 (2603:10a6:20b:46a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.14 via Frontend Transport; Mon,
 9 Dec 2024 11:49:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 11:49:01 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 12:49:01 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v4 1/2] ubi: Expose interface for detailed erase counters
Date: Mon, 9 Dec 2024 12:48:42 +0100
Message-ID: <20241209114843.2484141-1-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70A:EE_|PA6PR02MB10924:EE_
X-MS-Office365-Filtering-Correlation-Id: aa01142c-2ebb-4d72-cc42-08dd184779b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wa/C5lc7ixuQo3Ex6lqIGBdAjxceDRO8WZtP8j5v+nx4PsMvaaJ414SQGUVZ?=
 =?us-ascii?Q?2LW3pr/3sq1Rwnd64zewlDs7k1ME62wNvJcGi2bqVOR4I4ZIGATnuXS9OX/a?=
 =?us-ascii?Q?hpym+Rh108sKbWbqGGZpJ0h+syQ0SGpie8vnbS9eihcDM+STMUtObXQn9i0w?=
 =?us-ascii?Q?1dej0U8RSETKZBX+p+QLeaW0ekY1aBaMLwjrwicR8n3fOHD2TNEyBEYTgFwu?=
 =?us-ascii?Q?ylqHwzWA9GLPv4A9z9+yP+EbCTGHxLa81Jq+b5i79bkKWNBVp4xs1pUE/iR8?=
 =?us-ascii?Q?+9iBl1TCpukuaisn3DViTRq1VfNFfYqdhMOBqeCLXjynNBfcwEMIzJ0aQTQV?=
 =?us-ascii?Q?CRYsxGZRNRbkatqEKGGb4XnpSIrkmdGe0iEb5Z7xNwDrae8qpNiWqrb5CtDJ?=
 =?us-ascii?Q?EeXuca/Tllpgjykmb+dtrWVZAnMHcn6V557UiJWWfonXZov02fG4XAJJD/GB?=
 =?us-ascii?Q?gvzd5YEem23A3vTqQQHyn25PhLVWoKHawYsk0Z3IPin16YtGzLoKR4WaEs4T?=
 =?us-ascii?Q?F8Ev6ZmWQVmdcRabVMTuUBss3oHRG1mt4kQ+7w7Vd1e2gzFhETXyDT5vY+hr?=
 =?us-ascii?Q?InAgRJklEc899jscHn6ioIQdpeVlOtl3tSi2sKa72Avsyv0J7gfeMBLoRlzJ?=
 =?us-ascii?Q?QhY3E/o4WcJNaZ9g4uyPB1BPHF+fNoR5KK5Np97ZW3PSEW9++BWswYf7eykD?=
 =?us-ascii?Q?LL7kdl1BtUb6eL8SW/6rE+ztWCZKh5PHi5d3fOHcdc/iEsOlLMU8yef5CPAa?=
 =?us-ascii?Q?F7+wu+t2hgcT7uIqOR4m2Q9xCE/sUWaMyChNpiLRFSCGaaFt9C+HaxrQLyYS?=
 =?us-ascii?Q?aVeYWrffNH5cXQVKrqQ1E++BRDnlyKe3E7oyjKddY9JkJ5X/+8Vgtf/cegP5?=
 =?us-ascii?Q?8Q0/lQ5tgvURTG7lePaVYf7PG0jUBqLohRPuNLXEUCK9nVI0Lo6eXswNK+kZ?=
 =?us-ascii?Q?lPYrGUdtrRgBEjZiZkhEH5T03XmQeMl2Nu90lob3nslHJ8TIJm+W8iVZvSOl?=
 =?us-ascii?Q?CI1PEb8meDU0iOeVjrCLE1bFg8wqhqmZmGll6HCFPjU8sLrcH7RwmP+Jjcl5?=
 =?us-ascii?Q?qr4FeclEoMlM7IKCpaooPZTAnIWnEbdTYsIB9VVbWHnzO9tLXx8Awt5ITyN3?=
 =?us-ascii?Q?oCp6Mc8iYLzY1Qyqn3E9SBQlWWCX3d38lWIDNxbkjDItTm9juqSZD415uUFR?=
 =?us-ascii?Q?of8NiqT5Q6SWHc3PkjEplGeCbhPjGKClPu+hxiUsKnDmrn8ivS4tNELse9zv?=
 =?us-ascii?Q?ua/hE1aPgcjWcFYIeMDN4fXtDTCAWjvPnLV5pHUH8YUarbw4hykcn4ckchR4?=
 =?us-ascii?Q?CBF9okQZe4CWLr3ZuRfuvsXNbz949H2izjvWuCCqaeWyGxG5n2M25gFYWGjB?=
 =?us-ascii?Q?lh38d6VCMdswebel6XB0zwxiwhqXPT6cLJ7nBtRBUAG+BBFTxvVgPvK/RwVj?=
 =?us-ascii?Q?EZPe/6XDb5HBAkssMOLExlWEKcRxNhD9?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 11:49:01.9802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa01142c-2ebb-4d72-cc42-08dd184779b4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10924
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_034907_109083_D48AED35 
X-CRM114-Status: GOOD (  14.65  )
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
