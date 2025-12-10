Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D317D3C52B
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Dec 2025 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2rHKHbaga4nk/QW0T5J72ImFJIvbGbW/Cos0XUtINs=; b=orwcDQ3p+UAvCq
	2VpeujXTdI+QZOhvW3hyMURHCKslRJStvPlHn55wkrusumQCsKLJVKlGySr4wUo3wvFN1Fk6XCh8w
	P10qdugPVsmLkZOZ57qaoKA7iURkvzUxmJyeeHSXgx1hfaR0IkI2xb4t9twL4on98Ywf6Z5sv6r3X
	MoYzoeby+2GpILr/OEg+D9NNA/2nx+DBp7Js3w7n4K3y2biy8B9hI4j8STlqTs1D4gkTviXTiFvi+
	o/+CjG0y8W++jCyNAOmx7D27omGuMvHM1TAACHCt5jO3cvSkXC/4yWIsszTlqfyo5pdeE8WwMkrVe
	Vbb086tTOSG2d63KW1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTISf-0000000FNsi-3Kns;
	Wed, 10 Dec 2025 11:34:25 +0000
Received: from mail-northcentralusazon11013038.outbound.protection.outlook.com ([40.107.201.38] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTISc-0000000FNsC-2cM9
	for linux-mtd@lists.infradead.org;
	Wed, 10 Dec 2025 11:34:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgheMV0kXnutDsvaZ/g0BqoOknPM/wKkfkPYFVNpXq7KrR7yz3C7jHL5zgtdE5U4tDQhFMrJs3yCVpTo/eKyVJcCqLncWVIXO0KJJzo+meKzPLxd2bOZz/haWDW3ZChrhuivcUAmYbPrHpke7+oDw3YYIDJC6y794GNfnedU4cdFJCaedfj/Ynq9bBWVHYt5fKWIIyz9fWn0jRqCD/PzLoBbhX750VpAGHoJ/r5CxFmutNCzRjUGM/GZXHNAs587SbhGJ73q+lI/Lrp3q/yq7wKvwhMvQ9KUjZtmOtEDhpkCPUjb/0gGzl6TLqWuD8A3GNLP/Qa+oxYH5Gnra/8VHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaFCKV4ew+aajWRRm4XK1GeiQ0Q9beI2cHQke0qsHGA=;
 b=lX4Iw3uTw/CjKnk5O0cEwdYruM9MJWEs982cuV0lZWtMD2x6M5qhCTNfajcqSUbjHJrA1sgeDDx/u54XsFta3+iSBUTRqAocYHM4z7MPhbwqtYj558PVO1HSHE4ptzn8SdBnsXf/Yrw2UpbgDGxGPCEcYS9KZY/aUtGNPOGwE3xFlvF0qUFb95xb+bpWrx3Hjo395UZA+2/q4FM5NSPbGOavRyh1mcI/962FojV/OF5E113Z0g07AypNjrE6a1KzRFwGU/gZfaekmRLHn0NHqr5/BuqLzFSz25RwNlQvMQhZskPGB0digAr/dPlglbRoozI3tArHUZG9523UYINrlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaFCKV4ew+aajWRRm4XK1GeiQ0Q9beI2cHQke0qsHGA=;
 b=ivKZVZZ+0QO8JrfTsJTlPE/c6gMz4hRAKnnRVLEgpopYdfLatZ2REkrTMLWOJb+9n4R7egHerisnwIHusI88lbDeWZHVDaeA3cUwGoOZnL2tMtEHK7VCJ/SjsKC00zVCppQGSUbJbSHdRm9jko9BSmkvM8iNBPgRa/qfIzJLEe4=
Received: from SN7PR04CA0012.namprd04.prod.outlook.com (2603:10b6:806:f2::17)
 by PH7PR10MB6156.namprd10.prod.outlook.com (2603:10b6:510:1f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 11:34:17 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::41) by SN7PR04CA0012.outlook.office365.com
 (2603:10b6:806:f2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
 10 Dec 2025 11:34:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 11:34:16 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Dec
 2025 05:34:14 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Dec
 2025 05:34:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Dec 2025 05:34:14 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BABYA1W2889609;
	Wed, 10 Dec 2025 05:34:10 -0600
Message-ID: <ea6f3dd7-0732-4de9-8bf1-e88a45ad6ac2@ti.com>
Date: Wed, 10 Dec 2025 17:04:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Santhosh Kumar K <s-k6@ti.com>
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
To: Miquel Raynal <miquel.raynal@bootlin.com>, Michael Walle
	<mwalle@kernel.org>
CC: Pratyush Yadav <pratyush@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<broonie@kernel.org>, <tudor.ambarus@linaro.org>, <p-mantena@ti.com>,
	<linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <a-dutta@ti.com>, <u-kumar1@ti.com>,
	<praneeth@ti.com>, <s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
 <20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
 <cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com> <mafs0ikf74fja.fsf@kernel.org>
 <fe103265-7a68-41b8-b168-15a5e19abb3f@ti.com>
 <DEOH4AUI33SQ.DGKJ4W258658@kernel.org> <87jyz3ao8b.fsf@bootlin.com>
Content-Language: en-US
In-Reply-To: <87jyz3ao8b.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|PH7PR10MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f777ec4-a1de-44ce-9002-08de37e00d03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TW8zdHd5bXpXUExpUHFtdEhTN0JjMHJRUlh6b2pra2Ivd1ZCRGNwWkFDMVor?=
 =?utf-8?B?MUlsRExranZZU1ViaHJxWHBSM2RPRzk2ajFTSG9WTkxlcUVqRHh5elYwcmJG?=
 =?utf-8?B?NXc3RlQ0M0VkeGFydGM1am5lZ3dKVXdmdmZ0dVN1TkV2NVN5NXhHdzBIRlVs?=
 =?utf-8?B?RCtXRHFacDEzc0dIdUMxYU8rRUlxWkZRVXQ4QXlTU1lIdU5tKzlwL2F5S3BI?=
 =?utf-8?B?RTZVdFU1YUcyTnJBaTRuN2dEQWlCNzRtK2NKb0dnN0djYkVyV0FPdS8weE9P?=
 =?utf-8?B?RWpPVXZiZ1BiQW03MUlLSHpkNHRNdjBwK2xwR2pCSHB1a2pNRGpvMHZhdCtJ?=
 =?utf-8?B?OXh2V09WYWtWbW1GZ3Z0TUdQVzZkUW4vNmRqTTZNczdyOVBac2VkRUxQYjc1?=
 =?utf-8?B?M1ZYckhPNzNzWDZJOHNkM1hWWDhRS2xQdUdJNURFb01CczJyNGdyMWxIU05u?=
 =?utf-8?B?S0dkSG5hZGJMS3NmQU4zekowcDA2eUpYWEFad29SV0hEVXNTZE5VWGZhMXF0?=
 =?utf-8?B?djdxeGg3VXB6WUNzZjlxYUtTeEV6dFN6SVpJVVY3cDREREw0ZXBSVG1DOWJ0?=
 =?utf-8?B?T2V3bEdsVXRkckdrZm0vRVpBTG1oWDhLMmdocUprNGdOQ1R0K0s5ZXhOWEsr?=
 =?utf-8?B?RFlJeFBoTWh1YllZeVVEM2pLdXh3TmJHa1AzandDVVQ5WXhEM05VeW40NkFP?=
 =?utf-8?B?VnNnZHoveVdzZGpJaG5EWnE4cE5TQWNQYVhtSFo1d0RPWXZBMVZIczZNcVVz?=
 =?utf-8?B?V2FvWndpSnJsZmVyQUgrdUg1NHBkZ0duR1pRTklDR1hmNlRCQ3BjWUlsV0JC?=
 =?utf-8?B?QzVFdm9wZnVBWUFLT045TEpWelBsLzhEem9DdHVHUVg3UkhZK0N0aVJ6N1pQ?=
 =?utf-8?B?K09nSmMzZ3d0ckpqM01TZjQ1THRTcGhUK3lHTWlMRmEvVlVPbVA5Y1dhdDh4?=
 =?utf-8?B?U0dvSHY0bEEwSlIxSm5pSElKQi9KYWp6ZlF6aExPY2xUSkhaU1N1MkozcW9U?=
 =?utf-8?B?SGd5NWVjOTZnU0ZaT1BPT2RNb2tJZGxna1FyakIyN1lmamY0WEIvdnFHQ2Vl?=
 =?utf-8?B?WFRCWlp3ZjJhb1MwMHhFeFpueVdrdCtzY3BQQXJxQ0Q4M3Bra1BBUDUzNlFk?=
 =?utf-8?B?eGFBSnlzVWllcTFCUXF5MVk1d1N3R2EwU28vazZ1WVg0U1JpTkhtYVhUVjlv?=
 =?utf-8?B?OWV6eWwra1VuNVpTR1BVTitVQXRQeXJ5Vm5rUlhJazZTZ1h2cFVENnlTOVZ3?=
 =?utf-8?B?MGVrNnNLNGN6OUVDOFNsRTJFbTJyam9sY2pVTUUyWnc2U1Z0YXJ4eWovTUNp?=
 =?utf-8?B?dmhRN3J6dFJqblhqVi9UMkEyaFhjWnNIM1dYcXEvQ2ZYVTAvUzdyU3RYeHl5?=
 =?utf-8?B?ZXg2bGYrT0FMckVXcDlRYzBIMHJ4WmNnQiszTlB1a3FWTHR6dFdueDhYeGhl?=
 =?utf-8?B?YjZqTDlnVWJrQnBqMUpqOU1XRmExUUI0RnVsakcwWnRsSUIzRjEwV1czeTl3?=
 =?utf-8?B?a2s2N2NaOFRyWFRnUlR2d2ZGaWJPcGVTazd6RFpXMVl2UzVGRXFIRHZYUUJE?=
 =?utf-8?B?bkRuYVVEbDVRUy9CY2dWSWVyZVFnY0NLck44RnIvK1FhQTNZdTVWOE13aDll?=
 =?utf-8?B?VTBmSTZxVFBEUjJJZVFSVEY3bkVMVllPQ3F1czA5V2dRaUJTUkhObUUyMUdn?=
 =?utf-8?B?N0ZkMUN2bFFPV1FxTWVGa0h2OTIyTlBaS3pCOVFPeVJ2amxvaWhvcnBxLzRJ?=
 =?utf-8?B?QkQraTBXb3cxSk52Sm1SbGIwdWI5NXdvZlhSU1J2cStOSExBOEYvWmNjWkEy?=
 =?utf-8?B?NllpS2FkbDVJNlRYdTRpSFhSMGdLUkRPVFV0WkFPaU1NMG5jNUdkLy93SldP?=
 =?utf-8?B?V1E4UEVQTWY0ay9vNzcrUmVNSWxzUUhDWGljdmh4dmR5MFJEYW9rUWJDdkl2?=
 =?utf-8?B?bnNkczMycmxYYi92NTlwZDk4VVh0aWlzRXkwMTZoT0tlNGF0RXBNckljQzJi?=
 =?utf-8?B?OVVzcW94Rm5uaytXaE5MWXdibGowZzVvS2xtQUpnUjFqZlZIS2ZTZHVLa2x6?=
 =?utf-8?B?bGd4SnBMajdmMWVNOGdmc2FkZlgyOUxNelNGQ2o1NTZWcmFFNzRCZ01BKzhn?=
 =?utf-8?Q?+gxg=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 11:34:16.2961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f777ec4-a1de-44ce-9002-08de37e00d03
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_033422_669939_5BAC0756 
X-CRM114-Status: GOOD (  22.20  )
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

SGVsbG8gTWljaGFlbCBhbmQgTWlxdWVsLAoKT24gMDMvMTIvMjUgMTU6MjAsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gCj4+Pj4gSSB0aGluayB3ZSBzaG91bGQgc3RhcnQgd2l0aCB0aGUgcmVxdWly
ZW1lbnQgdG8gaGF2ZSB0aGUgcGF0dGVybiBmbGFzaGVkCj4+Pj4gYWxyZWFkeSBhbmQgZmlndXJl
IG91dCBob3cgU1BJIE5PUiBvciBTUEkgTkFORCBjYW4gZGlzY292ZXIgdGhhdAo+Pj4+IChwZXJo
YXBzIHZpYSBOVk1FTT8pLgo+Pgo+PiBCdXQgd2Ugc2hvdWxkIGFsc28ga2VlcCBpbiBtaW5kIHRo
YXQgY2VydGFpbiBmbGFzaGVzIG1pZ2h0IHJldHVybgo+PiB0dW5pbmcgZGF0YSBkdXJpbmcgdGhl
IGR1bW15IGN5Y2xlcy4gSS5lLiB0aGUgUEhZIG1pZ2h0IHByb2JhYmx5IGJlCj4+IHR1bmVkIG9u
IGVhY2ggcmVhZCBhbmQgdGhlcmUgaXMgbm8gbmVlZCBmb3IgYW55IHByZS1wcm9ncmFtbWVkCj4+
IHBhdHRlcm4uCj4+Cj4+IEknbSBub3Qgc2F5aW5nIGl0IHNob3VsZCBiZSBpbXBsZW1lbnRlZCwg
YnV0IHRoZSBjdXJyZW50Cj4+IGltcGxlbWVudGF0aW9uIHNob3VsZCBiZSB0aGF0IGZsZXhpYmxl
IHRoYXQgaXQgd2lsbCBiZSBlYXN5IHRvIGFkZAo+PiB0aGF0IGxhdGVyLgo+IAo+IENvbmNlcHR1
YWxseSwgeWVzLCBidXQgaW4gcHJhY3RpY2UsIEkga25vdyBubyBjb250cm9sbGVyIGNhcGFibGUg
b2YKPiB1c2luZyBqdXN0IGEgZmV3IGN5Y2xlcyBldmVyeSB0cmFuc2ZlciB0byBjYWxpYnJhdGUg
dGhlbXNlbHZlcwo+IGF1dG9tYXRpY2FsbHkgYW5kIHJlYWNoaW5nIHN1Y2ggYW4gb3B0aW1pemVk
IHNwZWVkIHN0YXRlIGFzIHRoZSBjYWRlbmNlCj4gY29udHJvbGxlciBpcyBjYXBhYmxlIG9mIEFU
TS4KPiAKPiBEZXNwaXRlIHRoZSBlbmQgcmVzdWx0IGJlaW5nIGNsb3NlLCBJIHdvdWxkIHN0aWxs
IGNvbnNpZGVyIHRoaXMgb3RoZXIKPiB3YXkgdG8gb3B0aW1pemUgdGhlIEkvT3Mgc29tZXdoYXQg
b3J0aG9nb25hbC4gSWYgc29tZW9uZSBoYXMgc29tZQo+IGtub3dsZWRnZSB0byBzaGFyZSBhYm91
dCB0aGUgdHJhaW5pbmcgcGF0dGVybnMgc2VudCBkdXJpbmcgdGhlIGR1bW15Cj4gY3ljbGVzLCBJ
IGFtIGFsbCBlYXJzIHRob3VnaC4KPiAKPj4+IEZvciBTUEkgTk9SLCB3ZSBkbyBub3QgaGF2ZSBh
biBlcXVpdmFsZW50ICJ3cml0ZS10by1jYWNoZSIgcG9zc2libGUsIHNvCj4+PiB3ZSBzdGlsbCBy
ZXF1aXJlIGEgcHJlLWZsYXNoZWQgcGF0dGVybiByZWdpb24uIEF0IHRoZSBtb21lbnQgdGhpcyBp
cwo+Pj4gcHJvdmlkZWQgdmlhIGEgZGVkaWNhdGVkICJwaHlwYXR0ZXJuIiBwYXJ0aXRpb24sIGFu
ZCBpdHMgb2Zmc2V0IGlzCj4+PiBvYnRhaW5lZCB0aHJvdWdoIHRoZSBvZl9nZXRfKiBBUElzLgo+
Pj4KPj4+IFJlZ2FyZGluZyB3YXlzIHRvIGxvY2F0ZSB0aGUgcGFydGl0aW9uOgo+Pj4KPj4+IDEu
IFVzaW5nIE5WTUVNOgo+Pj4gICAgICBhLiBFeHBvc2luZyB0aGUgcGh5cGF0dGVybiBwYXJ0aXRp
b24gYXMgYW4gTlZNRU0gY2VsbCBhbmQgaXNzdWluZyBhbgo+Pj4gICAgICAgICBOVk1FTSByZWFk
IGR1cmluZyB0dW5pbmcgZG9lcyBub3Qgd29yayByZWxpYWJseSwgYmVjYXVzZSBOVk1FTQo+Pj4g
ICAgICAgICBlbmRzIHVwIGNhbGxpbmcgaW50byB0aGUgTVREIHJlYWQgcGF0aCBhbmQgd2UgY2Fu
bm90IGNvbnRyb2wgd2hpY2gKPj4+ICAgICAgICAgcmVhZF9vcCB2YXJpYW50IGlzIHVzZWQgZm9y
IHRoZSByZWFkLgo+Pj4KPj4+ICAgICAgYi4gQWR2ZXJ0aXNpbmcgdGhlIHBhcnRpdGlvbiBhcyBh
biBOVk1FTSBjZWxsIGFuZCB1c2luZyBOVk1FTSBvbmx5Cj4+PiAgICAgICAgIHRvIGZldGNoIHRo
ZSBvZmZzZXQgaXMgbm90IHBvc3NpYmxlIGVpdGhlci4gTlZNRU0gYWJzdHJhY3RzIHRoZQo+Pj4g
ICAgICAgICBwcml2YXRlIGRhdGEsIGluY2x1ZGluZyBwYXJ0aXRpb24gb2Zmc2V0cywgc28gd2Ug
Y2FuJ3QgcmV0cmlldmUKPj4+ICAgICAgICAgdGhlIG9mZnNldCBhcyB3ZWxsLgo+Pgo+PiBZb3Ug
Y2FuIHByb2JhYmx5IGV4dGVuZCB0aGUgTlZNRU0gQVBJIGluIHNvbWUgd2F5IC0gb3Igc3dpdGNo
aW5nIHRoZQo+PiByZWFkX29wIG9uIHRoZSBmbHkuCj4+Cj4+PiAyLiBVc2luZyBvZl9nZXRfKiBB
UElzOgo+Pj4gICAgICAgICBVc2luZyB0aGUgc3RhbmRhcmQgT0YgaGVscGVycyB0byBsb2NhdGUg
dGhlIHBoeXBhdHRlcm4gcGFydGl0aW9uCj4+PiAgICAgICAgIGFuZCByZXRyaWV2ZSBpdHMgb2Zm
c2V0IGlzIGJvdGggcmVsaWFibGUgYW5kIHN0cmFpZ2hmb3J3YXJkLCBhbmQKPj4+ICAgICAgICAg
aXMgdGhlIGFwcHJvYWNoIGN1cnJlbnRseSBpbXBsZW1lbnRlZCBpbiB2Mi4KPj4KPj4gSSBkb24n
dCBsaWtlIHRoYXQgaGFyZGNvZGVkIHBhcnRpdGlvbiBuYW1lIHdoaWNoIGlzIGJhc2ljYWxseQo+
PiBiZWNvbWluZyBhbiBBQkkgdGhlbi4KPj4KPj4gQXQgbGVhc3Qgd2UnZCBuZWVkIHNvbWUga2lu
ZCBvZiBwaGFuZGxlIHRvIHRoZSBwYXJ0aXRpb24gaW5zaWRlIHRoZQo+PiBjb250cm9sbGVyIG5v
ZGUgKGFuZCBnZXQgdGhlIEFDSyBmcm9tIHRoZSBEVCBtYWludGFpbmVycykuCj4gCj4gWWVzLCBh
Z3JlZWQsIHRoaXMgaXMgY29udHJvbGxlciBzcGVjaWZpYywgaWYgd2UgbmVlZCB0byB1c2UgYW4g
b2ZfIEFQSQo+ICh3aGljaCBpcyBzdGlsbCBub3QgbmVlZGVkIGZvciBTUEkgTkFORHMsIG9ubHkg
Zm9yIHR1bmluZyB0aGUgcmVhZCBTUEkKPiBOT1IgcGF0aCksIGl0IHNob3VsZCBub3QganVzdCBi
ZSBhIHBhcnRpdGlvbiBoYXJkY29kZWQgbmFtZSBidXQgYQo+IHBoYW5kbGUgaW4gdGhlIGNvbnRy
b2xsZXIgbm9kZS4KClllcywgdXNpbmcgYSBwaGFuZGxlIGlzIGEgdmFsaWQgaWRlYSB0byBhdm9p
ZCByZWx5aW5nIG9uIGEgaGFyZC1jb2RlZApuYW1lLiBCdXQsIGl0IGRvZXMgbm90IHdvcmsgd2Vs
bCB3aGVuIG11bHRpcGxlIGNoaXAgc2VsZWN0cyBhcmUKaW52b2x2ZWQuIFRoZSBjb250cm9sbGVy
IGlzIG5vdCB0aWVkIHRvIGEgc2luZ2xlIGZsYXNoIGRldmljZSAtIGEgc2luZ2xlClNQSSBjb250
cm9sbGVyIG1heSBob3N0IGJvdGggTk9SIGFuZCBOQU5EIGZsYXNoZXMsIGZvciBleGFtcGxlLiBJ
biBzdWNoCmNhc2UsIG9ubHkgdGhlIE5PUiB3b3VsZCByZXF1aXJlIHRoaXMgcGhhbmRsZSwgd2hp
bGUgdGhlIE5BTkQgd291bGQgbm90LAp3aGljaCBtYWtlcyB0aGUgcGhhbmRsZSBhcHByb2FjaCB1
bnN1aXRhYmxlLiBBbm90aGVyIGV4YW1wbGUgaXMgYQpjb250cm9sbGVyIGhvc3RpbmcgdHdvIE5P
UiBmbGFzaGVzIC0gYm90aCB3b3VsZCB0aGVuIG5lZWQgdGhlaXIgb3duCnBoYW5kbGUgcmVmZXJl
bmNlcy4KCkFuIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIGFzc29jaWF0ZSB0aGUgcGhhbmRsZSB3
aXRoIHRoZSBmbGFzaCBkZXZpY2UKaXRzZWxmIHJhdGhlciB0aGFuIHdpdGggdGhlIGNvbnRyb2xs
ZXIuIExldCBtZSBrbm93IHlvdXIgdGhvdWdodHMgb24KdGhpcyBhcHByb2FjaC4KClRoYW5rcywK
U2FudGhvc2guCgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
