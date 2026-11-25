Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60777606A323
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZxNxl2Xh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=bei2+ZFD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XxXgCp9GQri12ptrH/S5OMM6AAFPs8K5ReDOZWudY4Q=; b=ZxNxl2Xh1mzUyzCL+ih93F4Hqo
	DrZmWYoV9pSRUR7RRXK/kHt6WnrBXLQ8fqC5b4HfBa39BzK8AvVbEoly3L7ySj85hlGpj+VGACM8D
	BuOGp7+JqEiNSGY2fDlv1s8q/19z7ZyXnqphrWvG4olpWLcqaKTfKfFg92M3JYxhaPQhuFaeDJCoE
	1NuF1tHRjVZXCBqo2VItUmowumiNY+XGVJThdpG5q9IxSXpVFDvQhmc3twFecQcOQ64ZNBtU4IdjY
	ZZ/xeKaqqM0iZIrYLAYo+AXRbCJ7C2FQmKZx4QmgenKNSALeCWWEZO84mDhgx9WQ/2zGRIT4HXsci
	IeL2Z92w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW84Q-00000008z3w-01yf;
	Wed, 25 Nov 2026 08:09:38 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW84M-00000008z2g-0aJo
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 08:09:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d23hkgkP25hYCf06E1A2CQ+jbAr3IQOB9th+5qFHtcS7PDcfExjn4F3tA8fOmZ6QYu25W2437lcI3HFFiaqNYkatP7JMObgkiG2rPoyt7FYT+RE8y5RnZC0A0fmy2/tE1Qw54seyUk7vDmgCf/OpudbPMkZYJD7TuUEJjs5PjMf6jWJ+csasVsGOIGWf97pptmCkNX0v6lTIaH5AM0CylCSaRCjHdUPEiODZGUKglnLijsj+fmMGTgkPS/cTxFEPSsOD9mMdPL56uUGgqgwtrqckVT4YfW7ChTsMdVArES0vn/hbCilVdCiIqzF4bDpQ+8t1Uqj6DqargB1k4k5X+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enFmk0yi+rlQGU66vv6326yZzjnhm2yn9xicezZkt98=;
 b=HaOvhc50gscgjOx+j8CzB6nRW/YEWZYui5Mib4aDen8yfh/NAH7x2f3CG+lAuwJ2zyaE00WBqHJzVMRe2HAYMH6k2v7qP6G37gVCGmGSxkElmukjLcsBpbJUg5FJx5lrs+otl/0R0vqIlDPodjxb49fB2JK5tdjmizR2DuA8REoMzOf2RRZGHw7adJ3jRyzk69l/9X5IddLWRxas5RFTg1ZtcwyUttbbLxNzfOTRCnT176BOSuQiPFuFnPr5rNvFPBZs7QDLTljsIDVqfCy64t7xd1yMz6U98+L1AGHL8IGonRQ1woiNQSE8gHWlon2PWAN7xKPsGoBrDoWpzJJ/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enFmk0yi+rlQGU66vv6326yZzjnhm2yn9xicezZkt98=;
 b=bei2+ZFDvXZNlUxvsT029ybvPpB0ZRZeHMQjHOTzqdFtaCbX83IHgA01aXJRDRwTA7HUy22NXfh9n8yxe0HBIG+CxKKcZDeoeTbjrTIT0WYGzntOg4js0zHwSNYuBKT3wE11lSHnPTDk6e1ov67U6JtziwtkKreOL/7IulWNDwVvBjQw8uv8+0rdwKKgQgF/4hhcbQB9RuGaRVj6XVHrYUmGxQKNqfyEhAqIuPrqeKV7P6Q4fPb4LFeP0hf1/LGR0P2rwE74oRqTNQdGGiPCSNpiXWDskkcv4CZ1WxXOyaZjl/gYuEiEBwrRKspTmL3rDs3eyujpcs+TkQK69mEukg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by MW4PR03MB6617.namprd03.prod.outlook.com (2603:10b6:303:128::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 08:09:24 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 08:09:24 +0000
Message-ID: <abe873c7-1cc8-460a-a964-e2ca0ab5dfa6@altera.com>
Date: Wed, 25 Nov 2026 16:09:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: fix use-after-free on unbind with
 open handles
To: Michael Walle <mwalle@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <20261022035352.52129-1-tze.yee.ng@altera.com>
 <SJ0PR03MB5950FE5D82CA5E77AAE0AC9CA17A2@SJ0PR03MB5950.namprd03.prod.outlook.com>
 <DMY8H2AUQ3LV.VQ3MVOE3YV41@kernel.org>
 <381b16ea-cc02-4504-bbe0-83762886b46b@altera.com>
 <DMZVY45HFRM3.2GTCZ9BV3YJL8@kernel.org>
Content-Language: en-US
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
In-Reply-To: <DMZVY45HFRM3.2GTCZ9BV3YJL8@kernel.org>
X-ClientProxiedBy: SGAP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::25)
 To SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|MW4PR03MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: e26b2b2d-4753-4062-2891-08df4acb6afc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|55112099003|10067099003|11063799006|4143699003|56012099006|261009223027099003|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: K9aK6MZWPExM30YIuqeqx3kcKhamrdRsT/md+Awp2sdBGBx3E8ntTvrdpHCXQGlW5qfJz97tO1s/B8tvbx0doIclDSzMC8usohT8ytxW3tYZLN5io5OpzJ3xIajo/1d9U67jBWrx4Q6fIY4K3adnwGIBUhA0NTEymxvdKtMJ4OQqdN8aFRhMo02j0gkRqO0q2yjYbL1NisTosFtAcZCUgdGDXRimaLVbi+lzN7N0yuMF5ATZdt+dWg3ItV6dijX+iv+zQghaUNTRW1iMD04tqh/7SNDiah2h5MYOYu9XoQ4GM99uWBtXFnitdSkkEh4bLubxitxomB3ltB39s7zxuSJvOEC52XmhN//zatXSmtMBtcUSX7DYe4vrxmFgAKFnFQ7b5S+CCstHPBi2bBDXmIjgNM2gTK/JhYwnl9x7O9Qmq7cXCcXoKexG/B9Mo00Dzd4xbXO/fB/z9oi1n1Nef5pn9WkiU0QsF6DdGo4LgAgp2FjYZ5YzKt0C54g+RNC3Zq/p3Lxyq1HFCE6pjgPsmgUPNi6lA9vEck/G1+PU3Qx+Tv+lCG8xJ6dhP0DkCHSX+3DYgRgy60ABzp2nDpWOrajiaixgKSLKxICp/NHQrfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(55112099003)(10067099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BHQklwd2pDbGRxU3MvZjdPY3dxQnB1Zmk0OGQwR0RwZjdIR25YUGIySm9Y?=
 =?utf-8?B?ZmNWM0tsdFd1L09JZkxKMmRPOThPYWU4ak80aXJzT3VIVlROQWFZaC9aREgv?=
 =?utf-8?B?WGpZSnpCMmQzd1U1QWRKMjNyOEFpa0pTK05nczlqelU5MW5WSnRhdzZ5Wkdz?=
 =?utf-8?B?cHl3M1VQMTV3NTFadWQ0dUtBUnV3ZmY2N1grbXRobHhObVBoYWU1RU9JTitY?=
 =?utf-8?B?a2g4WjEzcGkya2tqK21NTmxFQ3FKZ1Q3WEZLMWo5SUZxblJ1WHBuY05vSDlS?=
 =?utf-8?B?cUswakp5Rm13bW5DQ0ZFbnZBQjg3ejBRL2Z1ZWliK2wvQWFlVC9pR3N5S1I2?=
 =?utf-8?B?OHRCNWFYVFI5eC9VQ2RlVlhmUWExVFlsT3o5UkNCbVR0NnlhNUlRY2NGc0dO?=
 =?utf-8?B?TjdhSHlLVUxSZkdiTVdUN0ZOMHF4TVZIMXJzZTN4NWhNZ3lIT1Z2OFpKQzVD?=
 =?utf-8?B?czBzWERYT0c2b2NlNm5BeFN6ampiemt6V3VqRE1YTytXWFVnZ2FRSVBNcmk2?=
 =?utf-8?B?MkNiVUxOOVZ4S2V4b3BiY1hWZlpwR0FMOFdpWEtsWTIwMklOZlcySXIyY0gv?=
 =?utf-8?B?STNQNW1nbitzKzhuNzA3V0NTWlZwZVVIUGlYb0VsTkU5WXhydkNJSmdEQngy?=
 =?utf-8?B?UUxRRzdsS0Q2Ym9WbnF5SXVLd3RHS1M1anpjRGIvb0YzYUVWRXJoblozTktI?=
 =?utf-8?B?c3hvSG92aDJmRmQxUm1zZ1BrV1JWL0QwbkVzZUlLZjFKR1hEd2xPMjZ5M0Ri?=
 =?utf-8?B?Mit2NFI5RE42QkxZS0lULzFxS3ZGeUFxUkJqUDJVMWpRbklXRUtqejVKTm14?=
 =?utf-8?B?a25BWWFwZWZlS0VYUGsvNUdDRnhSemk0SzRoZDdXUTFONHBpaGNYUGIva1Bn?=
 =?utf-8?B?bzVuVHk1Y1REOURUQkhEQTI0amRBblNodHdjTEJLM3lwTWgvM0RKQ1VxcWdU?=
 =?utf-8?B?SUFrZm80KzkrbG9VelBqdi9JSFpoY2VlOXZadTlzeEJnbSttTnlqc3NUdGFk?=
 =?utf-8?B?YnFqK2pVTWpSSUIrTGU3ZHZqRWZ4R0lrSTFHZGo1T1B4cDQ4ZVFZYlBpVy83?=
 =?utf-8?B?K3pPV1B0dnlKQUlFUVUwQlFRVS9welpmTzVrNEM3S3lLUzROdXhRdlMwb0l3?=
 =?utf-8?B?SzY2WFUvdklDY1JjQkZzWEF0cDhVMEpoUWl1dWljMHRsaDd1U1F0bWd2SHVu?=
 =?utf-8?B?UXdoSWdna3daRGJGRktXTmlwcFNoclVrYzdUYWFpVmtwQmF3Y3J0bkxPYU0z?=
 =?utf-8?B?bnArZVo5eXZjRnRac3FYdHhWajRPMEtmN2pFc05odVRKOWk1YlVtNWE0NTU1?=
 =?utf-8?B?b0JvYnU0ZGZEZ0k0dGFoRFQ5Z3A3MFJiNDQ1MzFxSHdIZzhkMFNHTWd4cUxZ?=
 =?utf-8?B?U1o5N2E5alAyS056TVNuQ0tGZXRkOG9wMXRWNmcrNlo4S1IwdE5IcmFkYm4w?=
 =?utf-8?B?VHcvK0xaVWl6YWpQc2xhaU5YTGwvc3hhVGlSMkpsSm5OTUZqd0JnY3J4Rk9L?=
 =?utf-8?B?eStoV1pKTmpCS0xwb1Fva3JGb2VoTGJDRW14ekxTNmJzZ09JRnhyQmV3eGtB?=
 =?utf-8?B?d1BRQmV6K3JlcUg2WU9Rbmxxaklic2k5cTNIQTREcGFoeXh4SWZmUS8zZExI?=
 =?utf-8?B?bDNmV2Iza042d2hmeHRVZFpiYU1sVmQ4UExwWUt1cVhhMDFEc3NZVmFKKzdY?=
 =?utf-8?B?dUtNdndkZWRnY05FSTlVTDlGOVExZHpSdkVqc042SjNtaWVueWVmVk1BVTBm?=
 =?utf-8?B?aFlzKzRVS3pvRC9TTmhUc3puejR2U00zWTB5U2NBb2J2b2RIWmlTaW41MmNR?=
 =?utf-8?B?VnpGY1FNNmFwQ3RtSW9LTlYyaGs5SzZtODQyTXZYZE42L1prR3VQLzNEbWpq?=
 =?utf-8?B?c21iSHdxUFlSYlA4dEVWU3JsbzFPdTQxc1N0TjA0UzRWM1hjZXpVbXZ6V2ZE?=
 =?utf-8?B?R3NFbWI5aFhhdmdSZG9YWGoxVmxuTVBKc0t5aFVqQ3orT1VmWWhUR3JSVWhO?=
 =?utf-8?B?VmZIYjhZbEhHd1hCeDFCVGhJbENIVFRjYWNoWU1SN3VYcEhzd2ZZZjV6T1NW?=
 =?utf-8?B?UHVDMk40dHdyK3djVjgwVU5obG1mSE1RMkU2OVpid2dBNW84R3BqZERjR1NG?=
 =?utf-8?B?Vk1CNnc1eTlBdFRjNlFyYU1VaHpEdml6bGltaGlRZTArWkIwbk1qNGs2aUF6?=
 =?utf-8?B?RnBrbHQ2dVZCYkk1RHV2dmlNRFAxNE02RGR1UW51UFhuUkVCOEFMVFVYUk5U?=
 =?utf-8?B?VnVxNXlYYVFBR0pQNEZPSGVMWGNPMDlqdlducVZvdU1nSzlpbnFDZEw4WU1X?=
 =?utf-8?B?a05nY0srSlJybS80VUZzVElDYVoycitXRW5VTjRpSXR0eHVXVmp3QT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26b2b2d-4753-4062-2891-08df4acb6afc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 08:09:24.6886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihWt2l3kDmrheOOfwjpnHsJ/f2BEGRMcwW+qnIn1FGlDbzAR2thaBfGc7QAtvouSEj1b5h7F0wR5uk5ezFJnzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_000934_184977_5992FADB 
X-CRM114-Status: GOOD (  11.75  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 20/11/2026 4:12 pm, Michael Walle wrote:
> Hi,
> 
> On Fri Nov 20, 2026 at 3:21 AM CET, TZE YEE NG wrote:
>> I would prefer to keep this series as a spi-nor-only fix, since it
>> solves the problem for spi-nor today. James Hilliard's raw NAND series
>> [1] adds a generic opt-in lifetime to the core (mtd_set_release()). I
>> would be happy to look at moving spi-nor onto it if it lands, but maybe
>> in another series. Are you okay with keeping this series as is?
> 
> No, not really. Sorry. Esp. given how cluttered it is and just
> solves the problem for one user of the MTD subsystem.
> 
> -michael

Hi Michael,

Understood, thanks for the direct answer. I'll drop the idea of merging
this as a spi-nor-only fix.

Two questions so I can pick the right next step:

1. Patch 1 (the module_put() reorder in __put_mtd_device()) is a small,
    independent fix, and James's series [1] lists it as a prerequisite.
    Are you okay with me sending it separately?

2. For spi-nor, would you prefer I wait for the core lifetime in
    James's series (mtd_set_release()) and convert spi-nor onto it? I
    can do the spi-nor conversion and test it on hardware. I can't test
    the other MTD drivers.

Thanks,
Tze Yee

[1] 
https://lore.kernel.org/all/20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
