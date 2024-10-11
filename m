Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB14D0D789
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ec7Ht9o3oJx81V9sIJtxGQmIVsEDa0PDVbKrt/b3uts=; b=vX1RXVlEZYJnb1
	qLghNwbK5Ba05QMbllWYEFFo/t/hhQ+80XE1S3Dzta39DWVOKFG6mIONcbRo9S0rF+UTvxCr5EKf5
	RAjtzu71bexCcfJH8Ir8MlgT+JpTojk+9YvP/wCE0QA4L3emIrP1vruaAjrdLmG3u5Chjsib1nCSJ
	InBPHr3i8eLNbZkCgzAJTqZpq92k4lz+QukGntZXf6guDVE8Sn4eg7HPkGvwO5c5I4dgrN8OJgEtY
	+fxL/68gahVXsCvoKf7YExni5dEZctz55+f+CRrt2y6kdhS6tA/9egGFnTNWBjsqTMwgO/DnqRnHT
	ERiCGtIJUD6i4ui7ZP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFGf-0000000GNKl-3Wct;
	Fri, 11 Oct 2024 13:01:17 +0000
Received: from mail-am6eur05on2061f.outbound.protection.outlook.com ([2a01:111:f403:2612::61f] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFFD-0000000GN9o-03x3
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:59:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZ89aK+svbNlhG0wTvahJukn9cYZCT456hGGm/Koj0vYOG4sAswfSiilW9EuxX5WK8tpDR2Si4Xn42flLCwJtJIsMK5b062dnzsTJIb4xLnucqfdDi555yxHxxsYZEIPDvbeTXAA26SYRr1kJHWPncuxtz6A18gazJyeb1q2Lstlmh+tDBFArO6x1Kkbn8rgZV/VLyGI/k7t9OCpLkDxIyhzCyf0TedmW0ar7vJ2k/pr4T01JD7N6GS31Oq5bWKSNDCkOhHMxbAh8yKhN+NRaJBqMHT/ey1+WPz7xqCCywamjJNnGS/0Ee993UuXr6spcs2Z43hpcwryFaMBLnwKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThIKnrseUYGBz5R1tkBlhbC/RDHmGoH263FGzWhIkKM=;
 b=d9WOclv8VILpj/1zd8bX2STd1rtHhy9AftIsMH4iYswQGBsBm5+PbWz/Ohrea1dycLwcPfq/IuxIhYQsulDg+kcCl3YBceBLJ2i8saUBhq9cwTjliiMuC+jnoJkUuxavk4IHnf++87GblpoJm1F43jfVVN0U+7UZi6V70I1hYJWhA2gGVFCt/6q1DP82E3yicfSlgCTuCRYxZjom5Cj3veBdDFn5T4LDz/12XvE7tBlKlmxIxWAcn6dv3xKIDyc7JUj7Z9LdpbUi74kEcNm3I0QyIFzT1zEpM51BkVgEtan4I6DESO7CIBlLR5xLdGz+TcYwyWgShgvYLdyqrn4DcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThIKnrseUYGBz5R1tkBlhbC/RDHmGoH263FGzWhIkKM=;
 b=UoXlKmU7g5vJ7G5aiq1VfA0VWsbobmVhH/JrAV3AKKvb5HWDnF+c8u/OKNmZed/unrIlY3smY3ycXelIAbk//0gUkcxhUM5uVkRa974/fqszAgz6lW1hp+k2bhJBmlb1CKZJgr0m0pb8F3hkDNUk/7v7ZK+JbAo8DiABBYj0yTQ=
Received: from DB7PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:10:36::43)
 by DB9PR02MB8252.eurprd02.prod.outlook.com (2603:10a6:10:37f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 12:59:41 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::88) by DB7PR05CA0030.outlook.office365.com
 (2603:10a6:10:36::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Fri, 11 Oct 2024 12:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 12:59:40 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 14:59:39 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 03/10] ubi: Expose max erase counter for fastmap in sysfs
Date: Fri, 11 Oct 2024 14:58:57 +0200
Message-ID: <20241011125904.2915983-3-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011125904.2915983-1-rickard.andersson@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|DB9PR02MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f3b5d5-5285-4126-fdc4-08dce9f491d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t2+vvNtB7PVRnU6mdkqcatLLCjHUJBQ7xol36SVW+P7X9BjYLFT3NGxoz1yv?=
 =?us-ascii?Q?Re/dYNc/JAt/FTAvOXzpT7hB/cLTK2wDJBT6+hRzJoGrEK4g60QFZ20+XHS5?=
 =?us-ascii?Q?IUdzhXT9sbddlkwpES7V1KccpZmi3Yx9C/RKnnZHHkeTmG7+kReT4B49GcdQ?=
 =?us-ascii?Q?r1Z5hAG/A3Eo5DnK6sBXLasHdWdcKyNPaFRjcL0a9NBg42NQbOZHu5TRkOSc?=
 =?us-ascii?Q?P6Ov1mNyqgrqd3BPO0HqBa0FZsk3vj1c+KXgHte56vSmOSnegNlARUI5WMo8?=
 =?us-ascii?Q?/mgcD5LPA4ZCOkaWJL6LeZTgi+EW4GqW4BSE4LCtEMjdEnj/LmozaxeDzj7w?=
 =?us-ascii?Q?OuLatewXAy7YfqRqsLViLaK1/beRZKBcEbTnvx4927eh9JJq7lUEqzGspCos?=
 =?us-ascii?Q?7npeb7tn9H+N6gxd7yrq7xW5KcrvPe9ERs8hqBuaDtlTT+TmcgIB1LsGxzuq?=
 =?us-ascii?Q?Q+UmgYyXdGxVu/uGuN4+/zvdL+HdbaPEjCnqav8SdAvPqgeL70mUZBR6A+l6?=
 =?us-ascii?Q?xwoisnqqiemcocEMa6xqxYTgj1qSDYMThjMBKtDB0pooDp2gPhYtyBGyLbKk?=
 =?us-ascii?Q?vBakNfooUJC4QS4GmsUoeg3XfotmZEVUUv/Ifr4jPiNqmQ9HuHzi91ueBKmL?=
 =?us-ascii?Q?WkrivxAqYvWl5rUAe/pg5xb38D9Xpx+l2etsxo+SofS9tYZNDy4vdXqGKPXz?=
 =?us-ascii?Q?o+SZqtSjc44x8vgZz2IS0zsJJzCPdXU0J2B7qVRRIpA3KVv97Sj/JUtnXOay?=
 =?us-ascii?Q?tU7z/yeu3cdr8aOlWqtkQsJc+VokLI2sxT9k6Ypb/OwOlGbbiOB2vsALcEIF?=
 =?us-ascii?Q?nupVYdpYdekYOe2JMizGJ5t2Y41gr5aAina0bNlYCmI4oeWAn6oHX5MOLpwx?=
 =?us-ascii?Q?CgS9u4n7ZbqWnaJncF/rc4roK0yw2uH6WpfWl7RQtEMhR2REGmJNG0Irn/sm?=
 =?us-ascii?Q?8x58BoRs4Qbf2ClWoaQFcnnzwoUq92X/EDubnw1YWCaq6ign6Qh19G2o7+Gi?=
 =?us-ascii?Q?mMU8kolW1oaSJnLb5O29wCmNGNyvEDvgh5cL9bYZUO+8pPbhtsQ6ilTtBsm9?=
 =?us-ascii?Q?Kra4wOoUaDWDxkBrQPE/XeXUk1BhVhU9f2rIj6GjC2r/XnlWTmBMQ5e3XS47?=
 =?us-ascii?Q?do1JyjiCF6hjPHnBnhJf2DPeJsd/YJrxXb83xwpAdhYeFySGTrxr3exCjMbP?=
 =?us-ascii?Q?RDK4LS5MP6bYvi9XiSQY2rdcaaEJPIBhd127O6b3nDXSsTL63wYYTVukPpFz?=
 =?us-ascii?Q?AgxMeWeLfYY6DJgkYqD7D0ItjRw2/rZj98SuLTXvuUpdgeWXC6VySyjAy3A5?=
 =?us-ascii?Q?U1ZqPejqgZCSGHlwYuuyi8d9wnZsU4eQvai0VFiXKfsFzNrPQwvg6ZtodurK?=
 =?us-ascii?Q?bo2ZuhoPH9ebZ3xoHZpAI524PeD5?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:59:40.7261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f3b5d5-5285-4126-fdc4-08dce9f491d9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_055947_090349_1CA71133 
X-CRM114-Status: GOOD (  14.26  )
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

Since the fastmap area has its own wear levelling it is valuable to
provide a max erase counter value specifically for that area.

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 drivers/mtd/ubi/build.c | 43 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 1c531d623a62..a5a2e6e3be38 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -134,6 +134,8 @@ static struct device_attribute dev_max_ec =
 static struct device_attribute dev_mean_ec =
 	__ATTR(mean_ec, S_IRUGO, dev_attribute_show, NULL);
 #ifdef CONFIG_MTD_UBI_FASTMAP
+static struct device_attribute dev_max_ec_fastmap =
+	__ATTR(max_ec_fastmap, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_mean_ec_fastmap =
 	__ATTR(mean_ec_fastmap, S_IRUGO, dev_attribute_show, NULL);
 #endif
@@ -384,6 +386,44 @@ static int ubi_calc_mean_ec(struct ubi_device *ubi, int start_peb, int end_peb)
 	return mean_ec;
 }
 
+/**
+ * ubi_calc_max_ec_fastmap - calculate max erase counter value.
+ * @ubi: UBI device description object
+ * @start_peb: First PEB in the range
+ * @end_peb: End PEB in the half-open range
+ *
+ * Returns the max erase counter value that can be found in the range.
+ * Range is half-open i.e end_peb is not actually included.
+ */
+#ifdef CONFIG_MTD_UBI_FASTMAP
+static int ubi_calc_max_ec(struct ubi_device *ubi, int start_peb, int end_peb)
+{
+	struct ubi_wl_entry *wl;
+	int peb;
+	int max_ec = 0;
+
+	for (peb = start_peb; peb < end_peb; peb++) {
+		int err;
+
+		err = ubi_io_is_bad(ubi, peb);
+		if (err)
+			continue;
+
+		spin_lock(&ubi->wl_lock);
+
+		wl = ubi->lookuptbl[peb];
+		if (wl) {
+			if (max_ec < wl->ec)
+				max_ec = wl->ec;
+		}
+
+		spin_unlock(&ubi->wl_lock);
+	}
+
+	return max_ec;
+}
+#endif
+
 /* "Show" method for files in '/<sysfs>/class/ubi/ubiX/' */
 static ssize_t dev_attribute_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
@@ -416,6 +456,8 @@ static ssize_t dev_attribute_show(struct device *dev,
 	else if (attr == &dev_mean_ec)
 		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, 0, ubi->peb_count));
 #ifdef CONFIG_MTD_UBI_FASTMAP
+	else if (attr == &dev_max_ec_fastmap)
+		ret = sprintf(buf, "%d\n", ubi_calc_max_ec(ubi, 0, UBI_FM_MAX_START));
 	else if (attr == &dev_mean_ec_fastmap)
 		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, 0, UBI_FM_MAX_START));
 #endif
@@ -447,6 +489,7 @@ static struct attribute *ubi_dev_attrs[] = {
 	&dev_max_ec.attr,
 	&dev_mean_ec.attr,
 #ifdef CONFIG_MTD_UBI_FASTMAP
+	&dev_max_ec_fastmap.attr,
 	&dev_mean_ec_fastmap.attr,
 #endif
 	&dev_reserved_for_bad.attr,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
