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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BECC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 05:36:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 791262087D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 05:36:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JgpWCDh7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPZp2RRU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 791262087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RMdcgaXN7CReEXGbMtbYcdF3MwMxWppwWZKrQCNqI8o=; b=JgpWCDh74cliTaTopPmvtspKV
	3awhsTFI4KBAaztjZ31NET4oF1cmWmpEjI0AzdzJAmhxQb7Utzx8b1epq9ear5mOBawPpBeygEBii
	MhWZmvHDRK5CRIQ3/DcnYL3oR6RScpgbnKLGXjTRmfMceLHhnncB4aDojF/vI2iQq2bcj/UJRRTk3
	FV60qAeXcKHHvZX+N3LHwJf3MB11SIvdCUfzubzE1TOLdN/6VchupoRH3O3s0VM8vfHjMxSoyevYr
	TBHCgwKUtoYuiiG14GQHOrgM29G+s+CJ5xfwx20dz+lRSYZvQHvuPVK4W6cDxgvrJ1L82C60/SXO0
	u1Ox3IfBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNrF8-0006ke-Cq; Thu, 01 Oct 2020 05:35:02 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNrF5-0006ik-83
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 05:35:00 +0000
Received: by mail-il1-x143.google.com with SMTP id q1so4925649ilt.6
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2020 22:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QlNKQycNnvteFigNFibyT2ocHkaGrFA1JKAwWkdGFc0=;
 b=MPZp2RRUIXh49ws5XS1Q9IxFD8yFn0Vo+nRWmM/9G9wZySFn2ceIP2Z2DWvKhjayrz
 5o7JU+8licH7QL7lSQE+zJsp2vxUahTnIN8LipUD6dILVXSCWdLWdcpsapLX2+uQy4M1
 4dI0NAmSeSKL8rjc9Qx8OF/ftZKdhMlvuNsRo8ME6ReONoUSxXqZmLbZANZEnCLeDZdH
 nbyQmzxI6lteqk6qwlbZurfG/tTs122LPxDWCDDW2HpRTQLSYKBzbhcus30vxvwMe6OI
 RfOBAg7RhKGU7eG23iAxszkdnSxJYZFaj0C0qzZAmnwYbSvCVguIGAMzzUdem+OiCLyA
 3jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QlNKQycNnvteFigNFibyT2ocHkaGrFA1JKAwWkdGFc0=;
 b=gyhohRHbqRbeajJMkkWy9BmqMrfzaziRBdo2sOPZCgnpga/Q0vBttLJWXQsemj/HoS
 q1b5NY1D3FnaSTvfZR/orPES1nYKsGpVTRgdPM3rmN72TfP44mwslNYfc8ITWyL19e0u
 /nMFb1I37LYjeTkoX9+lRNpACMJ+vKVr85b+SOhQTvBH3ru7q11D6IL+MnbZPjK66iHY
 4wwGPMTCQKVGxi0X94+GbF2DSiGrPBQlBKBwm3Zjbph5bBIsxJ6UFPRbWmUtSkCtrHPi
 UCWUNd+mcE8xVd6r85A/bXFVxckRdsEM7+LM0Fib1ioTnfQFvsC6VsNR2nW4+ke4P4q2
 Cxzw==
X-Gm-Message-State: AOAM531DzzgRS5v0CpJlrt3W1hG0Io+UxvmTEvNmVOwsRNiApcJOvYyC
 c9qMnCcaNmQlwfZ/WjX8H1mBfsMBf2mqMaDbfsM=
X-Google-Smtp-Source: ABdhPJyQmyDWmQoCxADWbfe3/uH2urTIAj97VMZsP6OBZ1sccmbsD8at9oCFSQxlKzqbq6MjGot1uRqWy6rx2Q1OMBg=
X-Received: by 2002:a92:c084:: with SMTP id h4mr1249158ile.6.1601530494571;
 Wed, 30 Sep 2020 22:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200911222634.31804-1-michael@walle.cc>
 <20200911222634.31804-3-michael@walle.cc>
In-Reply-To: <20200911222634.31804-3-michael@walle.cc>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 1 Oct 2020 07:34:43 +0200
Message-ID: <CAEyMn7YjjTiR1=9Z3-MUz1vusfFTUr1pVG49Zbg1-7x=mE0GHQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: spi-nor: add OTP support
To: Michael Walle <michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_013459_290446_9DE961CE 
X-CRM114-Status: GOOD (  36.27  )
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
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Rahul Bedarkar <rahul.bedarkar@imgtec.com>,
 Jungseung Lee <js07.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Michael,

Am Sa., 12. Sept. 2020 um 00:26 Uhr schrieb Michael Walle <michael@walle.cc>:
>
> Implement the MTD callbacks for the OTP methods for the SPI NOR
> subsystem.
>
> Usually, the OTP area of a SPI flash can be accessed like the normal
> memory, eg by offset addressing; except that you either have to use
> special read/write commands (Winbond) or you have to enter (and exit) a
> specific OTP mode (Macronix, Micron). Sometimes there are individual
> regions, which might have individual offsets. Therefore, it is possible
> to specify the starting address of the first regions as well as the
> distance between two regions (Winbond).
>
> Additionally, the regions might be locked down. Once locked, no further
> write access is possible.
>
> Cc: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  drivers/mtd/chips/Kconfig  |   2 +-
>  drivers/mtd/spi-nor/core.c | 143 +++++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.h |  48 +++++++++++++
>  3 files changed, 192 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
> index aef14990e5f7..3b7ba9448118 100644
> --- a/drivers/mtd/chips/Kconfig
> +++ b/drivers/mtd/chips/Kconfig
> @@ -152,7 +152,7 @@ config MTD_CFI_I8
>
>  config MTD_OTP
>         bool "Protection Registers aka one-time programmable (OTP) bits"
> -       depends on MTD_CFI_ADV_OPTIONS
> +       depends on MTD_CFI_ADV_OPTIONS || MTD_SPI_NOR
>         default n
>         help
>           This enables support for reading, writing and locking so called
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b06b160a5c9c..4244f98e4948 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2689,6 +2689,12 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>         spi_nor_set_erase_type(&map->erase_type[i], info->sector_size,
>                                SPINOR_OP_SE);
>         spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
> +
> +       /* OTP parameters */
> +       nor->params->otp_info.otp_size = info->otp_size;
> +       nor->params->otp_info.n_otps = info->n_otps;
> +       nor->params->otp_info.otp_start_addr = info->otp_start_addr;
> +       nor->params->otp_info.otp_addr_offset = info->otp_addr_offset;
>  }
>
>  /**
> @@ -2972,6 +2978,127 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>         return info;
>  }
>
> +static loff_t spi_nor_otp_region_start(struct spi_nor *nor, int region)
> +{
> +       struct spi_nor_otp_info *info = &nor->params->otp_info;
> +
> +       return info->otp_start_addr + region * info->otp_addr_offset;
> +}
> +
> +static loff_t spi_nor_otp_region_end(struct spi_nor *nor, int region)
> +{
> +       struct spi_nor_otp_info *info = &nor->params->otp_info;
> +
> +       return spi_nor_otp_region_start(nor, region) + info->otp_size - 1;
> +}
> +
> +static int spi_nor_mtd_otp_info(struct mtd_info *mtd, size_t len,
> +                               size_t *retlen, struct otp_info *buf)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +       int locked;
> +       int i;
> +
> +       for (i = 0; i < nor->params->otp_info.n_otps; i++) {
> +               buf[i].start = spi_nor_otp_region_start(nor, i);
> +               buf[i].length = nor->params->otp_info.otp_size;
> +
> +               locked = nor->params->otp_ops->is_locked(nor, i);
> +               if (locked < 0)
> +                       return locked;
> +
> +               buf[i].locked = !!locked;
> +       }
> +
> +       *retlen = nor->params->otp_info.n_otps * sizeof(*buf);
> +
> +       return 0;
> +}
> +
> +static int spi_nor_otp_addr_to_region(struct spi_nor *nor, loff_t addr)
> +{
> +       int i;
> +
> +       for (i = 0; i < nor->params->otp_info.n_otps; i++)
> +               if (addr >= spi_nor_otp_region_start(nor, i) &&
> +                   addr <= spi_nor_otp_region_end(nor, i))
> +                       return i;
> +
> +       return -EINVAL;
> +}
> +
> +static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
> +                                     size_t len, size_t *retlen, u_char *buf,
> +                                     bool is_write)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +       int region;
> +       int ret;
> +
> +       *retlen = 0;
> +
> +       region = spi_nor_otp_addr_to_region(nor, ofs);
> +       if (region < 0)
> +               return 0;
> +
> +       if (ofs < spi_nor_otp_region_start(nor, region))
> +               return 0;
> +
> +       if ((ofs + len - 1) > spi_nor_otp_region_end(nor, region))
> +               return 0;
> +
> +       ret = spi_nor_lock_and_prep(nor);
> +
> +       if (is_write)
> +               ret = nor->params->otp_ops->write(nor, ofs, len, buf);
> +       else
> +               ret = nor->params->otp_ops->read(nor, ofs, len, buf);
> +
> +       spi_nor_unlock_and_unprep(nor);
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       *retlen = len;
> +       return 0;
> +}
> +
> +static int spi_nor_mtd_otp_read(struct mtd_info *mtd, loff_t from, size_t len,
> +                               size_t *retlen, u_char *buf)
> +{
> +       return spi_nor_mtd_otp_read_write(mtd, from, len, retlen, buf, false);
> +}
> +
> +static int spi_nor_mtd_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
> +                                size_t *retlen, u_char *buf)
> +{
> +       return spi_nor_mtd_otp_read_write(mtd, to, len, retlen, buf, true);
> +}
> +
> +static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +       int region;
> +       int ret;
> +
> +       region = spi_nor_otp_addr_to_region(nor, from);
> +       if (region < 0)
> +               return -EINVAL;
> +
> +       if (len != nor->params->otp_info.otp_size)
> +               return -EINVAL;
> +
> +       ret = spi_nor_lock_and_prep(nor);
> +       if (ret)
> +               return ret;
> +
> +       ret = nor->params->otp_ops->lock(nor, region);
> +
> +       spi_nor_unlock_and_unprep(nor);
> +
> +       return ret;
> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>                  const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -3050,6 +3177,22 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>                 mtd->_is_locked = spi_nor_is_locked;
>         }
>
> +       if (nor->params->otp_ops) {
> +               /*
> +                * We only support user_prot callbacks (yet).
> +                *
> +                * Some SPI flashes like Macronix ones support factory locked
> +                * OTP areas, usually they are preprogrammed with an
> +                * "electrical serial number".
> +                * Most of the time the OTP area is unprogrammed and left up to
> +                * the user. This is what we support at the moment.
> +                */
> +               mtd->_get_user_prot_info = spi_nor_mtd_otp_info;
> +               mtd->_read_user_prot_reg = spi_nor_mtd_otp_read;
> +               mtd->_write_user_prot_reg = spi_nor_mtd_otp_write;
> +               mtd->_lock_user_prot_reg = spi_nor_mtd_otp_lock;
> +       }
> +
>         if (info->flags & USE_FSR)
>                 nor->flags |= SNOR_F_USE_FSR;
>         if (info->flags & SPI_NOR_HAS_TB) {
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index fb3ef86e350c..516c5973bf88 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -170,6 +170,21 @@ struct spi_nor_erase_map {
>         u8                              uniform_erase_type;
>  };
>
> +/**
> + * struct spi_nor_otp_info - Structure to describe the SPI NOR OTP region
> + * @otp_size:          size of one OTP region in bytes.
> + * @n_otps:            number of individual OTP regions.
> + * @otp_start_addr:    start address of the OTP area.
> + * @otp_addr_offset:   offset between consecutive OTP regions if there are
> + *                     more than one.
> + */
> +struct spi_nor_otp_info {
> +       u32 otp_size;
> +       int n_otps;
> +       u32 otp_start_addr;
> +       u32 otp_addr_offset;
> +};
> +
>  /**
>   * struct spi_nor_locking_ops - SPI NOR locking methods
>   * @lock:      lock a region of the SPI NOR.
> @@ -182,6 +197,20 @@ struct spi_nor_locking_ops {
>         int (*is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>  };
>
> +/**
> + * struct spi_nor_otp_ops - SPI NOR OTP methods
> + * @read:      read from the SPI NOR OTP area.
> + * @write:     write to the SPI NOR OTP area.
> + * @lock:      lock an OTP region.
> + * @is_locked: check if an OTP region of the SPI NOR is locked.
> + */
> +struct spi_nor_otp_ops {
> +       int (*read)(struct spi_nor *nor, loff_t ofs, uint64_t len, u8 *buf);
> +       int (*write)(struct spi_nor *nor, loff_t ofs, uint64_t len, u8 *buf);
> +       int (*lock)(struct spi_nor *nor, unsigned int region);
> +       int (*is_locked)(struct spi_nor *nor, unsigned int region);
> +};
> +
>  /**
>   * struct spi_nor_flash_parameter - SPI NOR flash parameters and settings.
>   * Includes legacy flash parameters and settings that can be overwritten
> @@ -198,6 +227,7 @@ struct spi_nor_locking_ops {
>   *                      higher index in the array, the higher priority.
>   * @erase_map:         the erase map parsed from the SFDP Sector Map Parameter
>   *                      Table.
> + * @otp_info:          describes the OTP regions.
>   * @quad_enable:       enables/disables SPI NOR Quad mode.
>   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
>   * @convert_addr:      converts an absolute address into something the flash
> @@ -208,6 +238,7 @@ struct spi_nor_locking_ops {
>   *                      e.g. different opcodes, specific address calculation,
>   *                      page size, etc.
>   * @locking_ops:       SPI NOR locking methods.
> + * @otp_ops:           SPI NOR OTP methods.
>   */
>  struct spi_nor_flash_parameter {
>         u64                             size;
> @@ -218,6 +249,7 @@ struct spi_nor_flash_parameter {
>         struct spi_nor_pp_command       page_programs[SNOR_CMD_PP_MAX];
>
>         struct spi_nor_erase_map        erase_map;
> +       struct spi_nor_otp_info         otp_info;
>
>         int (*quad_enable)(struct spi_nor *nor, bool enable);
>         int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
> @@ -225,6 +257,7 @@ struct spi_nor_flash_parameter {
>         int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
>
>         const struct spi_nor_locking_ops *locking_ops;
> +       const struct spi_nor_otp_ops *otp_ops;
>  };
>
>  /**
> @@ -314,6 +347,15 @@ struct flash_info {
>
>         /* Part specific fixup hooks. */
>         const struct spi_nor_fixups *fixups;
> +
> +       /* OTP size in bytes */
> +       u16 otp_size;
> +       /* Number of OTP banks */
> +       u16 n_otps;
> +       /* Start address of OTP area */
> +       u32 otp_start_addr;
> +       /* Offset between consecutive OTP banks if there are more than one */
> +       u32 otp_addr_offset;
>  };
>
>  /* Used when the "_ext_id" is two bytes at most */
> @@ -366,6 +408,12 @@ struct flash_info {
>                 .addr_width = 3,                                        \
>                 .flags = SPI_NOR_NO_FR | SPI_NOR_XSR_RDY,
>
> +#define OTP_INFO(_otp_size, _n_otps, _otp_start_addr, _otp_addr_offset)        \
> +               .otp_size = (_otp_size),                                \
> +               .n_otps = (_n_otps),                                    \
> +               .otp_start_addr = (_otp_start_addr),                    \
> +               .otp_addr_offset = (_otp_addr_offset),
> +
>  /**
>   * struct spi_nor_manufacturer - SPI NOR manufacturer object
>   * @name: manufacturer name
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
