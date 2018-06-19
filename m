Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fV9fN-0002d3-Ef
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 05:59:15 +0000
Date: Tue, 19 Jun 2018 07:58:35 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [RFC PATCH v2 1/6] mtd: rawnand: marvell: Handle on-die ECC
Message-ID: <20180619075835.10ded314@bbrezillon>
In-Reply-To: <20180619053125.16792-2-chris.packham@alliedtelesis.co.nz>
References: <20180619053125.16792-1-chris.packham@alliedtelesis.co.nz>
 <20180619053125.16792-2-chris.packham@alliedtelesis.co.nz>
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

On Tue, 19 Jun 2018 17:31:20 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> From the controllers point of view this is the same as no or
> software only ECC.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
> Changes in v2:
> - New
> 
>  drivers/mtd/nand/raw/marvell_nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index ebb1d141b900..ba6889bbe802 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -2157,6 +2157,7 @@ static int marvell_nand_ecc_init(struct mtd_info *mtd,
>  		break;
>  	case NAND_ECC_NONE:
>  	case NAND_ECC_SOFT:
> +	case NAND_ECC_ON_DIE:
>  		if (!nfc->caps->is_nfcv2 && mtd->writesize != SZ_512 &&
>  		    mtd->writesize != SZ_2K) {
>  			dev_err(nfc->dev, "NFCv1 cannot write %d bytes pages\n",
