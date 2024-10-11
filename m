Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C6ED0D785
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61CXSHXPpWtxhPkRMMXyQaYniwAaWGaUXN1YbKBNZzE=; b=0PTF8dXveeh2x1
	a30p80vLR8yRIQ8oKLppyjnQfGAo2vNW0X3w88uq8HZQHJm+npZzu/Bf1Y6apDip+/jaYRjIoT1uT
	QF6JvzIRmT80Gy7f1a6EQ7PT/Pjm643F0WAjJnqv78gybXfhSd2PwgrlfHOJAcLLHDaThxJtYqvI2
	TfeMqrVUIuvhdRPpNbebSaw/7JboSMZny+wGPXZSytfuP45cHNFe8v8gPMHwa8Y5slPX8YAKzptT0
	cohVatnH2nVlQmCx+VquWdAjpVyy7yGoxNcy0wOpdDamOzqwCFiJBxnxenni11ZxzOnQfUUNNYykJ
	xbMsuC1EM4ewTH28Abaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFGg-0000000GNLO-42kA;
	Fri, 11 Oct 2024 13:01:18 +0000
Received: from mail-am6eur05on20610.outbound.protection.outlook.com ([2a01:111:f403:2612::610] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFFE-0000000GN9q-0L5k
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:59:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X680eTSB7sjP7pM9ZtiGxiGs7Q75tegsFvhrVPsCiI1T6TgJoIvXy9KjLmfA4ZQ/5GDPXgphr3dl8xGVDnAI82TihkN/YrK17G8PHnXMCkd+AMmjHHcXmpeSHYVXBXeCUZxSwEiJMwF7KuCs9Iq9uN50xSG3gy9AtUooMgWslycT8fpiFn6/io2hseMpALTexDfxbOFFxx/QVxWToxzXZcvOBL30k9wXvPNLbJ1ldX3LTRDiGA5AMOQWOl7U37ktAHziynkYbMc5guOFoddCn0LxVk5UE3gD3Kr1iReT28pLSzjwOXK7HxyUAk4gbTc5BA3ncg9QK4QXRJ/6tMCXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frJxt+iDjdk5wKHYixWaRFrWgZsxxFKddoM0kALxXQI=;
 b=TqcvzIPwfhqqZ6vU8L8czNeKBV5IJiIZIOGsU7mOf+4xk1DIIM0pC54HzOqSnVuhubQtfNhplqmbEzBu88lUNAXiM8EjZyi6pu1NYFBHLhOMOKMksceJ+EEGU2ZUL8cWQ0TkVN69DYvAM18hueYWcOp2dbmxTyxt43qQpwX7Ftjh0q97c5XpN8xMEYX+mqkrWsNm7JJF6LX5VQ1zToB1SVFeceRwzwq0L8Z+lfBzv8wfC0gyVQzfmX+jKXKGKFhx7168GIFKO59hpdjorIt+hI07YoP9+OYRBPHySrCeOHo6IHPwzz28gPGET3Y59sC73ZWwpLtGBwhN3Y/FZZbaHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frJxt+iDjdk5wKHYixWaRFrWgZsxxFKddoM0kALxXQI=;
 b=ZbK2nmQuDGlPAhbgFcAJN3v5LVqd6c4zi4MB35a5zWwzqWpuYwVYuJc+yIow9e0c6IRUatbUTeZRIwx9QtNNEPFyf6v6gCYegxnKxP5/UAPXF9aJifV8vuQCx4urN7uFBKH1wYymiiQu/RSsJQgSjwGBu1i1vJ9M+Ewbiv+AJig=
Received: from DB7PR05CA0010.eurprd05.prod.outlook.com (2603:10a6:10:36::23)
 by AS8PR02MB7788.eurprd02.prod.outlook.com (2603:10a6:20b:443::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 12:59:44 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::99) by DB7PR05CA0010.outlook.office365.com
 (2603:10a6:10:36::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Fri, 11 Oct 2024 12:59:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 12:59:44 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 14:59:42 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 05/10] ubi: Expose max erase counter for data in sysfs
Date: Fri, 11 Oct 2024 14:58:59 +0200
Message-ID: <20241011125904.2915983-5-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011125904.2915983-1-rickard.andersson@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|AS8PR02MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 566f3955-0d38-44f3-0ccd-08dce9f493f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/qB7xIoy5iG/5fjWZZXmAXPaq4wBw7QPOT4ffhQyOuRHbljB5gbZ2YzRUGJ9?=
 =?us-ascii?Q?zzhwEqyPiYpD+3aXT0yHZvhlcHx99cJSy13JDQuqxKNl2we7mUldPAIuKYSE?=
 =?us-ascii?Q?EE04RGqFwoo9loD0hCiNtaU/oWkoaqC/+2avMInNBT/DSVaFk2NjH8fc2m4z?=
 =?us-ascii?Q?BPl5X2YJU5u8F4AqBdnpUKS2JHS0czTEdpXVN6NTeJWHN/WxDAXyq4R0Z2IB?=
 =?us-ascii?Q?Q0nHBk/LnEkQJKuKV0bdq8DjHyODUy6kSrCzzjNjSCN4tJxe6yV/UbM/eIa9?=
 =?us-ascii?Q?4v3EUZ68JJ1cesL355u9li76eIQSZ5TFlP3maOK+iS1wnOV0M93Bnu2LjrdR?=
 =?us-ascii?Q?l2nYrCZ3otYZFKae8D86mlbo8kGkf0SKRRrlTAFJ8chyQJIoHS7pYhC98yGm?=
 =?us-ascii?Q?qBZ5JjyxGolBh7tEQB4CMnGRabL6sItV3KuV3zCQJXM3IJSHezS9kXZKUY8x?=
 =?us-ascii?Q?6+NKBj5sznZPajQilSxQ11tztqA1CrnuqEzR9PMO8eisX7c1NNvnP6BbGLhT?=
 =?us-ascii?Q?mRRGigpajuf/UrJ4XjYC+YcYjonkPJGnrYYuNolF/hgk9U412Yk86qCcJGwP?=
 =?us-ascii?Q?S/X5SfVfdIvZT/cxqdnE6MfQcXmiswbvDQyY+/FsR7Lf4TyWpNbmZor6opwi?=
 =?us-ascii?Q?XBLC3DRPoNShSXfrMKbn3JWS+lQvkxupNUX0KtvvAR1tiLeCwPARmkuKdtbR?=
 =?us-ascii?Q?l+loIrdZkIWcgENANfUf8665bAC6CsKDU6mGt78Qd6bwYY8AdgT7haaWMHHv?=
 =?us-ascii?Q?rNt20rj18pGK0ssuQ2ELljK1QWMEqpsUmJX6+1F/HodvuEIjdtuW6pQLXuDh?=
 =?us-ascii?Q?Dzs4p0zAglQqmO2Ik6ZidbVpB/rcc/l3iSqoKcrSv35CxEPOt2WsZIH/NOxa?=
 =?us-ascii?Q?zAs2MmVffKEkRoL+6a+QSzonRMfGJz3rPFJ1orT8cSeg664FEw//4bNsLpwU?=
 =?us-ascii?Q?YPL2UvCC9a4fPrjVd6vydWpj3YJIQi1Pin5K+1hFEiEIhXsTWSMHYe+GzkU0?=
 =?us-ascii?Q?D1/RdoxdcsUJGm9zLQjwVPoRhgHRt7BQ77TqpI3y237jxlagQS83OaXqLdSx?=
 =?us-ascii?Q?2nQewNj38vyb3K+e1t8M3uCk7n8Q0xLCLwL5hZWkv+WYHTPM9YdSFOY8pA7c?=
 =?us-ascii?Q?Yj/SdeOlkmzC1VP75s7zXsFUkMhELG3bClsbn4A7C9wGWXXNBjl1ECW81xQQ?=
 =?us-ascii?Q?5rqpdPZai/ZDEcIoC4JMiSa/cMrnkAr8sQp6T93lhnpv4sY52hYTkvHkCbul?=
 =?us-ascii?Q?/x1nwyp3JISVxFQ8UndjhydfQ63Pr/A0oZoN59LGg/hzVBSaIYsF0ZB+7BOA?=
 =?us-ascii?Q?gBZ+tq+PMKiNvxZIr+Z726U+0ajifl8gNB4ucYUeGg/RDH+40e25mLNsU0gN?=
 =?us-ascii?Q?WgojTVQ12VOZGic9Q9ShlwR9/WZb?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:59:44.2261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 566f3955-0d38-44f3-0ccd-08dce9f493f0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7788
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_055948_161748_C3E92EA8 
X-CRM114-Status: UNSURE (   9.77  )
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

Expose max erase counter for data area in sysfs. Data area includes
all blocks except for the fastmap area.

This value can be used in order to estimate life expectancy of the
flash.

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 drivers/mtd/ubi/build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 9cc7bc74f0d2..fa1ff0146572 100644
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
@@ -462,6 +464,8 @@ static ssize_t dev_attribute_show(struct device *dev,
 		ret = sprintf(buf, "%d\n", ubi_calc_max_ec(ubi, 0, UBI_FM_MAX_START));
 	else if (attr == &dev_mean_ec_fastmap)
 		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, 0, UBI_FM_MAX_START));
+	else if (attr == &dev_max_ec_data)
+		ret = sprintf(buf, "%d\n", ubi_calc_max_ec(ubi, UBI_FM_MAX_START, ubi->peb_count));
 	else if (attr == &dev_mean_ec_data)
 		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, UBI_FM_MAX_START, ubi->peb_count));
 #endif
@@ -495,6 +499,7 @@ static struct attribute *ubi_dev_attrs[] = {
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
