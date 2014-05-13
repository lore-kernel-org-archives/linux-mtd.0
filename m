Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wk2Sz-0007Pc-JW
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 02:29:18 +0000
Received: by mail-ie0-f170.google.com with SMTP id ar20so4437521iec.15
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 19:28:56 -0700 (PDT)
Date: Mon, 12 May 2014 19:28:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 4/4] mtd: Account for BBT blocks when a partition is
 being allocated
Message-ID: <20140513022852.GB28907@ld-irv-0074>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-5-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395403064-28113-5-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 21, 2014 at 08:57:44AM -0300, Ezequiel Garcia wrote:
> With the introduction of mtd_block_isreserved(), it's now possible
> to fix the bad and reserved block distribution exposed by ecc_stats,
> instead of accounting all the bad or reserved blocks as 'bad'.
> 
> For instance, a device with eight blocks used for the BBT in the last
> partition would now show (getting ECC stats from sysfs):
> 
> $ cat /sys/class/mtd/mtd2/ecc_stats

I assume you're actually using a wildcard instead of '2', since that's
more than one file's contents below.

>        0        0       10        0
>        0        0        4        0
>        0        0        0        8
> 
> instead of the currently wrong stats:
> 
> $ cat /sys/class/mtd/mtd2/ecc_stats
>        0        0       10        0
>        0        0        4        0
>        0        0        8        0
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/mtdpart.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 921e8c6..a3e3a7d 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -535,7 +535,9 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  		uint64_t offs = 0;
>  
>  		while (offs < slave->mtd.size) {
> -			if (mtd_block_isbad(master, offs + slave->offset))
> +			if (mtd_block_isreserved(master, offs + slave->offset))
> +				slave->mtd.ecc_stats.bbtblocks++;
> +			else if (mtd_block_isbad(master, offs + slave->offset))
>  				slave->mtd.ecc_stats.badblocks++;
>  			offs += slave->mtd.erasesize;
>  		}

Looks good. We've had some missing pieces here regarding the
reserved_blocks stat for a while.

Brian
