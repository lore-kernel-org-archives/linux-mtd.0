Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34CAD6E2CA
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kc7Qsy1H0fOtCtL4Yi42ol7lUIxJVS0Jd9FvaluEEc=; b=qDVeGgirJEDcRb
	aLpd82JypvmvgIttr9uqbJeV/fd3oTi6MLPDx7j4gqC3UkSbg1OZruUtTyXPwhtJVfYw+lu1ddsEo
	iDYflnPeKvP8+0747lBV1C2DDskoQTatLeR/GtN0eJTYX0pxsHqt0yaVwBeKhoycGQwD6ErqIHKzV
	u4CFTDlaeEUeQLp9vtw+Fb63dLgeeKTxgnnsthbktDAMNOl5Kkg9ieW8l2jf3v1z1Dxakj+Gxg9Zt
	YF/Qxxt+ZvdBDRctvlcZcp3UByrcks4uhvrhiAyT4rFpSFfvbTf4XhWDYVckv28/rJRZ9limFDW/R
	TsJa4Z+W9o8hE6Ot/shQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4KZ-0000000HLVr-1Umi;
	Thu, 21 Nov 2024 10:22:35 +0000
Received: from mail-vi1eur05on20624.outbound.protection.outlook.com ([2a01:111:f403:2613::624] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4KW-0000000HLTY-0ap6
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 10:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2YCbUUJXhMwJo/Fl6cJA1SuB3XLFP6+HEVTVY6dsuRDmsi5t5UuBjj+30zBqYaoIc3Y1wAyv6cQOLfXAKZUpE9BFa+BDBTHGyFN4SGcEtIX9jrlVnGrAiAcLKug300qKn/qwwrJBnKZCUK/mqGdETGDYSjM4AFf+5MsR7qhdYFtGME6BcMXGzGj939EI8zBxj5HDi1oO9g5iMffPUZerbNAvXYaMPId/FOS/OUM9oSpvr6mSlXNQoau0v5fGOsBUrx3tQsFTJIg1ZS15aM9PpU1SuRnJ/JzOUMhkotqEAqpI6CBpWg1eL72WYVtGSwwI7warTAfoD3o636HTqAgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhy1bDaYWVEHsyq4boKtbxJxqQRLwr480VdS7K2vOUA=;
 b=zLy7ImUXS2m7kPvlXhiw8tMBkPH3hCDDCj/ZXsOujVfgr+YGhZ50omjF3DCRn+4yuvk/wpWZYh2opIa+oCteeptv5DQ2hz6sg85m8pouwvv1nHz5VO4vuwegwW2XVG2Blds8L8e9faYRxuUdkfveUdELRom4h9GAUZmlOBHfA+zkffRnf/Jjua1z6c/gggyOlBMzAhJK728mavWDRVaT0RgjGZR0cwei1YpV7ZOt/EupC3Iwp5Lqtwmu+NhAidpTB0NeuNZ4LvxOPWNB79cAk4rtdppeaQBIeYDwGU+YVYyDucKdjXTe8SOT/tmZMghKKzehlTcppMyUfGUTxDPriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhy1bDaYWVEHsyq4boKtbxJxqQRLwr480VdS7K2vOUA=;
 b=ECb4kNz//gH01PUmH6JsYB1imSAByLTGMcwTAuRRoWaJbtQiRW3Psp2SMbBKexYsSj9lqP0gsFfS5+CexsERBIpPEcbTSAzgBB1H111iLIxC8U2AO4Ci2KDZYM1VmPg4BM0XJO3tZgZCaDLSNv9NvBF1A1UHuPZos04/80vzl2s=
Received: from DB7PR05CA0058.eurprd05.prod.outlook.com (2603:10a6:10:2e::35)
 by DB9PR02MB7145.eurprd02.prod.outlook.com (2603:10a6:10:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Thu, 21 Nov
 2024 10:22:23 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::50) by DB7PR05CA0058.outlook.office365.com
 (2603:10a6:10:2e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend
 Transport; Thu, 21 Nov 2024 10:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 10:22:23 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 11:22:22 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH 2/2] ubi: Implement 'UBI_IOCECNFO' for reading erase counters
Date: Thu, 21 Nov 2024 11:21:57 +0100
Message-ID: <20241121102157.3498056-2-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241121102157.3498056-1-rickard.andersson@axis.com>
References: <20241121102157.3498056-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|DB9PR02MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e9db07-74b2-49e5-e609-08dd0a1663c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm96UllpQlhsaFRVRW14R2Z6MWc2KzVxa1c5bGVuUnNxNkVFUEtGSGR3ajFQ?=
 =?utf-8?B?YmQwTW9tekJ0VDF6OWRwdXZSVzNTUXFhR3NWaldtcWxSOWgrN0VwT3pGQWxo?=
 =?utf-8?B?ZEU4VzRMNHRjOGhva3dSOWRnZktTUW43RWtpU3ZmWmxDTHQ0aWF5Zlo3TElt?=
 =?utf-8?B?V0t3b0tUTURMOXFFYlNDZWw4azhueUxxNWVkOEx3SzhMbFZGd041TFNrOUhK?=
 =?utf-8?B?L2xRNjJNNVRlcEtMRDVibVpXODJnYWV5UElxOHN0U05nU1QyNU02c3g3S1dx?=
 =?utf-8?B?SGM4MW9LZVlna2pVcHJtcWZDZ2prbThDY1UxbUFYa0ZPYi94UmlQYlRRcFVa?=
 =?utf-8?B?elFHZ0dWZmRZQ0gvTnVkcWM2SC91SXhrb0k4NWgvMUd3VUZVOXMrakpYaHdv?=
 =?utf-8?B?alZPYWdMWWlKS2hPVmtWU0hST3krTzRna3MxeXltZ3JEWHdjdHlpTzAxQjY0?=
 =?utf-8?B?Wm9xcUhQUW4xWDk5eXJ0ZUJEUFI3OW1UbkRCT1B5OVFWWng5VU9wRTZDQStJ?=
 =?utf-8?B?Y1BzR3R4MjZaNXYzeW5hU2xMQzcxSGNBRVRMazVIQVV5d1M5RWszcjBrU3VR?=
 =?utf-8?B?MytTUHMzTlozTWJSY3UxOWpLRHN1RnFHVU9hVlFyY3lWb0sxOHFtSUNQSWZN?=
 =?utf-8?B?RktUbjhYOEZoQ2ptNWJjV3piUHQrVGlHVSszays3eWQzdmEzRE0zMTVOOWVr?=
 =?utf-8?B?TTJiNmhSb2xTd09EMjZqSUNLbjNlQXVtOVhIQXZrMFpCbEpwWldVd2FDdlE5?=
 =?utf-8?B?WWFyRFA2bm92WWpCRjdVcm4zYTh4Z3gxaVYwMTQrZFAvMEpHNjUzaW54c2FM?=
 =?utf-8?B?dnBhVi9pcVlETWtqVERZVEYyNmFQUzA3ZW9xVUxkUFVHZS9jUm0zcnZ0dkU0?=
 =?utf-8?B?MklRVFptNWtoMFdmdVdMOFFEQmtnWlB5d2Urc1F2SWtyVEtISTVtM1cxYzRh?=
 =?utf-8?B?NVZkRFkyRzZzcXlacjA5Z0RFbklOcmEweWZFb0ZxZzVMajNIVWVabXl3cUpO?=
 =?utf-8?B?SzRqNzc1WkVhUUZ0d28vVy8xQ1BnK2g3Nm5uaDVSa1dHTGkyNmR0T3YwMFRV?=
 =?utf-8?B?TEQ0em5FVXllSVVHdEZ1dHdvSTYwTDEyWXBJcmx5WFdiM0cvKzRDVzVoRFlW?=
 =?utf-8?B?Qjd6VnplS3RNNTdOZGhBTkRXMEc1L1FSTjJaNkpKMXJWTEwvaGt6eUFvOVQw?=
 =?utf-8?B?MmlnQkFFelI5b3E3R2xaOFU3ZmdIN0J4WlhJOVN3dmhCQi9GcUtvRVE4bGpx?=
 =?utf-8?B?bzRSbzc1TjBETVgzaDNkeXJYOW5zdmtIVWRUZEV1bGp0eS9rcGRqSTZ5azBS?=
 =?utf-8?B?V1l1ZWZvV0VLQ2pxMFBzK0xkZGhVOW8vVFFOMVI1Y2N0SGxrMVN1K3M0QlN5?=
 =?utf-8?B?QjBndXFabWRselRkSnhaVE9HT09lc3pCSHlSQjJZQWt3NXdvRThEWkFmb3VQ?=
 =?utf-8?B?Y1pUYWVUcGs2MkZwTWhkeWFUN2E1TUsvdFJvbHNIaElzU2dGbVI5MGFaZllR?=
 =?utf-8?B?QnVKMldsZHVHKy9GL2QrQkgvS3lEY3ZIRUtsVWE4SThNNFZCZVRaL202dmlq?=
 =?utf-8?B?OHlhK0EwOVdkUjBaN1ZEQW90M0dFOGFmck5YekNKbk5seDg0YjJMRHU0YXJ1?=
 =?utf-8?B?NXhmS3NEWmtUa2J2N3BvQmFnQ2VYVmZlMEwzb0ZYOXpOTXhHeDdqM0puajZX?=
 =?utf-8?B?V3FXdFo5c2I3S1F5TUJua1dLeDU2d1RqT1NDbGdYUEZSazNVWHA5R0NDSVNs?=
 =?utf-8?B?RC9XbkRqaUFXaW9HaVBKK2VQdmdWQ0xnVm1BT1VrejFZNWhrYlNuM04wZFQ0?=
 =?utf-8?B?dGFyNDlsQTJhMjlCWWYrV3dnOWlTYXJubXdLclQzSUc4QU1mbVg4azRrQXR0?=
 =?utf-8?B?Z2dZMDVueUpjMFhZdDZKbWZ6bnU3VHZnMmxnNVpqZG14anc9PQ==?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 10:22:23.5103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e9db07-74b2-49e5-e609-08dd0a1663c4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_022232_289239_4F32DA66 
X-CRM114-Status: GOOD (  17.91  )
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
dGluZyBpbiB1bmV2ZW4gd2VhciBkaXN0cmlidXRpb24uIFByb3ZpZGluZwptZWFuIGVyYXNlIGNv
dW50ZXIgdmFsdWVzIGdpdmUgYSBiZXR0ZXIgdW5kZXJzdGFuZGluZyBvZiB0aGUgb3ZlcmFsbApm
bGFzaCB3ZWFyLgpUaGVyZSBleGlzdHMgbW9yZSBkZXRhaWxlZCBpbmZvIGluIGRlYnVnZnMsIGJ1
dCB0aGlzIGluZm9ybWF0aW9uIGlzCm9ubHkgYXZhaWxhYmxlIGZvciBkZWJ1ZyBidWlsZHMuCgpU
aGlzIHBhdGNoIGNhbGN1bGF0ZXMgdGhlIG1lYW4gYW5kIG1heCB2YWx1ZXMgb25seSB3aGVuIHRo
ZXkgYXJlCnJlcXVlc3RlZC4gVGhpcyBjYWxjdWxhdGlvbiB0eXBpY2FsbHkgdGFrZXMgMi43IG1z
IGZvciBhbiBVQkkgZGV2aWNlCndpdGggNDA5MSBibG9ja3MgcnVubmluZyBvbiBhIHNpbmdsZSBj
b3JlIENvcnRleC1BOSBhdCA3OTIgTUh6LgoKU2lnbmVkLW9mZi1ieTogUmlja2FyZCBBbmRlcnNz
b24gPHJpY2thcmQuYW5kZXJzc29uQGF4aXMuY29tPgotLS0KIGRyaXZlcnMvbXRkL3ViaS9jZGV2
LmMgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJp
L2NkZXYuYyBiL2RyaXZlcnMvbXRkL3ViaS9jZGV2LmMKaW5kZXggMGQ4ZjA0Y2YwM2M1Li4yYjM1
NDU4MjY2MDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3ViaS9jZGV2LmMKKysrIGIvZHJpdmVy
cy9tdGQvdWJpL2NkZXYuYwpAQCAtODI4LDYgKzgyOCw3NSBAQCBzdGF0aWMgaW50IHJlbmFtZV92
b2x1bWVzKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksCiAJcmV0dXJuIGVycjsKIH0KIAorc3RhdGlj
IGludCB1YmlfZ2V0X2luZm8oc3RydWN0IHViaV9kZXZpY2UgKnViaSwgdm9pZCBfX3VzZXIgKmFy
Z3ApCit7CisJc3RydWN0IHViaV9lY2luZm9fcmVzIGluZm87CisJc3RydWN0IHViaV93bF9lbnRy
eSAqd2w7CisJaW50IHBlYjsKKwlpbnQgZWNfY291bnQgPSAwOworCWludCBlY19jb3VudF9mYXN0
bWFwID0gMDsKKwl1aW50NjRfdCBlY19zdW0gPSAwOworCXVpbnQ2NF90IGVjX3N1bV9mYXN0bWFw
ID0gMDsKKwlpbnQgbWF4X2VjID0gMDsKKwlpbnQgbWF4X2VjX2RhdGEgPSAwOworI2lmZGVmIENP
TkZJR19NVERfVUJJX0ZBU1RNQVAKKwljb25zdCBib29sIGZhc3RtYXAgPSB0cnVlOworI2Vsc2UK
Kwljb25zdCBib29sIGZhc3RtYXAgPSBmYWxzZTsKKyNlbmRpZgorCW1lbXNldCgmaW5mbywgMCwg
c2l6ZW9mKGluZm8pKTsKKworCWZvciAocGViID0gMDsgcGViIDwgdWJpLT5wZWJfY291bnQ7IHBl
YisrKSB7CisJCWludCBlcnI7CisKKwkJLyoKKwkJICogV2UgaGF2ZSBsb29wZWQgdGhyb3VnaCB0
aGUgZmFzdG1hcCBibG9ja3MsIGxldHMgc3RvcmUgZmFzdG1hcCBkYXRhIGlmCisJCSAqIGZhc3Rt
YXAgaXMgZW5hYmxlZC4KKwkJICovCisJCWlmIChmYXN0bWFwICYmIHBlYiA9PSBVQklfRk1fTUFY
X1NUQVJUKSB7CisJCQllY19zdW1fZmFzdG1hcCA9IGVjX3N1bTsKKwkJCWVjX2NvdW50X2Zhc3Rt
YXAgPSBlY19jb3VudDsKKwkJCWluZm8ubWVhbl9lY19mYXN0bWFwID0gZGl2X3U2NChlY19zdW1f
ZmFzdG1hcCwgZWNfY291bnRfZmFzdG1hcCk7CisJCQlpbmZvLm1heF9lY19mYXN0bWFwID0gbWF4
X2VjOworCQl9CisKKwkJZXJyID0gdWJpX2lvX2lzX2JhZCh1YmksIHBlYik7CisJCWlmIChlcnIp
CisJCQljb250aW51ZTsKKworCQlzcGluX2xvY2soJnViaS0+d2xfbG9jayk7CisKKwkJd2wgPSB1
YmktPmxvb2t1cHRibFtwZWJdOworCQlpZiAod2wpIHsKKwkJCWVjX3N1bSArPSB3bC0+ZWM7CisJ
CQllY19jb3VudCsrOworCisJCQlpZiAobWF4X2VjIDwgd2wtPmVjKQorCQkJCW1heF9lYyA9IHds
LT5lYzsKKwkJCWlmIChmYXN0bWFwICYmIChwZWIgPj0gVUJJX0ZNX01BWF9TVEFSVCkgJiYgKG1h
eF9lY19kYXRhIDwgd2wtPmVjKSkKKwkJCQltYXhfZWNfZGF0YSA9IHdsLT5lYzsKKwkJfQorCisJ
CXNwaW5fdW5sb2NrKCZ1YmktPndsX2xvY2spOworCX0KKworCWlmIChlY19jb3VudCA+IDApIHsK
KwkJaW5mby5tYXhfZWMgPSBtYXhfZWM7CisJCWluZm8ubWVhbl9lYyA9IGRpdl91NjQoZWNfc3Vt
LCBlY19jb3VudCk7CisKKwkJaWYgKGZhc3RtYXAgJiYgKGVjX2NvdW50ID4gZWNfY291bnRfZmFz
dG1hcCkpIHsKKwkJCWluZm8ubWVhbl9lY19kYXRhID0gZGl2X3U2NChlY19zdW0gLSBlY19zdW1f
ZmFzdG1hcCwKKwkJCQkJCSAgICBlY19jb3VudCAtIGVjX2NvdW50X2Zhc3RtYXApOworCQkJaW5m
by5tYXhfZWNfZGF0YSA9IG1heF9lY19kYXRhOworCQl9CisJfQorCisJaWYgKGNvcHlfdG9fdXNl
cihhcmdwLCAmaW5mbywgc2l6ZW9mKGluZm8pKSkKKwkJcmV0dXJuIC1FRkFVTFQ7CisKKwlyZXR1
cm4gMDsKK30KKwogc3RhdGljIGxvbmcgdWJpX2NkZXZfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUs
IHVuc2lnbmVkIGludCBjbWQsCiAJCQkgICB1bnNpZ25lZCBsb25nIGFyZykKIHsKQEAgLTk5MSw2
ICsxMDYwLDEyIEBAIHN0YXRpYyBsb25nIHViaV9jZGV2X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxl
LCB1bnNpZ25lZCBpbnQgY21kLAogCQlicmVhazsKIAl9CiAKKwljYXNlIFVCSV9JT0NFQ05GTzoK
Kwl7CisJCWVyciA9IHViaV9nZXRfaW5mbyh1YmksIGFyZ3ApOworCQlicmVhazsKKwl9CisKIAlk
ZWZhdWx0OgogCQllcnIgPSAtRU5PVFRZOwogCQlicmVhazsKLS0gCjIuMzAuMgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
