Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC38FEE6B4C
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 19:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+KoFyviL/iRlxeLu6cbGFiCh3SWmaRx+gv8h9p6AG8=; b=cvC64G9MmlfSyQ
	YowCd0FNX2bb5zyPc34QbteeZsd375/BJL35xQFJ4iZJQfWLmp40JugdGpj4M4yjyosJt/g4Up4c/
	fSnEgGZg+kzwBdsVFBQRwVazm6H9M5mJpdH8nkHRnylNvYdW3yQGO4w5SxJrXrx7vnb3CeI2y0mWG
	2BuI+7FQwbBN8Z2my+WOnJg12wSQdnHxopBLjAgXfmtZi27DfQpVIbc2eqk1v/47k95BwnGLgJY53
	0MLSib94roB1nnDLsA+WCnhOW3xqNnoaipQRaeIiKnhEAoTM0/JWbU5ryhvUHl2b9Jxe3X5DWL1EL
	Q/Me+QU/Vt0Nnvebmjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRQO-0000000BjnV-0YLL;
	Fri, 06 Feb 2026 19:23:28 +0000
Received: from mail-westcentralusazon11013029.outbound.protection.outlook.com ([40.93.201.29] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRQM-0000000Bjn7-03Aj
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 19:23:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFoxLQbRn32+g6MkxORbNVdU3pHCxYr7zusHmiZ3NDJzEXO3+mv90bEDrnb1vPdAqcRBsffSj+e2lVcjPo8bFdCYgm+kKg7qM/fVuvUu4T9F1TRP9aPkG9MkqN0xbbN5XdSMdW3a2c8UDO6HOUk8qQ+4inCye2B7IkQ4RzJJPEyKgSVKoo3DknIvdcpSpz/nHrMY0jlhZHZtwyH0iMByRD5APR2wpOpoLSk30mrl7scw0v+lJz3OewSCIFvY6Ua1O2NchtHZWkA52KVkOmw0uJia0hCJ6AdpAmKa2wRs0WtIYqjRCDWmjQIQbYqL3wReitzMa5Tu9AWqu4uMyUjMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgoOM6lAV3k64IYQQGV5llq9GZJioKG2YUcoxIP9IyU=;
 b=ut5DMmMYzFc+upMjZl55pVjYwgsN7kLnWFOsXLGwE3K5iljZ35Q2lLyqqAECsnzyXqlcgNSU7cJqL/HBitNifSacsYKOI3I9WMEi581PPOWZpzJPK9Mrz/GNeSPE5xbzWksnfzK9jUq6wlDN0xwxY4BaZU9DD7h0zHWqxrQIV9WvKgSFXr2kGw7goBREyaTafjDAL1GBQgm/nm2IC03Z82Pt83WpDsAU7F9lW8Rd/5IyMnHZYopzqH4GJ/zkCc7PLe6b/aBLK5lHx/Os0F59rR9WKHuXV/qQWhR3MggMRlGCqdo4XMXQ8pvOW8KcvYiMA7YXMgDTlQG5Wj2dNArIpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgoOM6lAV3k64IYQQGV5llq9GZJioKG2YUcoxIP9IyU=;
 b=sv5/tgwBFIrGWx/T9wAZLq25hhL2dbLhjmV2M8dFyqujakuJKWCQi7I8ZytPG9TvHkjxAqWwcr7+klNIRaI9R/vgJ1J/AfFAMkvBSOEvPqJGeZoHKZ5qoW4v7RUh9u/9k0or2bliT5WWf14MK88x1f9sRBKALWjZkHX+BxP/l/s=
Received: from SN6PR2101CA0005.namprd21.prod.outlook.com
 (2603:10b6:805:106::15) by DS7PR10MB5184.namprd10.prod.outlook.com
 (2603:10b6:5:38e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 19:23:14 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:805:106:cafe::bf) by SN6PR2101CA0005.outlook.office365.com
 (2603:10b6:805:106::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.3 via Frontend Transport; Fri, 6
 Feb 2026 19:23:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 19:23:13 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 13:23:11 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 13:23:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 13:23:11 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616JN6J51835842;
	Fri, 6 Feb 2026 13:23:06 -0600
Message-ID: <fc8d1ac0-c713-40ee-b818-47548f9d1818@ti.com>
Date: Sat, 7 Feb 2026 00:53:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/12] mtd: spinand: perform controller tuning
 during probe
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
	<s-k6@ti.com>
References: <20260113141617.1905039-1-s-k6@ti.com>
 <20260113141617.1905039-4-s-k6@ti.com> <87tsvvgkks.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87tsvvgkks.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|DS7PR10MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: df51f4a3-eb77-4a09-8265-08de65b52c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEVsSTIrajVub1BJU2d5OCtIQkU3dmpLSDZrOElzNkJOdCtodFdnd01GYzIy?=
 =?utf-8?B?RWpDK1JpYnVyWVBMOG9tbHNUOU93ZWsvWXpvOHZaVUt2UmhZSFpGSU5ocC9V?=
 =?utf-8?B?RFZJbUhqMkdUTDZzN2t5N3BwOTFTNEtTT2VpUzFENk5LUVp0Rm16aEZVODNi?=
 =?utf-8?B?YTh4OU1pRnpDdTNyM1VZMnVsaURKMVVCWkVrYmszZFF6cHZQOUdXRUJqbDky?=
 =?utf-8?B?ZGdGTTMwZnFIY0xmZmU2d25ENUprWjFTbTQ3MzhTZ2VTUmt3MXJHSG5LRzNC?=
 =?utf-8?B?TzhWU0Z6WW9lK3NMZjg2VkJiR29oV2JrcmY5MFdoeEpndUFtemlSSG9WeEpp?=
 =?utf-8?B?anIwMURtZk80a09LRGhKUjdxS1FJenExVkRmUTlLMW9zclFjSmQxK2xMNWxZ?=
 =?utf-8?B?QVh4ZVl4MjQ0Ukd5RHdBc1YzZEZ6TXluTmpkNjk4MDB1Q3hxU0NEdGljM2pp?=
 =?utf-8?B?WWVtWDlaN1UvNEthVEllVlpWM1IvZ1RPYzdNcG1VY21jeTFTODN2MmRPYzlH?=
 =?utf-8?B?WnA3dDh4enZkWGN3eDAyTGtSNFh4OWZWZE5YL1ZGYlROaXZCaTNKSVljUnNa?=
 =?utf-8?B?Q1NGbUtJNUExTjdJa2U0c3pkOU9VTWhqcDhYcUU0dThsYnlEOUpsMWFuKzBM?=
 =?utf-8?B?K0tjckFtUnFWMytuN0U5NEE0TCtnRDE2eHJTWVdRY2htbzl0KzN6dkEyUENx?=
 =?utf-8?B?THpreEIySmNjQTV0WkdzNmtJclR6M1BZOGJPakV5UEVvWGtOVWVFMDAwQlN4?=
 =?utf-8?B?b2ViWlB2VTZiYUxtd3IrMkRxNTlKUHZjMDE5ZXdzLzJVSWtiSXg5Vlp1U3E4?=
 =?utf-8?B?SE4zM0xFTUlyQmpLYml4VGtUdVZzWG1vNU12VXFtaVE0dkxtcy9pV3c5Rlhi?=
 =?utf-8?B?NE1SQjlCUHIyaEZqaWpCcENnUUs5czBYSThCL25nem1kVVpGNVNvUEVuanlQ?=
 =?utf-8?B?cVEwTThzL1Q1STRhUlVET01acjdUSm13YXFGeHV4Q3g2SC9Vb1V5alVTMXNX?=
 =?utf-8?B?NXJ3ZnUxdkJ4c0c4cEh4WktvMFRWOFZWU3NpR2FDanNBOFAxMk1HSC91dDVX?=
 =?utf-8?B?Tlh4eTdXOWFPUXdhR3I2QXNZamdvR05acEhyeFkyOWV4bG9xRkhGWldTVXV6?=
 =?utf-8?B?UEJjUnd6aUQvdzRhdFpHMXQzL2txdmtZNEFKc3AzWnVzcmoxa0k4MzN2VGxJ?=
 =?utf-8?B?Szk3djFBcWtob2R2NlA5VG9SOFZGUzNobUo3ZjJFTFhsckRIWXU1UUkrcFVF?=
 =?utf-8?B?bkt1aS9JeVJ2ZTExK3JyQ0pvb3RXWHlyY0cwWXdhUEoyVmEzellnNlQ4MXF1?=
 =?utf-8?B?VHJEdGVQNnowaDFldkdvT0ZiMkxqUkZPRkdXMUIyRVp3c3JJbWF3Zk5CeXly?=
 =?utf-8?B?SHU5RzBEaWhvblZoR1FjcWJuVUExV2NYemV4NDRlZnB0NnlyUjIrN1FBdE9D?=
 =?utf-8?B?T24wcE5iNjg3Y1RLQUFRUU9FKzJ0cWtQWGlnMUlSYUV0QXRnNDQ0NmQrc0hJ?=
 =?utf-8?B?WEpHNmM1WThPTXlNTURRVXFuUk5ZbDVndSt1VmJueVVZOGZJamFjMVFneEt2?=
 =?utf-8?B?UFlMNS8xcEN1c1ozOEVXWGVBQmlHV2FFN1F0aXkzUHpqclB6cjJxa0V0bnlM?=
 =?utf-8?B?N3ZMeTdqQWRpcHh5VGViZ252VzBFVXF1UXlWUzBlTTI5Tlh2dmx2VzVwZ3Jz?=
 =?utf-8?B?VWgvNkx0aVFwckZ4OW1jM1hzeFFIV2tJeXFmOXk1WXBXa1Zad2hUZkRoRmts?=
 =?utf-8?B?NlZEallnekhSN0xVNUxOMW9qM2p3L0RVUThVVHVzejhacGJ0TVgzbnJpaGRv?=
 =?utf-8?B?c0JxeVlmbWgzM1k5MWVlZE9iWlN6ZWRacFJ0cDNWb1pudERuVmtJV1ZucHV4?=
 =?utf-8?B?alBEV2xOb2w0STk1RHRxRS9WYmlURDcrelk2Ym1iem05TFptL2VKcWZrRGFo?=
 =?utf-8?B?OXNZckFlclR2QjR2VjM2Y0llcmdaKzNFK2g1VGZRRnl1T3lCK2c0ZkVlT2ll?=
 =?utf-8?B?UW5oQzk3WThJYTZPZzZ6WldBZFhOTlpaMkF6OEJQVU8zWHZncCsyek1ydCtk?=
 =?utf-8?B?ek9UakVvaVIvOU0vY0dMYTFtSjlra1ZGWmNUM0pLWHRlc2VvQlUrWmFmNmpM?=
 =?utf-8?B?SkVoWFpBOXN4dHR5c1A5Yzc2dVpLT2hPdXFjR2xobjBsVTV2VWoxRlRQKzE5?=
 =?utf-8?B?WVYvbmFHaWJGS1lCTXYxNGZHSnp6aU8yejFURDlOdWtUM2RyVFY0UHRheFZK?=
 =?utf-8?B?N1VUaEpSV1VXZkJnWjNPWDN5ejN3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: d0BTbG3IPxfD1Odg+20owAN3l30ZZr1WdMZPBcKhuOkc2F6M2SessOqzqEEsatOpviRsdzpjsj31YfBb2LiIryMDTwQMQUcoJd1iMZghLswGeE05PfRpi+oz7vIN5xG7MCoRgHVsA/xE3xVuVgOYJLPNkstvu0WivG2E/xXUaR5mPeQaoLm5wcDhKqX6v+evqQDKnvtItRSfJokKxOlQSmZPexvSsL0PQ5s2ICz5bDnHZeaWVELUsG4/0sRJsde0TJifJF8u+in6CknGCvPLvxQxSss8WH8+nA5YN5UXh47mO8mWbc/HwYmiDiGR+qltlfvPHSIwAVYqiACL0mTQCtk5skfOBSbxylh60nI/mVYTWqHRCK6eE4Ei8/6Q/hrH4Wr+vtu81F/JYL6h41F+mADkluWr0aT99RMqS9EGR0/S4R0I0+m6xe7Xe8X+iwTi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:23:13.9375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df51f4a3-eb77-4a09-8265-08de65b52c4f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_112326_077735_CF9D7FBF 
X-CRM114-Status: GOOD (  14.59  )
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

SGkgTWlxdWVsLAoKT24gMDUvMDIvMjYgMjM6MDUsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkg
U2FudGhvc2gsCj4gCj4gT24gMTMvMDEvMjAyNiBhdCAxOTo0NjowOCArMDUzMCwgU2FudGhvc2gg
S3VtYXIgSyA8cy1rNkB0aS5jb20+IHdyb3RlOgo+IAo+PiBTUEkgY29udHJvbGxlcnMgbWF5IG5l
ZWQgdHVuaW5nIGZvciByZWxpYWJsZSBoaWdoLXNwZWVkIG9wZXJhdGlvbi4KPj4gV2l0aG91dCBp
dCwgY29udHJvbGxlcnMgdXNlIGNvbnNlcnZhdGl2ZSB0aW1pbmcgdGhhdCBsaW1pdHMgcGVyZm9y
bWFuY2UuCj4+Cj4+IENhbGwgc3BpX21lbV9leGVjdXRlX3R1bmluZygpIGR1cmluZyBwcm9iZSB0
byBvcHRpbWl6ZSB0aW1pbmcgZm9yCj4+IHRoZSBkZXZpY2UncyByZWFkIGFuZCB3cml0ZSBvcGVy
YXRpb25zLiBGYWlsdXJlcyBhcmUgbm9uLWZhdGFsIGFzCj4+IGNvbnRyb2xsZXJzIGZhbGwgYmFj
ayB0byBkZWZhdWx0IHRpbWluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2FudGhvc2ggS3VtYXIg
SyA8cy1rNkB0aS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8
IDE0ICsrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMv
bXRkL25hbmQvc3BpL2NvcmUuYwo+PiBpbmRleCAwMzQ2OTE2YjAzMmIuLjJhNDVkMTA0NzczNiAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBAQCAtMTY1OCw2ICsxNjU4LDcgQEAgc3RhdGljIGlu
dCBzcGluYW5kX3Byb2JlKHN0cnVjdCBzcGlfbWVtICptZW0pCj4+ICAgewo+PiAgIAlzdHJ1Y3Qg
c3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQ7Cj4+ICAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkOwo+PiAr
CXN0cnVjdCBzcGlfbWVtX29wIHJlYWRfb3AsIHdyaXRlX29wOwo+PiAgIAlpbnQgcmV0Owo+PiAg
IAo+PiAgIAlzcGluYW5kID0gZGV2bV9remFsbG9jKCZtZW0tPnNwaS0+ZGV2LCBzaXplb2YoKnNw
aW5hbmQpLAo+PiBAQCAtMTY3Niw2ICsxNjc3LDE5IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9wcm9i
ZShzdHJ1Y3Qgc3BpX21lbSAqbWVtKQo+PiAgIAlpZiAocmV0KQo+PiAgIAkJcmV0dXJuIHJldDsK
Pj4gICAKPj4gKwlyZWFkX29wID0gKnNwaW5hbmQtPm9wX3RlbXBsYXRlcy5yZWFkX2NhY2hlOwo+
PiArCXdyaXRlX29wID0gKnNwaW5hbmQtPm9wX3RlbXBsYXRlcy53cml0ZV9jYWNoZTsKPiAKPiBU
aGVzZSB3aWxsIGJlY29tZToKPiAKPiAgICsJcmVhZF9vcCA9ICpzcGluYW5kLT5vcF90ZW1wbGF0
ZXMtPnJlYWRfY2FjaGU7Cj4gICArCXdyaXRlX29wID0gKnNwaW5hbmQtPm9wX3RlbXBsYXRlcy0+
d3JpdGVfY2FjaGU7Cj4gCj4gYWZ0ZXIgcmViYXNpbmcgb24gbmFuZC9uZXh0IG9yIG5leHQgLXJj
MS4KCk5vdGVkIQoKPiAKPj4gKwo+PiArCXJldCA9IHNwaV9tZW1fZXhlY3V0ZV90dW5pbmcobWVt
LCAmcmVhZF9vcCwgJndyaXRlX29wKTsKPj4gKwlpZiAocmV0ICYmIHJldCAhPSAtRU9QTk9UU1VQ
UCkgewo+PiArCQlkZXZfd2FybigmbWVtLT5zcGktPmRldiwgIkZhaWxlZCB0byBleGVjdXRlIFBI
WSB0dW5pbmc6ICVkXG4iLAo+PiArCQkJIHJldCk7Cj4+ICsJCS8qCj4+ICsJCSAqIFR1bmluZyBm
YWlsdXJlIGlzIG5vbi1mYXRhbDsgdGhlIGNvbnRyb2xsZXIgZmFsbHMgYmFjayB0bwo+PiArCQkg
KiBkZWZhdWx0IHRpbWluZywgcmVkdWNpbmcgc3BlZWQgYnV0IGVuc3VyaW5nIG9wZXJhdGlvbi4K
Pj4gKwkJICovCj4+ICsJfQo+IAo+IENhbiB3ZSBtb3ZlIHRoZSBjb21tZW50IGJlZm9yZSBzcGlf
bWVtX2V4ZWN1dGVfdGltaW5nKCk/IFRoZW4gbm8gbW9yZQo+IGJyYWNrZXRzIG5lZWRlZCBhbmQg
aXQgd2lsbCBiZSBlYXNpZXIgdG8gcmVhZCAoaW1vKS4KClllYWgsIEkgYWdyZWUgb24gdGhlIHJl
YWRhYmlsaXR5IGNvbmNlcm4gLSB3aWxsIG1vdmUgdGhlbSBpbiB2My4KClRoYW5rcywKU2FudGhv
c2guCgo+IAo+IExHVE0gb3RoZXJ3aXNlLgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
