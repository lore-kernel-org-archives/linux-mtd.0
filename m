Date: Sun, 8 Feb 2015 21:15:08 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 4/9] mtd: pxa3xx_nand: add a default chunk size
Message-ID: <20150208211508.7b7d2632@bbrezillon>
In-Reply-To: <1422367816-4257-5-git-send-email-antoine.tenart@free-electrons.com>
References: <1422367816-4257-1-git-send-email-antoine.tenart@free-electrons.com>
 <1422367816-4257-5-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, jszhang@marvell.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 Jan 2015 15:10:11 +0100
Antoine Tenart <antoine.tenart@free-electrons.com> wrote:

> Add a default chunk size of 512 in the pxa3xx nand driver.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 782ae24d6b7d..b2783b1f663c 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1430,6 +1430,9 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>  	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
>  		goto KEEP_CONFIG;
>  
> +	/* Set a default chunk size */

Could you explain why you need to set this default chunk size ?
I guess it's because your NAND is not configured by the bootloader, and
thus you did not specify the keep-config attribute in the DT.
And I guess you need this field to be initialized before pxa_ecc_init is
called (for some NAND operations done in the meantime: READID ?).

Moreover, IMHO this should be place in an 'else' statement, otherwise
you'll overwrite the value set in pxa3xx_nand_detect_config.


> +	info->chunk_size = 512;
> +
>  	ret = pxa3xx_nand_sensing(info);
>  	if (ret) {
>  		dev_info(&info->pdev->dev, "There is no chip on cs %d!\n",



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
