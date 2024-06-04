Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD09BC25B78
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3L7PoNECI9Bg9GZnHQH3/7I8jGcQmOsTdTkYSNnY0ug=; b=ruJ7nxRuB+WYva
	9/G955GXxhX6bbTaa2JHY6QorTgtGHWf0ZZ4nqUk7plSOQ+YPFvUo1xxtxfnfoD5EeynIGc47fKcw
	fRrr6o0i1freBgRNTJUIXMcwKiKULONolX/z7xzaM5xxb0a7ARnv9gkSkg0I5/OGSoFdVnei78x2T
	RHJl48SbiyzuKlON/ZlvNOli45GQViwU0pUjaXQW/PZfnctSDy2Q4pRVoCN+5WRiC40vWWjiR1f82
	FlCwqk0X/ZBpjdWr99s4rIDkBD/a4XaW8ypg6NnCUgEVQu2jIDl1jFw6Y7gXsvdnvs6ERfnXyyMe1
	ksp7qyN4pKXJzaHwGnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEW8V-00000002w87-48rJ;
	Tue, 04 Jun 2024 15:31:43 +0000
Received: from mail-dm3nam02on20600.outbound.protection.outlook.com ([2a01:111:f403:2405::600] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEW8S-00000002w4C-1wHG
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 15:31:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3GtlgLT+YOpJF5MA/Ekrr+89lUXEGgAeK2m1cQjL4jYZ4wLF+Ue/q1wtJYJKkS+yquxyXf0rs7LvchZsBqjpDzdqHdLQYUAwcLYsfY1uajSauqXNq0plVFDgWaEXDwnABFdxVG5D7qRXfRqeJJqDtLNmcK+QQL57+OMY4SaJWVEXvzLaaGmx+e77uSdlpn+hzFHEcalkNpBFLjcmfNUUgV01cLw9nbCP3zqyVBm0stSjrgKcAwLbXxwosZUj8MXlYno/ly3sTuu0uCHvprAiqyF2xMIPvSTzzrT4boIFlDRI6dPYW/5Ac2BMnWBUyTWWpmaBLTN1FxEHP+Sewf9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/F1KfEKhpIZi2d6LSgkuejULkpmbf4FYzUrPyBRNDGE=;
 b=kAu8Qjoqy49BFBMlY8RG0iYgFLPKJs2RBlityiHMMZZYWBwnbY8o3cIjnBqg0nE7pjgxHF8eM0Pgmf7Wt0X7uALRAvpHNPhXUjGyE4WFud/8fLClifvOjvNT6CY6qixmeggcR1XwAb+yhCY+3UR93ZkDmTRFHDf4FdqOL+eJ7W1IXuBEBsZ9RrYl/9+2Sy3hZDWye4VilAwJ7y1w3yU/N5++uflZxQWTt+cp7G9mS9BLpDvhyKaPr8nNWaNyYC8Nj68KKxOJwqnTpThWQcE9ma5t+gBFmWS2IDy1LV9X4FjnhfwjA7dRJFX8mp7dqIKE5I7HLNX98SFUm0bq/oSCzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/F1KfEKhpIZi2d6LSgkuejULkpmbf4FYzUrPyBRNDGE=;
 b=ujez5/fnPNaFtOwyYoW20dnJ8Bz6oRRINQKqSnGZpO+Sa4MizXeTrJvAdZInZPhSdpFZifFsfvxIBrgX5deOhShlvHLr7PPQpQFr4XUTdteBCmGrkBmQJVufQ75X73gBGEOjCjXwzrYUyjZp1XPnwp8fcQTeKHORJ/VwmxUgTXx2suNYAyaw+fDhI7beO8YT2RtYe3VXwsHlabxk36dTRuhnIy7tEQef9W2Mqkw1UCk4A77CzKCqNbD8O2QFXdb9tmLKNo7YFOZ/tzKD68ts5CcYQlqYChM6ZGng+fBI37aiNoXM1i5fE1/XcmPcyE3cCVAtWb7zFwOLF/v/OhGJDQ==
Received: from PH0PR22MB3789.namprd22.prod.outlook.com (2603:10b6:510:29c::11)
 by BY1PR22MB5557.namprd22.prod.outlook.com (2603:10b6:a03:4aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 15:31:21 +0000
Received: from PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::e21a:e0c7:aff:b839]) by PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::e21a:e0c7:aff:b839%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 15:31:21 +0000
From: FLAVIO SULIGOI <f.suligoi@asem.it>
To: 'Michael Walle' <mwalle@kernel.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	Thorsten Scherer <t.scherer@eckelmann.de>, Marek Vasut <marex@denx.de>, Imre
 Kaloz <kaloz@openwrt.org>, Andrew Lunn <andrew@lunn.ch>
Subject: RE: EXTERNAL: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin
 MRAM devices
Thread-Topic: EXTERNAL: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin
 MRAM devices
Thread-Index: AQHatlLKRKOhNYntBkyzBolAkIG/5rG3shNw
Date: Tue, 4 Jun 2024 15:31:21 +0000
Message-ID: <PH0PR22MB3789629B835FB187E3E94510FAF82@PH0PR22MB3789.namprd22.prod.outlook.com>
References: <20240604074231.1874972-1-mwalle@kernel.org>
In-Reply-To: <20240604074231.1874972-1-mwalle@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3789:EE_|BY1PR22MB5557:EE_
x-ms-office365-filtering-correlation-id: 83f37af7-1906-4679-a05d-08dc84ab630d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|7416005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?RHd0bE1Xb21LZ1JIQ0JvUkg3VVEyUDc2aFRUbDhYMk95aEp3UEJZRXZnN3dl?=
 =?utf-8?B?NTBTcEJXZC9XbVdabkhVbTl1Um5Ccjh5VzJxQytlM0RkREFzOTVuc3dPTCs0?=
 =?utf-8?B?YzVCUXdGY0Jqa3lEdEkrSE9TR2RSMEhEYjJsREJ0RWJYZW8zVVp1NDJ4OC9F?=
 =?utf-8?B?STkzcWJoVDZZZ05EZXNTYktNaGtHNUlUT2tiSXNrdDRLZzdjOWJ0YUlIZ2RV?=
 =?utf-8?B?U1c5bWVsS1cvMHFXc2lWb0dTMUtJZ2QxVzlkdnFGSld6MEhYR0YxeXVxVnEr?=
 =?utf-8?B?Q1pWMDUrZ2ZBY3FSaWJrcnFra2tNOFU5K3dpcVU4SCtZRWE2NHUxU21WTVln?=
 =?utf-8?B?L09rUjUwT0NMVjExUVN3MzcrWjFoZk9CN1Fkc3p5TXFxUHJLM2pyYVgvaWcx?=
 =?utf-8?B?SlB1TE1sZTgxSnJmZkJSOFBrckZqTWJzc016bVMyUnZJRTNjdk9Ucndaa0dD?=
 =?utf-8?B?T2xJc3ZMamFramR3Z0kwUG14Qy9ZdVUzZ3g5UzJsUG5SMVAwOHFuS3ordU5K?=
 =?utf-8?B?MDVEdkQ5SHlMeElaMlVibjloT0pIb3VPTTB2SUF6TTFUUkczOW1VdmxpR3R6?=
 =?utf-8?B?bmxHUFlqMFovMFdlVFovb09PYjdUTklWSE83Um41VDUwb1p2OWxaRVdLN0NB?=
 =?utf-8?B?enp0cHBDTk1sc2xHbGxHRjk1cEdGdnVoZktuc3JSQ1lLQ0MxZnhBeEFxdGJl?=
 =?utf-8?B?K2pyRnpzRlhDOFgrU0JETTc5anN1MmxXYUJuNTArWkE1VzkycjBjMExTaURJ?=
 =?utf-8?B?ejByZVllVm1NdTNGYld6Q0h5VmcrZGJjY2Vib3JpcWRjOU1mSzUyc0xiL1BN?=
 =?utf-8?B?Q2dKd3lRN3kyZGt6L1ZXTHErbmhYb2F1clNSUlFMdGg3WGdTK01kenp6WkpQ?=
 =?utf-8?B?K0ZvTTJJWVRuN2wzQmU1Q3hZaFJaT2cveTlaUUNyRXlqYjdiTnpXS1pUVUtT?=
 =?utf-8?B?bzZyZkRkT2xtZ0FLaGdxUEg2d1JhbXVubWdrSmJJZ29YRVFZOTdoU1hWUXpG?=
 =?utf-8?B?Nmt6QTQyN1dIeEVmQUVrWEJYSTlwUk5waWtHclJyUk9Nek9VSDkwb1I4YUl6?=
 =?utf-8?B?K2tMb3h5K3h5MjByL2RNQm9PcEJ6a3RscHpETGFFTUVjWUN0YnFaa1B3NzlJ?=
 =?utf-8?B?bHhsT1NjZ3VOS1Y5RmEyelpoQmlldHlGZWd4ZUdHbjlCUE9OQ0Z6blQxWWhT?=
 =?utf-8?B?OXJNSkdwcHYzdHlGeXlHYmtkWTNHMzc0cHp1eXo4SW02cVd5eHZiOFpEUUFs?=
 =?utf-8?B?ZUFub3gwTGhVaC93cUVSQWFSbTJiZ0ZSV1FmLzAzVlNLL0tjUDdGaVpCWlZo?=
 =?utf-8?B?dXR3OXBnQlFOM1I5bkw2Ukd6VmVEWVZtTDZKRWJFeUhqeE5FQUJZc1lJdWxu?=
 =?utf-8?B?TmgvVklNSUpBbVNTUGdyUUpQVkNxKzNxVm42QmhGL2xxWWl1eFEvMG5mTFRq?=
 =?utf-8?B?WVd5OWM4TWM2YmlxN2Jmem9vNFFYQXpaTFNhTWtnY1dkU3VvSzUzbnFHOGds?=
 =?utf-8?B?Z2x6OWpvMFVLZDAxWUtIUmt0Tm9NYURSaXRjYXhGeFYvaUVPT1RwTkFFWlpY?=
 =?utf-8?B?OXVQM1FJalU1L3I3T2ZzVkwxd1NCRVFqMTU1ZWhOc2VyVzRpME9BOXZGZUhC?=
 =?utf-8?B?UUllOEFJbXhBZkFFWlp2UnZ1a2JEOWZ3Z3pyZFJmQllOalphcyt5M3VZK0xt?=
 =?utf-8?B?UlhYdXU0UWRvdnJlNjYzakVLV2gzN1prUWc0NHFUbzRiWGx1M2FmVHpxTkNr?=
 =?utf-8?B?UHlkOEJ3SFhWTkY1cTluR0pZYnV1UnQwTmhXUjFRcnhSaWpvUklkdVhuR3BY?=
 =?utf-8?B?bUNtNnpVSTVzY25GSzI0UT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR22MB3789.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEx2dUphYzNZZ1NqdWNMaUFTNDVwSzV6amN5cVdsdEQwQ1BnQkFGWW9sZzR0?=
 =?utf-8?B?ZVdsK0lLOVVJcHBHYzh2Z3JpWnM2RGxxWVhRWEw2VXJnSUh3SzAzc2VOelUv?=
 =?utf-8?B?YlFmekpXUDRrc2NiditHV2dIanNDNEIxa0dGUndoMmVyMnNTbkwyZEoxbmtC?=
 =?utf-8?B?WGpYMXBqUGs3UENPNy9zUkc3TWpsVk9mMTk5N0tjUzlNcWpjT3Q0akhQQmRk?=
 =?utf-8?B?OGRPR0ZuWWkxTm5qdHNlcWNTOWxwRzBlYTAwVjJralJKa2tEdXhkWlVzTU1i?=
 =?utf-8?B?NHdjcm4wTVlWcEtSZyt2bEV6UlFEWkhoU0NDaG54UXBSdHQ4eG5IQnFkb25j?=
 =?utf-8?B?ZFNOM0c4UE9kY1l6ZU9KaHh6ZGtMMll1TW1YTHkwcXNTSnp4L28vTlR4UE1P?=
 =?utf-8?B?WDJqdEttcTJBdkV2Ym9wdWdXUW1va1lnZm96blhieGxUd0U5QkNzaTJwUXZM?=
 =?utf-8?B?dTk3dldqb2NONkZ0dWJDQy9QMWZ4SHlNSVVJU3M5WmpJektwQUpSWi92SWlE?=
 =?utf-8?B?enlTRk5mODFJc2ROZ3h3b1FCQitIbzdLSm9hNE15aEtIMldiMDVham5jV3Rj?=
 =?utf-8?B?eUJsdzVCditCQ1RCWGhwaWZQWXZ6UGVXNm96djRiL1dFNXhDOWNqTUx3VXpL?=
 =?utf-8?B?KzdIOExlQnVhYWI2U0NybVdSa2hIb2I1SUR5NWR1b1FVMGRGQnE5UWViZmhp?=
 =?utf-8?B?V01CVEJKbDBKcUZ5YkJ1Y1RJNzBSRjVkdFlTc1N2eXQ1clVVTVBDNGtFMW55?=
 =?utf-8?B?QXdGL0drVTltZ1VBdThLZ0dpMXhaYlFMV2JBbktoL2xPcXpyZFk5QjcyTmdO?=
 =?utf-8?B?RFZhWTgxWlEya211cEN5RDNLS0xxcjFXODdrRHA4WkFrMGRCMzQ0RjRUWEZS?=
 =?utf-8?B?dzBlQnRrODJ0MzZKOXR2Q0pHbnFRU1lVTDZvYXdLZWxxRU9PRmV0OWFQd3Q1?=
 =?utf-8?B?M3M3YlA0eXQ4NW9wOWtTM05nZ3M0WTQzMVlicVZ2RHMrd2RaMXJOZFZXNjBL?=
 =?utf-8?B?ZWZQQ2lxdGFlbDdvMm55dEZvMjJRUDdUa3FlMjRMcXhheTFPLzFEb1JPK2hD?=
 =?utf-8?B?d1ZuTGNmVEtOWm5WNC9GNmpXNzNKSHNVd0FuT0szRTI0QlEyZFJPcjdUQ0xm?=
 =?utf-8?B?ZW1XNmdTL0wraUVGakFEZ3BGSDM3aGpNTmx1YkVBQyt1RTFwMS9JSFJFRlF6?=
 =?utf-8?B?UU54MzJJSEVNTnpvSnBDR1NQRkZ6WjJ0MEJPak1Ic3lORHduNFN5eVNJN1dW?=
 =?utf-8?B?VXRvdmhrZ2F0bGxtUGxFMUN0Vmd2WFdMUE5hRUZUd3Z6RVJmRzRWdEt0MlBw?=
 =?utf-8?B?QjY4TnF4N3g5dFlsd1AxVmVzc0xOd1Y1RGtaOXdJYXcrL01weW1ILzh6RUli?=
 =?utf-8?B?Tk1IS1NyY0M4NnRMaHhiL00rbE5SZVFjdWF4Q1Q2QTNRY0JTTnM3SytsV0Ni?=
 =?utf-8?B?V2pIVzIyd1RHb1lJa1JFT2JUSmN0dlZldUdLRlZLVWI0ZnZLTloyWXFidHZu?=
 =?utf-8?B?MmpMSWlBc3Y2SEpINm9VemxNSVR5d3p4R3NHVkJnRzcvMEU2a1I5d2h0NWZ2?=
 =?utf-8?B?eXBoVWI1R25admdDeDFXNTEvTUF4TGk4cGZlWnBlcGJvQnpYY0RCSVFhTVhk?=
 =?utf-8?B?L3JXSlVjKzBBZnF3bkErc1NYUVJvU2hCTzFrMjZudGZMdExweVBsQmFFK1pB?=
 =?utf-8?B?ZnRkNm43YWtuTFpyekk1akJqWUVWeWJyVzRsTTlZVHZOQzlyL3Q1ZUVabEV4?=
 =?utf-8?B?c0JzVmIrUlNQeDBaUHhtbTBzR1BqTjlwMVJCSlFPSnoxS0RVSUlIaFdnQ0xo?=
 =?utf-8?B?NnVhcXJVMmxlZW5mTmtGVUFhZlpDUmoyWCsyQVpNeDc4Y3p4YWRNbHY1UjFj?=
 =?utf-8?B?QTd4cFpGS2pBeUZhdW94UFdlUllGRzBldVUwNlFPbXRQV0kwVjhqUDFQaUxz?=
 =?utf-8?B?a1dORGhvQzY1NnoxTUVVVUVqaUI1b2VFYThNWS9iT3FRYWNIYjMzdWxGdkc4?=
 =?utf-8?B?UG1HbFd1VHkvd0V2ZWpNWUlrdTgzeGdiMHJSQ1lqZTRJd3IzVEk1M2JiOHY5?=
 =?utf-8?B?UUJ3TDdMRkpvbnBqRXFRSmI2bEEydzRSWXpyNERRcWRtb3lmUmdzMjNKandK?=
 =?utf-8?B?KythbHJiR2NyUWZkNVFwcjZxR05iRmR2V0dGVWFoZFV5YTAwWGJlK3A3eTdv?=
 =?utf-8?Q?u8rJfrLyKBFnktcS7wQK6ms=3D?=
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3789.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f37af7-1906-4679-a05d-08dc84ab630d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 15:31:21.5308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 855b093e-7340-45c7-9f0c-96150415893e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4mkk9+eA1Cm8Pb/gLi/h33bEhM2jztZBJyNlBh9JODo/dJszL6a5UleiL7GxR9sbegMuTnMJC90eS6e83rBzHa9+YPN2gRV856TQlrE7tdWBcgw1ahZ9gUg4H4SmrCqB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR22MB5557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_083141_305143_39AD400E 
X-CRM114-Status: GOOD (  25.43  )
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

Hi Michael,

...
> ---
> The referenced binding only supports the true AT25 compatible EEPROMs
> where you have to specify additional properties like size and page size
> or cypress FRAM devices where all the properties are discovered by the
> driver. I don't have the actual hardware, therefore I can't work on a
> proper driver and binding. But I really want to deprecate the use of
> these EEPROM like devices in SPI-NOR. So as a first step, mark the
> devices in the DT bindings as deprecated.
> 
> There are three in-tree users of this. I hope I've CCed all the relevant
> people. With the switch to the at25 driver also comes a user-space
> facing change: there is no more MTD device. Instead there is an "eeprom"
> file in /sys now, just like for every other EEPROM.
> 
> Marek already expressed, that the sps1 dts can likely be removed
> altogether. I'd like to hear from the other board DTS maintainers if
> they seem some problems moving to the EEPROM interface - or maybe that
> device isn't used at all anyway. So in the end, we can hopefully move
> all the users over to the at25 driver.

Good idea, I had already tried a similar Everspin MRAM, the EM0004LXB,
using the at25 driver, and it works fine.

> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 6e3afb42926e..2dccb6b049ea 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -21,7 +21,6 @@ properties:
>                (m25p(40|80|16|32|64|128)|\
>                n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
>                atmel,at25df(321a|641|081a)|\
> -              everspin,mr25h(10|40|128|256)|\
> 
> (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|\
>                (mxicy|macronix),mx25u(4033|4035)|\
>                (spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|\
> @@ -42,6 +41,14 @@ properties:
>                - spansion,s25fs512s
>            - const: jedec,spi-nor
>        - const: jedec,spi-nor
> +
> +      # Deprecated bindings
> +      - items:
> +          - pattern: "^everspin,mr25h(10|40|128|256)$"
> +          - const: jedec,spi-nor
> +        description:
> +          Deprecated binding, use
> Documentation/devicetree/bindings/eeprom/at25.yaml.
> +        deprecated: true
>      description:
>        SPI NOR flashes compatible with the JEDEC SFDP standard or which
> may be
>        identified with the READ ID opcode (0x9F) do not deserve a
> specific
> --
> 2.39.2


Reviewed-by: Flavio Suligoi <f.suligoi@asem.it>


Flavio

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
