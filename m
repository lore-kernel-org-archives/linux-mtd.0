Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6M8X-0005mX-Gz
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2012 13:47:22 +0000
Received: by obbta17 with SMTP id ta17so11071698obb.36
 for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2012 06:47:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346048155-28829-1-git-send-email-zajec5@gmail.com>
References: <1346048155-28829-1-git-send-email-zajec5@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 28 Aug 2012 15:46:57 +0200
Message-ID: <CAOiHx=mdnprqvxzm+127o+dqEo28LM78yZ8GQ1FLfaPiOVPhrg@mail.gmail.com>
Subject: Re: [PATCH V3] mtd: bcm47part driver for BCM47XX chipsets
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI Rafa=C5=82,

nice to see a trx partition parser. Btw, I would also prefer to use
bcm47xx<foo> instead of bcm47<foo>, for the same reasons given by
Kevin - consistency with the naming in other parts (especially since
the mips target using it is called "bcm47xx", so it's clearer that it
belongs to it).

As a nitpick for future revisions, please don't send patches base64
encoded (as this one is).

On 27 August 2012 08:15, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> This driver provides parser detecting partitions on BCM47XX flash
> memories. It has many differences in comparision to older BCM63XX, like:

Nitpick: BCM63XX isn't older, just different ;) Also typo, it should
be "comparison".

> 1) Different CFE with no more trivial MAGICs
> 2) More partitions types (board_data, ML, POT)
> 3) Supporting more than 1 flash on a device
> which resulted in decision of writing new parser.
>
> It uses generic mtd interface and was successfully tested with Netgear
> WNDR4500 router which has 2 flash memories: serial one and NAND one.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
> After talking with OpenWRT guys, it's now clear behaviour of this patch
> is correct. We register partitions like they are, without any additional
> garbage. Re-sending V3 without RFC.
>
> V2: 1) Add support for more partitinos (ML and POT)
>     2) Optimize: don't scan whole flash (like up to 128 MiB)
>     3) Optimize: don't scan TRX partitions after detecting header
>
> V3: 1) More defines less magic numbers
>     2) Less duplication by adding bcm47part_add_part
>     3) Mask out MTD_WRITEABLE only when needed
> ---
>  drivers/mtd/Kconfig     |    4 +
>  drivers/mtd/Makefile    |    1 +
>  drivers/mtd/bcm47part.c |  188 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 193 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/bcm47part.c
>
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index ee2330f..b7db855 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -156,6 +156,10 @@ config MTD_BCM63XX_PARTS
>           This provides partions parsing for BCM63xx devices with CFE
>           bootloaders.
>
> +config MTD_BCM47_PARTS
> +       tristate "BCM47XX partitioning support"
> +       depends on BCM47XX
> +
>  comment "User Modules And Translation Layers"
>
>  config MTD_CHAR
> diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
> index f901354..dac90e6 100644
> --- a/drivers/mtd/Makefile
> +++ b/drivers/mtd/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_MTD_CMDLINE_PARTS) +=3D cmdlinepart.o
>  obj-$(CONFIG_MTD_AFS_PARTS)    +=3D afs.o
>  obj-$(CONFIG_MTD_AR7_PARTS)    +=3D ar7part.o
>  obj-$(CONFIG_MTD_BCM63XX_PARTS)        +=3D bcm63xxpart.o
> +obj-$(CONFIG_MTD_BCM47_PARTS)  +=3D bcm47part.o
>
>  # 'Users' - code which presents functionality to userspace.
>  obj-$(CONFIG_MTD_CHAR)         +=3D mtdchar.o
> diff --git a/drivers/mtd/bcm47part.c b/drivers/mtd/bcm47part.c
> new file mode 100644
> index 0000000..2a9c027
> --- /dev/null
> +++ b/drivers/mtd/bcm47part.c
> @@ -0,0 +1,188 @@
> +/*
> + * BCM47XX MTD partitioning
> + *
> + * Copyright (C) 2012 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <asm/mach-bcm47xx/nvram.h>
> +
> +/* 10 parts were found on sflash on Netgear WNDR4500 */
> +#define BCM47PART_MAX_PARTS            12
> +
> +/* Amount of bytes we read when analyzing each block of flash memory.
> + * Set it big enough to allow detecting partition and reading important =
data. */

Nitpick: the proper multi line style is
/*
 * foo
 */

> +#define BCM47PART_BYTES_TO_READ                0x401
> +
> +/* Magics */
> +#define BOARD_DATA_MAGIC               0x5246504D      /* MPFR */
> +#define POT_MAGIC1                     0x54544f50      /* POTT */
> +#define POT_MAGIC2                     0x504f          /* OP */
> +#define ML_MAGIC1                      0x39685a42
> +#define ML_MAGIC2                      0x26594131
> +#define TRX_MAGIC                      0x30524448
> +
> +struct trx_header {
> +       u32 magic;
> +       u32 length;
> +       u32 crc32;
> +       u16 flags;
> +       u16 version;
> +       u32 offset[3];
> +} __packed;
> +
> +static void bcm47part_add_part(struct mtd_partition *part, char *name,
> +                              u64 offset, u32 mask_flags)
> +{
> +       part->name =3D name;
> +       part->offset =3D offset;
> +       part->mask_flags =3D mask_flags;
> +}
> +
> +static int bcm47part_parse(struct mtd_info *master,
> +                          struct mtd_partition **pparts,
> +                          struct mtd_part_parser_data *data)
> +{
> +       struct mtd_partition *parts;
> +       u8 i, curr_part =3D 0;
> +       u8 *buf;
> +       u32 *fourcc, *fourcc2;
> +       size_t bytes_read;
> +       u32 offset;
> +       u32 blocksize =3D 0x10000;
> +       struct trx_header *trx;
> +
> +       /* Alloc */
> +       parts =3D kzalloc(sizeof(struct mtd_partition) * BCM47PART_MAX_PA=
RTS,
> +                       GFP_KERNEL);
> +       buf =3D kzalloc(sizeof(*buf) * BCM47PART_BYTES_TO_READ, GFP_KERNE=
L);
> +
> +       /* Parse block by block looking for magics */
> +       for (offset =3D 0; offset <=3D master->size - blocksize;
> +            offset +=3D blocksize) {
> +               /* Nothing more in higher memory */
> +               if (offset >=3D 0x2000000)
> +                       break;
> +
> +               /* Read beginning of the block */
> +               if (mtd_read(master, offset, BCM47PART_BYTES_TO_READ,
> +                   &bytes_read, buf) < 0) {

Wrong indentation: it needs to be aligned to the opening parenthesis
of mtd_read.

> +                       pr_err("mtd_read error while parsing (offset: 0x%=
X)!\n",
> +                              offset);
> +                       continue;
> +               }
> +
> +               /* CFE has small NVRAM at 0x400 */
> +               fourcc =3D (u32 *)&buf[0x400];

buf is only 0x401 bytes big, but here pointing to bytes 0x400-0x403 -
does this even work?

> +               if (*fourcc =3D=3D NVRAM_HEADER)

Hm, why not make buf a u32 array instead of u8; then you wouldn't need
to cast to u32 and could directly access the contents.

So you could then do
               if (buf[0x100] =3D=3D NVRAM_HEADER)

> +                       bcm47part_add_part(&parts[curr_part++], "boot", o=
ffset,
> +                                          MTD_WRITEABLE);
> +
> +               /* Standard NVRAM */
> +               fourcc =3D (u32 *)&buf[0x000];
> +               if (*fourcc =3D=3D NVRAM_HEADER)
> +                       bcm47part_add_part(&parts[curr_part++], "nvram", =
offset,
> +                                          0);

Shouldn't you add a continue here if the NVRAM header was found? I
think it's quite unlikely that NVRAM will share its block with a
different partition. On the other hand, I wouldn't rule out that an
nvram partition could accidentally trigger one of the other
heuristics.

> +
> +               /* board_data starts with board_id which differs across b=
oards,
> +                * but we can use 'MPFR' (hopefully) magic at 0x100 */

Comment style nitpick.

> +               fourcc =3D (u32 *)&buf[0x100];
> +               if (*fourcc =3D=3D BOARD_DATA_MAGIC)
> +                       bcm47part_add_part(&parts[curr_part++], "board_da=
ta",
> +                                          offset, MTD_WRITEABLE);

same continue comment here.

> +
> +               /* POT(TOP) */
> +               fourcc =3D (u32 *)&buf[0x000];
> +               fourcc2 =3D (u32 *)&buf[0x004];
> +               if (*fourcc =3D=3D POT_MAGIC1 &&
> +                   (*fourcc2 & 0xFFFF) =3D=3D POT_MAGIC2)
> +                       bcm47part_add_part(&parts[curr_part++], "POT", of=
fset,
> +                                          MTD_WRITEABLE);

same continue comment here.

> +
> +               /* ML */
> +               fourcc =3D (u32 *)&buf[0x010];
> +               fourcc2 =3D (u32 *)&buf[0x014];
> +               if (*fourcc =3D=3D ML_MAGIC1 && *fourcc2 =3D=3D ML_MAGIC2=
)
> +                       bcm47part_add_part(&parts[curr_part++], "ML", off=
set,
> +                                          MTD_WRITEABLE);

and here.

> +
> +               /* TRX */
> +               fourcc =3D (u32 *)&buf[0x000];
> +               if (*fourcc =3D=3D TRX_MAGIC) {
> +                       trx =3D (struct trx_header *)buf;
> +
> +                       i =3D 0;
> +                       /* We have LZMA loader if offset[2] points to sth=
 */
> +                       if (trx->offset[2]) {
> +                               /* TODO: should we add LZMA loader partit=
ion? */
> +                               i++;
> +                       }
> +
> +                       bcm47part_add_part(&parts[curr_part++], "linux",
> +                                          offset + trx->offset[i], 0);
> +                       i++;
> +
> +                       /* Pure rootfs size is known and can be calculate=
d as:
> +                        * trx->length - trx->offset[i]. We don't fill it=
 as
> +                        * we want to have jffs2 (overlay) in the same mt=
d. */

Comment style.

> +                       bcm47part_add_part(&parts[curr_part++], "rootfs",
> +                                          offset + trx->offset[i], 0);
> +                       i++;
> +
> +                       /* We have whole TRX scanned, skip to the next pa=
rt. Use
> +                        * roundown (not roundup), as the loop will incre=
ase
> +                        * offset in next step. */

Comment style.

> +                       offset =3D rounddown(offset + trx->length, blocks=
ize);
> +               }
> +
> +               if (curr_part =3D=3D BCM47PART_MAX_PARTS) {
> +                       pr_warn("Reached maximum number of partitions, sc=
anning stopped!\n");
> +                       break;
> +               }
> +       }
> +
> +       /* We can't read sizes of some (most of) partitions. Assume that
> +        * these partitions end at the beginning of the one they are
> +        * followed by. */

etc pp.

> +       for (i =3D 0; i < curr_part - 1; i++) {
> +               if (parts[i].size =3D=3D 0)

Can this ever be not true? You allocated zeroed memory and never set
size in the code above, so I think you can drop this.

> +                       parts[i].size =3D parts[i + 1].offset - parts[i].=
offset;
> +       }
> +       if (curr_part > 0 && parts[curr_part - 1].size =3D=3D 0)

Same regarding checking parts[curr_part - 1].size.

> +               parts[curr_part - 1].size =3D
> +                               master->size - parts[curr_part - 1].offse=
t;
> +
> +       *pparts =3D parts;
> +       return curr_part;
> +};


Regards
Jonas
