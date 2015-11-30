Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3VAk-0003Zm-Gx
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 20:35:43 +0000
Received: by padhx2 with SMTP id hx2so195553349pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 12:35:21 -0800 (PST)
Date: Mon, 30 Nov 2015 12:35:18 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Nikolay Martynov <mar.kolya@gmail.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: Fix Spansion sparearea size detection
Message-ID: <20151130203518.GL64635@google.com>
References: <1448519122-6259-1-git-send-email-mar.kolya@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448519122-6259-1-git-send-email-mar.kolya@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nikolay,

On Thu, Nov 26, 2015 at 01:25:22AM -0500, Nikolay Martynov wrote:
> According to datasheet S34ML02G2 and S34ML04G2 have
> larger sparea area size than was detected.
> 
> Signed-off-by: Nikolay Martynov <mar.kolya@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ceb68ca..2c01f9e 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3415,6 +3415,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
>  	/*
>  	 * Field definitions are in the following datasheets:
>  	 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
> +	 *                          Spansion S34ML02G2 (p.33)
>  	 * New Samsung (6 byte ID): Samsung K9GAG08U0F (p.44)
>  	 * Hynix MLC   (6 byte ID): Hynix H27UBG8T2B (p.22)
>  	 *
> @@ -3512,6 +3513,14 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
>  		*busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
>  
>  		/*
> +		 * Spansion S34ML0[24]G2 have oobsize twice as large
> +		 * as S34ML01G2 encoded in the same bit. We
> +		 * differentiate them by their ID length

Hmm, are you sure the ID length heuristic works correctly for these
particular flash? i.e., did you actually test both of these flash?
Sometimes it's hard to tell if a device has a 4-byte or 5-byte ID just
from reading out bytes, since a "4-byte ID" NAND may just have a "don't
care" byte for the 5th one, and so we might still compute id_len == 5.

Also, why do you even need nand_decode_ext_id() for these flash?
According to the datasheet, these flash support ONFI.

Brian

> +		 */
> +		if (id_len == 5 && id_data[0] == NAND_MFR_AMD)
> +			mtd->oobsize *= 2;
> +
> +		/*
>  		 * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
>  		 * 512B page. For Toshiba SLC, we decode the 5th/6th byte as
>  		 * follows:
> -- 
> 2.6.3
> 
