Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYRhv-00012v-0z
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 07:51:27 +0000
Date: Thu, 28 Jun 2018 09:50:58 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: dedekind1@gmail.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, thomas.petazzoni@bootlin.com,
 david.oberhollenzer@sigma-star.at
Subject: Re: [PATCH v2 4/4] ubi-utils: ubinize: add support for skipping CRC
 check of a static volume when opening
Message-ID: <20180628095058.471f21b4@bbrezillon>
In-Reply-To: <20180628074344.10249-5-quentin.schulz@bootlin.com>
References: <20180628074344.10249-1-quentin.schulz@bootlin.com>
 <20180628074344.10249-5-quentin.schulz@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 28 Jun 2018 09:43:44 +0200
Quentin Schulz <quentin.schulz@bootlin.com> wrote:

> Let's let the user configure static UBI volume with CRC checking at
> opening disabled if desired.
> 
> Introduce the skip-check setting for vol_flags configuration of a
> volume.
> 
> There is no point in having both autoresize and skip-check set as
> skip-check is reserved for static volumes only and it's useless to have
> a static volume's size set to autoresize.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  ubi-utils/ubinize.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
> index c85ff9b..b603638 100644
> --- a/ubi-utils/ubinize.c
> +++ b/ubi-utils/ubinize.c
> @@ -385,9 +385,21 @@ static int read_section(const struct ubigen_info *ui, const char *sname,
>  	sprintf(buf, "%s:vol_flags", sname);
>  	p = iniparser_getstring(args.dict, buf, NULL);
>  	if (p) {
> +		/*
> +		 * For now, the flag can be either autoresize or skip-check, as
> +		 * skip-check is reserved for static volumes and autoresize for
> +		 * such a volume makes no sense.
> +		 * Once we add another flag that isn't incompatible with each
> +		 * and every existing flag, we'll have to implement a solution
> +		 * that allows multiple flags to be set at the same time in
> +		 * vol_flags setting of the section.
> +		 */
>  		if (!strcmp(p, "autoresize")) {
>  			verbose(args.verbose, "autoresize flags found");
>  			vi->flags |= UBI_VTBL_AUTORESIZE_FLG;
> +		} else if (!strcmp(p, "skip-check")) {
> +			verbose(args.verbose, "skip-check flag found");
> +			vi->flags |= UBI_VTBL_SKIP_CRC_CHECK_FLG;
>  		} else {
>  			return errmsg("unknown flags \"%s\" in section \"%s\"",
>  				      p, sname);
> @@ -523,6 +535,10 @@ int main(int argc, char * const argv[])
>  			}
>  		}
>  
> +		if (vi[i].flags & UBI_VTBL_SKIP_CRC_CHECK_FLG &&
> +		    vi[i].type != UBI_VID_STATIC)
> +			return errmsg("skip-check is only valid for static volumes");
> +
>  		if (vi[i].flags & UBI_VTBL_AUTORESIZE_FLG) {
>  			if (autoresize_was_already)
>  				return errmsg("only one volume is allowed "
