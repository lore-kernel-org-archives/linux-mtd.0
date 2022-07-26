Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985F8C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 00:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rW9BV0oKMZysOOlAyWdLOPseO0cN/n4um528Cj0eQNw=; b=uGXnSxuh6S7C7O
	GgMVf7Q6CqnPpdSaweSN2kqd2QaRkcVRhOnOM/2YAYjF/8hVvA4AYKvFpdW5eSVk+N2r/FvKQ1AES
	Py9Pu1zliKeEA0++SI0+4Hyyq3QodekkqFncsr3mvAq5GAHxGa2JfA3G6dQ4idg+yjTga2HNNcrot
	wD4i7LoUNiu4oN7DtZX4vJTKt3B4ywobXY1PNYcQlHc2eJ1y4iolJQShk03FEkihdFlQ7WSFpntll
	Ic6wY+AjW6gamIB39hBBvitrFIn6OCZMwrfT7Cke/D6xrcSTiGR0Vsza1eiBKaIUbM4D/FKSg52yf
	7C3UrunUMFOexhZMO+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG8Bi-005XoG-FQ; Tue, 26 Jul 2022 00:12:38 +0000
Received: from mail-dm6nam12olkn2098.outbound.protection.outlook.com ([40.92.22.98] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG8Bf-005Xkk-Rj
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 00:12:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrlFj/3g27oDmUva3/+e0NoK6Z8PTgIt3jbSf/eGhgakNsoNJtOHig0DP3eUo058A3sPEQU2u5EWUnS3JgJQ1qix+yP+GHj8tyBFjuwxDxLkxvMk55gwUvF8Vk1hXafJ2OJvofgr+Pk32UO3Ba7UN+wjCbcSuDQyJ1MZ9q0q8/ysWjdxR+XNFjkF6QMgDhOcIxQAQYOHs9shXAEqzqyp2182NAjNkfbDe4+ZjoiAo6GyAyyanXmllAr17RUoOzjzdACa1CmubzmOHp8+8BHlHgdTlP5rPzQXK/V6Gi4DWgkeCPTYhuhFm9VGlzLVQ5zHS/QPpdZCQhlXbuO5hSOUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxmcTmJg548nZ0k7a/6VW7v7ZQJvOfKbNKQhiAqST20=;
 b=JXoC4FpDXixNY3AqLQFQUfWeQTuI93nARuRx83r8cEUSKYD8KHaAsVYs0bdHwhV3vsl984XM63tufVintUQHXx0Q7svfHOgH2P4Xx+L2FQ+UdQBhTf/+pUEjEb/TjI2afhsF98shrQKEqxcBIRPBO4beOXxN98CNHDg/tV6sfdEJbCaXVA5aGzuyprddKbmon+vA0cnQ5C/m/dTfnz8T/GprUcrh/lf1ERmW2dW/TSEkxLmWSUYhAR8eeCivj/p18oTbhi244d+LaaRwu+Kq+zYeYD6V5YN173OKAzlT3sDG7PaIdrEkG+Y8FPuoNmEgZU0U+2yH86XHcZOD4MpTAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxmcTmJg548nZ0k7a/6VW7v7ZQJvOfKbNKQhiAqST20=;
 b=IR1Ecq37RndiFnZ+QXVYlsmNrv3Xuc5FksDICkfoss0mhsC/knmRqzAar8hsD/Iqa+RQbztA3yANX+m29+GqrPpO8GTlzzYf9UcIQOd2rMkWh1bpwX+XAIp3ziXiKn7QGPFkkMPRS1Rt2pz01PeoPl2blGNAEjYTaW+eSFFFeuoIe4dPaGmw993DSu9t76ytCyRpo6Z2lYGqItv1Ifuj9SKcFLuPdVTFQ0dmbDGpjNgoZ9yL1o7+k5qFZQDhWWJBA5vche9KLI964BZaJ/X7Zwznxzslev68VHcG6GigdGheVeGz6zQZtDb1Cn09HCUyGdFNGxrvWVPIhqbnbHtLwg==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by BY5PR17MB3857.namprd17.prod.outlook.com (2603:10b6:a03:239::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 00:12:27 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::3409:88f8:6069:ccba]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::3409:88f8:6069:ccba%3]) with mapi id 15.20.5458.024; Tue, 26 Jul 2022
 00:12:27 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: "GONG, Ruiqi" <gongruiqi1@huawei.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Naga Sureshkumar Relli
	<nagasure@xilinx.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Wang Weiyang <wangweiyang2@huawei.com>
Subject: Re: [PATCH] mtd: rawnand: arasan: stop using 0 as NULL pointer
Thread-Topic: [PATCH] mtd: rawnand: arasan: stop using 0 as NULL pointer
Thread-Index: AQHYoBjwrgb3QDZZqk2l3gKc/X6vea2Pm+f5gAAJv+qAACLuMg==
Date: Tue, 26 Jul 2022 00:12:27 +0000
Message-ID:  <MN2PR17MB33756A8BDAD38F27DAB6A1C1B8949@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20220725112108.686347-1-gongruiqi1@huawei.com>
 <MN2PR17MB3375A61331BC4E0E5BA6F9C4B8959@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB337508661E6AA12D1B3E8F78B8959@MN2PR17MB3375.namprd17.prod.outlook.com>
In-Reply-To:  <MN2PR17MB337508661E6AA12D1B3E8F78B8959@MN2PR17MB3375.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [mZIfQADI/v2z1XDX37IN6Ia7MNsOQl7YQJgOhnOtJdWu7AtUVlm5ZNe6phlPQoNb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23572af0-3f7f-4b32-ed38-08da6e9b8618
x-ms-traffictypediagnostic: BY5PR17MB3857:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  HX/4+sTM/yUEjdsVFbVoOtkAqgdkNEPbfyHSuQ/6rrNHSvU2kP7NjmGEZzLlZa9bKJG/whEepgZDzuW/1EY3lE8wPa9XsHpt4NqL5+GUarr88O3ckvsJq/IXHCPA6kDJSbmGpo3FpPWKIFWTe5jKEw/AFWhFDMBhffRlAPtlIIAW2ZQ5TyGkdBWzBSPIN3aMUAq9mow4g1ad6gGbNGMWGhqNDJa/6Ht9SPiuBt2cUFYpuYpDbVs4ZAN/JUkGdLwn8kFvW057bQ6Oomp8ENsCOMSiJHY9Hq3c4+x2XbupZDneq7uhVuoqZ7/pm3tJ4tPwatFOW9eeY9h1RsQlUN52cyWP6ZOLrVB/4sM+k0pGfqVkIxLFQNJXaFaEWn9kQL22ettBloMPIkoDwHXRv85OA3FOHEgjQugVIwAZF8TpMOTeZjn9qEnX/gipsfJPWD9IWK2zzrSl1rxuJgxJZDRIjOAQLEWCcyA9euqEKbOqqAwjRjdWR6wAzPohWESS17MbJjNkgAuTzT7/MJdXAjxBdy7Ia6n3vv+am9tK0GRQvBVl4pLM8UyefSXzQLU701hNPq7Ry5pwk1E5xi71nHPGTSJQQZTD2tp2GGowfFeMDBOcjX3RT0ilpdTnBR4dMFHTICKx/1HFAOVW/gYUbZB9pA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eTdQZFNad1NPRGdhdXhCbjM2NzNha0FGUm9DM3pqeHErL2ZGWDhMN252djZZ?=
 =?utf-8?B?WFE3K3RBb3RDN2MxT0xwVi83Y3pTSTlSSWVEQnhFdFhoUFpiZjhvcDZQL0dG?=
 =?utf-8?B?MkxnWDFRS2I2ZWJkSXRaWW1jZE5UeVhVdUhVWkdKcVp0VzBoYkNEK0VxTUxY?=
 =?utf-8?B?WC85d216czZWd29KM05GcDBGOVRtSWNybXo2czN0a0lxV3RxVmhqN3ZrbnBu?=
 =?utf-8?B?L2N1U2tMVFVEQVgvTThsWnhnZC9PT0NLeGNIZmh6YWpGRGRxcjZpT0hTMi93?=
 =?utf-8?B?VVpQZnEvVWlNb050bG5VQ2lnYnZldEdKYmYxVW53TFBzSFVXM2ZiaUdJaVR5?=
 =?utf-8?B?QkQ1UzQ3QTg3M0Y0M3BhMFB2WWE2eG0vVmd2UEQ2Q0VZSjk5L1pNc2hrUDlw?=
 =?utf-8?B?dU1xUHplSGpibC9PbTZuSGJkb0VMT1QxOThqMG1qdFU4NkVGTUdWRkJCcXZZ?=
 =?utf-8?B?cjJkSGZDcHpSUlZJZVNvaTdTWlI0cTIzRlA1ZlpTZ1NWS05ZdTZnWDcwbXEv?=
 =?utf-8?B?OVhBenVqSXhydUl5d1VEWWthS3dqdlg0ZFFITW9oUDg4NkFGWmF6Nk83ekN4?=
 =?utf-8?B?NFhKWG5TRFNLbGZVY3ZFR2FZODN4Uk1BblJLamYxdnN4Q2Jpcmtmb1lCdDg5?=
 =?utf-8?B?TlRJNWQzOVVRWG8xZkRjc0tPa3RzblZ2RVV3YW9ZQnZzZGNRUmRFZTdYQzQz?=
 =?utf-8?B?WHBLdTR5aUlTa1BlYnNMQVN4eVVNUEpmNW80U0tsM1p2TzBiT2xrYmpTY0Zq?=
 =?utf-8?B?bm1jUmE0NW5VQmxtcFRsTzRseXNJeC80MFhzdnhoY3IwUzIrbllxTUJ5K2hj?=
 =?utf-8?B?MVYwaFlCNUt3VlBCY25YQnJZNkhGZTZ6OGhGbVd4WmYwNkk4UkdjT3JTb01U?=
 =?utf-8?B?cnhyRis2anVHbnhUcGJBcFMrYXVETFEwWFdHUkNKcjdLMWFQUkhZRTNkTmVR?=
 =?utf-8?B?NlhMY2FNMGdueCs3T2FHRXJQQ0tWVU1tamVXclo2NEIwNUZhVFZ1TDR2ZEF4?=
 =?utf-8?B?Sy9ONk9VQy9CMVJOTm1pL0xuYUh2N3Z4RnF3MXduNThGT0UvaUduNU9qaHpO?=
 =?utf-8?B?WEw1R0IxNnFYMVNjRGJhUGdKbzdQbFo2MUR4ZHViV0tVWitMMGxtak9UZkVx?=
 =?utf-8?B?S0theTRLNk1wUnFQMFJrKzNTRXk3a1pNdGVFMC9VV2dWT2NNZEhIdU5mTktC?=
 =?utf-8?B?L2FHc003TVNCcjlvaWgxS3RmMkFlS0VQVGt2T2NIQmt1d1Ztb0ZvSGEvMTJW?=
 =?utf-8?B?VkUwY295NytKeGRkcG5peGFETmZjdThiSG9aN0FWN3RHSWZXaGY5Qyt5NnBI?=
 =?utf-8?B?ZTl2UXBuWTYyd2E2N3FlSHdyeFpZVjgvcnZoL0tmbmlGVTBUbngwYk5DN0RR?=
 =?utf-8?B?bGdVOTEvb3JHdFc0TElvQnYvQkwxa3BXbS9HeGZROW1lZ0NNVGlNSk5MZGNT?=
 =?utf-8?B?WXhZT1o4dndOTUlIT3ZVVE1DaUhnMVVPOTZZeWhTK3hBeFc3c0hzYnFNVTg1?=
 =?utf-8?B?WjlHZTYzenlpNzlvRzRScjRTak90R2tHNy9nRnBpTmNOa0F5V1pKd2FSZjZP?=
 =?utf-8?B?bE5iL3dBakw0NHhIYWUreUdMWGdOZ2t5cE5sQ1BFYkVFY0JOZUU3VStjT0ln?=
 =?utf-8?B?Ym5zWWlWeTZoUUd4d3VPcUkyNHNZL29uNDQyd1JvT1pTT241K1RURmxVcHRp?=
 =?utf-8?B?eWVlSnk0RUQ2eUdrbjJuTmRzK1dCU2ROTldnbm1uZnlPbWxpd2tnbUxJZXdB?=
 =?utf-8?Q?nI0pKXUNg+joWC6aqfbY3Gx5GxSlYKBwmodG2HV?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 23572af0-3f7f-4b32-ed38-08da6e9b8618
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 00:12:27.4644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR17MB3857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_171235_919803_F579B99B 
X-CRM114-Status: GOOD (  13.30  )
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

U3RvcCBmdWNraW5nIGVtYWlsaW5nIG1lIHlvdSBzdWNrIGZ1Y2suIFlvdSB3YW50IGEgcGFzc3dv
cmQgc28geW91IGNhbiBoYWNrIG15IHNoaXQgeW91IGJyb2tlIG1vdGhlcmZ1Y2tlcg0KDQpQZW9w
bGUgYXJlIG5vdCBUSEFUIHN0dXBpZC4gDQoNClNlbnQgZnJvbSBteSBpUGhvbmUNCg0KPiBPbiBK
dWwgMjUsIDIwMjIsIGF0IDY6MDkgUE0sIFZhbmVzc2EgUGFnZSA8VmVicGVAb3V0bG9vay5jb20+
IHdyb3RlOg0KPiANCj4g77u/S29vcPCfmILwn5iC8J+YkfCfmJHwn5iR8J+YjvCfmITwn5iE8J+Y
tPCfmLTwn5GA8J+RgPCfkoHwn5mI8J+ZiPCfmYjwn5mI8J+SgfCfkYDwn5GA8J+YkfCfkoHwn5iB
8J+Ys/CfmI7wn5i08J+YkfCfkYDwn5iR8J+YhPCfpKPwn6Sj8J+YgPCfmIPwn5iR8J+YtPCfmITw
n6Sl8J+kq/CfmKXwn5iw8J+ltfCfpbXwn5ih8J+YofCfpKzwn6Sv8J+YrfCfmK3wn5if8J+Yn/Cf
pbPwn6Sp8J+luPCfpbjwn6W48J+ZgfCfmKnwn6W64pi577iP8J+Yo/CfmJTwn5iU8J+YlPCfmJbw
n5ij8J+YovCfmKHwn6W28J+YsPCfmLDwn5il8J+YpfCfmLbigI3wn4yr77iP8J+krPCfpKzwn6Ss
8J+kr/CfmLbigI3wn4yr77iP8J+ltvCfmLDwn5iw8J+kq/CfpKvwn5iT8J+kr/CfpK/wn6SvDQo+
IE9vaWdndmtscG91cmXwn6Ss8J+krPCfpKzwn6Ss8J+krPCfpKzwn6Ss8J+krPCfpKzwn6Ss8J+k
r/CfpK/wn6Sv8J+kr/CfpK/wn6Sv8J+kr/CfpK/wn6Sv8J+kq/CfmJPwn6Ss8J+kr/CfpK/wn6Ss
8J+krPCfmYHwn5iS8J+YjfCfmJLwn5iS8J+YjvCfpbjwn6Sp8J+ls/CfmJ/wn5iW8J+luvCfmKnw
n5ip8J+kqfCfpbPwn6Wz8J+Yn/CfmJbwn5ij8J+ZgfCfmKnimLnvuI/wn5if8J+Yq/CfmKTwn5it
8J+krPCfpKnwn6Sp8J+luPCfmI7wn5mB8J+YqfCfmKHwn5i18J+YqvCfmKfwn6Sl8J+kpfCfmK/w
n5i18J+krvCfmKzwn6Sl8J+Yk/CfpJfwn6SX8J+YtvCfmLLwn6Sk8J+kkPCfpJLwn6SV8J+YteKA
jfCfkqvwn5i14oCN8J+Sq/CfmLXigI3wn5Kr8J+YteKAjfCfkqvwn5i14oCN8J+Sq/CfmLXigI3w
n5Kr8J+YteKAjfCfkqvwn5i14oCN8J+Sq/CfmLXigI3wn5Kr8J+YteKAjfCfkqvwn5i14oCN8J+S
q/CfpJHwn5i88J+YveKYoO+4j/CfkoDwn5KA8J+Ru/Cfkbvwn5G78J+RufCfkbnwn5G68J+RvfCf
kb3wn5KA8J+SgPCfkbvwn5KA8J+SgPCfkoDimKDvuI/imKDvuI/imKDvuI/imKDvuI8NCj4gDQo+
IFNlbnQgZnJvbSBteSBpUGhvbmUNCj4gDQo+PiBPbiBKdWwgMjUsIDIwMjIsIGF0IDU6MzUgUE0s
IFZhbmVzc2EgUGFnZSA8VmVicGVAb3V0bG9vay5jb20+IHdyb3RlOg0KPj4gDQo+PiDvu79TdG9w
IGZ1Y2tpbmcgZW1haWxpbmcgbWUgeW91IHBhdGhldGljIGxvc2VyDQo+PiANCj4+IFNlbnQgZnJv
bSBteSBpUGhvbmUNCj4+IA0KPj4+PiBPbiBKdWwgMjUsIDIwMjIsIGF0IDc6MjMgQU0sIEdPTkcs
IFJ1aXFpIDxnb25ncnVpcWkxQGh1YXdlaS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IO+7v0ZpeCB0
aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5nczoNCj4+PiANCj4+PiBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmM6OTE4OjcwOiB3YXJuaW5nOiBVc2luZyBwbGFp
biBpbnRlZ2VyIGFzIE5VTEwgcG9pbnRlcg0KPj4+IGRyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNh
bi1uYW5kLWNvbnRyb2xsZXIuYzo5MTg6NzM6IHdhcm5pbmc6IFVzaW5nIHBsYWluIGludGVnZXIg
YXMgTlVMTCBwb2ludGVyDQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogR09ORywgUnVpcWkgPGdv
bmdydWlxaTFAaHVhd2VpLmNvbT4NCj4+PiAtLS0NCj4+PiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9h
cmFzYW4tbmFuZC1jb250cm9sbGVyLmMgfCAyICstDQo+Pj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2FyYXNhbi1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2FyYXNhbi1uYW5kLWNvbnRyb2xsZXIuYw0KPj4+IGluZGV4IDI5NmZiMTZjOGRjMy4uZWM3
ZTZlZWFjNTVmIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNhbi1u
YW5kLWNvbnRyb2xsZXIuYw0KPj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNhbi1u
YW5kLWNvbnRyb2xsZXIuYw0KPj4+IEBAIC05MTUsNyArOTE1LDcgQEAgc3RhdGljIGludCBhbmZj
X2NoZWNrX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsDQo+Pj4gICAgICAgICAgaWYgKGluc3Ry
LT5jdHguZGF0YS5sZW4gPiBBTkZDX01BWF9DSFVOS19TSVpFKQ0KPj4+ICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT1RTVVBQOw0KPj4+IA0KPj4+IC0gICAgICAgICAgICBpZiAoYW5mY19wa3RfbGVu
X2NvbmZpZyhpbnN0ci0+Y3R4LmRhdGEubGVuLCAwLCAwKSkNCj4+PiArICAgICAgICAgICAgaWYg
KGFuZmNfcGt0X2xlbl9jb25maWcoaW5zdHItPmN0eC5kYXRhLmxlbiwgTlVMTCwgTlVMTCkpDQo+
Pj4gICAgICAgICAgICAgIHJldHVybiAtRU5PVFNVUFA7DQo+Pj4gDQo+Pj4gICAgICAgICAgYnJl
YWs7DQo+Pj4gLS0gDQo+Pj4gMi4yNS4xDQo+Pj4gDQo+Pj4gDQo+Pj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+Pj4gTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0DQo+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
