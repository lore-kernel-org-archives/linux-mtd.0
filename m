Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501EFC77B61
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Apr 2023 05:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXS/o8wokB+MSEXZZ6MR8mRfyXyBjJBghul29idacHQ=; b=ZdEOOKZahWIWl+ZZIjwArRE81n
	HpeCHzAl3bogHyf8B5zoUOZo828QQkP1guIiJ60kn9/mWPvMR9kItkGbMiM29akJTHNXM/Hfdj6AZ
	h8V7oASbwcHo2MMblb+noVZVhaNoMKZSh2yN0f7P8LfbEIgwGau+FRaIC0M3uGI7+h5VB2/BxIeie
	JfnKeV3V4I3LgaEHM5etst/APh/W3yy+J4q9rJvQ4aeNbybgGnWz2DocHnzcPxDykI3S/CtH4GgqZ
	eUmANULY2w+nsjQGWS0fZ0GE9Ceb9w7MyqJ8jDhUd2HV+cxeC5UpJuHdRl/fOLncexWWZ5/bVqnRi
	gjTKjRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmpZJ-0054Sd-2r;
	Thu, 13 Apr 2023 05:32:25 +0000
Received: from mail-tyzapc01on2070a.outbound.protection.outlook.com ([2a01:111:f403:704b::70a] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmpZG-0054RV-2t;
	Thu, 13 Apr 2023 05:32:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/x88JwbnjycuTKIQ5qcIrkejCaqI+mZeyoyVF101YCfY6K2r1HP+0inKSMi9in96ywm/dYZvQbtFIKqwI16SxaTxsAQ1G838vr1CZeL53TIL2cTA8mZnJggiphm20naH0jx1tgCPvGc9agIkBUzMtaayNVPrZX2PuJ+i2pikGJtWBms/XB1IBDqJ0iq98Q9s0qFAX3QEFvx16B/Vh0XXINc694uIyBbqipme7oMmE7npzwnde1mqncsvQD6FbSLJUqG1USl463KLW+eAizD8T8ZpH58HqJzZaeudqSQXVI/16LacEFtjmzVXvz7Zy8h7quJl3ndmPpnwMyrkcnU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukYkvx6Tjfjc609TwTjbQTYT0FQflbxWy5GV/xLck94=;
 b=BDWEa3kDd45UHwwLlK90xryF6ooLHRKC6uwCtKhGF2FcTzGejYVE5RUUJu/peJNbphF2q2vXKn/JzRh6mcRSIXRhzdj5R/Kgiq1TxMIL+7Y1fPVwQqKJFOCfXYbwHurFqm+sZW7u/deB3XAlIZtnDv/DJqUplUWSly6T7WEiAYp1S4BS0lbRYi9d3cC31c3E8/01ZkwllWrRf5juwHdo0YbvJHU7MDz8i72Pnd3RHKzB1XgwZKYwgj/R3y7hlImb5YaLj3ftlBn+FArGWYOOAYZoCx0rQfVdWNqsA2n2RaReTJ1/N1Qp7bV3LNZ34+tLqV1AB5XKygIQcTo0ABVLeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com (2603:1096:300:7b::17)
 by SEYPR03MB7021.apcprd03.prod.outlook.com (2603:1096:101:c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.41; Thu, 13 Apr
 2023 05:32:09 +0000
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909]) by PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909%5]) with mapi id 15.20.6277.036; Thu, 13 Apr 2023
 05:32:09 +0000
Message-ID: <0c61eaae-053e-5768-a533-70b2ff0cc95d@amlogic.com>
Date: Thu, 13 Apr 2023 13:32:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, "yonghui.yu" <yonghui.yu@amlogic.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
 <20230412094400.3c82f631@xps-13>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <20230412141824.755b2bca@xps-13>
 <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
 <20230412145715.58c2be4a@xps-13>
 <7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
 <20230412163214.0c764bb3@xps-13>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20230412163214.0c764bb3@xps-13>
X-ClientProxiedBy: TYCPR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:1::23) To PS1PR03MB5034.apcprd03.prod.outlook.com
 (2603:1096:300:7b::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PR03MB5034:EE_|SEYPR03MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9fef95-410c-4da7-dba2-08db3be06cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aUJLoTcoAjT0AMJbgHsVONqhw63XspUMXah8ZEg31bwE+o286Ac5c/dt5Q+AWagf57Emxt+8TY2AWGzNKUPAIshwPa/0mgUjuBhn0JI1DDtJq8geklNmyzOHG4CbDRkzsYpHkuO03hgl2qJLN9fgrc8IyZrENYZmhuCefv7vY6l6gasStpr/ZVw/z2Z8kCIcGgYeeh/EfeYKhvW1nWfooeIjS2asT2YcGjQGTN1gulY/mbYfwyx6Ibb/UlV2C18k3ixkrFtExvniEy69L/EBzsI9K++zgTJ+eJCe/3AWmWNsYHE9qUpuXfKSLYBi9I03BLr/yb86FLQOZfq30qeNj+X2NEawwxml36u47HR/ey+rprfcz/H2qT8eHcXhavLkJNJpJ2QMd4W/jAJNfsSUTsOwoS+UQ7fwxhbmM51DTHjiHBa3sjywxXfzHHRkVDCjs8N9N2WIR+hTMEenGQMHs6Rf6g+sFi21TVhca11Na8rmrAl00N3Rs8IvAw5ik6qb01w2NamBUIXL4e0rWAvika+2XOiEzyEIVgED26ARCfk3JTmbrE5cSDQ1dr3wOFdqQwmP7hpClfGG/SWw1mmXarIueGcK69zWYrmZmftT1pZtLrqa7xcis+2Y2QHM5xftZm+8mMMXpdowFRdu2boQ0OpUqRsnoJiX7BKCvr+Xif84adc0NSlSbU0cY/1JQ5Py
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PR03MB5034.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(366004)(136003)(39850400004)(451199021)(31686004)(38100700002)(316002)(36756003)(38350700002)(44832011)(7416002)(2906002)(66556008)(8936002)(8676002)(5660300002)(86362001)(31696002)(6916009)(66946007)(4326008)(41300700001)(66476007)(66574015)(2616005)(83380400001)(107886003)(26005)(54906003)(6512007)(6506007)(53546011)(6486002)(52116002)(186003)(478600001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?V3paOGRuTjB1eUhWMi9kelUvZTlBTWZLd2dTQlZQN3B3L0prb0wzbk9PQ05V?=
 =?utf-8?B?NEtJUC9YcDNhZUptZnZKK1Z3WXJDb2ZqU1ZaY2p6UVk5RDRaRnJwaXAvMmo1?=
 =?utf-8?B?UHFhZjRKNjhQOEZlcE5LQ09kRUl3d1Z1Mkx5NmZUaC9KWVpMYld0NVJFUDZo?=
 =?utf-8?B?bG1ERm5yYmV4dHJORWhmV01acG9MZDh3ZXAzZENDUjJVSDFtYXpqdGZNSGVZ?=
 =?utf-8?B?M3RVdFE5dDBUOGZ3NXlyWnc1SHVQOVRkYU1DTEhIeW55aXdJbnpYajJ5U2JE?=
 =?utf-8?B?OUxoMkt0MjBmTnlFK2dpNHNSYzRRNG1Jb1ZodC9jSHd0Mytxa0xwMk1NaW0w?=
 =?utf-8?B?bHVFa3pBQVppQUxJb3B3cFFtbDhDeE9qemo1UjNvTXRhOWlnZFVtNytGYW5E?=
 =?utf-8?B?M3NCcUtFcFZEcjloNHU5SEFmWWxTZUxrSStVckpHN2x0U0RKa2h3MkV0L3Q3?=
 =?utf-8?B?Y0N3WmVQOGkvL0t1WjBPc3N0Ylp2SGhpY1ZrWWgvKzM4MC8raWlkTHlTVHBM?=
 =?utf-8?B?R2c2WFY0aVIvVDA1SUJQWTZZNjkyc3ZKSTdiMHV0WXBzVWd6UGxxN1F1VDNO?=
 =?utf-8?B?eGQ0WUxNeW96REh4OTR0emlETWFnTE5UQktxbE1qUldtL2Fla21EZ0FnM0o1?=
 =?utf-8?B?M0tMb2xOa0hkcHczWkdJL25QMWFGT3AzZXhpMjNBRVNYeDJZb2cxRThVWElC?=
 =?utf-8?B?bERId0ExNDZDdnBObDFkaHRBUi9sSVZpVnVSWlh5ejI1S1h3ZnR0eXp6cG5P?=
 =?utf-8?B?amc5NjM0Tm0wNEwxWUdTSlo3V2NFMWpxeDdzZDhkWXU0N3htU3NCdktMLzhr?=
 =?utf-8?B?Y1FQRGJ1VjZtMEJqZjI0T1hEVTBaVW8xM29EQitUTG94UTdneFUxVGJza05w?=
 =?utf-8?B?M0VPNjhGMGVPYmRWQmtaMlI0Yk41Rk9uWnBPb1lOTWoxazlDWmxGYkhPT0hU?=
 =?utf-8?B?RHJqTG9FYThNMHFrZUtqenI0ZVUyTDFtOHk5aU8wNHdFaER2R2NNRkhwTklt?=
 =?utf-8?B?WGNVODIyUExHU2djeWFyUzlIdVhsQmlXTThuaU5NaEh0cUd1L2dLM1hZK0g3?=
 =?utf-8?B?UDN1c2VqY2RENVdhS1JkcjBudmtaNnpjci84a2cvaFJ5Sjd4QWsrK2c4M2l4?=
 =?utf-8?B?bVcvaUYvejMxaEJ2cjBqSUdzN3VSNG94NmYyZTVPeVYyM2Z1QkF3RG8rS3pn?=
 =?utf-8?B?ZW5Wb0Vid1VJay9NMCtnQ05pUU43UzNaNk9OalRDRjBuUEJ2QXdEN0w5NUk1?=
 =?utf-8?B?U0pPTE8rYS84MTRwR0pkY2ZUZlN6T2FLTHJCeVNndXRhZ25mdnNlY3Budlk4?=
 =?utf-8?B?UzVFcWcyZ2NGN25HcWN2MXJDOVM2S2wvdk1JZTJtajJkREJaQkRJaFFjUWFR?=
 =?utf-8?B?bHVZZmJheTBzbndaUEEzbW9FOHMwUC93bFIvT1VHbjZFOXUrd3hCWTQzcFBq?=
 =?utf-8?B?L1RRY0k5SmFaSFJrc0hEdGZjc0pkbHhxWjR1TE1QQVY2bmljUXR0ell2OFov?=
 =?utf-8?B?U0paMHJ3N2VCWHllZ3BmanFzdjNiR3FXaEx1M1pSV3JTTldjZjYwWXBQRSsy?=
 =?utf-8?B?MVF0MDZ6S1FYcGhycGVSM1ZYcXpzbTMwSDF4Umt6QW1uWXVwbUlIb0dvcjRY?=
 =?utf-8?B?Y0dJYlFYM3lEOURZWVdodUhoVEV6dXRYM2FFallRNzQrV3FoN0FXZ3lBdGlZ?=
 =?utf-8?B?NWFTU3RsTUFoc0dKVVVBK25lWXZGZzV2ZElhTUE5a251UitlZ3h3MGJSZUwx?=
 =?utf-8?B?ZTNKbWtnS1lLS0FUVXhrODdaREkxMFBnWVE5bllYZkxyRjlKeGxoeERsMExD?=
 =?utf-8?B?S3NQRkJKZ2VDSGMvMkU0RkZjRVJYazVrcjZKR1Bxd1FSMWFTS3JtQVVzUXc4?=
 =?utf-8?B?SmZhN2F5NUw4QUZocXc0bUt1R29Tc042T3E4cDJqMlQ1cDZtOGx5bzNjQi93?=
 =?utf-8?B?N0NaMmRXM0RxK3dJRnBsMjB5RDc3ZEo0S01nSGxUMUREYTlCTVFwL01rbk1B?=
 =?utf-8?B?R1l4RjRpSmw3KzhkR0owY055b2RKTkZBait6aWxHTVNHQm9reGJjdUs4VTlK?=
 =?utf-8?B?eFhsemIwZk92ai9sR2IyanZNdE9KUzNoZjVMY0tCRk1QaUFxZnBKYjlHbzFG?=
 =?utf-8?Q?1lE4bof5RTuKqkZudePO3kejJ?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9fef95-410c-4da7-dba2-08db3be06cd0
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB5034.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 05:32:09.0948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwWncQVMRjn+iHH4HKTtZu4djjY9lHYEOB5xgCI+pg67Y5xo/FmyAh9S7v2Cnr2kjDZXfvMRNoORhEbzXeA/Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_223223_042676_08A90995 
X-CRM114-Status: GOOD (  27.24  )
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

SGkgTWlxdWVsLAoKT24gMjAyMy80LzEyIDIyOjMyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IFsg
RVhURVJOQUwgRU1BSUwgXQo+IAo+IEhlbGxvLAo+IAo+IGxpYW5nLnlhbmdAYW1sb2dpYy5jb20g
d3JvdGUgb24gV2VkLCAxMiBBcHIgMjAyMyAyMjowNDoyOCArMDgwMDoKPiAKPj4gSGkgTWlxdWVs
IGFuZCBBcnNlbml5LAo+Pgo+PiBPbiAyMDIzLzQvMTIgMjA6NTcsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBIaSBBcnNlbml5LAo+Pj4KPj4+IGF2
a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDEyIEFwciAyMDIzIDE1OjIyOjI2
ICswMzAwOgo+Pj4gICAgCj4+Pj4gT24gMTIuMDQuMjAyMyAxNToxOCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPj4+Pj4gSGkgQXJzZW5peSwKPj4+Pj4KPj4+Pj4gYXZrcmFzbm92QHNiZXJkZXZpY2Vz
LnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMTM6MTQ6NTIgKzAzMDA6Cj4+Pj4+ICAgICA+
Pj4+IE9uIDEyLjA0LjIwMjMgMTI6MzYsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4+Pj4gSGkg
QXJzZW5peSwKPj4+Pj4+Pgo+Pj4+Pj4+IGF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBv
biBXZWQsIDEyIEFwciAyMDIzIDEyOjIwOjU1ICswMzAwOgo+Pj4+Pj4+ICAgICAgID4+Pj4+PiBP
biAxMi4wNC4yMDIzIDEwOjQ0LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4+Pj4+Pj4gSGkgQXJz
ZW5peSwKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBBVktyYXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUg
b24gV2VkLCAxMiBBcHIgMjAyMyAwOToxNjo1OCArMDMwMDoKPj4+Pj4+Pj4+ICAgICAgICAgPj4+
Pj4+Pj4gVGhpcyBOQU5EIHJlYWRzIG9ubHkgZmV3IHVzZXIncyBieXRlcyBpbiBFQ0MgbW9kZSAo
bm90IGZ1bGwgT09CKSwgc28KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAiVGhpcyBOQU5EIHJlYWRzIiBk
b2VzIG5vdCBsb29rIHJpZ2h0LCBkbyB5b3UgbWVhbiAiU3VicGFnZSByZWFkcyBkbwo+Pj4+Pj4+
Pj4gbm90IHJldHJpZXZlIGFsbCB0aGUgT09CIGJ5dGVzLCI/Cj4+Pj4+Pj4+PiAgICAgICAgID4+
Pj4+Pj4+IGZpbGwgT09CIGJ1ZmZlciB3aXRoIHplcm9lcyB0byBub3QgcmV0dXJuIGdhcmJhZ2Ug
ZnJvbSBwcmV2aW91cyByZWFkcwo+Pj4+Pj4+Pj4+IHRvIHVzZXIuCj4+Pj4+Pj4+Pj4gT3RoZXJ3
aXNlICduYW5kZHVtcCcgdXRpbGl0eSBwcmludHMgc29tZXRoaW5nIGxpa2UgdGhpcyBmb3IganVz
dCBlcmFzZWQKPj4+Pj4+Pj4+PiBwYWdlOgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gLi4uCj4+Pj4+
Pj4+Pj4gMHgwMDAwMDdmMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYKPj4+Pj4+Pj4+PiAgICAgT09CIERhdGE6IGZmIGZmIGZmIGZmIDAwIDAwIGZmIGZm
IDgwIGNmIDIyIDk5IGNiIGFkIGQzIGJlCj4+Pj4+Pj4+Pj4gICAgIE9PQiBEYXRhOiA2MyAyNyBh
ZSAwNiAxNiAwYSAyZiBlYiBiYiBkZCA0NiA3NCA0MSA4ZSA4OCA2ZQo+Pj4+Pj4+Pj4+ICAgICBP
T0IgRGF0YTogMzggYTEgMmQgZTYgNzcgZDQgMDUgMDYgZjIgYTUgN2UgMjUgZWIgMzQgN2MgZmYK
Pj4+Pj4+Pj4+PiAgICAgT09CIERhdGE6IDM4IGVhIGRlIDE0IDEwIGRlIDliIDQwIDMzIDE2IDZh
IGNjIDlkIGFhIDJmIDVlCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBcnNl
bml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4KPj4+Pj4+Pj4+PiAtLS0KPj4+
Pj4+Pj4+PiAgICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA1ICsrKysrCj4+
Pj4+Pj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4+Pj4+Pj4+IGluZGV4IGY4NGEx
MDIzOGU0ZC4uZjJmMjQ3MmNiNTExIDEwMDY0NAo+Pj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L21lc29uX25hbmQuYwo+Pj4+Pj4+Pj4+IEBAIC04NTgsOSArODU4LDEyIEBAIHN0YXRpYyBp
bnQgbWVzb25fbmZjX3JlYWRfcGFnZV9zdWIoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPj4+Pj4+
Pj4+PiAgICBzdGF0aWMgaW50IG1lc29uX25mY19yZWFkX3BhZ2VfcmF3KHN0cnVjdCBuYW5kX2No
aXAgKm5hbmQsIHU4ICpidWYsCj4+Pj4+Pj4+Pj4gICAgCQkJCSAgIGludCBvb2JfcmVxdWlyZWQs
IGludCBwYWdlKQo+Pj4+Pj4+Pj4+ICAgIHsKPj4+Pj4+Pj4+PiArCXN0cnVjdCBtdGRfaW5mbyAq
bXRkID0gbmFuZF90b19tdGQobmFuZCk7Cj4+Pj4+Pj4+Pj4gICAgCXU4ICpvb2JfYnVmID0gbmFu
ZC0+b29iX3BvaTsKPj4+Pj4+Pj4+PiAgICAJaW50IHJldDsKPj4+Pj4+Pj4+PiAgICA+Pj4+Pj4+
PiArCW1lbXNldChvb2JfYnVmLCAwLCBtdGQtPm9vYnNpemUpOwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
IEknbSBzdXJwcmlzZWQgcmF3IHJlYWRzIGRvIG5vdCByZWFkIHRoZSBlbnRpcmUgT09CPwo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBZZXMhIFNlZW1zIGluIGNhc2Ugb2YgcmF3IGFjY2VzcyAod2hhdCBpIHNl
ZSBpbiB0aGlzIGRyaXZlcikgbnVtYmVyIG9mIE9PQiBieXRlcyByZWFkCj4+Pj4+Pj4+IHN0aWxs
IGRlcGVuZHMgb24gRUNDIHBhcmFtZXRlcnM6IGZvciBlYWNoIHBvcnRpb24gb2YgZGF0YSBjb3Zl
cmVkIHdpdGggRUNDIGNvZGUgd2UgY2FuCj4+Pj4+Pj4+IHJlYWQgaXQncyBFQ0MgY29kZSBhbmQg
InVzZXIgYnl0ZXMiIGZyb20gT09CIC0gaXQgaXMgd2hhdCBpIHNlZSBieSBkdW1waW5nIERNQSBi
dWZmZXIgYnkKPj4+Pj4+Pj4gcHJpbnRrKCkuIEZvciBleGFtcGxlIEknbSB3b3JraW5nIHdpdGgg
MksgTkFORCBwYWdlcywgZWFjaCBwYWdlIGhhcyAyIHggMUsgRUNDIGJsb2Nrcy4KPj4+Pj4+Pj4g
Rm9yIGVhY2ggRUNDIGJsb2NrIEkgaGF2ZSAxNiBPT0IgYnl0ZXMgd2hpY2ggSSBjYW4gYWNjZXNz
IGJ5IHJlYWQvd3JpdGUuIEVhY2ggMTYgYnl0ZXMKPj4+Pj4+Pj4gY29udGFpbnMgMiBieXRlcyBv
ZiB1c2VyJ3MgZGF0YSBhbmQgMTQgYnl0ZXMgRUNDIGNvZGVzLiBTbyB3aGVuIEkgcmVhZCBwYWdl
IGluIHJhdyBtb2RlCj4+Pj4+Pj4+IGNvbnRyb2xsZXIgcmV0dXJucyAzMiBieXRlcyAoMiB4ICgy
ICsgMTQpKSBvZiBPT0IuIFdoaWxlIE9PQiBpcyByZXBvcnRlZCBhcyA2NCBieXRlcy4KPj4+Pj4+
Pgo+Pj4+Pj4+IEluIGFsbCBtb2Rlcywgd2hlbiB5b3UgcmVhZCBPT0IsIHlvdSBzaG91bGQgZ2V0
IHRoZSBmdWxsIE9PQi4gVGhlIGZhY3QKPj4+Pj4+PiB0aGF0IEVDQyBjb3JyZWN0aW9uIGlzIGVu
YWJsZWQgb3IgZGlzYWJsZWQgZG9lcyBub3QgbWF0dGVyLiBJZiB0aGUgTkFORAo+Pj4+Pj4+IGZl
YXR1cmVzIE9PQiBzZWN0aW9ucyBvZiA2NCBieXRlcywgeW91IHNob3VsZCBnZXQgdGhlIDY0IGJ5
dGVzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2hhdCBoYXBwZW5zIHNvbWV0aW1lcywgaXMgdGhhdCBzb21l
IG9mIHRoZSBieXRlcyBhcmUgbm90IHByb3RlY3RlZAo+Pj4+Pj4+IGFnYWluc3QgYml0ZmxpcHMs
IGJ1dCB0aGUgcG9saWN5IGlzIHRvIHJldHVybiB0aGUgZnVsbCBidWZmZXIuCj4+Pj4+Pgo+Pj4+
Pj4gT2ssIHNvIHRvIGNsYXJpZnkgY2FzZSBmb3IgdGhpcyBOQU5EIGNvbnRyb2xsZXI6Cj4+Pj4+
PiAxKSBJbiBib3RoIEVDQyBhbmQgcmF3IG1vZGVzIGkgbmVlZCB0byByZXR1cm4gdGhlIHNhbWUg
cmF3IE9PQiBkYXRhIChlLmcuIHVzZXIgYnl0ZXMKPj4+Pj4+ICAgICAgKyBFQ0MgY29kZXMpPwo+
Pj4+Pgo+Pj4+PiBXZWxsLCB5b3UgbmVlZCB0byBjb3ZlciB0aGUgc2FtZSBhbW91bnQgb2YgZGF0
YSwgeWVzLiBCdXQgaW4gdGhlIEVDQwo+Pj4+PiBjYXNlIHRoZSBkYXRhIHdvbid0IGJlIHJhdyAo
YXQgbGVhc3Qgbm90IGFsbCBvZiBpdCkuCj4+Pj4KPj4+PiBTbyAic2FtZSBhbW91bnQgb2YgZGF0
YSIsIGluIEVDQyBtb2RlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gcmV0dXJucyBvbmx5IHVzZXIg
T09CIGJ5dGVzIChlLmcuCj4+Pj4gT09CIGRhdGEgZXhjbHVkaW5nIEVDQyBjb2RlcyksIGluIHJh
dyBpdCByZXR1cm5zIHVzZXIgYnl0ZXMgKyBFQ0MgY29kZXMuIElJVUMgY29ycmVjdAo+Pj4+IGJl
aGF2aW91ciBpcyB0byBhbHdheXMgcmV0dXJuIHVzZXIgYnl0ZXMgKyBFQ0MgY29kZXMgYXMgT09C
IGRhdGEgZXZlbiBpbiBFQ0MgbW9kZSA/Cj4+Pgo+Pj4gSWYgdGhlIHBhZ2UgYXJlIDJrKzY0QiB5
b3Ugc2hvdWxkIHJlYWQgMmsrNjRCIHdoZW4gT09CIGFyZSByZXF1ZXN0ZWQuCj4+Pgo+Pj4gSWYg
dGhlIGNvbnRyb2xsZXIgb25seSByZXR1cm5zIDJrKzMyQiwgdGhlbiBwZXJmb3JtIGEgcmFuZG9t
IHJlYWQgdG8KPj4+IGp1c3QgbW92ZSB0aGUgcmVhZCBwb2ludGVyIHRvIG10ZC0+c2l6ZSArIG10
ZC0+b29ic2l6ZSAtIDMyIGFuZAo+Pj4gcmV0cmlldmUgdGhlIG1pc3NpbmcgMzIgYnl0ZXM/Cj4+
Cj4+IDEpIHJhdyByZWFkIGNhbiByZWFkIG91dCB0aGUgd2hvbGUgcGFnZSBkYXRhIDJrKzY0Qiwg
ZGVjaWRlZCBieSB0aGUgbGVuIGluIHRoZSBjb250cm9sbGVyIHJhdyByZWFkIGNvbW1hbmQ6Cj4+
IAljbWQgPSAobGVuICYgR0VOTUFTSyg1LCAwKSkgfCBzY3JhbWJsZXIgfCBETUFfRElSKGRpcik7
Cj4+IGFmdGVyIHRoYXQsIHRoZSBtaXNzaW5nIG9vYiBieXRlcyhub3QgdXNlZCkgY2FuIGJlIGNv
cGllZCBmcm9tIG1lc29uX2NoaXAtPmRhdGFfYnVmLiBzbyB0aGUgaW1wbGVtZW50YXRpb24gb2Yg
bWVzb25fbmZjX3JlYWRfcGFnZV9yYXcoKSBpcyBsaWtlIHRoaXMgaWYgbmVlZC4KPj4gCXsKPj4g
CQkuLi4uLi4KPj4gCQltZXNvbl9uZmNfcmVhZF9wYWdlX3N1YihuYW5kLCBwYWdlLCAxKTsKPj4g
CQltZXNvbl9uZmNfZ2V0X2RhdGFfb29iKG5hbmQsIGJ1Ziwgb29iX2J1Zik7Cj4+IAkJb29iX2xl
biA9IChuYW5kLT5lY2MuYnl0ZXMgKyAyKSAqIG5hbmQtPmVjYy5zdGVwczsKPj4gCQltZW1jcHko
b29iX2J1ZiArIG9vYl9sZW4sIG1lc29uX2NoaXAtPmRhdGFfYnVmICsgb29iX2xlbiwgbXRkLT5v
b2JzaXplIC0gb29iX2xlbik7Cj4+Cj4+IAl9Cj4+IDIpIEluIEVDQyBtb2RlLCB0aGUgY29udHJv
bGxlciBjYW4ndCBicmluZyBiYWNrIHRoZSBtaXNzaW5nIE9PQiBieXRlcy4gaXQgY2FuIHJlYWQg
b3V0IHRoZSB1c2VyIGJ5dGVzIGFuZCBlY2MgYnl0ZXMgcGVyIG1lc29uX29vYmxheW91dF9vcHMg
ZGVmaW5lLgo+IAo+IEFuZCB0aGVuIChpZiBvb2JfcmVxdWlyZWQpIHlvdSBjYW4gYnJpbmcgdGhl
IG1pc3NpbmcgYnl0ZXMgd2l0aAo+IHNvbWV0aGluZyBhbG9uZzoKPiBuYW5kX2NoYW5nZV9yZWFk
X2NvbHVtbl9vcChjaGlwLCBtdGQtPndyaXRlc2l6ZSArIG9vYl9sZW4sCj4gCQkJICAgb29iX2J1
ZiArIG9vYl9sZW4sCj4gCQkJICAgbXRkLT5vb2JzaXplIC0gb29iX2xlbiwKPiAJCQkgICBmYWxz
ZSk7Cj4gU2hvdWxkIG5vdCBiZSBhIGh1Z2UgcGVyZm9ybWFuY2UgaGl0LgoKQWZ0ZXIgZmluaXNo
aW5nIEVDQyBtb2RlIHJlYWRpbmcsIHRoZSBjb2x1bW4gYWRkcmVzcyBpbnRlcm5hbCBpbiBOQU5E
IApkZXZpY2Ugc2hvdWxkIGJlIHRoZSByaWdodCBwb3M7IGl0IGRvZXNuJ3QgbmVlZCB0byBjaGFu
Z2UgdGhlIGNvbHVtbiAKYWdhaW4uIHNvIGFkZGluZyBjb250cm9sbGVyIHJhdyByZWFkIGZvciB0
aGUgbWlzc2luZyBieXRlcyBhZnRlciBFQ0MgCnJlYWRpbmcgbWF5IHdvcmtzLgoKPiAKPj4KPj4+
Cj4+PiBUaGlzIGFwcGxpZXMgdG8gdGhlIHR3byBtb2RlcywgdGhlIG9ubHkgZGlmZmVyZW5jZSBp
czoKPj4+IC0gd2l0aCBjb3JyZWN0aW9uIChjb21tb25seSBuYW1lZCAiRUNDIG1vZGUiKTogdGhl
IHVzZXIgYnl0ZXMgYW5kIEVDQwo+Pj4gICAgIGJ5dGVzIHNob3VsZCBiZSBmaXhlZCBpZiB0aGVy
ZSBhcmUgYW55IGJpdGZsaXBzCj4+PiAtIHdpdGhvdXQgY29ycmVjdGlvbiAoY29tbW9ubHkgcmVm
ZXJyZWQgYXMgInJhdyBtb2RlIik6IG5vIGNvcnJlY3Rpb24KPj4+ICAgICBhcHBsaWVzLCBpZiB0
aGVyZSBhcmUgYml0ZmxpcHMsIGdpdmUgdGhlbQo+Pj4KPj4+IFBsZWFzZSBtaW5kIHRoZSByYXcg
bW9kZSBjYW4gYmUgc2xvdywgaXQncyBtZWFudCBmb3IgZGVidWdnaW5nIGFuZAo+Pj4gdGVzdGlu
ZywgbWFpbmx5LiBQYWdlIHJlYWRzIGhvd2V2ZXIgc2hvdWxkIGJlIGZhc3QsIHNvIGlmIGp1c3Qg
bW92aW5nCj4+PiB0aGUgY29sdW1uIHBvaW50ZXIgd29ya3MsIHRoZW4gZG8gaXQsIG90aGVyd2lz
ZSB3ZSdsbCBjb25zaWRlcgo+Pj4gcmV0dXJuaW5nIEZGcy4KPj4+Cj4+PiBUaGFua3MsCj4+PiBN
aXF1w6hsCj4+PiAgICAKPj4KPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAoKLS0gClRoYW5r
cywKTGlhbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
