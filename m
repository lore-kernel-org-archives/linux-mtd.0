Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563AEC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 08:10:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23A556120E
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 08:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23A556120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Krm9CU34JPG3m+VtTMOAYVwsHY8tc6M9kLAHdxDUg0=; b=iQ4zAUS4CrvO2r
	u4At2whBiCsGKAvL+phmTrV/s7YHg1uBTje7p7ix+6/kkAwLMcXxCBIb17w9XG65T1eRJgak+UlZY
	ZCezklI2V5jkoLNHbiFLKKYr6hawjoG3scVfYpsTv/6ypAhjy0H1xLtY/ZIU7uX5HeGZwAY4MAk39
	rlF8PadNRipcfKPShAaYHWACvZSAiiPl4Bf/WY3j9D+p57g3LVstLqjcZnQmfSMYBeEpFsyh0eif9
	B0QcFxkXY56+6rTkmu56JgDEKjSF1YDHUpuKobMQJuC5i0d8IprXoRiv4+GXQ2oJgVjLGlLO8LTKo
	eqJ6Zvs7n0MsTPUpxxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8I9b-00E04p-Ge; Tue, 27 Jul 2021 08:09:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8I9T-00E01V-0L; Tue, 27 Jul 2021 08:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627373362; x=1658909362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qr5P+QFcxS1euS4xgVKp6ufcat7R0xNCqAPqOW8jzb0=;
 b=SPnsNNozYrO71KiUehDDcvrRP4U/tRyFvIUBWXPL7yhEEcZj2uVWqYDH
 BqYyWnX9Qd9CE+/hdYHrPQ2JjlqSc5VUnDrdQwU23IQKvtqLVBAhD3xYQ
 eJNJWQ/Dz33pNgVgOk7zGuxMRCju+2rmXCQaxs/lkz0TwrOqD+MQRhxIJ
 NsU1F3vMeYodJDBnaMJ6YO309E42YGF1GiLjo7xBafwJCyxIvPVU18cf1
 0wLssnPObedRbP6XqP2H6zgREC0Ds2Mz+fVnS4h4jLbZ4IlkQExH4jrKT
 qgPkTBsxEhoQOxMBTkmqzNVUSe3RcX9gxeNq9ZcS91SXOCHKImRLftfL6 A==;
IronPort-SDR: x//cRlqurBTR7mTVx6XdG4vyGyy4axSDUqBECSCPvEwSw2ltpC2/KtoEH8pV0JxxjC0R5Qvl++
 +qt3JuU5MtmfxOdkHiG0+XNHIpnwGU0pwZcuI2doRmhhUsf2OAqG4E55QrztJjGZIuPKBGKG5k
 loxBrJ9bJabDNY+aHwtHjWFWwMv2fYrl1HbSFWJX54mHQ1u31oM1cT/rLs7YffRbdtgFp6eZPD
 OClqCMaFO1tanTl8R1IhmjMxbwPEBtIgduhsGzkx8bydjsB2HvxP+hPEOKpWmcJKPBKGSuFPg4
 o/ZJ36an/6RSF1l0K59j7aiD
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="63709970"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jul 2021 01:09:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 01:09:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Tue, 27 Jul 2021 01:09:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPkxdJ8nIylcR6rHU+YqhE2q1B7cXcXxOfIpjho7+X0QEpYZj2puSPWwiuwbPTvvNGV4CE/pgBzFLhaKDETsyZqG1RpxZZpbc22I44i/dJGIehTfwhGKg3D7TuvE+TwtFONiUSeJ9uva+mkgSx6oGbym++2a0MRKiDqSKmYgrVwxej5d+Ca9pfxUqWwMb1+CBbLCYQCAShxtyJM70IGKtbaDUcf7hvfbHPQeDFNlqF7s6BpnSRZ0HfNN4D9iohiLfgigzDUwjj4sqUcv0hxYwfHcLZXHTx9/I79CvCingL6DMdNQrN2P8kSQ2aphqqCtV65qj7AtpKQbi94EV9V8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qr5P+QFcxS1euS4xgVKp6ufcat7R0xNCqAPqOW8jzb0=;
 b=Aig/EHLAN5GfyDPZMUVsjNtgbpt77WzaqNkwE0e/GGf6hWaTzNicvE+SJlm4Olz/V1Qrre4DUIIs7F69mTtHjtA8mbLR17g4UpoqLXxjqehcucz6HPLntMFK5zLTsSRJDDCYGRTTpG1vExkxcVSfq6zNqO8HM7n068PyQ89mGPogZy+YotWBx4w2tPcutjZT7GJGaYyQLCpZQTsYiNELAn7eEXEdK+at23cmjW15tpvOUJD6kET6hDYTYBUwQV09KZxfJQYIlZtZquhcNIc+YPOQLMNT8HC5Fp/t2VwnfAxtZ3Nk+BTVA8zvF5XNrLl/JsAFoa+YtMfNg1kkyIvA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qr5P+QFcxS1euS4xgVKp6ufcat7R0xNCqAPqOW8jzb0=;
 b=WGE6nVuv/jk94eRvLKRBVbx0/A6O45dW4fo822M4Xowy9pA1J9GsMljABc6KgTimQGcifyrS8FJD9IIgiHPxyDJPwxunhzt+Nmyb/D0tjjrxcoHHdDJb18GPEf7nUtFZIbEaBN8ia1jRndVgE9YQL85BxYAKfIlsaF36Mj9Gx6s=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR11MB1327.namprd11.prod.outlook.com (2603:10b6:300:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 08:09:17 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::58e9:43d8:74e1:f266]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::58e9:43d8:74e1:f266%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 08:09:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <vigneshr@ti.com>, <p.yadav@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, 
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 35/35] docs: mtd: spi-nor: Add details about how to
 propose a new flash addition
Thread-Topic: [PATCH v2 35/35] docs: mtd: spi-nor: Add details about how to
 propose a new flash addition
Thread-Index: AQHXgr6x9zSgl9gAW0KtZbIoe+tomw==
Date: Tue, 27 Jul 2021 08:09:17 +0000
Message-ID: <a7a6da4b-7d36-7308-e244-95f476b202f8@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-36-tudor.ambarus@microchip.com>
 <4304e19f3399a0a6e856119d01ccabe0@walle.cc>
In-Reply-To: <4304e19f3399a0a6e856119d01ccabe0@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2ba6c18-c465-44d3-8e02-08d950d5d492
x-ms-traffictypediagnostic: MWHPR11MB1327:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB13276306122DFF5391EABC18F0E99@MWHPR11MB1327.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kXYp8+wlixrF3bLUGPLpdkhnnzmUaUsRrR+OtliK00CDq6iw0UXIJyWH4BhC/LWLW0KfK1i9S/DCgoK4B3uq+SlfxNmVhGZLHkoyXmfOYWf0JAeP0HS8sVj8cpFMLKxQs103XegXm8gOTyIcv1Rb1bLh5yvirGr9kzRS6gooLIeP2EhVhini1V25SvP1V/wJvU/qYUQ2u5pTg34pxyqYGGg2sqi07i0k7iDgOh0QLYEEfFNeKi9j0A16W5aZUzA5AOW40hpSqwh0HjTNJEHuuR0JjeJ3Tt8V0ZWJYYBzhzBhQQit6Xj7IR9QbApsAJiFSqcfbCRCvAwIB3mlmzUkBDL0N/oa8KIyO/nUPs9A+Y/mmeMRpJ4KCk1/DgRsUfBY5kC9DT35TJX6Rwz3F8qIYSaSgzR+ij7FZgz4pczCsdQSwkZt22CQkcFPaR6/SEfwbmFNIcm385qBSJAWuVLfVMqLlza/77q3+dPBtQjQrxJZxz7a7GRQCNn5a0pigqt9bJjYU8xPMFl5e/KMV9HAJulgn1AVfDgfpTyzsmeE3mTpYHFVymWOQ5GV1lEQx4Cz0jPQKZlbMlN4SEBBHtpKHsDRqU4GSz5QGStW8CfjvE9KPU5XxzuoQ+U4mkzZoF1UuyRWPg/IgG2zfcmp7NUL16M7/OBqrSshs4bjvEAlxtwxgNoiFDn6r6AsScnvcsfN5kmjP+joeTXNNM/l9VO7wkr4qCNkukJeU5nEHkG4B/I05JPLjWe4JYRNZdNZAzl8NGRFV+tmFfBmFsTS+fA7XOzwPN7nHAQLcNXA2eLAF4RiSqu3LiAwQ4KLnPaGl9ob
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(36756003)(7416002)(66446008)(91956017)(76116006)(6486002)(66476007)(66946007)(66556008)(64756008)(2616005)(122000001)(38100700002)(508600001)(107886003)(186003)(31686004)(71200400001)(86362001)(26005)(83380400001)(53546011)(6506007)(5660300002)(6916009)(6512007)(8676002)(8936002)(31696002)(316002)(54906003)(4326008)(43740500002)(45980500001)(38070700004)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFlXMjJhbVgwdnVGWndpczF3SmQxejNDL09oMGgwb3ovalVPTm1kUlVzOGdC?=
 =?utf-8?B?VnJtSENCdGJrOWhPbmRIcTBkVGpMc0lTNnlTcTZ0czNrNmwzbE5MM2lzN2lY?=
 =?utf-8?B?M3NOWWdGUzZPbDJ1ZUx4WGRIMG45WEZjR1cwbkRMMy9vT3dmaWJNMUsraEUw?=
 =?utf-8?B?ZlV5cE8zZmxndzlBbzMvQnhFWU1jY1FYTm5SR21PSUNiVmNzYW9NWEwvVkZZ?=
 =?utf-8?B?aWptN29lTE5IS1BaN3JtalB2Vkd2UitEc01Qc2lBVnNqWmtJckV5WUw3U0Y3?=
 =?utf-8?B?elN1MndFNjhFOG1rWDFWUTc5ODVkYzE1V0pXdHM1MHBGNTdic1B2MjF6SUdq?=
 =?utf-8?B?SEFrNW5XSFlmNHc4WEtxKzhhTmMxVXUvUm9lTzZWQkxVZ21IdE1CWVk0bDVo?=
 =?utf-8?B?MUpFUWI4b09WRzVIU0ozTEJBTSthRWJZaGJmYTFhUnVNMmVZYzhvRnltSngv?=
 =?utf-8?B?YTQ2ak9MODZLQkw2ekE5RnRWam1WNXZ4M1VjcU1hTk9XdDk2OHI1a2Eycjh4?=
 =?utf-8?B?dmxYNXF0dFBLNTRFdDlSdTNzR2tRMWI2bVB5TUFJcDZSTlp2SDFrUDgwa0RR?=
 =?utf-8?B?NXNucFA1SnhNQnJFbTdFVEpkbXRwMzkrbkRQQ2ttTkJ3cnNzVG9OUnZuSC9K?=
 =?utf-8?B?MnNGT05weGh4blJqUzFQWG9VWjZGVGZOWmJpRW5md1B0VFpFVUc1V1FOWUY3?=
 =?utf-8?B?VTY3OGJhN2JJbVczbUtmazNUQktJMjExbXYxa2tjQUlYaW1xZ3dvV3hNN3hs?=
 =?utf-8?B?aVE4ZTA4TXpXRmYrWXN4azlzTktsT3FwMlZsV25LWjlkTDNtS0NMUEg3VWc0?=
 =?utf-8?B?MnBETEg1eDZpSmFkUnQrb0RtajZOMisyeTV6Vnc5cmlsUUMyNTNzZk4yUzBj?=
 =?utf-8?B?RndJZlQ3cWpwVEprcWkyM3RLYTdEVWk2Qys2QVkyUE9MajhLeWV0bG5jTUpw?=
 =?utf-8?B?K3dIUS9vSzdLdnJiR3lCSHhFQTBGanAzRnlTUU5sVU9LVCtjYWJjQ0Q4UXFR?=
 =?utf-8?B?dTlqQndJN2xDSFhLQUZTdzdRd2xhNUNyb3NuV25DWkVpRGVmQ01kU25oYldz?=
 =?utf-8?B?YzEzaDRSUEdxbVdsZ2N5aVhzek9IZDdEczlFcDNKUSswSnhzVk5QQkJFUlFU?=
 =?utf-8?B?dWtKZUpoUG1adXlSS2F3SHpEc2V5bmxuUUhBWVhvc28wblRjRnBxNDhWSktO?=
 =?utf-8?B?OWFiclZrUlo2QXZoLzhZYXpUYnlUSWZqdlByS3NwcVVEamJsMUNtK1B1ZmNP?=
 =?utf-8?B?SUlBaXNQd05oNWhvUmFOVkR2T0RtbEx4ajA5ZUhZNE95Y2I4L2Z0R1lGV1gr?=
 =?utf-8?B?Z1V0a0w4NU83VFEyZmVBNzBsYTBRVnZsa2RJdHU2V01Xb0ExVng1TFU5ZTdj?=
 =?utf-8?B?UnlURWRaYzlPQmFqZjNRQXdtWldXTnlDVGovMmw2VXNDK0FPQ01SMkZVK252?=
 =?utf-8?B?SkZIVkhLUXdjaUFxeE53emZiNVRPS0NGRUhDU0xqS0RadnlKQXVmOWgxdVow?=
 =?utf-8?B?OWtSdlFvSlY0NGNmaEV2T3M4U2dVRkdrZnpVMTV5d1hCQkRWT1FjYmFMWitI?=
 =?utf-8?B?dWxsaHV1alhTcXdVeFBEM1VkZ2pDSTZGVFlKa24vSHBxWTUrM1VIaWF5U0pX?=
 =?utf-8?B?ZXhEa1g5cXNVR01RS2pQZ2NEV29QODNFRTJFck1vb05ZQ0tFbDJiL0oyd1ox?=
 =?utf-8?B?eGZIQkNIQ2F2MXZwNGJnaGcrYzZvMGxGRy9WTHROR2ZTRjg3MTJnTFk0R3lY?=
 =?utf-8?Q?DySFQ7oTs/XbBAKgiU=3D?=
Content-ID: <C1756862C7E7314D85916BE5438EF2C0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ba6c18-c465-44d3-8e02-08d950d5d492
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 08:09:17.3201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hHh/Jf/ZbWnYcDu4L2HB/tbsR5Hsr4KtJR09Y2tJ8Grfq6YB9NwSTm6nRnxu08A1BWfpWE+12cwbYa+J/ZoOGB59s0X052k71f7T2dTuHpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_010923_296351_9B66410A 
X-CRM114-Status: GOOD (  17.83  )
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

T24gNy8yNy8yMSAxMDoyMiBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIxLTA3LTI3IDA2OjUyLCBzY2hyaWVi
IFR1ZG9yIEFtYmFydXM6DQo+PiBBZGQgc29tZSBndWlkZWxpbmVzcyBvbiBob3cgdG8gcHJvcG9z
ZSBhIG5ldyBmbGFzaCBhZGRpdGlvbi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJh
cnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+IMKgRG9jdW1lbnRh
dGlvbi9kcml2ZXItYXBpL210ZC9zcGktbm9yLnJzdCB8IDY1ICsrKysrKysrKysrKysrKysrKysr
KysrKw0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbXRkL3NwaS1ub3IucnN0DQo+PiBiL0Rv
Y3VtZW50YXRpb24vZHJpdmVyLWFwaS9tdGQvc3BpLW5vci5yc3QNCj4+IGluZGV4IDRhM2FkY2E0
MTdmZC4uZmZiOGQ5N2EyNzY2IDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXIt
YXBpL210ZC9zcGktbm9yLnJzdA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL210
ZC9zcGktbm9yLnJzdA0KPiBbLi5dDQo+PiArRXZlcnkgbmV3IGZsYXNoIGFkZGl0aW9uIHRoYXQg
ZGVmaW5lIHRoZSBTRkRQIHRhYmxlcywgc2hvdWxkIGhleGR1bXANCj4+IGl0cyBTRkRQDQo+PiAr
dGFibGVzIGluIHRoZSBwYXRjaCdzIGNvbW1lbnQgc2VjdGlvbiBiZWxvdyB0aGUgLS0tIGxpbmUs
IHNvIHRoYXQgd2UNCj4+IGNhbg0KPj4gK3JlZmVyZW5jZSBpdCBpbiBjYXNlIG9mIElEIGNvbGxp
c2lvbnMuDQo+IA0KPiBOaWNlLCBidXQgY291bGQgeW91IGFkZCBzb21lIGd1aWRlbGluZXMgaG93
IHRvIGRvIGl0PyBUaGF0IGlzIHRoZSBleGFjdA0KPiBjb21tYW5kcywgbWF5YmUgd2l0aCBhIG5v
dGljZSBvbmUgc2hvdWxkIHVzZSB0aGVzZSB3aGVuZXZlciBwb3NzaWJsZS4gSQ0KPiB3YW50IHRv
IHByZXZlbnQgaGF2aW5nIGFsbCBzb3J0cyBvZiB2YXJpYXRpb25zIG9mIHRoZSBvdXRwdXQgYW5k
IEkgd2FudA0KPiB0byBiZSBhYmxlIHRvIHJldmVyc2UgdGhlIG9wZXJhdGlvbiBhbmQgdmVyaWZ5
IGl0Lg0KDQpvaywgd2lsbCBkbw0KDQo+IA0KPiAjIHh4ZCAtcCAvcGF0aC90by9zZmRwDQo+ICMg
bWQ1c3VtIC9wYXRoL3RvL3NmZHANCg0KbWF5YmUgc2hhMXN1bSBoZXJlPw0KDQo+ICMgY2F0IC9w
YXRoL3RvL2plZGVjX2lkDQo+ICMgY2F0IC9wYXRoL3RvL3BhcnRuYW1lDQo+ICMgY2F0IC9wYXRo
L3RvL21hbnVmYWN0dXJlcg0KPiANCg0KV2lsbCBhZGQgc29tZSBzaG9ydCBleGFtcGxlcyBvZiBt
dGRfZGVidWcgYW5kIHRoZSBlcmFzZSwgdmVyaWZ5LCB3cml0ZSwgcmVhZCBiYWNrDQphbmQgY29t
cGFyZSB0b28uDQoNCkRvIHlvdSBoYXZlIHNvbWUgbG9ja2luZyB0ZXN0IGV4YW1wbGVzPyBJJ2xs
IGhhdmUgdG8gY2hlY2sgdGhvc2UgdG9vLg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
