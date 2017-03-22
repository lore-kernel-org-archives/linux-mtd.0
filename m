Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqoyh-0005Ag-F8
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 22:43:42 +0000
Subject: Re: [RESEND v1] UBI: add debugfs file for tracking PEB state
To: Zach Brown <zach.brown@ni.com>, dwmw2@infradead.org
References: <1490198669-20986-1-git-send-email-zach.brown@ni.com>
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <47dcf386-b363-6f02-4ce4-c98439ab110e@nod.at>
Date: Wed, 22 Mar 2017 23:43:09 +0100
MIME-Version: 1.0
In-Reply-To: <1490198669-20986-1-git-send-email-zach.brown@ni.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zach,

I think we can merge this in the next merge window, I have only some
minor comments.

Am 22.03.2017 um 17:04 schrieb Zach Brown:
> From: Ben Shelton <ben.shelton@ni.com>
> 
> Add a file under debugfs to allow easy access to the erase count for
> each physical erase block on an UBI device.  This is useful when
> debugging data integrity issues with UBIFS on NAND flash devices.
> 
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> ---
>  drivers/mtd/ubi/debug.c | 151 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 150 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
> index f101a49..6086822 100644
> --- a/drivers/mtd/ubi/debug.c
> +++ b/drivers/mtd/ubi/debug.c
> @@ -22,6 +22,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/uaccess.h>
>  #include <linux/module.h>
> +#include <linux/seq_file.h>
>  
>  
>  /**
> @@ -386,7 +387,9 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
>  	return count;
>  }
>  
> -/* File operations for all UBI debugfs files */
> +/* File operations for all UBI debugfs files except
> + * detailed_erase_block_info
> + */
>  static const struct file_operations dfs_fops = {
>  	.read   = dfs_file_read,
>  	.write  = dfs_file_write,
> @@ -395,6 +398,146 @@ static const struct file_operations dfs_fops = {
>  	.owner  = THIS_MODULE,
>  };
>  
> +/* As long as the position is less then that total number of erase blocks,
> + * we still have more to print.
> + */
> +static void *eraseblk_count_seq_start(struct seq_file *s, loff_t *pos)
> +{
> +	struct ubi_device *ubi = s->private;
> +
> +	if (*pos == 0)
> +		return SEQ_START_TOKEN;
> +
> +	if (*pos < ubi->peb_count)
> +		return pos;
> +
> +	return NULL;
> +}
> +
> +/* Since we are using the position as the iterator, we just need to check if we
> + * are done and increment the position.
> + */
> +static void *eraseblk_count_seq_next(struct seq_file *s, void *v, loff_t *pos)
> +{
> +	struct ubi_device *ubi = s->private;
> +
> +	if (v == SEQ_START_TOKEN)
> +		return pos;
> +	(*pos)++;
> +
> +	if (*pos < ubi->peb_count)
> +		return pos;
> +
> +	return NULL;
> +}
> +
> +static void eraseblk_count_seq_stop(struct seq_file *s, void *v)
> +{
> +}
> +
> +enum block_status {
> +	BLOCK_STATUS_OK,
> +	BLOCK_STATUS_BAD_BLOCK,
> +	BLOCK_STATUS_ERASE_COUNT_BEYOND_MAX
> +};
> +
> +static char const *block_status_names[] = {"OK", "marked_bad",
> +					   "erase_count_beyond_max"};
> +
> +enum read_status {
> +	READ_STATUS_OK,
> +	READ_STATUS_ERR_READING_BLOCK,
> +};
> +
> +static char const *read_status_names[] = {"OK", "err_reading_block"};
> +
> +static int eraseblk_count_seq_show(struct seq_file *s, void *iter)
> +{
> +	struct ubi_device *ubi = s->private;
> +	struct ubi_wl_entry *wl;
> +	int *block_number = iter;
> +	int erase_count = -1;
> +	enum block_status b_sts = BLOCK_STATUS_OK;
> +	enum read_status r_sts = READ_STATUS_OK;
> +	int err;
> +
> +	/* If this is the start, print a header */
> +	if (iter == SEQ_START_TOKEN) {
> +		seq_puts(s,
> +			 "physical_block_number\terase_count\tblock_status\tread_status\n");
> +		return 0;
> +	}
> +
> +	err = ubi_io_is_bad(ubi, *block_number);
> +	if (err) {
> +		if (err < 0)
> +			r_sts = READ_STATUS_ERR_READING_BLOCK;

When ubi_io_is_bad() returns an error, something really bad happened.
I'd just return this error in eraseblk_count_seq_show.

> +		else
> +			b_sts = BLOCK_STATUS_BAD_BLOCK;
> +	} else {
> +		spin_lock(&ubi->wl_lock);
> +
> +		wl = ubi->lookuptbl[*block_number];
> +		if (wl)
> +			erase_count = wl->ec;
> +		else
> +			r_sts = READ_STATUS_ERR_READING_BLOCK;

This is not really an error. It just means that UBI gave up on this
block and "forgot" about it.

> +
> +		spin_unlock(&ubi->wl_lock);
> +
> +		if (erase_count > UBI_MAX_ERASECOUNTER)
> +			b_sts = BLOCK_STATUS_ERASE_COUNT_BEYOND_MAX;

I don't think we need this case. UBI_MAX_ERASECOUNTER is the maximum
that the UBI implementation can handle. I'm very sure that it is impossible
to hit this ever on real hardware. So that information is useless.

> +	}
> +
> +	seq_printf(s, "%-22d\t%-11d\t%-12s\t%-12s\n", *block_number,
> +		   erase_count, block_status_names[b_sts],
> +		   read_status_names[r_sts]);

Wouldn't it make more sense to just print a line for each present PEB?
i.e. "PEB0: 1234", if a PEB is bad, just don't print it.

Thanks,
//richard
