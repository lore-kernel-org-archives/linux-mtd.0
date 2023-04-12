Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2F5C77B6E
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9cB9iY6E5xzgO76syNLQH9ko2AtfPwrdkpG8jVCfXI=; b=gL0GfXCptvTZEzI6fq9CWMwojG
	fzeSmv4vxQ30Jn/nb8MUpAuHdUaJe2N6BeLVxcUndoGRRuKhR8omf7jNhXIkLdW0XV/lHJ2yYMQ0/
	qsDM1wehGfoLEHMD+formAqPP9C9G0plzaBlJFB+xClgWRI2bgsdBGqEQ8mQEaSsptGXrfZx/mDv9
	bSuZfDHsUcXdnQcgqYf3uKbLxVC/Gi1j6PBuXYy4eoF0SCru7mu2hcar/ExCUQGBeVXYlD7qqxCzE
	BAEWxLc5PQQNbJok8prG9t0sNe4z9cYCtPyvJPxjKxBSb5k+GzFxIcThkLOwFWtMbke+XYDpfBygd
	/3+/ovFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZaK-0036FD-1o;
	Wed, 12 Apr 2023 12:28:24 +0000
Received: from mail-psaapc01on20727.outbound.protection.outlook.com ([2a01:111:f400:feae::727] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZaG-0036Ci-1x;
	Wed, 12 Apr 2023 12:28:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuiVDgHLhtp/7WjYTFaKDlQTAdauXRgPr/pidZdxST3+5PVRI4ThoNz272KNlBrygACc99fdRTj8rWAkr2NbRyHz4ywqAHYrXHi+ZhnALPpRPctsEwBgRPNOp+XUTyiBTSBWabCt4PsCG+w3Nyb96jg+gkvdmLSZwDHovFA6FkU2arkX2E+KgA9njehI6wFwusBcZDDMEIGEgTHfdm8GLFrOXnpI7gn0zrhev/Z1kyew3HqluKyV60G0HgrdAYQtiUP76RCmNFEXJyyB2s4i6L1m7GC4o3ecCkEJ3hKutiuDbttylGV2BRkX6Z/PkYw4rfJA76M9jlIVBmpx/fyMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAeJ4Q/Kc0oql1LwJpJ/ig4ic9w4FJvG5obxIbt0Gxk=;
 b=F/43p9vsLdJPnGQZpBY5Zil9yj674me6aQWki/cltBRk/XomUQpR3cM8Wdv+ntwnJKEbDWdJvRGA/Fx4Ti+Xah1gWG4quyHJ0sdaS9OPM9gcfkYtDlKPFdMBGEBDEPyQzc9nPIkECpy9U6Msm4AaNNKlYHGpeW0tmwG5FN1sD/DxJq0+JiSGClShwZf9YdbIG2nFLcQ4dXuSgqpYcM0MhNc5sPRpo3aYKPWhqZDGDqwwRZ6mfxr1NLgdrwnkZAIgAWk/2qJlFEr+q3UjHx4/Mk4UTIn+JHsh7HRvTGHU2CGN85k2SbMTB0CThPWU+dSeblobkqe1vf4jkf1HC1RBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com (2603:1096:300:7b::17)
 by SG2PR03MB6801.apcprd03.prod.outlook.com (2603:1096:4:1ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 12:28:15 +0000
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909]) by PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909%5]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 12:28:15 +0000
Message-ID: <7ae0a89d-2cbc-1e0c-527a-4d6b6218dc2d@amlogic.com>
Date: Wed, 12 Apr 2023 20:28:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
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
 <fe03919a-3468-b79e-5971-1f7671684ee9@amlogic.com>
 <20230412114326.fn3nm5r3rzlnqgg7@CAB-WSD-L081021>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20230412114326.fn3nm5r3rzlnqgg7@CAB-WSD-L081021>
X-ClientProxiedBy: TYAPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::32) To PS1PR03MB5034.apcprd03.prod.outlook.com
 (2603:1096:300:7b::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PR03MB5034:EE_|SG2PR03MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: f5163f3b-04f5-48db-13d9-08db3b516307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	EysL9Dtv1B/6vALMqQZCc8A5iuikE4eraOZ2KTivIdzwp90VAs5K93uESIno0ODZySwRsFUATdMDj0lvRJYrJWMb2JPC+NwZ6JAhueBlTN6+Exs7QtXSSeqeLPBuFJ4lr90kLjQpI1VOIu/Gno3CWwaOm8YpqPcMS9OI+CBmSVJtkNo/IzghvURTLSpxisHxh1+bOl0k0/CQ3iya3DG9b6Hgg2wAjLPIRifsTqajW4kD2mZoxm0RAeYbc+Zh38R4SMqS+vNnJweVVBj7UPrXhpSQL4UkeVO8hN4vXtly1aCj5WnjbYDX7pdGSppiHXjRHvuBT78yD/yXvHAjBbAy0IGtxVTJ2tCa0pEySUJMvqvZIp+ggCUBeg5tCyeyQEZaLydOAKC0GFSdyraq0y5fGsA6ymWh9vFy8xzcn4iV0z892CBcON8EeC3XEi7eDVHRP3g7JnVrty09zAIRGBHzaV1J4khVFgAkEBxTKbLPeMaCBBo7e4E7aCsFM3IY8RWnGWaD6ahO51GTzD8ALR4UGtVuBK3VUhsRGgHs0voba7O9BfJVEY//Jf3lFPyihMDZwciQELSBfR0S/PXLJwB7FSPzdjrfBBtRM4byj0J6PCpvUS5GwE8uglAwxIHAf8iTqvGQoE1QnMm9zaBEswyOjoAG3/cyChzAVagRSaav+IR78jmo7z20kKOT5fT6gD0W
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PR03MB5034.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(346002)(396003)(39850400004)(451199021)(41300700001)(5660300002)(478600001)(2616005)(8936002)(38350700002)(8676002)(38100700002)(31686004)(2906002)(44832011)(31696002)(7416002)(83380400001)(186003)(4326008)(86362001)(66946007)(26005)(6916009)(66476007)(6512007)(316002)(66556008)(6506007)(52116002)(54906003)(36756003)(53546011)(6666004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bzJTS09tdURDRUI3TXZrTXhDMmtZcytIUEZxSEgxUm1mWmIxaU11MkdZUnpu?=
 =?utf-8?B?OFRzS1h5dWpHNW04TDk0bEw0VkhTMDZIdUtGeU4zQ0djRUNCWS9CWkREbkoz?=
 =?utf-8?B?L29SakFVOXNXMFNsTTM1dndwcEFtaENvRVUvL0FkTzZZVlVQYkJQV0hYd1hh?=
 =?utf-8?B?YW0rUldoMjZGcjlOb2hqdmNDTnQ4UnNuY3JvNDl4MWFRZzhsTHNGL29TQnZa?=
 =?utf-8?B?alRWaS9VKzNsS0NnWnE5WTBURlBHL1NCSWo5RGNKVE5KbHlhNEtEdWM1NUpr?=
 =?utf-8?B?WGNHRlZUWFczNFAwMFJjemdZN1lIVk8rbmZnRXFjM24yUlpoaGRCSzJFdGF4?=
 =?utf-8?B?UXp6RWNzT21KVnVUd0pWd0pHUVowVk56a1h3eE5VYmRxQ2R2WGxzalVlRGI5?=
 =?utf-8?B?cUw3ZGJnbzBGR0tVbU45ck9sdmVkSHBEbFZtV25Bdll6ZlJsUjhNSjdueGlU?=
 =?utf-8?B?eEk3NUJJaGora2EzOC9pN1N4VGhZZ3VDd21xUXpNWlVLb1o4VEtYaHJNZFRX?=
 =?utf-8?B?MWlreXEzL1ozbEpiZm1LZnovZk8xZkM2ZFZKQTVxbFBHZjUzUUZEeVRoMDBG?=
 =?utf-8?B?cG9xcGtqWFVkU01zWVBZa3hwc0NuUnpObzN2eDVodnVxVFV6SW44WEZIWTdY?=
 =?utf-8?B?N21QUTZoVTdiWFl5a01RMlNuMFIrMzdla3RVSGluNW5UblNmSDBEbVhGUWU1?=
 =?utf-8?B?dnFNdWpmVFBzekxldXpUbEt3MXVUUVVmWmpEZGNDbTFLRkRmRU1ZSjBLK3BL?=
 =?utf-8?B?TUlwdE53VzB0SFpJQVNwU2RCSjl1MitkR1VwR0NLaXNPa0I4MlI2bjA4cmtq?=
 =?utf-8?B?cm5HYUpwOTZWc2l5UHA3WnVwcCtvSjdib2VDVnNxUkJsV2dVbE9zaW01RDVD?=
 =?utf-8?B?UnNRWjlWdUZ2ME5qNGxhWmRpQnM0c090SFFkbFU4aE5RQ2QrbU5DZ3dDVFgx?=
 =?utf-8?B?U0NVUHdLakh1blZGK01PYWlKcGVPUytCb1pxQ2Nxay9QRGRPcG1STTdicFZL?=
 =?utf-8?B?TW1GZ3NCejlrQ0hTZ0grNnJIdmdmdmdRUUlCTnQvVmNTZ0hPYlNhVjFTUUhV?=
 =?utf-8?B?N0pINzlaZ01IWmhVN3hRUzYrVnRjNkdXaTh2bHA4cGFlS2ZrNEdIbHh1Sk9p?=
 =?utf-8?B?dkNaR1JGWTFzaGJ0WCt4NVFJM3d6cnpObFZ2cWdzZWg3ZFlJdHQxVHJlMEN4?=
 =?utf-8?B?d3lqLytRSTRJNFg3dmU3dENKRUlVQ3g1OCtSRHBIWUorNCtaczgzcnBsbFhB?=
 =?utf-8?B?NzlNdU5wVXcyNzdIUTdJazRVTGsrQWY5Rjd0ZzU0aW85Tm9Pc1FGQ0pEWCsr?=
 =?utf-8?B?emZPQ3RkRHd5YS9tN1lyMXhMWlZFTUI4dEhrM0pRTHhWRXFlcFdzZ2J6QndC?=
 =?utf-8?B?MCtTdVZxbmlSY1RQZVZDdUFZOVZrQUg4ZmRsVlFIcW90Unk3VnVjelNzY2Qz?=
 =?utf-8?B?dUF2TERYb0sxUSsvWVVXUWE1MDZmS3BaVGl1dlN6N0ZnRFZPMkFESk5scDJm?=
 =?utf-8?B?NU1Help0QUxNTS9BYjMzUFRibWUyVDJZUTNBZk5GY01UaXZZR2FKcUNOSnF5?=
 =?utf-8?B?bEZ5T0RDelRNMWRhUll3bjhheGdicVpSMSs0ekVPcVd5QzJkM2ZDTk1PRDVB?=
 =?utf-8?B?YlhNU3dKejZYSTZwU01CcXJVMkxHb1M0ZTNndEZGam5sQ2lOUXhnQ0ZQVnZT?=
 =?utf-8?B?MW1vN2Y2UWVrL3FsenpSNUNYWVp2c01zS0hGZXBRN1ptN3RDQjVYalNSK2Jz?=
 =?utf-8?B?cHNhcG5lU3BRZnB5ekRoY3ZPeE5SSE10RlBQdis2T2pBSEJpUWNGK2FXNENV?=
 =?utf-8?B?UklDR3luMG95OE5LYi9mMHpFQUhJUVFldEM4ZDc3WFRhZmJ0NUtZT21XdEQr?=
 =?utf-8?B?SDZoSCtwT3lhQ0s3V2lUYmhja0tPalhFMUhhUEo1SWJSaFVpTkpTZzUrbTlO?=
 =?utf-8?B?elZSaUR3RGw3QlcyOW1tS2FVdmpISWJBeTBuZThCSWtNb1dhNGFjZ3VPTlg0?=
 =?utf-8?B?akJWMm0xVjJtNDNFV3gvYXdWVFBBZlNTZmhTWEJ6S0d3cHEwdVhodHBmT1px?=
 =?utf-8?B?OEF5bGoxY0dWaFp2K0E2d2JYSFFsTmxEdXF6d2ZkTHBWcGpXMnN4Q1h1R0N3?=
 =?utf-8?Q?SksdJnOYQpuyy/QVvvgUSQHJZ?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5163f3b-04f5-48db-13d9-08db3b516307
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB5034.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 12:28:14.5634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W0F1e0ycX5RJkPnw2GFS/WTXSTB2w0cNcSZGgfi9rIShmRZVKkgZrqkPvjU/xRigbTPN3pzVxNEHmtxBzy4cvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6801
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_052820_646527_11794588 
X-CRM114-Status: GOOD (  30.32  )
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

SGkgRG1pdHJ5LAoKT24gMjAyMy80LzEyIDE5OjQzLCBEbWl0cnkgUm9rb3NvdiB3cm90ZToKPiBb
IEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBIZWxsbyBMaWFuZywKPiAKPiBPbiBXZWQsIEFwciAxMiwg
MjAyMyBhdCAwNzozNjozMFBNICswODAwLCBMaWFuZyBZYW5nIHdyb3RlOgo+PiBIaSwKPj4KPj4g
T24gMjAyMy80LzEyIDE4OjUxLCBMaWFuZyBZYW5nIHdyb3RlOgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+Pj4+IGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+Pj4+IGluZGV4IGY4NGExMDIzOGU0ZC4uZjJm
MjQ3MmNiNTExIDEwMDY0NAo+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNv
bl9uYW5kLmMKPj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5j
Cj4+Pj4+Pj4+IEBAIC04NTgsOSArODU4LDEyIEBAIHN0YXRpYyBpbnQKPj4+Pj4+Pj4gbWVzb25f
bmZjX3JlYWRfcGFnZV9zdWIoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPj4+Pj4+Pj4gIMKgIHN0
YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwg
dTggKmJ1ZiwKPj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaW50IG9vYl9yZXF1aXJlZCwgaW50IHBhZ2UpCj4+Pj4+Pj4+ICDCoCB7Cj4+Pj4+Pj4+ICvC
oMKgwqAgc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChuYW5kKTsKPj4+Pj4+Pj4g
IMKgwqDCoMKgwqAgdTggKm9vYl9idWYgPSBuYW5kLT5vb2JfcG9pOwo+Pj4+Pj4+PiAgwqDCoMKg
wqDCoCBpbnQgcmV0Owo+Pj4+Pj4+PiArwqDCoMKgIG1lbXNldChvb2JfYnVmLCAwLCBtdGQtPm9v
YnNpemUpOwo+Pj4+Pj4+Cj4+Pj4+Pj4gSSdtIHN1cnByaXNlZCByYXcgcmVhZHMgZG8gbm90IHJl
YWQgdGhlIGVudGlyZSBPT0I/Cj4+Pj4+Pgo+Pj4+Pj4gWWVzISBTZWVtcyBpbiBjYXNlIG9mIHJh
dyBhY2Nlc3MgKHdoYXQgaSBzZWUgaW4gdGhpcyBkcml2ZXIpCj4+Pj4+PiBudW1iZXIgb2YgT09C
IGJ5dGVzIHJlYWQKPj4+Pj4+IHN0aWxsIGRlcGVuZHMgb24gRUNDIHBhcmFtZXRlcnM6IGZvciBl
YWNoIHBvcnRpb24gb2YgZGF0YQo+Pj4+Pj4gY292ZXJlZCB3aXRoIEVDQyBjb2RlIHdlIGNhbgo+
Pj4+Pj4gcmVhZCBpdCdzIEVDQyBjb2RlIGFuZCAidXNlciBieXRlcyIgZnJvbSBPT0IgLSBpdCBp
cyB3aGF0IGkKPj4+Pj4+IHNlZSBieSBkdW1waW5nIERNQSBidWZmZXIgYnkKPj4+Pj4+IHByaW50
aygpLiBGb3IgZXhhbXBsZSBJJ20gd29ya2luZyB3aXRoIDJLIE5BTkQgcGFnZXMsIGVhY2gKPj4+
Pj4+IHBhZ2UgaGFzIDIgeCAxSyBFQ0MgYmxvY2tzLgo+Pj4+Pj4gRm9yIGVhY2ggRUNDIGJsb2Nr
IEkgaGF2ZSAxNiBPT0IgYnl0ZXMgd2hpY2ggSSBjYW4gYWNjZXNzIGJ5Cj4+Pj4+PiByZWFkL3dy
aXRlLiBFYWNoIDE2IGJ5dGVzCj4+Pj4+PiBjb250YWlucyAyIGJ5dGVzIG9mIHVzZXIncyBkYXRh
IGFuZCAxNCBieXRlcyBFQ0MgY29kZXMuIFNvCj4+Pj4+PiB3aGVuIEkgcmVhZCBwYWdlIGluIHJh
dyBtb2RlCj4+Pj4+PiBjb250cm9sbGVyIHJldHVybnMgMzIgYnl0ZXMgKDIgeCAoMiArIDE0KSkg
b2YgT09CLiBXaGlsZSBPT0IKPj4+Pj4+IGlzIHJlcG9ydGVkIGFzIDY0IGJ5dGVzLgo+Pj4+Pgo+
Pj4+PiBJbiBhbGwgbW9kZXMsIHdoZW4geW91IHJlYWQgT09CLCB5b3Ugc2hvdWxkIGdldCB0aGUg
ZnVsbCBPT0IuIFRoZSBmYWN0Cj4+Pj4+IHRoYXQgRUNDIGNvcnJlY3Rpb24gaXMgZW5hYmxlZCBv
ciBkaXNhYmxlZCBkb2VzIG5vdCBtYXR0ZXIuIElmIHRoZSBOQU5ECj4+Pj4+IGZlYXR1cmVzIE9P
QiBzZWN0aW9ucyBvZiA2NCBieXRlcywgeW91IHNob3VsZCBnZXQgdGhlIDY0IGJ5dGVzLgo+Pj4+
Pgo+Pj4+PiBXaGF0IGhhcHBlbnMgc29tZXRpbWVzLCBpcyB0aGF0IHNvbWUgb2YgdGhlIGJ5dGVz
IGFyZSBub3QgcHJvdGVjdGVkCj4+Pj4+IGFnYWluc3QgYml0ZmxpcHMsIGJ1dCB0aGUgcG9saWN5
IGlzIHRvIHJldHVybiB0aGUgZnVsbCBidWZmZXIuCj4+Pj4KPj4+PiBPaywgc28gdG8gY2xhcmlm
eSBjYXNlIGZvciB0aGlzIE5BTkQgY29udHJvbGxlcjoKPj4+PiAxKSBJbiBib3RoIEVDQyBhbmQg
cmF3IG1vZGVzIGkgbmVlZCB0byByZXR1cm4gdGhlIHNhbWUgcmF3IE9PQiBkYXRhCj4+Pj4gKGUu
Zy4gdXNlciBieXRlcwo+Pj4+ICDCoMKgwqAgKyBFQ0MgY29kZXMpPwo+Pj4+IDIpIElmIEkgaGF2
ZSBhY2Nlc3MgdG8gb25seSAzMiBieXRlcyBvZiBPT0IgKGluIGNhc2UgYWJvdmUpLCBJIG11c3QK
Pj4+PiByZXBvcnQgdGhhdCBzaXplCj4+Pj4gIMKgwqDCoCBvZiBPT0IgaXMgb25seSAzMiBieXRl
cyBkdXJpbmcgaW5pdGlhbGl6YXRpb24/Cj4+Pj4KPj4+PiBUaGFua3MsIEFyc2VuaXkKPj4+Cj4+
PiBZZXMuIGl0IHNob3VsZCByZXR1cm4gYWxsIHRoZSBPT0IgZGF0YS4gaSBtYWtlIGEgbWlzdGFr
ZSBvbiByYXcgcmVhZCBhbmQKPj4+IHRoZXJlIGlzIHdyb25nIGNvZGUgaW4gbWVzb25fbmZjX3Jl
YWRfcGFnZV9yYXcoKS4KPj4+ICAgwqDCoMKgwqBtZXNvbl9uZmNfZ2V0X2RhdGFfb29iKG5hbmQs
IGJ1Ziwgb29iX2J1Zik7Cj4+PiBjaGFuZ2VkIHRvOgo+Pj4gICDCoMKgwqDCoGlmIChvb2JfcmVx
dWlyZWQpCj4+PiAgIMKgwqDCoMKgwqDCoMKgIG1lbWNweShvb2JfYnVmLCBidWYgKyBtdGQtPndy
aXRlc2l6ZSwgbXRkLT5vb2JzaXplKQo+Pgo+PiBTb3JyeSwgcGxlYXNlIGlnbm9yZSB0aGlzLiB0
aGUgcHJldmlvdXMgY29kZSBpcyByaWdodC4KPj4KPj4gdGhlIGNvbnRyb2xsZXIgY2hhbmdlcyB0
aGUgbGF5b3V0IG9mIG9uZSBwYWdlOyB0aGUgcGh5c2ljYWwgbGF5b3V0IGlzIDIwNDgKPj4gbWFp
biBkYXRhICsgNjQgb29iIGRhdGEuIGFmdGVyIHdyaXRpbmcgaW50byBOQU5EIHBhZ2UsIGl0IGlz
IHN0b3JlZAo+PiBsaWtlIHRoaXM6IDEwMjQgbWFpbiBkYXRhICsgMiB1c2VyIGJ5dGVzICsgMTQg
RUNDIHBhcml0eSBieXRlcyArIDEwMjQgbWFpbgo+PiBkYXRhICsgMiB1c2VyIGJ5dGVzICsgMTQg
RUNDIHBhcml0eSBieXRlcy4gc28gdGhhdCBpcyByaWdodCB3ZSBvbmx5IGdldCA0Cj4+IHVzZXIg
Ynl0ZXMgYW5kIDI4IEVDQyBwYXJpdHkgYnl0ZXMsIHRvdGFsIDMyIGJ5dGVzLiB0aGF0IGlzIHRo
ZSBiZWhhdmlvciBvZgo+PiB0aGUgY29udHJvbGxlciB0aGF0IHRyYW5zZmVycmluZyBvbmUgRUND
IHBhZ2UoMUtCKSBicmluZ3MgYmFjayBvbmx5IDIgdXNlcgo+PiBieXRlcy4KPj4KPj4gYmVjYXVz
ZSBsYXlvdXQgaXMgY2hhbmdlZCBieSBjb250cm9sbGVyLCBzbyBnbyBiYWNrIHRvIHRoZSBmdW5j
dGlvbi4KPj4gbWVzb25fbmZjX2dldF9kYXRhX29vYihuYW5kLCBidWYsIG9vYl9idWYpIHRyeSB0
byBnZXQgdGhlIHJpZ2h0IHVzZXIgYW5kIGVjYwo+PiBwYXJpdHkgYnl0ZXMgZnJvbSB0aGUgcmln
aHQgcG9zLiBhZnRlciB0aGF0LCB0aGUgb3RoZXIgb29iIGJ5dGVzIGlzIG5vdAo+PiByZWFkaW5n
IGZyb20gTkFORCBmbGFzaC4KPiAKPiBJIGhhdmUgYWx3YXlzIGJlZW4gdW5kZXIgdGhlIGltcHJl
c3Npb24gdGhhdCBOQU5EIE9PQiBsYXlvdXQgZmFsbHMgdW5kZXIgdGhlCj4gcmVzcG9uc2liaWxp
dHkgb2YgdGhlIGZsYXNoIGRyaXZlci4gSXMgdGhpcyBzcGVjaWZpYyB0byB0aGUgQW1sb2dpYyBO
QU5ELAo+IGFuZCBkb2VzIGl0IG1hcCB0aGUgZmxhc2ggbGF5b3V0IHRvIHRoZSBpbnRlcm5hbCBj
b250cm9sbGVyIGxheW91dD8KPiBGb3IgZXhhbXBsZSwgZGlmZmVyZW50IE9PQiBsYXlvdXRzIGV4
aXN0IGJldHdlZW4gTWFjcm9uaXggYW5kIEVTTVQuCj4gCj4gQXBvbG9naWVzIGZvciBhbnkgY29u
ZnVzaW9uLCBhbmQgdGhhbmsgeW91IGluIGFkdmFuY2UgZm9yIGFueSBoZWxwIGluCj4gY2xhcmlm
eWluZyB0aGlzIG1hdHRlci4KPiAKClRoaXMgaXMgdGhlIGJlaGF2aW9yIG9mIEFtbG9naWMgTkFO
RCBjb250cm9sbGVyLCBub3QgcmVsYXRlZCB0byBOQU5EIApkZXZpY2UuCgp0aGlzIGRlc2lnbiBv
ZiBBbWxvZ2ljIE5BTkQgY29udHJvbGxlciBpcyByZWR1Y2luZyB0aGUgZmlmbyhzcmFtKSBzaXpl
IAppbnNpZGUgdGhlIGNvbnRyb2xsZXIuCgpUbyB0aGUgTkFORCBkZXZpY2Ugd2l0aCA8MktCKG1h
aW4pICsgNjRCKG9vYik+IHBhZ2UsIHVzdWFsbHkgaWYgdGhlIApjb250cm9sbGVyIHBsYWNlIHVz
ZXIgYnl0ZXMgYW5kIEVDQyBwYXJpdHkgYnl0ZXMgYWZ0ZXIgMjA0OChjb2x1bW4gCmFkZHJlc3Mp
LiB0byBmaW5pc2ggdGhlIEVDQyBjYWxjdWxhdGlvbiBhbmQgY2hlY2tpbmcsIHRoZSBjb250cm9s
bGVyIGhhcyAKdG8gcmVhZCB0aGUgZGF0YSBhbmQgaXRzIEVDQyBwYXJpdHkgYnl0ZXMuIGlmIHRo
ZXkgYXJlIG5vdCBwbGFjZWQgCmNvbnRpbnVvdXNseSwgdGhlIGNvbnRyb2xsZXJzIGhhdmUgdG8g
cmVhZCB0aGUgd2hvbGUgcGFnZSBkYXRhIGluY2x1ZGluZyAKdGhlIG9vYiBkYXRhIHRvZ2V0aGVy
IG9yIHNlbmQgcmFuZG9tIHJlYWQgY29tbWFuZCB3aXRoIGNvbHVtbiBhZGRyZXNzLiAKc28gY29u
c2lkZXIgdGhhdCB0aGUgY29udHJvbGxlciBuZWVkcyBhIGZpZm8gb2YgYXQgbGVhc3QgKDIwNDgg
KyA2NCkgCmJ5dGVzIGluc2lkZS4gaWYgdGhlIE5BTkQgZGV2aWNlIGhhcyBiaWdnZXIgc2l6ZSBv
ZiBOQU5EIHBhZ2UsIHRoZSBzaXplIApvZiB0aGUgZmlmbyBzaG91bGQgYmUgYmlnZ2VyLgppbiBB
bWxvZ2ljIE5BTkQgY29udHJvbGxlciwgYWZ0ZXIgY2hhbmdpbmcgdGhlIGRhdGEgbGF5b3V0IG9m
IHRoZSBOQU5EIApwYWdlLCBpdCBqdXN0IG5lZWRzIDwxS0IgKyAxNkI+IGZpZm8gc2l6ZS4gdGhl
IGNvbnRyb2xsZXIgZmlyc3RseSBzZW5kcyAKb25seSA8MTAyNCArIDE2PiBjbG9ja3MgYW5kIGdl
dCAxc3QgRUNDIHBhZ2UgZGF0YSBhbmQgaXRzIEVDQyBwYXJpdHkgCmJ5dGVzLCBhbmQgdGhlbiBp
dCBjYW4gc3RhcnQgRUNDIGNhbGN1bGF0aW9uIGFuZCBjaGVja2luZy4gYWZ0ZXIgdGhhdCBvciAK
YXQgdGhlIHNhbWUgdGltZSwgbG9vcCBuZXh0IEVDQyBwYWdlIGRhdGEgYW5kIGl0cyBFQ0MgcGFy
aXR5LgoKLS0gClRoYW5rcywKTGlhbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
