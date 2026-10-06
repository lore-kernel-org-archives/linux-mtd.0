Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57489CA5FF0
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2026 02:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:Subject:From:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FA+6XN5W6Jn8Hea6s0KbJJJJTICSNJryLJZYp56knjM=; b=3Tr/VCbbsWNgcHb1kPv0pKSzO4
	PqP6Gwmj9a92YCYRpHP/ROrV6twH20d9UJ4dCV50A+YN3MGXRhJPC68QQ9yCb16FsVAWaHI+tuM0F
	MFgEnVUA6qxz6gUojYnsjFq+p6u2m9U5tkFSIcISdxq9Aqg9SjI2b1cAQn+btibkTj124c04KXzY9
	MXTHa8dkybAETnVJkRTKgbXMvaEDjri0XHrQ98ugkI7vaJAT8b4qLnIBiFu8qLBMb8RyOvJJIJ13w
	QPsvtJHraFDYPUfzlkNxeOFh3M45/+YmZt87zR9mbVhpk/WIIYt4Rr5z379JIezU8dta1V/TJhkoa
	tS9iS1yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDugo-0000000HULe-0rom;
	Tue, 06 Oct 2026 02:13:58 +0000
Received: from mail-westcentralusazon11010068.outbound.protection.outlook.com ([40.93.198.68] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDugl-0000000HULA-2TiI
	for linux-mtd@lists.infradead.org;
	Tue, 06 Oct 2026 02:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtC/9GMk5AkaOA/B9xo3ScgcI0R74xpMboO0EI4oSl4R0VLGfS9ijqeI9BrNUEfeIhPdn6VHnEJqcBaEW4bYKj/CqmVXzy7GXyiDaTft4EklEl4CQLoHCWPNCR2rNniwyKdeNaiZ3BkIIx+OTx0tQf0lSMj7QRZr7ap3QG3Q9yz4kUt0vZLHA5BDGVrtI6ljTst16KVquty/ZPwdHbelZvQETu3VsGsrP4vdHxmMNwOfwlU1e5jRen3ByRe2E0HWwB+SjtJOu/1c3qALWOXnETSufqWaYs14bDrfbL6k04VOeO1npG22Vm963B11+HXEH7oXkMnZHHbOaaEHD1C3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gkwF64Pa+rkMmSN32uAQ+exkAUs0d6CN5e9PeduGSM=;
 b=Iq4g1Uw07OUxDjWQyvHmpMP/G2GQfxcTlB9OvlhEqayl0tAC2Ll1jiCr7J5hCLdS7zD4FIOoRpEcpGKm97xmeaHHxiUJvS48UlLvXzJcuFmctzQl2oz54P3PYqUAxW9EVkKGPhen8RazsdSPqcJI81nKpheIToPy9jQ+6RZncztO4lpWHt0DCycC2yuHP11jrhFQtiImxTnNNuRpepW2I9lEv0RJDWdQscAoxiKtuFLw1y8g9qP8vSq7147zTUqfVI3YcCIs2GK/e0Uj0MkrmPlFsrx7nFnEyAeZbT3soe4DvVuT9q6+PxIBknMqvpUTQ9SKSTuZExJjyqkrFdfttA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gkwF64Pa+rkMmSN32uAQ+exkAUs0d6CN5e9PeduGSM=;
 b=l5V5lOaea6JkotN3hNT4sCMYitR4h+GXE0wM+m7uu4hLEB1WxwurNvY4IjYH2Upfl0fhFZZAt6ypQXqS3PbfDhh5rnpvExuCQ/d5YR5jbjWX+8L9ogqbKnXz1Yq08j5PP7XYGewxB0IydrtL0nlVbLcj6Xi6nvKbNGVBAPpbHB7o06zTF4MI1pLsJh/aKOT/GZE16f2b+6b+EuoWemVHBe3W0NnpxJ8BoOmbBnD3cUWLwje+j116k01C+I/rwpkfLW3Ua4fPtpDHaGebiaCgIr0RBPGbTfXkcFXg5091usFNVWaAYfOgi6ieYOiHRfQB99Dg512yEnNR5+NjJdWWgw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SA1PR03MB156663.namprd03.prod.outlook.com (2603:10b6:806:5a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 02:13:49 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 02:13:49 +0000
Message-ID: <9baf125f-bd02-4523-a23b-516f567f3777@altera.com>
Date: Tue, 6 Oct 2026 10:13:43 +0800
User-Agent: Mozilla Thunderbird
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix deadlock in
 spi_nor_rww_start_exclusive()
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1788404586.git.tze.yee.ng@altera.com>
 <46e4e2e31f051f64c120307216ce2766c004d9af.1788404586.git.tze.yee.ng@altera.com>
 <DLKSSLURXYDB.2VSDOA0K7U9MN@kernel.org>
Content-Language: en-US
In-Reply-To: <DLKSSLURXYDB.2VSDOA0K7U9MN@kernel.org>
X-ClientProxiedBy: SG2PR01CA0196.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::23) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|SA1PR03MB156663:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9df784-048a-4f50-9391-08df234f7599
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|55112099003|10067099003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: NiAl8ttdgD3uir0TYdvzz5H41RvTOL9LMHXlcu5+oMe3muEXBr10p5jcZpaR4xg3Hk2Wxn1PwplFruXTnf6m2B5wDCa6xOUo0NoV8GerwiBNoEMSEFrEI+Z8wNuyipZwz/wFN5ZzzhY3jfl42RP8ruhOCHKahyaIeq7t2WWHFTN0+gZoPXkuXrpRcizafUM+p+aGfQwXY1jKErq4zjqNHybapOEyWYZVRjMS3EzfZtJIzYBx2gGib5NvEWzDKN0O8P5RYG5jqDAN0hZy9Q/Tn/VE6NNk5HfCqwXhEsxwZE9BmumA1L50BpALpVcdvgy8EMshPmdsAbkP8sKyAHV3RWdtqI6mBMZ/6UrYkn9yuN1qrFUWymbN3oc5a9dtVdH6Bu888FIq3VMGzqVVfRKtYOFQBJhM/BhbT4pvAGe1YoDMnOJb/SHOEwKuC/Sj3PLDlon1ocLcV6SB8iVSuT6HmLZISIMfm17Ciwgo9ETZf4uv1ocUxpLPt5I3vcHGv72G3i4WUIZjLVITOVjmprnZhmANBcpZ3dtlMLtyTy5E78l5DSqQMOvXFbNgU7CbYSbsT2CLnPoRqpq4KM+am4h7LA1ksWm6SUj2EO8X1fKGXbNdKf+Q/ExZ9W78ibiOfd5DBg1tYnvrGg7mjDts6YVvwzxvk7z6LgOyrHR7lOOzyNs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(55112099003)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUFOLzJnYmdMZ3RpeVhNMUdOemVVVi9uSmFiRUx1UGZZRlVjekdWL2ZWSC9j?=
 =?utf-8?B?bEJ1S2JVNUVJS3NrMnVFTm14cjhzbjdvNC9oKzlBQ0JHMUVjcUJJelRFbzdL?=
 =?utf-8?B?em9YTU0yVVZIRFJuODBxL1hPRktxbjJSQlZMWVYyZFp4cHpYUFh5QitmN3pO?=
 =?utf-8?B?MjBFVGxLTEtMQmVTV0RLTkVvL0RDU01VdENDVTVuVHdwYWx3cHVrWURNY0x5?=
 =?utf-8?B?V0drcEpMVkw4ZHQxNXJONW1IMTY2ZG9YZHRNNGhuVEdOZHJod2h4akJnTU1E?=
 =?utf-8?B?UEQ4dEZXSkZlSjY2MjNuYm45OU83MEp6L2NUMTNrQlhJcDhCYzZSVmU1Qyto?=
 =?utf-8?B?eVFnK1hEYTFMSFhtaEk2Q0Q4QUlSM1NobzZ0QU1qZ0Q2Q2JSdXVCd2tlUUF0?=
 =?utf-8?B?YVFlTzdzUTVza0FEeVhBSkJjQ1FxeTkxSGZKRFRmR1R2WEc2Yk9OMVc3RkNB?=
 =?utf-8?B?VjZaL3dmYXVoQTF0bGZaVUxmK0ltK0Y3MlM3cm15TnVSQUdiYUkxR2diMHJX?=
 =?utf-8?B?OWg1ZHM2TkxNbW40VFAzL2h4SG05VG9oUXhmRHc3MlcxQWVvVDBSZTlTa3ht?=
 =?utf-8?B?a3QySEI3ekQ1ajlzVFJwSXY2bWxoZTUrcWZJd0V4UHlaMmJsVktQaGFpZFpu?=
 =?utf-8?B?VmlVZXA1L1RSUk00a05oR1hWUDVvbHg0SzRZV29NWGx5RHBxMTFEUitLcVha?=
 =?utf-8?B?SjYzOXBRbE1SWmZkeklhY0lteW1ORHNUeFFpalVOWXJHclRaVFJSbzNCL1Mx?=
 =?utf-8?B?d05QY2ROaWdMM0h1TXc1a0t0RjNnNEJwcU5JRHFETUZ1d29zSm5QaXZ6RVZS?=
 =?utf-8?B?dmlUNHdlZ0V6Y1dDMEJVeXBqc2VHb3lZQ2dDUE9WNlRrOU52cDBTampreG5s?=
 =?utf-8?B?ODI4RForbWU2U0w3WENvMVZEQk1JUDNyR1A5RVR3b25WaklhQW9HWG9iMGxs?=
 =?utf-8?B?QkczYjRDQW5UZk1BYnBqN3ozOXJhV3N3eDZSN3F5OVV5MHlwUWIyWlEzUEsx?=
 =?utf-8?B?cTZhM3hBU1Y0TmtPb0NkRENYUEZYS2lDR252Z2xJV000anE5ODJocXhWdklu?=
 =?utf-8?B?b3B3QWtsNFlodnVtSGRtenQzVTA3TTlHMlRMTnhwd1lDMGVZMk42aXdYSmx5?=
 =?utf-8?B?ZnVNUmNjMEVHekpiQkJDaTlsTUcwNW40dksyUlRMUHJlYUFSVENYVk40Rk55?=
 =?utf-8?B?c0JudHFON0VWdGM5YUt1eWV0QW1TY2E1SG9WbkRLN0JsVUovUWE2bEZxQjl1?=
 =?utf-8?B?a1dQU2VNa3QrU08reElDM3ZMbThxTURqVG44Zk96em1xdFljT3ZPaGJDTzBl?=
 =?utf-8?B?T3hCaXNmd0NrMXVZL3Bxa1FibnhtRC9NbUhBbW56TzBpcWRaV2doOGkwd3Jp?=
 =?utf-8?B?bmxla1BHK1BoUnl5Z0R6WU9yK2dEVlhMSmZOdldESVF5TThycUsrSHBlNUs1?=
 =?utf-8?B?U2QxTlJyS1U4VDBneHVBUVNSckh1ZTVJV1FIcEhTb09Td2RsczlINHkvL1BO?=
 =?utf-8?B?OWRmSWh6NmFmREt0YTRFbW8zWFdhQzJ4YXlXR1dVRWdSaGx3aWxZMVJNeVZ1?=
 =?utf-8?B?TWthQnNJS1ZpMVBPQU0yajFSWXRIUmtIY0VwejI1THRPMFRVYVA0S1dCa1ZW?=
 =?utf-8?B?a2hLVE9waFMvQXZWci9KMFRXRFRnaDFuUU1haFdaRVN5c2tDckhNbDUrWG50?=
 =?utf-8?B?V29odTZmR2ZOK2cwOXhJeTQyVy90STNiclBEclo1bHNhcGwyNktZeUVRTGtS?=
 =?utf-8?B?MFNudUV4aURVS1FUQ3VwVk90MUxscmFaMWdST0NYUS96RG5OdFdOakZhV0d1?=
 =?utf-8?B?SUYxNFVHdmZlKzlTYnV5bmZrSUxoWmNuODhjLzYrdEEyVWZLOWRrNkNoczRU?=
 =?utf-8?B?Z0wrVm5ZUEZhR3pmRTZMUmZ4MXd4NGdyOHlxQ2lkTmhEUnJzVTNPemFDcVZZ?=
 =?utf-8?B?TTBRaE5oOXZXVG1jeDdkc1JNNkFCSVlZUnFxWjJBNlZsL2xRQkZjVXhMR3Rh?=
 =?utf-8?B?L0ZEd3hTZGIvUmZwMmJyd05CaTA1OXY1M3RsVUswbU1PY0lXOWlwNzJtZ3BI?=
 =?utf-8?B?Z09Vdm5UUUlNOWZXWWliZTFiUjdyaGJUM3ZBVnkySTkzR2orbSs4cGdZZFNs?=
 =?utf-8?B?eWFIKzRQdnR5QmF3NjJISS9mV3Z3eTIyVk10cy96bVpSWCtuY3N2alJ1aldB?=
 =?utf-8?B?WmFabnpRUUFHL2pueDZ2UXdEdkhlUWx3bGhFOThaN1A4ZGUrMy90SUdLOXFj?=
 =?utf-8?B?emhmK0xKMWJzZXhwci9GbWRmVTN1TlJIQnpsU2NVbU02RXVPNWlabjhRbFlD?=
 =?utf-8?B?UkRPTXZjRG9teTVyYlpwZUtXd0VnNFlhNm9FcFZzVEdFTFB4VFZsQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9df784-048a-4f50-9391-08df234f7599
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 02:13:49.5762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5guqEvN2t92eo13T75s4SlY/poCj1F4HEX0exU6DZ5wK/5EpeX8zBlwDnpBizqUVbZH5lUwg6nHyncSwQre5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB156663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_191355_657708_13832779 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 21/9/2026 2:58 pm, Michael Walle wrote:
> On Thu Sep 3, 2026 at 5:14 AM CEST, tze.yee.ng wrote:
>> From: Tze Yee Ng <tze.yee.ng@altera.com>
>>
>> spi_nor_rww_start_exclusive() takes nor->lock with a bare mutex_lock()
>> and returns with it held, while its counterpart
>> spi_nor_rww_end_exclusive() re-acquires nor->lock via guard(mutex). Any
>> exclusive operation on a read-while-write (SNOR_F_RWW) part thus
>> deadlocks against itself.
>>
>> The exclusive section is serialized by the rww ongoing_io/rd/pe flags,
>> so take nor->lock with guard(mutex) like the sibling start helpers.
>>
>> Fixes: 03e7bb864d9a9 ("mtd: spi-nor: use scope-based mutex cleanup helpers")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> This was already fixed in:
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?id=44b8a0bf5f96e8393312fc34b956766882341f16
> 
> -michael

Thanks Michael, you're right. I missed that commit. I'll drop this patch 
and resend the use-after-free fix (patch 2/2) standalone as v2.

Thanks,
Tze Yee

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
