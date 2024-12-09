Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C38E77180
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 11:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drNDz5eEO/DvqCx4enVUHIhfXIYjr1dK84QKCBQtaIY=; b=33WfS1KQV0h9He
	Z6dyKHLdVOxGD3rZl3Ndj3RT7t0zm/VZ/HP/aqWZ4Um6Co9eZKnrYFQyp5ip0pnWnYOfAftog01xi
	h0fNqKOoxEGIGBEL+T82mGNRqaP7kRbW0EOshnufNhNaZwbwoDoCXT4Ht6Q3MGDbmOvnpwzaX8uUQ
	q+xqgBzKTiDDBaj/23HDQpRd/wPZAzdAKkh8u2hVJC5IdaqSJx2nYa7558js1xVKJuysGkZWyQFfv
	Dl+OlGc8zkFptRddIJQPIFiGgGjj2P8I7XK8Q3gFK/dM1f5hqCPiM6GERN9SfZOAaTzas+Pif+RIo
	FkmAUJp1RehmtdaBp8cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcGI-00000007YWv-2f5T;
	Mon, 09 Dec 2024 11:49:14 +0000
Received: from mail-vi1eur05on20616.outbound.protection.outlook.com ([2a01:111:f403:2613::616] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcGF-00000007YVV-1QDi
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 11:49:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxa7SKYhqzM1TRFxMPC59QdVkugTp2reGodm8kine5p4vQDsTSjCHPtbIycpQ4se1MUL0fjg17tSlYt93p6/V4W/xt9vbCl2/WOate5OSs9cN8tb+QUXHWhG8B8NNv0i3rbpHs6cjs7xy1oaTyk9gZbluGxts10zc5ROZdUHwlYbKdlQbDJQ81rFCYy7A0E5o4PUdmOtl2k89XUlRYrI92Q4Rpgcslh7OADjTltilNO6RFU+NUw+gm6W83fnzS66YS4cwqqTpMDjrnPCoWF5GaZNsfyPqGBkf8fMnIT7HhDh21lHyGPBWGUP4vY0ijBK5J5D5QcHAz7083kaaxFAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BS50HgXQ0arQT3RxUFAJjA0I7Uy8HbaERU6I0/sdddA=;
 b=VBSIyXFKGG6EQUBjSTSJxy51ELYaQgCbu7a357KdRNw8fn+hlRM6KJ+QWSx+9EZC+5l48qh9wwV2Yj38CoigYYll9sbYBUJZYGL0LFR6rDkmu9CM/XBIvAHxUcY20iL4YUZRCkhIT65loDtHuDqkmpXesfaSenTJnsPZuEp+45GD1IZSEJ7Csdi6ZDvjdzzBi1BtxprjhRQ4CUBiLybkwXgRSqn2FpEZTeqEQs6WigWQkITD/TgxEljFABIub9AQRPFkrNayPjALcG/zvPb1ucIkQ1nBU6xlgl6FxlBdTQuE/+OmNw7dJaqdJ1Pf0YB7R1KsxFPXTiiHa2YIEnCjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BS50HgXQ0arQT3RxUFAJjA0I7Uy8HbaERU6I0/sdddA=;
 b=YtX+cO+OD0pikiQtytrCWSxWJrcTvOm9buv/2pbZXJ0uO6xR0X6FmcnPiydnxGyLl9SoRm424qq4PyWprCIZmmDBqrdEam19bPb4Xj0kE98u/g34XpfxDY9/bvVFbWoMXe/NJF27GmG9qkoHUKFCwWxAYWZzfVdO+mOYKjs0Q9o=
Received: from AS4PR10CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::20)
 by DU5PR02MB10705.eurprd02.prod.outlook.com (2603:10a6:10:516::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 11:49:04 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::60) by AS4PR10CA0026.outlook.office365.com
 (2603:10a6:20b:5d8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.13 via Frontend Transport; Mon,
 9 Dec 2024 11:49:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 11:49:04 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 12:49:03 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v4 2/2] ubi: Implement ioctl for detailed erase counters
Date: Mon, 9 Dec 2024 12:48:43 +0100
Message-ID: <20241209114843.2484141-2-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241209114843.2484141-1-rickard.andersson@axis.com>
References: <20241209114843.2484141-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C709:EE_|DU5PR02MB10705:EE_
X-MS-Office365-Filtering-Correlation-Id: 1544a3f2-f51e-4f58-1544-08dd18477b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWhsTlBFUmVpM1hlR3RsU0FBUGYvNlVKY2JyWWFBNEhHMGhYMWxUTnkwM1ho?=
 =?utf-8?B?a0p1d3BuUnY2Nll0bjd6d1F6ZkRVNVJYbElqbEZnbG1nZUlPemc0aGI2VjRN?=
 =?utf-8?B?MWhmeWVQa1dLRStBS0NMbVJGcUNWZVg5bHFyUFZPbENKQW9KS3BvV3Arc1F0?=
 =?utf-8?B?TWJVZFpmRkJwM1A2UENla2hOK0JaMGVhOUw2THl0a1BENUF3TUlqUHJFZ1oy?=
 =?utf-8?B?TzZqVEFkL0RybXcrbVZzSFVYM2Y4a1RNMFo5azBxald5N3NldU9pS2NWNExk?=
 =?utf-8?B?ekVuZVllTXlaU2RpQVcvNGNYZHY4eDFVMzdJZm9xVjljVE9GcTA3RXZmbWJm?=
 =?utf-8?B?bjBWckpmem0vd2FqekR5ZjM1RVcrZGdvNmI5ZGV4Rk1yaGRIMjlvdDdTK3Rt?=
 =?utf-8?B?dlYrVFE4TWpVZkZGWm93MndXQ3R0SnJGMHZBMHZKL1pRMmxsOWZlOFZYaklV?=
 =?utf-8?B?Nlo2OTI1ODVhdm5acmlDYnFYM3BRMCtqT2VBM1E3STRBVk5HNlg2cFVlUm1B?=
 =?utf-8?B?MkZySTAwWXkxalUzUEZGUWY3Q2tLOTg4YXg3Mk1YNGQvUzZoSGVVNGU3ek9G?=
 =?utf-8?B?a0dQSzYxL3ZsUG5PZFEwSzgyY2xDVzh5N1RMK2t2REVjMTFROU82TFVWQ2dC?=
 =?utf-8?B?OEpsSTBEbkhuTnRCSHBPMm9zdWNtd3E2Z1Y0MGNVUEIrRGViUVk3a2E2NTEz?=
 =?utf-8?B?OWQ3bHBrenlEajBaaFBlS1E3NHhMdmRWNG1LWjJWOGh2aU92MXFGL2loMGw0?=
 =?utf-8?B?bTBxSnBIQnB5TXpYSFpIQVd6VE0xWnV4NkNDQUNMT1dBdGFjUkwxNHJkUk9S?=
 =?utf-8?B?NUFaSGRiYnkrd2dyN0FVUmNOZG54amRPbGtJYzJaNUt5cldPK043V09BTG9Q?=
 =?utf-8?B?TFU5cmJBSGJuY29yZ2cxd2tHUlNCNElkY2c4THZwbW93Z2ZSZGEva0Q4MDJn?=
 =?utf-8?B?M0F6d1pCM21DeUY2a3A4Z1UrS1V3dXpZcXdNSlYralhpR2NnTmh5aUxabWNM?=
 =?utf-8?B?ZjB5WGhUVC9IaDM0VW45REdua0JORHN4UWI2UHJRKzRmak5NUTh5UGdkVUJt?=
 =?utf-8?B?amNxbWNjcFRIeTloV0oxL2plcTZiQzNjajNiaWs4a2xDcm9TdVBWSFlzQzZV?=
 =?utf-8?B?ckJITHpYUnBkQUd1dVFsZzNBeHZXemc0c2VCUnNmVm5yY2VxZW52dTlnTGtl?=
 =?utf-8?B?TWlCK3Jmb2E5WW56QWlyV2lhUWx6cytqd01wTHFCWXVxRVhoWFhkZSt6bGsr?=
 =?utf-8?B?WTFYY0MwSUp1NUptWVN0Yng5UFNHbnNHZmszcWtaa2NjQmJScERlSzJEcXkw?=
 =?utf-8?B?YlNKZW9tQlI5eGR1bGNNZ1IrRE90SWw5Nno4NFNGZE1IZHp0OW5WN00wK1hT?=
 =?utf-8?B?Z1RQRWNvMTJvTHZLQUJ3NzhFMTY3R1JsWG1CNFluVUZac2pQR3RQTCthZVY3?=
 =?utf-8?B?NEh3U0RycmlNcW9keUZSL0JlUmdja05MOGY1aHFQUUJzY0tTaEtIRHArTjUv?=
 =?utf-8?B?QmdBZG00Qm1Oc0p0aEYvUjJTQmVJNURlUllvUGZPOEFUUzdzNGhCRWN0d0NL?=
 =?utf-8?B?Nk1Ibjgza2hqYWErVVBiVFhaSEdBYjV4T1dDT3RXQXRLcVVNMG9jbXg1Wkln?=
 =?utf-8?B?elRFeEVFUzhhMDg3c0lwME8rTHNkL3hUbC9TbDBkdDNMWDhEME93V3JnVHFm?=
 =?utf-8?B?VTdLWWJkU1dBdWcvMHJxdXp5UTEvZ3pZamo4dFJCbi9mbnc2YU4yN2JsZVB1?=
 =?utf-8?B?STZYNmRmczhaeVpKQktYYmdremU2MXRjMzlkS05JZzVsNEk0c0srRnI1bG1K?=
 =?utf-8?B?RXJWc2ZPNkdRUkVFSW5XMWRSNDUvQWdkUDFrWldKZHRzbktIVnJoVUVvMXBp?=
 =?utf-8?B?R0hNaytqdTRmNUsvUEIvb1hqR01zbVhZZWNBNlNzNlBLMHBLMkYrbFNWc1ly?=
 =?utf-8?Q?bdOmW5ZuolfPKYEp1Tv5x3N9MmxQTK37?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 11:49:04.4699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1544a3f2-f51e-4f58-1544-08dd18477b33
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_034911_383451_FAB20B4A 
X-CRM114-Status: GOOD (  14.85  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Q3VycmVudGx5LCAibWF4X2VjIiBjYW4gYmUgcmVhZCBmcm9tIHN5c2ZzLCB3aGljaCBwcm92aWRl
cyBhIGxpbWl0ZWQKdmlldyBvZiB0aGUgZmxhc2ggZGV2aWNl4oCZcyB3ZWFyLiBJbiBjZXJ0YWlu
IGNhc2VzLCBzdWNoIGFzIGJ1Z3MgaW4KdGhlIHdlYXItbGV2ZWxpbmcgYWxnb3JpdGhtLCBzcGVj
aWZpYyBibG9ja3MgY2FuIGJlIHdvcm4gZG93biBtb3JlCnRoYW4gb3RoZXJzLCByZXN1bHRpbmcg
aW4gdW5ldmVuIHdlYXIgZGlzdHJpYnV0aW9uLiBBbHNvIHNvbWUgdXNlIGNhc2VzCmNhbiB3ZWFy
IHRoZSBlcmFzZSBibG9ja3Mgb2YgdGhlIGZhc3RtYXAgYXJlYSBtb3JlIGhlYXZpbHkgdGhhbiBv
dGhlcgpwYXJ0cyBvZiBmbGFzaC4KUHJvdmlkaW5nIGRldGFpbGVkIGVyYXNlIGNvdW50ZXIgdmFs
dWVzIGdpdmUgYSBiZXR0ZXIgdW5kZXJzdGFuZGluZyBvZgp0aGUgb3ZlcmFsbCBmbGFzaCB3ZWFy
IGFuZCBpcyBuZWVkZWQgdG8gYmUgYWJsZSB0byBjYWxjdWxhdGUgZm9yIGV4YW1wbGUKZXhwZWN0
ZWQgbGlmZSB0aW1lLgpUaGVyZSBleGlzdHMgbW9yZSBkZXRhaWxlZCBpbmZvIGluIGRlYnVnZnMs
IGJ1dCB0aGlzIGluZm9ybWF0aW9uIGlzCm9ubHkgYXZhaWxhYmxlIGZvciBkZWJ1ZyBidWlsZHMu
CgpTaWduZWQtb2ZmLWJ5OiBSaWNrYXJkIEFuZGVyc3NvbiA8cmlja2FyZC5hbmRlcnNzb25AYXhp
cy5jb20+Ci0tLQogZHJpdmVycy9tdGQvdWJpL2NkZXYuYyB8IDY5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY5IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvY2Rldi5jIGIvZHJpdmVycy9tdGQvdWJp
L2NkZXYuYwppbmRleCAwZDhmMDRjZjAzYzUuLmUyZjI1ODFlOWYwOSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvdWJpL2NkZXYuYworKysgYi9kcml2ZXJzL210ZC91YmkvY2Rldi5jCkBAIC04Mjgs
NiArODI4LDY5IEBAIHN0YXRpYyBpbnQgcmVuYW1lX3ZvbHVtZXMoc3RydWN0IHViaV9kZXZpY2Ug
KnViaSwKIAlyZXR1cm4gZXJyOwogfQogCitzdGF0aWMgaW50IHViaV9nZXRfZWNfaW5mbyhzdHJ1
Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX2VjaW5mb19yZXEgX191c2VyICp1cmVxKQor
eworCXN0cnVjdCB1YmlfZWNpbmZvX3JlcSByZXE7CisJc3RydWN0IHViaV93bF9lbnRyeSAqd2w7
CisJaW50IHJlYWRfY250OworCWludCBwZWI7CisJaW50IGVuZF9wZWI7CisKKwkvKiBDb3B5IHRo
ZSBpbnB1dCBhcmd1bWVudHMgKi8KKwlpZiAoY29weV9mcm9tX3VzZXIoJnJlcSwgdXJlcSwgc2l6
ZW9mKHN0cnVjdCB1YmlfZWNpbmZvX3JlcSkpKQorCQlyZXR1cm4gLUVGQVVMVDsKKworCS8qIENo
ZWNrIGlucHV0IGFyZ3VtZW50cyAqLworCWlmIChyZXEubGVuZ3RoIDw9IDAgfHwgcmVxLnN0YXJ0
IDwgMCB8fCByZXEuc3RhcnQgPj0gdWJpLT5wZWJfY291bnQpCisJCXJldHVybiAtRUlOVkFMOwor
CisJaWYgKGNoZWNrX2FkZF9vdmVyZmxvdyhyZXEuc3RhcnQsIHJlcS5sZW5ndGgsICZlbmRfcGVi
KSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlpZiAoZW5kX3BlYiA+IHViaS0+cGViX2NvdW50KQor
CQllbmRfcGViID0gdWJpLT5wZWJfY291bnQ7CisKKwkvKiBDaGVjayBhY2Nlc3MgcmlnaHRzIGJl
Zm9yZSBmaWxsaW5nIGVyYXNlX2NvdW50ZXJzIGFycmF5ICovCisJaWYgKCFhY2Nlc3Nfb2sodXJl
cS0+ZXJhc2VfY291bnRlcnMsIChlbmRfcGViLXJlcS5zdGFydCkgKiBzaXplb2YoaW50MzJfdCkp
KQorCQlyZXR1cm4gLUVGQVVMVDsKKworCS8qIEZpbGwgZXJhc2UgY291bnRlciBhcnJheSAqLwor
CXJlYWRfY250ID0gMDsKKwlmb3IgKHBlYiA9IHJlcS5zdGFydDsgcGViIDwgZW5kX3BlYjsgcmVh
ZF9jbnQrKywgcGViKyspIHsKKwkJaW50IGVjOworCisJCWlmICh1YmlfaW9faXNfYmFkKHViaSwg
cGViKSkgeworCQkJaWYgKF9fcHV0X3VzZXIoVUJJX1VOS05PV04sIHVyZXEtPmVyYXNlX2NvdW50
ZXJzK3JlYWRfY250KSkKKwkJCQlyZXR1cm4gLUVGQVVMVDsKKworCQkJY29udGludWU7CisJCX0K
KworCQlzcGluX2xvY2soJnViaS0+d2xfbG9jayk7CisKKwkJd2wgPSB1YmktPmxvb2t1cHRibFtw
ZWJdOworCQlpZiAod2wpCisJCQllYyA9IHdsLT5lYzsKKwkJZWxzZQorCQkJZWMgPSBVQklfVU5L
Tk9XTjsKKworCQlzcGluX3VubG9jaygmdWJpLT53bF9sb2NrKTsKKworCQlpZiAoX19wdXRfdXNl
cihlYywgdXJlcS0+ZXJhc2VfY291bnRlcnMrcmVhZF9jbnQpKQorCQkJcmV0dXJuIC1FRkFVTFQ7
CisKKwl9CisKKwkvKiBSZXR1cm4gYWN0dWFsIHJlYWQgbGVuZ3RoICovCisJcmVxLnJlYWRfbGVu
Z3RoID0gcmVhZF9jbnQ7CisKKwkvKiBDb3B5IGV2ZXJ5dGhpbmcgZXhjZXB0IGVyYXNlIGNvdW50
ZXIgYXJyYXkgKi8KKwlpZiAoY29weV90b191c2VyKHVyZXEsICZyZXEsIHNpemVvZihzdHJ1Y3Qg
dWJpX2VjaW5mb19yZXEpKSkKKwkJcmV0dXJuIC1FRkFVTFQ7CisKKwlyZXR1cm4gMDsKK30KKwog
c3RhdGljIGxvbmcgdWJpX2NkZXZfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGlu
dCBjbWQsCiAJCQkgICB1bnNpZ25lZCBsb25nIGFyZykKIHsKQEAgLTk5MSw2ICsxMDU0LDEyIEBA
IHN0YXRpYyBsb25nIHViaV9jZGV2X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBp
bnQgY21kLAogCQlicmVhazsKIAl9CiAKKwljYXNlIFVCSV9JT0NFQ05GTzoKKwl7CisJCWVyciA9
IHViaV9nZXRfZWNfaW5mbyh1YmksIGFyZ3ApOworCQlicmVhazsKKwl9CisKIAlkZWZhdWx0Ogog
CQllcnIgPSAtRU5PVFRZOwogCQlicmVhazsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
