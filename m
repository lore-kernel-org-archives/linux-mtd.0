Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C258CD12D59
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2024 21:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mo66euVdO6Br9UT19FE2p+mxoS3Fq6hxALN4fVuli4g=; b=tuMmxKXsjikZBw
	srC04gJvpBEvQnw1d9EuunAFRMzuSRDJtTpL90burLBJnwyqYZ37MOOl6LmT1ykOFTHykJB/jCI5f
	yTR0lgWHyEeZQTXO0uEKliRfRxOJ37eChGg1TYZalrdpIXURVknIzh00w8Q/LSjdOwyl4WICmvPdD
	4Wk81s1ul7/5hjnX0b0KPkLKVYtzkIpohAOrC6zWiUGHeu/JoUpBvKkRKIGOX6ekbz/W9MxAyv9HO
	XNH1tFvaKrrw1aVsELL99KIrj+HUbkduU1zhf60lOYQ4tL1uDoN4XgCtDW9vA1kakBXQiiKVK1HqP
	2O4U357SwSksSReWPl2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAFnt-0000000Ff4l-17EP;
	Sun, 10 Nov 2024 21:49:05 +0000
Received: from mail-dbaeur03on2062f.outbound.protection.outlook.com ([2a01:111:f403:260d::62f] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAFnp-0000000Ff44-2g4o
	for linux-mtd@lists.infradead.org;
	Sun, 10 Nov 2024 21:49:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeEozcx6wjbMsfoc0ZPAq3dRIQGqsDY8fWOSU836NNTO0tj/szsIGB8LiKEF1rPCWYejOY2xfYYuB4NtUWc15b3zvNlLjryh3HGIaLIvn2d5nURwYNxR6P4K/VLAHf36UsJWFgipj+v0AJCrJbia2wbW9bn6I+iDghR49/bcgtxVzrEusxXNKiNzpwDu7L1pElos3NIEO4oOk0sbDBayqFltVlYZK7Ef926eCKuzG28lY8yMb249ZOKqkZpn0BxFpLZYnlL5ZTFZWcfI99VRbH1bvYcjtXF3kDMCgWWA5iHr09/kFcsMdAMji2hzT7ev4TZrKwdy0tLVRddsacT38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCX42AwCmM7xTqVst8syx4YPcffvPA1Pttk2cTfwD6E=;
 b=j8ONTVefOK2btjVnfFnr6YR75KXYYWYHvs6p5BlapqvfoU6Ta+Rk03SE1dju17g7ouIV5e/ZcXASbgjGuPp8rcwbJNVh7rI8RLeT45PxMJ9qqggohqyTSOxPIvD9EpkOiz25/MYU5sZuQ37sG64Cek0rd5H/5eu1tWQBYSAOQPNXYSRRJK2DM9iQKUd9ZwhHrVxJ8wbS9viHsRRnvlfFDSa7J+WORbvvbt0API99/bbf79r1xvoezinwkTwG72dIHnUAAIUKLOnjFHgjUl3Stw/2aj9GAh8vkj1QCi1ybUhpSUx+zOn6xJy5S+fPhvwtV+gz7wdhGNKqRPsm+yZSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCX42AwCmM7xTqVst8syx4YPcffvPA1Pttk2cTfwD6E=;
 b=fj2oVLwhK9IipMBKZRKbdoal/ujpVICEMEQlXPRCJ0sIQ4o2hc3ebTjwbEFeQohfPI08K6wkZdRXjd3GFAB1j/mMChieATCYQXDxrUe9fdU8QAdDxu1IbTXFYq/wiTDR8fSKHOsRqQMMSCiwiur8elMKsgqYRQAvmteiDPpGM8Y=
Received: from AS4PR10CA0003.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::16)
 by AS4PR02MB8742.eurprd02.prod.outlook.com (2603:10a6:20b:58e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Sun, 10 Nov
 2024 21:48:52 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::e6) by AS4PR10CA0003.outlook.office365.com
 (2603:10a6:20b:5dc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Sun, 10 Nov 2024 21:48:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Sun, 10 Nov 2024 21:48:52 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 10 Nov
 2024 22:48:50 +0100
From: Waqar Hameed <waqar.hameed@axis.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
CC: Richard Weinberger <richard@nod.at>, Sascha Hauer
	<s.hauer@pengutronix.de>, <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ubifs: Fix use-after-free in ubifs_tnc_end_commit
In-Reply-To: <3c46013e-809e-cdcf-8648-2ffe2ab6c32b@huawei.com> (Zhihao Cheng's
	message of "Sat, 9 Nov 2024 10:34:25 +0800")
References: <e7b5151bb1186e2342ed677cce0ef77592923084.1731088341.git.waqar.hameed@axis.com>
	<3c46013e-809e-cdcf-8648-2ffe2ab6c32b@huawei.com>
Date: Sun, 10 Nov 2024 22:48:50 +0100
Message-ID: <pndbjymzrnh.fsf@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|AS4PR02MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: a10795e7-91e9-459d-07dd-08dd01d17787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkZKYkhaaTFyMXJFYUhwK3A1NXJiNmlGUmhXNlo2N2ZicndHMHhrVXhXV1Vq?=
 =?utf-8?B?bHpYWUxmZk1tbk1ubkplbHFva21pQzY3cUNmeTdMWHBSYUtPZTdTTmpKNVZ0?=
 =?utf-8?B?ak90aHhEVHVwNGpjWjRXSTRVY1JCRldPSFRINC8reXFLa1RwWERKUHJRRXUz?=
 =?utf-8?B?TUdCbHU4UmxjWllkM0owa1NjUHpmWWozVi9CVlpjREswVWlYMmFDM3NBRmh6?=
 =?utf-8?B?bnkweVdjNnBIRUprRldWWXczYTJqWFN1WHZTbjZEMVQxZThsMGJ4TVZCYzBG?=
 =?utf-8?B?b1haNU9DdkxhVkQwZFViYWxvSjFXcEFiaGt5NXlLaEMxQVNXRTZjelBNRkhp?=
 =?utf-8?B?dGI0c04reXkrWkZKc0N5TWQ0dEVLVjQ5NGIvQi9taUNYWWFEZ2tocjEvclYv?=
 =?utf-8?B?cGRqQmN1QUJ2R0UwQWZHWWsvcXFFNlJEUk04TnJQL2s2dUJHcHd6MXFLSmp3?=
 =?utf-8?B?aDc3bmNVL2hlNW9md3FRd2tSMG9JY0p4a0RzTHB4bGdXYlg5KzZ5SE5NM2pE?=
 =?utf-8?B?cVNsdkMxazRmVGQvWnM4czArZDNXRWdWVkVsWFFEZDRxajE3eElqSkl1Z3JP?=
 =?utf-8?B?bndScERJQXJMOWd3Tk9aRS9EbUNMaEN5VmlFNnFTMXo5b3R0Y09PVkRFS0du?=
 =?utf-8?B?bzhFd2l1QmZKTVN4RnF4UWh3aHhMNVUxS0xQMTJXZUNwbk5ZeGpTdjZqeHZv?=
 =?utf-8?B?UVEremxIc1M3SFVnb095OEpscnc1SUl2aXA4Ynl4RUdNVGNIUWx4a3J4OVRt?=
 =?utf-8?B?UW02Z0RNc01xdzQ3cDltVVhIT0x2VzY0NXp0VnNHMlEvOU50MGc0MzRxd0do?=
 =?utf-8?B?eURYaW94N2tmK0FXd3Z3VmVlcEFWbitGNzR1U3lLM0t6amR3cmlydUNRZXJT?=
 =?utf-8?B?N0NlbS92QVl0OWJ2V0N4aVRjSXU2SDFkKzZ1Z1VwWjhQVGx5b2lXb0wxMk0x?=
 =?utf-8?B?Y29Ca2ZER1RQSmQ2NFFVL1JyWHo2cDFMYWw2Q1JCWnRENXJXdDBSQTM4VE9k?=
 =?utf-8?B?NUEyRnVqSllKMVlta1RjdkU5NW9Nc21LMU9aWU54RGFqWGZDRmQ0M2hpRmxZ?=
 =?utf-8?B?Y3JlL2hLbXNabWhaL3N4T01xMUw5WGRPS3QwbUNoZmxJNmFjL2llZjhxT2Z5?=
 =?utf-8?B?THdCSUl1V3VEKzB5V29JZFU2TXRBU1FhYTN1NzhBVldHekF6eHRzazc2c3hl?=
 =?utf-8?B?MGNVVENCRWR6N1REQmc0dWdiRlMwdU9acTBVaGczYTJYN1lSUlBMQlRsamVv?=
 =?utf-8?B?TFY2Z0h5UTYweG54RmtVQysveFZDSVkxL1Y0c2ZEdE1zQzBHUFBHS2ROekFU?=
 =?utf-8?B?STd0NHl2RE5Gd2pSaU9WTFJmT2hEK3BsanFyVjViYUtmcjZpTXNaenJCR1RE?=
 =?utf-8?B?WWFDYWVQalVUWk41dlZhV1BKVTFXc1JzN0dHK1RvU1ExczBzckppZXRpdUlr?=
 =?utf-8?B?ZFMvU3JRSDE0WjFNSmpOS3drYjV3cjNwamgwcUhNdmlMNkpjdENRNEpBMllC?=
 =?utf-8?B?SFJldzZKYk90T1A3Z0F5eUNnY2tBQy9HVG9JNlkzdGhVb3BhOE1BNThuQ1JM?=
 =?utf-8?B?QzFxOUg4YVd5aGpUKzMybi9yZk8vRmZIRERwbmZVb21TMnZDVmtUNlRlRHF5?=
 =?utf-8?B?VjVXWldFeHhlOVJDNTl5Z0d3d3A5cWE4NDdPMXJ6YkZETFRIYjdvelhHZzdz?=
 =?utf-8?B?Y1pHWFVmTG1lSWNBaXRkWlBEdFpBcWVBVHpwSFVva0RmNDA1ajVyNWhlSmt3?=
 =?utf-8?B?WVlQSVNtaGFGdCtUakxtSjRWYWpzUEZwbENZUFErSEFpWDVlWmRlZ1N2M0w5?=
 =?utf-8?B?dUd2T1d6UDBVaXdKcnhpQVZRZ3RCZUxjMytranEzTHpmL0lDbXd3VktQV2RI?=
 =?utf-8?B?dXhvQ2kyYURoL1o3Z3B0TldqZEJSS1ZBUVo3TTFNemFnVlE9PQ==?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2024 21:48:52.1140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a10795e7-91e9-459d-07dd-08dd01d17787
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8742
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_134902_002756_4A3E3361 
X-CRM114-Status: GOOD (  14.39  )
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

T24gU2F0LCBOb3YgMDksIDIwMjQgYXQgMTA6MzQgKzA4MDAgWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cgo+IOWcqCAyMDI0LzEwLzkgMjI6NDYsIFdhcWFyIEhh
bWVlZCDlhpnpgZM6Cj4gMyBuaXRzIGJlbG93Lgo+Cj4gMS4gTWFrZSB0aGUgdGl0bGUgYXMgJ3Vi
aWZzOiBhdXRoZW50aWNhdGlvbjogRml4IHVzZS1hZnRlci1mcmVlIGluCj4gdWJpZnNfdG5jX2Vu
ZF9jb21taXQnCj4KPiAyLiBBdCB0aGUgYmVnaW5pbmcgb2YgdGhlIGNvbW1pdCBtc2csIGRlc2Ny
aWJlIHRoZSBwcm9ibGVtOgo+IEFmdGVyIFROQyB0cmVlIGluc2VydGluZyh3aGljaCBtYXkgdHJp
Z2dlciBhIHpub2RlIHNwbGl0IGFuZCBjaGFuZ2UgdGhlCj4gem5vZGUtPnBhcmVudCkgYW5kIGRl
bGV0aW5nKHdoaWNoIG1heSB0cmlnZ2VyIHpub2RlIGZyZWVpbmcpLCB0aGUKPiB6bm9kZS0+Y3Bh
cmVudCh3aGljaCBzdGlsbCBwb2ludHMgdG8gYSBmcmVlZCB6bm9kZSkgbWF5IG5vdCBiZSB1cGRh
dGVkIGF0IHRoZQo+IGJlZ2luaW5nIG9mIGNvbW1pdCwgd2hpY2ggY291bGQgdHJpZ2dlciBhbiBV
QUYgcHJvYmxlbSB3aGlsZSBhY2Nlc3NpbmcKPiB6bm9kZS0+Y3BhcmVudCBpbiB3cml0ZV9pbmRl
eCgpLgoKQWxyaWdodCwgd2lsbCByZXBocmFzZSB0aGUgY29tbWl0IG1lc3NhZ2UgYSBiaXQuCgo+
Cj4+IFJ1bm5pbmcKPj4gICAgcm0gLWYgL2V0Yy90ZXN0LWZpbGUuYmluCj4+ICAgIGRkIGlmPS9k
ZXYvdXJhbmRvbSBvZj0vZXRjL3Rlc3QtZmlsZS5iaW4gYnM9MU0gY291bnQ9NjAgY29udj1mc3lu
Ywo+PiBpbiBhIGxvb3AsIHdpdGggYENPTkZJR19VQklGU19GU19BVVRIRU5USUNBVElPTmAsIEtB
U0FOIHJlcG9ydHM6Cj4+ICAgIEJVRzogS0FTQU46IHVzZS1hZnRlci1mcmVlIGluIHViaWZzX3Ru
Y19lbmRfY29tbWl0KzB4YTVjLzB4MTk1MAo+PiAgICBXcml0ZSBvZiBzaXplIDMyIGF0IGFkZHIg
ZmZmZmZmODAwYTNhZjg2YyBieSB0YXNrIHViaWZzX2JndDBfMjAvMTUzCj4+ICAgIENhbGwgdHJh
Y2U6Cj4KPiBbLi4uXQo+PiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvdG5jX2NvbW1pdC5jIGIvZnMv
dWJpZnMvdG5jX2NvbW1pdC5jCj4+IGluZGV4IGE1NWUwNDgyMmQxNi4uYTQ2NGViNTU3NTg1IDEw
MDY0NAo+PiAtLS0gYS9mcy91Ymlmcy90bmNfY29tbWl0LmMKPj4gKysrIGIvZnMvdWJpZnMvdG5j
X2NvbW1pdC5jCj4+IEBAIC02NTcsNiArNjU3LDcgQEAgc3RhdGljIGludCBnZXRfem5vZGVzX3Rv
X2NvbW1pdChzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPj4gICAJCXpub2RlLT5hbHQgPSAwOwo+PiAg
IAkJY25leHQgPSBmaW5kX25leHRfZGlydHkoem5vZGUpOwo+PiAgIAkJaWYgKCFjbmV4dCkgewo+
Cj4gMy4gSSdkIGxpa2UgdG8gYWRkIHRoZSB0aGUgYXNzZXJ0aW9uICd1Ymlmc19hc3NlcnQoYywg
IXpub2RlLT5wYXJlbnQpOycKCldvdWxkbid0IHRoZSBhc3NlcnQgYWx3YXlzIGJlIHRydWU/IFNp
bmNlIHRoZSByb290IG5vZGUgd291bGRuJ3QgaGF2ZSBhCnBhcmVudC4gT3IgYXJlIHdlIGFmcmFp
ZCBvZiBzb21lIG90aGVyIGVkZ2UgY2FzZXMgKGJ1Z3M/KSB0aGF0IG1pZ2h0CmhhdmUgYmVlbiBt
aXNzZWQgYW5kIHdhbnQgdG8gYmUgZGVmZW5zaXZlIGhlcmU/IEVpdGhlciB3YXksIEknbGwgYWRk
IHRoZQphc3NlcnQuCgo+PiArCQkJem5vZGUtPmNwYXJlbnQgPSBOVUxMOwo+PiAgIAkJCXpub2Rl
LT5jbmV4dCA9IGMtPmNuZXh0Owo+PiAgIAkJCWJyZWFrOwo+PiAgIAkJfQo+PiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
