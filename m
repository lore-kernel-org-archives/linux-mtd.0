Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ymw03-0002uQ-HY
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2015 03:15:58 +0000
Received: by pdbnk13 with SMTP id nk13so149373574pdb.0
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2015 20:15:34 -0700 (PDT)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <1427292151-3835-2-git-send-email-richard@nod.at>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
Date: Tue, 28 Apr 2015 08:45:34 +0530
Message-ID: <CAGnW=Bb_C3Bmg4C2c=DiEWN2NTGGncko6r1Mvf0nCaTbZh707w@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 25, 2015 at 7:32 PM, Richard Weinberger <richard@nod.at> wrote:
> Some Micron NAND chips offer an on-die ECC (AKA internal ECC)
> feature. It is useful when the host-platform does not offer
> multi-bit ECC and software ECC is not feasible.
>
> Based on original work by David Mosberger <davidm@egauge.net>
>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/nand/nand_base.c   |  66 +++++++++-
>  drivers/mtd/nand/nand_ondie.c  | 266 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/nand.h       |   6 +
>  include/linux/mtd/nand_ondie.h |  40 +++++++
>  4 files changed, 374 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/mtd/nand/nand_ondie.c
>  create mode 100644 include/linux/mtd/nand_ondie.h
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index df7eb4f..92e7ed7 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -43,6 +43,7 @@
>  #include <linux/mtd/nand.h>
>  #include <linux/mtd/nand_ecc.h>
>  #include <linux/mtd/nand_bch.h>
> +#include <linux/mtd/nand_ondie.h>
>  #include <linux/interrupt.h>
>  #include <linux/bitops.h>
>  #include <linux/leds.h>
> @@ -79,6 +80,20 @@ static struct nand_ecclayout nand_oob_64 = {
>                  .length = 38} }
>  };
>
> +static struct nand_ecclayout nand_oob_64_on_die = {
> +       .eccbytes = 32,
> +       .eccpos = {
> +                   8,  9, 10, 11, 12, 13, 14, 15,
> +                  24, 25, 26, 27, 28, 29, 30, 31,
> +                  40, 41, 42, 43, 44, 45, 46, 47,
> +                  56, 57, 58, 59, 60, 61, 62, 63},
> +       .oobfree = {
> +               {.offset =  4,   .length = 4},
> +               {.offset = 20,   .length = 4},
> +               {.offset = 36,   .length = 4},
> +               {.offset = 52,   .length = 4} }
> +};
> +
>  static struct nand_ecclayout nand_oob_128 = {
>         .eccbytes = 48,
>         .eccpos = {
> @@ -3115,9 +3130,10 @@ static int nand_setup_read_retry_micron(struct mtd_info *mtd, int retry_mode)
>  /*
>   * Configure chip properties from Micron vendor-specific ONFI table
>   */
> -static void nand_onfi_detect_micron(struct nand_chip *chip,
> -               struct nand_onfi_params *p)
> +static void nand_onfi_detect_micron(struct mtd_info *mtd,
> +                                   struct nand_onfi_params *p)
>  {
> +       struct nand_chip *chip = mtd->priv;
>         struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
>
>         if (le16_to_cpu(p->vendor_revision) < 1)
> @@ -3125,6 +3141,8 @@ static void nand_onfi_detect_micron(struct nand_chip *chip,
>
>         chip->read_retries = micron->read_retry_options;
>         chip->setup_read_retry = nand_setup_read_retry_micron;
> +
> +       nand_onfi_detect_on_die_ecc(mtd);
>  }
>
>  /*
> @@ -3226,7 +3244,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>         }
>
>         if (p->jedec_id == NAND_MFR_MICRON)
> -               nand_onfi_detect_micron(chip, p);
> +               nand_onfi_detect_micron(mtd, p);
>
>         return 1;
>  }
> @@ -4056,6 +4074,40 @@ int nand_scan_tail(struct mtd_info *mtd)
>                 }
>                 break;
>
> +       case NAND_ECC_HW_ON_DIE:
> +               if (!mtd_nand_has_on_die()) {
> +                       pr_warn("CONFIG_MTD_NAND_ECC_ON_DIE not enabled\n");
> +                       BUG();
> +               }

Cant we get rid of this CONFIG option. lets say during the nand scan
phase it self,
ondie ecc feature status will be known from onfi parameter page based
on the product
and vendor id of micron parts. Now lets the driver choose which ecc it
want. Like legacy
controllers(pl353 smc controller ..) which doesn't have much ecc
coverage will use
ondie ecc feature and controllers that have better ecc coverage can
use controller ecc.
so, the driver can choose which ecc they want to use and pass it to
the scan_tail function.
Since ondie ecc has limitations on spare area usage and the ecc layout
is different to what
the default linux kernel layout, people may prefer to use controller
ecc if that controller has
better ecc coverage. But any case, i think we can avoid this config option.


Regards,,
Punnaiah
> +               /*
> +                * nand_bbt.c by default puts the BBT marker at
> +                * offset 8 in OOB, which is used for ECC (see
> +                * nand_oob_64_on_die).
> +                * Fixed by not using OOB for BBT marker.
> +                */
> +               chip->bbt_options |= NAND_BBT_NO_OOB;
> +               ecc->layout = &nand_oob_64_on_die;
> +               ecc->read_page = nand_read_page_on_die;
> +               ecc->read_subpage = nand_read_subpage_on_die;
> +               ecc->write_page = nand_write_page_raw;
> +               ecc->read_oob = nand_read_oob_std;
> +               ecc->read_page_raw = nand_read_page_raw;
> +               ecc->write_page_raw = nand_write_page_raw;
> +               ecc->write_oob = nand_write_oob_std;
> +               ecc->size = 512;
> +               ecc->bytes = 8;
> +               ecc->strength = 4;
> +               ecc->priv = nand_on_die_init(mtd);
> +               if (!ecc->priv) {
> +                       pr_warn("On-Die ECC initialization failed!\n");
> +                       BUG();
> +               }
> +               if (nand_setup_on_die_ecc_micron(mtd, 1) != 0) {
> +                       pr_warn("Unable to enable on-die ECC!\n");
> +                       BUG();
> +               }
> +               break;
> +
>         case NAND_ECC_NONE:
>                 pr_warn("NAND_ECC_NONE selected by board driver. This is not recommended!\n");
>                 ecc->read_page = nand_read_page_raw;
> @@ -4127,10 +4179,14 @@ int nand_scan_tail(struct mtd_info *mtd)
>         /* Invalidate the pagebuffer reference */
>         chip->pagebuf = -1;
>
> -       /* Large page NAND with SOFT_ECC should support subpage reads */
> +       /*
> +        * Large page NAND with SOFT_ECC or on-die ECC should support
> +        * subpage reads.
> +        */
>         switch (ecc->mode) {
>         case NAND_ECC_SOFT:
>         case NAND_ECC_SOFT_BCH:
> +       case NAND_ECC_HW_ON_DIE:
>                 if (chip->page_shift > 9)
>                         chip->options |= NAND_SUBPAGE_READ;
>                 break;
> @@ -4232,6 +4288,8 @@ void nand_release(struct mtd_info *mtd)
>
>         if (chip->ecc.mode == NAND_ECC_SOFT_BCH)
>                 nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
> +       else if (chip->ecc.mode == NAND_ECC_HW_ON_DIE)
> +               nand_on_die_destroy(chip->ecc.priv);
>
>         mtd_device_unregister(mtd);
>
> diff --git a/drivers/mtd/nand/nand_ondie.c b/drivers/mtd/nand/nand_ondie.c
> new file mode 100644
> index 0000000..4147ef5
> --- /dev/null
> +++ b/drivers/mtd/nand/nand_ondie.c
> @@ -0,0 +1,266 @@
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/bitops.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/nand_ondie.h>
> +
> +/**
> + * struct nand_on_die_control - private NAND on-die ECC control structure
> + *
> + * As on-die ECC does not report the number of changed bits we have to
> + * count them on our own. If on-die ECC reports flipped bits we re-read the
> + * whole page into @chkbuf and then again with ECC disabled into @rawbuf.
> + * By comparing these buffers the number of changed bits can be identified.
> + *
> + * @chkbuf: Buffer to store a whole page
> + * @rawbuf: Buffer to store a whole page with ECC disabled
> + */
> +struct nand_on_die_control {
> +       uint8_t *chkbuf;
> +       uint8_t *rawbuf;
> +};
> +
> +static int check_for_bitflips(struct mtd_info *mtd, int page)
> +{
> +       int flips = 0, max_bitflips = 0, i, j, read_size;
> +       uint8_t *chkbuf, *rawbuf, *chkoob, *rawoob;
> +       struct nand_chip *chip = mtd->priv;
> +       struct nand_on_die_control *on_die_ctrl = chip->ecc.priv;
> +       uint32_t *eccpos;
> +
> +       chkbuf = on_die_ctrl->chkbuf;
> +       rawbuf = on_die_ctrl->rawbuf;
> +       read_size = mtd->writesize + mtd->oobsize;
> +
> +       /* Read entire page w/OOB area with on-die ECC on */
> +       chip->read_buf(mtd, chkbuf, read_size);
> +
> +       /* Re-read page with on-die ECC off */
> +       nand_setup_on_die_ecc_micron(mtd, 0);
> +       chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> +       chip->read_buf(mtd, rawbuf, read_size);
> +       nand_setup_on_die_ecc_micron(mtd, 1);
> +
> +       chkoob = chkbuf + mtd->writesize;
> +       rawoob = rawbuf + mtd->writesize;
> +       eccpos = chip->ecc.layout->eccpos;
> +       for (i = 0; i < chip->ecc.steps; ++i) {
> +               /* Count bit flips in the actual data area */
> +               flips = 0;
> +               for (j = 0; j < chip->ecc.size; ++j)
> +                       flips += hweight8(chkbuf[j] ^ rawbuf[j]);
> +               /* Count bit flips in the ECC bytes */
> +               for (j = 0; j < chip->ecc.bytes; ++j) {
> +                       flips += hweight8(chkoob[*eccpos] ^ rawoob[*eccpos]);
> +                       ++eccpos;
> +               }
> +               if (flips > 0)
> +                       mtd->ecc_stats.corrected += flips;
> +               max_bitflips = max_t(int, max_bitflips, flips);
> +               chkbuf += chip->ecc.size;
> +               rawbuf += chip->ecc.size;
> +       }
> +
> +       /* Re-issue the READ command for the actual data read that follows.  */
> +       chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> +
> +       return max_bitflips;
> +}
> +
> +static int check_read_status_on_die(struct mtd_info *mtd, int page)
> +{
> +       struct nand_chip *chip = mtd->priv;
> +       int max_bitflips = 0;
> +       uint8_t status;
> +
> +       /* Check ECC status of page just transferred into NAND's page buffer */
> +       chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> +       status = chip->read_byte(mtd);
> +
> +       /* Switch back to data reading */
> +       chip->cmd_ctrl(mtd, NAND_CMD_READ0, NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
> +       chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
> +
> +       if (status & NAND_STATUS_FAIL) {
> +               /* Page has invalid ECC */
> +               mtd->ecc_stats.failed++;
> +       } else if (status & NAND_STATUS_REWRITE) {
> +               /*
> +                * Micron on-die ECC doesn't report the number of
> +                * bitflips, so we have to count them ourself to see
> +                * if the error rate is too high.  This is
> +                * particularly important for pages with stuck bits.
> +                */
> +               max_bitflips = check_for_bitflips(mtd, page);
> +       }
> +       return max_bitflips;
> +}
> +
> +
> +/**
> + * nand_read_page_on_die - [INTERN] read raw page data without ecc
> + * @mtd: mtd info structure
> + * @chip: nand chip info structure
> + * @buf: buffer to store read data
> + * @oob_required: caller requires OOB data read to chip->oob_poi
> + * @page: page number to read
> + */
> +int nand_read_page_on_die(struct mtd_info *mtd, struct nand_chip *chip,
> +                                uint8_t *buf, int oob_required, int page)
> +{
> +       uint32_t failed = mtd->ecc_stats.failed;
> +       int ret;
> +
> +       ret = check_read_status_on_die(mtd, page);
> +       if (ret < 0 || mtd->ecc_stats.failed != failed)
> +               return ret;
> +
> +       chip->read_buf(mtd, buf, mtd->writesize);
> +       if (oob_required)
> +               chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +       return ret;
> +}
> +
> +/**
> + * nand_read_subpage - [INTERN] on-die-ECC based sub-page read function
> + * @mtd: mtd info structure
> + * @chip: nand chip info structure
> + * @data_offs: offset of requested data within the page
> + * @readlen: data length
> + * @bufpoi: buffer to store read data
> + * @page: page number to read
> + */
> +int nand_read_subpage_on_die(struct mtd_info *mtd,
> +                                   struct nand_chip *chip,
> +                                   uint32_t data_offs, uint32_t readlen,
> +                                   uint8_t *bufpoi, int page)
> +{
> +       int start_step, end_step, num_steps, ret;
> +       int data_col_addr;
> +       int datafrag_len;
> +       uint32_t failed;
> +       uint8_t *p;
> +
> +       /* Column address within the page aligned to ECC size */
> +       start_step = data_offs / chip->ecc.size;
> +       end_step = (data_offs + readlen - 1) / chip->ecc.size;
> +       num_steps = end_step - start_step + 1;
> +
> +       /* Data size aligned to ECC ecc.size */
> +       datafrag_len = num_steps * chip->ecc.size;
> +       data_col_addr = start_step * chip->ecc.size;
> +       p = bufpoi + data_col_addr;
> +
> +       failed = mtd->ecc_stats.failed;
> +
> +       ret = check_read_status_on_die(mtd, page);
> +       if (ret < 0 || mtd->ecc_stats.failed != failed) {
> +               memset(p, 0, datafrag_len);
> +               return ret;
> +       }
> +
> +       /* If we read not a page aligned data */
> +       if (data_col_addr != 0)
> +               chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_col_addr, -1);
> +
> +       chip->read_buf(mtd, p, datafrag_len);
> +
> +       return ret;
> +}
> +
> +/**
> + * nand_on_die_init - Initialize on-die ECC private data
> + *
> + * @mtd: mtd info structure
> + *
> + * Returns NULL in case of an error.
> + */
> +struct nand_on_die_control *nand_on_die_init(struct mtd_info *mtd)
> +{
> +       struct nand_on_die_control *ctrl = kzalloc(sizeof(*ctrl), GFP_KERNEL);
> +
> +       if (!ctrl)
> +               goto out;
> +
> +       ctrl->chkbuf = kzalloc(mtd->writesize + mtd->oobsize, GFP_KERNEL);
> +       ctrl->rawbuf = kzalloc(mtd->writesize + mtd->oobsize, GFP_KERNEL);
> +
> +       if (!ctrl->chkbuf || !ctrl->rawbuf) {
> +               kfree(ctrl->chkbuf);
> +               kfree(ctrl->rawbuf);
> +               kfree(ctrl);
> +               ctrl = NULL;
> +       }
> +
> +out:
> +       return ctrl;
> +}
> +
> +/**
> + * nand_on_die_destroy - Destroy on-die ECC private data
> + *
> + * @ctrl: on-die ECC private data
> + */
> +void nand_on_die_destroy(struct nand_on_die_control *ctrl)
> +{
> +       kfree(ctrl->chkbuf);
> +       kfree(ctrl->rawbuf);
> +       kfree(ctrl);
> +}
> +
> +static int __nand_setup_on_die_ecc_micron(struct mtd_info *mtd, int enable)
> +{
> +       struct nand_chip *chip = mtd->priv;
> +       uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {0};
> +
> +       feature[0] = enable ? ONFI_FEATURE_ENABLE_ON_DIE_ECC : 0;
> +
> +       return chip->onfi_set_features(mtd, chip,
> +                    ONFI_FEATURE_ADDR_ARRAY_OP_MODE, feature);
> +}
> +
> +/**
> + * nand_setup_on_die_ecc_micron - Enable/Disable on-die ECC mode
> + *
> + * @mtd: mtd info structure
> + * @enable: enables on-die ECC if non-zero
> + */
> +int nand_setup_on_die_ecc_micron(struct mtd_info *mtd, int enable)
> +{
> +       int ret;
> +       struct nand_chip *chip = mtd->priv;
> +
> +       if (chip->ecc.mode != NAND_ECC_HW_ON_DIE)
> +               return 0;
> +
> +       ret = __nand_setup_on_die_ecc_micron(mtd, enable);
> +       if (ret)
> +               pr_err("Unable to %sable on-die ECC!\n", enable ? "en" : "dis");
> +       return ret;
> +}
> +
> +/**
> + * nand_onfi_detect_on_die_ecc - Detect and handle on-die ECC
> + *
> + * @mtd: mtd info structure
> + */
> +void nand_onfi_detect_on_die_ecc(struct mtd_info *mtd)
> +{
> +       u8 features[ONFI_SUBFEATURE_PARAM_LEN];
> +       struct nand_chip *chip = mtd->priv;
> +
> +       if (chip->onfi_get_features(mtd, chip, ONFI_FEATURE_ADDR_ARRAY_OP_MODE,
> +                                   features) < 0)
> +               return;
> +
> +       if (features[0] & ONFI_FEATURE_ENABLE_ON_DIE_ECC &&
> +               chip->ecc.mode != NAND_ECC_HW_ON_DIE) {
> +
> +               pr_info("Requested ECC method is not on-die, disabling on-die ECC\n");
> +               __nand_setup_on_die_ecc_micron(mtd, 0);
> +       }
> +}
> +
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 3d4ea7e..5216704 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -101,6 +101,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  /* Status bits */
>  #define NAND_STATUS_FAIL       0x01
>  #define NAND_STATUS_FAIL_N1    0x02
> +#define NAND_STATUS_REWRITE    0x08
>  #define NAND_STATUS_TRUE_READY 0x20
>  #define NAND_STATUS_READY      0x40
>  #define NAND_STATUS_WP         0x80
> @@ -115,6 +116,7 @@ typedef enum {
>         NAND_ECC_HW_SYNDROME,
>         NAND_ECC_HW_OOB_FIRST,
>         NAND_ECC_SOFT_BCH,
> +       NAND_ECC_HW_ON_DIE,
>  } nand_ecc_modes_t;
>
>  /*
> @@ -219,6 +221,10 @@ struct nand_chip;
>  /* Vendor-specific feature address (Micron) */
>  #define ONFI_FEATURE_ADDR_READ_RETRY   0x89
>
> +/* Vendor-specific array operation mode (Micron) */
> +#define ONFI_FEATURE_ADDR_ARRAY_OP_MODE        0x90
> +#define ONFI_FEATURE_ENABLE_ON_DIE_ECC 0x08
> +
>  /* ONFI subfeature parameters length */
>  #define ONFI_SUBFEATURE_PARAM_LEN      4
>
> diff --git a/include/linux/mtd/nand_ondie.h b/include/linux/mtd/nand_ondie.h
> new file mode 100644
> index 0000000..b2ec2da
> --- /dev/null
> +++ b/include/linux/mtd/nand_ondie.h
> @@ -0,0 +1,40 @@
> +#ifndef __MTD_NAND_ONDIE_H__
> +#define __MTD_NAND_ONDIE_H__
> +
> +struct nand_on_die_control;
> +
> +#if defined(CONFIG_MTD_NAND_ECC_ON_DIE)
> +static inline int mtd_nand_has_on_die(void) { return 1; }
> +int nand_read_subpage_on_die(struct mtd_info *mtd,
> +                                   struct nand_chip *chip,
> +                                   uint32_t data_offs, uint32_t readlen,
> +                                   uint8_t *bufpoi, int page);
> +
> +int nand_read_page_on_die(struct mtd_info *mtd, struct nand_chip *chip,
> +                         uint8_t *buf, int oob_required, int page);
> +void nand_onfi_detect_on_die_ecc(struct mtd_info *mtd);
> +int nand_setup_on_die_ecc_micron(struct mtd_info *mtd, int enable);
> +struct nand_on_die_control *nand_on_die_init(struct mtd_info *mtd);
> +void nand_on_die_destroy(struct nand_on_die_control *ctrl);
> +#else /* !CONFIG_MTD_NAND_ECC_ON_DIE */
> +static inline int mtd_nand_has_on_die(void) { return 0; }
> +static inline int nand_read_subpage_on_die(struct mtd_info *mtd,
> +                                          struct nand_chip *chip,
> +                                          uint32_t data_offs,
> +                                          uint32_t readlen,
> +                                          uint8_t *bufpoi, int page)
> +{
> +       BUG();
> +}
> +
> +static inline int nand_read_page_on_die(struct mtd_info *mtd, struct nand_chip *chip,
> +                                       uint8_t *buf, int oob_required, int page)
> +{
> +       BUG();
> +}
> +static inline void nand_onfi_detect_on_die_ecc(struct mtd_info *mtd) { }
> +static inline int nand_setup_on_die_ecc_micron(struct mtd_info *mtd, int enable) { return -EINVAL; }
> +static inline struct nand_on_die_control *nand_on_die_init(struct mtd_info *mtd) { return NULL; }
> +static inline void nand_on_die_destroy(struct nand_on_die_control *ctrl) { }
> +#endif /* CONFIG_MTD_NAND_ECC_ON_DIE */
> +#endif /* __MTD_NAND_ONDIE_H__ */
> --
> 2.3.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
