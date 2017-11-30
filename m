Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKWW0-00041Y-Oa
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 21:37:10 +0000
Date: Thu, 30 Nov 2017 22:36:42 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jesse Chan <jc@linux.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: denali_pci: add missing
 MODULE_DESCRIPTION/AUTHOR/LICENSE
Message-ID: <20171130223642.2d845276@bbrezillon>
In-Reply-To: <20171120205713.86952-1-jc@linux.com>
References: <20171120205713.86952-1-jc@linux.com>
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

On Mon, 20 Nov 2017 12:57:13 -0800
Jesse Chan <jc@linux.com> wrote:

> This change resolves a new compile-time warning
> when built as a loadable module:
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/mtd/nand/denali_pci.o
> see include/linux/module.h for more information
> 
> This adds the license as "GPL v2", which matches the header of the file.
> 
> MODULE_DESCRIPTION and MODULE_AUTHOR are also added.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Jesse Chan <jc@linux.com>
> ---
>  drivers/mtd/nand/denali_pci.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
> index 81370c79aa48..7ad0db65a6fa 100644
> --- a/drivers/mtd/nand/denali_pci.c
> +++ b/drivers/mtd/nand/denali_pci.c
> @@ -124,3 +124,7 @@ static struct pci_driver denali_pci_driver = {
>  };
>  
>  module_pci_driver(denali_pci_driver);
> +
> +MODULE_DESCRIPTION("PCI driver for Denali NAND controller");
> +MODULE_AUTHOR("Intel Corporation and its suppliers");
> +MODULE_LICENSE("GPL v2");
