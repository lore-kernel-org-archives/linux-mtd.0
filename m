Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5FEC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 05:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FseExkSJjyOCvh71GauStG/iuvmZM1WFCl6H6gOsNpE=; b=LeOJLEJH0u55kW
	/1XU2OhgNVpLnOp3y647x8oGAx4SLywdUtvIV2SwXSh6iLUohfi2b/7kx1nsjF8vuq+5Zkv4YTKhM
	RxgzeW+3lZY7Aoj74gy5b6IBCDgONpGge5UlGu6whNUwul+SAefquWrNhckiqKtCcFVYhCFtAzeH7
	NrKndgTnIQ6khz6h6rsb3lLMLvOpICE3g88yBjgo22XemC9bDSwwXMaUwyblrFdLzM1puygOBf6Ag
	BVF0VeOdNXVXiARxYXVvu/HxCH0IBzTLu9fVRnpWL8cqoI03i+Onx5KzCgWHhtVgCAdh1g00XPVkA
	lYsk8+bpfIVJY5ESxthQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgFU-005Z8C-Hc; Tue, 19 Jul 2022 05:58:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgEu-005YqK-Bj
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 05:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658210269; x=1689746269;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0VGomoM/3WQCFxNo9De9k4WWub5sYZpfCQcfKpFclxk=;
  b=02hG3VZ+j2arNHNZkXKRcyRvy892fzC6+yIeqZmC5XL7o/OTKOcXS/KY
   JvB1gIrL7lF5f1kBxNw1ICBF8vpJocWL6A3ViOrxZuHctjctyD0a4EtIN
   a9/3Eol4fkuD06Ly+0FqA7JMxrxq2gNlMXPcfipbjcPr0KDWUtkKk7zv7
   zPPqxWiQqKLv8/kM74lPIRAOS3F/6IrfKbdy0hSsQnpIjsqMrAUMqNkbn
   tq43f9nygzCB7B9Wo49HroIn5TzyO2tJTBA6xYvpe6UH5gNKDyZM1SEn3
   f9DmkGPYetIPiO9VrUnBllarCGIBZzIEt1b/FGIVgok4cBxWJf7cGL9tI
   w==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="172685115"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jul 2022 22:57:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Jul 2022 22:57:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 18 Jul 2022 22:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g10/3y5h+PKWeIt5bdsmzUyeHMsIhAU6qUHpzZGjKEQTmoniwHQM3nYC00KdQAIGm/ZJbpbMctW73o/7lJyUJiXd4IzpyI2HXfYRHpcNX1gyVK5/5IdqN9pHpQrXjpYo9Dyd/x6vlHzSlhntiV8pMigAx59G4qe0YAwQT441ryXAWHr7fF4iWMJwkZnjMcMb5Q3B61gYB6Zcr6W0YjSnEu0Q6P4gEuWuDnQjmN9LLLKmhqJe5+LtyK3zYRHr4cCupAmOZ6lEHl53GcAgXwGDp/6w6qI8q+Ct4mBzQUmoCKiGHPBZdGl4TpRVCISqx8q92CmN7gCmHFkAKEbqjz86TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VGomoM/3WQCFxNo9De9k4WWub5sYZpfCQcfKpFclxk=;
 b=JEPgh7z/I9GIGdRfJY51GGvy+1+MBCRCEoz6Q700NKzy5HwlbXiptCvmjCOn9/ayHauw0MbvHUF/N7k17VubtlmoNHcC5BNcMBeLSOMcbv4vDM++cdqlVHeXyX8fMJjTmf/JRo8IkVzR3zGrWJKJXBqiCKuPz7sGpfI0cFx6F1LL+sbkuKv3QwDWzFkguld61hH/wwqd7rElIbxhEoLobYVAYJO1OWz4Uy0aK9nSr1NP5CBEqMeJLRvvCCD0C4VgEDm1EqK4Lt91Fnn8jYh5EVqGMJ9auAsmEnX5SwU3w7mei0izrOXQf7O9s7bRhqpnB3OJ4dogEoyh9kUAcZdybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VGomoM/3WQCFxNo9De9k4WWub5sYZpfCQcfKpFclxk=;
 b=KlezB3rmm7TNqIXoPmyoaxVk84AhqrgtvS18JF+0m32Cr/QM7+XKSqRnFLnoVgvajxOdZJyYtLSwFfo8+X2pFnD2btnrZzGGf/8NKA/61/TO1t0LXyCwgwA2r7Lie4Vhlx6WGP0k7VQaXnn/RDhOwxWyhsj6aKR5wVVyLUogO/0=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM6PR11MB2921.namprd11.prod.outlook.com (2603:10b6:5:70::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.21; Tue, 19 Jul 2022 05:57:35 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%5]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 05:57:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <quic_c_sbhanu@quicinc.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
Thread-Index: AQHYmzRwuAFPdIe45ECo1RhI0CKwAw==
Date: Tue, 19 Jul 2022 05:57:35 +0000
Message-ID: <160ddac1-6d0a-c922-1380-09e7823a285e@microchip.com>
References: <20220510140232.3519184-1-michael@walle.cc>
 <20220510140232.3519184-2-michael@walle.cc>
In-Reply-To: <20220510140232.3519184-2-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 673a9f54-73dd-4437-45d1-08da694b93df
x-ms-traffictypediagnostic: DM6PR11MB2921:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1hVLqC8cijxV60lIPjvRcP95wNuMm8ij9phZxzg4SUd96kqpTg6Xh3YAWNG7K+OL9NxFn9UekCAhv2LC8VU+l3pOA+iQGCXB2aZoWS3kzaCa+BRKtplS4T4A/FXYJeRw8dhuFKSuKAd0zUqWZ/fvUVOqwvMrfTj7pOPBDJ5RQQ5WHZ2iAiVRgcqdN9Rht6Zwc7+0YZbEc1qQOxhinTc4z2oO2rbS0ABy2iNhAKDBf11a0zuHnHknIyHYQwZa+KvwC6iBu+f1jDTXijSt+oVpcLWNrs4958oRHs4IRlWDGGkRLu+36cSmgQ+ET+U0WA2bux/iNLJ5+raIJ5Es4orBjkSAxa9qAf2wJ0/RCI+l0GeGzH2QwaCE3xrrd+8beiyFXEzgZlA+YBILzR2k99i4CuCD0hYeqiHj7oBQLFbGzxjkueSn0IEsUOP3JMTkbneNP/2Il0s1wIaqPCCLmC2VvzLs4DFpV2/TsL/ytE9RBf2/dpZlSDWnzSDRgbSVWdRrRiFyjJW2DcA7ridp6H06/qaS2jbtp6OBAm1AHoH7KZl8oGPlKXy6DDx/2gNfArxFUJss7VuN31k/xM3HZPcc7wr2XR9BF3sMiYUD/Ih60MYnn408k/uRi24YizdDymhH+k9n3Wqekg+7IiGWZiGlBv5g/G8QBAr/V5ePCG/7ktpswxiE/JBVhKi2NA5DJObelV2YaOSCZSLVnJ128oN7anphABTRronb4ZWGeNbfkdn8xdaJVuZtyg6UAEBMyXK9P0PBAVlVxXbAH1E1F/nvQG2K9rQ0qKlLBMTe4j1ebA+aF6/CgLQSnwOGcf/K3TlW8/L1DtiUVf80b/KOxA+leMqDzs769pZbg2JLllhRtdI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(39860400002)(376002)(396003)(136003)(36756003)(76116006)(31686004)(2906002)(8936002)(91956017)(5660300002)(316002)(54906003)(66476007)(66556008)(66446008)(4326008)(66946007)(8676002)(110136005)(64756008)(53546011)(122000001)(6486002)(6506007)(478600001)(31696002)(41300700001)(71200400001)(2616005)(38070700005)(86362001)(186003)(83380400001)(6512007)(38100700002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU01eUw0QmlNTjFaQjdqQlZKbll4QnRHVDY5WUQ3WXpBYkJsTVVlaGtJOXhn?=
 =?utf-8?B?Tko5azVuNVl6Q3pXZWoyekZ2SnBkcTBrZ09FV3hRZ2NCY0owaFRXNHZOYXZQ?=
 =?utf-8?B?UkpUTW1nUzBKWlY3dVFTR2l0azBhMUZqZEV1R2NFSkc0V1Z6TGFYQ0owYngx?=
 =?utf-8?B?bC9rQ2wwc2dVd0kvaEtMOXhRR1grT1J3UmJ2dFRFSFo3YzBMd2tHd29UYzIy?=
 =?utf-8?B?aGFqcEh1VFZkYXZnbXViZTRzR1A3RmJSMTVPVmFtbnJVUE5jUmhzbFc1amlm?=
 =?utf-8?B?ZmxRYzNBZUdydisxWHJxcnNKOTVwV2V3b1NKWHpRWmxENlBUMWFieFRMVnY4?=
 =?utf-8?B?RTZ2M1NJYmxmZnp2a2wzZVdvL3luQnQvYlk3cUl6em42MVlQOXdEZi9NUVVi?=
 =?utf-8?B?bC9xNURaTHJaZ1IvRHFra3VrdEV0d09Xa0tKa0twYXlIUDZvSjdXRDVybTRj?=
 =?utf-8?B?cHNMcXR6VEZhK3A1c0FBVUxIOEwxNGRHSmVCMkJOYXlmS3FIdUZGV09uZ0k1?=
 =?utf-8?B?UHlETGdNNGZZUmpmSmVYK2hFQUlraXVsZGRTcGRudEpTM054UkpJc0pmQ203?=
 =?utf-8?B?aXlCMTNjY2lOUW1DSEJOaml0aHlzbjUvUHVJQWxhdGRKMFdPcXd0eFV3ZUNT?=
 =?utf-8?B?RTZ4T2MwSFdoaVA2YTZBZFJ1SG9YdTRqVU5iUEhZck5CcmRvNUJrMDBEcUJP?=
 =?utf-8?B?V2UycktKVVluTDRPdXhoZktOZDNjeGYxM2N3VmRYNGRoUUVYVGdFdTdnVldy?=
 =?utf-8?B?U1p6QzAyN3I2NkNmUUp3OGpiYTlxYkQ2VDVySjlrTHBWcm0xK0laOWo1Tlpx?=
 =?utf-8?B?a1lTNG5OUzFLbDRHelQvMVZJcE9hU043T3RxNGt3SDFHOWxWcXpMVDVlV2M1?=
 =?utf-8?B?QXBJTnZXT00zcVBGZmxoOEpQdWQvUmlsMVUxbDBZRjIzNHdqU2NXMGhhS3hN?=
 =?utf-8?B?N05rc2Rwd0l0bnJ1K1Y5RnNFV3BUakIwVHRYUytHaDRmNUlsZXpFaWRIU0x2?=
 =?utf-8?B?eVM2aW1GNUp4UktTNjk2TXErdjNoTHA2dHJvRktZKzdaNkVYVHY1NzVaTG5t?=
 =?utf-8?B?cnB1K3FlWTZIMkhkSUpwYkhIL2drVkpkTkZIL0RqbEg1UktlQVZtS3JiUGxG?=
 =?utf-8?B?aWZiU2ttVnJtbnYyMXVTaTNrVlNzaUVvTGRJM25NRlUyNG9zZXJvRHpqS1RX?=
 =?utf-8?B?Rm1FYnpEUGRwa29sNmxLQ1dHWHp6ZWZseXhmQWhlZklySGg5TmwzN2tBYTZz?=
 =?utf-8?B?S0hhSnBtck9HRDJLc2gvRXQ3bzljclJDRW5ibC95UExLWmV0cjF2VzAzbVAw?=
 =?utf-8?B?WFRSd1QyM1JlWE92Y2pmeG5mRmtyWEtOVGo2MmVzYlRITXVqNGlBMjI5SzI3?=
 =?utf-8?B?UUd5b3oxZjlCYk5nVmFzRFRMM0Q1Ukg3SDVmNlAxRTFzMDhERUVxYmZueXJM?=
 =?utf-8?B?cVI1V2ZFaDJCbFhrbjRaenpZd1g4a25CWURvbkNOdFMxdklmRUJyYUZ4U1FX?=
 =?utf-8?B?UW1GTDVlc3R3OXRYdEtBNEhvY3FiSmsvemZaS1NxekhJZUZHM0ZBbk9XZUl3?=
 =?utf-8?B?ajU4MFVtUndJTTZQcVM4K2hWUDlqWkFBOE5GV0h5aGpsU3EvcjlhcE9kdEY3?=
 =?utf-8?B?ZlNvNGcyUFl2Y0ZFQjFjQUgraytWTGl3TUZsak5xTEQ2ZlNNVmw0UHozeHhw?=
 =?utf-8?B?SWNKbWJzZFYvNy9zbnoydUx3M2JZelZ4RzJ2VFZ0b1grZWVsOTdRZVhwUWtI?=
 =?utf-8?B?Q2NObW5sZFpoTlBPcTZ6RmxBR1ZIT1pINytJdXBkakRWNy9kRnBHVmVQVkt1?=
 =?utf-8?B?ek1ham1YRkNheTMvRWtCcFlZUlo2dFVnM01YWm5NQTFPdzRER0RKczV0VzRi?=
 =?utf-8?B?RExWRzU2cUlJNmd2NkR6RHB0bEx6YmdwYW1zNXVmYnhKWlJoUVpnTTA3MGg4?=
 =?utf-8?B?SXF2bWVrR1kxSEZkMlk5azdaTlBmbSs5N0E5bFAzSkZjb0FsOWpnUmFodFRX?=
 =?utf-8?B?TE5XM1plZC9EejVya3V2UnppTTBQSHNEVkxEbHAwUGlBQ2FxSnRjbVlseG80?=
 =?utf-8?B?MWoxZW02cFU0bnYvSzlNVzkySlBUYnlQU0VsK1dLd01zSzRPRVBWUHU0bndo?=
 =?utf-8?B?L1RGVS9FMnhnMW5iYlcvdFZPTmJmMDNOS2dCMndFQXM3Z0o5dW5GTVNkQm5o?=
 =?utf-8?B?Q0E9PQ==?=
Content-ID: <D142982CAFDC124D9A073A7623E2F3CC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673a9f54-73dd-4437-45d1-08da694b93df
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 05:57:35.0537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJuYT0ApMO7NvV8jtw7HhpXIKyfl/OtM/VzVh6fmZXlBsZS2qvBqLpAhyYTMZ8MEkhAi12ZEN6yVz+/20TTm+XeTrkbUtJPZP2kv/HfhU3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_225748_704079_8CF08EC9 
X-CRM114-Status: GOOD (  26.36  )
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

On 5/10/22 17:02, Michael Walle wrote:

Hi!

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Up until now, flashes were defined by specifying the JEDEC ID, the
> sector size and the number of sectors. This can be read by parsing the
> SFDP, we don't have to specify it. Thus provide a new macro SNOR_ID3()
> which just takes the JEDEC ID and implicitly set .parse_sfdp = true. All
> new flashes which have SFDP should use this macro.

I like the idea, but you need to refine it a bit.
Your assumptions are true only for flashes that are compliant with SFDP revB or
later because params->page_size is initialized by querying BFPT DWORD 11. I think
it would be good to specify this in the comment section. Also, I think you introduce
a bug in spi_nor_select_erase() when CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not
selected. wanted_size will be zero, will you select an invalid erase type?
Would you please resubmit?

Thanks,
ta

> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c | 7 +++++--
>  drivers/mtd/spi-nor/core.h | 9 +++++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 402b37cdbcea..29329ed0a934 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2104,8 +2104,11 @@ static int spi_nor_select_pp(struct spi_nor *nor,
>   * spi_nor_select_uniform_erase() - select optimum uniform erase type
>   * @map:               the erase map of the SPI NOR
>   * @wanted_size:       the erase type size to search for. Contains the value of
> - *                     info->sector_size or of the "small sector" size in case
> - *                     CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is defined.
> + *                     info->sector_size, the "small sector" size in case
> + *                     CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is defined or 0 if
> + *                     there is no information about the sector size. The
> + *                     latter is the case if the flash parameters are parsed
> + *                     solely by SFDP.
>   *
>   * Once the optimum uniform sector erase command is found, disable all the
>   * other.
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 61886868cd02..fab3038c4f4a 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -563,6 +563,15 @@ struct flash_info {
>                         .n_regions = (_n_regions),                      \
>                 },
> 
> +#define SNOR_ID3(_jedec_id)                                            \
> +               .id = {                                                 \
> +                       ((_jedec_id) >> 16) & 0xff,                     \
> +                       ((_jedec_id) >> 8) & 0xff,                      \
> +                       (_jedec_id) & 0xff,                             \
> +                       },                                              \
> +               .id_len = 3,                                            \
> +               .parse_sfdp = true,                                     \
> +
>  #define PARSE_SFDP                                                     \
>         .parse_sfdp = true,                                             \
> 
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
