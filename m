Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9inW-0007Js-I5
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 23:16:56 +0000
Received: by mail-pd0-f181.google.com with SMTP id v10so19897129pde.12
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2015 15:16:29 -0800 (PST)
Date: Fri, 9 Jan 2015 15:16:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] mtd: nand: remove duplicate comment line
Message-ID: <20150109231626.GA9759@ld-irv-0074>
References: <a1b5a128d9a40456cbc701f5a255c7edde7a7f7a.1420015314.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1b5a128d9a40456cbc701f5a255c7edde7a7f7a.1420015314.git.baruch@tkos.co.il>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 31, 2014 at 10:41:54AM +0200, Baruch Siach wrote:
> Commit 7854d3f7495b1 (mtd: spelling, capitalization, uniformity) added a
> correctly spelled line, but failed to remove the wrongly spelled one. Commit
> 064a7694b534 (mtd: Fix typo mtd/tests) then fixed the spelling again, but left
> the duplication.

Whoops!

Pushed to l2-mtd.git. Thanks.

Brian
 
> Fixes: 7854d3f7495b1 (mtd: spelling, capitalization, uniformity)
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/mtd/nand/nand_base.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 41585dfb206f..7bfa519588a4 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -157,7 +157,6 @@ static uint8_t nand_read_byte(struct mtd_info *mtd)
>  
>  /**
>   * nand_read_byte16 - [DEFAULT] read one byte endianness aware from the chip
> - * nand_read_byte16 - [DEFAULT] read one byte endianness aware from the chip
>   * @mtd: MTD device structure
>   *
>   * Default read function for 16bit buswidth with endianness conversion.
