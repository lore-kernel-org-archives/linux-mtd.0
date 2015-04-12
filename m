Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhIdJ-00073m-Qf
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 14:13:11 +0000
Date: Sun, 12 Apr 2015 16:12:43 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
Message-ID: <20150412161243.4ee7eb59@bbrezillon>
In-Reply-To: <1427631197-23610-5-git-send-email-richard@nod.at>
References: <1427631197-23610-1-git-send-email-richard@nod.at>
 <1427631197-23610-5-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

Sorry for the late reply.

On Sun, 29 Mar 2015 14:13:17 +0200
Richard Weinberger <richard@nod.at> wrote:

> This patch implements bitrot checking for UBI.
> ubi_wl_trigger_bitrot_check() triggers a re-read of every
> PEB. If a bitflip is detected PEBs in use will get scrubbed
> and free ones erased.

As you'll see, I didn't have much to say about the 'UBI bitrot
detection' mechanism, so this review is a collection of
nitpicks :-).

> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/build.c |  39 +++++++++++++
>  drivers/mtd/ubi/ubi.h   |   4 ++
>  drivers/mtd/ubi/wl.c    | 146 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 189 insertions(+)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 9690cf9..f58330b 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -118,6 +118,9 @@ static struct class_attribute ubi_version =
>  
>  static ssize_t dev_attribute_show(struct device *dev,
>  				  struct device_attribute *attr, char *buf);
> +static ssize_t trigger_bitrot_check(struct device *dev,
> +				    struct device_attribute *mattr,
> +				    const char *data, size_t count);
>  
>  /* UBI device attributes (correspond to files in '/<sysfs>/class/ubi/ubiX') */
>  static struct device_attribute dev_eraseblock_size =
> @@ -142,6 +145,8 @@ static struct device_attribute dev_bgt_enabled =
>  	__ATTR(bgt_enabled, S_IRUGO, dev_attribute_show, NULL);
>  static struct device_attribute dev_mtd_num =
>  	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
> +static struct device_attribute dev_trigger_bitrot_check =
> +	__ATTR(trigger_bitrot_check, S_IWUSR, NULL, trigger_bitrot_check);

How about making this attribute a RW one, so that users could check
if there's a bitrot check in progress.

>  
>  /**
>   * ubi_volume_notify - send a volume change notification.
> @@ -334,6 +339,36 @@ int ubi_major2num(int major)
>  	return ubi_num;
>  }
>  
> +/* "Store" method for file '/<sysfs>/class/ubi/ubiX/trigger_bitrot_check' */
> +static ssize_t trigger_bitrot_check(struct device *dev,
> +				    struct device_attribute *mattr,
> +				    const char *data, size_t count)
> +{
> +	struct ubi_device *ubi;
> +	int ret;
> +

Maybe that's on purpose, but you do not check the value passed in data
(in your documention you suggest to do an
echo 1 > /sys/class/ubi/ubiX/trigger_bitrot_check).

> +	ubi = container_of(dev, struct ubi_device, dev);
> +	ubi = ubi_get_device(ubi->ubi_num);
> +	if (!ubi) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	if (atomic_inc_return(&ubi->bit_rot_work) != 1) {
> +		ret = -EBUSY;
> +		goto out_dec;
> +	}
> +
> +	ubi_wl_trigger_bitrot_check(ubi);
> +	ret = count;
> +
> +out_dec:
> +	atomic_dec(&ubi->bit_rot_work);
> +out:
> +	ubi_put_device(ubi);
> +	return ret;
> +}
> +
>  /* "Show" method for files in '/<sysfs>/class/ubi/ubiX/' */
>  static ssize_t dev_attribute_show(struct device *dev,
>  				  struct device_attribute *attr, char *buf)
> @@ -445,6 +480,9 @@ static int ubi_sysfs_init(struct ubi_device *ubi, int *ref)
>  	if (err)
>  		return err;
>  	err = device_create_file(&ubi->dev, &dev_mtd_num);
> +	if (err)
> +		return err;
> +	err = device_create_file(&ubi->dev, &dev_trigger_bitrot_check);
>  	return err;

You don't seem to control the return code, so, how about replacing
those 2 lines by:

	return device_create_file(&ubi->dev, &dev_trigger_bitrot_check);

>  }

[...]

> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 9b11db9..784bb52 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1447,6 +1447,150 @@ static void tree_destroy(struct ubi_device *ubi, struct rb_root *root)
>  }
>  
>  /**
> + * bitrot_check_worker - physical eraseblock bitrot check worker function.
> + * @ubi: UBI device description object
> + * @wl_wrk: the work object
> + * @shutdown: non-zero if the worker has to free memory and exit
> + *
> + * This function reads a physical eraseblock and schedules scrubbing if
> + * bit flips are detected.
> + */
> +static int bitrot_check_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
> +			       int shutdown)
> +{
> +	struct ubi_wl_entry *e = wl_wrk->e;
> +	int err;
> +
> +	kfree(wl_wrk);
> +	if (shutdown) {
> +		dbg_wl("cancel bitrot check of PEB %d", e->pnum);
> +		wl_entry_destroy(ubi, e);
> +		return 0;
> +	}
> +
> +	mutex_lock(&ubi->buf_mutex);
> +	err = ubi_io_read(ubi, ubi->peb_buf, e->pnum, 0, ubi->peb_size);
> +	mutex_unlock(&ubi->buf_mutex);
> +	if (err == UBI_IO_BITFLIPS) {
> +		dbg_wl("found bitflips in PEB %d", e->pnum);
> +		spin_lock(&ubi->wl_lock);
> +
> +		if (in_pq(ubi, e)) {
> +			prot_queue_del(ubi, e->pnum);
> +			wl_tree_add(e, &ubi->scrub);
> +			spin_unlock(&ubi->wl_lock);
> +
> +			err = ensure_wear_leveling(ubi, 1);
> +		}
> +		else if (in_wl_tree(e, &ubi->used)) {
> +			rb_erase(&e->u.rb, &ubi->used);
> +			wl_tree_add(e, &ubi->scrub);
> +			spin_unlock(&ubi->wl_lock);
> +
> +			err = ensure_wear_leveling(ubi, 1);
> +		}
> +		else if (in_wl_tree(e, &ubi->free)) {
> +			rb_erase(&e->u.rb, &ubi->free);
> +			spin_unlock(&ubi->wl_lock);
> +
> +			wl_wrk = prepare_erase_work(e, -1, -1, 1);
> +			if (IS_ERR(wl_wrk)) {
> +				err = PTR_ERR(wl_wrk);
> +				goto out;
> +			}
> +
> +			__schedule_ubi_work(ubi, wl_wrk);
> +			err = 0;
> +		}
> +		/*
> +		 * e is target of a move operation, all we can do is kicking
> +		 * wear leveling such that we can catch it later or wear
> +		 * leveling itself scrubbs the PEB.
> +		 */
> +		else if (ubi->move_to == e || ubi->move_from == e) {
> +			spin_unlock(&ubi->wl_lock);
> +
> +			err = ensure_wear_leveling(ubi, 1);
> +		}
> +		/*
> +		 * e is member of a fastmap pool. We are not allowed to
> +		 * remove it from that pool as the on-flash fastmap data
> +		 * structure refers to it. Let's schedule a new fastmap write
> +		 * such that the said PEB can get released.
> +		 */
> +		else {
> +			ubi_schedule_fm_work(ubi);
> +			spin_unlock(&ubi->wl_lock);
> +
> +			err = 0;
> +		}

Nitpick, but checkpatch complains about 'else' or 'else if' statements
that are not on the '}' line.

> +	}
> +	else {
> +		/*
> +		 * Ignore read errors as we return only work related errors.
> +		 * Read errors will be logged by ubi_io_read().
> +		 */
> +		err = 0;
> +	}

Nitpicking again, but you can avoid another level of indentation by
doing the following:

	if (err != UBI_IO_BITFLIPS) {
		err = 0;
		goto out;
	}

	dbg_wl("found bitflips in PEB %d", e->pnum);
	spin_lock(&ubi->wl_lock);
	/* ... */

> +
> +out:
> +	atomic_dec(&ubi->bit_rot_work);
> +	ubi_assert(atomic_read(&ubi->bit_rot_work) >= 0);

How about replacing those two lines by:

	ubi_assert(atomic_dec_return(&ubi->bit_rot_work) >= 0);

> +	return err;
> +}

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
