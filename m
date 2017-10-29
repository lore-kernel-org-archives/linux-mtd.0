Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8kY1-0003LT-LS
 for linux-mtd@lists.infradead.org; Sun, 29 Oct 2017 10:10:31 +0000
Received: by mail-wr0-x242.google.com with SMTP id p96so9733137wrb.7
 for <linux-mtd@lists.infradead.org>; Sun, 29 Oct 2017 03:10:08 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] mtd: intel-spi: Add support for Intel Lewisburg
 SPI serial flash controller
To: sathyanarayanan.kuppuswamy@linux.intel.com
Cc: cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sathyaosid@gmail.com,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <9da18c4fbcb55130164735352b5ce9ba11b9a63c.1509270992.git.sathyanarayanan.kuppuswamy@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <630c7d49-c0cc-4d4e-27d9-5e60b797d9f7@gmail.com>
Date: Sun, 29 Oct 2017 11:09:50 +0100
MIME-Version: 1.0
In-Reply-To: <9da18c4fbcb55130164735352b5ce9ba11b9a63c.1509270992.git.sathyanarayanan.kuppuswamy@linux.intel.com>
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

On 10/29/2017 10:57 AM, sathyanarayanan.kuppuswamy@linux.intel.com wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> This patch adds PCI IDs for Intel Lewisburg PCH SPI serial flash controller.
> 
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Culling the CC list and adding relevant people.
Patch looks IMO OK, but I'd like RB from Mika.

> ---
>  drivers/mtd/spi-nor/intel-spi-pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
> index e826523..048c007 100644
> --- a/drivers/mtd/spi-nor/intel-spi-pci.c
> +++ b/drivers/mtd/spi-nor/intel-spi-pci.c
> @@ -64,6 +64,8 @@ static void intel_spi_pci_remove(struct pci_dev *pdev)
>  
>  static const struct pci_device_id intel_spi_pci_ids[] = {
>  	{ PCI_VDEVICE(INTEL, 0x19e0), (unsigned long)&bxt_info },
> +	{ PCI_VDEVICE(INTEL, 0xa1a4), (unsigned long)&bxt_info },
> +	{ PCI_VDEVICE(INTEL, 0xa224), (unsigned long)&bxt_info },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(pci, intel_spi_pci_ids);
> 


-- 
Best regards,
Marek Vasut
