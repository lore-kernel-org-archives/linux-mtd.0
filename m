Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3k6C-0001qE-RN
 for linux-mtd@lists.infradead.org; Mon, 07 Nov 2016 13:36:33 +0000
Message-ID: <1478525584.5295.59.camel@linux.intel.com>
Subject: Re: [PATCH] mtd: nand: denali_pci: add missing
 pci_release_regions() calls
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Linas Vepstas <linasvepstas@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>,  linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Date: Mon, 07 Nov 2016 15:33:04 +0200
In-Reply-To: <1478106790-10399-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478106790-10399-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-11-03 at 02:13 +0900, Masahiro Yamada wrote:
> The probe function calls pci_request_regions(), but I do not see
> corresponding pci_release_regions() calls.
> 
> While we are here, rename the jump labels to follow the guideline
> "Choose label names which say what the goto does" suggested by
> Documentation/CodingStyle.

NACK!

Please, remove or revert this patch.
Everything is done in pcim_release() function.

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/denali_pci.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali_pci.c
> b/drivers/mtd/nand/denali_pci.c
> index de31514..be8152f 100644
> --- a/drivers/mtd/nand/denali_pci.c
> +++ b/drivers/mtd/nand/denali_pci.c
> @@ -76,28 +76,31 @@ static int denali_pci_probe(struct pci_dev *dev,
> const struct pci_device_id *id)
>  	denali->flash_reg = ioremap_nocache(csr_base, csr_len);
>  	if (!denali->flash_reg) {
>  		dev_err(&dev->dev, "Spectra: Unable to remap memory
> region\n");
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto release_regions;
>  	}
>  
>  	denali->flash_mem = ioremap_nocache(mem_base, mem_len);
>  	if (!denali->flash_mem) {
>  		dev_err(&dev->dev, "Spectra: ioremap_nocache
> failed!");
>  		ret = -ENOMEM;
> -		goto failed_remap_reg;
> +		goto unmap_reg;
>  	}
>  
>  	ret = denali_init(denali);
>  	if (ret)
> -		goto failed_remap_mem;
> +		goto unmap_mem;
>  
>  	pci_set_drvdata(dev, denali);
>  
>  	return 0;
>  
> -failed_remap_mem:
> +unmap_mem:
>  	iounmap(denali->flash_mem);
> -failed_remap_reg:
> +unmap_reg:
>  	iounmap(denali->flash_reg);
> +release_regions:
> +	pci_release_regions(dev);
>  	return ret;
>  }
>  
> @@ -109,6 +112,7 @@ static void denali_pci_remove(struct pci_dev *dev)
>  	denali_remove(denali);
>  	iounmap(denali->flash_reg);
>  	iounmap(denali->flash_mem);
> +	pci_release_regions(dev);
>  }
>  
>  static struct pci_driver denali_pci_driver = {

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
