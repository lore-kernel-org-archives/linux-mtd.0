Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D576DCFA751
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 08:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXnV99kMneG5lZBgJnYZGhaQ2XXw6aFIiyKj0fREAG0=; b=j6AXD7Z876g3HR
	oFgTBdaTyPd6DTcPB+XTVXByIJTY17y6ZopfzxbderNbuKx0G+G2ksxn2mnt5gVmSEGHZhFBkYsNx
	HqQquFUSFEc/xMz5a6rODXKa3INrMECdTqs7/vIjGm0RYTL2F+80eTDjytrMop52vpG16OU1kawTA
	oZ9lCIzDaqGAkpJD1RTEzl0P9jiB4BcewItnAc+wd9cupS+BeE3z6447kBstHE+5GG8nOZBKQOedV
	4+EIKfXKJNovrSrzee6I8YUG7Ept0AGycGmw1zSNIy3tK+om8zsVTElEONsM5ZCqqgDMs2F3nm+j4
	E4VM8F5JjCwax46VIiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdf3-0000000BPF2-3MS8;
	Fri, 04 Oct 2024 08:27:41 +0000
Received: from mail-db8eur05on20600.outbound.protection.outlook.com ([2a01:111:f403:2614::600] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdaA-0000000BOMb-0old
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 08:22:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRGSYHS3DT41gnIrRnOI2thIjd1VLJx33D5aIHQgWv+0rKDijtonrVXdFjz3ITWcfLIIuwCz+N3RaJWMzVJAJ0Fu/YYrleDreWUNofeWgCW8NPO87aCr/psvPOsOE4P3xw3n33ygUeKhn2pR50+7Urs4HrHSFSgBcNcKSzMhgXayvN2iNyovhqX90TV6FeudC6mA3FSvPnpTSY2dWRP+VMdqHeGQ8PNfYUeq4PNXdUhjms+1tU8vA7LS5CnFEmrtAk7F1VwDW8YDvFZJkJriZbnDaheB5rTf9/o5JxDNGpnC4ItGbKTHlJb/nNdWOd8ztUpHjoPkHAZCRyExgKFpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNmsiiC+kbX/v2JeKYV46mVDr+42/aFGjaqZgDl4qlE=;
 b=GHTIXhMZteComs70eUVANSAdoLAok/RwgZMG0ca+T9b+vX0oWyGtG15FijecWSVIB8w9ctdaqNuK4KJR28+gDT/EpA8XUeZ/hxQ3vhU9X940a+StCN2bQOAs5DRpkHOD5BnBMtqRgyD4Vl3xYhBiCxfEgwZR7G75dSZlTpl+PX40y5f532hO6phR2ai9UjB77ORYg6iHonIusflMYL5/I3ZXkZUyMadhJ2yzi3bGuJJoA+CRPPIRn4JoBLn8cR/LaQcPsObggSRB+DJisBjhi7oav+YkhkzP6XiT6gcVMAFa72HqDfawVi5arbZiOxO3jPS9R31WQdgwjZMXt42jUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNmsiiC+kbX/v2JeKYV46mVDr+42/aFGjaqZgDl4qlE=;
 b=QuL/Jr/59PnDbBVsi4lQsaE4eIzfhV8Q3hP+Lr9rb1GhqIOB1CSJ43X5yiPNc1T1b1HK49EQKBFY9YiOz9vtwaVF0URdf7lyEpB08Rz8hXfXBSfc3D5nBVMZX7ZItwylYVzEOflrRm6HdmrRxPO3M5kicQBS5g1qW56t5G7l+Ak=
Received: from AM4PR0302CA0029.eurprd03.prod.outlook.com (2603:10a6:205:2::42)
 by VI0PR02MB11113.eurprd02.prod.outlook.com (2603:10a6:800:25c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 08:22:33 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::f8) by AM4PR0302CA0029.outlook.office365.com
 (2603:10a6:205:2::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Fri, 4 Oct 2024 08:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Fri, 4 Oct 2024 08:22:32 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 10:22:28 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH 3/4] ubi: Add mean erase counter sysfs attribute
Date: Fri, 4 Oct 2024 10:22:07 +0200
Message-ID: <20241004082208.1103202-3-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241004082208.1103202-1-rickard.andersson@axis.com>
References: <20241004082208.1103202-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A68:EE_|VI0PR02MB11113:EE_
X-MS-Office365-Filtering-Correlation-Id: f413337a-1605-4dd8-8818-08dce44db209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ArezxtlLAgoRTbToMfQsSP6sBB/Se0m35SfEx2r4+cjGdqyDO/MZpSFOEFC0?=
 =?us-ascii?Q?CcFv4CH5TYABTuSQ3YtSRsJVWn9yyI/thAGZwJfiFO2oyNetr7QfyNDjP0/L?=
 =?us-ascii?Q?zkn+xuiDOsvcjWBNZ0CAkPC8ITktFNXtQE/xkhBsgKXsTND3W0pq9+9g5wlK?=
 =?us-ascii?Q?XR/YbgrG9Koa66C6t0/LyidGmYsicKX665J0Vc1/bX6d9mVEWlLod3LhImJe?=
 =?us-ascii?Q?gr1xsD0aKaHpy9cUV0SoAZJWrWvDle5qaL6JVTkZTJRYMdCb5USc8w4yC4ov?=
 =?us-ascii?Q?jKXBIxjWNLAhkflZmijbsgigrpRC6vQmgN6ZZ/f4iPpGcsyyG6zY+jX11EpU?=
 =?us-ascii?Q?z+gfQ2TOCcN0FN0LXr3Tgj4E4LvhvcUVRuUnyqm0Q11pYNOft9OS+/C8vPXk?=
 =?us-ascii?Q?fON8+7b7j8naiIDfUEunOaYHwK6/ypKLlOxTsaF0Cg+1hF+QMkWXyUO59dS9?=
 =?us-ascii?Q?RhR2fqeJs+HZHZnSdLTBst2CYwB+kG365B93tkq3lZlgz55kRfCpPXoKiwP8?=
 =?us-ascii?Q?59GtlcODslSIKnPmDm7/9LOB8imTmYG5sFh3But0NOzD7s3XKu6CgHqBkrLQ?=
 =?us-ascii?Q?y+cDWN0pD1MeQbJ7MTSuTDOYS5SZ9ZqV5ZKGZGbdKjMjnUL5XmyoIJb/FFg9?=
 =?us-ascii?Q?eQkWMptr8sBL9ejmnOGoA78hlEREgtyZA2dkVFaBxQ/t41BeTHUw5cTB195L?=
 =?us-ascii?Q?AcdvTiP1RMxbA/xWC2tnb9335QGCxS1UGJ8QANbcKXoxyihdKc5DhxqwVcpB?=
 =?us-ascii?Q?pRPIZ3SPjuiF9a/HQdZ2ElCjTodCeDJCkRBYlgo6ujm5Ky7TIAsSQenPpSVP?=
 =?us-ascii?Q?2EF7L0W/gQ2c76YiRyG4b91CqHmgPDfD8A2bWD1aHM9tivPFFfFi7CNQkDQZ?=
 =?us-ascii?Q?HWB6ezMyb7+N8Qqp7XuFXOsAVCr2qk4DKOjbOHKxwinK9umzlu/UwDOiLUoD?=
 =?us-ascii?Q?z0Ss/glW4+UV/B5k+qqkUiM9jvH02H/gyox24h4mi3e4c/FTpOPgFgZXAkPc?=
 =?us-ascii?Q?M20kUqKmFqOxuPtSiNa0ENh6QdItjIACwMNw0CAhOxp5Nh7bwvRWKiTFEGij?=
 =?us-ascii?Q?DLl1z2BRAX+4dqsdI4faJ87OaHKWLWvQIQVUq0txyzIYOEhH8gVSw8fGoqya?=
 =?us-ascii?Q?GRwauaMlmgHtkcWxC9OOV7z8vPwhPHhQj3ah29S7QuiEUn+ykRxozNQpl/nA?=
 =?us-ascii?Q?UHje/tuTH0JF/QUbE18vUJ0RwjSQj8z+V508HEtmmEulE6l/LFVDOaY7rpEh?=
 =?us-ascii?Q?h4aKIc4zHfXgcKYt7jzLqxB0jHpcL8yymHgHKnMgMW0pOepGN0Yxp/1BVZq1?=
 =?us-ascii?Q?pNIv6u96wxV+OnvY5OjNw5jVk+KK4N91XrVXvmoRxza/Wclg1ZCsFjpzNI0r?=
 =?us-ascii?Q?LtquvgQ=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 08:22:32.9883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f413337a-1605-4dd8-8818-08dce44db209
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_012238_442173_5E4C6FC7 
X-CRM114-Status: UNSURE (   8.86  )
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
