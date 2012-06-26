Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjUcM-0005Xm-Dd
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 12:11:38 +0000
Received: by wgbds1 with SMTP id ds1so3519152wgb.18
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 05:11:29 -0700 (PDT)
Date: Tue, 26 Jun 2012 15:11:19 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/8] mtd: check for max_bitflips in mtd_read_oob()
Message-ID: <20120626151119.713859dd@pixies.home.jungo.com>
In-Reply-To: <1340408145-24531-3-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-3-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Mike Dunn <mikedunn@newsguy.com>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Fri, 22 Jun 2012 16:35:39 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index fcfce24..75288d3 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -860,10 +860,22 @@ EXPORT_SYMBOL_GPL(mtd_panic_write);
>  
>  int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
>  {
> +	int ret_code;
>  	ops->retlen = ops->oobretlen = 0;
>  	if (!mtd->_read_oob)
>  		return -EOPNOTSUPP;
> -	return mtd->_read_oob(mtd, from, ops);
> +	/*
> +	 * In cases where ops->datbuf != NULL, mtd->_read_oob() can have

s/can have/has/

> +	 * semantics similar to mtd->_read(), regarding max bitflips. In other

Please consider:
s/regarding max bitflips/returning a non-negative integer representing max bitflips/

Other than these tiny comment amendments,

Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Thanks,
Shmulik
