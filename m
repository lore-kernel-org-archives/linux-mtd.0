Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81755C79FB7
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 04:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKI1DF2CtYkPfVnUs7WWle54vjyEi+gohaRnuaipX6w=; b=rETGWc6ku7+h/OsIgtFLHUM8OR
	uFSuENwIPFbYXkvAfyHfxy2+oUcsunXtpkU82ddn8QkweUmnjIE8Me4OZcIeqnatX4Un/cZS1VfjJ
	Tr+XePXvaziXzKHqFQ89ZHKAl3CzGd2yC/PAOD483E3jS9xobQL8QvZXYpJ+DU8iUeSKcPun8U6L/
	Er/0pqEWXSnkSsY/Z+Gx2IengqKGLKvpgQnm/ekQMmK7FRAfqc0vh2NgY8aDO4pdAIyyf+ErXUd+0
	itrmpeEVvjzFUw3YcRxWOWQhE65SWyn3A47zWwdpkm7sKTGgSu9PoHYEcVIgMHc5BK9GQvrikxL+1
	fG+ViiOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WYM-0000000DNXE-3IEz;
	Thu, 10 Sep 2026 04:38:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WYJ-0000000DNWq-3zTk;
	Thu, 10 Sep 2026 04:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4avYTOybJcphXh+dSShvT7IkPONnC3MAzVpxKuyAUIA=; b=S9ZSUag7UZZAnhDJfN1ND/uZtj
	snZKsNFZ1KsFaXADgbW639NTN/057mlMhZESuqgBSVc98Q5G7xod3RnSHQowDYfs3C9ylBZAaZ8Py
	OoJ0cF9oD5EI/GzZYU8m+CT3le/9QZuHTFe/JG3sD58H48mdjQVjATUTEF/PvBU5ecl69x1MuZpkS
	NEFduoZJnDNLVS6+M7ekXo2QE2xVONaAB9EvmL266qzEt1TiavgLYPCIxhQH7UlPFubYNm4Py42Ck
	oZWjEs6BnOR/yHdxgqF+pn3Njq2NQg2SbvecMsEqdjoMSCZZC9jeqSzUPOVjyrfGXDv2w65n4WrIz
	0lwuwUUg==;
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4WYG-000000020au-1aNj;
	Thu, 10 Sep 2026 04:38:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FggLrpQvPJJPJuGP0bbRjNRpx4L8Y4BV+j31C51p7fzV8kJW/CoTQwb4sAquFm4XZi11lFwHKW9UpWIJOHRGd4v+8zJ5dGi27kGXhuYvbHMNgmq2VeuNJCptMbjmoEU3Z9EWz42VOvR+PNGlXuf6SyTeg/ByNZkKAxbWSX4p9802e1qsPxBSE4EUdSusF1q3ujGji/UeaTTDA7SmvaQFfQGh+kbz4eHcNGJPG6DLBtm7ZSoDyir48DRKvX4emaxZn6S4fCeYRjf/rHqkEwiGWeahp70jwp2FqQYafODi/L/Vq7Tsi1t5h9iQP0wE1FwO3gloWhPIDi7MEZ382Ik6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4avYTOybJcphXh+dSShvT7IkPONnC3MAzVpxKuyAUIA=;
 b=phAgrFM2UaRjWiN+g2ELLFmxoRCzjamZ+iQxgqOVCHl6sg8KDDqja9Fwh+pMy3jG+/uPOpEd7I1PXY8EvSoGbXIuJGu+26keFmgUjhcWWJULIHbdvBjf+e9kPkOntGi9p4HOc8MoE4pQ+3OLSAHkIR74OGQVsasI0tARDU26hGHK6Czx3GHjRaEbO/WZN8mZw/xoQCmprLezOCEhUr6mNXzxV9K6+1Nyg3FUS5zbHpJmmoSb/8odqz/CmloKr1n+uWySVGpQ6dCrrYBxKJ0gSl7AvD+S/2lWbGD6T3ueJTMayfDGWKWolh0JyPMBnpbQJNuHFkNAnAI8OihLu1p4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4avYTOybJcphXh+dSShvT7IkPONnC3MAzVpxKuyAUIA=;
 b=L2ByhT/a8E1GNplgDWy1+HFG8QumkZj9XBULy9Gj2Up0k/dKr/vzU2BongAGq3u6BIie1VfSfgQwsdmhXAVFJ07JSo1QqoAZ726nNqo3FcFjKXWVUg89mKfFwBHRxtYRMImH9htEmeS0FZm5Hu22weVUqTC72ydvjeGc4DnENZi6CfZJv4N0jFoiSPaJWGRgnPbjGX1SI05A+F1rIJ5zVoFbW2XfOmR2AQ9cS+oMDERikfnhQop7HYeS1RofPXMOi5hV1upusANcN6VqAMrqQmn+bn76j0qUVRNQcuFyFEznBK5O3+HAOyZGvQ8UY1AjCiOZDuCFzpkP8uobX1QRTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by SA1PR12MB8968.namprd12.prod.outlook.com (2603:10b6:806:388::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 04:38:08 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%6]) with mapi id 15.21.0382.014; Thu, 10 Sep 2026
 04:38:08 +0000
Message-ID: <b78b8e6a-2fab-489f-aa1b-a2ab23051794@nvidia.com>
Date: Thu, 10 Sep 2026 05:38:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/25] mtd: spi-nor: Refactor Read Status/Write Status
 support
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
 <20260904-winbond-v7-1-spi-nor-rv-addition-v5-3-2909a45fe4fa@bootlin.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-3-2909a45fe4fa@bootlin.com>
X-ClientProxiedBy: AS4P195CA0023.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::14) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|SA1PR12MB8968:EE_
X-MS-Office365-Filtering-Correlation-Id: 99bcb86d-52a7-475d-ae6a-08df0ef55002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|10070799003|23010399003|366016|921020|6133799003|3023799007|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: S1HI7Nkdoko/UKaBcqLQVCZqXTLngbxUBRih2HsLKd6cFAw7szBVQnOlzTn7vdY04hL+EC9O4e2pFLF0mQQqZjDdzRJ7m5K4fAutQG2rfkIf92K/ELAi5el3BUNNGREcfG7xsALI8044IqvEofcruy/4i7hWwf2jx/RVfRvI6A3OrfXVXLhRB91tUWp2bQijzYyXLUxRitepMjH3ERI3iQQK0quFhsoWODBsTyrORiU1tzMFI9GxRKGA4GeTT55eL49oGTt87BKhHL3LRtCuVHJEaRp3nTWqBQBptDn2ttdiExxY6bw8/8dMlI6wSXdutJBUM2GQcxsKejTwqA4Rb55maFdnZXRbxJKSjEReqhWm+saFZ3bLkghLdBEADDK8uOs0edKrNFxSqbkWiBSwdtObKkA53ayEbr0fKMK+F7aB1hgP5TH27KVYnyvh7i/GpkfuPtQO2McVjbeVhdIXbx4LHSHgIuN1PA9L+wz9/Hl5G54ogv67j7pWfRbQM3vnp87+m1CUxXaGNDFNKaUKivuAWBFlCUA2CM6P3H6CQmixFb6GFClS0k8Kqz0uRraHwXmlwN8Mc4+2d2nQOj+kWBeQJxH/UcDVJIpnLCzav9aD/thYLLRpPAwyozxKWNPr6UW6Yk04aaXiP81S7p3tQ2ha4iPctlutaOkC3HHNYaxqyaUVfSqVPA/JDlVvWxHHELnH7RI7VK42wpkl3qJn0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(10070799003)(23010399003)(366016)(921020)(6133799003)(3023799007)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFdHYUhvSzQ1ajE2Q1haVjVIRXJ3UUx6bTZ5TEEvY2N1VEhsbWRFNjF1cEs1?=
 =?utf-8?B?RnFtZzQzenVPTGluUE96aGtlQ1pVS1VoM0VTWUQrd2I2YmZNeVBMNGx3UjFm?=
 =?utf-8?B?eHNJdnhMSFZyT1BRZzN2OG1qRitNNjlMVC9tb0hYNTlDNkF3bjVFaHNoOU5O?=
 =?utf-8?B?Z0FyT0dBM2lLeU5kbHEvbmVwMVNnVGFVSzJHdDZjNXJvc3NVcDcrWStxOHFo?=
 =?utf-8?B?UDI4a2pybEhlbGNEbk1sMUE0bkVFbkM2Qm5FNUhaUXB1cnIwaVc2ZTlNVUt0?=
 =?utf-8?B?SEcyWEpzNVpuU3RZK0Z6MXlOMnJMRHBGc25JRTM1NFVoSXpneFZvTjc0dWRP?=
 =?utf-8?B?eXRlb0VrRU9ZQXpiM2VMcG9pRFVwVTRDSGRISWFFV0tXZmh5SUFSVUVTYlN0?=
 =?utf-8?B?MFdqOWQ3Qk5laURZQU5DOXpRN0FvcGtwOGNqNTI5d0dzcmh1Z0xEbEV1Tmxp?=
 =?utf-8?B?T1pDSTFJNXVickE2YVczRDJEZEVtd3hIYlJUTE5oQmZUMnA3akNzNkZYSk9X?=
 =?utf-8?B?UTQ2elJhUXpxZFFCQ2Y1Z0xVNyt5OTh5UE5VMFBZdktQZlJDZ3FXOGI3dDlU?=
 =?utf-8?B?dDFUcTZDcEt4b09mUjR3cm9NVlpSajNGRzFLTzhTNTVrTGpENTJEUmVhZHpC?=
 =?utf-8?B?U1ZxSFJkZmdqRVV2Z3BJK0ZnemVlbXg1K0t1R042U3NwVXBoZ1NBbTZaWWNl?=
 =?utf-8?B?Y1pzaDQrcW11Vk1LdU45bTRMa2hvQkJYekR6UU9CZ3hPSFV3VGtQTkJjeWlK?=
 =?utf-8?B?Z010NEh3SzNSVUNRQWNlaXRUYUVvY2RKUCtDSzI0UjdkZnJVeEN5WUxzNmk2?=
 =?utf-8?B?Nm0weWtYTWZzRW1ZS0lZTUdZeXkrS1VxcWZNZEVvcFFhbkFTTkNwK3JFRXQ0?=
 =?utf-8?B?RkwveHliWnprS0pQWnJFa1V2R21nOVFqb1oxNmg0S1NZMXB2WVR6Sm5OY0dV?=
 =?utf-8?B?Y3M2U1NJQUJ5OTg3b1NsRDZ3K1N5bUhPWjYrZHhYNklESlBMZjk5a0swM21L?=
 =?utf-8?B?Zk1CcURZV3ZJTng2UWxaU25jdnU2amZSalRtVVk2cWM2eTFzMGhpUXdRdFhH?=
 =?utf-8?B?U3RLY3FYRHJVSVRpRkhTTTVWM1loMFg0c1U2MnlNQ2t4a28wWWJ6RFlTQlcr?=
 =?utf-8?B?M29Mb21rc3o4MHFHNzE5TzZJN3FaQVY3Q3BnN1ZZcVdwd1dWWHlVTEk0c2Vp?=
 =?utf-8?B?aUZyWnNoeTFFakNsbVdzSlFpMWlJcGptbkVZaDd4Tk5PdnJmdURjSDJ6QmZT?=
 =?utf-8?B?amxWV3I5U1phMTFpK2VVc1JURWRBc1g3OSttT2dBMFh2SzFkV2tySEM1bG1t?=
 =?utf-8?B?dnlkR1UydWlzejlUc3Yyc1lqZkRaS1daeUlCcEc0SUtGT29LYXduOTY3WVhW?=
 =?utf-8?B?YUFzRkhLM0dhb3h5RFBjTTlXeUdjSklmZFZrU0VqTncrN0JaOWc3RDEvWlhJ?=
 =?utf-8?B?QWJkUnNuT1pLTVJUVlpvUUZsWFNUMldHWkdYWDc5QkR2SDhicmU3VFo1VWpH?=
 =?utf-8?B?S1B1OGtmYTVKMDNmVlFKYUVYSmZHQTVYTXVnWlYrSXMzSWdVb3VEWnNsd2FZ?=
 =?utf-8?B?YmtOU0ZrTGFHbDFSVDdKSFlTblNZdUtzTk9Xc3lKSDJiTE5JUG5ObkZLSE41?=
 =?utf-8?B?RGdESmxXbHFpUkN2TUpmVTllQXR5d3VPQWovNnltOWlLYkNOTUtXclZib3Mx?=
 =?utf-8?B?OThDSDZPeUg0aitPa0xOUUFWdjd1Tnp0NFduN2ZCeXl3bFJyWlM5UGEzZ1J5?=
 =?utf-8?B?TjVyeFd0a1ZUSlFObWNiL2o1eWg4MnFlVk85RzlEZkpnSjlnbVo0dXFnWmtk?=
 =?utf-8?B?Yi9DQ1NBSzk2L0xVUlhJWW5lV1pQVitYRnQ4bUhncDB6a25mdENucGRKOE5I?=
 =?utf-8?B?VHF3V3lZdGpGQW5ZcW43QXVielhjcjNyd3JpSHB5NG1wRzE0WXh5dEJHekZM?=
 =?utf-8?B?OEdUdnBjSExxREc4TXR1akxSUlJzV1k2a3JXTWRGOHNzckJxVFdPZkVpOVIy?=
 =?utf-8?B?OU1EdmdzcDlLbnl5aGw2a3JUMlgwaEZwaU9rL210dW0yQUlGQW9JWnBRZFJq?=
 =?utf-8?B?OW44L2hQZjRDSUx5WUlPWDhyajBGdEhycTlBWE90QTc0T0pBNnpJS2Zwb0lZ?=
 =?utf-8?B?Zm1HTnhzemEwVTlsRXlZczFTUGExdFE3T3h0K3k2d24zZlIvc0IxaFRZRGVz?=
 =?utf-8?B?QVJibXBHNnUrcU1IRGs1Vk9seVM3L2lKWCthUTlHVHdlWkQydkp3VENpY3Fo?=
 =?utf-8?B?S240QnZSUTROVzJmRzVwYkt2MnU1Z3lSMjQvWDNJRjJhcmJYOFBiMjNLY1Zw?=
 =?utf-8?B?NWQ3bG9TNWtwSEpGb1cvZE5ZQU4vYUZmQmNjTHd3RjdJeUdHZHBqRlhDcFlC?=
 =?utf-8?Q?gXTBqS0qI8RKyl+VxRd5JEaVCSZQojxTGa2L0mGYXXqmj?=
X-MS-Exchange-AntiSpam-MessageData-1: 0UPG8OkRCKJDTw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bcb86d-52a7-475d-ae6a-08df0ef55002
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 04:38:08.6133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +v4UATILjxhlu4VhQg6rUF8vfdwu4+0Skyk3rewkboq6oV3ZkzMa575omK20SPuY7psUs07k6BrdqDOkF2yzyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_053820_751678_64E05C19 
X-CRM114-Status: GOOD (  19.51  )
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

SGkgTWlndWVsLAoKT24gMDQvMDkvMjAyNiAxOToxMiwgTWlxdWVsIFJheW5hbCB3cm90ZToKCi4u
LgoKPiBUaGlzIGlzIGEgcmVhbGx5IGhhcmQgdG8gcmV2aWV3IHBhdGNoLCBpdCBpcyBiaWcsIGZ1
bGwgb2YgY2hhbmdlcwo+IGV2ZXJ5d2hlcmUsIGJ1dCBJIGNhbm5vdCByZWFsbHkgc3BsaXQgaXQg
ZnVydGhlci4gVGhlIGNvbW1pdCBsb2cgaXMKPiByZWFsbHkgaW1wb3J0YW50LCBpdCB0cmllcyB0
byBleHBsYWluIHRoZSBzdGVwcyBJIHdlbnQgdGhyb3VnaCB3aGVuCj4gdHJ5aW5nIHRvIHJlZmFj
dG9yIHRoZSB3aG9sZSBRRS9TUiBoYW5kbGluZyBmb3Igd2hpY2ggSSByZWNlaXZlZAo+IGZlZWRi
YWNrIGZyb20gTWljaGFlbCwgVHVkb3IgYW5kIFNhc2hpa28uCj4gCj4gSWRlYWxseSB3ZSBjb3Vs
ZCBleHBlY3QgdGVzdCBjb3ZlcmFnZSBvZiBlYWNoIGNhc2U6Cj4gLSBCRlBUX0RXT1JEMTVfUUVS
X05PTkU6IFByb2JhYmx5IG5vdCBuZWVkZWQKPiAtIEJGUFRfRFdPUkQxNV9RRVJfU1IyX0JJVDFf
QlVHR1k6IEV4cGVjdGVkIGZyb20gSHNpbi1ZaSAoZmxhZyBpcyBiZWluZwo+ICAgIHJlbmFtZWQg
X05PXzFCX1dSKQo+IC0gQkZQVF9EV09SRDE1X1FFUl9TUjJfQklUMV9OT19SRDogVGVzdGVkIHdp
dGggYSBjaGlwIHJlLWVuYWJsaW5nIFJEQ1IKPiAgICBpbiBhIGZpeHVwCj4gLSBCRlBUX0RXT1JE
MTVfUUVSX1NSMV9CSVQ2OiBUQkQKPiAtIEJGUFRfRFdPUkQxNV9RRVJfU1IyX0JJVDc6IFRCRAo+
IC0gQkZQVF9EV09SRDE1X1FFUl9TUjJfQklUMTogVEJECj4gLSBCRlBUX0RXT1JEMTVfUUVSX1NS
Ml9CSVQxXzFCOiBEb25lLgo+IFRoZXJlIHdpbGwgcHJvYmFibHkgYmUgYnJlYWthZ2VzIG9uIG9s
ZGVyIGNoaXBzLiBUaGVzZSBjYW5ub3QgYmUKPiBndWVzc2VkIGJlY2F1c2UgdGhleSBhcmUgbm90
IHByb3Blcmx5IGxpc3RlZCBpbiBtYW51ZmFjdHVyZXIKPiBmaXh1cHMgKHlldCkuIElmIHdlIHdh
bnQgYSBjbGVhbnVwL3NpbXBsaWZpY2F0aW9uLCB3ZSB3aWxsIGhhdmUgdG8gY29wZQo+IHdpdGgg
dGhpcyByaXNrLgo+IAo+IEkgaG9wZSB0aGUgZGlmZiBzdGF0cyB3aWxsIG1vdGl2YXRlIHBlb3Bs
ZSB0byBoYXZlIGEgbG9vayBhbmQgcmVwb3J0Cj4gdGhlaXIgdGVzdGluZy4KPiAKPiBJIHdpbGwg
YWxzbyBlYWdlcmx5IG1vbml0b3IgU2FzaGlrbydzIG91dHB1dCB3aGljaCB3aWxsIHByb2JhYmx5
IGJlCj4gdmVyeSB1c2VmdWwgdG8gY2F0Y2ggbmljaGUgd2VpcmQgY2FzZXMgd2hlcmUgdGhlc2Ug
Y2hhbmdlcyBtaWdodCBicmVhay4KCgpTaW5jZSB0aGlzIGxhbmRlZCBpbiAtbmV4dCBJIGFtIHNl
ZWluZyBhIGZsYXNoL2Jvb3QgaXNzdWUgb24gb25lIG9mIG91cgpKZXRzb24gYm9hcmRzLiBUaGlz
IGJvYXJkLCBUZWdyYTIzNCBKZXRzb24gT3JpbiBOYW5vCih0ZWdyYTIzNC1wMzc2OC0wMDAwK3Az
NzY3LTAwMDUuZHRzKSwgdXNlcyBhIFFTUEkgZmxhc2ggZGV2aWNlIGFuZCB0aGUKa2VybmVsIGlz
IHVzZWQgdG8gZmxhc2ggdGhpcyBkZXZpY2UuIEZvbGxvd2luZyB0aGlzIGNvbW1pdCwgb24gYm9v
dCBJCm5vdyBzZWUgLi4uCgpzcGktbm9yIHNwaTAuMDogcHJvYmUgd2l0aCBkcml2ZXIgc3BpLW5v
ciBmYWlsZWQgd2l0aCBlcnJvciAtMjIKClNvbWUgcXVpY2sgQUkgYW5hbHlzaXMgc3RhdGVzIC4u
LgoKIlRoZSBjb21taXQgY29udGFpbnMgYSBwcm9iZS1ibG9ja2luZyByZWdyZXNzaW9uIGluIGl0
cyBuZXcgZ2VuZXJpYwogIHF1YWQtZW5hYmxlIHBhdGguCgogICAjIyMgRmluZGluZzogLUVJTlZB
TCBmcm9tIGFuIHVuYXZhaWxhYmxlIFNSMiByZWFkCgogICBGb3IgQkZQVF9EV09SRDE1X1FFUl9T
UjFfQklUNiBmbGFzaGVzLCBjb21taXQgNjM0ODkwMDJkMzk3CiAgIGNvbmZpZ3VyZXM6CgogICBw
YXJhbXMtPm9wY29kZXMucmVhZF9zcjIgPSAwOwogICBwYXJhbXMtPm9wY29kZXMud3JpdGVfc3Ix
X2FuZF9zcjIgPSAwOwogICBwYXJhbXMtPnFlX21hc2tbMF0gPSBCSVQoNik7CgogICBUaGF0IGNv
cnJlY3RseSBkZXNjcmliZXMgTWFjcm9uaXgtc3R5bGUgcGFydHMgd2hvc2UgUUUgYml0IGxpdmVz
CiAgIGluIFNSMS4gSG93ZXZlciwgc3BpX25vcl9nZW5lcmljX3F1YWRfZW5hYmxlKCkgdGhlbiB1
bmNvbmRpdGlvbmFsbHkKICAgY2FsbHM6CgogICBzcGlfbm9yX3JlYWRfc3IxX2FuZF9zcjIobm9y
LCBzcik7CgogICBUaGF0IGhlbHBlciBhbHdheXMgY2FsbHMgc3BpX25vcl9yZWFkX3NyMigpLCB3
aGljaCBkb2VzOgoKICAgaWYgKCFwYXJhbXMtPm9wY29kZXMucmVhZF9zcjIpCiAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7CgogICBUaGUgcmVzdWx0aW5nIHByb2JlIHBhdGggaXM6CgogICBzcGlf
bm9yX3NjYW4oKQogICAgIOKGkiBzcGlfbm9yX3NldHVwKCkgc2VsZWN0cyBxdWFkIEkvTwogICAg
IOKGkiBzcGlfbm9yX2luaXQoKQogICAgIOKGkiBzcGlfbm9yX3F1YWRfZW5hYmxlKCkKICAgICDi
hpIgc3BpX25vcl9nZW5lcmljX3F1YWRfZW5hYmxlKCkKICAgICDihpIgc3BpX25vcl9yZWFkX3Ny
MV9hbmRfc3IyKCkKICAgICDihpIgc3BpX25vcl9yZWFkX3NyMigpCiAgICAg4oaSIC1FSU5WQUwK
CiAgIFRoaXMgZXhhY3RseSBleHBsYWluczoKCiAgIHNwaS1ub3Igc3BpMC4wOiBwcm9iZSB3aXRo
IGRyaXZlciBzcGktbm9yIGZhaWxlZCB3aXRoIGVycm9yIC0yMiIKCgpJIGFkZGVkIGEgZHVtcF9z
dGFjaygpIGluIHNwaV9ub3JfcmVhZF9zcjIoKSBhbmQgdGhpcyBkb2VzIGFwcGVhciB0bwpjb3Jy
ZWxhdGUgd2l0aCB0aGUgYWJvdmUuCgpMZXQgbWUga25vdyBpZiB5b3UgYW55IGFueSBmdXJ0aGVy
IGlucHV0cy4KClRoYW5rcwpKb24KCi0tIApudnB1YmxpYwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
