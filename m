Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCBECFD319
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pJhEOxIW1bzDkkpKMmPAoD9v75fPmOZTLUZOpk2JaWw=; b=Y0/nrBARfNTCyq
	jY55wDy97T9/xiChcRC1Z/ol+UmYCsP8fqt2nK+n8TetXrJUSjePMmw5UXX/stc7XaBec50zyD0Yp
	ViUs9Q50dG8YlPtOFjhuLsXky3FCPgJb7eDDC44Ys2071ClKyT1UKtY+3Yjt2VAUClNrWHcKwNmen
	oN1YgVrElppkRCkbZxLKtAW5ACVbcIEZOQBbcHGFF8DDXLiY0RBpkt1fudpYrZflY8JAyqneF70hg
	C3ZV4/6VHYSiGHL9A6wC+KM0IQcGow92cPjek6JUHR6nX5SXvdVzfLIgSa8ClC0gisK6VNTAMuew3
	F+UyXRfvZ2rFQS/S0vRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqr-0000000Fojs-0U4e;
	Fri, 11 Oct 2024 09:22:25 +0000
Received: from mail-db5eur02on20627.outbound.protection.outlook.com ([2a01:111:f403:2608::627] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBql-0000000Foi8-33RN
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 09:22:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCtOCqbKIiNitWgZDhcbca7sq3fOJXuME8Lp87q5y7BJ6wuTH5EsuyFXYkKJxgPLRDMAbJD8CS2J7rdr1F+kxsP47x2HeOXkRWFU5fYiFx14Js9iCHXaeHgRaUZfv0+Or7hqlpmL8yE8hH4GDqiIJhYtbVs3yw4wejEmcqe6egFSiyUddDXyajkR+Zpmktn1Xha9K0cq6/k/5sC0YnSHKSiSu4oKQMcu+ky4yPK3AYfZYcEkDWPPEfqwgJjgCTqDEqqLysAsUOy6wCV9NG0nayWoPGmajEpl/soC2JPcOEgl2Zi8A9wxdnitZMXaXMIJA/JEL0+jkilV3vpAk8ez+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h94n6Uhvlf7e4bUpurraCdq8PMVxSZA1VuskU52hQUM=;
 b=cVom4V3qsU7Pq9t/2IOiHoTlg8I84moxqrAUzJBDFv9JN3RWEdYUBAbuT/IIr1neOeOViynkiZDvUsM+cDsr6kDb/Qi6nDDhiQr9rUU1GBAGaKNVBkUlFvruGVpO2AuqL5zdCj+NK1W0pZujxmNi/YAklC1g6oAuRo2i13vo+6fU5bsJRxa9mB+f5g76Aa7PORGvQ5ei7pPloXjIh+nuwvNSiqf38jx8EiYmgpFNIwLeVw0USb4aeIa8PD7qi+wex9LmQFQdac6oqGmEkNBGErRLejRAl5zSXgZF0l95rdQSG96QaC+gYFrvC1xFjRaO7t67Q0rVvh2zp6R7echfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h94n6Uhvlf7e4bUpurraCdq8PMVxSZA1VuskU52hQUM=;
 b=QWwpBkY91WF4NPhPyzafjIyYvSJ90n2dgp2mcJTQTq9H9f61NLzEn49TSe0t1NEvAzbE7uz7s1Z6JHVBFvI0W3Mb+tOdZcv+2aPEpuoHqynNPQ6gQrDAV/bksyRynft5cDXKUqYKyFgYIubW1d+qKOJXuLRwg3LgX+NyX0Sd22w=
Received: from DB7PR05CA0059.eurprd05.prod.outlook.com (2603:10a6:10:2e::36)
 by PAWPR02MB9127.eurprd02.prod.outlook.com (2603:10a6:102:33e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Fri, 11 Oct
 2024 09:22:02 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::69) by DB7PR05CA0059.outlook.office365.com
 (2603:10a6:10:2e::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Fri, 11 Oct 2024 09:22:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 09:22:02 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 11:22:00 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 01/10] ubi: Expose mean erase counter in sysfs
Date: Fri, 11 Oct 2024 11:21:25 +0200
Message-ID: <20241011092134.2909496-1-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|PAWPR02MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: d422624b-33ec-4a01-f770-08dce9d62a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M05OcUxWYzlld3o1MTBLWWNSVmlkVW5kV3F1V0JWVGxnckJ0dEdCN0Y5dVI2?=
 =?utf-8?B?RkNJSXB6T3d5ZVJXa3RpMEFiVGJhc2tPMi94cmpHT3ZldE5QSXQyYjV0bnUz?=
 =?utf-8?B?TkFja1d4Szg0THN5aWZtalFETGpnUUJHdERpajZhNDlNZEUreUs1M2JTWkYw?=
 =?utf-8?B?dkREV0IrNWZFbDNjaGlMUmkzeGRtU2RrTmk4SERrM0VTR2VFZ2o3eVZuTnVy?=
 =?utf-8?B?YkV6SjVQdnRQdjcwNkJtc0hJcVlUYTgyRjhwU2srS2hWR2lhd21uREFJMDdB?=
 =?utf-8?B?TWc3dXdaWk9mYjhJSm1weUg3bVZDOUdXUGRuZnFUS2ZkWTlENFZBbC9LeC9n?=
 =?utf-8?B?Q3BJMHQ4cGMxL09vWTRDeFRGcEdGakFGYklqTmM5ZkVFbzY3M3lvc0VlUzdI?=
 =?utf-8?B?S1ozUCtuTXRwbXdkbGpuVVNwK3hqQWZCSWk4RTRpL3VVY1VENjV1Z09MNFRR?=
 =?utf-8?B?Zkxua2xDVTVLRzZtdTdubXVXL0swanlvRWRFNVZPTXVMUW9Xamo4VDV3NWhq?=
 =?utf-8?B?Z0FiSmtYT0F2TllKQ2h5NXgxS2t3c2JtdjEvUEFoK2YrTDh3cHhuM3FZK0py?=
 =?utf-8?B?SDlNdUZoYWxEb0tzMVM2V1RGZkNRYkVaWE5hRlM3bW5GSnZicmJGay9icWFZ?=
 =?utf-8?B?cWg0MGFIamIzKyt6T1dUSFNTamRVb1plZFRnM0t3YUEvVlUxVWcyRjBlQ2Mx?=
 =?utf-8?B?dUVxS256V0RqOG1nQ3ZVcWZtMW9KQ2kxRnIvMllGNnhZeTJYS0VPT3hvb1Qx?=
 =?utf-8?B?eVpSKzdaREJHRU42UjJlVWpEWkJhWVYzVmxhMzdkWjUwQ3hleUI4eU9iVytP?=
 =?utf-8?B?YnVZZndWU1RnRWRiRElId1UwRDJaQ05kNFdXRzBDVkZ4TElkUlQ1VWZQRFJB?=
 =?utf-8?B?eEp3bmlRTkRuVkQ3ZFlqZGZMcW4zS2xqeGFSbkhhbURCRW5FWXVhRnJyVnlV?=
 =?utf-8?B?WVkxZloxN2tYR2xLb1JLUkgvODR6MGJlSEJkdHkxVXg4RDFiejdHVDczTkwz?=
 =?utf-8?B?Z2MySFJjMEM3T3NONkVXaGhTaDNaWVZiMDU2VFRWOEVqQ0tMUURyL1dUTjc0?=
 =?utf-8?B?SFdwZTFVQmpVMHhqckNoNUYzaS9VTnRZMTlmMTdyZlNab0U0aVZsU2NzV3Nm?=
 =?utf-8?B?NFd2OGQ3OEZiajMwUEVFY0ZRQmF4eXVZdDJKU3hpYkJQU3VJSXB1N2ZtcHEy?=
 =?utf-8?B?OHR6UVNwZWZHR1hNc1VPb1p4SEZML2Q3eXlBL2Y4cHl4MyswODhFNktsR0VN?=
 =?utf-8?B?bGh5alBqM3YreDVlWkJBYldGY0VDbWNudGpiQXhoWkYzamlxN2ZVbFlKQksr?=
 =?utf-8?B?cllhdDJGbWFJWGUzWmpZcUdPNlFvdTIzL3hzLzlnZ1JxdW5XR01hdG1iZHh5?=
 =?utf-8?B?NTEyZWE3cGNIaEJqY3VBbGM4UGMyNlUwOU80QTdwVW1udVBUVEVrb2ZxUkxo?=
 =?utf-8?B?UWtvNjZpeFNsUk0yZktYM0hoQ0Z2bDc0YUpZYll3N3BCUUJveTVxTXFVZDUx?=
 =?utf-8?B?VTNsbFA2ZU5HckxqUTBXTGNnUUVGR0MzR0Y1OVdEbHlVS3pGTnBzYm0vZ052?=
 =?utf-8?B?Yi9SYXNJMWY5R2Rwd0RyNjJlK0VGL1gwTUJlaituY3NsUWRqWlROTXZqTStU?=
 =?utf-8?B?RzdRbFh0am8yTDhPRE12OTczUWFUWUY0ZFR4MXlzNGo2eHFFSXlBdFo0U0RC?=
 =?utf-8?B?YVRzSGZwUnZnUHhKMWVqcEFHbkNqa2hndDRxUktaY3l3cFBhbWxTL2NNblp4?=
 =?utf-8?B?TnJLZXdrTzN1aVoxdElWQnBGVC9yWTdjYnJqdjh4dmh6UW1UcFV6WjNMVWpW?=
 =?utf-8?B?U1hVbFp1eEhKQWpIQk5ReGx1UWxoYjNtVDIydjUxamNsL3N0KzlsVHdKSFBO?=
 =?utf-8?Q?mQ1NdvWxoQQ3Q?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 09:22:02.0946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d422624b-33ec-4a01-f770-08dce9d62a4c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_022219_803946_6AFB960D 
X-CRM114-Status: GOOD (  17.25  )
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
ZC5hbmRlcnNzb25AYXhpcy5jb20+Ci0tLQogZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgfCA0OCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQ4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYyBi
L2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCmluZGV4IGY1MTQwYTc4YTRhOC4uZmEzOGM0MzRlNDQ3
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
LTMzNyw2ICszMzksNDkgQEAgaW50IHViaV9tYWpvcjJudW0oaW50IG1ham9yKQogCXJldHVybiB1
YmlfbnVtOwogfQogCisvKioKKyAqIHViaV9jYWxjX21lYW5fZWMgLSBjYWxjdWxhdGUgbWVhbiBl
cmFzZSBjb3VudGVyIHZhbHVlLgorICogQHViaTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmpl
Y3QKKyAqIEBzdGFydF9wZWI6IEZpcnN0IFBFQiBpbiB0aGUgcmFuZ2UKKyAqIEBlbmRfcGViOiBF
bmQgUEVCIGluIHRoZSBoYWxmLW9wZW4gcmFuZ2UKKyAqCisgKiBSZXR1cm5zIHRoZSBtZWFuIHZh
bHVlIG9mIGFsbCBub24tYmFkIGJsb2NrcyBvZiB0aGUgZGV2aWNlIHRoYXQgYXJlCisgKiBpbiB0
aGUgcmFuZ2UuIFJhbmdlIGlzIGhhbGYtb3BlbiBpLmUgZW5kX3BlYiBpcyBub3QgYWN0dWFsbHkg
aW5jbHVkZWQuCisgKgorICogUmV0dXJucyB6ZXJvIGlmIGl0IHdhcyBub3QgcG9zc2libGUgdG8g
Y2FsY3VsYXRlIHRoZSBtZWFuIHZhbHVlCisgKi8KK3N0YXRpYyBpbnQgdWJpX2NhbGNfbWVhbl9l
YyhzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgc3RhcnRfcGViLCBpbnQgZW5kX3BlYikKK3sK
KwlzdHJ1Y3QgdWJpX3dsX2VudHJ5ICp3bDsKKwlpbnQgcGViOworCWludCBlY19jb3VudCA9IDA7
CisJaW50IG1lYW5fZWMgPSAwOworCXVpbnQ2NF90IGVjX3N1bSA9IDA7CisKKwlmb3IgKHBlYiA9
IHN0YXJ0X3BlYjsgcGViIDwgZW5kX3BlYjsgcGViKyspIHsKKwkJaW50IGVycjsKKworCQllcnIg
PSB1YmlfaW9faXNfYmFkKHViaSwgcGViKTsKKwkJaWYgKGVycikKKwkJCWNvbnRpbnVlOworCisJ
CXNwaW5fbG9jaygmdWJpLT53bF9sb2NrKTsKKworCQl3bCA9IHViaS0+bG9va3VwdGJsW3BlYl07
CisJCWlmICh3bCkgeworCQkJZWNfc3VtICs9IHdsLT5lYzsKKwkJCWVjX2NvdW50Kys7CisJCX0K
KworCQlzcGluX3VubG9jaygmdWJpLT53bF9sb2NrKTsKKwl9CisKKwlpZiAoZWNfY291bnQgPiAw
KQorCQltZWFuX2VjID0gZGl2X3U2NChlY19zdW0sIGVjX2NvdW50KTsKKworCXJldHVybiBtZWFu
X2VjOworfQorCiAvKiAiU2hvdyIgbWV0aG9kIGZvciBmaWxlcyBpbiAnLzxzeXNmcz4vY2xhc3Mv
dWJpL3ViaVgvJyAqLwogc3RhdGljIHNzaXplX3QgZGV2X2F0dHJpYnV0ZV9zaG93KHN0cnVjdCBk
ZXZpY2UgKmRldiwKIAkJCQkgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpi
dWYpCkBAIC0zNjYsNiArNDExLDggQEAgc3RhdGljIHNzaXplX3QgZGV2X2F0dHJpYnV0ZV9zaG93
KHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJcmV0ID0gc3ByaW50ZihidWYsICIlZFxuIiwgdWJpLT52
b2xfY291bnQgLSBVQklfSU5UX1ZPTF9DT1VOVCk7CiAJZWxzZSBpZiAoYXR0ciA9PSAmZGV2X21h
eF9lYykKIAkJcmV0ID0gc3ByaW50ZihidWYsICIlZFxuIiwgdWJpLT5tYXhfZWMpOworCWVsc2Ug
aWYgKGF0dHIgPT0gJmRldl9tZWFuX2VjKQorCQlyZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1
YmlfY2FsY19tZWFuX2VjKHViaSwgMCwgdWJpLT5wZWJfY291bnQpKTsKIAllbHNlIGlmIChhdHRy
ID09ICZkZXZfcmVzZXJ2ZWRfZm9yX2JhZCkKIAkJcmV0ID0gc3ByaW50ZihidWYsICIlZFxuIiwg
dWJpLT5iZWJfcnN2ZF9wZWJzKTsKIAllbHNlIGlmIChhdHRyID09ICZkZXZfYmFkX3BlYl9jb3Vu
dCkKQEAgLTM5Miw2ICs0MzksNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqdWJpX2Rldl9h
dHRyc1tdID0gewogCSZkZXZfdG90YWxfZXJhc2VibG9ja3MuYXR0ciwKIAkmZGV2X3ZvbHVtZXNf
Y291bnQuYXR0ciwKIAkmZGV2X21heF9lYy5hdHRyLAorCSZkZXZfbWVhbl9lYy5hdHRyLAogCSZk
ZXZfcmVzZXJ2ZWRfZm9yX2JhZC5hdHRyLAogCSZkZXZfYmFkX3BlYl9jb3VudC5hdHRyLAogCSZk
ZXZfbWF4X3ZvbF9jb3VudC5hdHRyLAotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
