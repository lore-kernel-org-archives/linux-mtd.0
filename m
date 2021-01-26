Return-Path: <SRS0=ENrU=G5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CF0C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 02:08:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46257230FA
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 02:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46257230FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ef4R0a/dTTJfgfDc1OqMxyPdhfLxok8I1YEo1wyCtoI=; b=ZXvkeRFPp3gMT0jFn6A67mWwB
	v0coDZlo2A0G9ix/CI3+SkXzGE5fG45jLJNWg3xkfudG6lF4CDKptU1CyAcrdG4OYJx0dYJYbRQW/
	a7Uj2B1Q8feZcgCr1Gk6Bmi6tNp25jlXt1raJFbp7loToQWWSL39ISIXdHi1OvbeVEWjIafJD98+O
	/tjjCBRlIzDsqLam1Yt/SrEZpUe/lDEaq9TEIZFMYjguNkp1mxT8Bb6uE7V5E9pXAKNeSvPxQT1Ea
	yeX287T4bCwTaaO5Ybfbkgs+brNq7d/862aBYzFDBpAtGAeEylzgYsZSW/lAUpsqEfbWh8Lr03AgO
	NwoP013qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Dkz-00035n-UX; Tue, 26 Jan 2021 02:07:01 +0000
Received: from mail-mw2nam12on2054.outbound.protection.outlook.com
 ([40.107.244.54] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Dkw-00034t-VL
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2021 02:07:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzutxkn2drLrHS/Q81VvWIxvfAnu4W7svAdC+GHmGPz8kOpaTt0lHm40jRYQ5YvDEwtog/E/HE8WkuwUB+qxTi3AzUyr6NBnRF4HlNyvtOVaTDGSwYWbiRz3DlVlfhtMP8nGhnYw+/N3ND5l8IcQRWzJlgoD0g7aB3NY9IeWgJRJjzoQch/hftVVx8oozIhcLRNKWh86Osu9yZh/r5QDGS6ozRJLk7AxR1py0coFyPesbCZ+ONYkOIfCZt3fNJ/Gu1EuumOgBuxiQatsJLBZ4NpiSQRxeDrmR7LrAlggLkm1r01hh++721UkuOVQZc2AHIqtHH7Z39oJLQn4MWQ0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJKCYGtaVsZ+d2r9mLpg8b9uhONJd67OkFgz6YnAJbM=;
 b=YBQzsVJN54Efx1lXe8qweZGlqPjM43uq/RB0zXrRUdmciSk1U7VsANKBCOnwxm1xXcLbotr/Vxk43zQK0c4WMxbD1iMOC+T+zHr7vYGhUZb0aMeS+C50RCxNQ/5k5od9QHBP5MtCBgvsjmlsEKQ2CqYWvlyg5qSu4LnwvH2r9lrNLtnUxYE4CGl+ZeACCig3ceCAyjwyuU85UaH3Dk4erVrt8AbMDWBpUXEvVzL22FYDczHHNrAdAdbtRyvRtCRvngIwNH8lQLjgIuXToBaTnUScsD0K2EYH7ABrhGKcFy7LxPVnc6SdHVigiLhLZ5T8QU4UybD8VA4Q6oENkChbvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJKCYGtaVsZ+d2r9mLpg8b9uhONJd67OkFgz6YnAJbM=;
 b=TyxJ3v60AkDGEPG5wHzD+Bsrs3/qgZOr8vs4v/exnG7hX/JyXdAcEu13tWJwgWATojI55sOH8zKip0KgwrRD76J2xGdAHMNo5ClM96YiYsD+sXRQoRcM/fzfpzKYTrf8bB9cWVECHzm+luoP3ucLhgkpee73Ht+qSN8dunV2sAU=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SN6PR11MB3023.namprd11.prod.outlook.com (2603:10b6:805:d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 02:06:52 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::1402:f204:de5d:c47e]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::1402:f204:de5d:c47e%3]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 02:06:52 +0000
From: "Wang, Yaliang" <yaliang.wang@windriver.com>
Subject: Re: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
To: Vignesh Raghavendra <vigneshr@ti.com>, Tudor.Ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at
References: <20201116153956.588098-1-yaliang.wang@windriver.com>
 <f2fe7e4e-a651-491c-f894-8cc264c64744@microchip.com>
 <d2a66253-e755-280f-8f79-d141b3169c56@ti.com>
Message-ID: <2c578dcb-b9da-a56a-593c-b654cef6e67a@windriver.com>
Date: Tue, 26 Jan 2021 10:06:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <d2a66253-e755-280f-8f79-d141b3169c56@ti.com>
Content-Language: en-US
X-Originating-IP: [114.244.139.4]
X-ClientProxiedBy: HK2PR06CA0024.apcprd06.prod.outlook.com
 (2603:1096:202:2e::36) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.4.108] (114.244.139.4) by
 HK2PR06CA0024.apcprd06.prod.outlook.com (2603:1096:202:2e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 02:06:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0262d6b3-7551-4407-6c88-08d8c19f0bd4
X-MS-TrafficTypeDiagnostic: SN6PR11MB3023:
X-Microsoft-Antispam-PRVS: <SN6PR11MB3023F8C08ACB9F680671D61A9FBC9@SN6PR11MB3023.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVYJ6rU8x5ebQqlqQ7pWOY5c3Po/9lCJEH6/dDJURWvUXIrk/pNjrUw8qngmsoWRsgUYYfPoPRQugcC/9Dn0SKFeuB4oMwdpAh9eletuI0WKUt0VsQ5AgIyz9GLGyXkvbRs+GA9yJvcab7M/5cLiiTWX53GlqdWkkWAUDR9Px2rulGjeu+FiuyOx6PjsA9Igmyzo1VZ0UWVDLbCTi1KQcN1JuIYWYYPOUEI4R90QRNrRpq/tLm4voGQnf1FzBfCjB97A5n64mKY4OzsOg3EsDyCSEV2oZ7fK9eWDmunkUfIMVReseSvcU4hCS4nbKHFzpwAiCQIcjKv3rgxbB2iodh94Rdrt7mwALVVT8ijkXBGeW8IvfDVBZw2xF+N/Rb783yusfVCv76Q3k7kMRxw/VOYER6HKM+nphnU1SHhfeEcBBBKrPi3IsmWyFKYzSgl+7LWGyv+2vEWhR8SeIpB6ij7gTvHfgNiQJ2o3wKtKQn9FllkcIL9G/v/7FRsfbFXMkydjAKNu8HYg45M2PP6ydRgHlFiwjRAvtIjQ6FE4iCeBEQWWb5BDN+9vflZQVbC+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39850400004)(2616005)(86362001)(16576012)(66476007)(66556008)(31686004)(36756003)(2906002)(26005)(956004)(66946007)(4326008)(186003)(316002)(31696002)(16526019)(53546011)(8936002)(6486002)(5660300002)(8676002)(52116002)(83380400001)(966005)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZEIySGxidStjeVJ2SGlvSTJMSGxhbkVXSWJpL1pPKzlTRlc0cllNTnVaMmNE?=
 =?utf-8?B?NVhVRlF1emNZT0p6dGZVYVZPa2lwTVBWZ280aDFRTkZzT1pZY3UxTWNqR3dn?=
 =?utf-8?B?d2oweUtIWXN1c0JsVWhOeEdlaTU5eGJucHRNZmc2WkVDaEFEVk9MeFpJNkpR?=
 =?utf-8?B?SGtXZHp6TzJtNVJWbnB1bXJqMDMzUDNGUjl5cnR3bDZXNE9zOEpySlQyNmZk?=
 =?utf-8?B?c1VDRjBxNlhGSGcwakpHS3UycUZlMElGNHRmbFN4N2pwckIyWnZ3aWcybkZS?=
 =?utf-8?B?SmU5YmtGNGNwNHhlNHE3bWVzM3gzSzJJdmNoZU1NNXFVb2dYS3JOWHRhWWdM?=
 =?utf-8?B?aHRIR1krSlVXRWF5ZEYvQkYyME5Jc2NUTmpUMXB6NkVVdWM3N3R3c3ovWGd2?=
 =?utf-8?B?SlM4cXZOeGg4UXdUa3prV1BKRzBTQmtSU3ZuNFh6Zi9ENWpGMjllQ2dkT0ZM?=
 =?utf-8?B?U3FETU1XYWluWEtQZE52OEZ1RDZ6Mjg3TzZ0dDM5YmlJK0ZEeVVyR2ZEV2kz?=
 =?utf-8?B?ZndrbWNtWmhiYXlwTHZxL0NHK2s2bXEvQ1NjTzgrUTZjdjNKL1REdzI2Ri9H?=
 =?utf-8?B?SWIyalJhc0VNWHZUcW1PZTZnR0hXc2ZMWWUxZ0Iyb0xNQmpTOWZQN2tRYTRa?=
 =?utf-8?B?OGRITkIySHo2MWZWNDdBV21pT2FZZU9VQTc5RVI5K0hqRlF2SWJjdU15cDYz?=
 =?utf-8?B?TzQvcnRzYWlvQlp0RGdlMW1zUDc2dnpESEVKTk1DK2VNbERJZHBWQSsrUVNp?=
 =?utf-8?B?U2FhUHBoN1hwdkk5dEpvdFEzYUYxNFBUaFVTK2RRY3B3dkdiOUtkV3RhOGhK?=
 =?utf-8?B?enAySWlIeExSd3FENWUwYjhLbFNJbTFEMFFZZFBPYmoybHdqVlRMZU5hM1hF?=
 =?utf-8?B?aWt2ZjJ0MjFIRzRVdGpWRkF2ZklYTFdrcWFIeTNqNC96UWc1WFd2bGwwMHpF?=
 =?utf-8?B?elUwWFBYc3VhSEtaMmthaUhUZkxIZTU1S0VmTWh4SDlFQUg1YjVRNlhVSTJk?=
 =?utf-8?B?LzI1c3ZoaDZkRE5LZVM1MTZHcmxKbGFBU2xGakVUcmJYaE5DWnI5UFlxMTJD?=
 =?utf-8?B?Q1NnVmMyZld4cFZVYmtuRkI3U2hheE1pWlJVZExmSSsvbG9RdzZMcGE5SHZh?=
 =?utf-8?B?N3hiekIzNzQySTlndWYyZ1JxVkZiUDBDQnAyVTVGMWV1R0h3d056Wmd1NFoz?=
 =?utf-8?B?WVA5dFg0aEtLU0trenU0cTRhK2ZyNUFVQXdBYnpMWldURkZ0TWJVNjl5aDdi?=
 =?utf-8?B?UFJDTEd5bDFNWHpPQS9DODltbG5oTmNPTjJsWjQ2cytWQnBlYS8va3lMb1Rs?=
 =?utf-8?B?U1VKdjdDamthaUlhYXNHV0RicVQ4NFJrUWF4bFBVdG1HQWJjSEFyU1ZTeXFz?=
 =?utf-8?B?NCs5L2pwTFBwcUdCOUlXaHVobGU2OVBsOVBDZTZoMXlZZWFqTmYwQytFd1ZV?=
 =?utf-8?Q?1/+Q5TZ5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0262d6b3-7551-4407-6c88-08d8c19f0bd4
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 02:06:52.3829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dj9xD54gUOkeD93bWgPcwNkn1d4KFTIZdBTxiUCcwD/iI3qqloDthhBwdGFQQ6emnIG1Iqvt+kWhlCwm7DH5A/uPG3OcRjQNMQmXq8RoiN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_210659_067846_BBCEBE51 
X-CRM114-Status: GOOD (  25.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Vignesh and Tudor

It's really inspiring receiving from you, and

On 1/24/2021 2:12 PM, Vignesh Raghavendra wrote:
>   Hi, Yaliang
> 
> On 1/23/21 11:15 PM, Tudor.Ambarus@microchip.com wrote:
>> Hi, Yaliang,
>>
> [...]
>>> +static int spi_nor_s25fl_l_sr_ready(struct spi_nor *nor)
>>> +{
>>> +	u8 *sr = nor->bouncebuf;
>>> +	int ret;
>>> +
>>> +	ret = spi_nor_read_sr(nor, sr);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/**
>>> +	 * P_ERR and E_ERR bits are located in the Status Register 2
>>> +	 * of Cypress FL-L series chips.
>>> +	 */
>>> +	ret = spi_nor_s25fl_l_read_sr2(nor, &sr[1]);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (nor->flags & SNOR_F_USE_CLSR && sr[1] & (SR_E_ERR | SR_P_ERR)) {
>> If checking other manufacturer datasheets, would you please check if
>> CLSR is used by any other manufacturer?
>>
> 
> This is limited to certain subsets of Cypress/Spansion flashes.
> 
>>> +		if (sr[1] & SR_E_ERR)
>>> +			dev_err(nor->dev, "Erase Error occurred\n");
>>> +		else
>>> +			dev_err(nor->dev, "Programming Error occurred\n");
>>> +
>>> +		spi_nor_clear_sr(nor);
>>> +
>>> +		/*
>>> +		 * WEL bit remains set to one when an erase or page program
>>> +		 * error occurs. Issue a Write Disable command to protect
>>> +		 * against inadvertent writes that can possibly corrupt the
>>> +		 * contents of the memory.
>>> +		 */
>>> +		ret = spi_nor_write_disable(nor);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		return -EIO;
>>> +	}
>>> +
>>> +	return !(sr[0] & SR_WIP);
>>> +}
>>> +
>>>   /**
>>>    * spi_nor_sr_ready() - Query the Status Register to see if the flash is ready
>>>    * for new commands.
>>> @@ -546,7 +628,19 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
>>>    */
>>>   static int spi_nor_sr_ready(struct spi_nor *nor)
>>>   {
>>> -	int ret = spi_nor_read_sr(nor, nor->bouncebuf);
>>> +	int ret;
>>> +	const struct flash_info *tmpinfo = nor->info ? nor->info : spi_nor_read_id(nor);
>>> +
>>> +	if (IS_ERR_OR_NULL(tmpinfo))
>>> +		return -ENOENT;
>>> +
>>> +	if (!strcmp(tmpinfo->name, "s25fl064l")
>>> +			|| !strcmp(tmpinfo->name, "s25fl128l")
>>> +			|| !strcmp(tmpinfo->name, "s25fl256l")) {
>>> +		return spi_nor_s25fl_l_sr_ready(nor);
>>> +	}
>>
>> No, we can't accept flash name comparisons in the SPI NOR core.
>> If CLSR and RDSR2 are just spansion specific, we can provide a sr_ready
>> function pointer that can be filled by spansion flashes. Or some other
>> method depending on the CLSR and RDSR2 exposure through other
>> manufacturers.
>>
>> Ideally one would skim through at least 2 - 3 datasheets from each
>> manufacturer available in SPI NOR. Preferable each datasheet from
>> a different manufacturer family. Unfortunately I'm not aware of any
>> standard that describes all the supported SPI NOR commands.
>> If you find this overwhelming, I can share the workload with you,
>> but at best effort. If you go through this by yourself, please
>> save the name of the datasheet flashes that you go through.
>>
> 
> Agree with Tudor. There is quite a bit of variation even within
> Cypress/Spansion devices. S28 series of flashes have these error bits
> within SR1 register. See: https://www.cypress.com/file/513996/download
> 
> So, this cannot be in SPI NOR core.
> 
> spi_nor_xread_sr(), spi_nor_fsr_ready() and spi_nor_clear_sr() are all
> vendor/family specific and should be moved to appropriate vendor
> specific drivers.

Have to admit the comparisons and the function here are inappropriate, 
though it's the fastest way to fix this problem.

I'd like to move spansion specific operations out of the core.c first, 
basing on sr_ready function pointer or other mechanisms mentioned by 
Tudor, and after that I'll see if I'm capable to cope with the other 
several vendor/family specific functions.

Regards
Yaliang
> 
> Would highly appreciate it, if you could fix these up as part of your
> current work. Thanks!
> 
> Regards
> Vignesh
> 
> [...]
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
