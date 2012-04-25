Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMzF9-0000CZ-4y
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 10:14:39 +0000
Received: by lagy4 with SMTP id y4so1457636lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 03:14:36 -0700 (PDT)
Date: Wed, 25 Apr 2012 13:14:32 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 7/7] mtd: driver _read() returns max_bitflips;
 mtd_read() returns -EUCLEAN
Message-ID: <20120425131432.2b86d176@pixies.home.jungo.com>
In-Reply-To: <1335295105-7981-8-git-send-email-mikedunn@newsguy.com>
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-8-git-send-email-mikedunn@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

Reviewed mtdcore.c, mtdpart.c and nand_base.c.
Looks very good.

Minor comments below.

On Tue, 24 Apr 2012 12:18:25 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 9651c06..d6321f6 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -67,12 +67,12 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	stats = part->master->ecc_stats;
>  	res = part->master->_read(part->master, from + part->offset, len,
>  				  retlen, buf);
> -	if (unlikely(res)) {
> -		if (mtd_is_bitflip(res))
> -			mtd->ecc_stats.corrected += part->master->ecc_stats.corrected - stats.corrected;
> -		if (mtd_is_eccerr(res))
> -			mtd->ecc_stats.failed += part->master->ecc_stats.failed - stats.failed;
> -	}
> +	if (unlikely(mtd_is_eccerr(res)))
> +		mtd->ecc_stats.failed +=
> +			part->master->ecc_stats.failed - stats.failed;
> +	else
> +		mtd->ecc_stats.corrected +=
> +			part->master->ecc_stats.corrected - stats.corrected;
>  	return res;
>  }

Probably need {} around the statements within the conditions.

Also I think there's no reason to execute "corrected +=" in case 'res'
is zero (although no harm).

Regards,
Shmulik
