Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eev5T-0005AZ-J9
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 08:55:06 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: hs@denx.de
In-Reply-To: <AHEILKONAKAEJPHNMOPNCEMHCDAA.hs@denx.de>
References: <AHEILKONAKAEJPHNMOPNCEMHCDAA.hs@denx.de>
Content-Type: text/plain
Date: Wed, 23 Nov 2005 15:00:08 +0100
Message-Id: <1132754409.32542.161.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]	MTD:	Add support for the PM82x Boards.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-11-23 at 13:37 +0100, Heiko Schocher wrote:
> +
> +#if 0	/* Debugging turned off */
> +# define debugk(fmt,args...)	printk(fmt ,##args)
> +#else
> +# define debugk(fmt,args...)
> +#endif

Please use pr_debug or DEBUG() with an appropriate MTD debug level.

+static struct mtd_info* mtd_banks[FLASH_BANK_MAX];
+static struct map_info* map_banks[FLASH_BANK_MAX];
+static struct mtd_part_def part_banks[FLASH_BANK_MAX];
+static unsigned long num_banks;
+static unsigned long start_scan_addr;

Please use __iomem void *start_scan_addr to avoid the back and forth
casting.

> +#ifdef CONFIG_MTD_PARTITIONS
> +/* partition definition for first (and only) flash bank
> + * also ref. to "drivers/char/flash_config.c"
> + */
> +static struct mtd_partition pm82x_partitions_8M[] = {
> +	{
> +		name:		"U-Boot",		/* U-Boot image		*/
> +		offset:		0x00000000,
> +		size:		0x00040000,		/* 256 KB		*/
> +	},
> +	{
> +		name:		"kernel",		/* Linux kernel image	*/
> +		offset:		0x00040000,
> +		size:		0x000C0000,		/* 768 KB		*/
> +	},
> +	{
> +		name:		"ramdisk",		/* Ramdisk image	*/
> +		offset:		0x00100000,
> +		size:		0x00300000,		/* 3 MB			*/
> +	},
> +	{
> +		name:		"user",			/* User file system	*/
> +		offset:		0x00400000,
> +		size:		0x00400000,		/* 4 MB			*/
> +	},
> +};

Please use C99 initializers. You might also change the offset
initializers to MTDPART_OFS_APPEND, so a size change is automatically
propagated. Change the last partition size to MTDPAR_SIZ_FULL

> +static struct mtd_partition pm82x_partitions_32M[] = {
> +	{
> +		name:		"U-Boot",		/* U-Boot image		*/
> +		offset:		0x00000000,
> +		size:		0x00040000,		/* 256 KB		*/
> +	},
> +	{
> +		name:		"kernel",		/* Linux kernel image	*/
> +		offset:		0x00040000,
> +		size:		0x000C0000,		/* 768 KB		*/
> +	},
> +	{
> +		name:		"ramdisk",		/* Ramdisk image	*/
> +		offset:		0x00100000,
> +		size:		0x00300000,		/* 3 MB			*/
> +	},
> +	{
> +		name:		"user",			/* User file system	*/
> +		offset:		0x00400000,
> +		size:		0x01C00000,		/* 28 MB		*/
> +	},
> +};

Same as above

> +#endif	/* CONFIG_MTD_PARTITIONS */
> +
> +#define NB_OF(x) (sizeof (x) / sizeof (x[0]))

Please use ARRAY_SIZE(x) instead.

> +int __init init_pm82x_mtd(void)
> +{
> +	int idx = 0, ret = 0;
> +	unsigned long flash_addr, flash_size, mtd_size = 0;
> +
> +	/* pointer to PM82x board info data */
> +	bd_t *bd = (bd_t *)__res;
> +
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> +	int n;
> +	char mtdid[10];
> +	const char *part_probes[] = { "cmdlinepart", NULL };
> +#endif
> +
> +	flash_addr = bd->bi_flashstart;
> +	flash_size = bd->bi_flashsize;
> +
> +	/* request maximum flash size address space */
> +	start_scan_addr = (unsigned long)ioremap(flash_addr, flash_size);
> +	if (!start_scan_addr) {
> +		printk("%s: Failed to ioremap address: 0x%lx\n",
> +			__FUNCTION__, flash_addr);

printk level is missing

> +		return -EIO;
> +	}
> +
> +	for(idx = 0 ; idx < FLASH_BANK_MAX ; idx++) {
> +		if (mtd_size >= flash_size)
> +			break;
> +
> +		debugk ("%s: chip probing count %d\n", __FUNCTION__, idx);
> +
> +		map_banks[idx] = (struct map_info *)kmalloc(sizeof(struct map_info),
> +							GFP_KERNEL);

No type cast necessary

> +		if (map_banks[idx] == NULL) {
> +			ret = -ENOMEM;
> +			goto error_mem;
> +		}
> +		memset((void *)map_banks[idx], 0, sizeof(struct map_info));


Same here

> +		map_banks[idx]->name = (char *)kmalloc(16, GFP_KERNEL);

Same here

Also please allocate map_info and name in one chunk.

		map_banks[idx] = kmalloc(sizeof(struct map_info) + 16, GFP_KERNEL);

Less memory fragments and makes the clean up path simpler.

> +		if (map_banks[idx]->name == NULL) {
> +			ret = -ENOMEM;
> +			goto error_mem;
> +		}
> +		memset((void *)map_banks[idx]->name, 0, 16);
> +		sprintf(map_banks[idx]->name, "PM82x-%d", idx);
> +		map_banks[idx]->size	  = flash_size;
> +		map_banks[idx]->bankwidth = 8;
> +		map_banks[idx]->read	  = pm82x_read64;
> +		map_banks[idx]->copy_from = pm82x_copy_from;
> +		map_banks[idx]->write	  = pm82x_write64;
> +		map_banks[idx]->copy_to	  = pm82x_copy_to;
> +		map_banks[idx]->map_priv_1=
> +			start_scan_addr + ((idx > 0) ?
> +			(mtd_banks[idx-1] ? mtd_banks[idx-1]->size : 0) : 0);
> +
> +		/* start to probe flash chips */
> +		mtd_banks[idx] = do_map_probe("jedec_probe", map_banks[idx]);
> +		if (mtd_banks[idx]) {
> +			mtd_banks[idx]->owner = THIS_MODULE;
> +			mtd_size += mtd_banks[idx]->size;
> +			num_banks++;
> +			debugk ("%s: bank %ld, name: %s, size: %d bytes \n",
> +				__FUNCTION__,
> +				num_banks,
> +				mtd_banks[idx]->name,
> +				mtd_banks[idx]->size);
> +		}
> +	}
> +
> +	/* no supported flash chips found */
> +	if (!num_banks) {
> +		printk("PM82x: No supported flash chips found!\n");

printk level missing

> +		ret = -ENXIO;
> +		goto error_mem;
> +	}
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +	/*
> +	 * Select static partition definitions
> +	 */
> +	if (flash_size == 0x800000) {
> +		part_banks[0].mtd_part	= pm82x_partitions_8M;
> +		part_banks[0].nums	= NB_OF(pm82x_partitions_8M);
> +	} else {
> +		part_banks[0].mtd_part	= pm82x_partitions_32M;
> +		part_banks[0].nums	= NB_OF(pm82x_partitions_32M);
> +	}
> +	part_banks[0].type	= "static image";
> +
> +	for(idx = 0; idx < num_banks ; idx++) {
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> +		sprintf(mtdid, "%d", idx);

Please move this into the debug print function, as mtdid is only used
for debug.

> +		n = parse_mtd_partitions(mtd_banks[idx],
> +						part_probes,
> +						&part_banks[idx].mtd_part,
> +						0);
> +		debugk ("%s: %d command line partitions on bank %s\n",
> +			__FUNCTION__, n, mtdid);
> +		if (n > 0) {
> +			part_banks[idx].type = "command line";
> +			part_banks[idx].nums = n;
> +		}
> +#endif	/* CONFIG_MTD_CMDLINE_PARTS */
> +
> +		if (part_banks[idx].nums == 0) {
> +			printk (KERN_NOTICE
> +					"PM82x flash bank %d: no partition info "
> +					"available, registering whole device\n", idx);
> +			add_mtd_device(mtd_banks[idx]);
> +		} else {
> +			printk (KERN_NOTICE
> +					"PM82x flash bank %d: Using %s partition "
> +					"definition\n", idx, part_banks[idx].type);
> +			add_mtd_partitions (mtd_banks[idx],
> +					part_banks[idx].mtd_part,
> +					part_banks[idx].nums);
> +		}
> +	}
> +#else	/* ! CONFIG_MTD_PARTITIONS */
> +	printk (KERN_NOTICE "PM82x flash: registering %d flash banks "
> +			"at once\n", num_banks);
> +
> +	for(idx = 0 ; idx < num_banks ; idx++) {
> +		add_mtd_device(mtd_banks[idx]);
> +	}

Please do not use braces for one liners

> +#endif	/* CONFIG_MTD_PARTITIONS */
> +
> +	return 0;
> +error_mem:
> +	for (idx = 0 ; idx < FLASH_BANK_MAX ; idx++) {
> +		if (map_banks[idx] != NULL) {
> +			if (map_banks[idx]->name != NULL) {
> +				kfree(map_banks[idx]->name);
> +				map_banks[idx]->name = NULL;
> +			}
> +			kfree(map_banks[idx]);
> +			map_banks[idx] = NULL;
> +		}
> +	}



When allocated in one chunk, the cleanup is simply	

	for (idx = 0 ; idx < FLASH_BANK_MAX ; idx++) {
		kfree(map_banks[idx]);
		map_banks[idx] = NULL;
	}

> +
> +	iounmap((void *)start_scan_addr);
> +	return ret;
> +}
> +
> +static void __exit cleanup_pm82x_mtd(void)
> +{
> +	unsigned int idx = 0;
> +	for(idx = 0 ; idx < num_banks ; idx++) {
> +		/* destroy mtd_info previously allocated */
> +		if (mtd_banks[idx]) {
> +			del_mtd_partitions(mtd_banks[idx]);
> +			map_destroy(mtd_banks[idx]);
> +		}
> +		/* release map_info not used anymore */
> +		kfree(map_banks[idx]->name);
> +		kfree(map_banks[idx]);
> +	}

See above

> +	if (start_scan_addr) {
> +		iounmap((void *)start_scan_addr);
> +		start_scan_addr = 0;
> +	}
> +}
> +


	tglx
