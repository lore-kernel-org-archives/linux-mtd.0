Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A03E9A02C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Feb 2026 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18cfwF72K83kPkBbiz48po2+Kh5zMfYatbvFQh7/OhU=; b=WJiCtts1yYH3dG
	EcaXmFOYanirPY954qcd1Ft0kzRYLVeNpQOKW3L5XxogbwgBHkyyEbl/hC9DUULNxCJiKDrfQ6dXr
	FeVFTdUksjewPzB62yuZTFWSLf5iQtyo4T9NBIr56TmsuiYuFoygaTjVhx7kLi8DvXZrVAXIWTnHO
	mZJgc9TzhFpqjgmPO8dC9yKBwEp5pCbNzukYiZfV0xe/xs76Jkxmwz9m5Gbes7JpHtP1pkNAtXwsi
	4Xv/ddaOEXv5Z46br687J3lZ0GG2KsjL1nif+dQWmWVGhLLYaPPNr9OSuW+M7hSD+I5DnyWylc6zY
	n82Oq+jhAPyE65jgv2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslyi-0000000ADCM-20et;
	Wed, 18 Feb 2026 18:08:48 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslyg-0000000ADBc-36Yq
	for linux-mtd@lists.infradead.org;
	Wed, 18 Feb 2026 18:08:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFsIab3tFWzHDzxzbIDYvm7PlgGQMeyA9AT1BJ54yRUE75SfWyvrJ13Ra9eTfpbgw09kvw5kJz0A/L6btgYEtOwf8AdDqqe/ITMhUw6XAk+Ly2xd3wy5nEi4M4TqCnvmz7bUra9vxKd+CB7qqQHHYBJdWWgSjiK1NcvEFx+Hy3/q0n/wuiy2yOwhg/kitQZBFth9p/m2Qxp7B2SZgFGM/KkFJNwWPrYd0+tK7bTQe7cS4IwhOJbDAFXS7XeQJi7es/9rwF3k8AJT9e6AQiME6mCyi686tFQRgC9xwBVEdqnYMEXx1uJnSBkZTS4piKF2xTaG2uHkrRmGLCAlW69ncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmbEjNPWIHYrB0yDByxNinl5MTIvL8ntql9LVf4QI14=;
 b=RrL7xNc/DS7rXAYlKftQPifk+FIfQK+aM1a5D/PdcZ25Y+4mTNjWMcZFpu5Uf2EXMmAmQghjWgOMoLvQmehoN44tSwy5p5Lh6fmfDBwlulOs2ecsnS0/xi4w0nn88F6ollmkmUBcl5qaLHw+8b+QXHLVjfiJaiGEfdJln0ka3YHimNdfneykEcny3Gt8qoObyg5TXK3St6qnojqzVZbQdvMR9NGTMgFm1UUZBnb6YFZ2O1mXL3LoIX+8adqQ7SN/AAI+r43bHIs/1+E042w/vbbTJMTEmU2jSAq0vZThdB66BVV0jnxbunIQHKqRGm3S6ZUpLZW3+o1/zBHE2DwJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmbEjNPWIHYrB0yDByxNinl5MTIvL8ntql9LVf4QI14=;
 b=lKYPzYfhWV4jv07t8B9uYQR6fmbOAOcUmpGh6o9rQ3cTqWfozuZ8T13aZJAsrRreoKYcTEd7HEM1VNQQtLLQsZlhoWJJdU1d+vfucsKrraVBECO1dweqg0XNpA/PFaecIYH7UhbIQF2C6Kpud9m/1agDF+WzOYFSZ7jecqnziik=
Received: from BY5PR17CA0042.namprd17.prod.outlook.com (2603:10b6:a03:167::19)
 by SN7PR10MB6547.namprd10.prod.outlook.com (2603:10b6:806:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 18:08:42 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:167:cafe::fd) by BY5PR17CA0042.outlook.office365.com
 (2603:10b6:a03:167::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 18:08:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 18:08:41 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 12:08:40 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 12:08:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 12:08:40 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61II8YbL803002;
	Wed, 18 Feb 2026 12:08:35 -0600
Message-ID: <485b5e4c-8260-4f40-80b1-c0e85bdeb4e9@ti.com>
Date: Wed, 18 Feb 2026 23:38:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/12] spi: cadence-quadspi: add PHY tuning support
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
	<s-k6@ti.com>
References: <20260113141617.1905039-1-s-k6@ti.com>
 <87343ghkek.fsf@bootlin.com> <87v7gbdwdh.fsf@bootlin.com>
 <775d8dce-b567-4f21-963c-a843e409fea5@ti.com> <87y0kxvwyf.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87y0kxvwyf.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|SN7PR10MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ac3e8d-e633-4749-f3ad-08de6f18bf53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1ptRXphOC9wUlBlMWl2N1VCRlFSZUpibkQ5T21JVXQvdHkzc1BSOTkybHZ6?=
 =?utf-8?B?aTdrT3BEZHYwaGdxS0VJbGRndUNHWHA2U3ZPWWUwNit5MlhJZ2dDYk45TFF2?=
 =?utf-8?B?dFFXSEFiQ2ZjSFltcVZ6WWMyclFlbUQyVXVKVXJqQkIxb01ndkxPSFFGempk?=
 =?utf-8?B?T3Myd01NUE9Oc2w0dUxPSEFabFJqZ1NZWlV4ZUpBTk9yRldRTkwrbEVLTHUr?=
 =?utf-8?B?REVMZ0xyYm5MKzN1RFJnZGhvZDlUWkk0U3B2S1p0cExuMkFLbS9LeDdOUjVq?=
 =?utf-8?B?NHozcS8rNndCUVdGYWp5S0JmNHlKeU9jTkN6TDM3ZUhLRVljd3pVZmJFbzNI?=
 =?utf-8?B?b2YwSUF5Z3QyRDJNNCs5SkRzbW1SNHAybUN3T0VnSE9ONU1mSm9lUWxyb1Fn?=
 =?utf-8?B?aVRZZWU5K3crN3JBalZZS0NzMnBzZGhBWVNEc3dnY3VCd3o2aDh6cGpqKzhQ?=
 =?utf-8?B?czFWUXVZb0RMU2hyR3NOZFkxM0tVUEp1WWpSTUthUnhKaXRaQkZFaEFpc0hq?=
 =?utf-8?B?cStvSWl3L3EvQnZnVEFDVS8xS1MwTUZIUkFQT2xEMEI2THJPREtPdm5HR0lv?=
 =?utf-8?B?eXI5UlVrdWdXMkt1SlYyTEtBcDZsWGI2R3NsSzF4MU9EbjBmZFZHeFlpaUov?=
 =?utf-8?B?MkZhZFNSK2x3THNZNlQvSDZLRDhlRTN2RGkxZ0pNRCtoT2tBMVVYc3ZkaUpy?=
 =?utf-8?B?K1JHWW83YitzNDlxaTdONk1VYUNGcjdLdWdWR0F5QjNjWjNZYVpGVkNtTElS?=
 =?utf-8?B?N05lU0Fwb3NrWGFGb1dkUVo4dDJrZ05lVUhNMStNSEVqSkRTQ0tnZ0IzOWpE?=
 =?utf-8?B?UE90SDdwZnlsdWV3a0VucFVtVzlXWVBUUjhUNUprQTNGTUQwOWYwUGMvVzRN?=
 =?utf-8?B?aC9acDAvQkkzUEc3WHVYZ1IveGRzSjNENTFMcFpNR3NZMmR6SDI0R1hxZ2Iw?=
 =?utf-8?B?QUtnVmF2SU5BZURUSzR1QnJRVFo3Y09QczEraWY1R28wSDFHK3pJRUllTzda?=
 =?utf-8?B?U0xyN00wSVMwelJFazVlV2s0UnFWWWRYbHhZMVg2OHo2ZHRKZjVXTCtUcmtt?=
 =?utf-8?B?L0FkTWVoVXVPMWVSY1RWc24vU1RsNjlVR0F0TzdCTWtUcXVjTnJxem01cmVH?=
 =?utf-8?B?a2JRM3l2V1NVMS9Yd05ybkg2ZW4rUDBvWjRINkRzMG1VUEUvRVRyT2tBZXZj?=
 =?utf-8?B?VWRLRHc4YnR1dW9VOHpaS1JvMzdNVTFCVEdUVDdrMlpqeWlMOFU4MEw2ODdY?=
 =?utf-8?B?d1lFSHl4bE9YNDN6aDN2eFFnWFNlTGo4OFNlQU9FSXUzQStMMWdnU0NFdVd6?=
 =?utf-8?B?emh6UXlMZnZLUDFBazg5cEFtbWxrdEx0YWFtU3RtMng0Tlp4eCtSYmVHZERk?=
 =?utf-8?B?REtmYjhVcjdQV1djNzlzSExHRHo0QnA2Rzh2RGNMbEtGNWliRmhod3JNazRU?=
 =?utf-8?B?ek5iZjdUYVUrZ09SVzFmazUyT1lCUzVPL3VGbnNLVDluWXlPNnVnTXlKa0J0?=
 =?utf-8?B?L2RKTEdkZzAxMDBTeldaeXFjMFZ3aGJ1VzAyMnlMTldZRU9PSVY4MC9VempD?=
 =?utf-8?B?UVVxa1Q4S1p4RzhRakUvYkQyTWRWN2JMVXdHdHhubFNHREFKYmdtZVlVWERZ?=
 =?utf-8?B?OTdFRWRFYUwvYWxkQWpqZVcyaERzSzFVUkMxZ1psS1kxbjdpSzhBQVBvdFhu?=
 =?utf-8?B?U0JTbDFIVnpsOHV5eWQ4dHZJWlNyN1FPcDVsZ2dRMHA1NVRqdytWbTd0SXZM?=
 =?utf-8?B?RDVjWVg2L3BSdm1XOGlDTlJwREhIVTI5N0xXcUFQRGNsMmJwUkMzODhhRThw?=
 =?utf-8?B?NC91Tm1QWE9XSDZPMTA3eVlPSFUvOWtWK0tlakxhOWdlYmxRVkJteVZRVnZy?=
 =?utf-8?B?eFZqanBJVy9zbUdTRlRwWjJRa2htK1p1cVI4NzN0SVRsRmxJOWlYSUx0dnFI?=
 =?utf-8?B?OFlweG1nOG5IaUg2RXNkSHlzTitKUmduL1d6dmNWZlpzalNwdmIzS2kzbjJZ?=
 =?utf-8?B?ZTM3aWNwaHN4ajRaNlhYRTdJVnQxTUhkQmpxRUF4WFZUNjNwNFA1L211N2Ix?=
 =?utf-8?B?dmZxbG5jTFdjQ0Jzbm9VVW43M2JnZUd1VkkxWU1JdUkxV1pVRkE1eFhaU2hx?=
 =?utf-8?B?dGZRUUsrd3lRZ1U3QlVERFlzSWttRkY1YkppMWl3Z2hqQmZLRVREQ2ZzR2JT?=
 =?utf-8?B?NUJEeXU5amJ4YzZ2MTVCbzQrcENTcFZSaDVZTTd1ZXpwQjFlM085VXlaYS9j?=
 =?utf-8?B?UmhjVGxMZStldE9iOWs1NGdOUmdBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mq7wDWG+D/PQS6b0277xTVhaQrVj6+c9Nhk3IFNkV7XoxRYu2QHylIMV8b35ADzYlN6Cq/HIa7njXstV/d07Fzk90lYRT5USWRlRyEmqRyriFRHPKB0WQGXfmk76f3hqvvULv3K8i96m8p4ezKa0chbKTvn+DxWDzNp47KrymzOqU3LMC30tKL9hl3rU+/vpW5gTgobPBH72NtIA8X0kH0fuWjo/olmU9N3TspA+e59KXhXmAoPOBOiDm2PIXx3ACqhHqehE4kIhtsVFxZUkKT9SIuzboK20ojgswqIhjpNQMKbD+2DsKG4yCAHyWj1ZKIPLnsPfoxM5ZL9MXMXEqPqN1WhPvKGGwZUWs1mxGEQqpBAzskremRkAo6xJs+m+Hle+1m0AiYK3DfosGUC/VS+2jEAZTqOqy+Coz/pEc6hEsVVhVwE94cF+LSsIqMFV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 18:08:41.1820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ac3e8d-e633-4749-f3ad-08de6f18bf53
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6547
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_100846_785972_CB2F3C94 
X-CRM114-Status: GOOD (  18.90  )
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

CgpPbiAxMy8wMi8yNiAxNDozMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBPbiAwNy8wMi8yMDI2
IGF0IDAwOjU4OjAzICswNTMwLCBTYW50aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6
Cj4gCj4+IE9uIDA1LzAyLzI2IDIxOjE4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4gSGkgU2Fu
dGhvc2gsCj4+Pgo+Pj4+IEkgYW0gc3VycHJpc2VkIGJ5IHRoZXNlIG51bWJlcnMsIEkgd291bGQg
ZXhwZWN0IHRoZXNlIHRvIGdldCBoaWdoZXIgZm9yCj4+Pj4gU1BJIE5BTkRzLiBJIHdpbGwgdGVz
dCB0aGUgc2VyaWVzIGFuZCByZXBvcnQgbXkgb2JzZXJ2YXRpb25zLCBlc3BlY2lhbGx5Cj4+Pj4g
c2luY2UgdGhlcmUgaXMgYWxzbyBPRERSIFNQSSBOQU5EIHN1cHBvcnQgbm93IChpbiBuYW5kL25l
eHQsIHNob3VsZCBiZQo+Pj4+IHBhcnQgb2YgbXkgdXBjb21pbmcgbWVyZ2UgcmVxdWVzdCB0byBM
aW51cyBmb3IgNi4xOSsxKTsKPj4+IEkganVzdCB0ZXN0ZWQgdGhlIHNlcmllcywgaGVyZSBhcmUg
c29tZSBudW1iZXJzIEkgZ3JhYmJlZCBvbiBUSSBBTTYyQTcKPj4+IExQIFNLIHdpdGggYSBXaW5i
b25kIFczNU4wMiBTUEkgTkFORCBjaGlwIChzbyBpbiB0aGUgZW5kIHZlcnkgY2xvc2UgdG8KPj4+
IHlvdXIgcmVwb3J0KToKPj4+ICAgICstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0rCj4+PiAgICB8IFNQSSBOQU5EICAgICAgICB8IG5vIHR1bmluZyB8IFBIWSB0dW5p
bmcgfAo+Pj4gICAgfCBVbml0OiBNaUIvcyAgICAgfCAgIDI1TUh6ICAgfCAgIDE2Nk1IeiAgIHwK
Pj4+ICAgIHwtLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLSstLS0tLS0tLS0tLS18Cj4+PiAg
ICB8IE9jdGFsIFNEUiByZWFkICB8ICAgMTMuOCAgICB8ICAgIDM0LjIgICAgfAo+Pj4gICAgfCAg
ICAgICAgICAgd3JpdGUgfCAgICA3LjIgICAgfCAgICAxMC4yICAgIHwKPj4+ICAgIHwtLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLSstLS0tLS0tLS0tLS18Cj4+PiAgICB8IE9jdGFsIERUUiBy
ZWFkICB8ICAgMjEuMiAgICB8ICAgICBOL0EgICAgfAo+Pj4gICAgfCAgICAgICAgICAgd3JpdGUg
fCAgICA5LjAgICAgfCAgICAgTi9BICAgIHwKPj4+ICAgICstLS0tLS0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLSstLS0tLS0tLS0tLS0rCj4+PiBQbGVhc2UgbWluZCBJIHVzZWQgTWlCL3MgYW5kIG5v
dCBNQi9zIChzbyBraUIgLyAxMDI0KSwgSSBkb24ndCBrbm93Cj4+PiB3aGljaCBvbmUgeW91IHVz
ZWQgZm9yIG1lYXN1cmluZywgYXMgeW91IG1hcmtlZCBNQiwgd2hlcmVhcyB0aGUgbW9zdAo+Pj4g
Y29tbW9uIHVuaXQgc2VlbXMgdG8gYmUgTWlCLgo+Pj4gSG93ZXZlciBQSFkgdHVuaW5nIGZhaWxl
ZCBpbiBPY3RhbCBEVFIgbW9kZSAoeW91ciBzZXJpZXMgYXBwbGllZCBvbgo+Pj4gdG9wCj4+PiBv
ZiBuYW5kL25leHQpIHdpdGggdGhlIGZvbGxvd2luZyBsb2dzLCBjYW4geW91IGhhdmUgYSBsb29r
Pwo+Pj4gWyAgICAyLjI2MTY0N10gc3BpLW5hbmQgc3BpMC4wOiBXaW5ib25kIFNQSSBOQU5EIHdh
cyBmb3VuZC4KPj4+IFsgICAgMi4yNjY5NTZdIHNwaS1uYW5kIHNwaTAuMDogMTI4IE1pQiwgYmxv
Y2sgc2l6ZTogMjU2IEtpQiwgcGFnZSBzaXplOiA0MDk2LCBPT0Igc2l6ZTogMTI4Cj4+PiBbICAg
IDIuMjg1MjU3XSBjYWRlbmNlLXFzcGkgZmM0MDAwMC5zcGk6IFBIWSB0dW5pbmcgZmFpbGVkOiAt
Mgo+Pj4gWyAgICAyLjI5MDgzNV0gc3BpLW5hbmQgc3BpMC4wOiBGYWlsZWQgdG8gZXhlY3V0ZSBQ
SFkgdHVuaW5nOiAtMgo+Pgo+PiBVbmZvcnR1bmF0ZWx5LCBkdWUgdG8gYSBrbm93biBlcnJhdHVt
IGluIHRoZSBDYWRlbmNlIGNvbnRyb2xsZXIsIFBIWSBERFIKPj4gbW9kZSBjYW5ub3QgYmUgdXNl
ZCB3aXRoIDItYnl0ZSBhZGRyZXNzaW5nLgo+Pgo+PiBSZWZlcjoKPj4gRXJyYXRhIGkyMzgzOiBP
U1BJOiAyLWJ5dGUgYWRkcmVzcyBpcyBub3Qgc3VwcG9ydGVkIGluIFBIWSBERFIgbW9kZSBbMV0K
Pj4KPj4gQXMgYSByZXN1bHQsIHRoZSBDYWRlbmNlIGNvbnRyb2xsZXIgc3VwcG9ydHMgb25seSB0
aGUgZm9sbG93aW5nCj4+IG9wZXJhdGluZyBtb2RlczoKPj4gICAtIFBIWSBERFIgbW9kZSB3aXRo
IDQtYnl0ZSBhZGRyZXNzaW5nCj4+ICAgLSBQSFkgU0RSIG1vZGUKPj4gICAtIFRBUCAobm9uLVBI
WSkgRERSIG1vZGUKPj4gICAtIFRBUCAobm9uLVBIWSkgU0RSIG1vZGUKPiAKPiBJIGRvIG5vdCB0
aGluayB3ZSBoYXZlIDQtYnl0ZSBhZGRyZXNzaW5nIGNhcGFiaWxpdGllcyBvbiBTUEkgTkFORCBj
aGlwcywKPiBlc3AuIFdpbmJvbmQncyBjaGlwcy4gU28gdGhlcmUgaXMgYSBkb3duIHNpZGU6IHRo
ZSBjb3JlIHdpbGwgcGljay11cAo+IE9jdGFsIERUUiBtb2RlcyByYXRoZXIgdGhhbiBPY3RhbCBT
RFIgKHdpdGggUEhZKSBtb2RlLCB3aGljaCBpcyBub3QgdGhlCj4gZmFzdGVzdCBtb2RlLiBNYXli
ZSB3ZSBjYW4gZ3Vlc3MgdGhhdCBvbmNlIHdlIGhhdmUgYWNjZXNzIHRvIHRoZSBtYXgKPiAodHVu
ZWQgUEhZKSBzcGkgZnJlcXVlbmN5LCB3aXRoIGFuIGV4dHJhIGZsYWcgaW4gdGhlIGRyaXZlciBp
bmRpY2F0aW5nCj4gdGhhdCB0aGUgUEhZIHNwZWVkIGlzIG5vdCBhY2Nlc3NpYmxlIGluIERUUiBt
b2RlLiBCdXQgdGhpcyBhZ2Fpbgo+IHJlcXVpcmVzIGRpZmZlcmVudCBoYW5kbGluZyBiZXR3ZWVu
IFNQSSBOQU5EIGFuZCBTUEkgTk9SLCBhcyBTUEkgTk9SCj4gSUlSQyBtYXkgaGF2ZSA0LWJ5dGUg
YWRkcmVzc2luZyBjYXBhYmlsaXRpZXMuCgpJJ20gY3VycmVudGx5IGhhbmRsaW5nIHRoaXMgaW4g
dGhlIENhZGVuY2UgY29udHJvbGxlcidzIHN1cHBvcnRzX29wKCkKY2FsbGJhY2ssIGFuZCBpdCBz
ZWVtcyB0byBiZSB3b3JraW5nIGFzIGV4cGVjdGVkLgoKSWYgYSBERFIgb3BlcmF0aW9uIGlzIHBh
c3NlZCB3aXRoIGFkZHIubmJ5dGVzIDw9IDIgYW5kIFBIWSB0dW5pbmcKc3VwcG9ydCBpcyBhdmFp
bGFibGUsIHJldHVybiBmYWxzZS4gSSdsbCBpbmNsdWRlIHRoaXMgY2hhbmdlIGluIHYzLgoKUmVn
YXJkcywKU2FudGhvc2guCgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
