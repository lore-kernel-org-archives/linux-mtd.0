Return-Path: <SRS0=sGI+=HU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EAFC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 09:28:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68E6964D79
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 09:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68E6964D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=18m7RqfFrVpl/Udlnyuiqk7QRYtJddwDXDhJlGb2mHE=; b=kdUQvZ5oYaV/q6nIKcyu1EcFm
	3lf2yQxjPzZKceXJiLVGWoBbPdSySfjlqwLm8iTUjirUPBwnmFLQ9RqzGdSuKaDtJrI7bb/QiBWlT
	bQNzr6m0kxUpNGTz0HtzIrpMQ1Y0DONzD4TGDLjZllHYfquSsVNY7XG5bVITBTFAKtjpKK4BtuCeF
	+oqWDlCO8e/7oaGc5FZdumFy+iWXCTLY16wdMXwMe0WiJCkLID3S7Th2RlaqeMQmD7o8cFBiGq1er
	LU313TLY/4KJ/9QqQLYvWxTEIFPk8hTWeSyAs6p6exxV+MizsV7/gB8HbOq7DKjHzPgrZBECvLg9/
	NPmpYlMEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCfbD-0004Xj-HL; Thu, 18 Feb 2021 09:27:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCfb8-0004X9-RV
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2021 09:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1613640466; x=1645176466;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sndf6cTeHgkjg0Hg3xd4yD2d+G/Fub75kNwU3TN4d2k=;
 b=HJz9pimasoCVgsniLu/2zlCSyCahSM0XfETX8BralcaVcwIoSSnFSrKy
 mgyTEAeoJPZ4KCIEv1oilpbX+BPbgVpzbNgeXY9wr8n7lPWHsGyvK9IAf
 X7Pnu/EzCdGmhre9ApYtHniHwY+YTexpOT1Vxlt7pPMxRAc4NlfCMADQe
 LoYjmeZ2gRQIzSu38rzg/1E0L4dunvMuC1TGHsqKmLdtEr7MTFPosDZ5D
 5QOWm1VqXyTH+DCIoiuPMce/CAaEYvAdT8re6rmgTv0TrGHX7q7gh2s0V
 FW7cto9Rs0ikNA8yGacfmlsu7zD/M5CiN8BvTvLOaOQez0dxL9feaLyP5 g==;
IronPort-SDR: HMIw/Kexh7+659mCarScbyZNJq5Ytw1mda8WL3BN8lzBSsBoX51SjgqRVb4O7NzvJdw2W84bh7
 714iOrMqzNQkNqpk4JV+2k+wG2N9OK7URQ+4Z3/vHSCbLdeYPHcvdUuuG+OeQ4rPSVphIhoBNQ
 MnivdY9vMd9PH6WB98uGVnZCTEo7ObdmDHbes1DFrH9okAbpJxukYCREg5swsFPsYOv1kxzbyV
 rzkG48yZSSVQ6FHCFmsc2JYqF4r1jiMXlYvRviPyTgF34yku6EdzTosRbb7IAfcO/XNe4q7gc9
 zaQ=
X-IronPort-AV: E=Sophos;i="5.81,186,1610434800"; d="scan'208";a="107088049"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Feb 2021 02:27:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 18 Feb 2021 02:27:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 18 Feb 2021 02:27:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiaSnrteg5dUlt2JriESlHDcBVVSw9vyN2FbTt14CGqk/YoTEcGw5G7ett9fYwRe5QS8BNV3Ya6a/UAAUfl06xReYWNK55EDvOX0l9ykR/TTZUKxTicvV+E/DxBDtLyrFx1RTGUuRgWzACczga+4ZcFRo2LAc5GjYrB6LHqMgVrp05i41O28KuKA2SA7uqKhGzildY/7AeEoPddz6gF2z2fXZeSqzcTcvCJXfxpyJLbBTHJUBKjIE0lDTS9RUoreeDhNeFz9ttMRfpyzxkURc5Dtp3mFOu6qrcL4YsQcz3YQi4xtDx91mHUvYVoFGRDAEmwfVPwxqqOIj3zhLIkNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sndf6cTeHgkjg0Hg3xd4yD2d+G/Fub75kNwU3TN4d2k=;
 b=TvP7kv9gQ0uBrY+MU93ruXwY5/zMeYEPfNf0XN6l1heJtJxBnNdOeCJxAqS9kW0CI5ecpaW80sjX0HmX/nz1Q4JdWyvMMDLrHgylFRLg7cg/Ju05iedgp+BIFX5ZZL83uyqv8Y4DHiwDmJldBbA7YG5sVeHfrb6i33Qewn4iGYnlwoJNK+K4upJwuuWROR0JX4065gUWriJjzJg6ziDgn14tbTsIoEExizczoMA+cQFLUnF8+qyVhZp/p3eEXUhUug8j1L/lZVqrqhdvHjyBcv0N3z7km7npmYIC0IRw0VkoF5V2DMgSHUoCvDW7Th27lRtGcQVrqxJUHfTvhVSMmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sndf6cTeHgkjg0Hg3xd4yD2d+G/Fub75kNwU3TN4d2k=;
 b=OgRsXM6wPQhI7b1DGEZm8FuAX5aY/yMaO7lAcEAOqmG35aIiXVURqAMs/hPLMtezU0gr5DO0bP7MLgOsWOMDqbD7wjOXSrWJkN9O+R6K/8CStZwjxY+/Uo/lG5voTNv2gjlVcz1ExqKzk88Zltx3LUbWmoYckCEo0l3Q55jW3qo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 18 Feb
 2021 09:27:42 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%4]) with mapi id 15.20.3846.042; Thu, 18 Feb 2021
 09:27:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <heiko.thiery@gmail.com>, <vigneshr@ti.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
Thread-Topic: spi-nor: maxronix MX25L12835F support
Thread-Index: AQHXBFUKEDYf95dZGkCecCm8j19FKg==
Date: Thu, 18 Feb 2021 09:27:42 +0000
Message-ID: <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
In-Reply-To: <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c58acf58-e72c-429c-f77d-08d8d3ef7145
x-ms-traffictypediagnostic: SN6PR11MB2574:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB25742C527750D9FCE99BD82FF0859@SN6PR11MB2574.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DCEXnwOomCBnSb32H2haMgbrlVIS3BnXShsxTxW4XE2iBpjxU1gpWTE0MlKJrIteKwFrMLudjVo6YXIPmKQoG4apAqs5wQYyI9+PTltrh9UyzRzp/LMLytPTiMdI2XUOFR0uQuzye2qdrkJii7KNMbkUePog+gZEAiydeWwLTb4oENtvxyKgu4VUol1fP7ExLDDy1H6rOn2C69qDCDk9uUsq6txZyMEOuJ42k4njN9X3XhDERvPq4HTyann5WSqRaDbPihq2r9MpijcJhiFf5y7gh7pzXV4nH9lsqB7PdZEttKxLOn99RDczcsFiXUUX7gAQKHTnS2lUQjO9FMfLduqsACrTwDkn65YXzqpDnsmMdJcw4sBKNZnLAY07bB/HX8hGSrNVrp+5TNqXXvboeEnAkPlOwUSi3D/TAkupmC280laNscmzL90bnokQhH9/6LVolnrc1bCotxoqGRnvYB29u7bVXSlIGBSKRneUy36F7SPltlBhsrg40HP8bi8niLl6Wr922VNWOf7uliGCuIZ8K+JI0sj1/QWCqTZhtQCFTAf9rDpaXj931Nl8emIJuTyIEh2hj7uomo8dqU/MJpSXaYIuPZ2Ib/P2mMDccOU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(53546011)(6486002)(478600001)(6512007)(5660300002)(26005)(31686004)(316002)(66476007)(86362001)(31696002)(8936002)(66556008)(2616005)(2906002)(64756008)(54906003)(66946007)(8676002)(91956017)(76116006)(6506007)(66446008)(110136005)(71200400001)(4326008)(186003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?K2FBN1FZSzYxWDk3SWRoODlBRko2QmMxZDRrb1J4aUxlNWdPd0pEWWxFVHFh?=
 =?utf-8?B?NlN5UzNoMmJqbC9PUzU1aEJqK2pTZ0tZSk1RRU82TVQwUlNtWDNBVTI0VWtE?=
 =?utf-8?B?RVNBeDZQSXltVHlUb2hob09lMkN0cXZmWlVEZGhPc044V2RQb3hPVDQ0cko4?=
 =?utf-8?B?d3FJSzlnUWx3ekFOUHNYRnVGTWZrT3JCdnFmZjJyRWpyMXFscTZOc0RNOUs4?=
 =?utf-8?B?NkZDbUhoMGp6ZUQrWEl6NTgwK0haNWJSWktpd3E3ODRBcnBrWDEvYXlxQ2dp?=
 =?utf-8?B?Y3V5RlFIeU8xTjVxSzV0UkM4Nzl3MVFSWXIwU0dLb2pxWmhnamdjdzFmdUU1?=
 =?utf-8?B?MStTWWhFeHlJREdia3VEaVkvQ3AvOURLbHdoNWw2Vm1xNXlkb2JzbjZuTklx?=
 =?utf-8?B?bk11WE83ZjFuVlprRnFPQ0drby93SitESG9Odnd0Q0lwaVY1SjRuR2pTbzgx?=
 =?utf-8?B?MTdUV0lpWm1PVFFGQVB3dFpuanRPcWEzWjhvMHVJNTNwMnhaQ1hCVy8wd0xN?=
 =?utf-8?B?dWZJK1dNOTY0N3Bqc2ljQmJLakJ1bFFmVlQ2anh6L01tekxiaFd2OHU0eVpH?=
 =?utf-8?B?cUpyc0ZGVXladHc0amgxa09MeEJZUjU3S3E0Mk5GK1dlOGwwMW5xVjJoUGlB?=
 =?utf-8?B?cmxrWmVyaDBlMll6Vk1JVmV4RVFGZFEzRnZIYWtINGxVMENMdGZBQzFaSGNF?=
 =?utf-8?B?Z0NwalNrZy9UN0t0bjRtRW93ZUNaTVBncGNoWHErV1d5UXExcXBheEJBMW5o?=
 =?utf-8?B?Ny91U0FRK3RGc3pKMFNlTnVzWk1YaUFka1ZIWTI4NktLeVdEMkx2akRib2p3?=
 =?utf-8?B?SU9GMkswMUJDdytuc2tnMUFTdkY2L1pwREpENnc2UkY0Y1hkV1ViOXV2M3pD?=
 =?utf-8?B?d0hFU3g4MmhjNTlISFgwWmRJRE04WEp1Mm13T1cxVC9xemY4ZFJuNjBtTTJE?=
 =?utf-8?B?M3oxa0FMTGdSMEpZMS9maTFNS1Fjc2Zjd1dlL3hhd2crWnFvUTFSRno2RkhQ?=
 =?utf-8?B?dmYvYXlOK3dCN1lkZ3lrbUQ3YzUxbWpDK1A5Nk1rN2psWDBKK3dpSmdodE9U?=
 =?utf-8?B?MkNwUmpIUUhXYVlVUjdlb3NHVDhMaVZOMTFwTGpxck1pOXkyM3gzVWNQdWpH?=
 =?utf-8?B?V1drRG1Cb1VyN3hpckhuZ0V0S0d3SEZNNjVlUXhTOHZRZTZjb2Y0Q1N4eTVH?=
 =?utf-8?B?TjREc3g5REw3Z1h5V1ZZWWdYeVUwU05UWGtRTkw5M2RyUFkyNjNPYkFGUG1p?=
 =?utf-8?B?M21aSVZWZDE0bmZFOTh4bUppNk01L1E1bDE1REdiWkgxUFdsUDhrV203ZjA0?=
 =?utf-8?B?UUV5UnNPbWFqcUpCM2tCcFZueGxMNjZiM1BPd3VPaXBEbHNxckR3Ykh0Rlp5?=
 =?utf-8?B?N3N0U2Y1RFVXMTZFSlZyTU42Tk9lZFpzaUU4N3B3OXFRK3BVVUhzcUN6eEVZ?=
 =?utf-8?B?S1dCVmZLMjZFT3RydU9wWEUydTFpd25yNzJLdDVGKzQ2NStOSy9JYkRxL3N0?=
 =?utf-8?B?aklCLzVMQW5lWDdleUR1Z3FGN0xqa2pWR3U0c0VZempheE5PK1FQQjl6WVVV?=
 =?utf-8?B?WkhIYSt6Z0l5TVBkeVhjU2FnajZaNlZhZTg3Z2lsTU9FdDAwbVRhZlVHL01L?=
 =?utf-8?B?YnpncTFkeS9PYW5rcytPZ2hneUlJYWJScU1UWlNZNkdCWWF2clBrVlo2WnBS?=
 =?utf-8?B?ekF0VWdwK2htSHU1RFVjZjcrMkVBcjh3ZlF2SXZ6b0UwYzdnWkcvQmc4Vmd5?=
 =?utf-8?Q?GRqYuAcbHbYfWt2f48=3D?=
Content-ID: <7D0D26755A7A774EBBB2E8FF5D735003@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58acf58-e72c-429c-f77d-08d8d3ef7145
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 09:27:42.3034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4tdR5XTo1rAUubcwBtTzRjkF9ioY0/XkgGb7JwaY5PON/LATZ7mrLZntKs5YZ0QjMvZW7nAFXpCZvOwP5arXoSQml5hpZDy8C2zfb9cXSIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_042747_254729_806487EB 
X-CRM114-Status: GOOD (  27.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, michael@walle.cc,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

+ Vignesh

On 2/18/21 9:43 AM, Heiko Thiery wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor and all,
> 
> Am Di., 16. Feb. 2021 um 12:15 Uhr schrieb <Tudor.Ambarus@microchip.com>:
>>
>> Hi, all,
>>
>> +zhengxunli, juliensu & ycllin
>>
>> On 2/16/21 11:48 AM, Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Am 2021-02-16 10:27, schrieb Pratyush Yadav:
>>>> On 15/02/21 10:53PM, Heiko Thiery wrote:
>>>>> Hi all,
>>>>>
>>>>> I faced an issue with a SPI flash on our board. We use a macronix
>>>>> MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
>>>>> the MX25L12805D [2].
>>>>>
>>>>> The newer MX25L12835F has support for dual/quad read mode and RDSFDP
>>>>> while the older doesn't.
>>>>>
>>>>> I thought that I could do a fixup with a device specific
>>>>> post_bfpt_fixups() call but by now this seems not possible. The older
>>>>> MX25L12805D has no flags set that allows a call to
>>>>> spi_nor_sfdp_init_params() and implements the fixup.
>>>>>
>>>>> Has anyone an idea how to solve this?
>>
>> Maybe macronix can help with some suggestions on how to differentiate
>> between flashes at runtime.
>>
>> My first thought is to introduce a SPI_NOR_HAS_SFDP flag. For the flash
>> that doesn't support SFDP tables, there should be no functional change,
>> for the one that support SFDP it should fill the properties from the
>> SFDP tables.
>>
>>>>
>>>> The post_sfdp fixup is always run regardless of whether the flash has
>>>> SFDP or not. You can try putting your flash-specific fixups there.
>>>
>>> Well the problem here is, that the SFDP setup is skipped though the
>>> flash would support SFDP. If the jedec id wasn't already in the table,
>>> there would be the flag SPI_NOR_QUAD_READ and the SFDP would be
>>> parsed. But because there is already the legacy device (which likely
>>> doesn't support SFDP) it really doesn't fit.
>>>
>>> Its unclear to me, why the SFDP is only parsed if one of the
>>> SPI_NOR_*_READ flags are set.
>>
>> My guess is that a new SFDP flag was not necessary. SFDP defines multiple
>> tables, but there is just one that is mandatory, BFPT. BFPT defines DUAL
>> and QUAD parameters. From the spi-nor code, a BFPT without DUAL or QUAD
>> support doesn't make sense, even though DUAL or QUAD are not mandatory
>> in BFPT as I see in the standard. So probably it was just a way to avoid
>> adding a extra flag. We have to check the git history for a more accurate
>> description, this was just a guess.
>>
>> Thinking loud, now we do a static initialization of flash params, that
>> can be overwritten dynamically by SFDP. How about doing the params init
>> the other way around. Try first to dynamically discover the params via
>> SFDP, and if SFDP fails or if it is not defined, do the static init via
>> flags. That would spare some code. And new flash IDs will have less flags
>> declared, and we'll better track faulty SFDP flashes.
> 
> I am a newbie but it sounds reasonable. I made a first attempt and

Let's first see if all parties find the idea good (I'll have to double check
it myself). Vignesh and others might help.

Until then can you try the patch form below and see if you can do the
reads in quad mode?

Cheers,
ta

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0522304f52fa..718d0b75df91 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3099,7 +3099,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
        spi_nor_manufacturer_init_params(nor);
 
        if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-                                SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
+                                SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
+                                SPI_NOR_AIM_SFDP)) &&
            !(nor->info->flags & SPI_NOR_SKIP_SFDP))
                spi_nor_sfdp_init_params(nor);
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4a3f7f150b5d..3495549815e6 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -338,6 +338,11 @@ struct flash_info {
                                         * protection bits. Usually these will
                                         * power-up in a write-protected state.
                                         */
+#define SPI_NOR_AIM_SFDP       BIT(23) /* Try to parse SFDP. Used by flashes
+                                        * that share the same JEDEC-ID, but
+                                        * where a flash defines the SFDP tables
+                                        * and the other doesn't.
+                                        */
 
        /* Part specific fixup hooks. */
        const struct spi_nor_fixups *fixups;
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 9203abaac229..1ebce775eae4 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -50,7 +50,8 @@ static const struct flash_info macronix_parts[] = {
        { "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
        { "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
        { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
+       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256,
+                             SECT_4K | SPI_NOR_AIM_SFDP) },
        { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
        { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
                              SECT_4K | SPI_NOR_DUAL_READ |


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
