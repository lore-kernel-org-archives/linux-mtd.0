Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuhIS-0003vM-JD
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 16:56:53 +0000
Received: by mail-wm0-x242.google.com with SMTP id s12-v6so2635345wmc.0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2018 09:56:42 -0700 (PDT)
Subject: Re: [PATCH] spi-nor: intel-spi: Add support for Intel Ice Lake SPI
 serial flash
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <20180828165059.55223-1-mika.westerberg@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <3261d2da-c0a5-920e-ca12-17924a2d3918@gmail.com>
Date: Tue, 28 Aug 2018 18:56:38 +0200
MIME-Version: 1.0
In-Reply-To: <20180828165059.55223-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/28/2018 06:50 PM, Mika Westerberg wrote:
> Intel Ice Lake exposes the SPI serial flash controller as a PCI device
> in the same way than Intel Denverton. Add Ice Lake SPI serial flash PCI
> ID to the driver list of supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

This should probably go through trivial patches ML, no ?
Also, CC Stable.

> ---
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
> 


-- 
Best regards,
Marek Vasut
