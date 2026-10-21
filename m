Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361A7606A327
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Oct 2026 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a88X7+uk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=AUpQK36C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWMBALH+ZNCcNmN+XuX8xpR0ZhwM9Jygc9gz59IDyWw=; b=a88X7+ukEHZ7wV1FsQ6U8R2sBN
	Casw3HiLeQ/Jy9KbPCIJAwEVTuDgaEIY96KZKoWuWxKH2yIXUi3K9qmkR8J4a3MqxcQE59LtYT8W5
	CsfwheWRaYbJAWD8WKfo+khxM4C3qPq56rRECBE9oZxVTGvcEDIOlA3+SE0HFpdTfOB7mGDHL4d4H
	EOVnhVmoVzKYRfywMWcmnQcm0FM8LCnXf16Gud887o8vZNFLYQO8l0os9Y44+xZVWVDyQ6hk6oyVz
	1zs6Xhl+xc3H5nRvW1OLAUUB9VC0e/eSXi1y/cXzznEYW3Oo77iZx/ml/9rbXmf6So/IgqECXAv2y
	rTp5jNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVjO-0000000Bpve-2TWk;
	Wed, 21 Oct 2026 12:47:46 +0000
Received: from mail-northcentralusazon11013003.outbound.protection.outlook.com ([40.107.201.3] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVjM-0000000Bpux-1c2p
	for linux-mtd@lists.infradead.org;
	Wed, 21 Oct 2026 12:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSkGCMv8cPTcTJ028BaL+b/Ap8Sns6nPToqZabqQh8yjwXJLvAZA30UaJUYRT3PY4j23UiOyKQR6BInPRGgxex9FSjtps4bPQHaqaYrVDPZn8saRVRm2R9EUJnLETdo9kyTAUO98cR98aic1veYP5WxBLWDfeuTtAigAciJJW+G/tcrvGcPNRaIG+mLhdg/e2QIhhQ1QCoPYLTrzsrIfHpsJgdFckYW7+ZPw7GVvc6BgGTt7yQ2UfLNe1DhbpWfMt8bGvfiuinOo5W/lfPwGP7qfos6wefN6b6K7zBkeP89d6iuunKG7hAxrqgWzTWirlyRtYlC3Wq58O8E/s+uk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSfnl8OViYKTfdQvMn5jQSgpVQGoxLoGul67I6FcqYc=;
 b=vsmVimAwMFU/VvxsCs4Rt+9wkPvYnb5F5FxljUMcOs8v/stHP7QzTTTJD7bPSJihifHma44RHJdQi0ARhgsyEPVh/tYSvNeoarqHU3HvJB54aEpIMB/mqk2jiF+Dm7XhUzE1qnMvgE7oyOt4ruLNumgXcCoMjG6/3EmlkByBooyO1Ve1gS9OqQ5kBtqWBR1i12kFciDH/OTpn1fgE85YqE6BnJsSE3qdjA1sbhWLqkxuU0dhzCRrDs+MAyw7mtN0szjySj/PJMhU2WNQV77WiiL7XyTWqDzh0Y6CmCzY6Ky2OECshSDMlM9n53pOgMzix6id4ST0ji57YyWpyUdrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSfnl8OViYKTfdQvMn5jQSgpVQGoxLoGul67I6FcqYc=;
 b=AUpQK36C9iBrcCv29CArvsFxxr3Ao/yrJFOiwlpyapMwHgZqN5NHdbIzJ7wupCU/h+VgMNMDABCk+jBHzHTUiUlE2DqmYKYlt4RavqBMGYSaP84IrnVibA9zGyodDwU5lI8IMx+HuBgrpT+Ono2iT4A9S2MoBVohtOh5DyqfEWvVcpGZ1VE4HZSP0ab/q97asqyH8gFclNEVotXD+/YO2kRBm7vn1cFgnWn432KeYR3889F/1N4PmMmkecUfcAnuTHrjVG+YcqC5tRDXXkh32FklzjoDp0NVeDfFimYYYgmPPkGsuCNhliipp+lWcm2TTBOWzhiPqhEsmsMoL1wdYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7732.namprd03.prod.outlook.com (2603:10b6:408:281::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 12:47:30 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 12:47:30 +0000
Message-ID: <9ae3221d-a849-4297-87f8-866ae45e6dcd@altera.com>
Date: Wed, 21 Oct 2026 20:47:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mtd: core: add release hook and removed flag for
 unbind with open handles
To: Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org,
 Pratyush Yadav <pratyush@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, linux-mtd@lists.infradead.org
References: <cover.1791512623.git.tze.yee.ng@altera.com>
 <e4312228d241860b3e3238864d12aae47b721db1.1791512623.git.tze.yee.ng@altera.com>
 <sashiko-outbox-165038@kernel.org>
Content-Language: en-US
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
In-Reply-To: <sashiko-outbox-165038@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: b27fdc4d-1ec6-48bb-7dbc-08df2f71781b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|55112099003|6133799003|18002099003|10067099003|22082099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: pYxEYlbDKPpZiLsGyKcKTX3npCgk2XGfubVicGs5Cpf/UHYjMBbVLXH3vx+4cEaSVODW2kcXSIp4PqObCn8+UyUPZwBEIl2B0TDt/m+2+XjdDj6N/iaqMlCqhOeZFVKGm/mrkqL/rp63V9/NJ2K3px065fKPB9Rk/PjkEYLI18+WmoKzS4N3qGa47itzonslWVLvf0s42xR7GSKTDARC+RuFyyKEXVOqOIY9bpGKB/d1Y5UmalKAGPYiaxr82SHEhVvXqL4PzW3i4ulgoect8dq7weqMW9EaSpMCmvu8dADMPR98PREq+QO5Jv3DK8w/SyzS58SjB+6jFRx2rmRaJDKktKAhKecrLTtKnvJluUJYKLLMP9fqAFaEbLvepEJEPNMf+98+yU9GanLinFGd+FU0aZMmNqPg2fCpD8+VqbDAbuv96xLwmDLo1pcPV1jelQbePWiGo47ZqQwG0dufUodRoE57JFR9KjLNy3+uceTf6g5n6F8uLa4Uuo5I+z66JTDpIrRVUA6+9Eogi8ESfbL0yAPOCU4RopP5ntsTUyvH9yi54S6SqdWF7o50e+zOEb6AR+NLojM19/QdCPWZh5u0UT9UsYeKphr1PsGAIwtNzE7l6rwCDO7RYEyllmPFTuWi9gXiemsd0VG8MLWXobgIYmK0vF920ULqrcu6ICc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(55112099003)(6133799003)(18002099003)(10067099003)(22082099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0tmYU1oZnlsMXJPYmZtelV2NjhVbzRyNncrdnRjSi8rcE9FbUFEUGgzeVpw?=
 =?utf-8?B?eDYzTGhmdjQ5b2ZxYSswenUvVmdkaERrbU9JWVVxUGRXYUs0OWYxOVpldVJB?=
 =?utf-8?B?NE1SU1grMjhTNDRRNTQ3SmJRbmJLOEdZNnVlQUxNbjh6c3g2K3EvQlZYN28x?=
 =?utf-8?B?eElXSlRuNGsxK3RhbmRtbytvT0RQT3E0OGNwRzE4RjFQekVrcFY5QVNJV3hq?=
 =?utf-8?B?NDNBcXhpQTBDdlVuUE9NekJ5TXI1NzFZZlRpWmViUS9kWjBxYSt5aHFjVHN4?=
 =?utf-8?B?elVRSFRaZ0lnZ3F1UWZwYmVid0VmdnExWnVyMWdFeS9sUDBqMG1PRVlFN3ZP?=
 =?utf-8?B?dnRaUnZHQ1dsd0tkaFhUV0p5WldOVnNWN0R1Mk9uZ0lESStKR0hUazJFSVVk?=
 =?utf-8?B?TGpNcGRJbGJnMHlHb3JGaFRQRFNhWkszUjJocitzaUkrajNjSmdCUThia2w0?=
 =?utf-8?B?NUFzdCtPOGFjdnpnTW5hcnNnQWMxZE9tUVlqQjBUaXJkcHZYS2syYzlNc0JR?=
 =?utf-8?B?SEZ4VHNJOHV4TURhRWM3cGpqaVA1Um9PMXc1U2ZWbmNQdkd0Wmw2MmRmL1hm?=
 =?utf-8?B?YUx0RC9IelZIQWxOejBPNUFLQkZvbm9aZzl2Z2w1bWRub1YyUThwNFRSZHRr?=
 =?utf-8?B?N2lkWTFJM1ppLzlHNDArUlZtL2J1S3ZNNllYT3NRWTdxdWpmL2o3ZTF1Z2xH?=
 =?utf-8?B?eDkyMXFXUmRQb1VmYVdFei9Ea3VIRU90VjNlZTF6a3ZZaWYyankzOVUxTE44?=
 =?utf-8?B?WGZBTU81d1BITHpYcGZ0WG01RzBSSVZHdFV3ZFJyTzZCR1NWS1NNSTIxc2VX?=
 =?utf-8?B?Nlo1RWtodVgydUcwVks5cEZVQmRKbVBvMkErZEdwelVOZ3VyZyt3YXI0SmFQ?=
 =?utf-8?B?Wmk4Rjg1dUwzY0c0SURldTlmelo0YlBRdlJhOWRvMys1b1dmNElwMWNsbDM0?=
 =?utf-8?B?eit6b0Z0OFE3RThpY1NkNk5rVnFkTUM0aWp1NS9QU1dFUHFVanozQXVUeFVh?=
 =?utf-8?B?eWFyaUtlWEFzTXV5OFl0ZHpHNDVjSVJKU04rbTdvRlJIWmRLdEdjcENZbUts?=
 =?utf-8?B?a2RHVUNFQ0dFYmswbVFFelRFM0hTYUlCK002WGIrbWdrdVpnb2NZUlpwMkZB?=
 =?utf-8?B?V2FGVG9TejVyK0wwd3RneVRPM2lnWFlrV1JFcmxpM2JURE95RWw5bm00UmJv?=
 =?utf-8?B?cjhjQnBkd2dmbkRjMlpDREVNVm9vRE5jN3JUOXQreUVFWjVKRDV1YmQ1Rkpl?=
 =?utf-8?B?WnBYVVordUZZZG9hZTdjOUZwUGJveFpkdjhjZ1hLWHVtZUp3bGlFbk12Y3ps?=
 =?utf-8?B?WDYva0NMMCs4UitQQTRENkZzWVc2TlJ0bTEwdmJGeFcwRjVrVzc3RlgyYmpv?=
 =?utf-8?B?YThsREhyVEl6bzg2azc4SDRhRDhaTmJpZFNMQnhWTGZjSTZ4NzJleVVlQ1hs?=
 =?utf-8?B?YWZuc1A3VFEwVHNRNTVDYTZSa2toYnZ3Z1FzdVJ1YWVBWm1SV3J3eE00TUFo?=
 =?utf-8?B?T3JuS3dic2ZNb0ViMmdRbDJuazlLWFhYSE0zeng4YzNJbEZPSmh5WWdTdXlT?=
 =?utf-8?B?djRkbkpYMXQvZGJmZUFxa0NWeXpxQTNZdmFFejNUeml4ZndpWHhsb3h6eUhT?=
 =?utf-8?B?NEx6NDdWSHZUbkdZL3hDc3NHendxLzJDSWZBUTk0RjM0V3FYeXdCaXlsU0gx?=
 =?utf-8?B?aVVLN1BCdlRrSmVzNEZLdTY1RmY5KzZtb0Vta1dJRi9VNitsdVh3RVV3T045?=
 =?utf-8?B?QWxQM0p6bzFYVHBITHk3YXpqU00rMlB5ZFlSaC9ZYTdJamFlSnpEekVsVyt5?=
 =?utf-8?B?V094djR4blA1UFUvU2g4VlNGc3UyYldSQktLSDk1ZTE0WUVrQlJRSENGWURY?=
 =?utf-8?B?N05yWlliNG9YaHRiWk13ckZCZnpvWlJpV25YVnNPbjJSRE5tZXNjeVlVR2FI?=
 =?utf-8?B?ZXg5RFErWno4Slk4dXNJNEpJdit1dzl1Q3J0R2hCNXk1bW1EUUtCOTMzdThM?=
 =?utf-8?B?MnZHcjBSZWZWWFU3N3JwNE0wblJFbmNJdVV3ek0vUFlXNkNYN2ZuZ052Q1M3?=
 =?utf-8?B?VWEyTHN3NERLdTd5OHVPYi9xRzdnRHdoVFkyVU02ZzdmeFFNcmFXeEs4VEFk?=
 =?utf-8?B?dXc2N2liT1FKa1hNWndqYm1UVXRHRlpKZlp5L2hkWnJFVkw2WEtkTE41NTdG?=
 =?utf-8?B?RSsxSDRwSC93aGlzU2VqQ3VNRXJLVXpxa1pyMXF5d1dLY1M3eGhDY0d4R2p0?=
 =?utf-8?B?SGxQWHluU0ZnNzB3QmUvNXRmbmZVN1QwSnVyNVl4clJSejlWUGhLdjg5UFQy?=
 =?utf-8?B?V1NTUXR6RXlwQlNrS1NySkpLbE5MckhpVmw5S011TlAxdTQxTExmQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27fdc4d-1ec6-48bb-7dbc-08df2f71781b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:47:30.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1z/Z6LjJpqQOwL7rvf1jp3pVzX6UjAZ8FRDesAIndGny0Ccd9UivGy7ODOohPaKlB5Zb+Swj0bEktTMn+JfQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_054744_460475_12823AF6 
X-CRM114-Status: GOOD (  34.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 9/10/2026 3:49 pm, sashiko-bot@kernel.org wrote:

Hi maintainers,

Thanks for the review. For v3, I plan to drop the core release hook and 
the removed flag, and reduce patch 1 to a reorder in __put_mtd_device(). 
spi-nor would manage the object's lifetime with its own refcount.

> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Critical] mtd: Device Model lifecycle violation causing sysfs Use-After-Free> - [High] mtd: Use-After-Free of master object in __put_mtd_device()> 
- [High] mtd: Master driver object memory leak when 
CONFIG_MTD_PARTITIONED_MASTER is disabled
> - [High] mtd: lockless TOCTOU race on master->removed allows UAF on unbind
> --
> 
> commit 5c236b852da3e75f7d2ec6f13275ac5b432bb26f
> Author: Tze Yee Ng <tze.yee.ng@altera.com>
> 
>      mtd: core: add release hook and removed flag for unbind with open handles
> 
> This commit introduces a new _free hook to struct mtd_info called from the
> kref release function to ensure the backing driver object is destroyed only
> when the last reference drops. It also adds a removed flag to struct mtd_info
> which is set on unbind and checked before performing hardware operations to
> prevent Use-After-Free of parent devm resources.
> 
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 491a27d0315fa..59133894b5e5c 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -118,6 +118,7 @@ static void mtd_device_release(struct kref *kref)
>>   {
>>   	struct mtd_info *mtd = container_of(kref, struct mtd_info, refcnt);
>>   	bool is_partition = mtd_is_partition(mtd);
>> +	void (*mtd_free)(struct mtd_info *mtd) = mtd->_free;
>>   
>>   	debugfs_remove_recursive(mtd->dbg.dfs_dir);
>>   
>> @@ -135,6 +136,9 @@ static void mtd_device_release(struct kref *kref)
>>   		memset(&mtd->dev, 0, sizeof(mtd->dev));
>>   
>>   	module_put(THIS_MODULE);
>> +
>> +	if (mtd_free)
>> +		mtd_free(mtd);
> 
> [Severity: Critical]
> Since struct mtd_info embeds a struct device, does freeing it here violate the
> Device Model lifecycle?
> 
> If user-space holds an open sysfs file for the device, the device core retains
> an elevated kobject reference count on mtd->dev even after device_unregister()
> returns.
> 
> If mtd_free() destroys the memory containing the embedded struct device, won't
> the device core access freed memory when put_device() is eventually called upon
> sysfs file closure?
> 
> 

Not new: mtd_info is embedded in the driver object for every MTD driver 
and is already freed on unbind. v3 will frees it later than today, so it 
is not worse. I plan to leave the sysfs lifetime out of this series.

> [Severity: High]
> Does this new mtd_free() hook cause a Use-After-Free in __put_mtd_device()?
> 
> Looking at __put_mtd_device() in drivers/mtd/mtdcore.c, we have:
> 
> 	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> 		kref_put(&master->refcnt, mtd_device_release);
> 
> 	module_put(master->owner);
> 
> 	/* must be the last as master can be freed in the _put_device */
> 	if (master->_put_device)
> 		master->_put_device(master);
> 
> If mtd_device_release() synchronously frees the master object, won't the
> subsequent dereferences of master->owner and master->_put_device access
> freed memory?
> 
> 

Agreed. v3 will reads master->owner first, calls ->_put_device() last 
and drops the module reference after it.

> [Severity: High]
> Will the master driver object leak if CONFIG_MTD_PARTITIONED_MASTER is disabled?
> 
> When CONFIG_MTD_PARTITIONED_MASTER is disabled, the master device itself is
> never registered via add_mtd_device(), so its refcount isn't incremented by
> openers or managed by __get_mtd_device() or __put_mtd_device().
> 
> If drivers no longer free their objects in the remove() callback and rely
> entirely on mtd_device_release(), how will the master driver object be freed
> when CONFIG_MTD_PARTITIONED_MASTER is disabled?
> 

Agreed. This comes from relying on mtd_device_release() to free the
driver object. In v3 spi-nor would own a kref and drop the registration
reference unconditionally in remove(), independent of what
mtd_device_unregister() does.

>>   }
>>   
>>   #define MTD_DEVICE_ATTR_RO(name) \
> 
> [ ... ]
> 
>> @@ -1471,6 +1478,9 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
>>   	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
>>   	adjinstr = *instr;
>>   
>> +	if (master->removed)
>> +		return -ENODEV;
>> +
>> [Severity: High]
> Is this lockless check sufficient to prevent the Use-After-Free this patch
> aims to solve?
> 
> If mtd_erase() checks master->removed and it evaluates to false, the thread
> could be preempted.
> 
> If a concurrent driver unbind executes the driver's remove() callback,
> drains in-flight operations, sets master->removed = true, and then the device
> model tears down devm-managed resources, wouldn't the preempted MTD thread
> resume and call master->_erase() on freed devm memory and a powered-down bus?
> 

Agreed. v3 would drop the flag from the core. spi-nor would set its own
removed flag under nor->lock in remove(), and prep_and_lock*() would
re-check it after taking the lock, so a waiter blocked on the lock sees
it and returns -ENODEV.

>>   	if (!mtd->erasesize || !master->_erase)
>>   		return -ENOTSUPP;
>>
> 

Thanks,
Tze Yee

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
