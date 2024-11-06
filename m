Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9E8D59F52
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 16:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJ5AdiqnXdpodCmco3kVG7wKj5AM3qweiWT5VdormOI=; b=AU/k9EfOfZVWbQ
	mxGrlGkQbHKA81Ka9S1HVSAJWUIb+uUXEELYWXGe5xdocOf+uwqJWpej0848v6zxV0vNojX2mV9rB
	4Y5UeSKaTKEV4CYfZ8ow3FjJJVMaeJYQi66dcofKhzD/eCrds+bj95xEq/TmStmW+uTMSMEq5qMJA
	B5p5Hl07ZSMz9V8hMu7FApebzRX6eIvjO2V8WXT4W9jTgFpqHDkLHsk4tXjqLFgQPE66I6txnbdFg
	LQC8lXTcwF9QqqHKkas7FxGlb0mmm3+55pEGIWCLjy5EsjdkN6UzdSLQ9EhsiWZOKQTSCYks6VOFJ
	KcZXAcACtaKM1Z/yif0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jCp-000000045SF-2vy4;
	Wed, 06 Nov 2024 16:48:31 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jCn-000000045RY-1lPE
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 16:48:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVG9qn5u8D7b8VOxx7Lk4y2DQF19CagxIfzT0YXbZHP0HV0LdqXf8UH4v6Hl720Jwh4GeG8+1kQs5k7xIgOt0y4k5k/XM10+2GPZpdSuPqw7o0qV02zkA7jYgCF3RSyLMcgn3Jg3Tt63kdz5r42bag4tWB8nfQVpjhH0kQegkSKO5fepEaktfC6ElXSEXJhSWjvxxljsP0+xdEzQ979n8cwJawks/JEVcOie68b/ldrONOqZ1NzkOoRD9eZcyZt59vFTsB9kQ9qrbdH37Ww0BN/6NQICFCcg7JiEMJhk2RtZ7QflXjb5iHmRm1ikTnLEfMDTBDGXzHFabLXi6mx1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6d+SQNSFeCVTazYEjOpq4fAzrai47BD/wMkPD1t5ols=;
 b=MXhus4URmlcRkMUG5US0w/ynJ0mpuD2nHEYv6gCSCBIiGTUZxaE+v4ZC3EL2wiv53+71gCgm86TNvVPSbsPViZwGesecN/FkjwqKAQ21B+n+xCIGCs/XNvstWZGAShkmgJXosnSMwtHNZ0cd2YAwJxRvmW+zihqm+UVmlYLJPCWcOir7m8eIC7zGtTPRqXzZ5kcGi7FMGr6TTB9HHb2EPdOHpXn661RSJ1chxVj/T7KMljriNYAOL34BTmAT5F75dXjJMLNg/+ezSywCypRBoHn+rk33WRNMOA59giHuPCh83wSL8kgTrG7i3ZgaLXObaHfkpQa5sQgWgSHaPcee0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6d+SQNSFeCVTazYEjOpq4fAzrai47BD/wMkPD1t5ols=;
 b=ha9MMNcwJKc4oKFIzLs5gp6+/P7uR1DCNl4MVadH1nInHgwMS+AMXAI1KXiAugS+EFeZK2GBnfzqiq1mD8MlVIWsSZeBSkjpMks1lwx7oD97YQK2Yp2Cl0e3kfF8kd3gH7ftednEdJiySDCodnJNXUmj/caeTIBr2ogA+TCmlvg=
Received: from DU6P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::17)
 by GV1PR02MB8609.eurprd02.prod.outlook.com (2603:10a6:150:96::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 16:48:22 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::ef) by DU6P191CA0023.outlook.office365.com
 (2603:10a6:10:540::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 16:48:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 16:48:22 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 17:48:17 +0100
From: Waqar Hameed <waqar.hameed@axis.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
CC: Richard Weinberger <richard@nod.at>, <kernel@axis.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ubifs: Move update of cnt in get_znodes_to_commit
In-Reply-To: <4751d3df-99a6-ec67-1175-ea5375290726@huawei.com> (Zhihao Cheng's
	message of "Fri, 18 Oct 2024 09:24:03 +0800")
References: <ebf1570e3d28462a97b1a595794e1969a4c27d81.1729191143.git.waqar.hameed@axis.com>
	<4751d3df-99a6-ec67-1175-ea5375290726@huawei.com>
Date: Wed, 6 Nov 2024 17:48:17 +0100
Message-ID: <pndo72s2tri.fsf@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C3:EE_|GV1PR02MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1585bd-2872-4600-d03f-08dcfe82d33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUgxdjRuUGYyUUlTTlNCZVNGTW9JeW1scGVSYVREU2JPKzcraXAxVGMvZEsr?=
 =?utf-8?B?MEEzRk52UU5VKyttdUEybVlLVDZlWHNseEo5YjRkNlVFbGFzcXlDTHgzS1NT?=
 =?utf-8?B?aHIyYzJkbldUWkVwUDNISDkwMW5rYXBFMlpZZk14ZWFmWjdLc05BajcrM2Rs?=
 =?utf-8?B?b2YvQmFmeEpEUHpPV09iNTNoMVBsRnRNSDZBSXUwMGo1MTFkd0NUMTJpeEdK?=
 =?utf-8?B?QXdKVDRIU1NHREdGRzdqYUx1RVB4c1lyNGEwSFZWcFZtVW55WGdZc21RNk16?=
 =?utf-8?B?d2t6bzFPancrbGZYWEh4a29vb2hQUGVrdUR0U2RLMlpHYW00MXA1SUVHeHpD?=
 =?utf-8?B?bTlWNnp1ay95QXg3YW5oZU83ZzZQVi9kampHVXIxWmZOK2RLQzNzZ3ZTdFVt?=
 =?utf-8?B?VUVjcW91c3FUdGZvNTRWaGRUdFZnOVRDaEp2V21BenZkMnJjZHpmL2liQ05S?=
 =?utf-8?B?eXk2eENKQ2tpSjg2aGtzdWZuK0svZUh0U1ZsYi9yakRqTjA3WUhmS2ZLM3d4?=
 =?utf-8?B?RjBueUdJY2NwTTVvZzBhV01QVlljeXZGZ1B2VG9pK25ObE50Z2ZHbFFrOEhm?=
 =?utf-8?B?Uk5aOWlMTkswcTBGNzAyRGxiWmNpNlJFOFlIWHBuSkozMUovVGN2QzFRNllh?=
 =?utf-8?B?VG40SjduTVNrWnVYN2NxbDdNOGEwL0VZQlJodm5idHRCb1dMSldneWdpQXN0?=
 =?utf-8?B?OGVSZlFKUHhHTXVaMDlkQURZWGNjRnlYTDZKQzBCY0EveUVXUnA2a2hkcmhR?=
 =?utf-8?B?NWVsdXM0R2RiSzlWcWNHc3gyWUQ2ZjB4QStyL0ZrakgweU1HTm0rN1NkdUc1?=
 =?utf-8?B?N0NOV3RsbmVVNVo1dFkzN2xNNkphUnJVazEya1g0UllmYnhpTVFBQ2VuMkNs?=
 =?utf-8?B?dzVIdnVhMXRZVmxobXA5Mk92U3Jodk1DSVluNVF2N0I5OTAvZ3J5dzM2MGVO?=
 =?utf-8?B?MllXRTF3Q0l2WlN5ay9ha1RWWCsrTHJwditzNXZPNmxRaytlNFNQODlqSGtj?=
 =?utf-8?B?ZnhnL3gwK2Q1MWNBR3NOZjNtU2hzV3NEdW9iMlovUlNueTRQZXlvZmRmbmJh?=
 =?utf-8?B?aXplUXM0aXVTdVJGTUNoWU41ZEdNb3Z0KzRjeXl6c3czcG1IVGVSNTZiYVp3?=
 =?utf-8?B?bGNQVmFva3Bvbzc4YmY0THdOdklHUjdtT3VrVTBqaXhxL1o5VDlMN2VuNkFO?=
 =?utf-8?B?NDNqOEpGYjF5Q1E1OXhjNVlIZUhDc0pWTm5qdVpmYVY0V1Z0Z09aVXV4UFdy?=
 =?utf-8?B?eExZT05tcmVxMGpPZG9kWFRqTWxyTGFpRG5HVTIwNUhjTk0rcFIvZjJra2w2?=
 =?utf-8?B?TU51c3o2bmg4bDVXaUR1WTM1V3BnVjhsMmtQVnVzV2FWWExyY1lqdWJEYXQw?=
 =?utf-8?B?dzVsYjZmNTVGaHgwR1BscjRiRko0NDFYK2F6TkJ2MjFnZGRkbFRKS0YvbzU4?=
 =?utf-8?B?eWlTbUxaYnRjWFoyMlNIcFNBdHBBRWlOUUMxWFlmbGRPRE11RmNCSVFLOHJO?=
 =?utf-8?B?R1BndGllUnp5bTAwKzBobGFIWTZnNkt4RTI0aHJ3eUkvdEMyZHZGcWMya080?=
 =?utf-8?B?YWVWQ1lUS2dhc0dMVkJzdHFMR2NVeFVLOGVKeUwycE9zbFUxTHRhdTAzZVlR?=
 =?utf-8?B?Q281U2g4b3VnLytCODJvd3MvVjJ4dGxMbEw4MThRVzhaZGFGRklUOG1NNGh0?=
 =?utf-8?B?R3Y4MFloRnJyOUFaTHpjbUJ2WG9aQ3ZwL2huc3J2eVBsbWgyUUp2U01OeEdQ?=
 =?utf-8?B?clFVdFBNVHlXRm1uUFcrWENpVkhoN0ErSjBaOGtLMVdoR1JPUVcrdWJTYUNY?=
 =?utf-8?B?Q2xEalZkK0ZSV3BhaC9RdC9zWklmTXE1SndNQXJPTDBZTUFwelNzWUdyTHdD?=
 =?utf-8?B?VGJNeGRVckEyZDRYY0FHQ29BNTBROFBCemZCL0RHU0dHaWc9PQ==?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 16:48:22.2324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1585bd-2872-4600-d03f-08dcfe82d33c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_084829_483171_C7B8308A 
X-CRM114-Status: GOOD (  14.92  )
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

T24gRnJpLCBPY3QgMTgsIDIwMjQgYXQgMDk6MjQgKzA4MDAgWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cgo+IOWcqCAyMDI0LzEwLzE4IDI6NDEsIFdhcWFyIEhh
bWVlZCDlhpnpgZM6Cj4+IFRoZXJlIGlzIG5vIG5lZWQgdG8gdXBkYXRlIGBjbnRgIGZvciB0aGUg
Zmlyc3QgZGlydHkgbm9kZSBqdXN0IGJlZm9yZQo+PiB0aGUgbG9vcCwgYW5kIHRoZW4gYWdhaW4g
dXBkYXRlIGl0IGF0IHRoZSBlbmQgb2YgZWFjaCBpdGVyYXRpb24gZm9yIHRoZQo+PiBuZXh0IGRp
cnR5IG5vZGVzLiBKdXN0IHVwZGF0ZSBgY250YCBhdCB0aGUgYmVnaW5uaW5nIG9mIGVhY2ggaXRl
cmF0aW9uCj4+IGluc3RlYWQuIFRoaXMgd2F5LCB0aGUgZmlyc3QgaXRlcmF0aW9uIHdpbGwgY291
bnQgdGhlIGZpcnN0IGRpcnR5IG5vZGUKPj4gYW5kIGFueSBzdWJzZXF1ZW50IGl0ZXJhdGlvbnMg
d2lsbCBjb3VudCB0aGUgbmV4dCBkaXJ0eSBub2Rlcy4KPgo+IFdlbGwsIGZyb20gbXkgb3duIHZp
ZXcsIEkgcHJlZmVyIHRoZSBvcmlnbmFsIHN0eWxlIGJlY2F1c2UgaXQgbG9va3MgbW9yZQo+IHJl
YWRhYmxlLgo+ICAgYy0+Y25leHQgPSBmaW5kX2ZpcnN0X2RpcnR5KGMtPnpyb290Lnpub2RlKTsK
PiAgIHpub2RlID0gYy0+ZW5leHQgPSBjLT5jbmV4dDsKPiAgIGNudCArPSAxOyAgLy8gV2UgZ2V0
IHRoZSBmaXJzdCBvbmUuCj4KPiAgIHdoaWxlICgxKSB7Cj4gICAgIGNuZXh0ID0gZmluZF9uZXh0
X2RpcnR5KHpub2RlKTsKPiAgICAgem5vZGUgPSBjbmV4dDsKPiAgICAgY250ICs9IDE7IC8vIFdl
IGdldCBhbm90aGVyIG9uZS4KPiAgIH0KPgo+IEFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0Y2gsIHRo
ZSBpbnRlbnRpb24gb2YgJ2NudCcgdXBkYXRpbmcgaXMgbm90IHNvIG9idmlvdXNseS4KPiBIb3dl
dmVyLCBpdCBkb2VzIHJlZHVjZSB0aGUgZHVwbGljYXRlZCBjb2Rlcy4gSSB3aWxsIGFkZCBhbiBh
Y2tlZC1ieSB0byBsZXQKPiBSaWNoYXJkIGRldGVybWluZSB3aGV0aGVyIG9yIG5vdCBhcHBseSB0
aGlzIHBhdGNoLgo+Cj4gQWNrZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdl
aS5jb20+CgpbLi4uXQoKQXMgeW91IHNheSwgdGhlcmUgY291bGQgYmUgYSBzdWJqZWN0aXZlIGFy
Z3VtZW50IGhlcmUgKGZvciBtZSBpdCB3YXMgdGhlCm90aGVyIHdheSBhcm91bmQgOikgKSwgYW5k
IHRoYXQgdGhlIG9iamVjdGl2ZSBhcmd1bWVudCBpcyB0aGF0IGl0CnJlZHVjZXMgdGhlIGNvZGUu
IAoKSSdtIGZpbmUgd2l0aCBlaXRoZXIhIFJpY2hhcmQsIHlvdSBkZWNpZGUgdGhlbi4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
