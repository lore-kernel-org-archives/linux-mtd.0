Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F16E7717B
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 11:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PR0ramdU8Jcx0J/ANQREr4DE6zjUVk3hLmG3IXEY/cg=; b=s8Fqw96I9TFat/
	+YDymKwbzv3JIuJz78f31xFNRtIYQnnwISiq+BZsDxs+GbIpRwExziFqJ5SSG3P+sf92FIcRihAcI
	BGkGT639F7tHoESyOiaRQRAoM2CAs2wk2emQ20FjBfDTp7qDOrylh+lxa4mfU33Dm4tqSVZ/LaGnw
	Gn3tOdXj7MlNwTp3uW3utJxs/VtIhhqmxIy/zjP3ljc/IxLvmI+xXTEkAjHhO1utxXShP9AYJ6r0s
	I7np1k3+1dFgapqMTmiEo7ZUYR7Zu2DdJMhmlkQLRY9QQXch5uEEd///EEaU4YLq/MML3HjZmiL0l
	EXVwsGyzqNlqICoRKBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWsl-00000001V3z-3Guj;
	Fri, 06 Dec 2024 11:52:27 +0000
Received: from mail-db8eur05on20605.outbound.protection.outlook.com ([2a01:111:f403:2614::605] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWsG-00000001V1g-2gdV
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 11:51:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4QKtIydvgQaJNcwfZE7ABzWJ+tUy7Gg/B5N3TOxXaX3+NEHFgQemy+Bt9jjyEkwVCjEGzflov1esWLKzaxWrRxaP4ukBr8Ntop5nw8w22d0mNLujPxbY/l5Xg4sCFW4f30f74w0Irkf1drRg9lSR2R2CxzykP8Z/OFjC9iqU0hVm79zLOAioP8f+qSuBKJ38nNKJtZCT6CtLie50GlCzq1w93sMehg1EKyqEVxjZB8wcc4ivwV1Oxt2WaI+gPEj472YdJjeXFCGzRYEhi1GF712h9NSFc32H2bCCKkk5nrWgkul4Sq1WkDoH6mJgqQLxRxR67pr0X5DwVhkL5Wh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruyvq/Jckd5pzZOEyjyiErRhWURfGDvGKkRDOFDLCUs=;
 b=WkfXitayL/J6oPh6CHXSseVZjK5yW3XF/iNvwrBMpYZnx6ms/H41ad7FU+RB3UcXAmfGYA6GygAbPruzd3jC/SCnDxx8A5cVxzWh4lPWbC8KtuTwFJESie8X9sCTuFxSFi88dmuKEmMK75aFfPIsx5Ri0G3f3uN5H40CdaJOFZcyYmwM6fSszTenpG7HypvvMyWvi+sfpFRdlryUHcbxl11cjjC/uSzp65xRv+gE8eBg5wD/LBfeDdAhzcR93bww/eIB1J0aKL4ioiotMLFhwU1YqJE3wvQsUDooSWzKHcDno3AJPnk5moLcPFCqgRFrxO+fK7aC7P8bhCce20fBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruyvq/Jckd5pzZOEyjyiErRhWURfGDvGKkRDOFDLCUs=;
 b=Q9TJRlnacxv6fHcYZiQJLv2VRW+cPwUvhTKUYepOk66B+gBTZG4YaKucdA08yRF6/8mXELBpjA3FVFECnEGzFuhx0E8NDSk8v6+cPWfcQ26OC4MCJ2g3uKkNqGooTZb8ox7gfIU/R5irafvTniRQ4Bced1XhOqGMU4qtQSrAEzQ=
Received: from AS4P190CA0060.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::13)
 by GV2PR02MB8918.eurprd02.prod.outlook.com (2603:10a6:150:b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Fri, 6 Dec
 2024 11:51:50 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::31) by AS4P190CA0060.outlook.office365.com
 (2603:10a6:20b:656::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Fri,
 6 Dec 2024 11:51:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 11:51:49 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 12:51:48 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 1/2] ubi: Expose interface for detailed erase counters
Date: Fri, 6 Dec 2024 12:51:26 +0100
Message-ID: <20241206115127.2304701-1-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|GV2PR02MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9b92c1-92e5-4709-ca1a-08dd15ec5e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bLQw5JE2KaOjuWDL+1pWW7kKrGq36ynb74vZme2POgLZOnGcAXTaDhsGDRJM?=
 =?us-ascii?Q?ZoQisgOYS5wtV6tosX6pjaiQQE5i4nHYZC9Hlv0ofy1kTh4VVzW20FuaikvG?=
 =?us-ascii?Q?DfGaSqo5xdhFzPVTOx7SzsbRCqA0Rsof1rNeWXOnEXqh0IDz+28tsrnE9s0l?=
 =?us-ascii?Q?4SyTPfaafriHqJLWRjnJR6nc5Ds8HcY1yc80OeiWIWiMQHF7PI7My/WF6Wlk?=
 =?us-ascii?Q?OyqbBIUyxaagRlOKBdoetWj9qyVZ5Pex6Fn9VucQkVz/tpiEstDEsYPFvxdZ?=
 =?us-ascii?Q?2+yLf5XgUxSMzKUV4hP0xVGwLUtupI4a7XmFRv2V9yLDqakEKseDdAHhva+G?=
 =?us-ascii?Q?4CLEPBubRQLyGgNq6XdZMuUb9pZJotFSm2Vj10ZmZ8Wt+c3+tdNCdegAv3Gy?=
 =?us-ascii?Q?ifbbUhPQdwSK1a5HpQ2wpc5QGsNjLt+JPwduttSAKlufwhKkZXdSkwnar5b6?=
 =?us-ascii?Q?C3Qo2dZeq1xf/Uc1LVHqlwyixA056z/xfRhGGqljHCwP1tMlrP92rzNs3G0+?=
 =?us-ascii?Q?R0Eaca0owd4JKz2Zu3Gb8Iy0mOBIhVkgzc0Cw6KqzGEpgfqA8MH+ukUlyLqK?=
 =?us-ascii?Q?4XxxXVHrAR7A+EQD3MU16FW3Cw9KuPi4OQ3ZEhc63RMxA2ixYK+ZPTq9iptP?=
 =?us-ascii?Q?G4Fhq2LPHRhIJyiqgbdrZv1RtZH3ZpkP0toJbWThSxOQ57AEFa/4Jsd01Gju?=
 =?us-ascii?Q?cWWyRzc/XRAzjXpnFh43bZ9dKW4qe6EdShC8989jsz3gYu2RZJsad7ARL9Cg?=
 =?us-ascii?Q?nIpLFklbbcqdYn3gy0/PKUxgxKeNIJ5Cmuql8D1ThPgKYTVtR1Q4b5Lq4rfZ?=
 =?us-ascii?Q?F0XweVNdNFKA+sNj4/ZyXyyDnJtpVFHn9G4g31+KcbcwhufF7HrtzFJJywSY?=
 =?us-ascii?Q?nLmcMHOFXs6XhZ5Eqd9ad9k03PZph443zPEws9Oqzd0IOnxZ7UcQ84+S9rHh?=
 =?us-ascii?Q?wAXrChWq8iC94NrTpj7loXKIZv+N3ChyCb6xKe7VwP8IaHc3I2eCbMMWW61S?=
 =?us-ascii?Q?QgGypjHuxRjEI2S+xlOJFD98TRSWqhK202S1c5n+Qihy18rUHUSL+6ybn8uV?=
 =?us-ascii?Q?uxsrhe79tTgxY4ieTrokvANL1a1vDovnf8bkTDZJ4lFIX3fIv5yaOLDj88vG?=
 =?us-ascii?Q?ZPsWs2JyAMRo0+x2GQ7C6Z3Hlsvm7G3eAxos1Gu2vedpB7sGoYs6AqYE4JNy?=
 =?us-ascii?Q?/4BNwNbK5lSCM9kpMJE6ApuPWaWfBITQkolqGXTfDl6h6Ff7d65T2vOUSv1Z?=
 =?us-ascii?Q?THBPzpHEz9WQ6aU9TwaZ+AJZVFgZrn6bYZDEce+NeRDSxnEBdFHypCSizs1E?=
 =?us-ascii?Q?3XPsCvWrFN1eO4FFuMzgDUFLwVZ9sH2Zk6sat+Ntyj8yaXGxD8PUzs5MvcPK?=
 =?us-ascii?Q?M6Gw+TYzsLeWwVoSe1yD7IRO/TuZVhL/twQycbvL8IoLoywaHeRzO4gPbQuP?=
 =?us-ascii?Q?OLAcQptt5ukPNpa5s2BrTgJo81jCEhlk?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 11:51:49.7998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9b92c1-92e5-4709-ca1a-08dd15ec5e7e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8918
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_035156_871545_5F271F59 
X-CRM114-Status: GOOD (  14.10  )
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
