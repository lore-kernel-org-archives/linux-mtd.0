Received: from mail-qa0-x230.google.com ([2607:f8b0:400d:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Up4Z8-0004X3-LA
 for linux-mtd@lists.infradead.org; Tue, 18 Jun 2013 22:39:57 +0000
Received: by mail-qa0-f48.google.com with SMTP id cm16so34180qab.14
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2013 15:39:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1349385434-3073-1-git-send-email-valibert@micron.com>
References: <1349385434-3073-1-git-send-email-valibert@micron.com>
Date: Wed, 19 Jun 2013 00:39:33 +0200
Message-ID: <CADBu1QvPr_HUz2tRDkDhvhiXtkoNrK9vsaw7T0awk4a12_i+Ug@mail.gmail.com>
Subject: Re: [PATCH] [MTD] MTD driver for LPDDR2-NVM PCM memories
From: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: arnd@arndb.de, lporzio@micron.com, valibert@micron.com,
 vincenzo.aliberti@gmail.com, svenkatr@ti.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 4, 2012 at 11:17 PM, Vincenzo Aliberti
<vincenzo.aliberti@gmail.com> wrote:
>
> Dear All,
>     continuing Micron support activity on PCM memories you can find
> here-below a
> patch containing MTD driver for LPDDR2-NVM memories as demoed during Q2
> Linaro
> Connect in Hong Kong.
>
> Let me thank TI Panda open source team for support on platform enablement
> activity and Arnd for his first feedback on driver implementation
>
> Regards,
>         Vincenzo
>
>
> Signed-off-by: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
> ---
>  drivers/mtd/Kconfig                 |    2 +
>  drivers/mtd/Makefile                |    2 +-
>  drivers/mtd/lpddr2_nvm/Kconfig      |    9 +
>  drivers/mtd/lpddr2_nvm/Makefile     |    5 +
>  drivers/mtd/lpddr2_nvm/lpddr2_nvm.c |  547
> +++++++++++++++++++++++++++++++++++
>  include/mtd/mtd-abi.h               |    1 +
>  6 files changed, 565 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mtd/lpddr2_nvm/Kconfig
>  create mode 100644 drivers/mtd/lpddr2_nvm/Makefile
>  create mode 100644 drivers/mtd/lpddr2_nvm/lpddr2_nvm.c
>
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 27143e0..be277b9 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -326,6 +326,8 @@ source "drivers/mtd/onenand/Kconfig"
>
>  source "drivers/mtd/lpddr/Kconfig"
>
> +source "drivers/mtd/lpddr2_nvm/Kconfig"
> +
>  source "drivers/mtd/ubi/Kconfig"
>
>  endif # MTD
> diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
> index f901354..783310e 100644
> --- a/drivers/mtd/Makefile
> +++ b/drivers/mtd/Makefile
> @@ -30,6 +30,6 @@ obj-$(CONFIG_MTD_SWAP)                +=3D mtdswap.o
>  nftl-objs              :=3D nftlcore.o nftlmount.o
>  inftl-objs             :=3D inftlcore.o inftlmount.o
>
> -obj-y          +=3D chips/ lpddr/ maps/ devices/ nand/ onenand/ tests/
> +obj-y          +=3D chips/ lpddr/ maps/ devices/ nand/ onenand/ tests/
> lpddr2_nvm/
>
>  obj-$(CONFIG_MTD_UBI)          +=3D ubi/
> diff --git a/drivers/mtd/lpddr2_nvm/Kconfig
> b/drivers/mtd/lpddr2_nvm/Kconfig
> new file mode 100644
> index 0000000..a5cec65
> --- /dev/null
> +++ b/drivers/mtd/lpddr2_nvm/Kconfig
> @@ -0,0 +1,9 @@
> +menu "LPDDR2_NVM memory drivers"
> +       depends on MTD!=3Dn
> +
> +config MTD_LPDDR2_NVM
> +       tristate "Support for LPDDR2-NVM PCM memories"
> +       help
> +         This option enables support of LPDDR2-NVM (Low power double dat=
a
> rate 2)
> +         PCM memories.
> +endmenu
> diff --git a/drivers/mtd/lpddr2_nvm/Makefile
> b/drivers/mtd/lpddr2_nvm/Makefile
> new file mode 100644
> index 0000000..dc6fe27
> --- /dev/null
> +++ b/drivers/mtd/lpddr2_nvm/Makefile
> @@ -0,0 +1,5 @@
> +#
> +# linux/drivers/mtd/lpddr2_nvm/Makefile
> +#
> +
> +obj-$(CONFIG_MTD_LPDDR2_NVM)   +=3D lpddr2_nvm.o
> diff --git a/drivers/mtd/lpddr2_nvm/lpddr2_nvm.c
> b/drivers/mtd/lpddr2_nvm/lpddr2_nvm.c
> new file mode 100644
> index 0000000..9c97a9e
> --- /dev/null
> +++ b/drivers/mtd/lpddr2_nvm/lpddr2_nvm.c
> @@ -0,0 +1,547 @@
> +/*
> + * LPDDR2-NVM MTD driver. This module provides read, write, erase,
> lock/unlock
> + * support for LPDDR2-NVM PCM memories
> + *
> + * Copyright =C2=A9 2012 Micron Technology, Inc.
> + *
> + * Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
> + * Domenico Manna <domenico.manna@gmail.com>
> + * Many thanks to Andrea Vigilante for intial enabling
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> + * 02110-1301, USA.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/mtd/map.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/ioport.h>
> +#include <linux/sched.h>
> +
> +/* Parameters */
> +#define ERASE_BLOCKSIZE                        (0x00020000/2)  /* in Wor=
d
> */
> +#define WRITE_BUFFSIZE                 (0x00000400/2)  /* in Word */
> +#define OW_BASE_ADDRESS                        0x00000000      /* OW
> offset */
> +
> +/* PFOW symbols address offset */
> +#define PFOW_QUERY_STRING_P            (0x0000/2)      /* in Word */
> +#define PFOW_QUERY_STRING_F            (0x0002/2)      /* in Word */
> +#define PFOW_QUERY_STRING_O            (0x0004/2)      /* in Word */
> +#define PFOW_QUERY_STRING_W            (0x0006/2)      /* in Word */
> +
> +/* OW registers address */
> +#define CMD_CODE_OFS                   (0x0080/2)      /* in Word */
> +#define CMD_DATA_OFS                   (0x0084/2)      /* in Word */
> +#define CMD_ADD_L_OFS                  (0x0088/2)      /* in Word */
> +#define CMD_ADD_H_OFS                  (0x008A/2)      /* in Word */
> +#define MPR_L_OFS                      (0x0090/2)      /* in Word */
> +#define MPR_H_OFS                      (0x0092/2)      /* in Word */
> +#define CMD_EXEC_OFS                   (0x00C0/2)      /* in Word */
> +#define STATUS_REG_OFS                 (0x00CC/2)      /* in Word */
> +#define PRG_BUFFER_OFS                 (0x0010/2)      /* in Word */
> +
> +/* Datamask */
> +#define MR_CFGMASK                     0x8000
> +#define SR_OK_DATAMASK                 0x0080
> +
> +/* LPDDR2-NVM Commands */
> +#define LPDDR2_NVM_LOCK                        0x0061
> +#define LPDDR2_NVM_UNLOCK              0x0062
> +#define LPDDR2_NVM_SW_PROGRAM          0x0041
> +#define LPDDR2_NVM_SW_OVERWRITE                0x0042
> +#define LPDDR2_NVM_BUF_PROGRAM         0x00E9
> +#define LPDDR2_NVM_BUF_OVERWRITE       0x00EA
> +#define LPDDR2_NVM_ERASE               0x0020
> +
> +/*
> + * Internal Type Definitions
> + * pcm_int_data contains memory controller details:
> + * @reg_data : LPDDR2_MODE_REG_DATA register address after remapping
> + * @reg_cfg  : LPDDR2_MODE_REG_CFG register address after remapping
> + * &bus_width: memory bus-width (eg: x16 2 Bytes, x32 4 Bytes)
> + */
> +struct pcm_int_data {
> +       void __iomem *reg_data;
> +       void __iomem *reg_cfg;
> +       int bus_width;
> +};
> +
> +static DEFINE_MUTEX(lpdd2_nvm_mutex);
> +
> +static inline map_word build_map_word(u_long myword)
> +{
> +       map_word val =3D { {0} };
> +       val.x[0] =3D myword;
> +       return val;
> +}
> +
> +static inline u_int build_mr_cfgmaks(u_int bus_width)
> +{
> +       u_int val =3D MR_CFGMASK;
> +
> +       if (bus_width =3D=3D 0x0004)                /* x32 device */
> +               val =3D val<<16;
> +
> +       return val;
> +}
> +
> +static inline u_int build_sr_ok_datamask(u_int bus_width)
> +{
> +       u_int val =3D SR_OK_DATAMASK;
> +
> +       if (bus_width =3D=3D 0x0004)                /* x32 device */
> +               val =3D (val<<16)+val;
> +
> +       return val;
> +}
> +
> +/*
> + * Enable lpddr2-nvm Overlay Window
> + */
> +static inline void ow_enable(struct map_info *map)
> +{
> +       struct pcm_int_data *pcm_data =3D map->fldrv_priv;
> +
> +       writel_relaxed(build_mr_cfgmaks(pcm_data->bus_width) | 0x18,
> +               pcm_data->reg_cfg);
> +       writel_relaxed(0x01, pcm_data->reg_data);
> +}
> +
> +/*
> + * Disable lpddr2-nvm Overlay Window
> + */
> +static inline void ow_disable(struct map_info *map)
> +{
> +       struct pcm_int_data *pcm_data =3D map->fldrv_priv;
> +
> +       writel_relaxed(build_mr_cfgmaks(pcm_data->bus_width) | 0x18,
> +               pcm_data->reg_cfg);
> +       writel_relaxed(0x02, pcm_data->reg_data);
> +}
> +
> +/*
> + * Execute lpddr2-nvm operations
> + */
> +static int lpddr2_nvm_do_op(struct map_info *map, u_long cmd_code,
> +       u_long cmd_data, u_long cmd_add, u_long cmd_mpr, u_char *buf)
> +{
> +       map_word add_l =3D { {0} }, add_h =3D { {0} }, mpr_l =3D { {0} },
> +               mpr_h =3D { {0} }, data_l =3D { {0} }, cmd =3D { {0} },
> +               exec_cmd =3D { {0} }, sr;
> +       map_word data_h =3D { {0} };      /* only for 2x x16 devices stac=
ked
> */
> +       u_long i, status_reg, prg_buff_ofs;
> +       struct pcm_int_data *pcm_data =3D map->fldrv_priv;
> +       u_int sr_ok_datamask =3D build_sr_ok_datamask(pcm_data->bus_width=
);
> +
> +       /* Builds low and high words for OW Control Registers */
> +       add_l.x[0]      =3D cmd_add&0x0000FFFF;
> +       add_h.x[0]      =3D (cmd_add>>16)&0x0000FFFF;
> +       mpr_l.x[0]      =3D cmd_mpr&0x0000FFFF;
> +       mpr_h.x[0]      =3D (cmd_mpr>>16)&0x0000FFFF;
> +       cmd.x[0]        =3D cmd_code&0x0000FFFF;
> +       exec_cmd.x[0]   =3D 0x0001;
> +       data_l.x[0]     =3D cmd_data&0x0000FFFF;
> +       data_h.x[0]     =3D (cmd_data>>16)&0x0000FFFF; /* only for 2x x16=
 */
> +
> +       /* Set Overlay Window Control Registers */
> +       map_write(map, cmd,
> map->pfow_base+CMD_CODE_OFS*pcm_data->bus_width);
> +       map_write(map, data_l,
> map->pfow_base+CMD_DATA_OFS*pcm_data->bus_width);
> +       map_write(map, add_l,
> map->pfow_base+CMD_ADD_L_OFS*pcm_data->bus_width);
> +       map_write(map, add_h,
> map->pfow_base+CMD_ADD_H_OFS*pcm_data->bus_width);
> +       map_write(map, mpr_l,
> map->pfow_base+MPR_L_OFS*pcm_data->bus_width);
> +       map_write(map, mpr_h,
> map->pfow_base+MPR_H_OFS*pcm_data->bus_width);
> +       if (pcm_data->bus_width =3D=3D 0x0004) {    /* 2x16 devices stack=
ed */
> +               map_write(map, cmd, map->pfow_base +
> +                       CMD_CODE_OFS*pcm_data->bus_width + 2);
> +               map_write(map, data_h, map->pfow_base +
> +                       CMD_DATA_OFS*pcm_data->bus_width + 2);
> +               map_write(map, add_l, map->pfow_base +
> +                       CMD_ADD_L_OFS*pcm_data->bus_width + 2);
> +               map_write(map, add_h, map->pfow_base +
> +                       CMD_ADD_H_OFS*pcm_data->bus_width + 2);
> +               map_write(map, mpr_l, map->pfow_base +
> +                       MPR_L_OFS*pcm_data->bus_width + 2);
> +               map_write(map, mpr_h, map->pfow_base +
> +                       MPR_H_OFS*pcm_data->bus_width + 2);
> +       }
> +
> +       /* Fill Program Buffer */
> +       if ((cmd_code =3D=3D LPDDR2_NVM_BUF_PROGRAM) ||
> +               (cmd_code =3D=3D LPDDR2_NVM_BUF_OVERWRITE)) {
> +               prg_buff_ofs =3D (map_read(map, map->pfow_base +
> +                       PRG_BUFFER_OFS*pcm_data->bus_width)).x[0];
> +               for (i =3D 0; i < cmd_mpr; i++) {
> +                       map_write(map, build_map_word(buf[i]),
> map->pfow_base +
> +                       prg_buff_ofs + i);
> +               }
> +       }
> +
> +       /* Command Execute */
> +       map_write(map, exec_cmd, map->pfow_base+CMD_EXEC_OFS*
> +               pcm_data->bus_width);
> +       if (pcm_data->bus_width =3D=3D 0x0004)      /* 2x16 devices stack=
ed */
> +               map_write(map, exec_cmd, map->pfow_base +
> +                       CMD_EXEC_OFS*pcm_data->bus_width + 2);
> +
> +       /* Status Register Check */
> +       do {
> +               sr =3D map_read(map, map->pfow_base +
> +                       STATUS_REG_OFS*pcm_data->bus_width);
> +               status_reg =3D sr.x[0];
> +               if (pcm_data->bus_width =3D=3D 0x0004) {/* 2x16 devices
> stacked */
> +                       sr =3D map_read(map, map->pfow_base +
> +                               STATUS_REG_OFS*pcm_data->bus_width + 2);
> +                       status_reg +=3D sr.x[0]<<16;
> +               }
> +       } while ((status_reg&sr_ok_datamask) !=3D sr_ok_datamask);
> +
> +       return (((status_reg&sr_ok_datamask) =3D=3D sr_ok_datamask) ? 0 :
> -EIO);
> +}
> +
> +/*
> + * Execute lpddr2-nvm operations @ block level
> + */
> +static int lpddr2_nvm_do_block_op(struct mtd_info *mtd, loff_t start_add=
,
> +       uint64_t len, u_char block_op)
> +{
> +       struct map_info *map =3D mtd->priv;
> +       u_long add, end_add;
> +       int ret =3D 0;
> +
> +       mutex_lock(&lpdd2_nvm_mutex);
> +
> +       ow_enable(map);
> +
> +       add =3D start_add;
> +       end_add =3D add + len;
> +
> +       if ((add > mtd->size) || (end_add > mtd->size)) {
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       do {
> +               ret =3D lpddr2_nvm_do_op(map, block_op, 0x00, add, add,
> NULL);
> +               if (ret)
> +                       goto out;
> +               add +=3D mtd->erasesize;
> +       } while (add < end_add);
> +
> +out:
> +       ow_disable(map);
> +       mutex_unlock(&lpdd2_nvm_mutex);
> +       return ret;
> +}
> +
> +/*
> + * verify presence of PFOW string
> + */
> +static int lpddr2_nvm_pfow_present(struct map_info *map)
> +{
> +       struct pcm_int_data *pcm_data =3D map->fldrv_priv;
> +       map_word pfow_val[4];
> +       unsigned int found =3D 1;
> +
> +       mutex_lock(&lpdd2_nvm_mutex);
> +
> +       ow_enable(map);
> +
> +       /* Load string from array */
> +       pfow_val[0] =3D map_read(map, map->pfow_base + PFOW_QUERY_STRING_=
P *
> +                       pcm_data->bus_width);
> +       pfow_val[1] =3D map_read(map, map->pfow_base + PFOW_QUERY_STRING_=
F *
> +                       pcm_data->bus_width);
> +       pfow_val[2] =3D map_read(map, map->pfow_base + PFOW_QUERY_STRING_=
O *
> +                       pcm_data->bus_width);
> +       pfow_val[3] =3D map_read(map, map->pfow_base + PFOW_QUERY_STRING_=
W *
> +                       pcm_data->bus_width);
> +
> +       /* Verify the string loaded vs expected */
> +       if (!map_word_equal(map, build_map_word('P'), pfow_val[0]))
> +               found =3D 0;
> +       if (!map_word_equal(map, build_map_word('F'), pfow_val[1]))
> +               found =3D 0;
> +       if (!map_word_equal(map, build_map_word('O'), pfow_val[2]))
> +               found =3D 0;
> +       if (!map_word_equal(map, build_map_word('W'), pfow_val[3]))
> +               found =3D 0;
> +
> +       ow_disable(map);
> +
> +       mutex_unlock(&lpdd2_nvm_mutex);
> +
> +       return found;
> +}
> +
> +/*
> + * lpddr2_nvm driver read method
> + */
> +static int lpddr2_nvm_read(struct mtd_info *mtd, loff_t start_add,
> +                               size_t len, size_t *retlen, u_char *buf)
> +{
> +       struct map_info *map =3D mtd->priv;
> +       int ret =3D 0;
> +
> +       mutex_lock(&lpdd2_nvm_mutex);
> +
> +       *retlen =3D len;
> +
> +       if ((start_add + len) > mtd->size) {
> +               pr_alert("lpddr2_nvm: read out of memory range\n");
> +               *retlen =3D 0;
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       map_copy_from(map, buf, start_add, *retlen);
> +
> +out:
> +       mutex_unlock(&lpdd2_nvm_mutex);
> +       return ret;
> +}
> +
> +/*
> + * lpddr2_nvm driver write method
> + */
> +static int lpddr2_nvm_write(struct mtd_info *mtd, loff_t start_add,
> +                               size_t len, size_t *retlen, const u_char
> *buf)
> +{
> +       struct map_info *map =3D mtd->priv;
> +       struct pcm_int_data *pcm_data =3D map->fldrv_priv;
> +       u_long add, current_len, tot_len, target_len, my_data;
> +       u_char *write_buf =3D (u_char *)buf;
> +       int ret =3D 0;
> +
> +       mutex_lock(&lpdd2_nvm_mutex);
> +
> +       ow_enable(map);
> +
> +       /* Set start value for the variables */
> +       add =3D start_add;
> +       target_len =3D len;
> +       tot_len =3D 0;
> +
> +       if ((start_add + len) > mtd->size) {
> +               pr_alert("lpddr2_nvm: write out of memory range\n");
> +               *retlen =3D 0;
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       while (tot_len < target_len) {
> +               if (!(IS_ALIGNED(add, mtd->writesize))) { /* do sw progra=
m
> */
> +                       my_data =3D write_buf[tot_len];
> +                       my_data +=3D (write_buf[tot_len+1])<<8;
> +                       if (pcm_data->bus_width =3D=3D 0x0004) {/* 2x16
> devices */
> +                               my_data +=3D (write_buf[tot_len+2])<<16;
> +                               my_data +=3D (write_buf[tot_len+3])<<24;
> +                       }
> +                       ret =3D lpddr2_nvm_do_op(map,
> LPDDR2_NVM_SW_OVERWRITE,
> +                               my_data, add, 0x00, NULL);
> +                       if (ret)
> +                               goto out;
> +
> +                       add +=3D pcm_data->bus_width;
> +                       tot_len +=3D pcm_data->bus_width;
> +               } else {                /* do buffer program */
> +                       current_len =3D min(target_len - tot_len,
> +                               (u_long) mtd->writesize);
> +                       ret =3D lpddr2_nvm_do_op(map,
> LPDDR2_NVM_BUF_OVERWRITE,
> +                               0x00, add, current_len, write_buf +
> tot_len);
> +                       if (ret)
> +                               goto out;
> +
> +                       add +=3D current_len;
> +                       tot_len +=3D current_len;
> +               }
> +       }
> +
> +out:
> +       *retlen =3D tot_len;
> +       ow_disable(map);
> +       mutex_unlock(&lpdd2_nvm_mutex);
> +       return ret;
> +}
> +
> +/*
> + * lpddr2_nvm driver erase method
> + */
> +static int lpddr2_nvm_erase(struct mtd_info *mtd, struct erase_info
> *instr)
> +{
> +       int ret =3D lpddr2_nvm_do_block_op(mtd, instr->addr, instr->len,
> +               LPDDR2_NVM_ERASE);
> +       if (!ret) {
> +               instr->state =3D MTD_ERASE_DONE;
> +               mtd_erase_callback(instr);
> +       }
> +
> +       return ret;
> +}
> +
> +/*
> + * lpddr2_nvm driver unlock method
> + */
> +static int lpddr2_nvm_unlock(struct mtd_info *mtd, loff_t start_add,
> +       uint64_t len)
> +{
> +       return lpddr2_nvm_do_block_op(mtd, start_add, len,
> LPDDR2_NVM_UNLOCK);
> +}
> +
> +/*
> + * lpddr2_nvm driver lock method
> + */
> +static int lpddr2_nvm_lock(struct mtd_info *mtd, loff_t start_add,
> +       uint64_t len)
> +{
> +       return lpddr2_nvm_do_block_op(mtd, start_add, len,
> LPDDR2_NVM_LOCK);
> +}
> +
> +/*
> + * lpddr2_nvm driver probe method
> + */
> +static int lpddr2_nvm_probe(struct platform_device *pdev)
> +{
> +       int ret =3D 0;
> +       struct map_info *lpddr2_nvm_map;
> +       struct mtd_info *lpddr2_nvm_mtd;
> +       struct resource *address_range =3D platform_get_resource(pdev,
> +                                               IORESOURCE_MEM, 0);
> +       struct resource *control_regs =3D platform_get_resource(pdev,
> +                                               IORESOURCE_MEM, 1);
> +       struct resource *buswidth =3D platform_get_resource(pdev,
> +                                               IORESOURCE_BUS, 0);
> +       struct pcm_int_data *pcm_data;
> +
> +       /* Allocate memory control_regs data structures */
> +       pcm_data =3D kzalloc(sizeof(*pcm_data), GFP_KERNEL);
> +       if (!control_regs) {
> +               pr_alert(
> +               "lpddr2_nvm_probe: Failed to allocate memory for
> int_data\n");
> +               ret =3D 1;
> +               goto out;
> +       }
> +       pcm_data->reg_data =3D    (void *) control_regs->start;
> +       pcm_data->reg_cfg =3D     (void *) control_regs->end;
> +       pcm_data->bus_width =3D   (int) buswidth->start;
> +
> +       /* Allocate memory for map_info & mtd_info data structures */
> +       lpddr2_nvm_map =3D kzalloc(sizeof(*lpddr2_nvm_map), GFP_KERNEL);
> +       if (!lpddr2_nvm_map) {
> +               pr_alert(
> +               "lpddr2_nvm_probe: Failed to allocate memory for map\n");
> +               ret =3D 1;
> +               goto out;
> +       }
> +
> +       lpddr2_nvm_mtd =3D kzalloc(sizeof(*lpddr2_nvm_mtd), GFP_KERNEL);
> +       if (!lpddr2_nvm_mtd) {
> +               pr_alert(
> +               "lpddr2_nvm_probe: Failed to allocate memory for mtd\n");
> +               ret =3D 1;
> +               goto out;
> +       }
> +
> +       /* Reserve lpddr2_nvm address range */
> +       if (request_mem_region(address_range->start, (address_range->end =
-
> +               address_range->start + 1), "lpddr2_nvm") =3D=3D NULL) {
> +               pr_alert(
> +               "lpddr2_nvm_probe: Unable to reserve memory address
> %#010x\n",
> +               address_range->start);
> +               ret =3D -EBUSY;
> +               goto out;
> +       }
> +
> +       /* Populate map_info data structure */
> +       *lpddr2_nvm_map =3D (struct map_info) {
> +               .virt           =3D ioremap_nocache(address_range->start,
> +
> (address_range->end-address_range->start+1)),
> +               .name           =3D pdev->dev.init_name,
> +               .phys           =3D address_range->start,
> +               .size           =3D address_range->end -
> address_range->start + 1,
> +               .bankwidth      =3D pcm_data->bus_width/2,
> +               .pfow_base      =3D OW_BASE_ADDRESS,
> +               .fldrv_priv     =3D pcm_data,
> +       };
> +
> +       simple_map_init(lpddr2_nvm_map);        /* fill with default
> methods */
> +
> +       /* Populate mtd_info data structure */
> +       *lpddr2_nvm_mtd =3D (struct mtd_info) {
> +               .name           =3D pdev->dev.init_name,
> +               .type           =3D MTD_RAM,
> +               .priv           =3D lpddr2_nvm_map,
> +               .size           =3D address_range->end -
> address_range->start + 1,
> +               .erasesize      =3D ERASE_BLOCKSIZE * pcm_data->bus_width=
,
> +               .writesize      =3D 1,
> +               .writebufsize   =3D WRITE_BUFFSIZE * pcm_data->bus_width,
> +               .flags          =3D (MTD_CAP_PCM | MTD_POWERUP_LOCK),
> +               ._read          =3D lpddr2_nvm_read,
> +               ._read_oob      =3D NULL,
> +               ._write         =3D lpddr2_nvm_write,
> +               ._write_oob     =3D NULL,
> +               ._erase         =3D lpddr2_nvm_erase,
> +               ._unlock        =3D lpddr2_nvm_unlock,
> +               ._lock          =3D lpddr2_nvm_lock,
> +               ._sync          =3D NULL,
> +               ._suspend       =3D NULL,
> +               ._resume        =3D NULL,
> +               ._block_isbad   =3D NULL,
> +               ._block_markbad =3D NULL,
> +       };
> +
> +       /* Verify the presence of the device looking for PFOW string */
> +       if (lpddr2_nvm_pfow_present(lpddr2_nvm_map)) {
> +               pr_alert("lpddr2_nvm_probe: device recognized\n");
> +               /* Register the mtd_partition structure */
> +               if (mtd_add_partition(lpddr2_nvm_mtd, "my_pcm",
> 0x10000000,
> +                       0x00)){
> +                       pr_alert(
> +                       "lpddr2_nvm_probe: Failed to add mtd
> partition\n");
> +                       ret =3D 1;
> +                       goto out;
> +               }
> +               ret =3D 0;
> +       } else {
> +               pr_alert("%s: PFOW string not found at address %#010lx\n"=
,
> +                       lpddr2_nvm_map->name, lpddr2_nvm_map->pfow_base);
> +               ret =3D 1;
> +       }
> +
> +out:
> +       return ret;
> +}
> +
> +/* Initialize platform_driver data structure for lpddr2_nvm */
> +static struct platform_driver lpddr2_nvm_drv =3D {
> +       .driver         =3D {
> +               .name   =3D "lpddr2_nvm",
> +       },
> +       .probe          =3D lpddr2_nvm_probe,
> +       .remove         =3D NULL,
> +       .suspend        =3D NULL,
> +       .resume         =3D NULL,
> +};
> +
> +module_platform_driver(lpddr2_nvm_drv);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Vincenzo Aliberti <vincenzo.aliberti@gmail.com>");
> +MODULE_DESCRIPTION("MTD driver for LPDDR2-NVM PCM memories");
> +
> diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> index 36eace0..33f3036 100644
> --- a/include/mtd/mtd-abi.h
> +++ b/include/mtd/mtd-abi.h
> @@ -109,6 +109,7 @@ struct mtd_write_req {
>  #define MTD_CAP_RAM            (MTD_WRITEABLE | MTD_BIT_WRITEABLE |
> MTD_NO_ERASE)
>  #define MTD_CAP_NORFLASH       (MTD_WRITEABLE | MTD_BIT_WRITEABLE)
>  #define MTD_CAP_NANDFLASH      (MTD_WRITEABLE)
> +#define MTD_CAP_PCM            (MTD_WRITEABLE | MTD_BIT_WRITEABLE |
> MTD_NO_ERASE)
>
>  /* Obsolete ECC byte placement modes (used with obsolete MEMGETOOBSEL) *=
/
>  #define MTD_NANDECC_OFF                0       // Switch off ECC (Not
> recommended)
> --
> 1.7.9.5
>
