Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZMyT-0000JQ-5I
 for linux-mtd@lists.infradead.org; Wed, 10 Jan 2018 20:27:50 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 Ladislav Michl <ladis@linux-mips.org>,
 Miquel RAYNAL <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH v4 1/3] mtd: mtdpart: Make ECC stat handling consistent
References: <20180108211542.11891-1-boris.brezillon@free-electrons.com>
 <20180108211542.11891-2-boris.brezillon@free-electrons.com>
Date: Wed, 10 Jan 2018 21:27:34 +0100
In-Reply-To: <20180108211542.11891-2-boris.brezillon@free-electrons.com>
 (Boris Brezillon's message of "Mon, 8 Jan 2018 22:15:40 +0100")
Message-ID: <87r2qxbgsp.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> part_read() and part_read_oob() where counting ECC failures and
Typo: s/where/were.

> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index be088bccd593..283e8526713b 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -105,6 +105,7 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
>  		struct mtd_oob_ops *ops)
>  {
>  	struct mtd_part *part = mtd_to_part(mtd);
> +	struct mtd_ecc_stats stats;
>  	int res;
>  
>  	if (from >= mtd->size)
> @@ -127,12 +128,12 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
>  	}
>  
>  	res = part->parent->_read_oob(part->parent, from + part->offset, ops);
> -	if (unlikely(res)) {
> -		if (mtd_is_bitflip(res))
> -			mtd->ecc_stats.corrected++;
> -		if (mtd_is_eccerr(res))
> -			mtd->ecc_stats.failed++;
> -	}
> +	if (unlikely(mtd_is_eccerr(res)))
> +		mtd->ecc_stats.failed +=
> +			part->parent->ecc_stats.failed - stats.failed;
stats is used uninitialized, but I suppose you've already caught that.

Cheers.

-- 
Robert
