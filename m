Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36176C88E4C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWK717ysBhSn0ZghJAVtPtdUB/0PwXTd9BGsBGPEdDk=; b=lcAxNxvI67qUeAuTx5MbC4mGzK
	9o6/qZLYGcuz78cSu7ZZ37bGDhh1sIfiGoWut7mPaZvT5mO6n6XxJCVF3+oZUJ7SpIgxCRU3Mi6gJ
	Fo+M3biZsOG7zGkDr4QHg4/WFQZelULJ8nikdP9cJ2vrLfbRlA1dJpPj6IkDRLouiEHmZbZa+r4GQ
	9aSrTzEPk9Ywst/QlPvjKvMaoeMs/6PAwZjMnSnpO2+JtZ1h1AcirEIEb3V+kV+5GZWeh8Y/LTgDJ
	0I5ygXgImKzTfat2th7dXvWX88Gv2O1kdRULim8KIZgCgFaJmqSmWSq9BtsficrI8nu+huu9/K4Yn
	btpag5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yZR-0000000GOit-2NJq;
	Fri, 11 Sep 2026 10:33:25 +0000
Received: from mail-northcentralusazon11013018.outbound.protection.outlook.com ([40.107.201.18] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yZO-0000000GOi8-1iw2
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 10:33:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0VxAburlYNprcLx2Q0pgKqgyt93C4UAhYc2WVw7bMisWjI4Zp66ZOO0qUOPEZSP9Fitc379EcZ3cJd+OAiES73GWjYhcVJFihSWd1Fr+mJ6UETGVTjiOEb44yt4eN4Gp6M7xqt59a2o0yMG1RZvD1ovOVoPr4OuoggWOEM6Qnos4NGRTbVAUYBYOnwgiQ6eNYp/bcNpZw9UpEDUGxXgUYhSEAu2Eu6QLz/ow31nosEjLvXHFDtYRtUx4JUVcGzVWE3XfftkocWpvd1NokSFGtVvD/esgWBtQ2qXXiwxNV/gAougiz0WiqnxbiZLNP05GdeBjKGa4Z1zkaKm2/xc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6oA1reezyG67nuNIRMsQZiFn6jkcuIcPeC+mynkwKo=;
 b=iXNNTOkMqFoMTtiIdK7LvhUKymf+Y90EGtpTnTw2rtDrIpv4V1GrZsvqcBRTNoGh8KW23ZsRQEeE89f67iStGE8F9FUWe31Nw497YL80wMwxhpf9fijNQl3BwAUBVqBBbZCvuUsulX6rAXgEBNsm9V3bfoNo0BwvNk2m/JgO8SZYNkrXYN4U6l1AUHw//lDSWW8Rp7xip8Ugpu9EAySjUVNEgrFTwes8klpbGMaM6wZL9v0xg3Gn/zG6A0+TvddNqPWwOi0MGtGbENNkjyv+8YOox8GcR8lZMWONN+j51EBegaasr8mX9udr9FoYgyeQ7PXnKr1Yg2P70mP0mrhvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6oA1reezyG67nuNIRMsQZiFn6jkcuIcPeC+mynkwKo=;
 b=UUKziGe2gXjj69KLpBXfVAhF8E4maw3//SkkPF27///UFaBKrQOBUw5vMIE0aL8zIKNNR+Zq3N8L5ZECpn4sZwSHQnjhSdCypAkCKnyvlcA0fWk0Su71f4V+wWYc8qwpLWYq2xVXW1iBb/dl55k5ULSx67TBrfAiadaUQOdhNkW080hM1r8bU/qAfcq78B+/j4/eLxrE6mRkL+s2ftlH5VPFKsLKFFhPFvS0jol0fr4Ka56nGb8xCRIBjOt6XzlPqp+6bklu7i0Mp60NXxUgwzPqIH0dV0mAdsLcvqygM75lmXzomDwws+E9t95pReMcGm0adFDe8X1pIqWU9PRdBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by CH8PR12MB9741.namprd12.prod.outlook.com (2603:10b6:610:27a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 10:33:15 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%6]) with mapi id 15.21.0382.014; Fri, 11 Sep 2026
 10:33:15 +0000
Message-ID: <79b104a2-a76d-415b-b98c-6833d8cd298f@nvidia.com>
Date: Fri, 11 Sep 2026 11:33:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit in
 SR1
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
X-ClientProxiedBy: PA7P264CA0297.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:370::7) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|CH8PR12MB9741:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc3b377-4942-450a-6aeb-08df0ff0162d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DC5yTgG4fzYXtqpmwKWR7Y0MM9E1Hm+emg4cK54YCuwxLV4t93ziiM0LJxRS1GW809Mo5tAMyuxEh3YBxQd8IBlV2cDPIF27OB/2jXeaXNBfFT1U+kchRbc/AsYNmHSSRUV1+opP1YUn4LaWNYqzOEJJzDqrmAolQfuSyKKr7TbOqWhrGlEZwEh3/gMg7TtQkoVy6oJwgfHE/BrHdv2d4sH7KUCwzJSDzq+fKtCzWKnG2ekC2m5yWEpfJCWVZw2G8P9R+eM06f4rSJlc0HmHWKrryal6Aj6eclAcxJIIbIPOu7re/eAE5+pTS8W3zgTRI/ojifzajUmr1ILiO2CzW5inztiNxmiveSDvlv1yhfApTgAkJUuuQrsU079ytuvKrXGpbsxV1TJzudWy7NpgFUi6Hca8B5/d+KaOi7RqtWBpHWZGOrpVN3vNbeBRAzUbNp4oZ2RqSEXSfTkT9knRIRm91dDAJBZqWjj1Fhwr8kGLpfqVCnmlA4FwD24dPJvbG0FtgY+FVUXDieIETE9cIR/bKCBXBSAIxeqgXX5YapafrwKTbRkOmRZVZY3KBuVPo+8bden2eVGihi9PRSLhfCEziT7JTWplqJGKPJ2rZq04D9VrBNkqZ1QVE9jw/iS5EK6yNaYbFbOdt/dgt30UcL0kzkV3Cg9GceTozg9qluo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmNYY0o3bDdQR1d3bmxQOGhKdTd4dlRiL05VY2lYVlYrSnBpSTBjUE5IRy9G?=
 =?utf-8?B?bVhxSzUyY09EdHlqQXRuMFNWeDRFY1g5K3l0Q0ZYZGt1U2RuMmJmalkvSFNk?=
 =?utf-8?B?ZVF3K3VaMXBadzFCdUYxMGo4UFRqaVZ2TE5tMEh4U3hoODhxY3RZbXYydEl4?=
 =?utf-8?B?bW44UWhmQW1GcW9hbllxY2I0R3RGcGxvUlBNNEMwdWhoam1yS2xiSktST1Mz?=
 =?utf-8?B?aW9WZlMyQ1VOcGlENC9tbFV5UDNGOFRwSDVGaWdnWWp3WlpOdEFYSDBZdUlN?=
 =?utf-8?B?eDZscHBlVGQyNnBvZjMwaFpDeWlTSlBLK3JzeWRaVnJJek1WWGp3aStjblh4?=
 =?utf-8?B?Y090ZXlMa2pEUlA5WXZHUVlIbW1MVVY0NDQ0V1VrdjhxT053SmhpRUhPWHU3?=
 =?utf-8?B?RXdjSFg4cDN3S2ZFWm9GMXI1VVlUN1FzbnBsUXRXKzROU0c3SWxKb1A4VEph?=
 =?utf-8?B?LzZLZStSZExvNmRJaUFubCs4aDJGYTRWRGJJaXZyakxkZ212ek0vcHRSbHha?=
 =?utf-8?B?NDBHMW9KYkFodk5FNE5wb0JTMS9zUk1DOVpvb3RrZlZqZ2NoNERFS0cwNTM2?=
 =?utf-8?B?R0VWdUhrL0k1VVZsTjdkWFIrenBhMm1hNnNNeXM0NTM5cDVoQ3ZuZnVGM3Bu?=
 =?utf-8?B?TXIvdFpydTRNQWRtTi9lR0ZabmQzSHZKcVVhZDBKd1V5V2hpUG4yU1dvaVQz?=
 =?utf-8?B?ckczNEpWRzNKdnYyTFNHVW1yOFdMK0NZWElQYlZaZnYxOHJzbGpyVWY1RFBJ?=
 =?utf-8?B?Y3JDanhCcEhPRzFVbk5VZlB2dnZvY1pjdEE2R2d5c1U5NTJnQXJEcERNa0Iw?=
 =?utf-8?B?SEpJQVhmSlR5eStleFQ4YjA3NjVqWWhxTlV0VklzN2k3WFhHNUw4cldHVXo2?=
 =?utf-8?B?QkFOdjd1dEJicUR3QmFqVzkybHhqbXJzWEM2TG80eU9Oc3hsQmhhcDBQUHhX?=
 =?utf-8?B?NTJCd2VQdWdhQkpaZlpMNXBFWnlsVldBT3JHUm5veTMxUVRMMTl3SGMwd1ZJ?=
 =?utf-8?B?TWxQeFVlazN6RlpCcXJNTmFvL2RZbitUSzErTEN5VzllS2JkNWdoY01Xanh2?=
 =?utf-8?B?TExXK1dSVDYrSmwwWlJSY3c3QlhoMzBrOWdGNG9rRDZ1V2p1aTlCMVNLdzQ1?=
 =?utf-8?B?TEhLWTdIRWZYc3hYNjVkZ0Y1QnNmVkluSlNJVmJkRFNaZlJxb2huUTJhVzN0?=
 =?utf-8?B?Z1JScHRBMGdSVTZIZTVNZXphVkM0S0xoQzlTeUlXaWxuWWVtRDJNNDlKeDcz?=
 =?utf-8?B?WDhTanZLdGlldG5BS0Z1Wnc4RWdGMXlqL3grVnB2KzZQSWN6dlFrUVNiZ3BN?=
 =?utf-8?B?MVNSdVVRVFdGeVFHT3U3aHUrd0h4OEFOTlB5UTc5bmZBcjN2dXpxbloxdTJU?=
 =?utf-8?B?WkNiOUREWkdCNUpSdEZBVFZaU3hGUUpGOFpLVzExSnJwTm5VR1U5QzFwOUVJ?=
 =?utf-8?B?Nk1IOS9IU08xcSt6RjBEQVNaQlV3RjhmMTlsMjd2dytzZ0p1R3k1bElsa1Rl?=
 =?utf-8?B?UXhHOWpnd0Rmak1IU3ZTcDkyK1lRczlZckgvZTBPRTh5SUNRSW0vRURpdWlp?=
 =?utf-8?B?bWh4RHc0QWtCNDFnbzVLdkgzQTdra3ZUWXpEVVZvdWZqckRaMXNYUHVzVFVU?=
 =?utf-8?B?QnphdDJvV0VXNk0waE9JMTlPbkFqYVRmaW1kUXkxU3lvSHpoWWovUEVsWDd6?=
 =?utf-8?B?N1NMazlOaG8rVGhscGxROUJTbldWT2VxL1pVbm5waWpBV2lqU2xmdnQ2eitu?=
 =?utf-8?B?bGVnZG5jZTNDNGVqR0NuYVR4RWN0aENQYkpkQko3NnR2YmxUVHVXVXJTZDNY?=
 =?utf-8?B?ZFNuSnJtaVp0S0U1N3YwemZNeUZJYXc1WS9CR2JyOE1DUkJSdUM4UU9Ja1d3?=
 =?utf-8?B?RmpHRDlick9uYXN4c21PWC9xdXZhYWJVZlJSTndFNXJCK3BXNWFiZXAxR29i?=
 =?utf-8?B?S2twcUJvRHVIVEpwcDRJeG9FOGlxb1BOQXFYMENSSmtINDVIdmtPWnFDOURw?=
 =?utf-8?B?TldnZHJXV3JuYTNRN2lZU2FqcUptQml6Z3FFZGJwczZEM296b2lFTkJ6cXJq?=
 =?utf-8?B?NDZYQmxaa2wyekVkMXRSQzcxRUJoTkVIbVNSSlF1ODRRb3lRKzVoTmw3KzFl?=
 =?utf-8?B?NUhLOWkzTHJWR0tEWWJMUStSTldIQXd5cVNXVE1GbklqZm5udms1TGJGSFZH?=
 =?utf-8?B?UTlOeW45L0dZU2RLek1YeklBZlFURDNKQ3RUbHVPK2VscmZaYXE3d2lrb1NK?=
 =?utf-8?B?VDZ6aUxlbUhQdkZvRnZRWDBoOGIwM2RhZVBwK3dnSnNlQmxDbFJMb2RiZlA5?=
 =?utf-8?B?OVVmaUlNRWRDMGp4K08rb3MrS3FZUkhEUDRqa0EzR3BNSWlwMGhkUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc3b377-4942-450a-6aeb-08df0ff0162d
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 10:33:15.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4xSn59AIfaLn9ovTP4DRxSQBoHlUxPim2VAd5XlTbYMfYqZTCp6ZrlU0DYQL45NyLhk+yb0S9sYdTkn6Zx1Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_033322_463910_CEA61165 
X-CRM114-Status: GOOD (  21.17  )
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


On 11/09/2026 09:55, Miquel Raynal wrote:
> Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
> means they do not have an SR2 to read from/write to. The new generic QE
> helper was supposed to accommodate this situation but in the last version
> that got merged, parts of that specific handling has been moved to a
> more contained location, swp.c (which needed most of the extra code),
> yet the Macronix case has been forgotten about in that generic QE
> handling helper. Booting with such flashes will always fail probing.
> 
> Fix the situation by making sure we do not attempt to read SR2 if the QE
> bit is in SR1.
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.14451625037676421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   drivers/mtd/spi-nor/core.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e2b6efafdd8d..ac909dfb9657 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -985,7 +985,10 @@ static int spi_nor_generic_quad_enable(struct spi_nor *nor)
>   	if (!qe_mask[0] && !qe_mask[1])
>   		return 0;
>   
> -	ret = spi_nor_read_sr1_and_sr2(nor, sr);
> +	if (qe_mask[0])
> +		ret = spi_nor_read_sr1(nor, sr);
> +	else
> +		ret = spi_nor_read_sr1_and_sr2(nor, sr);
>   	if (ret)
>   		return ret;

I know that there is still some discussion going on about this
patch, but FWIW this does fix the issue I was seeing.

Thanks
Jon

-- 
nvpublic


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
