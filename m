Date: Tue, 10 Nov 2015 19:15:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Ryan Harkin <ryan.harkin@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 07/10] mtd: factor out v1 partition parsing
Message-ID: <20151111031552.GY12143@google.com>
References: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
 <1444914533-27782-8-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444914533-27782-8-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Oct 15, 2015 at 03:08:50PM +0200, Linus Walleij wrote:
> This breaks out the parsing of v1 partitions so we can later add
> a v2 partition parser.
> 
> Cc: Ryan Harkin <ryan.harkin@linaro.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/afs.c | 88 +++++++++++++++++++++++++++++++------------------------
>  1 file changed, 50 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
> index 2307f54195f5..ace27f447abc 100644
> --- a/drivers/mtd/afs.c
> +++ b/drivers/mtd/afs.c
> @@ -181,14 +181,18 @@ afs_read_iis_v1(struct mtd_info *mtd, struct image_info_v1 *iis, u_int ptr)
>  	return ret;
>  }
>  
> -static int parse_afs_partitions(struct mtd_info *mtd,
> -				struct mtd_partition **pparts,
> -				struct mtd_part_parser_data *data)
> +static int afs_parse_v1_partition(struct mtd_info *mtd,
> +				  u_int off, struct mtd_partition *part)
>  {
> -	struct mtd_partition *parts;
> -	u_int mask, off, sz;
> -	int ret = 0;
> -	int i;
> +	struct image_info_v1 iis;
> +	u_int mask;
> +	/*
> +	 * Static checks cannot see that we bail out if we have an error
> +	 * reading the footer.
> +	 */
> +	u_int uninitialized_var(iis_ptr);
> +	u_int uninitialized_var(img_ptr);

What's this uninitialized_var() stuff about? These variables seem to
clearly be initialized before use. Did this hang around from some
preliminary code that got refactored?

> +	int ret;
>  
>  	/*
>  	 * This is the address mask; we use this to mask off out of

...

Otherwise, looks OK.

Brian
