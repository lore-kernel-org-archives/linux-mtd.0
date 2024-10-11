Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F64FD0D788
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4m+VgfBkY6y0lLM8iUcjOUVqr51UXXMvprAxYuLc0k=; b=sL0kEDKaWc/0iY
	6cxwjq8EGzd6/6KIQzHTkw7aUVXzvj+p6X8l8hQJeLUeMVgepZ4B4kjJuwNOYyfsZuwRiW+K9amRd
	5+rbiDeU7Y6nLeC0EpGP0bkzAC6suSmoSiplprzfcewkBJsmdG3Rh+duAuWrU4uEkEtQHw6t0Q2Ah
	noBr9Gv1PYjnvgPp++28pIAuWmfcH1dFVbGtnQlph/e3a4ABv/ljzu9Lxtkjig4e0g0VOFYUECIaF
	bB+AnsF3qZmDFZFLk80FCKbdOtuCOH+9QezynuW5x/eY93IoBYjW2Oiq6SABUQw3g7Q5zJKjQ+Zo3
	mnEBI6Zv7KMsGg95GHBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFGi-0000000GNMD-2sJp;
	Fri, 11 Oct 2024 13:01:20 +0000
Received: from mail-db8eur05on20620.outbound.protection.outlook.com ([2a01:111:f403:2614::620] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFFN-0000000GNDp-0ocW
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:59:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHlooC1ObGDuz6hM/Zg9PORo9DwU4yCVjIFsBw2RvWB4gsnNpV+5TbJ3DP6w9KASGjLtnGwhH3nnMq1Yf5Aw5ZqAfYCubmZnh7Gy562t5r0KlKRxVJ8iq5n7pUBJ+SW00BEu5V2fuYHoxIzeR9h76hvkR2iZy1ucnzJYR+CWPLy8tYUNN7CjamKQDnlpJ3g8KqDK9JtEjtyhinTfszJQZPeyyrSGAdhLBSne1grV7+l5PtGvBab2WOPxpVHd4o5rbpLtzg72iocGf6xjUZV2WjL4m7B1XmVf9jaq8sUkQbHR5rREtAX/xaa77mvZ8k7ZaQ3iNAAAPVEZTpLKMseCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCDcFwAdutXzM+NXhjbRNdjkADcAs2k4lkYmi+44KM4=;
 b=zA2gik/uoY8IiQPTqx5DuM3dUEs2D2YiPsMA26pznxmh8zaJFLn122D9i1F9YRB/UZgGgHg4ihcYaiteYC9c2/+OGNau4u1Zrh7sVNbb8598Cw74WMSYZiYLGHDoboKIw5ufhu8mqSnlctOM69JINSp5fskETFLGWuHlIkk3UX3ylz142M3ahoL2dcKiqDTIPhS50moqWUOA0h8XtZs+U+cJIQyuh1gHzlD6o9dxG0lQIUVOHID08x+CpxVn0hvzih+kpO9++bH/zfi2urO7I5InRjI3H+vQaLE7NcuAUOhqcdYl61frUOgmXHiUJpwdCcxHMjMSYAXm7oWeoUaZ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCDcFwAdutXzM+NXhjbRNdjkADcAs2k4lkYmi+44KM4=;
 b=LUINks7EDNkR0/YR3Ko9VA+/EownMu28LhkUUI7Xu90OhtBK4Ulud9mqsyhpX9fyhRTrZFIuXIkiyS8VNhBohXq0+W/FYPt2hGFTlbxAkeRjnurXfuNgTdpRfQ9Si2XszudVUDWyUMgi5ImQOWW3MkZ4f+ohz25fGX+NERqzLdQ=
Received: from DUZPR01CA0208.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::6) by PA4PR02MB6895.eurprd02.prod.outlook.com
 (2603:10a6:102:d4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 12:59:54 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::59) by DUZPR01CA0208.outlook.office365.com
 (2603:10a6:10:4b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 12:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 12:59:53 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 14:59:49 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 10/10] ubi: Add max erase counter sysfs attribute for data area
Date: Fri, 11 Oct 2024 14:59:04 +0200
Message-ID: <20241011125904.2915983-10-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011125904.2915983-1-rickard.andersson@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|PA4PR02MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ba0dba-acf0-4488-52f3-08dce9f499bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3uE7FBb/RuAJMIm+h4Z2x8X4JcdC3VI1vbCDiP2Lx3HtGVAEzwupNqUA2fuk?=
 =?us-ascii?Q?BwG6bWFmN0QKEgJ5HQ2dDzspMmUGv2Tevy2BhBRFMh40uxNhn4jYthyqQcIh?=
 =?us-ascii?Q?x9bEn1GI/H6MqyQB/5pBB4B83kt3+0BHavXlLsV0WFSPpFP9eBtKa0QjnM0+?=
 =?us-ascii?Q?sRPsNytiWR0gC9hnQ0jbR/w7OnrYU8pBD3DruAT3nMEBscm9WARJCAixsNm1?=
 =?us-ascii?Q?BN23h0LVdXapVIfZgNO9JjRp4lIe/04hRBsTBi7Yc1XweEcW1tpaPs0fEW/x?=
 =?us-ascii?Q?lsVmFFMCCq1qqisz3aMzqVXJgeZifu3L9LSrYJ2LGVLIY4L1asAS1MeEkQFw?=
 =?us-ascii?Q?ea7Pbo9obUxUAdOh7ic03gsVbmewKX1jRIxmCdZ+1UppwlpaPjO7TUre6O8V?=
 =?us-ascii?Q?zCBNi5hZbkN9/nAwfPrTSaNS3fCCiQRRZofmILsd2E7CWOyR9WOq4gK+4/oo?=
 =?us-ascii?Q?GDL5KoqT/ROYUKbghBwG44fE2ifSjbzj0tHhSlU6cuj2ZadxJqz6E0c9Ylku?=
 =?us-ascii?Q?8zqyB46ClyVK5v6tN+dbgjM6xYjs+K4mm5xE6NVnHAfED/uPEZP1Jg50YWk+?=
 =?us-ascii?Q?MANknyW+sEqGIDVIkP6z8cXIVcBOyp4qdkTuCIP3I8LKqFpd6weWBzzGACfs?=
 =?us-ascii?Q?AKtlTKCDwyV1Frsl5IPa235IMSf60+3DX4/TMjJfGS2L941EuvBaUY3NuQf9?=
 =?us-ascii?Q?HWC4rZD4EDJLZAfy6Wpt28R083/nyHJr/wHIx+p0ibruoF7iEe0LQ9SMxmXJ?=
 =?us-ascii?Q?Y98rigOmka00Wo6L1tC/gbDhAC6F+PN3j9/85mcNSIt1bj7FWjD2+ZMn9SBF?=
 =?us-ascii?Q?YbRs3zAtVN+nj8Sc0z3aOP1KtMkA+vFP4n58erFbW8xAtsMaZCriCgDXBRvR?=
 =?us-ascii?Q?hXhohvsqmWEEIkvThKu7Lz735JYqjhYdu+r4LaHMcu8hXu9hKfbW6SA22utz?=
 =?us-ascii?Q?IOyLXuEl2R7BPZTIjpJQHb3Bzsb/VmGpS/OsgC2ON9/rnaOpn9ZjWQN0Ji7d?=
 =?us-ascii?Q?vc4ZFwopJCEHYZypsR3e0gAygqzbFKRbFgpYbjBmC6nu4sDF5LsnBicVnEdA?=
 =?us-ascii?Q?AAjqQ3NnjBKgjhIqkuEGfqt4VT/FzuL6qWwF/FW46BGhvEhSHClWe2dY7xrU?=
 =?us-ascii?Q?6Tbhtc7YHzXys+1pqg5jevZ0ZEpFDW07NaDD8i69bqvmQ3AKjy9me0pwDbP6?=
 =?us-ascii?Q?/PGCNB48APkx+KgT6pCowZq1B5Re0aCwDQcdTw2QhM1eOB6ve0WuMocMvV/c?=
 =?us-ascii?Q?aNY5acySDQFk6GFLVPvzlp3kG+DwgCJ8KqIM9lTI53JIfLYb3E8uMWN46H6l?=
 =?us-ascii?Q?P6UXYlFVYWIJKcQzIrxIHVTsXxFBawbWmS5XYredxwaFt6chrOgQWzfLRs68?=
 =?us-ascii?Q?mTuyhSfpiV0Me4T5MfMs3wlWB0G8?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:59:53.9690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ba0dba-acf0-4488-52f3-08dce9f499bc
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6895
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_055957_263841_3490AF37 
X-CRM114-Status: UNSURE (   7.51  )
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

Data area includes all blocks except for the fastmap area.

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 Documentation/ABI/stable/sysfs-class-ubi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-class-ubi b/Documentation/ABI/stable/sysfs-class-ubi
index 100e1c0698a3..ff453557b0db 100644
--- a/Documentation/ABI/stable/sysfs-class-ubi
+++ b/Documentation/ABI/stable/sysfs-class-ubi
@@ -86,6 +86,14 @@ Description:
 		Maximum physical eraseblock erase counter value for a block
 		in the fastmap area.
 
+What:		/sys/class/ubi/ubiX/max_ec_data
+Date:		October 2024
+KernelVersion:	6.X
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Max physical eraseblock erase counter value for data area.
+		Data area includes all blocks except for the fastmap area.
+
 What:		/sys/class/ubi/ubiX/max_vol_count
 Date:		July 2006
 KernelVersion:	2.6.22
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
