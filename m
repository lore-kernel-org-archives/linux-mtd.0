Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOeRw-0006hR-Th
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2018 07:26:15 +0000
Date: Fri, 1 Jun 2018 09:26:00 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
 benjamin.lindqvist@endian.se, pgaikwad@nvidia.com, dev@lynxeye.de,
 mirza.krak@gmail.com, richard@nod.at, pdeschrijver@nvidia.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org, jonathanh@nvidia.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 marcel@ziswiler.com, miquel.raynal@bootlin.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com
Subject: Re: [PATCH v3 1/6] mtd: rawnand: add Reed-Solomon error correction
 algorithm
Message-ID: <20180601092600.03c14f53@bbrezillon>
In-Reply-To: <20180531221637.6017-2-stefan@agner.ch>
References: <20180531221637.6017-1-stefan@agner.ch>
 <20180531221637.6017-2-stefan@agner.ch>
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

On Fri,  1 Jun 2018 00:16:32 +0200
Stefan Agner <stefan@agner.ch> wrote:

> Add Reed-Solomon (RS) to the enumeration of ECC algorithms.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/nand_base.c | 1 +
>  include/linux/mtd/rawnand.h      | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index f28c3a555861..9eb5678dd6d0 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5744,6 +5744,7 @@ static int of_get_nand_ecc_mode(struct device_node *np)
>  static const char * const nand_ecc_algos[] = {
>  	[NAND_ECC_HAMMING]	= "hamming",
>  	[NAND_ECC_BCH]		= "bch",
> +	[NAND_ECC_RS]		= "rs",
>  };
>  
>  static int of_get_nand_ecc_algo(struct device_node *np)
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 5dad59b31244..6a82da8c44ce 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -114,6 +114,7 @@ enum nand_ecc_algo {
>  	NAND_ECC_UNKNOWN,
>  	NAND_ECC_HAMMING,
>  	NAND_ECC_BCH,
> +	NAND_ECC_RS,
>  };
>  
>  /*
