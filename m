Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF55D3C52B
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2024 18:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5UUmEZduh5YFUrIP+uiRcphkLk/CkXFwThF2rxJ8bw=; b=PlRLd8KZp8Ajki
	AM6JGNgG/UBMmXhmn67YBEBPOnWZxzlGiKr/EbKkZv/+7clKudKzKKqOQiVo2h8NlqdLAGNKuoM4n
	xsv4zD1N7W+Xj3KOtgliDHYv5+KsGQ1HPNif/3ea35wkr5g8StrZw0KYdXeoBaI9JWsMK2L/TToki
	I4Wszgw0bdAHYXqqN3EcSMDPFRUAKnmmfkT1aP+8IWx5CMHWKjo48S5HoehXjf5GYuCYP0Cm1lk9v
	Vag7RcNdM9cyCpogBPJq+9TTzWhGS/2MxvCovvpRm3FhLE23Q2SqY7X/Wpni1j3i3CTfVvrU+s79q
	6moGbM4LNk5EZwV2on+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1VMA-0000000FtIX-2psl;
	Thu, 17 Oct 2024 18:36:18 +0000
Received: from mail-vi1eur05on20616.outbound.protection.outlook.com ([2a01:111:f403:2613::616] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1VM3-0000000FtI1-2xFu
	for linux-mtd@lists.infradead.org;
	Thu, 17 Oct 2024 18:36:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrMCRSxjD4Mk0ZHFWXw0jX4FMf0ibeH3PCk4Sy/k0s57gVdWFJlKAWdZT21qnATRmtpe7H98qjSRfnxmFRs35DjzZE2CWFNzzeGByxT36e+43YI/GKvKmRsSIuVuRfjCpRAIaS+uZD15xNh1ZQ1TACemhyNbZK7IzjsgUtj7Ja/fPT1nPc2WRKVq7nW9k+JmP5qBRn5nR8+XiMEIF5t1by819iVngXcuVe4dGQrf6Ppy6ZMs+PBbfGt3VpdZg09Z27bahEShgoaZVUSDb0A2yQzlg1nMK/trrQfoFgTf3KR4jX7KK7nIOo+OFOP8iZQf1M9HRsvkX6cCfqA0QjXECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phZBGTYi9FxyEACGW7valQReuklW54qRYEqvvpq3KMc=;
 b=BvXJZ/SF8kvhWithu2rc7P3UwAvYBGccrehu8WbYQPsWjIEUg7+YVhNy5bS/WkQNHQEpG1NRyVcXXsfGRarnCRWP1UeRI0/qcwfnQ5RveGEqt1mWlktxBCDkOxstBrjYKNaupnQoVUDKHRrYzfVaN3N7n9yYiLj2CIu3mOxaGcKvfrtO1NxrdD9M05u/ieICL3B41WllQ+FaNfOoFTIjvTBGOPDlgwHf6KqIl7xaDfcY6BINCmWNtCjLo8XgYyI5wvUrfSYBRofS+LOgn2f8ML2JCKoA8FVD7cSB/gaiRvBLtMR1VdZ+KPuE4GE9mz79rrQRWwr71bGQ80vd0VpC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phZBGTYi9FxyEACGW7valQReuklW54qRYEqvvpq3KMc=;
 b=QMsf90DqGuuXszhVL5DmTK1U6RpcTa4W0pwt6D+cRy8eN0MYXuKP7Dh+D/18ysgiFMpTtSWiJlSaTxBvBmPmhHB1Ap0OoRyfFc8f8qvWqOl2UNhhsJhO8LFecEm6FQNmUDeFix1B96LIVAsAZ7sAZhatvrxExzy5xAbjkB7r6WM=
Received: from AS8P189CA0003.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::17)
 by DB3PR0202MB9107.eurprd02.prod.outlook.com (2603:10a6:10:43d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Thu, 17 Oct
 2024 18:36:02 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:31f:cafe::8b) by AS8P189CA0003.outlook.office365.com
 (2603:10a6:20b:31f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20 via Frontend
 Transport; Thu, 17 Oct 2024 18:36:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 18:36:02 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 20:36:00 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
CC: Richard Weinberger <richard@nod.at>, Sascha Hauer
	<s.hauer@pengutronix.de>, <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
In-Reply-To: <239af2ee-c18d-414f-099f-2c82f98d9671@huawei.com> (Zhihao Cheng's
	message of "Wed, 16 Oct 2024 10:11:46 +0800")
References: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
	<5173d3d2-4a6b-8b0b-c8f7-8034c9763532@huawei.com>
	<pnd7ca9r0pt.fsf@axis.com>
	<239af2ee-c18d-414f-099f-2c82f98d9671@huawei.com>
Date: Thu, 17 Oct 2024 20:36:00 +0200
Message-ID: <pnd7ca6wp9r.fsf@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|DB3PR0202MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: aa857c97-2312-4e4b-8348-08dceeda8d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yuRzaid9DlrEm89G1qgyNc6Dja8LaGnhB6DwKIcd0tLhFPziS/3XeWuE9Hl1?=
 =?us-ascii?Q?ZzAYWUhBAHIWRUMkff6gDC+LWFcT6uXYNkCzFqT8f2iG466KMWQamUw5zGgi?=
 =?us-ascii?Q?WYGHCkjqr9LlOeLcDJYPI+c68vqJxEjwhVV3OMyhDD4GzTG17Lpd6FRsEyRa?=
 =?us-ascii?Q?DdGIaYklcycpEfJOnUXxn8LXFXfM9Lw73f1suJKcqfDGsGfzy0v8TjWI3JD6?=
 =?us-ascii?Q?3yLegjwBf+JJtkpNNfe83vyXuoCfhGX5zMwgTm1Q4KEWcPLagf5HQ6OvJK5b?=
 =?us-ascii?Q?Q4jexnZFTziEV0jiGlrsbwIHMaOZFxJZxShmjvFIlRDSpWMALPIqOizd0VT9?=
 =?us-ascii?Q?JHkij+Vqj2lGoBdaqf5mwe5i6mB7Gd3035oERn4JS38NARzBEHbWDXevH4aT?=
 =?us-ascii?Q?V5Z2RAkTuMqDp9qDuS0KCtyx8JEVz8O3zVGomnapEhbLt+iQ+02fgAFVmZSp?=
 =?us-ascii?Q?xTCRXtM9GexiBA4NStlrgFXPQxoOINm9y7Aynn04SJQn7weoUy1FYH1CysOb?=
 =?us-ascii?Q?DzOJygLjQrCzyrF6pdAe+dBYZs09MCQEY2sV2JQY364kHIDdRHyGyhccDeBA?=
 =?us-ascii?Q?cRBdW5rjf4Y3pNBVwXflqPEShzrnTLjCPRWogafO8rzfZVzmEXoMQZ3oqAKs?=
 =?us-ascii?Q?nedUUs37jTZeNT0QsuFWr/bYg5Pcpp3M4XRcYLT8b+h0As0+RnwRiExRJQw8?=
 =?us-ascii?Q?wvD1fQsBzbTxbhb/7IusTK29cfy7j6xY/yvZQfQJkee0lamTZ+SOfMp8Wa7Y?=
 =?us-ascii?Q?PybehA/KHA/KNva7KW3NLlYFcCJ2jKKAlGde1gqghOtFY18vEqKFAKR++Z8g?=
 =?us-ascii?Q?3NJfsqS3kbCjFque/C/UJq7PeLRY7FtY88gbUR76BAWnv13SwTZx0Hm4BFEJ?=
 =?us-ascii?Q?ilHvb1K/eN3gV6IkBlxFDfu9t8vVqQPhsEOy0F6QuwsP66xZogRpPf50Ju0i?=
 =?us-ascii?Q?Vqx4M9LtpiZJjNDF7xZG8VosQUdDPPvngB364s97QOfy7knWQB2m+jbOrV6e?=
 =?us-ascii?Q?MZ9Hr83rdZF6LujlhDxcCsv/hi68QDNwsYqo9NNZxkiFho5wHGJefV0XtkR3?=
 =?us-ascii?Q?7IJJ/JO1wqJ4gxUFU09SBR2/Wv3opRi66g8b2NEN4Q9xwLH4QisfXFLf0c2X?=
 =?us-ascii?Q?x8yNuXQtutFbqmgSOfYxdhYiCs4TkybZNfIVpLv5BKwcRA0jYSNUCPLNOevi?=
 =?us-ascii?Q?AvDfi8z4ngNRslRgzj6xnXBvPGVa3fjJcGjU40BNb3WJ3F+7iWCgfH9Zo5Ct?=
 =?us-ascii?Q?x9SO5w69cNHadhiDPtYewRy2oRU9wpx8DSy3t9mwaJzIeY1hsKDcmand08vt?=
 =?us-ascii?Q?J49c5VQzTgrCMCb7qaKFgP4i2HDc6rNVeEpQs7Bq3bnPdf+MwLb1a+sApVIH?=
 =?us-ascii?Q?0sHjGhlC0fs8mjkx2IFuVd6pVz1Nr7c3AXmgii7XWWHsVQ9S7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 18:36:02.2697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa857c97-2312-4e4b-8348-08dceeda8d70
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB9107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_113611_966377_9D1341BA 
X-CRM114-Status: GOOD (  19.78  )
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

On Wed, Oct 16, 2024 at 10:11 +0800 Zhihao Cheng <chengzhihao1@huawei.com> wrote:

[...]

> BTW, what is the configuration of your flash?(eg. erase size, page size)?

$ mtdinfo /dev/mtd2
  mtd2
  Name:                           firmware
  Type:                           nand
  Eraseblock size:                131072 bytes, 128.0 KiB
  Amount of eraseblocks:          1832 (240123904 bytes, 229.0 MiB)
  Minimum input/output unit size: 2048 bytes
  Sub-page size:                  2048 bytes
  OOB size:                       64 bytes
  Character device major/minor:   90:4
  Bad blocks are allowed:         true
  Device is writable:             true

$ ubinfo /dev/ubi0_0
  Volume ID:   0 (on ubi0)
  Type:        dynamic
  Alignment:   1
  Size:        661 LEBs (83931136 bytes, 80.0 MiB)
  State:       OK
  Name:        test-vol
  Character device major/minor: 244:1

[...]

> Well, let's do a preliminary analysis.
> The znode->cparent[znode->ciip] is a freed address in write_index(), which
> means:
> 1. 'znode->ciip' is valid, znode->cparent is freed by tnc_delete, however znode
> cannot be freed if znode->cnext is not NULL, which means:
>   a) 'znode->cparent' is not dirty, we should add an assertion like
>   ubifs_assert(c, ubifs_zn_dirty(znode->cparent)) in get_znodes_to_commit().
>   Note, please check that 'znode->cparent' is not NULL before the assertion.
>   b) 'znode->cparent' is dirty, but it is not added into list 'c->cnext', we
>   should traverse the entire TNC in get_znodes_to_commit() to make sure that all
>   dirty znodes are collected into list 'c->cnext', so another assertion is
>  needed.
> 2. 'znode->ciip' is invalid, and the value beyonds the memory area of
> znode->cparent. All znodes are allocated with size of 'c->max_znode_sz', which
> means that 'znode->ciip' exceeds the 'c->fantout', so we can add an assertion
> like ubifs_assert(c, znode->ciip < c->fantout) in get_znodes_to_commit().
>
> That's what I can think of, are there any other possibilities?

I looked a little more at `get_znodes_to_commit()` when adding the
asserts you suggest, and I have a question: what happens when
`find_next_dirty()` returns `NULL`? In that case

```
znode->cnext = c->cnext;
```

but `znode->cparent` and `znode->ciip` are not updated. Shouldn't they?

By the way, I left a test running, and it actually triggered the same
KASAN report after 800 iterations... So we now at least know that this
patch doesn't indeed fix the problem.

I also found another minor thing regarding the update of `cnt` in
`get_znodes_to_commit`. I'll send a separate patch for that.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
