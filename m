Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D3wD9-0000xQ-IW
	for linux-mtd@lists.infradead.org; Wed, 23 Feb 2005 08:05:53 -0500
Date: Wed, 23 Feb 2005 14:05:40 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alexander Nyberg <alexn@dsv.su.se>
Message-ID: <20050223130540.GB10908@wohnheim.fh-wedel.de>
References: <1109148205.2249.3.camel@boxen>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1109148205.2249.3.camel@boxen>
Cc: linux-mtd@lists.infradead.org, joern@wh.fh-wedel.de
Subject: Re: [PATCH] Use after free in mtd/phram.c: unregister_devices()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 23 February 2005 09:43:25 +0100, Alexander Nyberg wrote:
> 
> Use after free, found by the Coverity tool

Thanks!

> Signed-off-by: Alexander Nyberg <alexn@dsv.su.se>
> 
> ===== drivers/mtd/devices/phram.c 1.6 vs edited =====
> --- 1.6/drivers/mtd/devices/phram.c	2005-01-05 19:08:36 +01:00
> +++ edited/drivers/mtd/devices/phram.c	2005-02-23 09:29:59 +01:00
> @@ -107,9 +107,9 @@ static int phram_write(struct mtd_info *
>  
>  static void unregister_devices(void)
>  {
> -	struct phram_mtd_list *this;
> +	struct phram_mtd_list *this, *safe;
>  
> -	list_for_each_entry(this, &phram_list, list) {
> +	list_for_each_entry_safe(this, safe, &phram_list, list) {
>  		del_mtd_device(&this->mtd);
>  		iounmap(this->mtd.priv);
>  		kfree(this);
> 

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
