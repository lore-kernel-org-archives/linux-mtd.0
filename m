Return-Path: <SRS0=dEjv=AT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E7EC433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2020 16:03:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36FC020672
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2020 16:03:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TjMEx4aD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wTUxoDNG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="DGyedqbR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36FC020672
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9F61ZKVtmYGWeRp5SI1mxbkyPOV0F0pzM8u2wdNGhMU=; b=TjMEx4aDgupthhD/xKTmxGd7g
	2fIms1sSbCrrplq0PAeIb+Rrtvfy3pm4T+QeoZaPfzodf6SqRfW5dwUOXRhfGwHAEBDCxl/yAVxJg
	g1FaOQdCDwJclTGjsTaEGu/Mzk95CqE/c9UsU6rUzrq5aiyeISU2U2hEzco3rVjkOHgy0BNVx+0pz
	Bhzhvt+VUE8chPQ1rvkbpsXlizkCO73bC7Sbdwb2asFGHCyWWPgWyUXjFm5Fm5ZA1xd1qof5gp8pJ
	BY8jmxhKYt2+tGpQBjTBRAjvf4Qtg1MqRsHKmfJNk+eJzmW6ZHjZaLJxNEwbfAj6OkLQOyqMVMNnG
	S0TLFPtRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtCVz-0004s3-DS; Wed, 08 Jul 2020 16:01:43 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtCVp-0004pM-UC; Wed, 08 Jul 2020 16:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594224093; x=1625760093;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Zooil8Fa39PLjNpBZoVfQf48GlQVSo48/GUAQkGKPRM=;
 b=wTUxoDNGIKrWlxoICgtbevPt4bWQ5X7EW/dTsQSTmpsA9UIYcT4+YlqC
 n/paMAjUpFOKdXnYjr//vrFcjqfRZyvlpZCz0O3Zw0NvcGptuv1OrA94M
 ONibWzBr6UVyE6KNiubtsLknkiNNwDD2MiW0nV8s8uage5FMb5byt08m2
 7GW0XusrraD69/AM9USkdrLG1wDFHYUVOrnuYGbByJ7AAvooWm1w8aB5+
 2K5g48KbxHqu6kmP6S60+LvlqZYb5hq/V4DaZXTPsxo0R10Gi8R8toxbf
 nP0hUb7ifSYozEZJHUOSwG35zk8a9eiT15RY7KtACpwgvcr922XMwhEMI Q==;
IronPort-SDR: 3nTTPDkO0x7mETyDuZ651sLgQcocLpiGtH8el7kpmiJf2QvvB+vgp3OSbOK3aXRnt4Y7CwQOwz
 VX/aWIgu33lOpoF/8ZzEB0bY6j/SVIeNb782GBBIbRsqZSS7cNz/aVPYXNX/AW//oSqQuSkvlD
 /RUAKvXIdj4VFSDzaUJ++o8rjqHNQ/gD3Yg7utadzTbw1I3uJnMu97btWTFefak7xG+XlKbqED
 U1uWHEV46IO0BT3+faQ/HL+w/cYQJmlLvBekt/+s4wKSfW4/ew9LrPAGobjfgg90FOGdd2bsg8
 wQE=
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="79168446"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Jul 2020 09:01:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 8 Jul 2020 09:01:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 8 Jul 2020 09:01:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LONesP+nPpzpzRJ79V/7GTReoMOqW+dxQpuomx+XcDIFmJdjIv75OGqTdNLVU+teMNQYgCP1s+RWj7ZiK9mYkOTM0DrkoiTc8/pygdCP/DOSHxEZ9NUZQYyr5qvO73c7uXum3HwKFGnhIVG97RzWi0FQLbT6nbRyw96WnEgCPY1B3Jev4Rtm3dlMiL5evKLOGkesYZeSMimfOiLuiH/lSZV0lNrD+RYj7s3HALyB9EsY8Wg3uihIrNJlWg3zE0kUBvh/wq9+tn01XG38S2eZJOghkF0N6PSK8l/MYYaOplhUFa3BvrQ5ILipdRDUu/qmO8YSm7PMoGUWnpdIR2FJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zooil8Fa39PLjNpBZoVfQf48GlQVSo48/GUAQkGKPRM=;
 b=DLOoB3k7tZIgEEdErCnnaCs/hT6kDzV13RJJAPK3rkefLGwQ76mHTPfU9Bv0lpzIDj3eieOpxWWem8IEIp34NbwNA4HV0agmb/+HojY1f5E9P7dIlcxsfhwCllPB+PNdfvyLdLcIvOguQ2g40viyARQWeViNRsAU0imOH6jkH8iL2+E26h+V5OcRm62wZspSyeUYyfMzqCL6Ho7vYPG3QSBwVIFuOWstYFIFKkkFh8IjnsyxTt+Qip9SJYxGP+61odbETwx+lc7DvFJVIp5gmUxQaNk3zpYqn0UvDKRRK4ntKJDBesR8kWUZT03sU4X6oJb8Ou2YVjVnFzYjZRzc/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zooil8Fa39PLjNpBZoVfQf48GlQVSo48/GUAQkGKPRM=;
 b=DGyedqbRM8yRjRKhHeAPczHDD2ocLt7tAc8Nz6941DhuXSSoetTjC+zlZnckjqjcYUNMf0phsiqRyPViw3uDRl5lI5gQ7k9vXcmoHBJULjd0KIXzc4hOng0TqNc0XyTHUpq0+UTfirW3dg/9ItGjnLAE5mwzfkgG8wzQZOmGfdU=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB2614.namprd11.prod.outlook.com (2603:10b6:a02:cc::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Wed, 8 Jul
 2020 16:01:25 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 16:01:24 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 07/17] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Thread-Topic: [PATCH v10 07/17] mtd: spi-nor: sfdp: parse xSPI Profile 1.0
 table
Thread-Index: AQHWVUEGfUdvTIz7TkOxCl2iJPk10w==
Date: Wed, 8 Jul 2020 16:01:24 +0000
Message-ID: <1450d8c8-cda4-51e3-9f57-0b2f00825f11@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-8-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-8-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64740340-2876-48c1-b87c-08d823582a7e
x-ms-traffictypediagnostic: BYAPR11MB2614:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2614A03FB16107FA66426AE7F0670@BYAPR11MB2614.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V0gYoG5ct221r7cdF1+ii2RsTXJhau+8LI8058UnsebEwEoqImtzOFd7g2zReJz/zs+i5x2/v/uFF93AW6wMgCEFzmoQrFRRCHUM9pQ7MS+37nUTdBYNUKHgGvCo+lTRBT//6OkKdjSQTshnjNF5B2fi9UxISYy+o4sDzj56HCPH1XQI0VbFwNqqsQhiNfS6DVWZzastbpvKfhQ/Aysc2cKMO81qBinZhwfq9shixEgrpEQM/tpoZJGxXLI4EO9iytk7iLUw+Xr3yQ33XLAwrhhbAO5matpru+RpQbcYISpe4Ky5nTg0TQ3J/ZyLHtU5IIeHq68egnfuSx1Aphoz4/o3FQkh77xu5pQ+MqNwqhggHQfkcBKJuV+YtYPoE7SHD5bHRO31InEX/eQesqiD0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(396003)(39860400002)(136003)(366004)(66476007)(64756008)(66446008)(66556008)(2616005)(31686004)(6512007)(5660300002)(26005)(7416002)(4326008)(76116006)(91956017)(186003)(66946007)(31696002)(36756003)(6486002)(71200400001)(2906002)(53546011)(110136005)(6506007)(83380400001)(86362001)(478600001)(8936002)(316002)(8676002)(54906003)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: stHZk2gUv6cEH0DX2G7P5gMI9DJJTip/lacjG+XG7mI/rL6rfvDSPi8QGphZqSWGrGqcPV5Ux2X4VXkPGFX1lRZInPud72A+DaLPWAqnVTymgqG/2lYgo0RtNCtbsB7ngqPDRrosGDTxguieFcbG5XBdRxy9YJtYR6JWj3CJjvGRY8jbsiFaIkn3PfAaKk7HZfv14pbDZwSgmDKTXroVVML5szZ6zQhRjrpArtoOCf/0Ka2ZV5ry4RNLCok6KeUOd0aVyMna+McHp225QMhYCp4rt+Y2VBZtUxOJ/mKly1dN0DW4MlwqqV3Y9Y1NnKXrnu28Wnb0ymIVfCFOEsjnAZAZtUZ6WgrDipGBZxBDrIJrpkDn15Prf2TcShI5XkO0a9XBXJR+Y4itZCVOVMOiEdNfsC3bVcrvtT7O3x31Tp/vdvUwD9u0p++ytOM2Pyr4199qIvW4Wxhn13o+vN7eoEOHQcoYmfjf9GHQL3Z20Sk=
Content-ID: <0A4037F0980F2547997BC0491AC600B3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64740340-2876-48c1-b87c-08d823582a7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 16:01:24.8857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4I2zAjkwcIuwV0QSS7PDl3C6nPoSVbLkJuJ30h/sD3BkXPx31NQlA/1St5mX8XU9xorVFCgg5+KXAjUuzbLjS/mMBZ2AmT7xFG0nWIVBCRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_120134_379248_14CB80E4 
X-CRM114-Status: GOOD (  25.38  )
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

On 6/23/20 9:30 PM, Pratyush Yadav wrote:
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
>  drivers/mtd/spi-nor/core.h | 10 ++++
>  drivers/mtd/spi-nor/sfdp.c | 98 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 109 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 22a3832b83a6..7d24e63fcca8 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2355,7 +2355,7 @@ static int spi_nor_check(struct spi_nor *nor)
>         return 0;
>  }
> 
> -static void
> +void
>  spi_nor_set_read_settings(struct spi_nor_read_command *read,
>                           u8 num_mode_clocks,
>                           u8 num_wait_states,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index de1e3917889f..7e6df8322da0 100644
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
> @@ -424,6 +429,11 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
> 
>  int spi_nor_hwcaps_read2cmd(u32 hwcaps);
>  u8 spi_nor_convert_3to4_read(u8 opcode);
> +void spi_nor_set_read_settings(struct spi_nor_read_command *read,
> +                             u8 num_mode_clocks,
> +                             u8 num_wait_states,
> +                             u8 opcode,
> +                             enum spi_nor_protocol proto);
>  void spi_nor_set_pp_settings(struct spi_nor_pp_command *pp, u8 opcode,
>                              enum spi_nor_protocol proto);
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 3f709de5ea67..d5a24e61813c 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -4,12 +4,15 @@
>   * Copyright (C) 2014, Freescale Semiconductor, Inc.
>   */
> 
> +#include <linux/bitfield.h>
>  #include <linux/slab.h>
>  #include <linux/sort.h>
>  #include <linux/mtd/spi-nor.h>
> 
>  #include "core.h"
> 
> +#define ROUND_UP_TO(x, y)      (((x) + (y) - 1) / (y) * (y))

you can use round_up()

> +
>  #define SFDP_PARAM_HEADER_ID(p)        (((p)->id_msb << 8) | (p)->id_lsb)
>  #define SFDP_PARAM_HEADER_PTP(p) \
>         (((p)->parameter_table_pointer[2] << 16) | \
> @@ -19,6 +22,7 @@
>  #define SFDP_BFPT_ID           0xff00  /* Basic Flash Parameter Table */
>  #define SFDP_SECTOR_MAP_ID     0xff81  /* Sector Map Table */
>  #define SFDP_4BAIT_ID          0xff84  /* 4-byte Address Instruction Table */
> +#define SFDP_PROFILE1_ID       0xff05  /* xSPI Profile 1.0 table. */
> 
>  #define SFDP_SIGNATURE         0x50444653U
> 
> @@ -66,6 +70,16 @@ struct sfdp_bfpt_erase {
>         u32                     shift;
>  };
> 
> +/* xSPI Profile 1.0 table (from JESD216D.01). */
> +#define PROFILE1_DWORD1_RD_FAST_CMD            GENMASK(15, 8)
> +#define PROFILE1_DWORD1_RDSR_DUMMY             BIT(28)
> +#define PROFILE1_DWORD1_RDSR_ADDR_BYTES                BIT(29)
> +#define PROFILE1_DWORD4_DUMMY_200MHZ           GENMASK(11, 7)
> +#define PROFILE1_DWORD5_DUMMY_166MHZ           GENMASK(31, 27)
> +#define PROFILE1_DWORD5_DUMMY_133MHZ           GENMASK(21, 17)
> +#define PROFILE1_DWORD5_DUMMY_100MHZ           GENMASK(11, 7)

we should order these macros in a consistent way. I see that previous macros
are declared in order starting from MSB to LSB.

> +#define PROFILE1_DUMMY_DEFAULT                 20

we need to explain why the default dummy value is 20.

How about declaring all these macros immediately above of spi_nor_parse_profile1()?

> +
>  #define SMPT_CMD_ADDRESS_LEN_MASK              GENMASK(23, 22)
>  #define SMPT_CMD_ADDRESS_LEN_0                 (0x0UL << 22)
>  #define SMPT_CMD_ADDRESS_LEN_3                 (0x1UL << 22)
> @@ -1106,6 +1120,86 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>         return ret;
>  }
> 
> +/**
> + * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
> + * @nor:               pointer to a 'struct spi_nor'
> + * @param_header:      pointer to the 'struct sfdp_parameter_header' describing
> + *                     the 4-Byte Address Instruction Table length and version.
> + * @params:            pointer to the 'struct spi_nor_flash_parameter' to be.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_parse_profile1(struct spi_nor *nor,
> +                                 const struct sfdp_parameter_header *profile1_header,
> +                                 struct spi_nor_flash_parameter *params)
> +{
> +       u32 *table, opcode, addr;

s/table/dwords?

u8 opcode?

> +       size_t len;
> +       int ret, i;
> +       u8 dummy;
> +
> +       len = profile1_header->length * sizeof(*table);
> +       table = kmalloc(len, GFP_KERNEL);
> +       if (!table)
> +               return -ENOMEM;
> +
> +       addr = SFDP_PARAM_HEADER_PTP(profile1_header);
> +       ret = spi_nor_read_sfdp(nor, addr, len, table);
> +       if (ret)
> +               goto out;
> +
> +       /* Fix endianness of the table DWORDs. */
> +       for (i = 0; i < profile1_header->length; i++)
> +               table[i] = le32_to_cpu(table[i]);

le32_to_cpu_array(table, profile1_header->length);

> +
> +       /* Get 8D-8D-8D fast read opcode and dummy cycles. */
> +       opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, table[0]);
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
> +       dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, table[3]);
> +       if (!dummy)
> +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, table[4]);
> +       if (!dummy)
> +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, table[4]);
> +       if (!dummy)
> +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, table[4]);
> +       if (!dummy)
> +               dummy = PROFILE1_DUMMY_DEFAULT;
> +
> +       /* Round up to an even value to avoid tripping controllers up. */
> +       dummy = ROUND_UP_TO(dummy, 2);
> +
> +       /* Update the fast read settings. */
> +       spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
> +                                 0, dummy, opcode,
> +                                 SNOR_PROTO_8_8_8_DTR);
> +
> +       /*
> +        * Set the Read Status Register dummy cycles and dummy address bytes.
> +        */

the comment can fit in a single line

> +       if (table[0] & PROFILE1_DWORD1_RDSR_DUMMY)

I would move this above, where opcode is parsed from the same dword

> +               params->rdsr_dummy = 8;
> +       else
> +               params->rdsr_dummy = 4;
> +
> +       if (table[0] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
> +               params->rdsr_addr_nbytes = 4;
> +       else
> +               params->rdsr_addr_nbytes = 0;
> +
> +out:
> +       kfree(table);
> +       return ret;
> +}
> +
>  /**
>   * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
>   * @nor:               pointer to a 'struct spi_nor'
> @@ -1207,6 +1301,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
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
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
