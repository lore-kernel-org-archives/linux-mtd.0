Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AAED591A3
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qetngm0ltYzOFWtkn4OrmbhLh9GYuCk2xm1KYjB34PE=; b=x+8+NkDLCQNF2/VhBXVrPum1xY
	aW1UhNjHNRpSsKlTTBJT3eJcHG9VpgRrsMEDwvfOTs8l7wlySbPZqZhZJFS84KLDzWTyRzVsqz2VN
	s1uaS6i+UvaQiWQJONyHVrBaDms96ZyVDqTsvTqpjuQbyRQo271SKNV/EF7XPWRfAFbFa8wnPDSTl
	0JOFQEEFvW1l4PklhNfzylSpk5XR0es3FIFHxBvwjXMJEr88TdTzzD4uKlaR+vAyzGLKpNAeUn/h/
	DsjfO+adP2d8+w/D0NvqiWP+p09S3jqyXL/kln7R82F9iAvqTSEdizi/42jJcqMAgVAKb+wdbeRNM
	N1sKo9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD57k-0000000A9JA-2MsT;
	Mon, 18 Nov 2024 17:01:16 +0000
Received: from mail-am7eur03on20609.outbound.protection.outlook.com ([2a01:111:f403:260e::609] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD57g-0000000A9GD-4C0v
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 17:01:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3CbweAGMisskUgz5XkTxuzSHe4kyWKdFL0F2j8fSyZRuh3JWWJft9ys2bHy6uZKIsBCRPFBOZw6q28qygaXhTYkGR1+Nl4xWd0RKmu61mUgbemAj02+evh/y+gKN82ftNJnFSjtgogxkrVZyvLzelHVeicFGbXNZRfFpFYvzdZcN8wfHb2kStJ0Zw/+PH5LRr0SOTpdaIdAscbqkGkv8P/v0kpjHZUR7lIIyXgmMnUybSHJ2f41m0rP3tZpqywMOsFEZBe4Lag6JXulzOy4gw3Di3r3gLvE3oWyd+y+RADZ2Mus/b9t2fW56bky+YS1DPzQ6KDeSCtGsQAL5sBq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHTe8Pro9nE1vAIXCvVLilrX1822+BK+164RXEh/rLA=;
 b=TuHaOcd2VOdYZ37Imm76HVUffYV/DRhnyDPb37x/90OxbM9JnJiqQxrR3AfgQTKUSEXtOMvbnhJ4u7NFSvnlPwLdLfsrFrQTPw+3CvoNXcswzxePE9DoU6rxH4Jm72gRiM4fcJc1cRdZxjjWEEAJ/jn1Ajx4z9BNoz4wsPvZe0Lv4qI6EqE4MrhXHsc6vq22vL01Vu/sSpg6Mn8pURI7Ar1uAANUhqjfboTdMW9R9oJfv62CacM53DJXtP0cQPsFtQ8MHt0DCCTlWjJnMdSokxflljC5NdJjE+gAnx7UHsgo8Qma+MbzsmsqsqjOabObakilPT28J05QeayL4poSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHTe8Pro9nE1vAIXCvVLilrX1822+BK+164RXEh/rLA=;
 b=Rwy5Yk/+uq93UuMH1uzN+SnAKYu7TbwmlLSYLAETQdD2QNKlWGhLU3kpLInuAYUJuqSDJq9Sjg3S2Dj4O81FvoPsmaCKiCqn2gLPYyYTQyIFuyAzDfdqnXplhpDPkLqadZWUAivqwz5AHoxpvcwrAL/W9ivhnoD7JpkilPbjod0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
 by DBBPR02MB10461.eurprd02.prod.outlook.com (2603:10a6:10:538::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Mon, 18 Nov
 2024 17:00:56 +0000
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1]) by AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1%2]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 17:00:56 +0000
Message-ID: <bee48f61-2c3e-4405-9848-b52d0eb9ecfd@axis.com>
Date: Mon, 18 Nov 2024 18:00:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] ubi: Expose mean erase counter in sysfs
To: Zhihao Cheng <chengzhihao1@huawei.com>,
 Richard Weinberger <richard@nod.at>
Cc: Rickard X Andersson <rickard.andersson@axis.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 rickard314 andersson <rickard314.andersson@gmail.com>,
 kernel <kernel@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
 <1034679385.201190.1730925253564.JavaMail.zimbra@nod.at>
 <fde85cfc-8b66-37fd-3884-ad4d65930378@huawei.com>
 <66292421.21714319.1731610221872.JavaMail.zimbra@nod.at>
 <c57b8b7d-a773-0d51-8f38-2a2ac8c0e31b@axis.com>
 <6a2e0584-35ae-4d74-9d5c-400db8b25c0b@huawei.com>
Content-Language: en-US
From: Rickard X Andersson <rickaran@axis.com>
In-Reply-To: <6a2e0584-35ae-4d74-9d5c-400db8b25c0b@huawei.com>
X-ClientProxiedBy: MM0P280CA0102.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::23) To AS8PR02MB9505.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a4::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9505:EE_|DBBPR02MB10461:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7a0a92-e056-4b6d-e517-08dd07f29178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk5FUmt3L3hPdVZ2OXlPdC9uYXUwcDFxT1BMRkhwVW1qeDBLWUIvS1NZdWsv?=
 =?utf-8?B?THNObkM2aktzMmpkRGYwU0s0SEVlMitqNDgzZmlJYnBWblBIOXBqc3ZmcGdu?=
 =?utf-8?B?a2Yyb1pMY2RSbXNweDNBcUlBWTZDQnRXSkJ4ZkgzMkdaUWxkZ1kzVEtVMWtM?=
 =?utf-8?B?RXZKMjFRSWYyaVowVCswVTM5WWFyNUQ1UGJOSlJoMkZ2NTR3MkJnWDllYlE0?=
 =?utf-8?B?MCtVcldmeVRMc3UxcVNqRE1TL2N6ckRmV1VEL1MxandhOXc1djk0d29aYzF3?=
 =?utf-8?B?NCtPN1JoWlVQVEdlSlV6V3BHZHI4aXJzdTRPRGloL3gyc2hqY25RQWxZeHFX?=
 =?utf-8?B?cm5tWU80S2c3RkZuK2s0WlFXb21GK0x6UGxRcFNmRjZ5TFYvSWZMUXFReFRx?=
 =?utf-8?B?QldSMVhjMlhmVDJXdG10QTRKREs4bi9JWTRQTmIwVWM4ZzcxRE5pOUQ4ekNT?=
 =?utf-8?B?bWttbG1yNjIvVC9LdXhWQUh3SEtMVUVJdWVLVXdwOW9XaWkrMnRKYmZObmEv?=
 =?utf-8?B?SFA5VWVDTkdKTDFCalVoaEFSVEkyT0FnUDAyQ3B5QTI2aStYd1JyNUg5bmdW?=
 =?utf-8?B?MmF0QllCc3lzN2dHZTZVNU5WWXRYOWFWeXF2NGtYMnpkemdWRms0RU5Vb0E0?=
 =?utf-8?B?N044N0w2SDJJbzdRRFBEazRwM2ZNS2hQSUtvTVBsSDZPVEt6L1FneXAvbEJ0?=
 =?utf-8?B?ekRYVTF5d0J3K2wxUHZIWkFLM21Db2pGcVdmdzBEUlNFaWllMXdGaU5maVJI?=
 =?utf-8?B?WU9CdGlZaGZlTldCUUxob1hIMUVGUjdRbXh6YU5BQkYxYWprQ05KMDdRaUZH?=
 =?utf-8?B?RkVTa0JnSlV1ajc2RnNpaHBLV2I4VXFvWVMwaWZFdll5QVc5S282NEtGdEZl?=
 =?utf-8?B?VmVGaDV6S2lkNXU4d2NEWjZpc2d5d0wxcmNna1RRUDc0aHJWMWdSS1VENDIr?=
 =?utf-8?B?REwwNDg4TGZ1blZPaklFUTl6UlFLcXhTSmt2S2F1RW4vdXVDdTBwM1JEU3l3?=
 =?utf-8?B?akhiNFFsSWU0VktwYlpuQXg5cURQNnNJMlZ1KzhnR1dYZ1hWZWs1VktXVVA5?=
 =?utf-8?B?c3BxYWpIL01LVWV3aDJHVzk5TWE4SWJMZDlJZ05TOGF5bnNXOEloc3RoVWQ3?=
 =?utf-8?B?SFU1NGJ6TUIxam1ydkllTk9OZXYzM0pNbUV4TksyQ2Z2dTBRRk43TitDZWdU?=
 =?utf-8?B?akpTYTRmSkp3UElxZ0JGaURhUGxib1JqRmJDMVdFcmtvenJ0aVZyU3dMUUpS?=
 =?utf-8?B?U2ZnSmtJa3ErSElHUy9Pb2xVVTBPNjFVeCtZUVlRbWhid2w2YlZMMVVHS3pP?=
 =?utf-8?B?bUViaVdtSUZrczZ6RGQvSzU2aEVyY0VIMngvQnBsZ0MrVGkvdlU1VzV3a21L?=
 =?utf-8?B?SGE2UDRoNktmaVgwQjNPYi82Z3BRYlZVUFVIdnNLeTdqSjdTaWdveGZMOExQ?=
 =?utf-8?B?eHA1eEZVdWdncVA4RjdkaFU5MWhsSjk0K0hTQjFqRnpiVlRmMlpldStWQ0k4?=
 =?utf-8?B?Qm91UlBKOHZPMlVjTjBWVmdxNnZGb2lhNEh5VVl2STRlMURHSlNDZmZWTlZs?=
 =?utf-8?B?QTBMMkppdlp0ODZhSDhhdExyc09TOEZLT1hIQWJuc2FFTWlURXE5QWxMa1Nx?=
 =?utf-8?B?eWJmMDc2MCtHRDhOZllQUUt3ZG5GcnQyMy85S0U0UWZpdVlYNnNJb0RibW5D?=
 =?utf-8?B?STE2L25XL0ZldzBWUy9MR1JhRkdYWmNOendFV2xZcm1Dayt5TXBuekhSa2ZC?=
 =?utf-8?Q?JYw+Rwa0L0E9KMrJTG0+oEtkO+zNFmjDAKGl+HA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9505.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2JVQUtjUnpEVXNUS1JkbTc3WHZ6akVlZy9oSlJ3OFl3cFJxaVA5S0RRUjJJ?=
 =?utf-8?B?d04yUngxRkdwTmh3dmsyek1KOXhTUlZ1SDVGTTBCRk5YWFFxOGVNczBTZWVv?=
 =?utf-8?B?U1BIcU9PYnFnODFydit5QWo2a2ZCZnpZQ3RWbHRjSk4veVkyUDVPV3AzWSt2?=
 =?utf-8?B?NC84N01iU3hSOHk5dm5Da0E5YnV2Z3BSbStlZnQ2Q09DbEFsdHNCS3N2NURu?=
 =?utf-8?B?dnZ0dHFGOXhMMUl3NDRRZEwvcGlrM2Y5MkIvUVRYTkM5cGJEWG1TZXRVUDQz?=
 =?utf-8?B?YmtTSkJKV05WcmtmSGRXVW9FMVpyUnpFcC9WeS9YMGRDRWMzTmgrSDhWaUhE?=
 =?utf-8?B?b0VBZDhpUnBmRHNlN1EzRjJ2b3lob3F3UUZ5V2ZqQzZacWw4ZXhmcWZFQklx?=
 =?utf-8?B?Vi81UitvZnRERUJCWnpRMS9SYlVCTFNlSVdkclhuS0lDemZTbGJWTW5WWjMv?=
 =?utf-8?B?QU5XaHF4QnV0TEZsdjRQQmNwMlVUT0hkdHQ2QkQycWh1U0NCbk9WRUdtU3F5?=
 =?utf-8?B?ZTRKMmRjTTVKekh0bXlaRDFXZ2s4M1puQld0NkJEQjFrUEl3N0FBbzJOTnVF?=
 =?utf-8?B?c0RzTWRBdmJ3UXJLc1MzSTl1T2IrN3dmMWJnL2wwdHo2bGVjblBYSCtOK09Z?=
 =?utf-8?B?aUZ4YmYzZ05nM0h3VE12UGhFUnR1aVc1YnRqSkJPY3RVaFZjbFFKN2RpYzNQ?=
 =?utf-8?B?VkEySDQxTFg0a0FRQTcrR1AvODhtYTJxamhpVVQ3YXIwSkdFK3V1YjNXd1Bq?=
 =?utf-8?B?a1RDVTdTeFNwUzhlM2IxcGlteVk4Z3BYSmRaNzdEbzlQdmF3SCt3N1pTVUUy?=
 =?utf-8?B?K3pnQW1ZbUYvSDF2MnBoM3AvakRtOFEwRTRST2kzYS9CM0xzZTVvTmh5a2s0?=
 =?utf-8?B?cEs4QlI2K0tZVWdMcmI2SlVuMCtCWFJLbDA2S2U0WVBaQ283cFpLYlhCRXhB?=
 =?utf-8?B?d2ltcmcyOUNTQlI4anRaVVVJVjhOek1ZWjNldDFpeVE0TkRBckhIQVFvQkgz?=
 =?utf-8?B?LzdaYk9teVNNWU5ZQWZ3NnZiajg0U3hMSFI3a0IwOC85VGtYYmljRWd1cE1E?=
 =?utf-8?B?WGhwd0RVeis1Z05RQ3k3M2FZeUtrZ0RURm9nMTk1Z0ZMMkNkSUdHWlZMQ09x?=
 =?utf-8?B?R0NjS3RGTHNuVzdGcGFPMHdaRzUrTjZJU09yNUgya0ZrS0VPdGhGdUtUdllY?=
 =?utf-8?B?THQ3WnNQMG1JL0ZjdzhSYXJ6aC9UZUFzeUl3RVhjTjRjMzJlUm0yVWhNOE5K?=
 =?utf-8?B?UnJsdGZvSFJZVmwrVUsyYmQzVlNSZWFPUHhzZG5TMVI1a1NhSFBUTjR6cTF6?=
 =?utf-8?B?dFpLSUhhaFAwWk41UEUvdDF2V285S1JkS2tNZlFuQ2QrODFZUjFsMnFSc3Qw?=
 =?utf-8?B?VWpNbVB6L1Z2Wk1IZUVtWXpQUjVoV3dwWVJ4czV3TTlIdHBYZ0FFcmZLVzVB?=
 =?utf-8?B?SFRjd2JTRlBiK2tQR0tYV0FtRE50Q1pMNzFJRDdtOHpEcjNIdVlBRlNBd0lE?=
 =?utf-8?B?dCtvWnJtRHd2dmxJd3N4RGJNQ3RYMFcrZFRPS3dhM3lKRnlVcTZxWDJEYmlj?=
 =?utf-8?B?NFBIcUs5S1Q1M1ZIcmlVeGNOMCsyOWtjYm1HelppbXJDak1SYWJZYTBRenF2?=
 =?utf-8?B?R2JqNE00cmtmWURHWUgwWkZGUzloYWVsOERjUGRhWjZRT2trTHNES3IrbWR1?=
 =?utf-8?B?VzdNUHgzTTJaU0VhcC96WWErMnVrTkxzNmsxdzI5TWhld2Q5QXpZekQ2ODRl?=
 =?utf-8?B?VkI3ZG50WXdvZ1MxSVdGSU91aWdCbldxeG9tMk54bVl0SzdkS0lEa0xGdlRS?=
 =?utf-8?B?dGFhdUVScGpLTWV4eENjY0JUcXRYNVEzczRqY2twb2lXL1h1U3NZM21IMGMz?=
 =?utf-8?B?dmZDaGdjYlVrYUZ4SEJhYm1Rb3BBNzhoWldYMGw5V3NwZloycWFMS0lTYWl5?=
 =?utf-8?B?T25sNzA5eDFBc0xsU1dCeUFGM0tNQW1yZ0Z1K0lKaXhKaE9DTWJWWkd3M0dW?=
 =?utf-8?B?bGplTUI1TnB1a3Uxb1c4QVVvbzl6SGVQdnh5elFDVCtpV25adjJkaW5WOW1D?=
 =?utf-8?B?YVZYc2VxZlM3MDJMUVZBVkk4RFozeHp1TU93L3VNUlVNb2hXZkhQUDhDOTB3?=
 =?utf-8?Q?NM5D3KShmtuQvaljMNW5J/+IQ?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7a0a92-e056-4b6d-e517-08dd07f29178
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9505.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 17:00:56.3111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAnfyisP+WsnO4TDQDtnsF9NSjVCH1z9yVV6XtZOQA1ETiKQ5uPJqWf2cVvPVu8QnBKmjFKd3d3guiF7WDryYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_090113_226826_DB514037 
X-CRM114-Status: GOOD (  21.33  )
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

T24gMTEvMTYvMjQgMDM6NTUsIFpoaWhhbyBDaGVuZyB3cm90ZToKPiDlnKggMjAyNC8xMS8xNSAx
NzowMCwgUmlja2FyZCB4IEFuZGVyc3NvbiDlhpnpgZM6Cj4+IE9uIDExLzE0LzI0IDE5OjUwLCBS
aWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4+PiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0t
LS0tCj4+Pj4gVm9uOiAiY2hlbmd6aGloYW8xIiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4+
Pj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiUmlja2FyZCBYIEFuZGVyc3NvbiIg
Cj4+Pj4gPHJpY2thcmQuYW5kZXJzc29uQGF4aXMuY29tPgo+Pj4+IENDOiAibGludXgtbXRkIiA8
bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAicmlja2FyZDMxNCAKPj4+PiBhbmRlcnNz
b24iIDxyaWNrYXJkMzE0LmFuZGVyc3NvbkBnbWFpbC5jb20+LCAia2VybmVsIgo+Pj4+IDxrZXJu
ZWxAYXhpcy5jb20+Cj4+Pj4gR2VzZW5kZXQ6IERvbm5lcnN0YWcsIDcuIE5vdmVtYmVyIDIwMjQg
MDI6Mzk6NDUKPj4+PiBCZXRyZWZmOiBSZTogW1BBVENIIHYzIDAxLzEwXSB1Ymk6IEV4cG9zZSBt
ZWFuIGVyYXNlIGNvdW50ZXIgaW4gc3lzZnMKPj4+Cj4+Pj4g5ZyoIDIwMjQvMTEvNyA0OjM0LCBS
aWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+Pj4+PiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWls
IC0tLS0tCj4+Pj4+PiBWb246ICJSaWNrYXJkIFggQW5kZXJzc29uIiA8cmlja2FyZC5hbmRlcnNz
b25AYXhpcy5jb20+Cj4+Pj4+PiBUaGVyZSBleGlzdHMgbW9yZSBkZXRhaWxlZCBpbmZvIGluIGRl
YnVnZnMsIGJ1dCB0aGlzIGluZm9ybWF0aW9uIGlzCj4+Pj4+PiBvbmx5IGF2YWlsYWJsZSBmb3Ig
ZGVidWcgYnVpbGRzLgo+Pj4+Pgo+Pj4+PiBJZiB0aGUgZGV0YWlsZWQgaW5mbyBpcyB1c2VmdWwg
Zm9yIHJlZ3VsYXIgdXNlcnNwYWNlIHdlIGNhbiBhbHNvIHRoaW5rCj4+Pj4+IG9mIGFkZGluZyBh
IG5vbi1kZWJ1Z2ZzIGludGVyZmFjZSBmb3IgaXQuCj4+Pj4+IEUuZy4gYW4gaW9jdGwoKSB0aGF0
IHJldHVybnMgdGhpcyBkYXRhIGluIGJpbmFyeSBmb3JtLgo+Pj4+Cj4+Pj4gVGhpcyBtZXRob2Qg
c291bmRzIGJldHRlci4KPj4+Cj4+PiBSaWNrYXJkLCB3aGF0IGRvIHlvdSB0aGluayBhYm91dCB0
aGlzIG9wdGlvbj8KPj4+Cj4+PiBUaGFua3MsCj4+PiAvL3JpY2hhcmQKPj4KPj4gSGksCj4+Cj4+
IEkgd291bGQgcHJlZmVyIHRvIGtlZXAgaXQgaW4gc3lzZnMuIFdlIGFscmVhZHkgaGF2ZSB0aGUg
Zm9sbG93aW5nIGluIAo+PiBzeXNmcyAoL3N5cy9jbGFzcy91YmkvdWJpWCkgdGhhdCBpcyByZWxh
dGVkIHRvIGZsYXNoIHdlYXI6Cj4+Cj4+IC1yLS1yLS1yLS3CoMKgwqAgMSByb290IHJvb3TCoMKg
wqDCoMKgIDQwOTYgT2N0IDI0IDA4OjU0IGF2YWlsX2VyYXNlYmxvY2tzCj4+IC1yLS1yLS1yLS3C
oMKgwqAgMSByb290IHJvb3TCoMKgwqDCoMKgIDQwOTYgTm92IDE1IDA4OjI2IGJhZF9wZWJfY291
bnQKPj4gLXItLXItLXItLcKgwqDCoCAxIHJvb3Qgcm9vdMKgwqDCoMKgwqAgNDA5NiBOb3YgMTUg
MDg6MjYgbWF4X2VjCj4+IC1yLS1yLS1yLS3CoMKgwqAgMSByb290IHJvb3TCoMKgwqDCoMKgIDQw
OTYgT2N0IDI0IDA4OjU0IHJlc2VydmVkX2Zvcl9iYWQKPj4KPj4gV2l0aCBteSBwYXRjaCBzZXJp
ZXMgdGhlIGZvbGxvd2luZyB3aWxsIGJlIGFkZGVkIGZvciBub3JtYWwgYnVpbGRzOgo+Pgo+PiAt
ci0tci0tci0twqDCoMKgIDEgcm9vdCByb290wqDCoMKgwqDCoCA0MDk2IE5vdiAxNSAwODoyNiBt
ZWFuX2VjCj4+Cj4+IElmIGZhc3RtYXAgaXMgZW5hYmxlZCAoQ09ORklHX01URF9VQklfRkFTVE1B
UD15KSBhbHNvIHRoZSBmb2xsb3dpbmcgaXMgCj4+IGFkZGVkOgo+Pgo+PiAtci0tci0tci0twqDC
oMKgIDEgcm9vdCByb290wqDCoMKgwqDCoCA0MDk2IE5vdiAxNSAwODoyNiBtYXhfZWNfZGF0YQo+
PiAtci0tci0tci0twqDCoMKgIDEgcm9vdCByb290wqDCoMKgwqDCoCA0MDk2IE5vdiAxNSAwODoy
NiBtYXhfZWNfZmFzdG1hcAo+PiAtci0tci0tci0twqDCoMKgIDEgcm9vdCByb290wqDCoMKgwqDC
oCA0MDk2IE5vdiAxNSAwODoyNiBtZWFuX2VjX2RhdGEKPj4gLXItLXItLXItLcKgwqDCoCAxIHJv
b3Qgcm9vdMKgwqDCoMKgwqAgNDA5NiBOb3YgMTUgMDg6MjYgbWVhbl9lY19mYXN0bWFwCj4+Cj4+
IElmIHlvdSB0aGluayB0aGUgYWJvdmUgaXMgdG9vICJibG9hdGVkIiBpbiB0aGUgZmFzdG1hcCBj
YXNlIAo+PiAoQ09ORklHX01URF9VQklfRkFTVE1BUD15KSB3ZSBjb3VsZCByZWR1Y2UgdGhlIGFk
ZGl0aW9uYWwgZmlsZXMgaW4gdGhlIAo+PiBmYXN0bWFwIGNhc2UgdG8gdGhlIGZvbGxvd2luZyAo
TW9yZSBzaW1pbGFyIHRvIG15IFYxIHZlcnNpb24gb2YgdGhlIAo+PiBwYXRjaCBzZXJpZXMpOgo+
Pgo+PiAtci0tci0tci0twqDCoMKgIDEgcm9vdCByb290wqDCoMKgwqDCoCA0MDk2IE5vdiAxNSAw
ODoyNiBtZWFuX2VjX2Zhc3RtYXAKPj4KPj4gVGhhbmtzLAo+PiBSaWNrYXJkIEEuCj4+Cj4+IC4K
PiAKPiBIaSBSaWNrYXJkLiBMZXQncyByZW9yZ2FuaXplIG91ciB0aG91Z2h0cy4KClRoYW5rcyBm
b3IgZmVlZGJhY2suCgo+IAo+IDEuIFdlIG5lZWQgdG8ga25vdyB0aGUgb3ZlcmFsbCBmbGFzaCB3
ZWFyLCBpbmNsdWRpbmc6Cj4gIMKgIDEpIElzIHRoZSBmbGFzaCBvdmVyL2FwcHJvYWNoaW5nIGxp
ZmV0aW1lPyAtIHRoZSAnbWF4X2VjJyBjb3VsZCB0ZWxsIHVzCgpPbiBtYW55IGRldmljZXMgbWF4
X2VjIGlzIHByYWN0aWNhbGx5IHVudXNhYmxlLiBUaGUgcmVhc29uIGZvciB0aGlzIApiZWluZyBw
cmV2aW91cyBidWdzIGluIFVCSSBjYXVzaW5nIHNpbmdsZSBmYXN0bWFwIGJsb2NrcyB0byBiZSB3
cml0dGVuIAptYW55IG1hbnkgdGltZXMuIEZvciBleGFtcGxlIGEgc2l0dWF0aW9uIHdoZXJlIHNp
bmdsZSBmYXN0bWFwIGJsb2NrIGlzIAp3cml0dGVuIGUuZy4gNjAwMDAgdGltZXMgYW5kIHRoZSBy
ZXN0IG9mIHRoZSBmYXN0bWFwIGJsb2NrcyBiZWluZyAKd3JpdHRlbiBhcm91bmQgMjAwMCB0aW1l
cy4KCj4gIMKgIDIpIEhvdyB3b3JuIGRvd24gdGhlIGZsYXNoIGlzIGluIGRpZmZlcmVudCBhcmVh
cz8gdGhlICdtZWFuX2VjJyBjb3VsZCAKPiB0ZWxsIHVzIHRoZSBvdmVyYWxsIHNpdHVhdGlvbiwg
dGhlICdtZWFuX2VjX2RhdGEnIGFuZCAnbWVhbl9lY19mYXN0bWFwJyAKPiBjb3VsZCB0ZWxsIHVz
IG1vcmUgZGV0YWlscyBpbiBkaWZmZXJlbnQgYXJlYXMuCj4gIMKgIDMpIERvZXMgdGhlIHdlYXIt
bGV2ZWxpbmcgYWxnb3JpdGhtIHdvcmsgY29ycmVjdGx5PyB0aGUgCj4gJ21heF9lY19kYXRhJywg
J21pbl9lY19kYXRhJyBjb3VsZCBiZSB1c2VkIHRvIGp1ZGdlIHdoZXRoZXIgUEVCcyB1c2FnZSAK
PiBpbiBkYXRhIGFyZWEgaXMgYmFsYW5jZWTvvIx0aGUgJ21heF9lY19mYXN0bWFwJywgJ21pbl9l
Y19mYXN0bWFwJyBjb3VsZCAKPiBiZSB1c2VkIHRvIGp1ZGdlIHdoZXRoZXIgUEVCcyB1c2FnZSBp
biBmYXN0bWFwIGFyZWEgaXMgYmFsYW5jZWQuCj4gMi4gS2VybmVsIG9ubHkgcHJvdmlkZXMgbWVj
aGFuaXNtcywgdXNlciBwcm9ncmFtIGltcGxlbWVudHMgbG9naWMgdG8gCj4gc2F0aXNmeSB3aGF0
IHVzZXIgd2FudHMuCj4gMy4gSSB0aGluayBwb2ludHMgMS0xKX4zKSBiZWxvbmdzIHRvIHVzZXIg
cmVxdWlyZW1lbnRzLCB0aGV5IGNhbiBiZSAKPiBpbXBsZW1lbnRlZCBhY2NvcmRpbmcgdG8gdGhl
IHJhdyBlYyBzdGF0aXN0aWNzKGRlYnVnZnMgaW50ZXJmYWNlLCBvciAKPiBhY2NvcmRpbmcgdG8g
UmljaGFyZCdzIHN1Z2dlc3Rpb24gcHJvdmlkaW5nIGEgbmV3IGlvY3RsKS4KPiBXaHkgZG8gSSB0
aGluayBwb2ludHMgMS0xKX4zKSBiZWxvbmcgdG8gdXNlciBsb2dpYz8gVGhleSBhcmUgY3VzdG9t
aXplZCAKPiBhbmQgY2FuIG9ubHkgYmUgdXNlZCBpbiBzcGVjaWZpYyBzY2VuYXJpb3MsIG5vdCBs
aWtlICdtYXhfZWMnLCAKPiAnYmFkX3BlYl9jb3VudCcgYW5kICdsZWJfc2l6ZScgd2hpY2ggYXJl
IGdlbmVyYWwgZmVhdHVyZXMgb2YgVUJJIGFuZCBiZSAKPiB3aWRlbHkgdXNlZC4gRm9yIGV4YW1w
bGUsIGlmIHNvbWVkYXkgb25lIHVzZXIgd2FudHMgdG8ga25vd24gdGhlIG1lZGlhbSAKPiBlYyBj
b3VudCBpbiBkYXRhIGFuZCBmYXN0bWFwIGFyZWFzLCB0d28gaW50ZXJmYWNlcyB3aWxsIGJlIGFk
ZGVkIGluIAo+IHN5c2ZzLCB3aGljaCBsb29rcyBibG9hdGVkKFRoZXJlIGFyZSB0b28gbWFueSBi
ZXNwb2tlIGludGVyZmFjZXMgdW5kZXIgCj4gc3lzZnMpLgo+IAoKQFJpY2hhcmQgV2VpbmJlcmdl
ciwgZG8geW91IGFsc28gcHJlZmVyIGFuIElPQ1RMIHNvbHV0aW9uPyBTaG91bGQgSSAKcmVzZW5k
IG15IHBhdGNoIHNlcmllcyB1c2luZyBJT0NUTC4KClRoYW5rcywKUmlja2FyZCBBLgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
