Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC84C4727F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:45:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799BA2076A
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c6VZCvTp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="M57fzDrE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gdCVRpQ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 799BA2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SHKXgAed6gk1YrzSGd0TnhFifuA/UbHTv/4DS5sIQls=; b=c6VZCvTphqyCUZTdhaKA6uhiI
	veICvvZKglGwuo0+AGKkFVbXg2DoySMhn0EKeXKgGfYdSo4cMeStIpj48rL/8Lj7/YVEkG4lZFkLC
	KQrdlHf2JBPqbrzzmosoAHjXJndkBwyfj7fQW3M8JVO7VZrhDuBf7Gi0zjouc1MwG7/VtHUdQlheX
	QQ7GdDMQQfTqjhzkUz65dlIftxc9mH5rD0SjnkyXjxPk6FgFt95KokqFukSPytlvhtZLNd1y3f9m5
	6DoAG7UHKfI+4sZUnWWDMiHKQ7lpOUrDsCaEgpaBh9rT5Y4u5B5Pn5zk8PwQxP4C5EOku5H4IWBaP
	L52jM28Mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNVqe-0003Kx-Jt; Wed, 30 Sep 2020 06:44:20 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNVqb-0003Jx-74
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 06:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601448257; x=1632984257;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RcZjbGfDplZayXbRHqqXY6QOYYuW30RDIT3SuDjc4tQ=;
 b=M57fzDrEktf5gDphkkn1fxDl9LLkPhjGR8/XzHWVpLAqf+tEGrT4PIfe
 P9siAktO+vLNtPnyi7ErRDrH4Pa+xjPe1wWlhgZj4D6UG2dx+BOtljj3J
 iO1HHzgTVzOUDXezTkAPOaAFqEcmo7+zZui0swRabgcbAQ8yWzT86FdqO
 K6gcpMeba+o/lEdQ8yzoT3ej/cxFh79tQOLO39ZdP3bP/+aKE5QiO4fAw
 yuU8GM6b4zfaXpMpyXnp5nZh5QIuWDySS9HwlAW5N9oOf+Yk07j9mgceU
 WuaA1PuUKgNm0rHCDymQVC1pGFuSBBE+FwrW13Lj47zaViBVqCkZaJmZ+ w==;
IronPort-SDR: Fy4zfqeEfQSypNsn1mB3tsD5dJmzp0GDtbSmF44ElLAuZGf/9RDdKKI5A9GSgk7JGbXbv3zOr9
 3MDgL9AZT5sFoNwIADEmqXE5Icj1U++qxBR6ioMiikWMLvBfNIn2g3d71J3AwNLqq3mqtsroX8
 7sVC7S5mct/CDyJW99FgsCUC0ddg/C958MN++qmLvC8lYyt81CNFyib1A3vh0lO9rjbGnXDFyc
 UUMc3ItjupxiSudp8qPO7u0PDAlsAtEdOzrOCCg/IEpvFjBZmo9zuI3UnPTxb4c1hMygGAwJIB
 G2s=
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="93691421"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 23:44:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 23:44:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 29 Sep 2020 23:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4yYT/lXTs0zfCF15mZWQt6x22NAVEMpP7XG9CtUypLicHaAKZEgH1orQf1+1by6BlkkeSm1zwJuTm0oKSyxYXCY925gbZDXitSkiIUvPZVJRw2dRvYeTxbvgnwkLtKvv21PxIAVseNuhJDod9kXBH1I6HuRnX9LfoUhLUmDRo150GLukiXfAiRYBbS9V6hqgiXdFyeOZ995D3TFTudvwdBTvMYUQLeYv31ybH7ytH38GmtpVzO3/a8VRfoQT236l6jn1abvsfuWHxULqKYmIwZyv9KziMOlruhFBC8GFvnPj8/xzMZXYx4bDoB9fz4mHlsXNkrxU1iILqg4ubT0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcZjbGfDplZayXbRHqqXY6QOYYuW30RDIT3SuDjc4tQ=;
 b=a4ZMOggsBKeUJ6evI10a+G6rmgwGMiCGJxjsOwFVv4HczYbapB/HD2qp9XniQ07D2AVckVxcd/53EXXsb0ritsTvTUC4CzXx6Dz7LG3ZnDh6XszlqcsPyW3FamPUapijOMn4dEH9laNJGzs8LDmA2V1TRV9XbeQtmBuajCVXJV27IrO6cxeizJ2cozV1LlhIwK1WUlN/pqHqouDxDsy+/sP3nJqMWLzbVCvjNz+MvTjhLcrrKttC3dK7yDCF5gOjDyU3M2QCG+1QkZP8p+2b295TuE4ul7y7GIk08jvdEWH5KJU8tKRnCkNED8AaUKoO1ypVzGr5P9IY/4bOTFMqbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcZjbGfDplZayXbRHqqXY6QOYYuW30RDIT3SuDjc4tQ=;
 b=gdCVRpQ5sQxTXI/pueBWLk2ma3JVWfprE5WW7W6ENSyMdurlQgHPqVhvLOt/tQTHn7v7d0R1nhRl8S+gzU8lh0B2iIuXTUe1eRopQ9zquuqWf3bjav8i6j/OYM/FAyqKWCOw06fFRWg4NA0bfiyuU7O5ihhajYSMMulqjIAO/PI=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB2012.namprd11.prod.outlook.com (2603:10b6:3:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Wed, 30 Sep
 2020 06:44:11 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 06:44:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 06/15] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Thread-Topic: [PATCH v13 06/15] mtd: spi-nor: sfdp: parse xSPI Profile 1.0
 table
Thread-Index: AQHWlvUaMNR86FPkxEaAloT60ykaig==
Date: Wed, 30 Sep 2020 06:44:11 +0000
Message-ID: <c4ff4fba-cad5-de10-93e8-97a4e2edecf0@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-7-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-7-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 1a6acc73-2417-4dc1-739f-08d8650c3d6c
x-ms-traffictypediagnostic: DM5PR11MB2012:
x-microsoft-antispam-prvs: <DM5PR11MB20124081088D732428C6369CF0330@DM5PR11MB2012.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kOC00gFKqV3EtXE8DibfNybqs8vx462U8Ky5cbSZ5QstxWEONOqxruhlyMBupDL3a8Uj4nJSnOqiWz4TNfFQW7dgItVkuPEH3Ogpn/92doZSE4hqMkEwtyxIp5bgWmcMXSFnEzQSUVjvbdbQa8BlmakzFlYnGz4DofwQyke/13OfmZ3Yl3s0kKCa8NnO015yxSPUxcgbn0jejKB/L2gIns7XXjJzvnnK5tCv37foWcuD8JwnmTN+AIPIbLT03QI9qn0g6pAlvwfB/NEbDQ0IYXoiITl/f9n3h7AK+xI/itmiKuP7+1yg0rUWoBOdwrs2+aL9WDXflmdKae4JRaX8jZJckdbj2ORVlU71OdVsYygXNYlu5bWgPKQp2MaJTuCy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(366004)(376002)(396003)(86362001)(6506007)(53546011)(83380400001)(2616005)(36756003)(71200400001)(26005)(6486002)(5660300002)(31686004)(478600001)(186003)(316002)(31696002)(66946007)(76116006)(8676002)(66446008)(91956017)(6512007)(66556008)(66476007)(64756008)(8936002)(4326008)(110136005)(2906002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: iC08M8R3aGg/HAU8bGb6zfbDQNi2brFD4Q/t36qr2mOXlUJDA70W0W/FWNgEPovO1KjBkEw096aGn+R5yjOCx3g8nat/InlItyMJ1vtkk+rw8Hs6BUmtJksdIxisUlhRwcMQ8gu0sjR6od1dKoDi2pR7zxo3DwWOIf7HG5p28nEora4QeKMX1ngvYDFtTdsWmGWyBQs0+SbZeXmgBH3SOHYjpHf4fDbeR0WZhQAgd//38CVRiaEIpDoYjta0aW0DM7h5SpKuqmV7a6AaEpgXeGaY5+DsrkqOUurGuBUbt0zHBlbULxnWj7vp342yr3hpP0LJg+1zZul2rV4OI8f+C/W//n+1CqO0X7hovIp3GvauDCUuED6rN9JKY2AUXv/IDxJocFyVN87sLpxDKB24EF8zaoG4hUT0jeFBZcc6s5inO58gRV1t/iqcSVEybcIHKY/Qwtm8LEcUinD2yLdM+6FGxLc32T8UGhbNetdOWIngy4eAJ58IpCVoSYSahFMxtIyxnapofjqO4dEOEZXrov9tZqB3K0KnG21KJ1H2ITyFcLwHtkhIyaM8XoTD+1cCwHZzzmJG0SVFOouQdbd2oyfSe0pQ7xEoHO7Dg+ZXdvvXvi2hZiFFkbIoNhAcNX+zbHFsUblpM0HMbO1QQlHSPA==
x-ms-exchange-transport-forked: True
Content-ID: <D2291268978E8140AC3E6A2A6CE58042@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6acc73-2417-4dc1-739f-08d8650c3d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 06:44:11.5876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wL2Xf11MMHhzgVrsLFe3sEV0vAxUojdl1nFHlRslYOnd5uCz6/dHGzOslceMFeGJfTu2m+UXJsxBXyiLZdR0ETNhVgJoAVbS5kosGkWwiZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_024417_468947_9DE051C8 
X-CRM114-Status: GOOD (  27.31  )
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
> This table is indication that the flash is xSPI compliant and hence
> supports octal DTR mode. Extract information like the fast read opcode,
> dummy cycles, the number of dummy cycles needed for a Read Status
> Register command, and the number of address bytes needed for a Read
> Status Register command.
> 
> We don't know what speed the controller is running at. Find the fast
> read dummy cycles for the fastest frequency the flash can run at to be
> sure we are never short of dummy cycles. If nothing is available,
> default to 20. Flashes that use a different value should update it in
> their fixup hooks.
> 
> Since we want to set read settings, expose spi_nor_set_read_settings()
> in core.h.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c |  2 +-
>  drivers/mtd/spi-nor/core.h | 10 +++++
>  drivers/mtd/spi-nor/sfdp.c | 91 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 102 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 7445d7122304..cbb1aab27d03 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2333,7 +2333,7 @@ static int spi_nor_check(struct spi_nor *nor)
>         return 0;
>  }
> 
> -static void
> +void
>  spi_nor_set_read_settings(struct spi_nor_read_command *read,
>                           u8 num_mode_clocks,
>                           u8 num_wait_states,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 125d27b0a72f..42ec7692d8e7 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -192,6 +192,9 @@ struct spi_nor_locking_ops {
>   *
>   * @size:              the flash memory density in bytes.
>   * @page_size:         the page size of the SPI NOR flash memory.
> + * @rdsr_dummy:                dummy cycles needed for Read Status Register command.
> + * @rdsr_addr_nbytes:  dummy address bytes needed for Read Status Register
> + *                     command.
>   * @hwcaps:            describes the read and page program hardware
>   *                     capabilities.
>   * @reads:             read capabilities ordered by priority: the higher index
> @@ -214,6 +217,8 @@ struct spi_nor_locking_ops {
>  struct spi_nor_flash_parameter {
>         u64                             size;
>         u32                             page_size;
> +       u8                              rdsr_dummy;
> +       u8                              rdsr_addr_nbytes;
> 
>         struct spi_nor_hwcaps           hwcaps;
>         struct spi_nor_read_command     reads[SNOR_CMD_READ_MAX];
> @@ -425,6 +430,11 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
> 
>  int spi_nor_hwcaps_read2cmd(u32 hwcaps);
>  u8 spi_nor_convert_3to4_read(u8 opcode);
> +void spi_nor_set_read_settings(struct spi_nor_read_command *read,
> +                              u8 num_mode_clocks,
> +                              u8 num_wait_states,
> +                              u8 opcode,
> +                              enum spi_nor_protocol proto);
>  void spi_nor_set_pp_settings(struct spi_nor_pp_command *pp, u8 opcode,
>                              enum spi_nor_protocol proto);
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index c77655968f80..cadb1ed27ffe 100644
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
> @@ -19,6 +20,7 @@
>  #define SFDP_BFPT_ID           0xff00  /* Basic Flash Parameter Table */
>  #define SFDP_SECTOR_MAP_ID     0xff81  /* Sector Map Table */
>  #define SFDP_4BAIT_ID          0xff84  /* 4-byte Address Instruction Table */
> +#define SFDP_PROFILE1_ID       0xff05  /* xSPI Profile 1.0 table. */
> 
>  #define SFDP_SIGNATURE         0x50444653U
> 
> @@ -1108,6 +1110,91 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>         return ret;
>  }
> 
> +#define PROFILE1_DWORD1_RDSR_ADDR_BYTES                BIT(29)
> +#define PROFILE1_DWORD1_RDSR_DUMMY             BIT(28)
> +#define PROFILE1_DWORD1_RD_FAST_CMD            GENMASK(15, 8)
> +#define PROFILE1_DWORD4_DUMMY_200MHZ           GENMASK(11, 7)
> +#define PROFILE1_DWORD5_DUMMY_166MHZ           GENMASK(31, 27)
> +#define PROFILE1_DWORD5_DUMMY_133MHZ           GENMASK(21, 17)
> +#define PROFILE1_DWORD5_DUMMY_100MHZ           GENMASK(11, 7)
> +#define PROFILE1_DUMMY_DEFAULT                 20
> +
> +/**
> + * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
> + * @nor:               pointer to a 'struct spi_nor'
> + * @profile1_header:   pointer to the 'struct sfdp_parameter_header' describing
> + *                     the 4-Byte Address Instruction Table length and version.

Profile 1.0 Table

> + * @params:            pointer to the 'struct spi_nor_flash_parameter' to be.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_parse_profile1(struct spi_nor *nor,
> +                                 const struct sfdp_parameter_header *profile1_header,
> +                                 struct spi_nor_flash_parameter *params)
> +{
> +       u32 *dwords, addr;
> +       size_t len;
> +       int ret;
> +       u8 dummy, opcode;
> +
> +       len = profile1_header->length * sizeof(*dwords);
> +       dwords = kmalloc(len, GFP_KERNEL);
> +       if (!dwords)
> +               return -ENOMEM;
> +
> +       addr = SFDP_PARAM_HEADER_PTP(profile1_header);
> +       ret = spi_nor_read_sfdp(nor, addr, len, dwords);
> +       if (ret)
> +               goto out;
> +
> +       le32_to_cpu_array(dwords, profile1_header->length);
> +
> +       /* Get 8D-8D-8D fast read opcode and dummy cycles. */
> +       opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, dwords[0]);
> +
> +        /* Set the Read Status Register dummy cycles and dummy address bytes. */
> +       if (dwords[0] & PROFILE1_DWORD1_RDSR_DUMMY)
> +               params->rdsr_dummy = 8;
> +       else
> +               params->rdsr_dummy = 4;
> +
> +       if (dwords[0] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
> +               params->rdsr_addr_nbytes = 4;
> +       else
> +               params->rdsr_addr_nbytes = 0;
> +
> +       /*
> +        * We don't know what speed the controller is running at. Find the
> +        * dummy cycles for the fastest frequency the flash can run at to be
> +        * sure we are never short of dummy cycles. A value of 0 means the
> +        * frequency is not supported.
> +        *
> +        * Default to PROFILE1_DUMMY_DEFAULT if we don't find anything, and let
> +        * flashes set the correct value if needed in their fixup hooks.
> +        */
> +       dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[3]);
> +       if (!dummy)
> +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, dwords[4]);
> +       if (!dummy)
> +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, dwords[4]);
> +       if (!dummy)
> +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, dwords[4]);
> +       if (!dummy)
> +               dummy = PROFILE1_DUMMY_DEFAULT;

just a dev_dbg here, without assuming what default value means

> +
> +       /* Round up to an even value to avoid tripping controllers up. */
> +       dummy = round_up(dummy, 2);
> +
> +       /* Update the fast read settings. */
> +       spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
> +                                 0, dummy, opcode,
> +                                 SNOR_PROTO_8_8_8_DTR);
> +
> +out:
> +       kfree(dwords);
> +       return ret;
> +}
> +
>  /**
>   * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
>   * @nor:               pointer to a 'struct spi_nor'
> @@ -1209,6 +1296,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>                         err = spi_nor_parse_4bait(nor, param_header, params);
>                         break;
> 
> +               case SFDP_PROFILE1_ID:
> +                       err = spi_nor_parse_profile1(nor, param_header, params);
> +                       break;
> +
>                 default:
>                         break;
>                 }
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
