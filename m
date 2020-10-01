Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7A3C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 05:36:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D6FC2087D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 05:36:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XZ6oqj26";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0vUswDy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D6FC2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2tvxHSVxiELZYVMumSX4AP6nQWasfmR+AVQbKCEMNkY=; b=XZ6oqj26Z+7ybkmygfO7jydn+
	SrjV+UoxTRcj/PZBCccgYiqoG1wVagua99YhZ0ONBYFkD4tQQWmiYn0G9ugnLpqNciMolDDQ3VBg7
	FOuQYjPsAWNjCukrb0lfke0u/yHxiIodA38g0YrZDCESbAVt2UQJpPU3abHXpftXkZGSrhzHCSUl0
	zEHYWgWYLU6xjWHhIwGse5VqMV2zO/S/OBITeeCrT+DRh0DsoaDHy2k//Q3Ce0KuA1tAmK4l1DCb6
	+vokCJ41aZsRMM0KcPOnjqhBJZ5M/I2rScHlOLZZx2hey/klatKLPLkok2zNylewWTC0muJGer4pi
	GQ/euEDYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNrFa-0006nc-JW; Thu, 01 Oct 2020 05:35:30 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNrFX-0006n4-Pr
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 05:35:28 +0000
Received: by mail-io1-xd43.google.com with SMTP id u6so5280763iow.9
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2020 22:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kRnjwY3zXuwtkmPvB2nr59HaLQ9DcYdXnCK7YwEkNho=;
 b=h0vUswDykw1wgVUzwFfPN1NjVtAgN1k7IzT+wN12LGPV5ONXF6Tl2ZF+CL+UlrD1+H
 cDHUYIvTeU2Uu7zaCicr7iQHptZfFgi/VWnT7zaYJXBWsbJPFftt1Vf3ITzGeA9pTr2L
 PeQRSsTB7Y2b6Hslxc9k81H65wdH0OdFEJTQXmq+9N9JhkPOFbUiotTNMR5TPgLyTDi8
 wivHADdT6iGWqkgvWCOFeuJmW5k0URU6KgZsDc60iHAzACHku4rICeVQUI4szJ/RIvyS
 gy3YZrYFstt+15OU2kqRTlbwkN0s1DlJM9o/jlOhbX3DUvxWyilBiOGS7vtJWPiJB1lJ
 /C2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kRnjwY3zXuwtkmPvB2nr59HaLQ9DcYdXnCK7YwEkNho=;
 b=GzmUwKe/D/1L6zwzMRUL/XfSaWgp7qU62v1O607Ci8tnLBVOxvTsSlUtO8xfMGJ/SH
 6Aed6n82LXwiZDU5/4RhFiKksDA0lMx2pg2ZSCBJIE05M9zJ4jJRbM0+ubK3EqjpqZg8
 /ujct+5qFoIqrKFf5kRZ/2eVhvjyczqbxAfGYdzazWS7bOH1A26HE5B74qntnPWkGWxD
 B/6SLHUMnqKnizuI2+O7m9GjENSsvvD7+ALRBN5goEuHKeQIE90BDNh3uYbkYG20Y47g
 jW1cEEqbd1Bl8JNZIHYALYaMAmLW71DRoHrC83Rt9LyyH55uxKP4MOwVNc/7sXOS6fVW
 sUiQ==
X-Gm-Message-State: AOAM532VUK7hto+8wZZPeP5CIDI57txTcyz6WNPZNlYGgdAFuARQkPqD
 gSSXDTV0B3xNH5ucdEYaKiAT92Z0TtWmN8M3zQE=
X-Google-Smtp-Source: ABdhPJxDHRvabrCK+mAeKw+HNCxORWPDuHAogeNkLL4gxs3IVAZapJPmnxcXVvvYy1XB2SKMdiWGI9gJvS6Sy5FUO1o=
X-Received: by 2002:a6b:4a17:: with SMTP id w23mr38921iob.73.1601530523734;
 Wed, 30 Sep 2020 22:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200911222634.31804-1-michael@walle.cc>
 <20200911222634.31804-4-michael@walle.cc>
In-Reply-To: <20200911222634.31804-4-michael@walle.cc>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 1 Oct 2020 07:35:12 +0200
Message-ID: <CAEyMn7Y3KMvFAVOk3_CFg+0D_PJrsUBA8Vw=C2E=g_gOGh8JZw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mtd: spi-nor: implement OTP support for Macronix
 and similar flashes
To: Michael Walle <michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_013527_866535_B69164CE 
X-CRM114-Status: GOOD (  32.52  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jungseung Lee <js07.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Michael,

Am Sa., 12. Sept. 2020 um 00:26 Uhr schrieb Michael Walle <michael@walle.cc>:
>
> Use the new OTP ops to implement OTP access on Macronix flashes. The
> Macronix flashes provides one OTP area which is either programmed with
> an electrical serial number and locked by the factory or is empty and can
> be locked by the user. To keep things simple and because most devices
> will have unprogrammed OTP areas, we treat both options as user regions.
> If there will actually be an ESN preprogrammed, it will appear as a
> locked user region.
>
> This was tested on a Macronix MX25L6405D as well as on a Adesto
> AT25SL321.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  drivers/mtd/spi-nor/atmel.c    |  13 ++-
>  drivers/mtd/spi-nor/core.c     | 170 +++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.h     |   9 ++
>  drivers/mtd/spi-nor/macronix.c |  13 ++-
>  include/linux/mtd/spi-nor.h    |   6 ++
>  5 files changed, 209 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 3f5f21a473a6..1688c9989c6b 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -19,7 +19,8 @@ static const struct flash_info atmel_parts[] = {
>         { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
>
>         { "at25sl321",  INFO(0x1f4216, 0, 64 * 1024, 64,
> -                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +                            OTP_INFO1(512, 0) },
>
>         { "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
>         { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K) },
> @@ -29,9 +30,19 @@ static const struct flash_info atmel_parts[] = {
>         { "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
>  };
>
> +static const struct spi_nor_otp_ops atmel_otp_ops = {
> +       .read = spi_nor_otp_read_otp_mode,
> +       .write = spi_nor_otp_write_otp_mode,
> +       .lock = spi_nor_otp_lock_scur,
> +       .is_locked = spi_nor_otp_is_locked_scur,
> +};
> +
>  static void atmel_default_init(struct spi_nor *nor)
>  {
>         nor->flags |= SNOR_F_HAS_LOCK;
> +
> +       if (nor->params->otp_info.n_otps)
> +               nor->params->otp_ops = &atmel_otp_ops;
>  }
>
>  static const struct spi_nor_fixups atmel_fixups = {
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4244f98e4948..348db19958e9 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2828,6 +2828,176 @@ static int spi_nor_unlock_all(struct spi_nor *nor)
>         return 0;
>  }
>
> +/**
> + * spi_nor_set_secured_otp_mode() - Set secured OTP mode
> + * @nor:       pointer to 'struct spi_nor'.
> + * @enable:    true to enter the secured OTP mode, false to exit the secured
> + *             OTP mode.
> + *
> + * Enter and exit OTP mode by using the command SPINOR_OP_ENSO (B1h) and
> + * SPINOR_EP_EXSO (C1h) command.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_set_secured_otp_mode(struct spi_nor *nor, bool enable)
> +{
> +       u8 cmd = enable ? SPINOR_OP_ENSO : SPINOR_OP_EXSO;
> +       int ret;
> +
> +       ret = spi_nor_simple_cmd(nor, cmd);
> +       if (ret)
> +               dev_dbg(nor->dev, "error %d setting secured OTP mode\n", ret);
> +
> +       return ret;
> +}
> +
> +/**
> + * spi_nor_read_scur() - Read the Security Register using the SPINOR_OP_RDSCUR (2Bh) command.
> + * @nor:       pointer to 'struct spi_nor'
> + * @scur:      pointer to a DMA-able buffer where the value of the
> + *             Security Register will be written.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_read_scur(struct spi_nor *nor, u8 *scur)
> +{
> +       int ret;
> +
> +       ret = spi_nor_simple_cmd_din(nor, SPINOR_OP_RDSCUR, scur, 1);
> +       if (ret)
> +               dev_dbg(nor->dev, "error %d reading SCUR\n", ret);
> +
> +       return ret;
> +}
> +
> +/**
> + * spi_nor_write_scur() - Write the Security Register using the SPINOR_OP_WRSCUR (2Fh) command.
> + * @nor:       pointer to 'struct spi_nor'
> + *
> + * This register contains only one OTP bit. The command doesn't take any
> + * arguments. In fact it _must not_ take any arugments. Otherwise the command
> + * is ignored.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_write_scur(struct spi_nor *nor)
> +{
> +       int ret;
> +
> +       ret = spi_nor_simple_cmd(nor, SPINOR_OP_WRSCUR);
> +       if (ret)
> +               dev_dbg(nor->dev, "error %d writing SCUR\n", ret);
> +
> +       return ret;
> +}
> +
> +/**
> + * spi_nor_otp_read_otp_mode() - read OTP data
> + * @nor:       pointer to 'struct spi_nor'
> + * @from:       offset to read from
> + * @len:        number of bytes to read
> + * @buf:        pointer to dst buffer
> + *
> + * Read OTP data by using the ENSO and EXSO commands. This method is used on
> + * Adesto, Atmel, Macronix and Micron SPI flashes.
> + *
> + * Return: number of bytes read successfully, -errno otherwise
> + */
> +int spi_nor_otp_read_otp_mode(struct spi_nor *nor, loff_t from, uint64_t len, u8 *buf)
> +{
> +       int ret;
> +
> +       ret = spi_nor_set_secured_otp_mode(nor, true);
> +       if (ret)
> +               return ret;
> +
> +       ret = spi_nor_read_data(nor, from, len, buf);
> +
> +       spi_nor_set_secured_otp_mode(nor, false);
> +
> +       return ret;
> +}
> +
> +/**
> + * spi_nor_otp_write_otp_mode() - write OTP data
> + * @nor:        pointer to 'struct spi_nor'
> + * @to:         offset to write to
> + * @len:        number of bytes to write
> + * @buf:        pointer to src buffer
> + *
> + * Write OTP data by using the ENSO and EXSO commands. This method is used on
> + * Adesto, Atmel, Macronix and Micron SPI flashes.
> + *
> + * Return: number of bytes written successfully, -errno otherwise
> + */
> +int spi_nor_otp_write_otp_mode(struct spi_nor *nor, loff_t to, uint64_t len, u8 *buf)
> +{
> +       int ret;
> +
> +       ret = spi_nor_set_secured_otp_mode(nor, true);
> +       if (ret)
> +               return ret;
> +
> +       ret = spi_nor_write_enable(nor);
> +       if (ret)
> +               goto out;
> +
> +       ret = spi_nor_write_data(nor, to, len, buf);
> +       if (ret < 0)
> +               goto out;
> +
> +       ret = spi_nor_wait_till_ready(nor);
> +
> +out:
> +       spi_nor_set_secured_otp_mode(nor, false);
> +
> +       return ret;
> +}
> +
> +/**
> + * spi_nor_otp_lock_scur() - lock the OTP region
> + * @nor:        pointer to 'struct spi_nor'
> + * @region:     OTP region
> + *
> + * Lock the OTP region by writing the security register. This method is used on
> + * Adesto, Atmel, Macronix and Micron SPI flashes.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int spi_nor_otp_lock_scur(struct spi_nor *nor, unsigned int region)
> +{
> +       if (region != 0)
> +               return -EINVAL;
> +
> +       return spi_nor_write_scur(nor);
> +}
> +
> +/**
> + * spi_nor_otp_is_locked_otp_mode() - get the OTP region lock status
> + * @nor:        pointer to 'struct spi_nor'
> + * @region:     OTP region
> + *
> + * Retrieve the OTP region lock bit by reading the security register. This
> + * method is used on Adesto, Atmel, Macronix and Micron SPI flashes.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int spi_nor_otp_is_locked_scur(struct spi_nor *nor, unsigned int region)
> +{
> +       u8 *scur = nor->bouncebuf;
> +       int ret;
> +
> +       if (region != 0)
> +               return -EINVAL;
> +
> +       ret = spi_nor_read_scur(nor, scur);
> +       if (ret)
> +               return ret;
> +
> +       return *scur & SCUR_LDSO;
> +}
> +
> +
>  static int spi_nor_init(struct spi_nor *nor)
>  {
>         int err;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 516c5973bf88..7ec4add17b72 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -414,6 +414,10 @@ struct flash_info {
>                 .otp_start_addr = (_otp_start_addr),                    \
>                 .otp_addr_offset = (_otp_addr_offset),
>
> +#define OTP_INFO1(_otp_size, _otp_start_addr)                          \
> +               OTP_INFO(_otp_size, 1, _otp_start_addr, 0)
> +
> +
>  /**
>   * struct spi_nor_manufacturer - SPI NOR manufacturer object
>   * @name: manufacturer name
> @@ -464,6 +468,11 @@ ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
>  ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>                            const u8 *buf);
>
> +int spi_nor_otp_read_otp_mode(struct spi_nor *nor, loff_t from, uint64_t len, u8 *buf);
> +int spi_nor_otp_write_otp_mode(struct spi_nor *nor, loff_t to, uint64_t len, u8 *buf);
> +int spi_nor_otp_lock_scur(struct spi_nor *nor, unsigned int region);
> +int spi_nor_otp_is_locked_scur(struct spi_nor *nor, unsigned int region);
> +
>  int spi_nor_hwcaps_read2cmd(u32 hwcaps);
>  u8 spi_nor_convert_3to4_read(u8 opcode);
>  void spi_nor_set_pp_settings(struct spi_nor_pp_command *pp, u8 opcode,
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index f97f3d127575..31198527f963 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -42,7 +42,8 @@ static const struct flash_info macronix_parts[] = {
>         { "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
>         { "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>         { "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
> -       { "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
> +       { "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K)
> +                        OTP_INFO1(64, 0) },
>         { "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
>         { "mx25u3235f",  INFO(0xc22536, 0, 64 * 1024,  64,
>                               SECT_4K | SPI_NOR_DUAL_READ |
> @@ -92,10 +93,20 @@ static const struct flash_info macronix_parts[] = {
>                               SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  };
>
> +static const struct spi_nor_otp_ops macronix_otp_ops = {
> +       .read = spi_nor_otp_read_otp_mode,
> +       .write = spi_nor_otp_write_otp_mode,
> +       .lock = spi_nor_otp_lock_scur,
> +       .is_locked = spi_nor_otp_is_locked_scur,
> +};
> +
>  static void macronix_default_init(struct spi_nor *nor)
>  {
>         nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
>         nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
> +
> +       if (nor->params->otp_info.n_otps)
> +               nor->params->otp_ops = &macronix_otp_ops;
>  }
>
>  static const struct spi_nor_fixups macronix_fixups = {
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 081dbd386944..04195d3e43b8 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -95,6 +95,12 @@
>  /* Used for Macronix and Winbond flashes. */
>  #define SPINOR_OP_EN4B         0xb7    /* Enter 4-byte mode */
>  #define SPINOR_OP_EX4B         0xe9    /* Exit 4-byte mode */
> +#define SPINOR_OP_ENSO         0xb1    /* Enter secured OTP mode */
> +#define SPINOR_OP_EXSO         0xc1    /* Exit secured OTP mode */
> +#define SPINOR_OP_RDSCUR       0x2b    /* Read security register */
> +#define SPINOR_OP_WRSCUR       0x2f    /* Write security register */
> +#define SCUR_SO                        BIT(0)  /* OTP factory secured */
> +#define SCUR_LDSO              BIT(1)  /* OTP user lock-down */
>
>  /* Used for Spansion flashes only. */
>  #define SPINOR_OP_BRWR         0x17    /* Bank register write */
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
