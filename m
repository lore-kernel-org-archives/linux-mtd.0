Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SoV8w-0006Su-M9
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2012 07:46:00 +0000
Message-ID: <4FFBDDB0.6010605@parrot.com>
Date: Tue, 10 Jul 2012 09:45:52 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Brian Norris a écrit :
> scan_read_raw_oob() is used in only in places where the MTD_OPS_PLACE_OOB
> mode is preferable MTD_OPS_RAW mode, so use MTD_OPS_PLACE_OOB instead.
> MTD_OPS_PLACE_OOB provides the same functionality with the potential[1]
> added bonus of error correction.
> 
> This brings scan_block_full() in line with scan_block_fast() so that they
> both read bad block markers with MTD_OPS_PLACE_OOB. This can help in
> preventing 0xff markers (in good blocks) from being interpreted as bad
> block indicators in the presence of a single bitflip.
As far I understand the code, this work when "chip->ecc.read_oob" (used in
nand_do_read_oob) correct bit flip.

But I see no "chip->ecc.read_oob" implementation that can return bit flip. Is
that expected ?

This can also work when nand_do_read_ops is used (ops->datbuf != NULL). But it
is hard to see case where it can correct bit flip in bad block marker. Do you
have any exemple ?

For example the default chip->ecc.read_page (nand_read_page_hwecc) doesn't read
oob with ecc [1].




Matthieu

PS : Did you have any comment on
http://thread.gmane.org/gmane.linux.drivers.mtd/42243 ?

[1]
   for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
        chip->ecc.hwctl(mtd, NAND_ECC_READ);
        chip->read_buf(mtd, p, eccsize);
        chip->ecc.calculate(mtd, p, &ecc_calc[i]);
    }
    chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);

> 
> Note that ECC error codes (EUCLEAN or EBADMSG) are already silently
> ignored in all users of scan_read_raw_oob().
> 
> [1] Few  drivers perform proper error correction on OOB data. In those
>     cases, the use of MTD_OPS_RAW vs. MTD_OPS_PLACE_OOB is not
>     significant.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> Cc: Mike Dunn <mikedunn@newsguy.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/mtd/nand/nand_bbt.c |   27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 45cdb97..7b9a0a7 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -289,14 +289,24 @@ static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
>  	return mtd_read(mtd, offs, len, &retlen, buf);
>  }
>  
> -/* Scan read data from flash */
> +/**
> + * scan_read_oob - [GENERIC] Scan data+OOB region to buffer
> + * @mtd: MTD device structure
> + * @buf: temporary buffer
> + * @offs: offset at which to scan
> + * @len: length of data region to read
> + *
> + * Scan read data from data+OOB. May traverse multiple pages, interleaving
> + * page,OOB,page,OOB,... in buf. Completes transfer and returns the "strongest"
> + * ECC condition (error or bitflip). May quit on the first (non-ECC) error.
> + */
>  static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
>  			 size_t len)
>  {
>  	struct mtd_oob_ops ops;
> -	int res;
> +	int res, ret = 0;
>  
> -	ops.mode = MTD_OPS_RAW;
> +	ops.mode = MTD_OPS_PLACE_OOB;
>  	ops.ooboffs = 0;
>  	ops.ooblen = mtd->oobsize;
>  
> @@ -306,15 +316,18 @@ static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
>  		ops.oobbuf = buf + ops.len;
>  
>  		res = mtd_read_oob(mtd, offs, &ops);
> -
> -		if (res)
> -			return res;
> +		if (res) {
> +			if (!mtd_is_bitflip_or_eccerr(res))
> +				return res;
> +			else if (mtd_is_eccerr(res) || !ret)
> +				ret = res;
> +		}
>  
>  		buf += mtd->oobsize + mtd->writesize;
>  		len -= mtd->writesize;
>  		offs += mtd->writesize;
>  	}
> -	return 0;
> +	return ret;
>  }
>  
>  static int scan_read(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
