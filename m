Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaVaL-0005He-Vn
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 19:33:30 +0000
Date: Wed, 16 Apr 2014 21:33:06 +0200
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v5 4/5] mtd: nand: Allocate extra buffers needed for
 on-die ECC controller.
Message-ID: <20140416193306.GM3528@book.gsilab.sittig.org>
References: <1397504134-32178-1-git-send-email-davidm@egauge.net>
 <1397504134-32178-5-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397504134-32178-5-git-send-email-davidm@egauge.net>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org, pekon@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-04-14 at 13:35 -0600, David Mosberger wrote:
> 
> To avoid unnecessary rewrites, it is necessary to count the number of
> actual bitflips that occurred when the NAND_STATUS_REWRITE bit is set.
> This patch introduces the extra buffers needed to implement that
> counting.  The actual counting is in the next patch.

I'd suggest to s/the next patch/a subsequent patch/ -- the order
of commits in the mainline repo need not strictly follow
arbitrary submission sequences

> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3939,13 +3939,24 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			!(chip->bbt_options & NAND_BBT_USE_FLASH));
>  
>  	if (!(chip->options & NAND_OWN_BUFFERS)) {
> +		size_t on_die_bufsz = 0;
> +
> +		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE)
> +			on_die_bufsz = 2*(mtd->writesize + mtd->oobsize);
> +
>  		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
> -				+ mtd->oobsize * 3, GFP_KERNEL);
> +				+ mtd->oobsize * 3 + on_die_bufsz, GFP_KERNEL);
>  		if (!nbuf)
>  			return -ENOMEM;
>  		nbuf->ecccalc = (uint8_t *)(nbuf + 1);
>  		nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
>  		nbuf->databuf = nbuf->ecccode + mtd->oobsize;
> +		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE) {
> +			nbuf->chkbuf = (nbuf->databuf + mtd->writesize
> +					+ mtd->oobsize);
> +			nbuf->rawbuf = (nbuf->chkbuf + mtd->writesize
> +					+ mtd->oobsize);
> +		}
>  
>  		chip->buffers = nbuf;
>  	} else {

you introduce the 'on_die_bufsz' variable, can you use it (under
a more appropriate name then) to first determine the required
amount of memory and then have a kzalloc() call with a size spec
that is not as complex as the current implementation?

independent from this optional style improvement, you should
fixup the whitespace issues around operators, and remove the
unnecessary parentheses; having the "writesize + oobsize" in
another variable might help eliminate more duplication and trim
line length, and better reflect how the size calculation and the
pointer calculation match each other


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
