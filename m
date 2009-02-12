Received: from [202.230.225.126] (helo=topsms.toshiba-tops.co.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LXPYH-0007oW-St
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2009 00:35:40 +0000
Date: Thu, 12 Feb 2009 09:35:31 +0900 (JST)
Message-Id: <20090212.093531.235975795.nemoto@toshiba-tops.co.jp>
To: akpm@linux-foundation.org
Subject: Re: [patch for 2.6.29? 4/4] mtd/maps: blackfin async flash maps:
	fix up memory leak
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <200902112112.n1BLCKlR010256@imap1.linux-foundation.org>
References: <200902112112.n1BLCKlR010256@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, cooloney@kernel.org, dwmw2@infradead.org,
	vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 Feb 2009 13:12:19 -0800, akpm@linux-foundation.org wrote:
> @@ -170,6 +170,7 @@ static int __devinit bfin_flash_probe(st
>  	if (ret > 0) {
>  		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using commandline partition definition\n");
>  		add_mtd_partitions(state->mtd, pdata->parts, ret);
> +		kfree(pdata->parts);
>  
>  	} else if (pdata->nr_parts) {
>  		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using board partition definition\n");

As Matthias Kaehlcke pointed out in mail titled "[BUG]
physmap_flash_probe() frees memory still in use", this fix introduce
another bug.

Revised patch for physmap driver is:
http://lists.infradead.org/pipermail/linux-mtd/2009-February/024590.html

Mike, please update this blackfin patch too.

---
Atsushi Nemoto
