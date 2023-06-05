Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D44C7EE24
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDxq6pCaOsByt+fveik9FwPoT3ydYn7LprVz3/6IU7c=; b=Cl5rchJ/1bRBed6i7GgV36rFRJ
	kbUnUCsZp8ShlYXgZr744tkvIiuFZmzDUG2juMuooBgFoB12AXbuuam0yCxqIKBllpZGHoQlNPKs2
	USrxJZevxn4L/GpVAMQZEdluiOO1TVz6UkrmOsZoQUoJC9G1LYLa+S4QhUzoSUdh1ymREuXnvIn5N
	aC64lHcuDo7at1if7PNKvXWGYZn8R27NetamtCyKJt7V3HbB3Lrbei7SgVEjaSxMs0Vw9n9hmGBx0
	na3u0nDFD63UbKYRwynzLQQrRNbRLLd20rWTLndQ69IPIR8HBq5vtrp+vPr0/A+X93FMkLNjbsENR
	OR3jalqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6A8Y-00Fae5-1M;
	Mon, 05 Jun 2023 13:20:42 +0000
Received: from mail-sgaapc01on2072b.outbound.protection.outlook.com ([2a01:111:f400:feab::72b] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6A8U-00Fad9-0d;
	Mon, 05 Jun 2023 13:20:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GU+PfNIYI4M08wv5xv7Uok2+wqVtD70cwzJLn3TTfXzCgjO5jDL+RXYErENvXIwn7y4y+nUkWbD3TrBn1MAlU32mHjuS/DJjYIUlJw7AxUyhpm+5RszsR8GoBbVlCB5TRsEIQTpY2pYz1dtl61rsNc7/qFr8sjJOwiYDeTMTEDUc233z3X3Exa/PElg2m30mRsxWCFOrfxD8sZlgsagkhpUAXBl6nhjF7EpNQI+nDp5JalEW+2h24V9oD/Ery9OYCfnLE4Zxft7bz//2Mn/rVqxGbRs9cFwo+Az09RXVNhYanLiyaOoSZxaHg/0jhhkkz2+VHiGt2l5tnEIsVzZIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlVaCU9qUpBlVnAZ2hu46ODagJrBZ2n7SgbFubqRGL8=;
 b=cIZ9Nb6ORfvz3qJ/v5IulRCkmDs3Vo/RVH5GnR2rhJ6LESvynyrJDL17Y1NCBSqpCE7e+OkENDmCe9EjPfn6IxTw6H92NqxLW+wHPkpdIs9kJtTk2lO6Sgnu3uL9HDFlusClajItKUcW+CCMG6IS07aCO5G1WoijghDmSgWLunvR5CTF+Qu0Q64BB9lN9Bm1aEUr/av3ZaoVBFGeTQOAH5KB+U10QSTIqyJEztOmd2Zhoyg0qL53kkhP5QYsotqiV2Gd9j0HcFPnTBnA5shDj2Sj46f7x4hcuIjoxgMP1igw02uyExbAz2a3tJZswF47itKsb/cLJ4ld8ig5G3XvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlVaCU9qUpBlVnAZ2hu46ODagJrBZ2n7SgbFubqRGL8=;
 b=cRZ/IV92bgAbfTQ1p6Nf1JtH297o4VDjBGroKMj2y02zoixJjg15Oj38OCnzQwDeMSsbWbxvmeHHC/XxiYExvAvGg5+8zcA/kAfu9RFeZZAqHb2oO98oipY5caGRYRRzqWzodxuPimoOjXEeCZ0EsDzMVVBeE5ejJCPfpilJYpm4uYuDxzBckSMVB8HtpznML/yK5YWeFShMzD8bojEmuaJR99LBMoqzCTBDgHlFdZ+ODL1Vxjp55wfH1VU8MErOFFD9P8eYJgGkV39bsFlb4pVIgRGmD8cy+qOb9zlIduGFSJsa7GYQSNRx6mTLUIxeWGo4O7Qbayqs6Ql6vPtl9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from JH0PR03MB7495.apcprd03.prod.outlook.com (2603:1096:990:9::6) by
 SEZPR03MB6914.apcprd03.prod.outlook.com (2603:1096:101:a5::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.28; Mon, 5 Jun 2023 13:20:19 +0000
Received: from JH0PR03MB7495.apcprd03.prod.outlook.com
 ([fe80::5e9e:bcd4:e9d8:548a]) by JH0PR03MB7495.apcprd03.prod.outlook.com
 ([fe80::5e9e:bcd4:e9d8:548a%5]) with mapi id 15.20.6455.028; Mon, 5 Jun 2023
 13:20:19 +0000
Message-ID: <2a755783-1d56-9842-2eee-b5ab41152c81@amlogic.com>
Date: Mon, 5 Jun 2023 21:19:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RFC PATCH v5 2/6] mtd: rawnand: meson: wait for command in
 polling mode
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
 <20230601061850.3907800-3-AVKrasnov@sberdevices.ru>
 <20230601100751.41c3ff0b@xps-13>
 <9e106d50-2524-c999-48b1-a20760238aaf@sberdevices.ru>
 <20230605110546.6cb00a8d@xps-13>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20230605110546.6cb00a8d@xps-13>
X-ClientProxiedBy: TYCPR01CA0132.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::17) To JH0PR03MB7495.apcprd03.prod.outlook.com
 (2603:1096:990:9::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7495:EE_|SEZPR03MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aec5691-6d23-4998-3df9-08db65c79b78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0BNcWphX1dv8rvUc0ww6oUYmi4WUOTOQs9s3XM6tsQfdk1xVRrefKnFzEJ0CeTDLjDU3w8IpnS3qjvg9aec3s/vAhJC5c3sreaCPxSmVhlsR8qF/OpOI91bkMIMKmTHjjSdY29X9BjCsUC2Er1msSvVJWh5+QoNh/22my1i2H9//gEVJuTr5giqObm5N5RMRlR6FVp9O9FhM0kQbys0WPvOVR+tjTf3f3ty57SlZZYe9aLwBbNRpnUQx2+YsAEGZgwV1GO8uuis8/hhOpGV2A1xY7B1g6Y5HEZTG2FEF62yLCjO8jYgNp61ioIhE4zZYckA7mCxjUwdr/m9CGM07iS8rTON7wuWwBMIcAlsNwmdK5iO6//up8hpgHy7+jfGufmRR2E8h4HAq90txTfeCBYL8Pv5rzjCBaTGxBwZ6JzUp1gd/1w2+l3Gcke2o5u/9vBKuPJ8zaRazUjYK/3Oms1OBH49tvu0kQXLMFLSE2BqH8Th8IMvL6NQ1Fc4iKkPYYwLq1Wd95cK0CHipiG2xZgnc7CuM2o9A94t7k/JVzHCXX/WfWLP+JCqkdBcxykdogI1+KsfIMNkGRAts84+VA6RfNCAgTwXprSR+RAgvjw5fL8AkqkQm/oCz7KlVADr1EXq0NNfjLjiCsdlRpCOQWTr1Ze5OHmb+x3AWMWGiMFjV8cVf3DnKXISif0ELCuk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7495.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(376002)(346002)(396003)(451199021)(110136005)(478600001)(8936002)(5660300002)(44832011)(8676002)(54906003)(7416002)(36756003)(86362001)(31696002)(4326008)(66476007)(66946007)(66556008)(316002)(38350700002)(38100700002)(41300700001)(31686004)(83380400001)(66574015)(2906002)(6506007)(2616005)(6666004)(6512007)(53546011)(26005)(186003)(52116002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZElJby9FUHlSVDBpUHdPV0x3L24vdWI4a29IYmwxdVNMSlJZT1RGOXRlNUUw?=
 =?utf-8?B?eXFVeTgvTjF0M1dJbzE1amk0dDAwdnducTgzc0hHS2RDYWVJL2NhRFYxNWkr?=
 =?utf-8?B?YXdJeWZwVFF5VU0xTzl4Q1Vkb1FqQ2taTmFySWlIUURMTG5UYlFoWmh6WlMy?=
 =?utf-8?B?Y0hpeXA0R3ltMFpvTnZXNUJMK0dQRzRUTzQveThKY2dyaWtTUEMzd3lCZ0R3?=
 =?utf-8?B?emMyejdLeDJVTXoxZ1VlM0xWUldIL3FoNmJPQ3pISUNOR3I4VXRpaDhFQnJS?=
 =?utf-8?B?cERZalhpTVZXbEQzYmFvQWxOUUNYM09LSTlJVUh3VVU3WnJwUjlnalFtZ1hh?=
 =?utf-8?B?dGpkelVPWFkwangzbGRqcjBGeGFnVFNLZUtET0JkMHY1bnhuL1dmL1hMQ24y?=
 =?utf-8?B?aGZZNVM5Nmh2ak9YMjVpSnhzQnY0eGRQcU5xN1RqZEhuMlJWdW1UY1RYbklq?=
 =?utf-8?B?bS9tanJNaGdHRkFvSHYwVEpDU0swWWFhczZiOVFwT0ZCT3BSSmoxOFlNRGVZ?=
 =?utf-8?B?bmsvWUZtclFNb1dGT0NPdmZCSzhMbFF0cEFOa3ZPR3N6TXhzYU5BeXJBSnVV?=
 =?utf-8?B?L1cwOXhINzdsOEtHUlRaQURzZEIzRjVtTTJ1SVR6S2pFT3MyWEl5WnZqR1My?=
 =?utf-8?B?SlJJVU5pRitRNmlUZy83aUkvK05Lai8vMU1ScE5ZVFFmdVNBajBCRExlWDU5?=
 =?utf-8?B?SlRqbVNuRFZjQ2VIZzJoaVh5NEtlYnZ1UjJ2c1MxaGhWMlVpcS8wdkd6bGRH?=
 =?utf-8?B?b1RRQWZKbWxXN2FoRmlXSzM4eFFKd1VEQ3g5ZC9yaWJRejdYaGpvV05DM0da?=
 =?utf-8?B?ZGVYVE9tdit5WUJXTEFuaHRsSUpFa1htODVuV0l2TUFaU0RRTzM2dGFWQlJT?=
 =?utf-8?B?ak9YYWxsa09DcTQzVU5xck9ManE4WC91Z1gwU3ByM3RwRndDclhsa0trenlP?=
 =?utf-8?B?N094Sm5lSDIyQ0lFanFFN1duVHZFT1QyRFlOaTIxTVFJcXNiYWxDK3VmNW5K?=
 =?utf-8?B?bDVsNlJmVG1HQktJeTNGK3ZCZzJaelZ1Z042Q2NzbnJGeVVuem1iNkJtVkUw?=
 =?utf-8?B?dFZ6MVBMaHdMbHRxV3BVd3gvZFlQb2hwOWswVjRIT0pRMzMvM1YxMzVKK2o2?=
 =?utf-8?B?SFNqZzRWcVZiUjdGd25qRTlhNzd3b2QwcWF5K01mSHB6WmYzNG9RZ29hVHU0?=
 =?utf-8?B?NkQ4N0ZpNTFDcXlKT09ETVZzSHZxdlpPUk9UWXNtUUpjRlc0c1lWY1QzMDRt?=
 =?utf-8?B?Y3g4SGE0eVNvZFZSWjRxZnRjcTRkYkxJYTlybnVoY24zNkdhQXFaYUlGOXlT?=
 =?utf-8?B?akRJY25CS0tGaEFESGplc0YwejBYSkdMM1JwMGpjSlU4eFhkbzIweENoMXdF?=
 =?utf-8?B?eStNYnZXWUQxTU1mdFRyVDFDTDd4UkJ1OU9hbm9nRkdiQ0NRMmdSZE1VS2VB?=
 =?utf-8?B?bEV6czIvOXlESzBXSUxLN2kxWDhXa05jREVEd2hDTDNmSHZEelVuV1RNK3pQ?=
 =?utf-8?B?MmwwVmZKbzY5dUlPQzQ3Si9NSmVNdndNb1VOdFlWcXg5VWVKS2kwbW9xNlky?=
 =?utf-8?B?NFdDUXQ5T2dPeFFtWmdGUzJKTExkL25kVlVSb1V2L1ZnbVl1KzU3bkZaRGNh?=
 =?utf-8?B?alZ4ZGQrcW1nbEpvb1VIUDdWK2xrWVNMeFp5QXY5QnBJcXZEK3lPOUNQQXl1?=
 =?utf-8?B?cU91aVZyT2FUckR3YzFhcldpeGpMbzljSlg1NEQrSkp3VVljL3E0VzBFL1da?=
 =?utf-8?B?MkttQVhmR0d6WlVqNDJZeTV4b1dPYmlibDl3cXhuQ0NnMXo3RE0vRHltaTFY?=
 =?utf-8?B?STFmeGhLRmZ2VE5MaTdXUHBOajlWa05oSWxvUEhqOXBtYkZjNm4vMjJybmlC?=
 =?utf-8?B?REt4Y1dwbzhvUGt0dnhuWmpFSkwrVzdtOE4xR2MyRUhNTy9xK3BWT2loV3l6?=
 =?utf-8?B?S0c1MUF5Ykd1WmxmYVRsbzJWc0dOK2RLQVhaR3Bmb3BLTG1DQmZQcFhNZWtQ?=
 =?utf-8?B?S216VkprM0k2SXkwS0g1QnVIK0J5VjBEczlhODhFQjFNc2xRV0t6S3hOSWxp?=
 =?utf-8?B?QmlETjBPTzc3L0lld0M0SXRVRGEyaDY2QldacXF4N2d4NCtUcTlwVGVpMVFB?=
 =?utf-8?Q?zLWXN0gnSliXJeBcrK/3FWb74?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aec5691-6d23-4998-3df9-08db65c79b78
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7495.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 13:20:18.8059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHGJNJF6/nWECod8H4bIYBicPNOCQNgsguDmWRyjq7mMT0Q1oWKzuMMWxSV964QSJJtKnn07LHVR7tFPavGynA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6914
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_062038_262069_0943FEBB 
X-CRM114-Status: GOOD (  28.86  )
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

SGkgTWlxdWVsIGFuZCBBcnNlbml5LAoKCk9uIDIwMjMvNi81IDE3OjA1LCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IEhpIEFyc2VuaXksCj4gCj4+Pj4gQEAg
LTE0MTIsNiArMTQxOSw4IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4+Pj4gICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+PiAgICAg
fQo+Pj4+Cj4+Pj4gKyAgbmZjLT51c2VfcG9sbGluZyA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChk
ZXYtPm9mX25vZGUsICJwb2xsaW5nIik7Cj4+Pgo+Pj4gVGhpcyBpcyBhIHByb2JsZW0uIFlvdSBj
YW5ub3QgYWRkIGEgcG9sbGluZyBwcm9wZXJ0eSBsaWtlIHRoYXQuCj4+Pgo+Pj4gVGhlcmUgaXMg
YWxyZWFkeSBhIG5hbmQtcmIgcHJvcGVydHkgd2hpY2ggaXMgc3VwcG9zZWQgdG8gY2FycnkgaG93
IGFyZQo+Pj4gd2lyZWQgdGhlIFJCIGxpbmVzLiBJIGRvbid0IHNlZSBhbnkgaW4tdHJlZSB1c2Vy
cyBvZiB0aGUgY29tcGF0aWJsZXMsIEkKPj4+IGRvbid0IGtub3cgaG93IGFjY2VwdGFibGUgaXQg
aXMgdG8gY29uc2lkZXIgdXNpbmcgc29mdCBmYWxsYmFjayB3aGVuCj4+PiB0aGlzIHByb3BlcnR5
IGlzIG1pc3NpbmcsIG90aGVyd2lzZSB0YWtlIHRoZSB2YWx1ZXMgb2YgdGhlIHJiIGxpbmVzCj4+
PiBwcm92aWRlZCBpbiB0aGUgRFQgYW5kIHVzZXIgaGFyZHdhcmUgY29udHJvbCwgYnV0IEkgd291
bGQgZGVmaW5pdGVseQo+Pj4gcHJlZmVyIHRoYXQuCj4+Cj4+IEkgc2VlLiBTbyBpIG5lZWQgdG8g
aW1wbGVtZW50IHByb2Nlc3Npbmcgb2YgdGhpcyBwcm9wZXJ0eSBoZXJlPyBBbmQgaWYgaXQKPj4g
aXMgbWlzc2VkIC0+IHVzZSBzb2Z0d2FyZSB3YWl0aW5nLiBJIHRoaW5rIGludGVyZXN0aW5nIHRo
aW5nIHdpbGwgYmUgdGhhdDoKPj4KPj4gMSkgRXZlbiB3aXRoIHN1cHBvcnQgb2YgdGhpcyBwcm9w
ZXJ0eSBoZXJlLCBJIHJlYWxseSBkb24ndCBrbm93IGhvdyB0byBwYXNzCj4+ICAgICBSQiB2YWx1
ZXMgdG8gdGhpcyBjb250cm9sbGVyIC0gSSBqdXN0IGhhdmUgZGVmaW5lIGZvciBSQiBjb21tYW5k
IGFuZCB0aGF0J3MKPj4gICAgIGl0LiBJIGZvdW5kIHRoYXQgdGhpcyBwcm9wZXJ0eSBpcyBhbiBh
cnJheSBvZiB1MzIgLSBJSVVDIGVhY2ggZWxlbWVudCBpcwo+PiAgICAgUkIgcGluIHBlciBjaGlw
LiBNYXkgYmUgaSBuZWVkIHRvIGRpdmUgaW50byB0aGUgb2xkIHZlbmRvcidzIGRyaXZlciB0byBm
aW5kCj4+ICAgICBob3cgdG8gdXNlIFJCIHZhbHVlcyAoYWx0aG91Z2ggdGhpcyBkcml2ZXIgdXNl
cyBzb2Z0d2FyZSB3YWl0aW5nIHNvIEknbSBub3QKPj4gICAgIHN1cmUgdGhhdCBJJ2xsIGZpbmQg
c29tZXRoaW5nIGluIGl0KS4KPiAKPiBMaWFuZywgY2FuIHlvdSBwbGVhc2UgZ2l2ZSB1c2UgdGhl
IHJlbGV2YW50IGluZm9ybWF0aW9uIGhlcmU/IEhvdyBkbyB3ZQo+IHRhcmdldCBSQjAgYW5kIFJC
MT8gSXQgc2VlbXMgbGlrZSB5b3UgdXNlIHRoZSBDUyBhcyBvbmx5IGluZm9ybWF0aW9uCj4gbGlr
ZSBpZiB0aGUgUkIgbGluZXMgd2hlcmUgaGFyZHdpcmVkIGludGVybmFsbHkgdG8gYSBDUy4gQ2Fu
IHdlIGludmVydAo+IHRoZSBsaW5lcyB3aXRoIGEgc3BlY2lmaWMgY29uZmlndXJhdGlvbj8KCkNv
bnRyb2xsb3IgaGFzIG9ubHkgb25lIGV4dGVybmFsIFJCIHBpbm11eCAoTkFORF9SQjApLiBhbGwg
dGhlIFJCIHBpbnMKb2YgZGlmZmVyZW50IENFcyBuZWVkIHRvIGJlIGJvdW5kIGludG8gb25lIHdp
cmUgYW5kIGNvbm5lY3Qgd2l0aApOQU5EX1JCMCBpZiB3YW50IHRvIHVzZSBjb250cm9sbGVyIHBv
bGxpbmcgcmIuIHRoZSBjdXJyZW50IG9wZXJhdGluZwpDRSBvZiBOQU5EIGlzIGRlY2lkZWQgdG8g
ImNoaXBfc2VsZWN0Iiwgb2YgY291cnNlIGNvbnRyb2xsZXIgaW50ZXJuYWxseSAKaGFzIGRpZmZl
cmVudCBuZmMgY29tbWFuZHMgdG8gcmVnY29uaXplIHdoaWNoIENlJ3MgUkIgc2lnbmFsIGlzIHBv
bGxpbmcuCgo8Jm5hbmRfcGlucz4gaW4gZHRzL3lhbWwgc2hvdWxkIGluY2x1ZGUgdGhlIE5BTkRf
UkIwIGlmIGhhcmR3YXJlIApjb25uZWN0cywgb3IgdXNlIHNvZnR3YXJlIHBvbGxpbmcgaGVyZS4K
CkBBcnNlbml5LCBzb3JyeSwgaSBkb24ndCB0cmF2ZWwgYWxsIHRoZSBpbmZvcm1hdGlvbnMgeWV0
LiBidXQgd2h5IGRvbid0IAp5b3UgdXNlIHRoZSBuZXcgUkJfSU5UIGNvbW1hbmQgd2l0aCBpcnEg
dGhhdCBpIHByb3ZpZGVkIGluIGFub3RoZXIgCnRocmVhZC4gdGhlIG5ldyBSQl9JTlQgY29tbWFu
ZCBkb2Vzbid0IGRlcGVuZCBvbiB0aGUgcGh5c2ljYWwgUkIgd2lyZXMsIAppdCBhbHNvIHNlbmQg
dGhlIFJFQUQgc3RhdHVzIGNvbW1hbmQoMHg3MCkgYW5kIHdhaXQgZm9yIHRoZSBpcnEgd2FrZSB1
cCAKY29tcGxldGlvbi4KCj4gQXJzZW5peSwgaWYgdGhlIGFuc3dlciB0byBteSBhYm92ZSBxdWVz
dGlvbiBpcyBubywgdGhlbiB5b3Ugc2hvdWxkCj4gZXhwZWN0IHRoZSBuYW5kLXJiIGFuZCByZWcg
YXJyYXlzIHRvIGJlIGlkZW50aWNhbC4gSWYgdGhleSBhcmUgbm90LAo+IHRoZW4geW91IGNhbiBy
ZXR1cm4gLUVJTlZBTC4KPiAKPiBJZiB0aGUgbmFuZC1yYiBwcm9wZXJ0eSBpcyBtaXNzaW5nLCB0
aGVuIGZhbGxiYWNrIHRvIHNvZnR3YXJlIHdhaXQuCj4gCj4+IDIpIEkgY2FuJ3QgdGVzdCBSQiBt
b2RlIC0gSSBkb24ndCBoYXZlIHN1Y2ggZGV2aWNlIDooCj4+Cj4+IEFsc28gZm9yIGV4YW1wbGUg
aW4gYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIHBhcnNlZCAnbmFuZC1yYicgdmFsdWVzIGFyZSB1
c2VkCj4+IGluIGNvbnRyb2xsZXIgc3BlY2lmaWMgcmVnaXN0ZXIgZm9yIHdhaXRpbmcgKEkgZ3Vl
c3MgTWVzb24gY29udHJvbGxlciBoYXMgc29tZXRoaW5nCj4+IGxpa2UgdGhhdCwgYnV0IEkgZG9u
J3QgaGF2ZSBkb2MpLiBXaGlsZSBpbiBtYXJ2ZWxsX25hbmQuYyBpdCBsb29rcyBsaWtlIHRoYXQg
dGhleSBwYXJzZQo+PiAnbmFuZC1yYicgcHJvcGVydHksIGJ1dCBuZXZlciB1c2UgaXQuCj4gCj4g
WWVzLCB0aGUgbG9naWMgYXJvdW5kIHRoZSBzZWNvbmQgUkIgbGluZSAodGFraW5nIGNhcmUgb2Yg
Q1MxL0NTMykgaXMKPiBzbGlnaHRseSBicm9rZW4gb3IgYXQgbGVhc3QgYmFkbHkgZG9jdW1lbnRl
ZCwgYW5kIHRodXMgc2hvdWxkIG5vdCBiZQo+IHVzZWQuCj4gCj4+PiBJbiBhbnkgY2FzZSB5b3Un
bGwgbmVlZCBhIGR0LWJpbmRpbmcgdXBkYXRlIHdoaWNoIG11c3QgYmUgYWNrZWQgYnkKPj4+IGR0
LWJpbmRpbmcgbWFpbnRhaW5lcnMuCj4+Cj4+IFlvdSBtZWFuIHRvIGFkZCB0aGlzIHByb3BlcnR5
IGRlc2MgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1l
c29uLW5hbmQueWFtbCA/Cj4gCj4gWWVzLiBJbiBhIGRlZGljYXRlZCBwYXRjaC4gU29tZXRoaW5n
IGFsb25nIHRoZSBsaW5lczoKPiAKPiAgICAgICAgICBuYW5kLXJiOiB0cnVlCj4gCj4gaW5zaWRl
IHRoZSBuYW5kIGNoaXAgb2JqZWN0IHNob3VsZCBiZSBmaW5lLiBBbmQgZmxhZyB0aGUgY2hhbmdl
IGFzIGEKPiBmaXggYmVjYXVzZSB3ZSBzaG91bGQgaGF2ZSB1c2VkIGFuZCBwYXJzZWQgdGhpcyBw
cm9wZXJ0eSBzaW5jZSB0aGUKPiBiZWdpbm5pbmcuCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
