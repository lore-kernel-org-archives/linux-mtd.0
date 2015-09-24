Date: Thu, 24 Sep 2015 07:25:12 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mxc_nand: fix copy_spare
Message-ID: <20150924042512.GC2229@tarshish>
References: <1443020848-28813-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1443020848-28813-1-git-send-email-eric@eukrea.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Eric,

On Wed, Sep 23, 2015 at 05:07:28PM +0200, Eric Bénard wrote:
> it was broken by 35d5d20efad8a04c8c002c7f31241dff973977a6
> "mtd: mxc_nand: cleanup copy_spare function"
> 
> else we get the following error :

[long kernel oops resulting in:]

> Segmentation fault
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Sorry for not catching it earlier.

Thanks,
baruch

> ---
>  drivers/mtd/nand/mxc_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 2426db8..f04445b 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -879,7 +879,7 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
>  				      oob_chunk_size);
>  
>  		/* the last chunk */
> -		memcpy16_toio(&s[oob_chunk_size * sparebuf_size],
> +		memcpy16_toio(&s[i * sparebuf_size],
>  			      &d[i * oob_chunk_size],
>  			      host->used_oobsize - i * oob_chunk_size);
>  	}

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
