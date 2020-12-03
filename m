Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3EBC0018C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:47:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA626207B9
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA626207B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F2qo31uBi/WGqGo8jbaHIl3aHK8r6dOHUu9jYuzGsR8=; b=OvrDJavy0a5RImuhdY6pusBix
	6vS4WKvjteNuLALQ/gMNdPRrCi9TAi0L83IL7PoiC9pYBHrIJqH/wXRFi+gxuggdQwzmOuHg9xQem
	x6M12SQhceIYE1eLmb6MoVKRWQma6PrcV/+sHCq6/lUR/EKymu5xGU8ViHboot9Kn8Qrg83DU3EKP
	6ONptR/EsRtlQWmi7HykFw9VNykEC68M88frzgzU5SaYwRbfUlfT3jFGq+moU2VuHzkXN8OzY1McY
	XZPJxAr1JYTknlh/rRNAU5z8ooLYdvce0Z9rrTHGpzvYLiIiuh23EUp4LvOBiwf1e6W1gRkPa53Ba
	+w4CNH3Dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkpqu-0002nt-QD; Thu, 03 Dec 2020 14:45:01 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkpqr-0002m8-6p
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 14:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607006697; x=1638542697;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5y/KMrI+VfvdJWBH7hZNHOKUYiislY2Zxs3WvpyEsZ8=;
 b=Qo8baKvQFLFlDbYcjCtm6jzITJfqBwOf2JDf0cJ1VVWJYYUFXiGBBGZm
 TIigPAmn7ZmepunI23mG/zKl5FuVCq4eHBaOQqjuUA/gCD5tvTSt+xcO/
 60wVeHV1FBAXLcWJHsVqJQ6/dvynifqp224YHs49N77rHmDi4xj386N8u
 bJdXKrY55YR79UC71BSxjMtkdIXgDGNnye5k5DGIJKcMsi0rsU345Mj82
 jUov0KkdZsnrwuAdFL6CO+PxgOzNzvNT2SLRS1I0xN+nCRaR30XLe5S51
 Rlu27ph6hczaq9O2GG0z6CZf3bQiXZmJ/Z1w6jEgWxk/Jv1boK4uvwKbm A==;
IronPort-SDR: ncVMWUjUkOKUr+Y/L2lMtF7AX5s0onBKEnr5z2Cc5T61n2V2FgEsJmWeYiRMKwFM/S90MJIJAn
 XHfwiea5hALgzpeAlljTt6+C2YKIhFAMJJHb/OD9umD8w9kqgqxk61h6oagxMCNMzXgcgaIrfr
 Iv77WbrG052cToDmXYOeY4bONhwWiDxIPYziPX8qcoYAYxL4PrwZ/1AkTkGuAp+6YAPl2lI1gn
 j0Oum4EURq0Mpunf/iK0F9dbAvpBl1xCCZN47UM8We0dFR1SIZxbQPRDkPTGiSZHzclrHAoZfY
 6Qw=
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="100748696"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2020 07:44:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Dec 2020 07:44:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 3 Dec 2020 07:44:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nx3Y56+GdfLxERyvM4v3+IY4a0DpYspwfYp+5WvE2DWlwxp7hfbkvPujFrHB1DzqnJRe1yfNTwV1bZ8dYCrkBBTSMecwIyLzzYByIaEK/btkfJVwSv/xC0eGw01VnSWqos376rW3N9zVOgoPOvQM/74mxN+3GowQrw9Iuxuh9rJx+sw3xUhqc6E2vHWRDDrQmyxrZZW6AEUsClqUAPM6NLAEix4r+RiOvVjlpd1dDq8t/N8ozFC/5cpjuSLCIfmnwp60AL5Y5JG51dcKykeIIiGxR7IHXKS+5bdPjHJs6Ud1uELJbzR5jMvWsfumkJG7P4kGr22qqf4DZvZ8Ij+FEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y/KMrI+VfvdJWBH7hZNHOKUYiislY2Zxs3WvpyEsZ8=;
 b=IRqnrsPkzp6OmOkIvcBheNj9g294VRI86KKPF6mqDb5eDUU5FCM8No8gTbA8pdMJSNzUv15cFbq43wjf/zHXFnf8SrXG0gFya1iJseROarkdkN10KLB49r/igAGRClzEB6Cev6yQO5PDJ9CgfQ5L3kJPSvJC1DQTltW8Uyyj4Mm8ILEnvQipcC3P1o9XCiZhuvO+67hDdb/At9SB00BpTsNb4vXH/Ob2e97jPkWxU4SWQlcrVMz/SOTfvtmxsmATxN0/IPJmKu2rMx3pWiedxvx0aV6YWcs35/qCP4NcR4/C7+CIYCUZPj9OmoU65DZgyWkUgAvKfSMSsOFZfCY+AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y/KMrI+VfvdJWBH7hZNHOKUYiislY2Zxs3WvpyEsZ8=;
 b=iu4qutIlgsiNjy5kPJBkHWKC3kFNtYomLHQpKC0BJUiLrpdv3B5Vf0+9OfSbIRQChTZVOyjf6AK4znvRIhZyHkCjNdsWTolOKvo3ncns7B3p8GaLNPxi12VvaaA6NEZIqcJp5pfOct9hItMdlb/1ltcGc8fFNV3x+W8yJxGNFLc=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 3 Dec
 2020 14:44:54 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 14:44:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 6/7] mtd: spi-nor: atmel: fix unlock_all() for
 AT25FS010/040
Thread-Topic: [PATCH v7 6/7] mtd: spi-nor: atmel: fix unlock_all() for
 AT25FS010/040
Thread-Index: AQHWyYLcJsKk2P42uE+7Sa9dD7Nz7g==
Date: Thu, 3 Dec 2020 14:44:54 +0000
Message-ID: <9338f65d-ff5e-ade8-8beb-986445996da0@microchip.com>
References: <20201202230040.14009-1-michael@walle.cc>
 <20201202230040.14009-7-michael@walle.cc>
In-Reply-To: <20201202230040.14009-7-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10b7be81-9816-405e-8bff-08d89799ff91
x-ms-traffictypediagnostic: SA0PR11MB4687:
x-microsoft-antispam-prvs: <SA0PR11MB4687CA761C246B001F6FFCEAF0F20@SA0PR11MB4687.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dR+c4oBTcpBvTDXS/kQiPjt08yWzd/kw4HgNaCC8UzRzvKzcc/ZTlNdDG90Kq6CL3B2SDQrzZQQG4OURLXB6JhDRup8bLN76wPK8GQTTuc+mlrBVak7UV6TCBTe3+kmVD2I9BxavgZVEIqewLFnBQIjLpOJS9EpV0gLzRxWcodHup8KEhNOHV5GztklpJEYmt3EdqE+dU0y8jdPOotts2N/FaxCYVXEINIkqEjhJS8ZEj880Jzos1vjnTRMZV8tgQ0HiIoTfrZIBVze8qkNNlYjnOeKnDXYSrXXlerY8t3bW2VYWjcDUdNNETZ8cFylZV2VFnlWqnVJaxNumpxsqyzs34YIqntOlO9BP7Rsew4AsFcOYQy7hF2U4BdUKFwZnpCZWyly+Mt9YFVVcz5FbTBRxT9Ap0VeqUsq1GN1+lvg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(39860400002)(396003)(136003)(6512007)(26005)(31686004)(186003)(6506007)(5660300002)(478600001)(53546011)(83380400001)(71200400001)(86362001)(64756008)(8676002)(91956017)(36756003)(54906003)(6486002)(110136005)(76116006)(66556008)(66446008)(31696002)(2616005)(8936002)(4326008)(66946007)(2906002)(66476007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZXZBaGtmTHMwTzlzVnZvVU10ZTErM2c0UTlPTk1jL2lRSGc4ZFpqeVBKZ1hD?=
 =?utf-8?B?Rzg4dU5lQ0pxVjQ2UG41dER3TjA1TU9xY3hWeDRaTmxrWW9ESTdXMFN3ZWdy?=
 =?utf-8?B?bGxQOVhXSmJwOU9aanRzTjNUTnZQYUtxSjBCK0NNUlRlQy9tWE1OLzYxNmlv?=
 =?utf-8?B?NFRYNWNpZUk0dW1jbGpjcUcyVjk1UXpuMWxlRFNqQ3lkYUJPTHBlc1ZueGpv?=
 =?utf-8?B?bkZZME5xajVDZmRkQzRWMHNodmRMSDhaYklUUStSa1JmSml5WmRXVFNaZWFa?=
 =?utf-8?B?WnlmMjI2Zm1OQTVDRE5VMkdLbEQ1NVd2N0pIV1MyM2ZWMkNGZHpIMlY2UXBj?=
 =?utf-8?B?QnhnaUpVd01pY240anBOdGVENGdyc1E4Zjd2dzVDRVJ5VHlUQ0YyUm5IdmlW?=
 =?utf-8?B?QUVkMHQzU0dpWUVGVDZuUy9qREQyaVlPbkl6WmtML0NCeFFiRlVWdzBZTjha?=
 =?utf-8?B?RHJCc2hYanJhb1EvckFZYzBMMUVFemV4emJTMWd4cWhPM244eTJNQ2U3NGRs?=
 =?utf-8?B?RkRSdkwwU2syZFNHWmp6ZmRyT1I3SWMrMzZlRklNTG95azFlT0lESGpaRW85?=
 =?utf-8?B?VkJYYzByYkF3YlAzbGpaRWdYS2JSN0xaWUhucEh3ZGZaQlNDTWRHdlNlaUJW?=
 =?utf-8?B?czdHbEN2K1hwZXlKMlZvLzBUaWswd2F0TWFPcnpaZUlYbHVScGtzK1ozRjV4?=
 =?utf-8?B?VkV5UU52LzE2Q3RrSkJXcFdKOUJZV0pCMHNPNW9HK1VRbklwQ3hwRlpvVzVw?=
 =?utf-8?B?RytKUXo4Skhwcy9hZnpDdC9rcHhBSVBEdHJmMjlQVlJJVC92bC81VHdZZ3Ri?=
 =?utf-8?B?eWphRWdFZ3VScU15L2tma0VoaW5SR1o5dGRnRFRxMG8wNUlpOG5vZ1VhSElr?=
 =?utf-8?B?Wjh2dmwwU0x2VmFCMUlEVEpSNjF1WkRFUnRTSHJLeTFNVjFUY2RHNnVtMWtL?=
 =?utf-8?B?TktWeVI2RGd0MFBhajRFRG9Vd1FQZTRiZTJwRmNRNi9GRDd2RFlvRGVxY0h0?=
 =?utf-8?B?aVliZGVlUTB5SFYrNnlJalRtTloyY3hRcjRZZGpJR0Njb3B4ZXFQQkFzNEJT?=
 =?utf-8?B?Rmp5V1QrcElPRko2alZQMkpmVXdQU3BuQmREMDlPS3QrWml1aFR6QWtHSDhY?=
 =?utf-8?B?ZTNXYUlhR0pVNHZmdVhwQW9BaWN5QmxkTjdOeHd4ZjhsWFoxc0RSYXhmT2M2?=
 =?utf-8?B?bkFIWTZaWFN0SlpjSGI5N21xaWJTZ0NHRjhaR1dRcHoxNE53WU5qSnF1SzJh?=
 =?utf-8?B?WG5xOGd3VjBrQ1VVTnB6aDM4VFYyUHgxdzhXRHI4MHBGSktjSWl4K25hVHBq?=
 =?utf-8?Q?4XvpH24m0yvqQ=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <F7B741E404F82641AAC0DE3732DD8EEB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b7be81-9816-405e-8bff-08d89799ff91
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 14:44:54.5249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OTF2X+b8ccdU+/xUZvzTHT/mz3xR4iUIxqsPgN55WY2I9cW6bKIF4KG7Crdeq+vin1haiFYHJKUMkkQJKqP6+xqqVsBu+9ldyxvX9l3SRt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_094457_502077_3EF66D8D 
X-CRM114-Status: GOOD (  27.73  )
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

On 12/3/20 1:00 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> These flashes have some weird BP bits mapping which aren't supported in
> the current locking code. Just add a simple unlock op to unprotect the
> entire flash array which is needed for legacy behavior.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

With fixes tag added, one can add:
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> changes since v6:
>  - use spi_nor_write_sr_and_check() and log a debug message if writing
>    fails
> 
> changes since v5:
>  - new patch
> 
>  drivers/mtd/spi-nor/atmel.c | 53 +++++++++++++++++++++++++++++++++++--
>  drivers/mtd/spi-nor/core.c  |  2 +-
>  drivers/mtd/spi-nor/core.h  |  1 +
>  3 files changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 49d392c6c8bc..ee382a44bd0f 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -8,10 +8,59 @@
> 
>  #include "core.h"
> 
> +/*
> + * The Atmel AT25FS010/AT25FS040 parts have some weird configuration for the
> + * block protection bits. We don't support them. But legacy behavior in linux
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
> +       int ret;
> +
> +       /* We only support unlocking the whole flash array */
> +       if (ofs || len != nor->params->size)
> +               return -EINVAL;
> +
> +       /* Write 0x00 to the status register to disable write protection */
> +       ret = spi_nor_write_sr_and_check(nor, 0);
> +       if (ret)
> +               dev_dbg(nor->dev, "unable to clear BP bits, WP# asserted?\n");
> +
> +       return ret;
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
> index 013198abe929..6afcb99e9741 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1049,7 +1049,7 @@ static int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
> +int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
>  {
>         if (nor->flags & SNOR_F_HAS_16BIT_SR)
>                 return spi_nor_write_16bit_sr_and_check(nor, sr1);
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 0a775a7b5606..7780169d485b 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -430,6 +430,7 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor);
>  int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
> +int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
> 
>  int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
>  ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
