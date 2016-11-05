Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2vWR-0003vh-63
 for linux-mtd@lists.infradead.org; Sat, 05 Nov 2016 07:36:16 +0000
Received: by mail-wm0-x241.google.com with SMTP id c17so7123379wmc.3
 for <linux-mtd@lists.infradead.org>; Sat, 05 Nov 2016 00:35:54 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: denali_pci: add missing pci_release_regions()
 calls
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478106790-10399-1-git-send-email-yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Linas Vepstas <linasvepstas@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a4ca147f-fb42-8405-a1c7-d58e8c1335a2@gmail.com>
Date: Sat, 5 Nov 2016 08:28:48 +0100
MIME-Version: 1.0
In-Reply-To: <1478106790-10399-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/02/2016 06:13 PM, Masahiro Yamada wrote:
> The probe function calls pci_request_regions(), but I do not see
> corresponding pci_release_regions() calls.
> 
> While we are here, rename the jump labels to follow the guideline
> "Choose label names which say what the goto does" suggested by
> Documentation/CodingStyle.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
>  drivers/mtd/nand/denali_pci.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
> index de31514..be8152f 100644
> --- a/drivers/mtd/nand/denali_pci.c
> +++ b/drivers/mtd/nand/denali_pci.c
> @@ -76,28 +76,31 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	denali->flash_reg = ioremap_nocache(csr_base, csr_len);
>  	if (!denali->flash_reg) {
>  		dev_err(&dev->dev, "Spectra: Unable to remap memory region\n");
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto release_regions;
>  	}
>  
>  	denali->flash_mem = ioremap_nocache(mem_base, mem_len);
>  	if (!denali->flash_mem) {
>  		dev_err(&dev->dev, "Spectra: ioremap_nocache failed!");
>  		ret = -ENOMEM;
> -		goto failed_remap_reg;
> +		goto unmap_reg;
>  	}
>  
>  	ret = denali_init(denali);
>  	if (ret)
> -		goto failed_remap_mem;
> +		goto unmap_mem;
>  
>  	pci_set_drvdata(dev, denali);
>  
>  	return 0;
>  
> -failed_remap_mem:
> +unmap_mem:
>  	iounmap(denali->flash_mem);
> -failed_remap_reg:
> +unmap_reg:
>  	iounmap(denali->flash_reg);
> +release_regions:
> +	pci_release_regions(dev);
>  	return ret;
>  }
>  
> @@ -109,6 +112,7 @@ static void denali_pci_remove(struct pci_dev *dev)
>  	denali_remove(denali);
>  	iounmap(denali->flash_reg);
>  	iounmap(denali->flash_mem);
> +	pci_release_regions(dev);
>  }
>  
>  static struct pci_driver denali_pci_driver = {
> 


-- 
Best regards,
Marek Vasut
