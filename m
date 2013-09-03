Date: Tue, 3 Sep 2013 07:55:20 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH 2/2] mtd: atmel_nand: add MODULE_DEVICE_TABLE for nfc
 driver
Message-ID: <20130903105519.GC2355@localhost>
References: <1378200028-15415-1-git-send-email-josh.wu@atmel.com>
 <1378200028-15415-2-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1378200028-15415-2-git-send-email-josh.wu@atmel.com>
Cc: dedekind1@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 03, 2013 at 05:20:28PM +0800, Josh Wu wrote:
> This patch also add a const keyword for the of_device_id of nfc.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> ---
>  drivers/mtd/nand/atmel_nand.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 1ca0724..ea5b185 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -2243,10 +2243,11 @@ static int atmel_nand_nfc_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static struct of_device_id atmel_nand_nfc_match[] = {
> +static const struct of_device_id atmel_nand_nfc_match[] = {
>  	{ .compatible = "atmel,sama5d3-nfc" },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, atmel_nand_nfc_match);
>  
>  static struct platform_driver atmel_nand_nfc_driver = {
>  	.driver = {
> -- 
> 1.7.9.5
> 

Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
