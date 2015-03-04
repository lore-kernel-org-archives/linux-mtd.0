Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTEtN-0005uZ-Ra
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2015 19:23:38 +0000
Received: by pdbnh10 with SMTP id nh10so36142066pdb.3
 for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2015 11:23:16 -0800 (PST)
Date: Wed, 4 Mar 2015 11:23:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Ehrenberg <dehrenberg@chromium.org>
Subject: Re: [PATCH v2 1/3] mtdpart: Allow adding a partition of a partition
Message-ID: <20150304192310.GN18140@ld-irv-0074>
References: <1423609138-19321-1-git-send-email-dehrenberg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423609138-19321-1-git-send-email-dehrenberg@chromium.org>
Cc: gwendal@chromium.org, richard.weinberger@gmail.com, namnguyen@chromium.org,
 grundler@chromium.org, linux-mtd@lists.infradead.org,
 ezequiel.garcia@imgtec.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 10, 2015 at 02:58:56PM -0800, Dan Ehrenberg wrote:
> MTD allows dynamic partitioning by the BLKPG ioctl.
> The current code restricts partition dynamic addition to work only on
> the master MTD device. This doesn't make a lot of sense, and is
> impossible to meet if the device is already partitioned (since the
> master MTD device is not visible). This commit removes the restriction.
> 
> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>

The big question I see is whether there is any downside to using
partitions as proxies for the 'master' MTD when adding/deleting
partitions. I think block devices prohibit this, but MTDs are different,
in that we don't always make the master available (i.e., we don't have
/dev/mtda, /dev/mtda1, /dev/mtda2, /dev/mtdb, /dev/mtdb1, ...).

> ---
>  drivers/mtd/mtdchar.c | 4 ----
>  drivers/mtd/mtdpart.c | 6 ++++++
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 5356395..30215c7 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -545,10 +545,6 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
>  	switch (a.op) {
>  	case BLKPG_ADD_PARTITION:
>  
> -		/* Only master mtd device must be used to add partitions */
> -		if (mtd_is_partition(mtd))
> -			return -EINVAL;
> -
>  		/* Sanitize user input */
>  		p.devname[BLKPG_DEVNAMELTH - 1] = '\0';
>  
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index a3e3a7d..7c6f526 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -566,6 +566,12 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
>  	if (length <= 0)
>  		return -EINVAL;
>  
> +	if (mtd_is_partition(master)) {
> +		struct mtd_part *master_partition = PART(master);
> +		offset += master_partition->offset;
> +		master = master_partition->master;

One of the problems here is the semantics. Do we really want to do this
offset computation when using the partition instead of the master? That
means if the original partitioning does not cover the early part of the
master MTD, then that piece is lost forever. e.g.,

 master, size 0x1000000, with a single partition
 /dev/mtd0, 1st partition 0x20000 - 0x40000

Then, ioctl(BLKPG, /dev/mtd0) can never create any partitions before
0x20000. But it CAN create partitions after 0x4000! We'd have to support
negative offsets for this to work consistently. (Now that I mention it,
does MTD's BLKPG even do sanity checking on the arguments? I think it
might actually accept negative offsets...)

Also, it's a bit odd that you can use one partition to delete either
another partition, or itself. e.g.,

	flash_part del /dev/mtd1 0  # deletes mtd0
	flash_part del /dev/mtd1 1  # deletes mtd1

This might be acceptable, if awkward. But the first problem looks like
it needs more thought.

> +	}
> +
>  	part.name = name;
>  	part.size = length;
>  	part.offset = offset;

Brian
