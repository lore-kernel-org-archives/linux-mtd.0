Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HFBVy-0003Cu-QQ
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 10:48:54 -0500
Subject: Re: [PATCH] eXcite nand flash driver
From: Thomas Gleixner <tglx@linutronix.de>
To: Thomas Koeller <thomas.koeller@baslerweb.com>
In-Reply-To: <200702080157.25432.thomas.koeller@baslerweb.com>
References: <200702080157.25432.thomas.koeller@baslerweb.com>
Content-Type: text/plain
Date: Thu, 08 Feb 2007 16:48:57 +0100
Message-Id: <1170949737.3646.29.camel@chaos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-02-08 at 01:57 +0100, Thomas Koeller wrote:

> +static inline const struct resource *excite_nand_get_resource
> +    (struct platform_device *d, unsigned long flags, const char *basename) {

Move curly bracket to new line.

> +	const char fmt[] = "%s_%u";

Please move the format into the snprintf

> +	char buf[80];
> +
> +	if (unlikely
> +	    (snprintf(buf, sizeof buf, fmt, basename, d->id) >= sizeof buf))
> +		return NULL;

Useless unlikely

> +	return platform_get_resource_byname(d, flags, buf);
> +}
> +
> +static inline io_reg_t
> +excite_nand_map_regs(struct platform_device *d, const char *basename)
> +{
> +	void *result = NULL;
> +	const struct resource *const r =
> +	    excite_nand_get_resource(d, IORESOURCE_MEM, basename);

Blank line between variable declaration and code.

> +	if (likely(r))
> +		result = ioremap_nocache(r->start, r->end + 1 - r->start);

Useless likely

> +	return result;
> +}


> +/* command and control functions */
> +static void excite_nand_control(struct mtd_info *mtd, int cmd,
> +				       unsigned int ctrl)
> +{
> +	io_reg_t regs =
> +	    container_of(mtd, struct excite_nand_drvdata, board_mtd)->regs;
> +	static void __iomem *tgt = NULL;
> +
> +	switch (ctrl) {
> +	case NAND_CTRL_CHANGE | NAND_CTRL_CLE:
> +		tgt = regs + EXCITE_NANDFLASH_CMD_BYTE;
> +		break;
> +	case NAND_CTRL_CHANGE | NAND_CTRL_ALE:
> +		tgt = regs + EXCITE_NANDFLASH_ADDR_BYTE;
> +		break;
> +	case NAND_CTRL_CHANGE | NAND_NCE:
> +		tgt = regs + EXCITE_NANDFLASH_DATA_BYTE;
> +		break;
> +	}

Err, did this ever work ? I doubt it. From nand_base.c:

                chip->cmd_ctrl(mtd, page_addr, ctrl);                                                                                                        
                ctrl &= ~NAND_CTRL_CHANGE;                                                                                                                   
                chip->cmd_ctrl(mtd, page_addr >> 8, ctrl);  

So I expect an OOPS happens on a regular base.

> +static int excite_nand_devready(struct mtd_info *mtd)
> +{
> +	struct excite_nand_drvdata * const drvdata =
> +	    container_of(mtd, struct excite_nand_drvdata, board_mtd);

Blank line missing

> +	return io_readb(drvdata->regs + EXCITE_NANDFLASH_STATUS_BYTE);
> +}
> +
> +/* excite_nand_remove
> + *
> + * called by device layer to remove the driver
> + * the binding to the mtd and all allocated
> + * resources are released
> + */
> +static int __exit excite_nand_remove(struct device *dev)
> +{
> +	struct excite_nand_drvdata * const this = dev_get_drvdata(dev);
> +
> +	dev_set_drvdata(dev, NULL);
> +
> +	if (unlikely(!this)) {
> +		printk(KERN_ERR "%s: called %s without private data!!",
> +		       module_id, __func__);
> +		return -EINVAL;
> +	}
> +
> +	/* first thing we need to do is release our mtd
> +	 * then go through freeing the resource used
> +	 */
> +	nand_release(&this->board_mtd);
> +
> +	/* free the common resources */
> +	if (likely(this->regs)) {

Why should you ever come here with no mapping ?

	tglx
