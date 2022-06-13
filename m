Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D7AC43334
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jun 2022 15:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+jvUhz4rQf3M5Odmdhe6OpLRMqrPTacjqz2XJl2h79Y=; b=13H/6YE1MrImcB
	GqIuu75YlNM+WP0bB7NXwnxgbwAMsy8vT6rm+CtKuxzoFoV7KrZyre8h41Ccx0uf/rCOS/MLwtWf2
	YKl4lFUkWBd8Iv27RdW+8MOXLGfYSbadpf+giaOMrwK+ZdQprnOmLs1SH/cM2GNdU9B5IFF1aDX91
	yxXXGbJMzhDf2OWTc7H1Od/ldIzayH/zy+TH0um0quGyek3N+PsKMisKm0Izr/gNumYviH95B/5sR
	DjYLQbB3RKCfm6iuh//LsxVgdS1TmZM8e7kBhXHC3WE7FAiZ1VPK13tttfKCVk9tuJtWhif6hrlDZ
	BYLw+Ipo3zIC63ZlYQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0m8p-004X40-Qj; Mon, 13 Jun 2022 15:38:11 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0m8m-004X2q-L1
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2022 15:38:10 +0000
Received: by mail-vs1-xe35.google.com with SMTP id r12so6239304vsg.8
        for <linux-mtd@lists.infradead.org>; Mon, 13 Jun 2022 08:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=OEo/p24vZCV+bW9L7KonOX4MxU66VdDFkS+0g1rGiSI=;
        b=IqFFQdAZE/zeh7HUf+XMwvyDqE77si1h56n9P1DR7CLP4vjBGWa13rhQX/THFQY+nq
         hW7W45tYS0OOTv0V79WzYD4bVs35Otv6Z25NGNG+yJy66DhDL4vfL3Bo6MIVSnwM7/yU
         QpgvtZYVlodkP8vXE1xPHGq2BofPGM7MnzDywupi6sw9Kv5TFtR1UUrg11Y+CIMXhatU
         blnQngVzAbh0h96hKFMEdYFD3VQe4juUkSoA8b7uvu0WHXYh2dKthIHC4ByX1uchtxEE
         BAWAImlLYfOZWFGOLkelfihfTa9yd8d148rmUoyk6/8+Bq6/mRt/NChSWS6tQ1RX4k5H
         5IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=OEo/p24vZCV+bW9L7KonOX4MxU66VdDFkS+0g1rGiSI=;
        b=lgsO+6JnIFU2Fg1zzCdbJmD/UwkVTj/wChuepSf85H319KId9Rb2j123GQdg6zE3D3
         woybVDVXCkqu5+SI1/uo10F1HKURrg/NdHDWwLSW7/RyshfZx7qAZwhI9TgoYSfNtcC7
         G3hBqJIYW4H27IcJ/vqVUsTV5QjMEEjsJjPwNsYKa2bOTucl/tj7BIerByDi8xnJjPsg
         0kG8lPs8aUH7arQfo/C5GRkfvfCUIJGtiwW35Znls4e00n56V+mAfiKMzKwh3VycqhCW
         GwQ4vCYDn28M/TvjKDeEGr4ixeUlk5SRrUZQ7zak8VTeldfj3id72S+xPedzSPcyGN0h
         OPNA==
X-Gm-Message-State: AJIora+eHIz1e6ZB3ylE6kkOda2EyxJtLoWph38OLmeiUIkxNBahFR6z
	ljBSimLr3HHzP4XmNp73spjhxaK76DVF60eLaQo=
X-Google-Smtp-Source: AGRyM1tL/Ehk8pEdo3//KJqgbUkJDkx4in8bWJAVrKINVuqiTFL4SuBEqaRwu57gETeBK71BwdyhbBAZ4stJ8+nIYgo=
X-Received: by 2002:a67:dc82:0:b0:325:58cc:51c7 with SMTP id
 g2-20020a67dc82000000b0032558cc51c7mr324983vsk.63.1655134686595; Mon, 13 Jun
 2022 08:38:06 -0700 (PDT)
MIME-Version: 1.0
From: Alvin Zhou <iamalvinz@gmail.com>
Date: Mon, 13 Jun 2022 23:37:51 +0800
Message-ID: <CAO3YShhVR1aFmFpPz=ttCjRF1Q-=kQ1TuGRRcO+s4w+WPQdJmA@mail.gmail.com>
Subject: [RFC PATCH 8/8] mtd: spi-nor: Enhance locking to support reads while
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, 
	Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Julien Su <juliensu@mxic.com.tw>, 
	Jaime Liao <jaimeliao@mxic.com.tw>, jaimeliao@gmail.com, 
	"alvinzhou@mxic.com.tw" <alvinzhou@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_083808_741572_69ADD3FC 
X-CRM114-Status: GOOD (  40.79  )
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

Hi Miquel,
I have some suggestions as follows
> On devices featuring several banks, the Read While Write (RWW) feature
> is here to improve the overall performance when performing parallel
> reads and writes at different locations (different banks). The following
> constraints have to be taken into account:
> 1#: A single operation can be performed in a given bank.
> 2#: Only a single program or erase operation can happen on the entire
> chip.
> 3#: The I/O bus is unique and thus is the most constrained resource, all
>     spi-nor operations requiring access to the spi bus (through the spi
>     controller) must be serialized until the bus exchanges are over. So
>     we must ensure a single operation can be "sent" at a time.
> 4#: Any other operation that would not be either a read or a write or an
>     erase is considered requiring access to the full chip and cannot be
>     parallelized, we then need to ensure the full chip is in the idle
>     state when this occurs.
>
> All these constraints can easily be managed with a proper locking model:
> 1#: Is protected by a per-bank mutex. Only a single operation can happen
>     in a specific bank at any times. If the bank mutex is not available,
>     the operation cannot start.

Regarding the per-bank mutex, if the RWW flash that supports multiple
banks can provide a command to confirm which bank is available. Could
this approach be an alternative to per-bank mutex ? For example,
Macronix's RWW Flash provides bank status checking in Configuration
Register 2.

> 2#: Is handled by the pe_mode mutex which is acquired before any write
>     or erase, and is released only at the very end of the
>     operation. This way, no other destructive operation on the chip can
>     start during this time frame.

Is it also possible to adjust the flow of spi_nor_wirte and
spi_nor_ersae by moving the status read command to the front of
spi_nor_write_enable(). This step can ensure that the SPI BUS is
available before program or erase, and the pe_mode mutex  is not
needed.

> 3#: A device-wide mutex is introduced in order to capture and serialize
>     bus accessed. This is the one being released "sooner" than before,
>     because we only need to protect the chip against other SPI accesses
>     during the I/O phase, which for the destructive operations is the
>     beginning of the operation (when we send the command cycles and
>     eventually the data), while the second part of the operation (the
>     erase delay or the programmation delay) is when we can do something
>     else with another bank.
> 4#: Is handled by the "generic" helpers which existed before, where
>     basically all the locks are taken before the operation can start,
>     and all locks are released once done.
>
> As many devices still do not support this feature, the original lock is
> also kept in a union: either the feature is available and we initialize
> and use the new locks, or it is not and we keep using the previous
> logic.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 134 +++++++++++++++++++++++++++++++++---
>  include/linux/mtd/spi-nor.h |  12 +++-
>  2 files changed, 134 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 3d8e5f9961b9..872a3934f9a6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1081,6 +1081,61 @@ static void spi_nor_unprep(struct spi_nor *nor)
>                                  nor->controller_ops->unprepare(nor);
>  }
>
> +static bool spi_nor_parallel_locking(struct spi_nor *nor)
> +{
> +                return nor->info->n_banks > 1 && nor->info->no_sfdp_flags
> & SPI_NOR_RWW;
> +}
> +
> +static void spi_nor_lock_all_banks(struct spi_nor *nor)
> +{
> +                int i;
> +
> +                for (i = 0; i < nor->info->n_banks; i++)
> +                                mutex_lock(&nor->locks.bank[i]);
> +}
> +
> +static void spi_nor_unlock_all_banks(struct spi_nor *nor)
> +{
> +                int i;
> +
> +                for (i = 0; i < nor->info->n_banks; i++)
> +                                mutex_unlock(&nor->locks.bank[i]);
> +}
> +
> +static void spi_nor_lock_banks(struct spi_nor *nor, loff_t start, size_t
> len)
> +{
> +                int first, last, i;
> +
> +                first = DIV_ROUND_DOWN_ULL(start,
> nor->params->bank_size);
> +                last = DIV_ROUND_DOWN_ULL(start + len - 1,
> nor->params->bank_size);
> +
> +                for (i = first; i < last; i++)
> +                                mutex_lock(&nor->locks.bank[i]);
> +}
> +
> +static void spi_nor_unlock_banks(struct spi_nor *nor, loff_t start,
> size_t len)
> +{
> +                int first, last, i;
> +
> +                first = DIV_ROUND_DOWN_ULL(start,
> nor->params->bank_size);
> +                last = DIV_ROUND_DOWN_ULL(start + len - 1,
> nor->params->bank_size);
> +
> +                for (i = first; i < last; i++)
> +                                mutex_unlock(&nor->locks.bank[i]);
> +}
> +
> +static void spi_nor_lock_device(struct spi_nor *nor)
> +{
> +                if (spi_nor_parallel_locking(nor))
> +                                mutex_lock(&nor->locks.device);
> +}
> +
> +static void spi_nor_unlock_device(struct spi_nor *nor)
> +{
> +                if (spi_nor_parallel_locking(nor))
> +                                mutex_unlock(&nor->locks.device);
> +}
> +
>  /* Generic helpers for internal locking and serialization */
>  int spi_nor_lock_and_prep(struct spi_nor *nor)
>  {
> @@ -1090,14 +1145,26 @@ int spi_nor_lock_and_prep(struct spi_nor *nor)
>                  if (ret)
>                                  return ret;
>
> -                mutex_lock(&nor->lock);
> +                if (!spi_nor_parallel_locking(nor)) {
> +                                mutex_lock(&nor->lock);
> +                } else {
> +                                spi_nor_lock_all_banks(nor);
> +                                mutex_lock(&nor->locks.pe_mode);
> +                                mutex_lock(&nor->locks.device);
> +                }
>
>                  return 0;
>  }
>
>  void spi_nor_unlock_and_unprep(struct spi_nor *nor)
>  {
> -                mutex_unlock(&nor->lock);
> +                if (!spi_nor_parallel_locking(nor)) {
> +                                mutex_unlock(&nor->lock);
> +                } else {
> +                                mutex_unlock(&nor->locks.device);
> +                                mutex_unlock(&nor->locks.pe_mode);
> +                                spi_nor_unlock_all_banks(nor);
> +                }
>
>                  spi_nor_unprep(nor);
>  }
> @@ -1111,14 +1178,24 @@ static int spi_nor_lock_and_prep_pe(struct spi_nor
> *nor, loff_t start, size_t le
>                  if (ret)
>                                  return ret;
>
> -                mutex_lock(&nor->lock);
> +                if (!spi_nor_parallel_locking(nor)) {
> +                                mutex_lock(&nor->lock);
> +                } else {
> +                                spi_nor_lock_banks(nor, start, len);
> +                                mutex_lock(&nor->locks.pe_mode);
> +                }
>
>                  return 0;
>  }
>
>  static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t
> start, size_t len)
>  {
> -                mutex_unlock(&nor->lock);
> +                if (!spi_nor_parallel_locking(nor)) {
> +                                mutex_unlock(&nor->lock);
> +                } else {
> +                                mutex_unlock(&nor->locks.pe_mode);
> +                                spi_nor_unlock_banks(nor, start, len);
> +                }
>
>                  spi_nor_unprep(nor);
>  }
> @@ -1132,14 +1209,20 @@ static int spi_nor_lock_and_prep_rd(struct spi_nor
> *nor, loff_t start, size_t le
>                  if (ret)
>                                  return ret;
>
> -                mutex_lock(&nor->lock);
> +                if (!spi_nor_parallel_locking(nor))
> +                                mutex_lock(&nor->lock);
> +                else
> +                                spi_nor_lock_banks(nor, start, len);
>
>                  return 0;
>  }
>
>  static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t
> start, size_t len)
>  {
> -                mutex_unlock(&nor->lock);
> +                if (!spi_nor_parallel_locking(nor))
> +                                mutex_unlock(&nor->lock);
> +                else
> +                                spi_nor_unlock_banks(nor, start, len);
>
>                  spi_nor_unprep(nor);
>  }
> @@ -1448,11 +1531,16 @@ static int spi_nor_erase_multi_sectors(struct
> spi_nor *nor, u64 addr, u32 len)
>                                                  dev_vdbg(nor->dev,
> "erase_cmd->size = 0x%08x, erase_cmd->opcode = 0x%02x, erase_cmd->count =
> %u\n",
>  cmd->size, cmd->opcode, cmd->count);
>
> +                                                spi_nor_lock_device(nor);
> +
>                                                  ret =
> spi_nor_write_enable(nor);
> -                                                if (ret)
> +                                                if (ret) {
> + spi_nor_unlock_device(nor);
>                                                                  goto
> destroy_erase_cmd_list;
> +                                                }
>
>                                                  ret =
> spi_nor_erase_sector(nor, addr);
> + spi_nor_unlock_device(nor);
>                                                  if (ret)
>                                                                  goto
> destroy_erase_cmd_list;
>
> @@ -1505,11 +1593,16 @@ static int spi_nor_erase(struct mtd_info *mtd,
> struct erase_info *instr)
>                  if (len == mtd->size && !(nor->flags &
> SNOR_F_NO_OP_CHIP_ERASE)) {
>                                  unsigned long timeout;
>
> +                                spi_nor_lock_device(nor);
> +
>                                  ret = spi_nor_write_enable(nor);
> -                                if (ret)
> +                                if (ret) {
> + spi_nor_unlock_device(nor);
>                                                  goto erase_err;
> +                                }
>
>                                  ret = spi_nor_erase_chip(nor);
> +                                spi_nor_unlock_device(nor);
>                                  if (ret)
>                                                  goto erase_err;
>
> @@ -1534,11 +1627,16 @@ static int spi_nor_erase(struct mtd_info *mtd,
> struct erase_info *instr)
>                  /* "sector"-at-a-time erase */
>                  } else if (spi_nor_has_uniform_erase(nor)) {
>                                  while (len) {
> +                                                spi_nor_lock_device(nor);
> +
>                                                  ret =
> spi_nor_write_enable(nor);
> -                                                if (ret)
> +                                                if (ret) {
> + spi_nor_unlock_device(nor);
>                                                                  goto
> erase_err;
> +                                                }
>
>                                                  ret =
> spi_nor_erase_sector(nor, addr);
> + spi_nor_unlock_device(nor);
>                                                  if (ret)
>                                                                  goto
> erase_err;
>
> @@ -1756,7 +1854,9 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t
> from, size_t len,
>
>                                  addr = spi_nor_convert_addr(nor, addr);
>
> +                                spi_nor_lock_device(nor);
>                                  ret = spi_nor_read_data(nor, addr, len,
> buf);
> +                                spi_nor_unlock_device(nor);
>                                  if (ret == 0) {
>                                                  /* We shouldn't see
> 0-length reads */
>                                                  ret = -EIO;
> @@ -1819,11 +1919,16 @@ static int spi_nor_write(struct mtd_info *mtd,
> loff_t to, size_t len,
>
>                                  addr = spi_nor_convert_addr(nor, addr);
>
> +                                spi_nor_lock_device(nor);
> +
>                                  ret = spi_nor_write_enable(nor);
> -                                if (ret)
> +                                if (ret) {
> + spi_nor_unlock_device(nor);
>                                                  goto write_err;
> +                                }
>
>                                  ret = spi_nor_write_data(nor, addr,
> page_remain, buf + i);
> +                                spi_nor_unlock_device(nor);
>                                  if (ret < 0)
>                                                  goto write_err;
>                                  written = ret;
> @@ -3060,7 +3165,14 @@ int spi_nor_scan(struct spi_nor *nor, const char
> *name,
>
>                  nor->info = info;
>
> -                mutex_init(&nor->lock);
> +                if (!spi_nor_parallel_locking(nor)) {
> +                                mutex_init(&nor->lock);
> +                } else {
> +                                mutex_init(&nor->locks.device);
> +                                mutex_init(&nor->locks.pe_mode);
> +                                for (i = 0; i < nor->info->n_banks; i++)
> + mutex_init(&nor->locks.bank[i]);
> +                }
>
>                  /* Init flash parameters based on flash_info struct and
> SFDP */
>                  ret = spi_nor_init_params(nor);
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 5e25a7b75ae2..772da9b074d9 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -346,6 +346,9 @@ struct spi_nor_flash_parameter;
>   * struct spi_nor - Structure for defining the SPI NOR layer
>   * @mtd:                                an mtd_info structure
>   * @lock:                               the lock for the
> read/write/erase/lock/unlock operations
> + * @locks.device:               the lock for the I/O bus
> + * @locks.pe_mode:              the lock for the program/erase mode for
> RWW operations
> + * @locks.bank:                                 the lock for every
> available bank
>   * @dev:                                pointer to an SPI device or an
> SPI NOR controller device
>   * @spimem:                             pointer to the SPI memory device
>   * @bouncebuf:                          bounce buffer used when the
> buffer passed by the MTD
> @@ -375,7 +378,14 @@ struct spi_nor_flash_parameter;
>   */
>  struct spi_nor {
>                  struct mtd_info                                 mtd;
> -                struct mutex                            lock;
> +                union {
> +                                struct mutex            lock;
> +                                struct {
> +                                                struct mutex device;
> +                                                struct mutex pe_mode;
> +                                                struct mutex *bank;
> +                                } locks;
> +                };
>                  struct device                           *dev;
>                  struct spi_mem                          *spimem;
>                  u8 *bouncebuf;
> --
> 2.34.1

Thanks,
Alvin.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
