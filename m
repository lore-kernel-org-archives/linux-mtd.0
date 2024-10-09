Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958AECEDD94
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSCUFK0k0PZ716eOG0kfm95pycojbX3/10tJ9G+6XQ8=; b=EH0SCgLZk6pdkynCiTNM+e3LgZ
	nBQk19J09r5VMyXayqTzacc7MSDwTzvajBWVeaYTz+E0BjXC23RhHl/Ka8Nntnsze99YioeuTWBZ5
	tILfxuSNbhbYFj4T0gE3+FfW/g0nmfbkgiZfcmgqOU0sYB4wYuWZ3rkDmJpKdMa+/DRHmtjDVX6CI
	f9+3GbVNeymAyC4AZRDz0gAvzGG1CB8Y21CWShHgfFA+vrh2sxJaR9GLedmoKf4kDFgBiB0qAm+Gq
	iB6aC6uaoRZMKlnnBOzaX+FCl3lGKw7qy5LHbq9D184aTf7AKm8xw+sMTvvHB93d51Z8CuYELgP3Q
	YC1iZr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syX0x-00000009SpZ-047H;
	Wed, 09 Oct 2024 13:46:07 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWzw-00000009Se7-240Z
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 13:45:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URoss8Xpf2C+Ny8NilniTgyoS1ixWTVeXREagkkB8thJopybqM131kwIl8kBejRA+CFeUdKX9kE4PXDe3MDo1U1LZ18mVPgc+ohG2oVZi81VdCcu2elodfdwTO/gXw8Mr0LtekLBGVanfo0L3dt4rdJmDEMRaQsmsVEM4OiE0pX5v+Spp03eWEN7BWRatCOxMmjn0Trp2f2KRALzZJM9Lc+98d6lp5LWr4HoT+9hg/6IzIfXilru99g679zVx9VltGgS1qtFR4FZHxawpxPO8+5UVllXd+xPfCsRdO1TBu5OJPGFlsg7hy8HpQrCRPlQtgrtn3298PcoZrJDt9aPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C86Whm5ZZPJ+RGlLsWR7f4tOGA3NcuU/LChtI1XgkSU=;
 b=v4wdsbfEfu5XnfAg70eAOO/zr4PV2rwpRyX+vxVnQRMFoBq4Jg4/7Mqx+U7+EvpHTN0iNqF9uNgfj2IlZ7eCimDamzno+5WZ5POTFZ5+S9VvzwzVzcvBcZSc+rrLp+MZTm/JLV5G639eIkLpD95fIX7yW+r5J445KHssXmYiXDt+gRv4VZmwqcOme+Yr1tbm5jXqalEeCKfqHQgonePWYY7gFq62viaHU4K5VsaO0ZQ9Qww0US2G+yYFMKO1Dq1xAImUO9A2kwkCWkQ12rcddwP98wUA5htl+1L1PE0DKV5sGQ6qrSOX/iaoNuZd9VfdoJxgdk8aPBmqeXHTRTY/9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C86Whm5ZZPJ+RGlLsWR7f4tOGA3NcuU/LChtI1XgkSU=;
 b=cFe9YY0XrbswjkDCg2jdsYknWNAhEh02Ab0caKWQ94Tv6eDx1qda9IlwgSQONrp8NweDDtYdxShMhZa3/cuuDo0+tf6lZ/hDXWYZ/+ghloTBY/qUAhd22amImCe84iKLLXD2dg0+rwsZ9NjhG+F4orgraTpVwQrblyE6cB/0zSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
 by PRAPR02MB7932.eurprd02.prod.outlook.com (2603:10a6:102:292::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 13:44:58 +0000
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1]) by AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1%2]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 13:44:58 +0000
Message-ID: <62bf5f12-cae1-d3d9-bebf-7b30ed81a726@axis.com>
Date: Wed, 9 Oct 2024 15:44:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/4] ubi: Expose mean erase counter for fastmap in sysfs
Content-Language: en-US
To: Zhihao Cheng <chengzhihao1@huawei.com>,
 Rickard Andersson <rickard.andersson@axis.com>, richard@nod.at,
 linux-mtd@lists.infradead.org, rickard314.andersson@gmail.com
Cc: kernel@axis.com
References: <20241004082208.1103202-1-rickard.andersson@axis.com>
 <20241004082208.1103202-2-rickard.andersson@axis.com>
 <1351167a-6313-9e98-eafd-c8c9e6fe1a5f@huawei.com>
From: Rickard x Andersson <rickaran@axis.com>
In-Reply-To: <1351167a-6313-9e98-eafd-c8c9e6fe1a5f@huawei.com>
X-ClientProxiedBy: MM0P280CA0045.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:b::8)
 To AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9505:EE_|PRAPR02MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: d55138b9-aa95-4a9a-1610-08dce8689081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rlh3UGtkWnAxTEYxSmFvdDRPR0drTm1ETFh3cXhPaHJmY2RLOFNoZngrWE9Y?=
 =?utf-8?B?ekZjT2d0RmFWK0RaN1M5cFRkaHF5T1kvR3E5QWFqaTFFTFEzSHNDbGVITHFM?=
 =?utf-8?B?V3did0xlL0pGN25wSlFzV0JJYS9vc0hkcDF4SUh0N0R6TTdVQXF0Z1J6RnNU?=
 =?utf-8?B?QVRwSzF1M3VTTGZkK0Z3Vk1teUtwUmJQVGI3Q0JFSXBNRCswY1pYc3F1dVVP?=
 =?utf-8?B?WlIxMmtVS3NNT0hsdjVXWTBqYU15NnY0Z0l2bUhZaXMwTEJXQXlWY0ZiSkVM?=
 =?utf-8?B?elZMQ1RLLyt5R05IbGFia1VEOUZPdFVXSjBnZ1NNTmV4WU5lM1JjVi83aFlF?=
 =?utf-8?B?QUZtdWF6UDkraE5XbU1BcTlmbVNzT3lCZFFhSzVIcGRsK255UTFGY2tBcnBW?=
 =?utf-8?B?S21Ib2JabllkdlRrZ29NRDdlMjFoRVREeGdNUDVhYzN3Ty9id0k3NU9Ua3Fx?=
 =?utf-8?B?aEtTTGJNNWJ2MFVSUFFyWkJnNHkxS3J3eE14Tlc5bkZyVWlpejFscFlUSzBp?=
 =?utf-8?B?cm9xdElvUkt3MjZwRkNCQm03eDcrMXkwZWYyWDNEQ0F5R3MyckFWbnNBT3lx?=
 =?utf-8?B?VTN1OXZUOFl6NVlWRHBUSU5taTlCZk8rd3FFQzlzSFA4TW1rZmU1ckFUM2JW?=
 =?utf-8?B?djNyLzRPNGlYcVFiUFVWTnZTQ2FVMGpMTmkveGtUd1FOQ0VjRFVabWYzeDNE?=
 =?utf-8?B?Zm1LRkJ5TnpvbE45b0hJVHovSWRaK2ozb3dsOCtlejZMM0VKRHZWYnVDNnpm?=
 =?utf-8?B?ZUxJK3AwZ1pzamhWTGhScXdkdTRlcFpYUy9CbFdTY1R4MTFMS25Fd0xyMGtO?=
 =?utf-8?B?NG54aWU4THpjejRBL0l6bkszQnZCZjNWL0NPOEgveGdXbGVoWVJwbkdlY3JM?=
 =?utf-8?B?U1AwYVBtM3NDMExCdUw1ZmJXUTVmUlVTOGxBSTREdUdhYStzQlZzYVVXV3Jz?=
 =?utf-8?B?dllQRWdlN3BiTUo3dXdBL2YrZU1tTThIaW1EbkR6WTBlM2NkdElvQmxmNEJ5?=
 =?utf-8?B?M00weVFmNkRVQ1pOcWZGaG9hRi9ydDlIWEROWFc2T0xFN0NGMjdSUCtLblgz?=
 =?utf-8?B?aFlndlgrdm9IRForWjV2dmNVR2FzVElvMHpBMnZ0Ym1MN2FqNEpIWmcwWUto?=
 =?utf-8?B?ZjFKenRaSGVPQXczVlN0UVlqaUdDYnJvQ21ROHFSWGV4c01tSFlneXJMTnZ5?=
 =?utf-8?B?Mm5Mb00vd0o5cU5OdDNjNExrMWlMZExFbXFoOENNMHFLY3pWOUNJN1h0dUdU?=
 =?utf-8?B?ZU94d3NBQ3NHZDhHV2pTditoOTZLR2lCaEVIKzBRR2lOWnF0bWFySUtydGNw?=
 =?utf-8?B?bDFUWVlTZ05NUnp1SFhZYzQxRW4zdTVZcU1RckNrSFU3MWQ0cHBpN1lhMGFT?=
 =?utf-8?B?bWZFKzd1OGtWWm5ZcXlReDVkSjFJTTdoZVZFSmxrTzIwQ0QwSjNCMTFveGJH?=
 =?utf-8?B?Qktsb1ZnamxLSnRTclp2UHVkS2pFckpSV2NFZmtoMWpIOTVacjgrbGFkY3A0?=
 =?utf-8?B?Y0FhMVlRazRjRlRSYWxWMzQreC9KV3ZSNm0vREFVOWczNmhoVTZCQW5TTTY3?=
 =?utf-8?B?eVkyeUVtNUI1aTd1RG5Hblp0Z0tQQUUySVF5VW83OElIQkpRa0FLbk1ycjhP?=
 =?utf-8?B?QS9vKzZFZzFtYU5PQ0NiOEtVenJBQzlsNDAvOXl6bElWWjYvc3lsQkw3VHhS?=
 =?utf-8?B?d3M5WWZqOXBRWDNjZXpZR1U5Vkg1QjFUai9wRWYzOGhlKzc4Y0FnMmVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9505.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzIvNFExN2ZCVCswdDlPNEFtUSsrN0EwdE5jL0VTcnhwb2l1VWNMcFdPZDBu?=
 =?utf-8?B?SmZIY2p0QXNFa2pEWHgvMzBLYzBMMFluVndCT1VneWlRZFdTSG80VVVGWjM2?=
 =?utf-8?B?azhWSUxPdnpUa0hseHRBa0tEYXNmSlhjV1RxSnpLTEl6SThzTWZzZmMwcE1o?=
 =?utf-8?B?b3hkZnNUTW5GbDV4ZGp3UTByaEwzYkk3d1JxUlkydW9TNkEwdW5IQUU1NUZx?=
 =?utf-8?B?MDZZZUV3M29uby9iSHhaSENjYjUzdkNpOHFHWVM3ZGxmSy9WRkcwWk5KcXVh?=
 =?utf-8?B?N2JrMy9IRHpyQjJTRE91akdXYXRGM0szQ3dPRG5RUlVvZFlkZFhxSDBaQTRu?=
 =?utf-8?B?Y0xTNk5YbzNhOFprYXZ3Q213YmlxcVVJNWNyY1cwMEVPcUd0Z0FLdXc1VENv?=
 =?utf-8?B?N0pjV25kTEhkT2hUaldqdi9oWWRYZC9GMG9qTTdtRXU3cFVuMVZ3OVpOVGVk?=
 =?utf-8?B?Zk0vSXVQb0prL1Z2Q2U3d0hNWWI5aWpjNnZCS2NjS0RWcm9xcU1yWi9hZDFy?=
 =?utf-8?B?TFFPSlhQMU9ULzlqemZmUUpWd1VMdG1uRkU3N0l4ZW9tdXNxcjZreHMwSG1C?=
 =?utf-8?B?RXZ1dU9QMVVCZG1qYjFCM0NQc0NDR0NHWXkvVTFqdGw1c1pYUVRZWmxRWXdj?=
 =?utf-8?B?Mk10YUx3SjgzTmRRM2kyb3ZJbDdia2dJZjNjSDRsZ1ZwVUlHaG14VVRVd1Bs?=
 =?utf-8?B?eHkwSk1uQklLSXgvUkR4bVZnRWtQNXlMcFhQcVlLeE92MWhMWDVQditmK3VF?=
 =?utf-8?B?S0VjenhOa2tKZS9xMStVTDNTeERHbmhWeGh0dUR1Skl3emd5bHlwNHNPaTNN?=
 =?utf-8?B?ZnFJd2tYYVVkWEZrU1RySG4wR2U4NFN2UTNRVnY2bjFIVGYyZ1kvN2RxcWgv?=
 =?utf-8?B?dTNRcGwvNHNMbFBDeitpemlmUnZIOUlpSTVnMlAycDhVSFRuZjVKUGovVnVB?=
 =?utf-8?B?NHdCV1pmK2J6Sm0xdS91bVRhZ0E5TU11L0JoZG1wMkg4RmZyeXdOanU0ZVhw?=
 =?utf-8?B?MWUxTURXY01ZQUFoWmpBZmZmV2pQcU1zN3FXYlRDdWhGRk05akJ6Sythc2o5?=
 =?utf-8?B?ZU1iU0M5UUJPYkxVSkZnRWNibVZJU2NmMTVaYXB5dDFvT0VwZnZSckhIN1Fy?=
 =?utf-8?B?dk5Bcjd5RHQ1cTNIUUlSOU10cG5Sc3A5RWdpVWV2STg1azVsR1BzTGFmY3Fy?=
 =?utf-8?B?S2pCcEtlZG9ZTTF1dzh0ZGhNUUw3RVVIb3FXMEFSMmRUcU5TaG91V0FzS0s3?=
 =?utf-8?B?NTBuUHkwSUZjV0JqbjVnNFJVbnhTRFpOcGpSbERxcngyTk5URUZRMjhjd1hU?=
 =?utf-8?B?dElaSHR5YndDUnRHdGhuVXhaenhtM0c0Y0FySjZOQUZWUmNJeDhDa0xXU3RY?=
 =?utf-8?B?ZThpVHZlUE9IS2xIeVdIU2dzQnV3MWl0aEtVK01ldG0yM3NYNlMwSjkvYklB?=
 =?utf-8?B?bm5QKytBaENZT1NaUWJJM0V6UmhRVXUxWWhxRnFhekpOVG43Q3pIKzNaMVpz?=
 =?utf-8?B?UyttbUtUVTcwTlo4RVhOaXdzbFRpZ3hMRkh1bDM0QWlxUmYyNFJ0SlYzMDVE?=
 =?utf-8?B?emllNFJycWY3eXBZbnRXMEE4UFZXcU84bng1YU1ZTEhQWElyckp4TXErQ2k1?=
 =?utf-8?B?Ulk4NHByZWpxc2ROVXI0WDl3bE1kalRkQlBwdGl0M3RkaXU2MEdmZE5OWTd2?=
 =?utf-8?B?ZVAzUFRMTmk0VzE5TFFuYUNsaWhicEtneHNNckZ1blpETFVZRkRYb0hOQnNL?=
 =?utf-8?B?UGMrWTJDdVp5cTJmYXhOMTByRlcwcmFOQ3dpL0grR01ISU9FZDRBWGhFZHNV?=
 =?utf-8?B?TFEzUDNyaldjRnR4L1NBMHRwZzZlYVNnSXR4YTl0RGt1MmI4QTNGVm5qdGpP?=
 =?utf-8?B?R0MzcStFVlJiRG5xcFU2NVV2ZHJBdWNuZGFKSTR3WmRzOVo1Tm9TdjR3TCtq?=
 =?utf-8?B?Ly9OWDhpd2dJQlFxTFBHTkNXbHBEVWFYT1ZtdVFoYXRiZmVlaUx6TUp4Z2hq?=
 =?utf-8?B?OGRZT0s4WHE1MU9pZy8xUWQ4T1p3UkUrNTBOa3dGZlpHSEtGWmFJTUMvWG5k?=
 =?utf-8?B?OGwwZGVlOXNYRU5TMnVrQTExUmFBZE5NTEtpd1Z1cWxWVFRlSEszWmxSR0kw?=
 =?utf-8?Q?nWBR+o2o+o774BK2igudgsT5q?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55138b9-aa95-4a9a-1610-08dce8689081
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9505.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 13:44:58.1769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMawkzR/UxopHHEJ2NlmY5RBP+Cs3cfJWxT8x8j/kmeQ/fbkOPFdQEhCKaXi5Zvf3+dR8pNZKmgsq3DkpxsIhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR02MB7932
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_064504_731955_71B5559C 
X-CRM114-Status: GOOD (  18.57  )
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

T24gMTAvOC8yNCAxMToyNywgWmhpaGFvIENoZW5nIHdyb3RlOgo+IOWcqCAyMDI0LzEwLzQgMTY6
MjIsIFJpY2thcmQgQW5kZXJzc29uIOWGmemBkzoKPj4gU2luY2UgdGhlIGZhc3RtYXAgYXJlYSBo
YXMgaXRzIG93biB3ZWFyIGxldmVsbGluZyBpdCBpcyB2YWx1YWJsZSB0bwo+PiBwcm92aWRlIGEg
bWVhbiB2YWx1ZSBmb3IgdGhhdCBhcmVhLiBUaGlzIHZhbHVlIGNhbiBiZSB1c2VkIGluIG9yZGVy
Cj4+IHRvIGVzdGltYXRlIGxpZmUgZXhwZWN0YW5jeSBvZiB0aGUgZmxhc2guCj4+Cj4gCj4gVGhl
cmUgYXJlIDIgY2FzZXMgc2hvd24gYXMgZm9sbG93aW5nOgo+IDEpIGZhc3RtYXAgaXMgZGlzYWJs
ZWQ6IFdlIGNhbiBkZXRlcm1pbmUgd2hldGhlciB0aGUgd2Vhci1sZXZlbGluZyAKPiBhbGdvcml0
aG0gd29ya3MgZmluZSBieSBjb21wYXJpbmcgJ21heF9lYycgd2l0aCAnbWVhbl9lYycuCj4gMikg
ZmFzdG1hcCBpcyBlbmFibGVkOiBUaGUgbWF4X2VjIG1heSBjb21lIGZyb20gZmlyc3QgNjQgUEVC
cyhmYXN0bWFwIAo+IGFyZWEpLCBvciBpdCBtYXkgY29tZSBmcm9tIGRhdGEgYXJlYShwbnVtID4g
NjQpLCBob3cgY2FuIHdlIGRldGVybWluZSAKPiB3aGV0aGVyIHRoZSB3ZWFyLWxldmVsaW5nIGFs
Z29yaXRobSB3b3JrcyBmaW5lIGZvciBkYXRhIGFyZWE/CgpUaGFua3MgZm9yIHRoZSBmZWVkYmFj
ay4KCk15IG1haW4gZ29hbCBpcyB0byBwcm92aWRlIG1lYW4gdmFsdWVzIHRvIGRldGVybWluZSBo
b3cgd29ybiBkb3duIHRoZSAKZmxhc2ggaXMuIEkgYW0gc29ydCBvZiBhc3N1bWluZyB0aGF0IHRo
ZSB3ZWFyIGxldmVsaW5nIGFsZ29yaXRobSB3b3JrcyAKYnV0IHRoYXQgaXQgcHJldmlvdXNseSBo
YWQgYnVncywgd2hpY2ggbWFkZSBpdCBkaWZmaWN1bHQgdG8gdXNlIG1heF9lYyAKdG8gZ2V0IGEg
Y29tcGxldGUgcGljdHVyZSBvZiB0aGUgd2Vhci4KSSBjb3VsZCBhZGQgbWF4X2VjX2Zhc3RtYXAg
Zm9yIHN5bW1ldHJ5IGlmIHlvdSB3YW50PyBUaGVuIEkgd2lsbCBtYWtlIAptYXhfZWNfZmFzdG1h
cCBjb3ZlciBibG9ja3MgMCAtIDYzLCBhbmQgbWF4X2VjIHdpbGwgY292ZXIgMCAtIExBU1RfQkxP
Q0suCgo+IAo+ICdpZiAoIXViaS0+Zm1fZGlzYWJsZWQpKScgaXMgZW5vdWdoLgo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwZWJfY291bnQgPSBVQklfRk1fTUFYX1NUQVJUOwo+PiArwqDCoMKg
wqDCoMKgwqAgZWxzZQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsgLyogTm8g
ZmFzdG1hcCBvbiB0aGlzIFVCSSBkZXZpY2UgKi8KPiAKPiBJZiB3ZSBmb3JtYXQgL2Rldi9tdGRY
IGJ5IGNvbW1hbmQgJ3ViaWZvcm1hdCAtZSAwJywgdGhlIHJldHVybiB2YWx1ZSAnMCcgCj4gbWF5
IGNvbmZ1c2UgdXMsIGl0IG1lYW5zIHRoYXQgdGhlIGZhc3RtYXAgaXMgZGlzYWJsZWQgb3IgdGhl
IAo+IG1lYW5fZWNfZmFzdG1hcCBpcyAwLgoKRG8geW91IHByZWZlciB0aGUgZnVuY3Rpb24gImRl
dl9hdHRyaWJ1dGVfc2hvdyIgdG8gcmV0dXJuIC1FTk9ERVYgaW4gCmNhc2Ugd2UgaGF2ZSBubyBm
YXN0bWFwPyBJLmUgdGhpcyBiZWhhdmlvcjoKCi9zeXMvY2xhc3MvdWJpL3ViaTAgIyBjYXQgbWVh
bl9lY19mYXN0bWFwCmNhdDogcmVhZCBlcnJvcjogTm8gc3VjaCBkZXZpY2UKCkJlc3QgcmVnYXJk
cywKUmlja2FyZCBBbmRlcnNzb24KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
