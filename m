Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8C3C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:24:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3C1F2087E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zFFje5ag";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="iNY0ZDoJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="m+9oM/CH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3C1F2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xP0WklwnTZxORXhytxzVhwb3SQE6VHvhUh+WBG9O9gI=; b=zFFje5agZV2bRnrU+a9wKGQwC
	NcxgdU5FJGoZNFJH0Pr10VeJ4cDagE6qoFh1fSfrMiBX5DN2XbSsq2C0yFwv6EOr/xNt9RSMUp+93
	bgq1mwmRZ/E+Byz6E4wh+SU03prRlsigVoSheaQy0n8R8jvE3javHBXpJln8KWpnn2IPIJoi9laZ4
	3Rxp5eTV4h+X8fcNbeLgkZyzrK0aJnTMXqf2GDgTjHopLox2pBmRwq1o8r0/kHBaHEDRXxDPai56y
	B9/qUSeXZZa0aIP/MeFEwNjTMbO68wFqQBrWJ3Y0Mz/pEQ8YCdr7v3IOIc4n26z0zMxtkxLorYnyx
	XevHK3fxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtsa-0001mt-0C; Thu, 01 Oct 2020 08:23:56 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtsX-0001lx-J8
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601540633; x=1633076633;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=B8J5rK2/XYJDmR7RVtKKn3wpj2o1HPPduV6zGiusOeU=;
 b=iNY0ZDoJ1FObCve4j2cnNRqWUxv7RZfYbT7kScloUbeZ958aNsBV3LcB
 vzFw5iN6CMt0fv5e5l42hyqRYuZNrxvxi/EVwYMJRaK6u39NsHDbSoGti
 cYFphnPDVEFQtp1cEhsx9ZMwr5HJacbWPXQIzBJhpgTiqCpNgE/bC/FK6
 yAZtQzTjHwdzoVBFjZgF6UazCFu+RFZlunPIl89dNcecjfbLoVqnVMWNj
 kP69oAeM4wBnBqXVV76XVnskQs7JpTlqAwSY9KziIlxwDonxlAqdEBgwh
 LUp5U/mo2wVPHW0OJxA/NxghZJiU2R9aAWEWNZBPolJxmTpseIKKPlXH7 w==;
IronPort-SDR: 3HqHglg9mfdNvMl44YogJQikBNw2pATPoDzVc9CvjAB31bzyqjlD6oAB8+y3GAwwt8Jn/OYmqZ
 uecOcgSzBTn+/2mExaS+n/dqj0H+I7liBtkVHiV9yQOSzZjKJWXCBRGUbxHyPvbfdBoM+CZ8vf
 4GE/mrgC9DkAtZ6Nm+eLr9vCxgP0HmZ3Obu4kdgRhnpOeckOHsuthgzHYamGcxm+xJaktrLR2l
 Qk/Eg9S1RvJeLN7B57tj3+WqgSHovH0TGrsbo1lwPZpKXzlQAPqIgizLO9ssLZKdsnJejVUP1W
 es0=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="97880777"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 01:23:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 01:23:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 1 Oct 2020 01:23:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQEVVUAeDf0oUQO/gkvYPJidcl8xCiUjlIv+ECBx47x+Zap2BFdknNAdmgdCMsEIxDhobHZ+aCvLwfY6GNoe87P+xrb24yKxDk0K96/LaRHsfFyEoymFf+du6psO1wDd7cGV99FJ946cJvi4uUXJteD38v3BjfvojyvkqAe3iUZ65gKS3HhxNLNmBUqylUGzaIhjqSmDyyvht4azsSxduKLH9ss8E/wf5FiH4V0sfMP0CufnbvoJckAH2ELFWplMB9bw0y06rEUCEXjIwACO5foUSiqYun5f17Lh8o5gHJFaJhp7XtbIh60DWoFqyw+y0y1eM6xAFasOkSruJCwKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8J5rK2/XYJDmR7RVtKKn3wpj2o1HPPduV6zGiusOeU=;
 b=BkuOtfhrqykfdAbeEXTwQIcvQcBxfJ7ffJ5q93Ig57ztKcSY862vAsyY3hFYXGSLXULm4O1hMAxMhg8PiFPEvGD9jxIOJtWrB0vKLA6/cY1/1A7erNn+ojZwydDaEavyG0HsfBKBfqjha+JNHfASWdwi4D+0U1bGaX6cZVnHsKLf217uCSbC3HP0Gtm+HssOz79OGlIU1MkLoIjady/GyHHSajUZxy8FZh1w+BDmUwiGyAnOXjC6I6u1x1vJdQJhHedcRmXvdsJg89pZ65Y+Ynpfq+jRpMCE1tPBPBWfRJ9FTBKsF5jRnnqJw2LulLGwIEuziErT4trn57PA3APgPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8J5rK2/XYJDmR7RVtKKn3wpj2o1HPPduV6zGiusOeU=;
 b=m+9oM/CHgeQKm4v6FiyOw3CsNUf5cr4qdt5t19Bi7ZA2QfkqtmbOXuNtjupqQM1+Hqg0bjru1CCdbW3t6mvX0NNNoHq/UU4FhdXHgexYO19QO/fc03fPPfxTXkqfq+YES3+/TJb2qL/AL4inD5mB/nk+QqtpAM3EaEUvZ09swds=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB1947.namprd11.prod.outlook.com (2603:10b6:3:110::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 08:23:49 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 08:23:48 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 12/15] mtd: spi-nor: core: perform a Soft Reset on
 shutdown
Thread-Topic: [PATCH v14 12/15] mtd: spi-nor: core: perform a Soft Reset on
 shutdown
Thread-Index: AQHWl8wvt1pUh+Hm6UeGalF6SyDG5Q==
Date: Thu, 1 Oct 2020 08:23:48 +0000
Message-ID: <c1f8eadb-640c-1299-c075-946a3aeb98a5@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-13-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-13-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 32a73576-2a60-4a8d-4bcc-08d865e3528c
x-ms-traffictypediagnostic: DM5PR11MB1947:
x-microsoft-antispam-prvs: <DM5PR11MB1947FE72D3521236E7D7CEBFF0300@DM5PR11MB1947.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qCOWuUXYwuyImxlfT1dD2xfuaQ+EDcAJN36Bdqp6KlV0RBE3NoTzXH/yY5/9Nqf0ZFvdK7YZ+9s0fRNYDABsDmDQHQppf5VV6w5i7IylcA+6/qF5hO8xdbXN6K3HjNkEBFI4CrHsUBw5KX+3vOtQCxI4fAPN/utkaW/VOIcY5zslGvmJYRk1bokWHoc2BpjJ9EufM6neYtlvdlh5mZbBPB1mdJ2+SSaXK0afBwsd0yiUPGSARPPjF+1WoE3Lr5a1753btjMQtkKpFPmPokuJ0aS5YboIBzQa2bgMhY1GAA/AndR+dhD9TgmvfO0Sq9Xz6u6DXMQxhn05W2Q5YFkj9tukxm+JiutBs7D6HlWZqkGo19qxHTKucERvitg+Hgt6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(4326008)(66946007)(478600001)(64756008)(66556008)(316002)(66476007)(71200400001)(91956017)(186003)(110136005)(2906002)(76116006)(86362001)(66446008)(36756003)(26005)(2616005)(6506007)(5660300002)(53546011)(31696002)(8936002)(31686004)(83380400001)(6512007)(6486002)(8676002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: hApl2afoJ+0WTSHQ/eNemvOrt+MPBlizVPlx5FF5QNUpdzdz9/Lq9/GrBNOxNoFckXD5lwoozhphVyAhGEJDwHaPi3U5wnSNtq+Nf0m/NOj4hjezxixslKIRa/5ReG34UgATta/KQSzdXGJzusP4ar1wuuTOHSQjwwTlFBa6D/Hekek+IC7kGFgUhh6qyGuF08Yok5Gf76oJ+pygef3yqstYlZ4XiFTLwdf5gVvrArYaHY3/TXDGEqI6m2oQ3zB1jjoKj4WfY1T1+OsuraP7ifIBmKvKXV8ptP6Ey8PjuMsOe3jSA2SNLjAFKxVNKMVfKFTAqX0hL4Fy1lkOYrODZwYiTEb1LPJ7mmuTsGBdHb1aiUTkbAQWrHaes04e9kNSUFep3VRCiuaT1saWJFa2ElPuWLX0kObbJ6i7n3V81sJYEtdtfj/KeStAiHSAFykw4XHHuIBPtA5j3EXoLdwKFRoW8hVFqSglGRlTIipuB9yRN+K3HTr6SlUMn7XNOrdxohHaHSvAJrAwzLl69LJ3neHTpFPQZMJ46mQZYU/nNRl4zd2eipz0tpHg92Cj8lDTC8QBKxe/NLldE5BLqoq00HezcrCuLabS9DwOXSXDlcK2/y1k9EB0H4q8+50qLvktwMCJ3oMxzgctKzWqTMkVjw==
x-ms-exchange-transport-forked: True
Content-ID: <3045947DFE80F3488065B1899F7573C3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a73576-2a60-4a8d-4bcc-08d865e3528c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 08:23:48.8623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fZhuf3bKdAbmPrybdj/YmaYjRX7MK3WUNGYw5KDBQ9bJURfRl5AQPqRuHH0sCmhWDASq/89+NIznyW9gk3HVGHr8XWHkEeBiNGYD4thKS3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1947
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_042353_774731_13B46660 
X-CRM114-Status: GOOD (  25.24  )
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
> Perform a Soft Reset on shutdown on flashes that support it so that the
> flash can be reset to its initial state and any configurations made by
> spi-nor (given that they're only done in volatile registers) will be
> reset. This will hand back the flash in pristine state for any further
> operations on it.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c  | 45 +++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h |  2 ++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b42d59ab2724..9de811b33125 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -40,6 +40,9 @@
> 
>  #define SPI_NOR_MAX_ADDR_WIDTH 4
> 
> +#define SPI_NOR_SRST_SLEEP_MIN 200
> +#define SPI_NOR_SRST_SLEEP_MAX 400
> +
>  /**
>   * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
>   *                        extension type.
> @@ -3175,6 +3178,45 @@ static int spi_nor_init(struct spi_nor *nor)
>         return 0;
>  }
> 
> +static void spi_nor_soft_reset(struct spi_nor *nor)
> +{
> +       struct spi_mem_op op;
> +       int ret;
> +
> +       op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRSTEN, 0),
> +                       SPI_MEM_OP_NO_DUMMY,
> +                       SPI_MEM_OP_NO_ADDR,
> +                       SPI_MEM_OP_NO_DATA);
> +
> +       spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +       ret = spi_mem_exec_op(nor->spimem, &op);
> +       if (ret) {
> +               dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +               return;
> +       }
> +
> +       op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRST, 0),
> +                       SPI_MEM_OP_NO_DUMMY,
> +                       SPI_MEM_OP_NO_ADDR,
> +                       SPI_MEM_OP_NO_DATA);
> +
> +       spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +       ret = spi_mem_exec_op(nor->spimem, &op);
> +       if (ret) {
> +               dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +               return;
> +       }
> +
> +       /*
> +        * Software Reset is not instant, and the delay varies from flash to
> +        * flash. Looking at a few flashes, most range somewhere below 100
> +        * microseconds. So, sleep for a range of 200-400 us.
> +        */
> +       usleep_range(SPI_NOR_SRST_SLEEP_MIN, SPI_NOR_SRST_SLEEP_MAX);
> +}
> +
>  /* mtd resume handler */
>  static void spi_nor_resume(struct mtd_info *mtd)
>  {
> @@ -3194,6 +3236,9 @@ void spi_nor_restore(struct spi_nor *nor)
>         if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
>             nor->flags & SNOR_F_BROKEN_RESET)
>                 nor->params->set_4byte_addr_mode(nor, false);
> +
> +       if (nor->flags & SNOR_F_SOFT_RESET)
> +               spi_nor_soft_reset(nor);
>  }
>  EXPORT_SYMBOL_GPL(spi_nor_restore);
> 
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index cd549042c53d..299685d15dc2 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -51,6 +51,8 @@
>  #define SPINOR_OP_CLFSR                0x50    /* Clear flag status register */
>  #define SPINOR_OP_RDEAR                0xc8    /* Read Extended Address Register */
>  #define SPINOR_OP_WREAR                0xc5    /* Write Extended Address Register */
> +#define SPINOR_OP_SRSTEN       0x66    /* Software Reset Enable */
> +#define SPINOR_OP_SRST         0x99    /* Software Reset */
> 
>  /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
>  #define SPINOR_OP_READ_4B      0x13    /* Read data bytes (low frequency) */
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
