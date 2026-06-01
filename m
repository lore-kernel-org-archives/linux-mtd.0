Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CDBCD5BD1
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIfOy/0SJb8k3nkUSqFm4CBZ4IdkYKxHtHhTDZnYJbs=; b=R3xxQytbgU7Rrt
	TuZ2u5hBIRhUxS9T07Da6GT9+1VHQCwC0O92N5W5X62TahCSneZdk68TDPiLOO/EwGedm+AIIZ+ef
	2vjYVMCHJ+vqes5h1U5zk/+ZYhQ9DzqRb0VvHWl91f6psT37jwkH6EE0t0/C32+EAmJgbJGNOoqkQ
	v+yHjXqZfphtHJS/FyX1dPzDsz0zCrif6c4Npg8z9cUxbZJinTuswyCevliPHk67Rt7s+CNqJLIAd
	+KOaxB7HZuy7daUTPYmVRWEWoMB7L4kHpzRAvzuhDyHEhb4q/rVU46Q/CB92g8QvZA9d5NwQ+3qAU
	bUYeM1OWOOpsGPRBIOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyCD-0000000ANPC-1Frz;
	Mon, 01 Jun 2026 08:40:29 +0000
Received: from mail-westus3azon11011066.outbound.protection.outlook.com ([40.107.208.66] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyCA-0000000ANOC-288N
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 08:40:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orctQkXAHNJr1B6SeqGdaHt27mfFNrTZX2Bhv1bHozYiXpjAiiDCQWa8Rzrgpme1zvlFHZ4BkTaXK6ZGgO+9XJP+KNUndCeZE4/9Z9E329UHPcW0yY/WRbKwX6v6XmB00TuaSBae4EH7E1kGrzWgBaeYghaEBRmyxTPZe79dIemeuLmB57jqvOFieVU8Sei7WzbBc2jZFiWFrUTSH0AJyL2VPnH5iUckVhQ/SxQkUHeRoScXQFdpT1j9xocHetQegMoImaAYtoG609A3sTiwxUSpQbTFiz4CCGSXbxh6yLTHEIdUGxn3JEe35knmpuUV+ODjVZWengCZ1GPYmTWC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oy+I3eAZ11agTmKD5M+F6/8uiqNEUh0bJnDLXMET9uQ=;
 b=iwZ3GBTsZT1Eu2t6ZY66T9x4voSNi4RIRsrUiS5nDJ8DXAawFY+g/EHCbgi9uVzmCm6eP3x3R4i3wCgNHJokQTch89yrXCXLBYBEH1tb/w1W4Xiq0UYWfIvfe2KOeqsip/Faf3rH1rN1U2orPT6Uwy4KeXklp7RK6mIY4UE6zWnPjp5CWkgkwHomyLhYaGm1Orv5kUcJ2qlruN6ZNScNYabX2fjqZTLAGtRXZOVzQpFFHThfshQCBm/fj5Rtnpi4Pol7g2NVCkPhccKJM21TbNXqC1vmUzmOJ+882VV+ndUc0DI/G9c084ukBXoXv0FenSIC3wyu2YDlC8MyaVFsvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy+I3eAZ11agTmKD5M+F6/8uiqNEUh0bJnDLXMET9uQ=;
 b=spH29k8Vd0ehv+ZeAPTASCTw26JG0xJ5PndirR/D9t+DQBs8OO0ZCSh14NgVWX6Z7ZOcqdLVFtyQ9aTZy4Kxm3oRe3fzuu3GS0aWEu7dYqYPl05XPDbl5dll2DWWjLUrY1wpFB+fckd1awpxCZIXFhr5cAB5VkJbDPRgxHNubFc=
Received: from CH3P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::13)
 by BLAPR10MB4964.namprd10.prod.outlook.com (2603:10b6:208:30c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 08:40:23 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::52) by CH3P220CA0002.outlook.office365.com
 (2603:10b6:610:1e8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 08:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 08:40:21 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 03:40:03 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 03:40:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 03:40:03 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6518dwid641399;
	Mon, 1 Jun 2026 03:39:59 -0500
Message-ID: <e2a354fe-ef25-401a-b8a9-4d51ad12f429@ti.com>
Date: Mon, 1 Jun 2026 14:09:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/13] spi: cadence-quadspi: enable PHY for direct
 reads and indirect writes
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-11-s-k6@ti.com> <87se7bgasn.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87se7bgasn.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|BLAPR10MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: 82dfa93f-9d5d-41e0-aacb-08debfb96b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|22082099003|18002099003|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: SgfIoDfG/Ex17JXUoLIdd8gwcLqIHHAwxqyDQR0AgWVydTxZMJ2seIpMGqSPbnBXv39Decmi6RCWUZec2/tn7k90o40RwoVndDi8sFzFwgksOE+GUMi2L/JjpXsv4MS3uxQQ41THm/UgRAeelkbhDorD9mt9Ak2NOIghbP78Jcpa32txXn6ztJj5AH8xH1V6QTEQogIKsJW/Ar/hsQlPm1iafmYaSTPwvHEqcQRlLB5Ky+Au5HYYBdH/g+DjIWldklOPTtU9vmLJXsWEyWV4UoAN3UNUcaliMWokMEddow/vk8r4T5JNM5ZS/2l5ZISevBhjhDVR1FHzSt/hWlMqnnLWxSLPXi15urDlmROTaryPWZJl1NWoJecQusCcRl2AKRCXdteEv/X24zJnlQxFFhMmG9gEVT7LVN1U6KW+3uF2gW8wR95dCOUU0NGFBDGSX68jD4yjz+BJE+KGPQJQT29LNALo5XCfayudDMYluLW8VUbugs8f43XhO/UPigCiELB9QcVlGHvlmg/o7MBrKXMPiAqPM7/wLJ9tv16WCuK6/kXztV6sc7IXi1lzwLYZHXuxaUkz8P5Av3uaLb4pn4lV6uNsXgsgL/uMoSJabKOWk1sMl7Dm17mHmlPc2U9rQro7+ZxBoIjK4PeRiWH7KQz6abaS7M3KlcFcIVe4q0+UHUu6mbtupHLhu/pVK4BhPRTdCvg0spcFJrxr1GJdEb4tJxJxwLFP5macVc2As+I=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 45NxWKjXXQ3oSuRPsgfC6EdPZqertFECJvnL4s4ky6VUXLQaFI9XOFZ+us34/qfcB95mRbrHd+wuyT/1CjI46E4K4rJzDlnN5a7wrUeDY+60HKhX0OGpVe0SxN4A0kgSwV65isXNAEIqalcaDmP/bbDG6HjUC9rBM5ZfAamK8/16tXg7tuCYe1+QHbP+VU5YlqaakPTywTOKSFSxOZNPwuSYSc+TF1Kc21tb7TAk87/yDRC8zfK/93zd39oHgGll7TsiARcFUuewzRbx8iP3BoHQlOjSj6lj4iC3Gvv7QCXZaQO3bW40TtYZO8ZjDj7yEsWy7YkP7QCIA3OCCKQRz8+xwLcSK+O5FSHx/+CchaPFeiK/vqPXWl9EHE/4qcXLOy//1uMzVkCb8cbktT0j+gCtgUN9kw9Qn7D9BhRvZktSPFaX91UwnOlvbxkeOV4J
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:40:21.7687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82dfa93f-9d5d-41e0-aacb-08debfb96b02
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014026_555985_AFAA9088 
X-CRM114-Status: GOOD (  23.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyOC8wNS8yNiAxNDozOSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBPbiAyNy8wNS8yMDI2
IGF0IDIzOjI1OjI0ICswNTMwLCBTYW50aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6
Cj4gCj4+IEFmdGVyIFBIWSB0dW5pbmcgY29tcGxldGVzLCBkYXRhIHRyYW5zZmVycyBzdGlsbCB1
c2UgdGhlIGRlZmF1bHQKPj4gcmVhZC1jYXB0dXJlIHBhdGguIFRoZSBQSFkgcGlwZWxpbmUgbXVz
dCBiZSBhY3RpdmF0ZWQgYXJvdW5kIGVhY2gKPj4gZWxpZ2libGUgdHJhbnNmZXIgdG8gYmVuZWZp
dCBmcm9tIHRoZSBjYWxpYnJhdGVkIGRlbGF5IHNldHRpbmdzLgo+Pgo+PiBBZGQgY3FzcGlfcGh5
X2VuYWJsZSgpIHRvIHRvZ2dsZSBQSFkgbW9kZS4gRW5hYmxpbmcgc2V0cyB0aGUgY2FsaWJyYXRl
ZAo+PiByZWFkLWNhcHR1cmUgZGVsYXksIGFzc2VydHMgUEhZX0VOIGFuZCBQSFlfUElQRUxJTkUs
IGFuZCBkZWNyZW1lbnRzIHRoZQo+PiBkdW1teSBjeWNsZSBjb3VudCBieSBvbmUgc2luY2UgdGhl
IFBIWSBwaXBlbGluZSBhYnNvcmJzIHRoYXQgbGF0ZW5jeS4KPj4gRGlzYWJsaW5nIHJldmVyc2Vz
IGFsbCB0aHJlZS4gUmV0dXJucyBjcXNwaV93YWl0X2lkbGUoKSBzbyBjYWxsZXJzIGNhbgo+PiBh
Ym9ydCBpZiB0aGUgY29udHJvbGxlciBzdGFsbHMgb24gZW5hYmxlOyBkaXNhYmxlIGlzIGJlc3Qt
ZWZmb3J0Lgo+Pgo+PiBTcGxpdCBjcXNwaV9kaXJlY3RfcmVhZF9leGVjdXRlKCkgc28gUEhZLWVs
aWdpYmxlIHJlYWRzIHJ1biBETUEgb3ZlciB0aGUKPj4gMTYtYnl0ZS1hbGlnbmVkIG1pZGRsZSBz
ZWN0aW9uIHdpdGggUEhZIGFjdGl2ZSwgd2hpbGUgdW5hbGlnbmVkIGhlYWQgYW5kCj4+IHRhaWwg
Ynl0ZXMgYXJlIHRyYW5zZmVycmVkIHdpdGhvdXQgUEhZLiBQSFkgaXMgdXNlZCB3aGVuIHVzZV9w
aHkgaXMgc2V0LAo+PiB0aGUgdHJhbnNmZXIgZXhjZWVkcyAxNiBieXRlcywgYW5kIHRoZSBmcmVx
dWVuY3kgbWF0Y2hlcyB0aGUgdHVuZWQgcmF0ZS4KPj4gY3FzcGlfbWVtY3B5X2Zyb21pbygpIGhh
bmRsZXMgc21hbGwgYW5kIG5vbi1ETUEtYWJsZSB0cmFuc2ZlcnMsIHdpdGgKPj4gc3BlY2lhbCBo
YW5kbGluZyBmb3IgOEQtOEQtOEQgdG8gZW5zdXJlIDItYnl0ZS1hbGlnbmVkIEkvTyBhY2Nlc3Nl
cy4KPj4KPj4gRm9yIGluZGlyZWN0IHdyaXRlcywgUEhZIGlzIGVuYWJsZWQgZm9yIHRyYW5zZmVy
cyBvZiBhdCBsZWFzdCAxIEtCCj4gCj4ga2lCIDotKQo+IAo+PiB3aGVyZSB0aGUgc2V0dXAgb3Zl
cmhlYWQgaXMgYW1vcnRpemVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW50aG9zaCBLdW1hciBL
IDxzLWs2QHRpLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNw
aS5jIHwgMTgxICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAxNzEgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktY2Fk
ZW5jZS1xdWFkc3BpLmMKPj4gaW5kZXggNzIyMDhkMzc2MzA1Li44MGU3YzU3MmFiODAgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYwo+PiArKysgYi9kcml2
ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMKPj4gQEAgLTU2NCw2ICs1NjQsNjEgQEAgc3Rh
dGljIHZvaWQgY3FzcGlfcmVhZGRhdGFfY2FwdHVyZShzdHJ1Y3QgY3FzcGlfc3QgKmNxc3BpLCBj
b25zdCBib29sIGJ5cGFzcywKPj4gICAJd3JpdGVsKHJlZywgcmVnX2Jhc2UgKyBDUVNQSV9SRUdf
UkVBRENBUFRVUkUpOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyBpbnQgY3FzcGlfcGh5X2VuYWJs
ZShzdHJ1Y3QgY3FzcGlfZmxhc2hfcGRhdGEgKmZfcGRhdGEsIGJvb2wKPj4gZW5hYmxlKQo+IAo+
IEknbSBmaW5lIHdpdGggdGhlIGxvZ2ljLCBqdXN0IHRoZSBuYW1pbmcgaXMgdmVyeSAiVEkiIHNw
ZWNpZmljIGhlcmUuIENhbgo+IHdlIG5hbWUgdGhlIGhlbHBlciAiY3FzcGlfdHVuZV9waHkoZl9w
ZGF0YSwgZW5hYmxlKSI/Cj4gCj4gWy4uLl0KPiAKPj4gICBzdGF0aWMgaW50IGNxc3BpX2V4ZWNf
Zmxhc2hfY21kKHN0cnVjdCBjcXNwaV9zdCAqY3FzcGksIHVuc2lnbmVkIGludCByZWcpCj4+ICAg
ewo+PiAgIAl2b2lkIF9faW9tZW0gKnJlZ19iYXNlID0gY3FzcGktPmlvYmFzZTsKPj4gQEAgLTEx
OTEsNiArMTI0Niw3IEBAIHN0YXRpYyBpbnQgY3FzcGlfaW5kaXJlY3Rfd3JpdGVfZXhlY3V0ZShz
dHJ1Y3QgY3FzcGlfZmxhc2hfcGRhdGEgKmZfcGRhdGEsCj4+ICAgCXZvaWQgX19pb21lbSAqcmVn
X2Jhc2UgPSBjcXNwaS0+aW9iYXNlOwo+PiAgIAl1bnNpZ25lZCBpbnQgcmVtYWluaW5nID0gbl90
eDsKPj4gICAJdW5zaWduZWQgaW50IHdyaXRlX2J5dGVzOwo+PiArCWJvb2wgdXNlX3BoeV93cml0
ZTsKPj4gICAJaW50IHJldDsKPj4gICAKPj4gICAJaWYgKCFyZWZjb3VudF9yZWFkKCZjcXNwaS0+
cmVmY291bnQpKQo+PiBAQCAtMTIyNiw2ICsxMjgyLDE1IEBAIHN0YXRpYyBpbnQgY3FzcGlfaW5k
aXJlY3Rfd3JpdGVfZXhlY3V0ZShzdHJ1Y3QgY3FzcGlfZmxhc2hfcGRhdGEgKmZfcGRhdGEsCj4+
ICAgCWlmIChjcXNwaS0+YXBiX2FoYl9oYXphcmQpCj4+ICAgCQlyZWFkbChyZWdfYmFzZSArIENR
U1BJX1JFR19JTkRJUkVDVFdSKTsKPj4gICAKPj4gKwkvKiBVc2UgUEhZIG9ubHkgZm9yIGxhcmdl
IHdyaXRlcyB3aGVyZSBzZXR1cCBvdmVyaGVhZCBpcyBhbW9ydGl6ZWQgKi8KPj4gKwl1c2VfcGh5
X3dyaXRlID0gbl90eCA+PSBTWl8xSyAmJiBmX3BkYXRhLT51c2VfcGh5Owo+IAo+IE1heWJlIGFs
c28gImZfcGRhdGEtPnVzZV90dW5lZF9waHk/CgpZZWFoLCBJJ2xsIHJlbmFtZSB0aGVtIGluIHY0
LgoKPiAKPj4gKwlpZiAodXNlX3BoeV93cml0ZSkgewo+PiArCQlyZXQgPSBjcXNwaV9waHlfZW5h
YmxlKGZfcGRhdGEsIHRydWUpOwo+PiArCQlpZiAocmV0KQo+PiArCQkJZ290byBmYWlsd3I7Cj4+
ICsJfQo+PiArCj4+ICAgCXdoaWxlIChyZW1haW5pbmcgPiAwKSB7Cj4+ICAgCQlzaXplX3Qgd3Jp
dGVfd29yZHMsIG1vZF9ieXRlczsKPj4gICAKPj4gQEAgLTEyNjYsNiArMTMzMSw5IEBAIHN0YXRp
YyBpbnQgY3FzcGlfaW5kaXJlY3Rfd3JpdGVfZXhlY3V0ZShzdHJ1Y3QgY3FzcGlfZmxhc2hfcGRh
dGEgKmZfcGRhdGEsCj4+ICAgCQlnb3RvIGZhaWx3cjsKPj4gICAJfQo+PiAgIAo+PiArCWlmICh1
c2VfcGh5X3dyaXRlKQo+PiArCQljcXNwaV9waHlfZW5hYmxlKGZfcGRhdGEsIGZhbHNlKTsKPj4g
Kwo+PiAgIAkvKiBEaXNhYmxlIGludGVycnVwdC4gKi8KPj4gICAJd3JpdGVsKDAsIHJlZ19iYXNl
ICsgQ1FTUElfUkVHX0lSUU1BU0spOwo+PiAgIAo+PiBAQCAtMTI3Nyw2ICsxMzQ1LDkgQEAgc3Rh
dGljIGludCBjcXNwaV9pbmRpcmVjdF93cml0ZV9leGVjdXRlKHN0cnVjdCBjcXNwaV9mbGFzaF9w
ZGF0YSAqZl9wZGF0YSwKPj4gICAJcmV0dXJuIDA7Cj4+ICAgCj4+ICAgZmFpbHdyOgo+PiArCWlm
ICh1c2VfcGh5X3dyaXRlKQo+PiArCQljcXNwaV9waHlfZW5hYmxlKGZfcGRhdGEsIGZhbHNlKTsK
Pj4gKwo+PiAgIAkvKiBEaXNhYmxlIGludGVycnVwdC4gKi8KPj4gICAJd3JpdGVsKDAsIHJlZ19i
YXNlICsgQ1FTUElfUkVHX0lSUU1BU0spOwo+PiAgIAo+PiBAQCAtMTQ0OCw4ICsxNTE5LDE1IEBA
IHN0YXRpYyB2b2lkIGNxc3BpX3J4X2RtYV9jYWxsYmFjayh2b2lkICpwYXJhbSkKPj4gICAJY29t
cGxldGUoJmNxc3BpLT5yeF9kbWFfY29tcGxldGUpOwo+PiAgIH0KPj4gICAKPj4gLXN0YXRpYyBp
bnQgY3FzcGlfZGlyZWN0X3JlYWRfZXhlY3V0ZShzdHJ1Y3QgY3FzcGlfZmxhc2hfcGRhdGEgKmZf
cGRhdGEsCj4+IC0JCQkJICAgICB1X2NoYXIgKmJ1ZiwgbG9mZl90IGZyb20sIHNpemVfdCBsZW4p
Cj4+ICtzdGF0aWMgYm9vbCBjcXNwaV91c2VfcGh5KHN0cnVjdCBjcXNwaV9mbGFzaF9wZGF0YSAq
Zl9wZGF0YSwKPj4gKwkJCSAgY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+PiArewo+PiAr
CXJldHVybiBmX3BkYXRhLT51c2VfcGh5ICYmIG9wLT5kYXRhLm5ieXRlcyA+IDE2ICYmCj4gCj4g
V2h5IGlzIHRoZSBjaGVjayBsb29raW5nIGZvciAxNiBoZXJlLCBhbmQgMWtpQiBhYm92ZT8KCkRp
cmVjdCByZWFkcyBoYXZlIHZlcnkgbGl0dGxlIHBlci1vcCBvdmVyaGVhZCwgc28gZW5hYmxpbmcg
UEhZIGlzCmJlbmVmaWNpYWwgZXZlbiBmb3IgcmVsYXRpdmVseSBzbWFsbCB0cmFuc2ZlcnMuICg+
IDE2KQoKSW5kaXJlY3Qgd3JpdGVzLCBvbiB0aGUgb3RoZXIgaGFuZCwgaW5jdXIgc2lnbmlmaWNh
bnRseSBoaWdoZXIgc2V0dXAKY29zdCwgcmVzdWx0aW5nIGluIG11Y2ggbGFyZ2VyIGJyZWFrIHBv
aW50LiAoPiAxa2lCKQoKPiAKPj4gKwkgICAgICAgb3AtPm1heF9mcmVxID09IGZfcGRhdGEtPm1h
eF9jbGtfcmF0ZTsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBjcXNwaV9kaXJlY3RfcmVhZF9k
bWEoc3RydWN0IGNxc3BpX2ZsYXNoX3BkYXRhICpmX3BkYXRhLCB1X2NoYXIgKmJ1ZiwKPj4gKwkJ
CQkgbG9mZl90IGZyb20sIHNpemVfdCBsZW4pCj4+ICAgewo+PiAgIAlzdHJ1Y3QgY3FzcGlfc3Qg
KmNxc3BpID0gZl9wZGF0YS0+Y3FzcGk7Cj4+ICAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZjcXNw
aS0+cGRldi0+ZGV2Owo+PiBAQCAtMTQ2MSwxOSArMTUzOSwxNCBAQCBzdGF0aWMgaW50IGNxc3Bp
X2RpcmVjdF9yZWFkX2V4ZWN1dGUoc3RydWN0IGNxc3BpX2ZsYXNoX3BkYXRhICpmX3BkYXRhLAo+
PiAgIAlkbWFfYWRkcl90IGRtYV9kc3Q7Cj4+ICAgCXN0cnVjdCBkZXZpY2UgKmRkZXY7Cj4+ICAg
Cj4+IC0JaWYgKCFjcXNwaS0+cnhfY2hhbiB8fCAhdmlydF9hZGRyX3ZhbGlkKGJ1ZikpIHsKPj4g
LQkJbWVtY3B5X2Zyb21pbyhidWYsIGNxc3BpLT5haGJfYmFzZSArIGZyb20sIGxlbik7Cj4+IC0J
CXJldHVybiAwOwo+PiAtCX0KPiAKPiBUaGlzIChhbmQgY2hhbmdlcyBiZWxvdykgZG9uJ3Qgc2Vl
bSB0byBiZSBkaXJlY3RseSByZWxhdGVkIHRvIHRoZSBQSFkKPiBhZGRpdGlvbiwgY291bGQgd2Ug
aGF2ZSB0aG9zZSBjaGFuZ2VzIGRvbmUgaW4gYSBzZXBhcmF0ZWQgcGF0Y2gsIGJlZm9yZQo+IGlu
dHJvZHVjaW5nIFBIWSB0dW5pbmcgdXNlPwo+IAo+PiAtCj4+ICAgCWRkZXYgPSBjcXNwaS0+cnhf
Y2hhbi0+ZGV2aWNlLT5kZXY7Cj4+ICAgCWRtYV9kc3QgPSBkbWFfbWFwX3NpbmdsZShkZGV2LCBi
dWYsIGxlbiwgRE1BX0ZST01fREVWSUNFKTsKPj4gICAJaWYgKGRtYV9tYXBwaW5nX2Vycm9yKGRk
ZXYsIGRtYV9kc3QpKSB7Cj4+ICAgCQlkZXZfZXJyKGRldiwgImRtYSBtYXBwaW5nIGZhaWxlZFxu
Iik7Cj4+ICAgCQlyZXR1cm4gLUVOT01FTTsKPj4gICAJfQo+PiAtCXR4ID0gZG1hZW5naW5lX3By
ZXBfZG1hX21lbWNweShjcXNwaS0+cnhfY2hhbiwgZG1hX2RzdCwgZG1hX3NyYywKPj4gLQkJCQkg
ICAgICAgbGVuLCBmbGFncyk7Cj4+ICsJdHggPSBkbWFlbmdpbmVfcHJlcF9kbWFfbWVtY3B5KGNx
c3BpLT5yeF9jaGFuLCBkbWFfZHN0LCBkbWFfc3JjLCBsZW4sCj4+ICsJCQkJICAgICAgIGZsYWdz
KTsKPiAKPiBOb3QgcmVsYXRlZCB0byB0aGUgY2hhbmdlLCBpc24ndCBpdD8KClllYWgsIG5vdCBy
ZWxhdGVkIEknbGwgbGVhdmUgdGhpcyB1bnRvdWNoZWQuIEhvd2V2ZXIsIHRoZSBjaGFuZ2VzIGFi
b3ZlCmFuZCBiZWxvdyBhcmUgcmVsYXRlZCBhbmQgYmVsb25nIHRvZ2V0aGVyIGluIHRoZSBzYW1l
IHBhdGNoLgoKPiAKPj4gICAJaWYgKCF0eCkgewo+PiAgIAkJZGV2X2VycihkZXYsICJkZXZpY2Vf
cHJlcF9kbWFfbWVtY3B5IGVycm9yXG4iKTsKPj4gICAJCXJldCA9IC1FSU87Cj4+IEBAIC0xNTA3
LDYgKzE1ODAsOTQgQEAgc3RhdGljIGludCBjcXNwaV9kaXJlY3RfcmVhZF9leGVjdXRlKHN0cnVj
dCBjcXNwaV9mbGFzaF9wZGF0YSAqZl9wZGF0YSwKPj4gICAJcmV0dXJuIHJldDsKPj4gICB9Cj4+
ICAgCj4gCj4gWy4uLl0KPiAKPj4gICBzdGF0aWMgc3NpemVfdCBjcXNwaV9yZWFkKHN0cnVjdCBj
cXNwaV9mbGFzaF9wZGF0YSAqZl9wZGF0YSwKPj4gICAJCQkgIGNvbnN0IHN0cnVjdCBzcGlfbWVt
X29wICpvcCkKPj4gICB7Cj4+IEBAIC0xNTI0LDcgKzE2ODUsNyBAQCBzdGF0aWMgc3NpemVfdCBj
cXNwaV9yZWFkKHN0cnVjdCBjcXNwaV9mbGFzaF9wZGF0YSAqZl9wZGF0YSwKPj4gICAKPj4gICAJ
aWYgKChjcXNwaS0+dXNlX2RpcmVjdF9tb2RlICYmICgoZnJvbSArIGxlbikgPD0gY3FzcGktPmFo
Yl9zaXplKSkgfHwKPj4gICAJICAgIChjcXNwaS0+ZGRhdGEgJiYgY3FzcGktPmRkYXRhLT5xdWly
a3MgJiBDUVNQSV9OT19JTkRJUkVDVF9NT0RFKSkKPj4gLQkJcmV0dXJuIGNxc3BpX2RpcmVjdF9y
ZWFkX2V4ZWN1dGUoZl9wZGF0YSwgYnVmLCBmcm9tLCBsZW4pOwo+PiArCQlyZXR1cm4gY3FzcGlf
ZGlyZWN0X3JlYWRfZXhlY3V0ZShmX3BkYXRhLCBvcCk7Cj4gCj4gVGhpcyBjaGFuZ2UgY291bGQg
YWxzbyBiZSBkb25lIGluIGEgZGlmZmVyZW50IGNvbW1pdC4KPiAKClRoYW5rcywKU2FudGhvc2gu
Cgo+PiAgIAo+PiAgIAlpZiAoY3FzcGktPnVzZV9kbWFfcmVhZCAmJiBkZGF0YSAmJiBkZGF0YS0+
aW5kaXJlY3RfcmVhZF9kbWEgJiYKPj4gICAJICAgIHZpcnRfYWRkcl92YWxpZChidWYpICYmICgo
ZG1hX2FsaWduICYgQ1FTUElfRE1BX1VOQUxJR04pID09IDApKQo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
