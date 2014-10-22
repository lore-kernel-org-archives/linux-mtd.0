Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xgr4s-0008FQ-4m
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:15:31 +0000
Message-ID: <54476785.5020603@nod.at>
Date: Wed, 22 Oct 2014 10:15:01 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] ubiformat: Leave space for fastmap anchor
References: <1413964111-4048-1-git-send-email-s.hauer@pengutronix.de>
 <1413964111-4048-3-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1413964111-4048-3-git-send-email-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.10.2014 um 09:48 schrieb Sascha Hauer:
> The fastmap code needs a free eraseblock in the first 64 erasblocks
> to write a fastmap anchor. Since ubiformat continuously writes the
> image to the flash the fastmap code won't find a free block and
> fastmap will be disabled. 

If UBI is unable to write a fastmap it will try again later.
So, it will be not disabled.

> With this patch ubiformat skips flashing
> a block at the beginning thus allowing the fastmap code to write
> an anchor.

Hmm, this is a bit hacky. What prevents UBI itself from using this free PEB
after the first attach? I.e. if a bitflip happens?
The in kernel code has already a mechanism to move used PEBs < 64 to make space
for the anchor.
IMHO the only sane approach is to create a fastmap enabled image directly with ubiformat.
While creating the initial fastmap code I had the plan to make mtd-tools fastmap aware
but simply run out of budget and so far nobody cared enough.

Thanks,
//richard

> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  ubi-utils/ubiformat.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
> index 2269cdf..df43df3 100644
> --- a/ubi-utils/ubiformat.c
> +++ b/ubi-utils/ubiformat.c
> @@ -518,6 +518,7 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
>  		       const struct ubigen_info *ui, struct ubi_scan_info *si)
>  {
>  	int fd, img_ebs, eb, written_ebs = 0, divisor, skip_data_read = 0;
> +	int fastmap_anchor_done = 0;
>  	off_t st_size;
>  
>  	fd = open_file(&st_size);
> @@ -544,6 +545,15 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
>  		int err;
>  		char buf[mtd->eb_size];
>  
> +		if (!fastmap_anchor_done) {
> +			err = write_eraseblock(libmtd, mtd, ui, si, eb, NULL, 0);
> +			if (err < 0)
> +				goto out_close;
> +			if (err == 0)
> +				fastmap_anchor_done = 1;
> +			continue;
> +		}
> +
>  		if (!args.quiet && !args.verbose) {
>  			printf("\r" PROGRAM_NAME ": flashing eraseblock %d -- %2lld %% complete  ",
>  			       eb, (long long)(eb + 1) * 100 / divisor);
> 
