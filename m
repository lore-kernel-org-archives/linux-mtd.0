Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1590DD59F53
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IIoLCyc1t60ebHfCTCldaYZTzrH3HzUrr9519IPKGcI=; b=D1Kg4kOd8tFo1p
	RLcEZKNQqhfnx0UDWkmTvTQfD31dTYzgavX5LoDuzIkLHSIEKomF2/DPqyGp3mh9ny9Lfbfi1w/yQ
	+NVEGyoFRxut+Ep1GISi5fwdY/I28Zhaj/eGI2TmWGf+2NdSiuUqCYSEmPoJnmqOjTUXDJgbNwoO9
	ggQl6wcG+qaXOm9EE1SMa5Mtj7oKoXVsVaV4PzGIXK0GZrR5xbqy5IO2Okdo2b7wZMQKImRZjaikk
	Ksqv2zMV6nmgUX0ySPjLD4+OeEgTZ1mhxXW89FN0cXAFGgUQ7HvVLLmS9fxP6IdKkrWFCaQSdlkqh
	dA/a4WDhQoY1+XL2lwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8j1k-000000043Ri-0uhb;
	Wed, 06 Nov 2024 16:37:04 +0000
Received: from mail-vi1eur05on2060e.outbound.protection.outlook.com ([2a01:111:f403:2613::60e] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8j1g-000000043Qw-0nRN
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 16:37:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/IhlRqoWpBnsFgpnkB+dNhfcIKYRCwoCcLcTCD1bX/5PLfl3HsmrAgXaT/N/HdTHNdsrdD+CCcpmFU4T4UF9DZQvoc7Ni5TmHddcl+9Z241mKsI0CU4y1kSqr8ASQcJ7KrAWi17A9YU3QyuzlVq9q6qsFuLjCUw9IA9HJufV2Rt+DI8kw4RZBUHJqyqjM2Yazj6GzTeQkyBt3u4oImE5Y/r9QWBRLQxSMEqWDrlG1DNDhsKrlaJjl8WiRHX4ZaApArN6wooqvu1YIYFuTbPR8dWtQgX9MirOXGCEE4IXMuzNybX25EcKgqpea9FJdvCl6L4aWRPGT0MpF+CIyVDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Org0fItIUfeJVa0PNPX2AGuBzHJRZ65cmBW1R4tmHM=;
 b=I08TASuzn0MgKkApiBD2+b/pInMxFh44YLwMIQKhseLrE+fbZZTRoWPvy8aPXAROy+XhHGPNFkSSbVHsHTJqRydfiw9HtZdaTX3nsrKJNyOo5iGUdsoOtVInd2qXDbu2nuN1TT4PosI7yIQ+101fKxYrky1rsMnnSJ1hgD+M9HcxpRevzOwLgqAGUqydwXOX1EweCiKIgs94vzhNFzTv8kN0MdF4cEb9ARQ4kN3gKezyrAeIgQJgmGa8sCuzLuQVJhjLTQtCDI8saxGezG0326nJBaqEWEX85oxamccAs2A6UtnWzVnw/UKiICIjH8cLSA0J/6XdaVw2yxfsMpJkeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Org0fItIUfeJVa0PNPX2AGuBzHJRZ65cmBW1R4tmHM=;
 b=BpboX83r09c4erPw1P0SNrVJzGuPHmkM1blxKGC3QPiJyyVUM30naFKhPYhXr7XWbgfG7tAiB2/1QEd7Mwi4vziJo0OM25NoljsDdRh/QogIRxELfAWRz+SCNGXi6sItgkFrnmH/s1GWYUo1sYi9j3mwXG3t+pM19Pvkrbz+Dr8=
Received: from PA7P264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2d3::10)
 by AS4PR02MB8288.eurprd02.prod.outlook.com (2603:10a6:20b:510::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Wed, 6 Nov
 2024 16:36:51 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:2d3:cafe::a2) by PA7P264CA0004.outlook.office365.com
 (2603:10a6:102:2d3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 16:36:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Wed, 6 Nov 2024 16:36:50 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 17:36:49 +0100
From: Waqar Hameed <waqar.hameed@axis.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
CC: Richard Weinberger <richard@nod.at>, Sascha Hauer
	<s.hauer@pengutronix.de>, <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
In-Reply-To: <b3b80d1c-6c99-5d47-cba0-3be14ff79c36@huawei.com> (Zhihao Cheng's
	message of "Fri, 18 Oct 2024 09:40:57 +0800")
References: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
	<5173d3d2-4a6b-8b0b-c8f7-8034c9763532@huawei.com>
	<pnd7ca9r0pt.fsf@axis.com>
	<239af2ee-c18d-414f-099f-2c82f98d9671@huawei.com>
	<pnd7ca6wp9r.fsf@axis.com>
	<b3b80d1c-6c99-5d47-cba0-3be14ff79c36@huawei.com>
Date: Wed, 6 Nov 2024 17:36:49 +0100
Message-ID: <pndses42uam.fsf@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|AS4PR02MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: bc78499b-5e28-41fa-bada-08dcfe813731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUhjNld0VHBQMTkwYjlUN2FiY3pmSlExNGgzRGlyR3owR0lURHBZc2VUREFC?=
 =?utf-8?B?anpUZFNCeE95L0IzdTArQm54a3VPMFEyUUxVMmNlVDA3SVFDU2tKbDVBVmpu?=
 =?utf-8?B?cytvblM3NXFHd2hJbzdQTE0vK0UyYzZRamhXQ3JqKy8wNkhwdktuczVKSUJo?=
 =?utf-8?B?R2xaZkxQR3VQYUt3WTVua2JqbUFyL3prbStmbFdHWG1wQ2F4NjVISnJjNTU0?=
 =?utf-8?B?V0tUbm5CZkc5czVBWDNxTzVEMEo3QXNYUEZ3d1Y3cDNySVEwUVA0MkNBQkRz?=
 =?utf-8?B?RlVWWGtKTldnb2kxd21hdUp3NjNDeTd4Z0ZsNVpOd2g3U1U0MmJOeCtGVDFV?=
 =?utf-8?B?MXVCS1BRdHhWTSsrSTRvcEpkcjdFL25WaVl4bWQvVUtrOVNDMmh6N1VSMWFw?=
 =?utf-8?B?aXIvNU9mWThZT0o1TmQ4L0VGbEFITGErcEFqUG9wYy9kTjZEWUZUdDFCYjNp?=
 =?utf-8?B?aDcrSnhWMENlbjFUY0NkQWlmS1dFMlFOTEUvQkl3LzJHQmVyTE4vSFI1MUFQ?=
 =?utf-8?B?UTJXNmFubDBTWm9sV28weEFZaExkZ0tjeFBrZmNVUDhuMmc1Q3U3SmR1bldo?=
 =?utf-8?B?dWdKQ0J3SE5va09FSHBrRWk2QWtrcEU1cHVwQmp1Z2NBdnVEYjh6V09ZODdQ?=
 =?utf-8?B?bHhCcGsxLzVWT21BTVlhVXBKRUNVWlFlbjdab09pSmY2QkpaM1ppVFRiWXJE?=
 =?utf-8?B?emhES0VuQ1N1QzNvRXdtSE5JeFJaZHR4WXZJckJxV0UwZlpKdFF4Tld1NmU5?=
 =?utf-8?B?Y3ZSYUVTQ1RYQ2lZYXpPK1UwbzBGOHl5aGZVSjZOZjZ4anJvcGViRWx4MDd4?=
 =?utf-8?B?elp0U2Y5QitycnVSNjhKc0pDMXgrbkZybWZ5UUtra1NpQjh0NE1oekdNaE9D?=
 =?utf-8?B?dmo3T3ErQXJyZ0lNMGlvTXNhdnNJTXlZU2RVbTB1dkpQWE44VmdKUWFHWkh3?=
 =?utf-8?B?aFNSODROeGJ2azBQY0JLSGhKa3F4Z1BuVm1BZ2ZFNXpVUHJvRS85TUJreWs5?=
 =?utf-8?B?L1prZTZOQmVoaEx1SUlpS3pST1pYSmRRMXlkNHVnV2FNdHovam5mbExiTjRZ?=
 =?utf-8?B?cVdGSWQ3eUV2KzdnV1REbVVFNVNFR3JycnUra3pCc1NveXJCeTFjSURMZkNa?=
 =?utf-8?B?b0NGcktSOVlKSkhzaytXL0wrOUoyaHRhOXI1VEF4QXdhM0toczViZFFtQyt5?=
 =?utf-8?B?b0NDbTBoU3BXdDVUVUtZL1BlTkZCa3hDSjQ2NXJHOWZtcUo0UFNocWRmYXdY?=
 =?utf-8?B?YnBBY25Ra29TTjNrUHpxb1VCWUdCT3p5K0N0eFNhcENpSEpHTEFTSjZ3RW4r?=
 =?utf-8?B?MHlxOUx0a29sVWVVSmJSRktoay9HYVl6aTRyS3FYOTJSRFBTVklGR1dIblB4?=
 =?utf-8?B?OUJiSHFTOG5JY2FtS2JkQ0pLVXRaR0dNY1h4SGt1ZWM5MEt5NzZ2SFlHMTNx?=
 =?utf-8?B?NDc1eEJXa2dPaEIxSTFnS2pQSG9kTGNXQUZyeDlyeDNaZWhrSlQ1ZlJucnVG?=
 =?utf-8?B?MFRJcmwzN2cvS3FmbmZ2NHNMTWI2ODIxblFrSkJvSGVrOHpCM3J2Zi9aakEy?=
 =?utf-8?B?Z1ZSVnNqU3JBNi9RZlRCSytJeHRjNXE3cDMwZ1RNRXUrd0IyaWpmb0UrWlVQ?=
 =?utf-8?B?TkhNejNwdFFxeEFXQUdzWk50YVc2Uk94Y21uRk5OV1ZMbmtlYVVDM2RNdXVW?=
 =?utf-8?B?VTNwREhsVEh4K3NVRXJoNkdheHFDVUNvSXJKbk51dW5LemxGUmxRUzR6aU1i?=
 =?utf-8?B?L1RiQVZEcUhZUmdUTExocVJ6ZFZFUDVyRUQzRGFVTWdteHBJNTNPZ1c4NVZM?=
 =?utf-8?B?RnJpSEVNQU9uWEVEVlo3djdTc1Q1elEydDZUYUtyeEZ5RmJVendUZ2pERVpL?=
 =?utf-8?B?ck0zWWphQjduQ2VhUkkxV1BmMm54cHdVSldSZmhCY0YzYUE9PQ==?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 16:36:50.9540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc78499b-5e28-41fa-bada-08dcfe813731
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_083700_407609_F8AEEE91 
X-CRM114-Status: GOOD (  23.71  )
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

U29ycnkgZm9yIHRoZSBsYXRlIHJlc3BvbnNlIFpoaWhhbyEgSSd2ZSBiZWVuIHF1aXRlIGJ1c3kg
dGhlc2UgZGF5cy4uLgoKT24gRnJpLCBPY3QgMTgsIDIwMjQgYXQgMDk6NDAgKzA4MDAgWmhpaGFv
IENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cgo+IOWcqCAyMDI0LzEwLzE4
IDI6MzYsIFdhcWFyIEhhbWVlZCDlhpnpgZM6Cj4+IE9uIFdlZCwgT2N0IDE2LCAyMDI0IGF0IDEw
OjExICswODAwIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlOgo+
PiBbLi4uXQo+PiAKPj4+IEJUVywgd2hhdCBpcyB0aGUgY29uZmlndXJhdGlvbiBvZiB5b3VyIGZs
YXNoPyhlZy4gZXJhc2Ugc2l6ZSwgcGFnZSBzaXplKT8KPj4gJCBtdGRpbmZvIC9kZXYvbXRkMgo+
PiAgICBtdGQyCj4+ICAgIE5hbWU6ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlybXdhcmUK
Pj4gICAgVHlwZTogICAgICAgICAgICAgICAgICAgICAgICAgICBuYW5kCj4+ICAgIEVyYXNlYmxv
Y2sgc2l6ZTogICAgICAgICAgICAgICAgMTMxMDcyIGJ5dGVzLCAxMjguMCBLaUIKPj4gICAgQW1v
dW50IG9mIGVyYXNlYmxvY2tzOiAgICAgICAgICAxODMyICgyNDAxMjM5MDQgYnl0ZXMsIDIyOS4w
IE1pQikKPj4gICAgTWluaW11bSBpbnB1dC9vdXRwdXQgdW5pdCBzaXplOiAyMDQ4IGJ5dGVzCj4+
ICAgIFN1Yi1wYWdlIHNpemU6ICAgICAgICAgICAgICAgICAgMjA0OCBieXRlcwo+PiAgICBPT0Ig
c2l6ZTogICAgICAgICAgICAgICAgICAgICAgIDY0IGJ5dGVzCj4+ICAgIENoYXJhY3RlciBkZXZp
Y2UgbWFqb3IvbWlub3I6ICAgOTA6NAo+PiAgICBCYWQgYmxvY2tzIGFyZSBhbGxvd2VkOiAgICAg
ICAgIHRydWUKPj4gICAgRGV2aWNlIGlzIHdyaXRhYmxlOiAgICAgICAgICAgICB0cnVlCj4+ICQg
dWJpbmZvIC9kZXYvdWJpMF8wCj4+ICAgIFZvbHVtZSBJRDogICAwIChvbiB1YmkwKQo+PiAgICBU
eXBlOiAgICAgICAgZHluYW1pYwo+PiAgICBBbGlnbm1lbnQ6ICAgMQo+PiAgICBTaXplOiAgICAg
ICAgNjYxIExFQnMgKDgzOTMxMTM2IGJ5dGVzLCA4MC4wIE1pQikKPj4gICAgU3RhdGU6ICAgICAg
IE9LCj4+ICAgIE5hbWU6ICAgICAgICB0ZXN0LXZvbAo+PiAgICBDaGFyYWN0ZXIgZGV2aWNlIG1h
am9yL21pbm9yOiAyNDQ6MQo+PiBbLi4uXQo+Cj4gVGhhbmtzLCBJIHdpbGwgY2hhbmdlIG15IG5h
bmRzaW0gY29uZmlndXJhdGlvbnMgdG8gZ2VuZXJhdGUgYSBtdGQgZGV2aWNlIHRoZQo+IHNhbWUg
bW9kZWwuCgpEaWQgeW91IG1hbmFnZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIHdpdGggdGhpcz8K
Cj4+IAo+Pj4gV2VsbCwgbGV0J3MgZG8gYSBwcmVsaW1pbmFyeSBhbmFseXNpcy4KPj4+IFRoZSB6
bm9kZS0+Y3BhcmVudFt6bm9kZS0+Y2lpcF0gaXMgYSBmcmVlZCBhZGRyZXNzIGluIHdyaXRlX2lu
ZGV4KCksIHdoaWNoCj4+PiBtZWFuczoKPj4+IDEuICd6bm9kZS0+Y2lpcCcgaXMgdmFsaWQsIHpu
b2RlLT5jcGFyZW50IGlzIGZyZWVkIGJ5IHRuY19kZWxldGUsIGhvd2V2ZXIgem5vZGUKPj4+IGNh
bm5vdCBiZSBmcmVlZCBpZiB6bm9kZS0+Y25leHQgaXMgbm90IE5VTEwsIHdoaWNoIG1lYW5zOgo+
Pj4gICAgYSkgJ3pub2RlLT5jcGFyZW50JyBpcyBub3QgZGlydHksIHdlIHNob3VsZCBhZGQgYW4g
YXNzZXJ0aW9uIGxpa2UKPj4+ICAgIHViaWZzX2Fzc2VydChjLCB1Ymlmc196bl9kaXJ0eSh6bm9k
ZS0+Y3BhcmVudCkpIGluIGdldF96bm9kZXNfdG9fY29tbWl0KCkuCj4+PiAgICBOb3RlLCBwbGVh
c2UgY2hlY2sgdGhhdCAnem5vZGUtPmNwYXJlbnQnIGlzIG5vdCBOVUxMIGJlZm9yZSB0aGUgYXNz
ZXJ0aW9uLgo+Pj4gICAgYikgJ3pub2RlLT5jcGFyZW50JyBpcyBkaXJ0eSwgYnV0IGl0IGlzIG5v
dCBhZGRlZCBpbnRvIGxpc3QgJ2MtPmNuZXh0Jywgd2UKPj4+ICAgIHNob3VsZCB0cmF2ZXJzZSB0
aGUgZW50aXJlIFROQyBpbiBnZXRfem5vZGVzX3RvX2NvbW1pdCgpIHRvIG1ha2Ugc3VyZSB0aGF0
IGFsbAo+Pj4gICAgZGlydHkgem5vZGVzIGFyZSBjb2xsZWN0ZWQgaW50byBsaXN0ICdjLT5jbmV4
dCcsIHNvIGFub3RoZXIgYXNzZXJ0aW9uIGlzCj4+PiAgIG5lZWRlZC4KCkknbSBhIGxpdHRsZSB3
b3JyaWVkIHRoYXQgdHJhdmVyc2luZyB0aGUgd2hvbGUgVE5DIGNvdWxkIGNoYW5nZSB0aGUKdGlt
aW5nIGJlaGF2aW9yLCBhbmQgdGh1cyBtaWdodCBub3QgdHJpZ2dlciB0aGUgcmFjZS4gTGV0J3Mg
ZG8gdGhhdCBpbgpzdGVwcz8gU3RhcnQgd2l0aCB0aGUgb3RoZXIgYXNzZXJ0cyAoc2VlIGRpZmYg
YmVsb3cpIGFuZCBsYXRlciBqdXN0IGRvCnRoaXMgYXNzZXJ0LiBEb2VzIHRoYXQgc291bmQgcmVh
c29uYWJsZT8KCkkgY291bGQgbW9kaWZ5IGBkYmdfY2hlY2tfdG5jKClgIHNvIHRoYXQgaXQgYWxz
byBjaGVja3MgdGhhdCBlYWNoIGRpcnR5CmB6bm9kZWAgaXMgcHJlc2VudCBpbiBgYy0+Y25leHRg
IGxpc3QuIFdlIHRoZW4gY2FsbCB0aGlzIGF0IHRoZSBlbmQgb2YKYGdldF96bm9kZXNfdG9fY29t
bWl0KClgLgoKPj4+IDIuICd6bm9kZS0+Y2lpcCcgaXMgaW52YWxpZCwgYW5kIHRoZSB2YWx1ZSBi
ZXlvbmRzIHRoZSBtZW1vcnkgYXJlYSBvZgo+Pj4gem5vZGUtPmNwYXJlbnQuIEFsbCB6bm9kZXMg
YXJlIGFsbG9jYXRlZCB3aXRoIHNpemUgb2YgJ2MtPm1heF96bm9kZV9zeicsIHdoaWNoCj4+PiBt
ZWFucyB0aGF0ICd6bm9kZS0+Y2lpcCcgZXhjZWVkcyB0aGUgJ2MtPmZhbnRvdXQnLCBzbyB3ZSBj
YW4gYWRkIGFuIGFzc2VydGlvbgo+Pj4gbGlrZSB1Ymlmc19hc3NlcnQoYywgem5vZGUtPmNpaXAg
PCBjLT5mYW50b3V0KSBpbiBnZXRfem5vZGVzX3RvX2NvbW1pdCgpLgo+Pj4KPj4+IFRoYXQncyB3
aGF0IEkgY2FuIHRoaW5rIG9mLCBhcmUgdGhlcmUgYW55IG90aGVyIHBvc3NpYmlsaXRpZXM/Cj4+
IEkgbG9va2VkIGEgbGl0dGxlIG1vcmUgYXQgYGdldF96bm9kZXNfdG9fY29tbWl0KClgIHdoZW4g
YWRkaW5nIHRoZQo+PiBhc3NlcnRzIHlvdSBzdWdnZXN0LCBhbmQgSSBoYXZlIGEgcXVlc3Rpb246
IHdoYXQgaGFwcGVucyB3aGVuCj4+IGBmaW5kX25leHRfZGlydHkoKWAgcmV0dXJucyBgTlVMTGA/
IEluIHRoYXQgY2FzZQo+PiBgYGAKPj4gem5vZGUtPmNuZXh0ID0gYy0+Y25leHQ7Cj4+IGBgYAo+
PiBidXQgYHpub2RlLT5jcGFyZW50YCBhbmQgYHpub2RlLT5jaWlwYCBhcmUgbm90IHVwZGF0ZWQu
IFNob3VsZG4ndCB0aGV5Pwo+Cj4gR29vZCB0aGlua2luZy4KPiBBY2NvcmRpbmcgdG8gdGhlIGlt
cGxlbWVudGF0aW9uIG9mIGZpbmRfbmV4dF9kaXJ0eSgpLCB0aGUgb3JkZXIgb2YgZGlydHkgem5v
ZGVzCj4gY29sbGVjdGlvbiBpcyBib3R0b20tdXAsIHdoaWNoIG1lYW5zIHRoYXQgdGhlIGxhc3Qg
ZGlydHkgem5vZGUgaXMgdGhlIHJvb3QKPiB6bm9kZSwgc28gaXQgZG9lc24ndCBoYXZlIGEgcGFy
ZW50LiBZb3UgY2FuIHZlcmlmeSB0aGF0IGJ5IGFkZGluZyBhc3NlcnRpb24gdG8KPiBjaGVjayB3
aGV0aGVyIHRoZSBsYXN0IGRpcnR5IHpub2RlIGlzIHRoZSByb290LgoKWy4uLl0KClRvIHN1bW1h
cml6ZSwgSSdsbCBzdGFydCBhIHJ1biB3aXRoIHRoZSBmb2xsb3dpbmcgYXNzZXJ0czoKCmRpZmYg
LS1naXQgYS9mcy91Ymlmcy90bmNfY29tbWl0LmMgYi9mcy91Ymlmcy90bmNfY29tbWl0LmMKaW5k
ZXggYTU1ZTA0ODIyZDE2Li40ZWVmODJlMDJhZmUgMTAwNjQ0Ci0tLSBhL2ZzL3ViaWZzL3RuY19j
b21taXQuYworKysgYi9mcy91Ymlmcy90bmNfY29tbWl0LmMKQEAgLTY1MiwxMSArNjUyLDE3IEBA
IHN0YXRpYyBpbnQgZ2V0X3pub2Rlc190b19jb21taXQoc3RydWN0IHViaWZzX2luZm8gKmMpCiAJ
fQogCWNudCArPSAxOwogCXdoaWxlICgxKSB7CisJCXViaWZzX2Fzc2VydChjLCB6bm9kZS0+Y2lp
cCA8IGMtPmZhbnRvdXQpOworCQlpZiAoem5vZGUtPmNwYXJlbnQpIHsKKwkJCXViaWZzX2Fzc2Vy
dChjLCB1Ymlmc196bl9kaXJ0eSh6bm9kZS0+Y3BhcmVudCkpOworCQl9CisKIAkJdWJpZnNfYXNz
ZXJ0KGMsICF1Ymlmc196bl9jb3coem5vZGUpKTsKIAkJX19zZXRfYml0KENPV19aTk9ERSwgJnpu
b2RlLT5mbGFncyk7CiAJCXpub2RlLT5hbHQgPSAwOwogCQljbmV4dCA9IGZpbmRfbmV4dF9kaXJ0
eSh6bm9kZSk7CiAJCWlmICghY25leHQpIHsKKwkJCXViaWZzX2Fzc2VydChjLCB6bm9kZSA9PSBj
LT56cm9vdC56bm9kZSk7CiAJCQl6bm9kZS0+Y25leHQgPSBjLT5jbmV4dDsKIAkJCWJyZWFrOwog
CQl9CgpUaGVuIGxhdGVyLCBhbm90aGVyIHJ1biB3aXRoIGEgbW9kaWZpZWQgYGRiZ19jaGVja190
bmMoKWAgdG8gY2hlY2sgdGhhdAphbGwgZGlydHkgYHpub2RlYHMgYXJlIGluZGVlZCBwcmVzZW50
IGluIHRoZSBsaXN0IGBjLT5jbmV4dGAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
