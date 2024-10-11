Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EE2CFD312
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+mhy9WtLIcv5rIOX3o5jChaRBRX8+csM4mAE+MAuSI=; b=quuoBFnY9ItLb3
	DjBluQ9OC/+5WSrnZx5WDv+XQCNH53DKN4wLApeeMMayAcnv1uH9r3c8YNnGq9iJFNVyqGErLxmnq
	+XFn6bZ26i8/ky1pdqm1VwUVDax8qXgjKofQaOSndZbImFAB3rhEP56/dWZges8+qnJeN0zgMSTg4
	LnNKFjRYOrRdBP0aIGy6S7LfPxgvydQ/KsLk3CK39cfX8QSlCaO7K/8396/cyATWSGMhnK/YbGEIE
	v0kz+j1lw4Ah87Cpx7UkTIEnB9VhXKSwNvbBWvyU4Vv9mvP9xHCVWGGy4aqwNTNYvL0uB/wHAPN5X
	vWqxHDJrSp+bpX8b6kwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqt-0000000Fokp-2J8p;
	Fri, 11 Oct 2024 09:22:27 +0000
Received: from mail-db5eur02on20619.outbound.protection.outlook.com ([2a01:111:f403:2608::619] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqq-0000000Fojq-2vUS
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 09:22:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/aDOcYA9yuUjupP1C6O/NBNj+EFX9sbfRNJ5RYhLV949jevz4DAl9F/ldxtzHkOy9qNPCnVNAmcTITJDUfZ9+6ocPiNN5gsz8b+gTK3ttClfvOfQsdchibT6bgFq+ZAwasE6ji1g2Y9rDQviSzuRUzFopfcFs55ii0a5rQBLJ9nx2Qy87+rXCk4u64N0784WyQCgm+0fPprKkBrb/Q8hSQEFq6kDpYQp7ythgMwMKRZKgyTO49z60BeVwXuTg84V7GC3kBU+IE00pO4WRS6M/VCBlGC7A+1WlDyd0Upp5IsMiBYHEX4wi/MT7Ap/HwHvV0glpc/RLxIHFNyMeTvuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G05KTCkLvju/jYN0DqxiPdfrzZmGQqcLczrz36dLxTU=;
 b=N2Y8G67f//OsBIkRJ7b5cP0wTJqz+bJ5qg3Ermar7jtMlIBhoKqupShS1Ja7bBBuN6LiYJAKlr0iL9i9IhaRJLCxFHei16gqKmQbxwKq0TcJorZVfvqAr8oGmiyMUerK1HOU+5FxnH/CtUDHhYQYhZyRt9QzmoD80l0NycVzkQMS51p7jN5Sfmz90+A/lqHeXPQfBVT/lIxlmGlWPO1CzBSnBRuC/Md6NNObbbvVozqBSJvQhPasJaXrGfDFCP5vpN2epzHWCATdJGXu38TqPpTJea/yU7CHGz4EDZa5SFDiOk1RKs7oWkU5rFaUJgGO563V63QTKi9Iu+23T077Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G05KTCkLvju/jYN0DqxiPdfrzZmGQqcLczrz36dLxTU=;
 b=NenH+X+sPA9HqEcVDmrRR2hA/SCIM1NXVdOwuF5eonV52JND3GEAZdxR0icP2hCr25Hj69EKpykxt82+mXgNyMzv6od9sCvl6eThBAHAKTgCzGPnKXXXPKH87zromnQq11y3ISY3l26TBu0MWyX1Y8hfoBUIp01Vf3biXnAKFfw=
Received: from DB8P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::24)
 by PAXPR02MB7197.eurprd02.prod.outlook.com (2603:10a6:102:1ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 09:22:17 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::6b) by DB8P191CA0014.outlook.office365.com
 (2603:10a6:10:130::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 09:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 09:22:17 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 11:22:17 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 05/10] ubi: Expose max erase counter for data in sysfs
Date: Fri, 11 Oct 2024 11:21:29 +0200
Message-ID: <20241011092134.2909496-5-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011092134.2909496-1-rickard.andersson@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922F:EE_|PAXPR02MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: b46a8b56-9243-4bc5-62dc-08dce9d63396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bB7R+gnXbeF64CQnpAgpxh4idPO1c7jjiYc5plEaW+jAenp5/aeJnUVjLD5O?=
 =?us-ascii?Q?74uWM0OpSdwP9Og9j7HXZIchW6Yi01H5kxXnWXGypZ697I3wW/LY1SMs5dPS?=
 =?us-ascii?Q?n/wwrT8W6ET2QsMfrGlsouTB9AxWPkjFfhws5r7JHPQ4bkl9XfBue8PwhX5l?=
 =?us-ascii?Q?vNlw5qsS0rO7fSDW254KXHz+iogiz73u0bObojfJEKyvAoke7/xR5qzBS78n?=
 =?us-ascii?Q?4shl4b993ph64dQXQ/oxQ1J6cO7Kut2M9mxBukkTLSbvsR1vqqvlZ7i4l0cK?=
 =?us-ascii?Q?H8Oex3aGWiBWATarpyQ+SG6UuM/z9hZwt8KGuLl2hP6K+F8CnTH7vAbwoQj2?=
 =?us-ascii?Q?mb31LyCm+Mu43aqcFx9aR/a9EOW+9JmEY35fefptt6ndr/Z3wnGJOsNLkjTB?=
 =?us-ascii?Q?Dwnbx9TPc6QY0Ow6a9l5usy9McFEF1fWzbHdzazXtW9S3W7pUCQ4hh/QTAYN?=
 =?us-ascii?Q?DkHGt30FdmoVA/qjLtJhatsTCjBuAOa+UfnkGNLM8iUvFG7uLEZcZRXM8jNn?=
 =?us-ascii?Q?Xs/YWSPDEMpO23jNlyL+F/IkIQ91McogFtoTlLfU/HdqmYdtZQKY8FfjLhtI?=
 =?us-ascii?Q?Qb1J2+GsiGk0Z8uf1idF9dh0K5GXT+o2cttzxxFaPfYLsK00oyRa+i18ll01?=
 =?us-ascii?Q?bTXQkUnfOCg2t+nNLSNs2q9y2nStPGA4U6KgbLh7qA8S7CVhGp9HvK+/guho?=
 =?us-ascii?Q?OBl5p6DuS1f48qWMAq9FHEBd6kvEoIqwzRam68/EUzfeNgAxQhbjWlI7zYIF?=
 =?us-ascii?Q?ZmWCMTVIx/jETvGOYQThhRVjqTqYxOEHR6Q+2lD8tf48tpgBpeYubgHrHtkV?=
 =?us-ascii?Q?a4hZRyP1csxipaqGs/u5Uf3m8fKSGVdjBMY7CaQncrOgIR1QyzqTmjfeukdU?=
 =?us-ascii?Q?BRRijclNXHxdK+k5v9UdF21834+oRLR3r7cbOaiDnnApn2BSTv+kRP984LnX?=
 =?us-ascii?Q?vEvFqvMDX+OUoYQciiFPbI7sdwAs9DpHtHZ97O+dk40TedB2WWhSmSYOVHhD?=
 =?us-ascii?Q?2z134MBUoWe5yrBiMXrhTVXopJMkYBEi7VlhDQDLrp+bVHSKqDab76Odx0ld?=
 =?us-ascii?Q?/WIQRyvSX/pivxrhMO4y14o/moLDt0j6P0sPJl2Yjbg/blg2Qhd8CVcfYTjK?=
 =?us-ascii?Q?r8jGszZJH/6iARs9kzQTETy7bSp5GnUqdCmvmN7HWT2mg6+N4bSbohVjoNob?=
 =?us-ascii?Q?smPXVq7M0rjJH4V9X2GS9GENI0qOdo8uUfqRvNX75np7tme/aHt82Ghi9r/0?=
 =?us-ascii?Q?EG5sKkhWpzOdvQRhKlGJHUH5CS4yP128UD9iRS7ULa3A4dFz+BucfzdH5kUN?=
 =?us-ascii?Q?wRmzn/3Y1g3iRf5cmaLMcPzNF2wTkVOvrZDmbbkgnKrd1iJxMadl0hFxKLrY?=
 =?us-ascii?Q?gmIZHXab+rlvyih1xDZl++JDoKLV?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 09:22:17.6909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b46a8b56-9243-4bc5-62dc-08dce9d63396
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_022224_762451_3D6AB648 
X-CRM114-Status: GOOD (  10.08  )
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

Expose max erase counter for data area in sysfs. Data area includes
all blocks except for the fastmap area.

This value can be used in order to estimate life expectancy of the
flash.

Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 drivers/mtd/ubi/build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index b253dcf849c7..f3649afbc777 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -138,6 +138,8 @@ static struct device_attribute dev_max_ec_fastmap =
 	__ATTR(max_ec_fastmap, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_mean_ec_fastmap =
 	__ATTR(mean_ec_fastmap, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_max_ec_data =
+	__ATTR(max_ec_data, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_mean_ec_data =
 	__ATTR(mean_ec_data, S_IRUGO, dev_attribute_show, NULL);
 #endif
@@ -465,6 +467,8 @@ static ssize_t dev_attribute_show(struct device *dev,
 		ret = sprintf(buf, "%d\n", ubi_calc_max_ec(ubi, 0, UBI_FM_MAX_START));
 	else if (attr == &dev_mean_ec_fastmap)
 		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, 0, UBI_FM_MAX_START));
+	else if (attr == &dev_max_ec_data)
+		ret = sprintf(buf, "%d\n", ubi_calc_max_ec(ubi, UBI_FM_MAX_START, ubi->peb_count));
 	else if (attr == &dev_mean_ec_data)
 		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, UBI_FM_MAX_START, ubi->peb_count));
 #endif
@@ -498,6 +502,7 @@ static struct attribute *ubi_dev_attrs[] = {
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	&dev_max_ec_fastmap.attr,
 	&dev_mean_ec_fastmap.attr,
+	&dev_max_ec_data.attr,
 	&dev_mean_ec_data.attr,
 #endif
 	&dev_reserved_for_bad.attr,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
