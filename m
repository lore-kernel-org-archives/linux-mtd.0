Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgzhs-0005Bz-KZ
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 18:32:53 +0000
Received: by pacex6 with SMTP id ex6so13406161pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 11:32:32 -0700 (PDT)
Date: Tue, 29 Sep 2015 11:32:29 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Enrico Jorns <ejo@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH] mtd: nand: denali: pass col argument to READID operation
Message-ID: <20150929183229.GD31505@google.com>
References: <1442563361-32230-1-git-send-email-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442563361-32230-1-git-send-email-ejo@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2015 at 10:02:41AM +0200, Enrico Jorns wrote:
> A read id operation followed by 0x00 reads the device ID while
> a read id operation followed by 0x20 reads the possible ONFI identifier.
> 
> As the READID function did not propagate the second id parameter but had
> a hard-coded call for 0x90 0x00, reading the ONFI identifier was not
> possible and thus chips werde not detected (tested with
> MT29F8G08ABABAWP)
> 
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>

Looks OK to me. Pushed to l2-mtd.git.

> ---
>  drivers/mtd/nand/denali.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 870c7fc..7b6186f 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1304,7 +1304,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
>  		 */
>  		addr = MODE_11 | BANK(denali->flash_bank);
>  		index_addr(denali, addr | 0, 0x90);
> -		index_addr(denali, addr | 1, 0);
> +		index_addr(denali, addr | 1, col);
>  		for (i = 0; i < 8; i++) {
>  			index_addr_read_data(denali, addr | 2, &id);
>  			write_byte_to_buf(denali, id);
> -- 
> 2.5.1
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
