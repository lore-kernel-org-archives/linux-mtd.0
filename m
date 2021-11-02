Return-Path: <SRS0=5hwZ=PV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCD4C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 08:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7219360C4B
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 08:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7219360C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YNVwdHt2O3EOgzXzQPuFXLcJCeORdSTA3BpnPQEWCD4=; b=nr2kn3KscTJuMv
	rbnLLFaVtY4PUPVKZbWtqWD+mb+wHYdKOCnzVabnlKwEuFAfki3gRGx8vvLmSmFeuFhcm4F56DQ4v
	p0Jbwx0RkJJose3AmZFwPW8AliKjUjiEWlyBHZt0wgoJtTSEn1jj7Cx6dEnWeqOuku52kRJB9NN/N
	Q+HzYGffEfOkXGVP3rAcG56+RLwlmzPiqlhQKHTUu+ZiXlzE971d7+heRabfsUkzGYLMY8SbIKg5m
	OqKDPDcmLlUW04tFikbNCnyjVcK6syXOn3nfLJXzEPcn6U33ZLDW/Ma7YO9EReZxpLknwxgJ0VDNK
	jFnbLUpajj0q5a1eWvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhpIF-000wuu-Sp; Tue, 02 Nov 2021 08:37:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhpIC-000wuJ-ML
 for linux-mtd@lists.infradead.org; Tue, 02 Nov 2021 08:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635842237; x=1667378237;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=dS/FNUzhXSUOXewXMHdfSGw13IMIr9Iuh/aMwYf7zsw=;
 b=CpxoFodhViu/Ufs/MYBeyz+BlS4xQsRufrlMFBAANcG+ErofL9VDKF8c
 HCFK23nEHB5Ikpvz88K7tcB1fICMu0BYu2O8BU3p7liwmiuHI3lYRUkaz
 HqbNGTHfqTXFx7UOawpHtbu283KWI7fkgcKPN5WNW9Nb0LPwwEbzbPy7E
 y8jXleLwngfBwbC7lbH6jtsxM7ANpkXx5VbAHUyzG8MoYiNJs4EWoefd0
 zja88+Qp2b1FMqs+p789D9EtqfY7V4rj9ODYrCfkDXWuc7/NuaTVL8EhF
 Z30RT+66MmWBlcFcNCgkKjJzrloypaf7ruTOb5LbTEGihK6EG3mUbMZa5 w==;
IronPort-SDR: dSZ4+fSMpI27Bi5ZCfJuqu5D+w2uot/frKQuVul3RugECUrqagaYBp4a718/hYWDUQtGMtikcr
 Kp1bH4q8tPVEYUEdchn/Ad91n1LpsZq81zm0bTnA2L7vZLCIDh7EQmPtAIeIVKL1DwcdI+hjXF
 RJZI3OHyaF67TNpv2RAgoX4PE0tDOIpfHJ+8g1ypoA7XjrX72zwwPRf+yvl9E1WTKBpUTn/PDw
 zECQYhyMSshUA0i44+tnmunmVH7fJtpFmFIY7EkeBiPT9wz5O88W9YIIfGwH0poq4FkykoKRbY
 XaPc6yjlMKPI8YpWuifPr0bV
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="141903195"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2021 01:37:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 2 Nov 2021 01:37:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 2 Nov 2021 01:37:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JT6gt6LvFz8EY1Dyg0+Qc3xrJboe9uJuyzuW8cYCDx34kR+1yjZ9mCBCCtP8v3jaMw6jzfpEA4uTVwPv+Y2CH5auTa985en9FrDhif7Zl773uI2Ma5C/CKHteUCYpWefluDvT85jYymiTKcurKGfviFiwT37lLjOfXj1cVlTWzU1o6eqobCIlxr0wKtzRDYS+7m2O4zYwAXKvhdrSWujq4oDzwy7JZwKteharhlc954dFHbW021BBoJ/3H/yDgg7Cs46RBBXGbUbncnHV42epCVVc5EpFQ5Lmrn6qxQQn7yxynOWDtkyA0y+l5l2Wu0FnSj3LU/U6O08Cmawf95S9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dS/FNUzhXSUOXewXMHdfSGw13IMIr9Iuh/aMwYf7zsw=;
 b=SahZHzM0Vvwr8g8Tb6qQS9S5elWzoAKUWt32phdAa8kdOfqyZ7aYT+XbL+CuxRLzcWnF0HNTk0n26DgNSARywBxHqc5MP6GFvUN/gygNZrcybstAWGrU4DIKF7SZBMekxZFsgAvvwWCtdnZDU1OgJchsgO0nH8FAP5BdTb/E7EFR14dQxfqQfFusHUjx30phDNG4LrK93zsJeOYtTM6Eno4gmVv6ceDS5ShQ2G3BiEWYsYUPfDNu0sWL9ckf+XA75s5SkdjOnCFUVhN2lr/NTAV4XPPGbW5qYLRdwPITI0LdaUKHSFm5GzBZduiFfDFDza9ReLxKJH82h5xVzDw5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dS/FNUzhXSUOXewXMHdfSGw13IMIr9Iuh/aMwYf7zsw=;
 b=l3xoT4/Dk+L9Wcle6HjMItukT9rBF8xaUzBKNr5QjNE3isNzKIk54twvnKhlHr1d1/y3/PZHDhz1s+h1KSP7ebi5FvSJwHF007TBBKvi7QYtTtuD7vyfBtQur9+Y2Bu6Tyuve5zRvOJtxvm1qdZNhawSofuteOtOqvCqwUxWaZw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 08:37:10 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 08:37:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <vigneshr@ti.com>, <frieder.schrempf@kontron.de>, <p.yadav@ti.com>,
 <michael@walle.cc>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.16
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.16
Thread-Index: AQHXz8TTQL1ws3opq0e78D9VQ31htw==
Date: Tue, 2 Nov 2021 08:37:10 +0000
Message-ID: <9138061e-ff86-b3b1-f00f-69ef4885213b@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: nod.at; dkim=none (message not signed)
 header.d=none;nod.at; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d07b20f-172d-47e7-cc4d-08d99ddbf62c
x-ms-traffictypediagnostic: SA0PR11MB4639:
x-microsoft-antispam-prvs: <SA0PR11MB4639D3559694E4FD2C09CF1DF08B9@SA0PR11MB4639.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dw0xHdZL9p3qXNDLEpKUJhqZw9aD+dBzplA+0KT3t/3Y8V3g5ixuNEM/kPdH10rNruhFNYfKCYgMk1vTsgJABC9eiVlhN5DHcYYHYgm4PJeKD1P+zUJem41VqkA9WzKQdk2xyJcv5G0OAO8wYz0ho2Adh4QGJAW92komRiCiAS7t5VtgXY+r1xxWGI8TQlLPht3vZUTX+PFwBx0ef0K1sKXmGX/V+o4tSPBCPhCBTvfjZT4Funr/a6eHksZGzXUFkV8m5/+6Ex3prkEraO7sk9PGl11A5dDQcMFSKlFMtIANhhYIodpuSKtKx0GxNzfc7le+DsXwUHS2xnFjoRYDsLSnP2F4FFIzSNgEJ+VZHPMehiOTpumUF9N7c0uj5D1PK2Tg33FH8t87e/JCijKdRtbmxIAxIhj7gMpuJYgGZXC5RhUAH+SgFhIekBrNmKvve6ygJ6kcH7mPhf+BLeZDZuSvvLweah6p5atwSgd50zaSNthn3r1KmFgh4jm9V0S8ivk/JI+IUZHf8sSf2UtTqQRrqRi/btV7mwh9yYd1fX4pVpS+1c64OmeLFE6A7Zvv91hpnRQWuugbBScLtoc48bDgwfCFYHdbKJ+tL20+3Qx9hAqD9oWoHfryLd3RMxuFnLG/XCnDJ5rv4WvSLC8tP2zSIrck8nj1wAmr7dy+vFO+hIyxQghsFPEKu5L0RSuV1RMS9pF6boYc4cEnsft318yiSqntsHwBm1OmpgT0eo0B4wG/sG3q8Cx9B15pEon/Y0AkOfzyi5RUJ9IjMpPS0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(2616005)(186003)(508600001)(36756003)(38100700002)(2906002)(83380400001)(122000001)(5660300002)(6506007)(6512007)(4326008)(316002)(4001150100001)(66476007)(66556008)(64756008)(66446008)(76116006)(71200400001)(8936002)(91956017)(66946007)(6916009)(6486002)(38070700005)(26005)(31696002)(54906003)(8676002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDVMRU15c3RPSUUrZUNpU2NiUFhCa2FUc3owUGRQYkZhVVRsdWFyTXE0VmtL?=
 =?utf-8?B?Zy9VOFJKMVRtQ1o2TzY2NlI3L3oxY281WXpZbFQxTkFaamFRSmtacDU4UlVB?=
 =?utf-8?B?NDAzWTNJTnBwMjdtaWJYV3lnc3dLQUh2TFZTZ3ljVjNGdHM4RjZCeXppYkI2?=
 =?utf-8?B?S3djRWl4REV4d09QR3VDbktaYkJ6aWlIM2xHdTV0OFcwcWg4QUxjOUFHM3RB?=
 =?utf-8?B?RUtsVFA5S0djNGRoR0IrbXowWDQ2WTVNd2pieHhKRDVzTWNCMGlEdTRzWmJv?=
 =?utf-8?B?dnFBaDQvMTNzNG9YN1VsRUQ2MkVYbFJBSy82SzB2aGptcVZwaU5JWjFLc0ow?=
 =?utf-8?B?QlhkK1VLQnEzV3JhZGFiZjVVL3lwQ214UGFSQVRxd1dtRUN6b2JLT2puQ085?=
 =?utf-8?B?b0gwR2x5M1I5dlBVSTh2SjIzYVZrZDdpR1pMSTN0K2Fza1I0WEhVYTRPMEth?=
 =?utf-8?B?WU5raVp0aHJBNnl3MWJZd1AvYnpkS2k3OFVaZWdoWVpWWUwrUFdSUnVkMWFS?=
 =?utf-8?B?THRqQVRXOGF5Rlo2WHZVMlowS2x2S0Jya0EzYlJ3dEFUNm1ZaTBpUHk0dnVI?=
 =?utf-8?B?eDdkWUNocUJ4c2FvaVhJcVVNT0Nkc3IyNmJWRWw4UVVHMWw3NnpaWkl0dHph?=
 =?utf-8?B?c2xLYUFKUkRYbnBTZzd4ZDY0N1Vja1FNNHNPNmF2QUxQWlV5NTJhd1RvZWNm?=
 =?utf-8?B?M05MSGFuV0FwV1VUTTZXMzhYenpHZzVIU1dPc1FQSzAxSUNhTThGV3ZHd1Nq?=
 =?utf-8?B?NysvaFhLNWt2U2pndUYraHRvaTdtLzl2L2tLbGxRS0k5b0ZOMjRXMS9TNVds?=
 =?utf-8?B?THpUVzRacm1BMExKNHpRTVZnVFkwbkhZUmdLNWNTYkdSMHlyZnV5Yk5XWjlF?=
 =?utf-8?B?di9NelMxWFpEQ1Z1Y25QeGtHQ0szUXBSSEN2ZGx4Q29iS21qY1pWdXhTZVpx?=
 =?utf-8?B?SDlXa202TGF4UWxnQXppbUJja1dHeW9WbzlIejVTOCtJQVJQME9Bc0t6dm4v?=
 =?utf-8?B?UXdiT2JPRGpWOThoTmc3YnkxZ1g2UXd0U05SV0U1NjdURWhWcSsxaWlDVHUr?=
 =?utf-8?B?eDQyUHJCdWlxU2FFYTQ3TWZGUHdQb21sekhTQzRmMllxMVAyeE93YndDQnNW?=
 =?utf-8?B?Vnh2dEEya0hadWVhZkxybW9BSG52RWxEd0JCRlVBZzdTdDFwVis3cXQwdU0z?=
 =?utf-8?B?bVF3aFJYeVhwREMzRnpqYVYyTXdwaGVKYUNLeWd2T3pzQnkvN1JrYUlYUUhO?=
 =?utf-8?B?Z291ZmFOS0Y3NDdUTnpBY1F3bGl1NGNLekU5WVg2ak1uZFF5Y3pzaWw0MENF?=
 =?utf-8?B?aXZMRGk4aVVxNFY2cW9aRVZJRC9jQzNreHk0YnBCa3B4bmJ6V055MHZKSVRo?=
 =?utf-8?B?Z09RMm83b1k4dkR1T0pxaVVhQUNGMzhabEpCZEl4RUlNSWpyTHNielh4b0tM?=
 =?utf-8?B?bHdBLzhmZ09jNDdHR0htWnZJaFBrLzRKU1VJUy8wQlpyL0d2ZS9nTGtWaUZQ?=
 =?utf-8?B?Zlk0Z3Z6M0tUZmJBa0NuNnB4U29wRkttY3VkTnZYYjJXSzJWdDhCOTJJbHEy?=
 =?utf-8?B?eWVrNlNtYlR4cm1rVlVkYUVHbXdWdGl6QWdyRmRSSlE2MVJFSVVUajdwYk83?=
 =?utf-8?B?NVV4QmpXWGN1RHZPUWNQR1VzTWpGMWRIVGZ6MzVjeEZnV1hodUZJcVFMbXpJ?=
 =?utf-8?B?T0xKeVhLWlZBeVlkM0dTV2czL3FGRWltQjY3b0hMaGpTcG13eDRuNGlrbkJR?=
 =?utf-8?B?RS8rekVJZWtNSnRjOUM3M1pjMVZ5L3RRRmd0NTZHcEtiWjZLR3g2aVA3czJ2?=
 =?utf-8?B?RjI2bHhDeUpFYlJPWmZKWDZFa1Y3ck96dDNkTnJjVGRjM2dFMWx2NGNHUFBH?=
 =?utf-8?B?NTlDUEw2TXVxWDRzV3Q3TTAwNzlrTlBrNjZrN1Z6OXl6YThGSjJ5Nmp6NkY3?=
 =?utf-8?B?T2dNdVhWUyswWHgzMCt2UkJjVVlRdjJRMVRIbzRmZWlyRHJaOTlpMjZhOFgw?=
 =?utf-8?B?YS9Idm93K3hDdGlWb2hyS2JyK2NqV25DejhnaVQzWFZwQXJ4Y2FNOXhZTmdK?=
 =?utf-8?B?alFMcHQ3UXZZT3FieUdvazFVWm5wdnJvR2pKdlpRNUVqY3ZxRDhrY05XTU00?=
 =?utf-8?B?ODlqRG1BZVJCNkt4c2xNalVGU3dRbnlrSjZJQi9nN1VQZjdRWkk3Z3hOdDdl?=
 =?utf-8?B?R0MybUVXNmR1bXQwODN4UmtTNHM3ckl6NDVGTTM2WTZMVVdYeE5GUTNRRitD?=
 =?utf-8?B?YVU2T1Fid1N5WDc5Vllpc1JqMTZBPT0=?=
Content-ID: <624128294EF0FA4F8309A9ED92D62D61@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d07b20f-172d-47e7-cc4d-08d99ddbf62c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 08:37:10.2000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dtDjnW0CWEVSDKtjPKx3MFI0MCuU2/jm4snKU0jQimp32R3d98b9iRXiI1K2fL22pL4EACfJ3nzgBOyF+wc63TTfIx4JxuY3+TLQEhJR760=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_013716_766020_EDB59AE6 
X-CRM114-Status: UNSURE (   9.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Richard,

This is the SPI NOR PR for 5.16.

Cheers,
ta

The following changes since commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896:

  Linux 5.15-rc4 (2021-10-03 14:08:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.16

for you to fetch changes up to df872ab1ffe4bd865dfb5956cae4901429004ab6:

  mtd: spi-nor: nxp-spifi: Make use of the helper function devm_platform_ioremap_resource_byname() (2021-10-15 11:58:50 +0300)

----------------------------------------------------------------
SPI NOR core changes:
- Add spi-nor device tree binding under SPI NOR maintainers

SPI NOR manufacturer drivers changes:
- Enable locking for n25q128a13

SPI NOR controller drivers changes:
- Use devm_platform_ioremap_resource_byname()

----------------------------------------------------------------
Cai Huoqing (2):
      mtd: spi-nor: hisi-sfc: Make use of the helper function devm_platform_ioremap_resource_byname()
      mtd: spi-nor: nxp-spifi: Make use of the helper function devm_platform_ioremap_resource_byname()

Evgeny Novikov (1):
      mtd: spi-nor: hisi-sfc: Remove excessive clk_disable_unprepare()

Jonathan Lemon (1):
      mtd: spi-nor: Enable locking for n25q128a13

Pratyush Yadav (1):
      MAINTAINERS: Add spi-nor device tree binding under SPI NOR maintainers

 MAINTAINERS                                 | 1 +
 drivers/mtd/spi-nor/controllers/hisi-sfc.c  | 8 ++------
 drivers/mtd/spi-nor/controllers/nxp-spifi.c | 7 ++-----
 drivers/mtd/spi-nor/micron-st.c             | 4 +++-
 4 files changed, 8 insertions(+), 12 deletions(-)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
