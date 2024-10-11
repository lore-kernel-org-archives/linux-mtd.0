Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E97CFD31E
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 09:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6tNnKovMTtEJHx1JueghRIKx3M7lcO+ZHUiPKYjqas=; b=4cGtnAznq2n1jx
	YHtlwEuNCqulOVGHZVg7EYAVbMfJRUjSqJpaqvYLnE6FkwZO25VBOZ9i1p7pUYrZK7CiANB8wPipx
	EX88JZSnletU8dk4DFptMSd9AnfZwKQuuHn0N7h51dC8p5UkCv0K5w+RuvCT1jOeRz8n0YP3qQZxZ
	pHUoDKTMJIUkNBGYf+kwFmOOAdjXdDULSEMlX1kanG+Cj01Q1/wwJjw9UdSnivpQr87vyozlup2lK
	xtrvDbb0Z5L50MBgsmN35IMz5QNU8J4ZiuprbL+OQZ/VqqSEJ0Yn1K/hRooz7NA087eZEfdvqIZLR
	Lq6j154f9sK4A74B0GsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqy-0000000FonG-28l2;
	Fri, 11 Oct 2024 09:22:32 +0000
Received: from mail-am6eur05on20623.outbound.protection.outlook.com ([2a01:111:f403:2612::623] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqv-0000000FolB-36Uv
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 09:22:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRF0ZfRkjOw66R0NUFmifCFWCFLWJZxWLDoky+pJ+cKQ0VqpZjNqAIl6/v3Wc4lFCuN0fzgdb6+Geq4UJfqvUh85k6tnsjldKyUE9CWpey9sjTDX+SR2MSMcdrV1FbQb+0M64sXmJjrPbMpnozu0L9BxYJkjNEvDEWvmR29nzUq7Ol8C4yoOU6d3FsMUMG8xdKj1CVwlF+JBtQ7aOwQGsnXXE6qrQqvDIpj5SdWs393t1qPRyhs2bgtnD3jBTpJW4DSNbLmWLWyoemEq1tZDJb+fK1PtM2JS6VU8GTKEaplsl+3IciNOQD2ywadiiWWthTzLnhOvalljqd/7MuOD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14f1hNynZCZq2C/409ajLEdoNbZpQ2gHlLGASjftJQs=;
 b=LH1lYij0j11dpILHYE93UfPmjGd++P3xuOQwhQ0E4d9ppRTkxrk/Shqhx00msiTRST5rP3dvXVG+2fgsHOw/42C8enKMlP9XeREGrPHixRYt4T3CzFl1MLUi/wenN9NipA6CAST7Re78ndCxXzok8n3z3RUcVleZrOf3tKJC5v1m/TxQDCof64w9ILMzSdyx/Xf5jJ7nVYvFcxx/rshlyiJP5yiE39rHfGTWR2QnSQpgeSn7EYiDTRv9q7bKwn+rzZQJS/ns1Uy+OBN25G11VigYLr/cioIYzORMMwapRBjN/eOzaP4UU2S8kbYDAWHKGAP6FoLw/JCKM6ScoIv1Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14f1hNynZCZq2C/409ajLEdoNbZpQ2gHlLGASjftJQs=;
 b=EnWja6eObTCVzZQRO+ohdQhPfjN+I7SLmManpxEB9w4ev5n0BatW1IzYW4W97Vg4G0V/awhUhAkCdJ9r2qyh1XYai6P5fzVDZhGAHe9lPCvcXV0MxFmYTJ+HLgq9G9/xoXgxXzqhqRRuClRo4nTHvMx2Zlo9sHkmiUTBTlF0Bcw=
Received: from DU7P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::25)
 by AS8PR02MB6552.eurprd02.prod.outlook.com (2603:10a6:20b:25e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Fri, 11 Oct
 2024 09:22:25 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::f4) by DU7P191CA0017.outlook.office365.com
 (2603:10a6:10:54e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Fri, 11 Oct 2024 09:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 09:22:24 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 11:22:20 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 08/10] ubi: Add max erase counter sysfs attribute for fastmap area
Date: Fri, 11 Oct 2024 11:21:32 +0200
Message-ID: <20241011092134.2909496-8-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011092134.2909496-1-rickard.andersson@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922D:EE_|AS8PR02MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7039b1-5eef-4357-20b9-08dce9d637da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cTK8wZ8B6Px8fsa9R2OmJnh52qDTk0P5XIvNw+C2BbRRDnosWxR7C9H0i5Uk?=
 =?us-ascii?Q?+4hmTmVgA/ZU2pPzm8pfpNTvsSc6W+MLGaC1Ht2fUpj7z4teDWfXtKyIaS06?=
 =?us-ascii?Q?1S4lN9AudMWmWnTwHqFXO32DnxZnGh4C/BUkilCdHNnuYfpSwtw1try0qERw?=
 =?us-ascii?Q?L8B7mrWKhPgojHnwcjb48TWdLjDY9r7YgXJkYTSz0Bc8urnrNYM/cbhu3JHy?=
 =?us-ascii?Q?FZCxo9OLrAHQRPP5MyNYzRJ7YmsBT0Z4qM2HFk/wKR3aMSfH6Hvs55OCnQFP?=
 =?us-ascii?Q?pB3OrJVtvZQtok6Ip8uJ5wxvhTmw3SjaavEd+sZRpvICd7TPKAjqPVwF0mtR?=
 =?us-ascii?Q?IHrpG2KhHWLTGohiihl7I+MK3R9g1vRCZxLYkPYSYOwNFBwiJhXs7fRgCu75?=
 =?us-ascii?Q?pNyikpP+CURoxsDQUGjtcGUoWi62YLDEUcdQwWElsqPpwZesexqDxh/miXGy?=
 =?us-ascii?Q?G44xO5UrTh47/vPi+Lgh2FsecyP77pugPj4/ML7R6cgD05rawoW5SZ8sTFOB?=
 =?us-ascii?Q?moU29khswKO5bjFlm/RvHyzXH8R+0nY0lSLKqOXWGqsLhYZdTUdMAxo7a2yV?=
 =?us-ascii?Q?ztExwElMfo4jtr95irrsGmoqr5EZLH0VW7yVqyX7rgV0Jg7OD/KmVjC1tBig?=
 =?us-ascii?Q?xMkV4gXzmBOP9NE0G2m64rUlM9E0WVjfW+oBMAVYKIbp9r3A3FNn9jjSYzOZ?=
 =?us-ascii?Q?ekUuBon7qpFjlQlubhSJAe3OrFtMqVUNzXv1m+jYrd2XMCRVKIDnLfgmHO7o?=
 =?us-ascii?Q?iZbEBmN9MCdK3FNUz76BiApnKwK281tjHuV4QSuVDV2QDC46DjW3R8+dTSUD?=
 =?us-ascii?Q?6PiDud6w1PL/ftMGP3LBaDJJArqORg4UhVOL+EI73+/g+VmubSHX+3mPF2c9?=
 =?us-ascii?Q?UJMSGds29um9D8YM5W4wfZ3XTOetfPlmvxsc00kXKkV9WBiQuzpujjP6vopl?=
 =?us-ascii?Q?YcUgN7PIsSY18YZEE9boj41rBciU0NPTkiib3IO+z48i36CdEy0LwyEDKjRi?=
 =?us-ascii?Q?6ogPMnsDbfdbVj3I1ss3G9fUkzx8jM9XE9wZGtlV0bNfL73r78Ph9lNLQ17H?=
 =?us-ascii?Q?irOJ8KhDF/HGsetus8lTK+kjxw1hypBJUzBPjik0/oNaNS0gAVYLe5kYgyhs?=
 =?us-ascii?Q?jUV5OBZspO/e3j7FJmzeJ99yrgwUiqfIxOvtexT0Wjhl8LfwrqGV1cGAXQaN?=
 =?us-ascii?Q?wWf0YqmlCs5nevhdQ6XPmwKans0Tm2r6E5lPiKl+8MhVuVDfHqbHDJgL9lIO?=
 =?us-ascii?Q?9hhSh2bhWt33pd52AvwgXmaqeNzxX7K9NvD6wU2VjFRgHAQ5SEFSIAyFHS8J?=
 =?us-ascii?Q?KMU5iexgcmm35Z7gGAG+AwgmMmOgqlWKcT7mqGz2TFLwVkI/VUNxs/14rDOK?=
 =?us-ascii?Q?9mm97MPkvXtqxRNza4BhpW/gqwdx?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 09:22:24.8458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7039b1-5eef-4357-20b9-08dce9d637da
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_022229_838227_6A33277A 
X-CRM114-Status: UNSURE (   8.64  )
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

A max erase counter specifically for the fastmap area gives a better
understanding of the flash wear.

Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 Documentation/ABI/stable/sysfs-class-ubi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-class-ubi b/Documentation/ABI/stable/sysfs-class-ubi
index 05a701b03a9a..62c93fda0bc4 100644
--- a/Documentation/ABI/stable/sysfs-class-ubi
+++ b/Documentation/ABI/stable/sysfs-class-ubi
@@ -78,6 +78,14 @@ Contact:	Artem Bityutskiy <dedekind@infradead.org>
 Description:
 		Maximum physical eraseblock erase counter value.
 
+What:		/sys/class/ubi/ubiX/max_ec_fastmap
+Date:		October 2024
+KernelVersion:	6.X
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Maximum physical eraseblock erase counter value for a block
+		in the fastmap area.
+
 What:		/sys/class/ubi/ubiX/max_vol_count
 Date:		July 2006
 KernelVersion:	2.6.22
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
