Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdmCu-0001Pi-CU
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 20:59:21 +0000
Received: by paboj16 with SMTP id oj16so14131655pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2015 13:58:59 -0700 (PDT)
Date: Thu, 2 Apr 2015 13:58:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: Re: [PATCH v5 2/2] memory: pl353: Add driver for arm pl353 static
 memory controller
Message-ID: <20150402205852.GI32500@ld-irv-0074>
References: <1420566557-19846-1-git-send-email-punnaia@xilinx.com>
 <bc55f81bea314bc49b62b6fbcb662ae3@BN1BFFO11FD014.protection.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc55f81bea314bc49b62b6fbcb662ae3@BN1BFFO11FD014.protection.gbl>
Cc: mark.rutland@arm.com, jussi.kivilinna@iki.fi, linux-doc@vger.kernel.org,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>, arnd@arndb.de,
 michal.simek@xilinx.com, ezequiel.garcia@free-electrons.com,
 grant.likely@linaro.org, devicetree@vger.kernel.org, jason@lakedaemon.net,
 pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, joern@logfs.org,
 kpc528@gmail.com, robh+dt@kernel.org, acourbot@nvidia.com, pekon@ti.com,
 kalluripunnaiahchoudary@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rob@landley.net, galak@codeaurora.org,
 ivan.khoronzhuk@ti.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm not following the review of the 'memory' portions much, but has this
gotten much review? I was looking at the MTD portions when I noticed an
obvious issue below:

On Tue, Jan 06, 2015 at 11:19:17PM +0530, Punnaiah Choudary Kalluri wrote:
> Add driver for arm pl353 static memory controller. This controller is
> used in xilinx zynq soc for interfacing the nand and nor/sram memory
> devices.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> ---
> Changes in v5:
> - Added pl353_smc_get_clkrate function, made pl353_smc_set_cycles as public
>   API
> - Removed nand timing parameter initialization and moved it to nand driver  
> Changes in v4:
> - Modified driver to support multiple instances
> - Used sleep instaed of busywait for delay
> Changes in v3:
> - None
> Changes in v2:
> - Since now the timing parameters are in nano seconds, added logic to convert
>   them to the cycles
> ---
>  drivers/memory/Kconfig           |    6 +
>  drivers/memory/Makefile          |    1 +
>  drivers/memory/pl353-smc.c       |  525 ++++++++++++++++++++++++++++++++++++++
>  include/linux/memory/pl353-smc.h |   37 +++
>  4 files changed, 569 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/memory/pl353-smc.c
>  create mode 100644 include/linux/memory/pl353-smc.h
> 
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index 6d91c27..9d4880f 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -85,4 +85,10 @@ config FSL_IFC
>  	bool
>  	depends on FSL_SOC
>  
> +config PL353_SMC
> +	bool "ARM PL353 Static Memory Controller(SMC) driver"

Space after 'Controller'. i.e.:

	bool "ARM PL353 Static Memory Controller (SMC) driver"

> +	default y

We almost definitely don't want this to be 'default y', especially given
that it would then be enabled on all ARM systems. Users could add it
their configuration themselves if they want it, or you might add it to
multi_v7_defconfig.

> +	depends on ARM
> +	help
> +	  This driver is for the ARM PL353 Static Memory Controller(SMC) module.

Same spacing issue here.

>  endif

[...]

Brian
