Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzv6y-0003ci-83
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 23:29:00 +0000
Received: by pabfh17 with SMTP id fh17so133974116pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 15:28:38 -0800 (PST)
Date: Fri, 20 Nov 2015 15:28:36 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: m25p80: handle failed spi_write in m25p80_erase
Message-ID: <20151120232836.GC64635@google.com>
References: <5615780D.7050407@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5615780D.7050407@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 07, 2015 at 09:52:45PM +0200, Heiner Kallweit wrote:
> Return an error if spi_write fails.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 634b0c4..f10daa8 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -171,9 +171,7 @@ static int m25p80_erase(struct spi_nor *nor, loff_t offset)
>  	flash->command[0] = nor->erase_opcode;
>  	m25p_addr2cmd(nor, offset, flash->command);
>  
> -	spi_write(flash->spi, flash->command, m25p_cmdsz(nor));
> -
> -	return 0;
> +	return spi_write(flash->spi, flash->command, m25p_cmdsz(nor));
>  }
>  
>  /*

m25p80_erase() has been dropped, as it can be implemented in spi-nor.c,
with calls only to ->write_reg(). This error handling is done correctly
there. See:

cd78ea02dc82 ("mtd: m25p80: drop erase() callback")
c67cbb839da9 ("mtd: spi-nor: provide default erase_sector implementation")

Brian
