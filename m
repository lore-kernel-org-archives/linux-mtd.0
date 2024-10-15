Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39450D1F9C0
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2024 18:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:Message-ID
	:In-Reply-To:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMZegMQ4jCnI8j2JA5MHeKwekqzRktqLYqPDj075w+Q=; b=gNpbf2Gm6XJQNO
	R+2mihHB0n9Fr8ZNbOzohAG1mJnikSckd67P5RSAICIVH65SE0NXfJbMsgkDMupQiyxKlAGY0tB9d
	YvCaGzbJHx0FkgoLIoSJ5nlVkwi+Lv/EGzv2M5C5FzADXoavJ3QqIDNo/R6TUXUDyEc/uAQwXepg8
	5y22uhQEoO04GdL+09MKOOoBs6z/EktQiGh744k4lRuGVWWUUN2zw4BAVS8tcZWC+KouAZA32iWpH
	KGzdrL1jKng9FBnSQkRszNswfoZAaNTf4zZHcgz9fZzDgVmadQwcAeSTTdzq/O9GAdU3Br7Zu+RrV
	gbSr489oWbHpJzzAe3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mhM-00000009IXG-1DMG;
	Tue, 15 Oct 2024 18:55:12 +0000
Received: from mail-am6eur05on2061c.outbound.protection.outlook.com ([2a01:111:f403:2612::61c] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mf1-00000009Hna-0pEr
	for linux-mtd@lists.infradead.org;
	Tue, 15 Oct 2024 18:52:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVQ7tlp9HOVKocps6QQroqh8ffLgjM3K9UVEJn0P5Pv/0u0ayLxmKZhm/MKc2JiGm4GONqXLS6UXDbdpAxM/hJgtM/RZctpXqdsYEHFtOJltmGYRoNRaWlLmWbxOnaCafvVipWGwe3yxWTSVYgLXrF77iRZqJwcFQRYgAYC6iFWotJ0DGI2ufrqlDZBgeTJeWeJR7ObdqJn8w+lNC/4l9d+UCSXXXvUwYZDPVW6VSddUkxjUKUM8mv8mz4PtlR3Mv05CXO9O+GY7YihqgV1VwkDu5LuZmrjCob/vaiER1Gite8fjCiqiNmJIEnc2faZx96DA0hyu5KgptYCkRkoJnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTL2LBDbL0qc5ThRNA3ur1lSmI82842LeIXvRQ5M0fA=;
 b=kX9eQySELmIHF9tMqvw8xWc4h+UrjPkegcAOxktXnkRp9p/qb6Om/khycOCUw0uot24iivrnyJ3weknm4bCQWvzSUZz4Qvvc/qLVRPQXJHc5pI/RUNKDEuEn//pNmTDnVeeaM5DEmBUoZz0rScZN0n0QkvsWfMsWsQenVCrOMtKvwJjtYU1HO/1BmhjsOvHtgqEVNXODLwvFpZAob6NhDjXA2MEY6772nbPJVQ+fx7ssJeL2f0lN8g3v9HNAYVf0C1r3yA79w7shAGMyGkvb1Ktgr/WoFBk7N8t0HxAxzW0MNT+w70pGTazhvPQs6GOkJ9mAJJwFkQn5KXrr5TInfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTL2LBDbL0qc5ThRNA3ur1lSmI82842LeIXvRQ5M0fA=;
 b=XEDj9uO5oiPked4zSHfi2tN+HVj8HYTba+161XDjpcv0slAhLvpDpWIoowGVgmFGmBEyCsa9hN4SbRVOOJBIKUXyAVZxqsliUSoJdkTQ+pviIVVxjr4kx/Y/NdSyNJAfjoYwUQDfojrckZZcvSBJdaHXzL8lu3ySw4s4VMRfsok=
Received: from AS9PR07CA0044.eurprd07.prod.outlook.com (2603:10a6:20b:46b::30)
 by AS2PR02MB8885.eurprd02.prod.outlook.com (2603:10a6:20b:554::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 18:52:38 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:46b:cafe::29) by AS9PR07CA0044.outlook.office365.com
 (2603:10a6:20b:46b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17 via Frontend
 Transport; Tue, 15 Oct 2024 18:52:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.1 via Frontend Transport; Tue, 15 Oct 2024 18:52:38 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Oct
 2024 20:52:37 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
CC: Richard Weinberger <richard@nod.at>, Sascha Hauer
	<s.hauer@pengutronix.de>, <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
In-Reply-To: <5173d3d2-4a6b-8b0b-c8f7-8034c9763532@huawei.com> (Zhihao Cheng's
	message of "Sat, 12 Oct 2024 20:30:17 +0800")
Message-ID: <pnd7ca9r0pt.fsf@axis.com>
References: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
	<5173d3d2-4a6b-8b0b-c8f7-8034c9763532@huawei.com>
Date: Tue, 15 Oct 2024 20:52:37 +0200
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|AS2PR02MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a32d8c-5376-4eab-fef1-08dced4a8a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkRKYWJnYzlMdFVML2FaSTNLbzlrMUZ0U0pJNmo2R3dnaUQ4M0N4K1lod1R5?=
 =?utf-8?B?Q2s0YW9lWjk4OFc4WjJDNFRCR1ZtQTVQWVlML2IxOWNwMUhMbDFhSDdyZHhQ?=
 =?utf-8?B?VzdhWkVHZ3d2dWpERjUxeit5c3JOZXM4L1ZWeXVCanY3VVAxUzlHeUxHRm9a?=
 =?utf-8?B?TXoxZm01bTRGdmRFZlIxM2FQZ0dFblZWL0lSOW9rTnpIL1lUWUxLeE4vcUdq?=
 =?utf-8?B?dFJsNUttODk5azB2QjZoZ1RxMGlWdzlyWWhmYzhnejU1Q1FZRUhvS2VHMkhu?=
 =?utf-8?B?LzRHSWt5S1l2MDZXeVdLN2J1ak9wU3d3TDRTWmlnZnVaUUlHMG43Umsvdkxn?=
 =?utf-8?B?Qll0WlNXY3JsMmVUNlRrNDNrd3o1KzIxcG5QOXd4dGE0Tmc2dFFIQzB0TFc4?=
 =?utf-8?B?VlA4UkZKUFN0a2NFWWRrbDlrL3RtbjJUOTBLeVRpQkYxbzAwU0VNYkg1djd6?=
 =?utf-8?B?UStGQTU0U1VYZVIya3hRR2pTNmtQSGZHR0lid1pWL0JjekY4bERkejh6Sk5O?=
 =?utf-8?B?Y2cvTWJodThwZzc1ZUZjdTNsVWs2OGRlc1o5L0FPMlZKejFneUpWZ1VYVm5v?=
 =?utf-8?B?Mm5LQmt3UFp1WktsVXZocXVHVjg1dnlEOTlBT3RNeUpDMkRGZGJNQy84NkVW?=
 =?utf-8?B?T0VqZ1hFYkNWcUN4OFl2Q2lrMzNZM3Q1YUNrUnZBWHZFNlRBSk9mRjdOSVVZ?=
 =?utf-8?B?bURsRXVHOVVxa1I1aXBxRTE5bDVXNzB5MEJMaDByendrbXFHNC9uR3RyUUho?=
 =?utf-8?B?dWtoVTdCemN2bzBrbUtMMG92OFNLNEFmOVdNSGFnNlkyQkNwblp2d0RZeTRK?=
 =?utf-8?B?TEx1aDVxekhjdlo1K0E0OUgydlhBM09EQ0JnK1ZQOU1ud1BQNUNYTHI1Q0Iv?=
 =?utf-8?B?WVh3bWwwQkQrbDFxc3dCSTBjY3Q3cFZoNjNIaDVCV2V4NVU1MExwVlRHdFNX?=
 =?utf-8?B?R2dEcUVjQXdOWHhsNEVBVHdHZ3dTMEJmSTV2anlnRHd3VEErNjVjZjRVTmMr?=
 =?utf-8?B?NmZSQ1Z5eERPb3pyYnNmay84UW5OdFZlMDZiREpGcW1CaVNYa29KY202Vkoz?=
 =?utf-8?B?NGcwWE0xWGNUTnYwdngzdmhEY0UzNzh4SmRvSDQxSDZ0elR4UjdkRXVMRkRR?=
 =?utf-8?B?Q3ZJUkxqWERhVk9jaUx5bUdnbjg1UkRyeTBZcEpUQ3Vhd24vM2czd2JtRnVT?=
 =?utf-8?B?UGp0WWl6L2E1YUtiTGd5dUUwcHZJd2pqQVdCa1Z0Y1kvRytza0dUVmo2dHU5?=
 =?utf-8?B?alZlb3BGL3pzS3NiY2p5VVpTOEcxNDNNWS9HcmowQzVHRzNMdFpqcUxGM0k3?=
 =?utf-8?B?Qm1oUnBrb0V3YkZic1huai9DWjlZNExFMlRrTUgxMGZiNjBqbGVjcW5PbFV4?=
 =?utf-8?B?cDVFMEthV1ZaNVRCMEd0dGFsbmxidW80VHhEMldMMTMyQnByMGxHVXZESlZP?=
 =?utf-8?B?L2kySlhscWpIclB5MU9NbWE3Y1dObmRMR0tsQUNEeVVHVjhubUJseG9tMVJJ?=
 =?utf-8?B?SGJtdTdKZHVKRDRWMDhZWlpzK1hPWkpCK05pYVZEMm5zQkV0Y2xJQUpBMkQv?=
 =?utf-8?B?czFaUWpxazlhMDhsTTUyL1k0dzlTMlhHNE81OHpidXY1a1JoRDBEV1ZLOC9K?=
 =?utf-8?B?Zm0rR1B4b0lSK3phdVBjT0Y0V2xJcjdVUlR4QUM5VHFUMEF3UzFkM3MyUHQ1?=
 =?utf-8?B?c0txZGFiR2F6TE5HNS9KMVcxSjQzalN5SjBLbzZ0RXNnMzVhOXpTbE53NnhN?=
 =?utf-8?B?b1NLWFJiVHlnQWN0QS9TWWRpdjJDSlhzdUwrWjV2UmVsQ3RkUEFtNWh4VzJI?=
 =?utf-8?B?WjROalJZUjIrSjBQUy96VzQxbm4wMUxPWWVxM2R6bEZJdWhKRGpKWkhzSWFv?=
 =?utf-8?Q?shof5qyipvZFb?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 18:52:38.2504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a32d8c-5376-4eab-fef1-08dced4a8a45
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB8885
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_115247_464909_8D3FD0C7 
X-CRM114-Status: GOOD (  26.83  )
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

T24gU2F0LCBPY3QgMTIsIDIwMjQgYXQgMjA6MzAgKzA4MDAgWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cgo+IOWcqCAyMDI0LzEwLzkgMjI6NDYsIFdhcWFyIEhh
bWVlZCDlhpnpgZM6Cj4+IFJ1bm5pbmcKPj4gICAgcm0gLWYgL2V0Yy90ZXN0LWZpbGUuYmluCj4+
ICAgIGRkIGlmPS9kZXYvdXJhbmRvbSBvZj0vZXRjL3Rlc3QtZmlsZS5iaW4gYnM9MU0gY291bnQ9
NjAgY29udj1mc3luYwo+PiBpbiBhIGxvb3AsIHdpdGggYENPTkZJR19VQklGU19GU19BVVRIRU5U
SUNBVElPTmAsIEtBU0FOIHJlcG9ydHM6Cj4+ICAgIEJVRzogS0FTQU46IHVzZS1hZnRlci1mcmVl
IGluIHViaWZzX3RuY19lbmRfY29tbWl0KzB4YTVjLzB4MTk1MAo+PiAgICBXcml0ZSBvZiBzaXpl
IDMyIGF0IGFkZHIgZmZmZmZmODAwYTNhZjg2YyBieSB0YXNrIHViaWZzX2JndDBfMjAvMTUzCj4+
ICAgIENhbGwgdHJhY2U6Cj4+ICAgICBkdW1wX2JhY2t0cmFjZSsweDAvMHgzNDAKPj4gICAgIHNo
b3dfc3RhY2srMHgxOC8weDI0Cj4+ICAgICBkdW1wX3N0YWNrX2x2bCsweDljLzB4YmMKPj4gICAg
IHByaW50X2FkZHJlc3NfZGVzY3JpcHRpb24uY29uc3Rwcm9wLjArMHg3NC8weDJiMAo+PiAgICAg
a2FzYW5fcmVwb3J0KzB4MWQ4LzB4MWYwCj4+ICAgICBrYXNhbl9jaGVja19yYW5nZSsweGY4LzB4
MWEwCj4+ICAgICBtZW1jcHkrMHg4NC8weGY0Cj4+ICAgICB1Ymlmc190bmNfZW5kX2NvbW1pdCsw
eGE1Yy8weDE5NTAKPj4gICAgIGRvX2NvbW1pdCsweDRlMC8weDEzNDAKPj4gICAgIHViaWZzX2Jn
X3RocmVhZCsweDIzNC8weDJlMAo+PiAgICAga3RocmVhZCsweDM2Yy8weDQxMAo+PiAgICAgcmV0
X2Zyb21fZm9yaysweDEwLzB4MjAKPj4gICAgQWxsb2NhdGVkIGJ5IHRhc2sgNDAxOgo+PiAgICAg
a2FzYW5fc2F2ZV9zdGFjaysweDM4LzB4NzAKPj4gICAgIF9fa2FzYW5fa21hbGxvYysweDhjLzB4
ZDAKPj4gICAgIF9fa21hbGxvYysweDM0Yy8weDViYwo+PiAgICAgdG5jX2luc2VydCsweDE0MC8w
eDE2YTQKPj4gICAgIHViaWZzX3RuY19hZGQrMHgzNzAvMHg1MmMKPj4gICAgIHViaWZzX2pubF93
cml0ZV9kYXRhKzB4NWQ4LzB4ODcwCj4+ICAgICBkb193cml0ZXBhZ2UrMHgzNmMvMHg1MTAKPj4g
ICAgIHViaWZzX3dyaXRlcGFnZSsweDE5MC8weDRkYwo+PiAgICAgX193cml0ZXBhZ2UrMHg1OC8w
eDE1NAo+PiAgICAgd3JpdGVfY2FjaGVfcGFnZXMrMHgzOTQvMHg4MzAKPj4gICAgIGRvX3dyaXRl
cGFnZXMrMHgxZjAvMHg1YjAKPj4gICAgIGZpbGVtYXBfZmRhdGF3cml0ZV93YmMrMHgxNzAvMHgy
NWMKPj4gICAgIGZpbGVfd3JpdGVfYW5kX3dhaXRfcmFuZ2UrMHgxNDAvMHgxOTAKPj4gICAgIHVi
aWZzX2ZzeW5jKzB4ZTgvMHgyOTAKPj4gICAgIHZmc19mc3luY19yYW5nZSsweGMwLzB4MWU0Cj4+
ICAgICBkb19mc3luYysweDQwLzB4OTAKPj4gICAgIF9fYXJtNjRfc3lzX2ZzeW5jKzB4MzQvMHg1
MAo+PiAgICAgaW52b2tlX3N5c2NhbGwuY29uc3Rwcm9wLjArMHhhOC8weDI2MAo+PiAgICAgZG9f
ZWwwX3N2YysweGM4LzB4MWYwCj4+ICAgICBlbDBfc3ZjKzB4MzQvMHg3MAo+PiAgICAgZWwwdF82
NF9zeW5jX2hhbmRsZXIrMHgxMDgvMHgxMTQKPj4gICAgIGVsMHRfNjRfc3luYysweDFhNC8weDFh
OAo+PiAgICBGcmVlZCBieSB0YXNrIDQwMzoKPj4gICAgIGthc2FuX3NhdmVfc3RhY2srMHgzOC8w
eDcwCj4+ICAgICBrYXNhbl9zZXRfdHJhY2srMHgyOC8weDQwCj4+ICAgICBrYXNhbl9zZXRfZnJl
ZV9pbmZvKzB4MjgvMHg0Ywo+PiAgICAgX19rYXNhbl9zbGFiX2ZyZWUrMHhkNC8weDEzYwo+PiAg
ICAga2ZyZWUrMHhjNC8weDNhMAo+PiAgICAgdG5jX2RlbGV0ZSsweDNmNC8weGU0MAo+PiAgICAg
dWJpZnNfdG5jX3JlbW92ZV9yYW5nZSsweDM2OC8weDczYwo+PiAgICAgdWJpZnNfdG5jX3JlbW92
ZV9pbm8rMHgyOWMvMHgyZTAKPj4gICAgIHViaWZzX2pubF9kZWxldGVfaW5vZGUrMHgxNTAvMHgy
NjAKPj4gICAgIHViaWZzX2V2aWN0X2lub2RlKzB4MWQ0LzB4MmU0Cj4+ICAgICBldmljdCsweDFj
OC8weDQ1MAo+PiAgICAgaXB1dCsweDJhMC8weDNjNAo+PiAgICAgZG9fdW5saW5rYXQrMHgyY2Mv
MHg0OTAKPj4gICAgIF9fYXJtNjRfc3lzX3VubGlua2F0KzB4OTAvMHgxMDAKPj4gICAgIGludm9r
ZV9zeXNjYWxsLmNvbnN0cHJvcC4wKzB4YTgvMHgyNjAKPj4gICAgIGRvX2VsMF9zdmMrMHhjOC8w
eDFmMAo+PiAgICAgZWwwX3N2YysweDM0LzB4NzAKPj4gICAgIGVsMHRfNjRfc3luY19oYW5kbGVy
KzB4MTA4LzB4MTE0Cj4+ICAgICBlbDB0XzY0X3N5bmMrMHgxYTQvMHgxYTgKPj4gVGhlIG9mZmVu
ZGluZyBgbWVtY3B5YCBpcyBpbiBgdWJpZnNfY29weV9oYXNoKClgLiBGaXggdGhpcyBieSBjaGVj
a2luZwo+PiBpZiB0aGUgYHpub2RlYCBpcyBvYnNvbGV0ZSBiZWZvcmUgYWNjZXNzaW5nIHRoZSBo
YXNoIChqdXN0IGxpa2Ugd2UgZG8KPj4gZm9yIGB6bm9kZS0+cGFyZW50YCkuCj4KPiBEbyB5b3Ug
bWVhbiB0aGF0IHRoZSBVQUYgb2NjdXJzIGluIGZvbGxvd2luZyBwYXRoOgo+IGRvX2NvbW1pdCAt
PiB1Ymlmc190bmNfZW5kX2NvbW1pdCAtPiB3cml0ZV9pbmRleDoKPiB3aGlsZSAoMSkgewo+ICAg
IC4uLgo+ICAgIHpub2RlID0gY25leHQ7Cj4gICAgLi4uCj4gICAgaWYgKHpub2RlLT5jcGFyZW50
KQo+ICAgICAgdWJpZnNfY29weV9oYXNoKGMsIGhhc2gsIHpub2RlLT5jcGFyZW50LT56YnJhbmNo
W3pub2RlLT5jaWlwXS5oYXNoKTsgIC8vCj4gICAgICB6bm9kZS0+Y3BhcmVudCBoYXMgYmVlbiBm
cmVlZCEKPiB9CgpZZXMsIHRoYXQncyB3aGF0IEtBU0FOIHJlcG9ydHMuIEl0J3MgdGhlIGBtZW1j
cHkoKWAgaW4KYHViaWZzX2NvcHlfaGFzaCgpYCB0aGF0IHRyaWdnZXJzIHRoZSBzbGFiLXVzZS1h
ZnRlci1mcmVlLgoKPgo+IElmIHNvLCBhY2NvcmRpbmcgdG8gdGhlIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24obGFzdGVzdCBsaW51eCBrZXJuZWwgaXMgdjYuMTIpLCBJCj4gY2Fubm90IHVuZGVyc3Rh
bmQgdGhhdCBob3cgdGhlIHpub2RlLT5jcGFyZW50IGlzIGZyZWVkIGJlZm9yZSB3cml0ZV9pbmRl
eCgpCj4gZmluaXNoZWQsIGl0IGxvb2tzIGltcG9zc2libGUuCj4gQWxsIGRpcnR5IHpub2RlcyBh
cmUgZ2F0aGVyZWQgYnkgZnVuY3Rpb24gZ2V0X3pub2Rlc190b19jb21taXQoKSB3aGljaCBpcwo+
IHByb3RlY3RlZCBieSBjLT50bmNfbXV0ZXgsIGFuZCB0aGUgJ2NwYXJlbnQnIG1lbWJlciBpbiBh
bGwgZGlydHkgem5vZGVzIGlzCj4gYXNzaWduZWQgd2l0aCBub24tTlVMTC4gVGhlbiBJIHRoaW5r
IHRoZSB6bm9kZSBtZW1vcnkgZnJlZWluZyBwYXRoCj4gJ3RuY19kZWxldGUtPmtmcmVlKHpub2Rl
KScgY2Fubm90IGhhcHBlbiwgYmVjYXVzZToKPiAxKSBJZiBhIHpub2RlIGlzIGRpcnRpZWQsIGFs
bCBpdHMnIGFuY2VzdG9yIHpub2RlcyhhIHBhdGggZnJvbSB6bm9kZSB0byByb290Cj4gem5vZGUp
IG11c3QgYmUgZGlydGllZCwgd2hpY2ggaXMgZ3VhcmFudGVlZCBieSBVQklGUy4gU2VlCj4gZGly
dHlfY293X2JvdHRvbV91cC9sb29rdXBfbGV2ZWwwX2RpcnR5Lgo+IDIpIEEgZGlydHkgem5vZGUg
d2FpdGluZyBmb3IgY29tbWl0IGNhbm5vdCBiZSBmcmVlZCBiZWZvcmUgd3JpdGVfaW5kZXgoKQo+
IGZpbmlzaGVkLCB3aGljaCBpcyBndWFyYW50ZWVkIGJ5IHRuY19kZWxldGU6Cj4gICBpZiAoem5v
ZGUtPmNuZXh0KSB7Cj4gICAgIF9fc2V0X2JpdChPQlNPTEVURV9aTk9ERSwgJnpub2RlLT5mbGFn
cyk7Cj4gICAgIC4uLgo+ICAgfSBlbHNlIHsKPiAgICAga2ZyZWUoem5vZGUpOwo+ICAgfQoKSSdt
IHdpdGggeW91IGhlcmUuIEluaXRpYWxseSBJIHRob3VnaHQgdGhlcmUgd2FzIHNvbWUgbG9jayBt
aXNzaW5nCihzaW5jZSBpdCBpcyBzaG93aW5nIHNpZ25zIG9mIGEgcmFjZSwgZS5nLiBub3QgZGV0
ZXJtaW5pc3RpYykuIEJ1dCBhcwp5b3UgcG9pbnQgb3V0LCBpdCBpcyBwcm90ZWN0ZWQgd2l0aCBg
dG5jX211dGV4YCwgaGVuY2UgbXkgIlJGQyIgdGFnIG9uCnRoaXMgcGF0Y2guCgo+PiBGaXhlczog
MTZhMjZiMjBkMmFmICgidWJpZnM6IGF1dGhlbnRpY2F0aW9uOiBBZGQgaGFzaGVzIHRvIGluZGV4
IG5vZGVzIikKPj4gU2lnbmVkLW9mZi1ieTogV2FxYXIgSGFtZWVkIDx3YXFhci5oYW1lZWRAYXhp
cy5jb20+Cj4+IC0tLQo+PiBJJ20gbm90IGVudGlyZWx5IHN1cmUgaWYgdGhpcyBpcyB0aGUgX2Nv
cnJlY3RfIHdheSB0byBmaXggdGhpcy4gSG93ZXZlciwKPj4gdGVzdGluZyBzaG93cyB0aGF0IHRo
ZSBwcm9ibGVtIGluZGVlZCBkaXNhcHBlYXJzLgo+PiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQg
dGhlIGB6bm9kZWAgY291bGQgY29uY3VycmVudGx5IGJlIGRlbGV0ZWQgKHdpdGgKPj4gYSByZWZl
cmVuY2UgaW4gYW4gdW5wcm90ZWN0ZWQgY29kZSBzZWN0aW9uIHdpdGhvdXQgYHRuY19tdXRleGAp
LiBUaGUKPj4gYXNzdW1wdGlvbiBpcyB0aGF0IGluIHRoaXMgY2FzZSBpdCB3b3VsZCBiZSBzdWZm
aWNpZW50IHRvIGNoZWNrCj4+IGB1Ymlmc196bl9vYnNvbGV0ZSh6bm9kZSlgLCBsaWtlIGFzIGlu
IHRoZSBpZi1zdGF0ZW1lbnQgZm9yCj4+IGB6bm9kZS0+cGFyZW50YCBqdXN0IGJlbG93Lgo+Cj4g
SSdtIGFuYWx5emluZyB0bmMtcmVsYXRlZCBjb2RlIHRoZXNlIGRheXMsIGhvd2V2ZXIgSSBjYW4n
dCBmaW5kIHBsYWNlcyB0aGF0IG1heQo+IGNvbmN1cnJlbnRseSBvcGVyYXRlIHRoZSBzYW1lIHpu
b2RlLiBBbmQgSSBjYW5ub3QgcmVwcm9kdWNlIHRoZSBwcm9ibGVtIHdpdGgKPiB5b3VyIHJlcHJv
ZHVjZXI6Cj4gd2hpbGUgdHJ1ZTsgZG8KPiAgIHJtIC1mIC9VQklGU19NTlQvdGVzdC1maWxlLmJp
bgo+ICAgZGQgaWY9L2Rldi91cmFuZG9tIG9mPS9VQklGU19NTlQvdGVzdC1maWxlLmJpbiBicz0x
TSBjb3VudD02MCBjb252PWZzeW5jCj4gZG9uZQoKRm9yIGNvbXBsZXRlbmVzcywgaGVyZSBhcmUg
dGhlIF9leGFjdF8gc3RlcHMgdGhhdCBJIGhhdmUgdXNlZCB0bwpyZXByb2R1Y2UgdGhpcyBvbiBt
eSBzeXN0ZW0gd2l0aCB2Ni4xMi1yYzIgKGNvbW1pdCA3NWI2MDdmYWIzOGQgIk1lcmdlCnRhZyAn
c2NoZWRfZXh0LWZvci02LjEyLXJjMi1maXhlcycgb2YKZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RqL3NjaGVkX2V4dCIpOgoKYGBgCnViaWF0dGFjaCAtbSAy
CgprZXljdGwgYWRkIGxvZ29uIGR1bW15X2tleTogZHVtbXlfbG9hZCBAdXMKCnViaW1rdm9sIC9k
ZXYvdWJpMCAtcyA4ME1pQiAtbiAwIC1OIHRlc3Qtdm9sCnViaXVwZGF0ZXZvbCAvZGV2L3ViaTBf
MCAtdAoKbW91bnQgLXQgdWJpZnMgL2Rldi91YmkwXzAgL21udC9mbGFzaCAtbyBhdXRoX2hhc2hf
bmFtZT1zaGEyNTYsYXV0aF9rZXk9ZHVtbXlfa2V5OgoKY291bnQ9MAp3aGlsZSB0cnVlOyBkbwog
ICAgZGF0ZQogICAgY291bnQ9JCgoJGNvdW50ICsgMSkpCiAgICBlY2hvIGNvdW50PSRjb3VudAoK
ICAgIHJtIC1mIC9tbnQvZmxhc2gvdGVzdC1maWxlLmJpbgogICAgZGQgaWY9L2Rldi91cmFuZG9t
IG9mPS9tbnQvZmxhc2gvdGVzdC1maWxlLmJpbiBicz0xTSBjb3VudD02MCBjb252PWZzeW5jCgog
ICAgZWNobyAiIgpkb25lCmBgYAoKTm90ZSB0aGF0IHlvdSBuZWVkIHRvIGhhdmUgYENPTkZJR19V
QklGU19GU19BVVRIRU5USUNBVElPTj15YCAoYW5kCmBDT05GSUdfS0FTQU49eWAgb2J2aW91c2x5
KSBpbiB5b3VyIGAuY29uZmlnYCBpbiBvcmRlciB0byB0cmlnZ2VyIHRoZQpvZmZlbmRpbmcgYG1l
bWNweSgpYCBpbiBgdWJpZnNfY29weV9oYXNoKClgLiBBbHNvLCBpdCB0YWtlcyBhIHdoaWxlLiBG
b3IKZXhhbXBsZSwgbGFzdCB0aW1lIGl0IHRvb2sgbWUgODggaXRlcmF0aW9ucyBvZiB0aGUgYWJv
dmUgbG9vcCBiZWZvcmUgaXQKdHJpZ2dlcmVkLiBTbyB5b3UgbWlnaHQgbmVlZCB0byBsZXQgaXQg
c3BpbiBmb3IgYSB3aGlsZS4KCj4KPiBDYW4geW91IGRpZyBtb3JlIGRlZXBlciBieSBhZGRpbmcg
bW9yZSBkZWJ1ZyBtZXNzYWdlLCBzbyB0aGF0IHdlIGNhbiBmaWd1cmUgb3V0Cj4gd2hhdCBpcyBy
ZWFsbHkgaGFwcGVuaW5nLgoKQ2VydGFpbmx5ISBJIGNvdWxkIHRyeSB0byBlbmFibGUgdGhlIGRl
YnVnIHByaW50cyBmcm9tIFVCSUZTLCBob3dldmVyCnRoZXkgYXJlICphIGxvdCouIE1vcmVvdmVy
LCBwcmludGluZyB0aGF0IG11Y2ggY2hhbmdlcyB0aGUgdGltaW5nCmJlaGF2aW9yIGFuZCBtaWdo
dCBtYWtlIGl0IGhhcmRlciB0byB0cmlnZ2VyIHRoZSB1c2UtYWZ0ZXItZnJlZS4gRG8geW91Cmhh
dmUgYW55IHRpcHMgb24gd2hlcmUgd2Ugc2hvdWxkIHRyeSB0byBmb2N1cyB0aGUgZGVidWcgcHJp
bnRzIChhCmR5bmFtaWMgZGVidWcgZmlsdGVyKS4KClsuLi5dCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
