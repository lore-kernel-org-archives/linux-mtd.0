Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMWP3-0003ru-Lt
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 09:54:12 +0000
Subject: Re: [RFC 02/10] mtd: spi-nor: Use the highest supported READ protocol
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dedekind1@gmail.com
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512548141-3319-3-git-send-email-prabhakar.kushwaha@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <5a1f1122-5182-1132-62ed-1071a3088399@wedev4u.fr>
Date: Wed, 6 Dec 2017 10:53:45 +0100
MIME-Version: 1.0
In-Reply-To: <1512548141-3319-3-git-send-email-prabhakar.kushwaha@nxp.com>
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

Hi Prabhakar,

Le 06/12/2017 à 09:15, Prabhakar Kushwaha a écrit :
> HWCAP read capabilities defines higher bit position as the higher
> priority. i.e. use Octo SPI protocols first, then Quad SPI protocols
> before Dual SPI protocols, Fast Read and lastly (Slow) Read.
> 
> Currently implementation chose the last set bit i.e. slowest read.
> This patch select the highest available read capability.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 7d3b52f..01898e1 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2521,7 +2521,7 @@ static int spi_nor_select_read(struct spi_nor *nor,
>  			       const struct spi_nor_flash_parameter *params,
>  			       u32 shared_hwcaps)
>  {
> -	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;
> +	int cmd, best_match = ffs(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;

I'm pretty sure this patch is wrong and fls() - find last
(most-significant) bit set - is actually what we want to select the best match.

Is the implementation of fls() correct on your platform ?

Best regards,

Cyrille

>  	const struct spi_nor_read_command *read;
>  
>  	if (best_match < 0)
> 
