Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E696EE6B4C
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 19:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLNaFcfdiEQi2WNLoqkBpCQl47iN7fNL6OHojeJFHe8=; b=foSwq2sq92NkHN
	l8ccqpbb54laudmEkaQ/cMiLn7IffyakxQjN4NTzsnTn9HzAmmckSAcoS6eic6yKfwTnbz//BVrS+
	Qep8fbH1jAsdJ7jyIU7OyrKtSVL2YYRkFMEy6hhwt8JmI+uNxLBIlEna+8wZEeN896joqBIz2VFki
	dJogk6MlaAjY3bM3G37jtRRuv28exEmaa/WEFIDZnsBkzQxin+C2b00XTYJ4kg9/RA3yr2u6BWiRx
	3v05jbQlcUCrf8vgayq8oBZqKnLsegXnEtALZSF0qnb7xtqCfbcRrS5aY5Zx+99gQRotoH8KdWdO+
	4f0Q/izE0avmC6erWquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRSv-0000000Bjxc-2A9q;
	Fri, 06 Feb 2026 19:26:05 +0000
Received: from mail-northcentralusazon11010071.outbound.protection.outlook.com ([52.101.193.71] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRSt-0000000Bjx5-39a9
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 19:26:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jj5KyNCbJXLzGeTi6WRkM0J5HOLVtR/UsJI6+5FdZVqTjeu9VPVLuyEbmj5ZNF0tBXcbQua4KDju3B4QAhUhx+auGeQpDYvWpg/f8qZ8OBmgdfz8zJl2fI7/8v7QvTRcPE9ABTbXJzbzcolhDd9UV8M8goPV9eksM3pomxMxe8Zi25KdA8wpbT00vyyKpbmJrDQTw4gGZ7rk5RJziWu3KfdT7eSuPtCQb8oXwoh3et0M9p3oZlbx+DPFymJDcqGEVVushDS1c79IF59VGmadqmjKjjryt8yRAgYSJgJBILSWl03xRhRrLl5pEK05cyEib23ps7vw9+UWom+M+tFCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuwvJA7bdlfxJyiF30BM9B52vMs4ZBX1zMrBZo7Iyu0=;
 b=plg2+uwtQ5+/ZRoec7A3eVCDruIr5xb40bdWnxqQHgvGWlMdSiwqM05GZs31eeh56hm4OyYzOH4zgZ4mMrij5x/2S9zhYDEliQIfIMBToULNZjHCbieVYBaikMimP1HuMs6OYB5zExRXyumt0GBOGN2xs1ANUP9X6ymJcMmstn0lYz3Xr/lfj1wjwZ6pxCxZbM4UGCQ6nTjdUilDYikuhjQzVFQPo7oLfgOrTp1gNxdmgIBV+x6IzaPMNeDr4aCVjHo+X2bWTT3i/K+sS4766sbHqSjlH+4C8mtmG8ZbwBYb3USKItoYlPLH6jbZZjlP6ny6a0XDtcKoh8aUHu6PWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuwvJA7bdlfxJyiF30BM9B52vMs4ZBX1zMrBZo7Iyu0=;
 b=G2utgd1bZ+wCdEfRSMKtZUvjWd9vMklbwwwnLiiDtftHJ5I1sF9X1Txw/zGb4rA936Tn6olaB3vI8FZ0olmoZuaAdXoVdtoIMilBRrKtHFtElkKqjzd/PKkVzGnGqGZ75BswJc0gJl8ZHcMt6NWKCBmj+/BY+J4bv5qZolpxcaM=
Received: from SA9PR10CA0006.namprd10.prod.outlook.com (2603:10b6:806:a7::11)
 by CH0PR10MB4842.namprd10.prod.outlook.com (2603:10b6:610:df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 19:25:57 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::62) by SA9PR10CA0006.outlook.office365.com
 (2603:10b6:806:a7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Fri, 6
 Feb 2026 19:25:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 19:25:55 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 13:25:55 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 13:25:54 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 13:25:54 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616JPnKH1408853;
	Fri, 6 Feb 2026 13:25:50 -0600
Message-ID: <012a44f3-973f-4f34-be69-286cf924a6c6@ti.com>
Date: Sat, 7 Feb 2026 00:55:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 09/12] spi: cadence-quadspi: add PHY tuning
 infrastructure
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
	<s-k6@ti.com>
References: <20260113141617.1905039-1-s-k6@ti.com>
 <20260113141617.1905039-10-s-k6@ti.com> <87bji3gkda.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87bji3gkda.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|CH0PR10MB4842:EE_
X-MS-Office365-Filtering-Correlation-Id: eb98ce34-fbdb-4302-80b6-08de65b58c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTJhaHpyOWVaZTJ2NGxucE1CNEpiUjMwZmxjTU9UY2FhMEZCUGFGMTVNU3o0?=
 =?utf-8?B?U01qNE44S0dxWlp5aEQ2Z2czYVdud2ZERmtKalZqZHJNcXdYT0tEQzVrK05F?=
 =?utf-8?B?dXA0MVdGZWtROFEzdzhrbmp3RWZKei9QQ0ZkRlh2VFg4eGdZY3ZPejVhSGxt?=
 =?utf-8?B?eTZJRXJHSndraHErRE5nUWU5T1RZZUdtNTlmZE9GeXZtaHAxcnY0aHZNR3Bp?=
 =?utf-8?B?aWtMVGJuS1plSG1TSWh5SkVNQWdmTGtHdDdadUpYNmk3bWRkWXpLZ3FvMEdB?=
 =?utf-8?B?Y3hCUXh0eVNwY2JtdFVsak1xZ0JqZFdncDRxTnNnR3JDVGlpeDZ0eGJPbXFr?=
 =?utf-8?B?Y3J3dEd2VkMrMFFUb3FLWFkwMHJWdVFMQWxNaWROUEU2U0RTNjZKalNsKzgx?=
 =?utf-8?B?ckl1S2hvZ3NkdEkwR253aFFlWnBVMmsvSVBxbzkxWVVvdkFjdzVrbWtQSEVE?=
 =?utf-8?B?S1FJQUk1VG1xOCtGSFVhaWUvdVpjd1V6dUhuMWYvZ0h0bVp0NTlhTHZycW5l?=
 =?utf-8?B?clFwVWJpejBGSUM2YU1QQU43WEliaWxLSm0zR2MrWjhlYjdsOFpyWWo1Q1Vl?=
 =?utf-8?B?K29HVE5ESWp6T2JOd2wvMUlQS1FUeTBtRDVwODY3U3RhajRNSFlvRkpicFF4?=
 =?utf-8?B?bGF3VFpCc1UydHdwelVWQ2V5bmhCWUpxM2ZZM2RqSkl3SzczTEVkMFZEdG8w?=
 =?utf-8?B?ZXNsSWhHbWhXdTZaL0F5LzRjZjMyUEJtVkNkMERJUGVkb0NDN3MyWUNwV3FT?=
 =?utf-8?B?Y0M1N2RzVG5yN3lJdW9wTFVML3Urbkp0NUcxdzZjR2gvRllkSzJCTlkzOGVD?=
 =?utf-8?B?Wm9aaGpKWDlSNFQyaGdGNGk1dURwQ0JxSS8yWE5RaVhta2tYZC9jUGpWRmo4?=
 =?utf-8?B?RGRPM1hoWnozL0hFZTFxb21hSU9kUWlxQktLL2hPaGpCSmxWWFo1QkNsNXlm?=
 =?utf-8?B?S3orSjQ0SGNTZVJabHQzcENIRHZRS0lZc2gvblZGM1JoamtFNnR1Sm1SRVdS?=
 =?utf-8?B?MnZiN0JhRmdiZVBEaGhEK1NXOE1NQlBCa3JPMVFoL0ttOEFIVWtrNFJheWFr?=
 =?utf-8?B?QXVNK1NnZXMrZGU5c2FrSXpDTkRmWDVCb2UrMmtxYkFSNHpUWXl6RW0yNEpw?=
 =?utf-8?B?L1daUW1aWE03bDJCOFRPNmFLR3ovUHpDaXIxTFA2ZmhSNWlWenFGejRISmhW?=
 =?utf-8?B?M2xnc2RFVmlaVHFGcXlNRFJhK0VXcHRvVk9BWkJ0b2JFSzdKN1FlT2tpaHY5?=
 =?utf-8?B?ajd3aytJK0M0SXE1Z3NpOTNrMXdVL2VqKzJXVzBlWEhid2E4dk9HbkVVT01P?=
 =?utf-8?B?Z1A0c0pQVXhvQTBJL1krL0VXa3FWYkV2ZTFCQThabEViZTNGaW1zUWlYb1Bo?=
 =?utf-8?B?U21MalJHbDY2dFZIT2t0bG9Bb2gwWmxESHZzQmU2ZERnSzNBZDBidkdTVzlI?=
 =?utf-8?B?WDZLRWdVeCtnYUdiTmpMUDJuYzkvY3RQRFc1M2QydkZEYi9UQVBoZTlhMDJl?=
 =?utf-8?B?N3hNTVgvNjU4SENTZHlVbysxUTZNOVNxV2Faa2hRUFg1cVdlK1ZjVHYrQjJs?=
 =?utf-8?B?Ti9taVRhSVFjbVFYNS80T1Q1emNlQ1M2TjE5dTFJRm9OOW1KVWRpQVl4b004?=
 =?utf-8?B?SVRaUm13ZnlRb3NJa0xOVmdqWnNtZzREMWdBYnluYkc2MWo0dFZhOFhNeGM4?=
 =?utf-8?B?V3VEV0thNjdRNytGWDJ3bWwyaWVvT08xb2JzYVJkUFRaREZMMHNFalBzSzJI?=
 =?utf-8?B?ZHhuNWRLN1RWaTdIeWt4ZW93UkpnTjZnNk1nNndYV3hJbWlkT1c5ck5Icmsv?=
 =?utf-8?B?Q0tkcEpQMTQzRFJYSWIrT3FCcmtoSmlyTUdoNS9oTXJUdHk0NVovdTZWY3J6?=
 =?utf-8?B?VVp2UEFXWjNMUGl1MENaOHUwZ1g3aU5XVkE4V1NHU3AvWFVsZWNkWW9PNkJx?=
 =?utf-8?B?cVBvUUF1NEovc1hIeGQ0N2ZyVmlyNXluYXVJMEF1dXp1dU05UGxPbjZ1QjFC?=
 =?utf-8?B?TjJZTnc0a21iTUF1WWI3Zkp3aUpoUnJmRkx6Sk9NUUtyampNdHB6bnB3UmdG?=
 =?utf-8?B?UkFYZHh1WjZReklyTVVyUXBmQkZoaytRZnZUY0lBbnphaitWN1BLRzRuL3Q5?=
 =?utf-8?B?dURZblVQSW5TQ0o2c0hZR01FVVpMV3FlRW1DcWxEUm1IWm0vOWIrUDRSaUNo?=
 =?utf-8?B?RXRFMmpQQ3FIaVVIdzhtUXZncTRtYzhUWTV0bSt2ejc4WFR6akcyaHZkS0pD?=
 =?utf-8?B?Z0xjRWpOZDdmUFJ1RkhlR0M0eU53PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: giCB68Z27E+u/nbZ9uYPUzMG2jXmxu+6HWi+OiieGL41RhIKTNAdmlkV4sCUowUXM/LHhRpSlHEAKx0BmbJNYI+nd0lJ8pFX/PWxx/KT41CEVCyE6T9/KHbogVPe8VGIWrMgjl7x4fxPKb219xWW5s5jOHub5nL7l6ASKzHaN0oSUQTgiZv0ZW8Fk1TcbUnCelVw4Z+jS2KKj50nehjjeHvpvxdT6GTylTJTxa+DjQ4xY5jttCjQWr5HoXznuICU20OBisceWq/tvvPLeGbEXf+LQIwrsUTgNcfC12T5ys7ACuUpY8pHJ9bxtGbdj1cuYXvrRHo5gsPImV8kip3noNiJ9+T3k8psnBZ12OKZxnenWqm1bSURFMZh0Uzg9zWgunq0qlNHOIEfL/2fbK3nVoX5VXHzj2+4EtEQkb/mv2hpSysFuF97ffuHmOc4IqUG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:25:55.3841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb98ce34-fbdb-4302-80b6-08de65b58c8b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4842
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_112603_795437_F9FD3A71 
X-CRM114-Status: GOOD (  18.79  )
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

CgpPbiAwNS8wMi8yNiAyMzowOSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBPbiAxMy8wMS8yMDI2
IGF0IDE5OjQ2OjE0ICswNTMwLCBTYW50aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6
Cj4gCj4+IEltcGxlbWVudCB0aGUgc3BpX2NvbnRyb2xsZXJfbWVtX29wcyBleGVjdXRlX3R1bmlu
ZyBjYWxsYmFjayB0byBlbmFibGUKPj4gUEhZIHR1bmluZyBzdXBwb3J0IGZvciB0aGUgQ2FkZW5j
ZSBjb250cm9sbGVyLiBQSFkgdHVuaW5nIG9wdGltaXplcyBkYXRhCj4+IGNhcHR1cmUgdGltaW5n
IGF0IGhpZ2ggZnJlcXVlbmNpZXMgYnkgY2FsaWJyYXRpbmcgdGhlIHJlYWQgZGF0YSBjYXB0dXJl
Cj4+IGRlbGF5IHRocm91Z2ggdGhlIGNvbnRyb2xsZXIncyBQSFkgaW50ZXJmYWNlLgo+Pgo+PiBU
dW5pbmcgYWxnb3JpdGhtIGZ1bmN0aW9ucyAoY3FzcGlfcGh5X3R1bmluZ19kZHIvc2RyIGFuZAo+
PiBjcXNwaV9waHlfcHJlL3Bvc3RfY29uZmlnKSBhcmUgcGxhY2Vob2xkZXJzIHRvIGJlIGltcGxl
bWVudGVkCj4+IGluIHN1YnNlcXVlbnQgY29tbWl0cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2Fu
dGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvc3BpL3NwaS1j
YWRlbmNlLXF1YWRzcGkuYyB8IDI0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4g
ICAxIGZpbGUgY2hhbmdlZCwgMjQxIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYyBiL2RyaXZlcnMvc3BpL3NwaS1jYWRlbmNl
LXF1YWRzcGkuYwo+PiBpbmRleCAwZGYyODZkMjQyNTYuLmI4YjBlODVmNGY2OCAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jCj4+ICsrKyBiL2RyaXZlcnMv
c3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYwo+PiBAQCAtMzIsNiArMzIsNyBAQAo+PiAgIAo+PiAg
ICNkZWZpbmUgQ1FTUElfTkFNRQkJCSJjYWRlbmNlLXFzcGkiCj4+ICAgI2RlZmluZSBDUVNQSV9N
QVhfQ0hJUFNFTEVDVAkJNAo+PiArI2RlZmluZSBDUVNQSV9BTTY1NF9OT05fUEhZX0NMS19SQVRF
CTI1MDAwMDAwCj4+ICAgCj4+ICAgc3RhdGljX2Fzc2VydChDUVNQSV9NQVhfQ0hJUFNFTEVDVCA8
PSBTUElfREVWSUNFX0NTX0NOVF9NQVgpOwo+PiAgIAo+PiBAQCAtNjUsNiArNjYsNyBAQCBzdHJ1
Y3QgY3FzcGlfc3Q7Cj4+ICAgc3RydWN0IGNxc3BpX2ZsYXNoX3BkYXRhIHsKPj4gICAJc3RydWN0
IGNxc3BpX3N0CSpjcXNwaTsKPj4gICAJdTMyCQljbGtfcmF0ZTsKPj4gKwl1MzIJCW5vbl9waHlf
Y2xrX3JhdGU7Cj4gCj4gVGhpcyBpcyB0aGUgc2Vjb25kIChhbmQgbGFzdCkgbWFpbiBpc3N1ZSBJ
IGhhdmUgd2l0aCB0aGUgc2VyaWVzIGFzIGl0IGlzCj4gcmlnaHQgbm93LiBXZSBjYW5ub3Qgc2V0
IHRoaXMgdHlwZSBvZiBmcmVxdWVuY3kgaW4gdGhlIGRyaXZlciBJTU8sIGl0IGlzCj4gdG9vIGJv
YXJkIHNwZWNpZmljLgo+IAo+IFdlIGN1cnJlbnRseSBoYXZlIGEgRFQgcHJvcGVydHkgZm9yIHRo
ZSBTUEkgbWF4aW11bSBzdXBwb3J0ZWQKPiBmcmVxdWVuY3kuIEkgYmVsaWV2ZSB0aGlzIGlzIG5v
IGxvbmdlciBlbm91Z2guIFdoeSBub3QgbWFraW5nIHRoaXMKPiBmcmVxdWVuY3kgcHJvcGVydHkg
YW4gYXJyYXk/IEZpcnN0IGZyZXF1ZW5jeSB3b3VsZCBiZSB0aGUgZGVmYXVsdCwKPiBub24gdHVu
ZWQgbWF4aW11bSBmcmVxdWVuY3kuIFRoZSBzZWNvbmQgd291bGQgYmUgdGhlIG1heGltdW0gZnJl
cXVlbmN5Cj4gcmVhY2hhYmxlIHdoZW4gdHVuaW5nIHRoZSBQSFkuCgpJZiB0aGUgY29uY2VybiBp
cyBvbmx5IGFib3V0IHdoZXJlIHRoaXMgaXMgc2V0LCB3ZSBjb3VsZCBpbnRyb2R1Y2UgYSBEVApw
cm9wZXJ0eSBzdWNoIGFzICJub24tcGh5LW1heC1mcmVxIiB0byBjYXJyeSB0aGlzIGluZm9ybWF0
aW9uLiBUaGlzCndvdWxkIGFsbG93IHVzIHRvIGF2b2lkIGFueSBjaGFuZ2VzIHRvIHRoZSBleGlz
dGluZyAic3BpLW1heC1mcmVxdWVuY3kiCmhhbmRsaW5nLiBMZXQgbWUga25vdyB5b3VyIHRob3Vn
aHRzIG9uIHRoaXMuCgpJJ2xsIGFsc28gdGVzdCB0aGUgYXBwcm9hY2ggeW91IHN1Z2dlc3RlZCBh
bmQgc2hhcmUgbXkgaW5wdXRzIGJhc2VkIG9uCnRoZSByZXN1bHRzLiBCeSB0aGUgd2F5LCB3aGVy
ZSBhcmUgeW91IGluc2lzdGluZyB0byBhZGp1c3Qvc3dpdGNoIHRvCnRoZSBtYXhpbXVtIGZyZXF1
ZW5jeSAtIHdpdGhpbiB0aGUgY29udHJvbGxlciBkcml2ZXIgb3IgaW4gdGhlCnNwaS1jb3JlPwoK
UmVnYXJkcywKU2FudGhvc2guCgo+IAo+IFRoZSByZXN0IG9mIHRoZSBwYXRjaCBMR1RNIG90aGVy
d2lzZSwgYnV0IHRoZXJlIGlzIHRoaXMgZnJlcXVlbmN5Cj4gaW5mb3JtYXRpb24gd2hpY2ggSSB0
aGluayBzaG91bGQgYmUgaGFuZGxlZCB3aXRoIG1vcmUgY2FyZS4KPiAKPiBUaGFua3MsCj4gTWlx
dcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
