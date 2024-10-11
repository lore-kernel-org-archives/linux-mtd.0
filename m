Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2607ED0D78D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sgh9aDOsd02xBRMWKqZbdpzSvxdU44873sZ6q1UMdUs=; b=oF+fZ9XPHEhR4I
	UO/AabcbIKNH5mjUHvShkJJDQxwtKgX5y4JfRiCDPgEC8gXMENMhXYNaY5t1lll8pDwlD0mLdruU0
	jwej1itpCIH03mFjVqnaYsLlSGwhyf82NHpswOu1WAmEDYdBOGBMrO2icSd70VsTWxSbeKlFK8XV1
	GTe4hO1GaMbKQyCbqbEKLpfbcT/VDm8S6QTlGMdZJoHz6D9F0LKXPkPvsIWm1Q1/+HnWLnrBVJls4
	bOEKkoRfHdOZgMR7RoaWzivEsrK8qlwaONFw2r9PlGfokC6jpJxpxfJc4X+QwFBDTSeAcOH/Z/p/o
	+hZjwSOtgV0l+xi3LhAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFGh-0000000GNLb-2IhC;
	Fri, 11 Oct 2024 13:01:19 +0000
Received: from mail-db8eur05on2061c.outbound.protection.outlook.com ([2a01:111:f403:2614::61c] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFFE-0000000GNAV-3Ect
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:59:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttgpd+cxB2J+XPgFx/aNPnfdowVYIVl44+MQ8h4m5cCkJNWFd5BCAV7oe39cHItsdMUzkXqaNYv+srJHhWLCSFjS7pQzZaWGU8DcqPHT3sdtlx6Nv2aAURQkSNZwh+xDVwZxStbWKbvDvUYHTIYUdsIZXpTrQuKJWBuOTyBCPB55QhZlYDTQ8zCMUI3BXduQzHhzSplb2pTHf3JySdg3lh+Nf2C8OD8QqDbzvkBV1RGUR1zy49zIwEkVS4UOJEp21mMEh7sCyKLW1GSQP/1SBc19m3XNlOSRPpmfYTk5oX25qr9xcJd/kYT8k2N4pDLuV221bld4K+gHb2OivlOhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dRU6EPWckVb81kgh30r0sI4eBe6a8Ibaey9rcAai44=;
 b=cBbXJOSXA7i5Z4vDi1I/Eb5oyqePnGveA6ga1wFQiGmlY85D/XoV+0YpH2MsL7XgyFbdcgM49SCXwefoxD7lkohbDEcJ2cU26J1600vjLEF6YUS+vUi+ZcYVdnc4kc//eGXhLC+i20epem9dSukV8XBcP2EqlqYrAG71xf7nE1ra1K6aCiw/0iV6FGeltWz1309Fivm/ifpP80NAHElxuYEQscAyr3P28fVi4uXojLdxhOtskv2Vdy9YlTjfShVA6IZW/pT3MM7RcGMOv3rZDbAFMYRgGmsN9AczKFpEifqQQAcKcXN07WwBPJefF84vPaKtPNxRytnP7fULErUmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dRU6EPWckVb81kgh30r0sI4eBe6a8Ibaey9rcAai44=;
 b=Vl2X45gsRhUPqGWn1iPVWpQ+GboE5md5SpeMAEz/Na1NRJZy/oPXqch4aXA6rbENuTnM2PcWh6qTjZ2lBksr9vSSEIDydwSM8bJRs/f65YsnEa8uc8smc39+tix6sYzVZHkKf9MauSYXTpmJWZkpB60nSqx9RG3OCDjIAeZ7rWM=
Received: from DB7PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:10:36::39)
 by AS8PR02MB9862.eurprd02.prod.outlook.com (2603:10a6:20b:61a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 12:59:43 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::d8) by DB7PR05CA0026.outlook.office365.com
 (2603:10a6:10:36::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Fri, 11 Oct 2024 12:59:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 12:59:43 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 14:59:40 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 04/10] ubi: Expose mean erase counter for data in sysfs
Date: Fri, 11 Oct 2024 14:58:58 +0200
Message-ID: <20241011125904.2915983-4-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011125904.2915983-1-rickard.andersson@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|AS8PR02MB9862:EE_
X-MS-Office365-Filtering-Correlation-Id: 57530f5f-ff86-49e7-26ad-08dce9f49368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b+NXPsLg6vcKtihx+OH7+k5A6eD2euDvbFAoyfSm156jPEP8ED7RdYkJhmwO?=
 =?us-ascii?Q?RoMhMa0JdPS3cv3OZjwS9yy8d4sqC7Jn0hfVLUTkHwPwgSkFsDNq3JJkBSq2?=
 =?us-ascii?Q?IrXdal0Y8xsRPEHolZcUG+jDTQYfs4/wLsg0mK7lULuZFZEknyxBk9hdUzk/?=
 =?us-ascii?Q?0Ehqpawh9aMrU4p4TcfVn8ff8qKhfudnL+m/RvcE1K288OT+JGEYPkMwh3vx?=
 =?us-ascii?Q?UsiqeG4iDeoIz/4uN0Vy7xQ/hQ6S/e+bVhRR8I6tNsj0nN6iQgIxn+35qc3M?=
 =?us-ascii?Q?x0RqwmburSOJMkqUevoe8VK8fpGiuILoVSAJcsLwAVmjgMdI/FGLiDa/rPAB?=
 =?us-ascii?Q?zTN/yPlB7n1dvw7keMPeO17LQ2gZ9YZ2mCvQuCYfzBhlRsVrJrK55hTQUKKd?=
 =?us-ascii?Q?q+snGrT5pc6zpN6YG30DoHOobI2tM87Syx37OxiAGNwqRibLsZIGZz8Wd3UO?=
 =?us-ascii?Q?bi42PFBXAKUGAxh3hUaw2euLnl7+zTN/UgrOmmZ6R25Ejl9z1I2fTFzhHyzb?=
 =?us-ascii?Q?2MKl9rmjPtDHhOOj+7w3EwbUL8xcqJQBjv3q2M+/TOh95ryAqexOA/EGzrYA?=
 =?us-ascii?Q?Qbe6bv0cRBfM2z9t+Gh5190ZqHGd8X4LuAD8BvA48LZoo9X4K274TwWh09rG?=
 =?us-ascii?Q?5BCQbcP8r4AFwGczXr4MfdY738f2Q0W8zdzF6i4i1TPKjNFkeMlEQL0QYqeY?=
 =?us-ascii?Q?WZrLQ+xE0VQvEywh2XR61KClgBgJoFNfdWrLe8RPZnmOvLNrbLIwylg6Q/Ia?=
 =?us-ascii?Q?yBnSQZaakiGtmyyHlSnUQO1kwy3jfukQ2BiYzvQCa6ZsFGKbZj2IR1ORcZar?=
 =?us-ascii?Q?QankZeMYY+i7OmSIQbDw6CdpJzf2jtgk4uEMWOb9/XbUX4JZqbRgLp9J013y?=
 =?us-ascii?Q?LqKT3BGB9FU/5Wyzu22fSQ690jBkRIqlJ1knabx2LannzmjZF41YWPQcxGA6?=
 =?us-ascii?Q?XoHVGg6x/WtqnmIY7V97IYra41qME4h2Sm3Kasm1TLQZg4O2nmwKWpOBj7/k?=
 =?us-ascii?Q?Uu6ojHZqYgpSj7/7lAlI+zXlu44iG9uHbftFGzhjnR/rT/2l0zvVYeC5u65a?=
 =?us-ascii?Q?/tIv53rXrQ2lxy1UNPfUgkgzeWhm/in7S9kWVIlG1LYbyh+K5uArYkCo1yQS?=
 =?us-ascii?Q?AW5zC22J5vsA9PdRykm6sAQGekdbk6GVFrw412EkW0VOHZW99J498cLc7c/d?=
 =?us-ascii?Q?K5RFA05/OXPstmZanb4IloCkCUxJUwFm3Mf6wACpt+hpPFkg4eZMkRs1m1gc?=
 =?us-ascii?Q?zu13bjSsSXlQCNhfo6Sm8hhHPIf/nIidtGD8ee+qoIoRYRUE86+AbQCdlD1E?=
 =?us-ascii?Q?kw/lG/L7edV4ILOjqoDHij704Ej33Nf0FwrgT4h19ANqvBBdBVK2GwQfsENQ?=
 =?us-ascii?Q?EYOsmN43E1N5fFOd8ucUpDX2yZo+?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:59:43.2417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57530f5f-ff86-49e7-26ad-08dce9f49368
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_055948_839003_FF7AFF84 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Expose mean erase counter for data area in sysfs. Data area includes
all blocks except for the fastmap area.

This value can be used in order to estimate life expectancy of the
flash.

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 drivers/mtd/ubi/build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index a5a2e6e3be38..9cc7bc74f0d2 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -138,6 +138,8 @@ static struct device_attribute dev_max_ec_fastmap =
 	__ATTR(max_ec_fastmap, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_mean_ec_fastmap =
 	__ATTR(mean_ec_fastmap, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_mean_ec_data =
+	__ATTR(mean_ec_data, S_IRUGO, dev_attribute_show, NULL);
 #endif
 static struct device_attribute dev_reserved_for_bad =
 	__ATTR(reserved_for_bad, S_IRUGO, dev_attribute_show, NULL);
@@ -460,6 +462,8 @@ static ssize_t dev_attribute_show(struct device *dev,
 		ret = sprintf(buf, "%d\n", ubi_calc_max_ec(ubi, 0, UBI_FM_MAX_START));
 	else if (attr == &dev_mean_ec_fastmap)
 		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, 0, UBI_FM_MAX_START));
+	else if (attr == &dev_mean_ec_data)
+		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, UBI_FM_MAX_START, ubi->peb_count));
 #endif
 	else if (attr == &dev_reserved_for_bad)
 		ret = sprintf(buf, "%d\n", ubi->beb_rsvd_pebs);
@@ -491,6 +495,7 @@ static struct attribute *ubi_dev_attrs[] = {
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	&dev_max_ec_fastmap.attr,
 	&dev_mean_ec_fastmap.attr,
+	&dev_mean_ec_data.attr,
 #endif
 	&dev_reserved_for_bad.attr,
 	&dev_bad_peb_count.attr,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
