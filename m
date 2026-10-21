Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC65606A329
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Oct 2026 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QbdSxaG5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=HGbIkmUc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fiKdG2la5thUXtbj8jNsMJDy2D6zbfpvN754lFBhBc=; b=QbdSxaG5t/WpSFwlAaZ3nABHq7
	VcHaFh4JDov4+5uhQ/NJ9iIB8S2bXP2iZFGStq+Gorbydgksxk7JgFibBfLWxGiwInAVHdoeRiNzl
	xRe/i9pSM4O63og/dj7aJHCEOphOjFBWZKbXy2haISVSchcD/tyYZGCYc6XRMMzflwHbei1iQC6je
	FjVfkZzOqeieHt656Ygzkl5Nak3M3yP9sv53I57r4x98B7Yjf3RZt4iOZMPGRNqzyDuwzvxfg9+P1
	2fRpDrKDlNsSUlrU0a/cvUQgDHxIzHN9wQWWc7IWaiwz90hHZYRNvxPsfq3Qe5jJ3RK7GQ2HVzQOR
	pHAbn1Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVjR-0000000BpwV-3BUg;
	Wed, 21 Oct 2026 12:47:49 +0000
Received: from mail-northcentralusazon11013003.outbound.protection.outlook.com ([40.107.201.3] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVjN-0000000Bpux-3HFz
	for linux-mtd@lists.infradead.org;
	Wed, 21 Oct 2026 12:47:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IartEXToUPy7opxTAz+xrbdbKYk+DTTLFjH8Nw7B2qKMSWZMHuxTj16OlVarqjPBBiRCurfE/oBa6+mea41BkmoLTNKFdalGaJT5NR+Y1SI2cZrtxxMHNL3/879PYsufzBOiDbmvFXInr/v5T5DPQZdKDaq6CfNQnYs9YkUZlp8NRJ8z2BYitP33TSU6WMm5eFKP5iZEQQ4JtI5U5q9bj8e454SEfqJ0tG5AzpDIc/mKcRDKo9PHHfEpPqN5Ijj+XPqXlts/6pDES5e35/Bh/R28nVSn+xxtd8yF5cY+VE72L+OhR5zTrdzAp/xGB4YKWhSvK7X6JQOgMRMFIHoh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFh9+hM5Xsu41g6QajXVIc0cnF1Vj+rs9UhhzOy/OgI=;
 b=Q20LISVj+Do7fJ0PZlH1Hw0gUscsgTrP6LJOVey0zSq+s3M4OiM76a6nCLBsTcCmDY77JybCwxYX2giPyvPLeZi8wGsRvr14RgoTeGG/1llBMaI2qrJULIbqXgLCZJ2PPWTFDk7Rb/X/wQVoCnrDZTA9vSg5fdcWrmP+86WrgCcOYOx8HqGfEQUKkOXP3QLZ/hsu0MrHkRPA8/SmEaDozuST1KZhN+3smsEtJKFK9zFGhftltDinjfGYINO8lnkQlj13kJWfAjo5X1P5soPmB0EagkXR0oc0+pCUquhnFH5KodX8e54RQJ9J3kwG3AG5VWongUxKF+lo6tZIDsQK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFh9+hM5Xsu41g6QajXVIc0cnF1Vj+rs9UhhzOy/OgI=;
 b=HGbIkmUciiIN1ezF30mHC77ivsveAYskrp4KNwlLjfRTJWzrDO/ulCvkFbsGYk0f6TbsJpukC40/8WaOs9LWht6a1JlC40k8P1f1hjvsEWvAE7C9Qh5AzSFgSE+poVFX1MyJAQOxTZLa8i5bPczaOKbn7pjx7wpE8axGgzJt4Ns746naJAIiZNlhYVLhM6oAVUaHI3JN7BO7jUdoMB4df9VYi/98lRfVJwmVBSClMbOF+Xd+mqzxmaMof962M3RpWfJvO+w23Y6eWDdAIRDocLP0oHoTBJob6qH8BJSEDazE8uPWJcnprvv5m9FtjLgzV9IjbFcjRV34byejevB8mA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7732.namprd03.prod.outlook.com (2603:10b6:408:281::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 12:47:35 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 12:47:35 +0000
Message-ID: <f9ca9c26-722a-47b5-b405-fd5e9c85bafe@altera.com>
Date: Wed, 21 Oct 2026 20:47:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: fix use-after-free on unbind with
 open handles
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <cover.1791512623.git.tze.yee.ng@altera.com>
 <f03556b68e5d25bca6b3f533e344d83fc611c3d5.1791512623.git.tze.yee.ng@altera.com>
 <sashiko-outbox-165042@kernel.org>
Content-Language: en-US
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
In-Reply-To: <sashiko-outbox-165042@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: c48cbf82-853e-4d0c-80ae-08df2f717b5e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|55112099003|6133799003|18002099003|10067099003|22082099003|3023799007|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: xClidCcr9UrWyH/rsQRainRjJ6EwukTKajMzsYBaHp7ps9TkcBTIJJ/2de6lxcASLp1BqTvZRX7rOjDO6sZPlSepDmyy9UzO7f7lTvqVo4eDpQS/7VXGgpuzF+j33lKQr+5920GzzGhShcklWrQB/XDRr7Cbjfb10LVqlF6PT6JoI0gu6s4k8VvyFqaIC5Sv3k36JXnHFJ0ri8YsTwbwsgJ2TPQD0M2+IVXQnycHASUBO72ABITbU4ZcaJT0C7Br+lx3D3edANLbMJv+ecR6vAJ1YdeMst+cZZ//rjDvwX+tCwsGgPqm9KsGZg9KXZaJTGet/C+KGZ/tXu+LgM79bdy3bozWLufpiEsnBRhWs10D5rJWJP2MPMVtEFFLz31JzibyoZ9CFwV3UMqf1s/bmhvQoyKY2JxAyJk6Gh3WfutkIoJEcDtm5eRmlet9idqo2/I7lxeqsRdq4LDWmSAQt6IUPTb5hNaJM47TeCWdD4uGLf/KLpPp1KKp4Y+onYV1I7MhRzRlGAJ7yF6cQeF4ci+wkZ18FogKNdpVT4LDbQOyGjfM7tmwqWP/Fo3bbA4R+CuTAwCY88RhtBqO45ZqQ75YGR+6pGLTobv6pZT9IoXNJjRKRMLwleS5VBhNBBZ110BBYoQjf8sBz3d9dXOzbt6i74jQ16OThkbfnseQ24w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(55112099003)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czlmZ0ttd2RwbldNYlBVQnErUWJRY3NRV2QwYjhON1BmUks1MnJidDBkK3d2?=
 =?utf-8?B?bzFjZUpTMkI3Y2xvR0ZyVTQ2Rk0rbXJaVGt4djZiUnN1NGMvNHhZekVzMGFu?=
 =?utf-8?B?eE05TCtmUGI0Q25XeGxxYmRqZzdMWCtFU0NTVzB6ZzV0YnAveERERUFVb2dQ?=
 =?utf-8?B?MTVDKyt3TWxZbWhPRjArWVJwazVydk16ZzhpYVpWNDZER21pTW55WjNJWXgr?=
 =?utf-8?B?a2NQdjJTOUkrRnUzUGxLeHEraDhHSy9aRk81NU5vVmtkbDhmSzZ1T0ZuSDFL?=
 =?utf-8?B?SVRhN2k5THdqS0VzMEhIck03NFJtd01XeXdzT2dLTzFJMm1SQzV2aFh3YitJ?=
 =?utf-8?B?b0JtQk1MMlVUVGR6WDJQOEN4anhNbnJERlYyTWFpTnBteWlQcFJseXBiVzBZ?=
 =?utf-8?B?V0VYYmM5cXE3SXJ4VmoxZnZrTXBWWEo2YnhWUitvOW5UQTF4N3FOUjBEL3ND?=
 =?utf-8?B?SGgzcjVOUUhlcUx2cS9lVS9qWjlHV0FyaVo1RlA4NkdjdTJZY3lma0EwVlo5?=
 =?utf-8?B?WjBxanIreFhiSU8rVjVhL3praE42ZmdSbWJmQUoyMjd5alplcEM2UWpMbmg3?=
 =?utf-8?B?emZ2c3RuV3dDU0JhUSs0bFRoTUVudDJsNE1xYmtNOHZ0bXkzNy80NTVoWUl6?=
 =?utf-8?B?Mi9VTUM2bWRaMjBWZHJYOENOdzV0QWg0OW1ETCt6dVorQmliN3pYMWY2dXlZ?=
 =?utf-8?B?SlF0clNVSDUyREN5eTZseGtVVFo2eEIvdllQRHl5UmNZQVlSSUJLdjBYVUVR?=
 =?utf-8?B?K09HY0doRVlPb2dKcjVJOFc1blBjb3FpVWRrRjVONkpsT3hiaUZaWkwvdE9v?=
 =?utf-8?B?R0JRQjlOc1hRd0l0T2JYRGVKWEViTGhYcUxTOG1pVCs0ckEyQ2pJRGowRmYx?=
 =?utf-8?B?SXpQUElZVCtNcmpiZXNsK1BOZnFMeFJ5SThjOTNRZUxkYzJjZDVaTmkxSlh6?=
 =?utf-8?B?MXBRcVpsZG1KWW9HZmFzQjFHcWZEaS9VWkppSWhCVkVpdzM3RU55alZ3Mlpo?=
 =?utf-8?B?Wjl2eWhod1gxb1FBVDkxV054cDVLT3pkblhBQzM4WmYzWDQreFlqaDRUN1Zu?=
 =?utf-8?B?dzNtbUU4V0MyVlFQVnRpRlN5YnpML284a25WMWJidGJFekp2VndjcDZVYmVS?=
 =?utf-8?B?Z1VLQkY0R3RGaEFVRC82bktqUG5wYjRyU3RaZWg1eFFLQ2trVzB0cWRzQUM5?=
 =?utf-8?B?bU51bDA4cU5iTTY0WGJodDR2bzU4czJlVFk4N2Y3TVY5cFRsZGJwbGJsc28y?=
 =?utf-8?B?QitvQlhBMWpHczE0Wlp3UGlEV2JueDVJbDR5TkMzNlM0M1BLNEswa1JzeWFp?=
 =?utf-8?B?SkxlN3U4bmhrWHdLeS8vbUQ2d0o1enZTTWptMjZtQXFKTGNadGpKaDY2ODQr?=
 =?utf-8?B?QWRLZW5nUmFaaGxDbW9SZFZMZVB2UUdrbWJRbEVrZW9GNVhKSTNrYmVMejhn?=
 =?utf-8?B?SS9MMnJFbnl2RWdRZEtjaG03bFhoZFJSZ2pCT1I1VjJwb0pDMlZCNHQwWEht?=
 =?utf-8?B?K2pxcldaeVk4TkJVK09IR3g1TkJUZFdGUkp6ZHRWRjE3WTNsK25mK2tpWnI4?=
 =?utf-8?B?cUNsWTI1ZDcxdW03Y2hKODhUNGEzMHdmRWY3MUNPUXJOZEZIVG5tVk9BUkhM?=
 =?utf-8?B?ZC9XYjBUZGRtRUovSkhEOVRtNEEzLzhtQVBrRkpCVjF2cVBxNXczZUxwVkdH?=
 =?utf-8?B?aVdMU29ITUgwaHBTUk1YU0hKL25QREx0MTFnVlVRc1p5WVVZcE4rNGowQzJE?=
 =?utf-8?B?RURVZmNaenhJaHN0dTVGelFLejlXcGdYdSs2QXVWSnAvZEJrOG5nYzM5TUxj?=
 =?utf-8?B?TTZBQ04vTzdOL3JZNmNHekRGeHdaQnE1c3lYeUEwVXRBYzhtamNydkxuVnMy?=
 =?utf-8?B?TFVzSlpERTBEVzhKRTN3TXNFdW9tVG1CazAxK1BXZHhydTZKZ1Q1OWRBaG15?=
 =?utf-8?B?V0tqRGl0UkcxM2h4bWhENzZHM29Wb3FZZk9FdFJ4SlBmQ1dJdXYvZmx1M1Jo?=
 =?utf-8?B?c2FLdUltdlBpWnFkZGtsem1mektYOUI2aXNHQjZ1ZWlTQWhrU3h0elg4bDBm?=
 =?utf-8?B?RFdnT3pYd05wRjNRUGJRWDZ5WjdFb3BiQ1cyYlF4aWVJK3MvQ1YvQXQzdGNr?=
 =?utf-8?B?ZFNhS3lzUngvMUc0WDdjQXhQSUM1blJaalVkZTJETWE5M2VaV0xjTXFoWUd1?=
 =?utf-8?B?djVIUFNMSGZZU0VUMXlFZk9nVTlJUVhmQ1lLcnBLRTV5RVZMcDlWa2NmdWhR?=
 =?utf-8?B?SklsZWNLZW1JazFkWUgvdXJaU2xPQWpKdG0xNDlKV3RBRXc3QTZvSGRLREtE?=
 =?utf-8?B?WXNaQWpxYWhIcUpTZDFtL1B5QVN5b1ZIdWZiMS80em4vK1o3MUd1QT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c48cbf82-853e-4d0c-80ae-08df2f717b5e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:47:35.8392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTeJ5q2a8P8mnWgNEpVMEt7MUgYnciknvcFKs0emHdW8mEFrMtGrCqxMCfGTSEs1YVsnWbcJch00c2d2zDbJQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_054745_887348_C95E85C8 
X-CRM114-Status: GOOD (  35.31  )
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
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi maintainers,

Thanks. Going through these, here is what I plan for v3:

On 9/10/2026 3:57 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [Critical] mtd: spi-nor: double-free on mtd_device_register error path
> - [High] mtd: spi-nor: UAF via TOCTOU race from lockless master->removed check
> - [High] mtd: spi-nor: UAF on nor->id and erase_map via debugfs after unbind
> - [High] mtd: spi-nor: UAF and NULL pointer deref in spi_nor_put_device() on unbind
> - [Medium] mtd: spi-nor: memory leak of mtd_region on error path
> - [Medium] mtd: spi-nor: memory leak of spi_nor object on unbind
> --
> 
> commit cf3ecfea956c974ea676c9cd71ff2115f0af32ca
> Author: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> mtd: spi-nor: fix use-after-free on unbind with open handles
> 
> The commit switches spi_nor objects from devm_kzalloc to kzalloc with
> a custom mtd->_free hook to ensure they outlive the device if file handles
> are held open. It also sets a removed flag in the remove callback to
> fence off hardware operations during devres teardown.
> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 8bc117b46e028..b28d896f16ed5 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
> [ ... ]
>> @@ -3549,8 +3558,12 @@ static int spi_nor_set_mtd_eraseregions(struct spi_nor *nor)
>>   	struct mtd_info *mtd = &nor->mtd;
>>   	u32 erasesize, i;
>>   
>> -	mtd_region = devm_kcalloc(nor->dev, map->n_regions, sizeof(*mtd_region),
>> -				  GFP_KERNEL);
>> +	if (spi_nor_uses_free_hook(nor))
>> +		mtd_region = kcalloc(map->n_regions, sizeof(*mtd_region),
>> +				     GFP_KERNEL);
>> +	else
>> +		mtd_region = devm_kcalloc(nor->dev, map->n_regions,
>> +					  sizeof(*mtd_region), GFP_KERNEL);
>>   	if (!mtd_region)
>>   		return -ENOMEM;
> 
> [Severity: Medium]
> Since mtd_region is now allocated with kcalloc, does it get leaked if
> spi_nor_get_region_erasesize() fails later in this function?
> 
> If an early return happens here:
> 
> drivers/mtd/spi-nor/core.c:spi_nor_set_mtd_eraseregions() {
>      ...
>      for (i = 0; i < map->n_regions; i++) {
>          erasesize = spi_nor_get_region_erasesize(&region[i],
>                                                   map->erase_type);
>          if (!erasesize)
>              return -EINVAL;
>      ...
> }
> 
> mtd_region isn't yet assigned to mtd->eraseregions, so spi_nor_free() will
> just call kfree(NULL) and leak this allocation.
> 
> [ ... ]

Agreed. I plan to assign mtd->eraseregions right after allocation, so
the error path frees it.

>> @@ -3788,12 +3820,13 @@ static int spi_nor_probe(struct spi_mem *spimem)
>>   	if (ret)
>>   		return ret;
>>   
>> -	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
>> +	nor = kzalloc_obj(*nor, GFP_KERNEL);
>>   	if (!nor)
>>   		return -ENOMEM;
>>   
>>   	nor->spimem = spimem;
>>   	nor->dev = dev;
>> +	nor->mtd._free = spi_nor_mtd_free;
> 
> [Severity: High]
> Does extending the lifetime of the spi_nor object cause a crash in
> spi_nor_put_device() if the file is closed after the driver unbinds?
> 
> When the MTD device is eventually closed, mtdchar_close() calls
> spi_nor_put_device(). Since nor is still alive, it will attempt to access
> nor->spimem to find the controller. However, nor->spimem was allocated
> via devres and freed on unbind. This also attempts to access dev->driver
> which will be NULL.
> 

Agreed. In v3, the controller module will be cached at probe and used in
->_get_device()/->_put_device() instead of nor->spimem and dev->driver. 
Patch 1 will keeps the module pinned until ->_put_device() returns.

> [ ... ]
>> @@ -3830,29 +3863,56 @@ static int spi_nor_probe(struct spi_mem *spimem)
> [ ... ]
>> -	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
>> -				   data ? data->nr_parts : 0);
>> +	ret = mtd_device_register(&nor->mtd, data ? data->parts : NULL,
>> +				  data ? data->nr_parts : 0);
>> +	if (ret)
>> +		goto err_free;
>> +
>> +	return 0;
>> +
>> +err_free:
>> +	spi_nor_free(nor);
>> +	return ret;
>>   }
> 
> [Severity: Critical]
> Can this cause a double-free of the spi_nor object?
> 
> If mtd_device_register() succeeds in registering the master MTD but fails
> subsequently (e.g., partition allocation fails), the MTD core's error cleanup
> drops the master's kref to 0. This triggers mtd->_free (spi_nor_free) and
> frees the object.
> 
> Then mtd_device_register() returns an error code, causing a jump to err_free
> where spi_nor_free(nor) is called a second time on the already-freed pointer.
> 

Agreed. I will fix in v3. With no core _free hook, the core would never 
free the spi_nor. On a failed mtd_device_register() the probe would 
fence ops and drop the single registration reference, so the object is 
released exactly once.

> [ ... ]
>> @@ -3875,6 +3908,21 @@ static int spi_nor_remove(struct spi_mem *spimem)
>>   {
>>   	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
>>   
>> +	/*
>> +	 * Drain in-flight ops and mark removed so later ops get -ENODEV
>> +	 * before touching bus resources freed after this returns.
>> +	 */
>> +	if (!spi_nor_use_parallel_locking(nor))
>> +		mutex_lock(&nor->lock);
>> +	else
>> +		wait_event(nor->rww.wait, spi_nor_rww_start_exclusive(nor));
>> +
>> +	nor->mtd.removed = true;
>> +
>> +	if (!spi_nor_use_parallel_locking(nor)) {
>> +		mutex_unlock(&nor->lock);
>> +	} else {
>> +		spi_nor_rww_end_exclusive(nor);
>> +		wake_up(&nor->rww.wait);
>> +	}
> 
> [Severity: High]
> Does this create a TOCTOU race with lockless readers?
> 
> A reader in the MTD core can check master->removed locklessly and proceed.
> 
> If that reader blocks waiting for nor->lock, and spi_nor_remove() concurrently
> acquires the lock, sets nor->mtd.removed = true, releases the lock, and returns,
> the driver unbind completes and devres frees resources like nor->spimem.
> 
> The blocked reader will then wake up, acquire the lock (failing to check
> removed again), and try to access the freed devres resources.
> 

I will fix in v3. removed is set under nor->lock (or the RWW exclusive
section) and re-checked under the lock in prep_and_lock(), _pe() and
_rd().

>>   
>>   	spi_nor_restore(nor);
>>   
>>   	/* Clean up MTD stuff. */
>>   	return mtd_device_unregister(&nor->mtd);
>>   }
> 
> [Severity: Medium]
> Will this leak the entire spi_nor object if the device has partitions but
> CONFIG_MTD_PARTITIONED_MASTER is disabled?
> 
> When that config is disabled, the master MTD is never registered. In that
> scenario, mtd_device_unregister() returns 0 early without invoking kref_put()
> on the master.
> 
> This means mtd->_free() will never be called, permanently leaking the
> kzalloc'd spi_nor object.
> 

Agreed, same cause as the core leak above. remove() would always drop 
the registration reference, whatever mtd_device_unregister() returns.

>> diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
>> index 288e2866daedb..a0639e91cb2d9 100644
>> --- a/drivers/mtd/spi-nor/debugfs.c
>> +++ b/drivers/mtd/spi-nor/debugfs.c
> [ ... ]
>> @@ -299,15 +297,10 @@ static struct dentry *rootdir;
>>   void spi_nor_debugfs_register(struct spi_nor *nor)
>>   {
>>   	struct dentry *d;
>> -	int ret;
>>   
>>   	if (!rootdir)
>>   		rootdir = debugfs_create_dir(SPI_NOR_DEBUGFS_ROOT, NULL);
>>   
>> -	ret = devm_add_action(nor->dev, spi_nor_debugfs_unregister, nor);
>> -	if (ret)
>> -		return;
>> -
>>   	d = debugfs_create_dir(dev_name(nor->dev), rootdir);
>>   	nor->debugfs_root = d;
> 
> [Severity: High]
> Since this devm_add_action() is removed, do the debugfs files remain
> accessible after unbind completes, while we wait for the final mtd close?
> 
> If the debugfs files persist, accessing them can cause a use-after-free.
> 
> For example, reading the params file will call spi_nor_params_show(), which
> dereferences nor->id and erase_map.regions. Since those were allocated via
> devres, they are freed when the driver unbinds, even if the spi_nor object
> itself is kept alive.
> 

Agreed. In v3, spi_nor_debugfs_unregister() will be called at the start 
of remove(), before devres frees nor->id and the erase map, and again on 
the probe error path.

I'll send v3 with these changes.

Thanks,
Tze Yee


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
