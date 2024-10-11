Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B8BD0D789
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikxZ89fkanjJc6U1Cfrtrse98/5MGydQveRSYJe1s9E=; b=Qeq8bPrzwlE46k
	6JnGHlyZsKQR8eyyPLx83mRMKTdTvdmwS69gwVutoiBxSWAjryyP96FNBQ42JxhPNYzThQz+vV8nu
	ZAmEqUUMXU7iQaLGndjyIusLnzjpP/12tAMj8kpCAEhOEbaEKTmT/CZNVYEPVyWjxF9415Hj6RlPK
	Bl53TzckRyDIpXfHmezOwuOOP2mJgv1Z/UiAWPzA0sbf/X13c5TsbLJtla9uPx1wQKL/ha8h+Byy9
	yOfw10kUN8jftBKm1dtiTUZjOYG6NaktuF87OTXdtSTzJaWMXyAT5OOUyN3WekDHz7ito8T841FVZ
	ambSh/Y5RpJRn8stJpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFGj-0000000GNMk-1OQ2;
	Fri, 11 Oct 2024 13:01:21 +0000
Received: from mail-am7eur03on20608.outbound.protection.outlook.com ([2a01:111:f403:260e::608] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFFN-0000000GNDr-1w25
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:59:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnG1NRZij5Rf8Ya55rM+yCwlTEmQ83UF/958kJ2DLj27wLWzvnNbXRocHiaruBNfDFhjE97xG/ob+g73nFxRkgYz5DGjy2WHkjUuouK2Mmoj4BOWC6SCkWE2D7vbOV40n2GAm/hVymCKeZrg4kjZyeBE65rPAKlM+60S3kq2wisXqHExcKQyA2dyesLg3XMwmsB+H/LLZZLkO59zBDLvwDmIFFSOIEPE1sEUY1O0NEKM9mqDRHguBnTdJ6RIfVdt6GvB77GyZ1q4pdN8fSEMuDdwtz9zG77O1szfGyA74EWKUzkgtlj9mZ8PAOEAQR3u7gr8Gc49fAirPyxb4Ojsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQeXsWB7gUI6TMbl6UVNFCkyNjySorZGYESRlnIw+bM=;
 b=CRl2Pw8l3StcncY1PTZyCNrghFjwIJW2Lb32ZL4XqUpF6DU7QYGJnXoZHAq/dMfix+k/idOrzxrlbJbegdo/03HljA66EwXwfnMNbFxqTksEkqTP+ucjF+T8cDYoveT9CSSEMiBnGTwoDhs130UWlyAwn4QzhVGMGiz037qf+q6CjzBVtfRcp7gqX49XWxqmI1CnGXUm22/V0QbrBzhP+ebd0HN9JSZVcb++IVxnzh5aPYzys/6b7GmLjfzuxIaeVVgFhm/6a5zbcuhx6kRghDuJygYavMmrmPEyMEUeQNDfeCwjVs7vxzGsArzDsn2HADyzczgYvllhIRhtxPSjTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQeXsWB7gUI6TMbl6UVNFCkyNjySorZGYESRlnIw+bM=;
 b=eVyhadZiLtUTOUpbLUu+BDlXt6qQgSy7J8muaAoFtBK21y6aWAYD0Yi65x8MxAIrCuuQhG1pt3s1mdFdx+/+gAe1xr7Q609IWL+woq4IlaGAnYeoTpE7G63TV7gn/P8RT9aJjUoIsDgHtfZNiUBxoYdDISGatxkssIrTu2RH/8E=
Received: from DUZPR01CA0202.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::13) by AS8PR02MB6519.eurprd02.prod.outlook.com
 (2603:10a6:20b:23a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.19; Fri, 11 Oct
 2024 12:59:53 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::bd) by DUZPR01CA0202.outlook.office365.com
 (2603:10a6:10:4b6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 12:59:53 +0000
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
 2024 14:59:48 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 09/10] ubi: Add mean erase counter sysfs attribute for data area
Date: Fri, 11 Oct 2024 14:59:03 +0200
Message-ID: <20241011125904.2915983-9-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011125904.2915983-1-rickard.andersson@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|AS8PR02MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a5fec0-94c2-4ffd-08bf-08dce9f49951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vZD+mf45BIgdhMVOQcZzVSYDG/hUOzmt0tqmN9k6+b0tv8Yq+xe7VAy29cRv?=
 =?us-ascii?Q?/SANrmxwU7UMKivsUo8vGkG8EKTFugYMeviP+9WluiEW2mP856E1UZKk+GUw?=
 =?us-ascii?Q?EgXaLJFt5qpXQtn/OaNO7vJxMMB+qUj69HJtV13L3Z0jkrKhEkZjZZTpGfSB?=
 =?us-ascii?Q?NfqvgGuDhLVekgPKho2ZZPtJWfG0YesCwIiC9w9h/hxFkS4fKbaxiWcqKXFg?=
 =?us-ascii?Q?l7nFfayZ+Ka5TSoOR/rKACnzX5wOL3Zx5Cqi2jT471hojOvjn287kTH31jC6?=
 =?us-ascii?Q?pKuRjdVxxpjSI5i03+1oe/TRWWTXatFY3QaA2CPEm71us36A1JwAMJApPaJz?=
 =?us-ascii?Q?LbvJ/nERubB+q4F5FASEarbcMifNqYDXdXDV149ScuI4FP8NsXIVm4y8bknq?=
 =?us-ascii?Q?BQ6h8DaMhrqVEkAqiNKEdB7THNgSA+0RdLcc6fnNSwwerUvLAyF9d6QnTHc2?=
 =?us-ascii?Q?dZ4Gh80tzXSOTAokGeSdxYk73u9Q/yACZVYAQM7QwXzb/JgVKGeFiAQrLo4e?=
 =?us-ascii?Q?zjaqZDr9QJibBxy4DnrDduWNCq9U/3WgGeWNDgpGWdd5B+04k7OYzfBnXmpH?=
 =?us-ascii?Q?GzcGLew3wtTp2NtWUJI6SgUp92JxqSTwuI8x/2LUuqUa9XEVEy9CmMYR9ZR3?=
 =?us-ascii?Q?TrYEb43lOF8349vIJ2cCrgWg9gJ2VxUASk1yKGMd2YmkCvkD1sdy1gWrUWxN?=
 =?us-ascii?Q?70BuGUixJNP8aUahKLpfU4qCt0DbVSxED5NqeEDd97v0TbiIX6J3lERMIJg8?=
 =?us-ascii?Q?1oi0fMsm+/9x+cLwoAUZ1ZZ/Koq0t9GlNQwjQhtGkdDAPgwnZDskTWyroU6w?=
 =?us-ascii?Q?PLbWfu1jiinzhRi72Sz6EIVzyEMe4X8dy5kO+Z3hgJFysmuWGX8ZX5217ovR?=
 =?us-ascii?Q?f5DZCzdGfDNMX4dRS+vdSjMpkMgZmWY3AcA8Ivv4bQZ6Oq1zUNFYh4JiRLZ/?=
 =?us-ascii?Q?cO1yIuTTFtPCu6zTWtA0M/iYCA57P2hpH3NM1xtHbrWBngrA3Rqdpb0z9r5o?=
 =?us-ascii?Q?CHUmDeqbwHx4K/WO3hmUzRZxjXXumcAR+xe6GiMLRkWNG1v/ugTU1CPqqn0m?=
 =?us-ascii?Q?lAT1GGhlSHrAdBKpHiKlXud4BdlQc2ekj+1izeEyXCfJwd7KvEHUyk8FYuRj?=
 =?us-ascii?Q?tGrVPy5lrWAEmvICh+beAiQNBO9DSP12xs3rvNmyV9F3b+UwdVS3RzIr6OQ+?=
 =?us-ascii?Q?tolAu5LQc47gjMsuNbMDmtlL2cu4GY01EoEsL3mbl8SLlNqc72/pHu2XbwEW?=
 =?us-ascii?Q?3VlFoGGYHW4CzS5c1NPJXLO9ykY6AFW7rjqMAW/Ue3GV809pSSgH/ao6TiyY?=
 =?us-ascii?Q?A4KNTpyZ49+fWsbUFVriU9mbD3dACvtFamFfZDr9Pe9UkLPVoENusaNE3Szx?=
 =?us-ascii?Q?J7YkiUg=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:59:53.2659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a5fec0-94c2-4ffd-08bf-08dce9f49951
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_055957_532677_BAD38FC7 
X-CRM114-Status: UNSURE (   7.38  )
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
index 62c93fda0bc4..100e1c0698a3 100644
--- a/Documentation/ABI/stable/sysfs-class-ubi
+++ b/Documentation/ABI/stable/sysfs-class-ubi
@@ -242,3 +242,11 @@ Contact:	linux-mtd@lists.infradead.org
 Description:
 		Mean physical eraseblock erase counter value for the fastmap
 		area.
+
+What:		/sys/class/ubi/ubiX/mean_ec_data
+Date:		October 2024
+KernelVersion:	6.X
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Mean physical eraseblock erase counter value for data area.
+		Data area includes all blocks except for the fastmap area.
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
