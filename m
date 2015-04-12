Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhJbZ-0000On-FV
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 15:15:26 +0000
Date: Sun, 12 Apr 2015 17:14:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
Message-ID: <20150412171450.51170602@bbrezillon>
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

Second pass on this patch :-).

On Sun, 29 Mar 2015 14:13:17 +0200
Richard Weinberger <richard@nod.at> wrote:

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

IMHO the following code chunk, starting here:

> +			wl_wrk = prepare_erase_work(e, -1, -1, 1);
> +			if (IS_ERR(wl_wrk)) {
> +				err = PTR_ERR(wl_wrk);
> +				goto out;
> +			}
> +
> +			__schedule_ubi_work(ubi, wl_wrk);

and ending here ^, could be placed in an helper function
(re_erase_peb ?)

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

I'm nitpicking again, but I like to have a single place where spinlocks
are locked and unlocked, so here is a rework suggestion for the code
inside the 'if (err == UBI_IO_BITFLIPS)' statement:

		bool ensure_wl = false, scrub = false, re_erase = false;

		spin_lock(&ubi->wl_lock);

		if (in_pq(ubi, e)) {
			prot_queue_del(ubi, e->pnum);
			scrub = true;
		} else if (in_wl_tree(e, &ubi->used)) {
			rb_erase(&e->u.rb, &ubi->used);
			scrub = true;
		} else if (in_wl_tree(e, &ubi->free)) {
			rb_erase(&e->u.rb, &ubi->free);
			re_erase = true;
		} else if (ubi->move_to == e || ubi->move_from == e) {
			ensure_wl = true;
		} else {
			ubi_schedule_fm_work(ubi);
		}

		if (scrub)
			wl_tree_add(e, &ubi->scrub);

		spin_unlock(&ubi->wl_lock);

		if (scrub || ensure_wl)
			err = ensure_wear_leveling(ubi, 1);
		else if (re_erase)
			err = re_erase_peb(ubi, e);
		else
			err = 0;

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
