Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7oQ2-0000Pt-9o
 for linux-mtd@lists.infradead.org; Fri, 18 Nov 2016 19:01:59 +0000
Received: by mail-wm0-x233.google.com with SMTP id a197so56846696wmd.0
 for <linux-mtd@lists.infradead.org>; Fri, 18 Nov 2016 11:01:29 -0800 (PST)
Date: Fri, 18 Nov 2016 19:04:26 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20161118190426.GC23246@dell.home>
References: <20161114102447.131602-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20161114102447.131602-1-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 Nov 2016, Mika Westerberg wrote:

> This is fifth version of the series. You can find the previous versions
> archived on:
> 
>   v4: https://lwn.net/Articles/703773/
>   v3: https://lwn.net/Articles/697231/
>   v2: http://lists.infradead.org/pipermail/linux-mtd/2016-June/068277.html
>   v1: https://lkml.org/lkml/2016/6/14/269
> 
> This patch series adds support for the Intel SPI serial flash controller
> found on many recent Intel CPUs including Baytrail and Braswell. This
> driver makes it possible to access the BIOS and other platform data which
> is stored on the SPI serial flash. It is also possible to upgrade the BIOS
> using this driver if it has not been protected by special hardware bits.
> 
> The patch [1/3] includes documentation how to upgrade BIOS on MinnowBoard
> MAX.
> 
> Since poking the SPI serial flash can brick the machine, this driver can
> only be enabled when CONFIG_EXPERT=y and even then it will remain read-only
> unless instructed othwerwise by module parameter.
> 
> Changes from v4:
>   * Use INTEL_SPI_FIFO_SZ instead of hard coded value of 64 bytes
>   * Don't increment i inside call to FDATA() macro
>   * Check nor->read_opcode in intel_spi_read() and return
>     -EINVAL if not supported. We may add SFDP support later on.
> 
> Changes from v3:
>   * Added ACKs from Lee Jones.
>   * Use bus instead of dev->bus in PCI accesses
> 
> Changes from v2:
>   * Rebased on top of v4.8-rc2
>   * Updated intel_spi_read/write() according spi-nor core changes which
>     drops retlen parameter and returns number of bytes read/written.
> 
> Changes from v1:
>   * Older hardware does not support 64k erase command so added erase_64k
>     flag which is set only for Broxton (BXT).
>   * Fix protection range offset for Broxton. Now there is ispi->pregs
>     pointing to the start of the protection registers.
>   * Change naming of constants from BCR_BYT -> BYT_BCR and so on.
>   * Drop lpc_ich_finalize_spi_cell() and initialize cell directly in
>     lpc_ich_init_spi().
>   * Use info->type in switch in lpc_ich_init_spi().
>   * Add defines for magic numbers used in lpc_ich_init_spi().
>   * Use PLATFORM_DEVID_NONE with mfd_add_devices().
> 
> Mika Westerberg (3):
>   spi-nor: Add support for Intel SPI serial flash controller
>   mfd: lpc_ich: Add support for SPI serial flash host controller
>   mfd: lpc_ich: Add support for Intel Apollo Lake SoC

What's the plan for this set?

>  Documentation/mtd/intel-spi.txt          |  88 ++++
>  drivers/mfd/lpc_ich.c                    | 131 +++++
>  drivers/mtd/spi-nor/Kconfig              |  20 +
>  drivers/mtd/spi-nor/Makefile             |   2 +
>  drivers/mtd/spi-nor/intel-spi-platform.c |  57 +++
>  drivers/mtd/spi-nor/intel-spi.c          | 791 +++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/intel-spi.h          |  24 +
>  include/linux/mfd/lpc_ich.h              |   3 +
>  include/linux/platform_data/intel-spi.h  |  31 ++
>  9 files changed, 1147 insertions(+)
>  create mode 100644 Documentation/mtd/intel-spi.txt
>  create mode 100644 drivers/mtd/spi-nor/intel-spi-platform.c
>  create mode 100644 drivers/mtd/spi-nor/intel-spi.c
>  create mode 100644 drivers/mtd/spi-nor/intel-spi.h
>  create mode 100644 include/linux/platform_data/intel-spi.h
> 

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
