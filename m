Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MvSbx-0006wf-FU
	for linux-mtd@lists.infradead.org; Wed, 07 Oct 2009 09:15:10 +0000
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MvSbv-0007Gs-KU
	for linux-mtd@lists.infradead.org; Wed, 07 Oct 2009 11:15:03 +0200
Received: from chipmunk.wormnet.eu ([195.195.131.226])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Oct 2009 11:15:03 +0200
Received: from alex by chipmunk.wormnet.eu with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Oct 2009 11:15:03 +0200
To: linux-mtd@lists.infradead.org
From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [PATCH 1/2] Update ts72xx to use generic platform nand driver
Date: Wed, 7 Oct 2009 09:16:19 +0100
Message-ID: <jbvtp6-i58.ln1@chipmunk.wormnet.eu>
References: <BD79186B4FD85F4B8E60E381CAEE190901DB7967@mi8nycmail19.Mi8.com>
Sender: news <news@ger.gmane.org>
Cc: linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In gmane.linux.drivers.mtd H Hartley Sweeten <hartleys@visionengravers.com> wrote:
>
> Update the ts72xx platform's nand driver support.
> 
> This changes the ts72xx platform from using a custom nand driver
> (ts7250.c) to the generic platform nand driver (plat_nand.c).
> 
> Tested on TS-7250 with 32MB NAND.
> 
> [snipped]
>
> +static const char *ts72xx_nand_part_probes[] = { "cmdlinepart", NULL };
> +
> +#define TS72XX_BOOTROM_PART_SIZE       (SZ_16K)
> +#define TS72XX_REDBOOT_PART_SIZE       (SZ_2M + SZ_1M)
> +
> +static struct mtd_partition ts72xx_part_info32[] = {
>        {
> -               .virtual        = TS72XX_NAND_DATA_VIRT_BASE,
> -               .pfn            = __phys_to_pfn(TS72XX_NAND1_DATA_PHYS_BASE),
> -               .length         = TS72XX_NAND_DATA_SIZE,
> -               .type           = MT_DEVICE,
> +               .name           = "TS-BOOTROM",
> +               .offset         = 0,
> +               .size           = TS72XX_BOOTROM_PART_SIZE,
>        }, {
> -               .virtual        = TS72XX_NAND_CONTROL_VIRT_BASE,
> -               .pfn            = __phys_to_pfn(TS72XX_NAND1_CONTROL_PHYS_BASE),
> -               .length         = TS72XX_NAND_CONTROL_SIZE,
> -               .type           = MT_DEVICE,
> +               .name           = "Linux",
> +               .offset         = MTDPART_OFS_APPEND,
> +               .size           = SZ_32M - TS72XX_REDBOOT_PART_SIZE,
>        }, {
> -               .virtual        = TS72XX_NAND_BUSY_VIRT_BASE,
> -               .pfn            = __phys_to_pfn(TS72XX_NAND1_BUSY_PHYS_BASE),
> -               .length         = TS72XX_NAND_BUSY_SIZE,
> -               .type           = MT_DEVICE,
> -       }
> +               .name           = "RedBoot",
> +               .offset         = MTDPART_OFS_APPEND,
> +               .size           = MTDPART_SIZ_FULL,
> +       },
> };
> 
> -static struct map_desc ts72xx_alternate_nand_io_desc[] __initdata = {
> +static struct mtd_partition ts72xx_part_info128[] = {
>        {
> -               .virtual        = TS72XX_NAND_DATA_VIRT_BASE,
> -               .pfn            = __phys_to_pfn(TS72XX_NAND2_DATA_PHYS_BASE),
> -               .length         = TS72XX_NAND_DATA_SIZE,
> -               .type           = MT_DEVICE,
> +               .name           = "TS-BOOTROM",
> +               .offset         = 0,
> +               .size           = TS72XX_BOOTROM_PART_SIZE,
>        }, {
> -               .virtual        = TS72XX_NAND_CONTROL_VIRT_BASE,
> -               .pfn            = __phys_to_pfn(TS72XX_NAND2_CONTROL_PHYS_BASE),
> -               .length         = TS72XX_NAND_CONTROL_SIZE,
> -               .type           = MT_DEVICE,
> +               .name           = "Linux",
> +               .offset         = MTDPART_OFS_APPEND,
> +               .size           = SZ_128M - TS72XX_REDBOOT_PART_SIZE,
>        }, {
> -               .virtual        = TS72XX_NAND_BUSY_VIRT_BASE,
> -               .pfn            = __phys_to_pfn(TS72XX_NAND2_BUSY_PHYS_BASE),
> -               .length         = TS72XX_NAND_BUSY_SIZE,
> -               .type           = MT_DEVICE,
> -       }
> +               .name           = "RedBoot",
> +               .offset         = MTDPART_OFS_APPEND,
> +               .size           = MTDPART_SIZ_FULL,
> +       },
> };
> 
These struct's are almost identical so could you not...

> -static void __init ts72xx_map_io(void)
> +static void ts72xx_nand_set_parts(uint64_t size,
> +                                 struct platform_nand_chip *chip)
> {
> -       ep93xx_map_io();
> -       iotable_init(ts72xx_io_desc, ARRAY_SIZE(ts72xx_io_desc));
> -
> -       /*
> -        * The TS-7200 has NOR flash, the other models have NAND flash.
> -        */
> -       if (!board_is_ts7200()) {
> -               if (is_ts9420_installed()) {
> -                       iotable_init(ts72xx_alternate_nand_io_desc,
> -                               ARRAY_SIZE(ts72xx_alternate_nand_io_desc));
> -               } else {
> -                       iotable_init(ts72xx_nand_io_desc,
> -                               ARRAY_SIZE(ts72xx_nand_io_desc));
> -               }
> +       switch (size) {
> +       case SZ_32M:
> +               chip->partitions = ts72xx_part_info32;
> +               chip->nr_partitions = ARRAY_SIZE(ts72xx_part_info32);
> +               break;
> +       case SZ_128M:
> +               chip->partitions = ts72xx_part_info128;
> +               chip->nr_partitions = ARRAY_SIZE(ts72xx_part_info128);
> +               break;
> +       default:
> +               pr_warning("ts72xx: Unknown nand disk size:%lluMB\n", size >> 20);
> +               break;
>        }
> }
> 
-----------
static struct mtd_partition ts72xx_part_info[] = {
	{
		/* gut feeling for *Joe Public* is to go MTD_WRITABLE */
		.name		= "TS-BOOTROM",
		.offset		= 0,
		.size		= TS72XX_BOOTROM_PART_SIZE,
	}, {
		.name		= "Linux",
		.offset		= MTDPART_OFS_APPEND,
		/* to be filled in later */
		.size		= 0,
	}, {
		/* mask MTD_WRITABLE here too? */
		.name		= "Redboot",
		.offset		= MTDPART_OFS_APPEND,
		.size		= MTDPART_SIZ_FULL,
	}
};

static void ts72xx_nand_set_parts(....)
{
	....

	/* or I guess you could just bailout... */
	if (size != SZ_32M && size != SZ_128M)
		pr_warning("ts72xx: Unknown nand disk size:%lluMB\n", size >> 20);

	chip->partitions = ts72xx_part_info;
	chip->nr_partitions = ARRAY_SIZE(ts72xx_part_info);

	ts72xx_part_info[1].size = size - TS72XX_REDBOOT_PART_SIZE;
}
---------

Cheers

-- 
Alexander Clouter
.sigmonster says: Life's too short to dance with ugly women.
