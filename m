Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5dkC-0000uP-Kj
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 12:46:29 +0000
Received: by wyb28 with SMTP id 28so3547545wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 05:46:26 -0700 (PDT)
Subject: Re: [PATCH V5 06/10] MIPS: lantiq: add NOR flash support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
In-Reply-To: <1301470076-17279-7-git-send-email-blogic@openwrt.org>
References: <1301470076-17279-1-git-send-email-blogic@openwrt.org>
	<1301470076-17279-7-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 15:43:52 +0300
Message-ID: <1301661832.2789.56.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

just few minor things.

On Wed, 2011-03-30 at 09:27 +0200, John Crispin wrote:
> +/* the NOR flash is connected to the same external bus unit (EBU) as PCI.
> + * To make PCI work we need to enable the endianess swapping of the addr
> + * written to the EBU. this however has some limitations and breaks when
> + * using NOR. it does not really matter if the onflash data is in a swapped
> + * order, however cfi sequences also fail. to workaround this we need to use
> + * a complex map. We essentially software swap all addresses during probe
> + * and then swizzle the unlock addresses.
> + */

Would be nice to clean-up the comment a little bit and use capital
letters at the start of the sentences. Also, I think the style for
multi-line comments is:

/*
 * bla
 * bla
 */


> +static void
> +ltq_copy_from(struct map_info *map, void *to,
> +	unsigned long from, ssize_t len)
> +{
> +	unsigned char *f = (unsigned char *) (map->virt + from);
> +	unsigned char *t = (unsigned char *) to;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ebu_lock, flags);
> +	while (len--)
> +		*t++ = *f++;
> +	spin_unlock_irqrestore(&ebu_lock, flags);

Can you use memcpy here instead?

> +}
> +
> +static void
> +ltq_copy_to(struct map_info *map, unsigned long to,
> +	const void *from, ssize_t len)
> +{
> +	unsigned char *f = (unsigned char *) from;
> +	unsigned char *t = (unsigned char *) (map->virt + to);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ebu_lock, flags);
> +	while (len--)
> +		*t++ = *f++;

Can you use memcpy here instead?

> +	spin_unlock_irqrestore(&ebu_lock, flags);
> +}
> +
> +static const char const *part_probe_types[] = {
> +	"cmdlinepart", NULL };

This can be one-liner, no need to make 2  lines.

> +
> +static struct map_info ltq_map = {
> +	.name = "ltq_nor",
> +	.bankwidth = 2,
> +	.read = ltq_read16,
> +	.write = ltq_write16,
> +	.copy_from = ltq_copy_from,
> +	.copy_to = ltq_copy_to,
> +};
> +
> +static int __init
> +ltq_mtd_probe(struct platform_device *pdev)
> +{
> +	struct physmap_flash_data *ltq_mtd_data =
> +		dev_get_platdata(&pdev->dev);

This can be one line - it takes only 79 characters.

> +	struct mtd_info *ltq_mtd = NULL;
> +	struct mtd_partition *parts = NULL;
> +	struct resource *res = 0;
You do not need this initialization.

> +	int nr_parts = 0;
> +	struct cfi_private *cfi;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "failed to get memory resource");
> +		return -ENOENT;
> +	}
> +	res = devm_request_mem_region(&pdev->dev, res->start,
> +		resource_size(res), dev_name(&pdev->dev));
> +	if (!res) {
> +		dev_err(&pdev->dev, "failed to request mem resource");
> +		return -EBUSY;
> +	}
> +
> +	ltq_map.phys = res->start;
> +	ltq_map.size = resource_size(res);
> +	ltq_map.virt = devm_ioremap_nocache(&pdev->dev, ltq_map.phys,
> +					ltq_map.size);
> +	if (!ltq_map.virt) {
> +		dev_err(&pdev->dev, "failed to ioremap!\n");
> +		return -EIO;
> +	}
> +
> +	ltq_mtd_probing = 1;
> +	ltq_mtd = do_map_probe("cfi_probe", &ltq_map);
> +	ltq_mtd_probing = 0;
> +	if (!ltq_mtd) {
> +		iounmap(ltq_map.virt);
> +		dev_err(&pdev->dev, "probing failed\n");
> +		return -ENXIO;
> +	}
> +	ltq_mtd->owner = THIS_MODULE;
> +
> +	cfi = ltq_map.fldrv_priv;
> +	cfi->addr_unlock1 ^= 1;
> +	cfi->addr_unlock2 ^= 1;
> +
> +	nr_parts = parse_mtd_partitions(ltq_mtd, part_probe_types, &parts, 0);
> +	if (nr_parts > 0) {
> +		dev_info(&pdev->dev,
> +			"using %d partitions from cmdline", nr_parts);
> +	} else {
> +		nr_parts = ltq_mtd_data->nr_parts;
> +		parts = ltq_mtd_data->parts;
> +	}
> +
> +	add_mtd_partitions(ltq_mtd, parts, nr_parts);

This function may return an error.

> +	return 0;
> +}
> +
> +static struct platform_driver ltq_mtd_driver = {
> +	.driver = {
> +		.name = "ltq_nor",
> +		.owner = THIS_MODULE,
> +	},
> +};
> +
> +int __init
> +init_ltq_mtd(void)
> +{
> +	int ret = platform_driver_probe(&ltq_mtd_driver, ltq_mtd_probe);
> +
> +	if (ret)
> +		printk(KERN_INFO "ltq_nor: error registering platfom driver");

I think errors should be printed with KERN_ERR level. Anyway, use
pr_err() here instead pleas.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
