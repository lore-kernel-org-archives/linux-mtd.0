Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8515CFA752
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 08:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KleLrTuqqlq9hHDN6OD0k9vEXi5PdW+W/6kquKTR6rE=; b=KobcAbhdqZeTJ3
	1FLjiQQrG3jX3Sa0gy1i+UIt//OQigjk0+7Uo+d1YIo3LD0ncn6A8m+uUlsKy1m+Z1N6ge9J5lt57
	BU3nlK9f62fFQqWiSU0eNK6uJgdbGPCyoUHZ77AZNHcx0A3XQySlXGj/CDDMAFDOWAAdplwlMr4P3
	UcfyKRC71MiNCMDPx6RidOL8FtYRnjBSdxskizS8i9NzgazhCLlqSxmA3Rviy9J7FYDmWxFc+7/0r
	+EObdoAiWhe0OsKoLwif1x9IvEn/Mzh3BqhZXFAw9BncJZxJHtOjiVrn9Ycn0lNOZtBLs6DpXd/Gi
	e1ERcYJqOwMWXIaNLQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdf3-0000000BPEp-0kK9;
	Fri, 04 Oct 2024 08:27:41 +0000
Received: from mail-db8eur05on20600.outbound.protection.outlook.com ([2a01:111:f403:2614::600] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swda9-0000000BOMR-4Aa3
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 08:22:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ww2ckOmBtf/5LO9yh0yMpmvEzTkiVbvPNWnQutXR337eTsvgX7Wor71ZRiFbxhJKo3/JCBtpmPcBQ8GRNNUmBk0OOs2udYrwFZUmRILy06qXwBN2GFxBWmNndSuaHR2KLXaGgpvhHqXqkDiQg1gG/QmMSfP06xWisA6f8rzPkxQxMXiHCcQ+/lvjh6yy1EH533wu/G/nGch3lA19ZfqcFbKEYK7JFrLfe8OdNkEdDCIHzuF3U6JSyC0VztWKvjeczQ3fUJgjNtWont46QoI40C9dP/3HHc8wPg7PLwnwFHvgZBXCOOJF4KSAETd0/Ck8ICZ6dKE3eUrhzcE50i3AWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCYBpGbwHyshd1yYGUdJ90kJ06FsUIBA4B94/qeONAE=;
 b=Fs5gEdytokv9igdPaBgNkvVsQMn4VYj7AYy8D6rB33qL/q4yQSJoiJj0bIgG+jmDgQ/UrGszNQEO4tzFphkVpS+uFsURzIpEtSdoabL4MY6CvXeyBj0ecTf+jmjDl7oI46OFpDyQNwDFasYT/tlqkBMEzzYv/23/b43FTFw28tCuSJz2lhNAENQ3Pj8FE9bu4UsMzzChIrmzzVhxEyUNK9U5ACkk07eFZdLMzsC+9W//HXsIruqRHthCYgYHzAuAuRK2b8tcI4rYSGNdD5Ar/ChwhW+Y6rh/RLS9HLqu/Sp2H3oyVbMXER6r3pl7CJEhmiieWJrfvmXB8oMCUmFERQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCYBpGbwHyshd1yYGUdJ90kJ06FsUIBA4B94/qeONAE=;
 b=TAtQLWBgZW8wk+ytZF3qf+S5lX9a1qC6MbwiWfoSBsYPLMK+IJFDPyNl7vQ+rRjaVQzSAKGyRVx+VaphiwhtapKrA2qr54xqirxP3ZfrHbVqGK8H8nlGELD0s+f8ddO6/Yr8QlmYcgDn1uQPv0CDF6McNB58Gr68aaUMmfxkYfE=
Received: from AM4PR0302CA0030.eurprd03.prod.outlook.com (2603:10a6:205:2::43)
 by DBAPR02MB6389.eurprd02.prod.outlook.com (2603:10a6:10:190::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 08:22:31 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::64) by AM4PR0302CA0030.outlook.office365.com
 (2603:10a6:205:2::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Fri, 4 Oct 2024 08:22:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Fri, 4 Oct 2024 08:22:31 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 10:22:28 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH 1/4] ubi: Expose mean erase counter in sysfs
Date: Fri, 4 Oct 2024 10:22:05 +0200
Message-ID: <20241004082208.1103202-1-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A68:EE_|DBAPR02MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ed18cd-c012-48da-6dd9-08dce44db0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUJzSlZCZGJYZmVoY3RuWERSSFFzcHhQNmdPQXl6OTBnZWhkdkZEaUtxRWtz?=
 =?utf-8?B?RDRUbEswMnpIM2dwZGJsdEZyN0VYSjN1Rk1HQWsweHdiU2s1VVZXekIwVUoy?=
 =?utf-8?B?TU5iMUpDekEyQXhCa0xZQ2JlMXFOQ3pMRlArWVNwN1IvQWtJRXZBSmZ0NThU?=
 =?utf-8?B?elExZEc0ZjN4WGZpRVZUMFNkSncvNlM4MENMRGNvYVhLWGMydU5OM0d3WVhS?=
 =?utf-8?B?ME1iSjY1NW9CUWVkLzNLUEZUY01zenpDeUpkVWxCV0VVTEM4aGRTazUwV1ht?=
 =?utf-8?B?YmRwL3pQaFhjbUd2YzRBQTltc2NDWDU0Y0R6aXpMODUzOVJzNU9lQ1h1cEpM?=
 =?utf-8?B?b0cwaWZZZ20zZWF6QmdSbGRhMVl1V2pBR0IzMFMybFcrcHV1R0FJamIxK1Bm?=
 =?utf-8?B?OWpDL0hUTzNzTFQ0V0cyRGpIUDY3K0M0Sys1N0RUOWxMUzhSMGwvT2U4ZTVa?=
 =?utf-8?B?RVVYcGNnNjRnejF4U0p2dnhqczNzaFdEY1lvV2sxQ0p4Nkd2U3RZMHdOT084?=
 =?utf-8?B?Q2NSMTU2UlFNOFJmL1cvcFFWaUhudlpDRHI1ZUVXaUNVYllUV1hqOU1wbGpB?=
 =?utf-8?B?dlZZWUVqTm82SDZIVGx5SnY0bGdDWXREaHVCalVUdlZWRFJQTXpIRDcwbVRj?=
 =?utf-8?B?VTlhUTlnQkpEa3J1eWwyeHBnTnNMWThCTURUVnNCckRtMmZkbTAyNzkwdGM1?=
 =?utf-8?B?TGFYaTV2TmhVZXMwbWRxRzZTS25QNkF0WXJ6SFlMQzZ0V3dHSnVTc3ZxZUs0?=
 =?utf-8?B?K2cvL0lFZDZhT2JJUkpWelpLNW1wdjJxdTl5YlJpbWlXWjV3Q21aRi90ZEZJ?=
 =?utf-8?B?UVBVMWRtM3JlNWcxcVBHT3pUTmdtRmc1RW5tb29DUWJaNHdhN001bXhHVnU0?=
 =?utf-8?B?TnR3K3JvLytVc2lxNCt3ZkJndU9qYzRKWjZKaWYrbWpwYkZ5SkRwQktBN2V2?=
 =?utf-8?B?eTJqQkhSSElPNXRSMEY0eCs2SVNsRW1IbzMrRjVQYmU3SUtEbkZkbE8yV1Zh?=
 =?utf-8?B?OVR0SzZNNjNpNTJsTGxGYnNmY0xaOEpKdzQ3UTBNOGFvR3VVM1BQd3YvbTJD?=
 =?utf-8?B?Q1laY1RRTzRKc0g4U25qSEFiMm5reFhaQ2hGS3plK0NSMHRBaVhtSXhubFB5?=
 =?utf-8?B?eWZGajhTM0tvbEdLanVMeURIY1Q5aXdnZDcrZEZ2aE4ySDVGOWZNM05sUVhl?=
 =?utf-8?B?bk1wandqenByQm5wK241QmxjVVE0bEdpUDNuUlVSc3RqeHdCRkhVanI2VS9l?=
 =?utf-8?B?ekVlZWUxaTRYcTArQ3lrMGhZRFhVejVhZ0FSS2hsTGFMVTNjSkRKSGFXMjdN?=
 =?utf-8?B?MmFiT21yMUN2SmdnYnYydVdRZDFDUlgvZWkyQlB1R2ErQXF3RzA0dForTEln?=
 =?utf-8?B?cldLaENNclBlYk15R1BXU21EYkFka29ORUdyaTIwVGFnUmZqNUF4R1kvVGZY?=
 =?utf-8?B?VlloYlYrQzhsOGVsNFBFZVNVbGFLbTZNdXB1dHNrejVXa0JHQ1BwMmlXOTJv?=
 =?utf-8?B?MmtUWHk0U3pMN2cyakxoc0xpNWdBemR6bnFVZ3F1MkRmK21WZzlkUDFVUCsw?=
 =?utf-8?B?cFJnVFRXNGowNVhEN3hjZHZrYkV5VXE0Zk9FVHBzdDV4RzlndnYxTkIzZkhY?=
 =?utf-8?B?VERQTm9FVmdPdmtxSFI2Q2kyL0M1VCtpSzdZYmRTWjRtbGtHMjNLVENxaHQ1?=
 =?utf-8?B?UnZmQStNTGxKcnVXOFNOYnlDV01kRmlhUFY5c0VLUG01QkYwUEZvTkVMMVVl?=
 =?utf-8?B?NzRwY05jUS9EbTlCM2FFU0RxZjlDaUh1WFZDZlZlemNPT24zQTFwbnIreTUw?=
 =?utf-8?B?RTc0TVVzRWp6Ri8rM2pMUEkxNCsvYis2N1BUZFlpMk1aeTdWY2toTGMvSHpB?=
 =?utf-8?Q?FpSgC1SIuh++a?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 08:22:31.1132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ed18cd-c012-48da-6dd9-08dce44db0eb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6389
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_012238_308901_6CC53B8B 
X-CRM114-Status: GOOD (  17.01  )
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

Q3VycmVudGx5LCBvbmx5ICJtYXhfZWMiIGNhbiBiZSByZWFkIGZyb20gc3lzZnMsIHdoaWNoIHBy
b3ZpZGVzIGEKbGltaXRlZCB2aWV3IG9mIHRoZSBmbGFzaCBkZXZpY2XigJlzIHdlYXIuIEluIGNl
cnRhaW4gY2FzZXMsIHN1Y2ggYXMKYnVncyBpbiB0aGUgd2Vhci1sZXZlbGluZyBhbGdvcml0aG0s
IHNwZWNpZmljIGJsb2NrcyBjYW4gYmUgd29ybiBkb3duCm1vcmUgdGhhbiBvdGhlcnMsIHJlc3Vs
dGluZyBpbiB1bmV2ZW4gd2VhciBkaXN0cmlidXRpb24uIFByb3ZpZGluZyBhCm1lYW4gZXJhc2Ug
Y291bnRlciB2YWx1ZSBnaXZlcyBhIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHRoZSBvdmVyYWxs
CmZsYXNoIHdlYXIuClRoZXJlIGV4aXN0cyBtb3JlIGRldGFpbGVkIGluZm8gaW4gZGVidWdmcywg
YnV0IHRoaXMgaW5mb3JtYXRpb24gaXMKb25seSBhdmFpbGFibGUgZm9yIGRlYnVnIGJ1aWxkcy4K
ClRoaXMgcGF0Y2ggY2FsY3VsYXRlcyB0aGUgbWVhbiB2YWx1ZSBvbmx5IHdoZW4gaXQgaXMgcmVx
dWVzdGVkLiBUaGlzCmNhbGN1bGF0aW9uIHR5cGljYWxseSB0YWtlcyAyLjcgbXMgZm9yIGFuIFVC
SSBkZXZpY2Ugd2l0aCA0MDkxIGJsb2NrcwpydW5uaW5nIG9uIGEgc2luZ2xlIGNvcmUgQ29ydGV4
LUE5IGF0IDc5MiBNSHouCgpTaWduZWQtb2ZmLWJ5OiBSaWNrYXJkIEFuZGVyc3NvbiA8cmlja2Fy
ZC5hbmRlcnNzb25AYXhpcy5jb20+Ci0tLQogZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgfCA0NCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQ0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYyBi
L2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCmluZGV4IDMwYmU0ZWQ2OGZhZC4uOGJkZmM1MWNhY2Ix
IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYworKysgYi9kcml2ZXJzL210ZC91
YmkvYnVpbGQuYwpAQCAtMTMxLDYgKzEzMSw4IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJp
YnV0ZSBkZXZfdm9sdW1lc19jb3VudCA9CiAJX19BVFRSKHZvbHVtZXNfY291bnQsIFNfSVJVR08s
IGRldl9hdHRyaWJ1dGVfc2hvdywgTlVMTCk7CiBzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1
dGUgZGV2X21heF9lYyA9CiAJX19BVFRSKG1heF9lYywgU19JUlVHTywgZGV2X2F0dHJpYnV0ZV9z
aG93LCBOVUxMKTsKK3N0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfbWVhbl9lYyA9
CisJX19BVFRSKG1lYW5fZWMsIFNfSVJVR08sIGRldl9hdHRyaWJ1dGVfc2hvdywgTlVMTCk7CiBz
dGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X3Jlc2VydmVkX2Zvcl9iYWQgPQogCV9f
QVRUUihyZXNlcnZlZF9mb3JfYmFkLCBTX0lSVUdPLCBkZXZfYXR0cmlidXRlX3Nob3csIE5VTEwp
Owogc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9iYWRfcGViX2NvdW50ID0KQEAg
LTM0MCw2ICszNDIsNDUgQEAgaW50IHViaV9tYWpvcjJudW0oaW50IG1ham9yKQogCXJldHVybiB1
YmlfbnVtOwogfQogCisvKioKKyAqIHViaV9jYWxjX21lYW5fZWMgLSBjYWxjdWxhdGUgbWVhbiBl
cmFzZSBjb3VudGVyIHZhbHVlLgorICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmpl
Y3QKKyAqCisgKiBSZXR1cm5zIHRoZSBtZWFuIHZhbHVlIG9mIHRoZSBhbGwgYmxvY2tzIG9mIHRo
ZSBkZXZpY2UuCisgKiBSZXR1cm5zIHplcm8gaWYgaXQgd2FzIG5vdCBwb3NzaWJsZSB0byBjYWxj
dWxhdGUgdGhlIG1lYW4gdmFsdWUuCisgKi8KK2ludCB1YmlfY2FsY19tZWFuX2VjKHN0cnVjdCB1
YmlfZGV2aWNlICp1YmkpCit7CisJc3RydWN0IHViaV93bF9lbnRyeSAqd2w7CisJaW50IHBlYjsK
KwlpbnQgZWNfY291bnQgPSAwOworCWludCBtZWFuX2VjID0gMDsKKwl1aW50NjRfdCBlY19zdW0g
PSAwOworCisJZm9yIChwZWIgPSAwOyBwZWIgPCB1YmktPnBlYl9jb3VudDsgcGViKyspIHsKKwkJ
aW50IGVycjsKKworCQllcnIgPSB1YmlfaW9faXNfYmFkKHViaSwgcGViKTsKKwkJaWYgKGVycikK
KwkJCWNvbnRpbnVlOworCisJCXNwaW5fbG9jaygmdWJpLT53bF9sb2NrKTsKKworCQl3bCA9IHVi
aS0+bG9va3VwdGJsW3BlYl07CisJCWlmICh3bCkgeworCQkJZWNfc3VtICs9IHdsLT5lYzsKKwkJ
CWVjX2NvdW50Kys7CisJCX0KKworCQlzcGluX3VubG9jaygmdWJpLT53bF9sb2NrKTsKKwl9CisK
KwlpZiAoZWNfY291bnQgPiAwKQorCQltZWFuX2VjID0gZGl2X3U2NChlY19zdW0sIGVjX2NvdW50
KTsKKworCXJldHVybiBtZWFuX2VjOworfQorCiAvKiAiU2hvdyIgbWV0aG9kIGZvciBmaWxlcyBp
biAnLzxzeXNmcz4vY2xhc3MvdWJpL3ViaVgvJyAqLwogc3RhdGljIHNzaXplX3QgZGV2X2F0dHJp
YnV0ZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJCQkgIHN0cnVjdCBkZXZpY2VfYXR0cmli
dXRlICphdHRyLCBjaGFyICpidWYpCkBAIC0zNjksNiArNDEwLDggQEAgc3RhdGljIHNzaXplX3Qg
ZGV2X2F0dHJpYnV0ZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJcmV0ID0gc3ByaW50Zihi
dWYsICIlZFxuIiwgdWJpLT52b2xfY291bnQgLSBVQklfSU5UX1ZPTF9DT1VOVCk7CiAJZWxzZSBp
ZiAoYXR0ciA9PSAmZGV2X21heF9lYykKIAkJcmV0ID0gc3ByaW50ZihidWYsICIlZFxuIiwgdWJp
LT5tYXhfZWMpOworCWVsc2UgaWYgKGF0dHIgPT0gJmRldl9tZWFuX2VjKQorCQlyZXQgPSBzcHJp
bnRmKGJ1ZiwgIiVkXG4iLCB1YmlfY2FsY19tZWFuX2VjKHViaSkpOwogCWVsc2UgaWYgKGF0dHIg
PT0gJmRldl9yZXNlcnZlZF9mb3JfYmFkKQogCQlyZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1
YmktPmJlYl9yc3ZkX3BlYnMpOwogCWVsc2UgaWYgKGF0dHIgPT0gJmRldl9iYWRfcGViX2NvdW50
KQpAQCAtMzk1LDYgKzQzOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICp1YmlfZGV2X2F0
dHJzW10gPSB7CiAJJmRldl90b3RhbF9lcmFzZWJsb2Nrcy5hdHRyLAogCSZkZXZfdm9sdW1lc19j
b3VudC5hdHRyLAogCSZkZXZfbWF4X2VjLmF0dHIsCisJJmRldl9tZWFuX2VjLmF0dHIsCiAJJmRl
dl9yZXNlcnZlZF9mb3JfYmFkLmF0dHIsCiAJJmRldl9iYWRfcGViX2NvdW50LmF0dHIsCiAJJmRl
dl9tYXhfdm9sX2NvdW50LmF0dHIsCi0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
