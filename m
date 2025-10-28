Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C546FCCF9E5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 02:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6o1jjSnMIecWMrgwoZbiYF7sUfoAxY1zXKV8yTGeHA8=; b=bZNwU3hIj8OmSLlqWniFhHv/Y8
	ayfVSGwlxQzmFHxzOoNOrIWXkf6dBKFVtHLUAAKM4IsAYkVrYHHp4/r1Jc7AArhbNnnVroJ+RueSU
	qVS0MxuohFQJtF1+pPVu2WZaf9r76CKh+HOQAIgKJvPoNtJzE//qIx661PvIgwv7Z8wjdyt2NZzDR
	Cob0q1GNvKUDzHH/h6CooTuBXkhIdBCdmO6mnTS3BgbXx9EVOy0GCFAYTBKrOiOo5bI4k7QPUOlJ3
	5Lz/PMWRCY0v9OBs/bmOQytvRxroEnQ8SyBHsF8HsLdd2x03NRCZfimGDe9yjK9L+wpG+0eNwT8/G
	iyxbwsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDZMi-0000000F7Mc-1j6M;
	Tue, 28 Oct 2025 02:23:16 +0000
Received: from mail-centralusazon11011022.outbound.protection.outlook.com ([52.101.62.22] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDZMg-0000000F7MH-1Wrv
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 02:23:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNkGF32ODbaqmUCYqaigYW2XQhZ81se59VIBT4SYgt+98NMch5kKcsCUmmhZdAXslJUVZIWcI9UZoHzGP+cDquTvRMj4cNnegkXE8m25gT7jqSN/2PEXaJ9thAPMK+7DytB50X3to0L9FOijTTRiZW/702Fyfg9rLofGxPEFEZPxfqnkL+1C0SivIpP+LCpwJZF8fi4WHw23RLfaFK0Pf2Ok0r/19TA7epYfLsyNEqJgkn+9tDcn9Bp1zm+YTDYipQXo7p1gjLYUuZ2NZGfODONhSHFvuESYTcK/q2Fr/pIdjSIpMFZguaV/srXpGjq5dTaBS8fx4LvV39h0mooOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FM2rsBn5uM2ZhAfaCaucKVHSVqk+wKBXysLjElHORCk=;
 b=vEYykpBKwQyWnv/N1sR+DTB2SfHa5mrABKz+8swe1bWjGlI3xMxOtbBl/4ox4AMr9ny9OPuBIblues3GPlHhqtvAg0DHropNI1pzutR2U2LIMcFKusoB+h5XLl3IGN1dSa0QNl0nWboR4FodO5lx+CCUokhiLCC+/xsiLqkCWC8932/g6X8NTjPYuumMPmP0R+ZtAnqKnaium1qrHvG3YBZbuDNhAhAvUaFUhWCUyStDNePVEAbOvqYVutWY3Tdm8O8jhK+ETUp9Yh/fud4THWdEiKAq58GSyIBsxSTIbDSredf+8zlBueAfrfkd7bxvGfUJhVtOkUb8V5OtQ3NacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM2rsBn5uM2ZhAfaCaucKVHSVqk+wKBXysLjElHORCk=;
 b=duSH2IeJYsvIXRPA0KzXNJyD/I5pd+XdRFr2JieHZ8R7P8lCocK/f4rFRM+wSHVZ+3RYKRDPzpFfyLJvgNwjufOUbe0fPZvkY0UM/HQHSNfqsxSV/CF4KqnsPRwqm+1y1pLCIvk24G3a9NPor8DHuytPO/HIWTkKQ074CwMVTBH/L2MSE0KhWeqdvHKzueahGocUSnmh2CNtbugKHfWQlyzQqP04yBzry7rjR+n/F3L+pvAInRuk7hiY5gW0OTlyb8oe2apADVqNlLKo4+HWGtFJq6DXFLzrdFsTOd5Ij1ekx+5GHqa+nnAN/hQriRjpjqrMsU50RmniJVXWM+JZ7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BL1PR03MB6037.namprd03.prod.outlook.com (2603:10b6:208:309::10)
 by SN7PR03MB7182.namprd03.prod.outlook.com (2603:10b6:806:2e4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 02:23:07 +0000
Received: from BL1PR03MB6037.namprd03.prod.outlook.com
 ([fe80::9413:f1a2:1d92:93f1]) by BL1PR03MB6037.namprd03.prod.outlook.com
 ([fe80::9413:f1a2:1d92:93f1%3]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 02:23:07 +0000
Message-ID: <7d06186d-a246-4ce8-91c6-0f1e3f3597ff@altera.com>
Date: Tue, 28 Oct 2025 10:23:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] mtd: rawnand: cadence: fix DMA device NULL pointer
 dereference
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-mtd@lists.infradead.org
References: <aP8S9oEgMv6PXzax@stanley.mountain>
Content-Language: en-US
From: Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
In-Reply-To: <aP8S9oEgMv6PXzax@stanley.mountain>
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To BL1PR03MB6037.namprd03.prod.outlook.com
 (2603:10b6:208:309::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR03MB6037:EE_|SN7PR03MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: 3618a5d4-3858-4b16-661e-08de15c8ee6f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk0rZ1dwbVI0V2twTllyUUoyU3kraFk3Qlc0TWVmY0NkcEVDb1gxTUs1M3R4?=
 =?utf-8?B?aHRzTWxMTXQ2UmplN3dtUW1qMEhtZmg5bGJrSGFYdlo1T0hZWS9TdTMzdURa?=
 =?utf-8?B?OEZ5VmNld3pZZjI5RGdzYnFGYTdJY09hRGZVWGNmMk8waXZjdXN5WG5ZUDEw?=
 =?utf-8?B?WXBvdDZFTlR0eVlueTRYVGVUMDlUTGhBZmxYODRteDhGNU56RmFzRjlMbEsw?=
 =?utf-8?B?MVZ3VTNza0FNemd3S0ZkM2VlNWo5MGY3bHluNkJoWVNRZG43MVU2ODlaY3Yw?=
 =?utf-8?B?OWFnR3kwRlRjMTl1N29OMTdzNDBOWGlxVDZlMUVUbmtYcnZDd05Jdm4wWlFZ?=
 =?utf-8?B?azBGSk1MUjM3SmZzVGhJZzZpdDcrSEpiTk5mWXVaRlhadXZKdjZPWCt6c3R4?=
 =?utf-8?B?U3ZVb2tKYmpaOGlQV3oweUNJTUZGMzVIaDF0THhZL3VTdUFzcFF2UFdRRlBX?=
 =?utf-8?B?bmFOS2lyekxTdmtkckkrcitUVlpaZUliVkY5QUZXMHV1L1ROMGFGVCtkQWt2?=
 =?utf-8?B?Q1NiaC9aNXdUQ3VBMStFTVdxamwyZVI0NUhycm5Nam4zZFU2Q0NSWldLNll3?=
 =?utf-8?B?VEdmdHVkUnVWdzllanBEZVQ3ZFVnRlJydW8vMnpIZjFQRTZHZ0VqRFNVU3J3?=
 =?utf-8?B?V0lqdTNQeEpIeHpjZ01mejR0YlF0eGJKYiswM1NYOVMwM1V0bnV4OFg2bFU2?=
 =?utf-8?B?dThRaGpOd0lXOW9kYk1Ib3hxVkM0ZWdVOWUyaFMvQkJ2ZWZhaEFudGg2Qy9j?=
 =?utf-8?B?UnZ1bVJ4UDJkMDVCdjk5R0hoRSsvNzd0L2tVZCtQbFZqWHh4VFFKNDBoSEcr?=
 =?utf-8?B?LzJVRklqSkxJYnROQWM3LzRDSzZnQ05tWVdrVzc1UFJzVlV1UFdNV0tSMTM4?=
 =?utf-8?B?S2NuVGZTT2lNN2ZRY0NNa09wSitXOHJzek9ocG1NOTlJNjhoWG5PSTJhNWl0?=
 =?utf-8?B?RURXc0hmV3EwRU13Yi9RRlhMYTVNTERuL3JwWTltRElyVlE0WStkbGhwNXRC?=
 =?utf-8?B?MVJZa3loNnlMV1phdDFYcG9hdnZZVis1RFBtVjVFdFg3T200OFA0ZzdzbkF5?=
 =?utf-8?B?QWNpMlJXWlFKbExqYm5ubTFTdEtSaVViMFZ5OGNWSUgrQXN3dTV6WXhMTjRJ?=
 =?utf-8?B?Vm1aRzNWWDhlb2JyeWpWUjJOSkRsNDFzYnp2YVRmQTIreG1uMGVlVUQwR01L?=
 =?utf-8?B?K05vbVovb1JobC9URkZMRDZMbHNPbjk5RGR4eXJNUmFHeXNqM3l2VHZaU3NN?=
 =?utf-8?B?Q29yNmtkRjhRMWxJdTM1cWFBK3ZhbGVaVUd6QXVXT1JnY053SXlVa2p4YjVa?=
 =?utf-8?B?SGw3UzlnNGwyRnF5c2dDc3hIOWs2K1Bleld6aytEclhMY01jaVFXZnZZc3FU?=
 =?utf-8?B?VmRYSitxbVB5WDRLbURHNlhYdkdLWE9NeHJMY1UxcUlkTWRWbmlITGY5Nkhu?=
 =?utf-8?B?S3VKNzhNeDlReFk1VE5ZcGwwb3RDaExCSDNQd3U3VFNOc296aXRzeThQa2pB?=
 =?utf-8?B?dm82bmE5TlFQRWllYTFKbHlqOFdTVXpwQ2lzMExCQmJUb0I5RE96TXdGZGVt?=
 =?utf-8?B?SHZ2dGxtNEdBczNUYUtMU1MyaEN5cTJ5N2J5WENFK3Jib0k1QS9yem1tbk4z?=
 =?utf-8?B?Um8vOFRUWWt4RWowZjR3dGtiZDloRGFpTEJBSWQ5SEVrVGxPVzc2a3Zmd1Zo?=
 =?utf-8?B?RFFqcWsrMjhzT0swWDRZeWRBNDBYTDAwUTdiNzRMMDJPUHFiUnFqT1ZrZDdX?=
 =?utf-8?B?dWFyRFBzQzRWaWtBVE52TFRDNjFhMlF4MGx0OXdMK3hCUkExMUl5QkNQc0tl?=
 =?utf-8?B?eGNnQkRJZVRCSmFWSE14ZGxzYkRCSzMyUWxXcXEzdE1BUVc1MVowY09oZFJQ?=
 =?utf-8?B?WXBkVTJuekplREVRRXh5T0FWN3VSTkxUNExmS2xyVWw4N3JGVVptcHZQK1Fn?=
 =?utf-8?Q?dtDufqfbKG+w8hs2PSqXIyFzQl62ndTA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR03MB6037.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2V1R05hVEduZGN2UHFWdno2Z3o1TTJOWENUWGRsVjRqL0IwUVhaakVKcERX?=
 =?utf-8?B?RDFtRmNoZGRZTmFwTGpXb2hCdGdmOFlBNDZ3RVMxY2xZTlBuVGdLMmwxYkly?=
 =?utf-8?B?a1R5RjVGTEk1czdReFIxU0tuM0czR2h0b0l1bHNkVlhleXFRSGM5Z2lncjRC?=
 =?utf-8?B?TVRybEg3eGUvMGNIQ0tMSndqK2xqQmt0a3d0TkxvSWJaakpJYVFWNUE2L21y?=
 =?utf-8?B?eHpuRE1YRmJWK0pxdWZLV1VzQ2s2MXl4RDFCRkhKS2RtLzFUVGdHOWl1djNJ?=
 =?utf-8?B?ZFFtWFlMelJtS3ZqNytlRnYvQWlJTVlFQkJrOGhDemZKNjVncUJSWjJtMzY2?=
 =?utf-8?B?aC90SVZUbFp6R2xpQVo0TGNvU3dpMFNEV0NiZGdYTGV3UGRtK29ha1M2OXl4?=
 =?utf-8?B?REM3NmRCSmljb0ExZlFlbWR6VUpJeDJKcWNGL3FCeTd5OTQzREJPTXRraDBl?=
 =?utf-8?B?VE9XUWVaNUZ3UTQrTTJrcmptLzdMSWhCcXZraTNQb25mZXhpRGMvd2FXLzI5?=
 =?utf-8?B?ZEs1MllKcVo1NDlDUUdEckdZS1RGeGhSaVd0aXVPZm9pS1hvZUNlQitzbmxx?=
 =?utf-8?B?VDMvenU4Vzlad01MVGN6aEwxZ1ZEMlZQc0wxaVoySytSN0V0WDdmR2tUTm0y?=
 =?utf-8?B?WHNFSUx1dUljbm5MamVQMllIa05FYSt3R3FCTlUvOE9NblJTNHgzYzRac3BK?=
 =?utf-8?B?OEYyd09NYklnd2lYTUZIRDNxTGMwUDdrbllZS2FoUjZHVnpoa25tbGpNL21U?=
 =?utf-8?B?eW5XNEMxYUhROHA5dmszUVc4a2p4SmdXNlpncUJ1cnVXakpNUmF6dU1wRmZr?=
 =?utf-8?B?emxuVzFjRzFNZTJHeE4rUENEQzl0NTZSQWdZMit5RDZiVXA5bW5vTjNZUUhW?=
 =?utf-8?B?b2xHcXM0UjN3WWNQL083Wk02MmJOb3Z3V2lEL1ZaWUxWUk1TN1ljcG5sM1cy?=
 =?utf-8?B?dHQvcW1SV2M2V25SU1FrOENMaW4zcS9Rb0pHVEZjb3hUbGJEODNsUUN3WGtD?=
 =?utf-8?B?a2d3b09CZmZvSzN4eUlNK3Z4c2pidGtmTlpCUERSQ1NmMWxWM0hjcjh3YWV5?=
 =?utf-8?B?UnFsOGVYYzZwLzZ6RTRheVpKWktoRWtDQ09PcTBXNTFEbWV2M3B3MTRNRVlq?=
 =?utf-8?B?aytvSm5RRDBEUy9ubFBqZ0tiNkRIRFppcTBnaFRKcGNlbEZBQkpPQklkVVY3?=
 =?utf-8?B?NXN5cW9IRE9mTiszVjBHQW85SDZ2dlVFSG1VWVRJY2ZjR0ZhVUhveXJmbTNr?=
 =?utf-8?B?STRDaDdmYTJ4b21nL0tNY2tTSmVIZDVNVHI0b21JazhHdEY0bkd4SW9MRkxE?=
 =?utf-8?B?SEZ6clBYa0NwanhVUDNhZGVMaS9ESVIydS9NTSt5cTd5SUxzai81c3ZKdUFW?=
 =?utf-8?B?L0lld3ZzZExyTUlDdXNGcTlUTFV2WTdMZ0pqemd3VU1UUXBPWlJCMmtYV1Zn?=
 =?utf-8?B?TStrV2lQdlV4aTgyMEZXV2RjbHIvd0J1UG1La3JUUDBpdE5RcFpNMmRKZXdw?=
 =?utf-8?B?Sjl3WnV4OTNobnUrc3FZRmlodFhjc0lza2lxc0JVWkhHdTBZS2NUc0FkSlNa?=
 =?utf-8?B?L2xRaEZmbjllb1REQ2ZraHF0RkVGLzl4VWhINDVVLzYzMXkwdWVONURpOVBw?=
 =?utf-8?B?Wk5jcDhBQlZ2WEZmV0sxNEZVQ0x5TGhteVY3VGthbEVCeDU3M3ZqUllzeC9B?=
 =?utf-8?B?alJlZGx2YndySkVqOUQrdzllcHA4RXdhYnFWR0pDRFJ6QWVBVFE2b2dQTzdk?=
 =?utf-8?B?dE52TWZnN2RFSVlHSWltUUh6ZFM2RTQ3ZE4vOS8ydlA4Z2pzR2RlQXVzcUhh?=
 =?utf-8?B?Mis4OUFlUUFCSXpGeEM0TzZrVjErYWlWRTMxeXJMbWkxVkpMRXZ2cnZ0UFAx?=
 =?utf-8?B?NnB5WjJqZEdENThCdldoRFlneGw2alRFRTJLNExsb1pOREt5WHNGdXYzMlcx?=
 =?utf-8?B?ZUJtRERWNDByd2lFNjFTNm52VkhFQXgzdldrWEcrYmJDZlpjU2Q3bUFVU2lx?=
 =?utf-8?B?WWo3YjErTkZybURRSDJlOWVSNDBMTjd4cmpaT3BtMlVmY1g3YXRHV1ljWUdB?=
 =?utf-8?B?MkFNeWdFL1lyZjRQV3Bkdmoyd2FjSUl4Q29rSkNiSVl1M0UvQmNHUm1oV1Uw?=
 =?utf-8?B?UjFIUXd5QytlQTQ0TjZDdUwrRldBZ2RnUVVVMDRvZGtFN05PVUlPcDBSdlJu?=
 =?utf-8?Q?rKIUgZvBzKhcq7dEWGiuF3o=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3618a5d4-3858-4b16-661e-08de15c8ee6f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR03MB6037.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 02:23:07.4451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWngFfCUsN4NQHQOK9McMTSUxKBjof02HxoRNsj1LUggGxI8YeDLWSepNtFys0YgU5cBld0N5ohNu/0G3MQCv+rktiJPKnLFgYmclPTGqd+05oB8vtch1mSuedGHEf0R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_192314_473827_F801E181 
X-CRM114-Status: GOOD (  10.02  )
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



On 27/10/2025 2:36 pm, Dan Carpenter wrote:
> Hello Niravkumar L Rabara,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> Commit 5c56bf214af8 ("mtd: rawnand: cadence: fix DMA device NULL
> pointer dereference") from Oct 23, 2025, leads to the following
> Smatch complaint:
> 
>      drivers/mtd/nand/raw/cadence-nand-controller.c:2956 cadence_nand_init()
>      warn: variable dereferenced before check 'cdns_ctrl->dmac' (see line 2918)
> 
> drivers/mtd/nand/raw/cadence-nand-controller.c
>    2909          if (cdns_ctrl->caps1->has_dma) {
>    2910                  cdns_ctrl->dmac = dma_request_chan_by_mask(&mask);
>                          ^^^^^^^^^^^^^^^
> This is only set sometimes
> 
> 
>    2911                  if (IS_ERR(cdns_ctrl->dmac)) {
>    2912                          ret = dev_err_probe(cdns_ctrl->dev, PTR_ERR(cdns_ctrl->dmac),
>    2913                                              "%d: Failed to get a DMA channel\n", ret);
>    2914                          goto disable_irq;
>    2915                  }
>    2916          }
>    2917
>    2918          dma_dev = cdns_ctrl->dmac->device;
>                            ^^^^^^^^^^^^^^^^^
> Potential NULL dereference
> 
>    2919          cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
>    2920                                                    cdns_ctrl->io.size,

>    2954
>    2955  dma_release_chnl:
>    2956          if (cdns_ctrl->dmac)
>                      ^^^^^^^^^^^^^^^
> Checked here, after dereference.
> 
>    2957                  dma_release_channel(cdns_ctrl->dmac);
>    2958
> 
> 
> regards,
> dan carpenter

Dan thanks for the bug report, next time I will make sure to check using 
smatch before submitting the patch.

I will submit a patch to fix this.

Thanks,
Nirav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
