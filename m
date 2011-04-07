Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7pry-0007oo-Kk
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 14:07:37 +0000
Received: by wyb28 with SMTP id 28so2744652wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Apr 2011 07:07:32 -0700 (PDT)
Message-ID: <4D9DC4B7.2080706@mvista.com>
Date: Thu, 07 Apr 2011 18:05:43 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH V8] MIPS: lantiq: add NOR flash support
References: <1302013192-8854-1-git-send-email-blogic@openwrt.org>
In-Reply-To: <1302013192-8854-1-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

John Crispin wrote:

> This patch adds the driver/map for NOR devices attached to the SoC via the
> External Bus Unit (EBU).

> Signed-off-by: John Crispin <blogic@openwrt.org>
> Signed-off-by: Ralph Hempel <ralph.hempel@lantiq.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
> Cc: linux-mips@linux-mips.org
> Cc: linux-mtd@lists.infradead.org

> diff --git a/drivers/mtd/maps/lantiq.c b/drivers/mtd/maps/lantiq.c
> new file mode 100644
> index 0000000..4f8c320
> --- /dev/null
> +++ b/drivers/mtd/maps/lantiq.c
> @@ -0,0 +1,197 @@
[...]
> +/* 
> + * The NOR flash is connected to the same external bus unit (EBU) as PCI.
> + * To make PCI work we need to enable the endianess swapping for the address

    s/endianess/endianness/

> + * written to the EBU. This endianess swapping works for PCI correctly but

    Here too.

> + * fails for attached NOR devices. To workaround this we need to use a complex
> + * map. The workaround involves swapping all addresses whilste probing the chip.

    s/whilste/whilst/

> + * Once probing is complete we stop swapping the addresses but swizzle the
> + * unlock addresses to ensure that access to the NOR device works correctly.
> + */
> +
> +enum ltq_nor_state {
> +	LTQ_NOR_PROBING,
> +	LTQ_NOR_NORMAL
> +};
> +
> +static char ltq_map_name[] = "ltq_nor";
> +
> +static map_word
> +ltq_read16(struct map_info *map, unsigned long adr)
> +{
> +	unsigned long flags;
> +	map_word temp;
> +
> +	if (map->map_priv_1 == LTQ_NOR_PROBING)
> +		adr ^= 2;
> +	spin_lock_irqsave(&ebu_lock, flags);
> +	temp.x[0] = *((__u16 *)(map->virt + adr));

    Too many parens; the most external ones are not necessary.
    And why not just 'u16'?

> +	spin_unlock_irqrestore(&ebu_lock, flags);
> +	return temp;
> +}
> +
> +static void
> +ltq_write16(struct map_info *map, map_word d, unsigned long adr)
> +{
> +	unsigned long flags;
> +
> +	if (map->map_priv_1 == LTQ_NOR_PROBING)
> +		adr ^= 2;
> +	spin_lock_irqsave(&ebu_lock, flags);
> +	*((__u16 *)(map->virt + adr)) = d.x[0];

    Same here.

> +	spin_unlock_irqrestore(&ebu_lock, flags);
> +}
> +
> +/*
> + * The following 2 functions copy data between iomem and a cached memory
> + * section. As memcpy() makes use of pre-fetching we cannot use it here.
> + * The normal alternative of using memcpy_{to,from}io also makes use of
> + * memcpy() on MIPS so it is not applicable either. We are therefore stuck
> + * with having to use our own loop.
> + */
> +static void
> +ltq_copy_from(struct map_info *map, void *to,
> +	unsigned long from, ssize_t len)
> +{
> +	unsigned char *f = (unsigned char *) (map->virt + from);
> +	unsigned char *t = (unsigned char *) to;

    I think you should either always put a space between the type and value 
being cast or not -- you do both. :-)

> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ebu_lock, flags);
> +	while (len--)
> +		*t++ = *f++;

    I'm still not sure: you've implemented only 16-bit single read/write, yet 
you copy byte-by-byte? Does the byte access really work?

> +	spin_unlock_irqrestore(&ebu_lock, flags);
> +}
> +
[...]
> +static int __init
> +ltq_mtd_probe(struct platform_device *pdev)
> +{
> +	struct physmap_flash_data *ltq_mtd_data = dev_get_platdata(&pdev->dev);
> +	struct mtd_info *ltq_mtd = NULL;
> +	struct mtd_partition *parts = NULL;
> +	struct resource *res;
> +	int nr_parts = 0;
> +	struct cfi_private *cfi;
> +	struct map_info *ltq_map;
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
> +	ltq_map = kzalloc(sizeof(struct map_info), GFP_KERNEL);
> +	ltq_map->phys = res->start;
> +	ltq_map->size = resource_size(res);
> +	ltq_map->virt = devm_ioremap_nocache(&pdev->dev, ltq_map->phys,
> +					ltq_map->size);
> +	if (!ltq_map->virt) {
> +		kfree(ltq_map);

   You should do error cleanup in one places, using *goto* to jump to that code, 
to avoid duplicating the same code.

> +		dev_err(&pdev->dev, "failed to ioremap!\n");
> +		return -EIO;

    Rather -ENOMEM.

[...]
> +int __init
> +init_ltq_mtd(void)
> +{
> +	int ret = platform_driver_probe(&ltq_mtd_driver, ltq_mtd_probe);
> +
> +	if (ret)
> +		pr_err("ltq_nor: error registering platfom driver");

    s/platfom/platform/

> +	return ret;
> +}
> +
> +module_init(init_ltq_mtd);

    How about module_exit()?

WBR, Sergei
