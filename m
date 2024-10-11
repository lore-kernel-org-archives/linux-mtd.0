Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE82CFD30C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXnV99kMneG5lZBgJnYZGhaQ2XXw6aFIiyKj0fREAG0=; b=K2n3Qqo+BICPkU
	3QMazygiRvyvnjD6O7W3JR+X9HB/6tpm6G7/9eQdhQLOu42SSFI223RtnqWPleB+FuJC+0v8t2MtW
	pJnqPa578SQTIW95VuMO0wOTWj8oDZZnrAVbxzXnLrMqBt/GnRWukH6EvNcrWqK8qZLSMXr+hey4y
	5gLUCNx+24QYdsBRGknce/6FCCywapcD/iUdnKCQofqEPYl3Ss0ZYwREvvf7CZhPQgKsNQpbvTn8C
	zW1gv+e+qkzTITFH+911a1WT/5rf2zimQFQGB9sHChd84xW8SVwg0PPFKDErcEBK1ZfK2a+NDakTC
	0ZPM/R2eWg/1e5TAskrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqv-0000000FolV-0r3Z;
	Fri, 11 Oct 2024 09:22:29 +0000
Received: from mail-vi1eur03on20605.outbound.protection.outlook.com ([2a01:111:f403:260c::605] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqt-0000000FokL-2Sbe
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 09:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXKlix0Q7+gKKnuZp42CWEzcg5CXEuBGZTDhKBdWZ3x921Z+NTVatQL8jYK+VIGpCpDipBTS6N4vxZ4eZtwMLFXzzDVsVS33W9z6W3UM8SKAtCIymQ9LMWATsdcKh+biQUGPXwllVIZw+bSgcSfP14hZX91C283Nb1mPjbacJvuOEGj3c4RTTDZqZd2lwlERHVdwIAQOu05WMHFeneLCakPDnq89O0yLJP/vQafDY1+n6gC6JsCScIZFjLSG+dmc1WsA5tymoVa5me01R3hdGRdNCTDA10gnZytOYoArlakP85RWEwZvm+cUfAbu1JkxZ71cMEIrheeY+5Se9Lw41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNmsiiC+kbX/v2JeKYV46mVDr+42/aFGjaqZgDl4qlE=;
 b=qNzV6ejdY0RHNwv5sPD4P7s17ouJAHML0p51z180pytmmIofqD2Qbhkcm71Osjm56zDzBO+XcIvB6PCFWDjveHtkTKMVgUaZGJjioMGrhTQ30GLl+Y7PEt8YDTuEBlPY2Q4D8t9zKVKR6OrUkNzB6H+0tIcmIxBgA6f+ugvNh3IuRiJTAWd/XBsHH+0qicaocmsUZKBXp3BYcBwJDMngCPJC5f9kIJCfoYMAMYrvOFRI85spl9MgGHh5oY+hQU2C3VLjzYGajaVNHo/9KcFrTC1RCN04gl8BE2w/CJWa3MqJdlJfvl7feIIPWpKR831bGUijyeDG229BEvRX+1niEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNmsiiC+kbX/v2JeKYV46mVDr+42/aFGjaqZgDl4qlE=;
 b=UCJIZlpi0IvGdZUKi8bRhUEmbObuz8v5+xPknvui9W0zEPiYiNHn9dlxqPARY1GMYcbGk9TTELzMh0WQTgVtCzjY20dc7FCJ+fo0OHfU5FDSnIWUPK5RXlGTwoaGXTGr9uIy0K35aFSaVOCXbbcKfqR984ncvHl+J32wPTyTw5c=
Received: from DU7P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::27)
 by PA6PR02MB10671.eurprd02.prod.outlook.com (2603:10a6:102:3d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 09:22:23 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::3f) by DU7P191CA0014.outlook.office365.com
 (2603:10a6:10:54e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Fri, 11 Oct 2024 09:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 09:22:22 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 11:22:18 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 06/10] ubi: Add mean erase counter sysfs attribute
Date: Fri, 11 Oct 2024 11:21:30 +0200
Message-ID: <20241011092134.2909496-6-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011092134.2909496-1-rickard.andersson@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922D:EE_|PA6PR02MB10671:EE_
X-MS-Office365-Filtering-Correlation-Id: 3182c9a7-1c95-4402-08ac-08dce9d6369d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i1b9F44eTmjtZd6r9zkTl2yMR+slfpUD0OgxMR1QeR9KuHPNkP1LLatdZ6mX?=
 =?us-ascii?Q?XdqLT0OTSe4Tkfr/EEjplBHO9UPQ+PkbBtqvJzFDRFLEpKwM7oiSaqtLCxig?=
 =?us-ascii?Q?aC8pKTCHsmcI/uKKsFJLVc+gWiO+x2Wf80CaiQu2ioAACwT8BiuNBp/E4aVk?=
 =?us-ascii?Q?aEARmd3T1mR1rbq8rCm6KGfqMJBmsZ8/xIXFmBFjrvwYiNOMnKv6k4i9neow?=
 =?us-ascii?Q?c+yL6qsVIOSwsYCVX9XoUp+yCUJ+cVk8f5HcDaJg6OA0c6Zo7C7exaGodX3g?=
 =?us-ascii?Q?vDYmWH1x6ww5pKrSFMCu682IwRr7wzL69Oi7EMwFmQRBxQhwVnjKifgOqJzC?=
 =?us-ascii?Q?UKLvcBJZ3KwYJoiqvsy/VyKxDbynulmUk/eqRDCja+vfLdyYXbUn5Wf+Atia?=
 =?us-ascii?Q?H/Ix+w4uecIMHY9xiqhC6+QpH1oTvCFj54Xrd/nzP5Pt1hi11EAOqcn0NHWZ?=
 =?us-ascii?Q?MUGo/Pz978H4Fakj2mOOMDJ3Y6n0sLXXyuGXqhGuDdgmjvZASUDnFp4SbdJO?=
 =?us-ascii?Q?10oofrQuQqBi20gb7NTbDzZTi8YzETTGi4fWIYRZ8Vu8oo9nABMoNYzDhZam?=
 =?us-ascii?Q?1JNrZ6DnhegvjrcabuE7zEGmbO/Uu8paBaqC2bbKlB0uaTQMZ4pLpuEu5sAa?=
 =?us-ascii?Q?wjA8RthKZjSA2kacX2VyicjaD2hLy3WRvgZPidz+ZwhIejnM0nuAt1FO7M1J?=
 =?us-ascii?Q?ofRyn1Um/UjNHG4l11/57gPEfcO2D7ml9MlbApznFfxvYl1oCpcGK9pMrmcR?=
 =?us-ascii?Q?X/rhnpKO4LzwurjYBbJos4pwJayxoaxP/GX7i4WPL09UAE8rjGFLVXSoB32P?=
 =?us-ascii?Q?z3j5LOFFFjqGRRsfqL3tnIwsvKx90JpoHj/dS29Z0qyBLZLWMIl1Xx1jY2ne?=
 =?us-ascii?Q?12AwHsM3msTJupQwzE0Pjx7VBi8dbN54ksJQ4qa7nXi/PkM3yHdRDzMIKA8J?=
 =?us-ascii?Q?o/gM1q3YgrEmEymXwy5JmV1zQpKbnTAssWNZPNN5fEfrlNnmK/7xLAmxiF2r?=
 =?us-ascii?Q?S0MzC8xfJovQYXwMmQ0uNqA4PAz7I5q45uKku2//gxhr6ZqLHLIX5xJpyrAH?=
 =?us-ascii?Q?EZqX7lHJT4T3S+aPFm72S4ap1ckwXQ+m+GWB8jZUKsI8MXxA1wXQccYCbZr+?=
 =?us-ascii?Q?caXCxM86cL6EdDZfoV/yzi/sA+AZAakPYeAaWxkaCWRADIVFbc2b0jt4xOdB?=
 =?us-ascii?Q?RhHyiiA01n1kpBciNf01H3PPAhM8viHyNjQyO/W9uId2WnOl2w+CgwsAahMO?=
 =?us-ascii?Q?I30S55Ec82AEmVG3JkIoziCMAtT24EO7xiiDqL60JS1nD+AyVUWd3VeD19HT?=
 =?us-ascii?Q?xczpfTVVvSSGfr7CWlWlFs+fRRCkP4oNY1rqhMh95kiyqCv1wBDZ41W9kdfh?=
 =?us-ascii?Q?vfv8+nc=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 09:22:22.7677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3182c9a7-1c95-4402-08ac-08dce9d6369d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_022227_650113_D86AC9FF 
X-CRM114-Status: UNSURE (   7.85  )
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
wear.

Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 Documentation/ABI/stable/sysfs-class-ubi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-class-ubi b/Documentation/ABI/stable/sysfs-class-ubi
index a6b324014692..535a3e6dab12 100644
--- a/Documentation/ABI/stable/sysfs-class-ubi
+++ b/Documentation/ABI/stable/sysfs-class-ubi
@@ -219,3 +219,10 @@ Description:
 		Logical eraseblock size of this volume. Equivalent to logical
 		eraseblock size of the device aligned on the volume alignment
 		value.
+
+What:		/sys/class/ubi/ubiX/mean_ec
+Date:		October 2024
+KernelVersion:	6.X
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Mean physical eraseblock erase counter value.
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
