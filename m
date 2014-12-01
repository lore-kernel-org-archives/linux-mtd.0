Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvNEv-0001Gw-Gi
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 09:25:53 +0000
Received: by mail-pa0-f45.google.com with SMTP id lj1so10755445pab.32
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 01:25:32 -0800 (PST)
Date: Mon, 1 Dec 2014 01:25:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhou Wang <wangzhou.bry@gmail.com>
Subject: Re: [PATCH v4 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
Message-ID: <20141201092529.GM29070@brian-ubuntu>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <1415105221-7732-2-git-send-email-wangzhou.bry@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415105221-7732-2-git-send-email-wangzhou.bry@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 haojian.zhuang@gmail.com, wangzhou1@hisilicon.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, xuwei5@hisilicon.com, galak@codeaurora.org,
 caizhiyong@huawei.com, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I forgot to mention these comments:

On Tue, Nov 04, 2014 at 08:47:00PM +0800, Zhou Wang wrote:
> +static int hisi_nfc_remove(struct platform_device *pdev)
> +{
> +	struct hinfc_host *host = platform_get_drvdata(pdev);
> +	struct mtd_info *mtd = &host->mtd;
> +
> +	nand_release(mtd);
> +	dma_free_coherent(&pdev->dev, mtd->writesize + mtd->oobsize,
> +			  host->buffer, host->dma_buffer);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int hisi_nfc_suspend(struct platform_device *pdev,
> +			       pm_message_t state)

This is the wrong prototype. See struct dev_pm_ops.

> +{
> +	struct hinfc_host *host = platform_get_drvdata(pdev);
> +
> +	while ((hinfc_read(host, HINFC504_STATUS) & 0x1) == 0x0)
> +		;
> +
> +	while ((hinfc_read(host, HINFC504_DMA_CTRL))
> +		& HINFC504_DMA_CTRL_DMA_START)
> +		_cond_resched();
> +
> +	return 0;
> +}
> +
> +static int hisi_nfc_resume(struct platform_device *pdev)

Same here.

> +{
> +	int cs;
> +	struct hinfc_host *host = platform_get_drvdata(pdev);
> +	struct nand_chip *chip = &host->chip;
> +
> +	for (cs = 0; cs < chip->numchips; cs++)
> +		hisi_nfc_send_cmd_reset(host, cs);
> +	hinfc_write(host, SET_HINFC504_PWIDTH(HINFC504_W_LATCH,
> +		    HINFC504_R_LATCH, HINFC504_RW_LATCH), HINFC504_PWIDTH);
> +
> +	return 0;
> +}
> +#endif
> +static SIMPLE_DEV_PM_OPS(hisi_nfc_pm_ops, hisi_nfc_suspend, hisi_nfc_resume);

Brian
