Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151E2E9A047
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Feb 2026 18:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YIOFg0EsN/6yXJoIsNoDsXKPOzJlxhyy3AVEdfT5q98=; b=JcCAx572shCmiJ
	BhmC8jBrL59UzIfr65SJa5W6TpXZVYJCJ35BIwYhy+X2fYr8JEGfgIKJJjXEBz0P4EQ45LiOHcZgn
	SCzdhaXuaRZNtNEYQ45L5L5maCCOd2DxNe4+mZFaMgKcy1SgbiIMyI9gxlgM67gDW0DAI5G2VZRQQ
	xLyinz4cJVuA7sq3lZkzfcDtbqNS0T+6Mwgr2KDJxDsz5phx1x3i9b7e3NMjjH639dT8ufoH5To6j
	5xXM0p1au0x72cSKykbRyFECvSUuRuG1VwfhBpaVyig2yNEDQ8AVzzxdw3UHj2+not8Qb9MHLETGE
	mbm6sDMjq8RGF+U578+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslyD-0000000AD6J-2i5X;
	Wed, 18 Feb 2026 18:08:17 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslyB-0000000AD5m-2njM
	for linux-mtd@lists.infradead.org;
	Wed, 18 Feb 2026 18:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtyDguzpRkJiv3+mHa3dtEvYnOlBhezCHxWewDJGo9IaHuOyxHDYAF6sOvCaRMRZs55ockw0fVKjOi3C/jOcwYwdiG/j17Fw7m4MvnBWgUeAqirlb4IRFIo1PdAmOJ0QX+XPbvbQhW6BRVWwh1RlNP1yTxGqvnd8/2uMVdr+NhV3pY/Y9ABzfPYtMttBS4WQ0NjXkbN30T0kA6Oa+ykJMR0kt8F+gxghCWmanPrUfhqW3+dCZm1OeXw8g/pivx2Y5hFpEplGCcrPHASsLvLLFUgFKU8wXtLNZDCtJ5XEHtIYeWY4JMgsLiQS/C42gzBQvZaf3y1L5G6YeFugsM32Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dcZOWHMS7YyPOkSRSy99DcEZShodwpSoG9gulsI58g=;
 b=RRCyrD3b6rD1CGHWRfv6yt1ubYb6CfzPBw0XcFfNyIww23DQp/Yh4RzN4Oux2PKQU7GVE5Xka35CxP6iN2Ts4lGFu9EHW9pcEJb2gPQuqsX5SkTKIypD5Ulb3CgVLEjKVzDDhhJTbR8fbLrJ7wUqWVxlRe6eKdZ6v+tVvmo4U0EYTevxk35bZTdQI8SJDlIzZSg1q2gOZvJu8wKRLD3ibQNEQDa30/zBG2jd2YYJBmxU/lrr9puTl93pATYbs7ezsueATeILyfO1iTAi24C7A8SAOJhjbQWdK3rpBM3O1zTlZeFQxSz2lXLwP55fgaoojfy9XS1pKhR1eCZfL+MB3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dcZOWHMS7YyPOkSRSy99DcEZShodwpSoG9gulsI58g=;
 b=Zad6IcdW5ndUTdPJ+wufgDXAn9mROZKPMFbsJ8mHcsXfTv7CxNTo54RaD0G0GhhG+GGKMqA9LVj8JBvZ+AQaeCt4dbKEx+mgb/80dndobfI3R/AeL3DdBAnuoW1yCH13sAdNBIMWzNMB1Muk7LUmYA1UOFftMWwb4X1t+PZPwHM=
Received: from BY3PR10CA0021.namprd10.prod.outlook.com (2603:10b6:a03:255::26)
 by CY8PR10MB7218.namprd10.prod.outlook.com (2603:10b6:930:76::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 18:08:06 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::b0) by BY3PR10CA0021.outlook.office365.com
 (2603:10b6:a03:255::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 18:08:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 18:08:05 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 12:08:05 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 12:08:05 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 12:08:05 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61II7xgS802418;
	Wed, 18 Feb 2026 12:08:00 -0600
Message-ID: <fcdeadca-5bd4-4b03-8076-34d6cad940cc@ti.com>
Date: Wed, 18 Feb 2026 23:37:59 +0530
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
 <012a44f3-973f-4f34-be69-286cf924a6c6@ti.com> <87a4xdxdht.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87a4xdxdht.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|CY8PR10MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: feed5c0b-d9b4-41f9-a0d3-08de6f18aa53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmkxTEk0clhndUpMZlp5cGg1QW84cmZGQk8zcE1JLzZJQmFQNzRGUmJTTnNs?=
 =?utf-8?B?QlJ0ZWx2MmhVME4wS0RXY1Fjc0VZVDcyTFdJSExUNllua0g4UVJWNzBsODJl?=
 =?utf-8?B?OUxSSVNlMHZ3bVJEVFZ4S0ZNSVg2dzcwRVNKOS96SWNqZEdCTUpMTXgxVDB0?=
 =?utf-8?B?azZTUGF5RThYdEk4WkYySlVZQjdMSDFBTFlMais4enFFeE1PMGtMUGpFNWRF?=
 =?utf-8?B?SWt6Wm5JdkhRK3hwRk9oU2tTUFhZdjRsM1UreTlaeGJNazd2N0xVY0xUYjZ0?=
 =?utf-8?B?M1ZRZ0pLZVZaTG1IckJTVkp4ZVlCbnZQTkl4RzRzcGxSdXdWNWpWeDh4UjBM?=
 =?utf-8?B?c1YzUkJxNlRYRVhuUk5QMTVZZ2tZWVVkbGF6YUhWa2w5dk94eVcvdEkxMklD?=
 =?utf-8?B?MkRlc2FCMnEvaVVlRG1jZGRnbEs5cWp5Y2QzY3JLSE85QzJ0RjB1M1NVN0k5?=
 =?utf-8?B?MGt2V0xsT3MybEN1QjczSUJGcFFhRFZGQ09jSHFGblVuV3doemY5T293Tjgz?=
 =?utf-8?B?d1lLQ2V2U0RvbGtTVkpmbVJWd2dTZE9USUZDQ3BZL0RwNU9OUnpoZjcxRDNw?=
 =?utf-8?B?UHJnQ2hXSCtFbTNOZ1RMMkpDalV2bUNpYlBYS1E0Q3g0M1FZMkh3SEZZb29i?=
 =?utf-8?B?U2ZadWJlYzdzSUV2eGd4ejNKOW1IcXQzUE9QWlVnaWFWWnJQSnI5VEhhdnpx?=
 =?utf-8?B?L1pQRHFSQm11Y3dCQmtwSnNrNDhRRGI0YjVFOEk1cmlqSHhsUUpPREJrZmN0?=
 =?utf-8?B?OHIwOGdOdU9QNW1YWEpxL3pjaFpON3dtSmM1ZGZ4R21sbEZyWGhCcFYyWC9j?=
 =?utf-8?B?VlJDYXlOeTVDdlRZMUMvaDFKSkhnMWJGbTFFTnMxWkRaT3djdjYwNEFlK3Fo?=
 =?utf-8?B?NStycDV4bmZLbGtRNS9XdEpCM2lQaTJWbTNORllOeFRNcG1HS2pRVVRLNElO?=
 =?utf-8?B?cDZ2UmJSdU9reGVNT1IzZkNSdmdyUnlCbmF6YXdSbldXMkVGTHdJQXRib2lR?=
 =?utf-8?B?SmpxMDkvWmQ1QXVROW1HcTR1aWhPd0FzLzFINnh4MklYalhPMlZDMm9WOXdp?=
 =?utf-8?B?N3JPN0o3eTlBS2tra0d0akRFRVZ4YmxHaytkZEllVitlNlhOY1NyK3Z3VXN5?=
 =?utf-8?B?aWYvZWlJNzdzem5IR0lQQlRTU1pSNXpLK2F4UWdWdkJBdVFlQndlUXA0QUdU?=
 =?utf-8?B?NXFMbnIvOUdvZGRNTmZXc2IvaytJTVpTQWtvOWZLL2YyUGtRZ3pkSkF6K1Ba?=
 =?utf-8?B?dWRVNGFsN2htdnl4Zkk5aWE0SXRUR2hrNlBNck9lTUp1SkZ4OTFmV1pIM0Z4?=
 =?utf-8?B?TnV0WTJkQ1F4WEFyU3BhZ0RKQ21abGUyQ010dkRNQXF6eGxsbGFHUG5WK1Nz?=
 =?utf-8?B?MmtQL3pxV1lyb09jOTNndmE4Zkltb0ZWTnVTeEpSdTM5b2s3QjBIWWJCUVQ1?=
 =?utf-8?B?YVVqTUlLY1RiSHVQK3pzT1J4OHVTdmZDd3RwcEI1QjMzM2F2SjQzUzNXUU1T?=
 =?utf-8?B?M05wVjczbE9nbmpvMEkvNkdsTlVtS21iSEl1MStqTTBDa2paek1qckxIellz?=
 =?utf-8?B?SktLbHJPUWRDdTB1R2JacjZFMXorc1V5cS9LamFydXEzSzErNHA0MU0rSE5X?=
 =?utf-8?B?alBuODl6K0toelRsSGdiWE1ROU96cWFEWVRCQlk4MzBUbmNTWTVtTjZaTE01?=
 =?utf-8?B?S1pnZGtOMVdKWFpkS2ZGQUFHQ1FsU2k2a0xUQ0JiMGkwQU94VzBZMWNxSFBY?=
 =?utf-8?B?WWNTUWVHK3JlR3dDK2tRbk5vUFlRK1ZxZXBoNG9vSWlQbTBIdEkrZmdMYjZm?=
 =?utf-8?B?aEc0YWNENkRWdCtOeUYycHExNnZSUDN2bHIvamVwZzJudnorZGJJWmhFUXlT?=
 =?utf-8?B?djR3Q0xUb1B6dHNkUG1nS09wZEhzeHExTXZCTG80THFud0x5Qk9XQXQ0cEZQ?=
 =?utf-8?B?ZkYrbmNwMEExZFZoVlNpMC9IYml2dyt6Y0pmVEM2aWRpNE1SMk92aE1pbnhG?=
 =?utf-8?B?SW5mNzY1QlBqLzZxL1FLQmhQdGJwaHBpSVlFV1JwKzRFMG93RGZTU3pYVWpn?=
 =?utf-8?B?SCtWNU9tOEVLUEUzTTBTR1NUeGFrdjR6VVBMeGI1MVJhNHVUM0hnY0xlTEtR?=
 =?utf-8?B?UUZ4amR1aGJ3c1NBYlYzN3QrT0g4NTl2WXIvTzMybFg1eitTbWRqSkdyb0px?=
 =?utf-8?B?aWNLZms0bWZxeEZGSjFPaWlJUHlCM010MHgvd2lXeDFVYVplKzF6UXNEZGxi?=
 =?utf-8?B?V2piQWVNUDdJL1VFcC8vck0rSUpBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MyaPTViZISQaMwOu+clrlcedqQewv7tEYNPo7RZDuVcZGO+/QdnQx11y7rhkyWJMH+bHVT0Wd1iiFdTZTHX3IAtqnHF6PhIyOVl+9B2EYiWWpvv/cZPy7Dz+TVP+4Y7i2gNiM2ekqMzixM/NgwJhD73BpuxEYymJFHAXAEsQTvGzpUbr7d0Xr7Z+cpy5HQ5Dfh38dteiJHf9gFf0qoIqal14nV/P+58ZlT0emsWBtM8h7wSAuAfSgX2m3NWuBEQhrhQ9TOFH0mhgCALpCjGNDU3n1J0wZmd71c4C6tmOOT0zBRhRwZVuWrw6p5fpIowhP7iyNgAE2+oZXaY0pz05WMQ62l6+gn4udxqK3V7YXxDfQdL0GJ/Caq1iDhWVn28gRXOzZbWc+yrUmZSUM3NAguuVwQ0/QzItwctMmAHAF2bSArx3CzHusxant4VHCNH3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 18:08:05.9424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feed5c0b-d9b4-41f9-a0d3-08de6f18aa53
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_100815_718716_E472192D 
X-CRM114-Status: GOOD (  22.39  )
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

SGVsbG8gTWlxdWVsLAoKT24gMTMvMDIvMjYgMTM6NDgsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
T24gMDcvMDIvMjAyNiBhdCAwMDo1NTo0OSArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgo+IAo+PiBPbiAwNS8wMi8yNiAyMzowOSwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPj4+IE9uIDEzLzAxLzIwMjYgYXQgMTk6NDY6MTQgKzA1MzAsIFNhbnRob3NoIEt1bWFyIEsg
PHMtazZAdGkuY29tPiB3cm90ZToKPj4+Cj4+Pj4gSW1wbGVtZW50IHRoZSBzcGlfY29udHJvbGxl
cl9tZW1fb3BzIGV4ZWN1dGVfdHVuaW5nIGNhbGxiYWNrIHRvIGVuYWJsZQo+Pj4+IFBIWSB0dW5p
bmcgc3VwcG9ydCBmb3IgdGhlIENhZGVuY2UgY29udHJvbGxlci4gUEhZIHR1bmluZyBvcHRpbWl6
ZXMgZGF0YQo+Pj4+IGNhcHR1cmUgdGltaW5nIGF0IGhpZ2ggZnJlcXVlbmNpZXMgYnkgY2FsaWJy
YXRpbmcgdGhlIHJlYWQgZGF0YSBjYXB0dXJlCj4+Pj4gZGVsYXkgdGhyb3VnaCB0aGUgY29udHJv
bGxlcidzIFBIWSBpbnRlcmZhY2UuCj4+Pj4KPj4+PiBUdW5pbmcgYWxnb3JpdGhtIGZ1bmN0aW9u
cyAoY3FzcGlfcGh5X3R1bmluZ19kZHIvc2RyIGFuZAo+Pj4+IGNxc3BpX3BoeV9wcmUvcG9zdF9j
b25maWcpIGFyZSBwbGFjZWhvbGRlcnMgdG8gYmUgaW1wbGVtZW50ZWQKPj4+PiBpbiBzdWJzZXF1
ZW50IGNvbW1pdHMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTYW50aG9zaCBLdW1hciBLIDxz
LWs2QHRpLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBkcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFk
c3BpLmMgfCAyNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gICAgMSBmaWxl
IGNoYW5nZWQsIDI0MSBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVh
ZHNwaS5jCj4+Pj4gaW5kZXggMGRmMjg2ZDI0MjU2Li5iOGIwZTg1ZjRmNjggMTAwNjQ0Cj4+Pj4g
LS0tIGEvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jCj4+Pj4gKysrIGIvZHJpdmVy
cy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jCj4+Pj4gQEAgLTMyLDYgKzMyLDcgQEAKPj4+PiAg
ICAgICNkZWZpbmUgQ1FTUElfTkFNRQkJCSJjYWRlbmNlLXFzcGkiCj4+Pj4gICAgI2RlZmluZSBD
UVNQSV9NQVhfQ0hJUFNFTEVDVAkJNAo+Pj4+ICsjZGVmaW5lIENRU1BJX0FNNjU0X05PTl9QSFlf
Q0xLX1JBVEUJMjUwMDAwMDAKPj4+PiAgICAgIHN0YXRpY19hc3NlcnQoQ1FTUElfTUFYX0NISVBT
RUxFQ1QgPD0gU1BJX0RFVklDRV9DU19DTlRfTUFYKTsKPj4+PiAgICBAQCAtNjUsNiArNjYsNyBA
QCBzdHJ1Y3QgY3FzcGlfc3Q7Cj4+Pj4gICAgc3RydWN0IGNxc3BpX2ZsYXNoX3BkYXRhIHsKPj4+
PiAgICAJc3RydWN0IGNxc3BpX3N0CSpjcXNwaTsKPj4+PiAgICAJdTMyCQljbGtfcmF0ZTsKPj4+
PiArCXUzMgkJbm9uX3BoeV9jbGtfcmF0ZTsKPj4+IFRoaXMgaXMgdGhlIHNlY29uZCAoYW5kIGxh
c3QpIG1haW4gaXNzdWUgSSBoYXZlIHdpdGggdGhlIHNlcmllcyBhcyBpdAo+Pj4gaXMKPj4+IHJp
Z2h0IG5vdy4gV2UgY2Fubm90IHNldCB0aGlzIHR5cGUgb2YgZnJlcXVlbmN5IGluIHRoZSBkcml2
ZXIgSU1PLCBpdCBpcwo+Pj4gdG9vIGJvYXJkIHNwZWNpZmljLgo+Pj4gV2UgY3VycmVudGx5IGhh
dmUgYSBEVCBwcm9wZXJ0eSBmb3IgdGhlIFNQSSBtYXhpbXVtIHN1cHBvcnRlZAo+Pj4gZnJlcXVl
bmN5LiBJIGJlbGlldmUgdGhpcyBpcyBubyBsb25nZXIgZW5vdWdoLiBXaHkgbm90IG1ha2luZyB0
aGlzCj4+PiBmcmVxdWVuY3kgcHJvcGVydHkgYW4gYXJyYXk/IEZpcnN0IGZyZXF1ZW5jeSB3b3Vs
ZCBiZSB0aGUgZGVmYXVsdCwKPj4+IG5vbiB0dW5lZCBtYXhpbXVtIGZyZXF1ZW5jeS4gVGhlIHNl
Y29uZCB3b3VsZCBiZSB0aGUgbWF4aW11bSBmcmVxdWVuY3kKPj4+IHJlYWNoYWJsZSB3aGVuIHR1
bmluZyB0aGUgUEhZLgo+Pgo+PiBJZiB0aGUgY29uY2VybiBpcyBvbmx5IGFib3V0IHdoZXJlIHRo
aXMgaXMgc2V0LCB3ZSBjb3VsZCBpbnRyb2R1Y2UgYSBEVAo+PiBwcm9wZXJ0eSBzdWNoIGFzICJu
b24tcGh5LW1heC1mcmVxIiB0byBjYXJyeSB0aGlzIGluZm9ybWF0aW9uLiBUaGlzCj4+IHdvdWxk
IGFsbG93IHVzIHRvIGF2b2lkIGFueSBjaGFuZ2VzIHRvIHRoZSBleGlzdGluZyAic3BpLW1heC1m
cmVxdWVuY3kiCj4+IGhhbmRsaW5nLiBMZXQgbWUga25vdyB5b3VyIHRob3VnaHRzIG9uIHRoaXMu
Cj4gCj4gTmFtaW5nIGlzIGRpZmZpY3VsdCwgbm9uLXBoeS1tYXgtZnJlcSBpcyB0b28gVEkgc3Bl
Y2lmaWMuIEkgd2FzCj4gcHJvcG9zaW5nIHRoZSBldm9sdXRpb24gb2Ygc3BpLW1heC1mcmVxdWVu
Y3kgYmVjYXVzZSBpdCBpcyBiYWNrd2FyZAo+IGNvbXBhdGlibGUuIFRoZSBuYW1pbmcgY2FuIGJl
IGRpc2N1c3NlZCBhZnRlciB5b3Ugc2VuZCBhIHByb3Bvc2FsLCBidXQKPiBkbyBub3QgaW5jbHVk
ZSAibm9uLXBoeSIgaW4gaXQuIEl0IHNoYWxsIHJlZmxlY3QgdGhlIGZhY3QgdGhhdCB3aXRoIGZp
bmUKPiB0dW5pbmcgd2UgY2FuIHJlYWNoIGhpZ2hlciBmcmVxdWVuY2llcyBvbiBjZXJ0YWluIG9w
ZXJhdGlvbnMuCgpJIHRyaWVkIHlvdXIgc3VnZ2VzdGlvbiBvZiBrZWVwaW5nIGFuIGFycmF5IG9m
IGZyZXF1ZW5jaWVzIGluCnNwaS1tYXgtZnJlcXVlbmN5OgoKc3BpLW1heC1mcmVxdWVuY3kgPSA8
MjUwMDAwMDAgMTY2MDAwMDAwPjsKICAgICAgICAgICAgICAgICAgIChub25fcGh5X2ZyZXEgcGh5
X2ZyZXEpCgphbmQgdXBkYXRpbmcgbWF4X3NwZWVkX2h6IHdpdGggcGh5X2ZyZXEgb25jZSB0dW5p
bmcgc3VjY2VlZHMuCgpCYWQgbmV3cyEgdGhpcyBkb2Vzbid0IHNlZW0gdG8gd29yayBhcyB3ZSBl
eHBlY3RlZC4gVGhlCnJlYWRfb3AtPm1heF9mcmVxIGZvciBib3RoIE5PUiBhbmQgTkFORCBpcyBp
bml0aWFsbHkgc2V0IHRvCm5vbl9waHlfZnJlcSwgYW5kIGl0IGRvZXMgbm90IGFwcGVhciB0byBi
ZSB1cGRhdGVkIGFnYWluIGJ5CmFkanVzdF9vcF9mcmVxKCkgYWZ0ZXIgdHVuaW5nIGNvbXBsZXRl
cyBhcyB0aGUgaWYgY2FzZSBmYWlscy4KClJlZ2FyZHMsClNhbnRob3NoLgoKPiAKPiBNYXJrLCBh
bnkgdGFrZSBvbiB0aGlzPwo+IAo+PiBJJ2xsIGFsc28gdGVzdCB0aGUgYXBwcm9hY2ggeW91IHN1
Z2dlc3RlZCBhbmQgc2hhcmUgbXkgaW5wdXRzIGJhc2VkIG9uCj4+IHRoZSByZXN1bHRzLiBCeSB0
aGUgd2F5LCB3aGVyZSBhcmUgeW91IGluc2lzdGluZyB0byBhZGp1c3Qvc3dpdGNoIHRvCj4+IHRo
ZSBtYXhpbXVtIGZyZXF1ZW5jeSAtIHdpdGhpbiB0aGUgY29udHJvbGxlciBkcml2ZXIgb3IgaW4g
dGhlCj4+IHNwaS1jb3JlPwo+IAo+IEl0IGlzIHByZWZlcmFibGUgdG8gbWFrZSB0aGUgZGVjaXNp
b25zIGluIHRoZSBjb3JlIGFuZCBhdm9pZCBiZWluZyBzbWFydAo+IGluIGNvbnRyb2xsZXIgZHJp
dmVycywgaWYgcG9zc2libGUuCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
