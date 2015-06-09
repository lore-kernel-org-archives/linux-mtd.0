Date: Tue, 9 Jun 2015 23:33:38 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v5 1/6] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Message-ID: <20150609213338.GD5720@breakpoint.cc>
References: <1433584416-29607-1-git-send-email-stefan@agner.ch>
 <1433584416-29607-2-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1433584416-29607-2-git-send-email-stefan@agner.ch>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 shawn.guo@linaro.org, marb@ixxat.de, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, devicetree@vger.kernel.org,
 bpringlemeir@gmail.com, linux-kernel@vger.kernel.org, sebastian@breakpoint.cc,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 galak@codeaurora.org, computersforpeace@gmail.com, dwmw2@infradead.org,
 aaron@tastycactus.com, Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015-06-06 11:53:31 [+0200], Stefan Agner wrote:
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> new file mode 100644
> index 0000000..bb5ee11
> --- /dev/null
> +++ b/drivers/mtd/nand/vf610_nfc.c
…
> +/* Clear flags for upcoming command */
> +static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
> +{
> +	void __iomem *reg = nfc->regs + NFC_IRQ_STATUS;
> +	u32 tmp = readl_relaxed(reg);
		  ^^^
> +	tmp |= CMD_DONE_CLEAR_BIT | IDLE_CLEAR_BIT;
> +	writel_relaxed(tmp, reg);
	^^^
> +}
…
> +static inline void vf610_nfc_done(struct vf610_nfc *nfc)
> +{
> +	unsigned long timeout = msecs_to_jiffies(100);
> +
> +	/*
> +	 * Barrier is needed after this write. This write need
> +	 * to be done before reading the next register the first
> +	 * time.
> +	 * vf610_nfc_set implicates such a barrier by using writel
> +	 * to write to the register.
> +	 */
> +	vf610_nfc_set(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
> +	vf610_nfc_set(nfc, NFC_FLASH_CMD2, START_BIT);
> +
> +	if (!(vf610_nfc_read(nfc, NFC_IRQ_STATUS) & IDLE_IRQ_BIT)) {
> +		if (!wait_for_completion_timeout(&nfc->cmd_done, timeout))
> +			dev_warn(nfc->dev, "Timeout while waiting for BUSY.\n");

Can you or did you test for this timeout to happen? Something like reading from
a sector which is BAD for instance might trigger it. Printing a warning is
certainly a good idea.

> +	}
> +	vf610_nfc_clear_status(nfc);
> +}

…
> +/*
> + * This function supports Vybrid only (MPC5125 would have full RB and four CS)
> + */
> +static void vf610_nfc_select_chip(struct mtd_info *mtd, int chip)
> +{
> +#ifdef CONFIG_SOC_VF610
> +	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	u32 tmp = vf610_nfc_read(nfc, NFC_ROW_ADDR);
> +
> +	tmp &= ~(ROW_ADDR_CHIP_SEL_RB_MASK | ROW_ADDR_CHIP_SEL_MASK);
> +	tmp |= 1 << ROW_ADDR_CHIP_SEL_RB_SHIFT;
> +
> +	if (chip == 0)
> +		tmp |= 1 << ROW_ADDR_CHIP_SEL_SHIFT;
> +	else if (chip == 1)
> +		tmp |= 2 << ROW_ADDR_CHIP_SEL_SHIFT;
> +
> +	vf610_nfc_write(nfc, NFC_ROW_ADDR, tmp);
> +#endif
> +}
> +
> +static const struct of_device_id vf610_nfc_dt_ids[] = {
> +	{ .compatible = "fsl,vf610-nfc" },
> +	{ .compatible = "fsl,mpc5125-nfc" },

I advise against a "fsl,mpc5125-nfc" binding. First of all it is the
same as the previous one. Second of all it was not tested at all on the
SoC it suggests to work. Plus the chip select function has a comment hat
it won't work on MPC5125. So it really makes no sense to add it here.

I don't mind if you put the code behind CONFIG_SOC_VF610. Later (if
someone adds additional support) it will be best to use the .data member
to select the proper SoC support.

While you add a new compatible please make sure you describe the binding
in Documentation/devicetree/bindings (in case you did and I missed the
patch, ignore this :))

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, vf610_nfc_dt_ids);

Sebastian
