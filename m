Received: from smtp122.sbc.mail.sp1.yahoo.com ([69.147.64.95])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KOKHS-00076E-Ms
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 22:36:27 +0000
Date: Wed, 30 Jul 2008 15:39:24 -0700
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
In-Reply-To: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
Cc: trimarchimichael@yahoo.it, jwboyer@gmail.com, akpm@linux-foundation.org,
	rmk@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> This patch will probably break all sorts of things because that buffer is
> &*large*: up to half a meg.
>
> So this patch isn't mergeable.  I'll hang onto it to bug dmwm2 with when he
> reincarnates.

I'm still asking whether MTD folk have any plans to make that stack DMA-safe...
more than just the SPI flash drivers (mtd_dataflash, m25p80) could benefit
from DMA support, so I'd hope it's at least being considered.

If the answer is "no" then (a) the MTD interface specs need to finally say
they pass DMA-unsafe addresses, and (b) those SPI flash drivers are going
to need updates.

- Dae


> @@ -30,7 +29,7 @@ int jffs2_sum_init(struct jffs2_sb_info 
>  		return -ENOMEM;
>  	}
>  
> -	c->summary->sum_buf = vmalloc(c->sector_size);
> +	c->summary->sum_buf = kmalloc(c->sector_size, GFP_KERNEL);
>  
>  	if (!c->summary->sum_buf) {
>  		JFFS2_WARNING("Can't allocate buffer for writing out summary information!\n");
