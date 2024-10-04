Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79887CFA74C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 08:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTJyG9yMichXCmDkoumtEkt9wywNqW7J/OQ+Y7SeR20=; b=zxxc3sW4bt1M0u
	penhL2QJQ6a8KTnXYJ/BD0vmGMCkGCmHyc8ko0ND/XrJRoQo0RBVJRmfmUCtwNZ5bnvhr0yRdoEh+
	hF2c1fPctI5rT5lKLs7oHtQxP4oPIzSFOM0b9LOhwzSEIanPDjT3yP3nHMidBFMKR6LytmTTnCuAm
	iGY3OwXKRIri6Fmmf8/7RQJKlKpz9m/tTeiA5S451PPCBvMj4c1VlHdc1y5BHY8+22kQ3dAkDYvrl
	/9GW8EPm1b9BMEXztveQpeBwXIE13DruL931I3pDMLo9QMVOxeFMnmAPcUCDiXpW0UkLChpRp9Wsd
	2CKuAz/uTEQNM61z5FHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdf4-0000000BPFN-1hiK;
	Fri, 04 Oct 2024 08:27:42 +0000
Received: from mail-am7eur03on20600.outbound.protection.outlook.com ([2a01:111:f403:260e::600] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdaB-0000000BON3-0nsC
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 08:22:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abz87Ufx3V8euBHRirbq78LWXZSjOerVGMGiXF13PvINHR+mOCI978eMBmcUek6FH1hvRTae1tWBo7FzAIYgEnoNFLg5YB/dELpWbfd6ytr7ENoAJOLZFZooSEVmC+lq+NrmYpvU7ByDBTUiCDFcYw/I979IsIwXBCo7kNvkXYS8f94pXm+dhhaOALTezCaytW/mcDap3gPXITsphDFaOXlMzzOo4cYjDM7UgfLJI/p/R1KkqXFHAL/ZQzMoqKnxzD3sJxRaTvkCgzf9SjJxYqh4V4WTT+E4D+iVJAOVrs0dRDRN8Ax2PDeBLb0U+lAvXVnG0MlH6InfV0Nw5ebabA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X32ICrvcYjVLhT/5Z4Fak2BuegG3CkOhWfnXWSuENlc=;
 b=adzNX5yVreuS3Ll/sToTmi70iE7svoKnrm+DfFXjzQu5iSuYDL+UBFZFrmPXRDCgLrVXYt1R1QUQQe5IafymCVqZ4PFNQB2m7LYXBfuObU23Ycg+N8yjLVgySgY+Dr/ZL71Dlue/rP9S0Js6yWJhZfO5pcHVBCPh4XLt1VaG9Eq+ZAAGAYMUCZETHV9sVuYPq3CZfMO57uQ4j9964GDauzre8+gLGD5CJMJsHGbMImpSafBqPCKGXxzKvCaKGbr4oNBp/3OheFBkOOnlztItV41noZR6vFMG9aWyzvs6O5TN2v7ZZsOXYbh2o2caAaFNixdUZFgvxfiOEOSe0nDF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X32ICrvcYjVLhT/5Z4Fak2BuegG3CkOhWfnXWSuENlc=;
 b=Y7AojJoUK164ax0Lti9z1qnqGfW0ko/8alvYbuaNSZhG6Uyx52d6LKFHXIbu428tE6OvUlhbE5SeM/rNpLyEYXsFSASbZg+scyi3rE8HyT6kVsT3Q2g3FJS+U4kH3rYxVdBj6JnmSSN7TVtxZnlHh19nxiNcfVdKkFAnghreW5U=
Received: from AM4PR0302CA0021.eurprd03.prod.outlook.com (2603:10a6:205:2::34)
 by PAXPR02MB8176.eurprd02.prod.outlook.com (2603:10a6:102:242::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 08:22:34 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::95) by AM4PR0302CA0021.outlook.office365.com
 (2603:10a6:205:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Fri, 4 Oct 2024 08:22:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Fri, 4 Oct 2024 08:22:34 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 10:22:29 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH 4/4] ubi: Add mean erase counter sysfs attribute for fastmap area
Date: Fri, 4 Oct 2024 10:22:08 +0200
Message-ID: <20241004082208.1103202-4-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241004082208.1103202-1-rickard.andersson@axis.com>
References: <20241004082208.1103202-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A68:EE_|PAXPR02MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f72a28-a0fc-4cb2-1eb2-08dce44db2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uXWxaPAPPJl3t6up5ecVLeaFJqmOTfPSo5/R2ckYGkzNGXut02kF9a4TvrSO?=
 =?us-ascii?Q?7nHi7Cf6Mge0UW6BbtnRU7DCw1opBy5aHJXljtclfSEq3KV2UUdVVuhYRbrj?=
 =?us-ascii?Q?Yoo2Sq33pLqgwFgicu9ARIuxh7dUDSeNBDvjwfq8+hj7kD92/gW1hwQehbYo?=
 =?us-ascii?Q?nXsEhe03hiOFOl2HlwySznItbgMMvylsOqFelEvEiu6Z5wlDxtSXxMr0DQ/0?=
 =?us-ascii?Q?Et8Lj+o5A8moyaU87QwuNyRb3GA1Mc51ju4J+JHs/AMBxCgKA3JVuBOc8BDb?=
 =?us-ascii?Q?PjE7Je5p3bcm8IfbTM/4Sy7C/0F+TRryRL7FsfapoVQqQgrozHRk0XMBfdDp?=
 =?us-ascii?Q?YKBmyhyzf36dZPvOGmUMTL3fGgjJfWfRH3UZLJ+7Ok2wtpH3vwbBlb97d5HS?=
 =?us-ascii?Q?TdsewMkBobmByfnHC6mM7aNe/6C+c4O8R3ULlsEtC6OoMspuv4LzUeeigrBc?=
 =?us-ascii?Q?XwGrKcJtq7Qcjnv86UfRRqHXcoWWyOWKhkv+RQ5qMVOlIEf9VYBi9/FfPr/L?=
 =?us-ascii?Q?N/GU3Zdo4zOuOPp9vL4HEhC/F/ksF9B1oScXl4xFbxGa6E/rz+VENhDXLb1H?=
 =?us-ascii?Q?w2MGf/RKalcpgmszyRhJVxTZxtXJA3XtpO1ot/U/I+rmdY02QO2JukKcXNf7?=
 =?us-ascii?Q?SDcxP+QoeoQLdFKQblFcSEtm0Q90dcJ3CWx1ZXQKndT/y2++CopBzSqL35OU?=
 =?us-ascii?Q?H1+lr+po3Jw1WBq1KvKTU7J15Nu17n9nzUcO9uYfzY2q6JhBTCzn800SOEXe?=
 =?us-ascii?Q?i66C0aJubNXVJxIIcG82cGBz3xzfMI4VGBt1eEcUVFszij1MsmC76F2EHM/S?=
 =?us-ascii?Q?QNCpUozuF35sG0X6GvnJQrs+wU8odvpmBegd42YR8tK9SkyuK+CGXTRbbERK?=
 =?us-ascii?Q?5ciwnusoV9ynAAB4a+XdALMbHnbpseoyhKW6CRArSVDsb68s03/ZPmUl0Y6N?=
 =?us-ascii?Q?9OVAlexoK0Gyf1iuxyVoUoPM25DHKnmMY6Yu+uw7oLzgmTgRaigdCXzBlrNy?=
 =?us-ascii?Q?iXrS00P+nhGyu4OszhGNV9+kC9HDLWIIfKXWtNAY7PyaOb4P5BPJqRO9AU1q?=
 =?us-ascii?Q?JkIEb3zjmntWl8kKysMr+mdPrRFGXcGnzDO1keVkDLAzBXReL3tPJIN2QJDX?=
 =?us-ascii?Q?4JJufrsbD/FM3s0Kkscb1kEc8csr4F0mqC48gVqkWodpXEQ8GBUX8FJEnyF9?=
 =?us-ascii?Q?QeZsj5Cc7WWBtiXK7rOpkHG2FqESFbH/qbvJLoryWGyrXbmWZwTWPfG1F+Lm?=
 =?us-ascii?Q?NyL2f8xuON9aN+rdnnk7wF/KKzmXt8YLskiyU88D7/ytXhFBhoHFC+OGXzsN?=
 =?us-ascii?Q?O7mAj7u17R3RI8lAC+SAQe4jMdDVCcnU7OfVvtRRxm11Yb8Z6pyvclL18Xev?=
 =?us-ascii?Q?OAbVdis=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 08:22:34.0039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f72a28-a0fc-4cb2-1eb2-08dce44db2a2
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_012239_260528_4C358113 
X-CRM114-Status: UNSURE (   9.02  )
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
