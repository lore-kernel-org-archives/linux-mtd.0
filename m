Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6821C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 14:39:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A69D61269
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 14:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A69D61269
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTCdUa/D/Iu1Y9bolFi72Xit1JkDWZnltTzYwIFai7g=; b=FHz8FTlD1gsA0K
	OzLv7nVEhOWVFh1ZH0SHqeICy9qxN8+k+2kZkHMdxupe+Okw4Ln3i/iCWAQBCyDQldvD4Zk+geH+R
	CeAXrdO/RArf7Ovfx7Ey3PfdP0kbtKHMSgHo6nOfMpmfTN5bVPSQIRsnW1eiPb/6oaKCXLnvc0C+h
	zqFOfeZESdSP+ADSIcws3qaoURe/ujhQ4JRJV0Ms3CUo49uGLGFbwgnh7Kfo4EAmWsrFFFNrIMucR
	l4CUYJBW3UzSrFGdHMrKVOVHKPu1O0QHR0qREGNAKX7HUCFQE0otM3w1EBElNhxlAz1hYWs7Mzqnh
	WwRlSbcKMd0BRx08Xm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnM5a-005AEu-EA; Wed, 17 Nov 2021 14:39:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnM3K-0058pz-2d; Wed, 17 Nov 2021 14:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637159807; x=1668695807;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=boSSTZZ4NmRMiq9kJUcr8SmKJuoouFv6+NcWoskkANg=;
 b=TYAmMVTJgl6SGjmrg9Ax1058nOUZu/KfA3/ICqCHFs+2zokMTFLkVDd1
 swEAZSlvQ9vgaQeu+Z0uIgIjQC8oXpTmIp+6pw8T6d4t9ti/Ko+KBjCk2
 bB6YxT4NmaK5pRYtlFwhsf0msERB/0C+8nUgtisQ+87Iim+Wh3OzxLzZx
 h2JRgZlbzyz6aWkk6u6zlgVPmQBW12Rbe1ngPYIZ7Vc/54/2W0JixqDy6
 Okq3MtzhFgoH6wRQJzU4EkqvAVISbExiL3EGaKqtYO1PX1oBW7ywtrxkq
 p4m/oXrGd1jaIwrYTmCvU9Gx1KiY6XOoQl8Mz3BfbKmY399YbVZuP34O2 w==;
IronPort-SDR: PEj7dn+ywNvvJqfDqH9bPI2WAE3AOnZ60zZv3cfOnAvPuSnwpbE6+beihZ5GN4xuKTnZtyTHp+
 oX35QxFnvTFP//ehM0Ck12db26kzQ3V818/De5RYDz6IlXq6jB1BpzcRcHg7aU1rtceMTkkzhR
 46BhpkQoRlJy1eRbLW8EHj63q5x20jcdw/YXfjLmN7dYNUEtsQQeyojbFQu5k9+X97sOMs3qNw
 B3WFCg2vbRr68pV7rTmVSA0X3OcmErpknXZ1/aBH12GagzCY6OwAMMTH3+nkbIl9YSkjFFNvyi
 /WDfqlf6+Hv+pHm3VfuL6FnO
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="143667755"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Nov 2021 07:36:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 07:36:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Wed, 17 Nov 2021 07:36:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdKaQxX1qNt3wTVd38ybrHBD667GlNO4yNzQ3hm61h+5Kf9/QWOXITihazB2piFt1s5XfiHvBrqKUhPlBOwNGj1UEeGOzRCWksnwFteRp4mwrBh3bschKy1apcEEypJ8m0KKeEPN8i0Ui9IZtzrFS99pxYO2wmFAEQadMJl3NjPWjccIZwBWLJncrs1ZRLiqIvIB6DcC7GPdFh8cQpc/yhl4xqEiH8BpLnt9uGB4g/PFxg3hM+JkQsCIxWgVTvmw4t38VqluUZhhVHHJPk4XwX1TU9YNp6fcZWe09dEwmznhRIgJ57oCFpQr+8XTtEh0F9PlqRibvxt8N3/oUb4N0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boSSTZZ4NmRMiq9kJUcr8SmKJuoouFv6+NcWoskkANg=;
 b=ZLEeXXGoAaw+COw+6P/8TfErRhvCTqCJjG+dmQ8Am98S0Q69EN1ThIMiqtP2OMGoqeugbNVH4QHL3q3jKBe02sH+z2Ogiu9ov+s5k1K7M/OjpwhVTt4KwEW4Usk+klk0SL8boaTo6p5V9qT4978LEufkXM51YBvbCPDaByvmKunPESZON3YOziVYXlHRfyY2MMvvf0BJh/aP4laEaekm48WUSPANY108AVOZz8z8IqkjxcT17Yq6ifE65fEYWoVOYTXWeX6xn7tqJjFzisqGihh+Hq6anGt75lI39vaSx0AQZkS9K68AY7nIPVFP6anaYkVujHARok1gQsVL6mVcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boSSTZZ4NmRMiq9kJUcr8SmKJuoouFv6+NcWoskkANg=;
 b=k9OLj7CNdcsdWFSdFo60paWt7x6bZA8zrTD8nRub+2p5Gmq+t5Z0N7cWaFM8Hoq3SR4Q83fAgs8si3+tfHUcOPmCBwqCjLVq7+0jJ/Litb/utTv7V0gv07E3z3joNENZdNJYTGg1R0q2SY3yJJ/2qXq1/4te5JuErMR8kOYq4no=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3392.namprd11.prod.outlook.com (2603:10b6:805:c5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 14:36:39 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4713.021; Wed, 17 Nov 2021
 14:36:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v3 03/25] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Thread-Topic: [PATCH v3 03/25] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Thread-Index: AQHX2vXYBbs1KEiK4kmqIPtsuumDOg==
Date: Wed, 17 Nov 2021 14:36:38 +0000
Message-ID: <6a1d942c-f020-52c1-859f-39d1d84e93bd@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-4-tudor.ambarus@microchip.com>
 <20211115185227.4b4gjnf5zi5bdw56@ti.com>
 <f55d2c76-0265-b616-93fe-9b3db8f714bc@microchip.com>
 <20211116181137.ddo4tw3cafb4ozep@ti.com>
In-Reply-To: <20211116181137.ddo4tw3cafb4ozep@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fe75bd2-89b7-4ecf-c3f2-08d9a9d7aa3c
x-ms-traffictypediagnostic: SN6PR11MB3392:
x-microsoft-antispam-prvs: <SN6PR11MB3392D2567DB4E8F8820E116EF09A9@SN6PR11MB3392.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0DXqmlyC0f6g3btZXPAKWlbXiFTlzGbHVFAgpxi4BoBuACH1dQdFQ4MvMdhVj1CAT/NOvWOepcWEX5tBfvokb5yPsHPFJz7BvBfpBaE2eO0jzhVu6bLytlA91QqxpiBlffbL305eXy5VADDUwRELz5QV1zq8WZU40/e3mouJ80jqi1vhzrb+bxBkKlr7dkMdIB7p95AJpN0wKOjNdhLrOiCpHxHacm6xiwiolKzOVjwtjNgd0lhi0Ta08r75ELBOL57aT/niAFMNqrJwjTGQ4vaLmopdCz524GmNlPDd8HipNljQ4z3OMsSyMkcrC7YI1+o9l0LAFAqKFkSucwDrw9jbfQYnSKpdIjfYIeB/B4Ddj7QzP1PjdegImogRGz7bsX5/qayqcMpUiOpzxSRAL9CJN/B89zUGoxvpKBCLykZhAcxsif3+nEz6Jb4lzQoM5LjyJ5GHBrwWpDPIqIIRLIzZwGrMfjujXQDhePY8ThpXlUWQL5MDx5pcR2y+vHXzSMfeKrRI/k7ljAfbwXqhn+stNVIi5KV+iYEblLp2VHZuD7r0Ye6U02nRcQ9B/b2ncfu2Kse2mHX1t52RxPeXlJ31qZ1qylpaWN8zTgrnwliI8JIIKNShwCfA9GidCEb1f+N3qcrstFYv4NpsiRwKGCIXus0M1daOI+TQA1z1IR0E29RfNGCthWPwezMJGBt/vNlSBAwjM6hn6xr0378xxjGmwecqdc9b5Lik8CtPyeHSKq/RJhl57t4O5fEoTFE/u3N2QQp37Jz3aP4RPytuLQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(6512007)(71200400001)(7416002)(2906002)(31696002)(107886003)(122000001)(2616005)(38100700002)(186003)(6486002)(76116006)(5660300002)(64756008)(66446008)(91956017)(66556008)(316002)(66476007)(4326008)(66946007)(26005)(6506007)(53546011)(6916009)(54906003)(8936002)(36756003)(38070700005)(31686004)(8676002)(86362001)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2hia1dLM2dJdGFsaFlCZk9MY2l0RjJHN1dzUi9KUkhQc2sxSm9UOWkxUDds?=
 =?utf-8?B?aWN2T0E5bnpaem1lWnovalNlZ2k5VEZYRkIrdkIyL1V4RTVGS0R2YmYzWmw3?=
 =?utf-8?B?NUhJQm1oS1VuWXNzNFBtOURFbkZwby9udzhyVVRhVGY4TVFKcEc3SUlWQWJO?=
 =?utf-8?B?dG9hUnRuVjJVNTB0enRyTHJpQW9ob1J1NjZaUmZtbE9sVU4yY0xHSlZ2T2kw?=
 =?utf-8?B?RGJ1TnlCRzdoSVdGM0kyUEg2ZTVmWW4rQVVlN2w4UlM3Y1dDell5WFVZR2Yx?=
 =?utf-8?B?Vkhyd2k4eWVMRk9tQk43ckZxVGJLSzhUUmRLeDluc0tzMzQvdWp4Zjd5YVls?=
 =?utf-8?B?V0I1ckdpdUh0VU54TWdHNlo2ZWhNakdncFRXT3NFUzI2bzF1WExEYVBpSnp6?=
 =?utf-8?B?RmlQdHVVYVdnMHlZb0xnZTQ3S1dDenpMRGR5NmtUbUkxeS9FSXNGOGNhYkxq?=
 =?utf-8?B?emFkRHZHaDZFM0RkL0svdHJ1VWZKSXhyc2M3eGRJWDVFSE16Y2libXkrVDg3?=
 =?utf-8?B?d2U0N3FOWGRPNkt1QXZWS1JZb0RxN1RGTlBCcHJyTUJFTWFQcHFNZXFobDZV?=
 =?utf-8?B?LzIzeElUbFRsRnVpbGJVY1JybnhZWTBpRUpwbHZCSm9EZWdCTWFaWk9KbXRi?=
 =?utf-8?B?eHhnWUtoTHpqK0tTa1BxbmV0QVVXekRJNWpiMVJhOVZ5MmFvRzRIdEpkVFI5?=
 =?utf-8?B?QUpSWEs2OWIxTGFUTjczWStPZEdzMmxha0lIWE91TnRjWEFRVzdJbXovbGZ4?=
 =?utf-8?B?TWdod3g3RzUrblZ4QWRRZXVrV3lLVC9UaGY2bytHM01EcGpLdGJYR0pWazQ2?=
 =?utf-8?B?MVdSWUpFVU5va0t0a29sY01MbDlxTmpDUTR0ZDBzYW50Ky9OQWEzdXJJbHI5?=
 =?utf-8?B?bDVEL1lCOFllbS9lL2JFcDFjWlBzM2RFdzNvTy9heUg3QmlrVkpqTVZ2dFZJ?=
 =?utf-8?B?Z2h6UHRiS3NLbWZVcEZtOUFyM1hjSkNCTEdlMGFoMjhPM0NjRWY0bFBDYU9N?=
 =?utf-8?B?Q3htMVdhY1RCS0ZVdE5VZ2ZWeEJjN1ZucEROdzdSV29Zd3duQmNsdldnNjhw?=
 =?utf-8?B?dGw1RHl5RXEzTlJoYWY1REZkTTZpd2FWVnl5Nkhabi9CTWdraDh3VTgvRVZa?=
 =?utf-8?B?aUNvNWJETTVncDFTMk4rSk0vL1hrSGxrMFkrSzJuNEhpWHYzQ3JIUzMvOEht?=
 =?utf-8?B?THpnWFdSNDltSjcrMjNyNC9SL3NNMGFzc2xlSXYwbnM4Y2p6c2NVVHJZMW5V?=
 =?utf-8?B?SnluNG9RV3pEZmJwSnBEVjl0d21LL045SmV3ajg0SC9Ta0U2aXNhZWRzMjRQ?=
 =?utf-8?B?S0YyYWRuWUdORDFTOHJJaGowcEhmcGtwc011WXdvMSttVmEvZk94b216MHhW?=
 =?utf-8?B?MVpZSjNwOFN2K1lHNEtzZ2d4eENHL3k2c0d6UHFWak1MRGxEMFhnVzgwbDVj?=
 =?utf-8?B?MU8wQ0U5bmZoYlBYWUhNLy9JalVLMU4zNWlMbmNnUHZYM2ZvS3J6a0k4VkV0?=
 =?utf-8?B?Y0YyUlpzZWVOaTFtVURYMFpQVHpVWVdwV2VYSkZ1WlM4NGtxU28wTGZYNjVq?=
 =?utf-8?B?K2ppQkRTdHBjV2V0dS9ja0dBL0kyQ1YzQkg5cUpSOTZlYU43RU92N3RYNEJh?=
 =?utf-8?B?Z2x6QXZTZHBSLytySCtnRDRRWVB6UlRYajlVR0pFNjcrR0ZJd3RyUUpIZFMr?=
 =?utf-8?B?Y1dIOG03THkyZFNGMmk2QU1WL25RR3JUNmlGakVIbi9yQWdlYmZ3a2tKTDNL?=
 =?utf-8?B?K2kzM1NudEFvR3I5SkVmWWxBd2xRN25BeGdYR2tacFRadFJ6cVEyN1B1WXpr?=
 =?utf-8?B?Y0hhNjlid0xqNlFEZTg0cmFDY2x2WXhUTmpmVjlQWURlUkt2YUpNNU1uNFpu?=
 =?utf-8?B?TVppMUtxUUpqRW9TL0tIVkcwMWdmQzVRWHRZcjc0K1RwKzNpa3BkaGhhcDNN?=
 =?utf-8?B?dXE3QW9DT0htRlRuVzVlSFZ0cklWTnRBOTVlcDVnR01JS1NwTnhwei9ZU05q?=
 =?utf-8?B?bG9CK0U0YUhjUXhveVAyMTZKWlFsdm9BbjArdFVWYzlKWEVieTdqOHBUVG5V?=
 =?utf-8?B?eGN0c1lnZ3JuVnNqMFA0YlRIQ0xnVzFyeEJGTTZrNlpIYUdKRENpN1ZWcXBM?=
 =?utf-8?B?N20wRjZRU1F0RW9Mb0REbDlIWWhCeFlTSmxETERMb2F2YlRsRnJFY000ZDZ6?=
 =?utf-8?B?YmxLZ3dhYWI3M1pzQXpZdWQ3Vjl0NmsxVE9jaFZCbXpzeGxiMktWenBBUTAr?=
 =?utf-8?B?ODZXTTBSRW1lU0xieVY5Y1lKQ2lBPT0=?=
Content-ID: <9750D1E2A01CA2479E732BE82E29DA26@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe75bd2-89b7-4ecf-c3f2-08d9a9d7aa3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 14:36:38.8080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J59PXUhg41/So6WK+H2rw+862OlMxFJ8D9qKW35BcQgLZH+aQHRq93IY8XnWJw6UpPFreMo29pwjFr0B349RoVF4z9t8Q6dZqGBG7WyHQuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3392
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_063646_266254_C1C92F66 
X-CRM114-Status: GOOD (  14.99  )
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

On 11/16/21 8:11 PM, Pratyush Yadav wrote:

>>
>>> - spi_nor_try_unlock_all(), which is called by spi_nor_init(). I don't
>>>   think it actually uses any values you initialize here but still worth
>>>   pointing out.
>>
>> we are safe here, the pointer to mtd is used just to get the pointer to
>> nor.
> 
> Yeah, but who knows if that might change some time later. I would prefer
> we don't use a member we haven't initialized yet.

If it weren't for the SPI NOR controller drivers that use
spi_nor_scan(), I would put the spi_nor_set_mtd_info() just
above the mtd_device_register(). It will indicate that no mtd_info
field is used up to that point, less things to worry about.
spi_nor_try_unlock_all() calls
	spi_nor_unlock(&nor->mtd, 0, nor->params->size);
I can't see for now if we will ever need some specific mtd_info
parameter. I would say that we won't, we're just unlocking the full
flash, every info we would need we can obtain from NOR. The discussion
would be different if it were about mtd partitions, but it isn't, we're
dealing with the entire flash.

Would you accept the place where I put spi_nor_set_mtd_info() if I add
a comment before calling it? Something like:
/* No mtd_info fields are used up to this point. */
spi_nor_set_mtd_info();

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
