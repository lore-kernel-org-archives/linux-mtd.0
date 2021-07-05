Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A2EC07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 11:52:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C49E761261
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 11:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C49E761261
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9IBSlc/je8A5jupY+glHD2u7CVcU/uhQ2StWrU1DkI=; b=ug6c9Iyj2RVyia
	M/fxT+gyxynAcvL1yfBeQc28mEvnMIjGg2Nn4oBxCXrvAKWLrPMHCdJMNjNWqs5T2x0IM1Kj2PeOa
	/tl9NufmMLXjiSKhocPilqLJeI1Bc1qR/qXQoz4faS+xyhShoE9KvRXM6NcfNZwa0PGrcIAhZsuyB
	LmYqNUHtNg6Lq6LjVQc/TbGUzptqRfKd3YoTamPzKkhPf07Ourkj/mdojxmreHYM+HYTeh2UfsTWV
	VghVCuUfNmLtnH8o7pOq9wb3qp0Wh6GRhmAvkniL8F3o0/+dMvG76hfHvSRaUcuNT61sh10XkvpGk
	cNwpG1qA+oEC7mm84Xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0N8m-008rTw-Fu; Mon, 05 Jul 2021 11:51:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0N8g-008rSh-KD
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 11:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625485910; x=1657021910;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vwruEruH5nMP1R0mHEuMarjn5NwV1a0+H2vsv/I70Z0=;
 b=xcNgbnMRMAZgFWSsbCs3Ms66rK4ZxiEfgyOTg6/leBeCf/O31Eq+FrxJ
 Rlihb8nsr3hRGBmpxXmsaR7t7g1b7sNoX7XeOSJwwGOtnLmYQujx5fWFJ
 DK/Ls5QOkWG7ftJ3KUlVtr+VQbhxBaJVA/ThvNRof1PDXa5Ae3pNiTTk3
 HwfXzdA/sb6IOzyvzhmRwg5CdNk2n1p9wBdpTjZaHuzHAEkQPu7+Fiuoh
 nbgTYd7dwz8zTho7ltGWZjlJKUPaUlI3fUuIDlHZSQnndUWJbjtLtHFHo
 LjyT9ITfi1P+ezPwv6fJWq+cdlNHs6n6u+jYa1yjk/3HJRXLUtG6PDMzT w==;
IronPort-SDR: Z9WqTmy8fVj3mApV2wVPQS7pL5hWGFTj+lCwThUx+w2nqhTowQlx9YTEsz1BJw3bAJbeLaetwj
 fDEYhUcAjkX/poWftnrv8kHzjYoTjTr7GV9hXPXWO/Ql9jZh/DQKR/AtiL6GMSyWQgWFF6Jcnw
 Si1P/CCLvBozXWYAD8psJLauiydglz4/3Yt3MgCs1xcBSsHqfOKYpWlNdhb/kJhLsL7Rk545Jo
 sxDEXc7uqNuDrEn9LLcb6aNzgtbPe8RJXETrgTtoNwKqqg++0mN79aeSqu3u4x+stG6dI/KW2z
 5yE=
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="127691539"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jul 2021 04:51:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 04:51:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 5 Jul 2021 04:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwI3/IZ+YrNc0iP2BJh+i0FdrZEKBoYfbC5WDYHK1fuYiASPN/XkVzhshBOmZXk0jkxHsXqJx5KzH2ZnVh8ikBC2hHtS0cW9g5JS2rMIm5kGLJWzDwWd0QTXJlpPMARjSdSA6tm0155L4aB0NhQkcCuBGVP/ge/PDwIquZHFaVfD7Cz5ZerqHrrLvRwA4v/QW00fasGHUa6ovjJs4SqiKZlJjzZMOpd/BgRVMGdOtGLzujVRFWoSHmCD0OVu41wycGo86epqMqdsjWcsdkn/9SIjp0MzGKwA6LuEBd7xwRIg31hjCPBl4QcDOhR6QJKo9Yl/5lfI2W0pE//084teKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwruEruH5nMP1R0mHEuMarjn5NwV1a0+H2vsv/I70Z0=;
 b=WGmeKd/cclg/mWpU2tXngqZmbcIRSUOm3+OawDWDjT+wnnMN2ZHfPCE++7lpLe8iUJSH4rLrSkpEzTnYLr3HkQ0hjRUCK0+cdFTLUKxDH3kLDANYWQOJL88Ph2JzWe0bJkX08sV5BBAXIVYHhQ8BoVCIQGBS07BvIHf8dBOlvpNUA9GfrVKxk589R29c1QVuAabPP18f2v9jELoxiEXSfLGHE60Q104SKmZFFLbQqoTRv9YIoukaErjjtzUVAMK717jeEjhRw119aZfV6r6Rx9wjGklzgRqtba7SlAp1zHLw7LIHfM+4wFrbM3OdJic4EkT1FDmuLXbxKo+fF9CGsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwruEruH5nMP1R0mHEuMarjn5NwV1a0+H2vsv/I70Z0=;
 b=R+7V65YVoZqv2qyY7qpHhkDI+6/6KJyYf0bTttDPHKVbipoRqz0n26MKAB+tXBQyNvVShJmm7IWWRu0h5v9+Z3K/2LMbGo89o5NfBKACbHCXWDWBvntHMK8b/nE3yfvONIW/ceoXrkFgL43FlZyaia7sHDLvwaELwIEsBiaD5a0=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB4886.namprd11.prod.outlook.com (2603:10b6:510:33::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Mon, 5 Jul
 2021 11:51:37 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%8]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 11:51:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <heiko.thiery@gmail.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <macromorgan@hotmail.com>, 
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 4/7] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
Thread-Topic: [PATCH 4/7] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
Thread-Index: AQHXcXKRHz1uRIcjJ0CaTboCLCCPDg==
Date: Mon, 5 Jul 2021 11:51:36 +0000
Message-ID: <9bef21c9-60a2-953b-d6f0-be0241a1916b@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-5-tudor.ambarus@microchip.com>
 <25fd3d28-6320-98fe-b0e4-8caa16c3d357@microchip.com>
 <CAEyMn7ZjBPOcfJ7i3b01Oi-VxrVrK=m0UwfOYeD6sU9t0gAM2A@mail.gmail.com>
In-Reply-To: <CAEyMn7ZjBPOcfJ7i3b01Oi-VxrVrK=m0UwfOYeD6sU9t0gAM2A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f01e82cb-ee4c-4bfd-bfc8-08d93fab3e71
x-ms-traffictypediagnostic: PH0PR11MB4886:
x-microsoft-antispam-prvs: <PH0PR11MB48868E37BA52BD0271A317ACF01C9@PH0PR11MB4886.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZXeJJlquGvEd+7UbAuV4ZCrx27IwYWUI/nZWHhhO57gxnYniF0dq90ci5fam6F7LVuWcdwAvxGRbuUVo/KheYWZfQmI3avv/3B8z4tLHGgWLd7gEugwyghn7ncMPmzVLj9Vny/qXD0nG08a6Uwfo6Om/RRhbQLMmJdF7+8vijVFfTMIMwm7+tz93CQQedJnvCBb/vcHp+Uw9N8p7kSFCB8Bh+1WHb+rTNurp9JwrRXjI5CC4+ynsOFKOb3pIyDfBOBpowx0OZvWEM3Sh0f5Su9R4QCJtuf+aXP+rq0UvODsbstNHsAjK8e3vxxv5PQzRlR0qlV46Yz34yIz77L2VHCOqnJs8j60YuDzgMyr5O0WJlg8tgWGLyorUq3ikDamqXI01ME4w5gPqnDXTKbqJaR7c4hJ1AGYku9sE5RQqRVLG/Oph2oYM+KmhmMb9cGwYJ/nieqkxMSyA5razjbOfa9UCmH9/y8ibVYYp405aRh64w0HW8xzizglsd0xyW76SAZM0V39NSRUiMdCuDk9ucYKPt0PSp9/7ypOmF0WRgijTdhi5GyfZelmYni3SQJNn+uDNPew0CkzS8TREHSw9P6q14VapTcKgEiITtZuaz8DmRARpWWztc7hw+zYRsGGvQI9ZjKrTgzs7LHJLdrZ7EfNP0QlghwBzLKkHiGd1wNbJda1zMo73V2g6p24tvfo1MoTtvT9fnOjXfiU++UeyKDiOFzk584EnkyhKxJuSlTvpAowhuG67wSmYqbv7/n5I
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(136003)(366004)(376002)(396003)(7416002)(6506007)(53546011)(6486002)(31686004)(36756003)(66556008)(64756008)(66446008)(2906002)(2616005)(6916009)(8676002)(91956017)(76116006)(86362001)(66476007)(66946007)(54906003)(71200400001)(83380400001)(8936002)(6512007)(26005)(478600001)(122000001)(5660300002)(31696002)(38100700002)(316002)(4326008)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3dZUWxXb3puU2RLakdpSkRNNlk1RnBoVjdzRS9VQ3lXVlJYT2JRSWJDV3pW?=
 =?utf-8?B?TzRYTnVkdEk2SkNhdFlWRlNqT2o3NDNGRmNBOG5JeTdzTFhLQ3RGQ09iWG1P?=
 =?utf-8?B?a0dKZkJCMHRPOTlCT0x0cDVydk1GdkNZakM2OGlDaFlhQ0xQN3F6UVFBaVpo?=
 =?utf-8?B?REgrWVpxd3hSbXhoVWNWNmlYTTVDd2lqckFRRm81dUEyZmNVZVpLVmJSY2Zq?=
 =?utf-8?B?OEUxUzdpQkZrRkRnRDd4SHZ5ZHVLRHViOFA2VWZPTmVUVEM5a2ZlN0I2aFZa?=
 =?utf-8?B?YnVwYzJ2T1FmMitweVhkUEZGdkZGa2dwUUR6ajNMdmhwV084ZEVKbndMRFZN?=
 =?utf-8?B?VWpXd1FPN2F6Y1BzV1hMNFZ6OTkxRXVoY2hyeEhaOGVKK2JGd3pITkxScWNQ?=
 =?utf-8?B?eUw0Q3hSL24yOG1NNmUycXFIV0FOeXRGZlBYdGorY2tUa3ZvQVBlOVVja0dY?=
 =?utf-8?B?M3pPNEIxUTlGNVlQYllyYU1Pa2dIbnhCRlVvOEVpQTFZQTVyc0JldnJjc2Rq?=
 =?utf-8?B?L212QjI0am1wWFV2QldJclZTczBxeFlyeHhuem44cGZoV3VGYVhXZk1EdUtW?=
 =?utf-8?B?V3ZuZjlybEJ4WDFaem5jS05JLzJqZEpSc3ZWL0lzb0hnWmNicGdoR3BWSWpV?=
 =?utf-8?B?am9sRXZKUzk0WlROYWZNZlFIKzBHUExzNk5oL0RqWldEeTAyWWdWRUZYazFr?=
 =?utf-8?B?SDlJcnZXdGNFbmR6SWFBUHJxelp3TVFuOWZsYTMyQ3JURGZreWQrd283SXZG?=
 =?utf-8?B?d2Vrand1akhyZXRxQThTNmtuT2NyUmdwa1FkUXZIUTNYcVBGb09PYWk1QTc2?=
 =?utf-8?B?cXByR3BORkhhUTRGSEFCU01uZFhwUmZhRHByM2lUSCs4YkMwczRlUFpicS9t?=
 =?utf-8?B?Mk90VVYvaUVKQzMyTjdFSHhYRitHOGR5T1l3OU1wTmx0K1FBNzZhMlF6VlJz?=
 =?utf-8?B?L0RyTXpDYW5rQ0ZnZzc5bjVNYm84Q2Z5RExBbGoxWnpXcEVSVnBwV0I3UGVO?=
 =?utf-8?B?clFpcU5ocGZjOUJ3eXFUcDBCb3NsT0pqODFHUHlMM2Rsd0p0ckxJbVl6c0JB?=
 =?utf-8?B?LzhaK2lSVjFrQ0diUzdNbXFaK0p0ak16VDh2N2NzaGRqVGhpT0pVV2NacXBt?=
 =?utf-8?B?dWdBaXZQVHhjK082R3BCbkVZc2NHcEVSYXVySVBPZkFHV3NUcWoxZHljL253?=
 =?utf-8?B?dUY4M2ZYVUxML1VzemlKZXNGa0h0anZxdjNvbkp4MGlsMnRKUzVCOWkvcjR5?=
 =?utf-8?B?WmcxemUwKyt0dE1TWFdjdlp2NnZBTnROMnI2YnJtL25KVUJJWXlwVFI1OUVX?=
 =?utf-8?B?YUtaTlZXeVpSUTR6bTRsc0dRMkJQRFkwNGxhTFlsbVlYdmx0WWllREpBNU04?=
 =?utf-8?B?NTVlNk8rejdFYlN2UjlZcmdzL24yZkZQTWVXQ2lSem8xbkpXYVd6VVpTNGFV?=
 =?utf-8?B?bjZnQ1o0UytiNjVNNG1Wd2VMRG4wYTljTlRkSVJMaUV2eTZqV2F2YjZpR1Ni?=
 =?utf-8?B?NGs1QmNwcUdDMnY1ZWZMZFM4QjZwckVneDFBZDRkTXl4WEtIaGdXMysxMFhk?=
 =?utf-8?B?VEhCRDk5eXRPRVdoakVnT2JGZTFkWndLSW9jMkFjeG9sY09FcVJTU2hRM0Zr?=
 =?utf-8?B?eWUwd0pvZVJyZXFjMVVVMDhsSUhJaWU0dEhBelFMRlArV0JKOFg4M1BiOGlx?=
 =?utf-8?B?ZkhOOERsellyU2Q3MjJLUzFHa1IvNXBVeU45M0tONEFtYUpaOWRYVXdXN1Q2?=
 =?utf-8?Q?4L9ZRcABDFxCAID7FA=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <E87632C3EC26494D80FBBD0DE6279A37@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01e82cb-ee4c-4bfd-bfc8-08d93fab3e71
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2021 11:51:36.7741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U8EQDlu3syh5BVOnx2uUevxdJOq78NGZenK4qXhGpuzCxkiwkA82rdIswpy1m56EHpHqFv1G/YbCeLI1z86Q/LtFVnp3bUadC4GeM0e3Ky8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_045150_837770_B1936DBD 
X-CRM114-Status: GOOD (  15.47  )
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

On 7/5/21 1:45 PM, Heiko Thiery wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> Am Mo., 5. Juli 2021 um 09:51 Uhr schrieb <Tudor.Ambarus@microchip.com>:
>>
>> On 7/2/21 5:41 PM, Tudor Ambarus wrote:
>>> +     { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
>>> +                           SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
>>
>> I should have removed SECT_4K, since 4k erase should be set when parsing SFDP.
>> If SFDP is wrong, we can amend it in the post_bfpt hook.
> 
> But what about the 4K support for the "old" mx25l12805d that does not
> support reading SFDP? As far as I understand, the post_bfpt hook is
> only called when the SFDP was successfully read and this would mean
> the "old" one would never get this setting.

You're absolutely correct, we'll keep SECT_4K in order to not break backward
compatibility with the old flash. I thought it was a new flash addition. That's
me replying to emails while being distracted. Anyway, I'll have a documentation
written somewhere about guidelines on how to propose new flash addition or how
to handle flash collisions. Everything seems fine here.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
