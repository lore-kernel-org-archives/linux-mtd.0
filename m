Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1F0C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Waa2RGGH9nHDlThFWW3WDvWq6r6fLeL2ejoS9b1vd0k=; b=nN5i9nN6D1iEFF
	WA8wOw/TOwyPROicZ/KJk2SgiVHccd0aVjObRkhF0HasoHceRVRtTXmBaftyv6F9QlhwX8AFybamh
	BR23U9TR3vM92gFN+s9YLDKVyfOMD4LF8TewW8g7IvLw8PJfMQ/NxKiQ4wlERftt3I2YV22ad7Fev
	yKZ4KPtnMeJ3K23UcRhs8UTEcaIXP5hBX0Md6gkyAMrYAcInHwYOcOXKYTb6mD/+4YxZ7kN2Kml6J
	8efFOT+Syp++jTYZgH7DYurhSjcEE7WL3N1ZgJCloJQajLlI/ahqSlEh64FsyEzMZw5xeWa+/uccX
	S0yPHHxHmNvKiZ68xl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP0H6-00GIWt-SQ; Tue, 01 Mar 2022 11:02:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP09J-00GDma-45; Tue, 01 Mar 2022 10:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646132073; x=1677668073;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dhCxqPnzz1DqBfVN/WirGBhj103Ux0Eiq/6CLCIGZrE=;
 b=fwyY3alUQWTF2tsvi6mk7Tb+ycLtVU7y8ath4i8tci+DuRNayNXDURbF
 yIxoCdp8bgJ/BJHWuq6A6AUrLLmwj1T2OBAB54+yqawKRbsw1rvbpoemi
 KgSc4EydaVu8iyODhZ8mouhfkeWuI/d/RmasOtRk6kIekrEg40R7UridD
 rhGbkT9NeRRd19r5nHoESLa5DhB9iUsjeoKKir2OFDFkDslGn/dUiA8qI
 M6vW8kPxXyJFD9xybopO8Qr2hU93lyt13EsoYwoMrpMcuOeQkRV3yNGHv
 +/RTCzE1VL4PjNh+bN/sTESjNv7bZs7TkcDn55W5u/W9zfUcSznhfyeu1 Q==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643698800"; d="scan'208";a="150376179"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2022 03:54:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Mar 2022 03:54:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 1 Mar 2022 03:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nV0D1sWkR++CrTysFqHITzGujgxkp/bxF3jLLZomwD0b6Tgq0UAtkMGtZ5QCHcGbBkzHDVptnG+KqBs3JoQGdXdNGHmvy2sNA5x4qCCLxP7Ceqgiz7OqNndrGmhEZL9exAiTCH9WNoN36Yce749QgaRlTPyT8hbEiFBuN2wYOVxr34OA4ys7sMhwtNrcB/nE0qDNARZaMPk5RQUZ5FxVXnF0VkKgBgz3KPCNhVYIwv1pUjCAbG7X/uWj+9gun2hu9H3xIrU0PfXL3mJ/+zM+CB4EPsFHm63CSvnQFUMAdbVPt26pEcTV3fGipXdGq/NUQG8iKyn/YVXZkKZFOkllBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhCxqPnzz1DqBfVN/WirGBhj103Ux0Eiq/6CLCIGZrE=;
 b=lnOzRT0UuUSKW6ns2CHGTYWZTK/Juq1PyAIgYkinCe75f7om3REYITK+VpF2gVJjluwEjlzfrC1HxQJMWrakPbhSSmsRnMxzKG7oAChF6jCxqY2u7ISG/tRr7dFD2WXn1QSyKVSjJBdT2I5Dhc7SFHEWCGHBqLmP9C7Vc2NI+/hjtsRcqpOShfQD3Qjj8P9mNLsQdH/zObTVzEMaunwDtHW98qjsMuIZvm14NKotB+ZjZUJKCifmEv//Xwmkl3iHMpfcd3thhUECh4OuW521FO7LsXjlzbKSrljLpCg3qkCFsU5Reg5g/5cwzOq0cz7gh0kGXnxbh7tT9yqrWbojTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhCxqPnzz1DqBfVN/WirGBhj103Ux0Eiq/6CLCIGZrE=;
 b=EyqGiefMj554zwyOhqOXS8kDX9J8QMIXDF5bQvMdbsCkGFnTHot7qPv7GayBlbFXY94TFxOIdRnsh+tC54zlfmK2CwXrGx3w3B5PlAVQkQQ5VrvJ5OOOKLgF6HTLUdTTR4xVX2OlbNDvtdGEMMeOtsB3iGMm1aQUE9SGszBRCU0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 1 Mar
 2022 10:54:29 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 10:54:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <heiko.thiery@gmail.com>
CC: <p.yadav@ti.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
Thread-Topic: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
Thread-Index: AQHYLVq5QRnxn1BbbkGpQ8xUF2TdFQ==
Date: Tue, 1 Mar 2022 10:54:29 +0000
Message-ID: <afb8df98-e9c9-1cf8-9e82-9c06e131eee8@microchip.com>
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
 <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
In-Reply-To: <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5826e793-7dff-42e9-c862-08d9fb71dc68
x-ms-traffictypediagnostic: MWHPR11MB1886:EE_
x-microsoft-antispam-prvs: <MWHPR11MB18862D7F9870AE5CDDF0B29EF0029@MWHPR11MB1886.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QdAVknnZI27R8zjCuQeoLGTFFWf93PPJiTF7Fs/zNtihGqR0SZAIlrnG8KjqlIBPdABSKKStmR6dcAhtl4rDE4k294gEZk9iFPyVrXwh8PaB34jpa5deQez0xcOwj0L8FoV6ORisHyiByS/Uj8y1DpzgkoslOlQ0g5EcyUS3tal5ISsr2Pue5WZhPDf698DjST1aKOJiy0Drf5mDArefb8GzP2G3sKy+wD8/BcbEUaJW8Wiv+lJRNkdK1mw/5AjuK1IadPsj+zpJhlMaXYbzQdMXSlg8p8ELcONp1eB37ZnW0n3zL6SXd0obSR0Y5heUUkCIy13lIcnJpa7U0IUYREHBLzC3Tt7otTPPx5r2jd6wx6FOcLx//21mhj8y52WKScY8VVPbh8NlRQAS99C363bhdUMIMPWhAbcUfp3HnD+HjwpA/im17Vgvh3aycGeTJPACq3TAH2ZvjCFnFgP2mTTwhimKx1vciMpC556w2RbpS+KEXMn6wBDprBUwffwGxx1x65X0vhWfa6ylWMR08128MmCq4N0GVhW0Metf+kaPgm2k9pPPTjkaJjjZPRoY7/3nS4agKMChixBAG/sG/cGcO/azNe/nkGD3YMxQFZzsGlkNM2bF0TOGUhWcYziftNQEGRPJfIca+KIvrfbE7OZ5bWkPFerT/0Ink4i7OXHsLfQNkDmdJqeqfxaPVeTJdvkEPyM4GxmgrwLasmx6ENs95ikS4IH06UmGOrhfx1288lF+RaxnZp2X39jdme/3q5qsAelrsVovTsAHgN9RLJBMucIHKVaEkwJ//0suUd/frxE3WS3YFGgzfe6HjGraIsWwqsAdPPK2fxoFYffHtPi2aQR5EYuinp7JhWDFiOPdxzAPqpIUg5mN+lsFjjRrOhpGz87g1/c0wZgbbhOE5oHvuUc2GIiji20rqgcmE5w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(6916009)(316002)(8936002)(8676002)(31686004)(966005)(6486002)(64756008)(66446008)(66476007)(4326008)(83380400001)(107886003)(26005)(71200400001)(36756003)(86362001)(38070700005)(5660300002)(91956017)(508600001)(66946007)(4744005)(66556008)(76116006)(31696002)(2906002)(6512007)(53546011)(6506007)(122000001)(38100700002)(2616005)(186003)(66574015)(45980500001)(43740500002)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0g4d1l3MVN3UnppNGdkU2xoSTJlcWJ5Zy9zOWpoenlGS0w2emJDQndTY2lv?=
 =?utf-8?B?SlJiYlJFVzJtZE9zK1ZoOGRob2hPcXhWZkszRXJpWDBtVlB2aTRxVmlRRHNu?=
 =?utf-8?B?TWl4N21Bc1M2OGl4TnAzcjdKLzFpWHp0a0RQN0drUGV6Q25CZVpPNk9jYzFN?=
 =?utf-8?B?YjlNUU5YQTlrNSsvVHZXVXdZbFJqRXdxRURnTFBrSEFJMmlEV3VIVmg3dHBi?=
 =?utf-8?B?ekI1UmdGU2VoTjBMYnlPcTFmVWNFL2pFV3lnMHgybmVObndHRzVrdXJhblpS?=
 =?utf-8?B?eGZqN1lFOUEwVUp1WFg0UWdOcHFzbnBwdUdoMUhEdi9OMk9menVvZXcyL05k?=
 =?utf-8?B?TjlEZXdnNy9aczFtQlNMZlhGSDBDajZxTVZRb2IxeUwvK3B3UTlyRWNpSkds?=
 =?utf-8?B?dlpVOXJqeElNbTd5WTVodCs5N1UyeUw1djFkQzVvbTZ6YlBMbC9OMmJEcmFE?=
 =?utf-8?B?Z3psNmQ5MzVNZzFoV2FDcHJlTlQ5TGVLYi9GazQ0MGdBNmdGdlZUNk1pOWRP?=
 =?utf-8?B?MXBpOWJxNk92M0VIZmRkVm5vRVliNlBHbThDcHVXa3NicXpLRkptKzk1ek5T?=
 =?utf-8?B?RHlrRDZBMW44NFFza3NSL0JEWWdWTmxtVENDTTUxOTlyTUREcVRtby9CUkh2?=
 =?utf-8?B?YjZRSFRoU0hnbVBqSzdadmszM0kwQzhQUTlQY3dSRzlKaE1meUtRdkl5OGYz?=
 =?utf-8?B?N01taUdUS2hYZzhtcWQzcXczc2RuL3JkVmZjdVVsakxoTE5rd2VQR3pMMVNv?=
 =?utf-8?B?aTVFaE12WkJTMkZxM1RzQjcrUzQrZmRvTHFTenloYnROZmorZTQ5VDZDK3JJ?=
 =?utf-8?B?RUU2bVVkaGc4ZFNDRmp1aXVtMjJBUVhaU2gxUy80VkJzSllyZFluNHBmSkN6?=
 =?utf-8?B?RUZMaHBncTBWdDFmLzdWbnhaVTV0WnJPRDMvQUh5a0Q2cUQ2VTFnaFgyOTU2?=
 =?utf-8?B?K0R6cnlubFBBVzludDlPU1lTQWc4VjVNcWFyV25rVmIvVWh3cm9wY1RHa2NZ?=
 =?utf-8?B?elo4cDZreEgxNmpCamcrQ284blhnQ3N3TkludzFRSHNTMlNLYVJXbHhLeGFx?=
 =?utf-8?B?QzdSdUZHVG9lZE9QV0plZWRuWGUrVUUzWlJralF3K0NZbnVmN0dBaWttU3Rv?=
 =?utf-8?B?b1dPVDM0L2ExR1IxMTNMVk9yc1k5KzJ1WUVvbEcrOTdvbHdwNzExYlJwRTc1?=
 =?utf-8?B?OFllNnBPRzJ2cGlQeUlINTFpYS9Pa1FhbS9PY3FxdDBjbEM1Y1JjRVRpVkx5?=
 =?utf-8?B?QnRBMHNMd0YyckVwTktTNkhCUm9IeHFSVGdXNnN5WEdLRXVzSVZYMmZ2Rk1O?=
 =?utf-8?B?aFRrL2RQOUl6L1c5UXVJZlhQcEZwRWJtR3JmVUpDclJvUGVQTy9tZitCZksv?=
 =?utf-8?B?eTlHSDFEald3QVZRRWhTUHQrS2xvSk5lK2FoeTRyMXJmSW9vYXBhcG0xRlNu?=
 =?utf-8?B?SzYvMldVdWNDU2kyeWhhUk9PbDlXZkRPNTRZdjkwMFlnRzlvTnB1VnVQVVd2?=
 =?utf-8?B?MVFTRzJScEQvRjZkU01JTXdSem9JdTNQdUhMNHdwSThBVGNEVDVXT29heS9s?=
 =?utf-8?B?MmdFTjFTWVg5aTVUNllVY2tBQmFxK2QxdTJacVY1d3k1QTJxYzc2VDR6OXVy?=
 =?utf-8?B?d3VjdXFNSGFRNEkzMWRUd0hET0tyUXJXUjN6STRmZ1d3eGFqS3o0eEZTaVJ1?=
 =?utf-8?B?c2htTzBaQjB3ZmlqaE1JSkpJQmhHNWNyZjJIUXNaNTlGRFhUdTg5VitKYU50?=
 =?utf-8?B?WFBZcnBmMHVWS0FmVnZTQjhCeGx3L2NBbFZ5cTNxazFhdjRGbG13RmFoMnlT?=
 =?utf-8?B?dFVYQ0JNWUQ3ZVordGVwdnBUTEhsOVpCQjRDVVd3Q3phbjFNWjl2VjFUZG9Q?=
 =?utf-8?B?cldGSnFZYUl2dWZXYnoxSWV6WklJTi9PZm96bm53a253azFNTk4wdEhBcmlu?=
 =?utf-8?B?eTZCZWVwRUJ4T1dKSk5Ndy9yemZtRDl1dW9QTGhlT0hJdmc1cVl2c1lQclRK?=
 =?utf-8?B?Njd2dWlUem50SHZZclNsaEVCbUVQdGdZSzZIRFY0KzR3a0UyRWpZNEJxK2x6?=
 =?utf-8?B?amQzSVM1d2gxbWMzVThNcFl3QnZnNC9tUlNtWmJyZ3VHcU1KZmo5Ni84MHpC?=
 =?utf-8?B?bXpBeFBtbmkzYWpCMllXNDR5WURtMjBqb1BVT0RUM1dBY3pKaTlMbEpkdGZo?=
 =?utf-8?B?MjVXVnB0MTdqUEZLSXdvZnhDSGpqRUhvMnpGbHJ4dUc3SW9YcGhIU2Y3d2VT?=
 =?utf-8?B?ZXRRYThscHM4Mm5ORnJGM0JDNVdRPT0=?=
Content-ID: <DAB52E549AF1A2459D450005E9470AE8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5826e793-7dff-42e9-c862-08d9fb71dc68
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 10:54:29.6273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iHLsFQjqRPKzVwp3E3YPGEwZ1vQg5d6MDTAquxXj79pbXWo0cS4lBekpZ4ByYAXS6xGLtYNOuAdGKAp5ZBOtSLtmaKaXrC5xXOs2e/d7tpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_025433_275465_12A9EAFE 
X-CRM114-Status: GOOD (  12.31  )
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

T24gMy8xLzIyIDEyOjI5LCBIZWlrbyBUaGllcnkgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGkgVHVkb3IsDQo+IA0KPiBBbSBEaS4sIDEuIE3DpHJ6
IDIwMjIgdW0gMTA6NTYgVWhyIHNjaHJpZWIgVHVkb3IgQW1iYXJ1cw0KPiA8dHVkb3IuYW1iYXJ1
c0BtaWNyb2NoaXAuY29tPjoNCj4+DQo+PiBIaSwgSGVpa28sDQo+Pg0KPj4gV291bGQgeW91IHBs
ZWFzZSBhcHBseSB0aGlzIHBhdGNoIHNldCBvbiB0b3Agb2Y6DQo+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tdGQvMjAyMjAyMjgxMzQ1MDUuMjAzMjcwLTEtdHVkb3IuYW1iYXJ1c0Bt
aWNyb2NoaXAuY29tLw0KPiANCj4gV2hlbiBhcHBseWluZyB0aGF0IHNlcmllcyB0aGUgZmxhc2gg
d2lsbCBiZSBwcm9wZXJseSBkZXRlY3RlZC4NCj4gDQo+IFsgICAgMS4zMjI2NTVdIHNwaS1ub3Ig
c3BpMC4wOiBteDI1bDEyODM1ZiAoMTYzODQgS2J5dGVzKQ0KPiANCg0KQ29vbC4gSSdsbCByZXN1
Ym1pdCBhIG5ldyBzZXJpZXMgd2hlcmUgSSdsbCBhZGQgeW91ciB0ZXN0ZWQgYnkgdGFnLiBJJ2xs
IGFsc28NCnJld29yZCB0aGUgY29tbWl0IG1lc3NhZ2VzLg0KDQpBbHNvLCBjYW4geW91IHJ1biBz
dWNoIGEgc2NyaXB0IHRvIHZlcmlmeSBlcmFzZS13cml0ZS1yZWFkPw0KIyEvYmluL3NoIA0KDQpk
ZCBpZj0vZGV2L3VyYW5kb20gb2Y9Li9xc3BpX3Rlc3QgYnM9MU0gY291bnQ9NiANCm10ZF9kZWJ1
ZyBlcmFzZSAvZGV2L210ZDUgMCA2MjkxNDU2IA0KbXRkX2RlYnVnIHdyaXRlIC9kZXYvbXRkNSAw
IDYyOTE0NTYgcXNwaV90ZXN0IA0KbXRkX2RlYnVnIHJlYWQgL2Rldi9tdGQ1IDAgNjI5MTQ1NiBx
c3BpX3JlYWQgDQpzaGExc3VtIHFzcGlfdGVzdCBxc3BpX3JlYWQNCg0KVGhhbmtzIQ0KdGENCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
