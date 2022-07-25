Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D68FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jul 2022 16:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FiUM1odq/rCvbBTSOsp1V/mUuOYdAtmH3xaECj5aB08=; b=Ys0ZCkdQuD8ENC
	l9BmQO9wcK8Ia7NZfWkWIeW59ZWzUOwkzYZCYD9GfsBJOvts39b97f78lRtg1KETOhI0L7ojPOGd2
	Sb3qPA+yy4fxLkQfHd7/zV7Fy9YkX14R03cONN8W90y7KfvD6DHtRUI2h4w/Fpvk1JZOLfa/y1KC4
	pA4Mi0/oSKEyT6NK9U/gthPG29Rx8igPcs7D6I6IxxYdjHMvDFdp0K40kI/vsfHN3eBjLM5u3xs/v
	gJsXRrZm0amCzBdTNZ8hMmncLM5zGA/LuWsK9L+WTL3HLToK/+/sGx2qNYBK6foDa2ff6TFlXiYOU
	CzvVsv73g059SMK7WokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG0kI-00Fc91-6b; Mon, 25 Jul 2022 16:15:50 +0000
Received: from mail-dm6nam12olkn2074.outbound.protection.outlook.com ([40.92.22.74] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG0kF-00Fc8P-Tz
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2022 16:15:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQCHkyXnYTnf9E7whF8jyAYTVxeEh4szOO1ta1LTHwdvV93UVhrIbzdMg+yQ2Rwm42aP2q07eBOn0lv9fpUWj/dSPmxwdzpcAdYVy14g2JmgtUvDdWCYnxSL7Qj+Ae4AiLIyjd2mqaoDTsyF/Up06pjeAbSFCc5NPtgsU2p00lhmGKehRtTQOY5w3jcwCsIktZPyCcO7qcQgcytzJJtIxDLQC0LVQUisuuw2BsUE/clgB7BGqJK5FtQgXYCCowYNFoQDKbWahQ7tB/Pmf0PiAz8U/hUnaXqfNO+9Qu05QP2ftiC2GlGgvZH3SUGD1Fc6YRsGvrFiANAWl3cX7LDoYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3UCkhlTBe3DNp0fx5eRs5nk/Nm7wnZyJyQL7My0ras=;
 b=eOJQuPtT2otf1xFMWdTLxcjreBjcIEavfodqT/O852Q14XiGRdengxTSh323+PQgM80zWXC0dgkOeLmzKPKl+jNh8Vb2XFHOsqPgaACze75a8a0RsPmQ7+j/6W97N/NPxrkTU4euIhP1SlUKGbmF9GuFdOMkDDDQM568Us5P9yOgURDLKGZUMCXgerkmANiKRev+wwf9OFPGkcX0+J32bCjPQXslqZAFbVhnIgDd4dFTTWapI7u6Wbm2Y5A8N/5br45b8B90K9oxrON2pGOC+2OOXwHleiViGwkR70gBehwIjbbx3+TMXZfLXi3LQmrRsWzE6jBs+tH/m5okFq++WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3UCkhlTBe3DNp0fx5eRs5nk/Nm7wnZyJyQL7My0ras=;
 b=Lxs8oQJ+ceHxgWiCSMeD/bQ/INHgjAjvFuqjV+bBuk3x2sIDmd+caKzLneC3HlXfvn6Pl9HyXld7Sl+fY3v0nvqSbC4835v1zel4Y4mL/TZ7kzUO6Le9SSx0/8ANVRHldhnu/B2CKCuDtirIPOJHv5uLuSf5Iolrd5qshoru2fZpvUzRfB8oGFejVDAx1O7SWI/ZWpc6B53xJBA9rO025Ut4OMyoeoqHMyDwtN3poin/RcLJPUAD8QHUYXdwWRTbsepKSs8Ld5s2yBLS+98tPvz/Arrw96vA+adp15K5QRUabeeLrhoG/WXWSbULLMQrxI8fOQBI+3Dpu1P+LPsRSA==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by PH0PR17MB5232.namprd17.prod.outlook.com (2603:10b6:510:c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 16:15:43 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::3409:88f8:6069:ccba]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::3409:88f8:6069:ccba%3]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 16:15:42 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: Christian Marangi <ansuelsmth@gmail.com>
CC: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: core: check partition before dereference
Thread-Topic: [PATCH] mtd: core: check partition before dereference
Thread-Index: AQHYoC3WVOXsUzt3AEqrptbcAfKggq2PJ4WAgAAbrQA=
Date: Mon, 25 Jul 2022 16:15:41 +0000
Message-ID:  <MN2PR17MB3375CFDFDECF6C0DB9F74331B8959@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <62deaa73.1c69fb81.3bc99.8aef@mx.google.com>
In-Reply-To: <62deaa73.1c69fb81.3bc99.8aef@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [mBaIRMwWpEOD6EzX3Yj2bmP+h524GQb4EOi5AfrimHsaBQrAGYUar4JT541kV8Nb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3bc79eb-5e7a-4f03-584d-08da6e58ebed
x-ms-traffictypediagnostic: PH0PR17MB5232:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IRVIDbn/d5NGUQJFh8H8cmdYxFMpHI6vAovs0oF0sNk47kHQPXfOO7tK2dHMWbgJDGtVn5J/jxRFWY3ebrTESjw8znAWBIiW7RavI6npODUhOmshq1SQzzGJIzWKwk/mH0lcVfq8NY+trZKTSEx3rPv4DExd4Nr0Mk5EM9Udw0fapKoa7SnpzMC2krUXiUhB44s7zm+eU0NOimex9ZfFVGyphESh6JrNXb9l7srGFvxA8zXW17QYuYKFRL6BhHyG1IYtcyKuOpXTmaq6AQH5ed//Gy4N+l08BGOiy427dsF+V0B9MtWZUbVCiMeYJW4lizyiLy6hQJ3BEcWTA+mv3GPoMziKy6N3V+j8K99gxcUSJjAl6xIW8xrObxbKiI5/NHcVsj+S6ycuoejyYiz9wd5VvbFNSOLxKR2mNdBIK/fuWMtl6ln1vBAM+Ncsl2MGxCWcAliHhPdcCEZIZRCkbATb34b9q9k8c+OSJyOzPFHvu+hBsc7WIKTjmjFJw7BCSPZKUSo9NUb1wGIrrwrJYE7OW/WxMd2yyHtgU32l8PJV6Z7n8ABSFoQcEMs/zKi3MYjtkXjGNjR2E/6C+0hLIFGr57k5JXSwgtIW6JGveXDKFuyfQfIcBUCwMPcjStvz1ylVYylGT+o2eoZOcy1u1SdT426gNvDa0juT+MOpBJHtAElxWel5i+F5naHft6Q7
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Ky9SN3R3N3NtTXIrVGxENW5USzRoK1NZc3hIQkJpSEs2dVd1NWpzVWZqUFFO?=
 =?utf-8?B?Zlp3T0Q1MUtENUdFeHZLMXJQZmdXWXBwR01zNWRsMUt1bjV4R3E5SUpaV0Q0?=
 =?utf-8?B?NzIwRHJZMFhyVFo4RjZpM3phL1lFV0cvZVpjQm5KWXpERUhIMlF3enJ1bWE4?=
 =?utf-8?B?VmZBaU9RWEVFaTdkWkhQUnZsUmF0am85SnByemxJdHh6SG9KT2ZCMU5GLzZw?=
 =?utf-8?B?Ulp0b1ZSRGFvMktSY2oxRjh3WnVLYTI0dVhHamNzMWVaTnVxYzM1Ri9zVmY3?=
 =?utf-8?B?dUtqZ3lqU2lCbzhpMEM2eFNUOWFkeHU5VENLUnIzdEs1MklXSWRoalF5UHZx?=
 =?utf-8?B?cTZjdnA1Y0c2emJZZXZYNllxMU1BY01vaC82Q0pOR1laWXBqWjhPZG11S0hx?=
 =?utf-8?B?d3FlbHRnTHZybS9hM3NvRTZMZHZqQU1SQXpwZE5sY0c1djR3ZDJDTzA2Yldk?=
 =?utf-8?B?QzhjZFN2c1pMeVM5TGFRTDRlTFhjVVNXMnhOb1lQM2JrTFd4bXA5clFkT0ZG?=
 =?utf-8?B?THhFdEpmSEN0aE02ZnJ3YnYwRFZSVkJiU2xnSHJteFgwY0htaGs5WVFwekFO?=
 =?utf-8?B?VXRndXZmNm9JRytKQXNNbmF4M1dTb0tDT2xTcDZxb2JoMlhUaklDdVViSWhu?=
 =?utf-8?B?UVdLcU9HWnhyYTkyTEF1NDNyM2tHU2ZPS2RnOSs0VTN6bW00Ym5mbE05L1Ay?=
 =?utf-8?B?LzgyQ2dtT0Q1LytxbHhXSDNWZTZuWmdFaytRTG9mUi8za3RKb3hJYk9heEFS?=
 =?utf-8?B?Y1A2UnNHZDBaU2hZVmZ0VUkyeDh2cTU3ZVZWRXdZZEI2VkVHRzM4MlJ5WFM4?=
 =?utf-8?B?YXNmaExHNFViWmswRCtSMXZVUERqKzNjakdJQTNwVEZSMHQ1dnhxc0xobjYv?=
 =?utf-8?B?VjE5L21wNVlMVTdXLy9OelNtbE5PRlJOM0JGcVJwYkY0eTdmQ2xmYWQxeEhU?=
 =?utf-8?B?NWJwaXFGOWJqeHFjZmtheDJhNGpUbkd5RTdBMlhQK1Y0RHBhcU5vWlY4Sm1m?=
 =?utf-8?B?ekl2RzZLTC9DUC81NFlqUVFFZUFMRmFaU1diTFJLaHJqcDRWZjlvcFFqc28x?=
 =?utf-8?B?cmphVmJUT3I0OXRmOHViM1BMMFJaSHVUdmNhWHlzNWQzU3RjT0tlQWZnR2FQ?=
 =?utf-8?B?NnpjckJOUnV4VTZVQTh0UEQ3WnNYUWJWKzhFcEdwUXZIdlRMYXlEVzFWSTZt?=
 =?utf-8?B?Y1FNYlkrbFliREFGZnQ5VW55ZmJ3YkpFU1NSdkIxVlZRcFBQNzUzcXM5UVFs?=
 =?utf-8?B?VWsxeFNpN2w2WGphWTh1allTQVFqYzBZNVpYTVdSemhSK1lUd25FL2VVUWxX?=
 =?utf-8?B?eTZYc0hsK3U4Vm9qYkk5L3NzYS9hY2x6TnZVZWo2b0cwNnRYMFZKT0thdGZF?=
 =?utf-8?B?SThrL21sdXdSRm1vTERSdGt1Q1JzcnFRTGhpa05EUFZjWlE0SFYyRzlnOFQ0?=
 =?utf-8?B?QlBSbUI4MDNFMHpadTdzRWN0SVpjLytWcUt0VUFvRjgzaGtkbEFQK2VrUWdw?=
 =?utf-8?B?VE5YQ3hPUHFtYmFKd3U4a2ROMHFDM2F1SFcrSUs4Z1czWnRoRHlvWVZOejly?=
 =?utf-8?B?NnM2bGhiZlpXUVd0L1QyR3RLVnJiSWR0ZHE2a25JYkZNQUM3cnE4VWhYSkdO?=
 =?utf-8?B?N2RpSDNEam1jMUdZVi9XN2lmekdFT3EyTHR4Nzg0QytFcVRrZmJ2R21nRlRx?=
 =?utf-8?B?d0lnRklsYndtcTJzOTVTR3VsSzdNbDRNSjkyVlJQTk5hUGFibFFDSXZvNzRY?=
 =?utf-8?Q?LJIUcLknkoMnUC0Wvx2N/KnGhRAqyWp9rTTOTU6?=
Content-ID:  <448819E277BB894794DF0E7045A69B80@sct-15-20-4755-11-msonline-outlook-cc4c0.templateTenant>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bc79eb-5e7a-4f03-584d-08da6e58ebed
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 16:15:42.0411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB5232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_091547_995215_BDAF066F 
X-CRM114-Status: GOOD (  17.16  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SeKAmW0gZ29pbmcgdG8gc2F5IHRoaXMgb25lIGxhc3QgdGltZS4gU3RvcCBmdWNraW5nIGVtYWls
aW5nIG1lLiANCg0KDQo+IE9uIEp1bCAyNSwgMjAyMiwgYXQgMTA6MzggQU0sIENocmlzdGlhbiBN
YXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6DQo+IFlPVSBERUxVU0lPTkFMIFNJ
Q0sgRlVDSy4NCj4g77u/T24gTW9uLCBKdWwgMjUsIDIwMjIgYXQgMTA6NDk6MjVQTSArMDkwMCwg
VGV0c3VvIEhhbmRhIHdyb3RlOg0KPj4gc3l6Ym90IGlzIHJlcG9ydGluZyBOVUxMIHBvaW50ZXIg
ZGVyZWZlcmVuY2UgYXQgbXRkX2NoZWNrX29mX25vZGUoKSBbMV0sDQo+PiBmb3IgbXRkcmFtIHRl
c3QgZGV2aWNlIChDT05GSUdfTVREX01URFJBTSkgaXMgbm90IHBhcnRpdGlvbi4NCj4+IA0KPj4g
TGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWZlMDEzZjU1YTI4
MTRhOWU4Y2ZkIFsxXQ0KPj4gUmVwb3J0ZWQtYnk6IHN5emJvdCA8c3l6Ym90K2ZlMDEzZjU1YTI4
MTRhOWU4Y2ZkQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+DQo+PiBSZXBvcnRlZC1ieToga2Vy
bmVsIHRlc3Qgcm9ib3QgPG9saXZlci5zYW5nQGludGVsLmNvbT4NCj4+IEZpeGVzOiBhZDliMTBk
MWVhYWRhMTY5ICgibXRkOiBjb3JlOiBpbnRyb2R1Y2Ugb2Ygc3VwcG9ydCBmb3IgZHluYW1pYyBw
YXJ0aXRpb25zIikNCj4+IFNpZ25lZC1vZmYtYnk6IFRldHN1byBIYW5kYSA8cGVuZ3Vpbi1rZXJu
ZWxASS1sb3ZlLlNBS1VSQS5uZS5qcD4NCj4+IC0tLQ0KPj4gZHJpdmVycy9tdGQvbXRkY29yZS5j
IHwgMiArKw0KPj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jDQo+
PiBpbmRleCA2ZmFmZWE4MGZkOTguLmE5YjhiZTlmNDBkYyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvbXRkL210ZGNvcmUuYw0KPj4gKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jDQo+PiBAQCAt
NTU5LDYgKzU1OSw4IEBAIHN0YXRpYyB2b2lkIG10ZF9jaGVja19vZl9ub2RlKHN0cnVjdCBtdGRf
aW5mbyAqbXRkKQ0KPj4gICAgICAgIHJldHVybjsNCj4+IA0KPj4gICAgLyogQ2hlY2sgaWYgYSBw
YXJ0aXRpb25zIG5vZGUgZXhpc3QgKi8NCj4+ICsgICAgaWYgKCFtdGRfaXNfcGFydGl0aW9uKG10
ZCkpDQo+PiArICAgICAgICByZXR1cm47DQo+PiAgICBwYXJlbnQgPSBtdGQtPnBhcmVudDsNCj4+
ICAgIHBhcmVudF9kbiA9IGRldl9vZl9ub2RlKCZwYXJlbnQtPmRldik7DQo+PiAgICBpZiAoIXBh
cmVudF9kbikNCj4+IC0tDQo+IA0KPiBUaGFua3MgZm9yIHNvcnRpbmcgdGhpcyBvdXQuIExHVE0u
DQo+IA0KPiAtLSANCj4gICAgQW5zdWVsDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0DQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
