Received: from py-out-1112.google.com ([64.233.166.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J8ynf-00045C-3e
	for linux-mtd@lists.infradead.org; Sun, 30 Dec 2007 14:06:06 +0000
Received: by py-out-1112.google.com with SMTP id p76so8713589pyb.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Dec 2007 06:05:57 -0800 (PST)
Date: Sun, 30 Dec 2007 08:05:52 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: devzero@web.de
Subject: Re: [PATCH]: 2.6.24-rc5: mtd: PNC-2000 oops
Message-ID: <20071230080552.744d5103@vader.jdub.homelinux.org>
In-Reply-To: <76599944@web.de>
References: <76599944@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: randy.dunlap@oracle.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, lcapitulino@mandriva.com.br,
	hidave.darkstar@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 30 Dec 2007 14:15:13 +0100
devzero@web.de wrote:

> while doing some systematical driver load/unload testing i have also come across this one.
> 
> searched lkml and found/tried this patch - seems to work fine, at least driver now behaves as expected:
> insmod: error inserting 'pnc2000.ko': -1 No such device or address
> 
> if it really _works_ is another story, but how can we know ? have searched the net a while for this hardware, but didn`t find _any_ reference that this hardware either exists or existed at all, so it looks that this hardware is very ancient or being used by japanese secret service, only !? :)

[snip] 
 
> @@ -64,16 +63,29 @@ static struct mtd_info *mymtd;
>  
>  static int __init init_pnc2000(void)
>  {
> +	int err;
> +
>  	printk(KERN_NOTICE "Photron PNC-2000 flash mapping: %x at %x\n", WINDOW_SIZE, \
> WINDOW_ADDR);  
> +	pnc_map.virt = ioremap(WINDOW_ADDR, WINDOW_SIZE);
> +	if (!pnc_map.virt) {
> +		printk("init_pnc2000(): failed to ioremap\n");
> +		return -EIO;
> +	}
> +
>  	simple_map_init(&pnc_map);
>  
>  	mymtd = do_map_probe("cfi_probe", &pnc_map);
>  	if (mymtd) {
>  		mymtd->owner = THIS_MODULE;
> -		return add_mtd_partitions(mymtd, pnc_partitions, 3);
> +		err = add_mtd_partitions(mymtd, pnc_partitions, 3);
> +		if (err) {
> +			printk("init_pnc2000(): add_mtd_partitions failed\n");
> +			iounmap(pnc_map.virt);
> +		}
>  	}
>  
> +	iounmap(pnc_map.virt);
>  	return -ENXIO;

Sorry, but no.  This bit here is bogus.  It will now iounmap and return
an error even if nothing went wrong.

josh
