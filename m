Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0315FC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:51:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AD112145D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u4/gfZHY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lZ0cJp59";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="SGsFT5wn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AD112145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rBu6pDakdeY77uudUOmR52PVEUiZP5tf9ArBuAEBEj0=; b=u4/gfZHYRob4s31S14Zx9ZDVH
	bTnBRWJoMP8PjWnmeO64lxNNrMeCf5/WdkplxTbsDh+VyN9kslM5UgJVRMieACiIopTLmB7rKfHHu
	+AElJoulUBxflkmdxp4gbX+S2HCHjcfa6GPflpFujoLXq0msykcSnVyyHGOYdcsrerRXDtU+fYe8W
	49Em9IzXB6LZJEXmjOIiJ2ieWIamt0DDJIgb03crqmhJ/nKnCp9JRoBUp7c+N2dgm9uuZkh33aGK0
	Mhl1qrmJ5CmbswvRMzuLJjo7H1XAZsDAfnMNsBuUxUQtmFPtLK0cDG9Vn0M02doZCr8V86dzjFkga
	UODtf9BFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtLj-0003IB-4V; Thu, 01 Oct 2020 07:49:59 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtLc-0003HT-9G
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 07:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601538592; x=1633074592;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6322qPk1ak3reGQt9Bs53CBEkHNP66HWAhFOExlToyI=;
 b=lZ0cJp59EDeCU+1hJ2hYgZQkDZv33Y24LVtYB5zpmrjnWd27o5/6YUWl
 dZs2f9nJDWJCtWxf/v1dHJg81f5VBW92FMKwDq9M8PHZIOE8v/XjN+nLS
 CL97k8l2ydp+I4+akD1TWtfEsqk7To7xRaA6cXFudRF0f2LYn+dtBeQmz
 qzgNjUNpxGrok69sCYh1PB/tQpLetstfwikzhjImNIT79EVJChNCFnBLO
 u1gKzIsiDdH/QdI60p/LaDGn3c8jQfbUSqMJ2B8HA1iAuVD0A/5jovBfa
 YXTXlN0Sb5Nu/4qRQV9bjSKGlvI3eU4fIIinhDH0dQcjQYIq589ZsCAgG Q==;
IronPort-SDR: iguaJ4w++/qyqDqjrtI6MPJOT8dqoukEW8CQHNxpmYy2zy+sghuna9d48HGbeAy/4L9ErAGdXE
 vM6Pvdzv0Nk+FC7F/+EzVXMLE3lGmG8PsLiJIf0ULoAay5S4COUXnuCw5a7lLMc+SKG9CRGCTp
 JdZ4JuWc7hCp+Gu0acJYYUGvbtcf90IftMI189c8LoGzqqCa7/AeEmEPgeEGwfD6Rz2BvoMD0a
 UR6QZ+R/DdVS3KBs2HvfmIztkmncOkGl6IKAhV3UuF0BrLgpt52Gglx7DOEEzJWLz00J9jeK4V
 ZJc=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="91050745"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 00:49:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 00:49:20 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 1 Oct 2020 00:49:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5sFPEVLAGyl1CZYWexIrnuUzXygZncmi9JV6VI90/Wym7Ki5Sibnk/EuQvIxeTLT3m/B5xijfhBR3CuwHxDsTlb5jIZbuQQ4mP3xx2ksDtD2Xl10lhgwlZgGPPjF4FodtRDaw8LKCIM4UqbMi2NqqJaYCBh4QCqX2jlmiRTLoIg1L5iUyhTq8hw3hqhB8ry2B8HR01TD571FXgKsjD8WmYCvNxXLPBIaotPQakPI71HEy/kVIf9Z5zBASwy8G5S+OqvWZnIqFtFYx9mO0/xBz887Y1IzqRbk+PlN3YELNd+S88Asp4aqOoqntxECIcE6RFHv801IfZoKv3Kr5yQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6322qPk1ak3reGQt9Bs53CBEkHNP66HWAhFOExlToyI=;
 b=mlkixI1K1SFl1PQibaY1Qfb2AK4pSojcMC/ewy1H18infncj0EDM0rLDFptO2s9lNNYG0ormnUNdrqQGHqa8cUCplaUnpKySwGUSOHvhXm44VeXj1wzQjvb+siC5h8t9amCTwDUhBe9+PVCKSxechvkVF/iooMR+yrb4YbYUkimNwcvzNoFL0palcfzKF27R2QcrvE3b1JyeNpcsB3wqb4NfAnv6dVgWlU9bIXR8eu+FbboRsesCty9yjK5ZI1r3pbjzZeUStC/T0YJ+gKnb2zjjStcNenvytPf79z1Ydb7IBAx1R5mQgRZD8Um1potYm8s7B+ItkxA0uY3QvKX9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6322qPk1ak3reGQt9Bs53CBEkHNP66HWAhFOExlToyI=;
 b=SGsFT5wn9jtxl4racE368z6fdxSnzJ598XDoIdaotRQCxfY4n5MiJZceigBPZvSgQzit+kGa0tjB2tT4H3xZmXUaw/2Mh0/kBPiNvzBsVRfQdVpprkjl0B0ItgqvFteAUCmpAQsY5BMoPqXjgLmsow+gUFYWuarmvEhxl4Wdkbc=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Thu, 1 Oct
 2020 07:49:42 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 07:49:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 05/15] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Thread-Topic: [PATCH v14 05/15] mtd: spi-nor: sfdp: parse xSPI Profile 1.0
 table
Thread-Index: AQHWl8drO7ZG08xsAE+CeVVHXZG7Hg==
Date: Thu, 1 Oct 2020 07:49:41 +0000
Message-ID: <145cfbb3-3d1b-d1c0-c30d-d5d682fa380d@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-6-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-6-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 387a8369-9e36-499b-5da1-08d865de8e78
x-ms-traffictypediagnostic: DM6PR11MB4691:
x-microsoft-antispam-prvs: <DM6PR11MB4691A596F0BF7A4C2BAAF69FF0300@DM6PR11MB4691.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bsrCdbANozCapDDbxINiGkBwfsWRNSHUiVm8wCp5I0P4MFL8wPiGZOoW6e4W9ot5MpANSJiCvmETQkvcy8N//XzTzFlkY2iZgQdLHYgD0IKag/TRPXmEj2D4n7LNaieowwNgajzqhjxg5V+lOsHY3pDXq5jzOJDqHygLYoL/atpmh1jmk7bf/nV6PaThXcwPd8C0T4AeJjiM9gmxSc1WOlfAnBYuuiFHupTuZdRb2toxrKqzFYNqpihM6TkzB+VShlTDlZVAOnNfjAyFp2mW6HAcvwA33meLI20uKgREKWVXT7x1UomQaMS1u4hx5x0Zmvu1RI0xXatqlfhUdKN66kKw9b0xacymH+xDwHIvvNaeFVnGI1wnT3JbrXC1PvW5C3FkcGxip6V8Sjfig7bWTggKGyJrr19BYoIZwnErfKA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(366004)(396003)(39860400002)(2906002)(316002)(91956017)(8676002)(186003)(110136005)(54906003)(66946007)(2616005)(53546011)(6512007)(26005)(6506007)(31686004)(83380400001)(8936002)(31696002)(36756003)(64756008)(6486002)(4326008)(71200400001)(66476007)(86362001)(5660300002)(66556008)(66446008)(478600001)(76116006)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: xVQJHGM+yWKbJAckYOVPgrlIFGHWnFdgqMcutnAv2KViAbLvACwBqrC4NG22qSdcIyz5p3zyNTm+CteoWKNczXr9PNhVZ8OHNeg8nJ/VmcPWk0LdewwDHIPznF+8MqbeeRu+tkqxzH/XZBAgFo8Vl2ol/hr2KHky3VrjoXeHUas5/m0Fs8ZJTp+mPgthE/abmNF31E7mIt+0p4+T1ojsUdj7DDeDRo6+A5+p/+qpZes0Fw3EoWLYOQ/O0wj+gi/mIj9PZj6RT8f+zoRKVDmoVMDQodHhv8SZJALxBUsLrxWUeN6YZXABELRJue6U+OFFdEBZsuw2fljdF1LpK/7GOTbangVj9+5yk0gonnzaqPv4Vc+TLL2aAGtjDb2lsH4yCqrIzlm4IYWp0LWdpyx69/1tQ9dHlmpGRsFG7RD2LvpAjuZo1g9kY5dZZsZVKZRmT9K0KCIyf4dwMM4THXmcku9w5Tv7lnWDDaqNs4RWiJkBSipOY4T3aD2rNBvRJD0N5GbUME/KpbjaARFH/AdxN3DxK2lcAlTak7zKcIWsn6CDa90HrmOZ/FkEJL8G2ER5xwLawLx6r9cigCTe/jJcVqoBPbojVh4+KqWmGsYAHkElasHlz1e6TAueIKaOjaXfx5Vuv/EImKohYP+n3hO2gw==
x-ms-exchange-transport-forked: True
Content-ID: <5015DAB12169EC48A4FEA2F7C217482C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387a8369-9e36-499b-5da1-08d865de8e78
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 07:49:41.9693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DFmXsKqlnZEK+oVUMSXcOdtj73zsEJSENO+291YHhI6YldrzbFzPbH8t76oII1fZHkn+4iyqbTJU/0XDm2g34GAWUfqssoerCOWjyB/Azh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_034952_485644_534180F7 
X-CRM114-Status: GOOD (  28.10  )
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

On 9/30/20 9:57 PM, Pratyush Yadav wrote:
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
> index beb17639dc92..97e82a4821f6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2332,7 +2332,7 @@ static int spi_nor_check(struct spi_nor *nor)
>         return 0;
>  }
> 
> -static void
> +void
>  spi_nor_set_read_settings(struct spi_nor_read_command *read,
>                           u8 num_mode_clocks,
>                           u8 num_wait_states,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 5d95b4183a33..9a33c8d07335 100644
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
> index c77655968f80..ebc1188f7533 100644
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
> +
> +/**
> + * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
> + * @nor:               pointer to a 'struct spi_nor'
> + * @profile1_header:   pointer to the 'struct sfdp_parameter_header' describing
> + *                     the Profile 1.0 Table length and version.
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
> +       u8 dummy = 0, opcode;

explicit init to 0 not needed. With this addressed, one can add:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

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
> +               dev_dbg(nor->dev,
> +                       "Can't find dummy cycles from Profile 1.0 table\n");
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
