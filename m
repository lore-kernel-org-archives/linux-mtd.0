Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B561CD6E4C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/T6R3W7iYtpC5+E6n0EnIPNgNEzoZ5BpT9MGvpszMPs=; b=mUNdLAkxwUD9f2
	QcUt1Rqvs2XwrSvaJwFvM1BGrt91U7xBCJohtK9Tzxj8KwwqHfw4jGzHyupllNQ+gV66sX4m0mBZ1
	RS6wF6EX1mZxo0ZyPhOtbe0F/WDjho4YnkVhGizW9AQ7grtok/cL3rmk4AnNh1K8JRhlH2NKXARQ/
	gw1twDCgorJUCI/pkhRg/DT/Y8ZtzhCiwFuwyHhOxHICTSaTms/1KCKmHm7oti3Qe/SGcKh5q5Sqa
	l8182ZHCTO/2KsD+VOOuICP5UolbzLzz8CHGHaa1ZxqwHGHa5IyiJzDS6kZ6qfsRyydW/7qBN7ZHS
	g2AZXDEwjFPdkUD/ba4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxbx-0000000AKN5-2gAv;
	Mon, 01 Jun 2026 08:03:01 +0000
Received: from mail-northcentralusazon11012066.outbound.protection.outlook.com ([40.107.200.66] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxbt-0000000AKMX-23lz
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 08:03:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fON+p9Xef4WbDbaExmZBinD/Qrfm+Qv0oag8BPO24v7ogBRQrPF0NDWxOz6UvKV1x2ghStNXhYmz+0U5nO+ePfO61VzZhoNbPHKwsh+m/Y//0l/Gj5t1a9YwmykFanBnQgILGVLBOt+VYpqE9tQkj80sdc2x5mlNm0LC8h9BjVojOF462r1izshWZoy3esrFaIPNNUINUinoJxIGkIrjjMEQqyGV8EA9J3Mvf9dB9/nKkocjcE+umSHQmTie5+JKPC1CGOHXHzeH8D12EkVKJs5Ylh4CdcG8+OTikrbCc154cUvaJ6DcyvraBatorkTEBYn1FfJaIrbNJiEnUBShDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWl4riFVY5LRwCvmgJjwjS7XsI+F0qOapmZ+/RnS5uA=;
 b=M5L5Y7Hj1+j99h8s+FA2mubuRQaTRpH6ZGVkUi9LcG54qeAeXDN12l9FEKaV0tVru/NbBy1BKs5nhFtScTIq5WoXTOwFgRKn68QPx1CUOb/sxUJnKlPOAyAuXhqV8jkhTm5WCHiqkpqwAKeju6ywrFN3G0KlpkHbflOxSI0yjIEWygFCdvXdMv9hvojvKaxs4WCSuc7Uintk7VmOpWo4pUsWwHZSPH2szjSP2ZjR1LmiuYGGRPRyLFzLrzQm+GZEdfXCNbJkRZK/Yh6USPz+tT7srNKzPiuuuaBZCxvaZWVIeTPfkjcoZ51izA4gY0/gz6PYXK7oTty2OLhmfvqiCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWl4riFVY5LRwCvmgJjwjS7XsI+F0qOapmZ+/RnS5uA=;
 b=NaqsXh2ATUEPvxAMvyYGgTLWBOUi5S3Bv7Rh0a4BFgVh8MaPJrF5q9GjmTFpqqSRjSXigAwuX2TcY5HpIDkHTf8tEl0xwzLvJOf59nbQeqfiR+c2ArZSaQp4vMJvB0ctkH/FU2/cHNxb39w3qzrNcVMCMI4BgoQjX8IhPhfAoR4=
Received: from DS7PR05CA0007.namprd05.prod.outlook.com (2603:10b6:5:3b9::12)
 by SA2PR10MB4457.namprd10.prod.outlook.com (2603:10b6:806:115::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 08:02:52 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::47) by DS7PR05CA0007.outlook.office365.com
 (2603:10b6:5:3b9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Mon, 1
 Jun 2026 08:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 08:02:50 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 03:02:44 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 03:02:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 03:02:44 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65182drS1118344;
	Mon, 1 Jun 2026 03:02:40 -0500
Message-ID: <11494d0d-4177-4c6e-9043-fdd0498740cf@ti.com>
Date: Mon, 1 Jun 2026 13:32:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] spi: cadence-quadspi: add PHY tuning support
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <8733zchr6o.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <8733zchr6o.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|SA2PR10MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: f944489b-ff73-4e23-4f87-08debfb42d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|3023799007|6133799003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7zOBOT1Qn5QAIoxjsSGTv9CBkDVEqBQr6y592L2RIkK+oBSTsuac9O3sxsPWD7v/E+9Rl6W26HBsgcts0p8RVrbxDonsZebzX7pzyH+YyeArk5VJaLOWt24ArbdH93BeWmQU3s+a3ZpRrkey14LG9h/vytqsA3s7/9Ej7aagX2KbnUwhWN9ibX0i3S1smD+qnBa/JS17IUfpN3mcCmvJVDvQ+bAo3d60wDfr+WYMlZtMHYkZqz6f0PSS92xyPhaiStocKaW9+AzvhnJqU48TL4+bh8k3PO855eYShSkPhuZFRn2Tg+kjwbHv5NefLodrLTV6wpnCOELO/0gluhn8guQ8k5enlXJAejBW01hBi+MvIhUoMtD0nnnu59zi+8oMohNT2Fcr7ffclfpz0OZVujkcH/G7M013SU6JZHypyfiulasGkRuzVAuXOBX6/BK7avSO9akU3fwWaGdFRfce/CCc424Cp75vkROiyQ2bXUth79NTxSuNxbYPbEutwRSBQbERCUkOgto2x8coxiXi5iDf3mwdbnm+6eQ2fyk/t0U5KlRmeB0RRyMCpKkYY0Hwqxt3BUtMR3ABCE4oiNv0tF31LlXDKLOhSEZCKRCz16IheT+WbQIlqon1cCp5KYqk5ph5NI/e+kQxGfCmxX+0fkT2MHZTX5cGIGHXHp0laNV6QxQjafwbFllsaosnoK1V9qzmF1W/vsvc2kUj/7l1ByxgeZqFyLlzIa5Bz4kbXeBKa0NqzN7JV7Bdk1PU/upB
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(3023799007)(6133799003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9iJr6Z8ujqy130FUlzmjLWrtHPcQRx8BtNJ03NwxP1HZBLBCfuTBbqzVLYNuzmJpsykn0Vvy2V+Ga5Yl5CsKcrPVFRuATCJMK8LZrHDnA1wepo6Wx1TqYgZiMIy7dJWIjXJPcLBbUlQ2mlBitnD/MwwHG0gmtcvINatUCC9hqJhlrjJ69Hv7M1yoBrAFB+2zcDhkoR0XzqhtSmP+/J0wT8Br8RhzJNR6FSELA1dl/W1cQx2swtWDfseg3pqXnbgPjm0IaeVyzv5HudNFIO2ArBUClEHQ9Uy8VHEnhBEo0lisOS6/qj/9P/7BYNbJ7TntAWqRooNlEugDEqOgjQN/EbIIS0yS/x4/0kpP8/9jD3yr25sdf6Zi4Gx8NqzJ4dbK7sDsO/ArFBZLrM8rUQUMIEXqzGYVb/9fA7KyNeczAIC+9Xd9a7rkhiPfGDW/QPw3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:02:50.9447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f944489b-ff73-4e23-4f87-08debfb42d6c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_010257_555990_B161E33C 
X-CRM114-Status: GOOD (  19.35  )
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

SGVsbG8gTWlxdWVsLAoKT24gMjgvMDUvMjYgMTQ6MDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgU2FudGhvc2gsCj4gCj4gVmVyeSBoYXBweSB0byBzZWUgdGhpcyB2MyEgTG9va3MgcHJldHR5
IG5lYXQgb3ZlcmFsbC4KPiAKPiBPbiAyNy8wNS8yMDI2IGF0IDIzOjI1OjE0ICswNTMwLCBTYW50
aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6Cj4gCj4+IFRoaXMgc2VyaWVzIGltcGxl
bWVudHMgUEhZIHR1bmluZyBzdXBwb3J0IGZvciB0aGUgQ2FkZW5jZSBRU1BJIGNvbnRyb2xsZXIK
Pj4gdG8gZW5hYmxlIHJlbGlhYmxlIGhpZ2gtc3BlZWQgb3BlcmF0aW9ucy4gV2l0aG91dCBQSFkg
dHVuaW5nLCBjb250cm9sbGVycwo+PiB1c2UgY29uc2VydmF0aXZlIHRpbWluZyB0aGF0IGxpbWl0
cyBwZXJmb3JtYW5jZS4gUEhZIHR1bmluZyBjYWxpYnJhdGVzCj4+IFJYL1RYIGRlbGF5IGxpbmVz
IHRvIGZpbmQgb3B0aW1hbCBkYXRhIGNhcHR1cmUgdGltaW5nIHdpbmRvd3MsIGVuYWJsaW5nCj4+
IG9wZXJhdGlvbiB1cCB0byB0aGUgY29udHJvbGxlcidzIG1heGltdW0gZnJlcXVlbmN5Lgo+Pgo+
PiBCYWNrZ3JvdW5kOgo+PiBIaWdoLXNwZWVkIFNQSSBtZW1vcnkgY29udHJvbGxlcnMgcmVxdWly
ZSBwcmVjaXNlIHRpbWluZyBjYWxpYnJhdGlvbiBmb3IKPj4gcmVsaWFibGUgb3BlcmF0aW9uLiBB
dCBoaWdoZXIgZnJlcXVlbmNpZXMsIGJvYXJkLXRvLWJvYXJkIHZhcmlhdGlvbnMgbWFrZQo+PiBm
aXhlZCB0aW1pbmcgcGFyYW1ldGVycyBpbmFkZXF1YXRlLiBUaGUgQ2FkZW5jZSBRU1BJIGNvbnRy
b2xsZXIgaW5jbHVkZXMKPj4gYSBQSFkgaW50ZXJmYWNlIHdpdGggcHJvZ3JhbW1hYmxlIGRlbGF5
IGxpbmVzICgwLTEyNyB0YXBzKSBmb3IgUlggYW5kIFRYCj4+IHBhdGhzLCBidXQgdGhlc2UgcmVx
dWlyZSBydW50aW1lIGNhbGlicmF0aW9uIHRvIGZpbmQgdGhlIHZhbGlkIHRpbWluZwo+PiB3aW5k
b3cuCj4+Cj4+IEFwcHJvYWNoOgo+PiBBZGQgU0RSL0REUiBQSFkgdHVuaW5nIGFsZ29yaXRobXMg
Zm9yIHRoZSBDYWRlbmNlIGNvbnRyb2xsZXI6Cj4+Cj4+IFNEUiBNb2RlIFR1bmluZyAoMUQgc2Vh
cmNoKToKPj4gICAtIFNlYXJjaGVzIGZvciB0d28gY29uc2VjdXRpdmUgdmFsaWQgUlggZGVsYXkg
d2luZG93cwo+PiAgIC0gU2VsZWN0cyB0aGUgbGFyZ2VyIHdpbmRvdyBhbmQgdXNlcyBpdHMgbWlk
cG9pbnQgZm9yIG1heGltdW0gbWFyZ2luCj4+ICAgLSBUWCBkZWxheSBmaXhlZCBhdCBtYXhpbXVt
ICgxMjcpIGFzIGl0J3MgbGVzcyBjcml0aWNhbCBpbiBTRFIKPj4KPj4gRERSIE1vZGUgVHVuaW5n
ICgyRCBzZWFyY2gpOgo+PiAgIC0gRmluZHMgUlggYm91bmRhcmllcyAocnhsb3cvcnhoaWdoKSB1
c2luZyBUWCB3aW5kb3cgc3dlZXBzCj4+ICAgLSBGaW5kcyBUWCBib3VuZGFyaWVzICh0eGxvdy90
eGhpZ2gpIGF0IGZpeGVkIFJYIHBvc2l0aW9ucwo+PiAgIC0gRGVmaW5lcyB2YWxpZCByZWdpb24g
Y29ybmVycyBhbmQgZGV0ZWN0cyBnYXBzIHZpYSBiaW5hcnkgc2VhcmNoCj4+ICAgLSBBcHBsaWVz
IHRlbXBlcmF0dXJlIGNvbXBlbnNhdGlvbiBmb3Igb3B0aW1hbCBwb2ludCBzZWxlY3Rpb24KPj4g
ICAtIEhhbmRsZXMgc2luZ2xlIG9yIGR1YWwgcGFzc2luZyByZWdpb25zIHdpdGggZGlmZmVyZW50
IHN0cmF0ZWdpZXMKPj4KPj4gUGF0Y2ggZGVzY3JpcHRpb246Cj4+IEluZnJhc3RydWN0dXJlICgx
LTUpOgo+PiAgIC0gUGF0Y2ggMTogICBFeHRlbmQgc3BpLW1heC1mcmVxdWVuY3kgRFQgYmluZGlu
ZyB0byBhY2NlcHQgYW4gb3B0aW9uYWwKPj4gICAgICAgICAgICAgICAgc2Vjb25kIHZhbHVlIGZv
cm1pbmcgYSBbYmFzZS1mcmVxLCBtYXgtZnJlcV0gcGFpcgo+PiAgIC0gUGF0Y2ggMjogICBBZGQg
Y2FkZW5jZS1zcGVjaWZpYyBjZG5zLHBoeS1wYXR0ZXJuLXBhcnRpdGlvbiBwaGFuZGxlIGZvcgo+
PiAgICAgICAgICAgICAgICBOT1IgZmxhc2ggUEhZIHR1bmluZyBwYXR0ZXJuIGxvY2F0aW9uCj4+
ICAgLSBQYXRjaCAzOiAgIFBhcnNlIHR3by1lbGVtZW50IHNwaS1tYXgtZnJlcXVlbmN5IGluIHNw
aS5jOyBhZGRzCj4+ICAgICAgICAgICAgICAgIHNwaV9kZXZpY2UuYmFzZV9zcGVlZF9oeiAoMCB3
aGVuIGEgc2luZ2xlIHZhbHVlIGlzIHVzZWQsCj4+ICAgICAgICAgICAgICAgIGtlZXBpbmcgYWxs
IGV4aXN0aW5nIERUIGZ1bGx5IGNvbXBhdGlibGUpCj4+ICAgLSBQYXRjaCA0OiAgIEFkZCBzcGlf
bWVtX2FwcGx5X2Jhc2VfZnJlcV9jYXAoKSwgY2FsbGVkIGZyb20KPj4gICAgICAgICAgICAgICAg
c3BpX21lbV9leGVjX29wKCkgdG8gY2FwIG5vbi1QSFkgb3BzIHRvIGJhc2Vfc3BlZWRfaHo7Cj4+
ICAgICAgICAgICAgICAgIHR1bmVkIG9wcyBieXBhc3MgdGhlIGNhcCBiZWNhdXNlIGV4ZWN1dGVf
dHVuaW5nKCkgbWFya3MKPj4gICAgICAgICAgICAgICAgdGhlbSB3aXRoIG9wLT5tYXhfZnJlcSA9
IG1heF9zcGVlZF9oego+PiAgIC0gUGF0Y2ggNTogICBBZGQgZXhlY3V0ZV90dW5pbmcgY2FsbGJh
Y2sgdG8gc3BpX2NvbnRyb2xsZXJfbWVtX29wcyBhbmQKPj4gICAgICAgICAgICAgICAgc3BpX21l
bV9leGVjdXRlX3R1bmluZygpIHdyYXBwZXIgaW4gU1BJLU1FTSBjb3JlCj4+Cj4+IENhZGVuY2Ug
UVNQSSBJbXBsZW1lbnRhdGlvbiAoNi0xMCk6Cj4+ICAgLSBQYXRjaCA2OiAgIE1vdmUgY3FzcGlf
cmVhZGRhdGFfY2FwdHVyZSgpIGVhcmxpZXIgKHByZXBhcmF0b3J5KQo+PiAgIC0gUGF0Y2ggNzog
ICBBZGQgRFFTIGJpdCB0byBjcXNwaV9yZWFkZGF0YV9jYXB0dXJlKCkgKHByZXBhcmF0b3J5KQo+
PiAgIC0gUGF0Y2ggODogICBBZGQgY29tcGxldGUgUEhZIHR1bmluZyBzdXBwb3J0OiBETEwgbWFu
YWdlbWVudCwgcGF0dGVybgo+PiAgICAgICAgICAgICAgICB2ZXJpZmljYXRpb24gKE5PUiB2aWEg
Y2RucyxwaHktcGF0dGVybi1wYXJ0aXRpb24gcGhhbmRsZSwKPj4gICAgICAgICAgICAgICAgTkFO
RCB2aWEgd3JpdGUtdG8tY2FjaGUpLCBTRFIgMUQgYW5kIEREUiAyRCBzZWFyY2gKPj4gICAgICAg
ICAgICAgICAgYWxnb3JpdGhtcyB3aXRoIHRlbXBlcmF0dXJlIGNvbXBlbnNhdGlvbiwgQU02NTQt
c3BlY2lmaWMKPj4gICAgICAgICAgICAgICAgZXhlY3V0ZV90dW5pbmcgZW50cnkgcG9pbnQ7IGJh
c2Vfc3BlZWRfaHogaXMgY2xlYXJlZCBkdXJpbmcKPj4gICAgICAgICAgICAgICAgdGhlIHR1bmlu
ZyBsb29wIGFuZCByZXN0b3JlZCB1bmNvbmRpdGlvbmFsbHkgb24gcmV0dXJuCj4+ICAgLSBQYXRj
aCA5OiAgIFJlamVjdCAyLWJ5dGUtYWRkcmVzcyBERFIgb3BlcmF0aW9ucyB2aWEgYSBuZXcKPj4g
ICAgICAgICAgICAgICAgQ1FTUElfTk9fMkJZVEVfQUREUl9QSFlfRERSIHF1aXJrIGZsYWcgdG8g
d29yayBhcm91bmQKPj4gICAgICAgICAgICAgICAgQU02NTQgT1NQSSBlcnJhdHVtIGkyMzgzCj4+
ICAgLSBQYXRjaCAxMDogIEVuYWJsZSBQSFkgZm9yIGRpcmVjdCBtZW1vcnktbWFwcGVkIHJlYWRz
IChhbGlnbmVkIGJvZHkKPj4gICAgICAgICAgICAgICAgcmVnaW9uIG9ubHk7IHVuYWxpZ25lZCBo
ZWFkIGFuZCB0YWlsIHJ1biB3aXRob3V0IFBIWSkgYW5kCj4+ICAgICAgICAgICAgICAgIGZvciBp
bmRpcmVjdCB3cml0ZXMgPj0gMSBLQgo+Pgo+PiBNVEQgY29yZSAoMTEtMTMpOgo+PiAgIC0gUGF0
Y2ggMTE6ICBJbnRlZ3JhdGUgdHVuaW5nIGluIFNQSS1OQU5EIHByb2JlOyBwcm9wYWdhdGUgdGhl
IHZhbGlkYXRlZAo+PiAgICAgICAgICAgICAgICBmcmVxdWVuY3kgdG8gYWxsIHBsYW5lIGRpcm1h
cHMgKHByaW1hcnkgYW5kIHNlY29uZGFyeSBvcAo+PiAgICAgICAgICAgICAgICB0ZW1wbGF0ZXMp
IGFuZCB0byB0aGUgcGVyc2lzdGVudCB3cml0ZSBkaXJtYXAgdGVtcGxhdGUKPj4gICAtIFBhdGNo
IDEyOiAgRXh0cmFjdCBzcGlfbm9yX3NwaW1lbV9nZXRfcmVhZF9vcCgpIGhlbHBlciAocHJlcGFy
YXRvcnkpCj4+ICAgLSBQYXRjaCAxMzogIEludGVncmF0ZSB0dW5pbmcgaW4gU1BJLU5PUiBwcm9i
ZTsgcGF0Y2ggdGhlIGRpcm1hcCBvcAo+PiAgICAgICAgICAgICAgICB0ZW1wbGF0ZSB3aXRoIHRo
ZSB2YWxpZGF0ZWQgZnJlcXVlbmN5OyBzdG9yZSB0aGUgcmVzdWx0IGluCj4+ICAgICAgICAgICAg
ICAgIG5vci0+bWF4X3JlYWRfb3Agc28gYWxsIHN1YnNlcXVlbnQgcmVhZHMgKGRpcm1hcCBhbmQg
ZGlyZWN0KQo+PiAgICAgICAgICAgICAgICBwaWNrIHVwIHRoZSB0dW5lZCBzcGVlZCBhdXRvbWF0
aWNhbGx5Cj4+Cj4+IFNlcmllcyBkZXBlbmRlbmN5Ogo+PiBNZXJnZSBhZnRlcjoKPj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtc3BpLzIwMjYwNTI3MTczNzM2LjIyNDMwMDQtMS1zLWs2
QHRpLmNvbS9ULyN1Cj4gCj4gSXNuJ3QgdGhlIERRUyBzZXJpZXMgYSBwcmVyZXF1aXNpdGUgYXMg
d2VsbD8gSSBzZW50IGl0IGFzIGFuIFJGQywgd2UgY2FuCj4gZGVmaW5pdGVseSBjb25zaWRlciBp
dCBmb3IgbWVyZ2UgdG9nZXRoZXIgd2l0aCB0aGlzIHNlcmllcyBvbmNlCj4gcmVhZHkuCj4gCj4g
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjYwMjA1LXdpbmJvbmQt
bmFuZC1uZXh0LXBoeS10dW5pbmctdjEtMC01ZTdkMzk3NmYwZjFAYm9vdGxpbi5jb20vCj4gCj4g
RG8geW91IGNvbmZpcm0gdGhhdCB5b3UgaGF2ZSAiW1BBVENIIERPIE5PVCBNRVJHRSBSRkMgNC80
XSBzcGk6IGNhZGVuY2UtcXNwaTogUmV0cmlldmUKPiBEUVMgY2FwYWJpbGl0eSB1c2luZyB0aGUg
Y29yZSBoZWxwZXIiIGluIHlvdXIgYnJhbmNoIGZvciB0aGUgUEhZIHR1bmluZwo+IHNlcmllcyB0
byB3b3JrPwoKVGhlIERRUyBjb25maWd1cmF0aW9uIGlzIG5vdyBkZXJpdmVkIGZyb20gdGhlIHNl
bGVjdGVkIHJlYWRfb3AgdmFyaWFudAooU0RSIHZzIEREUiksIHdoaWNoIGluIHR1cm4gc2VsZWN0
cyB0aGUgY29ycmVzcG9uZGluZyB0dW5pbmcgYWxnb3JpdGhtLgpUaGUgU0RSIGFuZCBERFIgdHVu
aW5nIGFsZ29yaXRobXMgYXJlIGRlc2lnbmVkIHN1Y2ggdGhhdCBTRFIgdHVuaW5nIHJ1bnMKd2l0
aCBEUVMgZGlzYWJsZWQsIHdoaWxlIEREUiB0dW5pbmcgcnVucyB3aXRoIERRUyBlbmFibGVkLgoK
QmVjYXVzZSBvZiB0aGlzLCB0aGUgRFFTIHN1cHBvcnQgc2VyaWVzIGlzIG5vIGxvbmdlciBhIHBy
ZXJlcXVpc2l0ZSBmb3IKdGhlIFBIWSB0dW5pbmcgc2VyaWVzLiBIb3dldmVyLCBpdCBjYW4gYmUg
dXNlZnVsIGZvbGxvdy11cCB0byBtYWtlIHRoZQppbXBsZW1lbnRhdGlvbiBtb3JlIG9wdGltYWwu
IE9uY2UgdXNlX2RxcyBpcyBlbmFibGVkLCB3ZSBjYW4KYWRkaXRpb25hbGx5IGNoZWNrIGhhc19k
cXMgdG8gZW5zdXJlIHRoZSBmbGFzaCBhZHZlcnRpc2VzIERRUyBzdXBwb3J0CmJlZm9yZSBlbmFi
bGluZyBpdC4KCj4gCj4+IFRlc3Rpbmc6Cj4+IFRoaXMgc2VyaWVzIHdhcyB0ZXN0ZWQgb24gVEkn
cwo+PiBBTTYyQXggU0sgd2l0aCBPU1BJIE5BTkQgZmxhc2ggYW5kCj4+IEFNNjJQeCBTSyB3aXRo
IE9TUEkgTk9SIGZsYXNoOgo+Pgo+PiBSZWFkIHRocm91Z2hwdXQ6Cj4+IHwtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfAo+PiB8ICAgICAgICAgICB8IHdpdGhvdXQgUEhZIHwg
d2l0aCBQSFkgIHwKPj4gfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18Cj4+
IHwgT1NQSSBOT1IgIHwgMzcuNSBNQi9zICAgfCAyMTYgTUIvcyAgfAo+IAo+IEkgYW0gaW1wcmVz
c2VkIGJ5IHRoZSBTUEkgTk9SIGltcHJvdmVtZW50IG9fTwo+IAo+PiB8LS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwKPj4gfCBPU1BJIE5BTkQgfCA5LjIgTUIvcyAgICB8IDM1
LjEgTUIvcyB8Cj4+IHwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfAo+IAo+
IFdhcyB0aGlzIHRlc3RlZCBpbiA4RC04RC04RCBtb2RlPwoKVGVzdGVkIGluIDhTLVBIWSBtb2Rl
LiA4RC1QSFkgbW9kZSBpcyBub3Qgc3VwcG9ydGVkIHdpdGggMi1ieXRlCmFkZHJlc3NpbmcgZHVl
IHRvIEVycmF0YS1pMjM4My4gWzBdCgpbMF0gaHR0cHM6Ly93d3cudGkuY29tL2xpdC9lci9zcHJ6
NTQ0Yy9zcHJ6NTQ0Yy5wZGYKClJlZ2FyZHMsClNhbnRob3NoLgoKPiAKPj4gV3JpdGUgdGhyb3Vn
aHB1dDoKPj4gfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18Cj4+IHwgICAg
ICAgICAgIHwgd2l0aG91dCBQSFkgfCB3aXRoIFBIWSAgfAo+PiB8LS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLXwKPj4gfCBPU1BJIE5BTkQgfCA2IE1CL3MgICAgICB8IDkuMiBN
Qi9zICB8Cj4+IHwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfAo+IAo+IFRo
YW5rcywKPiBNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
