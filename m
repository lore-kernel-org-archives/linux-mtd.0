Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374F1CFD30C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 09:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KjOkPY3/nwm6hB1tXTssEIET9P8PDeRrn0o/cMKu/c=; b=RNY34iw4k0uVc2
	jIDUJ5XtaxL6Y/0Lk7NLJV5AQaShVGJ6Kd9uiZwglwXR/soleNbNTQ3yVPtFwDDt5mmvhWrOR7YGD
	U12gxYf5Hr0NDdNxrC+nCcBQ7X8v2g4WEkXgl/4mMVrT/F+I1RNFiALuKkfs3860hsYo4veRofYt8
	nWjJZiPszhN4UArVwx7tyE0OuQIS4I+jXyb4iiZT2OlbV1EvRyd0R3AeBZd+wATItbyQv5QgNO/BC
	pfI5SN8oY0dfS0wvNj3PyzX7Loq4Coq5mRmLd4gKAITfAb7TlOcB4HTUXA6KCXTmSxHt74i3fdUC0
	kDka/27trf7RbsTh35bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBr1-0000000Foq2-22vb;
	Fri, 11 Oct 2024 09:22:35 +0000
Received: from mail-vi1eur05on20628.outbound.protection.outlook.com ([2a01:111:f403:2613::628] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqx-0000000Folf-2rJw
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 09:22:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSWnQc87AtUabSTpU17xeRLHXFnnhZpSsGYDfXOn0z0odEswkGq/jnTDfIZS1FzBBcBIGqEMlebV3Y0y6AZhGA59r5Y7Vm8kKRGHEjbTA1IC7lxQ2G+N2YQC9lV+/gSgsG1+egZfSFHe2IpRwjw3bDxkmTYZDYeNa8uH4KWk1WtLHuu6E43tunyOTaR1e8CEPzdWEKRblhbMDm9bc8uWb3BhOwqfqDCUUscvGHfeic7/llwzj7L7MeLavE6nWwvQGoxMs34ZyA2cQnwSxaIXEZunkp57X2Znm9JVvDOP7E+UBrip5v6HpnYt/B2CoMkncvde4+bLyovLsc3pxFVThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4ZdfNmYHM+7eXxC/0sncSeGUU+9IcWdKQlC/8NzktM=;
 b=OukB9BDhUNIBBY8gv8Y8NtIQGEoydxusZSrhMeeGimUw7CObbLCYvDMZuRdAqzWHJmQrtncrbbEjl1yFsYITZjQFe9GSVLQXTlC3CNW3YoRLezyeGnlVj094DrpZbxUkMB4CJwe75lJMxEtEdXEB7c+K8Lcpk2yJoOot49XKX5Je/Xu3u81wA6AswFLYDzvLZjd+GYpWOYDpGZLjHU9dGHvQ0wa9Gvd8cCLDPdpYRNuZgeumW5w0Vqq5KosHE9S/z2Qfa1/QLThPtLsLPmewJuUEp988Gz4ZXeIUbthlEjDBd8IpJ+SMdfIVd9zCGpk36DQFontZ6cP06nQG6VsXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4ZdfNmYHM+7eXxC/0sncSeGUU+9IcWdKQlC/8NzktM=;
 b=f7pGm2EXFmhTX92hVf3txzw3vfS4FYA8poEBQRmWf2X4YeoAHNCqwsxmPWbTwZNaduFeKZMFjFXiD4hv0K2NSb7s31pKtbx4DIqxSSKqxelVzxWJDaa/D170J543gKXUBGpz6obs7FDCFU4CQN2V6/IT9o5qRqHw5L8eIZId2sg=
Received: from DU7P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::34)
 by DB9PR02MB7179.eurprd02.prod.outlook.com (2603:10a6:10:242::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 09:22:25 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::3a) by DU7P191CA0006.outlook.office365.com
 (2603:10a6:10:54e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Fri, 11 Oct 2024 09:22:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 09:22:25 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 11:22:21 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 09/10] ubi: Add mean erase counter sysfs attribute for data area
Date: Fri, 11 Oct 2024 11:21:33 +0200
Message-ID: <20241011092134.2909496-9-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011092134.2909496-1-rickard.andersson@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922D:EE_|DB9PR02MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: a20cff1e-dd6e-44d3-b6f4-08dce9d63872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VcrKgLDGSjQQvqaMKyWGL3+ToPDQgcei0gGTFvIqtoaQ8BNgee0T0q6LzP0e?=
 =?us-ascii?Q?1FfSh8NcYLnpY8LfcGF6uFY2nHYpICEU4wuZJJIRnDZbLY6LB3YC6Sfv5CD3?=
 =?us-ascii?Q?DsgdG5q+B6pAYbPziOfQqy7bqdGINr5AV7AYpFx353hiCCBDw0IYVO3V3N8V?=
 =?us-ascii?Q?COcxVgObQabpY1RWD60HCNu8wtwHyjshxSfF/oA5tKCca1X+l2XTNWfvI9pl?=
 =?us-ascii?Q?LOZ5XVqI9WfK0OMrz4RnSbPbhujdYkN2REJNJyOX1cLsg5ENvZjxviATEEUH?=
 =?us-ascii?Q?eRDEH7sjebfv84Im3Eygn/j13YJDkjM35alQG3LGg4psjREfKI+jkmieej0B?=
 =?us-ascii?Q?Y4fMiClhCFdn3qR7l+pMApxgvvSSUknjnYxgFlJ9lCiTDqLHTgDCQBc7HMAD?=
 =?us-ascii?Q?TOChGv5uJMxOQho/9TI5emoUjo0ucLyDMoTCyK7lr6dDh9Qgd/tgbXstzi3h?=
 =?us-ascii?Q?dgJ0e7/kPwx6SCXJ90YAHcFLsL5lGDizRQz/v9QRA7TugOw5NkHTRw/iY99A?=
 =?us-ascii?Q?g77czG3g95+V6o/9gNy0xLPHrGlAGHl0pgFUIOT1YLT+KlGXnRA2wsmKZkqU?=
 =?us-ascii?Q?MN3gttc44u3mmt0A438+2u0TF+c/vHpYl0Bhv4dKk2ooL0G/ryf0CSsDo3ro?=
 =?us-ascii?Q?+4N4BT0V1w1uFvvedzfY1TflDhbloidKGHhozRE9H1yIb1W1aSOSWhOQMVAu?=
 =?us-ascii?Q?XtLzc/iSOW7n5i6af9OfFBkUadPTTXLGUHVxWyHGpqtjjo/J4DE3HKP4V9cY?=
 =?us-ascii?Q?nc6qt59pCi1ZgXvR39rOT1ucizVIAEreUqjbYXGtDH3AatQ9qIEQ957xdiZ1?=
 =?us-ascii?Q?KwFbapDrTy8UTM3NvCSoMVp6IY9y8s2ZPHkTi00V6k1Px0y7XnVtwUJMGTXl?=
 =?us-ascii?Q?tEbx5TM/6lGqC/QTAr3CrQVHVXOWPZTeQvAwLRcttdIGX1BzhYhNEuiZB1/w?=
 =?us-ascii?Q?zAwVACoKqZDO4TG9yus8nmkp30Q+rdYDs/LECfzga4rCxetDmyTwAKv0WTEH?=
 =?us-ascii?Q?VFMTOylkuWvPMHRXI3p9wz7LlyIhaiD62G++4A5Ae3u8wVXeMIrEq/cboYJB?=
 =?us-ascii?Q?XSwAykvLLfsKX8AU6Dfw92o5V+Yr+Suzg50W9Be9PYF6htk5A8RjKb6WdcGc?=
 =?us-ascii?Q?YMDh0z5apjXVZ1QXnNZZ93fqAvrXfdqOzHONmrR4bnDT6s8YIMwQfib5UlBW?=
 =?us-ascii?Q?PJ6PcRwtOWHQM5i2+x6+hCmIaxwZUNr3OSgoeHS2LXliZycD4aqNFCjzbRGX?=
 =?us-ascii?Q?y65Hl4VspkH5w00NRa99Gcsq1X8lYUWyaCHEPmTUAGKVzCXZhJ5tbf3ZGQGW?=
 =?us-ascii?Q?AufwSgQDnB60CTPH5ZW5RtC1iAi8GfN8w9cjMpW6Be+0iHk0F4LtC68+X/Gq?=
 =?us-ascii?Q?0ftSDv8=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 09:22:25.8458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a20cff1e-dd6e-44d3-b6f4-08dce9d63872
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_022231_756146_2B2A4B3D 
X-CRM114-Status: UNSURE (   7.37  )
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
