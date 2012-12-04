Received: from mail-ie0-f182.google.com ([209.85.223.182])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tfr0F-0003bz-AI
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 11:49:32 +0000
Received: by mail-ie0-f182.google.com with SMTP id s9so9251350iec.27
 for <linux-mtd@lists.infradead.org>; Tue, 04 Dec 2012 03:49:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1354105110-24721-1-git-send-email-elezegarcia@gmail.com>
References: <1354105110-24721-1-git-send-email-elezegarcia@gmail.com>
Date: Tue, 4 Dec 2012 08:49:29 -0300
Message-ID: <CALF0-+XP5QHSZy6t4oD0Gt4PG14D3U5CW6+rEZuMF+tR-JGr_g@mail.gmail.com>
Subject: Re: [PATCH v2] ubi: Replace wear leveling thread with a workqueue
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

On Wed, Nov 28, 2012 at 9:18 AM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
> Since workqueues are cheaper and easier to use we
> should prefer them, unless there's a strong reason to
> prefer threads instead.
>
> This patch replaces the background wear leveling thread
> with a workqueue: one per device, freezable and cpu unbound.
> This is different from having one thread per device
> because each new workqueue doesn't correlate to a new thread.
> However, wear leveling being a background task,
> responsiveness is not the primary goal.
>
> Note that there is still one thread per workqueue
> because freezable workqueues need rescuer threads to live.
>
> Due to lack of real hardware, tests have been performed on
> an emulated environment on nandsim devices.
> Some real testing should be done, before merging this patch.
>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
> ---
> Changes from v1:
>  * Being the kthread freezable, now the workqueue is also freezable.
>    This has the side-effect of launching a rescuer thread.
>
>  * Replace 'bgt' -> 'wq' in every symbol
>
>  * Since now we don't have a separate thread, we have to introduce 'wl_failures'
>    to keep track of failures and switch to ro_mode.
>    Thanks to Shmulik for pointing this out.
>
>  drivers/mtd/ubi/build.c |   40 +++++++++-------------
>  drivers/mtd/ubi/debug.c |   12 +++---
>  drivers/mtd/ubi/debug.h |    6 ++--
>  drivers/mtd/ubi/ubi.h   |   29 +++++++++-------
>  drivers/mtd/ubi/wl.c    |   83 ++++++++++++++++-------------------------------
>  5 files changed, 70 insertions(+), 100 deletions(-)
>
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index a561335..2b133a7 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -38,7 +38,7 @@
>  #include <linux/miscdevice.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/log2.h>
> -#include <linux/kthread.h>
> +#include <linux/workqueue.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include "ubi.h"
> @@ -135,8 +135,8 @@ static struct device_attribute dev_max_vol_count =
>         __ATTR(max_vol_count, S_IRUGO, dev_attribute_show, NULL);
>  static struct device_attribute dev_min_io_size =
>         __ATTR(min_io_size, S_IRUGO, dev_attribute_show, NULL);
> -static struct device_attribute dev_bgt_enabled =
> -       __ATTR(bgt_enabled, S_IRUGO, dev_attribute_show, NULL);
> +static struct device_attribute dev_wq_enabled =
> +       __ATTR(wq_enabled, S_IRUGO, dev_attribute_show, NULL);
>  static struct device_attribute dev_mtd_num =
>         __ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
>
> @@ -372,8 +372,8 @@ static ssize_t dev_attribute_show(struct device *dev,
>                 ret = sprintf(buf, "%d\n", ubi->vtbl_slots);
>         else if (attr == &dev_min_io_size)
>                 ret = sprintf(buf, "%d\n", ubi->min_io_size);
> -       else if (attr == &dev_bgt_enabled)
> -               ret = sprintf(buf, "%d\n", ubi->thread_enabled);
> +       else if (attr == &dev_wq_enabled)
> +               ret = sprintf(buf, "%d\n", ubi->wq_enabled);
>         else if (attr == &dev_mtd_num)
>                 ret = sprintf(buf, "%d\n", ubi->mtd->index);
>         else
> @@ -439,7 +439,7 @@ static int ubi_sysfs_init(struct ubi_device *ubi, int *ref)
>         err = device_create_file(&ubi->dev, &dev_min_io_size);
>         if (err)
>                 return err;
> -       err = device_create_file(&ubi->dev, &dev_bgt_enabled);
> +       err = device_create_file(&ubi->dev, &dev_wq_enabled);
>         if (err)
>                 return err;
>         err = device_create_file(&ubi->dev, &dev_mtd_num);
> @@ -453,7 +453,7 @@ static int ubi_sysfs_init(struct ubi_device *ubi, int *ref)
>  static void ubi_sysfs_close(struct ubi_device *ubi)
>  {
>         device_remove_file(&ubi->dev, &dev_mtd_num);
> -       device_remove_file(&ubi->dev, &dev_bgt_enabled);
> +       device_remove_file(&ubi->dev, &dev_wq_enabled);
>         device_remove_file(&ubi->dev, &dev_min_io_size);
>         device_remove_file(&ubi->dev, &dev_max_vol_count);
>         device_remove_file(&ubi->dev, &dev_bad_peb_count);
> @@ -1005,11 +1005,11 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
>         if (err)
>                 goto out_uif;
>
> -       ubi->bgt_thread = kthread_create(ubi_thread, ubi, ubi->bgt_name);
> -       if (IS_ERR(ubi->bgt_thread)) {
> -               err = PTR_ERR(ubi->bgt_thread);
> -               ubi_err("cannot spawn \"%s\", error %d", ubi->bgt_name,
> -                       err);
> +       ubi->workqueue = create_freezable_workqueue(ubi->wq_name);
> +       if (!ubi->workqueue) {
> +               err = -ENOMEM;
> +               ubi_err("cannot create workqueue \"%s\", error %d",
> +                        ubi->wq_name, err);
>                 goto out_debugfs;
>         }
>
> @@ -1032,14 +1032,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
>         ubi_msg("available PEBs: %d, total reserved PEBs: %d, PEBs reserved for bad PEB handling: %d",
>                 ubi->avail_pebs, ubi->rsvd_pebs, ubi->beb_rsvd_pebs);
>
> -       /*
> -        * The below lock makes sure we do not race with 'ubi_thread()' which
> -        * checks @ubi->thread_enabled. Otherwise we may fail to wake it up.
> -        */
> -       spin_lock(&ubi->wl_lock);
> -       ubi->thread_enabled = 1;
> -       wake_up_process(ubi->bgt_thread);
> -       spin_unlock(&ubi->wl_lock);
> +       ubi->wq_enabled = 1;
> +       INIT_WORK(&ubi->work, ubi_wl_do_work);
>
>         ubi_devices[ubi_num] = ubi;
>         ubi_notify_all(ubi, UBI_VOLUME_ADDED, NULL);
> @@ -1113,11 +1107,11 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
>         ubi_update_fastmap(ubi);
>  #endif
>         /*
> -        * Before freeing anything, we have to stop the background thread to
> +        * Before freeing anything, we have to stop the background workqueue to
>          * prevent it from doing anything on this device while we are freeing.
>          */
> -       if (ubi->bgt_thread)
> -               kthread_stop(ubi->bgt_thread);
> +       if (ubi->workqueue)
> +               destroy_workqueue(ubi->workqueue);
>
>         /*
>          * Get a reference to the device in order to prevent 'dev_release()'
> diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
> index 63cb1d7..a4e84da 100644
> --- a/drivers/mtd/ubi/debug.c
> +++ b/drivers/mtd/ubi/debug.c
> @@ -275,8 +275,8 @@ static ssize_t dfs_file_read(struct file *file, char __user *user_buf,
>                 val = d->chk_gen;
>         else if (dent == d->dfs_chk_io)
>                 val = d->chk_io;
> -       else if (dent == d->dfs_disable_bgt)
> -               val = d->disable_bgt;
> +       else if (dent == d->dfs_disable_wq)
> +               val = d->disable_wq;
>         else if (dent == d->dfs_emulate_bitflips)
>                 val = d->emulate_bitflips;
>         else if (dent == d->dfs_emulate_io_failures)
> @@ -336,8 +336,8 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
>                 d->chk_gen = val;
>         else if (dent == d->dfs_chk_io)
>                 d->chk_io = val;
> -       else if (dent == d->dfs_disable_bgt)
> -               d->disable_bgt = val;
> +       else if (dent == d->dfs_disable_wq)
> +               d->disable_wq = val;
>         else if (dent == d->dfs_emulate_bitflips)
>                 d->emulate_bitflips = val;
>         else if (dent == d->dfs_emulate_io_failures)
> @@ -406,12 +406,12 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
>                 goto out_remove;
>         d->dfs_chk_io = dent;
>
> -       fname = "tst_disable_bgt";
> +       fname = "tst_disable_wq";
>         dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
>                                    &dfs_fops);
>         if (IS_ERR_OR_NULL(dent))
>                 goto out_remove;
> -       d->dfs_disable_bgt = dent;
> +       d->dfs_disable_wq = dent;
>
>         fname = "tst_emulate_bitflips";
>         dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
> diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
> index 33f8f3b..b562897 100644
> --- a/drivers/mtd/ubi/debug.h
> +++ b/drivers/mtd/ubi/debug.h
> @@ -66,15 +66,15 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi);
>  void ubi_debugfs_exit_dev(struct ubi_device *ubi);
>
>  /**
> - * ubi_dbg_is_bgt_disabled - if the background thread is disabled.
> + * ubi_dbg_is_wq_disabled - if the background thread is disabled.
>   * @ubi: UBI device description object
>   *
>   * Returns non-zero if the UBI background thread is disabled for testing
>   * purposes.
>   */
> -static inline int ubi_dbg_is_bgt_disabled(const struct ubi_device *ubi)
> +static inline int ubi_dbg_is_wq_disabled(const struct ubi_device *ubi)
>  {
> -       return ubi->dbg.disable_bgt;
> +       return ubi->dbg.disable_wq;
>  }
>
>  /**
> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> index 8ea6297..6a0add7 100644
> --- a/drivers/mtd/ubi/ubi.h
> +++ b/drivers/mtd/ubi/ubi.h
> @@ -59,8 +59,8 @@
>  #define ubi_err(fmt, ...) pr_err("UBI error: %s: " fmt "\n",      \
>                                  __func__, ##__VA_ARGS__)
>
> -/* Background thread name pattern */
> -#define UBI_BGT_NAME_PATTERN "ubi_bgt%dd"
> +/* Background workqueue name pattern */
> +#define UBI_WQ_NAME_PATTERN "ubi_workqueue%dd"
>
>  /*
>   * This marker in the EBA table means that the LEB is um-mapped.
> @@ -353,28 +353,28 @@ struct ubi_wl_entry;
>   *
>   * @chk_gen: if UBI general extra checks are enabled
>   * @chk_io: if UBI I/O extra checks are enabled
> - * @disable_bgt: disable the background task for testing purposes
> + * @disable_wq: disable the background task for testing purposes
>   * @emulate_bitflips: emulate bit-flips for testing purposes
>   * @emulate_io_failures: emulate write/erase failures for testing purposes
>   * @dfs_dir_name: name of debugfs directory containing files of this UBI device
>   * @dfs_dir: direntry object of the UBI device debugfs directory
>   * @dfs_chk_gen: debugfs knob to enable UBI general extra checks
>   * @dfs_chk_io: debugfs knob to enable UBI I/O extra checks
> - * @dfs_disable_bgt: debugfs knob to disable the background task
> + * @dfs_disable_wq: debugfs knob to disable the background task
>   * @dfs_emulate_bitflips: debugfs knob to emulate bit-flips
>   * @dfs_emulate_io_failures: debugfs knob to emulate write/erase failures
>   */
>  struct ubi_debug_info {
>         unsigned int chk_gen:1;
>         unsigned int chk_io:1;
> -       unsigned int disable_bgt:1;
> +       unsigned int disable_wq:1;
>         unsigned int emulate_bitflips:1;
>         unsigned int emulate_io_failures:1;
>         char dfs_dir_name[UBI_DFS_DIR_LEN + 1];
>         struct dentry *dfs_dir;
>         struct dentry *dfs_chk_gen;
>         struct dentry *dfs_chk_io;
> -       struct dentry *dfs_disable_bgt;
> +       struct dentry *dfs_disable_wq;
>         struct dentry *dfs_emulate_bitflips;
>         struct dentry *dfs_emulate_io_failures;
>  };
> @@ -449,9 +449,10 @@ struct ubi_debug_info {
>   * @move_to_put: if the "to" PEB was put
>   * @works: list of pending works
>   * @works_count: count of pending works
> - * @bgt_thread: background thread description object
> - * @thread_enabled: if the background thread is enabled
> - * @bgt_name: background thread name
> + * @workqueue: background workqueue
> + * @work: background work item
> + * @wq_enabled: if the background workqueue is enabled
> + * @wq_name: background workqueue name
>   *
>   * @flash_size: underlying MTD device size (in bytes)
>   * @peb_count: count of physical eraseblocks on the MTD device
> @@ -551,9 +552,11 @@ struct ubi_device {
>         int move_to_put;
>         struct list_head works;
>         int works_count;
> -       struct task_struct *bgt_thread;
> -       int thread_enabled;
> -       char bgt_name[sizeof(UBI_BGT_NAME_PATTERN)+2];
> +       struct workqueue_struct *workqueue;
> +       struct work_struct work;
> +       int wl_failures;
> +       int wq_enabled;
> +       char wq_name[sizeof(UBI_WQ_NAME_PATTERN)+2];
>
>         /* I/O sub-system's stuff */
>         long long flash_size;
> @@ -810,7 +813,7 @@ int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum);
>  int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum);
>  int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai);
>  void ubi_wl_close(struct ubi_device *ubi);
> -int ubi_thread(void *u);
> +void ubi_wl_do_work(struct work_struct *work);
>  struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_device *ubi, int anchor);
>  int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e,
>                       int lnum, int torture);
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index c687538..22484b5 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -33,7 +33,7 @@
>   *
>   * When physical eraseblocks are returned to the WL sub-system by means of the
>   * 'ubi_wl_put_peb()' function, they are scheduled for erasure. The erasure is
> - * done asynchronously in context of the per-UBI device background thread,
> + * done asynchronously in context of the per-UBI device background workqueue,
>   * which is also managed by the WL sub-system.
>   *
>   * The wear-leveling is ensured by means of moving the contents of used
> @@ -101,7 +101,7 @@
>  #include <linux/slab.h>
>  #include <linux/crc32.h>
>  #include <linux/freezer.h>
> -#include <linux/kthread.h>
> +#include <linux/workqueue.h>
>  #include "ubi.h"
>
>  /* Number of physical eraseblocks reserved for wear-leveling purposes */
> @@ -129,7 +129,7 @@
>  #define WL_FREE_MAX_DIFF (2*UBI_WL_THRESHOLD)
>
>  /*
> - * Maximum number of consecutive background thread failures which is enough to
> + * Maximum number of consecutive workqueue failures which is enough to
>   * switch to read-only mode.
>   */
>  #define WL_MAX_FAILURES 32
> @@ -264,7 +264,7 @@ static int do_work(struct ubi_device *ubi)
>   * @ubi: UBI device description object
>   *
>   * This function tries to make a free PEB by means of synchronous execution of
> - * pending works. This may be needed if, for example the background thread is
> + * pending works. This may be needed if, for example the background workqueue is
>   * disabled. Returns zero in case of success and a negative error code in case
>   * of failure.
>   */
> @@ -836,8 +836,8 @@ static void __schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
>         list_add_tail(&wrk->list, &ubi->works);
>         ubi_assert(ubi->works_count >= 0);
>         ubi->works_count += 1;
> -       if (ubi->thread_enabled && !ubi_dbg_is_bgt_disabled(ubi))
> -               wake_up_process(ubi->bgt_thread);
> +       if (ubi->wq_enabled && !ubi_dbg_is_wq_disabled(ubi))
> +               queue_work(ubi->workqueue, &ubi->work);
>         spin_unlock(&ubi->wl_lock);
>  }
>
> @@ -1777,60 +1777,33 @@ static void tree_destroy(struct rb_root *root)
>  }
>
>  /**
> - * ubi_thread - UBI background thread.
> + * ubi_wl_do_work - UBI background wl worker function.
>   * @u: the UBI device description object pointer
>   */
> -int ubi_thread(void *u)
> +void ubi_wl_do_work(struct work_struct *work)
>  {
> -       int failures = 0;
> -       struct ubi_device *ubi = u;
> -
> -       ubi_msg("background thread \"%s\" started, PID %d",
> -               ubi->bgt_name, task_pid_nr(current));
> -
> -       set_freezable();
> -       for (;;) {
> -               int err;
> -
> -               if (kthread_should_stop())
> -                       break;
> -
> -               if (try_to_freeze())
> -                       continue;
> -
> -               spin_lock(&ubi->wl_lock);
> -               if (list_empty(&ubi->works) || ubi->ro_mode ||
> -                   !ubi->thread_enabled || ubi_dbg_is_bgt_disabled(ubi)) {
> -                       set_current_state(TASK_INTERRUPTIBLE);
> -                       spin_unlock(&ubi->wl_lock);
> -                       schedule();
> -                       continue;
> -               }
> -               spin_unlock(&ubi->wl_lock);
> -
> -               err = do_work(ubi);
> -               if (err) {
> -                       ubi_err("%s: work failed with error code %d",
> -                               ubi->bgt_name, err);
> -                       if (failures++ > WL_MAX_FAILURES) {
> -                               /*
> -                                * Too many failures, disable the thread and
> -                                * switch to read-only mode.
> -                                */
> -                               ubi_msg("%s: %d consecutive failures",
> -                                       ubi->bgt_name, WL_MAX_FAILURES);
> -                               ubi_ro_mode(ubi);
> -                               ubi->thread_enabled = 0;
> -                               continue;
> -                       }
> -               } else
> -                       failures = 0;
> +       int err;
> +       struct ubi_device *ubi = container_of(work, struct ubi_device, work);
>
> -               cond_resched();
> +       err = do_work(ubi);
> +       if (!err) {
> +               /* Reset consecutive failures counter */
> +               ubi->wl_failures = 0;
> +               return;
>         }
>
> -       dbg_wl("background thread \"%s\" is killed", ubi->bgt_name);
> -       return 0;
> +       ubi_err("%s: work failed with error code %d",
> +               ubi->wq_name, err);
> +       if (ubi->wl_failures++ > WL_MAX_FAILURES) {
> +               /*
> +                * Too many failures, disable the workqueue and
> +                * switch to read-only mode.
> +                */
> +               ubi_msg("%s: %d consecutive failures",
> +                       ubi->wq_name, WL_MAX_FAILURES);
> +               ubi_ro_mode(ubi);
> +               ubi->wq_enabled = 0;
> +       }
>  }
>
>  /**
> @@ -1876,7 +1849,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
>         INIT_WORK(&ubi->fm_work, update_fastmap_work_fn);
>  #endif
>
> -       sprintf(ubi->bgt_name, UBI_BGT_NAME_PATTERN, ubi->ubi_num);
> +       sprintf(ubi->wq_name, UBI_WQ_NAME_PATTERN, ubi->ubi_num);
>
>         err = -ENOMEM;
>         ubi->lookuptbl = kzalloc(ubi->peb_count * sizeof(void *), GFP_KERNEL);
> --

Oops! Drop this patch: it breaks fastmap!

[   33.600972] UBI: default fastmap pool size: 200
[   33.601811] UBI: default fastmap WL pool size: 25
[   33.602601] UBI: attaching mtd0 to ubi0
[   33.745369] UBI: scanning is finished
[   33.746071] UBI: empty MTD device detected
[   33.766414] UBI: attached mtd0 (name "NAND simulator partition 0",
size 512 MiB) to ubi0
[   33.767975] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
[   33.769073] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
[   33.770149] UBI: VID header offset: 512 (aligned 512), data offset: 2048
[   33.771336] UBI: good PEBs: 4096, bad PEBs: 0, corrupted PEBs: 0
[   33.772354] UBI: user volume: 0, internal volumes: 1, max. volumes count: 128
[   33.773269] UBI: max/mean erase counter: 0/0, WL threshold: 4096,
image sequence number: 3272523710
[   33.774162] UBI: available PEBs: 4010, total reserved PEBs: 86,
PEBs reserved for bad PEB handling: 80
Set volume size to 517386240
[   33.857568] UBI error: ubi_update_fastmap: could not find any anchor PEB
[   33.858943] UBI warning: ubi_update_fastmap: Unable to write new
fastmap, err=-28
[   33.863957] UBI error: ubi_create_volume: cannot create volume 0, error -28

I have no idea why, but I'll be looking into it.

Regards,

    Ezequiel
