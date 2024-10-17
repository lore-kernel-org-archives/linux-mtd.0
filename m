Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C23D3C52C
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2024 18:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FhaJufEzHSMGCXqzSEkd1WrZfb92gLHDIRxHXXDE/Z4=; b=ZqyBiEz3brSkXx
	4NgbAPMbhKGoIs6tgCAdKSTCYPl6fcb2TeKdUFMVcMMvwdEu6PXNW8O7lUk7oIZa9dYL8sXj6s+80
	oQm+wheTkulOajNdwaC1g6g7gdF8F5I8mi/hkWUbsZoUWz4SWBatMs9h1NBOOuhLmK2wHenhGb13W
	BTo2dQkCpNzb3kVWisloezeYjS89+NOyPnthkXyd6AYEajewEyJJq0qWzLSCO8j+13UlzriG+g3u/
	wmV2G6KAyK/PTGKdfSL54igMwgWIa5E0gocKlMaK3UUxKRZKh9xyO0AtcUmowtv9nst9+KO53Kyt7
	VJ5mxEofbLCHlQCaowiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vf9-0000000FweJ-0kWE;
	Thu, 17 Oct 2024 18:55:55 +0000
Received: from mail-am6eur05on2062d.outbound.protection.outlook.com ([2a01:111:f403:2612::62d] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vce-0000000Fw9y-0pjK
	for linux-mtd@lists.infradead.org;
	Thu, 17 Oct 2024 18:53:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VU5rbj7/fyCaFT6fxcAI28LMf1JyH8UwGEySqve0BdbpWgd1p23gYB6CbFkCaudXzJ+DgRlAwURPWRbGsrJg6BnoBWuTbH4+FtrjKQC+e8JZM+mVZrPssK86H+4aLFuKsdY5u2PoNFnXk/1ZNIqcqUz/gWIpf134RB+x5HO3DzHESBtoqXd3M+IsIh9po9d07pQaKKiuGjyM4QOyhmDkHt1JYy47xFtvkEgLkNcyVrCm+oC/Y+2/uoaNiT37DYqobCemo4uU3h+0s+XB8TDXebatciNDQxVYxxqRDzDouW5k5GWVappnolMoPnbfHuO0ITFJK42KqZaSA9uujlDWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5s/tUlwAtX01HrU39bq5P+oHBNx5oAaBZLJlraEkKLk=;
 b=MnQHsm3iDJ0MABRDQxuw18rlhQ0rz8VlS9i6Sg1bS0XFiwyOqhdYC2hGbS2JD+1vTVMLQvVHc4G00ZxBzZEJ/DHC3xlVxZIKiqxo5xJT5k587Jv71diNh53aR9Z3bbvyJ3jvOULgcwLxzWe8S7xmJFaVsfzTg4xLV0xawGw3RBw7xD7ki9hnylm1PBsOyAeWCh2+bNO6raDjPXGhU+/iYA6sO0vGDiOVlOUcL0KuAs9iS55p50RVaOeKrVurXOan0bEYwYkZUG8yQ6ZKpHNe4tn2WsC/GMLfIMLRdUDpNue23Ad08JVEU2/g7x9neTZYoDB6DesrseqEIxFw1DSvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5s/tUlwAtX01HrU39bq5P+oHBNx5oAaBZLJlraEkKLk=;
 b=qJpzeQI+UauAJi7XXRvLTd2Sax7zLhzhlQzE/N8STk+5t5AK46AC6PtXq8frrggHgYQxOcioyeKCdfSaoj62hqQCjqgZY9LVGbp592WE1PY2AmBr8Tv50M0sk4dFHuQKOymA4Hm7kxorea2cpVenzMmZTGUDMsHdk/Y6wOEjzoU=
Received: from DUZPR01CA0193.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::14) by DU0PR02MB9193.eurprd02.prod.outlook.com
 (2603:10a6:10:465::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 18:53:14 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::fa) by DUZPR01CA0193.outlook.office365.com
 (2603:10a6:10:4b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20 via Frontend
 Transport; Thu, 17 Oct 2024 18:53:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 18:53:14 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 20:53:11 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Richard Weinberger <richard@nod.at>, Zhihao Cheng
	<chengzhihao1@huawei.com>
CC: <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ubifs: Move update of cnt in get_znodes_to_commit
Date: Thu, 17 Oct 2024 20:41:13 +0200
Message-ID: <ebf1570e3d28462a97b1a595794e1969a4c27d81.1729191143.git.waqar.hameed@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|DU0PR02MB9193:EE_
X-MS-Office365-Filtering-Correlation-Id: b9eab406-88ad-4660-5307-08dceedcf4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iEucC2+g5hM6WHTdc39F6YEmxqr5mSnflug5eyjdjj3REMti/VbSWVwtv0Wk?=
 =?us-ascii?Q?nBtgHC00BH6sRE2VaK+6kZ0uMynVDriWL8wMqAI+t04MmqYIWth9fN5AOU1H?=
 =?us-ascii?Q?INyQ8IVUBjqdoTJfTn+u5yYRWt5rKT4Damw1/48xn4ycJ28i8e0+/sXBLxGi?=
 =?us-ascii?Q?gAT+Dt/3XfTZAo6cH65B8h5Rsg8wj4+vio7v4i+z/d/lipYVNpVD89SPu6vi?=
 =?us-ascii?Q?z5T+//bfgr4PkvOAud3KTXYs7gKk/zg6DFPPe/In6W8a+tEr73iF2yJPdpt3?=
 =?us-ascii?Q?EaeF9dzasA+Lm7+mel9fAd/R/n+czCMDI/U0GZZvKGlSgjhSlk/A1bb2zUJ/?=
 =?us-ascii?Q?hk7LToKAJkv7g9NW+5nkGxy2VGiRO2f/LpATjs8ZHcQZsPAduqNuFWAuPlXy?=
 =?us-ascii?Q?dsuJV2NCpwGupk2azxRO2/fZxK6skplYe6hkoly9mktBhr+aUj0KRObxtopB?=
 =?us-ascii?Q?LFtxvVfssSGLQAPE8+smV1UOFJ6IS/iIvnujt1IiqaTKp/j3eBvjRddELGnn?=
 =?us-ascii?Q?Q6spzib09XL6o6psvAUP9g6FNqaPtPRW+YyBNBW25GhuM1lp1dUGAZ8EVV5n?=
 =?us-ascii?Q?zRgCi3su2/5zF/Vd6EnC4yToovwBv9RQqd/RQkEgLZSDvfmLpv5fd8vdCBxV?=
 =?us-ascii?Q?x2pvhBtTtIAIPgbFHVW6g1/cQvcM44BXjzORchLBS8sTv4vvj5Jfoft3GObQ?=
 =?us-ascii?Q?9kYIlvSZSovOQ2N39sIDBpv/qdGVzxQEuYKfYJEtPeUHg2OOTO7dMNW3mrGi?=
 =?us-ascii?Q?cQyRfu/1ojef02tFvvXUIuL8ZowYQUyFLSg9nQ/EvGGao+HGsUp2cDz3ceRE?=
 =?us-ascii?Q?ctGMVzdMwa6X9nFzrrI5Xxj25NgOT8cs383wD86hITxrqP5DvHJXrzp8xVv6?=
 =?us-ascii?Q?8Q/oUCzI4GBm5KJ7KTFp9hsIepxzfCoPeR0IgSY5M928IUXZrlgO7uAqzNHz?=
 =?us-ascii?Q?WF9h0XDYxYRxnR89g3pEcHD27i1NwjejCMTGVRW9a7jcQOn6ZIsBHp0tjO/w?=
 =?us-ascii?Q?pyR1ucKKlRwWkXruqgaWOgDVraltdZdokcj2xnf5JQb1WEIAX+jpFVENz4Zv?=
 =?us-ascii?Q?F53odrcpehDvEYUtHg0n95OW0wWgFGbYPyy3CS62f/IbIkYl9/qCdxhzd1hk?=
 =?us-ascii?Q?cCbrJlkVeYlzmyFRn+nN6vaOb3kLvnrGYGcnPmaB4u55eZW7C1p/MkOKB21I?=
 =?us-ascii?Q?Up/H6VddtfZ2+4tGE/HSjfQ9M44oR16sVch9T4ZLEx+lg6+E1bG9kT0tIpIo?=
 =?us-ascii?Q?6PsW9Ib+tbc8olDu9NqqQR9neB2AD1xv5NSjDsoGt+lp6xAiZbEWsGy8yIdA?=
 =?us-ascii?Q?XrGXImollrzPRfO4pBU4tLwJn7w96SXk8vdPGKsXMUKT3N+cHLeYCOO9gbVf?=
 =?us-ascii?Q?yVZb5sdBfCNayfdijpeL4sZFpzqwVRmEckoqcyrLfazK0eiHLQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 18:53:14.5643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9eab406-88ad-4660-5307-08dceedcf4c3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_115320_271463_A18A0111 
X-CRM114-Status: GOOD (  10.31  )
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

There is no need to update `cnt` for the first dirty node just before
the loop, and then again update it at the end of each iteration for the
next dirty nodes. Just update `cnt` at the beginning of each iteration
instead. This way, the first iteration will count the first dirty node
and any subsequent iterations will count the next dirty nodes.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 fs/ubifs/tnc_commit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index a55e04822d16..d42f7829389c 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -650,8 +650,8 @@ static int get_znodes_to_commit(struct ubifs_info *c)
 		dbg_cmt("no znodes to commit");
 		return 0;
 	}
-	cnt += 1;
 	while (1) {
+		cnt += 1;
 		ubifs_assert(c, !ubifs_zn_cow(znode));
 		__set_bit(COW_ZNODE, &znode->flags);
 		znode->alt = 0;
@@ -664,7 +664,6 @@ static int get_znodes_to_commit(struct ubifs_info *c)
 		znode->ciip = znode->iip;
 		znode->cnext = cnext;
 		znode = cnext;
-		cnt += 1;
 	}
 	dbg_cmt("committing %d znodes", cnt);
 	ubifs_assert(c, cnt == atomic_long_read(&c->dirty_zn_cnt));
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
