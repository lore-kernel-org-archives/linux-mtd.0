Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAwqX-0005Hy-Aw
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 12:47:15 +0000
Date: Fri, 12 Oct 2018 14:46:48 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] spi-nor: intel-spi: Add support for Intel Ice Lake
 SPI serial flash
Message-ID: <20181012144648.21eb36e5@bbrezillon>
In-Reply-To: <20180830084257.46975-1-mika.westerberg@linux.intel.com>
References: <20180830084257.46975-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 Aug 2018 11:42:57 +0300
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> Intel Ice Lake exposes the SPI serial flash controller as a PCI device
> in the same way than Intel Denverton. Add Ice Lake SPI serial flash PCI
> ID to the driver list of supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Marek Vasut <marek.vasut@gmail.com>
> Cc: stable@vger.kernel.org

Queued to spi-nor/next.

Thanks,

Boris

> ---
> Changes from v1:
> 
>   - Added tag from Marek
>   - Added stable tag
> 
>  drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
> index c0976f2e3dd1..872b40922608 100644
> --- a/drivers/mtd/spi-nor/intel-spi-pci.c
> +++ b/drivers/mtd/spi-nor/intel-spi-pci.c
> @@ -65,6 +65,7 @@ static void intel_spi_pci_remove(struct pci_dev *pdev)
>  static const struct pci_device_id intel_spi_pci_ids[] = {
>  	{ PCI_VDEVICE(INTEL, 0x18e0), (unsigned long)&bxt_info },
>  	{ PCI_VDEVICE(INTEL, 0x19e0), (unsigned long)&bxt_info },
> +	{ PCI_VDEVICE(INTEL, 0x34a4), (unsigned long)&bxt_info },
>  	{ PCI_VDEVICE(INTEL, 0xa1a4), (unsigned long)&bxt_info },
>  	{ PCI_VDEVICE(INTEL, 0xa224), (unsigned long)&bxt_info },
>  	{ },
