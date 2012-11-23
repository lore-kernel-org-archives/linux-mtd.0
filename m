Received: from mail-wi0-f173.google.com ([209.85.212.173])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tc0lW-0008N3-9L
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2012 21:26:27 +0000
Received: by mail-wi0-f173.google.com with SMTP id hn17so1428742wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2012 13:26:23 -0800 (PST)
Date: Fri, 23 Nov 2012 23:26:00 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Subject: Re: [RFC/PATCH] ubi: Replace wear leveling thread with a workqueue
Message-ID: <20121123232600.5e0c5aab.shmulik.ladkani@gmail.com>
In-Reply-To: <1353672809-4768-1-git-send-email-elezegarcia@gmail.com>
References: <1353672809-4768-1-git-send-email-elezegarcia@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Fri, 23 Nov 2012 09:13:29 -0300 Ezequiel Garcia <elezegarcia@gmail.com> wrote:
>  /**
> - * ubi_thread - UBI background thread.
> + * ubi_wl_do_work - UBI background wl worker function.
>   * @u: the UBI device description object pointer
>   */
> -int ubi_thread(void *u)
> +void ubi_wl_do_work(struct work_struct *work)
>  {
> +	int err;
>  	int failures = 0;
> -	struct ubi_device *ubi = u;
> -
> -	ubi_msg("background thread \"%s\" started, PID %d",
> -		ubi->bgt_name, task_pid_nr(current));
> -
> -	set_freezable();
> -	for (;;) {
> -		int err;
> -
> -		if (kthread_should_stop())
> -			break;
> +	struct ubi_device *ubi = container_of(work, struct ubi_device, work);
>  
> -		if (try_to_freeze())
> -			continue;
> -
> -		spin_lock(&ubi->wl_lock);
> -		if (list_empty(&ubi->works) || ubi->ro_mode ||

Originally, 'ubi_thread' did nothing if 'ubi->ro_mode'.
This filtering is missing from 'ubi_wl_do_work' implementation.
How do we guarantee 'ubi_wl_do_work' is never queued when in RO mode?

> -		    !ubi->thread_enabled || ubi_dbg_is_bgt_disabled(ubi)) {
> -			set_current_state(TASK_INTERRUPTIBLE);
> -			spin_unlock(&ubi->wl_lock);
> -			schedule();
> -			continue;
> -		}
> -		spin_unlock(&ubi->wl_lock);
> +	err = do_work(ubi);
> +	if (!err)
> +		return;
>  
> -		err = do_work(ubi);
> -		if (err) {
> -			ubi_err("%s: work failed with error code %d",
> -				ubi->bgt_name, err);
> -			if (failures++ > WL_MAX_FAILURES) {
> -				/*
> -				 * Too many failures, disable the thread and
> -				 * switch to read-only mode.
> -				 */
> -				ubi_msg("%s: %d consecutive failures",
> -					ubi->bgt_name, WL_MAX_FAILURES);
> -				ubi_ro_mode(ubi);
> -				ubi->thread_enabled = 0;
> -				continue;
> -			}
> -		} else
> -			failures = 0;
> -
> -		cond_resched();
> +	ubi_err("%s: work failed with error code %d",
> +		ubi->wq_name, err);
> +	if (failures++ > WL_MAX_FAILURES) {
> +		/*
> +		 * Too many failures, disable the workqueue and
> +		 * switch to read-only mode.
> +		 */

This condition will never be met (after your change), since 'failures'
is local to 'ubi_wl_do_work' (per work invocation).

Formerly, 'failures' was local to 'ubi_thread' (per ubi device's
thread), hence it was possible that several 'do_works()' calls have
failed during thread's lifetime, reaching the WL_MAX_FAILURES limit.

If we'd like to preseve the 'failures' semantics, 'failures' should be
an 'ubi_device' property.

One last thing:
Some variables and functions (debug and sysfs) are still named *bgt*,
which is confusing.

Regards,
Shmulik
