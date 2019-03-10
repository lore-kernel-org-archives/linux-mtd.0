Return-Path: <SRS0=mTWN=RN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC484C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Mar 2019 09:59:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0EE4207E0
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Mar 2019 09:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ITUMajwY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="xwlTGCQu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0EE4207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZentJSydBhwWyPncTe0FJnDmfMAiFeOZxnykiWqnX4=; b=ITUMajwYHHcbAg
	chwaLDtoqYXKqKu2PKQlPxuBDDgD5/0xbU3OAX6ug2yxxjSzztmxW6bxDeWS64XtjtqN32LYhJhhH
	p+z26dJWMkkF6ldVPbjggfIA0cU9MnT0owVgPvAmb6Y8hgIXOaEf8eA0L2gQN0fOGpGTwtd85TUaG
	va/VpOoi/BIid8CHurKpWpdrY6aSTGoQdhF9z/l6/w5J20FoIZbTvvdKDs7nVZZMAYzqFhCGTl4NY
	Ou1GIknfWGPrVdR1v3VdRkGP/lA8cYhPam7gcYWXvHZiUrTVqF8qnV8KQytz1qfv6qVWapsNAAZK0
	/dy66j3Pp+dlvl7A9/vA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2vEc-0005mx-5S; Sun, 10 Mar 2019 09:59:10 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2vEV-0005mQ-OJ
 for linux-mtd@lists.infradead.org; Sun, 10 Mar 2019 09:59:05 +0000
X-IronPort-AV: E=Sophos;i="5.58,463,1544511600"; d="scan'208";a="27530358"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES128-SHA;
 10 Mar 2019 02:59:01 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Sun, 10 Mar 2019 02:59:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCopYkWbVtb2cKJQycEZfvXWnT7vlh4eCugyeRiCZ2I=;
 b=xwlTGCQu1OTJNuBZBevjkxFLjLUFU2MbcEf0r/apKVRAg7k1604Th+74cOSD9Owmo0hrR8e2OpIILJGLzPquNjSy37YtsJFV/eozILdaBNVGz+vooU7LJPnktEFet2Q3jYPCEnO+Ovc9kQwwzkBWSMg3sx67BiF3HAPj5eyH/TU=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1603.namprd11.prod.outlook.com (10.172.24.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.19; Sun, 10 Mar 2019 09:58:57 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1686.021; Sun, 10 Mar
 2019 09:58:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <jonas@norrbonn.se>, <linux-mtd@lists.infradead.org>,
 <James.Tomasetta@cypress.com>, <Yong.Qin@cypress.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Topic: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Index: AQHUuB8ZhXd2N1Mh6EWe4SXNj0Cyz6YE33oA
Date: Sun, 10 Mar 2019 09:58:56 +0000
Message-ID: <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
In-Reply-To: <20190129220705.5143-2-jonas@norrbonn.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::19) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.12.69.190]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86ecd13c-d8ba-4e62-72d2-08d6a53f02a7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1603; 
x-ms-traffictypediagnostic: BN6PR11MB1603:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIxNjAzOzIzOktmL1gzMjhzRTE1eC9sa0J3R2UyTEphSVlI?=
 =?utf-8?B?am8wRVJpclpyaTFyVTE1Nm50d2g2ZXhLc1Eza0JqRTFMTkVIdGZwbXZLYVF1?=
 =?utf-8?B?ay9QRnIwTW9uT1hFamMrMkYvL2lKSkNLWG40Zit0YW00SjR2RkRDM0xTTDQx?=
 =?utf-8?B?Vjg4bWtvWUZjek5YN0RXbmhPdm1Vc2VxT3B0aWZtTkVWazdKN2UvRFl2ZzIw?=
 =?utf-8?B?MDlYQ2JaSndGUEtsSmRNYkduVUw5cUphbm04cjhEZkZ6ZWhESUNsc1Y3NHJL?=
 =?utf-8?B?OUt3WFQzc0ExeXkvb1FZem5hemhSUTd3a1RLK1ZCbm9kWnc2cUVicUFUVnMv?=
 =?utf-8?B?eU1hdFhSTHlQbytFRTJ4cGIyY2MydFo5UTEydWFMR3JXYzRLRklKOVdTbm1y?=
 =?utf-8?B?b3kzdUdWb2hXTXZKcjM1MXY3VmhHVm0xclNXYlpNbE5KQ2VTUzZRQUVQc1Fj?=
 =?utf-8?B?MzVlQ2tDWTZRMlVOVjhGRkRyNlc4SDFHdzZhT1gvU25XSjJ0Sm92bTBVdWlq?=
 =?utf-8?B?MVlNQWVzaXZLbHNwa05XVzhSQU11S3dRYWtjZzkvQ1NGWGJqTHVsT2U0emdn?=
 =?utf-8?B?VTVOcFg1RVdIQWlWOXBCRlJpY1FMbWJIZ016bGRLSHF4c2krM3h3TDlLbFRB?=
 =?utf-8?B?SGRldkZCY1B0NzhlUm90empBN2RKa0ZVQnZoU1RKUWxhbmhsZVhvTDdYODk2?=
 =?utf-8?B?NTdqODFoNmZTSEI0cjZDeTN2UGRFQkJVV3BCYkI4UkU4Y25NQjNsL2NSOG1L?=
 =?utf-8?B?aDNNUXpwekE3TDNUVXVNTHBCejZMVTdydmRXWGpLR0NVSW9RaCt5QXduM256?=
 =?utf-8?B?Qzk4ZWwxelFmTTlEbTVhVUlpQmh0UGtiQjcrOUoxeXRjWU9JQ0lDd2hWek1z?=
 =?utf-8?B?Ykw1eHpPVmVYb1d1SURSemtGQ2NCR1dCZjBoUjNXUWZhbFFDZFRhOUFNaVRw?=
 =?utf-8?B?T0lrMS9IN2Q3anVkV2M0ZEVPRGxCSUQvajdHeExFeWRTZE8zcEdnZW5kVGRK?=
 =?utf-8?B?cng2Z2xQNkY5U1ZuNGtpc2RMQ0tURmNVZC9pY0RGemdRVlhzOWJtRDhPRUNR?=
 =?utf-8?B?b2ZFWXpNK2tvbzU1YUo2cE5ZSkZHdGdBcVF0NHhQYWFxRWlBd2FId2E5bHA0?=
 =?utf-8?B?RTFZQU5aM28xVzNHVi94bE1sS0JtVFFrd0tQQTlMeWN4QVBXL1Y5MHAwbzIw?=
 =?utf-8?B?QVF1SEF0UFJGM2F6dkhBRGRTQUN5M0MycmNSQkNKZjVnMCtna2s1di9lanJS?=
 =?utf-8?B?YlcrSkRFNldWV1hzYkhrU0gwMUd6VlhYNTdOTG16THppOTZlelo3Mng2THRv?=
 =?utf-8?B?VERjNWdtbXBWbDdKbFY1bVF1czlnWTF2dUo4aFk3S2crcmVqbEdQOTFvb3Q5?=
 =?utf-8?B?VGUxWnFaUEJsVjlaUHRKeXBBa2hyYm9jcXN6d05ndjAzd2hIVUhDZzdiRGhq?=
 =?utf-8?B?b0xnc2c5T0pxTGRaUDJZSWZ5TXV5cUZDeHpBRHVJeDZIZVBkd3R5YnBXNGtj?=
 =?utf-8?B?azdzTHpZMEE0MjhUbmtBNEwwT0ZQOTdEYlI3N2F3Ui9pdDJvTWd4UE04V2VB?=
 =?utf-8?B?VVlYbDA4Tmx3dnVZQjI5aWJYQW1OZlpwWUtnOFFodTdPVGNxczFmSXEvMU5E?=
 =?utf-8?B?dmloMXlqcTRWWUpubGFBaTgrRTdUR1ZWZHYxSXQ2WndyWjhldWszSFc0M24w?=
 =?utf-8?B?aFhBVWd1VVpGb1dIdEpuVHNPMjVsckNwVjhqQ3lXQVhpeVJQaXZxUG1tcW94?=
 =?utf-8?B?N1hwYXRTRGJpaVZrSWFvTlNaZ0xwdFV0TnF3YXRhZnpwSFVIU3BMY3FJdWNC?=
 =?utf-8?B?Q1F6dFBCQUg3N2ZjUDlad0daK1FzTkxyS3FOYkFqdkV0clpkVFRuQUptNDVF?=
 =?utf-8?Q?EuNM4ys6kGg=3D?=
x-microsoft-antispam-prvs: <BN6PR11MB160316EA5A5A4AF87F196568F04F0@BN6PR11MB1603.namprd11.prod.outlook.com>
x-forefront-prvs: 0972DEC1D9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39850400004)(136003)(396003)(346002)(376002)(366004)(199004)(189003)(102836004)(71446004)(72206003)(8936002)(5660300002)(229853002)(6486002)(68736007)(6512007)(71200400001)(81166006)(2501003)(53936002)(316002)(71190400001)(2906002)(54906003)(110136005)(478600001)(6246003)(186003)(53546011)(25786009)(106356001)(4326008)(486006)(99286004)(3846002)(105586002)(81156014)(31696002)(6506007)(36756003)(86362001)(7736002)(8676002)(6436002)(2616005)(256004)(52116002)(76176011)(6116002)(386003)(14444005)(305945005)(66066001)(31686004)(476003)(97736004)(446003)(26005)(2201001)(14454004)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1603;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +ov5FMgzOEi4oy541vAhPyaj4HZkWJm9Fnc8ZbYvf6mtbwuN/TwOmCPRDcdJMBlwfqPC/nMkfA4kF1Fq632vtTKG0Wdgs+tbSwYNUO0XtnDCMo4YfWDkd6hNiwu3JDgQpjEMIUV1UzXfci0I4IhEZbkEA0mh8gjH85sKxj9rQyQWgJZ97ZKzSaxsOZTL+SINIW1k7WtwdZkZw0U8hJ2yZ0idNNKq0jX7h3r1qAzAeWxy+NuLUq2u6p+UanOVaM9vt6m/Chc7x+Nyy0U8YeJ0OiXfTdm1mmonFYXdUNhKhDvT0Kdj9iYIS6ganpikKgho7nqfZQUz8HmiPWywbPSWvPIm5PbSZbGkP2tHLL//S7v6winhLGAJdNeO5VonfS11bH9kwwKTmnQPRoByQvSfR7i5F9JdQjKcl6iRO4O8nSg=
Content-ID: <D4643B0D64307E4CB84B048C5C0C8098@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ecd13c-d8ba-4e62-72d2-08d6a53f02a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2019 09:58:57.0318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1603
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_015903_871672_7CAFE707 
X-CRM114-Status: GOOD (  22.19  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, computersforpeace@gmail.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+ James and Yong from Cypress.

Hi, Jonas, James, Yong,

On 01/30/2019 12:07 AM, Jonas Bonn wrote:
> The status register bit SRWD (status register write disable) is
> described in many words in the datasheets but effectively boils down to:
> 
> i) if set, respect WP# when trying to change protection bits;
> ii) if unset, ignore WP# when trying to change protection bits
> 
> In short, the bit determines whether the WP# signal is honored or not.
> 
> It's difficult to imagine the use-case where the WP# is connected and
> asserted but the user doesn't want to respect its setting.  As such,
> this patch sets the SRWD bit unconditionally so that the WP# is _always_
> respected; hardware that doesn't care about WP# normally won't even have
> it connected.
> 

Always setting SRWD to 1, dismisses the need of a SRWD bit in the first place.
Do you know why Cypress made this bit configurable and didn't enable it by default?

Cheers,
ta

> Tested on a Cypress s25fl512s.  With this patch, the WP# is always
> respected, irregardless of whether any flash protection bits are set.
> 
> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> CC: Marek Vasut <marek.vasut@gmail.com>
> CC: David Woodhouse <dwmw2@infradead.org>
> CC: Brian Norris <computersforpeace@gmail.com>
> CC: Boris Brezillon <bbrezillon@kernel.org>
> CC: Richard Weinberger <richard@nod.at>
> CC: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 13a5055e5f3f..4c8ce2b90838 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1231,9 +1231,6 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  
>  	status_new = (status_old & ~mask & ~SR_TB) | val;
>  
> -	/* Disallow further writes if WP pin is asserted */
> -	status_new |= SR_SRWD;
> -
>  	if (!use_top)
>  		status_new |= SR_TB;
>  
> @@ -1313,10 +1310,6 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  
>  	status_new = (status_old & ~mask & ~SR_TB) | val;
>  
> -	/* Don't protect status register if we're fully unlocked */
> -	if (lock_len == 0)
> -		status_new &= ~SR_SRWD;
> -
>  	if (!use_top)
>  		status_new |= SR_TB;
>  
> @@ -3898,6 +3891,7 @@ static int spi_nor_setup(struct spi_nor *nor,
>  static int spi_nor_init(struct spi_nor *nor)
>  {
>  	int err;
> +	int sr;
>  
>  	/*
>  	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
> @@ -3933,7 +3927,14 @@ static int spi_nor_init(struct spi_nor *nor)
>  		set_4byte(nor, true);
>  	}
>  
> -	return 0;
> +	/* Always respect the WP# (write-protect) input */
> +	sr = read_sr(nor);
> +	if (sr < 0) {
> +		dev_err(nor->dev, "error while reading status register\n");
> +		return -EINVAL;
> +	}
> +	sr |= SR_SRWD;
> +	return write_sr_and_check(nor, sr, SR_SRWD);
>  }
>  
>  /* mtd resume handler */
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
