Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1872FC3600C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CsrdbxOjIrR/mWUmMvJF06zUcgm7yqBgMJo+zmcKldA=; b=bFfcT0rt1dtOCv
	DoXqKLBNuZ6QbhD8A8BQCoSDnhS12hFBdq9hqOD24HAbGNTB1rsH4YUC8wfYt1cJIJ9yhTyHb/QbZ
	vM1m/ti2C2NzEDXkfNU+xvIhNUX3TrVJ3o1IJkFT6/o54bU1uNp4rgzpGVtfafdJxv2pFmEisdtM5
	Uda0dbjqoeYHILfdhTv7K+pTWg5Wsh/6e5sryJkOv7Dm0ghMIni+RaK/wooxnkGgUbYz20Z38C+AQ
	e4dP2KtTAnvZs/wLby52yUpaqQodTlYerTwLVN5IpZh6yGBl1lnY1FQw7GeX9xfGk7r8saoP4SPfd
	ogIb6wWm6atliAWad2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqVWf-00000005wwz-2meM;
	Tue, 17 Sep 2024 10:33:41 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqVVu-00000005ws9-38BX
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 10:33:39 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5c2561e8041so5001148a12.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2024 03:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726569173; x=1727173973; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=urw93t9dgeqJfpnW0Vddrv1JySfFGP+z7gLlYb3sLUw=;
        b=e+jLrrGelcOZI8dnkowbmacyRvoypkGDwyrKiLvnxPdZ34ZTafI+f7af1Cb8zfTIen
         v2+XvuRqDURwfLZ+RQ82kDzYwHNsOu26rwNFoaBPV4obcGxr0gy0/qiqLyHNCiGa4L6Z
         Vqhmx/+Abp1P+E3LCATBBYeog1W7tMG6aYYlrOeVCWpA6WsgKPUQYPdiSIC6AHHdDQd3
         15OZG3pzsTPcOV+K6tL4FJO76Xz2FiZQOZ7/WQjKWoLmSTfQQ8DiHO35RrzLdztU0Z0a
         VbPFZQ9PtbWhW5z0ubTH6XPPdj8pOYMTfuzR4sn2CY7WCpF70Ed8dv9ls47QyXm+vbK5
         H+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726569173; x=1727173973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urw93t9dgeqJfpnW0Vddrv1JySfFGP+z7gLlYb3sLUw=;
        b=UkZ71eLgU3Zx9qg/46I4ogYDSH1OoLi0a5pDvTiFEoo3gn6si4B0u3NOabccPNQX4h
         NK/ecC/a4HXcOq0ur6dSCFg0ZzrkhkwzJGhsAI2rRFJOZpcSu00JY0OVHaGPTjPJT1JF
         uWfmRzicGBpCvwZR/u9UJuzqLj/9Lvxh1JxCHpCAXX3QBJEP/m53AN6ugm8KwRqgX35s
         HjGcfC29qe7RkynXwvZz+d6WhMl9GhErWvSG7qp9RHSudKpa9PnzvaDS/ABN63ED98rC
         6w00NT/lLKhkNIlfMYhcIHzIJKcp1G2r9lwm3S6/RGqUP3JIWsSCYkMk/UGIQMbmInSl
         wFKg==
X-Gm-Message-State: AOJu0YyRoMm3QE2UVOBo6tpWgMhpk+rH6SlWEebU3caYzKoqTqYxRydY
	h/lg86EmRi1w/kfKBk/OWb42m5Qif97K0iTjGrw0X6qxjbNuPhZceaKucZVxhkzzMPDB9rSfbcH
	NzKV5Qh1H3zWTdo7xQikivgM0Ig1kqUTreg==
X-Google-Smtp-Source: AGHT+IHzw0PEUSjwbeoB50lNCJxhRmwmchGr8DJxZWRkSMgFxsN/7POvekxN1y4jscottow7M2YGBODgeFPz5dPsdLc=
X-Received: by 2002:a05:6402:278b:b0:5c2:6d16:ad5e with SMTP id
 4fb4d7f45d1cf-5c41e1906e8mr12620913a12.19.1726569172271; Tue, 17 Sep 2024
 03:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240917094956.437078-1-erezgeva@nwtime.org> <20240917094956.437078-5-erezgeva@nwtime.org>
In-Reply-To: <20240917094956.437078-5-erezgeva@nwtime.org>
From: Erez <erezgeva2@gmail.com>
Date: Tue, 17 Sep 2024 12:32:15 +0200
Message-ID: <CANeKEMNouQi+L8qUjayaNwyWwi6v=4PsX+VcgqiJgz4z9S91hQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] mtd: spi-nor: macronix: add support for OTP
To: Erez Geva <erezgeva@nwtime.org>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_033254_819169_99B34C82 
X-CRM114-Status: GOOD (  27.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 17 Sept 2024 at 11:50, Erez Geva <erezgeva@nwtime.org> wrote:
>
> From: Erez Geva <ErezGeva2@gmail.com>
>
> Macronix SPI-NOR support OTP.
> Add callbacks to read, write and lock the OTP.
>
> Notice Macronix OTP do not support erase.
> Every bit written with '0', can not be changed further.
>
> Notice Macronix OTP do not support single region lock!
> The locking includes all regions at once!
>
> Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 167 +++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h    |   9 ++
>  2 files changed, 176 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index ea6be95e75a5..02aa844d641b 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,162 @@
>
>  #include "core.h"
>
> +/**
> + * macronix_nor_otp_enter() - Send Enter Secured OTP instruction to the chip.
> + * @nor:       pointer to 'struct spi_nor'.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int macronix_nor_otp_enter(struct spi_nor *nor)
> +{
> +       int error;
> +
> +       error = spi_nor_send_cmd(nor, SPINOR_OP_ENSO);
> +       if (error)
> +               dev_dbg(nor->dev, "error %d on Macronix Enter Secured OTP\n", error);
> +
> +       return error;
> +}
> +
> +/**
> + * macronix_nor_otp_exit() - Send Exit Secured OTP instruction to the chip.
> + * @nor:       pointer to 'struct spi_nor'.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int macronix_nor_otp_exit(struct spi_nor *nor)
> +{
> +       int error;
> +
> +       error = spi_nor_send_cmd(nor, SPINOR_OP_EXSO);
> +       if (error)
> +               dev_dbg(nor->dev, "error %d on Macronix Exit Secured OTP\n", error);
> +
> +       return error;
> +}
> +
> +/**
> + * macronix_nor_otp_read() - read security register

Sorry, it should be "read OTP data".

> + * @nor:       pointer to 'struct spi_nor'
> + * @addr:       offset to read from
> + * @len:        number of bytes to read
> + * @buf:        pointer to dst buffer
> + *
> + * Return: number of bytes read successfully, -errno otherwise
> + */
> +static int macronix_nor_otp_read(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
> +{
> +       int ret, error;
> +
> +       error = macronix_nor_otp_enter(nor);
> +       if (error)
> +               return error;
> +
> +       ret = spi_nor_read_data(nor, addr, len, buf);
> +
> +       error = macronix_nor_otp_exit(nor);
> +
> +       if (ret < 0)
> +               dev_dbg(nor->dev, "error %d on Macronix read OTP data\n", ret);
> +       else if (error)
> +               return error;
> +
> +       return ret;
> +}
> +
> +/**
> + * macronix_nor_otp_write() - write security register

Sorry, it should be "write data to OTP".

> + * @nor:        pointer to 'struct spi_nor'
> + * @addr:       offset to write to
> + * @len:        number of bytes to write
> + * @buf:        pointer to src buffer
> + *
> + * Return: number of bytes written successfully, -errno otherwise
> + */
> +static int macronix_nor_otp_write(struct spi_nor *nor, loff_t addr, size_t len, const u8 *buf)
> +{
> +       int error, ret = 0;
> +
> +       error = macronix_nor_otp_enter(nor);
> +       if (error)
> +               return error;
> +
> +       error = spi_nor_write_enable(nor);
> +       if (error)
> +               goto otp_write_err;
> +
> +       ret = spi_nor_write_data(nor, addr, len, buf);
> +       if (ret < 0) {
> +               dev_dbg(nor->dev, "error %d on Macronix write OTP data\n", ret);
> +               goto otp_write_err;
> +       }
> +
> +       error = spi_nor_wait_till_ready(nor);
> +       if (error)
> +               dev_dbg(nor->dev, "error %d on Macronix waiting write OTP finish\n", error);
> +
> +otp_write_err:
> +
> +       error = macronix_nor_otp_exit(nor);
> +
> +       return ret;
> +}
> +
> +/**
> + * macronix_nor_otp_lock() - lock the OTP region
> + * @nor:        pointer to 'struct spi_nor'
> + * @region:     OTP region
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int macronix_nor_otp_lock(struct spi_nor *nor, unsigned int region)
> +{
> +       int error;
> +       u8 *rdscur = nor->bouncebuf;
> +
> +       error = spi_nor_read_reg(nor, SPINOR_OP_RDSCUR, 1);
> +       if (error) {
> +               dev_dbg(nor->dev, "error %d on read security register\n", error);
> +               return error;
> +       }
> +
> +       if (rdscur[0] & SEC_REG_LDSO)
> +               return 0;
> +
> +       error = spi_nor_write_enable(nor);
> +       if (error) {
> +               dev_dbg(nor->dev, "error %d on enable write before update security register\n",
> +                       error);
> +               return error;
> +       }
> +
> +       error = spi_nor_send_cmd(nor, SPINOR_OP_WRSCUR);
> +       if (error)
> +               dev_dbg(nor->dev, "error %d on update security register\n", error);
> +
> +       return error;
> +}
> +
> +/**
> + * macronix_nor_otp_is_locked() - get the OTP region lock status
> + * @nor:        pointer to 'struct spi_nor'
> + * @region:     OTP region
> + *
> + * Return: 1 on lock, 0 on not locked, -errno otherwise.
> + */
> +static int macronix_nor_otp_is_locked(struct spi_nor *nor, unsigned int region)
> +{
> +       int error;
> +       u8 *rdscur = nor->bouncebuf;
> +
> +       error = spi_nor_read_reg(nor, SPINOR_OP_RDSCUR, 1);
> +       if (error) {
> +               dev_dbg(nor->dev, "error %d on read security register\n", error);
> +               return error;
> +       }
> +       return rdscur[0] & SEC_REG_LDSO ? 1 : 0;
> +}
> +
>  static int
>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>                             const struct sfdp_parameter_header *bfpt_header,
> @@ -190,8 +346,19 @@ static void macronix_nor_default_init(struct spi_nor *nor)
>         nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
>  }
>
> +static const struct spi_nor_otp_ops macronix_nor_otp_ops = {
> +       .read = macronix_nor_otp_read,
> +       .write = macronix_nor_otp_write,
> +       /* .erase = Macronix OTP do not support erase, */
> +       .lock = macronix_nor_otp_lock,
> +       .is_locked = macronix_nor_otp_is_locked,
> +};
> +
>  static int macronix_nor_late_init(struct spi_nor *nor)
>  {
> +       if (nor->params->otp.org.n_regions)
> +               nor->params->otp.ops = &macronix_nor_otp_ops;
> +
>         if (!nor->params->set_4byte_addr_mode)
>                 nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
>
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index cdcfe0fd2e7d..ef834e7fc0ac 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -81,6 +81,15 @@
>  #define SPINOR_OP_BP           0x02    /* Byte program */
>  #define SPINOR_OP_AAI_WP       0xad    /* Auto address increment word program */
>
> +/* Macronix OTP registers. */
> +#define SPINOR_OP_RDSCUR       0x2b    /* read security register */
> +#define SPINOR_OP_WRSCUR       0x2f    /* write security register */
> +#define SPINOR_OP_ENSO         0xb1    /* enter secured OTP */
> +#define SPINOR_OP_EXSO         0xc1    /* exit secured OTP */
> +
> +/* Macronix security register values */
> +#define SEC_REG_LDSO           BIT(1)  /* Lock-down Secured OTP */
> +
>  /* Used for Macronix and Winbond flashes. */
>  #define SPINOR_OP_EN4B         0xb7    /* Enter 4-byte mode */
>  #define SPINOR_OP_EX4B         0xe9    /* Exit 4-byte mode */
> --
> 2.39.5
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
