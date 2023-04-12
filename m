Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29F1C77B6E
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSEd09awiUPPi6UgYywxQe4qUyavwj3BSuS74YSEA04=; b=iLxMQPP1OKC5548ZDcxuqer5gj
	WP5rSND0j2TCIjZ/KjleiJOGqp9PoomD7Vm/OTGlSMAz3sZ0qhy8jUmM+9rDO3BWSPe6/1NrU4GHu
	0pdY9/Fg+L3F4bDsrGiUHIcaLO73epABAfKfbpIZ/kWji5RKQ/EVzlRt/QPepILMcmc1XscKm5Mpz
	6VK1QPxomgnnMjG1jNnFjhHn1rvd26pTm4KKCS6h6K7wAUPC9A9WTz4S496Za2+L6xg9MoPoctFli
	nV1LI55lZl24ash5dXPurnWMj8xSxiSQ8vbfItKo5kOFPCf0GMIVIn1IkgnRv7NCaiMHRKckpvfQL
	oABrz0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYmO-002uIB-0k;
	Wed, 12 Apr 2023 11:36:48 +0000
Received: from mail-psaapc01on2072f.outbound.protection.outlook.com ([2a01:111:f400:feae::72f] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYmL-002uHF-1H;
	Wed, 12 Apr 2023 11:36:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBlXTripQtVPVxmU6pTifGp8d8RUJvy+p6yA7bi7iaSfHd1WZaggbW9bFheTXOn3KIiInB/q6ViPDyTaxAd4Blg45bzIS1PjtJJobTPjaUTNOa19aMQl1c/DXaavllud0Mx7LaOxrKKFgK45u1WbQRTK6YRFZU5C0O6X72nQsZgMmTbzcbXdp4JpmNqf0JcMpP3l/JXisNXbKzCPb35faAiWUdKUC4ENkm0QDo9CBfdZ/ne4YHpAApnlxiw/nEB1kPelaI+8zG9bLxtidYWHfqH+dOxOJPr65/o9lODj0uSRpMNctHmbd66UDEUY1tpTGTFHvta+Ubjz/gqvrl9irQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIVPjKdFVvG5ofUj/UxhfHR1dGkzwnnpQNOOYl8eGWM=;
 b=iQtxSQMmsE42GKHgqIM7Y8DUJ7e5FqVkxQEqiYZ1ZTbxGdo+QxMOxrMvVaeid8JCCdiyaNHw6XWRajkV21W51IOLZQ8mKPBK2ZTy2/PI5E0mmQE72hA29Ra0dL6W6cwqPFcu/3MVkpeXF2GDUV/rPRTzJqTPAPnguK1/ngQDjhXc60vQGutrtq7nLp9AARM9CtXdQTHoElg82ftsjL4fYXhpYpr/3u/+uVUSUDlFe922H/rHXD6FBW9p6TldJge/YC5p2oJokEGPcj51xvVlvpmxK9B89YLQRypcujRp50Qd0ymfXkLWbRMd+6SNiBo94uAumBESs++6WLWdxvbb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com (2603:1096:300:7b::17)
 by SI2PR03MB5829.apcprd03.prod.outlook.com (2603:1096:4:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Wed, 12 Apr
 2023 11:36:36 +0000
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909]) by PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909%5]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 11:36:36 +0000
Message-ID: <fe03919a-3468-b79e-5971-1f7671684ee9@amlogic.com>
Date: Wed, 12 Apr 2023 19:36:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
From: Liang Yang <liang.yang@amlogic.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
 <20230412094400.3c82f631@xps-13>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <4baac18b-c223-d346-503c-f5f9ae49320d@amlogic.com>
In-Reply-To: <4baac18b-c223-d346-503c-f5f9ae49320d@amlogic.com>
X-ClientProxiedBy: SG3P274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::27)
 To PS1PR03MB5034.apcprd03.prod.outlook.com (2603:1096:300:7b::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PR03MB5034:EE_|SI2PR03MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 379a777f-1c99-40f3-dd40-08db3b4a2c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TCW5sSdefSCVBlNi7p/Pn3dtY4PqanW6SUJR2rgNH9Lx0Ldn7DRApr8rhpySeU5vPsGaGybHrTrIMsCedgyj8poBo+hCZYua/nCpx/C0cLbLJXUieEKI1nO1nKtO65S/aGZ81N/Ak2yw/1COpylAzdnK1uI90Q9FEpLa0lRnoq2mkkqXZ64P4wG+h6jCTqjtyuGsNS2gg1sYNFY8MSWBNOomnd0xKK54tFuYdLjwQ61NveUX2wD0FN8njDg2K2wJgLgYyHistYTbrn09Y03yAsCenWt6CZHNgzFsp+BaDry4xTZmHHddwg9//T4fV3XpEJYY5uBcdptw8/7pVmOysPSy85+FJWtmPjWhYPCl65NJDYhNN6GPLb7pTf8N8h+2auGXI+X2w172yOk+VKiJ7/UW7AFdXPjN9Wl4sjO8EdH6sx0nqqaSHU/YDce8N64X5YnwQWbyNfHvHVBPHbcWGkc+knpZ77IbV7Z/CX/RSWgRP6ABFR+Wt3XloL7DcKMvUeqe72InAlf2PNBHVAvfike+1hSr+rEAZc5xfI8RxvtmXZB35Qsj95ptgWDY2oothEoxn1eE3BNFh3NOLBZDlgWxbCJt06HosFhtXe3brHKS1fvadE2gA22Z9jLtrtlZRk1MukYuBsgKnzIJBFALIe07YZvCmKMVlQ/b/jMB1bvtZvZcEvyRnn8+S7ebhim4
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PR03MB5034.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(366004)(376002)(39850400004)(451199021)(5660300002)(66556008)(4326008)(478600001)(66946007)(316002)(110136005)(38350700002)(7416002)(44832011)(54906003)(38100700002)(41300700001)(66476007)(8676002)(8936002)(186003)(83380400001)(53546011)(52116002)(6486002)(6666004)(2616005)(6506007)(6512007)(26005)(86362001)(2906002)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Yk5pQ2x4UFJxalhBZDhpc081Y0I3S0F6VjRiRHRqTTdBS3ZXK0ZjVC9zamRs?=
 =?utf-8?B?a3ZpdFowa0RKVVNrTDluMjRyOEpCd0tvdjNOVE9HRUdsRS9OaUFhTXdGS0J5?=
 =?utf-8?B?U01XSHdyOWpudmkvSkVTN0UyeWF4S0ZzWkNBa0VOSHczeDVZV3N4SnM1WFky?=
 =?utf-8?B?QWw5bHg2SVpyQy81YXpUWnUrMTVaZFdVZzVTOUkzQ1I1UDh0T2ZGa2Z1UnVx?=
 =?utf-8?B?UnQwY3J2M3UySFRrRVhnSTdHOENMeUVoaWZ1WXk0cUp6bER3Qnc3aUxhUDN2?=
 =?utf-8?B?eHZmZ2pucDE4RnpwdGgzYzQyUWs3NjVMRmJRZDV1QWJka1Z2ZmJYR2VEWnpK?=
 =?utf-8?B?a3AwUXBpanZnV3gxbjZMUXRsZEZNbFVCbDZzRXoraklmNno5SVRZK2RKWnNP?=
 =?utf-8?B?eUJNeWN2ZWhsMXBWTXdBellVODYzWDNxbkl1UDEwYTFHZWllNkJQZUNDM2FG?=
 =?utf-8?B?TXZJUHhPSDhIekQveDVMdFpYVmNCWDlvdks2eXkrSGV1U2I1emFUTnpheE5Z?=
 =?utf-8?B?VU1jWm5tSExXRThjcHFJVkt0ZHljZGRQME85bENOY2IvL2RDdTVhMWFEczBP?=
 =?utf-8?B?RWZoTzNodmVqYnpyRDNLZ2piZXhtVHlmV2N5bHZuS0RQVHNSa1pMYTlrdHE2?=
 =?utf-8?B?SkJMcjAvTStoMU1ZY0ZDNFN5QXpUbUphcVU2ODJWVHZNb1BFZ3ZYclZHZjl4?=
 =?utf-8?B?OUl2UVVOaWhsRDN2WUFkbHp4RVFrWHRRQ3RDcnh4V1NyYUMvZTB3eE5lNHpE?=
 =?utf-8?B?K1lQSzcvS3pGRnpKQ0FkYS9MbURvTVY2Y0lEKzlnUTBDK0xmQy9HNkxLTktp?=
 =?utf-8?B?WTVaUGFpT0RZdjJVT2ZTR1FmVzhjN01wNnJjVGwyMjRsTVBRL2luMVh5WEoy?=
 =?utf-8?B?SEtNZ1k5N3gwR0xZR1p2WWc1bmV3WTQxQ1QySHRYT0tBVHp2U2M5MnBKSmNr?=
 =?utf-8?B?TWZWUFphcmJwWno3M3ByM0lrL0Nvb3VsMXZpc0hJRkhTKzkrbElDb2JYZE5C?=
 =?utf-8?B?TmZPZ085S0hYUUtJTGwzVU1RVmhYRGFseTgvVzg2WkpIT2NLL2djQzJ4ODhV?=
 =?utf-8?B?RC9hOUJLNEIvOFpHUjBaOXBYQXJwT0gzT0xhK2ZHVGJ2QkE0UUxyTDNlK2pl?=
 =?utf-8?B?SFgyNEpyWjlzSU9SS1Z1OGMvZzM5SjhIR0QydmU4c1M4NDhha085eGVua3V6?=
 =?utf-8?B?czYzVVJTbEU0SENZZ2JCNHpKUWxIS0NIRXM0KzgzSGFMU1B6eDE4RVo4TWhz?=
 =?utf-8?B?bUNDYlo4ZmJ5VURMcUhBcnhnVW5ZOUdYRlBWWTJxOVEweU9zZURqd2RoUDRS?=
 =?utf-8?B?RVBUTTlVWHJqVmhjaEVhYWxoYWkyZzVsbkFpcEhub0sraWdqcVc0bHN4K3M5?=
 =?utf-8?B?T2ZhMEt2ZVNMS0RGQ0hGRUNudG8xTXNBMjVnWlpNaEkvYlJQZ1dhSTNDTjYv?=
 =?utf-8?B?ZzRVR1AxeG1XdDd5YnB5OVI2RFFjTGZ5QnNtNVpoSm5QYlhvbXlkbm1Kandl?=
 =?utf-8?B?aUkxUkREQkZlM0tyMFIyZGM5WEZ4aHhDWFpvQmdHWUU1QVM4N1B0L3M0T0Fi?=
 =?utf-8?B?M3B0UytLdjI3eE5HTHQ3ZHNrSUpvT25IN0tTa0VuZVJJQ2RLMzlUNUd1Q2Fp?=
 =?utf-8?B?b2JtcWl6b2pBRDJwUExUdjlMV3JIc0h4WW1UZXNXbnM2dmkyLzdCOTRtaEhm?=
 =?utf-8?B?Z2hCbmJzcWNGVnV0N3BWNVBrNkhnNlZxQ0JUU29PWDZSNTZvaHhPNWJ4bkVz?=
 =?utf-8?B?b2JOVjNEb010Vm5hRmNWK2JyU3VmRHNXUmEwbUc2Q1BveW5sdThuRnFyQTBw?=
 =?utf-8?B?VjRSNjNsOTlpcnozVmhySmRuSlBXa1lqYi9UMjd1Nmx3TllsVW5FODllRWFL?=
 =?utf-8?B?M0RWSU1lL1FnNUs5MGVmSGFQcXRnNFZrU2dOd1BUbTFJdE43NVhsaGw1VDZS?=
 =?utf-8?B?WTB3QlJxZEE2ZE9obUxxdU5KRGFrTTNqMzdpekR0U1plVDhoVG5veWlEcWsx?=
 =?utf-8?B?aGg3bmhWOGNpN3psNUxtQzhCQ1pxYUErY0w4UUVQVm9wZGU5czFVRjk1YmlG?=
 =?utf-8?B?R2kvVi9KTUFOc1BQMzlQTkVuT0V2Q1hFQXc5emxLRW9Edm1IWHpNQk1YSDhH?=
 =?utf-8?Q?7R1Md1lSkjFxEMxODWv2MYr81?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379a777f-1c99-40f3-dd40-08db3b4a2c32
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB5034.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 11:36:36.1323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ujRLHvuWpx2AA1i6r7dChF90jsuFK785gMAisYpPXrXSetyJwpioQ905l0SWVpoDex1QjcpykV0E6+k3FAelw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_043645_436413_18D556A5 
X-CRM114-Status: GOOD (  18.54  )
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

SGksCgpPbiAyMDIzLzQvMTIgMTg6NTEsIExpYW5nIFlhbmcgd3JvdGU6Cj4+Pj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIAo+Pj4+Pj4gYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+Pj4+IGluZGV4IGY4NGExMDIzOGU0ZC4uZjJm
MjQ3MmNiNTExIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25f
bmFuZC5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+
Pj4+IEBAIC04NTgsOSArODU4LDEyIEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfcGFnZV9z
dWIoc3RydWN0IAo+Pj4+Pj4gbmFuZF9jaGlwICpuYW5kLAo+Pj4+Pj4gwqAgc3RhdGljIGludCBt
ZXNvbl9uZmNfcmVhZF9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLAo+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgb29iX3Jl
cXVpcmVkLCBpbnQgcGFnZSkKPj4+Pj4+IMKgIHsKPj4+Pj4+ICvCoMKgwqAgc3RydWN0IG10ZF9p
bmZvICptdGQgPSBuYW5kX3RvX210ZChuYW5kKTsKPj4+Pj4+IMKgwqDCoMKgwqAgdTggKm9vYl9i
dWYgPSBuYW5kLT5vb2JfcG9pOwo+Pj4+Pj4gwqDCoMKgwqDCoCBpbnQgcmV0Owo+Pj4+Pj4gK8Kg
wqDCoCBtZW1zZXQob29iX2J1ZiwgMCwgbXRkLT5vb2JzaXplKTsKPj4+Pj4KPj4+Pj4gSSdtIHN1
cnByaXNlZCByYXcgcmVhZHMgZG8gbm90IHJlYWQgdGhlIGVudGlyZSBPT0I/Cj4+Pj4KPj4+PiBZ
ZXMhIFNlZW1zIGluIGNhc2Ugb2YgcmF3IGFjY2VzcyAod2hhdCBpIHNlZSBpbiB0aGlzIGRyaXZl
cikgbnVtYmVyIAo+Pj4+IG9mIE9PQiBieXRlcyByZWFkCj4+Pj4gc3RpbGwgZGVwZW5kcyBvbiBF
Q0MgcGFyYW1ldGVyczogZm9yIGVhY2ggcG9ydGlvbiBvZiBkYXRhIGNvdmVyZWQgCj4+Pj4gd2l0
aCBFQ0MgY29kZSB3ZSBjYW4KPj4+PiByZWFkIGl0J3MgRUNDIGNvZGUgYW5kICJ1c2VyIGJ5dGVz
IiBmcm9tIE9PQiAtIGl0IGlzIHdoYXQgaSBzZWUgYnkgCj4+Pj4gZHVtcGluZyBETUEgYnVmZmVy
IGJ5Cj4+Pj4gcHJpbnRrKCkuIEZvciBleGFtcGxlIEknbSB3b3JraW5nIHdpdGggMksgTkFORCBw
YWdlcywgZWFjaCBwYWdlIGhhcyAKPj4+PiAyIHggMUsgRUNDIGJsb2Nrcy4KPj4+PiBGb3IgZWFj
aCBFQ0MgYmxvY2sgSSBoYXZlIDE2IE9PQiBieXRlcyB3aGljaCBJIGNhbiBhY2Nlc3MgYnkgCj4+
Pj4gcmVhZC93cml0ZS4gRWFjaCAxNiBieXRlcwo+Pj4+IGNvbnRhaW5zIDIgYnl0ZXMgb2YgdXNl
cidzIGRhdGEgYW5kIDE0IGJ5dGVzIEVDQyBjb2Rlcy4gU28gd2hlbiBJIAo+Pj4+IHJlYWQgcGFn
ZSBpbiByYXcgbW9kZQo+Pj4+IGNvbnRyb2xsZXIgcmV0dXJucyAzMiBieXRlcyAoMiB4ICgyICsg
MTQpKSBvZiBPT0IuIFdoaWxlIE9PQiBpcyAKPj4+PiByZXBvcnRlZCBhcyA2NCBieXRlcy4KPj4+
Cj4+PiBJbiBhbGwgbW9kZXMsIHdoZW4geW91IHJlYWQgT09CLCB5b3Ugc2hvdWxkIGdldCB0aGUg
ZnVsbCBPT0IuIFRoZSBmYWN0Cj4+PiB0aGF0IEVDQyBjb3JyZWN0aW9uIGlzIGVuYWJsZWQgb3Ig
ZGlzYWJsZWQgZG9lcyBub3QgbWF0dGVyLiBJZiB0aGUgTkFORAo+Pj4gZmVhdHVyZXMgT09CIHNl
Y3Rpb25zIG9mIDY0IGJ5dGVzLCB5b3Ugc2hvdWxkIGdldCB0aGUgNjQgYnl0ZXMuCj4+Pgo+Pj4g
V2hhdCBoYXBwZW5zIHNvbWV0aW1lcywgaXMgdGhhdCBzb21lIG9mIHRoZSBieXRlcyBhcmUgbm90
IHByb3RlY3RlZAo+Pj4gYWdhaW5zdCBiaXRmbGlwcywgYnV0IHRoZSBwb2xpY3kgaXMgdG8gcmV0
dXJuIHRoZSBmdWxsIGJ1ZmZlci4KPj4KPj4gT2ssIHNvIHRvIGNsYXJpZnkgY2FzZSBmb3IgdGhp
cyBOQU5EIGNvbnRyb2xsZXI6Cj4+IDEpIEluIGJvdGggRUNDIGFuZCByYXcgbW9kZXMgaSBuZWVk
IHRvIHJldHVybiB0aGUgc2FtZSByYXcgT09CIGRhdGEgCj4+IChlLmcuIHVzZXIgYnl0ZXMKPj4g
wqDCoMKgICsgRUNDIGNvZGVzKT8KPj4gMikgSWYgSSBoYXZlIGFjY2VzcyB0byBvbmx5IDMyIGJ5
dGVzIG9mIE9PQiAoaW4gY2FzZSBhYm92ZSksIEkgbXVzdCAKPj4gcmVwb3J0IHRoYXQgc2l6ZQo+
PiDCoMKgwqAgb2YgT09CIGlzIG9ubHkgMzIgYnl0ZXMgZHVyaW5nIGluaXRpYWxpemF0aW9uPwo+
Pgo+PiBUaGFua3MsIEFyc2VuaXkKPiAKPiBZZXMuIGl0IHNob3VsZCByZXR1cm4gYWxsIHRoZSBP
T0IgZGF0YS4gaSBtYWtlIGEgbWlzdGFrZSBvbiByYXcgcmVhZCBhbmQgCj4gdGhlcmUgaXMgd3Jv
bmcgY29kZSBpbiBtZXNvbl9uZmNfcmVhZF9wYWdlX3JhdygpLgo+ICDCoMKgwqDCoG1lc29uX25m
Y19nZXRfZGF0YV9vb2IobmFuZCwgYnVmLCBvb2JfYnVmKTsKPiBjaGFuZ2VkIHRvOgo+ICDCoMKg
wqDCoGlmIChvb2JfcmVxdWlyZWQpCj4gIMKgwqDCoMKgwqDCoMKgIG1lbWNweShvb2JfYnVmLCBi
dWYgKyBtdGQtPndyaXRlc2l6ZSwgbXRkLT5vb2JzaXplKQoKU29ycnksIHBsZWFzZSBpZ25vcmUg
dGhpcy4gdGhlIHByZXZpb3VzIGNvZGUgaXMgcmlnaHQuCgp0aGUgY29udHJvbGxlciBjaGFuZ2Vz
IHRoZSBsYXlvdXQgb2Ygb25lIHBhZ2U7IHRoZSBwaHlzaWNhbCBsYXlvdXQgaXMgCjIwNDggbWFp
biBkYXRhICsgNjQgb29iIGRhdGEuIGFmdGVyIHdyaXRpbmcgaW50byBOQU5EIHBhZ2UsIGl0IGlz
IHN0b3JlZApsaWtlIHRoaXM6IDEwMjQgbWFpbiBkYXRhICsgMiB1c2VyIGJ5dGVzICsgMTQgRUND
IHBhcml0eSBieXRlcyArIDEwMjQgCm1haW4gZGF0YSArIDIgdXNlciBieXRlcyArIDE0IEVDQyBw
YXJpdHkgYnl0ZXMuIHNvIHRoYXQgaXMgcmlnaHQgd2Ugb25seSAKZ2V0IDQgdXNlciBieXRlcyBh
bmQgMjggRUNDIHBhcml0eSBieXRlcywgdG90YWwgMzIgYnl0ZXMuIHRoYXQgaXMgdGhlIApiZWhh
dmlvciBvZiB0aGUgY29udHJvbGxlciB0aGF0IHRyYW5zZmVycmluZyBvbmUgRUNDIHBhZ2UoMUtC
KSBicmluZ3MgCmJhY2sgb25seSAyIHVzZXIgYnl0ZXMuCgpiZWNhdXNlIGxheW91dCBpcyBjaGFu
Z2VkIGJ5IGNvbnRyb2xsZXIsIHNvIGdvIGJhY2sgdG8gdGhlIGZ1bmN0aW9uLiAKbWVzb25fbmZj
X2dldF9kYXRhX29vYihuYW5kLCBidWYsIG9vYl9idWYpIHRyeSB0byBnZXQgdGhlIHJpZ2h0IHVz
ZXIgYW5kIAplY2MgcGFyaXR5IGJ5dGVzIGZyb20gdGhlIHJpZ2h0IHBvcy4gYWZ0ZXIgdGhhdCwg
dGhlIG90aGVyIG9vYiBieXRlcyBpcyAKbm90IHJlYWRpbmcgZnJvbSBOQU5EIGZsYXNoLgoKCi0t
IApUaGFua3MsCkxpYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
