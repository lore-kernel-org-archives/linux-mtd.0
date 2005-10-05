Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EN9HS-0001Cx-Vr
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2005 09:26:08 -0400
Date: Wed, 5 Oct 2005 15:25:48 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jan Pedersen <jan.pedersen@glaze.dk>
Message-ID: <20051005132548.GB1290@wohnheim.fh-wedel.de>
References: <20051004204726.1DE0737645D@rocket.glaze.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20051004204726.1DE0737645D@rocket.glaze.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] cfi: prevent kernel panic with cfi flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 4 October 2005 22:47:29 +0200, Jan Pedersen wrote:
> 
> When using the cfi (common flash interface) driver, every word written to
> the flash chips is followed by a operation complete poll. This poll is
> intended to have a timeout of 1 ms. However this timeout is calculated by
> HZ/1000, which happends to be 0 because HZ < 1000. The result of this is
> that there will be just one poll for operation complete. If this single poll
> fails, the kernel panics. This patch increases this timeout to HZ (1
> second). This is far more than needed, but is preferred over a panic. This
> fix is well tested and completely avoids the panic.

Hmm.  Is there a good reason to pick (HZ) instead of (HZ/1000 + 1)?
The latter would be one jiffy more than 1ms, much closer to intended
value and still always nonzero.

> Signed-off-by: Jan Pedersen <jp@jp-embedded.com>
> ---
> diff -Naur linux-2.4.31.org/drivers/mtd/chips/cfi_cmdset_0002.c
> linux-2.4.31/drivers/mtd/chips/cfi_cmdset_0002.c
> --- linux-2.4.31.org/drivers/mtd/chips/cfi_cmdset_0002.c	2004-11-17
> 06:54:21.000000000 -0500
> +++ linux-2.4.31/drivers/mtd/chips/cfi_cmdset_0002.c	2005-08-22
> 12:14:17.000000000 -0400
> @@ -510,7 +510,7 @@
>  	   or tells us why it failed. */        
>  	dq6 = CMD(1<<6);
>  	dq5 = CMD(1<<5);
> -	timeo = jiffies + (HZ/1000); /* setting timeout to 1ms for now */
> +	timeo = jiffies + (HZ); /* setting timeout to 1s for now */
>  		
>  	oldstatus = cfi_read(map, adr);
>  	status = cfi_read(map, adr);
> 

Jörn

-- 
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
