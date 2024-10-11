Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1299AD0D785
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 13:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JXAKnKkHgTs6p/w9keNpUZFFudjtGdoCaL+BEL3bTI=; b=ume+EnkFqz+V+5
	GEpN8Od953x5Fq+Nfc+IryeWNww5yfjxSRVDqLDrP6Ina4f1I2IVtb4amrkHOvBiNDK4l5mU4uWUy
	tAO9ejsHn49444+Wdaov+eXygJHTHvvX1ccquRU8xm2iAiGcjB8wqdzBivhSKy8fXQavCnCy7yzEe
	Ia2I90qjJrNiv0aDYzvCXrGrOYnBHvxu3DTDfhyKAuMipAOverZj4W24h0XW+wh7A7iJaXZF55tY8
	cKMSWBX59LSrr8XCmokhWZ3//qsJsE15ztbmHhH+k2uliGGZAcCfImVfWxZW6Vn4XaM+ljxhnidsd
	9Tuv4amrpVOkf+RhLp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFGk-0000000GNN2-0eud;
	Fri, 11 Oct 2024 13:01:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFFT-0000000GNFE-1pNH
	for linux-mtd@bombadil.infradead.org;
	Fri, 11 Oct 2024 13:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1B10oyCUrTPXVSrHydbBrB3E4vQPxRWVPIcZF1Iaopw=; b=Cwtp2xivV2OaxvhRHI9goutVAq
	L0uGVGpRd5vofnOL3jP6ndC3vo/FExC0CBb2YPxlrT87euG/L9gWqUf52ki8h4eD067RCchhUJTGD
	DFlzvoG6k1XVZD7IC6FR6dPSFDFZvVYrFz3WoHX1YjPwvA52aTt0C9fOaleWcKO74nDSWQ2LsQUPQ
	Pky+F+2hMgH3Ymx8j+CSvSKOhKhjGxzz/wgBpeOUK8PLgsi/7i1QwnNTfCHj3TqQA0W/47Y0DpNH7
	WNYbXJHLpvh8cR4EJz3Uk9r8idZEAuFo0dXoaTb8bO2wHcBoGL9g5LZ29yf/AT9C79f0xt4FA4lTw
	HCofXWwg==;
Received: from mail-dbaeur03on2060e.outbound.protection.outlook.com ([2a01:111:f403:260d::60e] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFFP-00000005tGj-3FXK
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 13:00:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5arpN1SQZiQZgvq5Cr/NohY/NnVHYi5l+qRlakzrZwt7zn5Jix/w+M9Pz0YS7HmFpiHtYe1NnKHUvCuNjhEIc0trQ7BnhDxmXV9bfxG9wFSxE/FV4Ox7ilTEUreHL/EzB/FQXNoY8lRRd2b+lBqBcb5IuIJOuxoS8J2zGqsAMDhg3WEPbaNrVFSv8qYseUEHLmPnfrHNbrAMWI8rSd2d6Ti48iUw4ax2IB0Wl1IMdlU7poPbPLoCAjpjWNjgnQPFTcs2BwnHaRHvKtOYVf8TI8EDsdPyn6WsqgMcSrw3M4p6T6VPYS1Mz8kYDn98qNF/D/mndNn8iOKyoERnS6taw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1B10oyCUrTPXVSrHydbBrB3E4vQPxRWVPIcZF1Iaopw=;
 b=GzVZOjM1B3z0UQshI9FVDXxqYYpNL2O5vpnFPHlgEbKqLJfeDITf4F2D3ZCdtj9WIrHc7qz6Bm1CsakhHP9Xqo1e0vA6ueTN0/AqSGPQwent8GfCsBkbgrQ6MgZ9Z0DodJJVjMzOf7n6i3kGNkgiY7qRjgZ2W80AvW4857QsRw15PXfDu+16VBSyIUnU9f7MBLNKAhtBNfBmVefxyMTFoKzu537r8xEOrHovDyrO6e8CAwaLlz3ht5HSCFV9u67unc7/lrqJzs4fAk10NyNgWgIhZ48EbVi2Q+ej2chd3xO3XsRSsSo7uJugNugEr092TmT8e0mXdvhcftCDpqlyWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1B10oyCUrTPXVSrHydbBrB3E4vQPxRWVPIcZF1Iaopw=;
 b=eMpfPErSxQCtIeRcA7sfQ7ddukvUhW+zA47lpHXiGn+f/4tP5yOTMXpFE3nDZ0qoWIgZ4ebfm0qfizIRvO833X+9/eGOyEN2uStuF3pjhIgcQwNa3/yqEIfIrXkk0sBdbCoirmELfUI+Q9ELkMjtJHtF7Kh/uCl1cqYGYvfsbpI=
Received: from DUZPR01CA0209.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::22) by DBBPR02MB10844.eurprd02.prod.outlook.com
 (2603:10a6:10:530::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 12:59:52 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::b4) by DUZPR01CA0209.outlook.office365.com
 (2603:10a6:10:4b6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 12:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 12:59:52 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 14:59:47 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 08/10] ubi: Add max erase counter sysfs attribute for fastmap area
Date: Fri, 11 Oct 2024 14:59:02 +0200
Message-ID: <20241011125904.2915983-8-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011125904.2915983-1-rickard.andersson@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|DBBPR02MB10844:EE_
X-MS-Office365-Filtering-Correlation-Id: 4609fc05-c26d-4a9b-be8e-08dce9f498e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4P+c9L+QnRCUs2LSikldQvGZUl7lrEyqfOeUL4806bU8CZpFljSZp5+KHaYK?=
 =?us-ascii?Q?9UpUNCkfk2h3QI9hW6W49sbnqCS1dOsBtxihX5kKIcCDxq+2yb8tmuxy4X8F?=
 =?us-ascii?Q?EbpU9AlQbBSRyRORbEODdZY9GnXErYwULAqb2G8ae4FH3Vj8T+3+AHQ2Yt+k?=
 =?us-ascii?Q?dIPYwyD84ODfuE9/er8TdqtnSMHtzIe6HFijBiGZ8jLOrD0cOW5cdxnDp+yX?=
 =?us-ascii?Q?3TDcFDG0XZ53JomwPgQ6qW7pNOf3PTtaGgpAHXD7tVaQlT0H+gzn0gYhvp1V?=
 =?us-ascii?Q?JEUlODrWRNxNuv24CXwgyOZWXt44ysKchrhH1KGxfrlaJBgvX55wgZ+hNlgk?=
 =?us-ascii?Q?FdB0eXKs6+3YKcscPvCc157i800TIFun4yF41cDA8TQNcxd3S1htkN43v/nS?=
 =?us-ascii?Q?MXZ/xLPf7mMYGC+9jo7HVamRH+Qriv4rrzs8x/fGACIwoOt0H+Uw+5t9IBFg?=
 =?us-ascii?Q?xCJtgRNUHROk7yz/kKk7n7+rNQ6dbeZnbZp+4IHHxpvi890z6qCbX+YfYd9D?=
 =?us-ascii?Q?89IVJIG2LCpFRmz/VdAd7BqR8IHTloWR2vlPwJlViAMJtQgOHav6BKyyL2i+?=
 =?us-ascii?Q?Mitxe9+x0rZ+SrD2rpBE6evct8Y69o2Sq+2gxewIo7PrbnfQWTPkzm/ajINq?=
 =?us-ascii?Q?Bihr6OMrFiMDzH9Wtqb+FBpkLtSkTEweHfYePOR8/Qj0jd0m9hQdofpb78ac?=
 =?us-ascii?Q?SrgN0h/vsthmAIrTh3F4IrWWyzuIJ9o3afbOdYBDCNVCSGjRzz3rPn3y2W59?=
 =?us-ascii?Q?HVeQ8/rrR5LG3oJtVMjzAjr6wxkXaDC0HlT2FEtZpnx9RaRrm1E630RZmjU/?=
 =?us-ascii?Q?VL1ER0P/5Tocu3NCw7hGMNibqqZJK3mg/HMCa8FwxZxS9XuMnDKWSKWHU8ZL?=
 =?us-ascii?Q?VuMqZj6TcBZ26AenU0fU3j5igq3m9DPg+zuSbRkGoEf1dS10aHHT/CrTkHeF?=
 =?us-ascii?Q?ACSFQmz8ToZ8OeK7Ua5BKp45AH7nmafLSNeNUcIJG6/38FhEZATmjM5Ba0ls?=
 =?us-ascii?Q?LEUNoPivTprwSID2f7T2zIyoBIz6ftYEzubWYJSVVfGTiQAfgsopuLXADYp5?=
 =?us-ascii?Q?IdeZMf1z9i/ciSllafKiyeXpvA3A7t8dIUxc54bvayDiwNl//584V1g8RDcL?=
 =?us-ascii?Q?CIngknP+nZ7QxC8XmQTkysgDHSgNaNh8H01GasU8qHXCMzKr5oRKFswoNK7J?=
 =?us-ascii?Q?JVlNB7kqwChMvxkoU6QU9WH9mChwUlJR+dfWbfzy68grXy9Wo1BMcmjq2PaN?=
 =?us-ascii?Q?tfM3AQnuhBf/tFU9lXtZuYqbrskbJksgfDEfyQXdxHUNNDhv/muD6TxFnw2A?=
 =?us-ascii?Q?I3fQYEQ0WaTsMfrw4qoFBU4DWr6wklbTWkG1erUrUFxJrkSXTF2x/3EJScJm?=
 =?us-ascii?Q?gaAQFXbV1lsiB7TtsPxclNjHxYKK?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:59:52.5628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4609fc05-c26d-4a9b-be8e-08dce9f498e5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_140000_064337_AE5C4A4B 
X-CRM114-Status: UNSURE (   8.58  )
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

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
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
