Return-Path: <SRS0=dEjv=AT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96DFC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2020 16:04:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E9520672
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2020 16:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uekSCkuw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="M3lslppQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="IuwNzazA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63E9520672
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NGyM7IAHSJUizoVcwc6aIL12sazrm7PIC8157v1iiPg=; b=uekSCkuw05ZrKhw6wTw1UZ1Cf
	MkudxWUBU6NK8GjxmKph4ZI904bHV6KvLtFQMZw7B6aiX62a5G3zXbQe+AIaXH1ri2DrtIIRUQMTM
	MPZenomqX2zlbr/Bh4mln1/4P5XMwOEpn71lKxwiTSuUMA5Jt71AbkQ7hLVuaCqh0AKM620JKqIu7
	gQs3xMreX3Y/bFWFr1R16ERNhJsZ3qLzroobP6W0jI5GhVNMOV1NVkPxwkul5ZNnA3OVwpYv5R2+5
	Jd9YZLaXwHZw1nu8R/x7mHnKh3Yp1/CemoMHkBCRcQGZ/DfhVZBnWf+U0ohyHO+CE7rYig/gehcU+
	EYj9fSt+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtCY8-0005UD-Ck; Wed, 08 Jul 2020 16:03:56 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtCY5-0005Sr-In; Wed, 08 Jul 2020 16:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594224233; x=1625760233;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AnErN4u1RKf/uAJ2hPXwE332+8yg//KZ+Posz3vV5Ew=;
 b=M3lslppQHz2gM80YET6ztKp1MZBjUi6KJdN6APx4MtEs0AGkTKywJKHi
 hcoxmTgssIu18hhVxgo7ZegtRg8nnJ0ozqv9bNtBE9s/y/Bs8kinfKUYa
 TsgAFrUNWh7FyzGjI9OCOFpGVZ+mBk8M8CHBoPqHIRAr0rClEn7JWUn6/
 TfEo0YtPP9PPg4jZye12cUSPuuDNj4tFnaNB5u6gfQiiQOIBL2MtGbz1r
 U8nLnhrqNOm8BnqPdj8NRc3m91KpSH39FlqkHRwFU3zvG2wIFl2O58g2O
 mWjMIEw/cY2aBOz8hwqRm24oQS+1DGBnQu/NwcAQ/N8P/LrBr/1XyasS9 Q==;
IronPort-SDR: olXbXUk8CbIM2J11neeomo8fEqaQ6y5SedBrWoH3grAA6CYNqSmyHhQYndwZSzGLGFm5W9x7zh
 uk8ZdtICFbdalhObI+rSvfkeArQmRt3IXDlETwsUO10R38BthE2y/YffTJ+S+FkSFkIlCszhbT
 lCpd9ODw+mTGYw6JlDqLx/nvZS0Ae/2/DEn0kcSTF+MpnOIErHV3bPe472QmJU9D0Vb/I5D9P2
 mkHUWB3wSNYUZcGY4t0RGKyHEaE7ef0Vlv0lP+yqXCBJ4RtdjPI9LhjwrnyHvJXDeTXOHF5Ixz
 3YU=
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="79169684"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Jul 2020 09:03:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 8 Jul 2020 09:03:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 8 Jul 2020 09:03:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR/fnwTPgmSKb+b13eGHpieaZMQoYhYJKpRSBSU2d92w0JDkteYVKY7MCE4K7AjftAJCTm5HNZ1c1268l5BAIFlgY9DtrPqZynHEAv1cpVhuS1N7Gf6UKrHwxTe3NjDDo0elAYQCAPx6SCoyW+Uir+isvSQczg8Ck79M9H7Sus9b/osnj9QkrHXgD8MlI23It2LZVnqbDjfmK7/Zqht3MMhjNX+4nDe09u2SKwKABs5UZobKGVr9aPgvY3wHUULgY0Dks4a+5MNcQeGJg97vIH3oUTp97LctF+6D4Q1aTJowVWzx2dQfaHRPIq3fTUJUCQTPBgZXgPFJNilqqZV6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnErN4u1RKf/uAJ2hPXwE332+8yg//KZ+Posz3vV5Ew=;
 b=PEhlF4L/PSQ0Kb/1t9B7aJGdFdbKqCUPSA3RATGo0Mp5Waxr/YcU13GhyfeRUAmjcy+Bn1Uy4rwTIwxFoUOm/38HW8kXVhpx/LuBvCarC65tU05fG2hmkDU8IqCEmuYe+PQi3JbeHT9fJOxlzCnQ8nLkVJDnKmcQiWbHAeZiGJkC4vdSv+n5h0Ck5QhGS53+mH/5LSmrH44HeBE5FNLJpwjaMBZpcp26r5E7XjYVM9eLS78cHN0FG9DSdvyLopQkS/7/CoxyUMZud8P2S3gL4LxJRmL5ycwK8eFfd6net0hbsK5zwriR0InP5DbuuXGLr8+ajmANBNpcPtAqBKk9EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnErN4u1RKf/uAJ2hPXwE332+8yg//KZ+Posz3vV5Ew=;
 b=IuwNzazA/lKysCRZhhjNjbJJAMUim63+f41L5ByrWo2FGhgmUBa6ZhWzw6P6seX+JxYXiFKbI5m5FSC1A0qi2asyjoy+Z8XF5bmg6sWdpbWkHSUKHskseZ7Jg3ph/W9x5K1sXaqPkNQ2APAupgVTXovwObmxtl7sTUJ/jNoeONQ=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BY5PR11MB3958.namprd11.prod.outlook.com (2603:10b6:a03:18e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Wed, 8 Jul
 2020 16:03:47 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 16:03:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 08/17] mtd: spi-nor: core: use dummy cycle and address
 width info from SFDP
Thread-Topic: [PATCH v10 08/17] mtd: spi-nor: core: use dummy cycle and
 address width info from SFDP
Thread-Index: AQHWVUFcjtrXlk7Bh0yQOzcibPIurg==
Date: Wed, 8 Jul 2020 16:03:47 +0000
Message-ID: <d4b5178e-debb-1397-caae-f20086f5c3fc@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-9-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-9-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 488e016b-bd31-4fe4-ad22-08d823587f83
x-ms-traffictypediagnostic: BY5PR11MB3958:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB39582C230037EB49E77EC04CF0670@BY5PR11MB3958.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: niKiimRN7BdP7CxVJmd2YDcfqW3VEwxH8epZujYhRC1J0EvwkknB0mh9TQshPG5zC1BjMgc5+uzg9hPyJHBqGCbpAziS3k6nivOKnLID6looKjbkB7BRqUdSoUjgZXeotAgBud5dswRTL+WiYR4NMKZcamp2e/hD8ZHvj4TJZV9pL5Dgrd+r6BH6F/3HBWhKRDL8I5M/mkgF/8uEmCwzKaqcv958BIIGFivMQRLftanr26gTfRQ2cFcAqX4Fs8AGcYMqx6v7liutdLO+XfI8FAYWwLs4k6+x6RO/q9wfENwptzJ4Qb092F10NbAnEuxIrHb2HlFixiswc2YdaHs1ZyGavPAS4iL0IVa7uHEaoBJxzVTXU3YhZNlpaQLhSL1wa2AT7RJaDpHle8JGvUTWGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(39860400002)(396003)(376002)(346002)(110136005)(316002)(6486002)(8676002)(2616005)(71200400001)(8936002)(478600001)(91956017)(66556008)(66476007)(5660300002)(64756008)(66446008)(66946007)(76116006)(31696002)(2906002)(186003)(4326008)(26005)(7416002)(6512007)(31686004)(83380400001)(86362001)(54906003)(36756003)(53546011)(6506007)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: fDa+Ctj2hKV1gmG1otu9xIUaLhr2ivl/o3VTVcsddrpercky8eXHlvkzmfpYSG7AGnS+zuYbo5SqSXBZ8clEt0/8jXuemYbLBHm59KULw7jN9WSiWd70+KruZlzzgxcUekRXcPDlSzmihC5kcQjB84fYlJ7X002DghTW8bbZnh7BVSs/OS8oyiicS+7xdD4c2T3DXR3eCgF1HjF/7DgcSMypO92JwS+JZir+frvwkxcjej+rQUSQRlIOFTXapXIaZW+FTTnKMg739lz8hjv1HEaouRH0Z+UPC7HqXhu0D4lUrdT+M86KRZlZt3vYgq7Gu9rP9XlkUoAwSUuY2LmQF6aotuvFBS56RNONkQ9/c1QjN4lT+KsYdo6GlhNWD1/0oUtHDnXxZ7SBQWcP8c6FN5EEdoM4Cz4TIp7V70PjU2OGB49sRTt5+HxAXnHV/pwTdbnwYZzxs3WoeIGCtSo1SuzTE7P8DJEMDc7EyIkeynU=
Content-ID: <52858E4A70C6AF4F9B260B65206915F7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488e016b-bd31-4fe4-ad22-08d823587f83
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 16:03:47.5255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6frkT+Y0NL6XnX+0s5WCFLWOB/ettI8UOqv0bDfxt9HtJ9PaVge/j5dQFbRL3IbgdL1fJOz9C99NAyiESrLlAOzDHdzI+KRDFl/fazqjJUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_120353_798752_E7DA6E3E 
X-CRM114-Status: GOOD (  18.66  )
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
> The xSPI Profile 1.0 table specifies how many dummy cycles and address
> bytes are needed for the Read Status Register command in octal DTR mode.
> Use that information to send the correct Read SR command.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 7d24e63fcca8..f2748f1d9957 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -357,6 +357,8 @@ int spi_nor_write_disable(struct spi_nor *nor)
>  static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>  {
>         int ret;
> +       u8 addr_bytes = nor->params->rdsr_addr_nbytes;
> +       u8 dummy = nor->params->rdsr_dummy;

no need to introduce local variables for a single dereference

> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> @@ -365,10 +367,21 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_DATA_IN(1, sr, 1));
> 
> +               if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
> +                       op.addr.nbytes = addr_bytes;
> +                       op.addr.val = 0;

isn't addr already initialized to 0?

> +                       op.dummy.nbytes = dummy;
> +               }
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
> -                                                   sr, 1);
> +               if (spi_nor_protocol_is_dtr(nor->reg_proto))
> +                       ret = -ENOTSUPP;
> +               else
> +                       ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
> +                                                           sr, 1);
>         }

doesn't this belong to a previous patch?

> 
>         if (ret)
> @@ -388,6 +401,8 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>  static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>  {
>         int ret;
> +       u8 addr_bytes = nor->params->rdsr_addr_nbytes;
> +       u8 dummy = nor->params->rdsr_dummy;
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> @@ -396,6 +411,12 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_DATA_IN(1, fsr, 1));
> 
> +               if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
> +                       op.addr.nbytes = addr_bytes;
> +                       op.addr.val = 0;
> +                       op.dummy.nbytes = dummy;
> +               }
> +
>                 spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
> --
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
