Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QKQcs-0008Um-17
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 07:48:02 +0000
Message-ID: <4DCB908C.80505@parrot.com>
Date: Thu, 12 May 2011 09:47:24 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Nitin Garg <nitingarg98@gmail.com>
Subject: Re: Bug in MTD NAND ONFI chipsize detection
References: <BANLkTi=e1mUTX4X7ui+HVCGh=sZ=HLoNCw@mail.gmail.com>	<20110511183322.da0739c9.akpm@linux-foundation.org>	<BANLkTikrqzpU8qZ5FUgG4HaBgZAvmbOHrQ@mail.gmail.com>	<BANLkTinGFDHj4s6nAXMiq8dYW_UO6W+YXg@mail.gmail.com>
	<BANLkTin5X7d+_b5+7N5g941bz12jc+zMZA@mail.gmail.com>
In-Reply-To: <BANLkTin5X7d+_b5+7N5g941bz12jc+zMZA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


What's the difference between one lun and multiple lun for mtd ?

Aren't any command to select the current lun ?

Matthieu


Nitin Garg a écrit :
> Why isn't my patch going through? re-sending again,
> 
> Signed-off-by: Nitin Garg <nitingarg98@xxxxxxxx>
> ---
>  drivers/mtd/nand/nand_base.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c54a4cb..cdf6015 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2892,7 +2892,7 @@ static int nand_flash_detect_onfi(struct
> mtd_info *mtd, struct nand_chip *chip,
>  	mtd->writesize = le32_to_cpu(p->byte_per_page);
>  	mtd->erasesize = le32_to_cpu(p->pages_per_block) * mtd->writesize;
>  	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
> -	chip->chipsize = (uint64_t)le32_to_cpu(p->blocks_per_lun) * mtd->erasesize;
> +	chip->chipsize = (uint64_t)le32_to_cpu(p->blocks_per_lun) *
> le32_to_cpu(p->lun_count) * mtd->erasesize;
>  	busw = 0;
>  	if (le16_to_cpu(p->features) & 1)
>  		busw = NAND_BUSWIDTH_16;
