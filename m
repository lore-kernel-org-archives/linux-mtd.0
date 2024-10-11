Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FC9CFD31A
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTJyG9yMichXCmDkoumtEkt9wywNqW7J/OQ+Y7SeR20=; b=owl1q8vlBUeDje
	H1i6VHneJhAePx7enMnveZfHOY3tAF4QtnCE6+p++wMopidD6MBbJjsr1O1K0z057waUBTW3E1dK9
	Drx/ZUJ6NxPdjHgPneKrYvmnDn/xyOIpiyIA5e/189HAoWkMjucc7x83WMri3OIOMxEXi+CvWxu5S
	RZlqO0zySWB1Sjta2cEx5vZLBo1ixIf+cbQJZhSH/RP5RSg0F2M3COY2Uz7vD8x9Ggs59nyDzLWjG
	VMHsJb5lE7vVGisvQp5IxG+lvalvnX9cImchke52bru8IYMUhZRZd7cR3ImSxrhGnCaXRGM5SZ3da
	pFm7gXppHAEEzmrsDQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqx-0000000Foms-3dad;
	Fri, 11 Oct 2024 09:22:31 +0000
Received: from mail-db5eur02on20615.outbound.protection.outlook.com ([2a01:111:f403:2608::615] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqu-0000000Fokb-1bHK
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 09:22:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPJXlJvzzmuUPuaZYsSLnV1up8/kElhKv2b+ADDZwjDtFvDdVzWAceVw9d72YDM0wJ5Rs3bU67dYCY6+HkAd8xrl3uGVIhf63Rf9lnGM+a1oMh3aixXygfTSDvLigxeTA82DQOYA1BifdbRJVL313tH+sXmkCW/FG87HKG0iTRBDzbpSlliZR2bxlzu+S5Pxz6wJz67Zc63Gt4ImYKrNzRZ4wSTrlGDbNehErq/c/UO8VFwE8yaKXmWtnNhIXMqe6wD7lpu1J+Kga7/dHyTwpzc0e4KID1ZKufwkC8xX1RmAaYkApmiR84iIH8+A8VK7d32ZfQbsp9MK7QoJql4UxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X32ICrvcYjVLhT/5Z4Fak2BuegG3CkOhWfnXWSuENlc=;
 b=LObfRa8iXpFXFqiJBCpB9S3v8++Ypabr4WrqiMpwglflCxVhkP1RiFkTm3Dy/CWJXXbiadhdHibQeSe1AZYUxHUhzEgkvFiVGaM+jo1jfZ7pcYpNFx3sI8pPMyZynTgp2SsaOdCppuiW8oW2uvTpD40LHxUWxULlZpWI3NDg04cOrXbBTYJcsNNbgEJEO4jRX0qnoTpilawBufjAEyaHS+MxT7dVINQgYXaU3g8WEPBnqR2wyhcJOTnzNQpnIlkQcfNZM+10DRk/ugl8yZ6UU70D5zFNRfL4nLNTT9SnSHzfGKPqCClH9m3AHUVr5AYPnbngUJ5Ktkrd+jX+rblnuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X32ICrvcYjVLhT/5Z4Fak2BuegG3CkOhWfnXWSuENlc=;
 b=pkYhmMgibYGDDQxBt/TirtFW+cViGQfMLvEZGnBtBNv0H4QzgHTZRIWQ4mnFGfAlgAPIU03u+caL5BAZ13LeeH9yM3K5tcgUzX2f0pC8PfNYagT3z7yP3his4eKR2ozTw44ES4RhFG8Oxmlt2eATQF97ipA3taH85XweDbucAUQ=
Received: from DU7P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::16)
 by DBAPR02MB5991.eurprd02.prod.outlook.com (2603:10a6:10:185::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 09:22:24 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::94) by DU7P191CA0024.outlook.office365.com
 (2603:10a6:10:54e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21 via Frontend
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
 2024 11:22:19 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 07/10] ubi: Add mean erase counter sysfs attribute for fastmap area
Date: Fri, 11 Oct 2024 11:21:31 +0200
Message-ID: <20241011092134.2909496-7-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011092134.2909496-1-rickard.andersson@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922D:EE_|DBAPR02MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b674abc-ae2e-4df4-aeb5-08dce9d63786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jBiKtftpMuv2OHHfc9jLAWvtL6FTTg0U8Jl4KzUfqOhUk4VL5XQ2Eg5uo2pK?=
 =?us-ascii?Q?PR7J5L4xrWpWe/RezTotURFWLAeQeQfLre667v7bf2+E1cyYlXCT4D0J1Ff9?=
 =?us-ascii?Q?KPoTUTKYGu8ONwsq6bx8AzPIny/NWJ+VlsgPrM5ayvgyS/a40FqV+s94zFXD?=
 =?us-ascii?Q?1tj9NCXcfPcNX8H1Fy6oImPiK+20btRuqWHQ1N3HVlTU8Oahw/Z7rWoIYfQU?=
 =?us-ascii?Q?MmsneTqcwKTr8cZbfK5P3yGWDgpQBI+k7BlQVgKKnTlWSMzS01uSo+Q7WWHI?=
 =?us-ascii?Q?N17HFvU8OlYw1w59mZSHhpN0ydQOm+D/tAathoUOAt2zM37Pr8BD8eFE52Lp?=
 =?us-ascii?Q?bTbitCvJgc2oJHJg4Jgex56mlAhk7T6Y2ijHfMWmrE6Cz/iDDhFKxtHcIyTH?=
 =?us-ascii?Q?3TKcJWIIcZIplUQLzZX+79hydTuWLTkESsYqrAA5i2wLKp5Xltyb/Xx8PFy+?=
 =?us-ascii?Q?ji7DUjTGYPqTUZopZpZ4jxZx5YjTFQzBpRv/y6GJWyWB+xytM7hm6I1Zd0AT?=
 =?us-ascii?Q?5cgpyXuhGJ2vqnP6BlDfo9qKNfKFY01FFZVqQDmt+cqNxgQp4ROVZFZcZ0X6?=
 =?us-ascii?Q?P5BVozbLUMka8etRFKy+u/2ujV2BZIXfz0u0DX7XptJLpD4/dSe6urG0CD9y?=
 =?us-ascii?Q?549WdAGyOc75NzyaoSG9J5+phRsmjckw4l2npA5cVjcq0kvjRUTaFs/RHzK1?=
 =?us-ascii?Q?P/tpUN0S659DeOUZtRE3J7bo6WZPqahW6dycB2P+/FfFgnUZdKTaepn3r1Vi?=
 =?us-ascii?Q?GvHa3CJOx2mjDzM8B286vbScIYDnxyV9Eumwdf6XEPuhzCwAFtmV3i/y4BVY?=
 =?us-ascii?Q?nKFydAZpWWARrwHorWNbcJHatByDAxriGryKWxdbmeoTSPDEPII48F8IPyD5?=
 =?us-ascii?Q?lwO2UFh/imAk8qa01SV2ZVG5xzZqztK31Otjr3n0NjnxhvNlv0fBbRCKDn7D?=
 =?us-ascii?Q?e4RycReTV+9kod59e8D3E+Ugm1LUT4wPpsNywYITqAOTmdKVyKEvcuYUV3QD?=
 =?us-ascii?Q?NxfI4g8PbFf6M4oD7hYjBd4Mnp4Yx8vxexep9EFEyyR/XA9Fy9bEMXJnhsTd?=
 =?us-ascii?Q?8jukKEJr1zuVJFNb9uVNb+EmWgTEVxvPdVrrt2uQwe6LTA0JYwyJv2d0Sl31?=
 =?us-ascii?Q?P6gB+ywF3STHDVcnSvlklS2yGyenJoM/8WjaVSyJWGskz9ikVPt1xIIiOgdC?=
 =?us-ascii?Q?xdVRxdpWeqpFQWQdPVR4vnhjK7MT1B+J42tMoyG/OGu7CWRyCXALGWR62erz?=
 =?us-ascii?Q?NAoZvYgTpbtdSVqMyQMicHHlC1KTAADAiXVg1PMXcLkZ23vGZRw4hQx4zBx7?=
 =?us-ascii?Q?v5datkEccic4yT9/fKks19jl1QEVGwcdEyOanvQI0npvM2qbB/j7oaqZ4y8N?=
 =?us-ascii?Q?UxG4UA8=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 09:22:24.2989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b674abc-ae2e-4df4-aeb5-08dce9d63786
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB5991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_022228_442928_A138F12C 
X-CRM114-Status: UNSURE (   8.00  )
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

A mean erase counter gives a better understanding of the flash
wear of the fastmap area.

Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 Documentation/ABI/stable/sysfs-class-ubi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-class-ubi b/Documentation/ABI/stable/sysfs-class-ubi
index 535a3e6dab12..05a701b03a9a 100644
--- a/Documentation/ABI/stable/sysfs-class-ubi
+++ b/Documentation/ABI/stable/sysfs-class-ubi
@@ -226,3 +226,11 @@ KernelVersion:	6.X
 Contact:	linux-mtd@lists.infradead.org
 Description:
 		Mean physical eraseblock erase counter value.
+
+What:		/sys/class/ubi/ubiX/mean_ec_fastmap
+Date:		October 2024
+KernelVersion:	6.X
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Mean physical eraseblock erase counter value for the fastmap
+		area.
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
