Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHftD-00081t-0l
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2013 20:10:53 +0000
Message-ID: <5228E513.90103@newsguy.com>
Date: Thu, 05 Sep 2013 13:09:55 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 01/12] nand: docg4: use nand_base's default BBT scan
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
 <1378319126-24473-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1378319126-24473-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/04/2013 11:25 AM, Brian Norris wrote:
> There's no point in the low level driver doing the work that nand_base
> already is doing; just let nand_base set the default BBT scanning
> function.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/docg4.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
> index 548db23..7c38b8a 100644
> --- a/drivers/mtd/nand/docg4.c
> +++ b/drivers/mtd/nand/docg4.c
> @@ -1239,7 +1239,6 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
>  	nand->block_markbad = docg4_block_markbad;
>  	nand->read_buf = docg4_read_buf;
>  	nand->write_buf = docg4_write_buf16;
> -	nand->scan_bbt = nand_default_bbt;
>  	nand->erase_cmd = docg4_erase_block;
>  	nand->ecc.read_page = docg4_read_page;
>  	nand->ecc.write_page = docg4_write_page;
> 

Acked-by: Mike Dunn <mikedunn@newsguy.com>

Not sure why I explicitly set that.  Thanks!
