Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fX4hZ-0002xM-BB
 for linux-mtd@lists.infradead.org; Sun, 24 Jun 2018 13:05:13 +0000
Date: Sun, 24 Jun 2018 15:04:47 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/14] ubi: fastmap: Change a WARN_ON() to ubi_err()
Message-ID: <20180624150447.0a2c745d@bbrezillon>
In-Reply-To: <20180613212344.11608-11-richard@nod.at>
References: <20180613212344.11608-1-richard@nod.at>
 <20180613212344.11608-11-richard@nod.at>
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

On Wed, 13 Jun 2018 23:23:40 +0200
Richard Weinberger <richard@nod.at> wrote:

> This WARN_ON() was used while development of fastmap, now
> it can be a regular ubi_err().
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/fastmap.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index dabeb01af24a..d5506152c9f7 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -949,14 +949,16 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  	ubi_assert(list_empty(&free));
>  
>  	/*
> -	 * If fastmap is leaking PEBs (must not happen), raise a
> -	 * fat warning and fall back to scanning mode.
> -	 * We do this here because in ubi_wl_init() it's too late
> -	 * and we cannot fall back to scanning.
> +	 * The orginal purpose of this check was detecting fastmap bugs were
> +	 * it missed blocks. Now it helps to detect mis-flashed UBIs.
> +	 * E.g. when a fastmap enabled UBI is copied to another target with
> +	 * different bad blocks.
>  	 */
> -	if (WARN_ON(count_fastmap_pebs(ai) != ubi->peb_count -
> -		    ai->bad_peb_count - fm->used_blocks))
> +	if (count_fastmap_pebs(ai) != ubi->peb_count - ai->bad_peb_count -
> +		fm->used_blocks) {

Nitpick, but can you align things like that:

	if (count_fastmap_pebs(ai) != ubi->peb_count - ai->bad_peb_count -
				      fm->used_blocks) {

or

	if (count_fastmap_pebs(ai) !=
	    ubi->peb_count - ai->bad_peb_count - fm->used_blocks) {

or even better, have an avail_peb_count variable:

	avail_peb_count = ubi->peb_count - ai->bad_peb_count - fm->used_blocks;
	if (count_fastmap_pebs(ai) != avail_peb_count)

> +		ubi_err(ubi, "number of PEBs referenced by fastmap does not match MTD!");
>  		goto fail_bad;

Also, I'm not sure I get it. Why is that an error now that we have
preseeded fastmap? Isn't it expected to have a potential mismatch the
first time we boot, or is it already taken into account before we reach
this point?



> +	}
>  
>  	return 0;
>  
