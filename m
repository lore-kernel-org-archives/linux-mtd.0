Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA655C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 04:18:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A540561215
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 04:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A540561215
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PuYUlBg0cc7px3XDARZ8k7t3d3hchThdX1UgIpvaeZA=; b=g6rw4FVbcsJJNB
	V+VBp/M9fMKK0xWETYhpZR5ak6E+ipyCPMbs4Kp02lK0wK6ARW7UaVEn5eBd8Yz5DgMcJzIycj5Fd
	0g/muZM+M7qrdNVCcKTf/S85BlnOLvKk6cd1zQDonNdG/IFkTwBXGEM0CbBZm2RiQCKDXTYxSLRXz
	woJ2mcRw8xj3sO5Yiqfs0aO+/58Wz5awGxojBx8u2jc6BP/YWQ42SkoQFKo15GwZkIs3+Vo6p7H5e
	d6vlfR8wvvE+VH0CM3dwvPxVdagqeAac/55/aGvFrTN2rqj2f8Cgy+t4p3LMCHCOuy/8oE89/kX8l
	xf7W4CJkRisiVR7wvE0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXFPw-0051vC-Tf; Mon, 04 Oct 2021 04:17:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXFPt-0051uk-Hb; Mon, 04 Oct 2021 04:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633321050; x=1664857050;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vroORpkdnbvY6H1qTlaxHd/CoDv33NDktyEo0r8GwS0=;
 b=QxKDVpQ4LOgm8RppeqBVkVQRAEWK8T5Y2vLLG0HbTRkCY0VRkKbtL+CO
 n5hytgzJ847I0BlO5dhLWcamtk2ffHAOIRyopVddL1jQEyIDwK7HepiPK
 ratkM547mXEgEq6A/MquRx+OjK5zwpsJwp96bbWO5x4LuiLbVs8bu+b6B
 HfgcRE8Lt+u+OC7Rft6KztFLh30ZXPAHwqiYVVf4Xppg1iNJCGnrlK7Ib
 j32cmiyDcA21MSPPIdoaFqWTfq6Eyrl5gwrn9C7hGUeFzdTNyCQsZjR2w
 tbRXDgcPGhRjZILV+FYD27BPQXVEFtwIfA4DY2mFEE2hX2aL0xApNf4Qj A==;
IronPort-SDR: r8PPW7Yef2CCdz0cF3tjyNvspEiik5iRUJmXD/oYxBe84Cqg8FXKWW5I+smo2BwPV2VBpdazfx
 9ugI4z+RkosTgY2yIoiJEpscr7P9Z8Nv016XrnQXJh3QAmyCPLioDUfR6bLTfyNr1quXBklbfs
 ++nhpeKqwhkAmQrHW8FxSayyzUquRrv3r9WA66+Z8lw2jEmsrKXn7oBMLRtMQaaoxU7BICJywC
 vzNmpHedbzVw9Tc2+rSLZ5o5AyPT9pnUJ1Te4R+QmkhPugaR3Oq4JHhh8tIWBFmD9ZIZjoyf/f
 yZrIXoRmPTQCmFak4hFO3WBV
X-IronPort-AV: E=Sophos;i="5.85,344,1624345200"; d="scan'208";a="138316962"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Oct 2021 21:17:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 3 Oct 2021 21:17:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Sun, 3 Oct 2021 21:17:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpfYonT0KovCtbIHQLIh+cdaCEnmPI8gAtnotVDKFRV57awHr43YIzD00/QanMV1EzXpA3YalyUzQJ9V2RBF/RjH8EfKNpvMig3HIzFUrLpHAuQxjtASX3VmNQ/0zBTh6xgH6jdW1xxWCJkCwUc+7G0HkjsDP9QGb2INrkusmUUAaSH2mobbiHC5acYJeLjeMDUfRaDKvhQvpmGQjMv4Qcy0QO6fRivv3sV3CVhtJDelN2N2zJqjX/Lx6Bjq5HzXow09WNUdKna9qM5tp+UWE20zfc6EP1s6f8K6JYefVujzteiqyWVpK7f35ADdDE/MLbH1zfzJY2uHZqCxh3WqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vroORpkdnbvY6H1qTlaxHd/CoDv33NDktyEo0r8GwS0=;
 b=bdDrxFE1gPOE9u2a59lUDB9+a+ZP2eYdbQFwTC3MBRnLvPTXYWwWtQD31loNwu/pjpxvfRL8XMcU3EZb7x3HSvwlOv1aTZQ6KTDem6y0+6lQ8RUY/LQO77FIzGlAHzVGpkCf622lQ6mIY67rofxVIENF/+cvvXakh4J71nly44/iuIrJX0P417CdhU6BF5YwnUqvXlZNKAJJEL/3dznS+iAx0G4/FrzMQkMn2NsLB4cDBTRNyHG8RUX33VaCshXsyZcTYqGK4/lyw/JKDVbl3ieoMXHjxzMXl2baPNKq3h4Zj1304glaC1Leqvux4aEPHOfgWw5BQ5JiwSJZhyqRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vroORpkdnbvY6H1qTlaxHd/CoDv33NDktyEo0r8GwS0=;
 b=SPnItdy25p958aFXCQ4yx5CzJ7ArA1qzbETgqsHD499EBrILUccm+Z/IDAgU3rWpSv6L+D52CMJSXuk19SR9PXBrdc1FZgnFHEMR2TzNRAZBiI3qShhOIsiv1vD7u+HZl0bWqfjS8f4L7y59NbozHWi3Ykc/IDzpja0Yn+O6ZLE=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5083.namprd11.prod.outlook.com (2603:10b6:806:11b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 04:17:26 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 04:17:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 26/35] mtd: spi-nor: core: Introduce
 spi_nor_init_default_params()
Thread-Topic: [PATCH v2 26/35] mtd: spi-nor: core: Introduce
 spi_nor_init_default_params()
Thread-Index: AQHXuNa8Je8hPWzzMUaDCRa541jZag==
Date: Mon, 4 Oct 2021 04:17:25 +0000
Message-ID: <42dd1311-7e75-a57c-c62c-d0d452608cdf@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-27-tudor.ambarus@microchip.com>
 <20210824173018.n6fw6t6mg4bwah37@ti.com>
In-Reply-To: <20210824173018.n6fw6t6mg4bwah37@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f11b8693-4093-4507-41ec-08d986eddef7
x-ms-traffictypediagnostic: SA2PR11MB5083:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB5083C4F76F89918E2077E8EBF0AE9@SA2PR11MB5083.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 86CWpe/8aakhYdMjPph+mi/bkwt1ogy91dVv/O1ikRe8CwuTj8UzRxSiR0a1U6DbiilCY3OSwGIpeyepLKcgeHeP32N7GS3/oJqkjcQbFNy+DKN/UcMxxUV1YIPzC8zMbKQzCfrY48DB5cOCfHJz9wb5I/mqC5q069RMlpIQXfEXbf90864qG1zTYF3FpbmFplaFtsrltOvreDJQj+GpBTup+UVBTtpIYXCFg58onxm7RRgxDI1BUGwVLocZVAr17tPlpvLA2BSzyE+af+icnf5yYSenwygZUbb4W9NLmphVDIFrUJmwgeCCKorEaq+zMUpwx7vcexXWMAXBzCfYqORr1/gnceUYdgjciD3KTCEiYFzEQwJXnnDV0ePiJICQSeOpudkutml7RWC6166fbod2zeV9b2t0VWKnp1yLpyyq2Z2JHdqd3triJkFItMhbIvFBHUCWLN9IDCE3GYFu+cmN2xzyMDzqIBSlem5sdgbJuQw05+QuTGfBwJzjJBQ5SX2jqYj0UiO+9FSRFJ5j/Qttb6aq+1Q6qLEHOAs3h2BXo5NAechgODVNuDLFUN2XWOLbNNEPDlLCGNf8pDI0Naz9X6/InOLCbzn/LgSe2C1FE41mwsuz6J6QP5vMCDXkO95QBD7eirTpL7HW6gNFSwCyA4B2qjMatixvH7avQ5PuCf/QaFgTeCvRzO1mNZTENfPWHGk+PTT3S46SO33PWI6wtbqpFyfq3Yo8wf8ILnWbYPrAXyEaOVhg1e5bZmK9oDVnwYzwkl3nJt1k6ymAmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(2906002)(186003)(31686004)(54906003)(5660300002)(7416002)(83380400001)(91956017)(66446008)(64756008)(66556008)(26005)(66946007)(76116006)(66476007)(6512007)(6916009)(6506007)(107886003)(316002)(2616005)(38070700005)(36756003)(4326008)(53546011)(6486002)(31696002)(71200400001)(8676002)(122000001)(8936002)(38100700002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c295OUF2UWlHRzdPV1lEQm9FS0hyMDFLNVJJSkhkMExJZGtCZzJJdFVUQS9a?=
 =?utf-8?B?T004MERYUWsyR2dmYmpJdUI4SGFlMnZIVXRYWjh6N3pyakFkZ09jcW45OUV1?=
 =?utf-8?B?MXM4cUlzNVEzc1gvQXZYSWVXYUVrcnlmOS9kdGNHY1o1TFZqYVZ3SXNJdHg3?=
 =?utf-8?B?K3lhVkd3QmxXUmJ3Y2NDaldkdllJK3FBRHp2ak1WRmh6QS93ZG9sTGJjYUkv?=
 =?utf-8?B?elNVVk03UktxYXZCYVRUdm1YMkR6TVplTHMvWFVwZmc0YVpEMTZHd24ybG9D?=
 =?utf-8?B?U3hwaXJoZjQvcnNZNU4vSFhWdlk0YUlUQUJmQkRVTzFPT1pRaWwyNWJzRGJm?=
 =?utf-8?B?aTY0K3J2VjQ2eXpLRXJZRXQyaDhza1J2TDdkVENYYXlwOHhGZWVlNFFiRVlZ?=
 =?utf-8?B?TkRLdzVYTFc3NVczb1daMVRvbnUyRGdITmRWbDJKbFVRblVzUmxUeTFMN1lS?=
 =?utf-8?B?bll3UzNOWXplQTdJUkhIUWhGMWFXT1k4WTZMTGx1eWkyTmlzWEFMTUtUbThP?=
 =?utf-8?B?OGpGeDYxelNFTHJ3OHpjc1RSTzdkeTFVZXY3OGFZY1RQVlA3ZEl2REtGeGhF?=
 =?utf-8?B?Mk9lMGJxQWVpb2J3QlFLV1ZodEdBOFdraXlWTnBvdTVWOTlvWHdrR2tKSjhy?=
 =?utf-8?B?V0JzeUd1N1RMam5xYXhzWUpZTVZWRHhMdnlJc2w4RTJpV3IyYTJPZ3gxUmxE?=
 =?utf-8?B?SW43TlZBZ29wTmdZNU00eTNlN0lSQ3FlRVB4UFpNeEMyOG5oSFhGWlFkRnht?=
 =?utf-8?B?c1JybmEraTI1aFdqNE05bmpFUEZCb040UU1VdEdUQmVaT0puc01pOEE4WTA0?=
 =?utf-8?B?RlJvSEM2K3N2MngwcnEzRkliNWdLMWt2NnBpQXRKVkJ6eGl3UmVHMEJuQXJ6?=
 =?utf-8?B?c1ZnaXRVcVkyZlhPLytTQWJGVTlXdjdzOUgxbEVsdFZmZnkrdUpJNDdFaUVF?=
 =?utf-8?B?OVRVZTU1YzZiN2YzbUsrVlZZV3h5bVQ2dmg2dUJ1NVJqeS9WdnFkNFRsOEk0?=
 =?utf-8?B?NG1RakJ4dE1STER0SmE0Y2xLVzlUZjV0VTNKRmtPc0xrL3AxazdsOGM3QmNO?=
 =?utf-8?B?dDFWL2liZlRLY0Z0M0k5OU1vbGdSWUNDek9na3ZMUFBlaFdOVndNVVJvcU5i?=
 =?utf-8?B?ZHJuaWxzMEF2SDN2eUNBYnJhZWpzaEx1RElrZ05HS3o3bnJReEhoMUZWSkFE?=
 =?utf-8?B?NVVZWi9RTzlJaFo4TXgvVFdkYldZcUhneG9RVFVKb3NDejc5eEZSODNIT0tu?=
 =?utf-8?B?MGhzbzF0UmtmWi9XSVNSWnF1b3RaS2hiWnQrZU1RS1RaZzRFNkFqRnBOZHoy?=
 =?utf-8?B?Q2VyTWYybzk4TzNvcElndXRlS2U1bTlTT2lEQW1LZ2JEaDJhaHdiK1hsckxZ?=
 =?utf-8?B?MkJyUFhkRWk0ekZCSExjeUtlRkJjaTJTTzFQb1NLZSt4MkVleC9zc0ZhZlFz?=
 =?utf-8?B?bHVETjRPL2ZCVHVxdEJtL3VNRU9zS3FMMW5tSWJDWmlYY1ZQN2txU0paRzIr?=
 =?utf-8?B?OTRkbWxQMWxycmVqZzFYaVlzd0N2SGhOeWhLQ0pQQkpqQnB3WUxBZTArbklr?=
 =?utf-8?B?LzhheGhqUnR6WU9PcUVXUVV0Q0xSYTdTY21JR1ladWJBTk9FUEFmQ1prL1Fo?=
 =?utf-8?B?NnZabjNqWC9SRXRSQ3lMOWpvTFh5bkg1ejY3UmZTbnVBZUljaTRkdkQwN25E?=
 =?utf-8?B?Sy9rZE9EYTN0elR4RFJxQk5yeFJsWjM4aWduT0NtWlpTSFd0NHB4dCtoOTJy?=
 =?utf-8?Q?3i53ng57EoJmSazDYk=3D?=
Content-ID: <78DE612EA204F941BD1D3CA62A2E7B1A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11b8693-4093-4507-41ec-08d986eddef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 04:17:25.4946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +7dX1bXCyUIGBpwamfw0/V16dfA5vfF2lsqeLJLmnmxg/NqMcWyqzbVyMNbqwQVBzPzL0y5MbsRzwlBgwLyfeZ+LBSAcXuyznlqvMWE0xz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_211729_629881_A44FBDE6 
X-CRM114-Status: GOOD (  22.02  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/24/21 8:30 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>> Called for all flashes, regardless if they define SFDP tables or not.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 92 +++++++++++++++++++++-----------------
>>  1 file changed, 52 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index b3a01d7d6f0b..9193317f897d 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2543,6 +2543,56 @@ static int spi_nor_setup(struct spi_nor *nor,
>>       return spi_nor_set_addr_width(nor);
>>  }
>>
>> +/**
>> + * spi_nor_init_default_params() - Default initialization of flash parameters
>> + * and settings. Done for all flashes, regardless is they define SFDP tables
>> + * or not.
>> + * @nor:     pointer to a 'struct spi_nor'.
>> + */
>> +static void spi_nor_init_default_params(struct spi_nor *nor)
>> +{
>> +     struct spi_nor_flash_parameter *params = nor->params;
>> +     const struct flash_info *info = nor->info;
>> +     struct device_node *np = spi_nor_get_flash_node(nor);
>> +
>> +     params->quad_enable = spi_nor_sr2_bit1_quad_enable;
>> +     params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
>> +     params->setup = spi_nor_default_setup;
>> +     params->otp.org = &info->otp_org;
>> +
>> +     /* Default to 16-bit Write Status (01h) Command */
>> +     nor->flags |= SNOR_F_HAS_16BIT_SR;
>> +
>> +     /* Set SPI NOR sizes. */
>> +     params->writesize = 1;
>> +     params->size = (u64)info->sector_size * info->n_sectors;
>> +     params->page_size = info->page_size;
> 
> I think these two lines should go in spi_nor_info_init_params() since
> you are using the nor info to initialize these parameters. Otherwise,
> what even is the difference between these two functions?

I think a better name for spi_nor_info_init_params() is
spi_nor_nonsfdp_info_init_params(). This method will eventually be called
just for non SFDP flashes. Check conversation in 18/35.

And maybe I should rename spi_nor_nonsfdp_flags_init to
spi_nor_nonsfdp_info_init_snor_f.
> 
>> +
>> +     if (!(info->flags & SPI_NOR_NO_FR)) {
>> +             /* Default to Fast Read for DT and non-DT platform devices. */
>> +             params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>> +
>> +             /* Mask out Fast Read if not requested at DT instantiation. */
>> +             if (np && !of_property_read_bool(np, "m25p,fast-read"))
>> +                     params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
>> +     }
>> +
>> +     /* (Fast) Read settings. */
>> +     params->hwcaps.mask |= SNOR_HWCAPS_READ;
>> +     spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
>> +                               0, 0, SPINOR_OP_READ,
>> +                               SNOR_PROTO_1_1_1);
>> +
>> +     if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
>> +             spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
>> +                                       0, 8, SPINOR_OP_READ_FAST,
>> +                                       SNOR_PROTO_1_1_1);
>> +     /* Page Program settings. */
>> +     params->hwcaps.mask |= SNOR_HWCAPS_PP;
>> +     spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
>> +                             SPINOR_OP_PP, SNOR_PROTO_1_1_1);
>> +}
>> +
>>  /**
>>   * spi_nor_manufacturer_init_params() - Initialize the flash's parameters and
>>   * settings based on MFR register and ->default_init() hook.
>> @@ -2609,43 +2659,8 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>>       struct spi_nor_flash_parameter *params = nor->params;
>>       struct spi_nor_erase_map *map = &params->erase_map;
>>       const struct flash_info *info = nor->info;
>> -     struct device_node *np = spi_nor_get_flash_node(nor);
>>       u8 i, erase_mask;
>>
>> -     /* Initialize default flash parameters and settings. */
>> -     params->quad_enable = spi_nor_sr2_bit1_quad_enable;
>> -     params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
>> -     params->setup = spi_nor_default_setup;
>> -     params->otp.org = &info->otp_org;
>> -
>> -     /* Default to 16-bit Write Status (01h) Command */
>> -     nor->flags |= SNOR_F_HAS_16BIT_SR;
>> -
>> -     /* Set SPI NOR sizes. */
>> -     params->writesize = 1;
>> -     params->size = (u64)info->sector_size * info->n_sectors;
>> -     params->page_size = info->page_size;
>> -
>> -     if (!(info->flags & SPI_NOR_NO_FR)) {
>> -             /* Default to Fast Read for DT and non-DT platform devices. */
>> -             params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>> -
>> -             /* Mask out Fast Read if not requested at DT instantiation. */
>> -             if (np && !of_property_read_bool(np, "m25p,fast-read"))
>> -                     params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
>> -     }
>> -
>> -     /* (Fast) Read settings. */
>> -     params->hwcaps.mask |= SNOR_HWCAPS_READ;
>> -     spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
>> -                               0, 0, SPINOR_OP_READ,
>> -                               SNOR_PROTO_1_1_1);
>> -
>> -     if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
>> -             spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
>> -                                       0, 8, SPINOR_OP_READ_FAST,
>> -                                       SNOR_PROTO_1_1_1);
>> -
>>       if (info->flags & SPI_NOR_DUAL_READ) {
>>               params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
>>               spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
>> @@ -2674,11 +2689,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>>                                         SNOR_PROTO_8_8_8_DTR);
>>       }
>>
>> -     /* Page Program settings. */
>> -     params->hwcaps.mask |= SNOR_HWCAPS_PP;
>> -     spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
>> -                             SPINOR_OP_PP, SNOR_PROTO_1_1_1);
>> -
>>       if (info->flags & SPI_NOR_OCTAL_DTR_PP) {
>>               params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
>>               /*
>> @@ -2823,6 +2833,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
>>       if (!nor->params)
>>               return -ENOMEM;
>>
>> +     spi_nor_init_default_params(nor);
>> +
>>       spi_nor_info_init_params(nor);
>>
>>       spi_nor_manufacturer_init_params(nor);
> 
> I am neutral towards this patch. I don't think it improves much, but at
> the same time it doesn't make anything worse either.

I think it helps readability. It splits spi_nor_init_params() into smaller logical chunks,
based on the type of initialization. We should usually avoid long methods where we can split
them in logical chunks, it makes the code pleasant to read.

Cheers,
ta
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
