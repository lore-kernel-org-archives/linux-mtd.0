Received: from mail-vc0-x22d.google.com ([2607:f8b0:400c:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC4TY-0004aB-0V
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 09:13:12 +0000
Received: by mail-vc0-f173.google.com with SMTP id id13so105863vcb.32
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2013 02:12:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1376783055-18370-1-git-send-email-luka@openwrt.org>
References: <1376783055-18370-1-git-send-email-luka@openwrt.org>
Date: Wed, 21 Aug 2013 02:12:42 -0700
Message-ID: <CAN8TOE9PreuyaDHHPeHaB0906c6T=-Vz76By-PmX2whAdMWjgA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: m25p80: add support for PMC SPI flash
From: Brian Norris <computersforpeace@gmail.com>
To: Luka Perkov <luka@openwrt.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Luka,

I just noticed this version of Michel's patch (it was filtered to my
spam for some reason). I pushed Michel's version, but Marek and we are
still discussing it. If it comes down to changing anything, perhaps i
can update with your minor changes. But I will leave them out for now.

Thanks,
Brian

On Sat, Aug 17, 2013 at 4:44 PM, Luka Perkov <luka@openwrt.org> wrote:
> From: Michel Stempin <michel.stempin@wanadoo.fr>
>
> This patch adds support for PMC (now Chingis, part of ISSI) Pm25LV512 (512
> kBbit), Pm25LV010 (1 Mbit) and Pm25LQ032 (32 Mbit) SPI flash.
>
> Two generations of PMC SPI flash chips are addressed:
>
> 1) Pm25LV512 and Pm25LV010 - These have 4KB sectors and 32KB blocks. The 4KB
> sector erase uses a non-standard opcode (0xd7). They do not support JEDEC RDID
> (0x9f), and so they can only be detected by matching their name string with
> pre-configured platform data. Because of the cascaded acquisitions, the
> datasheet is no longer available on the current manufacturer's website,
> although it is still commonly used in some recent wireless routers [1]. Only
> public datasheet available seems to be on GeoCities [2].
>
> 2) Pm25LQ032 - A newer generation flash, with 4KB sectors and 32KB blocks. It
> uses the standard erase and JEDEC read-ID opcodes. Manufacturer's datasheet is
> available [3].
>
> [1] https://forum.openwrt.org/viewtopic.php?pid=186360#p186360
> [2] http://www.geocities.jp/scottle556/pdf/Pm25LV512-010.pdf
> [3] http://www.chingistek.com/img/Product_Files/Pm25LQ032C%20datasheet%20v1.6.1.pdf
>
> Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
> Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
> CC: Brian Norris <computersforpeace@gmail.com>
> CC: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>
> Changes in v2:
>  - style and documentation improvements
>
>  drivers/mtd/devices/m25p80.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 2f3d2a5..4d45ce4 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -45,6 +45,7 @@
>  #define        OPCODE_BE_4K            0x20    /* Erase 4KiB block */
>  #define        OPCODE_BE_32K           0x52    /* Erase 32KiB block */
>  #define        OPCODE_CHIP_ERASE       0xc7    /* Erase whole flash chip */
> +#define        OPCODE_BE_4K_PMC        0xd7    /* Erase 4KiB block on PMC chips*/
>  #define        OPCODE_SE               0xd8    /* Sector erase (usually 64KiB) */
>  #define        OPCODE_RDID             0x9f    /* Read JEDEC ID */
>
> @@ -682,6 +683,7 @@ struct flash_info {
>  #define        SECT_4K         0x01            /* OPCODE_BE_4K works uniformly */
>  #define        M25P_NO_ERASE   0x02            /* No erase command needed */
>  #define        SST_WRITE       0x04            /* use SST byte programming */
> +#define        SECT_4K_PMC     0x08            /* OPCODE_BE_4K_PMC works uniformly */
>  };
>
>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)     \
> @@ -762,6 +764,11 @@ static const struct spi_device_id m25p_ids[] = {
>         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
>         { "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
>
> +       /* PMC -- pm25x "blocks" are 32K, sectors are 4K */
> +       { "pm25lv512", INFO(0, 0, 32 * 1024, 2, SECT_4K_PMC) },
> +       { "pm25lv010", INFO(0, 0, 32 * 1024, 4, SECT_4K_PMC) },
> +       { "pm25lq032", INFO(0x7F9D46, 0, 64 * 1024,  64, SECT_4K) },
> +
>         /* Spansion -- single (large) sector size only, at least
>          * for the chips listed here (without boot sectors).
>          */
> @@ -1014,6 +1021,9 @@ static int m25p_probe(struct spi_device *spi)
>         if (info->flags & SECT_4K) {
>                 flash->erase_opcode = OPCODE_BE_4K;
>                 flash->mtd.erasesize = 4096;
> +       } else if (info->flags & SECT_4K_PMC) {
> +               flash->erase_opcode = OPCODE_BE_4K_PMC;
> +               flash->mtd.erasesize = 4096;
>         } else {
>                 flash->erase_opcode = OPCODE_SE;
>                 flash->mtd.erasesize = info->sector_size;
> --
> 1.8.3.4
