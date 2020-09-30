Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D739C47420
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 14:00:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911F72072E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 14:00:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SlU4sVWA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="h9q2iVoA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="GE3i/W1i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911F72072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gWoQVRc9X0szZvGXrHYOOXnUXgjlZ7YeMqAXlquPtcA=; b=SlU4sVWAbheycvt++ZuPx6VpL
	9WAXfUsPDNCglPdOi0m4NWleXzs7S94HmzWzH6BzWX2HgXl08Zjhj2oJa46exMKEqLpmEjeITuMaV
	uMjNLRFONe71Mbt3GsBLrmU5kKMjCIDYN3reEvnvXc+rDDSrqo7w0f8eBQL6l3qPOS3aIuNZ1ZsU+
	DCxE4oE/TZHIuZr7OAxEt4ArI5aJMtnK4/l04s9txQKYrwxqVIVpxWSIszjc47T65pmh14UWDC43I
	BBDE7uxOHW/MSB5LIf44DG1FIrk03B4yRMm7rm4LEdxkh3UHcZ8i/tmsEePQJVATsgOdRqzIhCNap
	bYqMDmCOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNceZ-0001J2-8o; Wed, 30 Sep 2020 14:00:19 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNceW-0001H4-DI
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 14:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601474416; x=1633010416;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=w8IUo3ZMtqczMcCy7KpgXL3ZdJqyyK6UKI6WtcFytjc=;
 b=h9q2iVoAIkvvTGBrnUkW5D/CFykY/RiauSX1DVWKoc0uujMq+Z5VMB7m
 neiQJ8c3DI5O7J7l/OhMG7so4YTGONyY3X4a7KgrQFhghl7Iv1swR9Uem
 ZaGO1xaOiliSzDHIIKRFLSaeejlmHdTNnhbE6wOu/Qo1d2WRYk+vQLTYq
 sB/Fitavwv3laM5vJLCgI5OP8gGSe5E86nV9E9+xKaxPJ7K3vL5UT+Pw0
 36OgVeTqgTrkLoNszAnxaX2p+vt9iv+fcOfmMJf6tR6VUQAsTFNdeQNVh
 HV4RXLXBtjEnpI1J8Wz0P8pkwT+oHWeWHL6/sZJgeQl8JIed5ze+d3dnz w==;
IronPort-SDR: PC/crVOLn4I9eauB9+HN/XMXgmbrzeXJgNjNzK8IxsE0OAZXXibTCGLYO83lzcQQI0rg1Ea+bV
 InjZZ5Kma4dCuIjN8J52Nh6ON39JCzmTHqmU8P/8ExNrXiteiAcY3Evq6UjJwDLagHrypdCqlI
 06dDBm6Anjh074wMYuUL9JIvv9sZ3JOTEA3wRXXtrsHWVn0HIbrhgzx8T1tf8f1ZgpxFXA8/GY
 G1Rt8XhLgkxURy08KQ3eR9kE4PPqvHXuPgLieng+O8pgUQNFIHIL2kdoIrq2GxER1HdEDax5M8
 XWQ=
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="90946062"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Sep 2020 07:00:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 30 Sep 2020 07:00:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 30 Sep 2020 07:00:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noLRV6WBJaYAwLVQOyeLH+GGtYfqie/lio5EXeRuKa6noRR35fIp7WhcQeQu/AE0cK1tpBuHJW/qevzU1bZ4LVtzQOmno1ObtXcgxQVSW7qElbmZVRcoU+JoLYqlXs7Tpy78s2bTL6qf4avWL2OfH45v4NW13G3ioCiVddyu/AN/INAKlcGeTOm4SvI9Ona9m6vsRDk6l+9UWZuz0R3US50jTqH1x+17IYm6mO9+E4aztvZck+gtgRQFa4k8ICn15VVJ344ZIamMWZg572uvfLkf+VKhrTFPgVjQqF2vE+o9vVCXNIJhfbaAtpBDjDR+mUWWAcwg7uacQ745oZxPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8IUo3ZMtqczMcCy7KpgXL3ZdJqyyK6UKI6WtcFytjc=;
 b=lpg1K6DWMJuw+FpxuJWKXW+ocaCFKvuoIXQpujWpkF3vB16MaboMhJcg6PRfkwJgrd/1grYKYa+nRbw+mUv9ChyWaocEVMaRaYP65D51uKc3nN8iCZcsbwitTAmFCcrO5kYUnA2wR3lrb8ehnz/bvNFLUIHsjP9I9KGINanL3Za5SRIP1dD2n+E6+WDrsaiCJUX5bHklBzOUaRjmpKipXX5o2uQ4NBb8O4MJzc7u2VVr7cLtqMrM1rHeEELo8PWwLbl+//36+F1BYKL3tUQP7Qd9VkuC1/2Xo3lHAZidMY92JcRGmIRUpHuk1SOmhyfZDjPZ8w0uSIBshgKKv9JLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8IUo3ZMtqczMcCy7KpgXL3ZdJqyyK6UKI6WtcFytjc=;
 b=GE3i/W1iFC8dACGbaK0RAkNJhE84WLLIAq9iKlk46PqP1quKegd6Q7m6WzBWDa1zbOjdk9ZKFRBVpSWMt0XbdUPigjpyJJtQfM9/h5tp6njwjSNjPfFhxa53+ShapBVwm4DlphGemb70LU/SM4zFIPRnqgMjWoXmK6yYd/Oq1zA=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (10.175.91.12) by
 DM5PR11MB1418.namprd11.prod.outlook.com (10.168.102.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Wed, 30 Sep 2020 14:00:11 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 14:00:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] mtd: spi-nor: keep lock bits if they are non-volatile
Thread-Topic: [PATCH v3] mtd: spi-nor: keep lock bits if they are non-volatile
Thread-Index: AQHWlzICH6PibhncD0qfQu8hdLJMbA==
Date: Wed, 30 Sep 2020 14:00:11 +0000
Message-ID: <e56c5f60-2f59-f913-6eea-3bf8dd4c0774@microchip.com>
References: <20200327155939.13153-1-michael@walle.cc>
In-Reply-To: <20200327155939.13153-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.187]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18f7587b-a26e-4d7b-0f98-08d8654925cc
x-ms-traffictypediagnostic: DM5PR11MB1418:
x-microsoft-antispam-prvs: <DM5PR11MB1418D14AB255BBF090CB081FF0330@DM5PR11MB1418.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 987S8sDTvT8tY+iONOq0OdZnU3LdQF7Fk61ZNp7RJeOUXsNMeKarcwBwUCLRDdQ+b3a0IMWnUTPwtOB9IdoP04pWqq6b8XlYwz2C+vXae+vn238FGJv+/7OaK15xZlrvqvi1CibKPboPNIoDBTDz+61SBM0l8I/zGdIeCs8V4wnNpslw9EZTysIYbDgh+CCE7hq8Cyu1JcBm+e1k4F51COMPqUKAOmc2prFizWhVXAo6g/6ggeGfp1xhxk3eda3tYh27ri7PAdv1CJLuOmWkfhvzAxnXx9UOWtIDqda0pKL8sUq7jl6FEYvbz9H4K7hZZ/qujgMRaqG5j3BrT+5lmN8/v4Sm/2U46hx/Z1hokc1Xv+zZS/kgTDVoI+gywiis
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(376002)(39860400002)(366004)(4326008)(53546011)(6506007)(6486002)(186003)(8936002)(26005)(36756003)(6512007)(8676002)(31696002)(86362001)(66946007)(91956017)(64756008)(66446008)(66556008)(66476007)(478600001)(76116006)(5660300002)(71200400001)(2616005)(54906003)(110136005)(316002)(2906002)(83380400001)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RRPN7b6SEFnH7h4FYoBIaBM1Drm9BAELaclxLCIwRFVjAYG7RcNJRiG9MKpW5IFJk474U7GgAYVnDW4A0uzWWQG22e58lVN+tS6ia+FvLt4auocKKponhi3iNqBD5IQ339AhI+6kVliGfjH/pfYi4cPHopMqGSFdlO9glFaEMmuKZMm7JTG0rrVQbZhdjbI1ibVWFApY/syUgvo+iKmr+1ClCBKZV+XvKn/paCHrJX7iB/jb9Ca7qrJXt6dA4aVGNhb0pmeQrKXRlq3xoTvKzmMRmhCwTgzsDwI3Dwl0Dxk1H0cP3CAyOcMrEKXmfotAI2DKHjhTlfwpDjBgFNpncdTGd7qIruQuq+Aoc0ACCvYkWGYPDT3uLUPIYn3gUeS8qR5UQHLqIyVfuH8pL0EAb694mWPw/amgQgoi98pQ4QqfvHLikk0Z+w74GOhmcXzAAoXcPSCWkXm6JjMmeEgoxt37QohlfrP/pUPvgj6GsXJlDcHhCrdeINHjR0t30tIC/7yUeUMvx+gKDwQtNP5CIYOOF0ppvz6EyhOoxRvW0riOdmMoK2HhC8YFBSb8MqSlJ87riQaib3YZkl6AMeC3sH6ym+Fw61JWj4y3WDqavZjEBynmc8AA08KCqCrooP7YpNNgqSs0ruH8JLw6QqQ9hQ==
x-ms-exchange-transport-forked: True
Content-ID: <F3B4314CE1C2E64188B7E3BC84C35BF4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f7587b-a26e-4d7b-0f98-08d8654925cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 14:00:11.1614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8qMXv6Tlwo2w6eZS2IcScLBnpAhBEgah5ACLTyxb6xwENEXJQK6Yr+xc0z6K4XJ1GJuuZeN/jknxixFo6ESW+k2Obg5sZN92SQ6lA3yEfcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1418
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_100016_611493_685C8D5A 
X-CRM114-Status: GOOD (  23.53  )
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

Hi, Michael,

PLease accept my apologies for the long delay.

I do agree with Vignesh's comments. Few others below.

On 3/27/20 5:59 PM, Michael Walle wrote:

[cut]

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index cc68ea84318e..fd1c36d70a13 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2916,20 +2916,38 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
>  }
>  
>  /**
> - * spi_nor_unlock_all() - Unlocks the entire flash memory array.
> + * spi_nor_global_unprotect() - Perform a global unprotect of the memory area.
>   * @nor:	pointer to a 'struct spi_nor'.
>   *
>   * Some SPI NOR flashes are write protected by default after a power-on reset
>   * cycle, in order to avoid inadvertent writes during power-up. Backward
>   * compatibility imposes to unlock the entire flash memory array at power-up
> - * by default.
> + * by default. Do it only for flashes where the block protection bits
> + * are volatile, this is indicated by SNOR_F_NEED_UNPROTECT.
> + *
> + * We cannot use spi_nor_unlock(nor->params.size) here because there are
> + * legacy devices (eg. AT25DF041A) which need a "global unprotect" command.
> + * This is done by writing 0b0x0000xx to the status register. This will also
> + * work for all other flashes which have these bits mapped to BP0 to BP3.
> + * The top most bit is ususally some kind of lock bit for the block
> + * protection bits.
>   */
> -static int spi_nor_unlock_all(struct spi_nor *nor)
> +static int spi_nor_global_unprotect(struct spi_nor *nor)
>  {
> -	if (nor->flags & SNOR_F_HAS_LOCK)
> -		return spi_nor_unlock(&nor->mtd, 0, nor->params->size);
> +	int ret;
>  
> -	return 0;
> +	dev_dbg(nor->dev, "unprotecting entire flash\n");
> +	ret = spi_nor_read_sr(nor, nor->bouncebuf);
> +	if (ret)
> +		return ret;
> +
> +	nor->bouncebuf[0] &= ~SR_GLOBAL_UNPROTECT_MASK;
> +
> +	/*
> +	 * Don't use spi_nor_write_sr1_and_check() because writing the status
> +	 * register might fail if the flash is hardware write protected.
> +	 */
> +	return spi_nor_write_sr(nor, nor->bouncebuf, 1);
>  }

This won't work for all the flashes. You use a GENMASK(5, 2) to clear
the Status Register even for BP0-2 flashes and you end up clearing BIT(5)
which can lead to side effects.

We should instead introduce a nor->params->locking_ops->global_unlock() hook
for the flashes that have special opcodes that unlock all the flash blocks,
or for the flashes that deviate from the "clear just your BP bits" rule.

you can keep the call to spi_nor_unlock(&nor->mtd, 0, nor->params->size);
and in spi_nor_unlock() do:

if (len == nor->params->size && nor->params->locking_ops->global_unlock)
	ret = nor->params->locking_ops->global_unlock(nor)
else
	ret = nor->params->locking_ops->unlock(nor, ofs, len);

Cheers,
ta
	
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
