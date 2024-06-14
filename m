Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1281C27C6E
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2024 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBgtEPUXtdaHD6tSEbU1ESLPip0vmTaI75l5F6qcCkg=; b=e1FkQKAIapHHOSdPG+N/7Vw6hd
	+B/q0XyPtyJu7Lgnk+edBWFrj3CRawhxxhXw5d+bp6UA00dlfgYl87t7QVrmHlqyjLHiUOSfFL7O0
	K0fgbBJ0e5Qz5knDCaTcAUCpGXeD3OJu1na+4LnetA1t3dZqy6S0u8y6wC/FTSrzcJhcWdq+z/Ejx
	HidDFtVc09gMad4Tv/s79AJOq83VtFuRjvKOJSdJe3spJuaSX2dfriYi7obzEWXOdrCRwFjuxCrME
	an44dRY3XSkgJjqv7GTuzRO99UzcKzTEJFyWgI9Y4WUp9odgJBFQHmurUdj8w0ccj1cBVlTASl9iL
	qiQwAFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI5Nl-00000002dlq-1u3M;
	Fri, 14 Jun 2024 11:46:13 +0000
Received: from mail-vi1eur04on20608.outbound.protection.outlook.com ([2a01:111:f403:2611::608] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI5Ni-00000002dlB-32N3
	for linux-mtd@lists.infradead.org;
	Fri, 14 Jun 2024 11:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHa+1CEfQNm6h2+EUhxUV/5LTQrPO9CygAQ8aMv7cI/dyGoIWiCgICz8EWWB10UDM0VdNN7hBAJFJpWq4Avy6Z0aEU3+OVPmtLEHZ5YX+5numYe413XqNu9948GI0V+EVGMZvmmKovwvjFWbHjbXO8j0TjQrq0xVkxK6IraXBbFFphtTTCRUm0Gc6Yj80BQwyGV2sD+oqpl0LgbV7ddF/LbxzQWY4UgYiuob3YyWX6Y6AYZ7YNzoN/MkzogFQ5BY4a6cARqpx45op/nUvqqjOCddZ56yGh1H9bMPW8BbFPkRg9itfxXnQW7XN0PxVPCPA/eO4etv2nJGI1QSKPkcIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrkPKuB+VDglzqSxmXG4OHzKH+vsxcK2ghLe/2qJHZQ=;
 b=cjSTsNJfyRA8kRkAeNLP6cqu71/MsdeDnNwBsfosnXjvwBqoEpUvtRyyjKbPNYAcH7oqWxTohPY37TAbsRlxB1S+qV9Akf0V2rPwRki7rJxG9ZK5OcHmMWJx70tkEyKeJMoa+uqmwsywIY2QcNcJRBe293I2ERiC8jZECCuEW9uxnBKWYHoGJlV66tM7yJ+qz62GGCNvCYWzLdCJz/b2YXEmUcIcasBr7wcnXkk4vwrpcGTkP91OzhYr2ZuE59tRH8Rv+rO6iUl8A2ga22HCmicIyqBfWwaUzW1kzqxlKjuNESS3ZoM8Duuzup1s+NSV7VZmy3eMXAkV8bvS6gZm+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrkPKuB+VDglzqSxmXG4OHzKH+vsxcK2ghLe/2qJHZQ=;
 b=UENtrGDGueI5yte9LDmzoIBiJxmFuiy0tR8saWHRRQGG70pQMaB1HottsatR5G1lU8KbHAOTIIzot2X0f7IJmaU0ITaRCTFh/CqTkrc4amzoi/MJnnDIcf/FB+IKbUGarOobZITENNpI65ZhkP+nwn+ioCbeAW4AmfwS8kjJpWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
 by PA4PR02MB8240.eurprd02.prod.outlook.com (2603:10a6:102:271::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.23; Fri, 14 Jun
 2024 11:46:00 +0000
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1]) by AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1%5]) with mapi id 15.20.7633.037; Fri, 14 Jun 2024
 11:46:00 +0000
Message-ID: <f9affec5-46e4-4084-830f-9b8601298015@axis.com>
Date: Fri, 14 Jun 2024 13:45:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Lots of fastmap writes
To: Richard Weinberger <richard@nod.at>,
 chengzhihao1 <chengzhihao1@huawei.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 rickard314 andersson <rickard314.andersson@gmail.com>
References: <f59e5ae3-8193-43f3-604c-9a846d6e8ead@axis.com>
 <95a9872f-77b2-e9a0-f5dc-a376964bc93e@huawei.com>
 <1076184265.187322.1717483622377.JavaMail.zimbra@nod.at>
Content-Language: en-US
From: Rickard X Andersson <rickaran@axis.com>
In-Reply-To: <1076184265.187322.1717483622377.JavaMail.zimbra@nod.at>
X-ClientProxiedBy: MM0P280CA0045.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:b::8)
 To AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9505:EE_|PA4PR02MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 796d9cca-9796-445d-a5d3-08dc8c678fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clRicVhUUVdOK3RvUkUwaGhCSGUreUtmUk93cGhQMmpWcWJyclpmTjlQOW5r?=
 =?utf-8?B?Y1U1aWhJKy80NnFJMTFVcXFaMUovckExMzJXNlI2ellYU0VZUnI3bWZDcWgy?=
 =?utf-8?B?dnpvQmNSRmlVNjRXdlhzeTVVVktGeXBMRVZnRnZRT3l1TU1yVE91S1lDTTEw?=
 =?utf-8?B?WDVsekExd2lON3B5Q1U2YW5VYnh6dDBXMkV0UUhJcGhKa0VyVE1QZWVHNVM4?=
 =?utf-8?B?T3dWLzEyRkdYNDhqeTZ1Y2FPZVQyRllseHhaTjVxc3RLL2d0SWxSdmdMNzBk?=
 =?utf-8?B?dnFhdXltNFdrSkE2STN3eGsrdVQreGpXT0VUZW5wR1RUM3daUUZ2M2lmQnRP?=
 =?utf-8?B?YmtYaE5FWGwvNHZHTnNZNWJMcU1USkNoNUZqb2tBVFlVeHNCbzU0TTJJcVdZ?=
 =?utf-8?B?Szc1U3FxY1FNK0JMNFQ5OFhlMmViRXE4aGw5cG0wQUx1cW4zU2RPbGVhSEJl?=
 =?utf-8?B?cVVhYlBGVC8raHNHazh6Qm5kcEFKcGxqM1hpLzZ5czZyeGFjUEc3WitaMStq?=
 =?utf-8?B?akZhYmxSUHVQbkduYkdBNTRid1l6Smk5M0VtaFExNnE4eUVGSzhwSEhQTGNH?=
 =?utf-8?B?M3lzQm1JUmFrZ3V6VUlKQ1NOU2VDQmNLZVA2TGJlendNMXZMSjZNdUZJeWVm?=
 =?utf-8?B?aGQ3d3VzWlJvUkZaZVl0UHdQZjc2T3BqWUhxRlFyU1UrYUtxdEpZbVE4b3p2?=
 =?utf-8?B?TkRJQ0xjdk9QV3BVTHVrQ0JpVTZjVy85UEx0UE14N2lpR3VqQ2wwSityZUps?=
 =?utf-8?B?ZjZhS2ZnM1owb0EwY3lzcXVDRmZHcVNyTFpNZHdGRy9ORVhkV1h4QVNYL3Rr?=
 =?utf-8?B?WWIvQmZXM2lIY3lBWThySTlBZGZTTEJEaTZyYWZGNEg3djhEWHJMQzdDR3lQ?=
 =?utf-8?B?Q1ZvcktIQTNseEpLRXBBK0RCRWEvcE0raUZhT29CVzF3bUVhaThyNlV2Y2xW?=
 =?utf-8?B?cWNSVXlUM1laeTVscFk1RDh1S0pJMjBIRXozWmVLSkxsMGllS3oyS3Jtd2Fj?=
 =?utf-8?B?Z3UwNldEQU5Wc1lNK3VUS212Vkl5S2lsbXB1cUc0OXJ5M2xROXIvTFduOEVE?=
 =?utf-8?B?Wi9McUdHaFErdjU0VExYTHV6U3ovdFU3ZWhtSVc1UjU4SnBsbDFkeFRoV2d3?=
 =?utf-8?B?S2hXN2YvTzUySGtJQmJwNjNoaUlpL0R3T2FoTytmRE9oSHg3aGExbEpXNkU4?=
 =?utf-8?B?U0VPekpsNGd3Wmt4Vi9xTVl1SWt2OGhidGRneWpvZVJHVTFnVkVVT0kzakZO?=
 =?utf-8?B?bFdhck1ZODIvb0hKSThNdy8yOFEwZmtHQXN3RVYxZTFNeEd0TmdTTDEyRDBr?=
 =?utf-8?B?aWMzR21WUDhaWW5qVisvTThieEV5WW83KzUraGlWZUZMVTdPOFB3RHY3a1hu?=
 =?utf-8?B?bGx6cVhjYjA4TFBPOURQckZsNTltVUtjaTRObjA4R2NONTliU1g3NnovOGZI?=
 =?utf-8?B?VmpOMGxoWE1kYW5MRVNDMm5UM0ZweUl3UWF5WlNZUmtROUt4b2ViQjhUWEg4?=
 =?utf-8?B?RzNPVjAydlYvMmVQUUpZOUhYRENEUHVPZ0RnRmZYd1ZQUUNGbWpseHlheFRx?=
 =?utf-8?B?MTBIbnNYTllSYlp0Tll2eFRTV05rM3FxdGZTdmMwSVhQMUhLK2RJTlprWVNj?=
 =?utf-8?B?K0h1b0s3bkRselNCSHYwSzRoWXlheTZzWmkwYzgvSUt6YjVRTThkdG5WUXhk?=
 =?utf-8?B?ZlU5OTRlYmFaYlZkcGtJWncyT1pYYTgzOURoNEM0b1NrbEZNeGQrOFNlZTdv?=
 =?utf-8?Q?e+ESf0CFZZosOZ2OCKUg2V+hpmIlSMficbUpcGt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9505.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDd5cnhIRWJDaUJ0NWNvVjczYVV5L3hCT3RMemtwNVdiS3RlWVpyZDBNVUxi?=
 =?utf-8?B?WHUvcXhZY2ZncnZJL2RXdUtmcm9sMVIvV0M4eDlJOGFGYWFlZXRRUkY2bEY3?=
 =?utf-8?B?T2VOWWF4YlJrWHd0VTd1TXF1K0RKeENISFFmb3QxUkppMk5ybWVuMDJmSG1R?=
 =?utf-8?B?TmNYV2M4OUVYYVZlbUZQMG5oSlBNSzJleXNLZGNkNWd3ZHIydXBYUHJCN1dj?=
 =?utf-8?B?UHBIYlZTRG1YTVFMQVVCK0ltMTc1VDJZOUQ4VEQ3bW1tRCtlVGlIQUh5WXFj?=
 =?utf-8?B?U240b3hmSUVoVkl3SWpIRENyeEpmektMTFlDY2FiKytkWmd0cWdNMlRTVXIw?=
 =?utf-8?B?bi9SWmtUTEJKQXhlNS9sSzVUY0RkNXYyRTdOaHpNMzdvZEtkdDFJVTU4c3Rl?=
 =?utf-8?B?akpJa042Q1JiYkRTUmt1c3BvakFnNVZiVk80dWhCRnQrNTNLNVppbUZSVTZq?=
 =?utf-8?B?ck5XWG9OVnpWaUY2b3dHamdieDNra1lKNHFkNGhaemVSQlFhaGRnNXRQazFG?=
 =?utf-8?B?MXpMVzg5V0dPaVVkRU9BZERweThsMjZxS1dTLzc4cy9uR2ZOQnZLdEhKR0E4?=
 =?utf-8?B?M1l1d1d1QkdjbzZEN0Z2UmRZaC83Z0V2N2ZSZG1CSFhtZll3NDVaME9ERUZN?=
 =?utf-8?B?bkNYT0RoMW5HbE5zTTAwcVBPTklBSmJWNGVTbTZ4STAzZXJlS3NIOUFhWVky?=
 =?utf-8?B?R0pwT05FVDQ4cnBUWThyUkNjamVVRHhhcWllTjU0blhJYk44dHp0TGZya04y?=
 =?utf-8?B?QldjOFVjN3BnckhaVFc0SkZKUXZBRmJhK3ZaRXB5SlZrSHB2ODQ0cVc4emEz?=
 =?utf-8?B?L1NtUmNaNHN5VUZGaHEwUTgzbm1lYm94aCtRYWFUWkl6R3RoSGNBZVZVbHg0?=
 =?utf-8?B?aW5sK04zbEF3YnQ5dzZmSms1eTdmMENoZm5VRThDN0FESG5IQlVacXNMQm9n?=
 =?utf-8?B?M3NIVGw1MnJYSmxYYWQrelk5LzFFL1pBNUpRNjNyOXp1bWZNcXE3djA2UGU5?=
 =?utf-8?B?QkRVSkhreGVpZEN1N2xGbjFhQzRNVnI1ZFZ2bUU3YjFjUFhBNTZEdUVEVXJS?=
 =?utf-8?B?QkdicDFVNFJJNU04TE9GcGlGZmJ3VzdKWUxEU3hUeWJnMWpTTzFheSttMFlm?=
 =?utf-8?B?cldsQzRHSzl2cnB6RkdKNWk0NEo4U2RGZDRHTSt5d21nS3ZyUDhJVFJRdlE5?=
 =?utf-8?B?djJMNGdjZ25jdUdKNFgvTUNRQTAvaFliY1lOUjB5cDk3RE4wZVRRanVaOTMz?=
 =?utf-8?B?K2ZtcUkyUWZuZUNmRXp1S2R6L3M4TXpQV3VKa0xiNE1MUjlYNUs0VEROY1B4?=
 =?utf-8?B?Zk4yajlid0twNlFlMitiNUNpTlFkQkFVWjFIU2pCZ0s5TWJHbU90ZnRHaHVV?=
 =?utf-8?B?WDJRSDdYbE1kbHlweTZmNXI0L2syR0VId1Evcml4SWNjVEdVOE5ZMUpSTTN1?=
 =?utf-8?B?ZzA3YkI2SXYxc1k2dU1BZlFJMU1NczBhYVdtTDVsUnFsRnMrcDdyOTcweDdG?=
 =?utf-8?B?bHc3ZXNvaG5VUS9KMGVycnF3NXJMUzJ6cTJtaE5PT2pnOFhCeVJNMWhqRzhM?=
 =?utf-8?B?cEdGaTVHNjgrLzRkQnpGcjZZRUNRdG0zcVpXamtHS1hsOGRxRjJoWFFoRHFY?=
 =?utf-8?B?TUZpTkJKN0NVMjA3THpUSG14RldiL2Rrc2JUMlYreVhMSGw0RW9nMFgrbmVj?=
 =?utf-8?B?Y1pmQWw3WHFidlJqWDlYZTh4Y2VZT1BvbHV2Ymp0RVlIbU9iMmNZeTA1TjZH?=
 =?utf-8?B?dHVXWi9SbTVqZGk0TVpEZDlBWnFQWU8zR1JyNnZXSHVlVnhhYjBzTk5XNUNl?=
 =?utf-8?B?Mkl1cHMxaWlsbDhEZ1V3RHNIamlZWXZHYVNoOHpJOGxIT1pHNmVRaEk5MldU?=
 =?utf-8?B?RlNONENnVlE1YS9ycm9QUlU2RnhlaXF4TzQ5ZjMwS3YwcTVvbXpuUCtYeTZB?=
 =?utf-8?B?UEJsb0ZzM0NpNG9iZzZYUGFOd0UxR2tvU00xbnpuMEFpRHM2YTkrbFBXRzJG?=
 =?utf-8?B?MTB1aWg2Slgzc2dzRjNLVVppRzFtQmZzemoxQzYxcSs2aENVK0VpQll4SWRH?=
 =?utf-8?B?amFCOTR0NzA5TFhvN240WENQY3NuU3ZDRC9GYTJvOXN6WFg2Q3E1WlBBeHlR?=
 =?utf-8?Q?pPaK+ylVWagcAk1MQnUsue3IK?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796d9cca-9796-445d-a5d3-08dc8c678fa2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9505.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 11:46:00.0090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AG5xy0wpG3G42wEyO+XEzptuGGourRjsvUhoSKmKyyUGVTG3K2UikhxuiBb47kOB259trJRyYmL0DC6pb4H5IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB8240
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_044611_202083_197693D8 
X-CRM114-Status: UNSURE (   7.21  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNi80LzI0IDA4OjQ3LCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gLS0tLS0gVXJzcHLD
vG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFA
aHVhd2VpLmNvbT4KPj4gQW46ICJSaWNrYXJkIHggQW5kZXJzc29uIiA8cmlja2FyYW5AYXhpcy5j
b20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBs
aXN0cy5pbmZyYWRlYWQub3JnPgo+PiBDQzogInJpY2thcmQzMTQgYW5kZXJzc29uIiA8cmlja2Fy
ZDMxNC5hbmRlcnNzb25AZ21haWwuY29tPgo+PiBHZXNlbmRldDogRGllbnN0YWcsIDQuIEp1bmkg
MjAyNCAwMzo0MToyMQo+PiBCZXRyZWZmOiBSZTogTG90cyBvZiBmYXN0bWFwIHdyaXRlcwo+IAo+
PiDlnKggMjAyNC82LzMgMTY6NTUsIFJpY2thcmQgeCBBbmRlcnNzb24g5YaZ6YGTOgo+Pj4gSGks
Cj4+Pgo+Pj4gSSBoYXZlIGEgc3lzdGVtIHJ1bm5pbmcgTGludXggNS4xMCB3aGljaCBsb2dzIHF1
aXRlIGEgbG90IHRvIGEgZGF0YWJhc2UuCj4+PiBUaGUgc3lzdGVtIGhhcyBiZWVuIHJ1bm5pbmcg
T0sgc2luY2UgYmVmb3JlIENocmlzdG1hcyBidXQgbm93IGl0IHVzdWFsbHkKPj4+IGZhaWxzIGFm
dGVyIGEgZmV3IGhvdXJzIHdpdGggZXJyb3JzIGxpa2UgdGhlc2U6Cj4+Pgo+Pj4gTWF5wqAgNiAy
MjoyOTo1OCAxNzIuMjYuMjAzLjkwwqDCoCB3YXJuaW5nIHViaTIgd2FybmluZzogdWJpX2lvX3Jl
YWQ6IGVycm9yCj4+PiAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyA1OCBieXRlcyBmcm9t
IFBFQiAxOjIzMDg3MiwgcmVhZCBvbmx5IDU4Cj4+PiBieXRlcywgcmV0cnkKPj4+IE1hecKgIDcg
MDA6MTE6MDggMTcyLjI2LjIwMy45MMKgwqAgd2FybmluZyB1YmkyIHdhcm5pbmc6IHViaV9pb19y
ZWFkOiBlcnJvcgo+Pj4gLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNTggYnl0ZXMgZnJv
bSBQRUIgNDA6MjM5NzUyLCByZWFkIG9ubHkgNTgKPj4+IGJ5dGVzLCByZXRyeQo+Pj4gTWF5wqAg
NyAwMDoxMTowOCAxNzIuMjYuMjAzLjkwwqDCoCBlcnLCoMKgwqDCoCB1YmkyIGVycm9yOiB1Ymlf
aW9fcmVhZDogZXJyb3IKPj4+IC03NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDU4IGJ5dGVz
IGZyb20gUEVCIDQwOjIzOTc1MiwgcmVhZCA1OCBieXRlcwo+Pj4KPj4+IEZhc3RtYXAgaXMgdXNl
ZCBvbiB0aGlzIHN5c3RlbS4gVGhlIEVDQyBlcnJvcnMgYXJlIHVzdWFsbHkgaW4gdGhlCj4+PiBm
YXN0bWFwIGFyZWEsIGVyYXNlIGJsb2NrcyAwLSA2My4KPj4+Cj4+PiBXaGVuIGxvb2tpbmcgbW9y
ZSBjbG9zZWx5IGF0IHRoZSBlcmFzZSBjb3VudGVycyB0aGV5IGxvb2sgc29tZXRoaW5nIGxpa2UK
Pj4+IHRoaXM6Cj4+Pgo+Pj4gMCAtIDYzOiAyOTYwMAo+Pj4gNjQgLSAyMDQzOiAyMjAwCj4gCj4g
QXJlIGFsbCBvZiB0aGUgZmlyc3QgNjQgTEVCcyB3b3JuIG91dCB0aGF0IGJhZGx5IG9yIGp1c3Qg
b25lPwoKCkFsbCBvZiB0aGUgZmlyc3QgNjQgUEVCcyBoYXZlIGFwcHJveGltYXRlbHkgdGhlIHNh
bWUgZXJhc2UgY291bnRlcnMsIGkuZSAKMjk2MDAuCgpCZXN0IHJlZ2FyZHMsClJpY2thcmQKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
