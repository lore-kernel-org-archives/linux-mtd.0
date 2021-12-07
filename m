Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30425C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 07:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cx3/sPdTKx6KnE0PNaUaHjo08kn9I72L2QYTKwdNnhw=; b=eR3KgUP1/126a6
	7zne8EkuZnaHip+d/Wvd0O3/E/u6qaDnmwTNTphGEvY6Q+xjPTS9c4OSUlmz6Z/vnCBndrDyhmG91
	CBHnVgclsE7XvIHlfeuPc35Q1EMHE4WgcojzPKP9CaVtvsAipMtmi6lZcdu8IXcqj4lK9ETQ5Fq73
	0mN0C+GC1wET+X+l8xmGkBFcqoJSQRgqhAolxCKi0TXgoFni+VxqYwb3kJ2WvN4bM8spuljqDRVyi
	RGceb4D4vXJU4I+nOdnt/2N4qwu6fpsYIAD1fZGq0chYDOrTeHo2fFp7fesJU8zrSRBwrmQXB8hFD
	q/LIqbepvOOnTgKLRAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muV1N-007EkH-3b; Tue, 07 Dec 2021 07:36:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muV1K-007EjL-1h
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 07:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638862575; x=1670398575;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RiHNpUwPKsNdjVD/haQnNz+ANcV46t9pAXe9ZFnjf3E=;
 b=un6lctn+UR9KaKQAWGkM86vogEgZsVhQ66+bvNk2+Pbe4nXF8K4UUf5G
 5aui7BcCsFY3K+IiNyxAXZYKbLQwRUEkgI8j1gnJYTxQpviyg/iOddseO
 /pm+lCZepwMhjSrbAz66LzaDytJ8+EOOxnrQuY2r4Zczrajo0faxNXyaB
 F8ljfflJnP8gMhtQ5jOBmx4K8xXQg6CUypiJzx2aLKaTw5dvIugsZAHgL
 7+pwvOOrzL0WBVYETL5YHO88nKRRnZtiyBoWejjQ8AZKgee3Q74m/tOKK
 aKrzJQsTlX8YOKk/vrV6NLHLaXXJh0AQfTPdmWXUftwpodu7ZMJk+NuNb Q==;
IronPort-SDR: MlW+odHOjKUdur3/tWki3U4Jsa7yF0tGd9BA+7KO3czb+LBSC6f61FvhGE/XKByavUbZe2Cmme
 qAsIGjaKh76r84CD/OPZ/QyEKnHW6PFu2AoO8Cltc+2GhXr54ORO9/QoSXr50sFodugQki4HEu
 Bsb+cVOJVFpk7nAvHgbA9DGSzt8OoXQZlgb6n2q9KAiDQ//zqUaGvBllQlatgyyAo8wyzCR4gZ
 RUJ+cj1SnNMiiwmqpbJ0xVR90W661nAc0dzIK7D9u6r/E2xMpzgWK3ODMJWfvrvbkN2wZMDvvO
 rFCC5aFKwfeUCJEzeyqIMrHk
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="145764017"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 00:36:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 00:36:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 00:36:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNdO1RdJpZT/TS4vE6/DhMRo+zdDG6KazDZhVeORSPYs3rxN/my13o7KSSrRG5EDvH2aIshTZhvYxKkcGfsrxfY6VAf1md7vW2D22YRloAWgqb4iQNZU/oFLz69ZDjozBs510RoF4LtHyH8PAOUgCPx4Wv9K4XvK38s2Wkrl7AFIdfX32c2w1y87HQbsvEsjcCPU+pplVd1zKIbf07ds34tpESI3HbpyG/Eu7MtqxylaG+aTcpJ4Dvkv6ESIPntFWsIHDSbopabaSJTaE+irmaTaBe3rhtepRe4gBcBNE+tAPO8ATfm4dp39xXMJcL0ojpHlG/Absim5MSLXRQNKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiHNpUwPKsNdjVD/haQnNz+ANcV46t9pAXe9ZFnjf3E=;
 b=fFijtPLKf6ojTu6PGPIJbKrTQc48a5y83SWpAz/XLSq9Fw/o3cxW7jKV2qa47Ocans5ftLdUaYrmGwEbrBuQL/trM1S+T6YWuqSfNeYtQwEJGkZt2qaKVUFjPod78QefGURzCQad6STvOJ03icKQ6p6EiLfzcyOabDhOtqm1tEz0Srzyo271ui1xcyB7nyNe+HU1EjKHiCYgPLnwfPGqVyaMgttbKte9UpXbq8XCroC+5r2/BwcAT6pSj0c6SZUCVIJEJ4qKtPtbbjjSr/oYhLjDACquQbeA9+pkYAJwNRPOpZDP5a8/ID2JaZPPcYy0N6x0H0RlyofoE4h8gd7Aqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiHNpUwPKsNdjVD/haQnNz+ANcV46t9pAXe9ZFnjf3E=;
 b=NGHd/I1PuAV7QB2QoGbvTWaooOa/d2bjJ6et3CJSAqBlwQkzOnsDVuQFieEiKpSGsh3tP+OPikciD7CdmF97TGJ3MsDSgPItBpt3gKkwmmCswq6+bXUxs66W2Mdrc2Yb6s9/9EUi3NsGG48VuOWxQULGUpPAs+7XSmozpXxurPI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3295.namprd11.prod.outlook.com (2603:10b6:805:c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 07:35:59 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%6]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:35:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <thomas.petazzoni@bootlin.com>,
 <monstr@monstr.eu>
Subject: Re: [PATCH v3 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Thread-Topic: [PATCH v3 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Thread-Index: AQHX6z0TCMDia/NjPUS/CLh9E6BmLg==
Date: Tue, 7 Dec 2021 07:35:59 +0000
Message-ID: <0d97a420-685e-5120-3c09-d433382c02aa@microchip.com>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
 <20211206095921.33302-3-miquel.raynal@bootlin.com>
 <20211207071406.c2ajc3shqybevvjj@ti.com>
In-Reply-To: <20211207071406.c2ajc3shqybevvjj@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95c48b20-8381-4845-8c24-08d9b95436b0
x-ms-traffictypediagnostic: SN6PR11MB3295:EE_
x-microsoft-antispam-prvs: <SN6PR11MB329552FEBC98FC92CF6EFD91F06E9@SN6PR11MB3295.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qlh4pwYkjLCz2JC68A8d0nypVzCW/6sElMfVCYiHy0RSAtwxQeNFW3LPmyPLeDcXH26rerJan5EtFXkVb6mklG31MggikZ8dVvam659hrs+RLa/dwSbIv0QY/PVpZK+EgQvVr/dOqwgeAbwW2Y26SdHDAhJ6jK7fj041d30Qnzxv4f4cCJVhDFu+skVxsfYurbEB24M80ZECrRXdsj5igdVreWr+upmajKcz26lzOhHrCNFX8jgLESLT2FcN4pgH4Vjdhx3WgIUmSP2AowvsLhkWvNXHnHhbtlqIhGe3SnwIqgWwwxzmOVteiJcp/uihrTe1pOz9/vOiQdHBkzqriH6WrsqPlWvT9+cCVucRZu7eKxFHaF6pFZucNYHvxWBmuwKiK0jANn0WWskGtX0/4AFJ7SPppOxSFmV20VG7HS9TdRrV6dt8ANWtJQOuBbxXrUifKxB3kSw9QoV3Va6vD1rG9ubodRXmiSWWii+rtcskSeYl+ihxUqSqQiIFm7iaVtaSYrQ9SED74so4qx/OKOSPx9V/PcjiQrjhytFYo25jpdjPX6WKFwla5Ig1QOf1YF6gJ2evMaCPynIdqyWAmsgdNXeadAXQ5Y6XvUTdiM/J+OEXhiSs8hywZGGhMhywxUWdZxjRgJrJ6y7ZQevCN8cZZkYbpGHVlqcTUUFV4oNfqifTTQ2e827yInF46DTuaBB7LigLrHui3l0S7f5OJDOjB2Xw+C9Xez0TF9ThEOXRxPYOluSq3qPU9TP6Xbr4pRFGFIgQaMMkZxqzQi0u8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(8676002)(5660300002)(31686004)(31696002)(2616005)(2906002)(110136005)(38070700005)(83380400001)(54906003)(86362001)(316002)(8936002)(66946007)(26005)(508600001)(64756008)(66476007)(66556008)(91956017)(66446008)(122000001)(7416002)(6486002)(38100700002)(53546011)(6506007)(71200400001)(4326008)(6512007)(186003)(76116006)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmJ0V2NrRUh5eVZKMjJCY1p1Q01zdWxqWHMwVUZRZVhSNndDM3d1L25QRXRC?=
 =?utf-8?B?ZnhLeWdhdmFlMjQ1SzlNa2ttN1BibVJucUNtQzRmSmJKSUg0UnhXN21VVGZB?=
 =?utf-8?B?MmJrMFdaWGtVTDVWM2s5cUU0NkZTWS83SHh3aEpYbDFxbzhJNTA1V2FFV1hD?=
 =?utf-8?B?ZGhBbndVc1ZpY3YxODdDOTlVamNhWXVjUEI5MzBGTUhDL25vOURvTWRsNlR1?=
 =?utf-8?B?Mlc3Z2VCbzZEN0JqWll2cWdJV2tQL1RzSjhOdVZkMTIrNTgvTUdBdXVuai84?=
 =?utf-8?B?MTJ5VlpBOEI1US9oTmFMdGp0b1ltRUowampkSktKR2ZlYUhPczJjZW1PaXRG?=
 =?utf-8?B?L3VXalJjS2dDNldGNDhsTVpINE4wR0ZhRXp1am5xNzNkZVlvTFA3NU9ka054?=
 =?utf-8?B?M1hxTmMzSDE0V2o5TVVDU3E1cnM1Vy9EblNyM282MXFvcEF3MmVkS1RndWNK?=
 =?utf-8?B?M3FUQ21SMEplbldkcDdjZ2N0Ti9Ua0llZ1AzK2xiS2NNNExNZENkNFhnS0Jy?=
 =?utf-8?B?NzJ2MWR0NU9yWVFweTVvb2pLNHdHOHY3c3pDZ2NxSzJIVjdnSndsYlhVdFZr?=
 =?utf-8?B?bXk3cVZGTWFub2x3UFd5eGIrLzJGTEdEZnFDRlNwWXpaNWF2SldKUkQ5aUIv?=
 =?utf-8?B?YTdLUURjZStVcWVSbTNlaHVMNHR5ejA1bmo0VExLNmo1bmlmdE1UaHNJSlZ6?=
 =?utf-8?B?a1Z5TXl1S0tqNUdxWjllMDNHK3BzS3djSkQ1ajJJTFFQSUY2WllobXgyc0JV?=
 =?utf-8?B?MUdUMDlTQmtGMFJ4VkhRTWNTUjFDcGd3MFNFRjhMMXU2WVgrcENnbFJsZmhH?=
 =?utf-8?B?cElZc21tekVGVHhTaEIzQ0ljNzVPSUpIakxtdXkxMDRjZlBLclIrNXBZb3M4?=
 =?utf-8?B?MnBESHJUMU5OZExPZVNGRFFsZzhCN3BKVnQwVk84eWdranZWSjgraFFCVTR3?=
 =?utf-8?B?SmZSNlBBQzZhV1BkeG5EM3k0T09JWWNnUHBSUGJoKzY4d2F2bmpVS2VXOUVm?=
 =?utf-8?B?NHdWVGFTcXRtN2h0bW1ISnVhaXVsWEx4YzhTbmkwampWRkxVYTc0eVdGRWVD?=
 =?utf-8?B?N0o3UmhTQ1Foc1FDZG96aDhnLzcwT291amRTNk0rOFVFTnZtK1g4REdoSEJR?=
 =?utf-8?B?eWsvWFZjR1NiSXIwSzN3UWtiNDBFWDF0ZnpmdmI3WG53RDJNK2NMN0doMU5N?=
 =?utf-8?B?T2N2amIxNlJTNmxZS2Ivb05YRkMvUzAxN0FqOFhobUJIb3NLNHNrVzRSK0lY?=
 =?utf-8?B?S2Z5dm9rb1RTSGQxTkFaQjRXZGNDU0VtRjZEVVdsZ21xY3JvSjV4NEs3c1V0?=
 =?utf-8?B?dkw1UU9nOXl3VDZpbmZCMVZjWnpkNTBKSHpyeXRVVVAxSHhqZ2c3NkltT1lP?=
 =?utf-8?B?SUhJWG5vcWRWRnFqQ2FueTczTnZqN1RNSUpEakhPc2xwRUM1blRvaDdSbUZD?=
 =?utf-8?B?ZDNHMGN6TDJyTGFhTmhkZmI0MXVCaG5xSGl2Mk1tbUtNRHNsK2tzc1IzWTZN?=
 =?utf-8?B?bDRLeStJeWdwRUhhMlhCUXVYNHZrQUFyQndPRkNGMHI1UXhSMm1ITmlpM0d6?=
 =?utf-8?B?VVZDdURuelNWMDlhZ25MQ0ErTTFGQUZ0TVIvWVl5ZmVhdVU3L1lGaitmVkRG?=
 =?utf-8?B?SWZmNFhuKzB0WllTK2VaK2cxd1M5RVAyMlZFZ2hWUDVNVmdlVW9EZW1ibkRL?=
 =?utf-8?B?d2txVWZHN25waGlHcmxENi9HZ0cwdlNnTE5nRHAxK3lEcXJISU5yZUVELzdX?=
 =?utf-8?B?MnBHMFZNNmVLUFlNdWhxOXUyeERNa1FSUGVyUE4xODJsdTAyR1Rma1lRSlE5?=
 =?utf-8?B?M3N6R1Z2RWt3YlFVVjJaWWhHN3lvRzZwcUx2U1hneEU5bUtMMGx1K3N1Zzhm?=
 =?utf-8?B?bzhhWTBTY1EzdmwxNTJtYndOVHlKOVFPcDJHYzBFSXU4MCtuR1ptOHNENjBk?=
 =?utf-8?B?dE9OanE5ZmhHcjcwOHdOYVAvWnFRNG8zQ1NSVHlQWmJ5QjlxL2M5MHFDSWxQ?=
 =?utf-8?B?eW1uSTlhY3lYZzFZRXp0YUJOdldWcUtrVDlVTWNJSmJFQmNnTmRtOHNBbzJK?=
 =?utf-8?B?ZmkwWERXa2swaDVHclpEWjZUYW1sZDc1NHBNQkZFQkpQY2tWT3lmZU9aV3Vz?=
 =?utf-8?B?SDBHaEttSm5nMld6UzZxSXlLR3JlV1FzVDVLRjR2YmNIajR2OGZZMnptY3dU?=
 =?utf-8?B?dFZuRnNub28xQzg4aXhhSkZFc0NDbzJqVnBHWEJEWDhsNy9KNkhmNmlmTjhS?=
 =?utf-8?B?VVpVWjFDcVJ2NUxvOTU5S3BWWEdBPT0=?=
Content-ID: <381A41F75D84364FBC0E1EB5D821D6AF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c48b20-8381-4845-8c24-08d9b95436b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:35:59.0997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqyASI4kfQ4n94axkdy1M2bp40eKGuywMJkl8+vUzCieXYnkynz4Tic3t48oWziA78E14uHb2NKB/xCK8ct+Ycx0vxY3gjQ/Wwa+Zehz8Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_233614_139739_82817FF7 
X-CRM114-Status: GOOD (  23.36  )
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

On 12/7/21 9:14 AM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 06/12/21 10:59AM, Miquel Raynal wrote:
>> Describe two new memories modes:
>> - A stacked mode when the bus is common but the address space extended
>>   with an additinals wires.
>> - A parallel mode with parallel busses accessing parallel flashes where
>>   the data is spread.
>>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  .../bindings/spi/spi-peripheral-props.yaml    | 21 +++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> index 5dd209206e88..13aa6a2374c9 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> @@ -82,6 +82,27 @@ properties:
>>      description:
>>        Delay, in microseconds, after a write transfer.
>>
>> +  stacked-memories:
>> +    type: boolean
> 
> I don't think a boolean is enough to completely describe the memory.
> Sure, you say the memories are stacked, but where do you specify when to
> switch the CS? They could be two 512 MiB memories, two 1 GiB memories,
> or one 512 MiB and one 256 MiB.

If the multi-die flash contains identical dies then the die boundary can be
determined with flash_size / number_of_cs. Are there any multi die flashes
with different types of dies?

> 
>> +    description: Several SPI memories can be wired in stacked mode.
>> +      This basically means that either a device features several chip
>> +      selects, or that different devices must be seen as a single
>> +      bigger chip. This basically doubles (or more) the total address
>> +      space with only a single additional wire, while still needing
>> +      to repeat the commands when crossing a chip boundary. XIP is
>> +      usually not supported in this mode.
>> +
>> +  parallel-memories:
>> +    type: boolean
> 
> With this I assume both memories have to be the same size?

It looks like the assumption for both cases is that the dies are identical.

> 
>> +    description: Several SPI memories can be wired in parallel mode.
>> +      The devices are physically on a different buses but will always
>> +      act synchronously as each data word is spread across the
>> +      different memories (eg. even bits are stored in one memory, odd
>> +      bits in the other). This basically doubles the address space and
>> +      the throughput while greatly complexifying the wiring because as
>> +      many busses as devices must be wired. XIP is usually not
>> +      supported in this mode.
>> +
>>  # The controller specific properties go here.
>>  allOf:
>>    - $ref: cdns,qspi-nor-peripheral-props.yaml#
>> --
>> 2.27.0
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
