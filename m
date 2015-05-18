Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuPUa-0007aF-TE
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 18:10:23 +0000
Received: by pdbnk13 with SMTP id nk13so63541879pdb.1
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 11:10:04 -0700 (PDT)
Date: Mon, 18 May 2015 11:09:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH 1/7] mtd: brcmnand: remove double new line from print
Message-ID: <20150518180959.GP11598@ld-irv-0074>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
 <1431877266-28566-2-git-send-email-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431877266-28566-2-git-send-email-hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
 zajec5@gmail.com, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 17, 2015 at 05:41:00PM +0200, Hauke Mehrtens wrote:
> The caller already adds a new line and in the other cases there is no
> new line added.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index a780768..bae30ab 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1765,7 +1765,7 @@ static void brcmnand_print_cfg(char *buf, struct brcmnand_cfg *cfg)
>  	else if (cfg->sector_size_1k)
>  		sprintf(buf, ", BCH-%u (1KiB sector)", cfg->ecc_level << 1);
>  	else
> -		sprintf(buf, ", BCH-%u\n", cfg->ecc_level);
> +		sprintf(buf, ", BCH-%u", cfg->ecc_level);
>  }
>  
>  /*

Good catch. Applied to l2-mtd.git.
