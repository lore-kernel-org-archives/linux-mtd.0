Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn7jl-0004HA-Fj
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2015 15:47:54 +0000
Date: Tue, 28 Apr 2015 10:38:13 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: Re: [PATCH v6 1/3] nand: pl353: Add basic driver for arm pl353 smc
 nand interface
Message-ID: <20150428153813.GC11721@bshelton-desktop>
References: <1428941550-4620-1-git-send-email-punnaia@xilinx.com>
 <858a607d-7c5a-4066-aa79-ab14c456b8e5@BN1BFFO11FD046.protection.gbl>
MIME-Version: 1.0
In-Reply-To: <858a607d-7c5a-4066-aa79-ab14c456b8e5@BN1BFFO11FD046.protection.gbl>
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

On 04/13, Punnaiah Choudary Kalluri wrote:
> Add driver for arm pl353 static memory controller nand interface with
> HW ECC support. This controller is used in xilinx zynq soc for interfacing
> the nand flash memory.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>

[...]

> +
> +static int pl353_nand_init_timing(struct device *dev, int mode)
> +{
> +	const struct nand_sdr_timings *time;
> +	u32 t_rc, t_wc, t_rea, t_wp, t_clr, t_ar, t_rr;
> +	ulong clkrate;
> +
> +	time = onfi_async_timing_mode_to_sdr_timings(mode);
> +	if (IS_ERR(time))
> +		return PTR_ERR(time);
> +
> +	clkrate = pl353_smc_get_clkrate(dev);
> +	t_rc  = get_cyc_from_ns(clkrate, time->tRC_min / 1000);
> +	t_wc  = get_cyc_from_ns(clkrate, time->tWC_min / 1000);
> +	t_rea = get_cyc_from_ns(clkrate, time->tREA_max / 1000);
> +	t_wp  = get_cyc_from_ns(clkrate, time->tWP_min / 1000);
> +	t_clr = get_cyc_from_ns(clkrate, time->tCLR_min / 1000);
> +	t_ar  = get_cyc_from_ns(clkrate, time->tAR_min / 1000);
> +	t_rr  = get_cyc_from_ns(clkrate, time->tRR_min / 1000);

I tested this patch set in conjunction with your PL353 SMC patch set.

Our first stage bootloader sets the SMC memclk rate to 166.6 MHz, which leads
this code to calculate a t_rc and t_wc of 17 cycles for ONFI mode 0.  As I
mentioned in my response to your SMC patch, this overflows the 4-bit-wide
register fields in the SMC that hold these values.

Could we somehow set it up so the NAND and SMC drivers work together to adjust
the memclk rate, if necessary, to achieve the desired timings?  Or is there a
better way to handle this?

> +
> +	pl353_smc_set_cycles(dev, t_rc, t_wc, t_rea, t_wp, t_clr, t_ar, t_rr);
> +
> +	return 0;
> +}

Thanks,
Ben
