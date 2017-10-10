Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1xsp-0007cS-UQ
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 16:59:58 +0000
Subject: Re: [PATCH 2/2] mtd: spi-nor: intel-spi: Add support for Intel Cedar
 Fork SPI serial flash
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
References: <20170921131946.70719-1-mika.westerberg@linux.intel.com>
 <20170921131946.70719-2-mika.westerberg@linux.intel.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <e13ce29b-0d35-b3e2-9376-409a6959a1d3@wedev4u.fr>
Date: Tue, 10 Oct 2017 18:59:38 +0200
MIME-Version: 1.0
In-Reply-To: <20170921131946.70719-2-mika.westerberg@linux.intel.com>
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
> Intel Cedar Fork has the same SPI serial flash controller than Intel
> Denverton. Add the Intel Cedar Fork PCI ID to the driver list of
> supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
> ---
>  drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
> index 7fa5b81b0d88..a5a5c5897aad 100644
> --- a/drivers/mtd/spi-nor/intel-spi-pci.c
> +++ b/drivers/mtd/spi-nor/intel-spi-pci.c
> @@ -63,6 +63,7 @@ static void intel_spi_pci_remove(struct pci_dev *pdev)
>  }
>  
>  static const struct pci_device_id intel_spi_pci_ids[] = {
> +	{ PCI_VDEVICE(INTEL, 0x18e0), (unsigned long)&bxt_info },
>  	{ PCI_VDEVICE(INTEL, 0x19e0), (unsigned long)&bxt_info },
>  	{ PCI_VDEVICE(INTEL, 0xa1a4), (unsigned long)&bxt_info },
>  	{ },
> 
