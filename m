Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A864C07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 13:28:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F726135B
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 13:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F726135B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhqQJlszdQ53oacTXGM8hBhQ7zubg4VvNuDav2Pp3Y4=; b=NOf8G1oSiB56/R
	Iv+VRpj86RfFPpgFDZ62sW7dTKWIlmnWHP6RQSx1n4ToGUhlZLEPajq8lYpH1mfZPzU8lcgMm1hgd
	vxlrObLnerGDr5BNKBSeuZZOJ/Qb/UsomM6AX4tqBF9iebQRtCXw2tnKsAXVdOwhIYi1Jx7aCI9t1
	Z7Bh+OtbhyFoHOSocEh8o/JaVr4bghk2gE/xIs9TXe4nXZ/KxpOeAc+RgI4Q9kZwIOSxa4FgY5URY
	6YFFR5dfEScmtglrogs/OvKIjpuhfQwDcoGihOohOHk14HvbkEJMIgi0NdKGva/iLqleiDS7dE746
	ZaoD+MVSPB75mnvrUiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Odi-0090eS-Gv; Mon, 05 Jul 2021 13:27:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Odf-0090dv-Cm
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 13:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625491675; x=1657027675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uo9EzlF7XfxCpz5ApOVLSJfoai628hksQVg3nSFQ3DU=;
 b=umPmwyrH56z4v3CJ+47WTtCKl1FKSb/dkcbF5Yz/ntigQvu1cgbJlth8
 HpfsYhYqgi5yNrL9XOdqLWML78+wDLQk8tozgGrdIaiKDgUmh6oLCrjzS
 gy88nHY79MLvq55GbFtX9PVleRnVeh45zNNVYTaPV5DWZ1w3Icyl1I4OM
 8JbvCeMoitg5JSl+vpf/Q8jzH2/AJy95qrtLMHSEyro0Sa2FS7U2V+YkE
 FBvYTLC3aRT/jvMDc+rNvoANyCTU74PNWhBvxN9jxukB1Mvby3Y+KDjBo
 JwNZPBKiWNn8+rwYmPizKhyd6YX5pUrYK4/ihJGdHWjYflZnOABZwYYRf w==;
IronPort-SDR: SfpNwH9M5+Qgmu1S0IANH1wu7RQ6CeOGdLRNW8d3ms/F+ZnCPQPoUhOpPNzoGvCD8FIheAo+Id
 oLK9DJlmHM/I5EwAYqNl2574SwZwh/UBH9ChR157ir0GXYbLXweFfxA6DEpfAXEp1n0TypU778
 lTYZVMzwyZbufDOpAFl1O5VY4+SxzD7iW3DGswNfJZmiLabF+oLf43BEEMfj7h8zvypcxPfuFp
 LrMvzpwyQ6M5lDz7BXh5LkmlrSveaGDXYiXl6vf3/EDUNYE4FTe/mvGopOnCx5Ac9LTaJZAJS7
 STQ=
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="121002641"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jul 2021 06:27:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 06:27:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 5 Jul 2021 06:27:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1cBWeowq0fvjCsjxy+V1xCpf2ZlkV64ceC+9vKKS8l9irWjnKh0V3KwMWlTSwDlO+MMXYM9N/fxlfCmup3YF3T4cXcqVJdjTEuDP5Crw1MeLjQN9SLwZ988wMVu3/0OvH3XEowHCIIqN+8Bm8DCceO+H5CmU6kjYmciDQ0yrrAckoDUerIk77FXBWkmgBmTQK1bhTneIq8214SRsE4fhbZHEKhIyllXwXGx1syDuZ72uVGDhhacTKPGprvcVMVYiImmkbNprQj2ncndMD6M6yNY3+fe0bikqVvExWRYKN2Kk5q1Qhj+FpOGNrBWur+Ix4m3aGP75MYGQ++7EcPViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo9EzlF7XfxCpz5ApOVLSJfoai628hksQVg3nSFQ3DU=;
 b=jFZmocz8qDPEwH3YVstrniFs1Z0QElp8LHFY/4rGQkua+f574rU0pct4NLWXwWknF+XE6asRVzgNCqvOH12YHILlaQ5rqx/11UseGCSxGxfdcEU3gk26gxvnDFsLmKt+GEItuYUBu28wJgRhQ2rlugQfqDzPgxaXw5QUOPCDOLujUkNxgOT7IjcXFBNmHRpH7Z1XPaDi7uLQ396B6f5y9CMrbIKK2DloogWHm6fQ1S9PMVWHQ67qN+BkTzPGgeHdawgL8pfmrr2ktZSFf/zFK1YnsnX7+CDMMOvnUVYx7OaK98fRuvJ9vjfmPFMUQldcY+EexRr/nYpDy9W7wEWfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo9EzlF7XfxCpz5ApOVLSJfoai628hksQVg3nSFQ3DU=;
 b=je2YmsBDgJkiMjnnTMboDOavia3AUGXfgOqcPLHcYRZIue3PKDA6evnDr1jxoo8meMWB2f8GGA7wDPg6wfgFJPRxAhCwCF6TRq/sp9jVw361bXbwqZbzzXR2CdiLGZxM6y9TBtCCIi6D8jclRk+PowRjydZDRbWiZ5ynx8LDMNU=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Mon, 5 Jul
 2021 13:27:51 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%8]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 13:27:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, 
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/7] mtd: spi-nor: core: Report correct name in case of ID
 collisions
Thread-Topic: [PATCH 2/7] mtd: spi-nor: core: Report correct name in case of
 ID collisions
Thread-Index: AQHXcaEQoPsVFqIFYEScMC2zhkoVuas0X9cA
Date: Mon, 5 Jul 2021 13:27:51 +0000
Message-ID: <888b75ad-e1d0-9ec6-80cd-de6796f1c4d5@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-3-tudor.ambarus@microchip.com>
 <20210705131328.ik765ywjryr44pyv@ti.com>
 <579514fe-3134-c964-48ac-af729c4ccffc@microchip.com>
In-Reply-To: <579514fe-3134-c964-48ac-af729c4ccffc@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9813c66-d2aa-4f9d-9ef3-08d93fb8b066
x-ms-traffictypediagnostic: PH0PR11MB4790:
x-microsoft-antispam-prvs: <PH0PR11MB4790F738AB726A6D62828584F01C9@PH0PR11MB4790.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LOrZAfaRuLgNBwezlYeeIAUCn4X4TQqM5h2KbfySvbblVAZpbeKzEIHXxxkuQsAYwMntAIz/XJurlqS0RjbKUreH6CBoERZf348cZmO/Y93gz2g7OKWtCLsTtUjV4F6yXVYNGFm9jVGGO14dOOrrIGUBdUjzc8YC4jcJyHeEb0Ap+Eu/ekvbm1oT36DsDYGjjhufloRFeJoND3D7lMnhApj3XmoAFkgLxclZ8V5q5erkirjbAw9xvqQBvivFWHLIepHd5V3ItsWxvxH7f/p/+f0yNkZj8WG3Jtu202cZROhyaSbZ+NFwcGXh7nkeuA5zOBkLMzrehhPHU25I8laY5aATAq3IzhUKi7zuTaEZYtK26WBscDlWpri9I3zAlymPmH/MQqcZBfVAnvm49Aka5wj1EarfFP0Q828rELa7ZWDjd+8JwHM0VCUoy0xnRTFejRDjcVdE+acNkU0DG8L6JPszXC1drKGAgV5pQSwvJ9Gz+YQzKVXghZD4iZRJpVRA3zbTetjR7mNIFqxgQuX2j5ecaQcrul9srpcoxNDfM8tOZDjS47pDAbk/UG3ZHjbqgdAsHVKFje0jo7JDKaZbi+cCk+o+WksYYl9M2O8Ydqs/E7BWk0bGC6Gs98dSaw5qFeFOJ9H4uCNnCWxoWPrqi1X982I2Lb+q3DB+VCtY4VDC4J4ygvgUeotunRAazArAe1TIkpxHE9wfWx/5KhE8MSMfBq3yxqnXFUmA6hClsttfqeyaCKdnCLn8z3UAfbn8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(396003)(39860400002)(346002)(2906002)(7416002)(6486002)(478600001)(6512007)(66946007)(31696002)(31686004)(4326008)(5660300002)(6916009)(86362001)(316002)(36756003)(71200400001)(66446008)(186003)(26005)(64756008)(8676002)(2616005)(91956017)(76116006)(54906003)(122000001)(53546011)(6506007)(66476007)(66556008)(8936002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXJwWk9RMUN6MGtxN0VzUzZnZ2RwRGtvOElJVUJGNHByRTJISExFWGw5bG4x?=
 =?utf-8?B?SVdRcTRZZHpoM1hWeDEyeU01R0w2ZytkaUVXeXFzdXRTS0o3T2s2Q0NWRGh0?=
 =?utf-8?B?N2o2dzdnZE04UmNWM0dKb2NDQjVYMUdIamJSM29JVHJOQ1VOU014OGVTZ3Y3?=
 =?utf-8?B?Q1BjditCekJRbmljOU13aEtwaExQK3V4Y1diV0NESkJpa2hIejRvUHRmR2FR?=
 =?utf-8?B?ZTIybFFYVmwxYXFkZG4zM1dIZ2dBc1l6SjJpWHRab3FrZGhHWUNWUkNEcG1D?=
 =?utf-8?B?aEkvd2Vnd0xlamFEN1JPdlMwR3U3RG1OOG45aFBCVG1qZEc3R1dBTzR6SlNs?=
 =?utf-8?B?bGJ1aHMvdHV1UjVuczErNnpwZG9rN2p4QThleEx2WW1acFZGY2Z3d081Wm1j?=
 =?utf-8?B?RHU5eHlKd1Evd1FXMEVnM2JLa1Nza3Z0TFJqMUszdW9NcVgraUM0RzVBYVJs?=
 =?utf-8?B?VThhNjE5R3pGZGJWL2M0dnZoL0ZXK3ZKZU1qUjcvVENackpQVU9JRFBTemdU?=
 =?utf-8?B?L0luQTJFSWZ4ekczZHFzMk9YaERHMGMyb2JhSDZzZitldVUyd1NoRTVsamdE?=
 =?utf-8?B?c1JLbnYwb0dQRWg1ZHNNMi9TTmphSE81YU03NzJ6SnhYOVplQ3dRZXZJNEJX?=
 =?utf-8?B?cTNYRWRTVXhVNFFhdW5lSkZqSVo4STdES1JKZ3JQTzNmVC9ISmpIaUZ0VzBh?=
 =?utf-8?B?ek5JRGF4bXlkM1FrcEcybFVqc1MrakxsSng5ZjlPWXIyWHZrTW42WGN5SXlN?=
 =?utf-8?B?WFlDT3BRcis4Q1BsaHF4THhsSVhKbjlVb28vMnhvL251MTJTV2w3TnlhUkFm?=
 =?utf-8?B?YXA4cDBxS1c3SU9oRW91ZXM5cTM4aG9udCtXY2IxTXF5Ty9leTVzMHliY0RN?=
 =?utf-8?B?djVlR1ZGNGJpN0kzL0RzZTA3WlRmVkNNR016WE9jemp2cnYwd21QbWZqKzBl?=
 =?utf-8?B?azZ6dS80ZE9yWFRoaU1vbE85c0Z0OTk0aVJJNW13MEtHZGtma0VudlNMeTZo?=
 =?utf-8?B?NEJnYkJrWlAyWmdzY0ppWnA2azRreUFiSnFtZExDTnRJbHJMU1AzYjdjcXQ1?=
 =?utf-8?B?ZE53Y0VDYXorbnpFeUpDSkg3bCtyYWN0VGtuMmRRbG05cHRsR2VLUWg4Z25m?=
 =?utf-8?B?MkRvR20zWlFJdHVJOTFPQTlhanA3OXNUVWszMnZvc2ZjK3owbDF3cXlHSEpz?=
 =?utf-8?B?b2htSnJVQzNOVUIyTG5SdEFva2JTSGYxSDJaeEhadVA2QXFWSWh3RWpMUEs1?=
 =?utf-8?B?NEpwWFBnQ2loS1F4Q1ZUWDYxbUtwUURwTW5JUEZDSEwrTHVkZzdaL0JwUys3?=
 =?utf-8?B?eWRtUEZNeGw1YVo4TWo2aUtlbXVFeXV5TkpCK2VKWjFHQTFtS3VoNzg2NFFW?=
 =?utf-8?B?UTUyYVFWazNoZVF1dFlqNGxDL0hVWjRINW8vQ0tIK1dqVVFsWEU4emxwQWhT?=
 =?utf-8?B?elZHYUVSUDJ5WEtQNklJRkVTUXhqTDNPREZMT3VLQ1l1a3d3RE11Rko3c0py?=
 =?utf-8?B?TWY4dUdLVEh2clFIa21rc1IyM3NLQzd6bFk0Ukx1UkxsYVdvYlBiS2lhbCs1?=
 =?utf-8?B?RHpzbDZCM3cycG1hZUwyMnF0LzdXdDVEemEwV3E4NWF5aTlDczk1VXViU3N5?=
 =?utf-8?B?alR4OGkyQWxxeFl6VFdxOTYrYWpkNWRiZGtjWXhKTVc1bGxtMUtnRWVTZWpv?=
 =?utf-8?B?aDRnSlF0WlpwRzUvWkRuRTZoNWpSdXFUdi9DT0RNNVdHbll4ZG1PMnFDZ3pG?=
 =?utf-8?Q?oyfHewPsjj4sIVMv20=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <7A2B34166007354DAC621DB85159C31C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9813c66-d2aa-4f9d-9ef3-08d93fb8b066
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2021 13:27:51.4359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HZDvbPLfbOmRW/JOPXBDRRCtC42Vb7xBZ+Ln8zQ1VV/cRNEfx6PRADjoa2w7BzD7dIUOCXG5MWtMmKvjwCAKVUEtSpAk8tmYc8upsNMsrGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_062755_545957_8E443B17 
X-CRM114-Status: GOOD (  18.12  )
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

On 7/5/21 4:24 PM, Tudor Ambarus - M18064 wrote:
> On 7/5/21 4:13 PM, Pratyush Yadav wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 02/07/21 05:41PM, Tudor Ambarus wrote:
>>> Provide a way to report the correct flash name in case of ID collisions.
>>> There will be a single flash_info entry when flash IDs collide, and the
>>> differentiation between the flash types will be made at runtime
>>> if possible.
>>
>> I am not sure if having one entry for all flashes with a collision is a
>> good idea. For example, say we have one flash which supports SFDP and
>> that's all we need for it. Another flash with the same ID does not
>> support SFDP so it needs the SPI_NOR_DUAL_READ, etc. flags. How would
>> you handle this case with the same entry? You would have to set all the
>> flags in the disambiguation function. And nor->info is declared as const
>> so you can't change the flags in there. Any code checking for
>> info->flags would not work properly for these type of flashes. Wouldn't
>> it be better to have multiple entries with the same ID and just pick the
>> one we need in the disambiguation function?
> 
> Your scenario is hit in patches 3/7 and 4/7. In case of ID collisions between
> a SFDP and a non-SFDP compliant flash, I propose to set SPI_NOR_PARSE_SFDP, as
> well as all the other required flash info flags that statically init the flash.
> The SFDP flash will init all its NOR flags at runtime, while the non-SFDP flash

s/runtime/based on SFDP data

> will issue a RDSFDP command that will fail, and then it will init all the NOR
> flags based on the flash info flags.
> 
>>
>> Anyway, if you do decide to go with this approach, comments below.
> 
> Right, thanks.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
