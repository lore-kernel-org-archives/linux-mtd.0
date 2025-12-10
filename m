Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5FAD3C52B
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Dec 2025 11:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMdslIuBN8dNtyGxEKy3+tVQ11cXcYDqhzDAn+isqDE=; b=fYC2JQuiI717Se
	sb5W96n9C+yzoLcavH5jVaSFGNb8pCdggER5Z8ZLIGcJzxiKya9PulsdMy5enBbIlANGs7aVJP5N/
	MRc3a+WKqg40PhIByah0GYPADVZoysKYOTQtx2Rcu8dlDWUNgFMGnWfcdrBawx7kO5uE9A7iFu7R6
	e6qiNz/8y4Tx2kjNrwm8tFs2V05A+YnT+oOAXelnMKkcXMm8mS5NVWxmVQbJ/JLfFiZlU2YuWHFbu
	190SDyg8XOWRhAueUQWOr8ePce5xDkAqTdAtMW0qg8hyJGfEiwf93AhwcvYVUlbI8bm2KNKk9NdAJ
	vz98ydXFVCV42EaY+smg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTITB-0000000FNyz-2e4C;
	Wed, 10 Dec 2025 11:34:57 +0000
Received: from mail-southcentralusazon11013039.outbound.protection.outlook.com ([40.93.196.39] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTIT9-0000000FNxz-25iO
	for linux-mtd@lists.infradead.org;
	Wed, 10 Dec 2025 11:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9I72NYpiBy/EhBVTWznrL2mJm+9qMRRoCOOQdp2YMKIcf7OQ5If/1xp9IGHrl3uAmbdr3VaAeyB7cz3f8siQ1mljcC6hoEXgkdfUKnR7Tigvn3oOcfp49crrM4C0Kx12g4j/ZjD7xhLY5ELXwrHXX6l9ORWrqgSyZbFEwN44sfymXmimVTydZ21gVpX5UzC0PzAQ0G47XsxxBjRKX9xI3copg3klMiK1YV92EsCTeOdAevdj4juxsns5DD1JGXbbpj5moxlv8DXxVjWZ0ErXp3gJv9VdXMxP5zu5+MYxtB39HrzH15Dk79JK3jWMWsKXes1xB/5kJ+CLO7T7FebDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xs9sLSwiWSs18xTk55M+jlMyGGUSMs+v8PgdJqULo5c=;
 b=fLGxv+eqbPcXXd7u0Z79psRGfN5EqsYsunaHzp1LOZJ0kHALtSX+TZeIYo87b1CVUi89l5q8sfJm9X1nhYtMA0iinLg7FNd5HvEeBI1usO58lwn9ezNMrBUmNPw3BvaR7ktPOCP3UtxERB1XmSlLl25Np02MX4gF/+UYA7M8Qd+vgt6UXVgnTsWCLCW7m2xkSJ2iyw6lias4krS677mHK5cPA+cVaqMXKFJZo7kbSCscjRxY8xTgpuPX/rRc8GGxpAwd+9YTK1NKsfDZFlCEOFs6aoyc4EYuzKGf8eoNlZYNVtA97C6bkyOMbpkZS/LFDU6qIdE/EceYjWqakDdu0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=amd.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xs9sLSwiWSs18xTk55M+jlMyGGUSMs+v8PgdJqULo5c=;
 b=bWvolJYaeHBsyEUIq1NKgQJhHKXuwTSBfVDp2cSyVmlkbLuM5n2bhrNOufLVlAKrbHBbBySEYtO/RMj3ZVTwsrDkoM9tifulqlKzGhikgQW08h/MJKSHGgplkkAMztVGfMF6Sp8eRQlDSNi/nSRvdCzh3CvVWmevUEIuEM/Yt1M=
Received: from BN8PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:d4::24)
 by CO1PR10MB4579.namprd10.prod.outlook.com (2603:10b6:303:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 11:34:50 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:d4:cafe::e3) by BN8PR04CA0050.outlook.office365.com
 (2603:10b6:408:d4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Wed,
 10 Dec 2025 11:34:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Wed, 10 Dec 2025 11:34:49 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Dec
 2025 05:34:46 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Dec
 2025 05:34:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Dec 2025 05:34:46 -0600
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BABYfpX2857436;
	Wed, 10 Dec 2025 05:34:42 -0600
Message-ID: <042979ae-afe6-49eb-8311-00931940a4fb@ti.com>
Date: Wed, 10 Dec 2025 17:04:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Santhosh Kumar K <s-k6@ti.com>
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>, Pratyush Yadav
	<pratyush@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
	"mwalle@kernel.org" <mwalle@kernel.org>, "p-mantena@ti.com"
	<p-mantena@ti.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"a-dutta@ti.com" <a-dutta@ti.com>, "u-kumar1@ti.com" <u-kumar1@ti.com>,
	"praneeth@ti.com" <praneeth@ti.com>, "git (AMD-Xilinx)" <git@amd.com>,
	<s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
 <20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
 <cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com> <mafs0ikf74fja.fsf@kernel.org>
 <fe103265-7a68-41b8-b168-15a5e19abb3f@ti.com>
 <BN3PR12MB95702234F0F9840C70E42C61DCA6A@BN3PR12MB9570.namprd12.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <BN3PR12MB95702234F0F9840C70E42C61DCA6A@BN3PR12MB9570.namprd12.prod.outlook.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|CO1PR10MB4579:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c4a6de-de0b-44af-3831-08de37e0210d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2VvcisvVm9pc3NENTl2Tm0xNkluS0ZZRXJ6bnJUNU1RMGJvSlI3NlhHZHo5?=
 =?utf-8?B?RFFvekVncXpHS1BmUXlpaTcwMVZaRmsreDJQVGdaWndxRmQ1RlI1bFhPcHZj?=
 =?utf-8?B?WGNvdmJ3Q3d2bThVU2dZeEZtSGNzSjd0Y3BZbDZOd0Z0K1NMWXFFeGF0cWRY?=
 =?utf-8?B?QmNuVE0wMTYrNmlKbUFoSTh5YVFxa3kwc1Mxa3E4RXVFSHpEVEdrd0FhK1hJ?=
 =?utf-8?B?QXc4ZGtkT2tTYTVEbzRhN1R1RFNoQnRDUVV1aHNCZC9MVzV3NElCaW9SRkNu?=
 =?utf-8?B?Q2l3NjhMZyt2WmpsVHg2YWdQYVJzZytreDRpb1g4N2hWV2lGTmdvRThYTCtZ?=
 =?utf-8?B?N0tKZHVobHZtQ0VqOWNaRnVDUGVRdUcwY3JyN0VmOUVwcnR3VjFralFFbjJt?=
 =?utf-8?B?eVNOb0ZyQnJGTC84WkxPYWoxaTNQWncyamR5azJpSE4xVXIxdWpiREF6bHBK?=
 =?utf-8?B?NUxLa2NtSkUyR2tXT2lQNjkvbmJDRnZVWVZjUU1IQjlMRGZ3NXBEa0xuOUpw?=
 =?utf-8?B?V0tVRDBoN1hUVzZyR2VJeTFQMzFYOWYwbk5FMGtwRVFidDJVbTBTWEoySm84?=
 =?utf-8?B?VHlCNXFFNktvTmFXSTFtRm1wMGdJc1VTc3RTZTBXWEFmNWMvYTRsbXg4alFO?=
 =?utf-8?B?cGhJdnN6eVM4STUzUloyd0RUVTkrMXRxeWZnNHJwUDRZeUlGa0h6U3QrZUtF?=
 =?utf-8?B?bWpQRzNQRXZ5U2ZBM0ZsNVZNOVdVNldVSVlWK3B4YlFhWTVYNksyc1JNOWMw?=
 =?utf-8?B?ZllOK1Q5aGM2dXNrc2JCa3VSTVM5Q2hSdGUrK0FEWkd6bm1YWVMyR20xMHRZ?=
 =?utf-8?B?b1NZdWNoeHZrMGJ6WGJPT1R5OU9HVGdPd1dnQTlzbEw0VFBoM2p1Wmc4VVh0?=
 =?utf-8?B?ZDJ3a2ZaaVFOQVNLSjNnb0JRb2Z4WmpCM3N4TGV6U3Z1UTQwV09EcmF1cG0x?=
 =?utf-8?B?OG1FSnB1V1k5SVdMSm4vdXRna21jOFBWWXRVTFFSQ3ZnaklQczlkWElOcXFi?=
 =?utf-8?B?OEVoRmdDVjUySXphaGpvcnZpQzgvY2JyRVBCa1hlK0E3YjN4Yk90L2tJbkpJ?=
 =?utf-8?B?QUV3Zy83UXJBVFJJZXBUS05kTDdCNVh0OXl1aTdYTUlrMExwMjRqMzVhYkdR?=
 =?utf-8?B?SU8vc0VMbnVjVXNkM1RzbjhxeTZyOWg3UzljM0RObld3UjBlQlR5L25hZU1o?=
 =?utf-8?B?azZaNEw0UFR2c1JsalpMNkhQYTR1cnNpQnpPR3ErcUpEbE9zZ1MwaDRFL00r?=
 =?utf-8?B?dXFabnVoSUhRQ1h0WENaZnFlRUc2dy9jcjVLcDdpNmJnSzdRdnc3S2c4bXl0?=
 =?utf-8?B?eXNsMG5ZTDdGZlNDZ2RvK0hsc0N2M0V5L0hwOUJnMkFyYm84UWxnaUZtbEdh?=
 =?utf-8?B?NkcyTzQrSzIrUjVGZ08yb3ZpblNNNzF3QW1DTGwrWDVKQllNZGM3WmlqcUZI?=
 =?utf-8?B?V0lNMlU3UjdieXZUa0NFdXJkTHNjQ2tHb0RXdlpXTVNiTUFXTW0rMEV3bmxO?=
 =?utf-8?B?VXJQbkFFb3NFdlZibTRwU2k1ditTckoxY2tzTjhkSS90RWdJMWtPUzhSMnNn?=
 =?utf-8?B?RW8waCsvditGM0ZFLzNPRG8vVnhUcGZzYVJHMG1YTVg2UmNVMXQvYjBDaTVl?=
 =?utf-8?B?cVEyVUhSNVhnbjAvTkFmNzdrZnRNMGplcy9DcmJCSU05SHVudzdlTWZJZmdy?=
 =?utf-8?B?cElIMW5ja2REWndvYWZXQjVLNzF0VGwyaDQyZ3BDalNBMlVZeHc4T25PWWlL?=
 =?utf-8?B?UnlLTFZXMXhkdVhNWEpwMXUzYzFvblByMnI0V0I4MjBsbFpnUjduOXN1WlY2?=
 =?utf-8?B?V3grNEhwZCszbkRKVTFCdTV5R21hNkQ4K3VqaWtLSCtWYzVHMTdLejVMT2FU?=
 =?utf-8?B?eXJkc3c5NGxHWExhc0xBOFBzRjZoNmY4MVpWVVQ3NktDaVhQSVE0VTJ4MFBT?=
 =?utf-8?B?WGdCVHBrQ0lmU3JCNE1Ibm9aQVhDSjlqbEVjUitPUU1kUTVvL29iTnQ0cThh?=
 =?utf-8?B?ay96eHdNbFVZTHh5S0ZneTd4T1hIdHZxczNuSjFSWFRMMlBGaGtpQmlsRVFy?=
 =?utf-8?B?eEsxWTNKMENGZi84T2lhY0RQeWI0NE85RzlJWU1EVENhWE01a1M0ZEhsRUM5?=
 =?utf-8?Q?lUis=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 11:34:49.8681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c4a6de-de0b-44af-3831-08de37e0210d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_033455_588632_730FEA3D 
X-CRM114-Status: GOOD (  22.58  )
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

SGVsbG8gQW1pdCwKCk9uIDA0LzEyLzI1IDIyOjI0LCBNYWhhcGF0cmEsIEFtaXQgS3VtYXIgd3Jv
dGU6Cj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24g
T25seV0KPiAKPiBIZWxsbyBTYW50b3NoLAo+IAo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQo+PiBGcm9tOiBTYW50aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNvbT4KPj4gU2VudDogV2VkbmVz
ZGF5LCBEZWNlbWJlciAzLCAyMDI1IDE6MzIgUE0KPj4gVG86IFByYXR5dXNoIFlhZGF2IDxwcmF0
eXVzaEBrZXJuZWwub3JnPgo+PiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT47IHJpY2hhcmRAbm9kLmF0OyB2aWduZXNockB0aS5jb207Cj4+IGJyb29uaWVAa2Vy
bmVsLm9yZzsgdHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnOyBtd2FsbGVAa2VybmVsLm9yZzsgcC0K
Pj4gbWFudGVuYUB0aS5jb207IGxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LW10ZEBs
aXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0KPj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgYS1k
dXR0YUB0aS5jb207IHUta3VtYXIxQHRpLmNvbTsgcHJhbmVldGhAdGkuY29tOyBzLQo+PiBrNkB0
aS5jb20KPj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMDEvMTBdIHNwaTogc3BpLW1lbTogSW50
cm9kdWNlIHN1cHBvcnQgZm9yIHR1bmluZwo+PiBjb250cm9sbGVyCj4+Cj4+IEhlbGxvIFByYXR5
dXNoLAo+Pgo+PiBPbiAxOC8xMS8yNSAxOToxOSwgUHJhdHl1c2ggWWFkYXYgd3JvdGU6Cj4+PiBP
biBTYXQsIFNlcCAyMCAyMDI1LCBTYW50aG9zaCBLdW1hciBLIHdyb3RlOgo+Pj4KPj4+IFsuLi5d
Cj4+Pj4+IFRoaXMgaXMgYWN0dWFsbHkgd3JvbmcuIFR1bmluZyBpcyB3YXkgbW9yZSBnZW5lcmlj
IHRoYW4gdGhhdCA6KSBJZgo+Pj4+PiBzb21lb25lIHdhbnRzIHRvIHVzZSBhIGNoaXAgYXQgYSBo
aWdoIGZyZXF1ZW5jeSAoNTBNSHogaW4geW91ciBjYXNlLAo+Pj4+PiBidXQgd2hhdGV2ZXIsIHRo
ZXJlIGlzIGEgdGhyZXNob2xkIGFib3ZlIHdoaWNoIGFkZGl0aW9uYWwgY2FyZSBtdXN0Cj4+Pj4+
IGJlIHRha2VuKSwgaXQgbXVzdCBnbyB0aHJvdWdoIHRoZSBjYWxpYnJhdGlvbiBzdGVwLiBJdCBk
b2VzIG5vdAo+Pj4+PiBtYXR0ZXIgaW4gd2hpY2ggbW9kZSB5b3UgYXJlLiBDYWxpYnJhdGlvbiB3
b3VsZCBzdGlsbCBiZSByZWxldmFudCBpbgo+Pj4+PiBzaW5nbGUgU0RSIG1vZGUuCj4+Pj4+IFRo
aXMgNTBNSHogYm90aGVyZWQgTWFyayBiZWNhdXNlIGl0IGlzIHRvbyBDYWRlbmNlIHNwZWNpZmlj
LiBNYXliZQo+Pj4+PiB0aGlzIHNob3VsZCBiZSBhIGNvbnRyb2xsZXIgcGFyYW1ldGVyPyBJZiB0
aGUgc3BpLW1lbSBjb3JlIChvciBldmVuCj4+Pj4+IHRoZSBzcGkgY29yZSwgYnkgZXh0ZW5zaW5v
KSBzZWVzIHRoYXQgdGhlIGRlc2lnbiBhbGxvd3MgcnVubmluZyBhdAo+Pj4+PiBYTUh6IChkdWUg
dG8gdGhlIFNQSSBwZXJpcGhlcmFsIHByb3BlcnRpZXMgb3Igc2ltcGx5IHRoZSBhYnNlbmNlIG9m
Cj4+Pj4+IGFueSBsaW1pdGF0aW9uKSwgYW5kIGlmIHRoZSBjb250cm9sbGVyIHN0YXRlcyB0aGF0
IGl0IHJlcXVpcmVzIGFuCj4+Pj4+IGV4dHJhIHR1bmluZyBzdGVwIGFib3ZlIFlNSHogKGFuZCBY
ID4gWSksIHRoZW4gaXQgbGF1bmNoZXMgdGhlIGNhbGlicmF0aW9uLgo+Pj4+PiAgICBGcm9tIGEg
Y29yZSBwZXJzcGVjdGl2ZSwgSSB3b3VsZCBsaWtlIHRoZSBjYWxpYnJhdGlvbiBob29rIHRvIGJl
Cj4+Pj4+IGFzIHNpbXBsZSBhcyBwb3NzaWJsZSwgYmVjYXVzZSB3aGF0ICJjYWxpYnJhdGlvbiIg
bWVhbnMgaXMgaGlnaGx5Cj4+Pj4+IGNvbnRyb2xsZXIgYW5kIGNoaXAgc3BlY2lmaWMuCj4+Pj4K
Pj4+PiBJIHVuZGVyc3RhbmQgdGhlIGNvbmNlcm4gaGVyZS4KPj4+Pgo+Pj4+IExldCBtZSBwb2lu
dCBvdXQgdGhlIG9wdGlvbnMgZm9yIGxhdW5jaGluZyB0aGUgdHVuaW5nIHByb2NlZHVyZSwKPj4+
PiBhbG9uZyB3aXRoIHRoZSBpc3N1ZXMgaW4gZWFjaCBhcHByb2FjaC4KPj4+Pgo+Pj4+IE9wdGlv
biAxOiBMYXVuY2ggdHVuaW5nIGFzIHBhcnQgb2Ygc3BpX21lbV9leGVjX29wKCkKPj4+PiAgICAg
IC0gQWZ0ZXIgc3BpX21lbV9hY2Nlc3Nfc3RhcnQoKSwgaW50cm9kdWNlIGEKPj4+PiBzcGlfbWVt
X25lZWRzX3R1bmluZygpIGNoZWNrIChhIG5ldyBjYWxsYmFjayB0byBTUEkgTUVNIGNvbnRyb2xs
ZXIpCj4+Pj4gdG8gY2hlY2sgd2hldGhlciB0aGUgY3VycmVudCBvcCByZXF1aXJlcyB0dW5pbmcK
Pj4+PiAgICAgIC0gSWYgeWVzLCB3ZSBjYWxsIHNwaV9tZW1fZXhlY3V0ZV90dW5pbmcoKQo+Pj4+
ICAgICAgICAgICAtIG9uIHN1Y2Nlc3MsIG1hcmsgdHVuaW5nIGNvbXBsZXRlIGluIGEgZmxhZyB3
aXRoaW4gU1BJIE1FTQo+Pj4+IENvbnRyb2xsZXIgcHJpdmF0ZSBkYXRhCj4+Pj4gICAgICAgICAg
IC0gb24gZmFpbHVyZSwgd2UgYXR0ZW1wdCBhIGZhbGxiYWNrIGJ5IGNhbGxpbmcKPj4+PiBzcGlf
bWVtX2FkanVzdF9vcF9mcmVxKCkgYW5kIGRyb3AgdG8gYSBsb3dlciBzdXBwb3J0ZWQgZnJlcXVl
bmN5Cj4+Pj4KPj4+PiBPcHRpb24gMjogTGF1bmNoIHR1bmluZyB3aXRoaW4gc3BpX2NvbnRyb2xs
ZXItPmV4ZWNfb3AoKSBpbXBsZW1lbnRhdGlvbgo+Pj4+ICAgICAgLSBWZXJ5IHNpbWlsYXIgdG8g
b3B0aW9uIDEsIGV4Y2VwdCB0aGF0IHRoZQo+Pj4+IHNwaV9tZW1fZXhlY3V0ZV90dW5pbmcoKSBp
cyB0cmlnZ2VyZWQgZnJvbSB3aXRoaW4gdGhlIGNvbnRyb2xsZXIncwo+Pj4+IGV4ZWNfb3AoKSBp
bXBsZW1lbnRhdGlvbiAobm8gbmVlZCBmb3Igc3BpX21lbV9uZWVkc190dW5pbmcoKSkKPj4+Pgo+
Pj4+IERyYXdiYWNrcyBpbiBvcHRpb24gMSBhbmQgMjoKPj4+PiAgICAgIC0gVHVuaW5nIHJlcXVp
cmVzIG11bHRpcGxlIHJlYWRzIG9mIGEga25vd24gcGF0dGVybiwgYnV0IHRoZQo+Pj4+IGZsYXNo
IG1heSBub3QgYWx3YXlzIGJlIGluIGEgc3RhdGUgdG8gYWxsb3cgcmVhZCBjb21tYW5kcwo+Pj4+
ICAgICAgLSBObyBmYWxsYmFjayBvbiBmYWlsdXJlcywgY2FuJ3QgbWFrZSBmbGFzaC1zcGVjaWZp
YyBhZGp1c3RtZW50cwo+Pj4+IGluIGNhc2Ugb2YgYSB0dW5pbmcgZmFpbHVyZQo+Pj4+ICAgICAg
LSBObyBhY2Nlc3MgdG8gd3JpdGVfb3AoKSB0byB3cml0ZSBrbm93biBwYXR0ZXJuIHRlbXBvcmFy
aWx5IHRvCj4+Pj4gYW4gb24tZGllIGNhY2hlLiBQYXR0ZXJuIG5lZWRzIHRvIGJlIGFsd2F5cyBi
dXJudCBpbnRvIHRoZSBmbGFzaAo+Pj4+Cj4+Pj4gICAgICAtIFBsdXMsIGluIG9wdGlvbiAyIC0g
d2UgY2FuJ3QgY2FsbCBzcGlfbWVtX2FkanVzdF9vcF9mcmVxKCkKPj4+Pgo+Pj4+IFdoaWxlIHRo
ZSBuZWVkIGZvciB0dW5pbmcgaXMgZGljdGF0ZWQgYnkgQ29udHJvbGxlciBzcGVjaWZpYwo+Pj4+
IGNoYXJhY3RlcmlzdGljcyB0aGUgb3BzIChhbmQgc3RhdGUgb2YgdGhlIGNoaXApIHJlcXVpcmVk
IHRvIGNvbXBsZXRlCj4+Pj4gdHVuaW5nIGlzIHVuZGVyIHRoZSBjb250cm9sIG9mIHNwaS1tZW0g
dXNlcnMgKHNwaS1uYW5kL3NwaS1ub3IpLgo+Pj4+IFNvLCBpdCdzIGltcG9zc2libGUgdG8gYWNo
aWV2ZSB0dW5pbmcgd2l0aG91dCB0aGUgaGVscCBvZiBzcGktbWVtIHVzZXJzLgo+Pj4+Cj4+Pj4g
U28sIE9wdGlvbiAzOiBMYXVuY2ggZnJvbSBTUEkgTUVNIGNsaWVudHMKPj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKG10ZC9uYW5kL3NwaSBvciBtdGQvc3BpLW5vciwgZXRjLiwpCj4+
Pj4gICAgICAtIE9uY2UgdGhlIHNwaS1tZW0gY2hpcCBpcyBjb21wbGV0ZWx5IGVudW1lcmF0ZWQg
YW5kIGJlc3QgcmVhZAo+Pj4+IGFuZCB3cml0ZSBvcHMgYXJlIGNob3NlbiBjYWxsIHNwaV9tZW1f
bmVlZHNfdHVuaW5nKHJlYWRfb3AsIHdyaXRlX29wKQo+Pj4+IGFzIGEgcGFydCBvZiAucHJvYmUo
KQo+Pj4+ICAgICAgLSBJZiB0dW5pbmcgaXMgcmVxdWlyZWQsIGNhbGwKPj4+PiBzcGlfbWVtX2V4
ZWN1dGVfdHVuaW5nKHJlYWRfb3AsIHdyaXRlX29wKQo+Pj4+ICAgICAgICAgICAtIElmIG9ubHkg
cmVhZF9vcCBpcyBwcm92aWRlZCwgaXQgaW1wbGllcyB0aGUgdHVuaW5nIHBhdHRlcm4KPj4+PiBp
cyBwcmUtZmxhc2hlZCB0byB0aGUgcGFydGl0aW9uCj4+Pj4gICAgICAtIE9uIHR1bmluZyBmYWls
dXJlLCByZXRyeSBieSByZS1ydW5uaW5nIHNwaV9tZW1fbmVlZHNfdHVuaW5nKCkKPj4+PiB3aXRo
IHRoZSBzZWNvbmQgYmVzdCBzZXQgb2Ygb3BzIChtYXggdGhyb3VnaHB1dCAtIDEpCj4+Pj4KPj4+
PiBXaXRoIG9wdGlvbiAzLCBzcGlfbWVtIHVzZXJzIGFyZSBsaW1pdGVkIHRvIGNhbGxpbmcKPj4+
PiBzcGlfbWVtX25lZWRzX3R1bmluZygpIGFuZCBzcGlfbWVtX2V4ZWN1dGVfdHVuaW5nKCkuIFJl
c3QgaXMgaGlkZGVuCj4+Pj4gd2l0aGluIHRoZSBjb250cm9sbGVyIGRyaXZlcnMuIElmIHNwaS1t
ZW0gdXNlcnMgY2hhbmdlIHJlYWQvd3JpdGUKPj4+PiBvcHMsIHRoZSBhYm92ZSBzZXF1ZW5jZSBj
YW4gYmUgcmUtaXNzdWVkLgo+Pj4+Cj4+Pj4gVGhlIGNvbnRyb2xsZXIgY2FuIHN0b3JlIHRoZSBy
ZWFkX29wIGFuZCB3cml0ZV9vcCBpbiBjYXNlIG9mIGEgdHVuaW5nCj4+Pj4gc3VjY2VzcyBhbmQg
cGVyaW9kaWNhbGx5IHJlLXJ1biB0dW5pbmcsIGVuc3VyaW5nIHdlIGFsd2F5cyBoYXZlIHZhbGlk
Cj4+Pj4gdHVuaW5nIHBhcmFtZXRlcnMuCj4+Pj4KPj4+PiBPbmUgY29uY2VybiB3aXRoIG9wdGlv
biAzIGlzIHRoYXQgd2UgbWF5IG5vdCBiZSBhYmxlIHRvIG1ha2UgdXNlIG9mCj4+Pj4gc3RhdGlj
IGRhdGEgb24gY2VydGFpbiBmbGFzaCBhcyB0dW5pbmcgcGF0dGVybnMgKGxpa2UgcmVhZGluZwo+
Pj4+IHBhcmFtZXRlciBwYWdlIG9yIFNGRFAgdGFibGUgZm9yIHR1bmluZyBpbnN0ZWFkIG9mIGNv
bnRyb2xsZXIKPj4+PiBzcGVjaWZpYyBhdHRhY2sgcGF0dGVybnMpLgo+Pj4KPj4+IFdoeSBub3Q/
IEhvdyBlbHNlIHdvdWxkIHR1bmluZyB3b3JrPyBEbyB5b3UgZXhwZWN0IGNvbnRyb2xsZXJzIHRv
Cj4+PiBmaXJzdCBmbGFzaCB0aGUgdHVuaW5nIHBhdHRlcm4gYW5kIHRoZW4gdHVuZSB0aGUgcmVh
ZHM/IFRoYXQgaXMgYSBoYXJkCj4+PiBubyBJIHRoaW5rLCBzaW5jZSB5b3UgZG9uJ3Qgd2FudCB0
byBvdmVyLXdyaXRlIHVzZXIgZGF0YSBhbmQgSSBkb24ndAo+Pj4gdGhpbmsgd2Ugd2lsbCBldmVy
IGhhdmUgYW55IGFyZWEgb2YgbWVtb3J5IHdlIGNhbiByZWxpYWJseSBvdmVyLXdyaXRlCj4+PiB3
aXRob3V0IHJpc2tpbmcgdGhhdC4KPj4+Cj4+PiBJIHRoaW5rIHdlIHNob3VsZCBzdGFydCB3aXRo
IHRoZSByZXF1aXJlbWVudCB0byBoYXZlIHRoZSBwYXR0ZXJuCj4+PiBmbGFzaGVkIGFscmVhZHkg
YW5kIGZpZ3VyZSBvdXQgaG93IFNQSSBOT1Igb3IgU1BJIE5BTkQgY2FuIGRpc2NvdmVyCj4+PiB0
aGF0IChwZXJoYXBzIHZpYSBOVk1FTT8pLgo+Pgo+PiBJIGFncmVlIC0gaGF2aW5nIHRoZSBjb250
cm9sbGVyIG92ZXJ3cml0ZSB1c2VyIGRhdGEgaXMgYSBoYXJkIG5vIQo+Pgo+PiBGb3IgU1BJIE5B
TkQsIGEgcHJvZ3JhbSBvcGVyYXRpb24gaGFwcGVucyBpbiB0d28gc3RlcHM6IGRhdGEgaXMgZmly
c3QgY29waWVkIGludG8KPj4gdGhlIGludGVybmFsIGNhY2hlLCBhbmQgb25seSB0aGVuIHdyaXR0
ZW4gdG8gdGhlIGZsYXNoIGR1cmluZyB0aGUgcHJvZ3JhbS1leGVjdXRlCj4+IHBoYXNlLiBUaGlz
IGlzIHdoeSB0aGUgdHVuaW5nIGZsb3cgd3JpdGVzIHRoZSBwYXR0ZXJuIG9ubHkgdG8gdGhlIGRl
dmljZSdzIGludGVybmFsCj4+IGNhY2hlIGFuZCByZWFkcyBpdCBiYWNrIGl0IGZyb20gdGhlcmUu
IFRoaXMgYXZvaWRzIHRvdWNoaW5nIGFueSB1c2VyIGRhdGEgb24gdGhlCj4+IGZsYXNoIGFuZCBp
cyBhbHJlYWR5IGltcGxlbWVudGVkIGluIHYyICh3aGljaCBJJ2xsIHBvc3Qgc2hvcnRseSkuCj4+
Cj4+IEZvciBTUEkgTk9SLCB3ZSBkbyBub3QgaGF2ZSBhbiBlcXVpdmFsZW50ICJ3cml0ZS10by1j
YWNoZSIgcG9zc2libGUsIHNvIHdlIHN0aWxsCj4+IHJlcXVpcmUgYSBwcmUtZmxhc2hlZCBwYXR0
ZXJuIHJlZ2lvbi4gQXQgdGhlIG1vbWVudCB0aGlzIGlzIHByb3ZpZGVkIHZpYSBhIGRlZGljYXRl
ZAo+PiAicGh5cGF0dGVybiIgcGFydGl0aW9uLCBhbmQgaXRzIG9mZnNldCBpcyBvYnRhaW5lZCB0
aHJvdWdoIHRoZSBvZl9nZXRfKiBBUElzLgo+IAo+IEkgd2FzIHdvbmRlcmluZywgZm9yIFNQSS1O
T1IgZGV2aWNlcywgd2h5IGNhbuKAmXQgd2UgdXNlIHRoZSAicGh5cGF0dGVybiIKPiBwYXJ0aXRp
b24gdG8gd3JpdGUgdGhlIHBhdHRlcm4gYW5kIHRoZW4gcmVhZCBpdCBiYWNrIGR1cmluZyB0dW5p
bmc/IFNpbmNlIHRoZSB1c2VyCj4gd291bGQgbmVlZCB0byBkZWZpbmUgYSBzcGVjaWZpYyBwYXJ0
aXRpb24gbmFtZSAoaS5lLiwgcGh5cGF0dGVybikgdG8gaW5pdGlhdGUgdHVuaW5nLAo+IHRoYXQg
cGFydGl0aW9uIGNvdWxkIGFsc28gYmUgcmVzZXJ2ZWQgZm9yIHR1bmluZyBwdXJwb3Nlcy4gUGxl
YXNlIGxldCBtZSBrbm93Cj4geW91ciB0aG91Z2h0cyBvbiB0aGlzLgoKWWVzLCB0aGUgJ3BoeXBh
dHRlcm4nIHBhcnRpdGlvbiBpcyB1c2VkIGFzIHRoZSBzb3VyY2UgZm9yIHRoZSB0dW5pbmcKcGF0
dGVybiBvbiBTUEktTk9SIGRldmljZXMsIGJ1dCB0aGUgcGF0dGVybiBpdHNlbGYgaXMgcHJlLWZs
YXNoZWQuIFdlCmF2b2lkIGhhdmluZyB0aGUgU1BJLU5PUiBjb3JlIHdyaXRlIHRoZSBkYXRhLCBz
aW5jZSB0aGUgZHJpdmVyIHNob3VsZApuZWl0aGVyIG5lZWQgdG8ga25vdyB0aGUgcGF0dGVybiBj
b250ZW50cyBub3IgbW9kaWZ5IGFueSBwZXJzaXN0ZW50CmZsYXNoIHJlZ2lvbiBkdXJpbmcgdHVu
aW5nLiBLZWVwaW5nIHRoZSBwYXR0ZXJuIHByZS1mbGFzaGVkIGVuc3VyZXMgdGhlCnR1bmluZyBz
ZXF1ZW5jZSBpcyByZWFkLW9ubHkgZnJvbSB0aGUgZHJpdmVyJ3MgcGVyc3BlY3RpdmUgYW5kIHBy
ZXZlbnRzCmFueSByaXNrIG9mIHRvdWNoaW5nIHVzZXIgb3Igc3lzdGVtIGRhdGEuCgpSZWdhcmRz
LApTYW50aG9zaC4KCj4gCj4gUmVnYXJkcywKPiBBbWl0Cj4+Cj4+IFJlZ2FyZGluZyB3YXlzIHRv
IGxvY2F0ZSB0aGUgcGFydGl0aW9uOgo+Pgo+PiAxLiBVc2luZyBOVk1FTToKPj4gICAgICBhLiBF
eHBvc2luZyB0aGUgcGh5cGF0dGVybiBwYXJ0aXRpb24gYXMgYW4gTlZNRU0gY2VsbCBhbmQgaXNz
dWluZyBhbgo+PiAgICAgICAgIE5WTUVNIHJlYWQgZHVyaW5nIHR1bmluZyBkb2VzIG5vdCB3b3Jr
IHJlbGlhYmx5LCBiZWNhdXNlIE5WTUVNCj4+ICAgICAgICAgZW5kcyB1cCBjYWxsaW5nIGludG8g
dGhlIE1URCByZWFkIHBhdGggYW5kIHdlIGNhbm5vdCBjb250cm9sIHdoaWNoCj4+ICAgICAgICAg
cmVhZF9vcCB2YXJpYW50IGlzIHVzZWQgZm9yIHRoZSByZWFkLgo+Pgo+PiAgICAgIGIuIEFkdmVy
dGlzaW5nIHRoZSBwYXJ0aXRpb24gYXMgYW4gTlZNRU0gY2VsbCBhbmQgdXNpbmcgTlZNRU0gb25s
eQo+PiAgICAgICAgIHRvIGZldGNoIHRoZSBvZmZzZXQgaXMgbm90IHBvc3NpYmxlIGVpdGhlci4g
TlZNRU0gYWJzdHJhY3RzIHRoZQo+PiAgICAgICAgIHByaXZhdGUgZGF0YSwgaW5jbHVkaW5nIHBh
cnRpdGlvbiBvZmZzZXRzLCBzbyB3ZSBjYW4ndCByZXRyaWV2ZQo+PiAgICAgICAgIHRoZSBvZmZz
ZXQgYXMgd2VsbC4KPj4KPj4gMi4gVXNpbmcgb2ZfZ2V0XyogQVBJczoKPj4gICAgICAgICBVc2lu
ZyB0aGUgc3RhbmRhcmQgT0YgaGVscGVycyB0byBsb2NhdGUgdGhlIHBoeXBhdHRlcm4gcGFydGl0
aW9uCj4+ICAgICAgICAgYW5kIHJldHJpZXZlIGl0cyBvZmZzZXQgaXMgYm90aCByZWxpYWJsZSBh
bmQgc3RyYWlnaGZvcndhcmQsIGFuZAo+PiAgICAgICAgIGlzIHRoZSBhcHByb2FjaCBjdXJyZW50
bHkgaW1wbGVtZW50ZWQgaW4gdjIuCj4+Cj4+Pgo+Pj4gSSB0aGluayBTRkRQIGlzIHF1aXRlIG5p
Y2UgZm9yIHRoaXMsIGJ1dCBJSVJDIGZvcgo+Pj4gc3BpLWNhbmRlbmNlLXF1YWRzcGksIHRoYXQg
d2FzIG5vdCBhIHZpYWJsZSBvcHRpb24gZHVlIHRvIHNvbWUKPj4+IHJlYXNvbnMuIElmIHlvdSBj
YW4gbm93IG1ha2UgaXQgd29yayB3aXRoIFNGRFAsIHRoZW4gdGhhdCB3b3VsZCBiZQo+Pj4gZXZl
biBiZXR0ZXIsIHNpbmNlIHdlIGRvbid0IGhhdmUgdG8gZGVhbCB3aXRoIHRoZSBwYWluIG9mIHBy
ZS1mbGFzaGluZy4KPj4KPj4gVGhlIGN1cnJlbnQgdHVuaW5nIGZsb3cgcmVxdWlyZXMgYSBzcGVj
aWZpYyBzdHJlc3MgcGF0dGVybiB0byBlbnN1cmUgcm9idXN0bmVzcywgYW5kCj4+IHRoZSBTRkRQ
IGRhdGEgYXJlbid0IGdvb2QgZW5vdWdoIGZvciBpdC4KPj4KPj4+Cj4+PiBPdmVyYWxsLCBJIHRo
aW5rIG9wdGlvbiAzIGlzIHRoZSBtb3N0IHByb21pc2luZy4gT3B0aW9ucyAxIGFuZCAyIHdpbGwK
Pj4+IGxpa2VseSBhZGQgc28gbXVjaCBvdmVyaGVhZCB0aGV5IHdpbGwgZW5kIHVwIGJlaW5nIHNs
b3dlciB0aGFuIG5vbi1QSFkKPj4+IHJlYWRzLCBzaW5jZSB0dW5pbmcgaXMgdXN1YWxseSBxdWl0
ZSBleHBlbnNpdmUuCj4+Cj4+IFRoYW5rcywKPj4gU2FudGhvc2guCj4+Cj4+Pgo+Pj4+Cj4+Pj4g
UGxlYXNlIGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMgb24gd2hpY2ggb2YgdGhlc2UgZGlyZWN0
aW9ucyBtYWtlcwo+Pj4+IHRoZSBtb3N0IHNlbnNlLgo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+IFNh
bnRob3NoLgo+Pj4+Cj4+Pgo+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
