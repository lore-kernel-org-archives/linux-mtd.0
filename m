Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EN9MA-0003WK-Kw
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2005 14:30:51 +0100
Date: Wed, 5 Oct 2005 15:28:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jan Pedersen <jan.pedersen@glaze.dk>
Message-ID: <20051005132835.GC1290@wohnheim.fh-wedel.de>
References: <20051004204918.E02AE37646A@rocket.glaze.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20051004204918.E02AE37646A@rocket.glaze.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] cfi: remove warning message on expected behaivor
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 4 October 2005 22:49:21 +0200, Jan Pedersen wrote:
> 
> When an erase operation is in progress, the DQ5 (data bit 5 / exceeded
> timing limit) pin on the flash chips may raise just before operation
> complete is detected. This is expected behaivor because when the erase is
> complete, DQ5 switches from 'exceeded timing limit' to 'data bit 5' which
> therefore might be read as '1' just before operation complete is detected.
> This fix is well tested.

Do you have a testcase that fails with old code and succeeds with new
code?

> Signed-off-by: Jan Pedersen <jp@jp-embedded.com>
> ---
> diff -Naur linux-2.4.31.org/drivers/mtd/chips/cfi_cmdset_0002.c
> linux-2.4.31/drivers/mtd/chips/cfi_cmdset_0002.c
> --- linux-2.4.31.org/drivers/mtd/chips/cfi_cmdset_0002.c	2004-11-17
> 06:54:21.000000000 -0500
> +++ linux-2.4.31/drivers/mtd/chips/cfi_cmdset_0002.c	2005-08-22
> 12:14:17.000000000 -0400
> @@ -950,12 +950,8 @@
>  		    oldstatus   = cfi_read( map, adr );
>  		    status      = cfi_read( map, adr );
>  		    
> -		    if( ( oldstatus & 0x00FF ) == ( status & 0x00FF ) )
> +		    if( ( oldstatus & 0x00FF ) != ( status & 0x00FF ) )
>  		    {
> -                printk( "Warning: DQ5 raised while erase operation was in
> progress, but erase completed OK\n" ); 		    
> -		    } 			
> -			else
> -            {
>  			    /* DQ5 is active so we can do a reset and stop
> the erase */
>  				cfi_write(map, CMD(0xF0), chip->start);
>                  printk( KERN_WARNING "Internal flash device timeout occured
> or write operation was performed while flash was erasing\n" );

Jörn

-- 
The grand essentials of happiness are: something to do, something to
love, and something to hope for.
-- Allan K. Chalmers
