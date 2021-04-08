Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E54C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 05:07:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A586113A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 05:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1A586113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2vgJ7QFADtVLLiR1RAWjwiCwxOOTOG9BTrSbx59xs4M=; b=Fkc/tEyrWAIL1RlCz87nKpTyb
	oiM3MePbrRHwLQ6MpJC2/JIPPpPn4xAhoI60aGmpJYguVsqU555GvRyZN5yFUY7aFlDSwlN8Z/QBP
	buQkkAZVkm26wI9kIwZ6vUj5X75f/Ye1OchZ6apdXRqN+raD2aL80Ys/Suly33z7z88y9s7avSk2h
	O+3AQAj/i+7cN2j3gbcyEPdgbGUqJl2eugxnikgHSAv7M6lOK4VR+HUGzg1FGHFiUzF055L3z3n+1
	elmmulAEX++MGkc7a/4z/PsbTWfAIYXHAIattcqBifMvzolrnvD10Qspy0xPrTCULokoMvKxXYwrG
	vsV8yMJ5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUMs3-006vRa-Ea; Thu, 08 Apr 2021 05:06:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUMrx-006vRC-ED
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 05:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617858377; x=1649394377;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9FRgIoTNw6VUMdwaeHxi0erhvW8TNkiuAM+Zg9mey6k=;
 b=aZXaQfhXVitsm5KhcGdgm0ttIhrgiQn4yKkZGZ9UyUObInzP56VRHk9i
 /NaZ2mJzz+5gtfd90aQW1kT0m4Ekmeit1NxvtTa5oCKee4eb+qY0xwIRz
 D+cdusK4iMo4zyRy0AfmaXERvNtSN5FC1RG8Fk6YJeBxeNw3HFQ52ydHW
 Ff+0C5usH0JsZDCkDZQ7uSnct6k7LsPdetg7SWCqUsU6ELMoECli1XmHC
 g54IQGUHSwalHZ2FIjUETVUcgfmbQqy3u1FHrDHNh0QMFJci/MSFC3fVQ
 W+OmGgooWRmXsIojhSI+eChnESD3qD3wN9vg3DfoaX+MuJVPk3sWmkPLi w==;
IronPort-SDR: DrOjdFyzH0kL2nbcBowH6C/j0mOFjinOB4gb7XQfsLslbn1NBBeqdwM02Aj7ufhePZSTmvy6PH
 +271kVJwwZaDEwEu6yhVXGQT/SxHeaxmg5hZAn4l8Te2bbPD41y7HUDY+JpfMfw5p6JXVXZzDP
 OLt9gMflC/wr+9HRqGpkMPp52tV9HHxj5Ati00+vn2sTprjoeff7IUnpWv5o4a+nqRfR5z+RXs
 rDGEqbK/3wfOfLpSnTXJz1KDC4VzRUXFZeY66AhPSz6iKNnq1rXrfY3ReYfyKxNVm6K25sQwWR
 7TY=
X-IronPort-AV: E=Sophos;i="5.82,205,1613458800"; d="scan'208";a="110070802"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Apr 2021 22:06:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Apr 2021 22:06:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 7 Apr 2021 22:06:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCyj/a0UXLnL0GDpPNiJI0YFb8sVQ9bvV3iZgm0eauu88s9KFlYks+5B4tP31G2XIwAypZqASlX44p1fjsJK1IFNpl/RjUIdv/E4Ttdhlq80ZHeXBYK6Qe5itBZ81fYhXh89ADXp//3vi0gXFpF1aNLyMVwQCJ2nSA6J6CVRuIW7/ojV6HCYKXqyXFB+1xFDesOHKu6G0JyAuXO5k4fOiWVBZPgOj4DFmYA0f868ZITlBuzENKUq2qN61lw8quzQs1kVtEYKK5WN51tTyuxIFEft8WZWdUdPftepbrycu92tCD3FcYCwXMC5JoeGXpbFMUmo1XpyfeZig1D4tT/pAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FRgIoTNw6VUMdwaeHxi0erhvW8TNkiuAM+Zg9mey6k=;
 b=dQbgdUvkvfTa+lZk6wd8EUL6Ct1SVS01JdoOidLt5Yu5sCMX7NptezvExs6nLVFqNoE36NfG7wANlU5eYcSDqa7P2msfch1rhmmqzN7DvobNcA8GsaTV+0Vw/Du45PniNj+veY78GUtqytQ572mYYXxp2yQKRIAnEXJkTG4pPp5wGu1tBEwsb9zXf6oyJxI9jlxibIt+y6lWAWIa+19m2jZlmFwkM51qOhc8467kASXL9dsQfDrYd2JCiNMVeixU5No/ICri6KGiac07gTsCpNM8yisWl04z1sNcWJgPEPFQq7Fd3qwxsqwWg3Gys74mjs9iNXdKosvOTmr2wPm+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FRgIoTNw6VUMdwaeHxi0erhvW8TNkiuAM+Zg9mey6k=;
 b=Dmh86iSdrHnINgfUyzNc/Qps+ArkRG2sXCbouDT/OwdraHPG27HNQtoapoiyQKXs+2VxcXAifP8WOV/TcJpeVK7f+kmDdasxJNuakwoW9uwS1aM2mnZhp26OdlpyXWhDfpYnU+FYjbKKtROnjzhzrLHUlGYeMxcmOpqKDv+/1V8=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 05:06:11 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.3999.034; Thu, 8 Apr 2021
 05:06:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v4 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHXLDTjyN1Z1D6XYU2bt1eMIEhz7g==
Date: Thu, 8 Apr 2021 05:06:10 +0000
Message-ID: <aae2c29f-a6bb-18fd-627b-bd11910c2009@microchip.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
 <76a55d9be126067c631065f31e3e970f90b2c080.1616130675.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <76a55d9be126067c631065f31e3e970f90b2c080.1616130675.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bc36cee-8f29-4da8-54a5-08d8fa4c06a2
x-ms-traffictypediagnostic: SA0PR11MB4655:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB46552EFD93BDCD3B9D451990F0749@SA0PR11MB4655.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AtBUeYjHtHRoU1ZIdOGVKvBNQ7bkU1U0gahyx6PVUOAmLipFEmEcD8xpbl21vd39J7j9z2djELathKcwS+jPCWuSzGaiLLgaajKtKSXMSyHHf3G40ld0l8gwtdhI04osyDuKUocPoOrekJUAY8ZiBoWVPpbquRvKvrVe8KSlyURHWKKMy4NGzI6o4MnTMMHowCspTtOgFhfgyrjVJDWt2W+zJFzVje75R/6m8mX+fiklGlxrqaQ++fG8hhY0JblLUnlucTHHhqBY1WEzucQeZe9Wr/l2ZB3My3535LVjba2THgLbYBtITsOIf/Ow7MiT7VVCtYoN75KyK2vAQt/7DKXZPJob60YJn4aAdsaWVFQLyidi33iKxH41xyS3ivzS6RirtJBVgf5FTspvtKkl9DpaeCBu61qAF6ojBdlqnmhbbYf2+MxfhrbsJpOHhbsP5qrC8mkkbQSeC2txi1PRBD4epB8PJSWbf4aG3HTSYgEXOjkKpGfsiDr3KhjqyO7JLxh9zj/twWTjBfRcwWHYb9vTLpk0PNvcOB6Pr0cGfgrEahlvIIOYPA8ND8FfwQVuspQXy8XMg7gnG9CB48wx0pLqKDXpVl6RfJ8mWDSFBOauxRhxAmc20hgdKjh7jYAR+NZZ28mzw9lY5NFxaHfOPnfxjQU1meVY+HOEp1EniY4FHkYx9uVfgp8H4BQJcnn9sSGvPlk1ckAnCcZbrfrET2QK8eJBRV9km6D0g3GB1qk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(136003)(376002)(346002)(396003)(186003)(4744005)(8676002)(8936002)(478600001)(2906002)(31686004)(6506007)(36756003)(53546011)(38100700001)(66446008)(66476007)(66946007)(2616005)(86362001)(71200400001)(5660300002)(316002)(6486002)(54906003)(31696002)(66556008)(91956017)(76116006)(26005)(64756008)(6512007)(110136005)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YXFGV1doeXphelVuTFN5Y1FWZG54V1VmeWt4K1JKYlE2ZWR5emlmeUl3R3ZO?=
 =?utf-8?B?cjZaQTZ6Q2FHb3ZkM09nQUlzdEc3cXprTHB2MnZqYjB1ZTZCQUpOU3M3U0U4?=
 =?utf-8?B?c3FxczBGU2t3ZEdUdlJLaW0yRW5SdUtSNVplYUVKemIwTWZTQ0hna1doT0h6?=
 =?utf-8?B?WUFvMVh2Y0psT0x2Rkdjb3JldGI2WkxDdFZLNVc3MVMrWE9wS280V3djeW9y?=
 =?utf-8?B?UVRQTzM2M3lrQU9uU01USGl3QnBLSkJDNkRoYmxEaXplcGFZQWFtakRYWHhs?=
 =?utf-8?B?ZVhXek56M2dnMDRYM0Z2UUtUWFhjQ0RHb0JhUExhZ1RmUjZxZi92UXdDSXZP?=
 =?utf-8?B?NTdyeWs0VkkvWEVjVk16UnM1b1pnNUtlWDJNclkySS9lYUJoQzg1UEpHUXBZ?=
 =?utf-8?B?L2pMMTlsREVFb1lGayt0b1krZ2FZREpGY1EreGhCcTRYSlBZZmRLSWx3a2JU?=
 =?utf-8?B?QmtvU1ZaZ2R3amVqMnJnM2J5M21Vbkp3ZDZKQ0puMFRscTEzdlhLSjhicy9U?=
 =?utf-8?B?RHpnUDRFWmo0SzhZSDZnRU5ONExBZ0pUaGIxOFRHQ3VMVXpvMGlDMDYwd2Nl?=
 =?utf-8?B?MDVSaWF6dDNFcWtYTmZmUk1vZllVSkN1S3VlQ0FsTGdNUy9vWndRNFRHekg0?=
 =?utf-8?B?R2RFbEZjMW9ZbytlUVI0VERZMVBQcEpLMm43TjNzNEQ2Z21GSDZHOVVJNThU?=
 =?utf-8?B?M2w2M2lOeExubDBZZFlHOFJqRTVrNVVMRERKZXNuVG1jRkw2RUhObFp2cUFh?=
 =?utf-8?B?STlFZDU0NVNTWXdrbCtoeUZQMUhtcUI4dmIvNlVnM2U1SW5iK0tqcmZKWWh1?=
 =?utf-8?B?U3FsWnNsTkExSDlvbnJ5d3QyOTBobzBLdEp5RnNuK0dlRGtCdjBOeXdqdU55?=
 =?utf-8?B?YWZuTFpTMXZBbzRFZTQvQXo1WWJXVE9nWXdTZ3ZKRUtLejBIa3Rkb3FKNjhQ?=
 =?utf-8?B?aXBUb0duWXBUVGRwMmxXSTZ2K3lDTGtnYmRKcE1WMURUTmZETzdwd0tGemtH?=
 =?utf-8?B?aVVWQ1hTaW1UeE5NNFZ2VmR2VkVtM1JhMnp2aEwrWFlTY05zTWZlNEhMSS9F?=
 =?utf-8?B?Z2lHTUlZTVdvQXlibytHZzMyUnN5M1p3NEREMTdsMW9pUnMzS3J4ajZsWCtF?=
 =?utf-8?B?anpqUGRVVzNxSnNKMGU1WnE5T2pESWV4NDErQThnWDJ1Q0tETHdDODQ3NHdz?=
 =?utf-8?B?Nk5tYndCWmFhZGc2VEVyT0xOL2tkSW1udlFDY3U5ZW9QcjFwb2dTY3NHNE1O?=
 =?utf-8?B?c25uZ0tVc0RQSlltcHM3UlgzS2ZRbXRBeURoUGJyVE5RcitpdDBWbnpaSE5V?=
 =?utf-8?B?N2JRRFJGZjBISzh0S0Jydld3dktkdkQweVQvbEFIVFlHTXA0dmN1N3lYZGUz?=
 =?utf-8?B?N3ZPVllnditTM0xMeHluUUJJcVZMY3VYVk9mSWVGYk5HUW9hYnRqVGVUSURm?=
 =?utf-8?B?akxPTWM0VzZKZktUb2Q2dHRvc0QxVTh3RDdIUVpoa0tTblVmeUQ5MDMvNjY4?=
 =?utf-8?B?WXpzSGZmS2hCc1VMNUxxeEFMNGJjZHU5WUo2UDNCRUk1S1hRU05MeWtaVjht?=
 =?utf-8?B?Nkl0TGZDaWVRR3BURXNjYmNwTC8rc0krdUJ0VkloeUZJelUxU25OODZNWjRX?=
 =?utf-8?B?WE5KbDArY3hSaTBFVEl1OWIwREN3bnNUb2c0ZElEaFpYMWlZRjc0dnJZUTBT?=
 =?utf-8?B?MUhZMU1QT2ticmZnL2hVMGp1RGVmTHlqRUh5NldGT1BzMUZ6ZTNsWmhKbEVy?=
 =?utf-8?Q?ou7Nn9PpnI5Kw9unOM=3D?=
Content-ID: <AC8E4CC95A641E449A275EC24A6B7567@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc36cee-8f29-4da8-54a5-08d8fa4c06a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 05:06:10.7381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4nHLznI+atdurj2CNDzKIVTrCtpLFca0h5yXH55SXupZLfah7iVFmSx9zol0QAS277UJYjcu8ilVRJZsMBlucVIGkmbPYIsqF3wKW31gOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_060618_259221_3E1347D4 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

Hi,

On 3/19/21 8:58 AM, tkuw584924@gmail.com wrote:
> +static int
> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
> +                        const struct sfdp_parameter_header *bfpt_header,
> +                        const struct sfdp_bfpt *bfpt,
> +                        struct spi_nor_flash_parameter *params)
> +{
> +       int ret;
> +       u32 addr;
> +       u8 cfr3v;
> +
> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
> +       if (ret)
> +               return ret;
> +       nor->addr_width = 4;

Takahiro, you are bypassing the core functions. spansion_set_4byte_addr_mode()
will be called at set_4byte_addr_mode() time, resulting in an illegal op?

Are we safe to modify the core and do the spi_nor_set_addr_width() and
nor->params->set_4byte_addr_mode() before parsing SFDP?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
