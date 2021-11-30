Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218EFC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 08:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIwOqNYFx1Y8PR0euduCOoPDdMhwjmWNq+3epqxx+tA=; b=fzUo3AQW40+3o1uUyyzTtm/GMc
	NgfduXRB3y6sAyNWuJQnauFNtAa/grerUUE2vkNcvL21/BQFrTu/mYgkjTp44pxJty5EVBeCEAWRr
	jUznFue8oZ4E8gkpEE2/QdpkQdRT9idmheK2br7D28HSO/iPoUu5bj3Ts7SaQRcpEoSm7tmzJI852
	pCnNy1BbpIXI3fowEuwqIEGtgOqsEbnBaIl2+ZKXr2+0oIpWsm6rA+37UHJxqU6atnrGsAVI5PrD5
	2CziyFi1vk3oNxIXT3by8KEHO9a66JmH4l8ozJ7B+MACvC/nyA150TjU/v0F/LzJnq9v7umPoJcUJ
	fXHwUJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mryt7-004CPI-Mx; Tue, 30 Nov 2021 08:53:21 +0000
Received: from mail-dm6nam11on2060.outbound.protection.outlook.com
 ([40.107.223.60] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mryt4-004COG-VK
 for linux-mtd@lists.infradead.org; Tue, 30 Nov 2021 08:53:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcuZh02SVqZQ06W0SqbkrGe13cJwZLtdPf6NIlmPSAp/ul0HgBUqf6Jw+KQsG9o3LS7MviEl0AveBmvNnJo/zhxjl1yGtJmX7FjYSZsjZn4VY6Z9Hyr9r5XfCAoqxMWaRre7flrgem+EhB/G+aom0BFykibg2yARhDNM7bxPIkx8iYcRvBsRuIpeOZ5KHbBcVZbBpvTbpR3cCkZvoW7fq636Zv4dyw74OU7ERwwdYI602Sl51kdCIf/498RFXTd2RczPuc4p6j7keNTnwDMdv7g97qDIeeP+ci0d76Zc/O8IfM5jamLwx5EWqs0wn8okN6Cywe+AKJjzVQVe1365lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jLOKt+7ognj8dRsqV2z9yRskzWB//LILnPmu/AOJoc=;
 b=SsOOARGMwReml3O8RaYZwDZ/Y30myUG3MwBqKNimpUNRDFXs/ZbjQTI6Kva5W0zsiq612vP5zOgsifYxlPTFhNjICF35RjVr/CkeazeL52lb32D7iHZe4BMfi/mJs6STU0Xg2kaDmkwgux32RXvI77RoY12DR7yrftQgr/bvPZwdW+N5RN3n/03FaCEoJ+2uhcRdZP1A88amCYs39ifjR8dzvKA6ougqp6JB1D9mb+WLwpbk8pMoFWRyuBShb2qlgcYVUMCxY2UHTgL6vaS6DORpDzrtShuqrz6I4ReVMf0DnUCa42ZdnDIKAOEYFIw5kCH87jDj03s4arPDrNBRjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jLOKt+7ognj8dRsqV2z9yRskzWB//LILnPmu/AOJoc=;
 b=LO05i1/OaDj2JueHc3Io2OnafM+ZKtQrioWVbRn9YzmPCNJ9RrHWPVLoNaGLNVFcJsupnLpiXnUX2O6LbkcbUAQXteCsPyyjPICW6WR9704akmgP80Yc7vGIltjkZQKQil3w5NNCOXg45J1ZQKj7aAlT9PTxPsChh4+2Q79WLsOOgTZOkAfNVF6wYCIPXibWWzQk1eMQlXOcyxgIlrvec52Br8KQB3PvvDSXp+J+U6HfCfRLZx57AModb1ucQomI1ifu1wb3JQsvYrD/pZQuBvMUNsynJcovkNjloqJmtUahW06zYO8CgTexvYFRz5BSaoOBT0u/XbkS5pNF3a2ONQ==
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW4PR12MB5582.namprd12.prod.outlook.com (2603:10b6:303:182::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Tue, 30 Nov 2021 08:53:15 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%4]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 08:53:15 +0000
Subject: Re: [PATCH] mtd: dataflash: Add device-tree SPI IDs
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <20211119183316.1329089-1-miquel.raynal@bootlin.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <a799095a-e046-ae56-c2db-f527e199b5fb@nvidia.com>
Date: Tue, 30 Nov 2021 08:53:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211119183316.1329089-1-miquel.raynal@bootlin.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0139.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::44) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
Received: from [10.26.49.14] (195.110.77.193) by
 AM0PR01CA0139.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 08:53:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1088cd04-486f-48ca-9df6-08d9b3ded8a7
X-MS-TrafficTypeDiagnostic: MW4PR12MB5582:
X-Microsoft-Antispam-PRVS: <MW4PR12MB5582A8B6CD96E6E1FE739C2BD9679@MW4PR12MB5582.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqqxwgazpruAGe5ETJx0WThWBHVpEFAEFG9j3dHSLhYYeOChPt0AKYoVjY0GIZ2oWTOSQ9uVwKCpTdc1OLdeXCxh8gVPyodwgNgAncktPHtxqoByRhUDDf145mkryqTX/lAgbiCJtCQLsG8SxCbZcigqRhkekD8TeZugWxJ018cFMaiw+igl3paFpUArYt28g4b09Cc0dkaHE7I6jILAarvSVnWM4Tm6meu0NmQ+XESHnU9kU1+q5q1DJ2+YRQNh1QebgKK30TVPZ5SRZfIWYruFw9WT8yEtuq6QxHtt1lnAjQA0+RAbyxXLXMefKL+Hk6s6NZbkL8AA/vy60kG3hGlowVqHNme4Pb/LyjG1yfhpV01FFLgpFqkVtkPn026y8uDmVG3l/Ofqoa7DeaYeeLRRe0kZHniL40+3E/RCz/gBFuY0bMRvQWJEhlAGWdsJgu3i+ZaW8k3TVFkTe9pmtVcZ0Rb7GqNKPsXmmGeEfrQJXvOm1z3E4WV4a1cMOGW+Cg4EA1mZRRn6HFHIugpmwo8viQSFHxq9ARvWet1VRJ+Ek7wrJBfGukstroo0cpiVvIRlKDkWAUf9BMvCQFFK2wrgpi7BgGJemUi3DTeaGLAzeVN+lJvKi9KEVVtVVh/iDPj76DC9o21xf0j+ph1GPSN2h3IqZmkiYOtI2rLy5qoSUaC2IHDicQNY7CvDXQmwvbocMzVrOw20/ZJev1f+foGU+IZ1X3mTRpVi0Owz4BavLPArIJDkeFciFHSWK0LnT/OumvUitu70llFn+WB3YFNU3pRv8Qf2F/8uL1jZULo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(186003)(53546011)(55236004)(16576012)(26005)(316002)(966005)(110136005)(66946007)(66556008)(66476007)(6666004)(508600001)(5660300002)(38100700002)(956004)(4744005)(8936002)(8676002)(6486002)(4326008)(86362001)(2906002)(83380400001)(36756003)(31686004)(2616005)(4001150100001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHozNnhPV2F3NlV5bXNjdEhCUXh5OC8rRGttUTB4bGpiQ01saXZxaFRLU09W?=
 =?utf-8?B?S0R5dHFBSnJuNkxBYm1pOElMbzJYTUtQTzBia1NiYmVMY201d1I2S2xBZDds?=
 =?utf-8?B?dEdHdzgwT3dRaHVzV01NWWdlOXJiTEF0M3hBVWc3RHRuMkdqUVRreklOT2FR?=
 =?utf-8?B?Uy9PSFBqQVhTY1NMYmMwT2d1akYyeC9sSm9ocitRVS9DVy9oSjg1c1BPYzZs?=
 =?utf-8?B?Yzl4bU9oMWtpUEdrd2hZY3VrTG96WXBQd3h1cGVGeXFjWHpxVE1aWGx4N1lB?=
 =?utf-8?B?Yzd6clhrbkJscUptY2dHSW1NRkE4c21NYXpJZUJTZWh6S1NKVEZIRitvSUFT?=
 =?utf-8?B?NUVsOUl6N2NUQThldXBhdWhGV0Y0UlNwOVRlUUdpdE11enk2TXFkNEV6aG5p?=
 =?utf-8?B?b1VRbElXQ1FFVFF0RzVmMXJYL0RnTmZUVC9tRVdyN3VUeGdDakp6bGpUaW1P?=
 =?utf-8?B?ZG9ibDZNd1RIb3dzRGd6djBlR0FzUDlkT085K2JveTd3U05PQzZrKzBJbmgz?=
 =?utf-8?B?NmRpSU45ZGpZUHdYYjA1cTdrVk1ZVy9pMlZ0NEVGNllidXZNS3l0UkhiNWlB?=
 =?utf-8?B?RHduYmYzVDlxR2hzMHJKU1pZa2pxY0JyWkIzZnBTWmhmQ05sa0Jkc1JqSXZ6?=
 =?utf-8?B?aS94YldjTnNCU1RaZjJQNjBOSjZJd2Nnd2x4ajlmSmNaMTdWSzk4YkZkVUdr?=
 =?utf-8?B?MmNxcDZKc25GK2dNUTcreWIxc1pxcHVCRTFuZVVZWTY4ZXI0N3RNZjUxTjVM?=
 =?utf-8?B?ZnNlbDk3ZjRQTjloeDZDRzdqN1lqN1Y5eFFGTllJZEpQY1hxN3NaZDBPSjhV?=
 =?utf-8?B?NElVWFloRGtmbWdERjNvNy9lam9CRGxPc2FuZGg4bDNxRFlUcnMrRjVWcmQ3?=
 =?utf-8?B?VE8yTnQ3djVZTVQ2bExVZ1lyWkRXU2NLZ2xWVW5zd3QzaWV4WWtZWXozMXhU?=
 =?utf-8?B?RzB0Q3dTdVFqTjNDdGtBcnZpZnBQTmZrS2hkL0FCbkFLUjg1ZElicVY5bFl6?=
 =?utf-8?B?RExUWmtlVTd5R295ZlFFTGFGdXhsRmdTWExLYXBxMHhuR29Ua2g4SkVsSHBu?=
 =?utf-8?B?ckNlYkVYdFcyUGVKdUpWQmkrWDlYMzVVMEpOVUFUalBQbkZLMzRxMzZKUXV6?=
 =?utf-8?B?SU5uM2JDdS9ueUNFd0xra3VDa2JhMVI5R2QyKzZiNFhrRGhpUXVPTEdveVhm?=
 =?utf-8?B?dUIvVWZpeW82QzltRzZxcHpnVVUzVEFBM1lKdFJ2WnQvZ2poOEFMZUk4K1p6?=
 =?utf-8?B?QzhmNkpNdlFkMWo0clZqUFd2V0Vjd2JHYWJIUkFFR2s2RGVqOXFXNi8yUGEw?=
 =?utf-8?B?OUhNNDI5dngvTmI5SWx4YzdTYjUyd1BYbWZmOTFvSUc0TkNlUldqemRsay82?=
 =?utf-8?B?MitLZjdZM1VZNHVTNFg2RDUrWWVFeFhEN2lyVHh1U0M4ZS9hN3ZueHBtaGhI?=
 =?utf-8?B?Wm5YdkpLN0ZPVG1JV2ZiTEdCc3pBTjBvSkVqSHhpbm0xQ1hGOEhOVzFEdSt6?=
 =?utf-8?B?MDUxdFpwcGJqcHBNNUtCYlpZaVhsaUdBNGEyMUxNQUhYNWJQK1g2dkpSVmto?=
 =?utf-8?B?bHhoMG1Ublh4Wk05aVRVajY1ZzJxLzM5cmpKL2dTODU4Nml6dEpJTHZPQktn?=
 =?utf-8?B?YTVvV0RKc2V6dDJ6c0gwbVRYOSt6aTNjV0JqV1ZXTU54TUNHVnJFVS9ZZUdF?=
 =?utf-8?B?MGxNQUpNNGxrMWZyNnUzNmRJaUl5NjVYL29QQU9tNzhIZUpEamdnVkhBZlB5?=
 =?utf-8?Q?g9po3rSIh2DDjud2D1nJey9Jy980+CKlVNFGmjx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1088cd04-486f-48ca-9df6-08d9b3ded8a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 08:53:15.0144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8m9Dsn3rjbc6Q+DUEiVcPvAxa01LKDGjmMP7ZNjdDhAqmJCDRaQ8BP+ipl654A/wVYMH+9iyo4HtE8y/rAaBEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_005319_070900_15A017CA 
X-CRM114-Status: GOOD (  13.84  )
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

Hi Miquel,

On 19/11/2021 18:33, Miquel Raynal wrote:
> On Mon, 2021-11-15 at 11:36:55 UTC, Jon Hunter wrote:
>> Commit 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
>> compatible") added a test to check that every SPI driver has a
>> spi_device_id for each DT compatiable string defined by the driver
>> and warns if the spi_device_id is missing. The spi_device_ids are
>> missing for the dataflash driver and the following warnings are now
>> seen.
>>
>>   WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,at45
>>   WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,dataflash
>>
>> Fix this by adding the necessary spi_device_ids.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.


Please can you submit as a fix for v5.16? The commit that introduced 
this is already in the mainline.

Thanks
Jon

-- 
nvpublic

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
