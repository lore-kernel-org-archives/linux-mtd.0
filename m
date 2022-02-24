Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC69C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFVuFayuBVKTfLMFJ4PViUXk2Jpw5Bb/9/XEgvs4NDo=; b=jqh+T0LshzzfXN
	VRhD9oEh23RaAtCQK2+Qvw6g0EW9pY2Yh6J+dOwTURJjYiqiu4rPqRlls96SsTeZbYRe6+Ew7gt4X
	9Mpcmbj61dbLydspQj4D1TSVHsselwgpmD6OuP5NGDpyfdGcJ3Z3xptPfwATH2cS5UFTzickq4XnD
	1PmpADf/osDnWcXI6T5nD4fdoDX3kwQgA3msczW1Onzh9kv4RX0C6IRG/dGDBleYRsLvGhzDfsGQb
	IzqsVRUN6OSYe24zqJTgfXItMEkdV6dilVqBP8HQ7Mat/zGsd8JhUFckmM/VXVYD1ARLUs4M/SMq/
	qyXri0bHCJ0vwwq225qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNFBu-0017vf-1i; Thu, 24 Feb 2022 14:33:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFBq-0017uo-Ct
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 14:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645713234; x=1677249234;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WZtgLt1LHVDBKogRnFY2YyXHZbaqr0rlHHXvDwhZ+KM=;
 b=OiHAV42DoeW0Id3TSSyc0vi32hNBM9sORTidnq21Dt/RSBoifXvtE3e3
 YCrzYjrk8cBz2PJ+58GFSNcaMsF7o6SejrSXMc+FGlhm7nfk4fYnLJgSy
 RfrqwAkqbhYf07+iHirR6sXPxn49veRgBTaHfKnRg0crmAXvz+QoYqZQN
 cC812iLi5Hg4Ni3rzKvSGQL2U/qQ91khlmfoReyzcj9cc8AnVPmQiJbik
 DdHF+U6f0bpPPPJkPtU+KNFJN9ssn3bjOHp4ncH+QC7Q9xutH68OJ/oge
 WJXA1M8/UW4i4gqtJ4+BoPVoOlw4L7uY1aOzwdX03gMxmz00T5oakeIjF Q==;
X-IronPort-AV: E=Sophos;i="5.90,134,1643698800"; d="scan'208";a="154761745"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Feb 2022 07:33:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 24 Feb 2022 07:33:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 24 Feb 2022 07:33:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYetKFzsSz5z24KmJyAsu32E921IdGmpfmW/Qy6BfET7duOQNJ1EK9OUapWHvZj6Xd2qWVNP1We0biPHeKP7P6fgBAWF2xu7GeKazibI3zTc8Y1Qr99Fj6MJcSshEjsTqXjpSsRlHpUAxRVuIFrgjQhA4WAIqqx5Ommgo78hWtqPFdyjFfGE5zFmY5lQh+D3Y6zD4sVQR1VKFIYpGqmYy0bqSCEkMJsuaQJslUr1wGzVmwKqC4qD9ZPUQgBLU47lBXAHXcE4URt0icP3P3Ki6mF4WrJ8IuVwsjR2fYf9mEFWIyd/IXEqblYG1YSDqDKYISYaYgnNUbM5o1CoqJ8pdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZtgLt1LHVDBKogRnFY2YyXHZbaqr0rlHHXvDwhZ+KM=;
 b=EdbxiZmI4xLaXwqwkfANBzfTcfNqBSvYjZ2WiKNpF8XwGhG+UFLFZzoBtdbppB6i3VvV/V3KXMOdvymxw0QtiqTewTqIruW/h/8TQrRnj+ipaDLi4q7kmp3qW88mCRcvWpkw3kgoA+DAkSW1qBpTaRG3D6e2r/uHBj9yEjrfukt5Eox/ObNA0tzC+Njc5eSwHsZzP1cmixZmXGT89LYe5i8Ny9olv1FHZoy6vBz0rNwkfLzCpAtQGg9Gu6Gxtio9GPnRx+G7gusnFIdcRuo37PiDWZmhFt14XCshDBp+2SpZ8CY74EFThXQMdGsxMyr1Kk0yjY6rDwziN7cBrWHDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZtgLt1LHVDBKogRnFY2YyXHZbaqr0rlHHXvDwhZ+KM=;
 b=k4bHL5MLrV1rsEwzHrEtis5dVEul5F5c6SpJy2g03+gMtlktKWwflZKRoj6hVy+s9PSzALZVSZleqSZ29oN2lgyG9bxLCsG84gFjkJaHhWKW5cHaexDVRtGvXvPEbkceva1eo1TJ5JAonl6bI05AcZ/TYv4dkeIK36FPVAfZoWI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CH0PR11MB5492.namprd11.prod.outlook.com (2603:10b6:610:d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 14:33:49 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.025; Thu, 24 Feb 2022
 14:33:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
CC: <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Topic: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Index: AQHYJ/PF9hATniilJUe3fAFeGB3/Dw==
Date: Thu, 24 Feb 2022 14:33:49 +0000
Message-ID: <a7c9919a-b2b1-df80-51a3-e62e1a7a77be@microchip.com>
References: <44f655d027b49b87065915f6ba2744d2@walle.cc>
 <81d7c569-d6c2-9167-e007-eda72f34842b@microchip.com>
 <23fbbf2dde387e3832b4ca23d46816c0@walle.cc>
 <7cd74ef3-5a7d-4e65-3436-ee3399ca56a3@microchip.com>
 <e39d06684b8f3a63103f40f0e99e030e@walle.cc>
 <3cd510ad-a6ab-d4a0-92e3-9156a0c7ddbf@microchip.com>
 <20220223183849.xcwciv2ybnkdnauk@ti.com>
 <6eb179ec-0b12-de30-829e-83ec6b964f21@microchip.com>
 <779069a1-7389-ab70-9f03-81090d0600ba@microchip.com>
 <a85e2d1862cfff477e97c39509b2b74d@walle.cc>
 <20220224132440.pi55jefug7ntzgjq@ti.com>
 <fee24baf231332168457d5d21e272665@walle.cc>
In-Reply-To: <fee24baf231332168457d5d21e272665@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37b4b52a-2c6c-41f0-7740-08d9f7a2ac42
x-ms-traffictypediagnostic: CH0PR11MB5492:EE_
x-microsoft-antispam-prvs: <CH0PR11MB5492F62EF4160F59EF3298F8F03D9@CH0PR11MB5492.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 62/j3k5z+sX0hGx4DvWed/GuoFNg52IInvYbtIeVyg30dwZDSgtXm7EgF77AWXc0Vf1kSK8zTB/WGD1xASjQp5Smruiw8HQaiLmSTpPu2RGupqq3mVxB6ZGIUqxWmtlcPLJ/y5GmqBF5bjhWqDC8nLXpHhqLZKVY+J5uuJNuTRJsXEdaVbqL15CF2SEgXTku1mhiRVVor+U3JUuVQqv/8UR4lmszeueG9nWPDx9DBj/bWnj+DvP0Wm5yHQInESqYMVULhW6C8b0aB52eE2rA/s6oqu99lX5+DZL4AfK/+V0Tk2H/w2yxlOlSlGYoHcslHSUZBmU6hbgh9ftvbURXz6e0dkiIoNCBbOmRSOnHxy9OYw9BmMj5Y1v7yC0Qb/7s9tHH5J9rPpy1Z+sUr0SpgKULsmgIrBOTfxsVfzvWssYwRceekmEc0+1L8+PdnhHtWsoP93SVs4OXlw2lYCd0FS4/GS1adIIklOf/2bLN0IIWTv2rlkg3u7F66TAVsqXOGMDOW4jajXxRfLoSeONMaLNzl68WyPO3GyAwA60yeKc8nUsQ7zffBQvaC6dgJ+QQOdcV3LfW0/oB8GdTIWd8afHLBM3+cxvdMij/Qhd2kfXSrI2xdSW7taBqBKmvrmp3QjgR1mfBWCqOQ68TKGrc/U1Y4vbzLLuCZbPJoYzrnJ4WxCqI9qYdblBAvk3nbKthcy2CniaQrFVgL4RzS94EZoXBYxJnswuPJefM8NdIZYRH0uKoGlJbr6JiP8dZKsFI471PfqDisxuQFKzd9o+x8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(66446008)(76116006)(66946007)(8676002)(4326008)(66476007)(91956017)(54906003)(64756008)(5660300002)(6486002)(38070700005)(2906002)(110136005)(508600001)(86362001)(31696002)(7416002)(316002)(122000001)(38100700002)(83380400001)(26005)(186003)(2616005)(31686004)(36756003)(71200400001)(6506007)(8936002)(6512007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVl1ODlRdG1DMlFDRWh1L2t5Y2oxTmJTT2lCQkhla3llbzU1Wk4wemF6ZURG?=
 =?utf-8?B?eFFzY09HRG1rMGlwTVlyV0w3Kzl0c1hGV0MvaGJzVFFWelkvdjFQYmZxTlEz?=
 =?utf-8?B?eWdHcnhEL2wzZVBVN09OUHVkeG9WUENmcnpERzFqN0xwRE9IdzltMTIwM1F0?=
 =?utf-8?B?cFY2VnpnbW5MZU1MdlIyQjdXYzdJTWdSWExvbGQrcVRrR1drM09aYTdZR3FH?=
 =?utf-8?B?dXBwUVNaVnJMaG8vT3dKYzBBM3VBVXJ6Rk4yTHBlQU5PWk1oRlZvOVFDTE5a?=
 =?utf-8?B?Rll6WHRSTHRYaUpoVVZPU3FSbTh5b3Z5alAyejdKMmxKcEJobEhCbk9FNHBv?=
 =?utf-8?B?WGdyVXZWVE1lQ0VaWnZRRmhMRXExWTJVcW9UZHNyQTduTFZyRGZtZmZGQlBJ?=
 =?utf-8?B?TThzcXp2NDk2TjdPVStnSThuQ25YRnZnZ3RiME9JTlhVcDAvVEloYUpRVUxV?=
 =?utf-8?B?Tlh4T3psSWRMS00yaUFKNko4a1AxbW96VWtzTUMwQy91MjV6Rk5LOEZWQzJS?=
 =?utf-8?B?c1YzVnFSUCtKbHFDdkNrclBRTDlyc2JNMDV5UkpHblZGUUtrYmVMcDdWcWNm?=
 =?utf-8?B?VE1aR3c0NC9vaWZGZmV4Tk5jT3Z3c2VDRU1SNy9vcklnREY1bkduRHY0ZjVy?=
 =?utf-8?B?eU0zTlphbzBtcGZLY1RWSU0wNS9SRTE4Ui9Jd2VkMGRTcjhPYlI0aElSbUpL?=
 =?utf-8?B?VXZPcllUWDd1alJIY2QyN1lIWS9CWjhST2JWSHYzL2NJM3BZb1lpS1pOUVV1?=
 =?utf-8?B?MHdGMHNaeWpoTktZYjNlbTQ4MnRjaGN5a0hrU3oyZGhHcUZmS1ZTVm1Lbjd0?=
 =?utf-8?B?eEhISktvWWlxV1FRSmwrUzJ4ak9FWDE5V1ZwUjFJWEdya0orUWpVbVFrTjhw?=
 =?utf-8?B?L0tlOE1oN3g1WmJ6WFFQbmNkc2ptbGZjK0haTVNFK2dmajNKZzY3YmVhSjdm?=
 =?utf-8?B?VTY1UDlocGZKajZlWjhRajRjQUo3YnFaMkJOYlllLzJPc1p2aS9wNHU5MmlS?=
 =?utf-8?B?T095ejFGaUJHbU1LVVdSVlJiRUZDUUw3OGd6UGVObGV5dnlESU4yWGFEU0xu?=
 =?utf-8?B?ZzJaZXVCbjdaOTdLOXloVldHMHZvTk1KZDNCZnluY2hRTFpvdGdhMS9UOWVv?=
 =?utf-8?B?MzFiWlNscFljWHJEWGNiWlVuQXRsSiswV2U5WUpzcjNGSWNMTy9WL1Jyc3pH?=
 =?utf-8?B?Vy9XWG1GYWV6ZklTYnhmOFZLQ2dkOUVqaWhlTXpHSU5pY2l5RDU5TWxOWUIv?=
 =?utf-8?B?aWhKREZmb2RRTFk5dnV2eW1CZExyTytHNzFYN2kzT20wWjBBTHpPbVBZVHI5?=
 =?utf-8?B?dUZmbU1hT1RyZ1A3MW9iVDMvMlNMRStRMGlTWm0rVm9YNlMyNWNkak1hNnE5?=
 =?utf-8?B?cUoxbFMxdkl3UVFEdEtScHJoeE91cE4zZGhOTU0wT2N3eVRsUnhoOExpZzlL?=
 =?utf-8?B?YjV6bTl1RGlhZTFxS3Y1LzJlQmNaWnNNYXBPeEk4bGtCOWFKZUpERXFhcnZR?=
 =?utf-8?B?UkZRYlFuMkdtS0RYTURNOGY2bjJDUS9YNm1KdW9IYlNvdWljWVVWNGYxcnRE?=
 =?utf-8?B?YlZ2K05xaGhNMzZ6Ym9OdVdkYnJjYkg5Q1dHVVo2Z0lhVUQxQm14N1o0ZjNS?=
 =?utf-8?B?L0t5VjR2UkhGemM3MTVFbWxmMXlFaTRZYkNicTA3UFNEaEl4SnpTZENRK2I3?=
 =?utf-8?B?STc2QVdOR0Nxd3hxVFI4MlBXOGh5Y29oYS95WlgweWlQRm02YVl1RVVSVFFF?=
 =?utf-8?B?NHlEWkkyVzBIV0hJRk13MWVnbUYyR1NjRDJjdjhSMXQ1Kys3blAyUmJKWER6?=
 =?utf-8?B?cHExSXUxanIvNCtRa2ozTktYMTZXeHlQdEV6NjRmM1Z2d0dqNk1GQW1uWXkr?=
 =?utf-8?B?YmFIOUphd2FDOVdvZkgvbEpqWjIwaExlRlk0bk5aRlg5aGxWRncrZS93MXNl?=
 =?utf-8?B?ZkdlZHlaMUtjOU5GbTM0UlhkZDBJWFpkUm5ZSkRQczZFS0pPeUxmZWFialUv?=
 =?utf-8?B?c1U3TDVJeDB2MlU2a3lkcVNVbWNZZ2FGLzZCa0x6TDNGUndUYUNQUEFmWTBS?=
 =?utf-8?B?c0NpaWVVWjU0YmR4dTRIT3ZMd1JqMVNoMEZrUVBERkREOEpSczU3aHNtbSsz?=
 =?utf-8?B?dWNWLzl4NTF2d2hSeTMwZFM0KzJUT1YxbjhJeHdOcngrQlFTeUhQVUU5U2dJ?=
 =?utf-8?B?L3NlYU13MzBnOThiZlluT1FiS2xYcWdaZjNiNWhnR0p4M1BaTzNPY21YUnVu?=
 =?utf-8?B?WHluejB5Q29uZlFYbC8vOUNNS093PT0=?=
Content-ID: <7DB97F38610A6549B4CB984010836ACA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b4b52a-2c6c-41f0-7740-08d9f7a2ac42
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 14:33:49.5498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoWwZ/vuw9lSTCkrChhTVe5DgNLwnjCdiihe9ltr4Kulaj4XYJf7L2ysxiOANvfKYasBUY4rLHewLESnHVeoGrudXjiGaR7Oiq7iim6Nmzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_063354_588302_D556E61E 
X-CRM114-Status: GOOD (  29.30  )
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

On 2/24/22 16:02, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2022-02-24 14:24, schrieb Pratyush Yadav:
>> On 24/02/22 10:37AM, Michael Walle wrote:
>>> Am 2022-02-24 07:37, schrieb Tudor.Ambarus@microchip.com:
>>> > On 2/24/22 08:08, Tudor.Ambarus@microchip.com wrote:
>>> > > EXTERNAL EMAIL: Do not click links or open attachments unless you
>>> > > know the content is safe
>>> > >
>>> > > On 2/23/22 20:38, Pratyush Yadav wrote:
>>> > > > EXTERNAL EMAIL: Do not click links or open attachments unless
>>> > > > you know the content is safe
>>> > > >
>>> > > > Hi Tudor,
>>> > > >
>>> > > > On 22/02/22 02:43PM, Tudor.Ambarus@microchip.com wrote:
>>> > > > > On 2/22/22 16:27, Michael Walle wrote:
>>> > > > > > EXTERNAL EMAIL: Do not click links or open attachments
>>> > > > > > unless you know the content is safe
>>> > > > > >
>>> > > > > > Am 2022-02-22 15:23, schrieb Tudor.Ambarus@microchip.com:
>>> > > > > > > On 2/22/22 16:13, Michael Walle wrote:
>>> > > > > > > > EXTERNAL EMAIL: Do not click links or open
>>> > > > > > > > attachments unless you know
>>> > > > > > > > the content is safe
>>> > > > > > > >
>>> > > > > > > > Am 2022-02-22 14:54, schrieb Tudor.Ambarus@microchip.com:
>>> > > > > > > > > On 2/21/22 09:44, Michael Walle wrote:
>>> > > > > > > > > > EXTERNAL EMAIL: Do not click links or
>>> > > > > > > > > > open attachments unless you
>>> > > > > > > > > > know
>>> > > > > > > > > > the content is safe
>>> > > > > > > > > >
>>> > > > > > > > > > Am 2022-02-18 15:58, schrieb Tudor Ambarus:
>>> > > > > > > > > > > Fortunately there are controllers
>>> > > > > > > > > > > that can swap back the bytes at
>>> > > > > > > > > > > runtime, fixing the endiannesses.
>>> > > > > > > > > > > Provide
>>> > > > > > > > > > > a way for the upper layers to
>>> > > > > > > > > > > specify the byte order in DTR mode.
>>> > > > > > > > > >
>>> > > > > > > > > > Are there any patches for the
>>> > > > > > > > > > atmel-quadspi yet? What happens if
>>> > > > > > > > >
>>> > > > > > > > > not public, but will publish them these days.
>>> > > > > > > > >
>>> > > > > > > > > > the controller doesn't support it? Will there be a software
>>> > > > > > > > > > fallback?
>>> > > > > > > > >
>>> > > > > > > > > no need for a fallback, the controller can ignore
>>> > > > > > > > > op->data.dtr_bswap16
>>> > > > > > > > > if
>>> > > > > > > > > it can't swap bytes.
>>> > > > > > > >
>>> > > > > > > > I don't understand. If the controller doesn't
>>> > > > > > > > swap the 16bit values,
>>> > > > > > > > you will read the wrong content, no?
>>> > > > > > > >
>>> > > > > > >
>>> > > > > > > In linux no, because macronix swaps bytes on a 2
>>> > > > > > > byte boundary both on
>>> > > > > > > reads and on page program. The problem is when you
>>> > > > > > > mix 8D-8D-8D mode
>>> > > > > > > and
>>> > > > > > > 1-1-1 mode along the boot stages. Let's assume you write all boot
>>> > > > > > > binaries
>>> > > > > > > in 1-1-1 mode. When reaching u-boot if you enable
>>> > > > > > > 8D-8D-8D mode, when
>>> > > > > > > u-boot
>>> > > > > > > will try to get the kernel it will fail, as the
>>> > > > > > > flash swaps the bytes
>>> > > > > > > compared
>>> > > > > > > to what was written with 1-1-1 mode. You write D0 D1
>>> > > > > > > D2 D3 in 1-1-1
>>> > > > > > > mode and
>>> > > > > > > when reaching u-boot you will read D1 D0 D3 D2 and
>>> > > > > > > it will mess the
>>> > > > > > > kernel image.
>>> > > > > >
>>> > > > > > But you have to consider also 3rd parties, like an
>>> > > > > > external programmer
>>> > > > > > or
>>> > > > >
>>> > > > > Why? If you use the same mode when reading and writing,
>>> > > > > everything is fine.
>>> > > > > I'm not sure what's your suggestion here.
>>> > > >
>>> > > > So our stance here is that we don't care about external programs?>
>>> > > > If that is the case then why bother with all this anyway? Since
>>> > > > the swap
>>> > > > happens at both page program and read, what you write is what
>>> > > > you read
>>> > > > back. Who cares the order stored in the actual flash memory as
>>> > > > long as
>>> > > > the data read is correct?
>>> > > >
>>> > > > If we do care about external programs, then what would happen if the
>>> > > > external program writes data in 8D-8D-8D mode _without_ swapping the
>>> > > > bytes? This would also cause data corruption. You can't control what
>>> > > > they mode they use, and you can't detect it later either.
>>> > > >
>>> > > > I think there is no winning here. You just have to say that external
>>> > > > programs should write in 8D-8D-8D mode or it won't boot.
>>>
>>> IMHO it should just work that you can use 1S-1S-1S mode and 8D-8D-8D
>>> on the
>>> same flash. After all, that is Tudor's use case. The ROM access the
>>> flash
>>> in single bit mode and linux in 8D-8D-8D mode. Maybe u-boot will use
>>> quad
>>
>> But you don't know that ROM will always access the flash in single bit
>> mode. For example, ROM on some TI SoC can read SFDP and use 8D-8D-8D
>> mode for reading images from flash. If you want to flash data from
>> Linux, and it byte swaps, ROM won't be able to read the images
>> properly.
> 
> Then I'd argue your ROM code is broken because it doesn't respect
> the SFDP bit which tells you the data is swapped. I'm not implying
> we should ignore that case.
> 
>> This can only work when everything that reads/writes in 8D mode does
>> byte swapping. Otherwise it will lead to a mess where data is read
>> correctly by some software but not by some other software. I don't know
>> how practical it is to make this assumption.
> 
> What assumption, that everyone reads it the same way and swap the bytes
> if necessary?
> 
>>> mode in between. All of these accesses should return the same flash
>>> content.
>>>
>>> > > How about swapping the bytes just at user request? Maybe with a
>>> > > Kconfig
>>> > > option.
>>> >
>>> > Michael has suggested on #irc to always swap the bytes: if the SPI
>>> > controller
>>> > can't do it, to do it in software at SPI NOR level. I don't know what to
>>> > say
>>> > about this, because JEDEC216 just informs the reader I guess:
>>> > "Byte order of 16-bit words is swapped when read in 8D-8D-8D mode
>>> > compared to
>>> > 1-1-1 mode.", this doesn't look like a hard request. The downside to
>>> > doing
>>> > the swapping in software is performance penalty which will make macronix
>>> > users have second thoughts. I don't have a strong opinion, but I lean
>>> > towards
>>> > doing the swap just at user request, regardless if I do it via the SPI
>>> > controller
>>> > or in software.
>>>
>>> Just having and opt-in will be a mess in the future with flashes
>>> containing
>>> byte swapped content and we can't even fix it and we will have to live
>>> with
>>> that forever. IMHO right now is the best time to circumvent that
>>> scenario.
>>> I don't have anything against make it user configurable, but it should
>>> be
>>> an opt-out.
>>>
>>> I haven't looked at any controllers who can do 8D-8D-8D accesses,
>>> maybe most
>>> of them can do the swapping on their own? So if you don't want to
>>> support a
>>
>> I checked the datasheet of the Cadence Quadspi (spi-cadence-quadspi.c)
>> controller. I don't see any such option.
> 
> I've also checked the flexspi, doesn't have such an option either.
> 
>>> software fallback, then we should just say this mode isn't supported
>>> if
>>> the controller can't do the byte swapping and we fall back to a slower
>>> mode.
>>
>> From all I understand of this, it looks to me that this can't really be
>> solved completely. If you want to allow compatibility with 1S-1S-1S
>> mode
>> then you lose compatibility with 8D-8D-8D software that doesn't do this
>> swap. So the question really is which one we consider "more important".
>> In my eyes the choice is arbitrary.
> 
> We need a reference. And IMHO this reference is that if the SFDP
> tells us the bytes are swapped, we need to swap em in 8D-8D-8D,
> any software which deviates from that is broken; which doesn't
> mean we should not try to be compatible with it. But we - as in the
> SPI-NOR subsystem - should not be broken too and maybe we are
> getting to be the reference..
> 
> Is there any sofware yet where we can lose compatibility with? This
> patch series will break it anyway if you are using this combination
> of atmel qspi controller and macronix flash. So apparently we don't
> care about that. Yes there might be some fallout now, but if we just

I know an example of RomCode supporting 1-1-1 and the other boot stages
handling the flash in either 1-1-1 or 8D-8D-8D. The problem is real
and I do care.

> ignore the problem now, the fallout later might be even bigger.
> 
> Imagine, someone with an SPI controller without swapping comes
> along and want to use that macronix flash with a boot rom doing
> single bit accesses. It doesn't work, does it? So, what we are

It won't work, sure.

> doing then?

That's what we're trying to address.

> 
>> But I am not convinced that adding a Kconfig option is the right thing
>> to do. I think that would cause too much confusion. It is entirely
>> possible that your data gets corrupted going from one kernel version to
>> another depending on how it was compiled. Us SPI NOR developers know
>> this tiny detail but other people won't, and it would be hard to
>> explain
>> this to them.
> 
> I don't think a Kconfig is the way to go here neither. What if you
> have two flashes and you want one with and one without?
> 

Is this use case real?
The first thing to answer is whether we want to introduce a configuration
option that allows users to choose whether to swap the bytes or not.
If we want to make it configurable, we can't use dt properties as those
should describe the hw and not configure it. What other options do we have?
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
