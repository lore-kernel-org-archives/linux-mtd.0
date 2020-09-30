Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C23C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:11:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DF962075F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xVvsnTFp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dyRrYKxk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="tN+g3AEY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DF962075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LPIpXUhwTd4srv4EC/LmrTCls0GFPQiQmhPmsPdab1E=; b=xVvsnTFp1AZcfoclYqvOIL6RH
	vyBcxwSvqlL0EOJdIHDvtBbzQcrz09LK1ilncYQrif/BPwIO7NGuh/49ObSmO38iP1dWZKyl00cJM
	OyTbHebdFBhBlGfmnEpbMrA9NqerdUrpx9YwHFO7Nie0RHHToLFT/iRpFypqlA0IsMIhL21MX8hWq
	1jl7tymRPW4HjQGVt9vBHk3V7wcsI3HR7nBVsxl8j7FfFx3Q4eoNX5+JPPAw5Twt0O3k/odlI6FAz
	SBJu2u6bW1dSJQZjU7dTZ4YCyvjCrcFSFaL5aPi8w5J1dhxBTMqtUwK9hODnbOdd23a/U9CcZVuf7
	cth0rpzQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWGr-0007tt-PL; Wed, 30 Sep 2020 07:11:25 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWGm-0007ry-Ln
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 07:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601449880; x=1632985880;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=te5Fq8lU1NgnJLTpRCidjkrgB1vZRxYx1twgyQtF8jQ=;
 b=dyRrYKxkN0J//2/+AUHSkbVVqBlUCJQcLvVC90KIE0ssVDMK162aTu+z
 3mNu7VFpJUTSageYJ8EORT2m6bi4+gCdSHrmE5XRqh38mAySM9cJlxuKa
 G77wiqz1cT7XS2wvXSqSFuC65xF7175cFoof+h02m7VmdWW1OpZTpbB4C
 2i/BnnGk6nb+yy9lZwuVDzI48tYOP/KsFooRiUI6lgcmR97vg1CghSlz4
 QqhfNQ653y+N7IkI28VDHFuFqv+wyhVzS72AxqXtP80+PAINf4wN4yJqe
 2qUIVb+LTtQEPPKh1uLvgrGsRFy0uuYuDRyXjwweRpw7JFLMXuIiNO9TZ A==;
IronPort-SDR: hx1hx9303ujWudmhME8ocjZV37tnz/CnL2v85ymatifM6Tl0jBfRy8aSn0+l6ZwAhNeQ3ge1/J
 4HPYGG20hE16DT4Q8yB9sHL1LTIf+z3vsDxy9Q7SMCZa0T7a80SPCpn0wi/xryO8NCm35qIDlt
 CNpwRfYujPHROqJGlqaE+TAvBCwgO6MQI9Vd5KyEWbdEQGV8Z/7eTdYfpjuLx3S3waMxPlCZ8I
 0x2SqEJ4GM9+D+HhSxfS8K+kiPoKXOCYK3TR2fjhJaopC3XOS/VsCWbJpkBgBylbicOwklCZQ8
 YWY=
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="88632018"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Sep 2020 00:11:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 30 Sep 2020 00:11:03 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 30 Sep 2020 00:11:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afWce9WKVwUThiJXSXO53nkmYB6/7rkZb1Utwa2eXDyUmZbWaBMt7acceEG+akxgWQVYGJ+pQ2nEWdf7QSN3vaauO4bK/Ke20ZQSYRXmCvSwRwyNnlYJPRWDDbUGNWgWdXXvJh39YS0F6BUsPiGwE/HABR5aRAN8N6J92p5+VlSfmn6heigenfwWztkxSYjTIHzvZ8AbxUjfPQMQBhCwM3Ycsh1l0ittIBch6xfmsrgoaIuCZbIqUrCgMTzUqLA/8oTEf71g0jhug3Vy/VjTUhc6yBYj+lnIg9nkr3WQGQxf0qWjdYFY7SPyJuXkfp0Z4oI0t6r6nu4Yu3Rd+aw5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=te5Fq8lU1NgnJLTpRCidjkrgB1vZRxYx1twgyQtF8jQ=;
 b=Fb2YToZ6FOT4YAVsCrpZaht0wmOYgtv+Q+JMDzXSQkrG9YyQZr3JD6HD5VCZ6ePbNU8CntnzUUWy3BVZTPJD80WDc0YjE8NxoqCTeCm5fqEKBGuj9nEWkyiZd1yHAOOeubebr1og6ZcLsFbdQV//T+cEGHM9kJZuC7V+tdWZoKlWA+ADyhKgT07eAWvN5SEt9YB4o25kHxOJjJiVQWPCxP5EHfGW47uC+EY4f/En9F11onITEKSLU3NZ32rk6GoSMQ65CCKxYhnSTMhtKPOqV6GL+8NX79Led2D5QeOsPX7WBwtknwjNIaKWvQ0ILN7ssHju0EnVbT7KmDg4xf/kTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=te5Fq8lU1NgnJLTpRCidjkrgB1vZRxYx1twgyQtF8jQ=;
 b=tN+g3AEYDYJkzQV/ft+Gv1325/qMsIxASSQhiYNYseChkhh9erWqx73iD3BbLtKozjtqVnWRESQkKYY8silGniflSy81T83whlfCWUOWNbSAtcSm1Svpw1xwJfGmtP5Tx/NSvwdV5YVDIoStPznRhkeZfBD8dyyobhzIUARdUz0=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (10.175.91.12) by
 DM5PR11MB1612.namprd11.prod.outlook.com (10.172.37.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.24; Wed, 30 Sep 2020 07:11:16 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 07:11:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 09/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Thread-Topic: [PATCH v13 09/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Thread-Index: AQHWlvjhSEOJ06dulUeHo292BYv/qQ==
Date: Wed, 30 Sep 2020 07:11:16 +0000
Message-ID: <47419443-fe8c-1046-ae04-d188560156c5@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-10-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-10-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.187]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddc99a13-f2dd-4255-7ee3-08d8651005bf
x-ms-traffictypediagnostic: DM5PR11MB1612:
x-microsoft-antispam-prvs: <DM5PR11MB1612F480D4E1FBF3A18BEB19F0330@DM5PR11MB1612.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Mziihyp3BIYXVVjUykLteJdCU7rIorXzlemoE/Qd2I6ZDq9SAeyT8tqQgzNBHgt3Lc+fqNVAGM2iwnUuCEHrmq16+RXk9tUphyX85iYP06QVzi6PcYZwFdQus24mw+yRAZhF5ZeCKmpAdrkf5C9+xBkZ9cDe8rzdiub3GsDKIa6w5lkZHbS4rtP+dx1T1SG2ZA67hZaNf35OiZUeR2r9AnyFKV0Fyp5KQpdUgn6mXlvZHwNJGU1K7UqZTMiRwALpHK4Hu/XylYi8BZg/GHZ3o5KRbt+oMxMkXASsEuK2BFg0TPbeYlIvjwRRSN2yeeK9nbOIGGlJ5+BIdSy6cDEbrx5JcphTW1cZaVqvEPTv5EUGU0OK2BNsMJNYbIxx4k+piiQXVWdYzNziebLa4OCKNeLbB8iNxvAQy7fPYn9UAtOxM8umwM3OfEkAf+wEG44
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(376002)(366004)(346002)(86362001)(71200400001)(31696002)(66556008)(64756008)(66446008)(66476007)(66946007)(478600001)(76116006)(31686004)(4326008)(8676002)(110136005)(186003)(54906003)(36756003)(83380400001)(91956017)(8936002)(6512007)(2616005)(2906002)(6486002)(5660300002)(316002)(53546011)(6506007)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1tL6YqnZbURu6/5ZOm8FHGMrzDcxUzlr1ayqYNabLwWnU48h77iDx+iA7x9to2Co+o24T+/V/wLfNeZMLMcaR95qfIhE1guxqpAT+ZkR/u3jrc6mfhYGPiK7ACmRYHpqKOsOm+YB1mt5NmdjWaW8HDQzFhAooWVTxzJyHlS/7rYfrpAlgyI1TY/FurpWSEzwRrEnsAkL3RycHX0MYXnXgsWd5y7pNnvYGiXKteACxj3ZCFRPOaR5vQ/7cUDip3Ypij1FZCR1uvrNCaFoRt+Xb315mNdDwEOHFgrVhRM9hxo+99FsAKC3VLXLjZjPPsjYswiJhDPnMK/TP+jr/0mas6D5RRTNF8RwD3andchqDV5Cug3cBxGfRO7shTTf13r8slS2CLfcRklc0jv0Q9KvSGapl86snFo6haIKT/R1paAEm4WvgyoVCG9ERtXSiN0BOfAB7wLcd43672nc79+krrOkoyazplSCiqZ+k79K5wnlWcC6VndS4ACmGG9loO35w46whCsrHoXfU0V5KTfu7fvPc3JdamVykb4ddF56tow6dLuSWI43LSGIYHbT66iGRpv/j1Qjk7aOGfMmTqBweypcSQ8VIzNArR3jeONxqOtvZ1sgoihJlU9cYz/dllWcx0W3ghHLgQm5b67JlESo7A==
x-ms-exchange-transport-forked: True
Content-ID: <258C63BA3A245947B7BB956365F72089@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc99a13-f2dd-4255-7ee3-08d8651005bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 07:11:16.1793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJV7vZJUqAP+f6Z6lxUgsdUkHry77IWjJ/AdTPMlOs9yFv2WA0/CVBWG49f5/pmhpG+qWJTeVgIyuEyWn+b9VRCoXYA3wnc0u+wjv6SKjIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1612
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_031120_875757_9DED1F29 
X-CRM114-Status: GOOD (  22.58  )
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Allow flashes to specify a hook to enable octal DTR mode. Use this hook
> whenever possible to get optimal transfer speeds.

We need to restrict the access to octal dtr enable for flashes that enter in
8-8-8 dtr mode via non-volatile bits. It's what I tried in RFC 1/3.

Looks good ;)

> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c | 35 +++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.h |  2 ++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 87c568debf14..6ee93544d72f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3069,6 +3069,35 @@ static int spi_nor_init_params(struct spi_nor *nor)
>         return 0;
>  }
> 
> +/** spi_nor_octal_dtr_enable() - enable Octal DTR I/O if needed
> + * @nor:                 pointer to a 'struct spi_nor'
> + * @enable:              whether to enable or disable Octal DTR
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +       int ret;
> +
> +       if (!nor->params->octal_dtr_enable)
> +               return 0;
> +
> +       if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
> +             nor->write_proto == SNOR_PROTO_8_8_8_DTR))
> +               return 0;
> +
> +       ret = nor->params->octal_dtr_enable(nor, enable);
> +       if (ret)
> +               return ret;
> +
> +       if (enable)
> +               nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
> +       else
> +               nor->reg_proto = SNOR_PROTO_1_1_1;
> +
> +       return 0;
> +}
> +
>  /**
>   * spi_nor_quad_enable() - enable/disable Quad I/O if needed.
>   * @nor:                pointer to a 'struct spi_nor'
> @@ -3109,6 +3138,12 @@ static int spi_nor_init(struct spi_nor *nor)
>  {
>         int err;
> 
> +       err = spi_nor_octal_dtr_enable(nor, true);
> +       if (err) {
> +               dev_dbg(nor->dev, "octal mode not supported\n");
> +               return err;
> +       }
> +
>         err = spi_nor_quad_enable(nor, true);
>         if (err) {
>                 dev_dbg(nor->dev, "quad mode not supported\n");
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 42ec7692d8e7..fcb5f071ebed 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -203,6 +203,7 @@ struct spi_nor_locking_ops {
>   *                      higher index in the array, the higher priority.
>   * @erase_map:         the erase map parsed from the SFDP Sector Map Parameter
>   *                      Table.
> + * @octal_dtr_enable:  enables SPI NOR octal DTR mode.
>   * @quad_enable:       enables/disables SPI NOR Quad mode.
>   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
>   * @convert_addr:      converts an absolute address into something the flash
> @@ -226,6 +227,7 @@ struct spi_nor_flash_parameter {
> 
>         struct spi_nor_erase_map        erase_map;
> 
> +       int (*octal_dtr_enable)(struct spi_nor *nor, bool enable);
>         int (*quad_enable)(struct spi_nor *nor, bool enable);
>         int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
>         u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
