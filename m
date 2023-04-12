Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CD9C7619A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzpyAwJR78kkR8B13TjS4Yg5yxaar1wId5lrBBdhAZM=; b=Tw0Om2Hh9yIEg3JVfFGsXKXppU
	sFmoHZqXtFoRvntIT+Ud6HJNnbHA3RskruYLMejWXVScBNslG4CqO7LG/6jhmjVTVDE3jTp6G/Ps4
	feyZvcmrmaTg0yMAeSDxVmosL5JBgsUn0Y5JMLLP5wfU7w1gsSlLn8Ejpm5NA5qkucBaXCSOJ8Tl0
	W30pIZ/pfFzH3a3oFnyFeC+eid4z3ylVFDzKJhdm53C/fm7u7IWngFsi5d6tRPUcNH75b6ZnzAmz7
	Wky7wU5Zl/fdAK9dDyybP+/+73P9og6UjsbaaQtp+eeCYz/z6Gk5pxTx9ouMK44zazJFx0WV8V6fC
	vHI6Ufug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmY4d-002i4m-2z;
	Wed, 12 Apr 2023 10:51:35 +0000
Received: from mail-psaapc01on20716.outbound.protection.outlook.com ([2a01:111:f400:feae::716] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmY4b-002i4F-28;
	Wed, 12 Apr 2023 10:51:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TogAAFMiNXqK8pGDpFWAMcLelTv3oeRbnEZsDakYhX7mUJtZPMZ3UAO6IoLi9AHIQDJlRi4Sv7sWlZ+js7LDBFZ6ObedD8bx9O2lwzELS8ywdTSPztMxpIW16VFK7X+dsVAjAcBgMuNRSDsuU3wdH0k7ud0gvETul6n4LqeJQjjRPJARbOdmB+s1kLB7x+V6L4fbva9em/hMMPA0ofsI6qAYwCetoqrGoP0ZFP9wI3xNAfYV7BabrwnqEJ00OQIhfTa8/k9iBFa7yZmwXnkSMMP59jflVM6dKEWtGrPDeQ8c4jnfXtL2MZHC3AmxxHGK0XEny+kVizJOmvrb3w46gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ot4aTBd570dddjhGxPqKrbamb7NtoFMBBv9Pc59moGg=;
 b=myvuHpFcTQL90RFewrZrc6qXZCzzcEoYtQcFbrJ62q3gKXvA8kTvRSWAcxAt8XdZ/0071EuRNTqkHGO09Cf4TeWD1piM7T4pimpSO2dI3TTzQ/NrIvJ458nBoEyuJ+qJCpLNzJEovMhcSpux2QU/GxAkgd097RjykBmedvQi4BaJ+ENacLQVS7VCOrL6dssnomqRGNcPIM0vudQg4s6tZ6Eqd6Li5hXxTXmQBj46GyzIqYVY0hptIV+Afck+WXZuwlfXMKyuSu7dutSwdc523wl+7DM1P+D98c5w4zVDY8foTRpV5gyzclqsZTPtlI1MJJRp68+UdWnlbuU7WdSWKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com (2603:1096:300:7b::17)
 by KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Wed, 12 Apr
 2023 10:51:26 +0000
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909]) by PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909%5]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 10:51:25 +0000
Message-ID: <4baac18b-c223-d346-503c-f5f9ae49320d@amlogic.com>
Date: Wed, 12 Apr 2023 18:51:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
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
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
X-ClientProxiedBy: TYAPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::26) To PS1PR03MB5034.apcprd03.prod.outlook.com
 (2603:1096:300:7b::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PR03MB5034:EE_|KL1PR03MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a40906a-af39-4eed-5548-08db3b43dc84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	k6qxRq70soI/81fXl7mT62pQGrErGLbS/nKGNUDxhmRkkzuG4vQd9LPGCeOMiqJedBZknZPjT3swERI3GrMnQALBPfJyKiuiOcZzgLrCMoJFUrpGyHIUIIZKCoCTQKFOb4wjI6mwoUkS0qzEFrXfcGPwdXFIW6jFYBYNOZec0xDqVHRq8Eu88c015Yd2Lkz2JCI55/nTuCnKiK9aFsQZNgba6AqxJ+wlESbMJcqPzZlPkmdjIhHLUWvcg6WuWwKtLEYY7cgo2pyG9zJDtPZG27O6ZDu/+4Y/TJLYsZ/ohDGWlNTTfK28phxnWWdL7jYao/w4ni55YH46MQYHvQRIxcBiJogLKoDmK/6+P7ms3bqaoR2liIyuHuJuaDlkH0El+KiOYLOF9lu1eQKRsHt8pVkPbjCTHy5p0yxz6qOiV+YugfkWxsp9KuiUF3GgU4J7IvUYDB3iXcYWiMYdrGJfWwR24DXGYVCpJj42g1fiBAQ/jv/7zQUFC+veCCeRprsUimRc39VX5DjXJP2yr9CL6U49aD703ZEsOrULoD4Bg36icVNyX8AdZHM20KOQxFFh4m2O8vHIUO6ckJUtE/oUNjW53BLFRS4U7yhSz24VDZW4Vu/t8WIM1EcgDFG9CNI8PG9TNr6nCGnlyqj/b8n8qt86am3qgdErIS2V/BGODqL5l1FvyEC+9/alkoXK7pAL
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PR03MB5034.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(39850400004)(366004)(376002)(451199021)(2616005)(83380400001)(66574015)(478600001)(6486002)(52116002)(6666004)(26005)(6506007)(110136005)(186003)(53546011)(54906003)(44832011)(6512007)(38350700002)(2906002)(7416002)(36756003)(5660300002)(38100700002)(4326008)(66946007)(66476007)(66556008)(41300700001)(316002)(8936002)(8676002)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZTBPSzFTRTd3ZkRST095OFo4Z2tJd1YzTDh3MVFZRHJLcFB5Z0VNb1NFck03?=
 =?utf-8?B?V3VGUzhpVExORGVjKy9KUlpqbUp0NHE3SWJDZVlMR25EcHdXKy9hK2UrZFJu?=
 =?utf-8?B?NWZRaURXdm5FZ3pXZEI0cUpZcEFYMUVySFcyZTNpUGFZdGk5bStaeFY1dUNH?=
 =?utf-8?B?eFlFWEJDZ0x0b01lbERLNU5mYmNtUTU3U2s1S1orcDk3RlNXNUUxd3JtMVRj?=
 =?utf-8?B?WFh6L3Voa29LR1dUcXNhRzBJRGdrc0xIc3N4bVl2alB4Mll5eHh2bCtqUmhv?=
 =?utf-8?B?aVRuQkFSYTlYejAxV2Jpc0RybnM1c29vQUZ4Z0ZLK0VpTUhLV01TeitidVRE?=
 =?utf-8?B?V2xRdEVPcHVaKzdhc1dpNmNNRVNoVTRjb0ZMNFJvK2tHWjhDUXgzS09jbkls?=
 =?utf-8?B?ejRWSTg3aUE4SWlmc2NXSlBKbm5rRUN0Y05wZmhQbHI0MXdyTlVNZVZTSEs1?=
 =?utf-8?B?WDNyKy9hTzcxL1BtcWxGcXZPMnBEUlJiRmhES0lTaStVSUZJSXVBUjVocVN0?=
 =?utf-8?B?bU1BVkxXZG9xZko1UmswTHZQZkx0VWFRZVVuVGI2Y3FDdmp4MEFLOGtzQklp?=
 =?utf-8?B?emlBNXR0NS9zcWdFSy9MM3MxT1lXNWM1ejVVZkFkcVRTWWNmd2FLT2h2bkI0?=
 =?utf-8?B?TEFoaWl3alloK29jdGR1QUUwSDFKMlE1N2R6SHFnZGMyZkFYNzQ4VVlYc1NE?=
 =?utf-8?B?L2hEWjFRQU9kSDVZSUgyM3ZPUWNpNjFPQnRpRzBqV0puM09Qa0N3VjY0RDVa?=
 =?utf-8?B?VjZvREhOT0RtcjJnR0xJZGl2TEp5MVZJaFQ4UEk5NUlycVBpTVpEVU5RckRy?=
 =?utf-8?B?ZnVXYW5USlJodjR6WmxyY3dGbng2ZmtuSEYxdlJqQzAvTFV0WWdnS2ptNUxF?=
 =?utf-8?B?SkNNOW5NMTYvaSs1cTdmdGpmVGpuVXNyUXZPRTgraGdqVytHL3AyZVdSS0d5?=
 =?utf-8?B?UFhrYnZ6cnBDeThJNnZPQmtLY0VpaEJEczh4YjFkWXhNODhSZmc0Q2dmM1N1?=
 =?utf-8?B?elp0bjVoZ1NvS1h5WXFTemFXY3FpOTlCUDhBeERmS2JRYmJRc0ViYjc2NnlR?=
 =?utf-8?B?TU9JVmdmUnVGbG9HTTZsSWllMU9sZVYzYytSTisrZnhtVWFXd0hKZlVpVGRy?=
 =?utf-8?B?SEJkemJyczR4eXd0SkgydkNRT3dGZi80U1UvY0lneWVXSTlMdlRmOFFZS082?=
 =?utf-8?B?L3lwNk45cjJLVURiRzhjRVU1MlpNWmxwN2FDM0hXSlJPSExDZHVKWHRuRkd4?=
 =?utf-8?B?ZVpEUUlUdXR2WVhaWUVlaHdEWW1lUmRvYlRkSm90SW0vS0FVVGNmZDlKa0J0?=
 =?utf-8?B?bkUrZ1A1N0lqN2M4T041RE81K1N5U0EyZUtHUVBlSG4zQk95c1N1TXY4T1Ew?=
 =?utf-8?B?akNHTDl6cEJJZ2p0YUlNQkVHNHc2Z29CSUx6VXBLTW9aUmxIVkNQckVPeVkx?=
 =?utf-8?B?ZzlUbUlidjVhVC8xUGtQUSsvU0FtWnJoSFF3N3dLUElzNUljeVBjVEdFQlJj?=
 =?utf-8?B?V3ViN08rbnZBUkRwZ1hKT1hhbUZuZXpKNkZtR3piei9CaTE0UVgrU0U0L0tT?=
 =?utf-8?B?SHJ0UU5oYmY0YkFJNkpFVGx5TnVreVAvQjgyeXMwMExaS1hHRGd2SmtrbDdt?=
 =?utf-8?B?NDZla0NVR20xQmdHd2d0TVh6cFp2eFQxQzgyaElhSlJaeTVkRDgycGtNU1oy?=
 =?utf-8?B?MGtvWnpPSWdjVFEwbzdlN0U3TU1NTUJZNVhueVBvRC9JUmIxQThvektTczJn?=
 =?utf-8?B?U0lvdG1GbG02bG45SUpZVjUyTW1mU1pZcHVpenhsNnQyaHNZSm4xcEZKNzZP?=
 =?utf-8?B?MDJZNnNHSUgrTENnbWNBblhHeWhhZEVWeUluc1FZMW5kSEZreWtRRTViREFl?=
 =?utf-8?B?R1had016V1hnZnIyODgzamZ6bjViNGIwaHdlUUh2VTg2amYzWXc0QWFXSGRn?=
 =?utf-8?B?cFFHTk9yTWZuMXZmYXV6dmZBbEtROHYxSWVkQmNyQ2k4d0wvMGc1ZXAyUzVw?=
 =?utf-8?B?bWt5YjdSMDE4dlNuSm5MckxCQ2tlYVVHWGVNOUVPeGxoakUyeVg2S1VNN2hY?=
 =?utf-8?B?UWxHbTZqNEpPWW1SekVqcUxsc0NRZTFKSThjaGpaTksvTWlwaitWN1Bzd3JL?=
 =?utf-8?B?TmRtZkJjdDk4NWpnTW52YVRZS3UzczVOVjdSL1RSc0ZNaDFVcUtzQXBQaWlB?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a40906a-af39-4eed-5548-08db3b43dc84
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB5034.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 10:51:25.4665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1L6AEqTWWvhsXYdUwn4G2Ypfl0s85OOq0RJtTWSAkBFOl8mvmj2j/fiqmXBxNhVOi6tQGfXLAyUgTcSR5q312w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_035133_710430_DFB26ACC 
X-CRM114-Status: GOOD (  20.52  )
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

SGkgQXJzZW5peSBhbmQgTWlxdWVsLAoKT24gMjAyMy80LzEyIDE4OjE0LCBBcnNlbml5IEtyYXNu
b3Ygd3JvdGU6Cj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gCj4gCj4gCj4gT24gMTIuMDQuMjAyMyAx
MjozNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gSGkgQXJzZW5peSwKPj4KPj4gYXZrcmFzbm92
QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMTI6MjA6NTUgKzAzMDA6
Cj4+Cj4+PiBPbiAxMi4wNC4yMDIzIDEwOjQ0LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4+IEhp
IEFyc2VuaXksCj4+Pj4KPj4+PiBBVktyYXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gV2Vk
LCAxMiBBcHIgMjAyMyAwOToxNjo1OCArMDMwMDoKPj4+PiAgICAKPj4+Pj4gVGhpcyBOQU5EIHJl
YWRzIG9ubHkgZmV3IHVzZXIncyBieXRlcyBpbiBFQ0MgbW9kZSAobm90IGZ1bGwgT09CKSwgc28K
Pj4+Pgo+Pj4+ICJUaGlzIE5BTkQgcmVhZHMiIGRvZXMgbm90IGxvb2sgcmlnaHQsIGRvIHlvdSBt
ZWFuICJTdWJwYWdlIHJlYWRzIGRvCj4+Pj4gbm90IHJldHJpZXZlIGFsbCB0aGUgT09CIGJ5dGVz
LCI/Cj4+Pj4gICAgCj4+Pj4+IGZpbGwgT09CIGJ1ZmZlciB3aXRoIHplcm9lcyB0byBub3QgcmV0
dXJuIGdhcmJhZ2UgZnJvbSBwcmV2aW91cyByZWFkcwo+Pj4+PiB0byB1c2VyLgo+Pj4+PiBPdGhl
cndpc2UgJ25hbmRkdW1wJyB1dGlsaXR5IHByaW50cyBzb21ldGhpbmcgbGlrZSB0aGlzIGZvciBq
dXN0IGVyYXNlZAo+Pj4+PiBwYWdlOgo+Pj4+Pgo+Pj4+PiAuLi4KPj4+Pj4gMHgwMDAwMDdmMDog
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKPj4+Pj4gICAg
T09CIERhdGE6IGZmIGZmIGZmIGZmIDAwIDAwIGZmIGZmIDgwIGNmIDIyIDk5IGNiIGFkIGQzIGJl
Cj4+Pj4+ICAgIE9PQiBEYXRhOiA2MyAyNyBhZSAwNiAxNiAwYSAyZiBlYiBiYiBkZCA0NiA3NCA0
MSA4ZSA4OCA2ZQo+Pj4+PiAgICBPT0IgRGF0YTogMzggYTEgMmQgZTYgNzcgZDQgMDUgMDYgZjIg
YTUgN2UgMjUgZWIgMzQgN2MgZmYKPj4+Pj4gICAgT09CIERhdGE6IDM4IGVhIGRlIDE0IDEwIGRl
IDliIDQwIDMzIDE2IDZhIGNjIDlkIGFhIDJmIDVlCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+Pj4+PiAtLS0KPj4+
Pj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA1ICsrKysrCj4+Pj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bWVzb25fbmFuZC5jCj4+Pj4+IGluZGV4IGY4NGExMDIzOGU0ZC4uZjJmMjQ3MmNiNTExIDEwMDY0
NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+Pj4gKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+IEBAIC04NTgsOSArODU4
LDEyIEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfcGFnZV9zdWIoc3RydWN0IG5hbmRfY2hp
cCAqbmFuZCwKPj4+Pj4gICBzdGF0aWMgaW50IG1lc29uX25mY19yZWFkX3BhZ2VfcmF3KHN0cnVj
dCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsCj4+Pj4+ICAgCQkJCSAgIGludCBvb2JfcmVxdWly
ZWQsIGludCBwYWdlKQo+Pj4+PiAgIHsKPj4+Pj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5h
bmRfdG9fbXRkKG5hbmQpOwo+Pj4+PiAgIAl1OCAqb29iX2J1ZiA9IG5hbmQtPm9vYl9wb2k7Cj4+
Pj4+ICAgCWludCByZXQ7Cj4+Pj4+ICAgCj4+Pj4+ICsJbWVtc2V0KG9vYl9idWYsIDAsIG10ZC0+
b29ic2l6ZSk7Cj4+Pj4KPj4+PiBJJ20gc3VycHJpc2VkIHJhdyByZWFkcyBkbyBub3QgcmVhZCB0
aGUgZW50aXJlIE9PQj8KPj4+Cj4+PiBZZXMhIFNlZW1zIGluIGNhc2Ugb2YgcmF3IGFjY2VzcyAo
d2hhdCBpIHNlZSBpbiB0aGlzIGRyaXZlcikgbnVtYmVyIG9mIE9PQiBieXRlcyByZWFkCj4+PiBz
dGlsbCBkZXBlbmRzIG9uIEVDQyBwYXJhbWV0ZXJzOiBmb3IgZWFjaCBwb3J0aW9uIG9mIGRhdGEg
Y292ZXJlZCB3aXRoIEVDQyBjb2RlIHdlIGNhbgo+Pj4gcmVhZCBpdCdzIEVDQyBjb2RlIGFuZCAi
dXNlciBieXRlcyIgZnJvbSBPT0IgLSBpdCBpcyB3aGF0IGkgc2VlIGJ5IGR1bXBpbmcgRE1BIGJ1
ZmZlciBieQo+Pj4gcHJpbnRrKCkuIEZvciBleGFtcGxlIEknbSB3b3JraW5nIHdpdGggMksgTkFO
RCBwYWdlcywgZWFjaCBwYWdlIGhhcyAyIHggMUsgRUNDIGJsb2Nrcy4KPj4+IEZvciBlYWNoIEVD
QyBibG9jayBJIGhhdmUgMTYgT09CIGJ5dGVzIHdoaWNoIEkgY2FuIGFjY2VzcyBieSByZWFkL3dy
aXRlLiBFYWNoIDE2IGJ5dGVzCj4+PiBjb250YWlucyAyIGJ5dGVzIG9mIHVzZXIncyBkYXRhIGFu
ZCAxNCBieXRlcyBFQ0MgY29kZXMuIFNvIHdoZW4gSSByZWFkIHBhZ2UgaW4gcmF3IG1vZGUKPj4+
IGNvbnRyb2xsZXIgcmV0dXJucyAzMiBieXRlcyAoMiB4ICgyICsgMTQpKSBvZiBPT0IuIFdoaWxl
IE9PQiBpcyByZXBvcnRlZCBhcyA2NCBieXRlcy4KPj4KPj4gSW4gYWxsIG1vZGVzLCB3aGVuIHlv
dSByZWFkIE9PQiwgeW91IHNob3VsZCBnZXQgdGhlIGZ1bGwgT09CLiBUaGUgZmFjdAo+PiB0aGF0
IEVDQyBjb3JyZWN0aW9uIGlzIGVuYWJsZWQgb3IgZGlzYWJsZWQgZG9lcyBub3QgbWF0dGVyLiBJ
ZiB0aGUgTkFORAo+PiBmZWF0dXJlcyBPT0Igc2VjdGlvbnMgb2YgNjQgYnl0ZXMsIHlvdSBzaG91
bGQgZ2V0IHRoZSA2NCBieXRlcy4KPj4KPj4gV2hhdCBoYXBwZW5zIHNvbWV0aW1lcywgaXMgdGhh
dCBzb21lIG9mIHRoZSBieXRlcyBhcmUgbm90IHByb3RlY3RlZAo+PiBhZ2FpbnN0IGJpdGZsaXBz
LCBidXQgdGhlIHBvbGljeSBpcyB0byByZXR1cm4gdGhlIGZ1bGwgYnVmZmVyLgo+IAo+IE9rLCBz
byB0byBjbGFyaWZ5IGNhc2UgZm9yIHRoaXMgTkFORCBjb250cm9sbGVyOgo+IDEpIEluIGJvdGgg
RUNDIGFuZCByYXcgbW9kZXMgaSBuZWVkIHRvIHJldHVybiB0aGUgc2FtZSByYXcgT09CIGRhdGEg
KGUuZy4gdXNlciBieXRlcwo+ICAgICArIEVDQyBjb2Rlcyk/Cj4gMikgSWYgSSBoYXZlIGFjY2Vz
cyB0byBvbmx5IDMyIGJ5dGVzIG9mIE9PQiAoaW4gY2FzZSBhYm92ZSksIEkgbXVzdCByZXBvcnQg
dGhhdCBzaXplCj4gICAgIG9mIE9PQiBpcyBvbmx5IDMyIGJ5dGVzIGR1cmluZyBpbml0aWFsaXph
dGlvbj8KPiAKPiBUaGFua3MsIEFyc2VuaXkKClllcy4gaXQgc2hvdWxkIHJldHVybiBhbGwgdGhl
IE9PQiBkYXRhLiBpIG1ha2UgYSBtaXN0YWtlIG9uIHJhdyByZWFkIGFuZCAKdGhlcmUgaXMgd3Jv
bmcgY29kZSBpbiBtZXNvbl9uZmNfcmVhZF9wYWdlX3JhdygpLgoJbWVzb25fbmZjX2dldF9kYXRh
X29vYihuYW5kLCBidWYsIG9vYl9idWYpOwpjaGFuZ2VkIHRvOgoJaWYgKG9vYl9yZXF1aXJlZCkK
CQltZW1jcHkob29iX2J1ZiwgYnVmICsgbXRkLT53cml0ZXNpemUsIG10ZC0+b29ic2l6ZSkKCmZv
ciB0aGUgRUNDIG1vZGUsIGkgZGVmaW5lIHRoZSBtZXNvbl9vb2JsYXlvdXRfb3BzIGluIGhvc3Qg
ZHJpdmVyLgoKPiAKPj4KPj4+Cj4+PiBUaGFua3MsIEFyc2VuaXkKPj4+Cj4+Pj4gICAgCj4+Pj4+
ICsKPj4+Pj4gICAJcmV0ID0gbWVzb25fbmZjX3JlYWRfcGFnZV9zdWIobmFuZCwgcGFnZSwgMSk7
Cj4+Pj4+ICAgCWlmIChyZXQpCj4+Pj4+ICAgCQlyZXR1cm4gcmV0Owo+Pj4+PiBAQCAtODgxLDYg
Kzg4NCw4IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfcGFnZV9od2VjYyhzdHJ1Y3QgbmFu
ZF9jaGlwICpuYW5kLCB1OCAqYnVmLAo+Pj4+PiAgIAl1OCAqb29iX2J1ZiA9IG5hbmQtPm9vYl9w
b2k7Cj4+Pj4+ICAgCWludCByZXQsIGk7Cj4+Pj4+ICAgCj4+Pj4+ICsJbWVtc2V0KG9vYl9idWYs
IDAsIG10ZC0+b29ic2l6ZSk7Cj4+Pj4+ICsKPj4+Pj4gICAJcmV0ID0gbWVzb25fbmZjX3JlYWRf
cGFnZV9zdWIobmFuZCwgcGFnZSwgMCk7Cj4+Pj4+ICAgCWlmIChyZXQpCj4+Pj4+ICAgCQlyZXR1
cm4gcmV0Owo+Pj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4gTWlxdcOobAo+Pgo+Pgo+PiBUaGFu
a3MsCj4+IE1pcXXDqGwKPiAKCi0tIApUaGFua3MsCkxpYW5nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
