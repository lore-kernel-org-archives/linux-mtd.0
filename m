Subject: Re: [PATCH v2] mtd: rawnand: atmel: Select GENERIC_ALLOCATOR
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20180811134712.2903-1-boris.brezillon@bootlin.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bbfb9a17-b02f-62b9-48bd-c9f1e604d0ea@infradead.org>
Date: Sat, 11 Aug 2018 08:11:47 -0700
MIME-Version: 1.0
In-Reply-To: <20180811134712.2903-1-boris.brezillon@bootlin.com>
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

On 08/11/2018 06:47 AM, Boris Brezillon wrote:
> The driver uses genalloc functions. Select GENERIC_ALLOCATOR to prevent
> build errors when selected through COMPILE_TEST.
> 
> Fixes: 88a40e7dca00 ("mtd: rawnand: atmel: Allow selection of this driver when COMPILE_TEST=y")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Changes in v2:
> - Use select instead of depends on (suggested by Thomas)
> ---
>  drivers/mtd/nand/raw/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index b6738ece16f1..5fc9a1bde4ac 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -279,6 +279,7 @@ config MTD_NAND_ATMEL
>  	tristate "Support for NAND Flash / SmartMedia on AT91"
>  	depends on ARCH_AT91 || COMPILE_TEST
>  	depends on HAS_IOMEM
> +	select GENERIC_ALLOCATOR
>  	select MFD_ATMEL_SMC
>  	help
>  	  Enables support for NAND Flash / Smart Media Card interface
> 


-- 
~Randy
