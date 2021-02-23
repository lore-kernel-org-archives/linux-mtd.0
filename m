Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6877DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 17:33:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C83764E83
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 17:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C83764E83
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YmEcN6QRtm/PKK+gFJ30U/bJgQSEN6r5GVXPOMhgnp8=; b=lAll4ymS1NLaC0dOinNBmlmJ6
	NPkzEVPmEHsz9aXsPSr/0HqLGqV2FN27Wsm1sS2xzgNhIqv2sXccKQkoL6pa1sMqTTLpBxyeT035T
	4+dYu/CHdsCAga/UAFiZXfTsowmm/FBkqlpMkVI0MZja/NTbkVqXprmF+KqelaVw+VvNv4otyScys
	Mk2EZAm18SN6aD/3VaQZbVpSldRNgx1/E3E9Tcd+hp4GbeVSyzU4Rt0PiOAe2fY+H2VCQKXqLatBF
	TaLOdntwETpTntAZmx77SM4JIGaFD6c+ujycConseZ20++IE25EXo4oPq1RJuEGqYaReCmdMjKVJe
	kAortcj+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEbXY-0000Qw-4g; Tue, 23 Feb 2021 17:32:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEbXP-0000MG-Bs
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 17:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614101515; x=1645637515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=souZ+tR3XmuWE71VchYtOVPkYR9xrq2psd0i+aLyKtI=;
 b=ofFdsm4GJvnNcavx6dcQes0UH3H0P0neBq59tF+fS+VlLMen+AlOQaW0
 mBN6c59rYJBz+UKvbmH4Hey7S21HwLmsbvift0KKjz/IOKbqN6ChgLXZR
 btGkhSIwWUF7IJx/urZJCocnRaUuNOFTSKfPZ8CTCzpipfoLnyZF1smfq
 jxlHRkXh4LFTApvcBu/PahUHRfcK8Q3l0vbRL+UPuNtsMwHyUhDnwKHwN
 Fv9+/sXeDmzlp9lNh04kP7EP7ipVgDZ+n5gMJwfvlcVN5a1PNw1WgCNcQ
 Zz+A3nkse5Q+w9UWo5+WvZhO5UXr6aRTTcwVkRBq+/JoS7ZjzW2FU2qsQ g==;
IronPort-SDR: hdmGgqOgQd48ADKgiUT5xaNovrTZlTRs/QcjVLIXVztUkf6lXI54x/fymRPP17ak2HRZsi0uD9
 hpOqxHBOR2oP8MK3AWmD/aN6vTCkLwpSmAk/koOCVXpHL9KcOSCeYb1/5uftakoyEgLXizP51D
 Rh6bpiwT6K4JsZga7ZI45xtFNdsz2mz7XyQc0zlRiDsb6IegQ9ZOzVal/zrit7oZlXk7o4RrzR
 BsHYAnFVh428TEU7REe3C3IMSwuHEptb3g0z8SFBVF3R/EA8VYHG962sSKAwfNhxJqWabb0g78
 xmM=
X-IronPort-AV: E=Sophos;i="5.81,200,1610434800"; d="scan'208";a="116304320"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Feb 2021 10:31:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 23 Feb 2021 10:31:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 23 Feb 2021 10:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yzch7WnH56H7kVTQXuZI92VFnnwuCrlNJY0hq/yVE/WNH5+w6Q2rWtTa6RzmU3p+xryjPDtRnalLzALapY2dfc/R9MGlqfvb3f8S4fv9TQG0Hhpdg+NpfYcjZ8BB9RtgOnMadA0UStH4iWn8d5f+y/fRBGG239g5fvEqvQlu+IRQ6tbZ+Sqc+hGep6wR1jpi27ZxpwIb9myinYpxvQWqwTK3amV5TW+C1Hgo2p1YLYQ7A+rXNQxk9+nY3NTF0BwPALAZPeGjA+YD6GP+eBoE9qedhvSwGL1Tcvmx6bVWOQfCdSqkNPXFwtHM8f95dKmLkknI34pu5oZ/FIWzfVVWBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=souZ+tR3XmuWE71VchYtOVPkYR9xrq2psd0i+aLyKtI=;
 b=MzIYCDzRjvfD0aTHmOJWI9OyCdMzbozc9YbNCpC0Ml6+KOJg+p7fZYu3gqcx+JGC1D1CKKintFBta9Ggx6KGhidZ3TdYMdrcFLwcl67GxOBbXotkC1GHulcCyrxQEzLAAZ+TY/+DElPGCFDEwOAWeJ5qan5cbtOYXEdvEHBEgEqbALM2HGQRNDYBpZs205xxbbwins+8zqhLqQsWPDDkya+yEuKx5NOZn2/7u0luFbaTsG562tpD2ckzZY5wYKJY7O2I2jcv97pXIsWwWSJ1I/QJ0bablokbtMb3qLIwvJYSlwI06WL8Li+R+OZ8pKP8NaROq1y2yX78fU4eoKHMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=souZ+tR3XmuWE71VchYtOVPkYR9xrq2psd0i+aLyKtI=;
 b=sd4StVvViv57JQv2IdgbM5umFB/sQs8pd2hg9RQA4F3gg1uP/cYtPRPeV5wKwEGRca64ajDjGH5YlORN7xR4VdNj+4GvCJoj7b6lMO/UhorOWisfX1MswRrNbT2C4U9LrXfoMUS1YZAtfEAOqqPfTkRjZXdq/jznbYDjhw/fkeE=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 17:31:50 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 17:31:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Yaliang.Wang@windriver.com>, <vigneshr@ti.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
Thread-Topic: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
Thread-Index: AQHW8a94mMSXtQqoOE2NM8lFQHXK9Q==
Date: Tue, 23 Feb 2021 17:31:49 +0000
Message-ID: <549f0999-ec8e-a2b0-2c2a-2c09a4951ad9@microchip.com>
References: <20201116153956.588098-1-yaliang.wang@windriver.com>
 <f2fe7e4e-a651-491c-f894-8cc264c64744@microchip.com>
 <d2a66253-e755-280f-8f79-d141b3169c56@ti.com>
 <2c578dcb-b9da-a56a-593c-b654cef6e67a@windriver.com>
 <6f868908-ee07-690b-98ea-47d81acf009d@microchip.com>
 <d80d6cd2-87c3-c336-7add-b91ff4e0b177@windriver.com>
In-Reply-To: <d80d6cd2-87c3-c336-7add-b91ff4e0b177@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eefe7690-a501-4e87-fb20-08d8d820e70c
x-ms-traffictypediagnostic: SA0PR11MB4623:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4623A37BEBE1E7A626CDF544F0809@SA0PR11MB4623.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tkUW4rlMMEHM8n3bf0c9HhXtEloIqF5a1SzJ/yrOkdfdzhnHaWyBvIQaGomXxNsjVS3bx+nzgi0K54SwRnT4zri+0bJQhlyIb/rVmCpdEuY97H1GlQbJBWhk+UzL0qBJlInMEmWdOOeGa0rQX7i4sCwsbVkD6S6Vc2ofF30TMo84Q6RWFEOwqW97JjT1B2S0nS0xkF8aXW/WlnW4R/ajwFA0t4WZ7iqStih0CJe5Ka/eg9vMbzflHDQA43HVlWtFulltUb5Wr8p+p1Y3XWdDqyFTELwe8Zhj5kHLz1ZZ6dE11WSRKoOsVXjBGxM+ihkKSbymC4qwfGxR8iPyAqJ0MjZedl7yuvPIYn2FfuUTnBbC8Urjkd4vf+raIB607XBNY35UaXe7pU1We9gG6Ma7p9hMnRjvKn1FdQDBwegJc9t4xT/z3ucHV5ureIpw8JernlcDgwHHNX5ETNmfJS6OTYrgM0SaOZQNJ/rzHx2P0dH1e8SZZ7BSEQjYmLDA38hzADEwPQog1LWNHq6iWUkmocWigWgyrmCunJmk4fwc3/ZCIoaG4JwDMh9/JsWhkGk+FZzlC9wVyn/C/ZbNxICCcRBds/CZDopR1L4krTQwpoW/ih5iybf1h2krS+GJFy+DumFoyXE2cHKURu6QN25mp4ay8I8jvoBx9Wzy1xoMcQ9psDzcSFewOtUaL3eGuGIA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(396003)(376002)(39860400002)(8936002)(83380400001)(53546011)(6506007)(8676002)(6512007)(71200400001)(31696002)(186003)(4326008)(31686004)(6486002)(86362001)(2616005)(26005)(316002)(91956017)(2906002)(110136005)(966005)(66946007)(66446008)(64756008)(66556008)(478600001)(66476007)(5660300002)(36756003)(76116006)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dnQwVGpGcURIRG1IVjF0S3NWRStuWWQyUDZJT0Q2TURyaWV4V1kxWktDTWpH?=
 =?utf-8?B?eW9oM2FaK0FZQm54c0ZCckZPa0VSam5RODMzaHdTckhKWFBoOXZYNXNreWZB?=
 =?utf-8?B?cGZMMGE3UEhXOU1QSVFMZ2VQR3lCRW51NDhPaTVKM1FkTVlKa2JIazV3NzhL?=
 =?utf-8?B?cFFBeXY5MXFNVWc3cXRkdmtIZlNMOTNza2VqczJZNzRIaUU3c1NyeW10OE8w?=
 =?utf-8?B?d1hNSlFGaUJjVGlnS2Jpb3lTd3ZXSzltK1QzNVBXenI2U3lDbmR6Rm1MS0ZS?=
 =?utf-8?B?Y2ZpYkk4NkRBQU9DZVRyaHhBdnR6aCsxVTZQdm9DYnh6a2xkWVRuQVJDdlZu?=
 =?utf-8?B?eVJZZVlPVm9IRXQra3Jpb1ZqczI0SkFUSCtKckpzZ3hpV1lDN3lrOXpjN2JT?=
 =?utf-8?B?b2gwWXVMeVdEZzB3MVpNNzJiZVNqNVJjWTBhZ2EzNXUwVVhiL0tLL2g4REdx?=
 =?utf-8?B?YU13bFpIVzRPQ0oyT1k2SS9mTlRoZHEvckpzWktCVFZTOEdYWERuSGlPN2dL?=
 =?utf-8?B?MFR3R0w1WTN2R0cvUmpqWHJ2eUdkR3dWTmE2K0FVa05adHVpVlJvelZwcFBt?=
 =?utf-8?B?UFZ6Q3lkaEZXeDN4Y21UWnp1cnQrN2M4ODdJamR6enVydWo3YTVtclZwZnlH?=
 =?utf-8?B?VWIxOWFpeFo1SHRPcmRRTE50VSt5SGViaUhaVytHZlBySjc2MHRPNkJYUXZ5?=
 =?utf-8?B?b3R6NjRaRlZCbGpjSU9vY3hRd2ZaNFV1dHZJTWRBakVsYjdCRkRRdlR5MGxz?=
 =?utf-8?B?MWNNbnFoZ3hGeWRSbjgySTNVam1kOURkLys1Y0s3ZHNVNmREQ2lrSnlORTlh?=
 =?utf-8?B?aU5iRUpjS21GS20vTXBEdml4bHdQRUJaSWFLTWxScVQ4NlJ4WmdMaWpWTlN2?=
 =?utf-8?B?KzVTYm8xMFdPRnpWUTljdWdUTkw3QWRIdEs5RFhVNnpJTDc4cjdZTWRHMXVD?=
 =?utf-8?B?cmRCNkE1eVhDWHZvd3I4dDNRdVZmSjFVOXFWLzRaNHFxblZ1NUwwRmhzblQz?=
 =?utf-8?B?anVpS2dmejZVVXhDamlRR29WRytDUDNscUYvdHdZOHNUb281ckxmZzZDaDZq?=
 =?utf-8?B?ZmI3Yk8yOW5NeURUUUZ2Qi9OWjVGVTd4bVJZQitSbXFkRnBHSXdhbFNxNmdL?=
 =?utf-8?B?azlJK05YdGhWbkJpaGVUZHlkcjZGakh1ZVprL2E4dWtuTGZtL1ZYeG5EYXdW?=
 =?utf-8?B?aDZxcUE2cXQvK3Z4S2JkV1Y1Tkl0K0Y4Wkl2eDJJK001ZmNZMWc3Q0FSK09s?=
 =?utf-8?B?MzF3b2pJYlZPeE15cmJxdldSOEJrOUw2S2V4YTF6NnJxRVdlcG94OTBaZDNT?=
 =?utf-8?B?ZnRlT3J5di9BcFZLK003d05IL3VJT01GTTVpdTVBaXhkbFlMc3BkUlIwc3dK?=
 =?utf-8?B?NFkzd2JjYnI1eG9pL096UHVnMGplemtlc3ExQmoxN0RZL2ZlOTQyQXhkaFFQ?=
 =?utf-8?B?N2JBRzBWQ0h2OUhnZjhzbzJGd0J4OE5PY2UrNUpWZTBJMi8wTUFzVDNKTE1x?=
 =?utf-8?B?WHpvOWFDTmh2MXhHY1ZHbWd4WFhFeThKRkNoaGI2QjdQbGxZc1dtdGwzN3ha?=
 =?utf-8?B?aFBTb3R5VG9HSllwVzM5dUs0a3FGSitpMjZKTDhkMG1GMVh4a1VlemhFVmRD?=
 =?utf-8?B?cFFEYVV5M3FFR0JQNU9UcXlqSXpHWjFGQ0NOQitqb2UvNmx4SktVTHVVa0Fp?=
 =?utf-8?B?d2tPSlJaWk1nNUQwUDFDMjRJV1dpdlRkWUtrdHd5TUlUb1ZBTDQwaW9NQ0RF?=
 =?utf-8?Q?Edzbf7qxkPxMzWzhuk=3D?=
Content-ID: <9BE5B58AEC741E4083AD4C6E6EC918CD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eefe7690-a501-4e87-fb20-08d8d820e70c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 17:31:49.8581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: blq/bQB/WVsCZJMAiW2ZfNEugEmO+juSUB6D1fnVA0IZViCo6hHUfKiUg2IkTk4+xFSzCIJiOv5geNB3JNK7HqLl5EoTE6361mqeYkgdt1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_123155_690067_1D5A0F68 
X-CRM114-Status: GOOD (  25.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMi8yMy8yMSA2OjM2IFBNLCBZYWxpYW5nLldhbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGksIFR1ZG9yDQoNCkhpLCBZYWxpYW5nLA0KPiAN
Cj4gU28gc29ycnkgdG8gcmVwbHkgc28gbGF0ZSwgbm93IEknbSBjb21taXR0ZWQgdG8gc29sdmlu
ZyB0aGlzIHByb2JsZW0uDQo+IEFmdGVyIGNoZWNraW5nIG92ZXIgc2l4dHkgZGF0YXNoZWV0cyBh
bmQgYWxtb3N0IGF0IGxlYXN0IG9uZSBkYXRhc2hlZXQNCj4gZm9yIGVhY2ggZmFtaWx5IG9mIHRo
ZSBtYW51ZmFjdHVyZXJzLCBJIGNhbiBmaW5hbGx5IGRldmlsZXIgc29tZQ0KPiBjb25jbHVzaW9u
cy4NCg0KR3JlYXQhIFRoYW5rcyBmb3IgZG9pbmcgdGhpcyENCg0KPiANCj4gMS4gUkRTUjIoMDdI
KSBpbnN0cnVjdGlvbiBpcyBqdXN0IHVzZWQgYnkgU3BhbnNpb24gbWFudWZhY3R1cmVyLg0KDQpU
aGVuIHdlIGNhbiBkZWZpbmUgaXQgYXMNCiNkZWZpbmUgU1BJTk9SX09QX1NQQU5TSU9OX1NSMiAg
ICAgICAgICAweDA3aA0KDQphbmQgZGVmaW5lIGl0cyByZWxhdGVkIHN0YXRpYyBmdW5jdGlvbiBp
biBzcGFuc2lvbi5jLiANCg0KPiBBcyBmb3IgYWxsIG90aGVyIG1hbnVmYWN0dXJlcnMsIG1vc3Qg
Y29tbW9uIGluc3RydWN0aW9ucyBmb3IgcmVhZGluZyBTUjINCj4gaXMgIjM1SCIswqAgYW5kICIx
NUgiIGlzIGZvciByZWFkaW5nIFNSMy4gU29tZSBtYW51ZmFjdHVyZXMgaGF2ZSBzcGVjaWZpYw0K
PiByZWdpc3RlcnMgdGhhdCBhcmUgc2ltaWxhciB0byBzdGF0dXMgcmVnaXN0ZXIsIHN1Y2ggYXMg
IkluZm9ybWF0aW9uDQo+IFJlZ2lzdGVyIiwgIlN1c3BlbmQgU3RhdHVzIFJlZ2lzdGVyIiwgIkV4
dGVuZGVkIFJlYWQgUmVnaXN0ZXIiLA0KPiAiU2VjdXJpdHkgUmVnaXN0ZXIiLCAiRmxhZyBTdGF0
dXMgUmVnaXN0ZXIiIGFuZCBhbHNvIGhhdmUgc3BlY2lmaWMNCj4gaW5zdHJ1Y3Rpb25zIGZvciBy
ZWFkaW5nIHRoZW0sIHN1Y2ggYXMiMkJILzA5SC84MUgvMkJILzcwSCIuDQoNCkFyZSB0aGVzZSBj
b21tb24gdG8gbW9yZSBtYW51ZmFjdHVyZXJzPyBJZiB5ZXMsIGl0IHdpbGwgaGVscCB1cyB0byBp
bmZvcm0NCnVzIHRvIHdoaWNoIG1hbnVmYWN0dXJlcnMgYWxsIHRoZXNlIG9wcyBhcmUgY29tbW9u
LCBpdCB3aWxsIHNwYXJlIHVzIHRvDQpza2ltIHRocm91Z2ggZGF0YXNoZWV0cyBsYXRlciBvbi4N
Cg0KPiANCj4gMi4gUkRTUjIoMDdIKSBpbnN0cnVjdGlvbiBpcyBub3QganVzdCBleGlzdGVkIGlu
IFNwYW5zaW9uICJTMjVGTC1MIg0KPiBmYW1pbHksIGFsc28gZXhpc3RlZCBpbiBTcGFuc2lvbiJT
NzlGTC1TLCBTNzBGUy1TLCBTMjVGTC1TLCBTMjVGUy1TLA0KPiBDWVJTLCBDWTE1Qi9WLVNOIiBm
YW1pbGllcy4gV2UganVzdCBoYXZlbid0IHVzZSBpdCBiZWZvcmUsIGl0IGhhcyBiZWVuDQo+IHRo
ZXJlIGZvciBhIGxvbmcgdGltZS4NCg0KQ29vbCwgaXQgY2FuIHJlc2lkZSBpbiBzcGFuc2lvbi5j
IHRoZW4uDQoNCj4gDQo+IDMuIE1hbnkgbWFudWZhY3R1cmVycyBhcmUgdXNpbmcgQ0xTUigzMEgp
IGluc3RydWN0aW9uLCBidXQgdGhlIGZ1bmN0aW9ucw0KPiBhcmUgZGlmZmVyZW50Lg0KPiBUaGUg
bW9zdCBjb21tb24gZnVuY3Rpb24gb2YgIjMwSCIgaW5zdHJ1Y3Rpb24gaXPCoCB0byByZXN1bWUg
dGhlDQo+IHN1c3BlbmRlZCBiaXRzLCBidXQgaW4gbWFueSBTcGFuc2lvbidzIHByb2R1Y3RzICwg
dGhlIGZ1bmN0aW9uIGlzIHRvDQo+IGNsZWFyIFBfRVJSIGFuZCBFX0VSUiBiaXRzLiBJbiBzb21l
IG90aGVyIFNwYW5zaW9uJ3MgcHJvZHVjdHMoc3VjaCBhcw0KPiBTMjVGUy1TKSwgU3BhbnNpb24g
cHJvdmlkZWQgYSBjb25maWd1cmUgcmVnaXN0ZXIsIHdoaWNoIGNhbiBtYWtlICIzMEgiDQo+IGlu
c3RydWN0aW9uIGV4ZWN1dGUgdGhlIGFsdGVybmF0aXZlIHJlc3VtaW5nIHN1c3BlbmRlZCBiaXRz
IGZ1bmN0aW9uDQo+IGxpa2Ugb3RoZXIgbWFudWZhY3R1cmVycy4NCg0KV2hpY2ggb3RoZXIgbWFu
dWZhY3R1cmVycz8gSXQgd2lsbCBoZWxwIHVzIGxhdGVyIG9uLg0KDQpXZSBjYW4gZGVmaW5lIHRo
ZSBvcCB0aGF0IGNsZWFycyB0aGUgUF9FUlIgYW5kIEVfRVJSIGJpdHMgaW4gc3BhbnNpb24uYzoN
CiNkZWZpbmUgU1BJTk9SX09QX1NQQU5TSU9OX0NMU1IgICAgICAgICAgMHgzMGgNCndpdGggc3Rh
dGljIGZ1bmN0aW9uIGluIHNwYW5zaW9uLmMNCg0KVGhlIG9wIHRoYXQgaXMgdXNlZCBhdCByZXN1
bWUsIGNhbiBiZSBsYXR0ZXIgYWRkZWQgaW4gdGhlIFNQSSBOT1IgY29yZS4NCg0KPiANCj4gNC4g
UF9FUlIgYW5kIEVfRVJSIGJpdHMgYXJlIGV4aXN0ZWQgaW4gbWFueSBtYW51ZmFjdHVyZXJzLCBy
ZXNpZGUgaW4NCj4gc3BlY2lmaWMgcmVnaXN0ZXIsIHN1Y2ggYXMgIkluZm9ybWF0aW9uIFJlZ2lz
dGVyIiJGbGFnIFN0YXR1cyBSZWdpc3RlciINCj4gYW5kIHNvIG9uLCBhbmQgdGhlIGluc3RydWN0
aW9ucyBmb3IgcmVhZGluZyB0aG9zZSByZWdpc3RlciBhbmQgY2xlYXJpbmcNCj4gdGhlIEVSUiBi
aXRzIHZhcmllcyBhY2NvcmRpbmcgdG8gdGhlIGRpZmZlcmVudCBtYW51ZmFjdHVyZXIuDQoNCkFn
YWluLCBpZiB0aGlzIGlzIGZyZXNoIGluIHlvdXIgbWluZCwgaXQgd291bGQgaGVscCB0byBzYXkg
d2hpY2ggbWFudWZhY3R1cmVyDQphbmQgd2hhdCBpbnN0cnVjdGlvbnMuDQoNCj4gDQo+IEJhc2Vk
IG9uIHRoZSBmYWN0cyBhYm92ZSwgYW5kIHRvIHJlc29sdmUgdGhlIG9yaWdpbmFsICJzcl9yZWFk
eSIgcHJvYmxlbQ0KPiB3aXRoaW4gIlMyNUZMLUwiIGZhbWlseSBvZiBTcGFuc2lvbiwgSSB0aGlu
ayB0aGUgc29sdXRpb24gaXMgbm90IG11Y2gNCj4gZGlmZmVyZW50LiBXZSBuZWVkIGEgInNyX3Jl
YWR5IiBmdW5jdGlvbiBwb2ludGVyIGFuZCBtYXliZSBhIG5ldyBmbGFnIHRvDQo+IG1hcmsgdGhl
IHR3aXN0ZWQgc3RhdHVzwqAgcmVnaXN0ZXIuwqAgQWN0dWFsbHkgSSBoYXZlIG1hZGUgYSByb3Vn
aCBmaXgNCg0Kc3JfcmVhZHkgZnVuY3Rpb24gcG9pbnRlciBzaG91bGQgYmUgZW5vdWdoLiBUaGUg
ZGVmYXVsdCB2YWx1ZSBmb3IgaXQgd2lsbA0KYmUgaW5pdGlhbGl6ZWQgaW4gdGhlIFNQSSBOT1Ig
Y29yZSwgYW5kIGZvciB5b3VyIHVzZS1jYXNlLCB5b3UgY2FuIHVwZGF0ZQ0KaXQgaW4geW91ciBt
YW51ZmFjdHVyZXIgZHJpdmVyLg0KDQo+IGJhc2VkIG9uIHRoYXQobm90IGluY2x1ZGUgZml4aW5n
IHNwaV9ub3JfeHJlYWRfc3IgYW5kDQo+IHNwaV9ub3JfZnNyX3JlYWR5KS4gV291bGQgbGlrZSB0
byBsZWFybiB5b3VyIHN1Z2dlc3Rpb25zIGJlZm9yZSBnb2luZw0KPiBmdXJ0aGVyLg0KDQp3ZSBz
aG91bGQgYmUgZ29vZC4gVHJ5IGEgc21hbGwgcGF0Y2ggYW5kIGFpciBpdC4NCg0KPiANCj4gVGhl
IGNoZWNrZWQgZGF0YXNoZWV0cyBhbmQgcmVsYXRlZCBtYXJrcyBhcmUgdG9vIG1hbnksIGl0IG1h
eSBub3QgYmUNCj4gYXBwcm9wcmlhdGUgdG8gcG9zdCB0aGVtIGhlcmUsIGJ1dCBJJ2QgbGlrZSB0
byBzaGFyZSwgb25jZSBuZWVkZWQuDQoNCldvdWxkIGhlbHAuIEdyZWF0IHdvcmssIHRoYW5rcyEN
Cg0KdGENCg0KPiANCj4gQmVzdCBSZWdhcmRzLA0KPiBZYWxpYW5nDQo+IA0KPiBPbiAxLzI2LzIx
IDQ6NTEgUE0sIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEhpLCBZYWxp
YW5nLA0KPj4NCj4+IE9uIDEvMjYvMjEgNDowNiBBTSwgV2FuZywgWWFsaWFuZyB3cm90ZToNCj4+
PiBvciB4eGgoRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBIaSwg
VmlnbmVzaCBhbmQgVHVkb3INCj4+Pg0KPj4+IEl0J3MgcmVhbGx5IGluc3BpcmluZyByZWNlaXZp
bmcgZnJvbSB5b3UsIGFuZA0KPj4+DQo+Pj4gT24gMS8yNC8yMDIxIDI6MTIgUE0sIFZpZ25lc2gg
UmFnaGF2ZW5kcmEgd3JvdGU6DQo+Pj4+IMKgwqAgSGksIFlhbGlhbmcNCj4+Pj4NCj4+Pj4gT24g
MS8yMy8yMSAxMToxNSBQTSwgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+
Pj4gSGksIFlhbGlhbmcsDQo+Pj4+Pg0KPj4+PiBbLi4uXQ0KPj4+Pj4+ICtzdGF0aWMgaW50IHNw
aV9ub3JfczI1ZmxfbF9zcl9yZWFkeShzdHJ1Y3Qgc3BpX25vciAqbm9yKQ0KPj4+Pj4+ICt7DQo+
Pj4+Pj4gK8KgwqAgdTggKnNyID0gbm9yLT5ib3VuY2VidWY7DQo+Pj4+Pj4gK8KgwqAgaW50IHJl
dDsNCj4+Pj4+PiArDQo+Pj4+Pj4gK8KgwqAgcmV0ID0gc3BpX25vcl9yZWFkX3NyKG5vciwgc3Ip
Ow0KPj4+Pj4+ICvCoMKgIGlmIChyZXQpDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiByZXQ7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICvCoMKgIC8qKg0KPj4+Pj4+ICvCoMKgwqAgKiBQ
X0VSUiBhbmQgRV9FUlIgYml0cyBhcmUgbG9jYXRlZCBpbiB0aGUgU3RhdHVzIFJlZ2lzdGVyIDIN
Cj4+Pj4+PiArwqDCoMKgICogb2YgQ3lwcmVzcyBGTC1MIHNlcmllcyBjaGlwcy4NCj4+Pj4+PiAr
wqDCoMKgICovDQo+Pj4+Pj4gK8KgwqAgcmV0ID0gc3BpX25vcl9zMjVmbF9sX3JlYWRfc3IyKG5v
ciwgJnNyWzFdKTsNCj4+Pj4+PiArwqDCoCBpZiAocmV0KQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoCBpZiAobm9yLT5mbGFn
cyAmIFNOT1JfRl9VU0VfQ0xTUiAmJiBzclsxXSAmIChTUl9FX0VSUiB8IFNSX1BfRVJSKSkgew0K
Pj4+Pj4gSWYgY2hlY2tpbmcgb3RoZXIgbWFudWZhY3R1cmVyIGRhdGFzaGVldHMsIHdvdWxkIHlv
dSBwbGVhc2UgY2hlY2sgaWYNCj4+Pj4+IENMU1IgaXMgdXNlZCBieSBhbnkgb3RoZXIgbWFudWZh
Y3R1cmVyPw0KPj4+Pj4NCj4+Pj4gVGhpcyBpcyBsaW1pdGVkIHRvIGNlcnRhaW4gc3Vic2V0cyBv
ZiBDeXByZXNzL1NwYW5zaW9uIGZsYXNoZXMuDQo+Pj4+DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmIChzclsxXSAmIFNSX0VfRVJSKQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihub3ItPmRldiwgIkVyYXNlIEVycm9yIG9jY3VycmVk
XG4iKTsNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQ0KPj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihub3ItPmRldiwgIlByb2dyYW1t
aW5nIEVycm9yIG9jY3VycmVkXG4iKTsNCj4+Pj4+PiArDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgIHNwaV9ub3JfY2xlYXJfc3Iobm9yKTsNCj4+Pj4+PiArDQo+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgIC8qDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBXRUwgYml0
IHJlbWFpbnMgc2V0IHRvIG9uZSB3aGVuIGFuIGVyYXNlIG9yIHBhZ2UgcHJvZ3JhbQ0KPj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogZXJyb3Igb2NjdXJzLiBJc3N1ZSBhIFdyaXRlIERp
c2FibGUgY29tbWFuZCB0byBwcm90ZWN0DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBhZ2FpbnN0IGluYWR2ZXJ0ZW50IHdyaXRlcyB0aGF0IGNhbiBwb3NzaWJseSBjb3JydXB0IHRo
ZQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogY29udGVudHMgb2YgdGhlIG1lbW9y
eS4NCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXQgPSBzcGlfbm9yX3dyaXRlX2Rpc2FibGUobm9yKTsNCj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVJTzsNCj4+Pj4+PiArwqDCoCB9DQo+Pj4+Pj4gKw0KPj4+Pj4+
ICvCoMKgIHJldHVybiAhKHNyWzBdICYgU1JfV0lQKTsNCj4+Pj4+PiArfQ0KPj4+Pj4+ICsNCj4+
Pj4+PiDCoMKgIC8qKg0KPj4+Pj4+IMKgwqDCoCAqIHNwaV9ub3Jfc3JfcmVhZHkoKSAtIFF1ZXJ5
IHRoZSBTdGF0dXMgUmVnaXN0ZXIgdG8gc2VlIGlmIHRoZSBmbGFzaCBpcyByZWFkeQ0KPj4+Pj4+
IMKgwqDCoCAqIGZvciBuZXcgY29tbWFuZHMuDQo+Pj4+Pj4gQEAgLTU0Niw3ICs2MjgsMTkgQEAg
c3RhdGljIHZvaWQgc3BpX25vcl9jbGVhcl9zcihzdHJ1Y3Qgc3BpX25vciAqbm9yKQ0KPj4+Pj4+
IMKgwqDCoCAqLw0KPj4+Pj4+IMKgwqAgc3RhdGljIGludCBzcGlfbm9yX3NyX3JlYWR5KHN0cnVj
dCBzcGlfbm9yICpub3IpDQo+Pj4+Pj4gwqDCoCB7DQo+Pj4+Pj4gLcKgwqAgaW50IHJldCA9IHNw
aV9ub3JfcmVhZF9zcihub3IsIG5vci0+Ym91bmNlYnVmKTsNCj4+Pj4+PiArwqDCoCBpbnQgcmV0
Ow0KPj4+Pj4+ICvCoMKgIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvICp0bXBpbmZvID0gbm9yLT5p
bmZvID8gbm9yLT5pbmZvIDogc3BpX25vcl9yZWFkX2lkKG5vcik7DQo+Pj4+Pj4gKw0KPj4+Pj4+
ICvCoMKgIGlmIChJU19FUlJfT1JfTlVMTCh0bXBpbmZvKSkNCj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FTk9FTlQ7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICvCoMKgIGlmICghc3Ry
Y21wKHRtcGluZm8tPm5hbWUsICJzMjVmbDA2NGwiKQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfHwgIXN0cmNtcCh0bXBpbmZvLT5uYW1lLCAiczI1ZmwxMjhs
IikNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHx8ICFzdHJj
bXAodG1waW5mby0+bmFtZSwgInMyNWZsMjU2bCIpKSB7DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBzcGlfbm9yX3MyNWZsX2xfc3JfcmVhZHkobm9yKTsNCj4+Pj4+PiArwqDC
oCB9DQo+Pj4+PiBObywgd2UgY2FuJ3QgYWNjZXB0IGZsYXNoIG5hbWUgY29tcGFyaXNvbnMgaW4g
dGhlIFNQSSBOT1IgY29yZS4NCj4+Pj4+IElmIENMU1IgYW5kIFJEU1IyIGFyZSBqdXN0IHNwYW5z
aW9uIHNwZWNpZmljLCB3ZSBjYW4gcHJvdmlkZSBhIHNyX3JlYWR5DQo+Pj4+PiBmdW5jdGlvbiBw
b2ludGVyIHRoYXQgY2FuIGJlIGZpbGxlZCBieSBzcGFuc2lvbiBmbGFzaGVzLiBPciBzb21lIG90
aGVyDQo+Pj4+PiBtZXRob2QgZGVwZW5kaW5nIG9uIHRoZSBDTFNSIGFuZCBSRFNSMiBleHBvc3Vy
ZSB0aHJvdWdoIG90aGVyDQo+Pj4+PiBtYW51ZmFjdHVyZXJzLg0KPj4+Pj4NCj4+Pj4+IElkZWFs
bHkgb25lIHdvdWxkIHNraW0gdGhyb3VnaCBhdCBsZWFzdCAyIC0gMyBkYXRhc2hlZXRzIGZyb20g
ZWFjaA0KPj4+Pj4gbWFudWZhY3R1cmVyIGF2YWlsYWJsZSBpbiBTUEkgTk9SLiBQcmVmZXJhYmxl
IGVhY2ggZGF0YXNoZWV0IGZyb20NCj4+Pj4+IGEgZGlmZmVyZW50IG1hbnVmYWN0dXJlciBmYW1p
bHkuIFVuZm9ydHVuYXRlbHkgSSdtIG5vdCBhd2FyZSBvZiBhbnkNCj4+Pj4+IHN0YW5kYXJkIHRo
YXQgZGVzY3JpYmVzIGFsbCB0aGUgc3VwcG9ydGVkIFNQSSBOT1IgY29tbWFuZHMuDQo+Pj4+PiBJ
ZiB5b3UgZmluZCB0aGlzIG92ZXJ3aGVsbWluZywgSSBjYW4gc2hhcmUgdGhlIHdvcmtsb2FkIHdp
dGggeW91LA0KPj4+Pj4gYnV0IGF0IGJlc3QgZWZmb3J0LiBJZiB5b3UgZ28gdGhyb3VnaCB0aGlz
IGJ5IHlvdXJzZWxmLCBwbGVhc2UNCj4+Pj4+IHNhdmUgdGhlIG5hbWUgb2YgdGhlIGRhdGFzaGVl
dCBmbGFzaGVzIHRoYXQgeW91IGdvIHRocm91Z2guDQo+Pj4+Pg0KPj4+PiBBZ3JlZSB3aXRoIFR1
ZG9yLiBUaGVyZSBpcyBxdWl0ZSBhIGJpdCBvZiB2YXJpYXRpb24gZXZlbiB3aXRoaW4NCj4+Pj4g
Q3lwcmVzcy9TcGFuc2lvbiBkZXZpY2VzLiBTMjggc2VyaWVzIG9mIGZsYXNoZXMgaGF2ZSB0aGVz
ZSBlcnJvciBiaXRzDQo+Pj4+IHdpdGhpbiBTUjEgcmVnaXN0ZXIuIFNlZTogaHR0cHM6Ly93d3cu
Y3lwcmVzcy5jb20vZmlsZS81MTM5OTYvZG93bmxvYWQNCj4+Pj4NCj4+Pj4gU28sIHRoaXMgY2Fu
bm90IGJlIGluIFNQSSBOT1IgY29yZS4NCj4+Pj4NCj4+Pj4gc3BpX25vcl94cmVhZF9zcigpLCBz
cGlfbm9yX2Zzcl9yZWFkeSgpIGFuZCBzcGlfbm9yX2NsZWFyX3NyKCkgYXJlIGFsbA0KPj4+PiB2
ZW5kb3IvZmFtaWx5IHNwZWNpZmljIGFuZCBzaG91bGQgYmUgbW92ZWQgdG8gYXBwcm9wcmlhdGUg
dmVuZG9yDQo+Pj4+IHNwZWNpZmljIGRyaXZlcnMuDQo+Pj4gSGF2ZSB0byBhZG1pdCB0aGUgY29t
cGFyaXNvbnMgYW5kIHRoZSBmdW5jdGlvbiBoZXJlIGFyZSBpbmFwcHJvcHJpYXRlLA0KPj4+IHRo
b3VnaCBpdCdzIHRoZSBmYXN0ZXN0IHdheSB0byBmaXggdGhpcyBwcm9ibGVtLg0KPj4+DQo+Pj4g
SSdkIGxpa2UgdG8gbW92ZSBzcGFuc2lvbiBzcGVjaWZpYyBvcGVyYXRpb25zIG91dCBvZiB0aGUg
Y29yZS5jIGZpcnN0LA0KPj4+IGJhc2luZyBvbiBzcl9yZWFkeSBmdW5jdGlvbiBwb2ludGVyIG9y
IG90aGVyIG1lY2hhbmlzbXMgbWVudGlvbmVkIGJ5DQo+Pj4gVHVkb3IsIGFuZCBhZnRlciB0aGF0
IEknbGwgc2VlIGlmIEknbSBjYXBhYmxlIHRvIGNvcGUgd2l0aCB0aGUgb3RoZXINCj4+PiBzZXZl
cmFsIHZlbmRvci9mYW1pbHkgc3BlY2lmaWMgZnVuY3Rpb25zLg0KPj4+DQo+PiBUaGUgZGlmZmlj
dWx0eSBpcyBub3QgaW4gbW92aW5nIHRoZSBjb2RlIGluIHNwYW5zaW9uLmMsIGJ1dCByYXRoZXIN
Cj4+IHRoZSBkb2N1bWVudGF0aW9uIGVmZm9ydCwgdG8gc2tpbSB0aHJvdWdoIGFsbCB0aGUgZGF0
YXNoZWV0cy4gU28gaWYNCj4+IHlvdSdyZSBnb2luZyB0aHJvdWdoIGFsbCB0aGUgZGF0YXNoZWV0
cyB0byBjaGVjayB3aGV0aGVyIFJEU1IyIGlzIHVzZWQNCj4+IGJ5IG90aGVyIHZlbmRvciBvciBu
b3QsIHBsZWFzZSBhbHNvIGNoZWNrIHRoZSBvdGhlciBvcHMgdGhhdCBtZSBhbmQNCj4+IFZpZ25l
c2ggaW5kaWNhdGVkLCBzbyB0aGF0IHdlIGRvbid0IGR1cGxpY2F0ZSB0aGUgZWZmb3J0Lg0KPj4N
Cj4+IENoZWVycywNCj4+IHRhDQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
