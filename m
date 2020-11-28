Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8669C63697
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 08:26:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B5D222280
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 08:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GIU7pTX3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="G05X1K68";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ZYtaHiKr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B5D222280
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7kpzf0DCH5ICFA0k0OHYWG1FcSKlT9LOTdk0tIokqAY=; b=GIU7pTX3vCAuYj+0X+nykpxik
	u9JuB8/L6C1e251IpAATNte9cxZLyl/IX/NQyL1xeSrrEvAGimSU/+dq0oMh9HLQaoBokdkkOxL7j
	BXV2FOs1l/0swK8Vc3qgvSEl31jIFAdR/ulHQpvlWi4ZuMqd2cPH1UdGRipazMzxM8fP+E2FfqnOn
	Jm2GK47Nz4l/4XDoBlPd/OV+F78X6VGWbZ5EmhHyQDj9OTLqQeLH511GJL2ZGQVIbzwBuc/s5POw1
	NGMQEuK8xA+6ngCu5ylN4izjSnDTRjsRQwfgpR8/VzaCGI7fpOKkrqNrEX38Nv4lQVYcKpB0mTpcw
	2eFpiePkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kivXt-0000Pt-Fy; Sat, 28 Nov 2020 08:25:29 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kivXf-0000PS-Gf
 for linux-mtd@lists.infradead.org; Sat, 28 Nov 2020 08:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606551915; x=1638087915;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ouP5a/uKnJmStFA7LiZNPy4eyH92/FCjeybl10hw7UY=;
 b=G05X1K6822hYySGEwUVEkdspPxrJ1tp/1R9Dg1zKqKpDOxLuw55YBXUf
 U7omANz/NSJ5fCQ4WWKisp3rZDIP6sD8ObYT//wnywquvW1Suul/Ud9xt
 VtuybLZaOp5vBESkkX0uzaF9+SJlGctKEr2Z9Ck32jjZyNAViHl/s2Djf
 6X4suEi47Id45q20clUmGC6+4NJ86t4DJkybmoi1VDoto8/VzFkp2ZE84
 k/4Kmz5EmoII0FZf27OEXFmLhOHj0aH/tXq7PrBpXajZ3tjBUGI6GyCIF
 K5qswB0q95bzPgkK6WTm/gHhBpAXgrtsOfnZOtYYcncCkvsUkhrET9kSi w==;
IronPort-SDR: 2PF6SrU0jnZc7EpGiV8OytWGIzzE8c25EbzKlJpyh0wDrWbNrtWz9tua5HoupOFcIJb1FfsHTz
 1iNsHBNarpCkkGC6MGKIlue/gpTB7+y14zHeNhkMLLcSD2nB0kkEORVM2dmMv7euDSVUID9/bz
 nSlDtu2sSn0CiiyL/+ERRs5cYgsulic7k9m81752Dz/AOvzd2arQF2SyOkUC+H9cLCc3galDbo
 +SbgJpzuIa0Vlwqcm1trG9z7Yhem9qJnKivSpLgglWB4b6H0KC7oYyxF/TkqxIzyj/OgUhp5Is
 l+s=
X-IronPort-AV: E=Sophos;i="5.78,377,1599548400"; d="scan'208";a="97847516"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Nov 2020 01:25:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 28 Nov 2020 01:25:12 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sat, 28 Nov 2020 01:25:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyTWWnNJGfdwfyECKZaN1W94uor2JO4qwHskHfKm8y/LxmSJ5A2FjUemEbCGYTreVvSXZghimr8ICfdTVep0nUKovjXwUAWqMknLH8tQd+FioFid0vVUWAM2m0swKVZI166gLYt7Rk93UjDz+XMSiN16Dk8zunpEfRw6HQbIHn7KPC9EwZfwp2Q6GvKA2t/RIb89LH08UWPKMz3EWGugWfdKNwUkcTwMGVnF8YxCAaZ4N1UQii/PP+nVaYYbpPX2jxXZr3mgnHwUZsZLk/wQahF829iNKo8DSekDQwkDjS7oT92KK4xl+aaG/DzZtsX0/ZWCFXSYdpW0W7Wq7vqfzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouP5a/uKnJmStFA7LiZNPy4eyH92/FCjeybl10hw7UY=;
 b=efOZ5mjSbx+Ce07DmDu7YX+5zKReUGoy17ghiukoHzyG1702aidjvG0LFZ01/yBUrW+zPSTyXxpyYxR5TxrUtgaJnBwcKdvzUBleWbUjq2V25R7z0FTxNOZFLfh1MZ/A4wTOb8TPQ/WaTYjDZu2gIIEDHYpeXURRr5+sNcgrhWlwMo1fg3ir3KF49dhUt8f6Z8Yhb8w89uJpuqKuXc41g7oMlHbJ+PnvXr8cPIc9d/KPMzrMMHU8RXO7pqqro4IVdgZUQWXZmAj+GxFYYo4wVpYkL+kDDxuhrw95D5osmpg7R0xBmvtskr+dtoqRWnhjQ5vM7+aajxVSyOts/Ay+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouP5a/uKnJmStFA7LiZNPy4eyH92/FCjeybl10hw7UY=;
 b=ZYtaHiKrD6i4WMVqyFEOzVWW5MTVOg4k3Rc0qB5O96i6nVfI8PIfAA1WkYVuzaBKc6dPQkO02QxE3uTazVTogxCnIuBhY1SZKqSf2RJkz19DfVZ3J9qxhBeS2ksfhfFcx8Szl8lHGHw3s+mJJfFG6ikLAiX68uccfMUrlhrngT4=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5116.namprd11.prod.outlook.com (2603:10b6:806:fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Sat, 28 Nov
 2020 08:25:09 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3611.021; Sat, 28 Nov 2020
 08:25:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 4/5] mtd: spi-nor: atmel: Fix unlock_all() for
 AT25FS010/040
Thread-Topic: [PATCH v6 4/5] mtd: spi-nor: atmel: Fix unlock_all() for
 AT25FS010/040
Thread-Index: AQHWxV/7Y2BwcnWnOEKyWKfbGcieMg==
Date: Sat, 28 Nov 2020 08:25:09 +0000
Message-ID: <ba9850c1-a684-6376-7331-2e09567dcb73@microchip.com>
References: <20201126202614.5710-1-michael@walle.cc>
 <20201126202614.5710-5-michael@walle.cc>
In-Reply-To: <20201126202614.5710-5-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b33661d6-92a2-45ac-6879-08d893771ea0
x-ms-traffictypediagnostic: SA2PR11MB5116:
x-microsoft-antispam-prvs: <SA2PR11MB51163801FD6E12D7B814B9F9F0F70@SA2PR11MB5116.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XBixhVs7Ie54+uBGGxMahrPDoazwOUKaQjYSizwZSnGE9Rw7tVA6lWlN134AlHxDBH1O3Nemasv77M12BNm2wRE1TtSzKQ8RXgSE1gFWNgL/HM1PWNKa4M9++/E5PnHjPsg7iHLLB6SG+ElzML5m+TKFLNcAsJ/zumVuFuO8ZaEEMdePMAPuAJrptkkQJMQvHKHYJSPjyE0JCga/i5dTn59t4YSzVb4lYY0fBzxHmWpVpUfIPdRAvz7IOZbM6VjyJkFKsflhH8uou5bxiTfvY1iPbMW6i3dZhNYfmM/r4pziykG4nAm51RPxNZEDleMb1k4RSLRKXGxMJQF9cNVPhM1WbcF1l9hhycrRr45Ad9un3XedjQ38dsikMb0ZSlrf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(366004)(39860400002)(136003)(26005)(86362001)(316002)(66946007)(53546011)(6486002)(8676002)(83380400001)(6506007)(36756003)(71200400001)(31686004)(76116006)(8936002)(5660300002)(54906003)(2906002)(110136005)(478600001)(31696002)(2616005)(6512007)(66556008)(66476007)(64756008)(186003)(4326008)(66446008)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OVdqdVM5OVNKSEhsR3VrOWRwU3RZQ2hxRHFhZFppWUxGNXY4Q1FTOTFTUG1V?=
 =?utf-8?B?bkJoeU9OZ0NBME52aC9PK1lJa1BYNVhLV1dnQWJlMzVVSEhNVzlINVRpbDlS?=
 =?utf-8?B?K2lwVVAvR0ZkZFplYUdyTzZnbEtRUUNHMWhPN04wR1RXV3dJaXpXRzdDMVVX?=
 =?utf-8?B?YmxRZmN4WjVHcHRWNzNMZ1hiQ29adE42RDFXNkpoaFMyNmhjVHlwWFE5dE1m?=
 =?utf-8?B?MEs5dWtnT3Urb2RFbEdrd2pxVG5EQzhISTdEU1JtcmlQUHFtTWxjYVZzcHA1?=
 =?utf-8?B?cFUvRlVmM3VQZWIzdmxxaTd5eDBHeGM3OTExMnBqcVYxOVE0Mm1LejN4ZDV1?=
 =?utf-8?B?QXI4SFJNb1pWK3MxSnRvZDVTbXpsbi9oQXpjSWZLbXlOQTJ5RFI2WmJCS0lV?=
 =?utf-8?B?TzgyYnJpbmlHTGptT1U4SUZLbFY0NEIvemtzVWpzQlBjNjhoV3VoMG9nZ3ps?=
 =?utf-8?B?QkNtUFQ3eHpDS1M4V2ZLWE0vYjMxRVRLMUZqejM1OE5IZHlMVFhGVXRpcVEv?=
 =?utf-8?B?T3dQZFltT0RTRld6S1E2Q1NreDBVSTUxQkN4bzVuRFZzY0g3eDJnRWNxWFdt?=
 =?utf-8?B?Ly9QSklXYU9tcTZ2NndBUzYybWNYL3hEdFY2bnRwOVQ5UEs5MDJVTzR1WC9n?=
 =?utf-8?B?QUE5ZC9qUjB0Y0swSXNxZ2JLWnlzeGpLV2hrUzVmM01KMFp0ckxwNHhjOTFz?=
 =?utf-8?B?T2xQbU9SYUovSElHeWZSQ3pCdVc4amhvZVc0TUFDZDMvL1ZIQ0FmSkVqNDAr?=
 =?utf-8?B?T2gxakYxa0t5dlM0Z0hpS2JxQk5wM2lSQWlPb3pRQzYwYlFCNGxLZWJRMEMy?=
 =?utf-8?B?U1UvVWdQd25RQWZWTWoyZXJuWW5zM3dkQS9iTTBvZ3BIUi9pVUtQT1Iwd2Nw?=
 =?utf-8?B?ZHZUajU2c1ZiSzgwR3hhelVMeC9vNm1mdEl0L0xVRmk1SEZteUdEUzkrTEhC?=
 =?utf-8?B?VGcrdDc3cjNqT09oSW5pWEVOZzVPZUFGNUxKeVJHYlk4V0p5a3RxYTV3RXVu?=
 =?utf-8?B?c3hvcEJSYXZ0SFVHTXdFUStZaVl3MFpJQUx5NFRKR3Z6aUhjNDUvTE8wRDJs?=
 =?utf-8?B?VGYrbHExVlVnSEJsWnk3dzRpcW9QSU1uNm9kdE5GSXpFVkNhdWpZYjYxMEd1?=
 =?utf-8?B?Wk9YUTlaUlVuMGczZURvVnlPZXI2UVYxeFAxSW5PZjdVU2UxU2NUZFdaUlhU?=
 =?utf-8?B?NjIwZG5ucDRyM3YvSWFIUWNTOG9DT2REZk9udDNTZ0drd1pnaXVZVjJ3WFdm?=
 =?utf-8?B?LzlzT0d4bnNybU1tWUtXV0ZiVVJiL1ZZN0U0clhscytxMTlOb0ZKMDlzalJE?=
 =?utf-8?Q?HeTmXHS/ohPak=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <E882EB300FF8DE498957431E33005E4C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b33661d6-92a2-45ac-6879-08d893771ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2020 08:25:09.6339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gtm/DD0yfGzeBSCpz6TE/4g24ls7it3Q7iSAJQde2x33cVqmr5i51bz0sNGlhbKEbK78tDjdmBDQ2EhNptCm/8XWWXTuBGG+Mm7a0wsGR34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_032516_050373_89C09059 
X-CRM114-Status: GOOD (  29.49  )
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
Cc: richard@nod.at, boris.brezillon@collabora.com, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/26/20 10:26 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> These flashes have some weird BP bits mapping which aren't supported in
> the current locking code. Just add a simple unlock op to unprotect the
> entire flash array which is needed for legacy behavior.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v5
>  - new patch
> 
>  drivers/mtd/spi-nor/atmel.c | 53 +++++++++++++++++++++++++++++++++++--
>  drivers/mtd/spi-nor/core.c  |  2 +-
>  drivers/mtd/spi-nor/core.h  |  1 +
>  3 files changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 49d392c6c8bc..fe6a4653823d 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -8,10 +8,59 @@
> 
>  #include "core.h"
> 
> +/*
> + * The Atmel AT25FS010/AT25FS040 parts have some weird configuration for the
> + * block protection bits. We don't support them. But legacy behaviour in linux
> + * is to unlock the whole flash array on startup. Therefore, we have to support
> + * exactly this operation.
> + */
> +static int atmel_at25fs_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static int atmel_at25fs_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +       /* We only support unlocking the whole flash array */
> +       if (ofs || len != nor->params->size)
> +               return -EINVAL;
> +
> +       /*
> +        * Write 0x00 to the status register to try to disable the write
> +        * protection. This will fail if SRWD (the datasheet calls it WPEN) is
> +        * set. But there is nothing we can do.
> +        */

can't we do the same as you did in 5/5?
+       ret = spi_nor_read_sr(nor, nor->bouncebuf);
+       if (ret)
+               return ret;
+
+       sr = nor->bouncebuf[0];
+
+       if (sr & SR_SRWD) {
+               sr &= ~SR_SRWD;
+               ret = spi_nor_write_sr_and_check(nor, sr);
+               if (ret)
+                       return ret;
+       }

If SRWD is set to 1, we first try to set it to 0. If WP# is asserted, we
will catch this in spi_nor_write_sr_and_check()

> +       nor->bouncebuf[0] = 0;
> +
> +       return spi_nor_write_sr(nor, nor->bouncebuf, 1);

and then you can use spi_nor_write_sr_and_check here

> +}
> +
> +static int atmel_at25fs_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static const struct spi_nor_locking_ops atmel_at25fs_locking_ops = {
> +       .lock = atmel_at25fs_lock,
> +       .unlock = atmel_at25fs_unlock,
> +       .is_locked = atmel_at25fs_is_locked,
> +};
> +
> +static void atmel_at25fs_default_init(struct spi_nor *nor)
> +{
> +       nor->params->locking_ops = &atmel_at25fs_locking_ops;
> +}
> +
> +static const struct spi_nor_fixups atmel_at25fs_fixups = {
> +       .default_init = atmel_at25fs_default_init,
> +};
> +
>  static const struct flash_info atmel_parts[] = {
>         /* Atmel -- some are (confusingly) marketed as "DataFlash" */
> -       { "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK)
> +               .fixups = &atmel_at25fs_fixups },
> +       { "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK)
> +               .fixups = &atmel_at25fs_fixups },
> 
>         { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
>         { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5bee7c8da4dc..8c06a28a90de 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -861,7 +861,7 @@ int spi_nor_wait_till_ready(struct spi_nor *nor)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
> +int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
>  {
>         int ret;
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 0a775a7b5606..16b350e1d865 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -430,6 +430,7 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor);
>  int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
> +int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
> 
>  int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
>  ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
