Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239AFC27C6E
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2024 11:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hvY8E54w8Kh3z1cQgsSd0h747aRv9WgxejEAASe74I=; b=u/pb7mjtT2eaPuL0bPVxJbyZ8K
	JyAIAa9p/6I2+MnVd6DGI2PZvuwDZFaOrwV2G2YufqDCp53WVQEOypYkutXaPkXgC8VH/hp7Cw6i6
	rbs8wbkMwyV0gFQ2OYq4yWmlX/O1/0DVbsdk00QRBmHxQoFjaYEV4ysbroDAbdY1gGHPXwijzSUkh
	pMTDdDXh5IcnopevLxIwbF3m93uURwk21CX0baQIzpt/vBAdo/z9Jsd4jVZ8/nJmXpvR6SZYaIsOk
	Hkl0o17y+aZTE4qhckj0iQuns5C9oYYvf3184byEJYZqE6bo9BIIMXqe9J5+xgm6Ews23qD9TJIEc
	6/mB8l7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI5Kb-00000002dMH-3a9X;
	Fri, 14 Jun 2024 11:42:57 +0000
Received: from mail-db3eur04on0617.outbound.protection.outlook.com ([2a01:111:f400:fe0c::617] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI5KY-00000002dJh-09hi
	for linux-mtd@lists.infradead.org;
	Fri, 14 Jun 2024 11:42:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3YuaGuC2f2hEu7yEU8ktzRiegg9bSWWADAvPNAhKSxvKgteAEPxbnkAaZYFU2236EyBumjoxOD/87TtL0MLHr1+vUUY3rHUY5kAa3kjAW4lnns1cNo8/EW+8BKNtICpP+UJQEbOcyO/qPY6VJj1N8yq/vkqtTtTNxRTMUC+K+lwfaIZ1snBxtIQe/N3GtrynWuX1GKk+eU6UCQPO/R7AB4w8SCC1CQ3iPwot0KkyJ603fzwpLEECljtZF6H7Ft3EU8L7/HGI45KjLzKbOkt4PNJPPY7FP6Az31csM5MG6LDVp+LR17/DJ1ck1zXIVhgrxF7RZyoCLdzdIFICC1j/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOSrefhLdzkIeaKMrkwQntWlO4WAUUUD9UkoeWNdPVo=;
 b=AzRE8PEk6NpMDhPheClNH7BHfnYtcFVvy4v+OMTYvsXOuXvWNdsQM9M6AuLwzuvLv4r9iQYP04+0s800tvrpANaDd+lhUtp0Ciy6tLp+mdnaWHBktS9OFBAuJaSJDmcX0M2YtzzUhrCUiHjXJ/pfZA0fmi74kXCFeHx50HjVN7OwVa69F+KIc+Q1juJwnVis7HCzg+Z1rYlJVh+l3Pa8aSLktIB+xKQn5E5PQ3rrqMHPjech7XS8hUokFN2AZEJpPl0WnIzEdon5fn+B6Ebr9AaQpp2VxZv5hfKBNwWgKPbVMrnnYjZJFYZDoIAIi1Bf2GmuRcJg+MRlcAmm1QXJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOSrefhLdzkIeaKMrkwQntWlO4WAUUUD9UkoeWNdPVo=;
 b=UWC/7+i1qipiICqK4g17Z9snepUPVrbqbaVCZczN6qVjAO2rEiTPwAY5BRqgGDYysbJCvYV5+sDgVimeKLkFA8iXDOQpHzsn3CEcXuoUG+ry5e7zu5/tQ2AWGmNeK4Vzh5XikEz0rc0+lWKHYhncqP5fgPz1WBrx1W4aQloDUfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
 by DB9PR02MB6924.eurprd02.prod.outlook.com (2603:10a6:10:22f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Fri, 14 Jun
 2024 11:42:39 +0000
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1]) by AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1%5]) with mapi id 15.20.7633.037; Fri, 14 Jun 2024
 11:42:38 +0000
Message-ID: <aad1b520-ee9e-476f-911b-45be9eb09195@axis.com>
Date: Fri, 14 Jun 2024 13:42:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Lots of fastmap writes
To: Zhihao Cheng <chengzhihao1@huawei.com>, richard@nod.at,
 linux-mtd@lists.infradead.org
Cc: rickard314.andersson@gmail.com
References: <f59e5ae3-8193-43f3-604c-9a846d6e8ead@axis.com>
 <95a9872f-77b2-e9a0-f5dc-a376964bc93e@huawei.com>
 <f92bb95d-05a1-315b-000c-5189004175d5@huawei.com>
Content-Language: en-US
From: Rickard X Andersson <rickaran@axis.com>
In-Reply-To: <f92bb95d-05a1-315b-000c-5189004175d5@huawei.com>
X-ClientProxiedBy: MM0P280CA0035.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::23) To AS8PR02MB9505.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a4::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9505:EE_|DB9PR02MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7f837d-c2fd-43fe-e018-08dc8c6717b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1ZKeE5JMVNLcEFTbnlXRjhUaDl5YkpVSi9JcU1zOWNhai9nb3A3OFFTbVdP?=
 =?utf-8?B?QzQ5QXpTZm5aNjRFZmpDc2JKc1JWSGQxOXE3Y0FkTHV0SEhZVWtYY0pLMXJ0?=
 =?utf-8?B?dnRxSHFYWDU1dE0xWDhWMUpkeDRwd29Kc05IQlhNZWVjMTFXbldqdndBdUor?=
 =?utf-8?B?bGdGSDdqM21IbFQ0WklIK3F3blgwNWxwZ1dJZXd4UjFQb0ZLb3VZM3grN0NK?=
 =?utf-8?B?UHBZUzl2eHRsRXBNMXdqbjlLUEtOZ2k3Qi9odkVodmJtRUVYbWRjdjRtcVpy?=
 =?utf-8?B?NEIrVXBXVHVUSXRVclFVTDBtSkxjRW56Ym1sYWJ1ZWJ2dkIwSHJNSEJoQkpx?=
 =?utf-8?B?OEVOTUZJMHAzSDZkUDZmaFdKZEhlWGVNUmN5Z1ZzZUJVQnVoWmtnYzhWWldE?=
 =?utf-8?B?SVREeXZMeGhuSHluakFVdkVBeDBGWEM5Tit1ajdlMFl2ZVBkeWFUSktCVExM?=
 =?utf-8?B?RG5jdW1PaXpKMitJZTUxZ1JEbE9oRHdCSWt1b0pleVhhcmxFVVJZbnFSa0JU?=
 =?utf-8?B?VzZZK1pzNW00VkNXTkIyK0xQcWovL0xhNk5YaEU3c0k5NjIxTjd4RksyWHB2?=
 =?utf-8?B?OGxIalZTdUJNUFJnQUMzUlpGL0RUY2NGVXRTd0tKNXlCU2w0M3NHOVE3N2l0?=
 =?utf-8?B?dkdnVFEyWUdEb3VwK0I5cVFnYWtlZklOcmV6NGlSQmxocGt1dS9GUnBGUFJ6?=
 =?utf-8?B?dklhL255MzhrOFE5RlBjR2RPT1VtdEJ2NTEwYXdqcGhTYXBqZ3JJOTloRWMz?=
 =?utf-8?B?MlZ2RmxMM0dKTmxHWDk3NUh5R2JySHRFTEF4bTduVjRJN1dUWkpZNC9TQ0l3?=
 =?utf-8?B?eTRlR1UySjgyS3hXMFVzOTl3ZEZNZmFmWU5FY29KNWtpaG1pbDhRWXZyV3Fa?=
 =?utf-8?B?NGp6NXN6S0pOQ3VwbGppdDIxZ0pzRnRnWGZnT0pIam9KeTF5Y0FmTG5PTjNV?=
 =?utf-8?B?c3Q4NDJzMXI1SnJoQjNBTGtyTXZrTHNKQW1vakZoNnJhM3I5UjJvY1JqNWZn?=
 =?utf-8?B?TTR0akVUSkh5bVFtQSs2WEVtb05pZDZrTnUvTXJsNkhFcE1PTENTNDVOKzFz?=
 =?utf-8?B?ZGN6MzY0bmZrVlQ1SmpZVktFeElvVFpLT05aV1kzVFlEZE1wQjZvUy8zbURI?=
 =?utf-8?B?NzFjM1pTeE5iRmM2Nk44YnVlU0kvSTZXU0hndlBHdzUxS0F2TWlkY2FUQit3?=
 =?utf-8?B?NFEvb1RNS250T1VUc2FzRXZoZkt5SzNTKzRYWjVkL3pWc2tZMko3a2E3Mnc1?=
 =?utf-8?B?WnJBTVBtWEFKMUl2ZWdaZnJTQ05sU2RmcllWb1p3U2FwTUlYRkR3aWdwdnVu?=
 =?utf-8?B?UEUyNFJXSUJzMFg4c3pEaU1iNnp2L0g2NG9LY1E4VXA5ZFIwY3RrMVJJdkpa?=
 =?utf-8?B?aGd0bWllcmVBU1hsQVBMeENlN25MVHpiMWVrYXFreVl0RWhIbnVtN2lqN2dT?=
 =?utf-8?B?WU5VWi9NSVQrRGxHZXNUSFZVVTFnR3VYS09YVHpoR2FjSzQwZWhYVVI0SDZG?=
 =?utf-8?B?SXFHbU5kaTV0WDJWZkVzcCtsZXF5cjdLK2cyUnpvVUYzMzBiWHJ5NlVVeDdm?=
 =?utf-8?B?RlhKdXpBREl3cEp5TjAzWkNxU1J5WU91YUhiQStyQkN5K0lLcm1Wd29EWVFj?=
 =?utf-8?B?QXJsVzcxN1BkNlcwWU9YS2oyK0htakJxRTg4dGxSbW9lVmozN3ZIUlNINDcz?=
 =?utf-8?B?ejRubVVnS0lEODF6c29BRFNNL2U3NHhjSWkyQVRpcmRrZmhPOFNrUmFCU3R1?=
 =?utf-8?Q?kwFbdgF7U+mWyaSHfUXRwA2EqjcWGnPnA15MCtw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9505.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V09oVTN2eU9PL3NUZ01HdHhwMVkyOG1TaWJSalp1NTBvYThHTitaT2lHUTdt?=
 =?utf-8?B?VEZpd0xWdUsrVVh3ZzU5UFNiRFRsUXVLWnMvU0NoTE5ZNlhpMGVta2hrQmhz?=
 =?utf-8?B?Nlo1bW41RUdRaEhEMXpJRHQ5YThDcTd1UXJuWUVnUG52VHVPa01IZ1VYaVRa?=
 =?utf-8?B?djVqa3llK21RWnR1WEhCYk1FMmN5b2lGNU5GZEFqNE1PUmwwTG1XU2trOHZv?=
 =?utf-8?B?M0Q3UERJVlZaRy9Gc0dzakl6T0w5UHFwNnB3K2dRRjZ5L2VVSE1VTDMrS0VH?=
 =?utf-8?B?MnJMNjgwVDU3Rnk4RjRYNmNucjd0bDJxbU9USGZYbFNSeUt5RG9qK0ZBYlBu?=
 =?utf-8?B?ak4vbSs3dWxtNWptRUQvSGxsL0ZLSGx0ZzlrREE5N2o5aDk0SzZNMlRtNjFC?=
 =?utf-8?B?d3FaWHkyRFhVbTlic1VvZWhZVE44cUVHQkY4MlpyMjVZeE1QSVNUc0tTOVdp?=
 =?utf-8?B?d0ZUZkpjeU5YdXR6eUZPVEdTdU1pTG9ORFYzcEEwMWx4bDhPWUVTMHNDY0Rw?=
 =?utf-8?B?YkxOSWlQWnMybnp4YUd3dzhwV2hFcW9wbFE2Zm5PSE5SbDUrbHJ1UGNHRnhP?=
 =?utf-8?B?RGVRNEpza1pGUGk1NmFKTkZGby9TNDM5cUlLS3JqbTRKTWxRNlhTbGFEcFlr?=
 =?utf-8?B?WU1tV3VmaStTbGxOMkVWeS9rSFdOVzE3clRXWllPemJPSEY2bjlaRHE5WlVw?=
 =?utf-8?B?bXZGeGJ6TmVxUllpSUxWYVFNOTlUNHQ0ZGlTamdaZVF0OFNyYkh3cHJHMkRV?=
 =?utf-8?B?am5pbHJqeVhPSmFjbmxRQTJGcWlPM2taVFNaNWdWRTZCNURqVDhldzlYaXVB?=
 =?utf-8?B?cmg3eUlUZUphMXN2cDNWZVdTeUg1NVhKaXM3VjluN0J3dzdiSTBWQkxwSENo?=
 =?utf-8?B?UUlTeHZlYXR3R2ZjNnZWRnJpQTRYNlZPdytiMkJqZVRTMzM2WXJjcmRIbzVO?=
 =?utf-8?B?cXRKaGdiNzIreG96OTA3ZDlvNllSTnpMaHJlb1ZkRmhpRnAyaXdhdWFleWdP?=
 =?utf-8?B?V0ZTRk56OVdrUmQwR25FWFRVOXdQMDUzWldGWWE5Vm1YZ0JJaGJ0OUlCcisx?=
 =?utf-8?B?eVYzR1NhUGR1bi9vejRaT2RxYWNURm9FWERYbHkyL3lPeklaZ0dMbEF6T1dP?=
 =?utf-8?B?V2YzNVMwc2dacGhIZVhoK0ZOUWRXSzFKcFVsR0ROUXp0S1EyeHBUWVFYR0k1?=
 =?utf-8?B?RC9qdmtMb1dDdjFoT1R5Y0dZMTl0Q1doRUErc3ZNMUl3ZkZHVHFnelpUdGti?=
 =?utf-8?B?R05ZR1NFaEtqdmFpTWYrQTMyR3ZsSjNLZlEzbGJHQzc1bmJVQkJ5cnBDdlBq?=
 =?utf-8?B?dzJHKzg3TU8ydmxzUlUzaDYzYlp1alBpa2d6NlJXUlkrOVpMWnY3cUxMZmFD?=
 =?utf-8?B?KzRuTVM2Z2toOWUxRzN1emhsMVo5amNnTWdTZG5HRUs5VUkzR0Y4UkNYVU1p?=
 =?utf-8?B?WGJNajVnRlBhRlJxdXZVNjNLNUdCbXlhM0dtV0NsV2RyU0VSNTZ3cExQa0Vu?=
 =?utf-8?B?RmpiTy9YbkhmNFNhWUw2S1ZReDNRQlp4ZDl0VFk4L1hNZ2FNTkI0T3p1d3o2?=
 =?utf-8?B?enhuUk5kYWhtUUZSVjNtMTZWemF6dEFrUWVxRnhDSkp6cnBZUyt6d0h2OXE3?=
 =?utf-8?B?WmZqN1BtS25TbkR0YW5uNTJZYmd6d3lEQWN6dDNWZW82ODlnRlBQQ1Yycy8v?=
 =?utf-8?B?RkJUclBNMVo5UHovanBtYWdWOTRRaXMvTFQxeXhyNzIwTm1qNmZ6NGZUY1pu?=
 =?utf-8?B?N0hFR0JNdzZBc1dQWkJZQUdnVmlTU3p3U2duYXNOaFgvaWZWSnh0K2cxU0tJ?=
 =?utf-8?B?NjFMNG9MZWI0V2w3bzFaOHdtRXFoZHVlOUtNSldFTVBMaTlKb2oxajNHc3kx?=
 =?utf-8?B?TXduYnlrUVZDa3ZzVS9qTXFqTktiVkhHTGNPakFIME50SjF6S24zeDFXUUdX?=
 =?utf-8?B?d0M4VkY4eUJHeWx2QnQ0ZzZzUDBERjkzM0JQTU5yczNER3dlb2FldGcxZ3RF?=
 =?utf-8?B?WmhNdjd0cTd3SWUyTEV3T0RTWGM0R1l0RlVSaDUxVUljSkZBKzB6QlJNUTFE?=
 =?utf-8?B?WjVNYkdmL1RlRW9CSFk1cjcxcmhpR2pSaTZaTzRuelVGczUrVGNUa0JmRGxP?=
 =?utf-8?Q?wX881ZPLtEsInLqz1fQsVqipY?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7f837d-c2fd-43fe-e018-08dc8c6717b4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9505.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 11:42:38.8868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFJuhMEgyfdmhT/qdN+N26eSmkmkpODxS8s5FatBfpDyWit7xOCS3vJKSvYqOsryGOJitHxW91S8YI2aKYpJGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6924
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_044254_537846_95DC0C9E 
X-CRM114-Status: GOOD (  10.73  )
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

T24gNi80LzI0IDAzOjUyLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4g5ZyoIDIwMjQvNi80IDk6NDEs
IFpoaWhhbyBDaGVuZyDlhpnpgZM6Cj4+IOWcqCAyMDI0LzYvMyAxNjo1NSwgUmlja2FyZCB4IEFu
ZGVyc3NvbiDlhpnpgZM6Cj4+PiBIaSwKPj4+Cj4+PiBJIGhhdmUgYSBzeXN0ZW0gcnVubmluZyBM
aW51eCA1LjEwIHdoaWNoIGxvZ3MgcXVpdGUgYSBsb3QgdG8gYSAKPj4+IGRhdGFiYXNlLiBUaGUg
c3lzdGVtIGhhcyBiZWVuIHJ1bm5pbmcgT0sgc2luY2UgYmVmb3JlIENocmlzdG1hcyBidXQgCj4+
PiBub3cgaXQgdXN1YWxseSBmYWlscyBhZnRlciBhIGZldyBob3VycyB3aXRoIGVycm9ycyBsaWtl
IHRoZXNlOgo+Pj4KPj4+IE1hecKgIDYgMjI6Mjk6NTggMTcyLjI2LjIwMy45MMKgwqAgd2Fybmlu
ZyB1YmkyIHdhcm5pbmc6IHViaV9pb19yZWFkOiAKPj4+IGVycm9yIC03NCAoRUNDIGVycm9yKSB3
aGlsZSByZWFkaW5nIDU4IGJ5dGVzIGZyb20gUEVCIDE6MjMwODcyLCByZWFkIAo+Pj4gb25seSA1
OCBieXRlcywgcmV0cnkKPj4+IE1hecKgIDcgMDA6MTE6MDggMTcyLjI2LjIwMy45MMKgwqAgd2Fy
bmluZyB1YmkyIHdhcm5pbmc6IHViaV9pb19yZWFkOiAKPj4+IGVycm9yIC03NCAoRUNDIGVycm9y
KSB3aGlsZSByZWFkaW5nIDU4IGJ5dGVzIGZyb20gUEVCIDQwOjIzOTc1MiwgcmVhZCAKPj4+IG9u
bHkgNTggYnl0ZXMsIHJldHJ5Cj4+PiBNYXnCoCA3IDAwOjExOjA4IDE3Mi4yNi4yMDMuOTDCoMKg
IGVycsKgwqDCoMKgIHViaTIgZXJyb3I6IHViaV9pb19yZWFkOiAKPj4+IGVycm9yIC03NCAoRUND
IGVycm9yKSB3aGlsZSByZWFkaW5nIDU4IGJ5dGVzIGZyb20gUEVCIDQwOjIzOTc1MiwgcmVhZCAK
Pj4+IDU4IGJ5dGVzCj4+Pgo+Pj4gRmFzdG1hcCBpcyB1c2VkIG9uIHRoaXMgc3lzdGVtLiBUaGUg
RUNDIGVycm9ycyBhcmUgdXN1YWxseSBpbiB0aGUgCj4+PiBmYXN0bWFwIGFyZWEsIGVyYXNlIGJs
b2NrcyAwLSA2My4KPj4+Cj4+PiBXaGVuIGxvb2tpbmcgbW9yZSBjbG9zZWx5IGF0IHRoZSBlcmFz
ZSBjb3VudGVycyB0aGV5IGxvb2sgc29tZXRoaW5nIAo+Pj4gbGlrZSB0aGlzOgo+Pj4KPj4+IDAg
LSA2MzogMjk2MDAKPj4+IDY0IC0gMjA0MzogMjIwMAo+Pgo+PiBUcnkgdGhpcyBzZXJpZXMgb2Yg
cGF0Y2hlcyAKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjMwODEyMDgw
MDA1LjMxNjIxMjUtMi1jaGVuZ3poaWhhbzFAaHVhd2VpLmNvbS9ULwo+IAo+IEJUVywgYWZ0ZXIg
YXBwbHlpbmcgdGhlIHBhdGNoZXMsIHRoZSBrZXJuZWwgc2hvdWxkIHJ1biBvbiBhIG5ldyBmbGFz
aCwgCj4gdGhlIGltcHJvdmVkIHdlYXItbGV2ZWxpbmcgYWxnb3JpdGhtIGNhbm5vdCByZXNjdWUg
dGhlIHdvcm4gb3V0IGltYWdlLgo+IAoKVGhhbmtzIGZvciB0aGUgcGF0Y2hlcyEKCkkgaGF2ZSBi
YWNrcG9ydGVkIHRoZSBwYXRjaGVzIHRvIExpbnV4IGtlcm5lbCA2LjEuIERvIHlvdSB0aGluayB0
aGUgCnBhdGNoZXMgYXJlIHNhZmUgdG8gYXBwbHkgdG8gTGludXgga2VybmVsIDYuMT8KCkFub3Ro
ZXIgdGhpbmcsIHdvdWxkIGl0IG5vdCBiZSBwb3NzaWJsZSB0byByZXNjdWUgdGhhdCBwYXJ0aWN1
bGFyIHdvcm4gCm91dCBkZXZpY2UgYnkgc2ltcGx5IHR1cm5pbmcgZmFzdG1hcCBvZmYgb24gdGhh
dCBkZXZpY2U/CgpCZXN0IHJlZ2FyZHMsClJpY2thcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
