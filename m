Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ES0yt-0002w5-FN
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 19:35:10 -0400
Date: Wed, 19 Oct 2005 01:34:41 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Deepak Saxena <dsaxena@plexity.net>
Message-ID: <20051018233441.GC20236@wohnheim.fh-wedel.de>
References: <20051014010726.GA28898@plexity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20051014010726.GA28898@plexity.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [Trivial] Make physmap messages more user friendly
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 October 2005 18:07:26 -0700, Deepak Saxena wrote:
> 
> Can I commit the following to CVS? It makes the message a bit more
> readalbe (and obvious that it is in hex) and tells the user if 
> the probe failed.

I'd like to wait until tglx considers cvs stable enough for a mainline
merge.  Thomas, besides the general lack of time, are there any major
blockers left?

> Signed-off-by: Deepak Saxena <dsaxena@plexity.net>
> 
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -50,11 +50,12 @@ static int __init init_physmap(void)
>  	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
>  	const char **type;
>  
> -       	printk(KERN_NOTICE "physmap flash device: %lx at %lx\n", physmap_map.size, physmap_map.phys);
> +       	printk(KERN_NOTICE "MTD physmap flash device: %#010lx @ %#010lx\n", 
> +			physmap_map.size, physmap_map.phys);
>  	physmap_map.virt = ioremap(physmap_map.phys, physmap_map.size);
>  
>  	if (!physmap_map.virt) {
> -		printk("Failed to ioremap\n");
> +		printk("MTD physmap: Failed to ioremap\n");
>  		return -EIO;
>  	}
>  
> @@ -90,6 +91,8 @@ static int __init init_physmap(void)
>  		add_mtd_device(mymtd);
>  
>  		return 0;
> +	} else {
> +		printk("MTD physmap: failed to probe flash\n");
                       ^
All other messages were KERN_NOTICE.

>  	}
>  
>  	iounmap(physmap_map.virt);
> 

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens
