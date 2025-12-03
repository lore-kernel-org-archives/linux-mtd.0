Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA1ED116F3
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Dec 2025 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tLzC55OPLGhU+7Rp3K/JLT7nIv5+csGfsrETe72PL4=; b=i3zq1394t1fnwu
	B2O1YapWeGwQFMQmySp6hTkuboyAUfCfvtl/KNu8LNotRYUTjvqKjUJ8IxqOhmElidZ+ssD4BKYqa
	3GOjZLYFXQ1aMnpZWOQMw5hsxk4MsiHEQreMbObQkNkjKXYU0MUgGyto/Jd49IM2xfYIRW9NxgNjQ
	zaqbiSGLbKqbHMPl2aykKIIIDPEXIUM9OrlANzERBWu2s93sXdtI3abqiW0WLZWYXy9E+VQ4GIL0C
	PAf/BYt/M5pIdyo1fRNUDtZmWVGMhsOOMeYDSy1u+lfvF2URzF8ilIC6JC35p28YNG3ivKJSK5C7g
	Pw7zvRkToBqZxJ+I+tFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhos-00000006HOZ-1OCY;
	Wed, 03 Dec 2025 08:02:38 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhoq-00000006HNs-0wFp
	for linux-mtd@lists.infradead.org;
	Wed, 03 Dec 2025 08:02:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VneX0jf0ao9oBAinKs5cALaV7FHnpB1Mk20t5s5UyDPAtEDkcyjrVU9Fk8wxZWR6tZxnsKMSlSLmArd87hiqxzQdEdxyzeqgjvRenLIW7E6PsHLmwkH+fprqNSnunDP1CnYG529nhME8NTNfTesEs8B97K6w0SePokWsTg7q6QnyR+oz8dMAfOJgV2koODmJsvLWITocSCNapAtyHZpdOLFcGkr0IHcB3zerQzuwZhBImTrnvp/JnsDt50jb+3WO907ohFocPkoFxS4rl/BoZrFLvxoGzyaCPQNG3nQm/K29Csq1Et+HNqcigmfHfe9B/MM2QG26p0ymO22YHcCWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feOAxHfutAQypO6ut2f22CEz7nDMcOW4yrtaH9x7wls=;
 b=cI9z64cvOjRfBcIt8Fwfiy16Tk4wAcXsTHKyNbugQDNK89Cah6fk+SCMDSjPUuHqcQm1LHI2ZqdjRgIyj8yGdavFqFwWwPM+vb/dyqE7bNjZ79kFqXklx1P21S+la3xPm8lK5ZZ4R2mCmvtwCXAyAs8sKpxEynp9E4lOmvG/vx7356895F9xlppWjSNIPlKsX2MhP51JLEg72fBZTlFxJ8c7f2e6nrTAFYpq+dlUgayWxfW+Tmry8Wulu6D/h6QmMKaX7Zntf5TtsuC3PGMrsfwovD4ZZl3M+tzdfETHTRGUt9MIGg+GsQ/QyVOuMxcc1HiutKzh1MRmi+eHEzVTBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feOAxHfutAQypO6ut2f22CEz7nDMcOW4yrtaH9x7wls=;
 b=jT85B3pGGSmMUr1kI070xsKEqG4RsRIuWoA810AQDv0e62JUwQTxWM9RiUgulGGMeDxTC771NnIR6V7uJSoI2+tIrVv0i2As8rlP/CAKjnWO7kB/y4tf60jERUj+YG/hRfYl5EgJ7NoadZEHwb6mIKo+RRoIP7Dr9Da28vSwWRU=
Received: from MN2PR15CA0038.namprd15.prod.outlook.com (2603:10b6:208:237::7)
 by IA3PR10MB8114.namprd10.prod.outlook.com (2603:10b6:208:513::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 08:02:32 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::76) by MN2PR15CA0038.outlook.office365.com
 (2603:10b6:208:237::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 08:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 08:02:31 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 02:02:20 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 02:02:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 02:02:20 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B3829xC3686810;
	Wed, 3 Dec 2025 02:02:16 -0600
Message-ID: <cf87ced7-aa66-4b15-98e5-92cb76737073@ti.com>
Date: Wed, 3 Dec 2025 13:32:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
To: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
	<tudor.ambarus@linaro.org>, <mwalle@kernel.org>, <p-mantena@ti.com>,
	<linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <a-dutta@ti.com>, <u-kumar1@ti.com>,
	<praneeth@ti.com>, <s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
 <20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
 <cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com> <87qzunt4n4.fsf@bootlin.com>
 <ea19bc64-a775-4309-8f3b-ce9dd8ac02ee@ti.com> <87ecqcakjo.fsf@bootlin.com>
 <mafs0ms4j4fuz.fsf@kernel.org>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <mafs0ms4j4fuz.fsf@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|IA3PR10MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6e3a80-e5d8-45ca-c7ac-08de32424f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHpRa1RPQnA1ZlFHUmpYKzNzV2lyeEE4Tk44TUJLWkk2RjE3Ny9EUmVKbjd1?=
 =?utf-8?B?eVh3OGd3bEtXWmI4SGk5ckFyR3RUSmExbG8zdTVvcUpXRmkrck8ybnJCQmJj?=
 =?utf-8?B?d0RFZ0hRVEpsa252d2FaQXVuMFFoeGdmbVJ0c3NsY2pSelg2ZDdtcTBZTE9N?=
 =?utf-8?B?eks0ekZrNzNsNStOR21GcHRybU5LSXNjUGsxSTdsZC8wR0hzY0orYXhTNHhO?=
 =?utf-8?B?cHdDeGo0QVROOC9VZE9mNGEza2tHU2FpVDc0M20wYThjU3BmVWVxeURDYUJh?=
 =?utf-8?B?UUpXcVRUc0d4S3lxVDMyUjFpN2dLR0VGK3U1U0t0U3I1YlJBNGNldFA0bUdO?=
 =?utf-8?B?N011NFJlck9aU3UzNVhSb3JMTmo4RExYZE1rYkhGNDJlQzhJcFJ4NTU2RGt3?=
 =?utf-8?B?eDNSWWUvL0x1YnpwWXZWQUJSZ3pKalBIdE9tY2tlcUFrZ25IZDlPOTViRm1X?=
 =?utf-8?B?V0NOR2FiK2R5R1ZPZ0RqOTJHTUhvKzJGY0tjczdSekZVaWo0TDJaSEN1cGVB?=
 =?utf-8?B?MVptWFd6aHYydUYyU3AxN1Y1Q0UxZHMzeFRRbktNaVBKdTBzMXA3MnlITzVI?=
 =?utf-8?B?c3c5cHV0aW1CT2k5cWxJaTd4UjBkUmQ3Zjl5M05WaXVuSnRXalQwRHRqa05T?=
 =?utf-8?B?MkM2a05aTk9wQWFjaEsvWjhENEsySm5WdExXQTZnaDNKSzd4RVNqWmx4VXRl?=
 =?utf-8?B?dWZSRk5VTVFIb05tOXYzb1YxV1k1QVd2ZFRpRkpvLzN1MTBCV3hDbVJkV2pM?=
 =?utf-8?B?cktMTVdPZi9BY1JoWEFiRWkwOTF0cE9xVzZUa3lDOVhLRTVqK0VEcUsrY3JM?=
 =?utf-8?B?clZtQzk4bWhtYkNCYWFmRis2NnlvVWFPZDB0YlFzdWZaSTRXMGlhYVZQd1Ev?=
 =?utf-8?B?TVdkYlUyTG1JM1FjUFhFcVVxbVVYNHZVOEpEamMrT2JkbmtxZExaV2Q1cDAz?=
 =?utf-8?B?aEcxdGVTbzQ3WkZSMmtLN2Ywd2NQdWRpTDlSY2wrRzJ6bzYyMGZZNkx6aEl4?=
 =?utf-8?B?bGExUGgxbGtpUlNaU0RuQWhidGJOVEhkaTlrb2ZDSnBPY296VTVXelIvc0w2?=
 =?utf-8?B?MzdIdmxYVXRTNFhkWEY2d2ZmMW9GZVExc3RxcHNjcGU0RmZYVEkwWUJhQTVv?=
 =?utf-8?B?UGwrNk42ckt5d0JHbWYvZkJ4bG1hT3Vja0l4ak8rMkNyc3FpdUkxYUhuWVJU?=
 =?utf-8?B?NDJRb1ovKzdYdVp3TUU5bDdlSkxVbkxCbjBmZFlmd0dDNlp0TUVPSkR0RWhL?=
 =?utf-8?B?Ym1QTjJwd1ZucVViOWVlcEZMTUlRZTZET3lrQWVHTDI3QTh3K0FXSms5SVND?=
 =?utf-8?B?d0lkS0dhc2ptWkoranRkalFJVDBXZVorVDVlai9obnZPV1NZSDdYd0hONEky?=
 =?utf-8?B?Q2FYV3lRcHJaY2Y1MitBalhsdWJiclV6dWYzVy84WUxoakg3cHNxN2daeDU2?=
 =?utf-8?B?YXhaMTFlczJBTkJwVjVIeldrTEo4ellaSXZjd2RlSllnNjd3a21nWEkzK1Ur?=
 =?utf-8?B?b2R6OEVoNTdYMm9RR2NsY1ZzdU9FSHhDZldsVjNJM0dWMXZaaWcweXF3TG1P?=
 =?utf-8?B?TzJ5ejU3LzdWUUd6R1NZUi9lZXRrWVMrMmtRMm5zOFg5TTVyUGY1QXQwcEs5?=
 =?utf-8?B?ank1UXdqOVZEYm00R29qLzhpYWxGSWNaTHJkMDU2Nk9TOHpXNXlGWnMwTW1a?=
 =?utf-8?B?L1RVbGJiSFVFOHlYcElxZ01wcE12NVJpTWpqeGh3MTZXbXZmeDNDVjFETHN2?=
 =?utf-8?B?ei9wZUhMcmduaU5ENm45TFd4aUI4WE50R3dNTVJBSWlSSXpWSk1vdi9Pc0pv?=
 =?utf-8?B?MFFzZDRaN0tTM0FuZVVuYU41YVlTRUZNWFQzWVFWYUR6RURMSUtINnpZN1Iz?=
 =?utf-8?B?K0JHNktSZlB0ejN2Q2h2TlkrUUNWNldvZU9lK2FwZkxGVEp1a0xBZnc5b0sr?=
 =?utf-8?B?RWxOeDNBWHRYeTV2Z013aW40RnluYjNqNGNDemR2WlFwV0ZjTWRCMk5GQmox?=
 =?utf-8?B?N1gwVE44Tkt4RjdaMjJJOGRBRW8wQzBOZjZRZTloYzFsajQxMlNnM1FPVWE1?=
 =?utf-8?B?U2U3SFBoUFBFOXl2d1RkcGNQMHo0cldEdVVJKzJsT3RDbVBpUTBWY0tPWEE1?=
 =?utf-8?Q?qi98=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 08:02:31.4138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6e3a80-e5d8-45ca-c7ac-08de32424f6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_000236_265564_092151E1 
X-CRM114-Status: GOOD (  28.21  )
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

SGVsbG8gTWlxdWVsIGFuZCBQcmF0eXVzaCwKCk9uIDE4LzExLzI1IDE5OjEyLCBQcmF0eXVzaCBZ
YWRhdiB3cm90ZToKPiBPbiBXZWQsIE5vdiAwNSAyMDI1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IAo+PiBIZWxsbyBTYW50aG9zaCwKPj4KPj4+Pj4gICAgICAtIE9uIHR1bmluZyBmYWlsdXJlLCBy
ZXRyeSBieSByZS1ydW5uaW5nIHNwaV9tZW1fbmVlZHNfdHVuaW5nKCkgd2l0aAo+Pj4+PiB0aGUg
c2Vjb25kIGJlc3Qgc2V0IG9mIG9wcyAobWF4IHRocm91Z2hwdXQgLSAxKQo+Pj4+IEkgd291bGQg
bGlrZSB0byBjaGFsbGVuZ2UgdGhpcyBuZWVkLiBDYW4gdGhlIHNhbWUgY2FsaWJyYXRpb24gZmFp
bCBpZgo+Pj4+IGF0dGVtcHRlZCBtdWx0aXBsZSB0aW1lcyAoZWcuIGJlY2F1c2Ugb2YgdGhlIGhl
YXQ/KSBJZiB5ZXMsIHRoZW4gd2UgbmVlZAo+Pj4+IGEgZmFsbGJhY2sgaW5kZWVkLiBPdGhlcndp
c2UsIEknZCBiZSBpbiBmYXZvciBvZiBqdXN0IGZhaWxpbmcgdGhlCj4+Pj4gcHJvYmUuIENhbGli
cmF0aW9uIGlzIGFuIG9wdC1pbiAtPiB1c2VycyBtdXN0IGFsbG93IGEgaGlnaGVyIGZyZXF1ZW5j
eQo+Pj4+IHRoYW4gdGhleSB1c2UgdG8gaW4gb3JkZXIgdG8gZW5hYmxlIHRoZSBmZWF0dXJlPwo+
Pj4KPj4+IEl0J3MgcG9zc2libGUgdGhlIHNhbWUgY2FsaWJyYXRpb24gd2lsbCBmYWlsIGludGVy
bWl0dGVudGx5IGZvcgo+Pj4gZGlmZmVyZW50IHJlYXNvbnMgKHRlbXBlcmF0dXJlIGNoYW5nZXMs
IGFzIHlvdSBtZW50aW9uZWQpLiBJZiB0dW5pbmcKPj4+IGZhaWxzLCB0aGUgZHJpdmVyIHNob3Vs
ZCBmYWxsYmFjayB0byB0aGUgbm9uLVBIWSBmcmVxdWVuY3kgc28gdGhlIGZsYXNoCj4+PiBjb250
aW51ZXMgb3BlcmF0aW5nIHdpdGggc2xvd2VyIHJlYWRzL3dyaXRlcyByYXRoZXIgdGhhbiBmYWls
aW5nIHRoZQo+Pj4gcHJvYmUgKGF2YWlsYWJpbGl0eSBzaG91bGQgYmUgcHJpb3JpdGl6ZWQsIHJp
Z2h0PykuCj4+Cj4+IEFncmVlZCwgaWYgdGhlIHR1bmluZyBtYXkgZmFpbCB3ZSBtdXN0IGZhbGxi
YWNrIGluIHRoaXMgY2FzZS4gSG93ZXZlcgo+PiB0aGVyZSBpcyBhbm90aGVyIHNpdHVhdGlvbiB0
aGF0IG11c3QgYmUgaGFuZGxlZCBpbiB0aGlzIGNhc2U6IG9uY2UKPj4gdHVuaW5nIGlzIGRvbmUg
YW5kIHdlIHdhbnQgdG8gdXNlIFBIWS1vcHRpbWl6ZWQgcGF0aHMsIHdlIG11c3QgZmFsbGJhY2sK
Pj4gdG8gbW9yZSBiYXNpYy9zbG93ZXIgcmVhZHMgaWYgZm9yIHNvbWUgZXh0ZXJuYWwgcmVhc29u
LCB0aGV5IHN0YXJ0Cj4+IGZhaWxpbmcsIHJpZ2h0Pwo+IAo+IEhvdyB3b3VsZCB5b3UgZXZlbiBk
ZXRlY3QgdGhhdCB5b3VyIHR1bmluZyBpcyBvdXQtb2YtZGF0ZSBiZWNhdXNlIG9mCj4gdGVtcGVy
YXR1cmUgY2hhbmdlcz8gWW91IHdvdWxkIG5lZWQgc29tZSBzb3J0IG9mIG9uLWZsYXNoIEVDQyB0
byBkZXRlY3QKPiB0aGF0LiBJIHRoaW5rIG1hbnkgb2YgdGhlIGZsYXNoZXMgdGhhdCBzdXBwb3J0
IEREUiByZWFkcyBhdCBoaWdoCj4gZnJlcXVlbmNpZXMgYWxzbyBoYXZlIEVDQywgYnV0IEFGQUlL
IHRoZSBTUEkgTk9SIGNvcmUgZG9lcyBub3Qgc3VwcG9ydAo+IGl0Lgo+IAo+IEFueXdheSwgSSB0
aGluayB3ZSBzaG91bGQgbGltaXQgdGhlIHNjb3BlIG9mIHRoZSBwcm9ibGVtLiBMZXQncyBmaXJz
dAo+IHN0YXJ0IHdpdGggdGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhlIHR1bmluZyBzdXBwb3J0cyB0
aGUgd2hvbGUgb3BlcmF0aW9uCj4gcmFuZ2Ugb2YgdGhlIGRldmljZS4gVGhpcyB3YXMgdHJ1ZSBh
dCBsZWFzdCBmb3IgdGhlIHNwaS1jYWRlbmNlLXF1YWRzcGkKPiB0dW5pbmcgdGhhdCBJIHdvcmtl
ZCBvbiB3aGVuIEkgd2FzIGF0IFRJLiBUaGUgdHVuaW5nIHBhcmFtZXRlcnMgaGFkCj4gZW5vdWdo
IG1hcmdpbiB0byBlbnN1cmUgaXQgd29ya2VkIGZvciB0aGUgZGV2aWNlJ3Mgd2hvbGUgdGVtcGVy
YXR1cmUKPiByYW5nZS4KPiAKPiBJZiB0aGVyZSBpcyBhIHR1bmluZyBhbGdvcml0aG0gdGhhdCBj
YW4ndCBkbyB0aGF0LCB0aGVuIHdlIGNhbiBleHRlbmQKPiB0aGUgY29yZSB0byBlaXRoZXIgZG8g
RUNDIG9yIHBlcmhhcHMgbGV0IHRlbXBlcmF0dXJlIHNlbnNvcnMgc2lnbmFsIHRoZQo+IG5lZWQg
Zm9yIHJlLWNhbGlicmF0aW9uLgo+IAo+IEJ1dCBmb3Igbm93IEkgdGhpbmsgaXQgaXMgZWFzaWVz
dCB0byBqdXN0IGlnbm9yZSB0aGUgcHJvYmxlbSBhbmQgZm9jdXMKPiBvbiB0aGUgb3RoZXIgb25l
cyBsaWtlIGhvdyB0byBnZXQgdGhlIGNhbGlicmF0aW9uIHBhdHRlcm4gYW5kIGhvdyB0byBkbwo+
IHRoZSB0dW5pbmcuCj4gCj4+Cj4+IFRoZSBvYnZpb3VzIGNob2ljZSBpbiB0aGlzIGNhc2Ugd291
bGQgYmUgdG8gbGV0IHRoaXMgZXJyb3IgaGFuZGxpbmcgdG8KPj4gdGhlIGNvbnRyb2xsZXIgZHJp
dmVyLiBSZS11c2luZyB0aGUgc2FtZSBvcGVyYXRpb24gYXQgYSBsb3dlciBzcGVlZAo+PiB3b3Vs
ZCBiZSBzdWJvcHRpbWFsLCBiZWNhdXNlIHRoZSBmYXN0ZXN0IG9wZXJhdGlvbiBhdCBhIGhpZ2gg
c3BlZWQgbWlnaHQKPj4gbm90IGJlIHRoZSBtb3N0IGVmZmljaWVudCBhdCBzbG93ZXIgc3BlZWRz
IGR1ZSB0byB0aGUgbnVtYmVyIG9mIGR1bW15Cj4+IGN5Y2xlcyBuZWVkZWQsLiBCdXQgSSBiZWxp
ZXZlIHRoaXMgaXMgbmVnbGlnaWJsZSBiYXNlZCBvbiB0aGUgZmFjdCB0aGF0Cj4+IHdlIGFscmVh
ZHkgYXJlIGluIGRlZ3JhZGVkIG1vZGUgYXQgdGhhdCBzdGFnZS4KPj4KPj4gSG93ZXZlciwgdGhp
cyBtYXkgY29uZmxpY3Qgd2l0aDoKPj4gLSByZWFkIHJldHJpZXMKPj4gLSBjb250aW51b3VzIHJl
YWRzICg/KQo+Pgo+PiBTbyBpbiBwcmFjdGljZSB0aGUgZmFsbGJhY2sgbWlnaHQgYmUgbmVlZGVk
IG9uIHRoZSBTUEkgTkFORC9OT1Igc2lkZQo+PiAodGhpcyBjYW4gYmUgZnVydGhlciBkaXNjdXNz
ZWQpLgoKSnVzdCB0byBzdW1tYXJpemUsIGZhbGxiYWNrIGxvZ2ljIGR1cmluZyBwcm9iZToKICAg
IC0gSWYgdGhlIGNvbnRyb2xsZXIgcmVwb3J0cyBhIHR1bmluZyBmYWlsdXJlLCB0aGUgc3BpLW1l
bSBjbGllbnQgbWF5CmVpdGhlciByZXRyeSB0dW5pbmcgd2l0aCB0aGUgbmV4dC1iZXN0IChtYXgt
MSkgb3BlcmF0aW9uIG9yIGZhbGxiYWNrIHRvCnRoZSBub24tUEhZLCBzbG93ZXIgb3BlcmF0aW9u
IGFuZCBhZGp1c3QgdGhlIGR1bW15IGN5Y2xlcyBhY2NvcmRpbmdseSB0bwp1c2UgdGhlIG9wdGlt
YWwgbm9uLVBIWSB2YXJpYW50LgoKQW5kIHllcywgZm9yIG5vdyB0aGUgcHJpb3JpdHkgaXMgdG8g
aGF2ZSBhIHJvYnVzdCBwcm9iZS10aW1lIHR1bmluZyBmbG93CmJlZm9yZSBhZGRyZXNzaW5nIGFu
eSBydW50aW1lIHR1bmluZyBjb25jZXJucy4KCj4+Cj4+IEJ1dCBvbmNlIHdlIHNvbHZlIHRoaXMs
IGNvbWVzIGEgc2ltaWxhciBwcm9ibGVtIG9uIHRoZSB3cml0ZSBzaWRlLiBIb3cKPj4gZG8gd2Ug
a25vdyBpZiBhIHdyaXRlIHdpbGwgb3IgZGlkIGZhaWwgYmVjYXVzZSBvZiBhIHRlbXBlcmF0dXJl
IGNoYW5nZT8KPj4gV2hhdCBtYXkgYmUgdGhlIGhldXJpc3RpY3MgdG8gZmFsbGJhY2sgaW4gdGhp
cyBjYXNlPwo+IAo+IFNhbnRob3NoLCBkbyB5b3UgaGF2ZSBhbnkgbnVtYmVycyBvbiB3cml0ZSBw
ZXJmb3JtYW5jZSBpbXByb3ZlbWVudHM/IEkKPiBhbSBjdXJpb3VzIGlmIGl0IGlzIGV2ZW4gd29y
dGggdGhlIGVmZm9ydC4KClRoZXJlJ3Mgbm8gcmVhbCBwZXJmb3JtYW5jZSBnYWluIGZvciBTUEkg
Tk9SLCBidXQgU1BJIE5BTkQgc2hvd3Mgbm90YWJsZQppbXByb3ZlbWVudCB3cnQuIHBhZ2Ugc2l6
ZS4KCldyaXRlIHBlcmZvcm1hbmNlIG51bWJlcnMgZnJvbSBBTTYyQSBTSyB3aXRoIFczNU4wMUpX
IE9TUEkgTkFORDoKCiAgICAtIHdpdGhvdXQgUEhZOiA2IE1CL3MKICAgIC0gd2l0aCBQSFk6IDku
MiBNQi9zCgpUaGFua3MsClNhbnRob3NoLgoKPiAKPj4KPj4gVGhhbmtzLAo+PiBNaXF1w6hsCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
