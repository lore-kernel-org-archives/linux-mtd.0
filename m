Received: from mail-qa0-x232.google.com ([2607:f8b0:400d:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZRV0-00031K-7H
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 19:55:03 +0000
Received: by mail-qa0-f50.google.com with SMTP id bv4so1700621qab.9
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2013 12:54:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <518807C7.9000005@youcom.nl>
References: <518807C7.9000005@youcom.nl>
Date: Mon, 6 May 2013 13:54:40 -0600
Message-ID: <CACwUX0NVYE5xcdZgCqVL8F+4mT9mhw4m+sMuUDDnTRAMNu5iWA@mail.gmail.com>
Subject: Re: [PATCH] nand_ecc_micron: added support for 4 bits on-die ECC
From: David Mosberger-Tang <dmosberger@gmail.com>
To: Jelle Martijn Kok <jmkok@youcom.nl>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Have you considered my patch:

  http://lists.infradead.org/pipermail/linux-mtd/2013-March/046358.html

maybe we should try to consolidate?  I can make an updated patch if
there is interest.

On Mon, May 6, 2013 at 1:43 PM, Jelle Martijn Kok <jmkok@youcom.nl> wrote:
> The patch below enables support for the 4-bits on-die ECC (aka internal
> ECC).
> Some notes:
> - it is detected and activate from nand_scan_tail().
> - when called from nand_scan_ident() it fails as at least "atmel_nand.c"
> overwrites some setup
> - if an 4-bits on-die capable Micron nand flash is detected it will kick in
> - UBI works like a charm and nicely moves the bit-flipped page/block
> - when performing "dd if=/dev/mtdblock1 of=/dev/null" and encountering such
> a bad page, it fails with an I/O error (is this correct ?)
> - raw reads likely do not work. When the on-die ECC is enabled it will
> automatically correct bitflips...
> - Tested on MT29F1G08ABBDAHC and MT29F2G08ABBEAH4
>
> Signed-off-by: Jelle Martijn Kok <jmkok@youcom.nl>
> ---
>  drivers/mtd/nand/Kconfig            |    7 +
>  drivers/mtd/nand/Makefile           |    1 +
>  drivers/mtd/nand/nand_base.c        |    9 ++
>  drivers/mtd/nand/nand_ecc_micron.c  |  238
> +++++++++++++++++++++++++++++++++++
>  include/linux/mtd/nand_ecc_micron.h |    9 ++
>  5 files changed, 264 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/nand/nand_ecc_micron.c
>  create mode 100644 include/linux/mtd/nand_ecc_micron.h
>
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index cce7b70..54afcaa 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -46,6 +46,13 @@ config MTD_NAND_ECC_BCH
>        ECC codes. They are used with NAND devices requiring more than 1 bit
>        of error correction.
>
> +config MTD_NAND_ECC_MICRON
> +    bool "Support Micron internal ECC"
> +    default n
> +    help
> +      This enables support for Micron 4-bits internal ECC
> +      Do not enable this if you will not be using it
> +
>  config MTD_SM_COMMON
>      tristate
>      default n
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 618f4ba..4db54de 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -49,5 +49,6 @@ obj-$(CONFIG_MTD_NAND_MPC5121_NFC)    += mpc5121_nfc.o
>  obj-$(CONFIG_MTD_NAND_RICOH)        += r852.o
>  obj-$(CONFIG_MTD_NAND_JZ4740)        += jz4740_nand.o
>  obj-$(CONFIG_MTD_NAND_GPMI_NAND)    += gpmi-nand/
> +obj-$(CONFIG_MTD_NAND_ECC_MICRON)    += nand_ecc_micron.o
>
>  nand-objs := nand_base.o nand_bbt.o
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index daed698..70a2415 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -42,6 +42,7 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/nand.h>
>  #include <linux/mtd/nand_ecc.h>
> +#include <linux/mtd/nand_ecc_micron.h>
>  #include <linux/mtd/nand_bch.h>
>  #include <linux/interrupt.h>
>  #include <linux/bitops.h>
> @@ -3234,6 +3235,14 @@ int nand_scan_tail(struct mtd_info *mtd)
>      int i;
>      struct nand_chip *chip = mtd->priv;
>
> +#ifdef CONFIG_MTD_NAND_ECC_MICRON
> +    /* Detect and enable Micron 4-bits internal ECC */
> +    if (nand_ecc_micron_present(mtd)) {
> +        pr_info("NAND device: Using micron 4-bit internal ECC\n");
> +        nand_ecc_micron_init(mtd);
> +    }
> +#endif
> +
>      if (!(chip->options & NAND_OWN_BUFFERS))
>          chip->buffers = kmalloc(sizeof(*chip->buffers), GFP_KERNEL);
>      if (!chip->buffers)
> diff --git a/drivers/mtd/nand/nand_ecc_micron.c
> b/drivers/mtd/nand/nand_ecc_micron.c
> new file mode 100644
> index 0000000..49afaaf
> --- /dev/null
> +++ b/drivers/mtd/nand/nand_ecc_micron.c
> @@ -0,0 +1,238 @@
> +#include <linux/delay.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/nand_ecc_micron.h>
> +
> +/* Define the oob placement for the micron internal ECC nand */
> +static struct nand_ecclayout nand_oob_micron_ecc_64 = {
> +    .eccbytes = 32,
> +    .eccpos = {
> +        8, 9, 10, 11, 12, 13, 14, 15,
> +        24, 25, 26, 27, 28, 29, 30, 31,
> +        40, 41, 42, 43, 44, 45, 46, 47,
> +        56, 57, 58, 59, 60, 61, 62, 63
> +    },
> +    .oobfree = {
> +        { .offset = 4, .length = 4 },
> +        { .offset = 20, .length = 4 },
> +        { .offset = 36, .length = 4 },
> +        { .offset = 52, .length = 4 },
> +    },
> +};
> +
> +/**
> + * nand_command_ecc_micron
> + * @mtd: MTD device structure
> + * @command: the command to be sent
> + * @column: the column address for this command, -1 if none
> + * @page_addr: the page address for this command, -1 if none
> + *
> + * Identical to nand_command_lp, but additionally checks the micron
> + * status after a NAND_CMD_READ0.
> + */
> +
> +static void nand_command_ecc_micron(struct mtd_info *mtd, unsigned int
> command,
> +                int column, int page_addr)
> +{
> +    register struct nand_chip *chip = mtd->priv;
> +
> +    /* Emulate NAND_CMD_READOOB */
> +    if (command == NAND_CMD_READOOB) {
> +        column += mtd->writesize;
> +        command = NAND_CMD_READ0;
> +    }
> +
> +    /* Command latch cycle */
> +    chip->cmd_ctrl(mtd, command & 0xff,
> +               NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
> +
> +    if (column != -1 || page_addr != -1) {
> +        int ctrl = NAND_CTRL_CHANGE | NAND_NCE | NAND_ALE;
> +
> +        /* Serially input address */
> +        if (column != -1) {
> +            /* Adjust columns for 16 bit buswidth */
> +            if (chip->options & NAND_BUSWIDTH_16)
> +                column >>= 1;
> +            chip->cmd_ctrl(mtd, column, ctrl);
> +            ctrl &= ~NAND_CTRL_CHANGE;
> +            chip->cmd_ctrl(mtd, column >> 8, ctrl);
> +        }
> +        if (page_addr != -1) {
> +            chip->cmd_ctrl(mtd, page_addr, ctrl);
> +            chip->cmd_ctrl(mtd, page_addr >> 8,
> +                       NAND_NCE | NAND_ALE);
> +            /* One more address cycle for devices > 128MiB */
> +            if (chip->chipsize > (128 << 20))
> +                chip->cmd_ctrl(mtd, page_addr >> 16,
> +                           NAND_NCE | NAND_ALE);
> +        }
> +    }
> +    chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
> +
> +    /*
> +     * Program and erase have their own busy handlers status, sequential
> +     * in, and deplete1 need no delay.
> +     */
> +    switch (command) {
> +
> +    case NAND_CMD_CACHEDPROG:
> +    case NAND_CMD_PAGEPROG:
> +    case NAND_CMD_ERASE1:
> +    case NAND_CMD_ERASE2:
> +    case NAND_CMD_SEQIN:
> +    case NAND_CMD_RNDIN:
> +    case NAND_CMD_STATUS:
> +    case NAND_CMD_DEPLETE1:
> +        return;
> +
> +    case NAND_CMD_STATUS_ERROR:
> +    case NAND_CMD_STATUS_ERROR0:
> +    case NAND_CMD_STATUS_ERROR1:
> +    case NAND_CMD_STATUS_ERROR2:
> +    case NAND_CMD_STATUS_ERROR3:
> +        /* Read error status commands require only a short delay */
> +        udelay(chip->chip_delay);
> +        return;
> +
> +    case NAND_CMD_RESET:
> +        if (chip->dev_ready)
> +            break;
> +        udelay(chip->chip_delay);
> +        chip->cmd_ctrl(mtd, NAND_CMD_STATUS,
> +                   NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
> +        chip->cmd_ctrl(mtd, NAND_CMD_NONE,
> +                   NAND_NCE | NAND_CTRL_CHANGE);
> +        while (!(chip->read_byte(mtd) & NAND_STATUS_READY))
> +                ;
> +        return;
> +
> +    case NAND_CMD_RNDOUT:
> +        /* No ready / busy check necessary */
> +        chip->cmd_ctrl(mtd, NAND_CMD_RNDOUTSTART,
> +                   NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
> +        chip->cmd_ctrl(mtd, NAND_CMD_NONE,
> +                   NAND_NCE | NAND_CTRL_CHANGE);
> +        return;
> +
> +    case NAND_CMD_READ0:
> +        chip->cmd_ctrl(mtd, NAND_CMD_READSTART,
> +                   NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
> +        chip->cmd_ctrl(mtd, NAND_CMD_NONE,
> +                   NAND_NCE | NAND_CTRL_CHANGE);
> +
> +        /* This applies to read commands */
> +    default:
> +        /*
> +         * If we don't have access to the busy pin, we apply the given
> +         * command delay.
> +         */
> +        if (!chip->dev_ready) {
> +            udelay(chip->chip_delay);
> +            return;
> +        }
> +    }
> +
> +    /* Some additional things need to be done on read */
> +    if (command == NAND_CMD_READ0) {
> +        int status,cnt;
> +        /* Wait until nand flash is ready - tR_ECC max */
> +        for (cnt=0; cnt<70; cnt++) {
> +            ndelay(1000); /* 1 usec delay */
> +            chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> +            status = chip->read_byte(mtd);
> +            if (status & NAND_STATUS_READY)
> +                break;
> +        }
> +        /* Check the status bits */
> +        if (status & NAND_STATUS_FAIL)
> +            mtd->ecc_stats.failed++;
> +        if (status & NAND_STATUS_REWRITE)
> +            mtd->ecc_stats.corrected++;
> +        /* Re-issue CMD0 after the status check */
> +        chip->cmd_ctrl(mtd, NAND_CMD_READ0,NAND_NCE | NAND_CLE |
> NAND_CTRL_CHANGE);
> +        chip->cmd_ctrl(mtd, NAND_CMD_NONE,NAND_NCE | NAND_CTRL_CHANGE);
> +    }
> +
> +    /*
> +     * Apply this short delay always to ensure that we do wait tWB in
> +     * any case on any machine.
> +     */
> +    ndelay(100);
> +
> +    nand_wait_ready(mtd);
> +}
> +
> +/**
> + * nand_read_page_ecc_micron - IDENTICAL to nand_read_page_raw
> + * @mtd: mtd info structure
> + * @chip: nand chip info structure
> + * @buf: buffer to store read data
> + * @page: page number to read
> + */
> +
> +static int nand_read_page_ecc_micron(struct mtd_info *mtd, struct nand_chip
> *chip, uint8_t *buf, int page) {
> +    chip->read_buf(mtd, buf, mtd->writesize);
> +    chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +    return 0;
> +}
> +
> +/**
> + * nand_write_page_ecc_micron - IDENTICAL to nand_write_page_raw
> + * @mtd: mtd info structure
> + * @chip: nand chip info structure
> + * @buf: data buffer
> + */
> +
> +static void nand_write_page_ecc_micron(struct mtd_info *mtd, struct
> nand_chip *chip, const uint8_t *buf) {
> +    chip->write_buf(mtd, buf, mtd->writesize);
> +    chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> +}
> +
> +int nand_ecc_micron_present(struct mtd_info *mtd) {
> +    int i;
> +    u8 id_data[5];
> +    struct nand_chip *chip = mtd->priv;
> +
> +    /* Currently it seems it cannot be detected by onfi, but only via
> READID byte 4.
> +     * So see if byte 4 indicates internal ECC is present (we do not
> require it to
> +     * be already enabled. This might be the case if the kernel is loaded
> from another
> +     * source (NOR flash, SD card or network)
> +     * We ALWAYS enabled internal ECC if present, if you do not wish this,
> then do not
> +     * enable this feature in the kernel config
> +     */
> +    if (chip->onfi_params.jedec_id != NAND_MFR_MICRON)
> +        return 0;
> +    chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
> +    for (i = 0; i < 5; i++)
> +        id_data[i] = chip->read_byte(mtd);
> +    if (id_data[0] == NAND_MFR_MICRON && (id_data[4] & 0x03) == 0x02)
> +        return 1;
> +    return 0;
> +}
> +
> +static char micron_enable_ecc[] = {0x08,0,0,0};
> +
> +void nand_ecc_micron_init(struct mtd_info *mtd) {
> +    struct nand_chip *chip = mtd->priv;
> +
> +    /* Setup the read/write functions
> +     * NOTE: we are required to do so, or we are not allowed to set the
> ecc.mode to NAND_ECC_HW */
> +    chip->ecc.read_page = nand_read_page_ecc_micron;
> +    chip->ecc.write_page = nand_write_page_ecc_micron;
> +
> +    /* We need to modify NAND_CMD_READ0, so hook into the cmdfunc */
> +    chip->cmdfunc = nand_command_ecc_micron;
> +
> +    /* Make sure the internel ECC engine of the nand is active */
> +    chip->cmd_ctrl(mtd, 0xEF, NAND_CTRL_CHANGE | NAND_NCE | NAND_CLE); /*
> SET FEATURES */
> +    chip->cmd_ctrl(mtd, 0x90, NAND_CTRL_CHANGE | NAND_NCE | NAND_ALE); /*
> Array operation mode */
> +    chip->write_buf(mtd, micron_enable_ecc, 4);
> +    ndelay(1000); /* tFEAT 1 usec delay */
> +
> +    /* Setup the ecc structure */
> +    chip->ecc.layout = &nand_oob_micron_ecc_64;
> +    chip->ecc.mode = NAND_ECC_HW;
> +    chip->ecc.size = 512;
> +    chip->ecc.bytes = 8;
> +}
> diff --git a/include/linux/mtd/nand_ecc_micron.h
> b/include/linux/mtd/nand_ecc_micron.h
> new file mode 100644
> index 0000000..c270ddc
> --- /dev/null
> +++ b/include/linux/mtd/nand_ecc_micron.h
> @@ -0,0 +1,9 @@
> +#ifndef __LINUX_MTD_NAND_ECC_MICRON_H
> +#define __LINUX_MTD_NAND_ECC_MICRON_H
> +
> +#define NAND_STATUS_REWRITE 0x08
> +
> +int nand_ecc_micron_present(struct mtd_info *mtd);
> +void nand_ecc_micron_init(struct mtd_info *mtd);
> +
> +#endif /* __LINUX_MTD_NAND_ECC_MICRON_H */
> --
> 1.7.0.4
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
