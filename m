Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB38DC07E96
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 05:20:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 982B86144E
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 05:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 982B86144E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eixOz5eqqFtXheExJXbPY3npPEnudd6nw9GvydikJsw=; b=VP4KV8FIHH+EMM
	qZdRLiq3ZGfRfzdm9WxoAEXOpUzVO2ruma8UTqwxkykp1uYrldI6TCSXBANpPoDBt7ceqzqQqOESC
	vg3nhQDO3kjKVtp9a+9n0fBDWMSby2cGLFik2E4MohZRTWmmDjYFNyZZjqqrw88dplurcCIP0H9Y8
	fXNpm85zcoNnM2mM6/e5BEaWkjZX69dUqnWeZhjbR5E5ksVCagyC+y75ayRDN6ysarTX3TKrr3Q5s
	JIWGZ+tTTxGvjSTHrIJ7byojqTOTWrnEk96/L95lxxYsqdH8GZ6HIInS4oB8/P/WuEyptvoMelBrm
	ZKzu2j5hXY18ahIzHOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0dUp-00AJWU-GB; Tue, 06 Jul 2021 05:19:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0dUl-00AJW1-QJ
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 05:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625548783; x=1657084783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CKq08gB2IMAzRhlrKjI6mlo0HIFDHdKm2fhBsbyaG70=;
 b=B1E14OwD6HjYkuVQKC5tDWs1aDSlIzlJZGgfp3knkjoz4BY97KG8mJ+G
 otWqKRxAODaNX2InFNfnEenqB26yEnIRcKLxF+wfXJUiisgbmtWZ9dzlR
 W2lX4U7ZNd3F7KGyszl1dz8epWgJcaksjVwfODAEISCS9ox+hxb8Qo+Si
 bOUe9SDx3vDZkjLsMi+ZqH7Wtaikj3r3hIL+mHYcDh3qIkimeLqeX6Mnh
 pAo2T29V0p2C5pLhDpZ7GmEMBQrCE3X6bqB9KWkD6dGPUiD+LPehMdctt
 3kCZ2ssKa8hFCVxwYGPtJDHGqnDqpP5OVqgiRWLvM66IflsfTGGJLw4mt Q==;
IronPort-SDR: n7tfh/2j09MXLGGLaHu9a+8cU0S9gPIaqPhHbM3rYsxHXgAkgydhGX5+Bq9aCzsVbLtLqiVPO/
 2KGFRK3G5VDPtZBNqlu2+Cbyl/jBazWvOBFC3LpTrVLDuqmP8BAvarS4JGCrA70dnCOR7y+h3r
 NENcHzk18mCkM4DoOCMX3U+JiK8NinaQjsLHBS63rX6iNILIznsGvNzMVT6nGA9SApYRnO1ho5
 ihvCZvjfsaqLuDW++cVeFLtOWMJa4wFhS1XVC/xigBpqNG/2ZWd0lYuopN2p+o+avFtFWw/wkL
 LkI=
X-IronPort-AV: E=Sophos;i="5.83,327,1616482800"; d="scan'208";a="61242093"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jul 2021 22:19:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 22:19:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 5 Jul 2021 22:19:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nbt1nMA8uPJmBnow58Uhjjo2Z155xTMMtRk5Q+xiPumeE7SG6PTkTkD0+LiRy2JVNNoYLm3xa+3KWnOINAtrfVONli9l7EZLLy5Q96uQ92lgY6wmRleh2U0/Air3ThVEgl36gt4yGUYXLrsjF15cBJheV+BsVTdlpHtkEUHev77NNyzSxnaynpu5HIVySm7XDYDfN5Q88VUUT7ymukG6s6i41s7Rm4WUbRcn7CT975RRbT6cxZfcm3iJ9siqxFle3SUBGrHGV5yNTxq/yN/iVtaWqtOwIldTEugIWBsGC7QT5fl8W0lONnK0Hr+ov760O+7oMer/kR+esFNiVZc4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKq08gB2IMAzRhlrKjI6mlo0HIFDHdKm2fhBsbyaG70=;
 b=JEpwkPbIguM1TMFzz6uZj+pB7CtIRL3uIOJLPHYd9KLiLjuns4r/kDR6ZSLE9pg1WexhfNIaqNRjuAPvj4k2qVAZ+mmNh6Dq9fpQcGOBwLCOS72+omac7z9MRqMDNk3gt9xw6S/KsGWYkWM3W1QZeG6c3VEdWEMqdlwqx7A+CdVgYpd1yQuLvfqJmjVzK4qCzKqQybOFF4uzVm3Ks1khIx5HIoJpvMkadvQpmqiBiIWh5PGa9qOfryRm775q2DsANc3XNRO3mrNTfzULWmsOIYauE+UrLJ4MuHLV/9Td7i4t0istSlrN50Z80cU/l9R+Q9MApmOvIfxho3KIPCK9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKq08gB2IMAzRhlrKjI6mlo0HIFDHdKm2fhBsbyaG70=;
 b=Gb1LaRPOHOvcEVEfwnG4bD1gvbvsBJkvvks63H4Ew4M6Oiif2t/eDwi6v8QvbGXS+vkfqVt27Nor5+415sXCubjkRUBg4kLgBNCqC1KHLSCEw4fe6ye/9cDJt+xElbaz1JqSNlWUu4gjaEeCjyLJzVkIGOOtrDxE5aerBPguOQc=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 05:19:36 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%8]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 05:19:36 +0000
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
Thread-Index: AQHXcaEQoPsVFqIFYEScMC2zhkoVuQ==
Date: Tue, 6 Jul 2021 05:19:36 +0000
Message-ID: <8653c22e-09ef-6457-819e-636249840149@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-3-tudor.ambarus@microchip.com>
 <20210705131328.ik765ywjryr44pyv@ti.com>
 <579514fe-3134-c964-48ac-af729c4ccffc@microchip.com>
 <20210705160950.yaablyujefffhz7o@ti.com>
In-Reply-To: <20210705160950.yaablyujefffhz7o@ti.com>
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
x-ms-office365-filtering-correlation-id: 5026fea0-09b0-4f61-cdaf-08d9403da582
x-ms-traffictypediagnostic: PH0PR11MB5127:
x-microsoft-antispam-prvs: <PH0PR11MB51277DBDB1EAD312ED7CC199F01B9@PH0PR11MB5127.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sM0zoCRuHOcDD5F4tJ6HoX+3x1JlxBm3ZPkoFnl+6ipn47PQ+iFfQB8sGklA4jRds8nxVmiU651Dk1fj2udrvDouLg3WFQa/7yC2lKzeuHUpMcGRljXmxybdEcCKjtT/G6Cgd1SWgZq2kFkrKCeZeihDgqackQp26MeRqR7lBYFqvuPCWjciR8k4xAfD5nYOaS12XkGr3VhCg/cLyxa0x/fg4xlxxMtHG5WtNW7tD/57y9cfTTRC+SfSvZS86mbV8cH9RuVlwK7CuFqzrXe5jZrCPjQA8JK2oqgUDTxZf7JeasP1mtJ6ApHfgtbiasSGIxnnP3J4M4k0g7XwQ0eZmyjoolFyl0SWBWdLdITH6WB4wyoklzC4Vg6/aXQVI5H1gV6tUotV725Q8uBBATzP04vwD+rPB4SjnuwEr6gB5E6emK3GFxHyzLZEIl5GZr9ex9TM7BJo38KoJKphI8+2PzinK7kDz4IbNvMw/Z4mDEDGoWbq8XC/RdvjRhxZFQwzdq9oBnyyRdwfL8yGHhTwr3B9O6vdYnnia+ZeMH3DJJaR1SB0vtEv+7+RBqObn/lrPWyaEa2IK15GoqEyALMnbglWCtXT1IUVedNl9/eh5xe0tTjpp2GrNW9cJx/xDazQNMfJhSCCK3YOuzzibf2UMvpcufcc0wRJBNz/XTo1bhjtT/Kv9ovAjwgZXvKzy76ygw3M/N4vFv1vcZ1IbSRV4VHROhEOdahQ8zy0Hm+d+46qLJGjPtcgdhWW3jcqA8n31qKBhkwu6K6XsxdEHJDkYpjuCbZXxgyCjxj2l4imOmGDEC9hXF9WRlRHAoikrrLf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(396003)(366004)(136003)(53546011)(71200400001)(31696002)(122000001)(91956017)(6506007)(6916009)(186003)(6486002)(6512007)(7416002)(26005)(31686004)(4326008)(38100700002)(86362001)(36756003)(478600001)(54906003)(64756008)(2906002)(316002)(8676002)(66446008)(2616005)(66946007)(66476007)(76116006)(966005)(8936002)(66556008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1dnQllQR2RNUGRTTVd4TWxNMnp0eEREQjN6eWRBOW9CYnUxT3dDdlZrM09n?=
 =?utf-8?B?NTRUbVJza3pFSTlKZzVRWkxoZkxmTVBCM1poSElNTXNIZVpqMldXT0E1L0s3?=
 =?utf-8?B?SkFScW44VlhWRjBCTCtjU3A2RmZ6SlpyTzRuNkhuQjRkak1hOVlJdDQ3aHp6?=
 =?utf-8?B?Zk5UZGErdDhERWJQQUZiaDdpNVEwKzFIUTNQZE5ZbEwrc2RuZW9oSlR0NnVx?=
 =?utf-8?B?Q2hLRTYyQjk1WWdadmVVOW1YYTk4TTdqYVBXUDB1MTBhZ0pzZEw4c1ZKTC9u?=
 =?utf-8?B?OE9vZ1lobnJMYmVpVld3SUtDUlpibDJ1UzQ3R2dWSm5kWEY4ZzlEZC9FU0du?=
 =?utf-8?B?NFR2M2svSzVCK21MaWhtRndpY0ozYXEvUk9tQVVrZjhMVnFFOXF3YTloejFt?=
 =?utf-8?B?LzhPdGhIUzQxZzZzN2hVdy92cFFtbGNwMldycUxua1ZvQ05TRnpPcEVMQVp3?=
 =?utf-8?B?ZjM5ZkNpNjg0UUZGb1ZWUndDbU5BMVFpSHNmWHJQQXVqQU5Kc01lY0lYeXFv?=
 =?utf-8?B?Z0F5OG5RN0E3MGlJbUhRRWJXeU1IdS9CaHB3YUQ4OUppQTVvdlc4WkxwWVJQ?=
 =?utf-8?B?NXgrZGdzR0ZGT0h4RVY4UFA1TDdHQlJkS1dqMGxZWko0L1RWTUJ4RkNIQ3Q3?=
 =?utf-8?B?NmFaZjZZcHRaWUhySVQyUG5zWVJrOXkvSUUwUTBOT0dtT2VQdU4rU0dlR1Vl?=
 =?utf-8?B?Um9ROVlQbFlsU0d0Nm9FTmlQeUlXRUVtcERNV0w2djZWU3MyRjdpN2twNUtP?=
 =?utf-8?B?WU10QTFMS0xXdW5BNlFod3lYTGQzNjFTRmxidUREQndMZE9yd3RqTnNWclJF?=
 =?utf-8?B?bTVUR1pZSVhBaExYb1NqZXFwUjVRY3JQbmt6YWxmVnNncGFZRmdCSEowNUww?=
 =?utf-8?B?cUNvUzBBamtzNVkrY21yd3RlTkMwT2xhRitoa3R6cUhVaTUwUVhFRy9UQVhw?=
 =?utf-8?B?MlhBb2MybTI2TGprMEdMTlJrRFhOeDJVRjE2SWk4eEpneDhJM0VWTHFuVFBr?=
 =?utf-8?B?QjdMRXlkVVFGOHVtWXFVaVNaOVphdDQ2d0Z6Y0lvT2R0WkpmekJ2QVVFQkZq?=
 =?utf-8?B?b1pwQ21ZTTBSTUNMVEk2SlprUHN6eE40WHU3dzRCRm8zY3REK3V2dXY2VVF0?=
 =?utf-8?B?ODVuRHdYUWNrZE5aZ0VFdFhYUkFhN2Q3dVpkRU1OVStxUUg0QmJJQk9SVUtp?=
 =?utf-8?B?azJQWEdneFltWW1Pd1F4QWFQQnRvMFA0VUhsNG1kZlUrVGJtMk1xTUkwL3dr?=
 =?utf-8?B?b25oYVdGcllsZEViR3V4WGZDMXhRTU43Y1VUN0VQc0VhcFdxOFQ4RGNSaGdK?=
 =?utf-8?B?WEQwRE5oUWFhd1FYRVJkVjFpOGxPWFNuMm9UZFJKQXFPMEpKVzZuOHIrTzlR?=
 =?utf-8?B?Z2FnaW5mT3A1T3BKRnlPSHkwSkE1UDQ1TE8wQWpTQXZpaG5qbUhMMzAxMDZp?=
 =?utf-8?B?b3pjMk0rRG9Ic1JOVkMvZXlHVVR6N0EyZ1RNUFk5YW1MTjkzTGJEQ2tSbi80?=
 =?utf-8?B?a0FMd3IxRDhobmMxZ1owTkVIanFQaVB1NWRQUmNLTjZ2d3FZeDI3d0RIendp?=
 =?utf-8?B?cE1Ld1VYMHlaaUUyeFhzNmdZWXRuWVhsbU40VktnaWNBd1pKQU9CdmtpVkto?=
 =?utf-8?B?UGpkUnNxZFY4WkZvQ0VrOVlkRDd1Q0hQeDJkMStKZnhneXRrTkM2WGd5UFhl?=
 =?utf-8?B?ZlRtNjUwWFJsWXBTVFdyaStqejV4TXdWd2lpejRWdUs0SENDVWVCMzlYS3JZ?=
 =?utf-8?Q?rU3xkw8nW4DVS+NTDI=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <8F1FD5CCCE95414F9CF536EA3444F438@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5026fea0-09b0-4f61-cdaf-08d9403da582
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 05:19:36.2695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: romCnZ8xTDYwlv6HQJc1I54vK1yLbxgvtOHYPuHUIfxov9FMk5k7EShxnOxxnjXKJ0rGxWES0N24dW9NDU5v37ZG3RIrdkEDd30YD5F3bk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_221944_075967_A1F92248 
X-CRM114-Status: GOOD (  28.42  )
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

On 7/5/21 7:09 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 05/07/21 01:24PM, Tudor.Ambarus@microchip.com wrote:
>> On 7/5/21 4:13 PM, Pratyush Yadav wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 02/07/21 05:41PM, Tudor Ambarus wrote:
>>>> Provide a way to report the correct flash name in case of ID collisions.
>>>> There will be a single flash_info entry when flash IDs collide, and the
>>>> differentiation between the flash types will be made at runtime
>>>> if possible.
>>>
>>> I am not sure if having one entry for all flashes with a collision is a
>>> good idea. For example, say we have one flash which supports SFDP and
>>> that's all we need for it. Another flash with the same ID does not
>>> support SFDP so it needs the SPI_NOR_DUAL_READ, etc. flags. How would
>>> you handle this case with the same entry? You would have to set all the
>>> flags in the disambiguation function. And nor->info is declared as const
>>> so you can't change the flags in there. Any code checking for
>>> info->flags would not work properly for these type of flashes. Wouldn't
>>> it be better to have multiple entries with the same ID and just pick the
>>> one we need in the disambiguation function?
>>
>> Your scenario is hit in patches 3/7 and 4/7. In case of ID collisions between
>> a SFDP and a non-SFDP compliant flash, I propose to set SPI_NOR_PARSE_SFDP, as
>> well as all the other required flash info flags that statically init the flash.
>> The SFDP flash will init all its NOR flags at runtime, while the non-SFDP flash
>> will issue a RDSFDP command that will fail, and then it will init all the NOR
>> flags based on the flash info flags.
> 
> spi_nor_info_init_params() is called before spi_nor_sfdp_init_params().
> So if flash A sets SPI_NOR_QUAD_READ, flash B will also inherit it even
> though it might not actually support quad mode reads. You would need to
> refactor the parameter initialization path to do SFDP first and skip the
> flags based init.
> 
> But that doesn't solve all the problems. What about the flags that can't
> be discovered by SFDP? I see SPI_NOR_NO_ERASE, SPI_NOR_BP3_SR_BIT6, etc.
> that are not set by the SFDP path. Some of those might be discoverable,
> and we just don't do it yet, but I am not convinced all of them can be.
> For example, I don't see any way to discover SPI_NOR_NO_ERASE via SFDP.
> Erase type 1 field in BFPT is not optional and has to be specified.
> 
> How will you differentiate from the SFDP-discoverable and
> non-SFDP-discoverable flags? How can you which belongs to which flash? I
> know this is a bit far fetched but let's solve this problem once and for
> all.
> 

Yeah, that's my goal, to solve all these once and for all. I've started working on it,
and refactored the params init sequence. I have a WIP branch at:
https://github.com/ambarus/linux-0day/commits/spi-nor/next-id-collisions.
I'll post everything after I finish, we can ignore all this for the moment.

Thanks Pratyush for your insights!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
