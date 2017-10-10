Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1xsb-0007WB-09
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 16:59:43 +0000
Subject: Re: [PATCH 1/2] mtd: spi-nor: intel-spi: Add support for Intel
 Lewisburg SPI serial flash
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <20170921131946.70719-1-mika.westerberg@linux.intel.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <4757aab7-0b3a-c299-05de-95990a898061@wedev4u.fr>
Date: Tue, 10 Oct 2017 18:58:47 +0200
MIME-Version: 1.0
In-Reply-To: <20170921131946.70719-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 21/09/2017 à 15:19, Mika Westerberg a écrit :
> Intel Lewisburg chipset exposes the SPI serial flash controller as a PCI
> device in the same way than Intel Denverton. Add Intel Lewisburg SPI
> serial flash PCI ID to the driver list of supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
> ---
>  drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
> index e82652335ede..7fa5b81b0d88 100644
> --- a/drivers/mtd/spi-nor/intel-spi-pci.c
> +++ b/drivers/mtd/spi-nor/intel-spi-pci.c
> @@ -64,6 +64,7 @@ static void intel_spi_pci_remove(struct pci_dev *pdev)
>  
>  static const struct pci_device_id intel_spi_pci_ids[] = {
>  	{ PCI_VDEVICE(INTEL, 0x19e0), (unsigned long)&bxt_info },
> +	{ PCI_VDEVICE(INTEL, 0xa1a4), (unsigned long)&bxt_info },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(pci, intel_spi_pci_ids);
> 
