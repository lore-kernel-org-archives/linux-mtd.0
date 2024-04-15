Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2502C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 13:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QMjccWjd3ifWHX8oBrgTP/3ox9O5Z7SQmaQO5tac40w=; b=N/Xy8kt6NZo7Iy
	kyqFLP7V0aGyJYZc3PAyfXOovA2ODHTV7bY11K0bpzi8OBHtYcLtC25ENfhb7wv93/p0Kt1hUZNaH
	CBSDn4v42SNoL4RisvP7ibo3MQ0yR/B/Fn2EgdLbTfFP0XRbT050WOHo0iWjFQZqQMCNEShbbvXC7
	8k+FhiNp7oKcs5PPAlZg+FYCZvSb3kqD/tQgFePMoYisrdJLaNqXQLtj1FBq2YqXuw1B0EtWkQcXx
	9JExmBZ3vyzCtt/NBm2jql57NCJNdb6VMCa8pbpI++gbRMFtjUQ/bujA9JgWAk5cjD79LJQKbdRAp
	hz0piZ/or6JW4CqB9nAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMhN-00000008ZAp-2DB3;
	Mon, 15 Apr 2024 13:48:41 +0000
Received: from mail-db5eur01on060d.outbound.protection.outlook.com ([2a01:111:f400:fe02::60d] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMhK-00000008Z9m-1CX2
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 13:48:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBmgIwIZq/tdldRbzLNu5SP81tdVgpeAne/i79julfPS3QwKl+wgR9OcxdyJw0Zd7h4RJQjoJMaNcmnWCXxXeNNMpTI9xX5aa2aTlaIE9/EK2zgVM99RzWmS3dfd2+/bNlJYKFNCtRKFCeWsuWMrYUZPccrVF0nIjWkLRkPXI5NJEYKdTxvA3X7Ks5FUAUPpTGmb8BPpfODcQyevX7LmY+cl2UhioauDyjEh0L7/XFj+uYE0UI9BVuYs+JxgtLHPDy3GkxfahBx5d8IJqWhxX2i9ERH6u+wTMi6no3rAqfuBvgUEo/xEDPU15e4kyzWLKOnAnRl/QTa2TVCgIEiA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwzLBluuJGhrxd1oT1zbdziUeAPhsWnQXnL2/Cnedxs=;
 b=Jt2NvKImWeFRhuHYLlhh7MPxDSEWsmtljwqC163GaEp9HBKRtpx7eoJyJ+1GOeb2W/gQ1PND+xECWWZZVE9njeL/F5ty8jxrPbz5htKPlVWq3NRuZob7NIBdnoa12bn4xwrxDeJMEJwVndt71y08+Ssgi+CYH2uiFoJ/UjAgF1yM4Sld7LzrP7DG2xrTVwBzCz2vNxAjDe3RvDU/5tlOH5Vl/ST0FKu4XhiE0lGyRPUHjDMUxabgkTsywAVS7lfQZOTp4x9qcCfTflz2i1JmCyXFgNcfZNJSPrwDKNNGuUPJdmkldgqIQLvjMj/r9zaTuD/cssgcCN3HlECfnsej9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwzLBluuJGhrxd1oT1zbdziUeAPhsWnQXnL2/Cnedxs=;
 b=nvHTdC0KhEPBZaYhk5rdSoHWehR/IWkHsRHG9kMHBGsvRWXSzUv/lMkxcoB20YNUShhGqgZTqZsMF+iV8SWkSsuQKoi9TvVO5oKENHZw0YrskjcXgqq46TKmdnsuMbIzgM2xYjJhy4r0lBGOY7vJLB2fLH7t3km9uS2RrjGp97pRFWgtfClKkyBvRy43Woalo/mHwj9SAwAYaHG7B0V22OJGTQmL3aisjX795BwyUKTp2Xfo85pqKlI4XtwAz58Q+DchgXMoLET7JVW14bt/32ILbva3O/JYOKQPB9Wlb24POvbdKSqvp0QojNL8Phawe/Z6PbUemoOuIs3B626Zgg==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by AS4PR06MB8568.eurprd06.prod.outlook.com (2603:10a6:20b:4eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Mon, 15 Apr
 2024 13:48:25 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::2e42:41ef:7e5e:f927]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::2e42:41ef:7e5e:f927%6]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 13:48:24 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "richard@nod.at" <richard@nod.at>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "vigneshr@ti.com" <vigneshr@ti.com>
Subject: specify root squashfs ubiblock by volume name
Thread-Topic: specify root squashfs ubiblock by volume name
Thread-Index: AdqPOy0tiXj/4x17TYmZqaxZED52xQ==
Date: Mon, 15 Apr 2024 13:48:24 +0000
Message-ID: <DB9PR06MB7849A67820F6FBA17FF20584C2092@DB9PR06MB7849.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
x-templafyemailsigvstoversion: 9.13.0.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|AS4PR06MB8568:EE_
x-ms-office365-filtering-correlation-id: 47addb69-5fc0-41be-b7aa-08dc5d52b8ce
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qTjBmAOPM35yZD1ibTWJjRnXJsA+Py3/MkYf+JRkxKAJGehfkOI3lx6zpcaeEnpuJwm9MeFcpLoklS3BiwE/nuLLlxfm1EBLyRg6aw0nq/b+Ko2HV2SKpMKQ5Y1YKDc5BpVkJscfdV5Az2OBS6I2iDeKw4KMj1SaofNbzqBc2uolNi953QI7j+nJlWq7Oy5EpeU9srtQbLZl/1ina+7rmb5W5I8XviDTSawq9xJEvh6LXZxsYZ1mZqnJG5NuQ92KKtBj1/etL3HQLRW4+Xy10bl8jsv1H6YPtmbkXfZhABt3eCp8SOCLS9XW39dTj0BkShcOYK8ut6KCi1yrNuqs5o3wWM8XjoMLtoH9Kn10jBWtjxD9pVAaqA/R1Rrl7JQx0cnMUH/BEFfsGzDBz4uFLRp4/863vwWQtMdhBrEDRsLZocjmxFYCibiwHukxDcIuohu8j2AP8uSAw5En0RHg+IeKOoH1lEDTf/wV9QcloHjfc8jite9lk+jOmGFJiKTJ/R1waTGQmPaEEN+mOG2JmqoTBzyXpe+kDitGXNvfY7KWbd0rVVWrZN9TMakkZpYZJUO18SuiCen9k+smhDtF+wdFAJyqQ4KEu9CpYpe6PKfTM/ta4d8igqjTppKztMK8q2fh4K6eTt4LpCALS0foriv1HJC9BnoWVoW3S/6YrVL2YVx+QYjNvXwmqGjPHNbhy8ZczmaFC2n06y/Gg7/TQ7NBh2THfGcMDpQ8Y8MrYwc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGU5NW1kSTZnRVRTTjJFeDRHWFJORko1Y1BmYWJ2NFVUTDRzeFFZVytOZUM3?=
 =?utf-8?B?V05QNkU1eE15dVBsWjE1cnF4akZXYmFVZytBZGhkOHF6bWZIQzhQSFJkOGQ2?=
 =?utf-8?B?S0t6TUhKYzFrMmx3U2FTVHZkOTJadlN1MGZkNVo0REJ0YUZUUDNEYW9WTDdu?=
 =?utf-8?B?MzJWUmdSUklQdlV6U1lWZklxZjF4M2Rqa1kwek1YUitYeEZ4RCtlc2FCL0pV?=
 =?utf-8?B?dWlXRDE0NmJaT0hFWjMwbS9pTlFNTTFmRDNjb2M3K1NNY3pyaEdZQkdkUnZJ?=
 =?utf-8?B?a3VjZDFEU0RkSTM5eHlJbVN6R0tNQWV4TFc5RDlnbDQzRk9uQmJwM0orQ3BV?=
 =?utf-8?B?dmpzaFlwOCtLTURMQ2MwOS9rUzY2cTFnRWFSbno4QkVWNDlhOFAyZjJaSTl4?=
 =?utf-8?B?V2g0Q1RHUVp6SW0xWHo1dkJtWVZ4VGN2Yzd5NmkvbThaV3NpLzJlQ3hhYitl?=
 =?utf-8?B?bHFvTW5SQkdiSnpJdldSSU0rcTA2QjhjTXNkeExWVEtPNGRKTnVCRUV4S2kr?=
 =?utf-8?B?Rlp0WWpWcmp5Mk5JcXY0MU1ZdEl4ajdGdjBBZ0lBZFBVKzVyVjVLWE91NDE4?=
 =?utf-8?B?eGpnc0QwVWNtSEg5YmthUUhqMiswUjhnVk51blhTWXJ5OUZXSVlTdXg0VUhX?=
 =?utf-8?B?MjZ2djlTckVkWHNqY2lZSWdtdjQ2NlJZUWJmR2lpRzJmZG1QMUFBcGlXSWdk?=
 =?utf-8?B?OWN5RFBMa2tPbFgrbUgyTStXTFU1YWlPa0JSZE83U0VrQkd6SU9RQW4zQ21j?=
 =?utf-8?B?VVFndDhLYzdGbHFzVFNmUlUzZ2wxVG9LVUs5NjZrSmljdGRwSm1IQVFHQXdz?=
 =?utf-8?B?OU02cWNRUXo3VXVQSHlFb05teW9TSDRXNXVWTmFjWEVvMkNIaXpUU1g0SlFT?=
 =?utf-8?B?bGh0S2wxRUhxbkkya0hBN3Jwb205YlNQSjlaeXhFV2lvditPeWc3U04rTlQy?=
 =?utf-8?B?aDA4Tzh2cUp4cTRrZVZCZjcxM0lCY2JSRHljZ0dEcnNBc0VpaFU3ZVkyNGd2?=
 =?utf-8?B?WGQxTUFvVnRwNUh2MFdqNWJNRGdoRzF0ZVk4S1NjaU1pTU1OODAvcW1ZN3Zo?=
 =?utf-8?B?NFpCSVoyamkrSHNadG0xL0xkRDIzaldmNTBHZ2F5bi9zc3FsVnNUcVJqWXRp?=
 =?utf-8?B?SUpadnJxTWh6OU9DMzR2NG1oN3NEZCtEMkREWEFFWm5PeENYS1V4cjhPMkhE?=
 =?utf-8?B?MmZGTjBYU3MxMEN5N2VJTGtyMUgvck9adEZkZnJHcGxMcFVIemJCUUJGK3BO?=
 =?utf-8?B?UUJDV0tjQTJ5SFAzZmwxUWpEWC9nd3ViQ0hlay9KZlozSHZZY0tmcVVIZHVz?=
 =?utf-8?B?Z21DS0t4ejl5ZXR1RFVFdXhPM2VDYnVVM2t2SjJ5Q29xWlZsV3pyeTY2emd6?=
 =?utf-8?B?ZUIybmJKYWxLNjZFRWlQemJBdVVXOHZ1RVBoeVlMN1dIMVdXRENlZU9zbUYv?=
 =?utf-8?B?S0NMaDQrNDVEMEZ1MkkzTzhBWHJ0WDdyVWFwblp0alQ2cktKMi9LUDNhMXBJ?=
 =?utf-8?B?MWdtaEpWd2poM3F4WSt5b3IvWGlSdE1QZVM3ZkJHd0JUdEkxS3JBaTR5S3E3?=
 =?utf-8?B?Y3Y3VDNHU1lvY2lVT1lNdDZQU3l3d3JMRHovSDdKMWFqcnBETVFEcDRyMmdx?=
 =?utf-8?B?Zk91cWRheTNuMDNSN3ViSEZteWNURXRNNlFubmtwclFNamUyeHlxYnlWcS9Q?=
 =?utf-8?B?b0pKRzEzeEJhNmFPZy9Sbkl5dVZxOTRBM2dWdmpMbkRYajJWNGo0emFSUTd1?=
 =?utf-8?B?K0dzTlp2U09LMWxERXB2am14U1lWblJWMEVmV0JMS2VCVldRU2RxZTBVSnIz?=
 =?utf-8?B?YVZpOC9QOWRsQUZlckdndWJFVlN5N1gwQnlsemlrTW5OQWxVcmtEdm5nZVhi?=
 =?utf-8?B?bW5vNHJVVE5vMm1TMzBmY2ZYckZEb0pRVnRHUjdKT2hST09nb0g4ekRrR1My?=
 =?utf-8?B?S1FjUU05d1lPRW9DaGpjWG9zMmFxS3pFWkRxeDRiNlFaS3BOY1lYQlZnbGRI?=
 =?utf-8?B?R0RRa2dRL01tL2tSNW9BMnBMVk9Mdlc3TklYYWxJbzF5dlhXeTlkYTIrNVpV?=
 =?utf-8?B?d0tuL1FUNk5IMkFucWM4eGxGL3RiWHhrT2Y4VXR4L3lJVkMvaFRidDQxK2R3?=
 =?utf-8?B?dHdzaG1QRWFQeTZZOEVUUGpWVTBNWjZVL3l0NDIvUWRwS0orYUg2N3daMWY1?=
 =?utf-8?Q?s4iDsE1ui0vXzOAQ+Z79dnw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47addb69-5fc0-41be-b7aa-08dc5d52b8ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 13:48:24.9000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gOB3NqklxbVU0qvkbvmgB0PzT5EqrQaM6DCtN5xv0vtSVykb4H8C0jR5LbBCZu6vOrh3UtQMkoxzXUoDodilX+5WaV/Mm/kw2lkqzxOgUkIbvezazUuybZOmEHq3FYTV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR06MB8568
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_064838_357042_A211DFA1 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gYWxsLA0KSSBoYXZlIGFuIGVtYmVkZGVkIHN5c3RlbSBpbiB3aGljaCBtdWx0aXBsZSBy
b290ZnMgYXJlIHN0b3JlZCBpbiBhbiB1YmkgZGV2aWNlIGFzIHNxdWFzaGZzIHViaSB2b2x1bWVz
Lg0KVGhpcyBpcyB0byBiZSBhYmxlIHRvIGhhdmUgZmFsbGJhY2sgc3lzdGVtcyBvciB0byBiZSBh
YmxlIHRvIHN0b3JlIGFuZCBydW4gZGlmZmVyZW50IHZlcnNpb25zIG9mIHRoZSBzb2Z0d2FyZSBl
YXNpbHkuDQpCZWNhdXNlIHRoZSBudW1iZXIgYW5kIG9yZGVyIG9mIHZvbHVtZXMgaW4gdGhlIHVi
aSBkZXZpY2UgY2FuIGNoYW5nZSAoZGlmZmVyZW50IGNvbmZpZ3VyYXRpb25zLCBvcHRpb25hbCBs
b2cgdm9sdW1lLCBldGMpLA0KSSBoYXZlIGEgc21hbGwgcGF0Y2ggdGhhdCBhbGxvd3MgbWUgdG8g
c3BlY2lmeSB0aGUgdm9sdW1lIHVzaW5nIOKAnHViaWJsb2NrOm5hbWXigJ0sIHdoaWNoIG1pcnJv
cnMgdGhlIGFscmVhZHkgcG9zc2libGUg4oCcdWJpOm5hbWXigJ0sDQpJbnN0ZWFkIG9mIHNwZWNp
ZnlpbmcgdGhlIGRldmljZSBuYW1lIGZvciB0aGUgInJvb3QiIGJvb3QgYXJndW1lbnQuDQoNCklz
IHRoZXJlIGFscmVhZHkgYSB3YXkgdG8gZG8gdGhpcyB0aGF0IEkgbWF5IGhhdmUgb3Zlcmxvb2tl
ZD8NCklmIG5vdCwgZG8geW91IHRoaW5rIHRoaXMgaXMgYSBmZWF0dXJlIHRoYXQgd291bGQgYmUg
YWNjZXB0ZWQgaW50byBtYWlubGluZT8NCg0KTWFueSB0aGFua3MsDQpUb21hcyBBbHZhcmV6IFZh
bm9saQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
