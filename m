Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5389CCE8D6B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwJNF4BIIL8AIhjbENypdcNJxOW8gzENESBbSedVtK0=; b=GDqD6phpcRZeUN
	577Eu/ihcgARf4tTASTQJEXNbxVuBNaamgQxD12Airhf85VZJjBxwmlT3hZkDFZ8Fl9Be2QHbUdqX
	AjBy6Q3NPwh/pPLRK/77O7b0qFNW2MqMf4+UvXjtg2EgbkP6ylKKpGSV1GleZJzEf8a3IU+X5CWRR
	pseZb6eEqxIAfLb5L2fljH3qKBboQI05PP+DOg1LUBzBlc41fec4g8V6y96/zoXAprKwuncSfs9uL
	B1Ka+Ym8s7m+QRfVTe9HaXwhAzLQQVxHYBVqv2zNolsv7G+3L9sNWpI9MK0jO08x0GX4yvAOfAO4Q
	kmGraOJwkkzV7MWRaJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3ai-0000000GaAr-2zsE;
	Mon, 17 Nov 2025 18:04:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3ag-0000000GaAN-3Jsz;
	Mon, 17 Nov 2025 18:04:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CE3C42DAA;
	Mon, 17 Nov 2025 18:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56BEC19421;
	Mon, 17 Nov 2025 18:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763402678;
	bh=uOLDv+dSnQNXJ5E+kO0jdhKf9QkgzMOADxH96GUUYoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCZmu/KsnVf4tH7RgAw+uwcfmuYi/blFAAjX3XEJcgPNRpFT74xy6UcDhtHdUXVPi
	 /9Ory8kRuDP7sg9yW3nEad7sEzuxg1O3lRqUvv7f66KbsoiQPjG3FXrR6n3p4JgaEG
	 GM+yHraqqhutywBPom5VqStw9kVOt6itgqh6YkaDViPNkl3PVZ6iA+VfK5VdrNvmMY
	 CH8Bb6FipeiU2GklCcHZTSbRUzze5QQhdEAgK8uV2NH7vMPFTjj8bVfeMElNps7PyC
	 P84pzBuZDAW/VNsyobhEw2Gob6C3lDzE0+YIenrfUz0J4ViTHeClG1cELJXjxpW7iO
	 AwuZLa+Zyw+dg==
Date: Mon, 17 Nov 2025 12:04:35 -0600
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] of: reserved_mem: Support multiple 'reg' entries for
 memory-region
Message-ID: <20251117180435.GB225586-robh@kernel.org>
References: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
 <20251117-mtd-memregion-v1-1-7b35611c79a6@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117-mtd-memregion-v1-1-7b35611c79a6@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_100438_875955_734C3CE4 
X-CRM114-Status: GOOD (  39.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 17, 2025 at 06:00:14PM +0100, Gregory CLEMENT wrote:
> The Device Tree specification allows a "memory-region" node to have
> multiple 'reg' entries, but the current kernel implementation only
> processes the first entry. This can lead to drivers not being able to
> access all the reserved memory regions specified in the Device Tree.
> 
> This patch extends the reserved memory handling to support multiple
> 'reg' entries for a single "memory-region" node. The existing exported
> functions remain unchanged for backward compatibility, but new APIs
> are introduced to allow drivers to access all reserved memory regions.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  drivers/of/of_reserved_mem.c    | 141 ++++++++++++++++++++++++++++++++++++----
>  include/linux/of_reserved_mem.h |   4 ++
>  2 files changed, 133 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 2e9ea751ed2df..2477933883903 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -159,6 +159,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
>  	int len;
>  	const __be32 *prop;
>  	bool nomap;
> +	int count = 0;
>  
>  	prop = of_get_flat_dt_prop(node, "reg", &len);
>  	if (!prop)
> @@ -183,6 +184,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
>  				dma_contiguous_early_fixup(base, size);
>  			pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
>  				uname, &base, (unsigned long)(size / SZ_1M));
> +			count++;
>  		} else {
>  			pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
>  			       uname, &base, (unsigned long)(size / SZ_1M));
> @@ -190,7 +192,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
>  
>  		len -= t_len;
>  	}
> -	return 0;
> +	return count;
>  }
>  
>  /*
> @@ -235,7 +237,7 @@ void __init fdt_scan_reserved_mem_reg_nodes(void)
>  	phys_addr_t base, size;
>  	const __be32 *prop;
>  	int node, child;
> -	int len;
> +	int len, i;
>  
>  	if (!fdt)
>  		return;
> @@ -273,12 +275,12 @@ void __init fdt_scan_reserved_mem_reg_nodes(void)
>  		if (len > t_len)
>  			pr_warn("%s() ignores %d regions in node '%s'\n",
>  				__func__, len / t_len - 1, uname);
> -
> -		base = dt_mem_next_cell(dt_root_addr_cells, &prop);
> -		size = dt_mem_next_cell(dt_root_size_cells, &prop);

FYI, there's some changes around this code in flight.

> -
> -		if (size)
> -			fdt_reserved_mem_save_node(child, uname, base, size);
> +		for (i = 0; i < len; i += t_len) {
> +			base = dt_mem_next_cell(dt_root_addr_cells, &prop);
> +			size = dt_mem_next_cell(dt_root_size_cells, &prop);
> +			if (size)
> +				fdt_reserved_mem_save_node(child, uname, base, size);
> +		}
>  	}
>  
>  	/* check for overlapping reserved regions */
> @@ -308,16 +310,16 @@ int __init fdt_scan_reserved_mem(void)
>  
>  	fdt_for_each_subnode(child, fdt, node) {
>  		const char *uname;
> -		int err;
> +		int err, ret;
>  
>  		if (!of_fdt_device_is_available(fdt, child))
>  			continue;
>  
>  		uname = fdt_get_name(fdt, child, NULL);
>  
> -		err = __reserved_mem_reserve_reg(child, uname);
> -		if (!err)
> -			count++;
> +		ret = __reserved_mem_reserve_reg(child, uname);
> +		if (ret > 0)
> +			count += ret;
>  		/*
>  		 * Save the nodes for the dynamically-placed regions
>  		 * into an array which will be used for allocation right
> @@ -750,6 +752,37 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
>  
> +/**
> + * of_reserved_mem_array_lookup() - acquire reserved_mem array from a device node
> + * @np:		node pointer of the desired reserved-memory region
> + * @rmrm:	pointer to the first elemennt of the reserved_mem struct of the memory region
> + *
> + * This function allows drivers to acquire a reference to the array of the
> + *  reserved_mem struct based on a device node handle.
> + *
> + * Returns the number reserved_mem elements
> + */
> +int of_reserved_mem_array_lookup(struct device_node *np,
> +				 struct reserved_mem **rmem)
> +{
> +	const char *name;
> +	int i, count = 0;
> +
> +	if (!np->full_name)
> +		return 0;
> +
> +	name = kbasename(np->full_name);
> +	for (i = 0; i < reserved_mem_count; i++)
> +		if (!strcmp(reserved_mem[i].name, name)) {
> +			if (!count)
> +				*rmem = &reserved_mem[i];
> +			count++;
> +		}
> +
> +	return count;
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_array_lookup);

Do you need this function? I'm trying to do away with drivers using 
struct reserved_mem in favor of the resource functions.

> +
>  /**
>   * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
>   * @np:		node containing 'memory-region' property
> @@ -785,6 +818,49 @@ int of_reserved_mem_region_to_resource(const struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource);
>  
> +/**
> + * of_reserved_mem_region_to_resource_array() - Get a reserved memory region as a resources
> + * @dev:	device associated to the node
> + * @np:		node containing 'memory-region' property
> + * @idx:	index of 'memory-region' property to lookup
> + * @res:	Pointer to an array of struct resource pointers to fill in with reserved regions
> + *
> + * This function allows drivers to lookup a node's 'memory-region' property
> + * entries by index and fill an array of struct resource pointers for the entries.
> + *
> + * Returns the number of resources filled in @res on success.
> + * Returns -ENODEV if 'memory-region' is missing or unavailable,
> + * -EINVAL for any other error.
> + */
> +int of_reserved_mem_region_to_resource_array(struct device *dev, const struct device_node *np,
> +					     unsigned int idx, struct resource **res)
> +{
> +	struct reserved_mem *rmem;
> +	int count, i;
> +	struct resource *r;
> +
> +	if (!np)
> +		return -EINVAL;
> +
> +	struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
> +	if (!target || !of_device_is_available(target))
> +		return -ENODEV;
> +
> +	count = of_reserved_mem_array_lookup(target, &rmem);
> +	if (count <= 0)
> +		return -EINVAL;
> +
> +	*res = devm_kzalloc(dev, count * sizeof(struct resource), GFP_KERNEL);
> +	r = res[0];
> +	for (i = 0; i < count; i++) {
> +		resource_set_range(&r[i], rmem[i].base, rmem[i].size);
> +		r[i].flags = IORESOURCE_MEM;
> +		r[i].name = rmem[i].name;
> +	}
> +	return count;
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource_array);
> +
>  /**
>   * of_reserved_mem_region_to_resource_byname() - Get a reserved memory region as a resource
>   * @np:		node containing 'memory-region' property
> @@ -829,3 +905,44 @@ int of_reserved_mem_region_count(const struct device_node *np)
>  	return of_count_phandle_with_args(np, "memory-region", NULL);
>  }
>  EXPORT_SYMBOL_GPL(of_reserved_mem_region_count);
> +
> +/**
> + * of_reserved_mem_region_count() - Return the total number of reserved memory regions
> + * @np:		node containing 'memory-region' property
> + *
> + * This function counts the total number of reserved memory regions referenced
> + * by a node's 'memory-region' property. It iterates over each phandle and sums
> + * the number of regions found in each referenced reserved memory node.
> + *
> + * Returns the total number of reserved memory regions on success.
> + * This function allows drivers to retrieve the number of entries for a node's
> + * 'memory-region' property.
> + *
> + * Returns total number of reserved memory regions on success, or negative error
> + * code on a malformed property.
> + */
> +int of_reserved_mem_region_total_count(const struct device_node *np)
> +{
> +	int nregion = of_count_phandle_with_args(np, "memory-region", NULL);
> +	struct device_node *target;
> +	int i, nregs = 0;
> +
> +	for (i = 0; i < nregion; i++) {
> +		struct reserved_mem *rmem;
> +
> +		target = of_parse_phandle(np, "memory-region", i);
> +		if (!target)
> +			return -ENODEV;
> +
> +		if (!of_device_is_available(target)) {
> +			of_node_put(target);
> +			return 0;
> +		}
> +
> +		nregs += of_reserved_mem_array_lookup(target, &rmem);
> +
> +		of_node_put(target);
> +	};
> +	return nregs;
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_region_total_count);

Do you have a user?

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
