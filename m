Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pas5T-00008v-BL
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2011 15:49:16 +0000
Date: Thu, 6 Jan 2011 15:48:52 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Murali Nalajala <mnalajal@codeaurora.org>
Subject: Re: [PATCH 1/1] mtd: msm_nand: Add initial msm nand driver support.
Message-ID: <20110106154852.GG31708@n2100.arm.linux.org.uk>
References: <1293785680-19850-1-git-send-email-mnalajal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1293785680-19850-1-git-send-email-mnalajal@codeaurora.org>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: swetland@google.com, Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 31, 2010 at 02:24:40PM +0530, Murali Nalajala wrote:
> +	info->msm_nand.dev = &pdev->dev;
> +
> +	init_waitqueue_head(&info->msm_nand.wait_queue);
> +
> +	info->msm_nand.dma_channel = res->start;
> +	pr_debug("dma channel 0x%x\n", info->msm_nand.dma_channel);
> +	info->msm_nand.dma_buffer =
> +		dma_alloc_coherent(NULL, MSM_NAND_DMA_BUFFER_SIZE,
> +				   &info->msm_nand.dma_addr, GFP_KERNEL);

Haven't you got a struct device for this (&pdev->dev) ?

> +	if (info->msm_nand.dma_buffer == NULL) {
> +		err = -ENOMEM;
> +		goto out_free_info;
> +	}
> +
> +	pr_debug("allocated dma buffer at %p, dma_addr %x\n",
> +		info->msm_nand.dma_buffer, info->msm_nand.dma_addr);
> +
> +	info->mtd.name = dev_name(&pdev->dev);
> +	info->mtd.priv = &info->msm_nand;
> +	info->mtd.owner = THIS_MODULE;
> +
> +	if (msm_nand_scan(&info->mtd, 1)) {
> +		err = -ENXIO;
> +		goto out_free_dma_buffer;
> +	}
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +	err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);
> +	if (err > 0)
> +		err = add_mtd_partitions(&info->mtd, info->parts, err);
> +	else if (err <= 0 && pdata && pdata->parts)
> +		err = add_mtd_partitions(&info->mtd, pdata->parts,
> +					 pdata->nr_parts);
> +	else
> +#endif
> +		err = add_mtd_device(&info->mtd);
> +
> +	if (err != 0)
> +		goto out_free_dma_buffer;
> +
> +	platform_set_drvdata(pdev, info);
> +
> +	return 0;
> +
> +out_free_dma_buffer:
> +	dma_free_coherent(NULL, MSM_NAND_DMA_BUFFER_SIZE,

Ditto.

> +			  info->msm_nand.dma_buffer, info->msm_nand.dma_addr);
> +out_free_info:
> +	kfree(info);
> +
> +	return err;
> +}
> +
> +static int __devexit msm_nand_remove(struct platform_device *pdev)
> +{
> +	struct msm_nand_info *info = platform_get_drvdata(pdev);
> +
> +	platform_set_drvdata(pdev, NULL);
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +	if (info->parts)
> +		del_mtd_partitions(&info->mtd);
> +	else
> +#endif
> +		del_mtd_device(&info->mtd);
> +
> +	msm_nand_release(&info->mtd);
> +	dma_free_coherent(NULL, MSM_NAND_DMA_BUFFER_SIZE,

Ditto.
