Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BA7C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:40:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACFF2336D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACFF2336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mfM58cDakD4WVKOf1DymtFL7sTNa/3fbyxQ7pg52e8I=; b=wls5I/SQJxwGEoQsSyh8t0SvC
	FNkIULV5y/fB35Qot4Nk2koJcgstgM26yOppePs0XyfbTH3se9neL1vTTqNIq4ZKL+MKTxcH1DYC/
	EThWcafeTJP5oRH3KiP5Ax38lEkJm+rZl6XIo7TcVtBq3Kz7LJQOxlXzDXSu0rDG/37+i8kbKxiO6
	d+Fh2hO2zDJkQzhXnQYlddUWlz8vShDeq0NUh9/c1MGUbSeriXui15EVjiVZxNyB0Q0Kxc+IiE7nP
	11+KnbP02fxRUFsFoO50exAVM6tc2dBv5y+S/qMWjUxZYTWIlp//9LQgk4y0akdhP+dhnQ2reCEcR
	GVjQo65+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Fa3-0006uA-Hu; Wed, 20 Jan 2021 15:39:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2FZy-0006to-OS
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 15:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611157170; x=1642693170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=682WpY+22vdFuBVgimLe9st4N1TYNokxXKC+YqGleGM=;
 b=dCYZrG/eBjwFforUM7x71/6gPPjDwys6/o1/fQyNlNmQ+H3TvLyExduy
 lebFbP0jRIJfbDOdGFUVwkgJrFG1FFI5us0oCKsgh9qzev458bsMnOECu
 2B2WN41pyowKK0rubYV3Wk0Ykm3ETYgroT3FmUMWZrUmVnN1QMKvpjjDe
 dd7jF/gSB1+Ghd1S8LkWdc2zuDt7PKuSuvlNYYhc+u7WbNnVMPac2uI8v
 crC80qJBdlUWsWB/gvjKpjMLoL9v9A5Vp94zQWRqPAGmsW99STdWk+nme
 2HrolOV6Xs61zBAsUzY6tT2qMyWWVCocBOkVmxeXcyhDyVQF22W+IxN54 w==;
IronPort-SDR: SFz4GrlCOpqSTSDqn2tOssuXWbsSKoQVIOpTiSceKE823rZLzdlDaJnv3yWaw1TD2bevmr9Y1L
 DcRSnd5AnhVfRmdIbjuPLs/QcZg7Ztk//NMMpEL2KqEAMI0eIxq4TGBpRzEncOdTV7RFS9QyIi
 QIWSIRsBfmo797LKMDr10XuAPHCmZr8h+e0fkkopI3uaoN4o0Dh/2biIqFyG25wGD0jLKRkWBg
 3On83Am2e92CB5TtPUCPpRsq20+XhQe8BqWTXUmc2Xt8zyWPm3ci4XROVELvPiA/HUlnL3y492
 YNM=
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="106649481"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jan 2021 08:39:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 20 Jan 2021 08:39:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 20 Jan 2021 08:39:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dB36BYsZhFYqc3xAKVoy1lsEED2vAuilXlctXROuh2HG8//w8JAnVLF+Ll+4V7E4vpCshL9bWvwuGa4KgiHfMb8pbRx0ItG0zLC6mgAJxaqUEpZax+lX8LuTPYr3b51k/Dk370+efSu4ZVPllH52LhLJ3mxsDNBtJajgY9FUQuf6N+R1N2rOAYEBq+C4E0QW5cqdEBTs/o6hnimQWnv43dW1uOfQVESURPT31siTI7Y69U0MvZBE2Ey5q9Q+ZGzzp94Cxj0U1WHkau4ycfy/ie4hWYuTF0y5HbLMCmJUBg5BLUBtQL4FuUpB+5S7AqX195hOOPZrNJYxrjgRfm7jdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=682WpY+22vdFuBVgimLe9st4N1TYNokxXKC+YqGleGM=;
 b=hnkq20zbHsLCjIALQYbjW0AzayLCB5oz7c0dK8I/9Uxu+rzWd8N/2wrZmcyWE2D+iRsR5FzMYVngd3l+xg5Qqw5YMlf85KYBHmPrYuLUAbJj8Yz0HAVPAR0GUXmtSAQgQtk3l42veu9OSgrnzxDW4e+yIGOBQ51/S8iVMigzg5pPwCGZbiO6eq6zAaAryMeqBRR6qVasQMygd2erNl0A+ngZI3Fbi8n2lX2HYeh/vP9sG8c0wo9o5M9WACr2c4JcPZWPN6iZOCD1elEg9hgghxOmgHylWkuYPJE9CMEbC1ONNbh4k5ipnYbDValrRKN8IDzav4SCgD+rsl4DjCLYfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=682WpY+22vdFuBVgimLe9st4N1TYNokxXKC+YqGleGM=;
 b=hPbhMWTX4Ngj104oXs4kzI+SXsSk5aQq4E9P5SzHRVJaDsfP819zLYPXCNgb6KlP10cDTD7SjHS0qwGYScjLcUidE3298XiABwdMa0UxQq4vYRHnTuI9FOU0atUSVT3QPpG6JY6MyGxp7TuNDNwcTGfSBGQVpZE/E+8Dv5DIgis=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2733.namprd11.prod.outlook.com (2603:10b6:805:58::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 20 Jan
 2021 15:39:17 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%3]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 15:39:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: sst: Add support for Global Unlock
 on sst26vf
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: sst: Add support for Global Unlock
 on sst26vf
Thread-Index: AQHW7zvWbgOMYI+QzkWXPBRNkt6zcg==
Date: Wed, 20 Jan 2021 15:39:17 +0000
Message-ID: <8a0e7885-4b9e-be62-eb46-1af74c65afa8@microchip.com>
References: <20210120131914.277363-1-tudor.ambarus@microchip.com>
 <20210120131914.277363-2-tudor.ambarus@microchip.com>
 <b3a61abec8927c7229c27415d2c769a8@walle.cc>
 <ad0cc416-73b7-f626-115f-d192fac17957@microchip.com>
 <447aca9c61a45b05f7869b9747e2c301@walle.cc>
In-Reply-To: <447aca9c61a45b05f7869b9747e2c301@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4964f109-7dfa-4e4a-16e7-08d8bd598c76
x-ms-traffictypediagnostic: SN6PR11MB2733:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2733F61ACF6B6DD98B702D3AF0A29@SN6PR11MB2733.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PcMB1oXXaPQlgLdWtX77Cn5nxp9YcnNkfkynoSVjUQOHbfUvAhuWs/+yN8XWn97elZS8sPf0ufYO4MIjfxLDvfqVPvccwPFJefhS9KxJZZJs9y7uXXRwJL4ErUmbvBkdMgz5QXd46xuuxEkt8YuvoyMiM0e9vOjHWqYqWx9a8bbyh32kxdOnQnKIEJJygE3jXHBKfYBwcbYSvmBQMJ2pm3R1HspPLtU6FM3usSHm8Kcaz0qqDwr/GmabgMKo16A8dr2BIEgx99vWdDTjT+GrPj060XeO1G+A9hNzu232b+9MJlvN7TzCFyNp6gOoYdcHweok0XI8RMI5dz1Z4VyNGm42HO3JLhubxnKQT+rJM+SCQ8Z2KkrbYKXs2plkC7Y+Z/+yNJlJeKeHQrn95+Z3CvRyA1cbqiPxjDbrA3QsMzEcKZR6oJW8x7+cyI/S7T9vQJfr71Rt3taFevUETVGAcUyrzxqJ3q35CphLTrgSf5D5+ZQERyiMyHsV28n3nEAv1eSIY8O3F89eDqLi4xDXWi9xrH7qoXTRbqyKHEVun7sdu9uyCw9KP5AJNa9mHigvapJKyHlRo9FFoaue1uvRT9a1rpjrBiVQVaeWPASgEuc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(66946007)(186003)(6512007)(107886003)(5660300002)(498600001)(64756008)(54906003)(66556008)(86362001)(36756003)(2616005)(91956017)(76116006)(66476007)(26005)(8936002)(53546011)(6506007)(83380400001)(6486002)(31696002)(6916009)(2906002)(8676002)(71200400001)(31686004)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WllaMGxzZmZmb0tBa0gza0RpTHdMTDFZanVSMG5CWE9KUzhjVW9nbXZwR2dz?=
 =?utf-8?B?TjhpRXllWG9lT2dRcFFHcTRXMW03QmlDZ2dyTGZQN3J5azM5LytxV1l2Q3o4?=
 =?utf-8?B?V0cya1FEeDRyWHV5SU5aQ2Z3U05PNVlWL3F2UHRUbERvQU15ZjcwNE80RnJo?=
 =?utf-8?B?U0tKbmh1T2FTMTZVNkgzemhxNFMxT2FyUEZnVEE2b0dwL1Q1ZlVjZE1MSEJu?=
 =?utf-8?B?dTB2QlRwZ0lyNXVRNFprV1Y1VUlJakhzL0UzRzhtdUFqY05Rbkl5T0E0SjVH?=
 =?utf-8?B?dDN2MDFubGVNNVl1aURXQ1N0THlWdVc3b2hadFViOUNIZmk1aVhLUU5lRWhB?=
 =?utf-8?B?andDb2lteGZYd1JaN25sakZaY2x0bVQ3UjUwM3lyMlF5cWdxU3RKK0VJempv?=
 =?utf-8?B?SStRUTdudU00RWZLYjZMMzNBN0ZHQTBodlRQdlNqbUdlbGxEVU9zSGdXOFRv?=
 =?utf-8?B?QnZVeVZxcUM2RlBISG9WNGFjZXdoY3M3VTNWM3RWRjQ1R2pKNU1iVWRRNGR0?=
 =?utf-8?B?SmV1ZEU0MGJ6Y3JjTi9UemIzMnJJWVRQcWVXNVpqbXkvS041ZXNwNG1DQ1l5?=
 =?utf-8?B?U3MvOFpyalV5UWtFQ1dmQzFCS1QyR01JUEdtS0krdVRVZFhnOExhLzBOVmlF?=
 =?utf-8?B?QWVMQVZYMVQ1cVFqdHJQeEhVZldvMUV0L05jQ2tUWDlVekwzSmJaQ3lUb2Er?=
 =?utf-8?B?dnM5TFZsc005RytqN3RIM3dIVFk0Qy9sdWpIR2VaalBZZU1Sbm9oTi8xeHh0?=
 =?utf-8?B?aXFCSlpHTWNGUHdYajlnR0RiaVQydDBDUkp0K2NkRDYxdmF5aW9WVkxIaDBX?=
 =?utf-8?B?SURzU0RuNnJOUUxGNGlSS0luc2ZZRTB3ZUxJN3c5aHdUQWtKWC9QYy95RTFP?=
 =?utf-8?B?NXluWlExRG0zb3hpWW9sS0NvS3oycWVlaVNZLzZlbWVZaVZPbkswNjVOeG15?=
 =?utf-8?B?MU8zMlo5UUVUdTdacVcyQkU5b05MeUEyMFRtTjRxRzJVUWFOczBGdzFZK2pO?=
 =?utf-8?B?eEtvTEpBdnpIcEpDaG9oUW1iUFVhVnVKekV6UTVWcDIzSnducGliMTlMUGpo?=
 =?utf-8?B?TG1Lb3JOaGQxdmtjU0hlM0IydEg5MDB3ZzhHSUJ4YjJRZ1RaVzQ4cjV2a2tB?=
 =?utf-8?B?RklJbm9zOHlNYzVzQ1hzQzROL2U2MTFNUGJRdmJDTEs3dWVRZTRkT0pjUmRY?=
 =?utf-8?B?SkxQSm53a25ucWNXeEg0L1dNd3pUaVFCYmFBQVd6SDRTWHhPQzBmYW5CK0Zq?=
 =?utf-8?B?eFQ5R2pidkFDTEs2UUNLTENBdkpzRjlQbzJGNnlDS1YxeVZoMVludmxWRnN6?=
 =?utf-8?B?L3B1MnhrK1JSMlh1TnhteGM0dUVLYzQ0Vmo1cVZzT1dvNmpJT3VPYzNZOXdr?=
 =?utf-8?Q?oaBv4g06KoL1mK+2t1cOzDeFs0QkQXy0=3D?=
Content-ID: <B890A5EC0E227A4888C44A5AAA42A3FB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4964f109-7dfa-4e4a-16e7-08d8bd598c76
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 15:39:17.8257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PaudgVBCE56FE4N4RDAqa4VYbATuIgu819jKQfMUbcVmQS06rGXP2RvGpf0jfTjeIZgx2ve6HTj+xawhRV2iHItmTIg4/tfWExMV1rof414=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_103931_196522_A004D4D9 
X-CRM114-Status: GOOD (  14.33  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Kavyasree.Kotagiri@microchip.com,
 miquel.raynal@bootlin.com, p.yadav@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMS8yMC8yMSA1OjAyIFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIDIwMjEtMDEtMjAgMTU6NTIsIHNjaHJpZWIg
VHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tOg0KPj4gT24gMS8yMC8yMSA0OjA1IFBNLCBNaWNo
YWVsIFdhbGxlIHdyb3RlOg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9z
c3QuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMNCj4+Pj4gaW5kZXggMDBlNDhkYTA3NDRh
Li5kNmUxMzk2YWJiOTYgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0
LmMNCj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zc3QuYw0KPj4+PiBAQCAtOCw2ICs4
LDM5IEBADQo+Pj4+DQo+Pj4+IMKgI2luY2x1ZGUgImNvcmUuaCINCj4+Pj4NCj4+Pj4gK3N0YXRp
YyBpbnQgc3N0MjZ2Zl9sb2NrKHN0cnVjdCBzcGlfbm9yICpub3IsIGxvZmZfdCBvZnMsIHVpbnQ2
NF90DQo+Pj4+IGxlbikNCj4+Pj4gK3sNCj4+Pj4gK8KgwqDCoMKgIHJldHVybiAtRU9QTk9UU1VQ
UDsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiArc3RhdGljIGludCBzc3QyNnZmX3VubG9jayhzdHJ1
Y3Qgc3BpX25vciAqbm9yLCBsb2ZmX3Qgb2ZzLCB1aW50NjRfdA0KPj4+PiBsZW4pDQo+Pj4+ICt7
DQo+Pj4+ICvCoMKgwqDCoCBpZiAob2ZzID09IDAgJiYgbGVuID09IG5vci0+cGFyYW1zLT5zaXpl
KQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBzcGlfbm9yX2dsb2JhbF9i
bG9ja191bmxvY2sobm9yKTsNCj4+Pg0KPj4+DQo+Pj4gU29tZSBibG9ja3MgbWlnaHQgbm90IGJl
IHVubG9ja2VkIGJlY2F1c2UgdGhleSBhcmUgcGVybWFuZW50bHkNCj4+PiBsb2NrZWQuIERvZXMg
aXQgbWFrZSBzZW5zZSB0byByZWFkIEJQTlYgb2YgdGhlIGNvbnRyb2wgcmVnaXN0ZXINCj4+PiBh
bmQgYWRkIGEgZGVidWcgbWVzc2FnZSBoZXJlPw0KPj4NCj4+IEl0IHdvdWxkLCB5ZXMuIElmIGFu
eSBibG9jayBpcyBwZXJtYW5lbnRseSBsb2NrZWQgaW4gdGhlIHVubG9ja19hbGwNCj4+IGNhc2Us
DQo+PiBJJ2xsIGp1c3QgcHJpbnQgYSBkYmcgbWVzc2FnZSBhbmQgcmV0dXJuIC1FSU5WQUwuIFNv
dW5kcyBnb29kPw0KPiANCj4gc3BpX25vcl9zcl91bmxvY2soKSwgYXRtZWxfYXQyNWZzX3VubG9j
aygpIGFuZCBhdG1lbF9nbG9iYWxfdW5wcm90ZWN0KCkNCj4gd2lsbCByZXR1cm4gLUVJTyBpbiBj
YXNlIHRoZSBTUiB3YXNuJ3Qgd3JpdGFibGUuDQoNCllvdSBtZWFuIGluIHRoZSBzcGlfbm9yX3dy
aXRlX3NyX2FuZF9jaGVjaygpIGNhbGxzLiAtRUlPIGlzIGZpbmUNCnRoZXJlIGlmIHdoYXQgd2Ug
d3JvdGUgaXMgZGlmZmVyZW50IHRoYW4gd2hhdCB3ZSByZWFkIGJhY2ssIGl0IHdvdWxkDQppbmRp
Y2F0ZSBhbiBJTyBlcnJvci4NCg0KR0JVTEsgY29tbWFuZCBjbGVhcnMgYWxsIHRoZSB3cml0ZS1w
cm90ZWN0aW9uIGJpdHMgaW4gdGhlIEJsb2NrDQpQcm90ZWN0aW9uIHJlZ2lzdGVyLCBleGNlcHQg
Zm9yIHRob3NlIGJpdHMgdGhhdCBoYXZlIGJlZW4gcGVybWFuZW50bHkNCmxvY2tlZCBkb3duLiBT
byBldmVuIGlmIHdlIGhhdmUgZmV3IGJsb2NrcyBwZXJtYW5lbnRseSBsb2NrZWQsIGkuZS4NCkNS
LkJQTlYgPT0gMSwgdGhlIEdCVUxLIGNhbiBjbGVhciB0aGUgcHJvdGVjdGlvbiBmb3IgdGhlIHJl
bWFpbmluZw0KYmxvY2tzLiBTbyBub3QgcmVhbGx5IGFuIElPIGVycm9yLCBidXQgcmF0aGVyIGFu
IC1FSU5WQUwsIGJlY2F1c2UNCnRoZSB1c2VyIGFza3MgdG8gdW5sb2NrIG1vcmUgdGhhbiB3ZSBj
YW4uDQoNCkNoZWVycywNCnRhDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
