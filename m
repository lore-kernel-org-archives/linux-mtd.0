Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LXPfq-00007M-PT
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2009 00:43:29 +0000
Date: Wed, 11 Feb 2009 16:42:47 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [patch for 2.6.29? 4/4] mtd/maps: blackfin async flash maps:
	fix up memory leak
Message-Id: <20090211164247.8119de8d.akpm@linux-foundation.org>
In-Reply-To: <20090212.093531.235975795.nemoto@toshiba-tops.co.jp>
References: <200902112112.n1BLCKlR010256@imap1.linux-foundation.org>
	<20090212.093531.235975795.nemoto@toshiba-tops.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 12 Feb 2009 09:35:31 +0900 (JST)
Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:

> On Wed, 11 Feb 2009 13:12:19 -0800, akpm@linux-foundation.org wrote:
> > @@ -170,6 +170,7 @@ static int __devinit bfin_flash_probe(st
> >  	if (ret > 0) {
> >  		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using commandline partition definition\n");
> >  		add_mtd_partitions(state->mtd, pdata->parts, ret);
> > +		kfree(pdata->parts);
> >  
> >  	} else if (pdata->nr_parts) {
> >  		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using board partition definition\n");
> 
> As Matthias Kaehlcke pointed out in mail titled "[BUG]
> physmap_flash_probe() frees memory still in use", this fix introduce
> another bug.
> 
> Revised patch for physmap driver is:
> http://lists.infradead.org/pipermail/linux-mtd/2009-February/024590.html
> 
> Mike, please update this blackfin patch too.
> 

I don't have a copy of that patch.  You're on you own, guys..
