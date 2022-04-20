Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593FEC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NO0QQSp9RpN/mCzabnH5M52SlF0Bh3ptzP0SK4EIcos=; b=g3M0E2jo6lB3ry
	X0z4g7xKotHjaa47g2rbE6PMWLHCdCY1I71SaRqVNBpYFyu7Sk7/CqXIX06NHdloZ5EdeOiJ/uelw
	TZoNX4ufvVLmKkyC7osMqnMv4tIF4vl0ISDSC0cAWzS9hCDkwyZsO4qvG8aJX9icyyneoVFutotg7
	2FNzoGHLbbAQIH891TUoG4UQ4gQqUkriyDF4f6DU+XI6/0sSfXwMq3l9sNe+mGqmewMJicvOCY0dm
	+76fraW3UCOREXGcE8ybMhSO7QzEgSNHWMO8iVaU5DLV5ZBS3etIjAk3aJQGffwKYwgH7HDevym6c
	eJ71g6mPp67SKRIyg+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh61q-0089Xl-4a; Wed, 20 Apr 2022 08:49:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh61k-0089We-C2
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 08:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650444572; x=1681980572;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QuDO4POed7Rvpong2vkfrAd/WJGUCz78hmURupnQh8Q=;
 b=bVDhL3QfO3ToN3LZk4zdpZSdPTJpPEeVtkbFT1OWx5P56tTwZpgxItgL
 sr7ZrV3GhjXnuntVmyNH67yNRg6C3tyUZIjaTzWGjcGeY3gzhvdB043KY
 ExHcjCSN95daqrd/6zkWT7tDg+WdhrJMxH2JyPX7Y6FMKUbxlJJmCvVpm
 20zqhTyonEqVzQKjfL5lgPydOyBGsh/WvFMfDaY8+8rkAWG7u8Ghh65mh
 RUGU6RwuKShSkeJ8WY09c7NBVWuNN3Fw89v2SBR3sWDOWW2bQq+XaBli+
 kC+olAP5ezwRuQKFwLzdNrAatN00BnL6KGHKhI8NRRUJnV7GACjdGL0IQ A==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="92928410"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 01:49:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 01:49:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 20 Apr 2022 01:49:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4gCTBPVqQ1qVSHDgQNYTwV7kaksesoExh2Ty52sRYoXWfPUk0UlO93XhYriqJNXso6Iivb6xODfUWu2iMtYP2xqf9TlU7E8v2aY9rUqXUm5ECwiQrCQoTI5rvhm9T2dsUB16J05Pjm0rrBYIDXNhXXlXP+O8v6wbGnzOQn0OceZubRBrVQGC84BosSWKYd1DVGencTtgx7Re6La9al0PvzkWmjYcSW9b2qzb2XXkCF8iyt5WqhaBs5mrJArrEATSxAzkdUEE6BPYMseC7+A/7CWeMky6nw0kFUXJ0z18EIm+OQnLMN1gOcv2OR1IpWRd5gHbLD3olUxZvN8iCo8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuDO4POed7Rvpong2vkfrAd/WJGUCz78hmURupnQh8Q=;
 b=LTfmWs84nNWr3mZ72JD0v+EsYGnIv/JsCFsE/hc6Kz90MzQWWrs7AStg7Xhej51ua6CDV/q6Cz80n3Z07bV4GzZgwWJ1d0+K3cEABbFJmcxV7iUXwCf4zNjWAFm2ji7uJ9NIoqsZgAx3cuW/qnRjhN2n7BdE4wqA/FaAfw4XH1G+6UR7YTS9BJ1jOxNU3Jt2S/zk87p2z3x+kTES5x8UWZEkDr34PTxaYSnVM2tfY4dNpQmqNJpVDaynXDak8XV+up2OvlOH5EzL/rsemQKeOYViSP3gOzqfGwdatt6wQAfiRtxqWPm1gBSQ/KB0uhxt8dLeqMxb9C2bMYewFbmTgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuDO4POed7Rvpong2vkfrAd/WJGUCz78hmURupnQh8Q=;
 b=X81pZLUJoO6Geli14bgvFYMgaO97ZKnN6pWa65tmkjgI/A9D9xMYcbTF84p3rV/PknyHhL1DYA4wPGS41yEiK8hWvC7tUUcIROb5tfdxbnY43hhK100jbUkuUQTgBVleK8k5UDoTN616WwOQmyyCzbSwqC9oCfyEu8YJtLdWwJ4=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BYAPR11MB3143.namprd11.prod.outlook.com (2603:10b6:a03:92::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 08:49:20 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 08:49:20 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYU9BgAvSIp+mmK0m8aBEYNky38g==
Date: Wed, 20 Apr 2022 08:49:20 +0000
Message-ID: <f40480e2-a1fb-d660-a96a-c802f6405906@microchip.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
 <201f90e6-e03b-9469-f3bd-f1ae3b5737dd@microchip.com>
 <c8007288-00ef-bc3d-5337-8db710feee67@gmail.com>
 <9220410a-f3bc-b2cf-8324-604ad5b3953e@microchip.com>
 <02154c7d-225b-d3a9-df28-f257c3b7e9a7@gmail.com>
 <bdbde2cf-43c8-798f-9a75-de0bad91a1bc@microchip.com>
 <872a40c8-7f84-9b9f-7f18-d566278393f5@gmail.com>
In-Reply-To: <872a40c8-7f84-9b9f-7f18-d566278393f5@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bec63bb1-f9cb-4d5e-e56b-08da22aaa92f
x-ms-traffictypediagnostic: BYAPR11MB3143:EE_
x-microsoft-antispam-prvs: <BYAPR11MB3143B3373B04B1FFCE5556C6F0F59@BYAPR11MB3143.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6dl5QOdnSHSsI78WCpVZ5Ht/BAN4wyrd2dyIVbAKXYvd/Xi5SjYMJVJth2W5my1etWupPEpqj0pQnwR95jflRtzkYrYF7ruya/GHXP8KiJEqYb5RQPdkGC6++0xwwSO3lT02BLstCtvHbQH4v2GurF0KC/3lhtKn9f8pOlT03iLTGGdqmHS1yiDPCQPr50NjN+O1RRaN40Yb+jBts4F2GxGK/bOJ5Co9dn1nTELB+7rYHBYjf3Lt23dOR4RElXRuoxzA5lOzWZqq9zJTVBm8i4KlL1xrCqqDXpmxfTXOJk61SgnFrmbEH4oYIWHldE4EJc0E0ZOaKrYiObstlPi3Lu2KXaEgXzObSlDt6glqDd5SOZVMrOAooqksUdWZ7Sk32lM7F5Jw3PBVmiEEGdQCpLfyktUb/eyFm8k7X9iZWsmWlyREKdkKdpDMBztyecADOsmIXRDWlUZ+LqTo8rn6LwZySarG2IDMRe9ODbUmCHSCNJ1hl24/tJn266/hBoHp7q7yJD5/NYgtKq+IcOdQQPAM+RqVbrZYgb4inLIryp6FNmBoqokwimv4v0Y6XNYvOhipVkqK2seggzR//oWoYBRafEcjI7XzVJjveUfR5MaDdmxHIa4x0g/EtFn2lOYeSyyhmF8HT/r5TQdSai61U9ShHI5bKfHZmy2wRm/8KTLGSG+QKBr+pT2acqS67Ggklld2ggNeIxeYZ3JVd33ZxuD63YQ1LwmnFyTLI36iaUWJwImUIkRn3ndijjDskEgp6TBrlWu7olIyVpxy/ESeaCk8CyBgLQvd6luVIdnZR4sEN4H3Ae1AiGkbEH0JKkDbppYFfrwx5ajlNd2Jv7fxepwLKHo+sU5xJxcdkvDL/pk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(5660300002)(6486002)(966005)(2616005)(508600001)(186003)(31696002)(26005)(91956017)(66946007)(38070700005)(66556008)(86362001)(83380400001)(6512007)(4326008)(122000001)(36756003)(6506007)(71200400001)(53546011)(2906002)(76116006)(110136005)(54906003)(316002)(64756008)(31686004)(38100700002)(8676002)(66476007)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rk5ialJtS0ZaZXlzR3pHSXpkMVlmNkQ2STltZXFkT0RuSlNOQmx6eU9GeWlY?=
 =?utf-8?B?dkRJdHNxRzZQUmlURzVNRXNqNnU1TVBxTEI3THpTZEVWV3B2aXNGWjAxVTEy?=
 =?utf-8?B?dkdRVFJPaGtwUHo0NllQaEpnSFVBS25lTEhMM0h1WFpuT0JZdlFXdHhabjM4?=
 =?utf-8?B?VEtNNy9PVkJTY00vK3Z5WmhJN2YyT0xJYUJTQjRabXV2YnIwUEFNeUNtb2s1?=
 =?utf-8?B?bGJ4UUdCemxLeGRlWHFVVkM2OWdxbTN2M2ZVQy9Gd3o0Q3FwV2pPTzlWYUdk?=
 =?utf-8?B?ejllU2JQdWhkZmlUTjVHOWNHazg0NTVOa0Y5ZTJYVFhuSVg0cDAxdmUzZWE0?=
 =?utf-8?B?MHZyK2JRZGZ0cndiZCs0UmNKakpiN2pxdDlGaXZseURzL0tWdTZ2VEcwaUhF?=
 =?utf-8?B?dkdoQkEvRUdyMmhDdGlHd2JLdmlyRlFsZkRtNUc5bzR5dXVEQ0FEaFBtKzR2?=
 =?utf-8?B?VE1Qa1k1WGFlaC8vSGFyTmVXUHRFOWtKL0syTjEyeVVIcnhWNGVIcGlmcGZM?=
 =?utf-8?B?MEU1RVVZNGhTK3NwbXRqZWU4dGp5cTdSenpWRVdpeElrb3h4NlRGRkFlVDc5?=
 =?utf-8?B?c2dpOEdXSTBGMGJPNW5sVkpRN0owcjljWWNnM0VxbWxtOXgvVGphMzhLUEZG?=
 =?utf-8?B?UHpKSXM5TzY2Z1Rkb3ZmNFNKeWcwRGVoNGRMYnZXdytjS240UDdhdnVxVkgw?=
 =?utf-8?B?cnJ3VUFacWIrVlNpaWV3eXE2ZSt3Vmo0VzE0YU9vRjY3cWZWRnduQk9sNUZl?=
 =?utf-8?B?L1V2U3Y4aFpuWDVVYkhNVzIxTzM5T2V1enI4dHR5MmQ5WFhrUE5CY0NDcys1?=
 =?utf-8?B?ZHB2bWJEdUNMVEp6MkYwalQ0OVBEbzJXQzRINzh6ajQxNDI3a2FuMzhsM2JR?=
 =?utf-8?B?YVJOTmFadTA2WnN1OUNicC85YnltZGtFQU1Vbm1kajRrWEhvMHZ0NzNyNFh1?=
 =?utf-8?B?UXJjNi84Q1ZBRHdiSVdOUzFIZ0lCNGx2TFA0RGI2OHpxQ1NjaHlPakEwU2Jr?=
 =?utf-8?B?VzR6U3ZnSEtaT3AxT1p6QXJXbzk1b05vei9aamxJcENEdjcxMTdacXNDOGNI?=
 =?utf-8?B?OCtSdmNpblJYeGhnZUVQK21yRkhlY0xYb0lIZy9venJUalZ0eFVxeTRGcUY2?=
 =?utf-8?B?eTZZSWVGK1ZldFRNbVN5RFl1SGpCT2N0RU84aFViZHhidndRTlZYZ2FXMkJC?=
 =?utf-8?B?MWVmYUdKSUFLcFoycUdORTlIRXBvVnZoMzdYZjdHb1YxYzhmemZycEVndjZG?=
 =?utf-8?B?UGFvZk1zYUdWMEZCdy9xSEdtckkvVHE0TVRPRk9WekxFbE5lTjA1L2VwazY2?=
 =?utf-8?B?UWpvS3c2N3JwaFI4cE5HbHhYeWlreXYwaGpIdG5DYkkrdTBtR2tJQmNFRE4r?=
 =?utf-8?B?b3Yvd0E1MGVoamUyWHg4MkFocXJtVVJNdnRiOUpCZENmaFlubVc3dThOMnJn?=
 =?utf-8?B?VnpubW0vNVhEQVprUXVHTU1mUExYNGVJUGV0SW9jNUNUUEgwRUx4NWhPVlNq?=
 =?utf-8?B?QnVCYUNHeHFvWVBjZkZXM2NMblg5aDdZS2NYeTNPNjNFQms1V2pLZVJBRjFs?=
 =?utf-8?B?cHg5VUE2Z3lJeWN0N2tQbGkrSEZTcUptWFhpUUdISzhwenVKcEIwOWR2K3dn?=
 =?utf-8?B?SlpPOGo5SXRTcTc3S3htbzhrYjhQRkg4am5XSzQ4YVArSVNYdnRGTno1Vjhw?=
 =?utf-8?B?dzVnUFhaRi9relBVREVHK1E4Q0s5b2lXUENUd1RaQzZJZHhhdnRpcjViRFNW?=
 =?utf-8?B?ZEdRWnk3cUVrbnJ4RytRZTFlR21RK21oMDB3cjc2UVRUQ2I4RG8yV3JQOGU5?=
 =?utf-8?B?SkFyUGpuVy9BM1Y0dUFsUXJzWk5rOHdqQkMyUHhFQUUraGRXa2dzdDE0OGNp?=
 =?utf-8?B?ZEhpUnBWMUFlV0Fxd1dMR0lmT3NPdUhKaTVnMm5NYnUzNFRraXpFZzh2TVdV?=
 =?utf-8?B?eWdPblhDcjhXMzlmZU1ldyttTmhETnNDbmhsaGU1cEZUbGpXSm5mZEhEQ1Zw?=
 =?utf-8?B?dGNjQmtLTzAxTW5vQTdWU3hNTlJyN1ZudHVTeFNSeGRiaWNvU213OWd0Q1Jz?=
 =?utf-8?B?aUJKd0pyNTdhWTNJWUk5SVBNQ2J6ZDR4K2xEM3JlN1lNbHhIQzc2aXVNYjN5?=
 =?utf-8?B?aFZIeFhMNzFhMmVUb3NidHdBNkIvazUxMHBDRG9TTUZLcHJZc3lnYlhaNEVC?=
 =?utf-8?B?cTQyQlEyYXgvM3RrdHRrQXFJckRDTWhpdGloQ2M1d2I4UGEwOWJXckQvbWNm?=
 =?utf-8?B?eTVBMXJPTmphRUE5bGtHSXdscmpWenRJQzljbEk4aWZRMVVrVmVxNjZxMkhi?=
 =?utf-8?B?ZFE5TlloWjYxbXkwM09URkphUnJOQi8xTHhaVmZOaW1vbXdLVnM1Wkc1cTdj?=
 =?utf-8?Q?xDrNVzqcmBzN/7kI=3D?=
Content-ID: <2EB1A395E9B4E740BA8182F0534BFB0E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec63bb1-f9cb-4d5e-e56b-08da22aaa92f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 08:49:20.4307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QjPeJCJEgmq5gdBDbEGT1XbdsnR6m/Whe6pRcUPG9T9MjxdrcBdT+xymsLDW0f2pulLoz+UDCHmYbuffsMWwf63BY4MlRulbjYt8BwHPjzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_014932_585984_81372736 
X-CRM114-Status: GOOD (  14.86  )
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

On 4/20/22 11:32, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 4/20/2022 4:35 PM, Tudor.Ambarus@microchip.com wrote:
>> On 4/20/22 09:58, Takahiro Kuwano wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 4/20/2022 3:11 PM, Tudor.Ambarus@microchip.com wrote:
>>>> On 4/20/22 08:34, Takahiro Kuwano wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> Hi Tudor,
>>>>>
>>>>> Thank you for your feedback.
>>>>>
>>>>> On 4/19/2022 6:32 PM, Tudor.Ambarus@microchip.com wrote:
>>>>>> On 4/18/22 08:41, tkuw584924@gmail.com wrote:
>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>
>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>
>>>>>>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>>>>>>
>>>>>>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>>>>>>> uniform sector sizes are supported. This is due to missing or incorrect
>>>>>>> entries in SMPT. Fixup for other sector sizes configurations will be
>>>>>>> followed up as needed.
>>>>>>>
>>>>>>> Tested on Xilinx Zynq-7000 FPGA board.
>>>>>>>
>>>>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>> ---
>>>>>>> Changes in v11:
>>>>>>>   - Cleanup fixups based on other patches in this series
>>>>>>>
>>>>>>> Changes in v10:
>>>>>>>   - Cleanup fixups and ID table based on other patches in this series
>>>>>>>
>>>>>>> Changes in v9:
>>>>>>>   - Use late_init() hook to fix mode clocks and writesize
>>>>>>>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>>>>>>>   - Use MFR_FLAGS for USE_CLSR
>>>>>>>   - Add comment block to explain about addr mode in post_bfpt_fixups()
>>>>>>>
>>>>>>> Changes in v8:
>>>>>>>   - Call write_disable in error case only
>>>>>>>   - Use spi_nor_read_reg() helper
>>>>>>>   - Use nor->bouncebuf instead of variable on stack
>>>>>>>   - Update ID table to use FLAGS macro
>>>>>>>
>>>>>>> Changes in v7:
>>>>>>>   - Add missing device info table in v6
>>>>>>>
>>>>>>> Changes in v6:
>>>>>>>   - Remove 2Gb multi die pacakge support
>>>>>>>
>>>>>>> Changes in v5:
>>>>>>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>>>>>>
>>>>>>> Changes in v4:
>>>>>>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>>>>>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>>>>>>
>>>>>>> Changes in v3:
>>>>>>>   - Remove S25HL256T and S25HS256T
>>>>>>>   - Add S25HL02GT and S25HS02GT
>>>>>>>   - Add support for multi-die package parts support
>>>>>>>   - Remove erase_map fix for top/split sector layout
>>>>>>>   - Set ECC data unit size (16B) to writesize
>>>>>>>
>>>>>>>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++++++++++++++++
>>>>>>>  1 file changed, 54 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>>>>> index 493240ebfd70..dd37b829efbc 100644
>>>>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>>>>> @@ -208,6 +208,44 @@ static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
>>>>>>>         return 0;
>>>>>>>  }
>>>>>>>
>>>>>>> +static int
>>>>>>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>>>>>>> +                        const struct sfdp_parameter_header *bfpt_header,
>>>>>>> +                        const struct sfdp_bfpt *bfpt)
>>>>>>> +{
>>>>>>> +       int ret;
>>>>>>> +
>>>>>>> +       /*
>>>>>>> +        * From BFPT, the nor->addr_width is set to 3. In Read Any Reg op, the
>>>>>>> +        * Flash takes 3-byte or 4-byte addr depending current addr mode. Since
>>>>>>> +        * Read Any Reg op is called in this hook and SMPT parse, we would sync
>>>>>>
>>>>>> Hi, Takahiro,
>>>>>>
>>>>>> I would like some details, please.
>>>>>> 1/ with "this hook" you refer to cypress_nor_set_page_size(). Why can't you use a
>>>>>> addr_width of value 3 when reading SPINOR_REG_CYPRESS_CFR3V?
>>>>>>
>>>>> If we are sure that the Flash is in 3-byte address mode, we can use the value 3
>>>>> for reading CFR3V. However, the Flash's address mode may be changed prior to
>>>>> Linux MTD probe in some use cases. Actually, in u-boot, it is set to 4-byte
>>>>> address mode. We need to set the Flash's address mode in known state and update
>>>>
>>>> addr_width is set via CFR2Volatile, can we reset the flash at probe instead? Then
>>>> you'll be sure that the flash is in its default state.
>>>>
>>> Resetting the Flash to revert back to default state should work for this. However,
>>
>> good, let's do this.
>>
> I will do this in u-boot side, like Pratyush did for resetting 8D-8D-8D mode.
> https://patchwork.ozlabs.org/project/uboot/patch/20210625191729.31798-23-p.yadav@ti.com/
> 
> For Linux MTD, let's assume the address mode is 3-byte (default).

would be good to have the reset in kernel as well to avoid any dependency on the
bootloaders, but do as you want/need.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
