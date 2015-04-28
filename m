Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn7CB-00007m-3w
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2015 15:13:11 +0000
Date: Tue, 28 Apr 2015 10:11:38 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: Re: [PATCH v6 2/2] memory: pl353: Add driver for arm pl353 static
 memory controller
Message-ID: <20150428151138.GB11721@bshelton-desktop>
References: <1428941512-26411-1-git-send-email-punnaia@xilinx.com>
 <a1f437fe-51cf-4a89-87b4-8f0a305e68ed@BN1AFFO11FD026.protection.gbl>
MIME-Version: 1.0
In-Reply-To: <a1f437fe-51cf-4a89-87b4-8f0a305e68ed@BN1AFFO11FD026.protection.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: mark.rutland@arm.com, jussi.kivilinna@iki.fi, linux-doc@vger.kernel.org,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>, arnd@arndb.de,
 michal.simek@xilinx.com, ezequiel.garcia@free-electrons.com,
 grant.likely@linaro.org, devicetree@vger.kernel.org, jason@lakedaemon.net,
 pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, joern@logfs.org,
 kpc528@gmail.com, robh+dt@kernel.org, acourbot@nvidia.com,
 kalluripunnaiahchoudary@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rob@landley.net, galak@codeaurora.org,
 ivan.khoronzhuk@ti.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Punnaiah,

> +/**
> + * pl353_smc_set_cycles - Set memory timing parameters
> + * @dev:	Pointer to the device struct
> + * @t0:	t_rc		read cycle time
> + * @t1:	t_wc		write cycle time
> + * @t2:	t_rea/t_ceoe	output enable assertion delay
> + * @t3:	t_wp		write enable deassertion delay
> + * @t4:	t_clr/t_pc	page cycle time
> + * @t5:	t_ar/t_ta	ID read time/turnaround time
> + * @t6:	t_rr		busy to RE timing
> + *
> + * Sets NAND chip specific timing parameters.
> + */
> +void pl353_smc_set_cycles(struct device *dev, u32 t0, u32 t1, u32 t2, u32 t3,
> +			  u32 t4, u32 t5, u32 t6)
> +{
> +	struct pl353_smc_data *pl353_smc = dev_get_drvdata(dev);
> +
> +	t0 &= PL353_SMC_SET_CYCLES_T0_MASK;
> +	t1 = (t1 & PL353_SMC_SET_CYCLES_T1_MASK) <<
> +			PL353_SMC_SET_CYCLES_T1_SHIFT;
> +	t2 = (t2 & PL353_SMC_SET_CYCLES_T2_MASK) <<
> +			PL353_SMC_SET_CYCLES_T2_SHIFT;
> +	t3 = (t3 & PL353_SMC_SET_CYCLES_T3_MASK) <<
> +			PL353_SMC_SET_CYCLES_T3_SHIFT;
> +	t4 = (t4 & PL353_SMC_SET_CYCLES_T4_MASK) <<
> +			PL353_SMC_SET_CYCLES_T4_SHIFT;
> +	t5 = (t5 & PL353_SMC_SET_CYCLES_T5_MASK) <<
> +			PL353_SMC_SET_CYCLES_T5_SHIFT;
> +	t6 = (t6 & PL353_SMC_SET_CYCLES_T6_MASK) <<
> +			PL353_SMC_SET_CYCLES_T6_SHIFT;

Right now, if the caller (i.e. the PL353 NAND driver) passes in a value for any
of the timing parameters that is too large, it will be truncated with the
corresponding mask and then saved, resulting in unexpected behavior.  I saw
this when the PL353 NAND driver tried to set t_rc and t_wc to 17 cycles, which
does not fit in the 4-bit fields for those values -- it got clipped to 4 bits
and stored as 1 cycle, which made communication with the NAND chip fail and
time out.

It would be good to sanity-check each timing here, and rather than returning
void, return a return code indicating success or failure (e.g. -EINVAL for
invalid timings).

Note also that truncation isn't the only thing to check for here.  The PL350
r2p1 datasheet lists a "Minimum permitted value" for each of these timing
values.

> +
> +	t0 |= t1 | t2 | t3 | t4 | t5 | t6;
> +
> +	writel(t0, pl353_smc->base + PL353_SMC_SET_CYCLES_OFFS);
> +	writel(PL353_SMC_DC_UPT_NAND_REGS, pl353_smc->base +
> +	       PL353_SMC_DIRECT_CMD_OFFS);
> +}
> +EXPORT_SYMBOL_GPL(pl353_smc_set_cycles);
> +

Thanks,
Ben
