Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmfUA-0007qS-1V
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 11:14:43 +0000
Subject: Re: [PATCH v2] UBI: add debugfs file for tracking PEB state
To: Zach Brown <zach.brown@ni.com>, dwmw2@infradead.org
References: <1474404339-9524-1-git-send-email-zach.brown@ni.com>
Cc: computersforpeace@gmail.com, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <c7a01872-7d8e-d2e7-3241-14bab9ed55f3@nod.at>
Date: Wed, 21 Sep 2016 13:13:29 +0200
MIME-Version: 1.0
In-Reply-To: <1474404339-9524-1-git-send-email-zach.brown@ni.com>
Content-Type: text/plain; charset=windows-1252
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

On 20.09.2016 22:45, Zach Brown wrote:
> From: Ben Shelton <ben.shelton@ni.com>
> 
> Add a file under debugfs to allow easy access to the erase count for
> each physical erase block on an UBI device.  This is useful when
> debugging data integrity issues with UBIFS on NAND flash devices.
> 
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> ---
> v2
>  * Cast pointer in unsigned long instead of int to avoid build warning
>  * Use ubi->lookuptbl[] to get erase counter instead of reading from flash
> 
> 

[...]

> +enum block_status {
> +	BLOCK_STATUS_OK,
> +	BLOCK_STATUS_BAD_BLOCK,
> +	BLOCK_STATUS_ERASE_COUNT_BEYOND_MAX
> +};

Do you plan to add more states?
In UBI a block can have much more states.
I'd like to see all states, free, in protection, used, bad, corrupted, scrub, etc...

AFAIK BLOCK_STATUS_ERASE_COUNT_BEYOND_MAX is also unreachable since UBI aborts before that.

> +static char const *block_status_names[] = {"OK", "marked_bad",
> +					   "erase_count_beyond_max"};
> +
> +enum read_status {
> +	READ_STATUS_OK,
> +	READ_STATUS_ERR_READING_BLOCK,
> +	READ_STATUS_ERR_READING_ERASE_COUNT
> +};
>

READ_STATUS_ERR_READING_ERASE_COUNT is now no longer needed, right?

> +static char const *read_status_names[] = {"OK", "err_reading_block",
> +					  "err_reading_erase_count"};
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
> +		else
> +			b_sts = BLOCK_STATUS_BAD_BLOCK;
> +	} else {
> +		wl = ubi->lookuptbl[*block_number];
> +		erase_count = wl->ec;

What about locking? :-)
This is racy.
You need at least wl_lock. Otherwise wl might disappear under you.
And ->lookuptbl[] can return a NULL object too.

Thanks,
//richard
