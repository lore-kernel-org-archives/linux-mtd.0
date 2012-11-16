Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TZScJ-0003lS-4c
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 20:34:24 +0000
Received: by mail-ie0-f177.google.com with SMTP id e14so4136895iej.36
 for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2012 12:34:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMjNe_cJG6wkiPDvVZzqURz4gVTW8Dx4JrM-KPVbVedLwsDfcw@mail.gmail.com>
References: <CAMjNe_cJG6wkiPDvVZzqURz4gVTW8Dx4JrM-KPVbVedLwsDfcw@mail.gmail.com>
Date: Fri, 16 Nov 2012 17:34:21 -0300
Message-ID: <CALF0-+WioO2vhKWA7ZofktKnfcKCcKTsqdEVpwA2BjQzqCSE9Q@mail.gmail.com>
Subject: Re: [RFC] LFTL: a FTL for large parallel IO flash cards
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Thanks for the patch!

Though I haven't read the code in detail, I have a few minor comments to make.

See below.

On Fri, Nov 16, 2012 at 4:34 PM, srimugunthan dhandapani
<srimugunthan.dhandapani@gmail.com> wrote:
> Hi all,
>
>  Due to fundamental limits like size-per-chip and interface speed
>  limits all  large capacity Flash  are made of multiple chips or banks.
>  The presence of multiple chips readily offers parallel read or write support.
>  Unlike an SSD, for a raw flash card , this parallelism is visible to
>  the software layer and there are many opportunities
>  for exploiting this parallelism.
>
>  The presented LFTL is meant for flash cards with multiple banks and
>  larger minimum write sizes.
>  LFTL mostly reuses code from mtd_blkdevs.c and mtdblock.c.
>  The LFTL was tested on  a 512GB raw flash card which has no firmware
>  for wearlevelling or garbage collection.
>
>  The following are the important points regarding the LFTL:
>
>  1. multiqueued/multithreaded design:(Thanks  to Joern engel for a
>  mail-discussion)
>  The mtd_blkdevs.c dequeues block I/O requests from the block layer
>  provided request queue from a single kthread.
>  This design of IO requests dequeued from a single queue by a single
>  thread is a bottleneck for flash cards that supports hundreds of MB/sec.
>  We use a multiqueued and multithreaded design.
>  We bypass the block layer by registering a new make_request and
>  the LFTL maintains several queues of its own and the block IO requests are
>  put in one of these queues. For every queue there is an associated kthread
>  that processes requests from that queue. The number of "FTL IO kthreads"
>  is #defined as 64 currently.
>
>  2. Block allocation and Garbage collection:
>  The block allocation algorithm allocates blocks across the banks and
>  so the multiple FTL IO kthreads can write to different banks
>  simultaneously. With this design we were able to get upto 300MB/sec(
>  although some more bandwidth is possible from the device)
>  Further the block allocation tries to  exclude any bank that is being
>  garbage collected and tries to allocate the block on bank that is
>  idle.  Similar to IO, the garbage collection is performed from several
>  co-running threads. The garbage collection is started on a bank where
>  there is no I/O happening.  By scheduling the writes and garbage collection
>  on the different banks,  we can considerably avoid garbage collection latency
>  in the write path.
>
>
>  3. Buffering within FTL :
>  The LFTL exposes a block size of 4K. The flash card that we used has
>  a minimum writesize of 32K. So we use several caching buffers inside
>  the FTL to accumulate the 4Ks to a single 32K and then flush to the flash.
>  The number of caching buffers is #defined as 256  but they can be
>  tunable. The per-buffer size is set to page size of 32K.
>  First the write requests are absorbed in these multiple FTL
>  cache-buffers before they are flushed to flash device.
>  We also flush the buffers  that are not modified for a considerable
>  amount of time from a separate background thread.
>
>  4. Adaptive garbage collection:
>   The amount of garbage collection that is happening at a particular
>  instant is controlled by the number of active garbage collecting threads.
>  The number of active garbage collecting threads is varied according to the
>  current I/O load on the device. The current IO load level is inferred from
>  the number of active FTL IO kthreads.  During idle times(number of active FTL
>  IO kthreads = 0), the number of active garbage collecting threads is
>  increased to maximum. When all FTL IO threads are active, we reduce
>  the number of active garbage collecting threads to atmost one
>
>
>  5. Checkpointing:
>  Similar to Yaffs2, LFTL during module unload checkpoints the important
>  data structures and during reload they are used to reconstruct the FTL
>  datastructures.  The initial device scan is also parallelised and searching for
>  checkpoint block during module load also happens from multiple
>  kthreads.  The checkpoint information is stored in a chained fashion with one
>  checkpoint block pointing to the next. The first checkpoint block is
>  guaranteed to be in the first or last few blocks of any bank.
>  So the parallel running threads only need to find the first checkpoint block
>  and we  subsequently follow the linked chain.
>
>
>  With LFTL we were able to get upto 300MB/sec for sequential workload.
>  The device actually can support more than 300MB/sec and the LFTL still
>  needs improvement (and more testing).
>
>  Despite the code being far from perfect, i am  sending the patch to
>  get some initial feedback comments.
>  Thanks in advance for your inputs for improving the FTL.
>  -mugunthan
>
>  Signed-off-by: srimugunthan <srimugunthan.dhandapani@gmail.com>
> ---
>
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 4be8373..c68b5d2 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -237,6 +237,15 @@ config NFTL
>           hardware, although under the terms of the GPL you're obviously
>           permitted to copy, modify and distribute the code as you wish. Just
>           not use it.
> +
> +config LFTL
> +       tristate "LFTL (FTL for parallel IO flash card) support"
> +
> +       ---help---
> +         This provides support for the NAND Flash Translation Layer which is
> +         meant for large capacity Raw flash cards with parallel I/O
> +         capability
> +
>
>  config NFTL_RW
>         bool "Write support for NFTL"
> diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
> index 39664c4..8d36339 100644
> --- a/drivers/mtd/Makefile
> +++ b/drivers/mtd/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_MTD_BLOCK)               += mtdblock.o
>  obj-$(CONFIG_MTD_BLOCK_RO)     += mtdblock_ro.o
>  obj-$(CONFIG_FTL)              += ftl.o
>  obj-$(CONFIG_NFTL)             += nftl.o
> +obj-$(CONFIG_LFTL)             += lftl.o
>  obj-$(CONFIG_INFTL)            += inftl.o
>  obj-$(CONFIG_RFD_FTL)          += rfd_ftl.o
>  obj-$(CONFIG_SSFDC)            += ssfdc.o
> diff --git a/drivers/mtd/lftl.c b/drivers/mtd/lftl.c
> new file mode 100644
> index 0000000..7f446e0
> --- /dev/null
> +++ b/drivers/mtd/lftl.c
> @@ -0,0 +1,6417 @@
> +/*
> + * lftl: A FTL for Multibanked flash cards with parallel I/O capability
> + *
> + *
> + * this file heavily reuses code from  linux-mtd layer
> + * Modified over  the files
> + *     1. mtdblock.c (authors:  David Woodhouse <dwmw2@infradead.org>
> and Nicolas Pitre <nico@fluxnic.net>)
> + *     2. mtd_blkdevs.c(authors: David Woodhouse <dwmw2@infradead.org>)
> + * code reuse from from urcu library for  lock-free queue (author:
> Mathieu Desnoyers <mathieu.desnoyers@efficios.com>)
> + * author of this file: Srimugunthan Dhandapani
> <srimugunthan.dhandapani@gmail.com>
> + *
> + * follows the same licensing of mtdblock.c and mtd_blkdevs.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/list.h>
> +#include <linux/fs.h>
> +
> +#include <linux/mtd/mtd.h>
> +#include <linux/blkdev.h>
> +#include <linux/blkpg.h>
> +#include <linux/spinlock.h>
> +#include <linux/hdreg.h>
> +#include <linux/init.h>
> +#include <linux/mutex.h>
> +#include <linux/kthread.h>
> +#include <asm/uaccess.h>
> +#include <linux/random.h>
> +#include <linux/kthread.h>
> +#include "lftl.h"
> +
> +
> +
> +
> +
> +
> +
> +
> +

Why these blank lines?


> +#define INVALID_VALUE (-1)
> +
> +#define MAX_FTL_CACHEBUFS 256
> +
> +#define STATE_EMPTY 0
> +#define STATE_DIRTY 1
> +#define STATE_FULL 2
> +#define STATE_CLEAN 3
> +
> +#define GC_THRESH 100000
> +#define INVALID -1
> +#define RAND_SEL -2
> +
> +#define ACCEPTABLE_THRESH 256
> +
> +#define INVALID_PAGE_NUMBER (0xFFFFFFFF)
> +
> +
> +#define INVALID_CACHE_NUM 0x7F
> +#define INVALID_SECT_NUM 0xFFFFFF
> +
> +#define NO_BUF_FOR_USE -1
> +#define NUM_FREE_BUFS_THRESH 5
> +
> +
> +

More blank lines here... and there are many more.
They make the code ugly, at least to me.


> +#define BLK_BITMAP_SIZE 4096
> +
> +
> +#define GC_NUM_TOBE_SCHEDULED 2
> +
> +#define DATA_BLK 1
> +#define MAP_BLK 2
> +#define FREE_BLK 0xFFFFFFFF
> +#define NUM_GC_LEVELS 3
> +#define GC_LEVEL0 0
> +#define GC_LEVEL1 1
> +#define GC_LEVEL2 2
> +
> +#define GC_OP 0
> +#define WR_OP 1
> +#define PFTCH_OP 2
> +#define RD_OP 3
> +
> +
> +#define INVALID_PAGE_NUMBER_32 0xFFFFFFFF
> +
> +#define NUM_GC_THREAD 8
> +
> +#define MAX_NUM_PLL_BANKS 64
> +
> +#define MAX_PAGES_PER_BLK 64
> +
> +#define CKPT_RANGE 10
> +
> +uint32_t numpllbanks = MAX_NUM_PLL_BANKS;
> +
> +module_param(numpllbanks, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
> +MODULE_PARM_DESC(numpllbanks, "Number of parallel bank units in the flash");
> +
> +uint32_t first_time = 0;
> +module_param(first_time, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
> +MODULE_PARM_DESC(numpllbanks, "boolean value, if the module is loaded
> firsttime");
> +
> +
> +static atomic_t num_gcollected;
> +static atomic_t gc_on_writes_collisions;
> +static atomic_t num_gc_wakeups;
> +
> +static atomic_t num_l0_gcollected;
> +static atomic_t num_l1_gcollected;
> +static atomic_t num_l2_gcollected;
> +static atomic_t num_erase_gcollected;
> +static atomic_t num_cperase_gcollected;
> +
> +static atomic_t num_gc_threads;
> +
> +
> +
> +
> +
> +
> +static unsigned long *page_bitmap;
> +static unsigned long *page_incache_bitmap;
> +static unsigned long *maptab_bitmap;
> +static unsigned long *gc_map;
> +static unsigned long *gc_bankbitmap;
> +
> +
> +
> +struct extra_info_struct
> +{
> +       uint64_t sequence_number;
> +};
> +
> +struct extra_info_struct *extra_info;
> +
> +struct ftlcache
> +{
> +
> +       uint8_t cache_state;
> +       unsigned long cache_offset;
> +       unsigned long sect_idx;
> +       unsigned long page_idx;
> +       uint32_t logic_page;
> +       long unsigned int written_mask;
> +
> +
> +       atomic_t writes_in_progress ;
> +       atomic_t flush_in_progress;
> +       atomic_t wait_to_flush;
> +       unsigned long last_touch;
> +
> +}__attribute__((packed));
> +
> +
> +
> +struct cur_wr_info{
> +       uint32_t first_blk;
> +       uint32_t last_blk;
> +       uint32_t last_gc_blk;
> +       uint32_t blk;
> +       uint8_t state;
> +       uint8_t last_wrpage;
> +       int centroid;
> +};
> +
> +struct scan_thrd_info
> +{
> +       struct lftlblk_dev *mtdblk;
> +       int bank;
> +};
> +
> +
> +struct rw_semaphore map_tabl_lock;
> +
> +static uint64_t *map_table;
> +
> +static uint64_t *reverse_map_tab;
> +static uint64_t *scanseqnumber;
> +
> +uint64_t buf_lookup_tab[MAX_FTL_CACHEBUFS];
> +
> +
> +
> +static struct kmem_cache *qnode_cache;
> +
> +static struct lfq_queue_rcu empty_bufsq;
> +static struct lfq_queue_rcu full_bufsq;
> +
> +static struct lfq_queue_rcu spare_bufQ;
> +
> +static struct lfq_queue_rcu spare_oobbufQ;
> +
> +
> +void *spare_cache_list_ptr[2*MAX_FTL_CACHEBUFS];
> +void *spare_oobbuf_list_ptr[2*MAX_FTL_CACHEBUFS];
> +
> +
> +int scheduled_for_gc[GC_NUM_TOBE_SCHEDULED];
> +
> +
> +
> +
> +
> +struct per_bank_info
> +{
> +       atomic_t perbank_nfree_blks;
> +       atomic_t perbank_ndirty_pages;
> +};
> +
> +struct per_blk_info
> +{
> +
> +       atomic_t num_valid_pages;
> +       DECLARE_BITMAP(valid_pages_map, MAX_PAGES_PER_BLK );
> +};
> +
> +
> +struct oob_data
> +{
> +       char blk_type;  /*  Status of the block: data pages/map pages/unused */
> +       uint32_t logic_page_num;
> +       int32_t seq_number;     /* The sequence number of this block */
> +
> +}__attribute__((packed));
> +
> +
> +
> +
> +struct per_blk_info *blk_info;
> +
> +struct per_bank_info bank_info[MAX_NUM_PLL_BANKS];
> +
> +
> +
> +struct bank_activity_matrix
> +{
> +       atomic_t  num_reads[MAX_NUM_PLL_BANKS];
> +       atomic_t  num_writes[MAX_NUM_PLL_BANKS];
> +       atomic_t  gc_goingon[MAX_NUM_PLL_BANKS];
> +       atomic_t  num_reads_pref[MAX_NUM_PLL_BANKS];
> +};
> +
> +
> +
> +
> +
> +
> +
> +static atomic_t activenumgcthread;
> +
> +
> +
> + struct lftlblk_dev;
> +
> + struct gcthread_arg_data
> + {
> +        int thrdnum;
> +        struct lftlblk_dev *mtdblk_ptr;
> + };
> +
> + struct lftlblk_dev {
> +        struct lftl_blktrans_dev mbd;
> +        int count;
> +        unsigned int cache_size;
> +        atomic_t freeblk_count;
> +        uint32_t num_blks;
> +        uint32_t num_cur_wr_blks;
> +
> +        unsigned long *free_blk_map;
> +
> +        uint64_t ckptrd_mask;
> +
> +        uint32_t blksize;
> +        uint8_t blkshift;
> +        uint8_t pageshift;
> +        uint32_t num_parallel_banks;
> +        uint32_t blks_per_bank;
> +        uint32_t pages_per_blk;
> +        uint32_t num_total_pages;
> +
> +        struct cur_wr_info cur_writing[MAX_NUM_PLL_BANKS];
> +        struct rw_semaphore cur_wr_state[MAX_NUM_PLL_BANKS];
> +
> +
> +        struct rw_semaphore **free_map_lock;
> +
> +
> +
> +        struct mutex select_buf_lock;
> +
> +        uint8_t *exper_buf;
> +        uint8_t *FFbuf;
> +        int exper_buf_sect_idx;
> +        struct mutex exper_buf_lock;
> +        struct mutex flush_buf_lock;
> +        uint8_t *buf[MAX_FTL_CACHEBUFS];
> +        struct mutex buf_lock[MAX_FTL_CACHEBUFS];
> +        struct ftlcache cached_buf[MAX_FTL_CACHEBUFS];
> +
> +
> +        struct mutex  buf_lookup_tab_mutex;
> +        uint64_t cache_fullmask;
> +
> +        atomic_t cache_assign_count;
> +        atomic_t seq_num;
> +
> +
> +        struct bank_activity_matrix activity_matrix;
> +        struct task_struct *bufflushd;
> +        int gc_thresh[NUM_GC_LEVELS];
> +        struct task_struct *ftlgc_thrd[NUM_GC_THREAD];
> +        int reserved_blks_per_bank;
> +
> +        int first_ckpt_blk;
> +
> +
> +        int hwblks_per_bank;
> +        unsigned long last_wr_time;
> +
> +        unsigned long *gc_active_map;
> +
> +        int init_not_done;
> +        struct gcthread_arg_data gcthrd_arg[NUM_GC_THREAD];
> +
> + };
> +
> + static struct mutex mtdblks_lock;
> +
> +#define lftl_assert(expr) do {                                                \
> +         if (unlikely(!(expr))) {
>           \
> +                 printk(KERN_CRIT "lftl: assert failed in %s at %u
> (pid %d)\n", \
> +                        __func__, __LINE__, current->pid);
>           \
> +                 dump_stack();
>           \
> +         }
>           \
> + } while (0)
> +
> +extern struct mutex mtd_table_mutex;
> +extern struct mtd_info *__mtd_next_device(int i);
> +
> +#define mtd_for_each_device(mtd)                       \
> +       for ((mtd) = __mtd_next_device(0);              \
> +            (mtd) != NULL;                             \
> +            (mtd) = __mtd_next_device(mtd->index + 1))
> +
> +
> +static LIST_HEAD(blktrans_majors);
> +static DEFINE_MUTEX(blktrans_ref_mutex);
> +
> +
> +static struct kmem_cache *lftlbiolist_cachep;
> +static mempool_t *biolistpool;
> +static struct lfq_queue_rcu rcuqu[VIRGO_NUM_MAX_REQ_Q];
> +static uint32_t last_lpn[VIRGO_NUM_MAX_REQ_Q];
> +
> +struct bio_node {
> +       struct lfq_node_rcu list;
> +       struct rcu_head rcu;
> +       struct bio *bio;
> +};
> +
> +#ifdef MAP_TABLE_ONE_LOCK
> +       #define map_table_lock(pagenum)   {     down_read(&(map_tabl_lock)); }
> +       #define map_table_unlock(pagenum) {  up_read(&(map_tabl_lock)); }
> +#else
> +       #define map_table_lock(pagenum)   do{ while
> (test_and_set_bit((pagenum), maptab_bitmap) != 0){      \
> +                                                                               schedule();             \
> +                                                                               } \
> +                                       }while(0)
> +
> +       #define map_table_unlock(pagenum) do{   if
> (test_and_clear_bit((pagenum), maptab_bitmap) == 0) \
> +                                                                               { \
> +                                                                               printk(KERN_ERR "lftl: mapbitmap cleared wrong"); \
> +                                                                               BUG(); \
> +                                                                               }\
> +                                                                        }while(0)
> +#endif
> +
> +void lftl_blktrans_dev_release(struct kref *kref)
> +{
> +       struct lftl_blktrans_dev *dev =
> +                       container_of(kref, struct lftl_blktrans_dev, ref);
> +
> +       dev->disk->private_data = NULL;
> +       blk_cleanup_queue(dev->rq);
> +       put_disk(dev->disk);
> +       list_del(&dev->list);
> +       kfree(dev);
> +}
> +
> +static struct lftl_blktrans_dev *lftl_blktrans_dev_get(struct gendisk *disk)
> +{
> +       struct lftl_blktrans_dev *dev;
> +
> +       mutex_lock(&blktrans_ref_mutex);
> +       dev = disk->private_data;
> +
> +       if (!dev)
> +               goto unlock;
> +       kref_get(&dev->ref);
> +unlock:
> +       mutex_unlock(&blktrans_ref_mutex);
> +       return dev;
> +}
> +
> +void lftl_blktrans_dev_put(struct lftl_blktrans_dev *dev)
> +{
> +       mutex_lock(&blktrans_ref_mutex);
> +       kref_put(&dev->ref, lftl_blktrans_dev_release);
> +       mutex_unlock(&blktrans_ref_mutex);
> +}
> +
> +
> +
> +
> +
> +
> +
> +void init_device_queues(struct lftl_blktrans_dev *dev)
> +{
> +
> +       int i;
> +
> +
> +       lftlbiolist_cachep = kmem_cache_create("mybioQ",
> +                                            sizeof(struct lftl_bio_list), 0, SLAB_PANIC, NULL);
> +
> +       biolistpool = mempool_create(BLKDEV_MIN_RQ, mempool_alloc_slab,
> +                                    mempool_free_slab, lftlbiolist_cachep);
> +       for(i = 0;i < VIRGO_NUM_MAX_REQ_Q;i++)
> +               INIT_LIST_HEAD(&dev->qu[i].qelem_ptr);
> +
> +
> +
> +
> +
> +       for(i = 0;i < VIRGO_NUM_MAX_REQ_Q;i++)
> +               lfq_init_rcu(&rcuqu[i], call_rcu);
> +
> +       for(i = 0;i < VIRGO_NUM_MAX_REQ_Q;i++)
> +               spin_lock_init(&dev->mybioq_lock[i]);
> +}
> +
> +void deinit_device_queues(struct lftl_blktrans_dev *dev)
> +{
> +       mempool_destroy(biolistpool);
> +
> +       kmem_cache_destroy(lftlbiolist_cachep);
> +
> +}
> +
> +
> +static int lftl_make_request(struct request_queue *rq, struct bio *bio)
> +{
> +
> +       struct lftl_blktrans_dev *dev;
> +       int qnum;
> +       gfp_t gfp_mask;
> +       struct lftl_bio_list *tmp;
> +       unsigned long temp_rand;
> +
> +       int i;
> +       int found;
> +
> +
> +       uint32_t lpn;
> +
> +
> +       dev = rq->queuedata;
> +
> +       if (dev == NULL)
> +               goto fail;
> +       if(bio_data_dir(bio) == WRITE)
> +       {

This is not the correct coding style.
Please read Documentation/CodingStyle (and perhaps
Documentation/SubmittingPatches)

Also, it seems to me you haven't passed this code through
./scripts/checkpatch.pl.
Regularly, every patch sent should have no errors or warnings reported
by ./scripts/checkpatch.pl.

Hope this helps,

    Ezequiel
