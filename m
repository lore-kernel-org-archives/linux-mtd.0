Return-Path: <SRS0=AizK=EC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE74C55179
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 16:58:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA25218AC
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 16:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J8+SrD7+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="p7MAsWEG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="jhNbB2En"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA25218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8gfO2+PvK1U9/5RDMNxqZbXkMvlTvqHzIrP8+747Xmc=; b=J8+SrD7+b0vu1tjvm+6m/yZmw
	fyPkttsZzjD8rO4AJCYiez2LvDftsWh8ch57aprlu4ucp1YYDu4Z+/k8VL2KuIajwDvFF93Z21yr4
	4felPcRwnhwyey0C+viGFzBhfFAGpw+NseM68yGIvPwYsQt6Z9WbCLdxuSgcPmq/y8WB+NyMAU/Bx
	4ulYm92EXknqt/jeSLFpnrS6eoURxRA5VuB30Isc9sp3m2wvR76OYfznlDXjOU/G4cS7op4Dm1R4t
	NhkQbGfq6UoX2877ALJHoxDP947tVTT5QMsPEN+Q+CW1tBx2BB8xB1x52biA1moW0ZuE/Qkb4Yvp6
	HqF+Tw6ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXSI8-0007IO-4P; Tue, 27 Oct 2020 16:57:48 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXSI3-0007Hl-M1
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2020 16:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1603817863; x=1635353863;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Oz6vPe+Tcxbk49QYHwTFCGCx69BqOPi7aAxn4P3J+Tc=;
 b=p7MAsWEG1u1RvLHGhPVnXr2iygaWsIkgFyhDj3NbK7TBIOT4NYxS5aNH
 spgH838TfskNtO54/BXTXsjPry43/4Anb0POBSfRef3CEBl04j5yttyeg
 mI+xtCxy1QULFceH6kD74QKfoF2GdmgjKSmiIHRyez63Ihd01qFJaElDB
 qAxGiIfy7AQpOupJ4jaQSWqXYF+TFoei/1g63CGTf1LMYrTVnGu1OkxaR
 40eoBqYpnwI9Crfxrhy/7ZkBy5B2u1A6p+KifKKC1UGqZeH39l2liYd20
 k3RF7JskcuNcb5zEKyUJgvQlgGkG382WNY+yXOREmRgCCHoZfEoRQQO8d g==;
IronPort-SDR: kyoJrtkov2lwodQIKIr2XCFHZV445XP5m4zoPRVTQFwYntz7tcXQd2/dDzg/pj2dCV2yqK2c2X
 nVZ58/q2l/q+wH5E1moTWMT9uFi3udotY/GVt9T05HeUWClD7trzlLhHgOH5JMAyRYERfBbxxS
 1WxqErFyMY2D0F4Mw6R9TRDLeBqj/q1z7t52pZKxcUcZLZE44UEMdwA8G54heZ6fequ8oyvQhX
 25x2q6Z46eiMiJSK9/K5PanPcF7pNiZuztzFGiMDBfjw1ym2BJxuDGkzLp7m3U6Y3h6NN41KnR
 1a8=
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="101126710"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Oct 2020 09:57:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 27 Oct 2020 09:57:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 27 Oct 2020 09:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4ww42BW7CDTPQbKdHuPWE+YIzwj7xW5vjPhYLfNToxqcMn1hG4pfjyZYcuelL+EKu68w4GGU2H8RQaa6CUX5HBpW7MoyXHdS9FagPVNl8vJ89k7v2Xhf+VValrZiLFjCEwuZa/vsztgwqIfjIlK+sU3AzkIowEccAWNxnNUueP9ABZVkMOVM7hQuKP02h9WqlNXZDMHLaf/8/OjoUS+S6U1VP/33ChEduUU1HH5wLpnwVJbcGhsa6O+QJkGbg2VJhpMkdjb11q+Mrha98nHXo3a/KbMJCI6U6g4CL/mtj6AIMXMd30sou02uCy63+Q9EwGZRQvxGGCbSI+1ldVTwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oz6vPe+Tcxbk49QYHwTFCGCx69BqOPi7aAxn4P3J+Tc=;
 b=bWcri2RdJ460MTirnjvNV84E6rF2JatIF8u2GGT0N/XcY84mbvZInu3XOMulNYE0rOXYtPUHtzmc33mvjZZ5D9NQQ4GoaIV5EpBKtG+S61PIOw49GBf65TEA4ybkfSv4e7eDj1rjsYIrq4WOlwYqjdjDEkfTdWgvKqK0KONWOacgE0znlv96niZTmQGLrXozL0w0yevwtp2sqnxydSfds/JMNa4ClJbq8DT25UPmo+dTty+pvyKIKfoJfpSlgCiEhd/1uCx5b+pBT4Xx4djm/Vx9TVNpUWTAOL9tVgExhmHzvwVBLnSoL/gP/sZao0UKgDYUe6aX+OfVLJcEUm/rxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oz6vPe+Tcxbk49QYHwTFCGCx69BqOPi7aAxn4P3J+Tc=;
 b=jhNbB2EnHD7Ie1WKW40cWb+HwfkemB2Bgxf8COi5PMzq3mx19az8OnTLoXn2o7SzCLMXQDgHxVIEMK4epfwrDp/sFlgGuIYT2o5lrTCyD9IO5L2hmZKrOWCkt9IHX+VeLZ7uZ3HQBxT4wm/+P11suCZUngYuyQ4eGutRlS5oTRE=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2736.namprd11.prod.outlook.com (2603:10b6:805:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 16:57:39 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f%3]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 16:57:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <masonccyang@mxic.com.tw>, <broonie@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>, <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 1/7] mtd: spi-nor: sfdp: get octal mode maximum speed
 from BFPT
Thread-Topic: [PATCH v4 1/7] mtd: spi-nor: sfdp: get octal mode maximum speed
 from BFPT
Thread-Index: AQHWrIJF/cj+GvvkW023XwftDkioRg==
Date: Tue, 27 Oct 2020 16:57:38 +0000
Message-ID: <5df6d950-d47e-daec-cd06-d6a1880457e7@microchip.com>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
 <1590737775-4798-2-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1590737775-4798-2-git-send-email-masonccyang@mxic.com.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: mxic.com.tw; dkim=none (message not signed)
 header.d=none;mxic.com.tw; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.107.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 072ea670-c413-45fe-818b-08d87a99695a
x-ms-traffictypediagnostic: SN6PR11MB2736:
x-microsoft-antispam-prvs: <SN6PR11MB27361BAB36F54B037E7DACF2F0160@SN6PR11MB2736.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kIYTYEKrp0NB6HcsOXepxPjylce1vpeZrn4jV7tlUqZvsCuMtWFztqjfbxJQs2/TgTiLMeYtMC1AMyslvm8E3wT9s1i3DBGGRwc+p4Yl2lZmwORqUg8FsYtrj8Cx//byR75NCguoFLQ+hOh2IOqCCz+xTlHdyU35pnFVp4g+S1cvGD2Ux0wL7r/G8ZhUV5g7zPF/HQXrTLV03FMC1gGEqxdrADH6JtyL33CegDMfPoCeYin5tf5QdJpQNLXrozSheUBQKC0nFdxnwqRFzRcO4r9ni1Qc4iqfoQ9eP7+pO3yEsKhslc9zAvamWezBdaHUdBAUnkc5fNcYr4t1571L1069FwbUiqhAWKFJSi7I5rPBS4vebTwB34BuFkLhpotR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(396003)(376002)(346002)(186003)(86362001)(31696002)(31686004)(6512007)(478600001)(2906002)(316002)(5660300002)(36756003)(110136005)(54906003)(2616005)(8936002)(76116006)(8676002)(6506007)(64756008)(53546011)(26005)(6486002)(66446008)(71200400001)(66476007)(4326008)(66556008)(7416002)(83380400001)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 0avYsMubjX7Z2gRqdu/bC7xu/h9ZNQKJqqKwBD8zwlX0PEXDAAFGCjjeQqdcASoBAoh2/cIYLRY+t0yWomLR/AZdcvaCXVoZXRPSHcYxP3YCkE0qefdtRcGIwdInaJj8oo5EJKHoMzbyenaJi+G0H2hebjs2KrCdUT8o11auX8XC88UyB4j2FZtmL0hZNRVmosadwVSvdVmq1zTmtdNGO8KoSFYTpTYwkXkr0L6e383YviBdyUf5QSLoZlBYFCAs63AThzQVwYkQgp4Efp+nxwCOroLxy0JBrP4rc7EPaWCchn56pF1AmouND5tJ4XmHTCOhZH+8uvJtZ98zsZrjaT0CQGEu4CRc/cCxgpypR3TwGvA8aMIENu7YPobt4sYdt2o4mtEYaK17kGCqYe59mIxH/HQAFR/3utYqDZYU8yEFwUvEL8+uDb0XL5oH9Zg83HQGbRfxbkFl7UgT0jQ8idPFE1qufIvzRx+teY/AJyrlLrdJd84Hva3RztG1ihjdxPexOrNnHMgHxqJq+dLabuTuak+feJ7ZmyYhiB3lYowha3ihLaYC66Tpwl/ti4xu4cFEgCAUjj/KGRwB/we3pTTBKRYk8GzWP9q/p6biFp72MuPWmfVG+3uX6dOSObKSbc5NmpoAGRpZIF4g+so7xA==
x-ms-exchange-transport-forked: True
Content-ID: <43FCA5A58C850543833509D8686986CE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072ea670-c413-45fe-818b-08d87a99695a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 16:57:38.8242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nieTu174f8DiqLfzyI+Zru+/0YAQZMOQvFGpCao0inbj165GQsgJya+qgSqgTQMUaX5Smzko9GEK95xQRYlX7RgCkoQhV3hLT8qGRiqiCI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2736
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_125743_973737_4873AB65 
X-CRM114-Status: GOOD (  24.18  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Mason, YC Lin,

On 5/29/20 10:36 AM, Mason Yang wrote:
> Get maximum operation speed of device in octal mode from
> BFPT 20th DWORD.
> 

I would like to understand how would we use the max speed value
at the SPI NOR level. The maximum operation speed is typically used
to determine the number of dummy cycles, which is described in xSPI
Spec for speeds of 200 MHz or less. Even if BFPT[dword20] describes
supported speeds up to 400 MHz, it doesn't indicate the number of
required dummy cycles. What number of dummy cycles would we use for
speeds higher than 200 MHz?

We may be tempted however to pass the max_speed_hz to the SPIMEM layer,
so that the controller can sync with the memory to choose the best
available speed.

Cheers,
ta

> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.h |  2 ++
>  drivers/mtd/spi-nor/sfdp.c | 36 ++++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/sfdp.h |  4 ++++
>  3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 6f2f6b2..7a36b22 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -190,6 +190,7 @@ struct spi_nor_locking_ops {
>   *
>   * @size:		the flash memory density in bytes.
>   * @page_size:		the page size of the SPI NOR flash memory.
> + * @octal_max_speed:	maximum operation speed of device in octal mode.
>   * @hwcaps:		describes the read and page program hardware
>   *			capabilities.
>   * @reads:		read capabilities ordered by priority: the higher index
> @@ -212,6 +213,7 @@ struct spi_nor_locking_ops {
>  struct spi_nor_flash_parameter {
>  	u64				size;
>  	u32				page_size;
> +	u16				octal_max_speed;
>  
>  	struct spi_nor_hwcaps		hwcaps;
>  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index f6038d3..4d13f66 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2014, Freescale Semiconductor, Inc.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/slab.h>
>  #include <linux/sort.h>
>  #include <linux/mtd/spi-nor.h>
> @@ -26,6 +27,12 @@
>  #define SFDP_JESD216A_MINOR	5
>  #define SFDP_JESD216B_MINOR	6
>  
> +/* Basic Flash Parameter Table 20th DWORD, Max operation speed of device */
> +struct octal_max_speed {
> +	u8 idx; /* Bits value */
> +	u16 hz; /* MHz */
> +};
> +
>  struct sfdp_header {
>  	u32		signature; /* Ox50444653U <=> "SFDP" */
>  	u8		minor;
> @@ -440,6 +447,22 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	u32 addr;
>  	u16 half;
>  	u8 erase_mask;
> +	static const struct octal_max_speed max_hz[] = {
> +		/* Bits value, MHz */
> +		{ 0x0c, 400 },
> +		{ 0x0b, 333 },
> +		{ 0x0a, 266 },
> +		{ 0x09, 250 },
> +		{ 0x08, 200 },
> +		{ 0x07, 166 },
> +		{ 0x06, 133 },
> +		{ 0x05, 100 },
> +		{ 0x04,  80 },
> +		{ 0x03,  66 },
> +		{ 0x02,  50 },
> +		{ 0x01,  33 },
> +	};
> +	u8 idx;
>  
>  	/* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
>  	if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
> @@ -604,6 +627,19 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		return -EINVAL;
>  	}
>  
> +	/* Octal mode max speed */
> +	idx = max(FIELD_GET(BFPT_DWORD20_OCTAL_DTR_MAX_SPEED,
> +			    bfpt.dwords[BFPT_DWORD(20)]),
> +		  FIELD_GET(BFPT_DWORD20_OCTAL_STR_MAX_SPEED,
> +			    bfpt.dwords[BFPT_DWORD(20)]));
> +
> +	for (i = 0; i < ARRAY_SIZE(max_hz); i++) {
> +		if (max_hz[i].idx == idx) {
> +			params->octal_max_speed = max_hz[i].hz;
> +			break;
> +		}
> +	}
> +
>  	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt, params);
>  }
>  
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index e0a8ded..8ae6d9a 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -83,6 +83,10 @@ struct sfdp_bfpt {
>  #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
>  #define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
>  
> +#define BFPT_DWORD20_OCTAL_MAX_SPEED_MASK       GENMASK(31, 16)
> +#define BFPT_DWORD20_OCTAL_DTR_MAX_SPEED        GENMASK(31, 28)
> +#define BFPT_DWORD20_OCTAL_STR_MAX_SPEED        GENMASK(19, 16)
> +
>  struct sfdp_parameter_header {
>  	u8		id_lsb;
>  	u8		minor;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
