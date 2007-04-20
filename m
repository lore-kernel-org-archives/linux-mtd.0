Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HeoQt-0002CR-LA
	for linux-mtd@lists.infradead.org; Fri, 20 Apr 2007 04:25:33 -0400
Message-ID: <462878F9.2090603@ru.mvista.com>
Date: Fri, 20 Apr 2007 12:25:29 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
Subject: Re: [PATCH] NAND Flash support for Intel IXP4xx platform
References: <46274486.9030609@ru.mvista.com>
In-Reply-To: <46274486.9030609@ru.mvista.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ruslan V. Sushko wrote:
> +static struct ixp4xx_faddr_t {
> +	int offset;
> +	void (*chip_select)(unsigned int ctrl);
> +} ixp4xx_faddr_info = {0, NULL};
>   
ixp4xx_faddr_t is a nice name for a structure ;)
What the initialization to {0, NULL} is for?
Also, if this is a per-chip thing as might be concluded by placing its 
pointer into this->priv, why do you make it static structure?
Same goes for

> +static struct mtd_info *ixp4xx_mtd = NULL;
> +static struct mtd_partition *ixp4xx_nand_parts = NULL;
>   
> +
> +    for ( i = 0 ; i < len ; i++ )
> +        writeb(buf[i], this->IO_ADDR_W + addr_info->offset);
>   
Wrong whitespacing.
> +}
> +
> +static void
> +ixp4xx_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
> +{
> +	struct nand_chip *this = mtd->priv;
> +	struct ixp4xx_faddr_t *addr_info = this->priv;
> +	if (ctrl & NAND_CTRL_CHANGE) {
> +		addr_info->offset  = (ctrl & NAND_CLE) ? 1 : 0;
> +		addr_info->offset |= (ctrl & NAND_ALE) ? 2 : 0;
> +		if (addr_info->chip_select)
> +			addr_info->chip_select(ctrl);
> +	}
> +
> +	if (cmd != NAND_CMD_NONE)
> +		writeb(cmd, this->IO_ADDR_W + addr_info->offset);
> +}
>   
Wait please, can you explain the logic here?
It looks like you'll be writing by ixp_write_buf to different base 
addresses depending on how ctrl was set.
Is this the expected behavior?

> +	if ( nb_of_parts <= 0 )  { /* No partition from parsing, use default */
>   
Wrong whitespacing.
> +		printk(KERN_INFO "Loading default partition table\n");
> +		ixp4xx_nand_parts = plat->parts;
> +		nb_of_parts = plat->nr_parts;
> +	}
> +
> +	/* Register the partitions */
> +	err = add_mtd_partitions(ixp4xx_mtd, ixp4xx_nand_parts, nb_of_parts);
> +	if (err)  {
> +		printk(KERN_ERR "Failed to add MTD partitions\n");
> +		if ( ixp4xx_nand_parts != plat->parts )
> +		kfree(ixp4xx_nand_parts);
>   
Wrong indentation.
Moreover, if the number of partitions obtained by parse_mtd_partitions 
is the same as the one provided by platform data, you'll get leakage here.

Vitaly
