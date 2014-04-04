Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WW0n8-0004A3-Rr
 for linux-mtd@lists.infradead.org; Fri, 04 Apr 2014 09:52:08 +0000
Received: by mail-qg0-f49.google.com with SMTP id 63so57390qgz.36
 for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2014 02:51:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1394058429-2308-1-git-send-email-vincenzo.aliberti@gmail.com>
References: <20140227083724.GF13420@norris-Latitude-E6410>
 <1394058429-2308-1-git-send-email-vincenzo.aliberti@gmail.com>
Date: Fri, 4 Apr 2014 11:51:45 +0200
Message-ID: <CADBu1Qu_BkN+xp23akn11_k4A=tyQqgNrRW8r3OEynzkygCFeA@mail.gmail.com>
Subject: Re: mtd: lpddr: add driver for LPDDR2-NVM PCM memories
From: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,
   any feedback on this?

Regards,
   Vincenzo

On Wed, Mar 5, 2014 at 11:27 PM, Vincenzo Aliberti
<vincenzo.aliberti@gmail.com> wrote:
> Hi Brian,
>    here-below the version of driver modified as per your
> kind suggestion.
>
> Regards,
>    Vincenzo
>
> Signed-off-by: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
>
> ---
>  drivers/mtd/lpddr/Kconfig      |   12 +-
>  drivers/mtd/lpddr/Makefile     |    1 +
>  drivers/mtd/lpddr/lpddr2_nvm.c |  504 ++++++++++++++++++++++++++++++++++=
++++++
>  include/uapi/mtd/mtd-abi.h     |    1 +
>  4 files changed, 516 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mtd/lpddr/lpddr2_nvm.c
>
> diff --git a/drivers/mtd/lpddr/Kconfig b/drivers/mtd/lpddr/Kconfig
> index 265f969..94a7f30 100644
> --- a/drivers/mtd/lpddr/Kconfig
> +++ b/drivers/mtd/lpddr/Kconfig
> @@ -1,5 +1,5 @@
> -menu "LPDDR flash memory drivers"
> -       depends on MTD!=3Dn
> +menu "LPDDR & LPDDR2 PCM memory drivers"
> +       depends on MTD
>
>  config MTD_LPDDR
>         tristate "Support for LPDDR flash chips"
> @@ -17,4 +17,12 @@ config MTD_QINFO_PROBE
>             Window QINFO interface, permits software to be used for entir=
e
>             families of devices. This serves similar purpose of CFI on le=
gacy
>             Flash products
> +
> +config MTD_LPDDR2_NVM
> +       depends on MTD && ARM
> +       tristate "Support for LPDDR2-NVM flash chips"
> +       help
> +         This option enables support of PCM memories with a LPDDR2-NVM
> +         (Low power double data rate 2) interface.
> +
>  endmenu
> diff --git a/drivers/mtd/lpddr/Makefile b/drivers/mtd/lpddr/Makefile
> index da48e46..881d440 100644
> --- a/drivers/mtd/lpddr/Makefile
> +++ b/drivers/mtd/lpddr/Makefile
> @@ -4,3 +4,4 @@
>
>  obj-$(CONFIG_MTD_QINFO_PROBE)  +=3D qinfo_probe.o
>  obj-$(CONFIG_MTD_LPDDR)        +=3D lpddr_cmds.o
> +obj-$(CONFIG_MTD_LPDDR2_NVM) +=3D lpddr2_nvm.o
> diff --git a/drivers/mtd/lpddr/lpddr2_nvm.c b/drivers/mtd/lpddr/lpddr2_nv=
m.c
> new file mode 100644
> index 0000000..5d52c47
> --- /dev/null
> +++ b/drivers/mtd/lpddr/lpddr2_nvm.c
> @@ -0,0 +1,504 @@
> +/*
> + * LPDDR2-NVM MTD driver. This module provides read, write, erase, lock/=
unlock
> + * support for LPDDR2-NVM PCM memories
> + *
> + * Copyright =C2=A9 2012 Micron Technology, Inc.
> + *
> + * Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
> + * Domenico Manna <domenico.manna@gmail.com>
> + * Many thanks to Andrea Vigilante for initial enabling
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
> +#define pr_fmt(fmt) KBUILD_MODNAME ": %s: " fmt, __func__
> +
> +#include <linux/init.h>
> +#include <linux/io.h>
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
d */
> +#define WRITE_BUFFSIZE                 (0x00000400/2)  /* in Word */
> +#define OW_BASE_ADDRESS                        0x00000000      /* OW off=
set */
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
> +/*
> + * Build a map_word starting from an u_long
> + */
> +static inline map_word build_map_word(u_long myword)
> +{
> +       map_word val =3D { {0} };
> +       val.x[0] =3D myword;
> +       return val;
> +}
> +
> +/*
> + * Build Mode Register Configuration DataMask based on device bus-width
> + */
> +static inline u_int build_mr_cfgmask(u_int bus_width)
> +{
> +       u_int val =3D MR_CFGMASK;
> +
> +       if (bus_width =3D=3D 0x0004)                /* x32 device */
> +               val =3D val << 16;
> +
> +       return val;
> +}
> +
> +/*
> + * Build Status Register OK DataMask based on device bus-width
> + */
> +static inline u_int build_sr_ok_datamask(u_int bus_width)
> +{
> +       u_int val =3D SR_OK_DATAMASK;
> +
> +       if (bus_width =3D=3D 0x0004)                /* x32 device */
> +               val =3D (val << 16)+val;
> +
> +       return val;
> +}
> +
> +/*
> + * Evaluates Overlay Window Control Registers address
> + */
> +static inline u_long ow_reg_add(struct map_info *map, u_long offset)
> +{
> +       u_long val =3D 0;
> +       struct pcm_int_data *pcm_data =3D map->fldrv_priv;
> +
> +       val =3D map->pfow_base + offset*pcm_data->bus_width;
> +
> +       return val;
> +}
> +
> +/*
> + * Enable lpddr2-nvm Overlay Window
> + * Overlay Window is a memory mapped area containing all LPDDR2-NVM regi=
sters
> + * used by device commands as well as uservisible resources like Device =
Status
> + * Register, Device ID, etc
> + */
> +static inline void ow_enable(struct map_info *map)
> +{
> +       struct pcm_int_data *pcm_data =3D map->fldrv_priv;
> +
> +       writel_relaxed(build_mr_cfgmask(pcm_data->bus_width) | 0x18,
> +               pcm_data->reg_cfg);
> +       writel_relaxed(0x01, pcm_data->reg_data);
> +}
> +
> +/*
> + * Disable lpddr2-nvm Overlay Window
> + * Overlay Window is a memory mapped area containing all LPDDR2-NVM regi=
sters
> + * used by device commands as well as uservisible resources like Device =
Status
> + * Register, Device ID, etc
> + */
> +static inline void ow_disable(struct map_info *map)
> +{
> +       struct pcm_int_data *pcm_data =3D map->fldrv_priv;
> +
> +       writel_relaxed(build_mr_cfgmask(pcm_data->bus_width) | 0x18,
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
ked */
> +       u_long i, status_reg, prg_buff_ofs;
> +       struct pcm_int_data *pcm_data =3D map->fldrv_priv;
> +       u_int sr_ok_datamask =3D build_sr_ok_datamask(pcm_data->bus_width=
);
> +
> +       /* Builds low and high words for OW Control Registers */
> +       add_l.x[0]      =3D cmd_add & 0x0000FFFF;
> +       add_h.x[0]      =3D (cmd_add >> 16) & 0x0000FFFF;
> +       mpr_l.x[0]      =3D cmd_mpr & 0x0000FFFF;
> +       mpr_h.x[0]      =3D (cmd_mpr >> 16) & 0x0000FFFF;
> +       cmd.x[0]        =3D cmd_code & 0x0000FFFF;
> +       exec_cmd.x[0]   =3D 0x0001;
> +       data_l.x[0]     =3D cmd_data & 0x0000FFFF;
> +       data_h.x[0]     =3D (cmd_data >> 16) & 0x0000FFFF; /* only for 2x=
 x16 */
> +
> +       /* Set Overlay Window Control Registers */
> +       map_write(map, cmd, ow_reg_add(map, CMD_CODE_OFS));
> +       map_write(map, data_l, ow_reg_add(map, CMD_DATA_OFS));
> +       map_write(map, add_l, ow_reg_add(map, CMD_ADD_L_OFS));
> +       map_write(map, add_h, ow_reg_add(map, CMD_ADD_H_OFS));
> +       map_write(map, mpr_l, ow_reg_add(map, MPR_L_OFS));
> +       map_write(map, mpr_h, ow_reg_add(map, MPR_H_OFS));
> +       if (pcm_data->bus_width =3D=3D 0x0004) {    /* 2x16 devices stack=
ed */
> +               map_write(map, cmd, ow_reg_add(map, CMD_CODE_OFS) + 2);
> +               map_write(map, data_h, ow_reg_add(map, CMD_DATA_OFS) + 2)=
;
> +               map_write(map, add_l, ow_reg_add(map, CMD_ADD_L_OFS) + 2)=
;
> +               map_write(map, add_h, ow_reg_add(map, CMD_ADD_H_OFS) + 2)=
;
> +               map_write(map, mpr_l, ow_reg_add(map, MPR_L_OFS) + 2);
> +               map_write(map, mpr_h, ow_reg_add(map, MPR_H_OFS) + 2);
> +       }
> +
> +       /* Fill Program Buffer */
> +       if ((cmd_code =3D=3D LPDDR2_NVM_BUF_PROGRAM) ||
> +               (cmd_code =3D=3D LPDDR2_NVM_BUF_OVERWRITE)) {
> +               prg_buff_ofs =3D (map_read(map,
> +                       ow_reg_add(map, PRG_BUFFER_OFS))).x[0];
> +               for (i =3D 0; i < cmd_mpr; i++) {
> +                       map_write(map, build_map_word(buf[i]), map->pfow_=
base +
> +                       prg_buff_ofs + i);
> +               }
> +       }
> +
> +       /* Command Execute */
> +       map_write(map, exec_cmd, ow_reg_add(map, CMD_EXEC_OFS));
> +       if (pcm_data->bus_width =3D=3D 0x0004)      /* 2x16 devices stack=
ed */
> +               map_write(map, exec_cmd, ow_reg_add(map, CMD_EXEC_OFS) + =
2);
> +
> +       /* Status Register Check */
> +       do {
> +               sr =3D map_read(map, ow_reg_add(map, STATUS_REG_OFS));
> +               status_reg =3D sr.x[0];
> +               if (pcm_data->bus_width =3D=3D 0x0004) {/* 2x16 devices s=
tacked */
> +                       sr =3D map_read(map, ow_reg_add(map,
> +                               STATUS_REG_OFS) + 2);
> +                       status_reg +=3D sr.x[0] << 16;
> +               }
> +       } while ((status_reg & sr_ok_datamask) !=3D sr_ok_datamask);
> +
> +       return (((status_reg & sr_ok_datamask) =3D=3D sr_ok_datamask) ? 0=
 : -EIO);
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
> +       do {
> +               ret =3D lpddr2_nvm_do_op(map, block_op, 0x00, add, add, N=
ULL);
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
> +       map_word pfow_val[4];
> +       unsigned int found =3D 1;
> +
> +       mutex_lock(&lpdd2_nvm_mutex);
> +
> +       ow_enable(map);
> +
> +       /* Load string from array */
> +       pfow_val[0] =3D map_read(map, ow_reg_add(map, PFOW_QUERY_STRING_P=
));
> +       pfow_val[1] =3D map_read(map, ow_reg_add(map, PFOW_QUERY_STRING_F=
));
> +       pfow_val[2] =3D map_read(map, ow_reg_add(map, PFOW_QUERY_STRING_O=
));
> +       pfow_val[3] =3D map_read(map, ow_reg_add(map, PFOW_QUERY_STRING_W=
));
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
> +
> +       mutex_lock(&lpdd2_nvm_mutex);
> +
> +       *retlen =3D len;
> +
> +       map_copy_from(map, buf, start_add, *retlen);
> +
> +       mutex_unlock(&lpdd2_nvm_mutex);
> +       return 0;
> +}
> +
> +/*
> + * lpddr2_nvm driver write method
> + */
> +static int lpddr2_nvm_write(struct mtd_info *mtd, loff_t start_add,
> +                               size_t len, size_t *retlen, const u_char =
*buf)
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
> +       while (tot_len < target_len) {
> +               if (!(IS_ALIGNED(add, mtd->writesize))) { /* do sw progra=
m */
> +                       my_data =3D write_buf[tot_len];
> +                       my_data +=3D (write_buf[tot_len+1]) << 8;
> +                       if (pcm_data->bus_width =3D=3D 0x0004) {/* 2x16 d=
evices */
> +                               my_data +=3D (write_buf[tot_len+2]) << 16=
;
> +                               my_data +=3D (write_buf[tot_len+3]) << 24=
;
> +                       }
> +                       ret =3D lpddr2_nvm_do_op(map, LPDDR2_NVM_SW_OVERW=
RITE,
> +                               my_data, add, 0x00, NULL);
> +                       if (ret)
> +                               goto out;
> +
> +                       add +=3D pcm_data->bus_width;
> +                       tot_len +=3D pcm_data->bus_width;
> +               } else {                /* do buffer program */
> +                       current_len =3D min(target_len - tot_len,
> +                               (u_long) mtd->writesize);
> +                       ret =3D lpddr2_nvm_do_op(map, LPDDR2_NVM_BUF_OVER=
WRITE,
> +                               0x00, add, current_len, write_buf + tot_l=
en);
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
> +static int lpddr2_nvm_erase(struct mtd_info *mtd, struct erase_info *ins=
tr)
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
> +       return lpddr2_nvm_do_block_op(mtd, start_add, len, LPDDR2_NVM_UNL=
OCK);
> +}
> +
> +/*
> + * lpddr2_nvm driver lock method
> + */
> +static int lpddr2_nvm_lock(struct mtd_info *mtd, loff_t start_add,
> +       uint64_t len)
> +{
> +       return lpddr2_nvm_do_block_op(mtd, start_add, len, LPDDR2_NVM_LOC=
K);
> +}
> +
> +/*
> + * lpddr2_nvm driver probe method
> + */
> +static int lpddr2_nvm_probe(struct platform_device *pdev)
> +{
> +       struct map_info *map;
> +       struct mtd_info *mtd;
> +       struct resource *add_range =3D platform_get_resource(pdev,
> +                                               IORESOURCE_MEM, 0);
> +       struct resource *control_regs =3D platform_get_resource(pdev,
> +                                               IORESOURCE_MEM, 1);
> +       struct resource *buswidth =3D platform_get_resource(pdev,
> +                                               IORESOURCE_BUS, 0);
> +       struct pcm_int_data *pcm_data;
> +
> +       /* Allocate memory control_regs data structures */
> +       pcm_data =3D devm_kzalloc(&pdev->dev, sizeof(*pcm_data), GFP_KERN=
EL);
> +       if (!pcm_data)
> +               return -ENOMEM;
> +       pcm_data->reg_data =3D    (void *) control_regs->start;
> +       pcm_data->reg_cfg =3D     (void *) control_regs->end;
> +       pcm_data->bus_width =3D   (int) buswidth->start;
> +
> +       /* Allocate memory for map_info & mtd_info data structures */
> +       map =3D devm_kzalloc(&pdev->dev, sizeof(*map), GFP_KERNEL);
> +       if (!map)
> +               return -ENOMEM;
> +
> +       mtd =3D devm_kzalloc(&pdev->dev, sizeof(*mtd), GFP_KERNEL);
> +       if (!mtd)
> +               return -ENOMEM;
> +
> +       /* Reserve lpddr2_nvm address range */
> +       if (devm_request_mem_region(&pdev->dev, add_range->start,
> +               (add_range->end - add_range->start + 1),
> +               "lpddr2_nvm") =3D=3D NULL) {
> +               pr_err("Unable to reserve address range\n");
> +               return -EBUSY;
> +       }
> +
> +       /* Populate map_info data structure */
> +       *map =3D (struct map_info) {
> +               .virt           =3D devm_ioremap_nocache(&pdev->dev,
> +                               add_range->start, (add_range->end -
> +                               add_range->start + 1)),
> +               .name           =3D pdev->dev.init_name,
> +               .phys           =3D add_range->start,
> +               .size           =3D add_range->end - add_range->start + 1=
,
> +               .bankwidth      =3D pcm_data->bus_width/2,
> +               .pfow_base      =3D OW_BASE_ADDRESS,
> +               .fldrv_priv     =3D pcm_data,
> +       };
> +
> +       simple_map_init(map);   /* fill with default methods */
> +
> +       /* Populate mtd_info data structure */
> +       *mtd =3D (struct mtd_info) {
> +               .name           =3D pdev->dev.init_name,
> +               .type           =3D MTD_RAM,
> +               .priv           =3D map,
> +               .size           =3D add_range->end - add_range->start + 1=
,
> +               .erasesize      =3D ERASE_BLOCKSIZE * pcm_data->bus_width=
,
> +               .writesize      =3D 1,
> +               .writebufsize   =3D WRITE_BUFFSIZE * pcm_data->bus_width,
> +               .flags          =3D (MTD_CAP_NVRAM | MTD_POWERUP_LOCK),
> +               ._read          =3D lpddr2_nvm_read,
> +               ._write         =3D lpddr2_nvm_write,
> +               ._erase         =3D lpddr2_nvm_erase,
> +               ._unlock        =3D lpddr2_nvm_unlock,
> +               ._lock          =3D lpddr2_nvm_lock,
> +       };
> +
> +       /* Verify the presence of the device looking for PFOW string */
> +       if (!lpddr2_nvm_pfow_present(map)) {
> +               pr_err("device not recognized\n");
> +               return -EINVAL;
> +       }
> +       /* Register the mtd_partition structure */
> +       return mtd_add_partition(mtd, "my_pcm", 0x10000000, 0x00);
> +}
> +
> +/* Initialize platform_driver data structure for lpddr2_nvm */
> +static struct platform_driver lpddr2_nvm_drv =3D {
> +       .driver         =3D {
> +               .name   =3D "lpddr2_nvm",
> +       },
> +       .probe          =3D lpddr2_nvm_probe,
> +};
> +
> +module_platform_driver(lpddr2_nvm_drv);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Vincenzo Aliberti <vincenzo.aliberti@gmail.com>");
> +MODULE_DESCRIPTION("MTD driver for LPDDR2-NVM PCM memories");
> diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
> index 36eace0..8a2bbf2 100644
> --- a/include/uapi/mtd/mtd-abi.h
> +++ b/include/uapi/mtd/mtd-abi.h
> @@ -107,6 +107,7 @@ struct mtd_write_req {
>  /* Some common devices / combinations of capabilities */
>  #define MTD_CAP_ROM            0
>  #define MTD_CAP_RAM            (MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_=
NO_ERASE)
> +#define MTD_CAP_NVRAM          (MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_=
NO_ERASE)
>  #define MTD_CAP_NORFLASH       (MTD_WRITEABLE | MTD_BIT_WRITEABLE)
>  #define MTD_CAP_NANDFLASH      (MTD_WRITEABLE)
>
> --
> 1.7.9.5
>
