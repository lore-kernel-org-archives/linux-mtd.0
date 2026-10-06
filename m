Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC26CA5FFE
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2026 02:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBbGT5MiWfzUYCyHa1uqgwGBQ/oBzSbm73sh8VVl0cQ=; b=PLirQA327Dz4CGXtdngwI/rwha
	NZPJ4w6JQwm3KbFObGyTX97jEmsmiNTEmxeY7iXRArck2bcw4FWGc4PIQzUJ0lye/fK+aegQfB2ZT
	/ZTDPxxukzHY4pGo4hFgxaFUXFkH0r0zz5Y4fwwCJyWzfH1oPkrNrnw3vgv3hoLmtcsnNmylHc9Dv
	1ZRRyg4aQCMHnVc0+s5Vp/y9Pye1HrUerz/KJLUSxbdGbVkNw0r8x2YmvmQhCkUH37Vx7/9VJMsRF
	Osqi95ljlGGjF9D2f5oL51WlhYp8hroVXQQ5mLO7A1OdOeXU/3icmnJF06heAU1MyEQIuQAT7E4II
	SoqoyBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDugu-0000000HUMW-1KAE;
	Tue, 06 Oct 2026 02:14:04 +0000
Received: from mail-westusazon11010065.outbound.protection.outlook.com ([52.101.85.65] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDugr-0000000HUM5-2WmW
	for linux-mtd@lists.infradead.org;
	Tue, 06 Oct 2026 02:14:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbZil9rMsjiVAXYs+vf/5d/C27s1VxTzdI16SUTJI7zioFuvXAtekIbEsGIzx0nHHN7fhEevpPKUcm36OvVyZlhdiG0qCHWaDWno+PnzuawZrOnGOLCohXEXfkk5GLX/DE9ezrzzKUFg6fj3Dq2pIvirgznBEjNz12EuzWxos4zYU6jTPVzlsM6/ZvIboeuHQkf4GSTwSDKpMEqeyvZGXDaSVSy0JDQaxzwHT0yvpelWiYRwuf/KdXKKuC80rEO5vpS/n+yCj8SWeD14+wrPHc3EFReiBfyv9srNTOyPFzKTzyimE4FGZeFbWdUTYxw2jxf7Thjd78ASaMUc16xupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJiE9h8HXmcEoqXYWBr8/RXbWLvj+mMuK5j/mZ6TVAs=;
 b=zRvzf4qd/mvC4Hzebk+CeQUNiF0fK2VghRzolFLsuCInyXCt24GnxeUsUvPeJV6EMH4oOrt69TtUAim2/WvohLNKLRPtMBQxrs2QhA0qSXiyB+5/jPtB+eV/Tr9g7O/j8KdFVqJMfx7AdVeOQ6VjFOKI5qRCqb2RfS6QVK6DXNND+b8NVr29fd4zlt0tnnGY+g1YVURovb36MO9XWJeIv7LT9VnEy5kSkvSLUt0qP35XCAMsxk2Z+RQz+gWi51AuMMdAU4jjtJ0R/ReNN1P8dVK0fjqdaYP2L0OEWmzyd/B8ldCMLUFx/Y7byu5eL3SAdALWI/9lx8prOYJpOp0flQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJiE9h8HXmcEoqXYWBr8/RXbWLvj+mMuK5j/mZ6TVAs=;
 b=CAsSEcHI0fV1N4JrYJeUysBXY7p3CMUcTlRRsRnvXigiDNXb8vvbPyVsmHBADWcVa0OF0pHM5gUnft0BdOprqufvitOEFRtc0ZEGAnsF2Ru32KfO9k7sKSajVqpX32/dWNYm26Vf4OT3COmNx7lVfNk2sAznRWcwbPipA27GT90tw9y2zD9Qna2nLYiFFiOxmQgi+9QfT/8wLfYY0xMF5/4NcMWdRG8IWmu/dak9AbbsRHHFFmEIvYZDRA+Es1Hh8UQWDxH702LmVej2AE0n1JtKo0ykd6VXrE5BCZS0KFQB149BZ4JbfUz5HllOU17uECKHsfimpX8gIhjYMliSWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SA1PR03MB6641.namprd03.prod.outlook.com (2603:10b6:806:1cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 6 Oct
 2026 02:13:53 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 02:13:53 +0000
Message-ID: <bb3d8d0b-360c-4f36-8231-d73a4a1d8382@altera.com>
Date: Tue, 6 Oct 2026 10:13:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: spi-nor: core: Fix use-after-free of spi_nor on
 unbind with open handles
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1788404586.git.tze.yee.ng@altera.com>
 <91e1b12d15d18361f77e5cca934fd4b37a47805b.1788404586.git.tze.yee.ng@altera.com>
 <DLKTDTVQ5G87.3RWBEBN7AV0UI@kernel.org>
Content-Language: en-US
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
In-Reply-To: <DLKTDTVQ5G87.3RWBEBN7AV0UI@kernel.org>
X-ClientProxiedBy: SG2PR01CA0196.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::23) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|SA1PR03MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: 583cc939-d6a0-453d-de14-08df234f77e0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|260925021311599003|260925021911599003|4143699003|10067099003|11063799006|22082099003|55112099003|260925022911599003|18002099003;
X-Microsoft-Antispam-Message-Info: H13p2yxm/jCgKNXmDn2sEDbSikpmXHC0xSlB8t5JzVXq9/NTTCpDZhDpb61LumD+f0oQvySpvOue/MUttLtMRc7QWx/zBRauAHeU2S4O/zEYbgort+7Fyd56EFr0U3K75eAb3Mc7i+f4pojITdl40BzaQpZ/1P8EuwtddOXW7/RVZF4WNXUiIr8jgQ64GRUfWMb81MXssfKWF3lnkruR7I68wz3Tn1HxqwTwKUMBSv1IKAPo7sxi+WyKgRPidIPAv0YfrLp+uv9QA6OJdGMtUHgvNwiRe3RUro99sypOJAVU0enJrZWrtV1f0ndPhNGxy5t4odz6BFf7lNsIgRp3VuRd+jB15o6IVrtPNhc2cYvVOEnkPOSxuaWRxq3uuJtp1WolqRjTbWPmqPmDuKbZPBj4AEVvxg8QlRUyFj0cVY1PC8h2g4qjX1cjETrIsam27T/TXFXyV/5/t0jOCR/sMixo4vvOYh98lV4Hq3Ml5XtP58WvDCykDT3RDhoacMq3bFl0yG+Ye6iy6Ano1Cl7hOl6/uVz5xWQhw7ZDVjaIhvYk7hHYX7KmdKZPTM/z9+wQC7ecm8iNcwDYtCFFMo0wkFzXT8PYGj6U6LY9ZDt1vo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(260925021311599003)(260925021911599003)(4143699003)(10067099003)(11063799006)(22082099003)(55112099003)(260925022911599003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXFwTzRWZHFGZkxMSmxNMVZvSVpFOGs1SE0wck9CcUQ0KzhQVkFPSW1jc0dj?=
 =?utf-8?B?cmFWc0dmS0k0MVZTeGUxQjRPbVg0bm5LWEt6cmFEWUwrRHd5QXcveUZDR2Jk?=
 =?utf-8?B?RjZreXF3Z3Q4ZDlDcTJDSEpJN0ZaNEJla0JrKzF1a2dDd3FmOVZFS2RQbnBU?=
 =?utf-8?B?TktrM2MvQ09aZldqQlVuMUFvNHFSRDUwN2tzMURNWFFlV3RNM0t2K2tkTWJP?=
 =?utf-8?B?SlQyUFRxV0FRUmpWd25ob0hHTkU1WkI1RUppSWhjSUpUdWtYTmI2TGdLL0Ns?=
 =?utf-8?B?M041d1JBVTJlMXhtWkhRcDBldEtRSm9oSmRVTVQ1eWhRZm92ckQvSzdMVzMx?=
 =?utf-8?B?d0loaTBSd3Fmc000K250THpkc0hERm1UcmJxc1hHblhUQ01oUzFXc1RRbHdD?=
 =?utf-8?B?RUlKcS94cml6OWhUVXNncWJSUXlzZ3lvMnJBZTFGbHBTVkk2MFBXSFJOWDAz?=
 =?utf-8?B?eFFOQlFFbDd5VG5VOW03anBQaGpQUnB3UHluTlpqT0FLSFdJSVVtRGlURUpp?=
 =?utf-8?B?NzFpSTNUTHhST1BnbzRWL2U2aTZ0MnhZUnBuY0JxZ2ZrdHdoQUYxOUUwVGF5?=
 =?utf-8?B?aUt2cmhGVUFjUHRKZ0lvalZyallWaUpRSS9XbDRjM0dtTHdhVnpEQyttdU01?=
 =?utf-8?B?QVFMVExFM050NHdzRkhNU3A2cVIrRTBsMVFHbnZKcU9wQlR1WHo4VjVWMmUr?=
 =?utf-8?B?TDR3bzA4UGsrOGdLOVBVOTVHd3hHZ3pTbEJXMGJuSzIzN2szZDhNcVdTcXFJ?=
 =?utf-8?B?eWo2Mm9mRjVkV3lrUTNqR1UvZUhJY0lieDdSSTZVN1JvSWNiWjZpUldSeUxL?=
 =?utf-8?B?NTJxdWdLdSs2bndrdVlOYU96TEN3QUN6VkRpWW1Cb0xCRlYrYktDOGRiOUtD?=
 =?utf-8?B?b0o2TTI2Q3hQTTU1OUR2dEF1S2pqMnpvSEx2LzMxZnlpcUJVMHBhOE9JZGl0?=
 =?utf-8?B?cytWY3RlVjFIeW16cWQvVUxxQWovKzFxY3VtMjBFNHI2WFQwNS8vczJ4Ymp3?=
 =?utf-8?B?anVDelVOK2srUmZtcDBPODAzcDRhYWp6MmJhSmtEQ0pwaVA0SWE1M3k2TWMw?=
 =?utf-8?B?dVNLdklBV0x3N292M25VeHRJQzR1OWtVWkRtdnE2eWhWcFNScVlCSzBIaGQ2?=
 =?utf-8?B?b0RXQWlyMXYrQ0xjV283SjF0d29NalB1VnZaMDRabEhhUTVhbUVSN2dzeURs?=
 =?utf-8?B?TWVDYkRmemwvSXhmT0hkUUhncUM1U3JRQ1BHRFdlZEF0VEZPemt2aDBsUXpv?=
 =?utf-8?B?SXV1UW0rY1k2RStIRFRNaFNiUzlnRkM2QlBEUkhTTHlVam00VkdrbFJMNUl1?=
 =?utf-8?B?aEUwYmphMFlFaHZSY3hrdjA5SVJvbFlDdzREaGY4QU1KOGdoejliVDFvNjBP?=
 =?utf-8?B?bnh0cUlTNzZaTkZNMWJTNGU4cmR5UmZVZ0tSbERPQTF0S2ttZ1ZoQkxBRUtq?=
 =?utf-8?B?aUJmeGZqV2FKWnh6Q0hETDlNZ3NTcHVqYkx1VlhodGlwTTZuajVkVHR6OFdi?=
 =?utf-8?B?VjlqUkRISFdsN2lESytPbFVlakN3aXlpbitsdlYzWDdFbG1oaFZxWkZyUVRi?=
 =?utf-8?B?OEljbG91bDRvZnBseDJHWDFIMHVKMDh6Yk55MHlpVmJQU0FJeUxOY2JNT2U5?=
 =?utf-8?B?bW9tSUVkZGR4U3U4Z0diTFRid1NrUHVJclJvbmN3Kys3Y1h2bXhIT2JjaFFQ?=
 =?utf-8?B?ZFRvUEc1d0xXL0RiVGxLcnptdDB3dUhYMUFIVHRZSGM1dS9kSmxmZTJZbkhW?=
 =?utf-8?B?Q0hCbzRtdDBpRTZIMnB2YTNNUmo1T1dJalpuL1hGWUZCL0VROFV0WXYrYkpt?=
 =?utf-8?B?aG9nOERlR2JtOG1scnJsMmEvWEVWa3VZSWxrSUh6b205NElJMTQ4NXNFeElm?=
 =?utf-8?B?aUZ1VDJoNUI3VVJwTlhEdXJBN2ExelFzbElwam5Yc3hhT2pMeGNwQW0zalBx?=
 =?utf-8?B?NEtTMzBwZ0Y0SnpuTkE1cmVocU4xbE0zR2xhWDJWaVNRckZpRTlYTmViajFy?=
 =?utf-8?B?czFHTkZ5Snc4dytCdXZ1ci9wZmNFT2x6SGZTdVZOWHhTd0dGZnMyRi9YZnhY?=
 =?utf-8?B?cko3MXI4RzcwS3hJeWtNTUk2RU45S25PVWxtTytGL0Z4cjFJcEpWUEw1bDNt?=
 =?utf-8?B?VW40VjZxaWgwTlp2Z3hiRzBTcFRLUlZ4R1pHck14dVh6RktkU3JKOXRxVXg3?=
 =?utf-8?B?R3BJUFRMaytoUjJibURJbjhOVEg5bmNmanFsaWRYcnB0T3hnbHd4Ri92NFlu?=
 =?utf-8?B?dnBBNkkybWt5aHFSSGk1d0JWemk0SU9IN0grQmc5R0FqSzRkazNZa2RBbmM5?=
 =?utf-8?B?WlZBT1dVdUpwRUxwblFtZjF6c3dEaEFuMnJtUU1Md2x3eFhMTnptQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583cc939-d6a0-453d-de14-08df234f77e0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 02:13:53.1250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZQoJD1mDwdAOhITsMM/oVCDGr5NvcgusDJkfmuUaZXEE8b7DiDj9e6SgkXe3+LIh7KTWCdK2qLGOEIgIHMTOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6641
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_191401_681568_64D5D7BE 
X-CRM114-Status: GOOD (  23.46  )
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



On 21/9/2026 3:26 pm, Michael Walle wrote:
> On Thu Sep 3, 2026 at 5:14 AM CEST, tze.yee.ng wrote:
>> From: Tze Yee Ng <tze.yee.ng@altera.com>
>>
>> The spi_nor is allocated with devm_kzalloc() on the SPI device, so a
>> sysfs unbind frees it while /dev/mtdX is still open. A later close then
>> oopses in spi_nor_put_device()->module_put() on the freed spi_nor.
>> try_module_get() does not help: it blocks rmmod, not an unbind.
>>
>> Give the spi_nor (and its params and bouncebuf) a kref lifetime on the
>> spi-mem probe path so it survives until the last MTD user is gone, and
>> cache the controller module for the put path. The spimem and dirmaps
>> stay owned by the SPI core, so spi_nor_remove() drains in-flight
>> operations and sets nor->removed to fail later ones with -ENODEV.
>> Legacy controllers are unchanged.
>>
>> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Sashiko had some remarks:
> 
> https://sashiko.dev/#/patchset/cover.1788404586.git.tze.yee.ng%40altera.com
> 
> Also how does the other mtd subsystems (spi-nand?) doing this? Do we
> have the wrong dev for devres?
> 
> -michael
> 

Thanks. I went through the Sashiko remarks.

The prep leak on signal and the legacy-controller path were
pre-existing, so I left them alone.

The rest were real holes in v1: eraseregions was still
devm-allocated, get_device() walked nor->spimem after unbind, and
suspend/resume had no removed check. Those convinced me the
spi-nor-local kref + nor->removed fence was the wrong place to fix
this. It duplicated mtd->refcnt and still left every other driver to
reimplement the same dance.

On the second question: I don't think we have the wrong device for 
devres. spi-nand does the same thing (devm on &mem->spi->dev). An open 
/dev/mtdX can outlive unbind, so anything allocated on the SPI device is 
already gone.

In v2, I will moves the lifetime into the MTD core: optional mtd->_free 
from the existing kref release, and mtd->removed so the core returns
-ENODEV for hw ops, new openers, and suspend/resume. spi-nor uses
that on the spi-mem path; legacy controllers are unchanged. spi-nand
is not converted in this series.

I'll send a v2 shortly.

Thanks,
Tze Yee

>> ---
>>   drivers/mtd/spi-nor/core.c  | 111 ++++++++++++++++++++++++++++++++----
>>   include/linux/mtd/spi-nor.h |  17 ++++++
>>   2 files changed, 118 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 8bc117b46e02..7fb61dde58f5 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -45,6 +45,9 @@
>>   #define SPI_NOR_SRST_SLEEP_MIN 200
>>   #define SPI_NOR_SRST_SLEEP_MAX 400
>>   
>> +static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len);
>> +static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len);
>> +
>>   /**
>>    * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
>>    *			   extension type.
>> @@ -1345,8 +1348,15 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
>>   	else
>>   		ret = wait_event_killable(nor->rww.wait,
>>   					  spi_nor_rww_start_exclusive(nor));
>> +	if (ret)
>> +		return ret;
>>   
>> -	return ret;
>> +	if (nor->removed) {
>> +		spi_nor_unlock_and_unprep(nor);
>> +		return -ENODEV;
>> +	}
>> +
>> +	return 0;
>>   }
>>   
>>   void spi_nor_unlock_and_unprep(struct spi_nor *nor)
>> @@ -1416,8 +1426,15 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
>>   	else
>>   		ret = wait_event_killable(nor->rww.wait,
>>   					  spi_nor_rww_start_pe(nor, start, len));
>> +	if (ret)
>> +		return ret;
>>   
>> -	return ret;
>> +	if (nor->removed) {
>> +		spi_nor_unlock_and_unprep_pe(nor, start, len);
>> +		return -ENODEV;
>> +	}
>> +
>> +	return 0;
>>   }
>>   
>>   static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len)
>> @@ -1489,8 +1506,15 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
>>   	else
>>   		ret = wait_event_killable(nor->rww.wait,
>>   					  spi_nor_rww_start_rd(nor, start, len));
>> +	if (ret)
>> +		return ret;
>>   
>> -	return ret;
>> +	if (nor->removed) {
>> +		spi_nor_unlock_and_unprep_rd(nor, start, len);
>> +		return -ENODEV;
>> +	}
>> +
>> +	return 0;
>>   }
>>   
>>   static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len)
>> @@ -3186,7 +3210,12 @@ static int spi_nor_init_params(struct spi_nor *nor)
>>   {
>>   	int ret;
>>   
>> -	nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL);
>> +	/* Keep params on the kref lifetime so it survives unbind (see probe). */
>> +	if (nor->refcounted)
>> +		nor->params = kzalloc(sizeof(*nor->params), GFP_KERNEL);
>> +	else
>> +		nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params),
>> +					   GFP_KERNEL);
>>   	if (!nor->params)
>>   		return -ENOMEM;
>>   
>> @@ -3420,6 +3449,22 @@ static void spi_nor_resume(struct mtd_info *mtd)
>>   		dev_err(dev, "resume() failed\n");
>>   }
>>   
>> +static void spi_nor_release(struct kref *kref)
>> +{
>> +	struct spi_nor *nor = container_of(kref, struct spi_nor, refcount);
>> +
>> +	kfree(nor->bouncebuf);
>> +	kfree(nor->params);
>> +	kfree(nor);
>> +}
>> +
>> +static void spi_nor_release_device(void *data)
>> +{
>> +	struct spi_nor *nor = data;
>> +
>> +	kref_put(&nor->refcount, spi_nor_release);
>> +}
>> +
>>   static int spi_nor_get_device(struct mtd_info *mtd)
>>   {
>>   	struct mtd_info *master = mtd_get_master(mtd);
>> @@ -3434,6 +3479,12 @@ static int spi_nor_get_device(struct mtd_info *mtd)
>>   	if (!try_module_get(dev->driver->owner))
>>   		return -ENODEV;
>>   
>> +	if (nor->refcounted) {
>> +		/* Cache the module: the spimem/controller chain may be freed by put time. */
>> +		nor->controller_module = dev->driver->owner;
>> +		kref_get(&nor->refcount);
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>> @@ -3443,6 +3494,14 @@ static void spi_nor_put_device(struct mtd_info *mtd)
>>   	struct spi_nor *nor = mtd_to_spi_nor(master);
>>   	struct device *dev;
>>   
>> +	if (nor->refcounted) {
>> +		module_put(nor->controller_module);
>> +
>> +		/* Must be last: this may free nor (and the embedded mtd). */
>> +		kref_put(&nor->refcount, spi_nor_release);
>> +		return;
>> +	}
>> +
>>   	if (nor->spimem)
>>   		dev = nor->spimem->spi->controller->dev.parent;
>>   	else
>> @@ -3655,8 +3714,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>   	 * than 1KB) after spi_nor_scan() returns.
>>   	 */
>>   	nor->bouncebuf_size = PAGE_SIZE;
>> -	nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
>> -				      GFP_KERNEL);
>> +	if (nor->refcounted)
>> +		nor->bouncebuf = kmalloc(nor->bouncebuf_size, GFP_KERNEL);
>> +	else
>> +		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
>> +					      GFP_KERNEL);
>>   	if (!nor->bouncebuf)
>>   		return -ENOMEM;
>>   
>> @@ -3788,10 +3850,21 @@ static int spi_nor_probe(struct spi_mem *spimem)
>>   	if (ret)
>>   		return ret;
>>   
>> -	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
>> +	/*
>> +	 * An open /dev/mtdX handle can outlive unbind, so manage the spi_nor
>> +	 * with a kref and drop the probe-time reference from a devres callback.
>> +	 */
>> +	nor = kzalloc_obj(*nor, GFP_KERNEL);
>>   	if (!nor)
>>   		return -ENOMEM;
>>   
>> +	kref_init(&nor->refcount);
>> +	nor->refcounted = true;
>> +
>> +	ret = devm_add_action_or_reset(dev, spi_nor_release_device, nor);
>> +	if (ret)
>> +		return ret;
>> +
>>   	nor->spimem = spimem;
>>   	nor->dev = dev;
>>   	spi_nor_set_flash_node(nor, dev->of_node);
>> @@ -3830,9 +3903,8 @@ static int spi_nor_probe(struct spi_mem *spimem)
>>   	 */
>>   	if (nor->params->page_size > PAGE_SIZE) {
>>   		nor->bouncebuf_size = nor->params->page_size;
>> -		devm_kfree(dev, nor->bouncebuf);
>> -		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
>> -					      GFP_KERNEL);
>> +		kfree(nor->bouncebuf);
>> +		nor->bouncebuf = kmalloc(nor->bouncebuf_size, GFP_KERNEL);
>>   		if (!nor->bouncebuf)
>>   			return -ENOMEM;
>>   	}
>> @@ -3853,6 +3925,25 @@ static int spi_nor_remove(struct spi_mem *spimem)
>>   {
>>   	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
>>   
>> +	/*
>> +	 * Drain in-flight operations and set nor->removed under the lock so
>> +	 * later ones fail with -ENODEV before touching SPI-core state (spimem,
>> +	 * dirmaps) freed after this returns. The wait is uninterruptible.
>> +	 */
>> +	if (!spi_nor_use_parallel_locking(nor))
>> +		mutex_lock(&nor->lock);
>> +	else
>> +		wait_event(nor->rww.wait, spi_nor_rww_start_exclusive(nor));
>> +
>> +	nor->removed = true;
>> +
>> +	if (!spi_nor_use_parallel_locking(nor)) {
>> +		mutex_unlock(&nor->lock);
>> +	} else {
>> +		spi_nor_rww_end_exclusive(nor);
>> +		wake_up(&nor->rww.wait);
>> +	}
>> +
>>   	spi_nor_restore(nor);
>>   
>>   	/* Clean up MTD stuff. */
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index 4b92494827b1..f8d5e3ca8371 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -7,6 +7,7 @@
>>   #define __LINUX_MTD_SPI_NOR_H
>>   
>>   #include <linux/bitops.h>
>> +#include <linux/kref.h>
>>   #include <linux/mtd/mtd.h>
>>   #include <linux/spi/spi-mem.h>
>>   
>> @@ -352,6 +353,18 @@ struct spi_nor_flash_parameter;
>>    * @rww.used_banks:	bitmap of the banks in use
>>    * @dev:		pointer to an SPI device or an SPI NOR controller device
>>    * @spimem:		pointer to the SPI memory device
>> + * @refcount:		reference count keeping the kzalloc()'d spi_nor alive
>> + *			past driver unbind until the last MTD user releases the
>> + *			device. Only valid when @refcounted is set.
>> + * @controller_module:	controller module pinned in spi_nor_get_device() so
>> + *			spi_nor_put_device() need not walk the possibly freed
>> + *			spimem/controller chain. Only valid when @refcounted is
>> + *			set.
>> + * @refcounted:		true when the spi_nor lifetime is kref-managed (the
>> + *			spi-mem spi_nor_probe() path). Legacy controllers that
>> + *			embed or devres-allocate spi_nor leave this clear.
>> + * @removed:		set on unbind to make subsequent MTD operations fail
>> + *			with -ENODEV instead of touching released resources.
>>    * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
>>    *                      layer is not DMA-able
>>    * @bouncebuf_size:	size of the bounce buffer
>> @@ -393,6 +406,10 @@ struct spi_nor {
>>   	} rww;
>>   	struct device		*dev;
>>   	struct spi_mem		*spimem;
>> +	struct kref		refcount;
>> +	struct module		*controller_module;
>> +	bool			refcounted;
>> +	bool			removed;
>>   	u8			*bouncebuf;
>>   	size_t			bouncebuf_size;
>>   	u8			*id;
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
