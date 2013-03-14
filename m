Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG6wD-0002ld-9z
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 12:07:18 +0000
Received: by mail-ie0-f176.google.com with SMTP id k13so2846719iea.35
 for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2013 05:07:06 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1363258049-28157-1-git-send-email-dedekind1@gmail.com>
References: <1363258049-28157-1-git-send-email-dedekind1@gmail.com>
Date: Thu, 14 Mar 2013 21:07:06 +0900
Message-ID: <CAH9JG2Vv9PFnGd+jB4D0r8PzfUzqGvM5npYQ+73zHUEP8bSF1g@mail.gmail.com>
Subject: Re: [PATCH] mtd: onenand: remove OneNAND simulator
From: Kyungmin Park <kmpark@infradead.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Thu, Mar 14, 2013 at 7:47 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> This commit remove OneNAND simulator on the basis that it is useless.
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  drivers/mtd/onenand/Kconfig       |    6 -
>  drivers/mtd/onenand/Makefile      |    3 -
>  drivers/mtd/onenand/onenand_sim.c |  564 -------------------------------=
------
>  3 files changed, 573 deletions(-)
>  delete mode 100644 drivers/mtd/onenand/onenand_sim.c
>
> diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
> index 91467bb..a5c636b 100644
> --- a/drivers/mtd/onenand/Kconfig
> +++ b/drivers/mtd/onenand/Kconfig
> @@ -68,10 +68,4 @@ config MTD_ONENAND_2X_PROGRAM
>
>           And more recent chips
>
> -config MTD_ONENAND_SIM
> -       tristate "OneNAND simulator support"
> -       help
> -         The simulator may simulate various OneNAND flash chips for the
> -         OneNAND MTD layer.
> -
>  endif # MTD_ONENAND
> diff --git a/drivers/mtd/onenand/Makefile b/drivers/mtd/onenand/Makefile
> index 2b7884c..9d6540e 100644
> --- a/drivers/mtd/onenand/Makefile
> +++ b/drivers/mtd/onenand/Makefile
> @@ -10,7 +10,4 @@ obj-$(CONFIG_MTD_ONENAND_GENERIC)     +=3D generic.o
>  obj-$(CONFIG_MTD_ONENAND_OMAP2)                +=3D omap2.o
>  obj-$(CONFIG_MTD_ONENAND_SAMSUNG)       +=3D samsung.o
>
> -# Simulator
> -obj-$(CONFIG_MTD_ONENAND_SIM)          +=3D onenand_sim.o
> -
>  onenand-objs =3D onenand_base.o onenand_bbt.o
> diff --git a/drivers/mtd/onenand/onenand_sim.c b/drivers/mtd/onenand/onen=
and_sim.c
> deleted file mode 100644
> index 85399e3..0000000
> --- a/drivers/mtd/onenand/onenand_sim.c
> +++ /dev/null
> @@ -1,564 +0,0 @@
> -/*
> - *  linux/drivers/mtd/onenand/onenand_sim.c
> - *
> - *  The OneNAND simulator
> - *
> - *  Copyright =A9 2005-2007 Samsung Electronics
> - *  Kyungmin Park <kyungmin.park@samsung.com>
> - *
> - *  Vishak G <vishak.g at samsung.com>, Rohit Hagargundgi <h.rohit at sa=
msung.com>
> - *  Flex-OneNAND simulator support
> - *  Copyright (C) Samsung Electronics, 2008
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/slab.h>
> -#include <linux/module.h>
> -#include <linux/init.h>
> -#include <linux/vmalloc.h>
> -#include <linux/mtd/mtd.h>
> -#include <linux/mtd/partitions.h>
> -#include <linux/mtd/onenand.h>
> -
> -#include <linux/io.h>
> -
> -#ifndef CONFIG_ONENAND_SIM_MANUFACTURER
> -#define CONFIG_ONENAND_SIM_MANUFACTURER         0xec
> -#endif
> -
> -#ifndef CONFIG_ONENAND_SIM_DEVICE_ID
> -#define CONFIG_ONENAND_SIM_DEVICE_ID            0x04
> -#endif
> -
> -#define CONFIG_FLEXONENAND ((CONFIG_ONENAND_SIM_DEVICE_ID >> 9) & 1)
> -
> -#ifndef CONFIG_ONENAND_SIM_VERSION_ID
> -#define CONFIG_ONENAND_SIM_VERSION_ID           0x1e
> -#endif
> -
> -#ifndef CONFIG_ONENAND_SIM_TECHNOLOGY_ID
> -#define CONFIG_ONENAND_SIM_TECHNOLOGY_ID CONFIG_FLEXONENAND
> -#endif
> -
> -/* Initial boundary values for Flex-OneNAND Simulator */
> -#ifndef CONFIG_FLEXONENAND_SIM_DIE0_BOUNDARY
> -#define CONFIG_FLEXONENAND_SIM_DIE0_BOUNDARY   0x01
> -#endif
> -
> -#ifndef CONFIG_FLEXONENAND_SIM_DIE1_BOUNDARY
> -#define CONFIG_FLEXONENAND_SIM_DIE1_BOUNDARY   0x01
> -#endif
> -
> -static int manuf_id    =3D CONFIG_ONENAND_SIM_MANUFACTURER;
> -static int device_id   =3D CONFIG_ONENAND_SIM_DEVICE_ID;
> -static int version_id  =3D CONFIG_ONENAND_SIM_VERSION_ID;
> -static int technology_id =3D CONFIG_ONENAND_SIM_TECHNOLOGY_ID;
> -static int boundary[] =3D {
> -       CONFIG_FLEXONENAND_SIM_DIE0_BOUNDARY,
> -       CONFIG_FLEXONENAND_SIM_DIE1_BOUNDARY,
> -};
> -
> -struct onenand_flash {
> -       void __iomem *base;
> -       void __iomem *data;
> -};
> -
> -#define ONENAND_CORE(flash)            (flash->data)
> -#define ONENAND_CORE_SPARE(flash, this, offset)                         =
       \
> -       ((flash->data) + (this->chipsize) + (offset >> 5))
> -
> -#define ONENAND_MAIN_AREA(this, offset)                                 =
       \
> -       (this->base + ONENAND_DATARAM + offset)
> -
> -#define ONENAND_SPARE_AREA(this, offset)                               \
> -       (this->base + ONENAND_SPARERAM + offset)
> -
> -#define ONENAND_GET_WP_STATUS(this)                                    \
> -       (readw(this->base + ONENAND_REG_WP_STATUS))
> -
> -#define ONENAND_SET_WP_STATUS(v, this)                                 \
> -       (writew(v, this->base + ONENAND_REG_WP_STATUS))
> -
> -/* It has all 0xff chars */
> -#define MAX_ONENAND_PAGESIZE           (4096 + 128)
> -static unsigned char *ffchars;
> -
> -#if CONFIG_FLEXONENAND
> -#define PARTITION_NAME "Flex-OneNAND simulator partition"
> -#else
> -#define PARTITION_NAME "OneNAND simulator partition"
> -#endif
> -
> -static struct mtd_partition os_partitions[] =3D {
> -       {
> -               .name           =3D PARTITION_NAME,
> -               .offset         =3D 0,
> -               .size           =3D MTDPART_SIZ_FULL,
> -       },
> -};
> -
> -/*
> - * OneNAND simulator mtd
> - */
> -struct onenand_info {
> -       struct mtd_info         mtd;
> -       struct mtd_partition    *parts;
> -       struct onenand_chip     onenand;
> -       struct onenand_flash    flash;
> -};
> -
> -static struct onenand_info *info;
> -
> -#define DPRINTK(format, args...)                                       \
> -do {                                                                   \
> -       printk(KERN_DEBUG "%s[%d]: " format "\n", __func__,             \
> -                          __LINE__, ##args);                           \
> -} while (0)
> -
> -/**
> - * onenand_lock_handle - Handle Lock scheme
> - * @this:              OneNAND device structure
> - * @cmd:               The command to be sent
> - *
> - * Send lock command to OneNAND device.
> - * The lock scheme depends on chip type.
> - */
> -static void onenand_lock_handle(struct onenand_chip *this, int cmd)
> -{
> -       int block_lock_scheme;
> -       int status;
> -
> -       status =3D ONENAND_GET_WP_STATUS(this);
> -       block_lock_scheme =3D !(this->options & ONENAND_HAS_CONT_LOCK);
> -
> -       switch (cmd) {
> -       case ONENAND_CMD_UNLOCK:
> -       case ONENAND_CMD_UNLOCK_ALL:
> -               if (block_lock_scheme)
> -                       ONENAND_SET_WP_STATUS(ONENAND_WP_US, this);
> -               else
> -                       ONENAND_SET_WP_STATUS(status | ONENAND_WP_US, thi=
s);
> -               break;
> -
> -       case ONENAND_CMD_LOCK:
> -               if (block_lock_scheme)
> -                       ONENAND_SET_WP_STATUS(ONENAND_WP_LS, this);
> -               else
> -                       ONENAND_SET_WP_STATUS(status | ONENAND_WP_LS, thi=
s);
> -               break;
> -
> -       case ONENAND_CMD_LOCK_TIGHT:
> -               if (block_lock_scheme)
> -                       ONENAND_SET_WP_STATUS(ONENAND_WP_LTS, this);
> -               else
> -                       ONENAND_SET_WP_STATUS(status | ONENAND_WP_LTS, th=
is);
> -               break;
> -
> -       default:
> -               break;
> -       }
> -}
> -
> -/**
> - * onenand_bootram_handle - Handle BootRAM area
> - * @this:              OneNAND device structure
> - * @cmd:               The command to be sent
> - *
> - * Emulate BootRAM area. It is possible to do basic operation using Boot=
RAM.
> - */
> -static void onenand_bootram_handle(struct onenand_chip *this, int cmd)
> -{
> -       switch (cmd) {
> -       case ONENAND_CMD_READID:
> -               writew(manuf_id, this->base);
> -               writew(device_id, this->base + 2);
> -               writew(version_id, this->base + 4);
> -               break;
> -
> -       default:
> -               /* REVIST: Handle other commands */
> -               break;
> -       }
> -}
> -
> -/**
> - * onenand_update_interrupt - Set interrupt register
> - * @this:         OneNAND device structure
> - * @cmd:          The command to be sent
> - *
> - * Update interrupt register. The status depends on command.
> - */
> -static void onenand_update_interrupt(struct onenand_chip *this, int cmd)
> -{
> -       int interrupt =3D ONENAND_INT_MASTER;
> -
> -       switch (cmd) {
> -       case ONENAND_CMD_READ:
> -       case ONENAND_CMD_READOOB:
> -               interrupt |=3D ONENAND_INT_READ;
> -               break;
> -
> -       case ONENAND_CMD_PROG:
> -       case ONENAND_CMD_PROGOOB:
> -               interrupt |=3D ONENAND_INT_WRITE;
> -               break;
> -
> -       case ONENAND_CMD_ERASE:
> -               interrupt |=3D ONENAND_INT_ERASE;
> -               break;
> -
> -       case ONENAND_CMD_RESET:
> -               interrupt |=3D ONENAND_INT_RESET;
> -               break;
> -
> -       default:
> -               break;
> -       }
> -
> -       writew(interrupt, this->base + ONENAND_REG_INTERRUPT);
> -}
> -
> -/**
> - * onenand_check_overwrite - Check if over-write happened
> - * @dest:              The destination pointer
> - * @src:               The source pointer
> - * @count:             The length to be check
> - *
> - * Returns:            0 on same, otherwise 1
> - *
> - * Compare the source with destination
> - */
> -static int onenand_check_overwrite(void *dest, void *src, size_t count)
> -{
> -       unsigned int *s =3D (unsigned int *) src;
> -       unsigned int *d =3D (unsigned int *) dest;
> -       int i;
> -
> -       count >>=3D 2;
> -       for (i =3D 0; i < count; i++)
> -               if ((*s++ ^ *d++) !=3D 0)
> -                       return 1;
> -
> -       return 0;
> -}
> -
> -/**
> - * onenand_data_handle - Handle OneNAND Core and DataRAM
> - * @this:              OneNAND device structure
> - * @cmd:               The command to be sent
> - * @dataram:           Which dataram used
> - * @offset:            The offset to OneNAND Core
> - *
> - * Copy data from OneNAND Core to DataRAM (read)
> - * Copy data from DataRAM to OneNAND Core (write)
> - * Erase the OneNAND Core (erase)
> - */
> -static void onenand_data_handle(struct onenand_chip *this, int cmd,
> -                               int dataram, unsigned int offset)
> -{
> -       struct mtd_info *mtd =3D &info->mtd;
> -       struct onenand_flash *flash =3D this->priv;
> -       int main_offset, spare_offset, die =3D 0;
> -       void __iomem *src;
> -       void __iomem *dest;
> -       unsigned int i;
> -       static int pi_operation;
> -       int erasesize, rgn;
> -
> -       if (dataram) {
> -               main_offset =3D mtd->writesize;
> -               spare_offset =3D mtd->oobsize;
> -       } else {
> -               main_offset =3D 0;
> -               spare_offset =3D 0;
> -       }
> -
> -       if (pi_operation) {
> -               die =3D readw(this->base + ONENAND_REG_START_ADDRESS2);
> -               die >>=3D ONENAND_DDP_SHIFT;
> -       }
> -
> -       switch (cmd) {
> -       case FLEXONENAND_CMD_PI_ACCESS:
> -               pi_operation =3D 1;
> -               break;
> -
> -       case ONENAND_CMD_RESET:
> -               pi_operation =3D 0;
> -               break;
> -
> -       case ONENAND_CMD_READ:
> -               src =3D ONENAND_CORE(flash) + offset;
> -               dest =3D ONENAND_MAIN_AREA(this, main_offset);
> -               if (pi_operation) {
> -                       writew(boundary[die], this->base + ONENAND_DATARA=
M);
> -                       break;
> -               }
> -               memcpy(dest, src, mtd->writesize);
> -               /* Fall through */
> -
> -       case ONENAND_CMD_READOOB:
> -               src =3D ONENAND_CORE_SPARE(flash, this, offset);
> -               dest =3D ONENAND_SPARE_AREA(this, spare_offset);
> -               memcpy(dest, src, mtd->oobsize);
> -               break;
> -
> -       case ONENAND_CMD_PROG:
> -               src =3D ONENAND_MAIN_AREA(this, main_offset);
> -               dest =3D ONENAND_CORE(flash) + offset;
> -               if (pi_operation) {
> -                       boundary[die] =3D readw(this->base + ONENAND_DATA=
RAM);
> -                       break;
> -               }
> -               /* To handle partial write */
> -               for (i =3D 0; i < (1 << mtd->subpage_sft); i++) {
> -                       int off =3D i * this->subpagesize;
> -                       if (!memcmp(src + off, ffchars, this->subpagesize=
))
> -                               continue;
> -                       if (memcmp(dest + off, ffchars, this->subpagesize=
) &&
> -                           onenand_check_overwrite(dest + off, src + off=
, this->subpagesize))
> -                               printk(KERN_ERR "over-write happened at 0=
x%08x\n", offset);
> -                       memcpy(dest + off, src + off, this->subpagesize);
> -               }
> -               /* Fall through */
> -
> -       case ONENAND_CMD_PROGOOB:
> -               src =3D ONENAND_SPARE_AREA(this, spare_offset);
> -               /* Check all data is 0xff chars */
> -               if (!memcmp(src, ffchars, mtd->oobsize))
> -                       break;
> -
> -               dest =3D ONENAND_CORE_SPARE(flash, this, offset);
> -               if (memcmp(dest, ffchars, mtd->oobsize) &&
> -                   onenand_check_overwrite(dest, src, mtd->oobsize))
> -                       printk(KERN_ERR "OOB: over-write happened at 0x%0=
8x\n",
> -                              offset);
> -               memcpy(dest, src, mtd->oobsize);
> -               break;
> -
> -       case ONENAND_CMD_ERASE:
> -               if (pi_operation)
> -                       break;
> -
> -               if (FLEXONENAND(this)) {
> -                       rgn =3D flexonenand_region(mtd, offset);
> -                       erasesize =3D mtd->eraseregions[rgn].erasesize;
> -               } else
> -                       erasesize =3D mtd->erasesize;
> -
> -               memset(ONENAND_CORE(flash) + offset, 0xff, erasesize);
> -               memset(ONENAND_CORE_SPARE(flash, this, offset), 0xff,
> -                      (erasesize >> 5));
> -               break;
> -
> -       default:
> -               break;
> -       }
> -}
> -
> -/**
> - * onenand_command_handle - Handle command
> - * @this:              OneNAND device structure
> - * @cmd:               The command to be sent
> - *
> - * Emulate OneNAND command.
> - */
> -static void onenand_command_handle(struct onenand_chip *this, int cmd)
> -{
> -       unsigned long offset =3D 0;
> -       int block =3D -1, page =3D -1, bufferram =3D -1;
> -       int dataram =3D 0;
> -
> -       switch (cmd) {
> -       case ONENAND_CMD_UNLOCK:
> -       case ONENAND_CMD_LOCK:
> -       case ONENAND_CMD_LOCK_TIGHT:
> -       case ONENAND_CMD_UNLOCK_ALL:
> -               onenand_lock_handle(this, cmd);
> -               break;
> -
> -       case ONENAND_CMD_BUFFERRAM:
> -               /* Do nothing */
> -               return;
> -
> -       default:
> -               block =3D (int) readw(this->base + ONENAND_REG_START_ADDR=
ESS1);
> -               if (block & (1 << ONENAND_DDP_SHIFT)) {
> -                       block &=3D ~(1 << ONENAND_DDP_SHIFT);
> -                       /* The half of chip block */
> -                       block +=3D this->chipsize >> (this->erase_shift +=
 1);
> -               }
> -               if (cmd =3D=3D ONENAND_CMD_ERASE)
> -                       break;
> -
> -               page =3D (int) readw(this->base + ONENAND_REG_START_ADDRE=
SS8);
> -               page =3D (page >> ONENAND_FPA_SHIFT);
> -               bufferram =3D (int) readw(this->base + ONENAND_REG_START_=
BUFFER);
> -               bufferram >>=3D ONENAND_BSA_SHIFT;
> -               bufferram &=3D ONENAND_BSA_DATARAM1;
> -               dataram =3D (bufferram =3D=3D ONENAND_BSA_DATARAM1) ? 1 :=
 0;
> -               break;
> -       }
> -
> -       if (block !=3D -1)
> -               offset =3D onenand_addr(this, block);
> -
> -       if (page !=3D -1)
> -               offset +=3D page << this->page_shift;
> -
> -       onenand_data_handle(this, cmd, dataram, offset);
> -
> -       onenand_update_interrupt(this, cmd);
> -}
> -
> -/**
> - * onenand_writew - [OneNAND Interface] Emulate write operation
> - * @value:             value to write
> - * @addr:              address to write
> - *
> - * Write OneNAND register with value
> - */
> -static void onenand_writew(unsigned short value, void __iomem * addr)
> -{
> -       struct onenand_chip *this =3D info->mtd.priv;
> -
> -       /* BootRAM handling */
> -       if (addr < this->base + ONENAND_DATARAM) {
> -               onenand_bootram_handle(this, value);
> -               return;
> -       }
> -       /* Command handling */
> -       if (addr =3D=3D this->base + ONENAND_REG_COMMAND)
> -               onenand_command_handle(this, value);
> -
> -       writew(value, addr);
> -}
> -
> -/**
> - * flash_init - Initialize OneNAND simulator
> - * @flash:             OneNAND simulator data strucutres
> - *
> - * Initialize OneNAND simulator.
> - */
> -static int __init flash_init(struct onenand_flash *flash)
> -{
> -       int density, size;
> -       int buffer_size;
> -
> -       flash->base =3D kzalloc(131072, GFP_KERNEL);
> -       if (!flash->base) {
> -               printk(KERN_ERR "Unable to allocate base address.\n");
> -               return -ENOMEM;
> -       }
> -
> -       density =3D device_id >> ONENAND_DEVICE_DENSITY_SHIFT;
> -       density &=3D ONENAND_DEVICE_DENSITY_MASK;
> -       size =3D ((16 << 20) << density);
> -
> -       ONENAND_CORE(flash) =3D vmalloc(size + (size >> 5));
> -       if (!ONENAND_CORE(flash)) {
> -               printk(KERN_ERR "Unable to allocate nand core address.\n"=
);
> -               kfree(flash->base);
> -               return -ENOMEM;
> -       }
> -
> -       memset(ONENAND_CORE(flash), 0xff, size + (size >> 5));
> -
> -       /* Setup registers */
> -       writew(manuf_id, flash->base + ONENAND_REG_MANUFACTURER_ID);
> -       writew(device_id, flash->base + ONENAND_REG_DEVICE_ID);
> -       writew(version_id, flash->base + ONENAND_REG_VERSION_ID);
> -       writew(technology_id, flash->base + ONENAND_REG_TECHNOLOGY);
> -
> -       if (density < 2 && (!CONFIG_FLEXONENAND))
> -               buffer_size =3D 0x0400;   /* 1KiB page */
> -       else
> -               buffer_size =3D 0x0800;   /* 2KiB page */
> -       writew(buffer_size, flash->base + ONENAND_REG_DATA_BUFFER_SIZE);
> -
> -       return 0;
> -}
> -
> -/**
> - * flash_exit - Clean up OneNAND simulator
> - * @flash:             OneNAND simulator data structures
> - *
> - * Clean up OneNAND simulator.
> - */
> -static void flash_exit(struct onenand_flash *flash)
> -{
> -       vfree(ONENAND_CORE(flash));
> -       kfree(flash->base);
> -}
> -
> -static int __init onenand_sim_init(void)
> -{
> -       /* Allocate all 0xff chars pointer */
> -       ffchars =3D kmalloc(MAX_ONENAND_PAGESIZE, GFP_KERNEL);
> -       if (!ffchars) {
> -               printk(KERN_ERR "Unable to allocate ff chars.\n");
> -               return -ENOMEM;
> -       }
> -       memset(ffchars, 0xff, MAX_ONENAND_PAGESIZE);
> -
> -       /* Allocate OneNAND simulator mtd pointer */
> -       info =3D kzalloc(sizeof(struct onenand_info), GFP_KERNEL);
> -       if (!info) {
> -               printk(KERN_ERR "Unable to allocate core structures.\n");
> -               kfree(ffchars);
> -               return -ENOMEM;
> -       }
> -
> -       /* Override write_word function */
> -       info->onenand.write_word =3D onenand_writew;
> -
> -       if (flash_init(&info->flash)) {
> -               printk(KERN_ERR "Unable to allocate flash.\n");
> -               kfree(ffchars);
> -               kfree(info);
> -               return -ENOMEM;
> -       }
> -
> -       info->parts =3D os_partitions;
> -
> -       info->onenand.base =3D info->flash.base;
> -       info->onenand.priv =3D &info->flash;
> -
> -       info->mtd.name =3D "OneNAND simulator";
> -       info->mtd.priv =3D &info->onenand;
> -       info->mtd.owner =3D THIS_MODULE;
> -
> -       if (onenand_scan(&info->mtd, 1)) {
> -               flash_exit(&info->flash);
> -               kfree(ffchars);
> -               kfree(info);
> -               return -ENXIO;
> -       }
> -
> -       mtd_device_register(&info->mtd, info->parts,
> -                           ARRAY_SIZE(os_partitions));
> -
> -       return 0;
> -}
> -
> -static void __exit onenand_sim_exit(void)
> -{
> -       struct onenand_chip *this =3D info->mtd.priv;
> -       struct onenand_flash *flash =3D this->priv;
> -
> -       onenand_release(&info->mtd);
> -       flash_exit(flash);
> -       kfree(ffchars);
> -       kfree(info);
> -}
> -
> -module_init(onenand_sim_init);
> -module_exit(onenand_sim_exit);
> -
> -MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");
> -MODULE_DESCRIPTION("The OneNAND flash simulator");
> -MODULE_LICENSE("GPL");
> --
> 1.7.10.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
