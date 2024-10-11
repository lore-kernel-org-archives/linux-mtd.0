Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B05CFD316
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3xM55kYN/CF53Wa+q8LY8/ZPAtNIFwwxjRGMX0lZ+g=; b=2LQ2rbzbcdnF4k
	2dYWoGfUoLUJ13vjAvjXCCzY5gtcoVGLvwyydfT5OhOTLb4WPGVwcxDj/2dKjLOjZQft+DHZa7SUu
	1kCANC89/2xI234Nr30XgsHBR8psJcVzJhQUqF2Z8Xl8BLOYJsOVApUdNejv3V1uIuPTOb0lfIQU6
	qXGy3WO6e07JnDEQ1PzBPYagGwlG9yrvj1LGPSlG/bOeWAfUU13v8jwrIWRFE5sxugaEVC9Rw2C+Z
	4mnPRgNBWEifETOin7a2XImGe23gHy2aqVoPuK4NhnLZwzZoSmpolMKWu8pj4t3D3t4YI4uhbSKDV
	bmYyOnt/PS2vsYt8WvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqs-0000000FokS-0xHf;
	Fri, 11 Oct 2024 09:22:26 +0000
Received: from mail-db8eur05on20616.outbound.protection.outlook.com ([2a01:111:f403:2614::616] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqn-0000000FoiW-2LOa
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 09:22:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvekQJcROPOziSA15Zv0n3KoOXNjnlW/ezYN3Z8Q0zlX/ADW84u8kRDAOSaIoMLtPogRYBT4/hxfRV6Mp8Z0mxHy6DJsel46DrsUvPId/4wU47z9njPRyjZsyMQvwmsm6C2H4YsmXMuzyv19oR0aINO54PylUJpBFAal9UXxQkZh3LcGVZbsXm/nEu7E2EArIEtt/7mUuF/G57qGhWAYs7Sk7BVtzT0Iew01BAFFxuDymZd0RcclV4D0sV1tD8eY86ROnaEibnyy3xQbWS9iB5+CsU+IdAkl1aVQQCQc+dW1IipjlywkhknsRLZtPN8WF5R6xoQIuFVYpxJPVMhS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUHgla+ztUbl77JLWNr25uwBTapW4EdVbmPFHW3o0Tc=;
 b=KOOqlfqXmo8dEAL93c7w/pab3ITwh0n6HSZeHRxWy24d916ezeWHuAHiNU4dHhu+6ai6Bj3XPUMxpmeoPnMGgoOQq5qfvy1uH15MBzbgz9xDKowb6lIhQHVduTRjqqACIlBTPdR11n29D5Nvsf2v192XknKQwERrimGu5MgMwutbwhb6jmlC7S+4nliCLfzCKJUPhsPiKsqiPEi+86TgiOgjqGAaPi2CZx45gjtOf7Ry7WOMFxIMUXUReagST/Fz9yY+E11/dHssXc8UYYgByPVePWsWh/dZXuq2tkfQulCIe4yDCTb+rhn6sMnyZxKsD7UTs4mgOYT0JbjVtmG9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUHgla+ztUbl77JLWNr25uwBTapW4EdVbmPFHW3o0Tc=;
 b=csas7DgcmXpManTcA5dwHt8cuRkGTKSEvZB9lJOjN2SA188S+SHSVQFplQKfDHrh6/UFaxPg7LSgu4Ui/pG8NnixYGRtPKRwoSMyC+jnFDtZwxE2lQzkj3FOGBlHc35RQAeVcJFLRsNCLBLZBgBoEk3xXC8ubD85dsgVOLXzDUQ=
Received: from DB8P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::33)
 by AM7PR02MB6324.eurprd02.prod.outlook.com (2603:10a6:20b:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 09:22:17 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::e9) by DB8P191CA0023.outlook.office365.com
 (2603:10a6:10:130::33) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 09:22:16 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 11:22:14 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 04/10] ubi: Expose mean erase counter for data in sysfs
Date: Fri, 11 Oct 2024 11:21:28 +0200
Message-ID: <20241011092134.2909496-4-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011092134.2909496-1-rickard.andersson@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922F:EE_|AM7PR02MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: acbd2f68-2ac7-43d4-684c-08dce9d6331a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?10TNwWEF0EuWXaRl9zAE1N/H38UsPLqWb3u5Tut7LHnq2yGscu6ZlDQKfVBs?=
 =?us-ascii?Q?BM43f/kqyS3p0kPz5cQlxL/K4Anyd9DiInoyfJZqnH3zbieKpgBBWKo82Pf/?=
 =?us-ascii?Q?11n3SfbXXXHG0QFy4l33wotAnFZvuG0DQhwZO6CXVZTVm+wm+jUOBjgAtfu3?=
 =?us-ascii?Q?q84KQO2SZPLvRR+DMHxfutZJvNMpPbjf/OLWvbGygcKmRe45sBldiJiDrwi+?=
 =?us-ascii?Q?yb8bNFheqq0yFyee0dXH3yY3SWjPFbZYD2uhvt4qz82uR6NczQeFK7g/ZIz3?=
 =?us-ascii?Q?pbGcHS6+JTmo1w+nsaJKJADcFybui3DLDBIaseaaPSFkSBzMCRlUih3wm8kt?=
 =?us-ascii?Q?nU5wrFfd2zuyXT0QoSjyk1qjsydKUMxD4Oqce90VvHYHRmNgmIB3tjZbGqL9?=
 =?us-ascii?Q?0SFM18PU06GULfmG+aIDW+6eI+nw0kNn6lXNjzT0iU0nKB/4GrfdmnZGSO1U?=
 =?us-ascii?Q?Q64Rmc9BkZJh7oB1ZTZSRurTAtHiTYWFnsXVZ1QehI878EVzYoK4LBtOWlpa?=
 =?us-ascii?Q?9lmwusarCLqBI0A6/jzH/n1c2oFaN4oqyitQw5K8syjSGttp0x33DCsE6HWw?=
 =?us-ascii?Q?0rVk42zXnKtyWboj0ODgWz4mabMX/nOesZpeB2XKGlUKONvPFmC5n6P4C8Q0?=
 =?us-ascii?Q?I+op1Ed1NXl51U7IVLx/GHpLkwCy3EHY6YV57Z0Yr4BlRzPL82ATPDhbiVhR?=
 =?us-ascii?Q?/UMejGDBqQd/6ZvvlRz5ZORRi+7yhIqS9/VG9RylhdzYyTgc0Ik9P3mw12D0?=
 =?us-ascii?Q?EqT89vkHyrsW9OPqae4zkRUXszxTJed7HcxssrJvci3H4v2MSgp7u3r9hSgR?=
 =?us-ascii?Q?8KDZZo0ZF+TvbzRyYPd6EBVzYIEFNE3dtcnN0e6VmAIKqRSpfOvIZaYn5dEA?=
 =?us-ascii?Q?2TWlKc1qiAeSSeMGJjsYgef4A4Dnp5PDVhcKv5O1ID9ZS1zp2v4J/TU2fq8c?=
 =?us-ascii?Q?uY4W7tSvYqTB8V/I1RD9pgAY39TjWannJMTOeN3unjWw7ZXTKw/OF3OzaSg0?=
 =?us-ascii?Q?/Ry+ehoOvhgNZsXxi9xOEi1D3/aJEcYqk7LPaq4yFIwQvAuCUVno7N49RfMe?=
 =?us-ascii?Q?XnnPtR7ObzW1+kfsNYd+ngf0MdNMX7TW62Xq0nk/Z/heqizXE/5R1LzyiG1q?=
 =?us-ascii?Q?Ygf0IbWGM/cUZPO5X5FOd2iTQL0GgJFUs25Uta7wDLh2kNk9jyGxmW7uegZ+?=
 =?us-ascii?Q?wkfKSi07F3h6v3WI/vYxBEn9bp3HUxTnxZHTX5Zthwm/2it+BtGTLe+3ArBP?=
 =?us-ascii?Q?WmZhyob4srcowPXHOyQ/2MQwqsce7yxMQssU06aMbhvdCCaCgy0n2p85+YmA?=
 =?us-ascii?Q?O5p/2mHrxhs315wNrKCrPlCmA0bZVny8Rzz4cAGLKKhNl7MQe7GQtVIMhIKV?=
 =?us-ascii?Q?CmS71ywtcvM9jkP2Ga5hug8L6fKh?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 09:22:16.8784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acbd2f68-2ac7-43d4-684c-08dce9d6331a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_022221_623239_5295A2A5 
X-CRM114-Status: GOOD (  10.16  )
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

Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 drivers/mtd/ubi/build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index f5a3a3f7d490..b253dcf849c7 100644
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
@@ -463,6 +465,8 @@ static ssize_t dev_attribute_show(struct device *dev,
 		ret = sprintf(buf, "%d\n", ubi_calc_max_ec(ubi, 0, UBI_FM_MAX_START));
 	else if (attr == &dev_mean_ec_fastmap)
 		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, 0, UBI_FM_MAX_START));
+	else if (attr == &dev_mean_ec_data)
+		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, UBI_FM_MAX_START, ubi->peb_count));
 #endif
 	else if (attr == &dev_reserved_for_bad)
 		ret = sprintf(buf, "%d\n", ubi->beb_rsvd_pebs);
@@ -494,6 +498,7 @@ static struct attribute *ubi_dev_attrs[] = {
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
