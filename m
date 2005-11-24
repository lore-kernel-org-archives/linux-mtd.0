Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfFDh-0000Us-27
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2005 06:24:58 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Stefan Roese <sr@denx.de>
In-Reply-To: <200511231311.51467.sr@denx.de>
References: <AHEILKONAKAEJPHNMOPNIELBCDAA.hs@denx.de>
	<200511231311.51467.sr@denx.de>
Content-Type: text/plain
Date: Thu, 24 Nov 2005 12:29:56 +0100
Message-Id: <1132831796.32542.183.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: Add P3P440 MTD support
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-11-23 at 13:11 +0100, Stefan Roese wrote:
> This patch adds MTD support (NOR FLASH) for the Prodrive P3P440
> (440GP) PMC module.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
>
> +config MTD_P3P440
> +       tristate "Flash devices mapped on Prodrive P3P440"
> +       depends on MTD_CFI && P3P440
> +       help
> +         This enables access routined for the flash chips on the Prodrive

routined ?

> +         P3P440 board.  If you have this board and would like to use the
> +         flash chips on it, say 'Y'.
> +
> +#define RW_PART0_OF    0
> +#define RW_PART0_SZ    0x180000
> +#define RW_PART1_OF    RW_PART0_OF + RW_PART0_SZ
> +#define RW_PART1_SZ    0x280000
> +#define RW_PART2_OF    RW_PART1_OF + RW_PART1_SZ
> +/* Partition 2 will be autosized dynamically... */
> +#define RW_PART3_SZ    0x40000
> +#define RW_PART4_SZ    0x40000
> +
> +static struct mtd_partition p3p440_flash_partitions[] = {
> +       {
> +               .name = "kernel",
> +               .offset = RW_PART0_OF,
> +               .size = RW_PART0_SZ
> +       },
> +       {
> +               .name = "root",
> +               .offset = RW_PART1_OF,

Please use .offset = MTDPART_OFS_APPEND,

> +               .size = RW_PART1_SZ,
> +       },
> +       {
> +               .name = "user",
> +               .offset = RW_PART2_OF,

Please use .offset = MTDPART_OFS_APPEND,

> +/*             .size = RW_PART2_SZ */ /* will be adjusted dynamically */
> +       },
> +       {
> +               .name = "env",
> +/*             .offset = RW_PART3_OF, */ /* will be adjusted dynamically */

Please use .offset = MTDPART_OFS_APPEND,

> +               .size = RW_PART3_SZ,
> +       },
> +       {
> +               .name = "u-boot",
> +/*             .offset = RW_PART4_OF, */ /* will be adjusted dynamically */

Please use .offset = MTDPART_OFS_APPEND,

> +               .size = RW_PART4_SZ,
> +       }
> +};
> +
> +struct map_info p3p440_flash_map = {

static

> +       .name = "p3p440-flash",
> +       .bankwidth = 2,
> +};
> +
> +static struct mtd_info *p3p440_mtd;
> +
> +int __init init_p3p440_flash(void)

static

> +{
> +       unsigned long long flash_base;
> +       unsigned long flash_size;
> +
> +       flash_base = __res.bi_flashstart | 0x0000000100000000LL;
> +       flash_size = __res.bi_flashsize;
> +
> +       p3p440_flash_map.size = flash_size;
> +       p3p440_flash_map.phys = flash_base;
> +       p3p440_flash_map.virt = ioremap64(flash_base,
> +                                         p3p440_flash_map.size);
> +
> +
> +       if (!p3p440_flash_map.virt) {
> +               printk("init_p3p440_flash: failed to ioremap\n");

printk log level missing

> +               return -EIO;
> +       }
> +
> +       /*
> +        * Adjust partitions to flash size
> +        */
> +       p3p440_flash_partitions[2].size = p3p440_flash_map.size -
> +               RW_PART0_SZ - RW_PART1_SZ - RW_PART3_SZ - RW_PART4_SZ;

<NOT_NECESSARY_WITH_MTD_OFS_APPEND>
> +       p3p440_flash_partitions[3].offset = p3p440_flash_partitions[2].size +
> +               RW_PART2_OF;
> +       p3p440_flash_partitions[4].offset = p3p440_flash_partitions[3].size +
> +               p3p440_flash_partitions[3].offset;
> +
</NOT_NECESSARY_WITH_MTD_OFS_APPEND>


> +       simple_map_init(&p3p440_flash_map);
> +
> +       p3p440_mtd = do_map_probe("cfi_probe", &p3p440_flash_map);
> +
> +       if (p3p440_mtd) {
> +               p3p440_mtd->owner = THIS_MODULE;
> +               return add_mtd_partitions(p3p440_mtd,
> +                                         p3p440_flash_partitions,
> +                                         ARRAY_SIZE(p3p440_flash_partitions));
> +       }
> +
> +       return -ENXIO;
> +}
> +
> +static void __exit cleanup_p3p440_flash(void)
> +{
> +       if (p3p440_mtd) {
> +               del_mtd_partitions(p3p440_mtd);
> +               /* moved iounmap after map_destroy - armin */

Is this comment relevant for understanding the code ?
	
> +               map_destroy(p3p440_mtd);
> +               iounmap((void *)p3p440_flash_map.virt);

Bogus type cast	of void* to void*

> +       }
> +}
> +
> +module_init(init_p3p440_flash);
> +module_exit(cleanup_p3p440_flash);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Stefan Roese <sr@denx.de>");
> +MODULE_DESCRIPTION("MTD map and partitions for Prodrive P3P440 board");

	
	tglx
