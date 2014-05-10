Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WiwmR-0000dZ-9K
 for linux-mtd@lists.infradead.org; Sat, 10 May 2014 02:12:51 +0000
Received: by mail-pa0-f49.google.com with SMTP id lj1so5064360pab.8
 for <linux-mtd@lists.infradead.org>; Fri, 09 May 2014 19:12:30 -0700 (PDT)
Date: Fri, 9 May 2014 19:12:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] mtd: denali: fix write_oob_data() function
Message-ID: <20140510021226.GI28907@ld-irv-0074>
References: <1397730174-4763-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397730174-4763-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 17, 2014 at 07:22:54PM +0900, Masahiro Yamada wrote:
> Since write_oob_data is calling denali_send_pipeline_cmd()
> with access_type=SPARE_ACCESS, this might has no impact.

"Might"? Are you sure? Do you have any test results? I don't want to
change this code based on a whim...

> But calling it with tranfser_spare=false looks weird because
> write_oob_data() is the function for transferring the spare area.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  drivers/mtd/nand/denali.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index c07cd57..a55b9d4 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -841,7 +841,7 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
>  
>  	denali->page = page;
>  
> -	if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS,
> +	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
>  							DENALI_WRITE) == PASS) {
>  		write_data_to_flash_mem(denali, buf, mtd->oobsize);
>  

Brian
