Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaVQp-00026l-2o
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 19:23:39 +0000
Date: Wed, 16 Apr 2014 21:23:15 +0200
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v5 3/5] mtd: nand: Enable subpage-reads on flashes with
 on-die ECC enabled.
Message-ID: <20140416192315.GL3528@book.gsilab.sittig.org>
References: <1397504134-32178-1-git-send-email-davidm@egauge.net>
 <1397504134-32178-4-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397504134-32178-4-git-send-email-davidm@egauge.net>
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
> The Micron chips supported through the on-die ECC all have subpage capability,
> so enable that.
> 
> [ ... ]
> @@ -4144,8 +4191,13 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	/* Invalidate the pagebuffer reference */
>  	chip->pagebuf = -1;
>  
> -	/* Large page NAND with SOFT_ECC should support subpage reads */
> -	if ((ecc->mode == NAND_ECC_SOFT) && (chip->page_shift > 9))
> +	/*
> +	 * Large page NAND with SOFT_ECC or on-die ECC should support
> +	 * subpage reads.
> +	 */
> +	if (((ecc->mode == NAND_ECC_SOFT)
> +	     || (chip->ecc.mode == NAND_ECC_HW_ON_DIE))
> +	    && (chip->page_shift > 9))
>  		chip->options |= NAND_SUBPAGE_READ;
>  
>  	/* Fill in remaining MTD driver data */

the commit message suggests that it's an assumption for current
Micron chips, the code implements an unconditional subpage
enabling for any chip that happens to have on-die-ECC -- is there
some ID data that more reliably reflects whether support for
subpages exists?


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
