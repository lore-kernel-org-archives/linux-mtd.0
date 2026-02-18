Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F394E9A047
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Feb 2026 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhysFFqrtAbdliVNzRHfl0l3cRUH3A6JE5GcIPQaSPA=; b=iNApM1c6DgRCoE
	ZN6GN+C6cM8ZafgKfSqgtU0rCSyJSWylijFTIfbwfWzZN4EJfphpwJZcPULzcys0yoUlrvzHl6Gmt
	rp+Ixn4Ci1O8xMYm6g3yHFi/UbrRtqQcSlahPCNVA5/IK0oV7L90EpJNy8KJLKKlaxYkq9lrt4Bk0
	E1dIdW1d/kngMthSrfSBBAZ4irgQ8Au584Pzax8PwUjZ0WkAK8wrdbTPZbJVySnTzFRiYz5sx6ogT
	lSd16Yzfmp5Ae1eoUtBhxNV3QARVTPIjl09DOprCkQajJvIxbXqUhGgtsjroyOgWL+CFkmb35i9JA
	6swE8Q3gUuDKxRFre0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslxH-0000000AD1Q-1EJG;
	Wed, 18 Feb 2026 18:07:19 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslxC-0000000AD0l-2zTP
	for linux-mtd@lists.infradead.org;
	Wed, 18 Feb 2026 18:07:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sT4GHPaxDwlYwztJ65c/6IA8dH9/FoH++ervWlLB4n/GQxGzoWPJRekyTWJStuMoVssDsCsFznTIF3I2cqygFYSG3DxALgmtLP2aCc+dGJBEWxDZZdxQh4Vs49Z5A7xZuj5MO9az8GfsMsgH7tPQPt6P2JAFEWL8nx1YhKXgDYHnmoqjGANdICpp2Ru+IXQmV2Zqt4+JjTwNbUB4bgflY8nGaS/EnD2qmXubB5w+y+0co9scRZ8nn8m7bKvogT5u0vs1ceA7IzXrdbgup8z+1ZWe5wibeuvdZgITSezchidoAjEbOB8MdOmVXWKLh7tpLq1Qk+blAgfacgte8BIN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ig7pDl5OzmxegFmaAYzHV5aKpzbH+lcmfS28Rk0m/ok=;
 b=GsqqvWh04G4Ex2mv/MHOmjIYXEnzO/TyPCIBKrhWPleKvrfNiNd5warhmnvbGlbuJ+ohGviElBwxMqCamrBAY7LtZFYj3Z7ys/aZ5qBmtvtjYQn4eMn0ZGEgbGfhLlRKTcMGCzm6D47g6qMQUw7wgWc9gi/zrJ4rY5POe2wblquG788xy++9p+4teIxfBAPT9r4bf1ZC1CXbhPleRwNWB6wIc6QQeEorc72v5lOractOI9LYy4uU1NPMfduZwz0Fws4DFscepjB5KB+r7nn+8xM/GU8iTVQ1qVnkx+YC7KlJaL7uZraGJu7HNQ7hlZMAmpzyepxNtdnWb16J1BVBQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ig7pDl5OzmxegFmaAYzHV5aKpzbH+lcmfS28Rk0m/ok=;
 b=wTJ2G+dKbsT0Igoz71BEGQHoW2qjcRXwyMhoQ6dzJJ+G9BXlf+Nb+NN2KgEIe9NbX8hWdoGWILiorDcS0GJV+KlK8IsS9DYXL5ZSM/fAGcamLFeZtXvO7fIWXl5pGnlVHam66qqb5s1U/hms/wb00CrwoKc6azg7iIJhGjdVe+w=
Received: from BYAPR06CA0023.namprd06.prod.outlook.com (2603:10b6:a03:d4::36)
 by IA3PR10MB8466.namprd10.prod.outlook.com (2603:10b6:208:57f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 18 Feb
 2026 18:07:09 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:d4:cafe::43) by BYAPR06CA0023.outlook.office365.com
 (2603:10b6:a03:d4::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 18:07:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 18:07:07 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 12:07:07 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 12:07:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 12:07:06 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61II71lt1265958;
	Wed, 18 Feb 2026 12:07:01 -0600
Message-ID: <54964ad3-64d7-4f4e-bcf9-f0b92b1df034@ti.com>
Date: Wed, 18 Feb 2026 23:37:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 09/12] spi: cadence-quadspi: add PHY tuning
 infrastructure
To: Miquel Raynal <miquel.raynal@bootlin.com>, Michael Walle
	<mwalle@kernel.org>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
	<s-k6@ti.com>
References: <20260113141617.1905039-1-s-k6@ti.com>
 <20260113141617.1905039-10-s-k6@ti.com>
 <DGAC4N62UZQQ.3R7TLX87PECU3@kernel.org> <87qzqqxml7.fsf@bootlin.com>
 <DGCXTWSCAH6R.22SIL82AUVGYI@kernel.org> <87fr76xgsl.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87fr76xgsl.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|IA3PR10MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e29eaa6-7607-4b04-47d9-08de6f188792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnRJNUJ5YXdXckJlOE8rYXhRN3ArckxqUjMwQ0xiY1NTb1pxRnRNWlpCMkJs?=
 =?utf-8?B?YlFScjFTa1pvVU9TaGNQd2VJRU1QdzNmL3FGaTFmU0ZPUERFUDhjZ0UvN21I?=
 =?utf-8?B?aTdkZytuV2NXNmo1V2VTeTBheFRKMlF5Mm5ENVN2dlFTaDIzK05OVFl3UWFE?=
 =?utf-8?B?dTdvUDFqa1FmWXVDaFNwVjd5YXlUdElTbDNVTUZoZ000YVUrY3ZCcDZUV25i?=
 =?utf-8?B?UkR2ZFlXS1p6NnMzS1dwL2t4T0FsRkxucXJTVG9PeHFod1lxTkVwc2w2RVVY?=
 =?utf-8?B?czNQVmN1THMwc2xMSFNMaWJSeSsyVmNzSXJJNGh1N05hVE9aVU9GNjZ3c01Z?=
 =?utf-8?B?SjVEd1UxMXdrd0pHcDIwZThTVFFReVo4VEV6NTdiWU13ZWRVTTZTdVJBRFFu?=
 =?utf-8?B?QlZ4dHNnS0hPS3ZzRVR3WmNIMDE4Szd0cG5lU0FRVXUzdTFtUUdLTG9yQzVx?=
 =?utf-8?B?cTU5SFdiN3h3dDRhVkhwU0puSmhUenliUmFNdGpSTW1lTHFOYWMwN1E2YXBx?=
 =?utf-8?B?d3hUSDAwRTFVTC9MRzNqMnBOcVJoL2tRb3RUNlh4WCsvQURUY2NRRDRTamJJ?=
 =?utf-8?B?OS9KMjMrWkwrMVZ4enF4Wkw3RUt6ckkycnl4d0NYSlR6eVFJTlRVeVNHVDJQ?=
 =?utf-8?B?MWJxUkoyYUI1K2ZpaWdPNEM0MUYzNmxOaXk3aG5LdEVETVg3dlBjbWlqRU1D?=
 =?utf-8?B?aXVaY3FmM3pzUDFESUtqeGs2cGQ3MG50Z3JFR0lEUTJwN3F6RW55eCsvQm85?=
 =?utf-8?B?UWdLWFFVeW9iMzJWcVlxMUtiOHpZaXc5UnJsUmZUelBNWFBOaWZ0eWRSZUJH?=
 =?utf-8?B?NjY1VzZiTUhNNit2dkkwMy9QdjhxUDlqRExOU0EvV1RmU0JLM1ZmejJYeWVn?=
 =?utf-8?B?QUJyQVFGUHd6dmFoYmdyVitaV2c3ZmFGOCtvT0lWSW1KNTJKUzdlb2dLTUM1?=
 =?utf-8?B?MmtuRkt3cGpYTlBLazI3Yk1yNThWb0p3aUZEOFBIV3JWc0k5TXRLZ0ZWYU9s?=
 =?utf-8?B?Y1JSZGRlR2dGTUhwQVlVemZqRXBjWEZ0RzQwS3VhbU1RSGRnbmNaTElRcDFL?=
 =?utf-8?B?a2JYMVNLdU1aRGwydkxvMldvQmRiMHRMcTEyS2oybXVSMU8wV1lwb1p0UXJr?=
 =?utf-8?B?UlJKS3hLZDkxMktXTWlLcFJDaDB3Y25uV21mYWNuS1Y2VFZRYW5KazhZNi9w?=
 =?utf-8?B?dDlZTFpDY1graXpXL002U2Q4R2U3SktvdWhneldZd2pNNWw5TXFhSVFjOHhO?=
 =?utf-8?B?aUxjR0pNeFllWTc4b0d6SFZIT2lCNmJmNmh6eURNKytlWkw1bHc5eWJJdzhV?=
 =?utf-8?B?L1hBV2cxOXlLY0pESlVISXo3bzQ5NTh6cFlEVVQ2OWFYaXJRWTZsa1dOMDFN?=
 =?utf-8?B?eXZET3h5b3lORHV3WTVjWW9xZ2hKRHY0SGg0OUl3d0Q1bEs1SFBaVEhocCtx?=
 =?utf-8?B?Lzd4SlNXbUJLandYcE5FMXhUZUNPaG5ScGdPNnF3Tkdxalpnc2hCWjlvd3Q5?=
 =?utf-8?B?ZENEcW9WU3pmSEJ2MU9JS1IweUVLZW00VGJYc0tNS1hXMUNPblo1c3c2TGdh?=
 =?utf-8?B?ZG1yQnZwbmduNC90MTNIQnVvMjVhaUY0RDJ4Qm5rL2lscERMdk1lOGtxSWlN?=
 =?utf-8?B?QStMRkJCenMxaGgvazBrTmZoZHBOaS9rU2ZmQUgyNTB3L0hLdXU5V2pwVlZM?=
 =?utf-8?B?Mmo5ZFBkR0I2K3RNNTNyMXUvZm55QmNXWDd6N2N5YU8wTXRzNjV2dktVVTk4?=
 =?utf-8?B?Q2JQZHZGVmpBYythaVIrSVROUE9wLzdSTXpZZUFKUmVJZ0NuR1JUUUZyYnM4?=
 =?utf-8?B?a3NHbnU5V2I0VDhqdGRBTDljdktiajMrOEo3amVEYkg3N1NYWCtMc1BZODYw?=
 =?utf-8?B?UXI3cTJBL2ZyNjJlbVRuRXcwcWl5d3FLMnEyMFVRYWtoOHRQOCt2bStYQnQw?=
 =?utf-8?B?aWE1UVVYeG8vZTE3NkZ0ZkI0Y3ovOEVhQVByV3hhNXdIcUhrYjZMMGR3VGh0?=
 =?utf-8?B?N3RVZHYzSWxER3NxZGNHdWZINlE0cVFmVytjT010QWROdzVlenRIdGt1SmRu?=
 =?utf-8?B?alBuOGRYRXNKUFBQL0NCblF3SlRYZWtvT09HZG5UcFdnanpraUlGNU5xWHI1?=
 =?utf-8?B?TG5rT2dZakJWK3o3Y3oxRzAzREJvU0pHeHNubXgwOERWbFJMcWdxSXB2bktK?=
 =?utf-8?B?WGVVSWRpUzBFei9xRzdwM3VjZ0FBbnhwMnZpbklScDdzWHArSFVLZ3I3dXlo?=
 =?utf-8?B?UVJ2Yjl4U3B0R1YyM1NtWXFmOVNnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Hkj+9HmtAl55yJygmOP7Sk9OvBbZcpgO1nrzH1Z6ZZJZSHakon6xzK1MRacM0TpSRbr3NZ+wTHaLfAajYUzj63SpZwtOrY2gyG6BjtZRgJmXMnPFLoUobxIRvAJIT+HNoD5+rrFHmrZ+fFRegIbhN8Xfue3Y6QCwTqajaEk+3LYkvyknHBVSlmclhXnovI9h/gjORtHAEOrWGn5t5Fanr1q+NKNyWfdOyx7Cnvni4GVY9mrGbkLUMfnqmODG69mggOTUvI4hJ2yeCBnhoHgbryNYUjFjWmGPq5P2eB45nJO75JCyUjY9+iS3ooAe+Jo0SOAipnK0Hy76fyujElbyxuqIlv4OJXDSKvYIKNbWIH8H+HXZOj/31LxhrOwuFubhMxhlrdknQ1tgrv1YT4K6QHiWKa0CLiXgVGpCsvaaKg2Ndrt1qizJbUcuccCPoPfb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 18:07:07.6241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e29eaa6-7607-4b04-47d9-08de6f188792
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_100714_868196_3728A68A 
X-CRM114-Status: GOOD (  15.88  )
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

SGVsbG8gTWljaGFlbCBhbmQgTWlxdWVsLAoKT24gMTIvMDIvMjYgMTg6MjUsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gSGVsbG8sCj4gCj4+Pj4+ICsJZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShwYXJ0
aXRpb25fbnAsIHBhcnRfbnApIHsKPj4+Pj4gKwkJaWYgKG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5n
KHBhcnRfbnAsICJsYWJlbCIsICZsYWJlbCkgfHwKPj4+Pj4gKwkJICAgICFzdHJzdHIobGFiZWws
ICJwaHlwYXR0ZXJuIikpCj4+Pj4+ICsJCQljb250aW51ZTsKPj4+Pgo+Pj4+IFRoZXJlIHdhcyBh
bHJlYWR5IGEgcmV2aWV3IGNvbW1lbnQgb24gdGhlIGxhc3QgdmVyc2lvbi4gTW92aW5nIHRoaXMK
Pj4+PiBpbnRvIHRoZSBkcml2ZXIgZG9lc24ndCBtYWtlIGl0IGFueSBiZXR0ZXIuIEluIGZhY3Qg
dGhpcyBtaWdodAo+Pj4+IGNyZWF0ZSBhIChiYWQpIHByZWNlZGVudCBmb3IgZnV0dXJlIGRyaXZl
cnMuCj4+Pgo+Pj4gSSByZW1lbWJlciBjb21wbGFpbmluZyBhYm91dCBpdCBidXQgbm90IGlmIHRo
ZXJlIHdhcyBhIHNvbHV0aW9uCj4+PiBmb3Jlc2Vlbi4gSW4gU1BJIE5BTkQgdGhlIHNvbHV0aW9u
IGhhcyBiZWVuIGZvdW5kOiB0aGUgcGF0dGVybiBpcyBpbiB0aGUKPj4+IGRyaXZlciBhbmQgd2Ug
bG9hZCBpdCBpbnRvIGNhY2hlIGJlZm9yZSBQSFkgdHVuaW5nLiBCdXQgZm9yIFNQSSBOT1IgSQo+
Pj4gdW5kZXJzdG9vZCB0aGlzIHdhc24ndCBwb3NzaWJsZS4gV2hhdCB3b3VsZCBiZSBhbiBhbHRl
cm5hdGl2ZT8KPj4KPj4gSSdtIG5vdCBjb21wbGFpbmluZyBhYm91dCB1c2luZyBhIHBhcnRpdGlv
biBmb3IgdGhlIHBhdHRlcm4gYnV0Cj4+IGFib3V0IHRoZSBoYXJkY29kZWQgbmFtZSBvZiBpdC4K
Pj4KPj4gSXQgd2FzIHByb3Bvc2VkIHRvIHVzZSBhdCBsZWFzdCBhIGRldmljZSB0cmVlIHBoYW5k
bGUgdG8gcG9pbnQgdG8gYQo+PiBwYXJ0aXRpb24gKG9yIHNvKS4KPiAKPiBBaCwgeWVzIGluZGVl
ZCwgdGhhbmtzIGZvciBjbGFyaWZ5aW5nIHRoaXMgdXAgKGFnYWluKSBmb3IgbWUuIEkgYWxzbwo+
IGFncmVlIHRoZSBoYXJkY29kZWQgbmFtZSBpcyBub3QgaWRlYWwuCgpJIHJlbWVtYmVyIHRoaXMg
d2FzIGRpc2N1c3NlZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbi4gQXMgbWVudGlvbmVkCmluIHYx
LCB1c2luZyBhIHBoYW5kbGUgbWF5IG5vdCBiZSBpZGVhbCBzaW5jZSBhIHNpbmdsZSBjb250cm9s
bGVyIGNhbgpiZSBhc3NvY2lhdGVkIHdpdGggbXVsdGlwbGUgZmxhc2hlcy4gUmVnYXJkaW5nIHRo
ZSBzdWdnZXN0aW9uIHRvCm1haW50YWluIGFuIGFycmF5IG9mIHBoYW5kbGVzIC0gY29uc2lkZXIg
YSBjb25maWd1cmF0aW9uIHdpdGggdGhyZWUKZmxhc2hlcyAoTkFORCwgTk9SLCBhbmQgYW5vdGhl
ciBOQU5EKS4gSW4gc3VjaCBhIGNhc2UsIHdlIHdvdWxkIG5vdApuZWVkIGEgcGhhbmRsZSBmb3Ig
dGhlIE5BTkQgZGV2aWNlcywgcmlnaHQ/CgpBbHNvLCBJJ20gdHJ5aW5nIHRvIHVuZGVyc3RhbmQg
dGhlIHByYWN0aWNhbCBkaWZmZXJlbmNlIGJldHdlZW4gdXNpbmcKdGhlIHBhcnRpdGlvbiBuYW1l
IHZlcnN1cyBhIHBoYW5kbGUuIFNpbmNlIHRoZSBwaGFuZGxlIHdvdWxkIHN0aWxsIGJlCm5hbWVk
IHNvbWV0aGluZyBsaWtlICJwaHlfcGFydGl0aW9uIiwgaXQgc2VlbXMgZnVuY3Rpb25hbGx5IHNp
bWlsYXIuClBsZWFzZSBsZXQgbWUga25vdyBpZiBJJ20gbWlzc2luZyBzb21ldGhpbmcgaGVyZS4K
ClJlZ2FyZHMsClNhbnRob3NoLgoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
