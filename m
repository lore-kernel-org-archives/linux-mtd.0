Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD77C00144
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jul 2022 07:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoBU3MVeiWuIQDx8g/Pp0niGQTKVwwnPhW6BBXPiwbg=; b=hBJdrwAQel4biD
	ASpAnC2X8nowaGzUAN7U+gXYI61CzqQyquc++N+c+wgn4wdDakw2Aj7e08CeEtxxoNUsI3buofFVj
	w+Hn08W/ItAHLRpHFlOOEJ2/LOjHBHB6nkrgntxsYipBdVK7aS/r1tTlmRYcNi2dmrcZVsGX0YBqr
	RSRuM/ojZrM2IfMgXHzRcmkMPPJ2Jp4d6oTYrJTGXa6d6MMxe6nGyOxxSkmHwBzqSX1OYtSbDN0ZD
	/cIusnhk+VMx27QGAOWhKusy8dnf/2itEmJj4nm5EJJX2DPhmlts4aZvG5NLtpccHmraUcNGkvEfd
	kl1QzU4qxdcm14Ugo6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHKrd-002pPs-CJ; Fri, 29 Jul 2022 07:56:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHKjV-002lD5-98
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2022 07:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659080909; x=1690616909;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vQ7WnJ2C+X5w9BGWX4xVMTFDP1BbvUuzzyaucUzBzbU=;
  b=n4G02L9Ml5umhmDVj6L/e2PJJTWg9uRjHbaNpvb89YvB41N9mlOkNXNv
   HDBQWGtY9r03KMxpNBldioNHQiojbRqPF88j1EtST/L0rIN3e63gLRdWJ
   YLsxzLZ1mzX7MN4XcU4C9Aqz35V6J4ygbxFzZGiXSndq8WRj9+LFfrxdg
   nHYE5dMfFgtAMYxgwY90t+9YOXhx/anJWsUO5GnSHN6QS5JZa5jqJVbwE
   H38HCHbkW0TZ2tppZVcGr5/B7kJMbR5x6PSgYzYTAdKwDlbShjn0AxB6a
   k+NvtRJxks73eM274ZrFJDii9GloOtHbptMHHRKyiCbMRZu4D/kvIbuoF
   w==;
X-IronPort-AV: E=Sophos;i="5.93,200,1654585200"; 
   d="scan'208";a="106664040"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jul 2022 00:48:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 29 Jul 2022 00:48:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 29 Jul 2022 00:48:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myUXCOqs1XnDRglbm5JmeXBWZi2D1W7e7fTx4snkGMk5o7jGgqrSppWJME2NYf8CU551+cv1OgeHjWp/JEGP8r3q8+E6FvTkkevSWV5P2nxJjO/YgqwwqrooIqDoDA6PUnweU1/kdPN31zRgjnsY54plC2wNbHo5MTI3b45RoYaytDXtnYvJuqsVboZ99nhpAFfDB/8eUiBABWvednpw9d6GgF8lVBBDuxk/G1K1jvMUXBgX1unZEAM4yksxTQRBHKWyECTY90bjT3h6LngesWKAUBPySI41ed/3n6m/e+jG2nf4NcEqauURAgpxXx1m84aLpAZpQk1tGYcVj/6VRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQ7WnJ2C+X5w9BGWX4xVMTFDP1BbvUuzzyaucUzBzbU=;
 b=HuFCkXXeDpgxYDPpmjMZtcrgp24pIUAg8WTX/sZM9nG017C+aWbNcJaq/Jz9B+puU1wv9xYWwFdPl4thmR1jsdAreNIs3bD7U3U2xuA8Zt/0+J5wL4rGYZSp6VLLWLtxuBFG1Dz4xXPIJiCDUaYhWgSvqX5U/6J4Sif45LyV82TYriMGpQa9CdGHPYtk0QIKTF0Swj1WbmspMHpw2mJjPSUNGnVOySz1WzpZQJXWJIiBfzTVneTRwAJppUNHhvMftcgHpAnZGq6ZUJr+GQoYFwj2OepG3Zvx1/TF/60WM4IEYwF1QHBH6pGFmgf0SVi69bW6Jr1eWSunX7L3CifDaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ7WnJ2C+X5w9BGWX4xVMTFDP1BbvUuzzyaucUzBzbU=;
 b=lAzQUtw7RjrKDSNV7Vlos12oZdYSp4R2LIe57fdvQqaqRZef5deo33XO0BiLB6d1E3tyKGlCAaGRCe3Z/m73JdAeXNwVTcfm1r5MM8LsPi9MMvbllclz0Fg97YAbkUrfthFFe1uWqSpy8Djd3U+Q23OHVfW80o8zqMni0+43wK0=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 MN2PR11MB3901.namprd11.prod.outlook.com (2603:10b6:208:138::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Fri, 29 Jul
 2022 07:48:14 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35%5]) with mapi id 15.20.5458.023; Fri, 29 Jul 2022
 07:48:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sudip.mukherjee@sifive.com>
CC: <p.yadav@ti.com>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <greentime.hu@sifive.com>,
	<jude.onyenegecha@sifive.com>, <william.salmon@sifive.com>,
	<adnan.chowdhury@sifive.com>, <ben.dooks@sifive.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] mtd: spi-nor: add support for Quad Page Program to
 no_sfdp_flags
Thread-Topic: [PATCH 2/3] mtd: spi-nor: add support for Quad Page Program to
 no_sfdp_flags
Thread-Index: AQHYmsgjen1JGDoDVkiRJKdzpaguzQ==
Date: Fri, 29 Jul 2022 07:48:13 +0000
Message-ID: <d5662307-200e-171d-58fd-8f26dc02c771@microchip.com>
References: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
 <20220712163823.428126-3-sudip.mukherjee@sifive.com>
 <3a9877d0-3cc5-6452-764b-d07b38c72b00@microchip.com>
 <CAHyZL-fK-d+dPWG63dcFUz17uP-sG4bnSFVW_gt16snnOVTzpQ@mail.gmail.com>
 <CAHyZL-c9iSd8=CaQ00Nptea4cqp9f7oqS5VefT3vfcr2J3hmSQ@mail.gmail.com>
In-Reply-To: <CAHyZL-c9iSd8=CaQ00Nptea4cqp9f7oqS5VefT3vfcr2J3hmSQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 202b6077-a649-493b-004e-08da7136b118
x-ms-traffictypediagnostic: MN2PR11MB3901:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cSesmqcmmrM8n6oSZhC5+IXVG3AxzDfblai01OHPY1O4fYUD6JUcxMxaNxH2/ZE42CIcZN3y9YNila0LsOyLjXP96gJZJzolKV6ItPIpxh3u2bZF+yijSYxEZ5N9MdkdPv/OAL5jeHYOeJ81LX8RDYX9WQaiwKW0AgreYgi31e0IDFkKj11KvWVmbJK4aw9cEoQFJ9QDixgpOFaSUaU9a0rVvO9uWwkmr2CaaYv/Pn41tAzwGhiQFUrJ3DrSyQXN53HpGGg60hnYFtB3nYeXOKBiW0OyS97ZoM4aYhjib1K+yJGZvHuMt8k5LVl7S8awxwcuDc9HzgaDs2zEgaXhi9fmsiRqDhc3MJxmhWDQkc/QEni3E+N+dTxoPV7WeT4AoiZFSf/xfEX8yjnxoZFfFicmSQUa+Qe9cT3vAarPQPHBINbzIW6HCYbWO377rEGUY0A4OjFRiMCkPDMbyTDUMOHKraWTbgN5tcYCm0Eij1cqU84O06Fy7NHVTY+1Eff9etL8Tode+n2JoMfF2IUP5Ivfx1IgFOhAuvYhY5ktYcjLxEWYQQsJXHpyrHWTmJWnVnet9b8fz7s87XrM5qKauqDS88a/b2puP+j3/9nkvaNhJZs9Gu61HZoshKa55BB0RPeCu2KziIPfZenMezUbl5Re+cy7+6H8KWKd5AcesqxPaJ8YUkqPFRrWICwUFsb10Nh9sgR/0WmFzRyScKMENHWgTHVpj9ahIqQJb287Fka35BAgzab/XuMrjW2hyfN3CXdd6LgmbemjM1iIWx4gGrc4bV/pj5ySKp1q8D1BbZ99i2NVeMGS3K/qZuz0BjuBvl6wnWwzAExNgvRyZlNd2mOVTVhFwiDxk4eWdIYGOBpPmVy4oNp/Wwe3DM/+yhFU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(39860400002)(346002)(376002)(396003)(966005)(6486002)(478600001)(41300700001)(6512007)(26005)(6506007)(2906002)(53546011)(86362001)(31696002)(36756003)(31686004)(316002)(6916009)(54906003)(71200400001)(122000001)(186003)(2616005)(38100700002)(76116006)(66476007)(66946007)(8936002)(66446008)(7416002)(5660300002)(8676002)(66556008)(4326008)(91956017)(64756008)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0k0K2lRMm40dHpNaG04ZFU0Zk4yWXNHYVVERmpFZGczOWRpbFVZMG1rNTZY?=
 =?utf-8?B?K1lEK2FpYkVhOCt1YUNOQnh1YklLNUlmR3c1bjVlZnczME5jRm9DOGN1NTIz?=
 =?utf-8?B?TnEyNVFraFpINDA5MkdoS0dRbDMveE12VEY0UzREd1R4cHBMejBnZzlZeHJO?=
 =?utf-8?B?TDBzaGN4WVVMWmd1UGxReHVVZU9zWmp4ODZJS3FVTkJWZGJWY204d2F4NUll?=
 =?utf-8?B?ZEx3Vy9GUjgrQnhEdVlVbjdvbGJjVmdHU0E3d2VuVStHbGR2UEZROTB5NkZY?=
 =?utf-8?B?ZlVzbEVjM09oKzFUZU9kZ2RlclpaVnR6S0R2ZGpGQnczZ2xJTmtibHpRK0My?=
 =?utf-8?B?RzBFZXJ5SitncWFYUHk3WHBwZ1JtSEhjeWZLUnBuYmJYSWRIcEptbDZrZ1Yr?=
 =?utf-8?B?WXRzRk93d0grcFdmOFNHZ3FMaU42RFpGU2h3T01scWdYcVNZNDM2M3pjRE1m?=
 =?utf-8?B?WmtFVm5mSDVIQ1lNbmxmY2VaT1ZnbldqYzZtSDBrS2JpRFQrTEJ5N3dpb1Fl?=
 =?utf-8?B?NERvOS8ybzhjSHlyUHFQMFM0RkNUaHgrQ1hOTVJhYVcrQklyVkR5U1JTU3Nz?=
 =?utf-8?B?NmV3bjJtN2NVenFCMVhwUnkweE96VFJ5U3hjaGdLZ2NFa05wTHV2RzRBL3Fa?=
 =?utf-8?B?SXJkMDkzNmUrQzRBYWppSGl2T1NtYkVhWEdmQ1NOZFQzUnpSaFo3QlJjRXpN?=
 =?utf-8?B?RWlsRTE2enhRa21GU2NoWDZQVmNOeHRHZUhWdHBaM2d0WUJEZWl0YzdEdnNP?=
 =?utf-8?B?WGEwUnVRRExqSTV6NHdOSzIzNGh5Y3lrMDNZQ2lhQWlqbjJ2SE4vdnViUHVi?=
 =?utf-8?B?dW0vVXE0NTVuODJqaXJSaFdLTEFwRXVVclJWaFJWU1U3eXc5ZmgvOUVZY29L?=
 =?utf-8?B?cW9kZXAxMDBjZ1F5aHh0MGhwZm9FSUtyclJsWEVGb0h0TzlUVVgxZGQ5ZThH?=
 =?utf-8?B?a1VWTFJTUG52TG5UREZiQ2FoUWorTjNid2tZYUtLT29rejFkRmhsUHVSdEFu?=
 =?utf-8?B?LzFScXUrNFpNbmt6K1h6M3F4QkE2ZjZablpUQi8veTliTTB4TjEwUFg5WTFF?=
 =?utf-8?B?VW5CVXdpSW9WcUZPaXBocThTc1diWWJXaFNtRjk2cFIvSzJSSnVwdENoWC9N?=
 =?utf-8?B?SGI4K0FRQ0pvK1lYZHA0Qmdqa0tvR2lUUzFUR0JDWm9Rc1h1THdObnZlRmVV?=
 =?utf-8?B?WGZ0OE9GbGVLRmVoNTZEc1BsczI1cFRSZGl0U0ozaS9HcmlPVWs5WmZRaGFx?=
 =?utf-8?B?RFlnb3FHdHgwRmg2QzVjb1NyYVV0RWIwRHVTWDcyRmVtYkVnRERiaEZYNVhU?=
 =?utf-8?B?ZFJNeHp6SUxtU3JPQzZrOVFOTVZzbWNQVEdoa2VVbkp1N21RL3VGeUVHc0Js?=
 =?utf-8?B?YXpGQ0hKM2lkU3BKejhvL21wbldHR2JDc3FIdXRtSWtYMjJxblJXcndFYWt3?=
 =?utf-8?B?c3lsNzRsYmZoWVVCZFdJL3ZTMEtQYWhwZWlYM3FzUEpIZTJ3RnlFWXFCNE1u?=
 =?utf-8?B?cG8wVnZEdkNJTjNsUlZjKzVyRjVKQUFoZTE2bWQxWG1vZHRSV056cytKTVph?=
 =?utf-8?B?N0FjZ1orQldFTTYyQzk3Wmh3NHZvdXVkUXg0VFdBYXEydS8rUEJpVXF0b1Vi?=
 =?utf-8?B?MHdzV0RMM1lPdmVLSnU2WkpoendEUHZ5ekdmY1daWEVxcExZdGRiMXpwMFkv?=
 =?utf-8?B?R2hxb3N0Nkk2MzFmTmJKMnlUQ2lYODk4YlhuUXNiblR3YUxBZncvNXJIQmVQ?=
 =?utf-8?B?anBpZzhhOGFXSlJSdHRLMlp6c3M4S3hOTVdkT002cExPanFvVXljbWxubXNx?=
 =?utf-8?B?YlVhaUpwYkRQUThmdklhZXgxbGZ1WFhCMVExc1RZV2FDVkFBSFpsSUpDWmw0?=
 =?utf-8?B?UFQvWlJrci92V2NqZmZRcGgrd3lwOFJQckNRem9LUG84NkpvVWk4UmpubTYr?=
 =?utf-8?B?S1drQUlhU1FXdGtTMzh6TkVJNDNsZS9LeGZDR0VCWm1BdjQ5MUFxaENYTVR6?=
 =?utf-8?B?K0FTdzBIbDkxaFdkY2Vhb0R5S0xTVVFwdXNjbmcxQzI2QnRQRnptdkVjcmh6?=
 =?utf-8?B?QUlkektEYkRDbTVhTy9NaVQxZkZ0OHlHNGszazVkdC9CWHZVZldJY2M1TnZa?=
 =?utf-8?B?b0JOcEpyRGlIdkY0NVFVSXhscjlkQmNLaXREM2Jtb05RR3d5NmlmRUVUL2hK?=
 =?utf-8?B?aVE9PQ==?=
Content-ID: <DE7569B8536BE8468F32B1DC6A71EAAB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202b6077-a649-493b-004e-08da7136b118
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2022 07:48:13.9034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7vkdPXghJSJxbB1m/Zho1A+ynkAAtoHoU3z171mQL7W5lCKGolHzx7gEBJnh4u1wIoqi95FiAp6El9Bp6hFxFAMQS8qxws9buI1kKMdlvr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_004829_685928_99531E11 
X-CRM114-Status: GOOD (  24.59  )
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

On 7/22/22 13:24, Sudip Mukherjee wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 

Hi!

> On Mon, Jul 18, 2022 at 7:49 PM Sudip Mukherjee
> <sudip.mukherjee@sifive.com> wrote:
>>
>> On Mon, Jul 18, 2022 at 6:02 PM <Tudor.Ambarus@microchip.com> wrote:
>>>
>>> On 7/12/22 19:38, Sudip Mukherjee wrote:
>>>> [You don't often get email from sudip.mukherjee@sifive.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Some flash chips which does not have a SFDP table can support Quad
>>>> Input Page Program. Enable it in hwcaps if defined.
>>>>
>>
>> <snip>
>>
>>>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>>>> index 58fbedc94080f..dde636bdb1a7c 100644
>>>> --- a/drivers/mtd/spi-nor/core.h
>>>> +++ b/drivers/mtd/spi-nor/core.h
>>>> @@ -462,6 +462,7 @@ struct spi_nor_fixups {
>>>>   *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
>>>>   *   SPI_NOR_OCTAL_DTR_READ:  flash supports octal DTR Read.
>>>>   *   SPI_NOR_OCTAL_DTR_PP:    flash supports Octal DTR Page Program.
>>>> + *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
>>>
>>> You don't need this flag if your flash supports the 4-byte Address
>>> Instruction Table. Does you flash support it? Can you dump all the
>>> SFDP tables, please?
>>
>> Not sure what the correct way to dump sfdp is. I did this from sysfs.
> 
> I tried decoding this SFDP table and I think the parameters table says
> it has "3-Byte only addressing".
> So, I guess that means it does not support 4-byte Address Instruction
> Table. And the datasheet
> says it supports "Quad Input Page Program (3-byte Address)".
> My existing patchset works for Quad Input Page Program, and I can send
> a v2 with the previous
> patch and this merged together (as you suggested) or I can try
> enabling sfdp for this chip and then use

You should definitely enable SFDP and get rid of the NO_SFDP_FLAGS flags,
regardless of the 1-1-4 PP outcome.

> a fixup_flags to enable "Quad Input Page Program" which I think will
> be more complicated.
> Which one will you suggest?
> 

First I'd like to understand what "much better performance" means. Would
you run some speed tests please? mtd-utils should have a speedtest, otherwise
you can use the in kernel mtd_speedtest module. Page programs are slow anyway,
using 4 lines may not make any difference. But let's see.

About your question, it depends on how common is 1-1-4 pp. If it's common and
desirable we can introduce a flash info flag.

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
