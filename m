Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh10N-0006dl-Bq
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 19:56:04 +0000
Received: by pacex6 with SMTP id ex6so15113406pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 12:55:42 -0700 (PDT)
Date: Tue, 29 Sep 2015 12:55:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ben Shelton <ben.shelton@ni.com>
Cc: dmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Cai Zhiyong <caizhiyong@huawei.com>
Subject: Re: [PATCH] mtd: cmdlinepart: allow fill-up partition at any point
Message-ID: <20150929195539.GF31505@google.com>
References: <1431053861-32284-1-git-send-email-ben.shelton@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431053861-32284-1-git-send-email-ben.shelton@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for delay... a lot of things came on my plate, so things got
buried.

I fixed up a few conflicts locally with some of my patches, but I have a
few problems with your patch, so I'll have to request another revision.

On Thu, May 07, 2015 at 09:57:41PM -0500, Ben Shelton wrote:
> Currently, a fill-up partition (indicated by '-') must be the last
> partition, and no other partitions can go after it.  Change the
> cmdlinepart parsing code to allow a fill-up partition at any point.
> This is useful, for example, if you want to reserve a partition at the
> end of the flash where the bad block table will go.
> 
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>

For one, I think we need a little update to the parser documentation
(i.e., code comments at the top) to show at least an example of this new
allowed syntax.

> ---
>  drivers/mtd/cmdlinepart.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index c850300..2d0eda2 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -97,6 +97,7 @@ static struct mtd_partition * newpart(char *s,
>  				      char **retptr,
>  				      int *num_parts,
>  				      int this_part,
> +				      int size_remaining_found,
>  				      unsigned char **extra_mem_ptr,
>  				      int extra_mem_size)
>  {
> @@ -110,9 +111,16 @@ static struct mtd_partition * newpart(char *s,
>  
>  	/* fetch the partition size */
>  	if (*s == '-') {
> +		if (size_remaining_found) {
> +			printk(KERN_ERR ERRP

Trivial: we can use pr_err() now (see l2-mtd.git).

> +			       "more than one '-' partition specified\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +
>  		/* assign all remaining space to this partition */
>  		size = SIZE_REMAINING;
>  		s++;
> +		size_remaining_found = 1;
>  	} else {
>  		size = memparse(s, &s);
>  		if (size < PAGE_SIZE) {
> @@ -169,13 +177,10 @@ static struct mtd_partition * newpart(char *s,
>  
>  	/* test if more partitions are following */
>  	if (*s == ',') {
> -		if (size == SIZE_REMAINING) {
> -			printk(KERN_ERR ERRP "no partitions allowed after a fill-up partition\n");
> -			return ERR_PTR(-EINVAL);
> -		}
>  		/* more partitions follow, parse them */
>  		parts = newpart(s + 1, &s, num_parts, this_part + 1,
> -				&extra_mem, extra_mem_size);
> +				size_remaining_found, &extra_mem,
> +				extra_mem_size);
>  		if (IS_ERR(parts))
>  			return parts;
>  	} else {
> @@ -252,6 +257,7 @@ static int mtdpart_setup_real(char *s)
>  				&s,		/* out: updated cmdline ptr */
>  				&num_parts,	/* out: number of parts */
>  				0,		/* first partition */
> +				0,		/* size_remaining not found */
>  				(unsigned char**)&this_mtd, /* out: extra mem */
>  				mtd_id_len + 1 + sizeof(*this_mtd) +
>  				sizeof(void*)-1 /*alignment*/);
> @@ -313,6 +319,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>  	int i, err;
>  	struct cmdline_mtd_partition *part;
>  	const char *mtd_id = master->name;
> +	int sr_part_num = -1;
>  
>  	/* parse command line */
>  	if (!cmdline_parsed) {
> @@ -339,8 +346,10 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>  		else
>  			offset = part->parts[i].offset;
>  
> -		if (part->parts[i].size == SIZE_REMAINING)
> -			part->parts[i].size = master->size - offset;
> +		if (part->parts[i].size == SIZE_REMAINING) {
> +			sr_part_num = i;
> +			continue;
> +		}

Here, you are dropping this property for fill partitions:

  "if specified or truncated size is 0 the part is skipped"

Since the size is no longer computed in this loop, it will never match
the 'size == 0' check.

>  
>  		if (offset + part->parts[i].size > master->size) {
>  			printk(KERN_WARNING ERRP
> @@ -361,6 +370,16 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>  		}
>  	}
>  
> +	/* if a partition was marked as SIZE_REMAINING */
> +	if (sr_part_num != -1) {
> +		/* fix up the size of the SIZE_REMAINING partition */
> +		part->parts[sr_part_num].size = master->size - offset;

The use of 'offset' doesn't look correct. At this point, 'offset' is the
address of the end of the last partition. That looks like you're still
sizing the fill partition to be only at the end of the flash, which is
not the point of this patch. Am I missing something?

> +
> +		/* fix up the offsets of the subsequent partitions */
> +		for (i = (sr_part_num + 1); i < part->num_parts; i++)
> +			part->parts[i].offset += part->parts[sr_part_num].size;

Is this a legal adjustment? Is it possible to have fixed address (not
OFFSET_CONTINUOUS) partitions after the fill partition? I see that would
actually make this kind of ambiguous. So maybe you need to specify this
in the documentation and check for it in the parsing -- see that once
size_remaining_found > 0, we don't allow any more partitions
'@<address'> (i.e., not OFFSET_CONTINUOUS).

> +	}
> +
>  	*pparts = kmemdup(part->parts, sizeof(*part->parts) * part->num_parts,
>  			  GFP_KERNEL);
>  	if (!*pparts)

I think this patch speaks to our need for unit tests... that way we can
clearly and definitively show pass/fail for any regressions.

This reminds me of Cai Zhiyong's attempts to unify this parser with the
new block/cmdline-parser, without getting any test results for the
variety of existing MTD use cases...

Brian
