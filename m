Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TZRgY-0000uI-3O
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 19:34:51 +0000
Received: by mail-ie0-f177.google.com with SMTP id e14so4053684iej.36
 for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2012 11:34:40 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 17 Nov 2012 01:04:39 +0530
Message-ID: <CAMjNe_cJG6wkiPDvVZzqURz4gVTW8Dx4JrM-KPVbVedLwsDfcw@mail.gmail.com>
Subject: [RFC] LFTL: a FTL for large parallel IO flash cards
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

 Due to fundamental limits like size-per-chip and interface speed
 limits all  large capacity Flash  are made of multiple chips or banks.
 The presence of multiple chips readily offers parallel read or write support.
 Unlike an SSD, for a raw flash card , this parallelism is visible to
 the software layer and there are many opportunities
 for exploiting this parallelism.

 The presented LFTL is meant for flash cards with multiple banks and
 larger minimum write sizes.
 LFTL mostly reuses code from mtd_blkdevs.c and mtdblock.c.
 The LFTL was tested on  a 512GB raw flash card which has no firmware
 for wearlevelling or garbage collection.

 The following are the important points regarding the LFTL:

 1. multiqueued/multithreaded design:(Thanks  to Joern engel for a
 mail-discussion)
 The mtd_blkdevs.c dequeues block I/O requests from the block layer
 provided request queue from a single kthread.
 This design of IO requests dequeued from a single queue by a single
 thread is a bottleneck for flash cards that supports hundreds of MB/sec.
 We use a multiqueued and multithreaded design.
 We bypass the block layer by registering a new make_request and
 the LFTL maintains several queues of its own and the block IO requests are
 put in one of these queues. For every queue there is an associated kthread
 that processes requests from that queue. The number of "FTL IO kthreads"
 is #defined as 64 currently.

 2. Block allocation and Garbage collection:
 The block allocation algorithm allocates blocks across the banks and
 so the multiple FTL IO kthreads can write to different banks
 simultaneously. With this design we were able to get upto 300MB/sec(
 although some more bandwidth is possible from the device)
 Further the block allocation tries to  exclude any bank that is being
 garbage collected and tries to allocate the block on bank that is
 idle.  Similar to IO, the garbage collection is performed from several
 co-running threads. The garbage collection is started on a bank where
 there is no I/O happening.  By scheduling the writes and garbage collection
 on the different banks,  we can considerably avoid garbage collection latency
 in the write path.


 3. Buffering within FTL :
 The LFTL exposes a block size of 4K. The flash card that we used has
 a minimum writesize of 32K. So we use several caching buffers inside
 the FTL to accumulate the 4Ks to a single 32K and then flush to the flash.
 The number of caching buffers is #defined as 256  but they can be
 tunable. The per-buffer size is set to page size of 32K.
 First the write requests are absorbed in these multiple FTL
 cache-buffers before they are flushed to flash device.
 We also flush the buffers  that are not modified for a considerable
 amount of time from a separate background thread.

 4. Adaptive garbage collection:
  The amount of garbage collection that is happening at a particular
 instant is controlled by the number of active garbage collecting threads.
 The number of active garbage collecting threads is varied according to the
 current I/O load on the device. The current IO load level is inferred from
 the number of active FTL IO kthreads.  During idle times(number of active FTL
 IO kthreads = 0), the number of active garbage collecting threads is
 increased to maximum. When all FTL IO threads are active, we reduce
 the number of active garbage collecting threads to atmost one


 5. Checkpointing:
 Similar to Yaffs2, LFTL during module unload checkpoints the important
 data structures and during reload they are used to reconstruct the FTL
 datastructures.  The initial device scan is also parallelised and searching for
 checkpoint block during module load also happens from multiple
 kthreads.  The checkpoint information is stored in a chained fashion with one
 checkpoint block pointing to the next. The first checkpoint block is
 guaranteed to be in the first or last few blocks of any bank.
 So the parallel running threads only need to find the first checkpoint block
 and we  subsequently follow the linked chain.


 With LFTL we were able to get upto 300MB/sec for sequential workload.
 The device actually can support more than 300MB/sec and the LFTL still
 needs improvement (and more testing).

 Despite the code being far from perfect, i am  sending the patch to
 get some initial feedback comments.
 Thanks in advance for your inputs for improving the FTL.
 -mugunthan

 Signed-off-by: srimugunthan <srimugunthan.dhandapani@gmail.com>
---

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 4be8373..c68b5d2 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -237,6 +237,15 @@ config NFTL
 	  hardware, although under the terms of the GPL you're obviously
 	  permitted to copy, modify and distribute the code as you wish. Just
 	  not use it.
+	
+config LFTL
+	tristate "LFTL (FTL for parallel IO flash card) support"
+
+	---help---
+	  This provides support for the NAND Flash Translation Layer which is
+	  meant for large capacity Raw flash cards with parallel I/O
+	  capability
+

 config NFTL_RW
 	bool "Write support for NFTL"
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 39664c4..8d36339 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_MTD_BLOCK)		+= mtdblock.o
 obj-$(CONFIG_MTD_BLOCK_RO)	+= mtdblock_ro.o
 obj-$(CONFIG_FTL)		+= ftl.o
 obj-$(CONFIG_NFTL)		+= nftl.o
+obj-$(CONFIG_LFTL)		+= lftl.o
 obj-$(CONFIG_INFTL)		+= inftl.o
 obj-$(CONFIG_RFD_FTL)		+= rfd_ftl.o
 obj-$(CONFIG_SSFDC)		+= ssfdc.o
diff --git a/drivers/mtd/lftl.c b/drivers/mtd/lftl.c
new file mode 100644
index 0000000..7f446e0
--- /dev/null
+++ b/drivers/mtd/lftl.c
@@ -0,0 +1,6417 @@
+/*
+ * lftl: A FTL for Multibanked flash cards with parallel I/O capability
+ *
+ *
+ * this file heavily reuses code from  linux-mtd layer
+ * Modified over  the files
+ * 	1. mtdblock.c (authors:  David Woodhouse <dwmw2@infradead.org>
and Nicolas Pitre <nico@fluxnic.net>)
+ * 	2. mtd_blkdevs.c(authors: David Woodhouse <dwmw2@infradead.org>)
+ * code reuse from from urcu library for  lock-free queue (author:
Mathieu Desnoyers <mathieu.desnoyers@efficios.com>)
+ * author of this file: Srimugunthan Dhandapani
<srimugunthan.dhandapani@gmail.com>
+ *
+ * follows the same licensing of mtdblock.c and mtd_blkdevs.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/list.h>
+#include <linux/fs.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/blkdev.h>
+#include <linux/blkpg.h>
+#include <linux/spinlock.h>
+#include <linux/hdreg.h>
+#include <linux/init.h>
+#include <linux/mutex.h>
+#include <linux/kthread.h>
+#include <asm/uaccess.h>
+#include <linux/random.h>
+#include <linux/kthread.h>
+#include "lftl.h"
+
+
+
+
+
+
+
+
+
+#define INVALID_VALUE (-1)
+
+#define MAX_FTL_CACHEBUFS 256
+
+#define STATE_EMPTY 0
+#define STATE_DIRTY 1
+#define STATE_FULL 2
+#define STATE_CLEAN 3
+
+#define GC_THRESH 100000
+#define INVALID -1
+#define RAND_SEL -2
+
+#define ACCEPTABLE_THRESH 256
+
+#define INVALID_PAGE_NUMBER (0xFFFFFFFF)
+
+
+#define INVALID_CACHE_NUM 0x7F
+#define INVALID_SECT_NUM 0xFFFFFF
+
+#define NO_BUF_FOR_USE -1
+#define NUM_FREE_BUFS_THRESH 5
+
+
+
+#define BLK_BITMAP_SIZE 4096
+
+
+#define GC_NUM_TOBE_SCHEDULED 2
+
+#define DATA_BLK 1
+#define MAP_BLK 2
+#define FREE_BLK 0xFFFFFFFF
+#define NUM_GC_LEVELS 3
+#define GC_LEVEL0 0
+#define GC_LEVEL1 1
+#define GC_LEVEL2 2
+
+#define GC_OP 0
+#define WR_OP 1
+#define PFTCH_OP 2
+#define RD_OP 3
+
+
+#define INVALID_PAGE_NUMBER_32 0xFFFFFFFF
+
+#define NUM_GC_THREAD 8
+
+#define MAX_NUM_PLL_BANKS 64
+
+#define MAX_PAGES_PER_BLK 64
+
+#define CKPT_RANGE 10
+
+uint32_t numpllbanks = MAX_NUM_PLL_BANKS;
+
+module_param(numpllbanks, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+MODULE_PARM_DESC(numpllbanks, "Number of parallel bank units in the flash");
+
+uint32_t first_time = 0;
+module_param(first_time, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+MODULE_PARM_DESC(numpllbanks, "boolean value, if the module is loaded
firsttime");
+
+
+static atomic_t num_gcollected;
+static atomic_t gc_on_writes_collisions;
+static atomic_t num_gc_wakeups;
+
+static atomic_t num_l0_gcollected;
+static atomic_t num_l1_gcollected;
+static atomic_t num_l2_gcollected;
+static atomic_t num_erase_gcollected;
+static atomic_t num_cperase_gcollected;
+
+static atomic_t num_gc_threads;
+
+
+
+
+
+
+static unsigned long *page_bitmap;
+static unsigned long *page_incache_bitmap;
+static unsigned long *maptab_bitmap;
+static unsigned long *gc_map;
+static unsigned long *gc_bankbitmap;
+
+
+
+struct extra_info_struct
+{
+	uint64_t sequence_number;
+};
+
+struct extra_info_struct *extra_info;
+
+struct ftlcache
+{
+
+	uint8_t cache_state;
+	unsigned long cache_offset;
+	unsigned long sect_idx;
+	unsigned long page_idx;
+	uint32_t logic_page;
+	long unsigned int written_mask;
+
+
+	atomic_t writes_in_progress ;
+	atomic_t flush_in_progress;
+	atomic_t wait_to_flush;
+	unsigned long last_touch;
+
+}__attribute__((packed));
+
+
+
+struct cur_wr_info{
+	uint32_t first_blk;
+	uint32_t last_blk;
+	uint32_t last_gc_blk;
+	uint32_t blk;
+	uint8_t state;
+	uint8_t last_wrpage;
+	int centroid;
+};
+
+struct scan_thrd_info
+{
+	struct lftlblk_dev *mtdblk;
+	int bank;
+};
+
+
+struct rw_semaphore map_tabl_lock;
+
+static uint64_t *map_table;
+
+static uint64_t *reverse_map_tab;
+static uint64_t *scanseqnumber;
+
+uint64_t buf_lookup_tab[MAX_FTL_CACHEBUFS];
+
+
+
+static struct kmem_cache *qnode_cache;
+
+static struct lfq_queue_rcu empty_bufsq;
+static struct lfq_queue_rcu full_bufsq;
+
+static struct lfq_queue_rcu spare_bufQ;
+
+static struct lfq_queue_rcu spare_oobbufQ;
+
+
+void *spare_cache_list_ptr[2*MAX_FTL_CACHEBUFS];
+void *spare_oobbuf_list_ptr[2*MAX_FTL_CACHEBUFS];
+
+
+int scheduled_for_gc[GC_NUM_TOBE_SCHEDULED];
+
+
+
+
+
+struct per_bank_info
+{
+	atomic_t perbank_nfree_blks;
+	atomic_t perbank_ndirty_pages;
+};
+
+struct per_blk_info
+{
+
+	atomic_t num_valid_pages;
+	DECLARE_BITMAP(valid_pages_map, MAX_PAGES_PER_BLK );
+};
+
+
+struct oob_data
+{
+	char blk_type;	/*  Status of the block: data pages/map pages/unused */
+	uint32_t logic_page_num;
+	int32_t seq_number;	/* The sequence number of this block */
+
+}__attribute__((packed));
+
+
+
+
+struct per_blk_info *blk_info;
+
+struct per_bank_info bank_info[MAX_NUM_PLL_BANKS];
+
+
+
+struct bank_activity_matrix
+{
+	atomic_t  num_reads[MAX_NUM_PLL_BANKS];
+	atomic_t  num_writes[MAX_NUM_PLL_BANKS];
+	atomic_t  gc_goingon[MAX_NUM_PLL_BANKS];
+	atomic_t  num_reads_pref[MAX_NUM_PLL_BANKS];
+};
+
+
+
+
+
+
+
+static atomic_t activenumgcthread;
+
+
+
+ struct lftlblk_dev;
+
+ struct gcthread_arg_data
+ {
+	 int thrdnum;
+	 struct lftlblk_dev *mtdblk_ptr;
+ };
+
+ struct lftlblk_dev {
+	 struct lftl_blktrans_dev mbd;
+	 int count;
+	 unsigned int cache_size;
+	 atomic_t freeblk_count;
+	 uint32_t num_blks;
+	 uint32_t num_cur_wr_blks;
+
+	 unsigned long *free_blk_map;
+
+	 uint64_t ckptrd_mask;
+
+	 uint32_t blksize;
+	 uint8_t blkshift;
+	 uint8_t pageshift;
+	 uint32_t num_parallel_banks;
+	 uint32_t blks_per_bank;
+	 uint32_t pages_per_blk;
+	 uint32_t num_total_pages;
+
+	 struct cur_wr_info cur_writing[MAX_NUM_PLL_BANKS];
+	 struct rw_semaphore cur_wr_state[MAX_NUM_PLL_BANKS];
+
+
+	 struct rw_semaphore **free_map_lock;
+
+
+
+	 struct mutex select_buf_lock;
+
+	 uint8_t *exper_buf;
+	 uint8_t *FFbuf;
+	 int exper_buf_sect_idx;
+	 struct mutex exper_buf_lock;
+	 struct mutex flush_buf_lock;
+	 uint8_t *buf[MAX_FTL_CACHEBUFS];
+	 struct mutex buf_lock[MAX_FTL_CACHEBUFS];
+	 struct ftlcache cached_buf[MAX_FTL_CACHEBUFS];
+
+
+	 struct mutex  buf_lookup_tab_mutex;
+	 uint64_t cache_fullmask;
+
+	 atomic_t cache_assign_count;
+	 atomic_t seq_num;
+
+
+	 struct bank_activity_matrix activity_matrix;
+	 struct task_struct *bufflushd;
+	 int gc_thresh[NUM_GC_LEVELS];
+	 struct task_struct *ftlgc_thrd[NUM_GC_THREAD];
+	 int reserved_blks_per_bank;
+
+	 int first_ckpt_blk;
+
+
+	 int hwblks_per_bank;
+	 unsigned long last_wr_time;
+
+	 unsigned long *gc_active_map;
+
+	 int init_not_done;
+	 struct gcthread_arg_data gcthrd_arg[NUM_GC_THREAD];
+
+ };
+
+ static struct mutex mtdblks_lock;
+
+#define lftl_assert(expr) do {                                                \
+         if (unlikely(!(expr))) {
          \
+                 printk(KERN_CRIT "lftl: assert failed in %s at %u
(pid %d)\n", \
+                        __func__, __LINE__, current->pid);
          \
+                 dump_stack();
          \
+         }
          \
+ } while (0)
+
+extern struct mutex mtd_table_mutex;
+extern struct mtd_info *__mtd_next_device(int i);
+
+#define mtd_for_each_device(mtd)			\
+	for ((mtd) = __mtd_next_device(0);		\
+	     (mtd) != NULL;				\
+	     (mtd) = __mtd_next_device(mtd->index + 1))
+
+
+static LIST_HEAD(blktrans_majors);
+static DEFINE_MUTEX(blktrans_ref_mutex);
+
+
+static struct kmem_cache *lftlbiolist_cachep;
+static mempool_t *biolistpool;
+static struct lfq_queue_rcu rcuqu[VIRGO_NUM_MAX_REQ_Q];
+static uint32_t last_lpn[VIRGO_NUM_MAX_REQ_Q];
+
+struct bio_node {
+	struct lfq_node_rcu list;
+	struct rcu_head rcu;
+	struct bio *bio;
+};
+
+#ifdef MAP_TABLE_ONE_LOCK
+	#define map_table_lock(pagenum)   {	down_read(&(map_tabl_lock)); }
+	#define map_table_unlock(pagenum) {  up_read(&(map_tabl_lock)); }
+#else
+	#define map_table_lock(pagenum)   do{ while
(test_and_set_bit((pagenum), maptab_bitmap) != 0){ 	\
+										schedule(); 		\
+										} \
+					}while(0)
+
+	#define map_table_unlock(pagenum) do{ 	if
(test_and_clear_bit((pagenum), maptab_bitmap) == 0) \
+										{ \
+										printk(KERN_ERR "lftl: mapbitmap cleared wrong"); \
+										BUG(); \
+										}\
+									 }while(0)
+#endif
+
+void lftl_blktrans_dev_release(struct kref *kref)
+{
+	struct lftl_blktrans_dev *dev =
+			container_of(kref, struct lftl_blktrans_dev, ref);
+
+	dev->disk->private_data = NULL;
+	blk_cleanup_queue(dev->rq);
+	put_disk(dev->disk);
+	list_del(&dev->list);
+	kfree(dev);
+}
+
+static struct lftl_blktrans_dev *lftl_blktrans_dev_get(struct gendisk *disk)
+{
+	struct lftl_blktrans_dev *dev;
+
+	mutex_lock(&blktrans_ref_mutex);
+	dev = disk->private_data;
+
+	if (!dev)
+		goto unlock;
+	kref_get(&dev->ref);
+unlock:
+	mutex_unlock(&blktrans_ref_mutex);
+	return dev;
+}
+
+void lftl_blktrans_dev_put(struct lftl_blktrans_dev *dev)
+{
+	mutex_lock(&blktrans_ref_mutex);
+	kref_put(&dev->ref, lftl_blktrans_dev_release);
+	mutex_unlock(&blktrans_ref_mutex);
+}
+
+
+
+
+
+
+
+void init_device_queues(struct lftl_blktrans_dev *dev)
+{
+
+	int i;
+
+
+	lftlbiolist_cachep = kmem_cache_create("mybioQ",
+					     sizeof(struct lftl_bio_list), 0, SLAB_PANIC, NULL);
+
+	biolistpool = mempool_create(BLKDEV_MIN_RQ, mempool_alloc_slab,
+				     mempool_free_slab, lftlbiolist_cachep);
+	for(i = 0;i < VIRGO_NUM_MAX_REQ_Q;i++)
+		INIT_LIST_HEAD(&dev->qu[i].qelem_ptr);
+
+
+
+
+
+	for(i = 0;i < VIRGO_NUM_MAX_REQ_Q;i++)
+		lfq_init_rcu(&rcuqu[i], call_rcu);
+
+	for(i = 0;i < VIRGO_NUM_MAX_REQ_Q;i++)
+		spin_lock_init(&dev->mybioq_lock[i]);
+}
+
+void deinit_device_queues(struct lftl_blktrans_dev *dev)
+{
+	mempool_destroy(biolistpool);
+
+	kmem_cache_destroy(lftlbiolist_cachep);
+
+}
+
+
+static int lftl_make_request(struct request_queue *rq, struct bio *bio)
+{
+
+	struct lftl_blktrans_dev *dev;
+	int qnum;
+	gfp_t gfp_mask;
+	struct lftl_bio_list *tmp;
+	unsigned long temp_rand;
+
+	int i;
+	int found;
+
+
+	uint32_t lpn;
+
+
+	dev = rq->queuedata;
+
+	if (dev == NULL)
+		goto fail;
+	if(bio_data_dir(bio) == WRITE)
+	{
+		lpn = ((bio->bi_sector << 9) >> 15);
+		found = 0;
+		for(i = 0; i < VIRGO_NUM_MAX_REQ_Q;i++)
+		{
+			if(lpn == last_lpn[i])
+			{
+				qnum = i;
+				found = 1;
+			}
+		}
+
+		if(found == 0)
+		{
+			get_random_bytes(&temp_rand, sizeof(temp_rand));
+			qnum = temp_rand%VIRGO_NUM_MAX_REQ_Q;
+		}
+		last_lpn[qnum] = lpn;
+	}
+	else
+	{
+		get_random_bytes(&temp_rand, sizeof(temp_rand));
+		qnum = temp_rand%VIRGO_NUM_MAX_REQ_Q;
+	}
+
+
+
+
+	gfp_mask = GFP_ATOMIC | GFP_NOFS;
+	tmp= mempool_alloc(biolistpool, gfp_mask);
+	if (!tmp)
+	{
+		printk(KERN_ERR "lftl: mempool_alloc fail");
+		goto fail;
+	}
+	tmp->bio = bio;
+	spin_lock(&dev->mybioq_lock[qnum]);
+	list_add_tail(&(tmp->qelem_ptr), &(dev->qu[qnum].qelem_ptr));
+	spin_unlock(&dev->mybioq_lock[qnum]);
+
+	if(task_is_stopped(dev->thread[qnum]))
+		printk(KERN_INFO "lftl: thread %d sleeping...",qnum);
+
+	test_and_set_bit(qnum, dev->active_iokthread);
+
+
+	if(wake_up_process(dev->thread[qnum]) == 1)
+			DEBUG(MTD_DEBUG_LEVEL2, "ok\n");
+		;
+	return 0;
+fail:
+		printk(" lftl:   lftl_make_request fail");
+	return -1;
+}
+
+
+
+static int lftl_blktrans_thread(void *arg)
+{
+	struct bio_vec *bvec;
+	int sectors_xferred;
+	struct lftl_blktrans_dev *dev;
+
+	int res=0;
+	uint64_t block, nsect;
+	char *buf;
+	int sects_to_transfer;
+	struct list_head *list_hdp;
+	struct bio *bio;
+	int qnum = 0;
+	struct lftl_bio_list *tmp;
+	int i;
+	int printcount = 0;
+	int sleep_count = 0;
+
+	dev = ((struct thread_arg_data *)arg)->dev;
+	qnum = ((struct thread_arg_data *)arg)->qno;
+	printk(KERN_INFO "lftl: thread %d inited",qnum);
+
+	while (!kthread_should_stop()) {
+
+
+		/* no "lost wake-up" problem !! is the idiom usage correct?*/
+		set_current_state(TASK_INTERRUPTIBLE);
+		spin_lock(&dev->mybioq_lock[qnum]);
+		if(list_empty(&(dev->qu[qnum].qelem_ptr)))
+		{
+			
+
+
+			spin_unlock(&dev->mybioq_lock[qnum]);
+
+
+			/* wait in anticipation, before going to sleep*/
+			if(sleep_count < 100)
+			{
+				sleep_count++;
+				set_current_state(TASK_RUNNING);
+				schedule();
+			}
+			else
+			{
+
+				test_and_clear_bit(qnum, dev->active_iokthread);
+
+				schedule();
+				sleep_count = 0;
+			}
+
+			continue;
+
+		}
+		set_current_state(TASK_RUNNING);
+		spin_unlock(&dev->mybioq_lock[qnum]);
+
+
+
+
+
+		printcount = 0;
+
+		spin_lock(&dev->mybioq_lock[qnum]);
+		list_hdp = &(dev->qu[qnum].qelem_ptr);
+		tmp = list_first_entry(list_hdp, struct lftl_bio_list, qelem_ptr);
+
+		spin_unlock(&dev->mybioq_lock[qnum]);
+
+		bio = tmp->bio;
+		sectors_xferred = 0;
+
+
+
+
+		block = ((bio->bi_sector << 9) >> dev->tr->blkshift);
+	
+		bio_for_each_segment(bvec, bio, i) {
+
+			nsect = ((bvec->bv_len) >> dev->tr->blkshift);
+			sects_to_transfer = nsect;
+
+		
+			buf = page_address(bvec->bv_page) + bvec->bv_offset;
+
+	
+			switch(bio_data_dir(bio)) {
+				case READ:
+					for (; nsect > 0; nsect--, block++, buf += dev->tr->blksize){
+						if (dev->tr->readsect(dev, block, buf)){
+							res =  -EIO;
+							goto fail;
+						}
+					}
+		
+					break;
+				case WRITE:
+					if (!dev->tr->writesect){
+
+						res =  -EIO;
+						goto fail;
+					}
+
+				
+					for (; nsect > 0; nsect--, block++, buf += dev->tr->blksize){
+
+						if (dev->tr->writesect(dev, block, buf)){
+							res =  -EIO;
+							goto fail;
+
+						}
+
+					}
+
+					break;
+				default:
+					printk(KERN_NOTICE "lftl: Unknown request %lu\n", bio_data_dir(bio));
+					res =  -EIO;
+			}
+
+
+
+			sectors_xferred += (sects_to_transfer-nsect);
+
+
+		}
+
+		bio_endio(bio, res);
+		spin_lock(&dev->mybioq_lock[qnum]);
+		list_del(&(tmp->qelem_ptr));
+		spin_unlock(&dev->mybioq_lock[qnum]);
+		mempool_free(tmp,biolistpool);
+		continue;
+fail:
+		printk(KERN_ERR " lftl: bio fail in lftl_make_request");
+		bio_io_error(bio);
+		spin_lock(&dev->mybioq_lock[qnum]);
+		list_del(&(tmp->qelem_ptr));
+		spin_unlock(&dev->mybioq_lock[qnum]);
+		mempool_free(tmp,biolistpool);
+
+
+
+	}
+	return 0;
+
+
+}
+
+void free_bio_node(struct rcu_head *head)
+{
+	struct bio_node *node =
+			container_of(head, struct bio_node, rcu);
+
+	mempool_free(node,biolistpool);
+
+
+}
+
+
+
+static int lftl_blktrans_open(struct block_device *bdev, fmode_t mode)
+{
+	struct lftl_blktrans_dev *dev = lftl_blktrans_dev_get(bdev->bd_disk);
+	int ret = 0;
+
+	if (!dev)
+		return -ERESTARTSYS;
+
+	mutex_lock(&dev->lock);
+
+	if (dev->open++)
+		goto unlock;
+
+	kref_get(&dev->ref);
+	__module_get(dev->tr->owner);
+
+	if (dev->mtd) {
+		ret = dev->tr->open ? dev->tr->open(dev) : 0;
+		__get_mtd_device(dev->mtd);
+	}
+
+unlock:
+		mutex_unlock(&dev->lock);
+	lftl_blktrans_dev_put(dev);
+	return ret;
+}
+
+static int lftl_blktrans_release(struct gendisk *disk, fmode_t mode)
+{
+	struct lftl_blktrans_dev *dev = lftl_blktrans_dev_get(disk);
+	int ret = 0;
+
+	if (!dev)
+		return ret;
+
+	mutex_lock(&dev->lock);
+
+	if (--dev->open)
+		goto unlock;
+
+	kref_put(&dev->ref, lftl_blktrans_dev_release);
+	module_put(dev->tr->owner);
+
+	if (dev->mtd) {
+		ret = dev->tr->release ? dev->tr->release(dev) : 0;
+		__put_mtd_device(dev->mtd);
+	}
+unlock:
+		mutex_unlock(&dev->lock);
+	lftl_blktrans_dev_put(dev);
+	return ret;
+}
+
+static int lftl_blktrans_getgeo(struct block_device *bdev, struct
hd_geometry *geo)
+{
+	struct lftl_blktrans_dev *dev = lftl_blktrans_dev_get(bdev->bd_disk);
+	int ret = -ENXIO;
+
+	if (!dev)
+		return ret;
+
+	mutex_lock(&dev->lock);
+
+	if (!dev->mtd)
+		goto unlock;
+
+	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : 0;
+unlock:
+		mutex_unlock(&dev->lock);
+	lftl_blktrans_dev_put(dev);
+	return ret;
+}
+
+#define BANKINFOGET 0xFFFFFFFF
+#define BANKINFO_FWR 0xFFFFFFFD
+
+
+static int lftl_blktrans_ioctl(struct block_device *bdev, fmode_t mode,
+			  unsigned int cmd, unsigned long arg)
+{
+	struct lftl_blktrans_dev *dev = lftl_blktrans_dev_get(bdev->bd_disk);
+	int ret = -ENXIO;
+
+
+
+	if (!dev)
+		return ret;
+
+
+
+	mutex_lock(&dev->lock);
+
+	if (!dev->mtd)
+		goto unlock;
+
+	DEBUG(MTD_DEBUG_LEVEL1, "lflt: lftl_blktrans_ioctl cmd = %d arg =
%lu",cmd,arg);
+
+
+	switch (cmd) {
+
+		case BLKFLSBUF:
+			DEBUG(MTD_DEBUG_LEVEL1, "lftl: ioctl BLKFLSBUF");
+			ret = dev->tr->flush ? dev->tr->flush(dev) : 0;
+			break;
+		case BANKINFOGET:
+			DEBUG(MTD_DEBUG_LEVEL1, "lftl: ioctl BANKINFOGET");
+			dev->tr->get_blkinfo(dev);
+			break;
+
+		case BANKINFO_FWR:
+			DEBUG(MTD_DEBUG_LEVEL1, "lftl: ioctl BANKINFO_FWR");
+			dev->tr->bankinfo_filewr(dev);
+			break;
+
+		default:
+			DEBUG(MTD_DEBUG_LEVEL1, "lftl: ioctl default");
+			ret = -ENOTTY;
+	}
+unlock:
+		mutex_unlock(&dev->lock);
+ 	   lftl_blktrans_dev_put(dev);
+	return ret;
+}
+
+static const struct block_device_operations lftl_blktrans_ops = {
+	.owner		= THIS_MODULE,
+	.open		= lftl_blktrans_open,
+	.release	= lftl_blktrans_release,
+	.ioctl		= lftl_blktrans_ioctl,
+	.getgeo		= lftl_blktrans_getgeo,
+};
+
+
+
+int add_lftl_blktrans_dev(struct lftl_blktrans_dev *new)
+{
+	struct lftl_blktrans_ops *tr = new->tr;
+	struct lftl_blktrans_dev *d;
+	int last_devnum = -1;
+	struct gendisk *gd;
+	int ret;
+	int i;
+
+
+	if (mutex_trylock(&mtd_table_mutex)) {
+		mutex_unlock(&mtd_table_mutex);
+		BUG();
+	}
+
+	mutex_lock(&blktrans_ref_mutex);
+	list_for_each_entry(d, &tr->devs, list) {
+		if (new->devnum == -1) {
+			/* Use first free number */
+			if (d->devnum != last_devnum+1) {
+				/* Found a free devnum. Plug it in here */
+				new->devnum = last_devnum+1;
+				list_add_tail(&new->list, &d->list);
+				goto added;
+			}
+		} else if (d->devnum == new->devnum) {
+			/* Required number taken */
+			mutex_unlock(&blktrans_ref_mutex);
+			return -EBUSY;
+		} else if (d->devnum > new->devnum) {
+			/* Required number was free */
+			list_add_tail(&new->list, &d->list);
+			goto added;
+		}
+		last_devnum = d->devnum;
+	}
+
+	ret = -EBUSY;
+	if (new->devnum == -1)
+		new->devnum = last_devnum+1;
+
+	/* Check that the device and any partitions will get valid
+	* minor numbers and that the disk naming code below can cope
+	* with this number. */
+	if (new->devnum > (MINORMASK >> tr->part_bits) ||
+		   (tr->part_bits && new->devnum >= 27 * 26)) {
+		mutex_unlock(&blktrans_ref_mutex);
+		goto error1;
+		   }
+
+		   list_add_tail(&new->list, &tr->devs);
+ added:
+	mutex_unlock(&blktrans_ref_mutex);
+
+	mutex_init(&new->lock);
+	kref_init(&new->ref);
+	if (!tr->writesect)
+		new->readonly = 1;
+
+	/* Create gendisk */
+	ret = -ENOMEM;
+	gd = alloc_disk(1 << tr->part_bits);
+
+	if (!gd)
+		goto error2;
+
+	new->disk = gd;
+	gd->private_data = new;
+	gd->major = tr->major;
+	gd->first_minor = (new->devnum) << tr->part_bits;
+	gd->fops = &lftl_blktrans_ops;
+
+	if (tr->part_bits)
+		if (new->devnum < 26)
+			snprintf(gd->disk_name, sizeof(gd->disk_name),
+				"%s%c", tr->name, 'a' + new->devnum);
+	else
+		snprintf(gd->disk_name, sizeof(gd->disk_name),
+			"%s%c%c", tr->name,
+	'a' - 1 + new->devnum / 26,
+	'a' + new->devnum % 26);
+	else
+		snprintf(gd->disk_name, sizeof(gd->disk_name),
+			"%s%d", tr->name, new->devnum);
+
+	set_capacity(gd, (new->size * tr->blksize) >> 9);
+
+	/* Create the request queue */
+
+
+	new->rq = blk_alloc_queue(GFP_KERNEL);
+	blk_queue_make_request(new->rq, lftl_make_request);
+
+
+
+
+	init_device_queues(new);
+
+	if (!new->rq)
+		goto error3;
+
+	new->rq->queuedata = new;
+	blk_queue_logical_block_size(new->rq, tr->blksize);
+
+	if (tr->discard)
+		queue_flag_set_unlocked(QUEUE_FLAG_DISCARD,
+					new->rq);
+
+	gd->queue = new->rq;
+
+
+	/* Create processing threads */
+
+	for(i = 0; i < VIRGO_NUM_MAX_REQ_Q;i++)
+	{
+		new->thrd_arg[i].dev = new;
+		new->thrd_arg[i].qno = i;
+		new->thread[i] = kthread_run(lftl_blktrans_thread, &(new->thrd_arg[i]),
+					"%s%d_%d", tr->name, new->mtd->index,i);
+
+		if (IS_ERR(new->thread[i])) {
+			ret = PTR_ERR(new->thread[i]);
+			goto error4;
+		}
+	}
+
+	gd->driverfs_dev = &new->mtd->dev;
+
+	if (new->readonly)
+		set_disk_ro(gd, 1);
+
+	add_disk(gd);
+
+	if (new->disk_attributes) {
+		ret = sysfs_create_group(&disk_to_dev(gd)->kobj,
+					new->disk_attributes);
+		WARN_ON(ret);
+	}
+	return 0;
+	error4:
+		blk_cleanup_queue(new->rq);
+	error3:
+		put_disk(new->disk);
+	error2:
+		list_del(&new->list);
+	error1:
+		return ret;
+}
+
+
+
+
+int del_lftl_blktrans_dev(struct lftl_blktrans_dev *old)
+{
+
+	int i;
+
+	if (mutex_trylock(&mtd_table_mutex)) {
+		mutex_unlock(&mtd_table_mutex);
+		BUG();
+
+	}
+
+	deinit_device_queues(old);
+	if (old->disk_attributes)
+		sysfs_remove_group(&disk_to_dev(old->disk)->kobj,
+				    old->disk_attributes);
+
+	/* Stop new requests to arrive */
+	del_gendisk(old->disk);
+
+
+	/* Stop the thread */
+	for(i = 0;i < VIRGO_NUM_MAX_REQ_Q;i++)
+		kthread_stop(old->thread[i]);
+
+
+
+
+	/* If the device is currently open, tell trans driver to close it,
+	then put mtd device, and don't touch it again */
+	mutex_lock(&old->lock);
+	if (old->open) {
+		if (old->tr->release)
+			old->tr->release(old);
+		__put_mtd_device(old->mtd);
+	}
+
+	old->mtd = NULL;
+
+	mutex_unlock(&old->lock);
+	lftl_blktrans_dev_put(old);
+	return 0;
+}
+
+static void lftl_blktrans_notify_remove(struct mtd_info *mtd)
+{
+	struct lftl_blktrans_ops *tr;
+	struct lftl_blktrans_dev *dev, *next;
+
+	list_for_each_entry(tr, &blktrans_majors, list)
+			list_for_each_entry_safe(dev, next, &tr->devs, list)
+			if (dev->mtd == mtd)
+			tr->remove_dev(dev);
+}
+
+static void lftl_blktrans_notify_add(struct mtd_info *mtd)
+{
+	struct lftl_blktrans_ops *tr;
+
+	if (mtd->type == MTD_ABSENT)
+		return;
+
+	list_for_each_entry(tr, &blktrans_majors, list)
+			tr->add_mtd(tr, mtd);
+}
+
+static struct mtd_notifier lftl_blktrans_notifier = {
+	.add = lftl_blktrans_notify_add,
+	.remove = lftl_blktrans_notify_remove,
+};
+
+
+int register_lftl_blktrans(struct lftl_blktrans_ops *tr)
+{
+	struct mtd_info *mtd;
+	int ret;
+
+	/* Register the notifier if/when the first device type is
+	registered, to prevent the link/init ordering from fucking
+	us over. */
+	if (!lftl_blktrans_notifier.list.next)
+		register_mtd_user(&lftl_blktrans_notifier);
+
+
+	mutex_lock(&mtd_table_mutex);
+
+	ret = register_blkdev(tr->major, tr->name);
+	if (ret < 0) {
+		printk(KERN_WARNING "lftl: Unable to register %s block device on
major %d: %d\n",
+		       tr->name, tr->major, ret);
+		mutex_unlock(&mtd_table_mutex);
+		return ret;
+	}
+
+	DEBUG(MTD_DEBUG_LEVEL1, "lftl: register blkdev = %d",ret);
+	if (ret)
+		tr->major = ret;
+
+	tr->blkshift = ffs(tr->blksize) - 1;
+
+
+	INIT_LIST_HEAD(&tr->devs);
+	list_add(&tr->list, &blktrans_majors);
+
+	mtd_for_each_device(mtd)
+			if (mtd->type != MTD_ABSENT)
+			tr->add_mtd(tr, mtd);
+
+	mutex_unlock(&mtd_table_mutex);
+	return 0;
+}
+
+int deregister_lftl_blktrans(struct lftl_blktrans_ops *tr)
+{
+	struct lftl_blktrans_dev *dev, *next;
+
+	mutex_lock(&mtd_table_mutex);
+
+	/* Remove it from the list of active majors */
+	list_del(&tr->list);
+
+	list_for_each_entry_safe(dev, next, &tr->devs, list)
+			tr->remove_dev(dev);
+
+	unregister_blkdev(tr->major, tr->name);
+	mutex_unlock(&mtd_table_mutex);
+
+	BUG_ON(!list_empty(&tr->devs));
+	return 0;
+}
+
+
+void lftl_blktrans_exit(void)
+{
+	/* No race here -- if someone's currently in register_mtd_blktrans
+	we're screwed anyway. */
+	if (lftl_blktrans_notifier.list.next)
+		unregister_mtd_user(&lftl_blktrans_notifier);
+}
+
+/*
+ * lock free queue implementation from urcu library
+ */
+
+
+/******************************************************************************************/
+/* begins  Mathieu desonoyer's RCU based lock free queue from urcu library */
+/******************************************************************************************/
+
+ struct lfq_node_rcu *make_dummy(struct lfq_queue_rcu *q,
+				 struct lfq_node_rcu *next)
+{
+	struct lfq_node_rcu_dummy *dummy;
+
+	dummy = kmalloc(sizeof(struct lfq_node_rcu_dummy),GFP_KERNEL);
+	if(dummy == NULL)
+	{
+		printk(KERN_ERR "lftl: lfq_node_rcu: kmalloc fail");
+		BUG();
+	}
+	dummy->parent.next = next;
+	dummy->parent.dummy = 1;
+	dummy->q = q;
+	return &dummy->parent;
+}
+
+ void free_dummy_cb(struct rcu_head *head)
+{
+	struct lfq_node_rcu_dummy *dummy =
+			container_of(head, struct lfq_node_rcu_dummy, head);
+	kfree(dummy);
+}
+
+ void rcu_free_dummy(struct lfq_node_rcu *node)
+{
+	struct lfq_node_rcu_dummy *dummy;
+
+	if(node->dummy == NULL)
+	{
+		printk(KERN_ERR "lftl: rcu_free_dummy : asking to free a NULL ptr");
+		BUG();
+	}
+	dummy = container_of(node, struct lfq_node_rcu_dummy, parent);
+	dummy->q->queue_call_rcu(&dummy->head, free_dummy_cb);
+}
+
+void free_dummy(struct lfq_node_rcu *node)
+{
+	struct lfq_node_rcu_dummy *dummy;
+
+	if(node->dummy == NULL)
+	{
+		printk(KERN_ERR "lftl: free_dummy : asking to free a NULL ptr");
+		BUG();
+	}
+	dummy = container_of(node, struct lfq_node_rcu_dummy, parent);
+	kfree(dummy);
+}
+
+ void lfq_node_init_rcu(struct lfq_node_rcu *node)
+{
+	node->next = NULL;
+	node->dummy = 0;
+}
+
+ void lfq_init_rcu(struct lfq_queue_rcu *q,
+		   void queue_call_rcu(struct rcu_head *head,
+				       void (*func)(struct rcu_head *head)))
+{
+	q->tail = make_dummy(q, NULL);
+	q->head = q->tail;
+	q->queue_call_rcu = queue_call_rcu;
+}
+
+/*
+ * The queue should be emptied before calling destroy.
+ *
+ * Return 0 on success, -EPERM if queue is not empty.
+ */
+int lfq_destroy_rcu(struct lfq_queue_rcu *q)
+{
+	struct lfq_node_rcu *head;
+
+	head = rcu_dereference(q->head);
+	if (!(head->dummy && head->next == NULL))
+		return -EPERM;	/* not empty */
+	free_dummy(head);
+	return 0;
+}
+
+
+
+/*
+ * Should be called under rcu read lock critical section.
+ */
+void lockfree_enqueue(struct lfq_queue_rcu *q,
+		      struct lfq_node_rcu *node)
+{
+	/*
+	* uatomic_cmpxchg() implicit memory barrier orders earlier stores to
+	* node before publication.
+	*/
+
+	for (;;) {
+		struct lfq_node_rcu *tail, *next;
+
+		tail = rcu_dereference(q->tail);
+		/*
+		 * R = cmpxchg(A,C,B) : return value R is equal to C then exchange is done.
+		 */
+		next = cmpxchg(&tail->next, NULL, node);
+		if (next == NULL) {
+			/*
+			* Tail was at the end of queue, we successfully
+			* appended to it. Now move tail (another
+			* enqueue might beat us to it, that's fine).
+			*/
+			(void)cmpxchg(&q->tail, tail, node);
+			return;
+		} else {
+			/*
+			* Failure to append to current tail.
+			* Help moving tail further and retry.
+			*/
+			(void)cmpxchg(&q->tail, tail, next);
+			continue;
+		}
+	}
+}
+
+void enqueue_dummy(struct lfq_queue_rcu *q)
+{
+	struct lfq_node_rcu *node;
+
+	/* We need to reallocate to protect from ABA. */
+	node = make_dummy(q, NULL);
+	lockfree_enqueue(q, node);
+}
+
+/*
+ * Should be called under rcu read lock critical section.
+ *
+ * The caller must wait for a grace period to pass before freeing the returned
+ * node or modifying the lfq_node_rcu structure.
+ * Returns NULL if queue is empty.
+ */
+ struct lfq_node_rcu *lockfree_dequeue(struct lfq_queue_rcu *q)
+{
+	for (;;) {
+		struct lfq_node_rcu *head, *next;
+
+		head = rcu_dereference(q->head);
+		next = rcu_dereference(head->next);
+		if (head->dummy && next == NULL)
+			return NULL;	/* empty */
+		/*
+		* We never, ever allow dequeue to get to a state where
+		* the queue is empty (we need at least one node in the
+		* queue). This is ensured by checking if the head next
+		* is NULL, which means we need to enqueue a dummy node
+		* before we can hope dequeuing anything.
+		*/
+		if (!next) {
+			enqueue_dummy(q);
+			next = rcu_dereference(head->next);
+		}
+		if (cmpxchg(&q->head, head, next) != head)
+			continue;	/* Concurrently pushed. */
+		if (head->dummy) {
+			/* Free dummy after grace period. */
+			rcu_free_dummy(head);
+			continue;	/* try again */
+		}
+		return head;
+	}
+}
+
+
+
+ void free_cache_num_node(struct rcu_head *head)
+ {
+	 struct cache_num_node *node =
+			 container_of(head, struct cache_num_node, rcu);
+
+	 kmem_cache_free(qnode_cache, node);
+ }
+
+/******************************************************************************************/
+/********************************End of urcu Lock free Queue
*********************/
+
+/******************************************************************************************/
+
+ static int erase_blk(struct lftlblk_dev *mtdblk,uint64_t blk)
+{
+	struct erase_info erase;
+
+
+
+	wait_queue_head_t wait_q;
+
+	int ret;
+	struct mtd_info *mtd;
+	uint64_t pos;
+
+	pos = (blk * mtdblk->pages_per_blk)<<mtdblk->pageshift;
+	mtd = mtdblk->mbd.mtd;
+
+	DEBUG(MTD_DEBUG_LEVEL1, "lftl: synch er %lld",pos);
+
+
+	init_waitqueue_head(&wait_q);
+	erase.mtd = mtd;
+	erase.callback = NULL;
+	erase.addr = pos;
+	erase.len = mtd->erasesize;
+	erase.priv = (u_long)&wait_q;
+
+
+
+
+	ret = mtd->erase(mtd, &erase);
+
+	while (1)
+	{
+
+		if (erase.state == MTD_ERASE_DONE ||  erase.state == MTD_ERASE_FAILED)
+			break;
+		schedule();
+
+	}
+
+	if (erase.state == MTD_ERASE_DONE)
+	{
+
+		return 0;
+	}
+	else if(erase.state == MTD_ERASE_FAILED)
+	{
+
+		DEBUG(MTD_DEBUG_LEVEL1,  "lftl: myftl:erase failed %lld",blk);
+		BUG();
+
+	}
+	else
+	{
+		DEBUG(MTD_DEBUG_LEVEL1,  "lftl: myftl:erase state %d unk
%lld",erase.state,blk);
+		BUG();
+	}
+
+
+}
+
+
+/* free blks bit map functions */
+
+int blk_isfree(struct lftlblk_dev *mtdblk, uint32_t blkno)
+{
+
+	int bank_num = blkno/mtdblk->hwblks_per_bank;
+
+	down_read((mtdblk->free_map_lock[bank_num]));
+	if(!(test_bit(blkno,mtdblk->free_blk_map)))
+	{
+		up_read((mtdblk->free_map_lock[bank_num]));
+		return 1;
+	}
+	up_read((mtdblk->free_map_lock[bank_num]));
+	
+	return 0;
+}
+
+
+int blk_unfree(struct lftlblk_dev *mtdblk,uint32_t blkno)
+{
+
+	int bank_num = blkno/mtdblk->hwblks_per_bank;
+
+
+	down_write((mtdblk->free_map_lock[bank_num]));
+	set_bit(blkno, mtdblk->free_blk_map);
+
+
+	atomic_dec(&mtdblk->freeblk_count);
+	up_write((mtdblk->free_map_lock[bank_num]));
+
+
+	return 0;
+}
+
+static int is_block_bad(struct lftlblk_dev *mtdblk,int ebnum)
+{
+	struct mtd_info *mtd = mtdblk->mbd.mtd;
+	uint64_t  addr = ((uint64_t)ebnum) * mtd->erasesize;
+	int ret;
+
+	ret = mtdblk->mbd.mtd->block_isbad(mtd, addr);
+
+	return ret;
+}
+
+
+int blk_free(struct lftlblk_dev *mtdblk,uint32_t blkno)
+{
+
+
+	int bank_num = blkno/mtdblk->hwblks_per_bank;
+
+	down_write((mtdblk->free_map_lock[bank_num]));
+	clear_bit(blkno, mtdblk->free_blk_map);
+
+	atomic_inc(&mtdblk->freeblk_count);
+
+	up_write((mtdblk->free_map_lock[bank_num]));
+	return 0;
+}
+
+
+
+
+static int lftlblock_readsect(struct lftl_blktrans_dev *dev,
+			     unsigned long logic_ftl_blk, char *buf)
+{
+	struct lftlblk_dev *mtdblk = container_of(dev, struct lftlblk_dev, mbd);
+	struct mtd_info *mtd = mtdblk->mbd.mtd;
+
+	uint8_t *rd_buf;
+
+
+	uint32_t logic_page_num;
+	uint32_t offs;
+	uint32_t len;
+	uint64_t mask;
+	uint32_t sect_idx;
+	
+	/* needed 64bit as we do some shifting*/
+	uint64_t phy_page_offs;
+	uint32_t shift_val;
+	int i;
+	uint32_t cache_buf,found_cache_buf;
+	int found = 0;
+	int j;
+	size_t retlen;
+
+	static int num_read = 0;
+
+	uint32_t num_pages_perbank;
+	uint32_t bankno;
+
+
+	num_read++;
+	num_pages_perbank  =  mtdblk->hwblks_per_bank*mtdblk->pages_per_blk;
+
+	logic_page_num = (logic_ftl_blk<<mtdblk->blkshift)>>mtdblk->pageshift;
+	bankno = map_table[logic_page_num]/num_pages_perbank;
+
+	shift_val = mtdblk->pageshift -mtdblk->blkshift;
+	mask = ~(-1UL<<shift_val);
+	sect_idx = logic_ftl_blk&mask;
+
+buf_lookup_search:
+
+	found = 0;
+	for(i = 0; i < MAX_FTL_CACHEBUFS;i++)
+	{
+		if(buf_lookup_tab[i] == logic_page_num)
+		{
+			if(found == 1)
+			{
+
+
+				printk(KERN_ERR "lftl: R twice in buflookup %u ",logic_page_num);
+
+
+				for(j = 0; j < MAX_FTL_CACHEBUFS ;j++)
+				{
+					printk("%lld ",buf_lookup_tab[j]);
+				}
+				BUG();
+			}
+			found = 1;
+			found_cache_buf = i;
+			break;
+		}
+	}
+	
+	if(found == 1)
+	{
+		cache_buf = found_cache_buf;
+
+		mutex_lock(&(mtdblk->buf_lock[cache_buf]));
+
+		if(buf_lookup_tab[cache_buf] != logic_page_num)
+		{
+			mutex_unlock(&(mtdblk->buf_lock[cache_buf]));
+			goto buf_lookup_search;
+		}
+		mask = ((1UL)<<sect_idx);
+
+		if(((mtdblk->cached_buf[cache_buf].written_mask) & (mask)) == mask)
+		{
+			DEBUG(MTD_DEBUG_LEVEL1,  "lftl: mask is correct %d",cache_buf);
+			memcpy(buf,mtdblk->buf[cache_buf]+sect_idx*mtdblk->blksize,mtdblk->blksize);
+			mutex_unlock(&(mtdblk->buf_lock[cache_buf]));
+			return 0;
+		}
+		else
+		{
+
+			printk(KERN_WARNING "lftl: mask is incorrect %d",cache_buf);
+			mutex_unlock(&(mtdblk->buf_lock[cache_buf]));
+			goto not_inFTLbufs;
+		}
+	}
+
+
+
+not_inFTLbufs:
+
+	bankno = map_table[logic_page_num]/num_pages_perbank;
+	atomic_inc(&mtdblk->activity_matrix.num_reads[bankno]);
+
+	/*
+ 	 * not in the cache
+	 */
+
+	map_table_lock(logic_page_num);
+	phy_page_offs = map_table[logic_page_num];
+	map_table_unlock(logic_page_num);
+
+	
+	if(phy_page_offs < 0 || phy_page_offs > (mtdblk->pages_per_blk *
mtdblk->num_blks))
+	{
+		memcpy(mtdblk->FFbuf,rd_buf,mtdblk->blksize);
+		printk(KERN_ERR "lftl: wrong phy addr %llu lpn %u", phy_page_offs,
logic_page_num);
+		BUG();
+	}
+	else
+	{
+		retlen = 0;
+		mtd->read(mtd,((phy_page_offs<<mtdblk->pageshift) +
(sect_idx*mtdblk->blksize)),mtdblk->blksize, &retlen, buf);
+		if(retlen != mtdblk->blksize)
+		{
+			printk(KERN_ERR "lftl: FTL read failure");
+			printk(KERN_ERR " lftl: phypage = %lld secidx = %u",phy_page_offs,sect_idx);
+			printk(KERN_ERR "lftl: logpage = %u",logic_page_num);
+			BUG();
+		}
+		len = mtdblk->blksize;
+		offs = 0;
+		len -= mtdblk->blksize;
+		offs += mtdblk->blksize;
+	
+	}
+			
+	atomic_dec(&mtdblk->activity_matrix.num_reads[bankno]);
+	return 0;
+
+}
+
+
+
+static uint32_t lftl_alloc_block(struct lftlblk_dev *mtdblk, int cur_wr_index)
+{
+	uint32_t temp;
+	uint32_t search_from;
+
+	static unsigned long temp_rand =0;
+
+	if(cur_wr_index == RAND_SEL)
+	{
+
+		temp_rand++;
+		cur_wr_index = temp_rand%(mtdblk->num_cur_wr_blks);
+		temp_rand = cur_wr_index;
+	}
+
+
+
+	if(mtdblk->cur_writing[cur_wr_index].blk == -1)
+	{
+		search_from = mtdblk->cur_writing[cur_wr_index].first_blk;
+	}
+	else
+	{
+		search_from = mtdblk->cur_writing[cur_wr_index].blk;
+	}
+
+
+	temp=search_from+1;
+	if(temp > mtdblk->cur_writing[cur_wr_index].last_blk)
+	{
+		temp = mtdblk->cur_writing[cur_wr_index].first_blk;
+	}
+
+	for(;temp != search_from;)
+	{
+
+		if(blk_isfree(mtdblk,temp))
+		{
+			if(is_block_bad(mtdblk,temp))
+			{
+				goto continue_loop;
+			}
+			else
+			{
+				DEBUG(MTD_DEBUG_LEVEL1,  "lftl: [%d %d] searchfrom = %d temp = %d",
+									mtdblk->cur_writing[cur_wr_index].first_blk,
+									mtdblk->cur_writing[cur_wr_index].last_blk,search_from,temp);
+
+
+				blk_unfree(mtdblk,temp);
+				atomic_dec(&bank_info[cur_wr_index].perbank_nfree_blks);
+				return temp;
+			}
+		}
+		
+continue_loop:
+
+		temp = temp+1;
+		if(temp > mtdblk->cur_writing[cur_wr_index].last_blk)
+		{
+			temp = mtdblk->cur_writing[cur_wr_index].first_blk;
+		}
+
+
+	}
+	return INVALID;
+}
+
+
+
+
+
+static uint64_t get_ppage(struct lftlblk_dev *mtdblk, int
cur_wr_index,int from_gc_context)
+{
+
+	uint32_t ret_page_num;
+	uint32_t next_blk;
+	uint8_t tried;
+
+	static unsigned long temp_rand =0;
+	static uint32_t selected_bank=0;
+	uint32_t startbanknum;
+	uint32_t banknum;
+
+	uint32_t blkno,page_in_blk;
+
+	int selected;
+
+
+
+	if(cur_wr_index == RAND_SEL)
+	{
+		startbanknum = (selected_bank)%numpllbanks;
+		banknum=(startbanknum+1)%numpllbanks;
+
+		selected = 0;
+
+		for(;  banknum != startbanknum;)
+		{
+
+
+
+			if(mtdblk->activity_matrix.gc_goingon[banknum].counter == 0 )
+			{
+				if(scheduled_for_gc[0] != banknum)
+				{
+					
+					{
+						selected = 1;
+						break;
+					}
+				}
+			}
+
+			banknum = (banknum +1)%numpllbanks;
+
+		}
+		if(selected == 1)
+		{
+			selected_bank = banknum;
+
+		}
+		else
+		{
+			
+			get_random_bytes(&temp_rand, sizeof(temp_rand));
+			selected_bank = temp_rand%(numpllbanks);
+		}
+		cur_wr_index = selected_bank;
+
+	}
+
+	atomic_inc(&mtdblk->activity_matrix.num_writes[cur_wr_index]);
+
+	DEBUG(MTD_DEBUG_LEVEL2,"lftl: getppage: selected bank = %d",cur_wr_index);
+
+	down_write(&(mtdblk->cur_wr_state[cur_wr_index]));
+
+	if((mtdblk->cur_writing[cur_wr_index].state == STATE_CLEAN) ||
(mtdblk->cur_writing[cur_wr_index].last_wrpage
==(mtdblk->pages_per_blk-1)))
+	{
+		next_blk = INVALID;
+		tried = 0;
+
+
+		if(!from_gc_context)
+		{
+			if(bank_info[cur_wr_index].perbank_nfree_blks.counter -
mtdblk->reserved_blks_per_bank <= 0)
+			{
+				next_blk = INVALID;
+			}
+			else
+			{
+				tried++;
+				next_blk = lftl_alloc_block(mtdblk,cur_wr_index);
+			}
+		}
+		else
+		{
+			next_blk = lftl_alloc_block(mtdblk,cur_wr_index);
+
+		}
+
+
+
+		if(next_blk == INVALID)
+		{
+			up_write(&(mtdblk->cur_wr_state[cur_wr_index]));
+			atomic_dec(&mtdblk->activity_matrix.num_writes[cur_wr_index]);
+			return INVALID_PAGE_NUMBER_32;
+		}
+		mtdblk->cur_writing[cur_wr_index].blk = next_blk;
+		mtdblk->cur_writing[cur_wr_index].last_wrpage = 0;
+		mtdblk->cur_writing[cur_wr_index].state = STATE_DIRTY;
+
+		ret_page_num = mtdblk->cur_writing[cur_wr_index].blk*
mtdblk->pages_per_blk + mtdblk->cur_writing[cur_wr_index].last_wrpage;
+
+		up_write(&(mtdblk->cur_wr_state[cur_wr_index]));
+
+		blkno = mtdblk->cur_writing[cur_wr_index].blk;
+		page_in_blk = mtdblk->cur_writing[cur_wr_index].last_wrpage;
+
+		if(bank_info[cur_wr_index].perbank_nfree_blks.counter <
mtdblk->blks_per_bank/2)
+		{
+			/* if garbage collection is not happening
+			 * then it should be started
+			 */
+			
+			{
+				wake_up_process(mtdblk->ftlgc_thrd[0]);
+			}
+		}
+
+
+		DEBUG(MTD_DEBUG_LEVEL2,"lftl: %x: [%d]num_wr++ =
%d",current->pid,cur_wr_index,mtdblk->activity_matrix.num_writes[cur_wr_index].counter);
+		return ret_page_num;
+	}
+	else
+	{
+
+		mtdblk->cur_writing[cur_wr_index].last_wrpage++;
+
+
+		if(mtdblk->cur_writing[cur_wr_index].last_wrpage >= mtdblk->pages_per_blk)
+		{
+			printk(KERN_ERR "lftl: last_wr_page is wrong");
+			BUG();
+		}
+
+
+		ret_page_num = mtdblk->cur_writing[cur_wr_index].blk*
mtdblk->pages_per_blk + mtdblk->cur_writing[cur_wr_index].last_wrpage;
+
+		up_write(&(mtdblk->cur_wr_state[cur_wr_index]));
+
+		blkno = mtdblk->cur_writing[cur_wr_index].blk;
+		page_in_blk = mtdblk->cur_writing[cur_wr_index].last_wrpage;
+
+
+
+		if(bank_info[cur_wr_index].perbank_nfree_blks.counter <
mtdblk->blks_per_bank/2)
+		{
+
+			
+			/* if garbage collection is not happening
+			 * then it should be started
+			 */
+			wake_up_process(mtdblk->ftlgc_thrd[0]);
+
+			
+		}
+
+		DEBUG(MTD_DEBUG_LEVEL2,"lftl: %x: [%d]num_wr++ =
%d",current->pid,cur_wr_index,mtdblk->activity_matrix.num_writes[cur_wr_index].counter);
+		return ret_page_num;
+	}
+
+}
+
+
+
+#define ITERATIONS_PER_GC_CALL 10
+
+
+
+
+
+int do_gc(struct lftlblk_dev *mtdblk,int bank_num,int level)
+{
+	uint32_t start_blk,end_blk;
+	uint32_t min_vpages;
+	uint32_t min;
+	uint32_t i;
+	uint32_t found_fulld_blk;
+	uint32_t found = 0;
+	uint32_t victim_blk;
+	struct mtd_info *mtd;
+	int loop_count;
+	uint64_t mask;
+	struct mtd_oob_ops ops;
+	uint8_t *rd_buf,*oob_buf;
+	uint32_t old_lpn;
+	uint64_t new_phy_page,old_phy_page;
+	struct oob_data oobvalues,*oobdata;
+	uint32_t changed_ppn[MAX_PAGES_PER_BLK];
+	uint32_t corresp_lpn[MAX_PAGES_PER_BLK];
+	uint32_t n_valid_pages,n_dirty_pages;
+	uint32_t new_blkno;
+	uint64_t vpages_map;
+	int res;
+	uint32_t oldblkno,page_in_blk;
+	uint32_t iterations;
+	int count = 0;
+	start_blk = mtdblk->cur_writing[bank_num].first_blk;
+	end_blk = mtdblk->cur_writing[bank_num].last_blk;
+
+	DEBUG(MTD_DEBUG_LEVEL2,"lftl: do_gc L%d on bank %d enter",level,bank_num);
+
+	/* one thread does GC on a bank. and after one block is collected
return. search only for max ITERATIONS_PER_GC_CALL*/
+	if(test_and_set_bit(bank_num,gc_bankbitmap))
+	{
+		DEBUG(MTD_DEBUG_LEVEL2,"lftl: GC already on %d", bank_num);
+		return 0 ;
+	}
+
+	if(level == 0)
+	{
+		atomic_inc(&num_l0_gcollected);
+	}
+	else if(level == 1)
+	{
+		atomic_inc(&num_l1_gcollected);
+	}
+	else if(level == 2)
+	{
+		atomic_inc(&num_l2_gcollected);
+	}
+
+
+
+	/* victim gc block should not be
+	 * 1) a free block
+	 * 2) a cur writing block
+	 * 3) should not become a cur writing block when gc is started
+	 *  if the block is not free, then it wont become a cur writing
block after gc is started.
+	 *  so check only if it is <non-free and non curWriting>
+	 */
+	
+	min_vpages = mtdblk->gc_thresh[level];
+
+	min = start_blk;
+	found_fulld_blk = 0;
+	found = 0;
+
+	/* should the number of iterations
+	 * be based on number of
+	 * blocks per bank */
+	
+	iterations = ITERATIONS_PER_GC_CALL;
+	if(mtdblk->cur_writing[bank_num].last_gc_blk >
mtdblk->cur_writing[bank_num].last_blk)
+	{
+		start_blk =  mtdblk->cur_writing[bank_num].first_blk;
+
+	}
+	else
+	{
+		start_blk = mtdblk->cur_writing[bank_num].last_gc_blk;
+	}
+	for(i = start_blk,count=0 ;count < iterations;i++,count++)
+	{
+
+		if(i > mtdblk->cur_writing[bank_num].last_blk)
+		{
+			i = mtdblk->cur_writing[bank_num].first_blk;
+		}
+		/* skip the bad block for GC*/
+		if(is_block_bad(mtdblk,i))
+		{
+			continue;
+		}
+		if((!(blk_isfree(mtdblk,i))) && (mtdblk->cur_writing[bank_num].blk
!= i) && (!(test_and_set_bit(i,gc_map))))
+		{
+
+			if(blk_info[i].num_valid_pages.counter <= min_vpages)
+			{
+				if(blk_info[i].num_valid_pages.counter == 0)
+				{
+					victim_blk = i;
+					/* only erase required */
+
+
+					DEBUG(MTD_DEBUG_LEVEL1,"lftl: do_gc: bank %d erase
%d",current->pid,bank_num, victim_blk);
+
+					erase_blk(mtdblk,victim_blk);
+					blk_free(mtdblk,victim_blk);
+					atomic_set(&blk_info[victim_blk].num_valid_pages,0);
+
+					test_and_clear_bit(victim_blk,gc_map);
+
+					atomic_inc(&bank_info[bank_num].perbank_nfree_blks);
+					atomic_sub(mtdblk->pages_per_blk,
&bank_info[bank_num].perbank_ndirty_pages);
+
+					mtdblk->cur_writing[bank_num].last_gc_blk  = i;
+					test_and_clear_bit(bank_num,gc_bankbitmap);
+					atomic_inc(&num_gcollected);
+					atomic_inc(&num_erase_gcollected);
+
+					DEBUG(MTD_DEBUG_LEVEL1,"lftl: %x: do_gc L%d bank %d ret 1
",current->pid,level,bank_num);
+
+
+					return 1;
+				}
+				else
+				{
+					atomic_inc(&num_cperase_gcollected);
+					/* copy and erase */
+					victim_blk = i;
+
+					DEBUG(MTD_DEBUG_LEVEL1,"lftl: %x:do_gc L%d cp %d pages and er
blk %d",current->pid,level,(blk_info[victim_blk].num_valid_pages.counter),
victim_blk);
+				
+					mtd = mtdblk->mbd.mtd;
+
+					rd_buf = vmalloc(mtd->writesize);
+					if (!rd_buf)
+					{
+						printk(KERN_ERR "lftl: vmalloc fail");
+						BUG();
+
+					}
+					oob_buf = vmalloc(mtd->oobsize);
+					if (!oob_buf)
+					{
+						printk(KERN_ERR "lftl: vmalloc fail");
+						BUG();
+
+					}
+					mask = 1;
+					loop_count = 0;
+
+
+					bitmap_copy(&vpages_map,blk_info[victim_blk].valid_pages_map,64);
+					n_valid_pages = 0;
+					while(loop_count < mtdblk->pages_per_blk)
+					{
+
+						if(loop_count > 64)
+						{
+							printk(KERN_ERR "lftl: loopcnt = %d wrong",loop_count);
+							BUG();
+						}
+
+
+						/* vpages map is set at 1 on that bit */
+						if(((mask) & vpages_map) == mask)
+						{
+
+							old_phy_page = victim_blk*mtdblk->pages_per_blk + loop_count;
+
+							ops.mode = MTD_OOB_AUTO;
+							ops.datbuf = rd_buf;
+							ops.len = mtd->writesize;
+							ops.oobbuf = oob_buf;
+							ops.ooboffs = 0;
+							ops.ooblen = mtd->oobsize;
+
+
+
+							res = mtd->read_oob(mtd,old_phy_page<<mtdblk->pageshift, &ops);
+							if(ops.retlen < mtd->writesize)
+							{
+								printk(KERN_ERR "lftl:  read failure");
+								printk(KERN_ERR "lftl: phypage = %llu",old_phy_page);
+								BUG();
+							}
+							oobdata = &oobvalues;
+							memcpy(oobdata, oob_buf,sizeof(*oobdata));
+
+							old_lpn = oobdata->logic_page_num;
+
+							lftl_assert(!(old_lpn == INVALID_PAGE_NUMBER));
+
+							lftl_assert(!(old_lpn >= mtdblk->num_total_pages || old_lpn < 0));
+
+							new_phy_page = get_ppage(mtdblk,bank_num,1);
+
+							lftl_assert(!(new_phy_page == INVALID_PAGE_NUMBER));
+							lftl_assert(!(new_phy_page >= mtdblk->num_total_pages));
+
+
+
+							DEBUG(MTD_DEBUG_LEVEL1,"lftl: %x: GCcp L%u from P%llu to
P%llu",current->pid,old_lpn,old_phy_page,new_phy_page);
+
+							ops.mode = MTD_OOB_AUTO;
+							ops.ooblen = mtd->oobsize;
+							ops.len = mtd->writesize;
+							ops.ooboffs = 0;
+							ops.datbuf = rd_buf;
+							ops.oobbuf = oob_buf;
+							res = mtd->write_oob(mtd,new_phy_page<<mtdblk->pageshift, &ops);
+							if(ops.retlen != mtd->writesize)
+							{
+
+								printk(KERN_ERR "lftl: gc mtd write fail");
+
+								BUG();
+								return -1 ;
+							}
+
+							atomic_dec(&mtdblk->activity_matrix.num_writes[bank_num]);
+
+							DEBUG(MTD_DEBUG_LEVEL2,"lftl: %x: [%d]num_wr-- =
%d",current->pid,bank_num,mtdblk->activity_matrix.num_writes[bank_num].counter);
+
+
+
+							oldblkno = old_phy_page/(mtdblk->pages_per_blk);
+							page_in_blk = old_phy_page%(mtdblk->pages_per_blk);
+
+							changed_ppn[loop_count] = new_phy_page;
+							corresp_lpn[loop_count] = old_lpn;
+							
+							
+							/* map_table change */
+						
+
+							/* this is the scenario when:
+							 * GC made a copy of our victim blk's  page 'P' to another blk,
+							 * but in-between 'P' got invalidated by some writesect
+							 */
+
+
+							if(!(test_bit(loop_count,blk_info[victim_blk].valid_pages_map)))
+							{
+								map_table_lock(old_lpn);
+								map_table[old_lpn] =  new_phy_page;
+								map_table_unlock(old_lpn);
+
+								n_valid_pages++;
+								new_blkno = new_phy_page/(mtdblk->pages_per_blk);
+								page_in_blk = new_phy_page%(mtdblk->pages_per_blk);
+								test_and_set_bit(page_in_blk,blk_info[new_blkno].valid_pages_map);
+							}
+							else
+							{
+								/*
+								* invalidating the copied page that is written somewhere
+								* just dont set the valid bit
+								* and inc the dirty page count for the bank
+								*/
+								atomic_inc(&bank_info[bank_num].perbank_ndirty_pages);
+							}
+
+
+
+						}
+
+						mask = mask <<1;
+
+						loop_count++;
+
+					}
+
+					vfree(rd_buf);
+					vfree(oob_buf);
+
+
+
+					n_dirty_pages = mtdblk->pages_per_blk - n_valid_pages;
+					bitmap_zero((blk_info[victim_blk].valid_pages_map),64);
+
+					DEBUG(MTD_DEBUG_LEVEL2,"lftl:do_gc copied and now erase %d",victim_blk);
+
+					erase_blk(mtdblk,victim_blk);
+					blk_free(mtdblk,victim_blk);
+					atomic_set(&blk_info[victim_blk].num_valid_pages,0);
+
+					test_and_clear_bit(victim_blk,gc_map);
+
+					atomic_inc(&bank_info[bank_num].perbank_nfree_blks);
+					atomic_sub(n_dirty_pages,&bank_info[bank_num].perbank_ndirty_pages);
+
+					mtdblk->cur_writing[bank_num].last_gc_blk  = i;
+
+					test_and_clear_bit(bank_num,gc_bankbitmap);
+					atomic_inc(&num_gcollected);
+
+					DEBUG(MTD_DEBUG_LEVEL2,"lftl:%x: do_gc L%d  bank %d ret
1",current->pid,level,bank_num);
+
+
+					return 1;
+
+				} /* end else if minvpages not zero */
+
+
+
+			} /*end if( blk vpages <= min_vpages) */
+
+		} /*	end if( blk notfree && not curwritten &&  not gcollected)*/
+
+		test_and_clear_bit(i,gc_map);
+
+	} /* end for(i = start_blk;i < end_blk;i++)*/
+
+	mtdblk->cur_writing[bank_num].last_gc_blk  = i;
+	if(test_and_clear_bit(bank_num,gc_bankbitmap) == 0)
+	{
+		printk(KERN_ERR "lftl: %x: do_gc bank %d alrdy 0",current->pid,bank_num);
+		BUG();
+	}
+
+	DEBUG(MTD_DEBUG_LEVEL2,"lftl:%x: do_gc L%d  bank %d ret
0",current->pid,level,bank_num);
+
+	return 0;
+
+
+}
+
+/* define 3 ranges of IO load levels
+ * depending on the number of active
+ * FTL IO threads	
+ */
+static inline int in_range(int num)
+{
+	if(num == 0) /* IO is idle */
+	{
+		return 0;
+	}
+	else if(num >= 1 &&  num < (VIRGO_NUM_MAX_REQ_Q/2)) /* atmost half
the IO threads are active*/
+	{
+		return 1;	
+	}
+	else /* more than half the IO threads are active */
+	{
+		return 2;
+	}
+
+}
+/* 3 levels of IO load level and the
+ * corresponding garbage collection level
+ */
+static int map_num_gc[3] = {NUM_GC_THREAD,(NUM_GC_THREAD/2),1};
+
+
+
+struct gc_threadinfo
+{
+	struct lftlblk_dev *mtdblk;
+	int banknum;
+};
+
+void check_and_dogc_thrd(void *arg)
+{
+	int banknum;
+	struct lftlblk_dev *mtdblk;
+	int iteration_useless;
+	int useless_iterations;
+	int can_sleep, must_sleep;
+	int gained_blks;
+	int loopcount=0;
+	int have_to, had_it, no_sleep;
+	int i;
+	int prev_range = -1;
+	int num_times_in_same_range = 0;
+	int threadnum;
+	int cangcthrds = 1;
+
+	int min_free_blks_bank = -1;
+	int min_free_blks_amount;
+	int numbitset;
+	int wakeupnum;
+	int numiothreads,numgcthreads;
+	int threshgcthrds;
+
+	
+	mtdblk = ((struct gcthread_arg_data *)arg)->mtdblk_ptr;
+	threadnum = ((struct gcthread_arg_data *)arg)->thrdnum;
+
+	min_free_blks_amount = mtdblk->blks_per_bank;
+
+	printk(KERN_INFO "lftl: check_and_dogc_thrd %d started  %d
time",threadnum,loopcount);
+
+	test_and_set_bit(threadnum, mtdblk->gc_active_map);
+	while(mtdblk->init_not_done == 1)
+	{
+		schedule();
+	}
+	while (!kthread_should_stop()) 	{
+
+		have_to = 0; had_it = 0; no_sleep = 0; can_sleep = 1; must_sleep = 0;
+
+		iteration_useless = 1;
+		for(banknum = 0;  banknum < numpllbanks; banknum++)
+		{
+			gained_blks = 0;
+
+			if(bank_info[banknum].perbank_nfree_blks.counter < mtdblk->blks_per_bank/2)
+			{
+				if(threadnum == 0)
+				{
+					if(min_free_blks_amount < bank_info[banknum].perbank_nfree_blks.counter)
+					{
+						min_free_blks_bank = banknum;
+						min_free_blks_amount = bank_info[banknum].perbank_nfree_blks.counter;
+					}
+				}
+				if(mtdblk->activity_matrix.num_writes[banknum].counter >
VIRGO_NUM_MAX_REQ_Q)
+				{
+					printk(KERN_ERR "lftl: num wr %d >
possible",mtdblk->activity_matrix.num_writes[banknum].counter);
+					BUG();
+				}
+				have_to = 1;
+
+
+				if((numbitset= bitmap_weight(mtdblk->mbd.active_iokthread, 64)) <
(numpllbanks/2))
+				{
+					if(mtdblk->activity_matrix.num_writes[banknum].counter == 0)
+					{
+					atomic_inc(&mtdblk->activity_matrix.gc_goingon[banknum]);
+
+					had_it = 1;
+					if(bank_info[banknum].perbank_nfree_blks.counter <
mtdblk->blks_per_bank/8)
+					{
+
+						{
+							gained_blks = do_gc(mtdblk,banknum,GC_LEVEL2);
+						}
+					}
+					else if(bank_info[banknum].perbank_nfree_blks.counter <
mtdblk->blks_per_bank/4)
+					{
+
+						{
+							gained_blks = do_gc(mtdblk,banknum,GC_LEVEL1);
+						}
+					}
+					else if(bank_info[banknum].perbank_nfree_blks.counter <
mtdblk->blks_per_bank/2)
+					{
+
+						{
+							gained_blks = do_gc(mtdblk,banknum,GC_LEVEL0);
+						}
+					}
+					atomic_dec(&mtdblk->activity_matrix.gc_goingon[banknum]);
+
+					}
+				}
+				else
+				{
+					atomic_inc(&mtdblk->activity_matrix.gc_goingon[banknum]);
+
+					had_it = 1;
+					if(bank_info[banknum].perbank_nfree_blks.counter <
mtdblk->blks_per_bank/8)
+					{
+
+						{
+							gained_blks = do_gc(mtdblk,banknum,GC_LEVEL2);
+						}
+					}
+					else if(bank_info[banknum].perbank_nfree_blks.counter <
mtdblk->blks_per_bank/4)
+					{
+
+						{
+							gained_blks = do_gc(mtdblk,banknum,GC_LEVEL1);
+						}
+					}
+					else if(bank_info[banknum].perbank_nfree_blks.counter <
mtdblk->blks_per_bank/2)
+					{
+
+						{
+							gained_blks = do_gc(mtdblk,banknum,GC_LEVEL0);
+						}
+					}
+					atomic_dec(&mtdblk->activity_matrix.gc_goingon[banknum]);
+
+				}
+
+
+			}
+			if(gained_blks > 0)
+			{
+				iteration_useless = 0;
+				useless_iterations = 0;
+			}
+			if(can_sleep  == 1)
+			{
+				/* we have to Garbage collection
+				 * and did we had it done?*/
+				if(have_to == 1)
+				{
+					if(had_it == 1)
+					{
+						/* yes!! done*/
+						have_to = 0;
+						had_it = 0;
+					}
+					else
+					{
+						/* no!! not done*/
+						no_sleep = 1;
+						can_sleep = 0;
+					}
+				}
+			}
+
+
+
+		}
+		if(iteration_useless != 1)
+		{
+			if(threadnum == 0)
+			{
+				scheduled_for_gc[0] = min_free_blks_bank;
+			}
+		}
+		if(iteration_useless == 1)
+		{
+			if(threadnum == 0)
+			{
+				scheduled_for_gc[0] = -1;
+			}
+			useless_iterations++;
+	
+			if(useless_iterations > (mtdblk->blks_per_bank/ITERATIONS_PER_GC_CALL))
+			{
+	
+				if(jiffies_to_msecs(jiffies - mtdblk->last_wr_time) > 5000)
+				{
+					must_sleep = 1;
+					useless_iterations = 0;
+				}
+			}
+
+
+
+		}
+
+
+	
+
+
+	numbitset = bitmap_weight(mtdblk->mbd.active_iokthread, 64);
+	numiothreads = in_range(numbitset);
+	threshgcthrds = map_num_gc[numiothreads];
+	if(prev_range == numiothreads)
+		num_times_in_same_range++;
+	else
+		prev_range = numiothreads;
+
+	
+	
+
+	DEBUG(MTD_DEBUG_LEVEL2,"lftl:GC numbitsset %d ",numbitset);
+
+	/* more than 3 times, the IO load level
+ 	 * stays in the
+	 * same range
+	 */
+
+	if(num_times_in_same_range > 3)
+	{
+
+ 	    DEBUG(MTD_DEBUG_LEVEL2,"lftl:rf to %d",prev_range);
+
+		num_times_in_same_range = 0;
+		cangcthrds = threshgcthrds;
+
+
+	}
+
+	numbitset = bitmap_weight(mtdblk->gc_active_map, 64);
+	numgcthreads = numbitset;
+
+
+	if(numgcthreads < cangcthrds)
+	{
+		/* the master thread is the one
+		 * that will wakeup other
+		 * threads
+		 */
+		if(threadnum == 0)
+		{
+		/* if the iterations were useless,
+		 * no need to restart
+		 * new threads
+		 */
+		
+		if(must_sleep != 1)
+		{
+			/* this is a rough number
+			 * of threads
+			 * to wakeup
+			 */
+			wakeupnum = cangcthrds - numgcthreads;
+			if(wakeupnum < 0 || wakeupnum > NUM_GC_THREAD)
+			{
+				printk(KERN_ERR "wakeupnum wrong canggc = (%d) numbitset = %d
wakupnum = (%d)",cangcthrds,numgcthreads,wakeupnum);
+				BUG();
+			}
+			i = 0;
+			while (wakeupnum > 0)
+			{
+				if(i >= NUM_GC_THREAD)
+				{
+
+
+					break;
+				}
+
+
+
+				{
+					/* Returns 1 if the process
+					 * was woken up, 0 if it was already
+					 * running.
+					 */
+					if(wake_up_process(mtdblk->ftlgc_thrd[i]) == 1)
+					{
+
+						wakeupnum--;
+					}
+				}
+
+
+				i++;
+
+			}
+		}
+		}
+
+	}
+	else if(numgcthreads > cangcthrds)
+	{
+		if(threadnum != 0)
+		{
+			must_sleep = 1;
+		}
+
+	}
+
+	if(must_sleep == 1)
+	{
+		set_current_state(TASK_INTERRUPTIBLE);
+		test_and_clear_bit(threadnum, mtdblk->gc_active_map);
+
+		schedule();
+		set_current_state(TASK_RUNNING);
+		test_and_set_bit(threadnum, mtdblk->gc_active_map);
+		must_sleep = 0;
+	}
+	loopcount++;
+
+	}
+}
+
+
+
+/*
+ * internal buffer management
+ * avoids calling vmalloc everytime.
+ */
+
+struct spare_buf_node {
+	struct lfq_node_rcu list;
+	struct rcu_head rcu;
+	void *bufptr;
+};
+
+
+static void free_sparebuf_node(struct rcu_head *head)
+{
+	struct spare_buf_node *node =
+			container_of(head,  struct spare_buf_node, rcu);
+	kfree(node);
+}
+
+static void *get_spare_buf()
+{
+	struct spare_buf_node *node;
+	struct lfq_node_rcu *qnode;
+	void *ret_buf;
+	ret_buf = NULL;
+
+
+	rcu_read_lock();
+	qnode = lockfree_dequeue(&spare_bufQ);
+	node = container_of(qnode, struct spare_buf_node, list);
+	rcu_read_unlock();
+
+	if(node != NULL)
+	{
+		ret_buf = node->bufptr;
+
+	}
+	else
+	{
+		printk(KERN_ERR "lftl: get_spare_buf alloc fail");
+		BUG();
+	}
+	call_rcu(&node->rcu, free_sparebuf_node);
+	return ret_buf;
+}
+
+
+
+static void put_spare_buf(void *ptr)
+{
+	struct spare_buf_node *node;
+
+
+	node = kmalloc(sizeof(struct spare_buf_node),GFP_KERNEL);
+
+	if (!node)
+	{
+		printk(KERN_ERR "lftl: sparebuf alloc fail");
+		BUG();
+	}
+	node->bufptr = ptr;
+	lfq_node_init_rcu(&node->list);
+	rcu_read_lock();
+	lockfree_enqueue(&spare_bufQ, &node->list);
+	rcu_read_unlock();
+}
+
+static void  put_spare_oobbuf(void *ptr)
+{
+	struct spare_buf_node *node;
+	node = kmalloc(sizeof(struct spare_buf_node),GFP_KERNEL);
+
+	if (!node)
+	{
+		printk(KERN_ERR "lftl: sparebuf alloc fail");
+		BUG();
+	}
+	node->bufptr = ptr;
+	lfq_node_init_rcu(&node->list);
+	rcu_read_lock();
+	lockfree_enqueue(&spare_oobbufQ, &node->list);
+	rcu_read_unlock();
+}
+
+static void *get_spare_oobbuf()
+{
+	struct spare_buf_node *node;
+	struct lfq_node_rcu *qnode;
+	void *ret_buf;
+	ret_buf = NULL;
+
+	rcu_read_lock();
+	qnode = lockfree_dequeue(&spare_oobbufQ);
+	node = container_of(qnode, struct spare_buf_node, list);
+	rcu_read_unlock();
+
+
+	if(node != NULL)
+	{
+		ret_buf = node->bufptr;
+
+	}
+	else
+	{
+		printk(KERN_ERR "lftl: getspareoobuf alloc fail");
+		BUG();
+	}
+	call_rcu(&node->rcu, free_sparebuf_node);
+	return ret_buf;
+
+
+}
+
+
+
+
+#define IN_USE 1
+#define NOT_IN_USE 0
+#define EMPTY_BUF 0
+#define HALF_FULLBUF 1
+#define FULL_BUF 2
+#define NOT_SELECTED (-1)
+
+
+static int lftlblock_writesect(struct lftl_blktrans_dev *dev,
+			      uint64_t logic_ftl_blk, char *buf)
+{
+	struct lftlblk_dev *mtdblk = container_of(dev, struct lftlblk_dev, mbd);
+	struct mtd_info *mtd = mtdblk->mbd.mtd;
+
+	uint64_t logic_page_num;
+
+	uint8_t *new_temp_buf;
+
+	uint32_t page_shift;
+	uint32_t  cache_buf,found_cache_buf;
+
+	uint32_t sect_idx;
+	uint32_t shift_val;
+
+	uint64_t mask;
+	
+	/* needed 64bit as we do some shifting*/
+	uint64_t phy_addr;
+	uint64_t bumped_lpn;
+	uint64_t new_temp_buf_wmask;
+
+
+	int flush = 0;
+
+	int stuck = 0;
+	int stuck_lock3 = 0;
+	int search_success = 0;
+	int i;
+	int j;
+
+	uint64_t phy_page_offs,old_phy_page_offs;
+	uint8_t *rd_buf, *oob_buf,*new_oob_buf;
+	uint32_t size_copied;
+	struct mtd_oob_ops ops;
+	int res;
+	struct oob_data oobvalues,*oobdata;
+
+
+	int retval;
+
+
+	int selected_buf;
+	static int unsigned countrmw = 0;
+
+
+	struct lfq_node_rcu *qnode;
+	struct cache_num_node *node;
+
+
+	static int very_first_time = 1;
+
+
+	mtdblk->last_wr_time = jiffies;
+
+
+	shift_val = mtdblk->pageshift -mtdblk->blkshift;
+	mask = ~(-1ULL<<shift_val);
+	sect_idx = logic_ftl_blk&mask;
+
+	logic_page_num = (logic_ftl_blk<<mtdblk->blkshift)>>mtdblk->pageshift;
+
+	DEBUG(MTD_DEBUG_LEVEL1,"lftl:%x: wsect = %lld pgw = %lld sect_idx =
%d",current->pid,logic_ftl_blk,logic_page_num,sect_idx);
+
+search_lookup_Tab:
+	search_success  = 0;
+
+	/* optimistic search the
+	 * buffer lookup table
+	 */
+
+	for(i = 0; i < MAX_FTL_CACHEBUFS;i++)
+	{
+		if(buf_lookup_tab[i] == logic_page_num)
+		{
+			if(search_success == 1)
+			{
+				printk(KERN_ERR "lftl: %x: twice in buflookuptab
%llu",current->pid,logic_page_num);
+
+				printk(KERN_INFO " ");
+
+				for(j = 0; j < MAX_FTL_CACHEBUFS ;j++)
+				{
+					printk("%llu ",buf_lookup_tab[j]);
+				}
+
+				BUG();
+			}
+			search_success = 1;
+			found_cache_buf = i;
+		}
+	}
+
+
+
+
+	if(search_success == 1)
+	{
+		cache_buf = found_cache_buf;
+		mutex_lock(&(mtdblk->buf_lock[cache_buf]));
+
+		if(buf_lookup_tab[cache_buf] != logic_page_num)
+		{
+			mutex_unlock(&(mtdblk->buf_lock[cache_buf]));
+			printk(KERN_WARNING "lftl: w: buf wrong allthe way back");
+			goto search_lookup_Tab;
+		}
+
+
+		if(mtdblk->cached_buf[cache_buf].flush_in_progress.counter)
+		{
+			printk(KERN_ERR "lftl: flush in progress while write");
+			BUG();
+		}
+		atomic_inc(&mtdblk->cached_buf[cache_buf].writes_in_progress);
+
+		memcpy((mtdblk->buf[cache_buf]+(sect_idx*mtdblk->blksize)),buf,mtdblk->blksize);
+		set_bit(sect_idx,&(mtdblk->cached_buf[cache_buf].written_mask));
+
+		if(mtdblk->cached_buf[cache_buf].cache_state == STATE_DIRTY &&
mtdblk->cached_buf[cache_buf].written_mask == mtdblk->cache_fullmask)
+		{
+			if(!mtdblk->cached_buf[cache_buf].flush_in_progress.counter)
+			{
+
+
+				mtdblk->cached_buf[cache_buf].cache_state = STATE_FULL;
+				/*move to full_list*/
+
+		    	DEBUG(MTD_DEBUG_LEVEL2,"lftl: cache %d inbuf FULL",cache_buf);
+
+
+				node = kmem_cache_alloc(qnode_cache, GFP_KERNEL);
+
+				if (!node)
+				{
+					printk(KERN_ERR "lftl: wsect kmem_cache_alloc fail \n");
+					BUG();
+				}
+				node->value = cache_buf;
+				lfq_node_init_rcu(&node->list);
+				rcu_read_lock();
+				lockfree_enqueue(&full_bufsq, &node->list);
+				rcu_read_unlock();
+
+			}
+			else
+			{
+ 				printk(KERN_ERR "lftl: flush2 in progress while write");
+				BUG();
+			}
+		}
+		mtdblk->cached_buf[cache_buf].last_touch = jiffies;
+		atomic_dec(&mtdblk->cached_buf[cache_buf].writes_in_progress);
+		mutex_unlock(&(mtdblk->buf_lock[cache_buf]));
+
+	}
+	else
+	{
+
+
+		/*
+		 * set a bit to indicate alloc_buf_in_progress..
+		 * test_and_set_bit returns 1 to try again ;
+		 * 0 to continue
+		 */
+		if(test_and_set_bit(logic_page_num,page_bitmap))
+		{
+
+			schedule();
+			printk(KERN_WARNING " lftl: allocbuf in progress ; all the way back");
+			goto search_lookup_Tab;
+		}
+		else
+		{
+
+			/*
+			 * pessimistic search
+			 */
+			for(i = 0; i < MAX_FTL_CACHEBUFS;i++)
+			{
+				if(buf_lookup_tab[i] == logic_page_num)
+				{
+					printk(KERN_WARNING "lftl: pessimistic_search pass; all the way back1");
+					goto search_lookup_Tab;
+				}
+			}
+
+
+
+		/*
+		* buffer allocation
+		* 1. try to get an empty buffer
+		* 2. not possible, try to get a Full dirty buffer
+		* 3. not possible, try to get a partially dirty buffer
+		*/
+
+look_for_buf:
+
+
+
+		selected_buf = NOT_SELECTED;
+		
+		/* try the empty buf*/
+		rcu_read_lock();
+		qnode = lockfree_dequeue(&empty_bufsq);
+		node = container_of(qnode, struct cache_num_node, list);
+		rcu_read_unlock();
+		if(node != NULL)
+		{
+			cache_buf = node->value;
+			call_rcu(&node->rcu, free_cache_num_node);
+			selected_buf = EMPTY_BUF;
+		}
+		/* try the full buf*/
+		if(selected_buf == NOT_SELECTED)
+		{
+			rcu_read_lock();
+			qnode = lockfree_dequeue(&full_bufsq);
+			node = container_of(qnode, struct cache_num_node, list);
+			rcu_read_unlock();
+
+			if(node != NULL)
+			{
+				cache_buf = node->value;
+				call_rcu(&node->rcu, free_cache_num_node);
+				selected_buf = FULL_BUF;
+			}
+
+		}
+		/*
+		 * select a partially FULL buffer
+		 * selection in round-robin fashion
+		 */
+		if(selected_buf == NOT_SELECTED)
+		{
+			mutex_lock(&(mtdblk->select_buf_lock));
+			atomic_inc(&mtdblk->cache_assign_count);
+			cache_buf = mtdblk->cache_assign_count.counter%MAX_FTL_CACHEBUFS;
+			mutex_unlock(&(mtdblk->select_buf_lock));
+
+			selected_buf = HALF_FULLBUF;
+		}
+
+		if(cache_buf < 0 || cache_buf >= MAX_FTL_CACHEBUFS)
+		{
+			printk(KERN_ERR "lftl: cachebuf [%d] out of range",cache_buf);
+			BUG();
+		}
+
+
+
+		/*
+		 * 3 code paths, depending on selected
+		 * buf was empty, FULLBUF or partially
+		 * FULL BUF
+		 */
+		if(selected_buf == EMPTY_BUF)
+		{
+
+ 		   DEBUG(MTD_DEBUG_LEVEL2,"lftl: %x: empty buffer
%d",current->pid,cache_buf);
+
+
+			if(!(mtdblk->cached_buf[cache_buf].cache_state == STATE_EMPTY))
+			{
+				printk(KERN_ERR "lftl: Dequeued Buf not empty");
+				BUG();
+			}
+
+			mutex_lock(&(mtdblk->buf_lock[cache_buf]));
+
+			mutex_lock(&mtdblk->buf_lookup_tab_mutex);
+			buf_lookup_tab[cache_buf] = logic_page_num;
+			mutex_unlock(&mtdblk->buf_lookup_tab_mutex);
+
+			mtdblk->cached_buf[cache_buf].cache_state = STATE_DIRTY;
+			mtdblk->cached_buf[cache_buf].written_mask = 0ULL;
+
+			atomic_inc(&mtdblk->cached_buf[cache_buf].writes_in_progress);
+
+			memcpy((mtdblk->buf[cache_buf]+(sect_idx*mtdblk->blksize)),buf,mtdblk->blksize);
+			set_bit(sect_idx,&(mtdblk->cached_buf[cache_buf].written_mask));
+
+			if(mtdblk->cached_buf[cache_buf].cache_state == STATE_DIRTY &&
mtdblk->cached_buf[cache_buf].written_mask == mtdblk->cache_fullmask)
+			{
+				if(!mtdblk->cached_buf[cache_buf].flush_in_progress.counter)
+				{
+
+
+					mtdblk->cached_buf[cache_buf].cache_state = STATE_FULL;
+					/*move to full_list*/
+
+				    DEBUG(MTD_DEBUG_LEVEL2,"lftl:cachebuf %d FULL",cache_buf);
+
+
+					node = kmem_cache_alloc(qnode_cache, GFP_KERNEL);
+					if (!node)
+					{
+						printk(KERN_ERR "lftl: kmem_cache_alloc fail \n");
+						BUG();
+					}
+					node->value = cache_buf;
+					lfq_node_init_rcu(&node->list);
+					rcu_read_lock();
+					lockfree_enqueue(&full_bufsq, &node->list);
+					rcu_read_unlock();
+
+				}
+			}
+			mtdblk->cached_buf[cache_buf].last_touch = jiffies;
+			atomic_dec(&mtdblk->cached_buf[cache_buf].writes_in_progress);
+
+			mutex_unlock(&(mtdblk->buf_lock[cache_buf]));
+
+		}
+		else if(selected_buf == FULL_BUF)
+		{
+			/* FIFO mechanism*/
+
+		    DEBUG(MTD_DEBUG_LEVEL2,"lftl: %x: w get fdirty buffer
%d",current->pid,cache_buf);
+
+			if(mtdblk->cached_buf[cache_buf].written_mask != mtdblk->cache_fullmask)
+			{
+				/* can this situation happen? */
+				
+				printk(KERN_WARNING "lftl: Deqd Full buf not full");
+				goto look_for_buf;
+
+			}
+
+			mutex_lock(&(mtdblk->buf_lock[cache_buf]));
+			
+			/*
+			 * check for writes in progress
+			 * set flush  in progress
+			 * change buffers , change map table
+			 */
+			atomic_inc(&mtdblk->cached_buf[cache_buf].flush_in_progress);
+
+			stuck = 0;
+			while(mtdblk->cached_buf[cache_buf].writes_in_progress.counter)
+			{
+				if(stuck_lock3%10000 == 0)
+				{
+					printk(KERN_WARNING "lftl: stuck_lockup3 %d %d
%x",cache_buf,mtdblk->cached_buf[cache_buf].writes_in_progress.counter,current->pid);
+				}
+				stuck_lock3++;
+				stuck = 1;
+
+
+				schedule();
+			}
+			if(stuck != 0)
+			{
+				printk(KERN_WARNING "lftl: out of stuck_lockup3 %d %d
%x",cache_buf,mtdblk->cached_buf[cache_buf].writes_in_progress.counter,current->pid);
+			}
+
+			new_temp_buf = mtdblk->buf[cache_buf];
+			mtdblk->buf[cache_buf] = get_spare_buf();
+			if(mtdblk->buf[cache_buf] == NULL)
+			{
+				printk(KERN_INFO "vmalloc fail");
+				BUG();
+			}
+
+			new_temp_buf_wmask = mtdblk->cached_buf[cache_buf].written_mask;
+			bumped_lpn = buf_lookup_tab[cache_buf];
+
+
+			mutex_lock(&mtdblk->buf_lookup_tab_mutex);
+			buf_lookup_tab[cache_buf] = logic_page_num;
+			mutex_unlock(&mtdblk->buf_lookup_tab_mutex);
+
+
+			mtdblk->cached_buf[cache_buf].written_mask = 0ULL;
+			mtdblk->cached_buf[cache_buf].cache_state = STATE_DIRTY;
+
+			flush = 1;
+
+			atomic_dec(&mtdblk->cached_buf[cache_buf].flush_in_progress);
+
+			atomic_inc(&mtdblk->cached_buf[cache_buf].writes_in_progress);
+			memcpy((mtdblk->buf[cache_buf]+(sect_idx*mtdblk->blksize)),buf,mtdblk->blksize);
+			set_bit(sect_idx,&(mtdblk->cached_buf[cache_buf].written_mask));
+
+			if(mtdblk->cached_buf[cache_buf].cache_state == STATE_DIRTY &&
mtdblk->cached_buf[cache_buf].written_mask == mtdblk->cache_fullmask)
+			{
+				if(!mtdblk->cached_buf[cache_buf].flush_in_progress.counter)
+				{
+
+
+					mtdblk->cached_buf[cache_buf].cache_state = STATE_FULL;
+					/*move to full_list*/
+
+				    DEBUG(MTD_DEBUG_LEVEL1,"lftl: cache %d buf FULL",cache_buf);
+
+
+					node = kmem_cache_alloc(qnode_cache, GFP_KERNEL);
+					if (!node)
+					{
+						printk(KERN_INFO "lftl: writesect kmem_cache_alloc fail \n");
+						BUG();
+					}
+					node->value = cache_buf;
+					lfq_node_init_rcu(&node->list);
+					rcu_read_lock();
+					lockfree_enqueue(&full_bufsq, &node->list);
+					rcu_read_unlock();
+
+				}
+			}
+			mtdblk->cached_buf[cache_buf].last_touch = jiffies;
+			atomic_dec(&mtdblk->cached_buf[cache_buf].writes_in_progress);
+			mutex_unlock(&(mtdblk->buf_lock[cache_buf]));
+
+
+		}
+		else if(selected_buf == HALF_FULLBUF)
+		{
+
+		    DEBUG(MTD_DEBUG_LEVEL1,"lftl: %x: w get hdirty buffer
%d",current->pid,cache_buf);
+
+
+
+			mutex_lock(&(mtdblk->buf_lock[cache_buf]));
+			/*
+			* check for writes in progress
+			* set flush  in progress
+			* change buffers , change map table
+			*/
+
+			atomic_inc(&mtdblk->cached_buf[cache_buf].flush_in_progress);
+			stuck = 0;
+			while(mtdblk->cached_buf[cache_buf].writes_in_progress.counter)
+			{
+				if(stuck_lock3%10000 == 0)
+				{
+					printk(KERN_WARNING "lftl: stuck_lockup3 %d %d
%x",cache_buf,mtdblk->cached_buf[cache_buf].writes_in_progress.counter,current->pid);
+				}
+				stuck_lock3++;
+				stuck = 1;
+
+
+				schedule();
+			}
+			if(stuck != 0)
+			{
+				printk(KERN_WARNING "lftl: out of stuck_lockup3 %d %d
%x",cache_buf,mtdblk->cached_buf[cache_buf].writes_in_progress.counter,current->pid);
+			}
+
+
+ 			new_temp_buf = mtdblk->buf[cache_buf];
+			new_temp_buf_wmask = mtdblk->cached_buf[cache_buf].written_mask;
+			bumped_lpn = buf_lookup_tab[cache_buf];
+
+			mtdblk->buf[cache_buf] = get_spare_buf();
+			if(mtdblk->buf[cache_buf] == NULL)
+			{
+				printk(KERN_ERR "lftl: mem alloc failure");
+				BUG();
+			}
+			mtdblk->cached_buf[cache_buf].written_mask = 0;
+			mtdblk->cached_buf[cache_buf].cache_state = STATE_DIRTY;
+
+			mutex_lock(&mtdblk->buf_lookup_tab_mutex);
+			buf_lookup_tab[cache_buf] = logic_page_num;
+			mutex_unlock(&mtdblk->buf_lookup_tab_mutex);
+
+			flush = 1;
+			atomic_dec(&mtdblk->cached_buf[cache_buf].flush_in_progress);
+
+			atomic_inc(&mtdblk->cached_buf[cache_buf].writes_in_progress);
+			memcpy((mtdblk->buf[cache_buf]+(sect_idx*mtdblk->blksize)),buf,mtdblk->blksize);
+			set_bit(sect_idx,&(mtdblk->cached_buf[cache_buf].written_mask));
+
+			if(mtdblk->cached_buf[cache_buf].cache_state == STATE_DIRTY &&
mtdblk->cached_buf[cache_buf].written_mask == mtdblk->cache_fullmask)
+			{
+				if(!mtdblk->cached_buf[cache_buf].flush_in_progress.counter)
+				{
+
+
+					mtdblk->cached_buf[cache_buf].cache_state = STATE_FULL;
+					/*move to full_list*/
+
+				    DEBUG(MTD_DEBUG_LEVEL2,"lftl: cache %d  buf FULL",cache_buf);
+
+
+					node = kmem_cache_alloc(qnode_cache, GFP_KERNEL);
+					if (!node)
+					{
+						printk(KERN_ERR "lftl: wsect kmem_cache_alloc fail \n");
+						BUG();
+					}
+					node->value = cache_buf;
+					lfq_node_init_rcu(&node->list);
+					rcu_read_lock();
+					lockfree_enqueue(&full_bufsq, &node->list);
+					rcu_read_unlock();
+
+				}
+			}
+			mtdblk->cached_buf[cache_buf].last_touch = jiffies;
+			atomic_dec(&mtdblk->cached_buf[cache_buf].writes_in_progress);
+			mutex_unlock(&(mtdblk->buf_lock[cache_buf]));
+
+		}
+		else
+		{
+			printk(KERN_ERR "lftl: Selected buf neither empty full or half");
+			BUG();
+
+		}
+
+
+		test_and_clear_bit(logic_page_num,page_bitmap);
+
+	}/* else (test and set)*/
+
+
+	}/*else (search_success == 1)*/
+
+
+
+
+	/* at this point only need to protect the map table correctly */
+
+	if(flush == 1)
+	{
+
+        DEBUG(MTD_DEBUG_LEVEL1,"lftl:%x: flush %d  bumped lpn = %llu
for %llu ",current->pid,cache_buf,bumped_lpn,logic_page_num);
+
+	
+
+		if(new_temp_buf_wmask != mtdblk->cache_fullmask)
+		{
+
+			/* not all sectors here are new
+			 * do merge with flash
+			 * and write to new location
+			 */
+
+			countrmw++;
+			/* print a warning if we are doing
+			 * lot of
+			 * read-modify-writes
+			 */
+			if(countrmw > 64)
+			{
+				printk(KERN_WARNING "countrmw > 64");
+				countrmw = 0;
+
+			}
+
+
+
+
+			map_table_lock(bumped_lpn);
+
+			phy_page_offs = map_table[bumped_lpn];
+
+			map_table_unlock(bumped_lpn);
+
+
+			{
+				if(phy_page_offs == INVALID_PAGE_NUMBER)
+				{
+					printk(KERN_ERR "lftl: wsect %llu %llu",bumped_lpn,phy_page_offs);
+					BUG();
+				}
+			}
+
+
+			lftl_assert(!((bumped_lpn > mtdblk->num_total_pages) ||
(phy_page_offs > mtdblk->num_total_pages)));
+
+
+			rd_buf = get_spare_buf();
+			if (!rd_buf)
+			{
+				printk(KERN_ERR "lftl:  get_spare_buf fail");
+				BUG();
+
+			}
+
+			oob_buf = get_spare_oobbuf();
+			if (!oob_buf)
+			{
+				printk(KERN_INFO "lftl: get_spare_buf fail");
+				BUG();
+
+			}
+
+
+			ops.mode = MTD_OOB_AUTO;
+			ops.datbuf = rd_buf;
+			ops.len = mtd->writesize;
+			ops.oobbuf = oob_buf;
+			ops.ooboffs = 0;
+			ops.ooblen = mtd->oobsize;
+
+
+			res = mtd->read_oob(mtd,phy_page_offs<<mtdblk->pageshift, &ops);
+			if(ops.retlen < mtd->writesize)
+			{
+				printk(KERN_ERR "lftl: merge_with_flash read failure");
+				return -1;
+			}
+
+
+			mask = 1;
+			size_copied = 0;
+			sect_idx = 0;
+
+			while(size_copied < mtdblk->cache_size)
+			{
+				if(((mask) & (new_temp_buf_wmask)) == 0)
+				{
+
+					memcpy(new_temp_buf
+sect_idx*mtdblk->blksize,rd_buf+sect_idx*mtdblk->blksize,mtdblk->blksize);
+
+				}
+				mask = mask <<1;
+				sect_idx++;
+				size_copied += mtdblk->blksize;
+
+			}
+			put_spare_buf(rd_buf);
+			put_spare_oobbuf(oob_buf);
+
+
+		}
+the_write_part:
+		;
+		int tried = 0; phy_addr = INVALID_PAGE_NUMBER;
+		while(tried < (numpllbanks*2) && phy_addr == INVALID_PAGE_NUMBER)
+		{
+			phy_addr = get_ppage(mtdblk,RAND_SEL,0);
+			tried++;
+		}
+
+
+		lftl_assert(!(phy_addr >= mtdblk->num_total_pages));
+
+
+
+		uint32_t oldblkno,page_in_blk;
+		uint32_t newblkno,bank_num;
+		int banknum;
+
+		if(phy_addr != INVALID_PAGE_NUMBER){
+		
+
+
+			page_shift = mtdblk->pageshift;
+
+			banknum = phy_addr/(mtdblk->pages_per_blk*mtdblk->hwblks_per_bank);
+
+
+
+
+
+		
+			new_oob_buf = get_spare_oobbuf();
+
+			if (!new_oob_buf)
+			{
+				printk(KERN_ERR "lftl deinit: vmalloc fail");
+				BUG();
+		
+			}
+
+			oobdata = &oobvalues;
+
+			atomic_inc(&mtdblk->seq_num);
+			oobdata->seq_number = mtdblk->seq_num.counter;
+			oobdata->logic_page_num = bumped_lpn;
+			oobdata->blk_type = DATA_BLK;
+			memcpy(new_oob_buf,oobdata,sizeof(*oobdata));
+
+
+
+
+			if(mtdblk->activity_matrix.gc_goingon[banknum].counter == 1)
+			{
+
+			    DEBUG(MTD_DEBUG_LEVEL2,"lftl: %x: bank %d numWr%d and GC %d",
+			    					current->pid,banknum,mtdblk->activity_matrix.num_writes[banknum].counter,
+			    					 mtdblk->activity_matrix.gc_goingon[banknum].counter);
+
+				atomic_inc(&gc_on_writes_collisions);
+			}
+
+
+
+			ops.mode = MTD_OOB_AUTO;
+			ops.ooblen = mtd->oobsize;
+			ops.len = mtd->writesize;
+			ops.retlen = 0;
+			ops.oobretlen = 0;
+			ops.ooboffs = 0;
+			ops.datbuf = new_temp_buf;
+			ops.oobbuf = new_oob_buf;
+			retval = 1;
+
+			retval = mtd->write_oob(mtd,(phy_addr<<page_shift), &ops);
+
+			if(ops.retlen != mtd->writesize)
+			{
+
+				printk(KERN_ERR "lftl: mtd write %llx  %llu %lu %ld fail",
+									phy_addr<<page_shift,
+									phy_addr,sizeof(*oobdata),ops.retlen);
+				BUG();
+
+			}
+
+
+
+
+			lftl_assert(!(bumped_lpn >= mtdblk->num_total_pages));
+
+
+			old_phy_page_offs = map_table[bumped_lpn];
+
+			{
+
+				lftl_assert(!(old_phy_page_offs >= mtdblk->num_total_pages));
+
+				oldblkno = old_phy_page_offs/(mtdblk->pages_per_blk);
+				page_in_blk = old_phy_page_offs%(mtdblk->pages_per_blk);
+
+				lftl_assert(!(page_in_blk >= MAX_PAGES_PER_BLK));
+
+				lftl_assert(!(oldblkno >= mtdblk->num_blks));
+
+
+				bank_num = oldblkno/mtdblk->hwblks_per_bank;
+
+
+
+				test_and_clear_bit(page_in_blk,blk_info[oldblkno].valid_pages_map);
+				atomic_dec(&blk_info[oldblkno].num_valid_pages);
+				atomic_inc(&bank_info[bank_num].perbank_ndirty_pages);
+			}
+
+
+	modifymaptab:
+
+			map_table_lock(bumped_lpn);
+
+			map_table[bumped_lpn] =  phy_addr;
+
+
+			map_table_unlock(bumped_lpn);
+
+			lftl_assert(!(phy_addr  >= mtdblk->num_total_pages));
+
+
+
+			newblkno = phy_addr/(mtdblk->pages_per_blk);
+			page_in_blk = phy_addr%(mtdblk->pages_per_blk);
+
+
+			lftl_assert(!(page_in_blk >= MAX_PAGES_PER_BLK));
+
+			lftl_assert(!(newblkno >= mtdblk->num_blks));
+
+
+			test_and_set_bit(page_in_blk,blk_info[newblkno].valid_pages_map);
+			atomic_inc(&blk_info[newblkno].num_valid_pages);
+
+			put_spare_buf(new_temp_buf);
+			put_spare_oobbuf(new_oob_buf);
+
+			banknum = phy_addr/(mtdblk->pages_per_blk*mtdblk->hwblks_per_bank);
+
+			atomic_dec(&mtdblk->activity_matrix.num_writes[banknum]);
+
+	        DEBUG(MTD_DEBUG_LEVEL2,"lftl: %x: [%d]num_wr-- = %d",
+	        						current->pid,banknum,
+	        						mtdblk->activity_matrix.num_writes[banknum].counter);
+
+		}
+		else
+		{
+			printk(KERN_ERR "lftl: ASSERT new_writesect phyaddr %llu",phy_addr);
+			BUG();
+		}
+
+	}
+
+	return 0;
+}
+
+
+
+
+
+
+#define MAP_TAB 1
+#define BLKINFO_TAB 2
+#define FREEMAP_TAB 3
+#define BANKINFO_TAB 4
+#define EXTRAINFO_TAB 5
+
+
+int read_a_ckpt_blk(struct lftlblk_dev *mtdblk,int blkno)
+{
+
+	struct mtd_info *mtd;
+	struct oob_data oobvalues,*oobdata;
+
+
+	uint32_t map_table_size;
+	uint32_t blk_info_size;
+	uint32_t free_map_size;
+	uint32_t bank_info_size;
+	int ret_next_blk;
+	struct mtd_oob_ops ops;
+	uint64_t phy_page;
+	int i;
+	uint32_t num_map_table_blks;
+	uint32_t num_blk_info_blks;
+	uint32_t num_freemap_blks;
+	uint32_t num_bankinfo_blks;
+	uint32_t num_blks_req;
+	int actual_map_table_size,actual_blk_info_size;
+	int actual_bank_info_size,actual_free_map_size;
+	int  actual_extra_info_size;
+
+	uint8_t *rd_buf,*oob_buf;
+
+	uint32_t blk_iter;
+	uint64_t seq_num;
+	int32_t rd_len;
+	int res;
+	uint32_t cur_read;
+	uint32_t map_table_index = 0;
+	uint32_t blk_info_index = 0;
+	uint32_t bank_info_index = 0;
+	uint32_t free_map_index =0;
+	uint32_t rdmap_blks = 0;
+	uint32_t extra_info_size;
+	int found_extrainfo_blks =0;
+	int extra_info_index =0;
+	int maptab_seqnum_limit,blkinf_seqnum_limit;
+	int freemap_seqnum_limit,bankinf_seqnum_limit;
+	int extrainf_seqnum_limit;
+	
+	int found_map_table_blks = 0;
+	int found_blk_info_blks = 0;
+	int found_freemap_blks = 0;
+	int found_bankinfo_blks = 0;
+	
+	uint32_t num_map_table_pages;
+	uint32_t num_blk_info_pages ;
+	uint32_t num_freemap_pages ;
+	uint32_t num_bankinfo_pages ;
+	uint32_t flash_page_size;
+	uint32_t total_ckpt_pages;
+	uint32_t extra_info_pages;
+
+
+	mtd = mtdblk->mbd.mtd;
+	map_table_size = mtdblk->pages_per_blk * mtdblk->num_blks * sizeof(uint32_t);
+	blk_info_size = mtdblk->num_blks * sizeof(struct per_blk_info);
+	bank_info_size = mtdblk->num_parallel_banks* sizeof(struct per_bank_info);
+	free_map_size = mtdblk->num_blks/8;
+
+
+
+	extra_info_size = sizeof(struct extra_info_struct);
+
+
+
+	actual_map_table_size = map_table_size;
+	actual_blk_info_size = blk_info_size;
+	actual_bank_info_size = bank_info_size;
+	actual_free_map_size = free_map_size;
+	actual_extra_info_size = extra_info_size;
+
+
+
+	flash_page_size = mtd->writesize;
+
+	num_map_table_pages = (map_table_size/flash_page_size)
+((map_table_size)%(flash_page_size) ? 1 : 0);
+	num_blk_info_pages =
(blk_info_size/flash_page_size)+((blk_info_size)%(flash_page_size) ? 1
: 0);
+	num_freemap_pages = (free_map_size/flash_page_size)
+((free_map_size)%(flash_page_size) ? 1 : 0);
+	num_bankinfo_pages =
(bank_info_size/flash_page_size)+((bank_info_size)%(flash_page_size) ?
1 : 0);
+	extra_info_pages =
(extra_info_size/flash_page_size)+((extra_info_size)%(flash_page_size)
? 1 : 0);
+
+	total_ckpt_pages =
num_map_table_pages+num_blk_info_pages+num_freemap_pages+num_bankinfo_pages;
+	num_blks_req =
total_ckpt_pages/mtdblk->pages_per_blk+((total_ckpt_pages)%(mtdblk->pages_per_blk)
? 1 : 0);
+
+	map_table_size = mtd->writesize * num_map_table_pages;
+	blk_info_size = num_blk_info_pages*mtd->writesize;
+	free_map_size =  num_freemap_pages * mtd->writesize;
+	bank_info_size = num_bankinfo_pages *mtd->writesize;
+	extra_info_size = extra_info_pages*mtd->writesize;
+
+	printk(KERN_INFO "lftl: init ftl maptabpages = %d
%d",num_map_table_pages,num_map_table_pages/mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: init ftl blkinfopages = %d
%d",num_blk_info_pages,num_blk_info_pages/mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: init ftl freemapages = %d
%d",num_freemap_pages,num_freemap_pages/mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: init ftl bankinfopages = %d
%d",num_bankinfo_pages,num_bankinfo_pages/mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: init ftl bankinfopages = %d
%d",num_bankinfo_pages,num_bankinfo_pages/mtdblk->pages_per_blk);
+
+
+	num_map_table_blks = (num_map_table_pages/mtdblk->pages_per_blk)
+((num_map_table_pages%mtdblk->pages_per_blk) ? 1 : 0);
+	num_blk_info_blks =
(num_blk_info_pages/mtdblk->pages_per_blk)+((num_blk_info_pages%mtdblk->pages_per_blk)
? 1 : 0);
+	num_freemap_blks = (num_freemap_pages/mtdblk->pages_per_blk)
+((num_freemap_pages%mtdblk->pages_per_blk) ? 1 : 0);
+	num_bankinfo_blks =
(num_bankinfo_pages/mtdblk->pages_per_blk)+((num_bankinfo_pages%mtdblk->pages_per_blk)
? 1 : 0);
+
+
+
+	maptab_seqnum_limit  = (num_map_table_pages/mtdblk->pages_per_blk)
+							 +((num_map_table_pages%mtdblk->pages_per_blk) ? 1 : 0);
+
+	blkinf_seqnum_limit =
(num_map_table_pages+num_blk_info_pages)/mtdblk->pages_per_blk
+							+ (((num_map_table_pages+num_blk_info_pages)%mtdblk->pages_per_blk)
? 1 : 0);
+
+	freemap_seqnum_limit =
(num_map_table_pages+num_blk_info_pages+num_freemap_pages)/mtdblk->pages_per_blk
+							+ (((num_map_table_pages+num_blk_info_pages+num_freemap_pages)%mtdblk->pages_per_blk)
? 1 : 0);
+
+	bankinf_seqnum_limit=
(num_map_table_pages+num_blk_info_pages+num_freemap_pages
+							+num_bankinfo_pages)/mtdblk->pages_per_blk +
+								 (((num_map_table_pages+num_blk_info_pages
+								 	+num_freemap_pages+num_bankinfo_pages)%mtdblk->pages_per_blk)
? 1 : 0);
+
+	extrainf_seqnum_limit =
(num_map_table_pages+num_blk_info_pages+num_freemap_pages+
+								num_bankinfo_pages+extra_info_pages)/mtdblk->pages_per_blk
+									+ (((num_map_table_pages+num_blk_info_pages+
+											num_freemap_pages+num_bankinfo_pages+extra_info_pages)%mtdblk->pages_per_blk)
? 1 : 0);
+
+
+
+	rd_buf = vmalloc(mtd->writesize);
+	oob_buf = vmalloc(mtd->oobsize);
+	if(rd_buf == NULL || oob_buf == NULL)
+	{
+		printk(KERN_ERR "lftl: read_a_ckptblk vmalloc fail");
+		BUG();
+	}
+
+
+
+	map_table_index = 0;
+	blk_info_index = 0;
+	bank_info_index = 0;
+	free_map_index =0;
+	extra_info_index = 0;
+	
+	/*
+	 * The data structures were written to checkpoint blocks
+	 * in the following order
+		Maptable
+		Block info
+		Free Map
+		Bankinfo
+		Extrainfo(like seqnumber)
+
+	 * Read the first page of blk and know the seqnum of ckptblk
+	 * From the seqnum, determine what data structure we are reading
+	 * cpy the ckpt data to appropriate data structure
+	 * continue to read the remaining pages
+	 * end when you have read all the pages (or)
+	 * you have read the final data structure
+	 */
+
+
+	blk_iter = blkno;
+	{
+		phy_page = blk_iter*mtdblk->pages_per_blk;
+
+		ops.mode = MTD_OOB_AUTO;
+		ops.datbuf = rd_buf;
+		ops.len = mtd->writesize;
+		ops.oobbuf = oob_buf;
+		ops.ooboffs = 0;
+		ops.ooblen = mtd->oobsize;
+
+
+
+
+		res = mtd->read_oob(mtd,phy_page<<mtdblk->pageshift, &ops);
+		if(ops.retlen < mtd->writesize)
+		{
+			printk(KERN_ERR "lftl: read failure");
+			printk(KERN_ERR "lftl: phypage = %llu",phy_page);
+			BUG();
+		}
+		oobdata = &oobvalues;
+		memcpy(oobdata, oob_buf,sizeof(*oobdata));
+
+		lftl_assert(oobdata->blk_type == MAP_BLK);
+
+
+
+
+		seq_num = oobdata->seq_number;
+		ret_next_blk = oobdata->logic_page_num;
+
+		int mycount;
+		printk(KERN_INFO "lftl: rd oobbuf");
+		printk(KERN_INFO " ");
+		for(mycount = 0; mycount < sizeof(*oobdata);mycount++)
+			printk(" %d ",oob_buf[mycount]);
+
+
+		printk(KERN_INFO "lftl: blk = %u seq_num = %llu",blk_iter,seq_num);
+
+		rdmap_blks++;
+
+		if(seq_num < maptab_seqnum_limit)
+		{
+			/* do something with map table */
+			found_map_table_blks++;
+			cur_read = MAP_TAB;
+
+			map_table_index = seq_num*mtdblk->pages_per_blk*(mtd->writesize);
+
+			if((map_table_index + mtd->writesize) < map_table_size)
+			{
+				memcpy(((uint8_t*)map_table)+map_table_index,rd_buf,mtd->writesize);
+				map_table_index = map_table_index+mtd->writesize;
+			}
+			else
+			{
+				memcpy(((uint8_t*)map_table)+map_table_index,rd_buf,(map_table_size-map_table_index));
+				map_table_index = map_table_size;
+			}
+			/* read the remaining pages*/
+
+			if(map_table_index == map_table_size)
+			{
+				printk(KERN_INFO "lftl: map table reconstructed");
+				cur_read = BLKINFO_TAB;
+				blk_info_index =
(seq_num*mtdblk->pages_per_blk*mtd->writesize)-map_table_size;
+			}
+		}
+		else if(seq_num < blkinf_seqnum_limit)
+		{
+			found_blk_info_blks++;
+			cur_read = BLKINFO_TAB;
+			blk_info_index =
(seq_num*mtdblk->pages_per_blk*mtd->writesize)-map_table_size;
+
+			if((blk_info_index + mtd->writesize) < blk_info_size)
+			{
+
+				memcpy(((uint8_t*)blk_info)+ blk_info_index,rd_buf,mtd->writesize);
+				blk_info_index = blk_info_index+mtd->writesize;
+			}
+			else
+			{
+				memcpy(((uint8_t*)blk_info)+
blk_info_index,rd_buf,(blk_info_size-blk_info_index));
+				blk_info_index = blk_info_size;
+			}
+
+			if(blk_info_index == blk_info_size)
+			{
+				printk(KERN_INFO "lftl: blk info reconstructed");
+				cur_read = FREEMAP_TAB;
+				free_map_index =
(seq_num*mtdblk->pages_per_blk*mtd->writesize)-(blk_info_size+map_table_size);
+			}
+
+
+		}
+		else if(seq_num < freemap_seqnum_limit)
+		{
+			found_freemap_blks++;
+			cur_read = FREEMAP_TAB;
+
+			free_map_index =
(seq_num*mtdblk->pages_per_blk*mtd->writesize)-(blk_info_size+map_table_size);
+
+
+
+			if(free_map_index + mtd->writesize < free_map_size)
+			{
+				memcpy(((uint8_t*)mtdblk->free_blk_map)+
free_map_index,rd_buf,mtd->writesize);
+				free_map_index = free_map_index+mtd->writesize;
+			}
+			else
+			{
+				memcpy(((uint8_t*)mtdblk->free_blk_map)+
free_map_index,rd_buf,(free_map_size-free_map_index));
+				free_map_index = free_map_size;
+			}
+
+
+			if(free_map_index == free_map_size)
+			{
+				printk(KERN_INFO "lftl: freemap info reconstructed");
+				cur_read = BANKINFO_TAB;
+				bank_info_index = 0;
+				printk(KERN_INFO "lftl: bankinfoindex = %d",bank_info_index);
+			}
+		}
+		else if(seq_num < bankinf_seqnum_limit)
+		{
+			found_bankinfo_blks++;
+
+			bank_info_index =
(seq_num*mtdblk->pages_per_blk*mtd->writesize)-(blk_info_size+map_table_size+free_map_size);
+			if(bank_info_index + mtd->writesize < bank_info_size)
+			{
+				memcpy(((uint8_t*)bank_info)+ bank_info_index,rd_buf,mtd->writesize);
+				bank_info_index = bank_info_index+mtd->writesize;
+			}
+			else
+			{
+				memcpy(((uint8_t*)bank_info)+
bank_info_index,rd_buf,(bank_info_size-bank_info_index));
+				bank_info_index = bank_info_size;
+			}
+
+
+			if(bank_info_index == bank_info_size)
+			{
+
+				printk(KERN_INFO "lftl: bank info reconstructed");
+				cur_read = EXTRAINFO_TAB;
+				extra_info_index = 0;
+			}
+		}
+		else if(seq_num < extrainf_seqnum_limit)
+		{
+			found_extrainfo_blks++;
+
+			extra_info_index =
(seq_num*mtdblk->pages_per_blk*mtd->writesize)-(blk_info_size+map_table_size+free_map_size+bank_info_size);
+
+			printk(KERN_INFO "lftl: extrainf_index = %d", extra_info_index);
+			printk(KERN_INFO "lftl: extrainf_size = %u",extra_info_size);
+
+			if(extra_info_index + mtd->writesize < extra_info_size)
+			{
+				memcpy(((uint8_t*)extra_info)+ extra_info_index,rd_buf,mtd->writesize);
+				extra_info_index = extra_info_index+mtd->writesize;
+			}
+			else
+			{
+				memcpy(((uint8_t*)extra_info)+
extra_info_index,rd_buf,(extra_info_size-extra_info_index));
+				extra_info_index = extra_info_size;
+			}
+
+
+			if(extra_info_index == extra_info_size)
+			{
+
+				mtdblk->seq_num.counter = extra_info->sequence_number;
+				printk(KERN_INFO "lftl: extra info reconstructed");
+				printk(KERN_INFO "lftl: seqnum = %d",mtdblk->seq_num.counter);
+				goto end_of_func;
+			}
+		}
+		else
+		{
+			printk(KERN_ERR "lftl: bug: wrong seqnum = %llu",seq_num);
+			BUG();
+		}
+
+		for(i = 1; i < mtdblk->pages_per_blk;i++)
+		{
+			if(cur_read == MAP_TAB)
+			{
+
+				if((map_table_index + mtd->writesize) > map_table_size)
+				{
+					rd_len = map_table_size - map_table_index;
+					if(rd_len <= 0)
+					{
+						printk(KERN_INFO "lftl: rdlen = %d",rd_len);
+						goto next_page;
+					}
+				}
+				else
+				{
+					rd_len = mtd->writesize;
+				}
+				phy_page = blk_iter*mtdblk->pages_per_blk+i;
+
+				ops.mode = MTD_OOB_AUTO;
+				ops.datbuf = rd_buf;
+				ops.len = mtd->writesize;
+				ops.oobbuf = oob_buf;
+				ops.ooboffs = 0;
+				ops.ooblen = mtd->oobsize;
+
+
+
+				res = mtd->read_oob(mtd,phy_page<<mtdblk->pageshift, &ops);
+				if(ops.retlen < mtd->writesize)
+				{
+					printk(KERN_ERR "lftl: read failure");
+					printk(KERN_ERR "lftl: phypage = %llu",phy_page);
+					BUG();
+				}
+				oobdata = &oobvalues;
+				memcpy(oobdata, oob_buf,sizeof(*oobdata));
+				if(oobdata->blk_type != MAP_BLK)
+				{
+					printk(KERN_INFO "lftl: the remaining page in mapblk not map");
+					BUG();
+				}
+
+
+				memcpy(((uint8_t*)map_table)+ map_table_index,rd_buf,rd_len);
+				map_table_index = map_table_index+rd_len;
+				if(map_table_index == map_table_size)
+				{
+					printk(KERN_INFO "lftl: map table reconstructed");
+					cur_read = BLKINFO_TAB;
+					blk_info_index =
(seq_num*mtdblk->pages_per_blk*mtd->writesize)-map_table_size;
+
+				}
+
+			}
+			else if(cur_read == BLKINFO_TAB)
+			{
+
+				if((blk_info_index + mtd->writesize) > blk_info_size)
+				{
+					rd_len = blk_info_size - blk_info_index;
+					if(rd_len <= 0)
+					{
+						printk(KERN_INFO "lftl: rdlen = %d",rd_len);
+						goto next_page;
+					}
+				}
+				else
+				{
+					rd_len = mtd->writesize;
+				}
+				phy_page = blk_iter*mtdblk->pages_per_blk+i;
+
+				ops.mode = MTD_OOB_AUTO;
+				ops.datbuf = rd_buf;
+				ops.len = mtd->writesize;
+				ops.oobbuf = oob_buf;
+				ops.ooboffs = 0;
+				ops.ooblen = mtd->oobsize;
+
+
+
+				res = mtd->read_oob(mtd,phy_page<<mtdblk->pageshift, &ops);
+				if(ops.retlen < mtd->writesize)
+				{
+					printk(KERN_ERR "lftl: read failure");
+					printk(KERN_ERR "lftl: phypage = %llu",phy_page);
+					BUG();
+				}
+				oobdata = &oobvalues;
+				memcpy(oobdata, oob_buf,sizeof(*oobdata));
+				if(oobdata->blk_type != MAP_BLK)
+				{
+					printk(KERN_INFO "lftl: the remaining page in mapblk not map");
+					BUG();
+				}
+
+				memcpy(((uint8_t*)blk_info)+ blk_info_index,rd_buf,rd_len);
+
+				blk_info_index = blk_info_index+rd_len;
+				if(blk_info_index == blk_info_size)
+				{
+					printk(KERN_INFO "lftl: blk info reconstructed");
+					cur_read = FREEMAP_TAB;
+					free_map_index =
(seq_num*mtdblk->pages_per_blk*mtd->writesize)-(blk_info_size+map_table_size);
+				}
+
+
+			}
+			else if(cur_read == FREEMAP_TAB)
+			{
+
+				if((free_map_index + mtd->writesize) > free_map_size)
+				{
+					rd_len = free_map_size - free_map_index;
+					if(rd_len <= 0)
+					{
+						printk(KERN_INFO "lftl: rdlen = %d",rd_len);
+						goto next_page;
+					}
+				}
+				else
+				{
+					rd_len = mtd->writesize;
+				}
+				phy_page = blk_iter*mtdblk->pages_per_blk+i;
+
+				ops.mode = MTD_OOB_AUTO;
+				ops.datbuf = rd_buf;
+				ops.len = mtd->writesize;
+				ops.oobbuf = oob_buf;
+				ops.ooboffs = 0;
+				ops.ooblen = mtd->oobsize;
+
+
+
+				res = mtd->read_oob(mtd,phy_page<<mtdblk->pageshift, &ops);
+				if(ops.retlen < mtd->writesize)
+				{
+					printk(KERN_ERR "lftl: FTL read failure");
+					printk(KERN_ERR "lftl: phypage = %llu",phy_page);
+					BUG();
+				}
+				oobdata = &oobvalues;
+
+
+
+				memcpy(oobdata, oob_buf,sizeof(*oobdata));
+				if(oobdata->blk_type != MAP_BLK)
+				{
+					printk(KERN_INFO "lftl: the remaining page in mapblk not map");
+					BUG();
+				}
+
+
+
+				memcpy(((uint8_t*)mtdblk->free_blk_map) + free_map_index,rd_buf,rd_len);
+
+				free_map_index = free_map_index+rd_len;
+				if(free_map_index == free_map_size)
+				{
+
+
+					printk(KERN_INFO "lftl: freemap info reconstructed");
+					cur_read = BANKINFO_TAB;
+					bank_info_index = 0;
+					printk(KERN_INFO "lftl: bankinfoindex = %d",bank_info_index);
+				}
+
+
+			}
+			else if(cur_read == BANKINFO_TAB)
+			{
+
+				if((bank_info_index + mtd->writesize) > actual_bank_info_size)
+				{
+					rd_len = actual_bank_info_size - bank_info_index;
+					if(rd_len <= 0)
+					{
+						goto next_page;
+					}
+				}
+				else
+				{
+					rd_len = mtd->writesize;
+				}
+				printk(KERN_INFO "lftl: bankinfoindex = %d rd_len =
%d",bank_info_index,rd_len);
+				phy_page = blk_iter*mtdblk->pages_per_blk+i;
+
+				ops.mode = MTD_OOB_AUTO;
+				ops.datbuf = rd_buf;
+				ops.len = mtd->writesize;
+				ops.oobbuf = oob_buf;
+				ops.ooboffs = 0;
+				ops.ooblen = mtd->oobsize;
+
+
+
+				res = mtd->read_oob(mtd,phy_page<<mtdblk->pageshift, &ops);
+				if(ops.retlen < ops.len )
+				{
+					printk(KERN_ERR "lftl: read failure");
+					printk(KERN_ERR "lftl: phypage = %llu",phy_page);
+					BUG();
+				}
+				oobdata = &oobvalues;
+				memcpy(oobdata, oob_buf,sizeof(*oobdata));
+				if(oobdata->blk_type != MAP_BLK)
+				{
+					printk(KERN_INFO "lftl: the remaining page in mapblk not map");
+					BUG();
+				}
+
+				memcpy(((uint8_t*)bank_info) + bank_info_index,rd_buf,rd_len);
+
+				bank_info_index = bank_info_index+ops.len ;
+				if(bank_info_index == bank_info_size)
+				{
+
+					printk(KERN_INFO "lftl: bank info reconstructed");
+					cur_read = EXTRAINFO_TAB;
+					extra_info_index = 0;
+				}
+
+
+			}
+			else if(cur_read == EXTRAINFO_TAB)
+			{
+				printk(KERN_INFO "lftl: extrainf_index = %d", extra_info_index);
+				printk(KERN_INFO "lftl: extrainf_size = %u",extra_info_size);
+
+				if((extra_info_index + mtd->writesize) > actual_extra_info_size)
+				{
+					rd_len = actual_extra_info_size - extra_info_index;
+					if(rd_len <= 0)
+					{
+						goto next_page;
+					}
+				}
+				else
+				{
+					rd_len = mtd->writesize;
+				}
+				phy_page = blk_iter*mtdblk->pages_per_blk+i;
+
+				ops.mode = MTD_OOB_AUTO;
+				ops.datbuf = rd_buf;
+				ops.len = mtd->writesize;
+				ops.oobbuf = oob_buf;
+				ops.ooboffs = 0;
+				ops.ooblen = mtd->oobsize;
+
+
+
+				res = mtd->read_oob(mtd,phy_page<<mtdblk->pageshift, &ops);
+				if(ops.retlen < ops.len )
+				{
+					printk(KERN_ERR "lftl: read failure");
+					printk(KERN_ERR "lftl: phypage = %llu",phy_page);
+					BUG();
+				}
+				oobdata = &oobvalues;
+				memcpy(oobdata, oob_buf,sizeof(*oobdata));
+				if(oobdata->blk_type != MAP_BLK)
+				{
+					printk(KERN_INFO "lftl: the remaining page in mapblk not map");
+					BUG();
+				}
+
+				memcpy(((uint8_t*)extra_info) + extra_info_index,rd_buf,rd_len);
+
+				extra_info_index = extra_info_index+ops.len ;
+				if(extra_info_index == extra_info_size)
+				{
+
+
+
+					mtdblk->seq_num.counter = extra_info->sequence_number;
+					printk(KERN_INFO "lftl: extra info reconstructed");
+					printk(KERN_INFO "lftl: seqnum = %d",mtdblk->seq_num.counter);
+					goto end_of_func;
+				}
+
+
+			}
+		next_page:
+				;
+		} /*for i = 1 to pages_per_blk */
+
+
+end_of_func:
+		;
+	} /* for(blk_iter = start_blk; blk_iter < end_blk;blk_iter++) */
+	return ret_next_blk;
+
+
+
+}
+
+
+
+int alloc_near_boundary(struct lftlblk_dev *mtdblk)
+{
+	int bank;
+	uint32_t start_blk;
+	uint32_t last_blk;
+	uint32_t blk;
+
+	for(bank=0; bank < numpllbanks;bank++)
+	{
+
+		start_blk = mtdblk->cur_writing[bank].first_blk;
+
+
+		for(blk = start_blk;blk<= start_blk+CKPT_RANGE;blk++)
+		{
+			if(blk_isfree(mtdblk,blk))
+			{
+				if(is_block_bad(mtdblk,blk))
+				{
+					continue;
+				}
+			}
+			blk_unfree(mtdblk,blk);
+			atomic_dec(&bank_info[bank].perbank_nfree_blks);
+			return blk;
+		}
+	}
+
+	for(bank=0; bank < numpllbanks;bank++)
+	{
+
+		last_blk = mtdblk->cur_writing[bank].last_blk;
+
+
+		for(blk = last_blk-CKPT_RANGE;blk<= last_blk;blk++)
+		{
+			if(blk_isfree(mtdblk,blk))
+			{
+				if(is_block_bad(mtdblk,blk))
+				{
+					continue;
+				}
+			}
+			blk_unfree(mtdblk,blk);
+			atomic_dec(&bank_info[bank].perbank_nfree_blks);
+			return blk;
+		}
+	}
+	return INVALID;
+}
+
+
+
+int wr_ckpt_chained(struct lftlblk_dev *mtdblk)
+{
+	struct oob_data oobvalues,*oobdata;
+	int32_t map_table_size;
+	int32_t blk_info_size;
+	int32_t freeblkmap_size;
+	int32_t bank_info_size;
+	int32_t size;
+	uint32_t flashblksize;
+	uint8_t *oob_buf;
+	uint32_t pages_written;
+	uint64_t phy_addr;
+	uint32_t blk;
+	uint32_t wr_len;
+	uint32_t retval;
+	struct mtd_oob_ops ops;
+	uint8_t *temp_buf;
+	uint32_t page_shift = mtdblk->pageshift;
+	uint32_t blks_written;
+	struct mtd_info *mtd;
+	uint8_t *wr_buf;
+	int wrpagesize;
+	int i;
+	uint32_t free_map_size;
+	struct extra_info_struct extrainfo,*extrainfobuf;
+	int extra_info_size;
+	uint32_t num_map_table_pages;
+	uint32_t num_blk_info_pages ;
+	uint32_t num_freemap_pages ;
+	uint32_t num_bankinfo_pages ;
+	uint32_t flash_page_size;
+	uint32_t total_ckpt_pages;
+	uint32_t num_blks_req;
+	uint32_t num_extrainfo_pages;
+	int *ckpt_alloc_blk;
+	int ckpt_alloc_blk_index;
+	
+	mtd = mtdblk->mbd.mtd;
+	
+	flashblksize = (mtd->erasesize);
+	oob_buf = vmalloc(mtd->oobsize);
+	wr_buf =  vmalloc(mtd->writesize);
+	if (!oob_buf|| !wr_buf)
+	{
+			printk(KERN_ERR "lftl  wr_ckpt_chained: vmalloc fail");
+			BUG();
+
+	}
+	map_table_size = mtdblk->pages_per_blk * mtdblk->num_blks * sizeof(uint32_t);
+	blk_info_size = mtdblk->num_blks * sizeof(struct per_blk_info);
+
+	bank_info_size = mtdblk->num_parallel_banks* sizeof(struct per_bank_info);
+	freeblkmap_size = mtdblk->num_blks/8;
+	free_map_size = mtdblk->num_blks/8;
+	extra_info_size = sizeof(struct extra_info_struct);
+
+
+	printk(KERN_INFO "lftl: maptable size = %d",map_table_size);
+	printk(KERN_INFO "lftl: blkinfo size = %d", blk_info_size);
+	printk(KERN_INFO "lftl: bank_info_size = %d", bank_info_size);
+	printk(KERN_INFO "lftl: free_map_size = %u",free_map_size);
+	printk(KERN_INFO "lftl: extrainf size = %d", extra_info_size);
+
+
+	flash_page_size = mtd->writesize;
+
+	num_map_table_pages = (map_table_size/flash_page_size) +
+									((map_table_size)%(flash_page_size) ? 1 : 0);
+	num_blk_info_pages = (blk_info_size/flash_page_size)+
+									((blk_info_size)%(flash_page_size) ? 1 : 0);
+	num_freemap_pages = (free_map_size/flash_page_size) +
+									((free_map_size)%(flash_page_size) ? 1 : 0);
+	num_bankinfo_pages = (bank_info_size/flash_page_size)+
+									((bank_info_size)%(flash_page_size) ? 1 : 0);
+	num_extrainfo_pages = (extra_info_size/flash_page_size)+
+									((extra_info_size)%(flash_page_size) ? 1 : 0);
+
+	total_ckpt_pages = num_map_table_pages+num_blk_info_pages+
+							num_freemap_pages+num_bankinfo_pages+num_extrainfo_pages;
+
+	num_blks_req = total_ckpt_pages/mtdblk->pages_per_blk+
+							((total_ckpt_pages)%(mtdblk->pages_per_blk) ? 1 : 0);
+
+
+
+	blks_written = 0;
+	oobdata = &oobvalues;
+
+
+	oobdata->seq_number = -1;
+	oobdata->logic_page_num = INVALID_PAGE_NUMBER;
+	oobdata->blk_type = MAP_BLK;
+
+
+	ckpt_alloc_blk = vmalloc(num_blks_req+5);
+	blk = alloc_near_boundary(mtdblk);
+	if(blk == INVALID)
+	{
+			printk(KERN_ERR "lftl: no free blk in CKPT_RANGE");
+			BUG();
+	}
+	ckpt_alloc_blk[0] = blk;
+	for(i = 1; i < num_blks_req;i++)
+	{
+		blk = lftl_alloc_block(mtdblk,RAND_SEL);
+		if(blk == INVALID)
+		{
+			printk(KERN_ERR "lftl: no free blk for CKPT");
+			BUG();
+		}
+                ckpt_alloc_blk[i] = blk;
+	}
+	ckpt_alloc_blk[num_blks_req] = INVALID;
+	ckpt_alloc_blk_index = -1;
+
+	printk(KERN_INFO "lftl: allocd ckpt blks");
+	for(i = 0; i < num_blks_req;i++)
+	{
+		printk(" %d",ckpt_alloc_blk[i]);
+	}
+    for(size = 0,pages_written = mtdblk->pages_per_blk; size < map_table_size;)
+    {
+		if(pages_written < mtdblk->pages_per_blk)
+		{
+				phy_addr++;
+		}
+		else
+		{
+
+				ckpt_alloc_blk_index++;
+				blk = ckpt_alloc_blk[ckpt_alloc_blk_index];
+
+				blks_written++;
+				if(blk == INVALID)
+				{
+						printk(KERN_ERR "lftl: no enough block to checkpoint");
+						BUG();
+				}
+				phy_addr = blk*mtdblk->pages_per_blk;
+				pages_written = 0;
+				oobdata->seq_number++;
+				oobdata->logic_page_num = ckpt_alloc_blk[ckpt_alloc_blk_index+1];
+				printk(KERN_INFO "lftl: wrckpt: maptab blk =%u seqnum =
%d",blk,oobdata->seq_number);
+		}
+
+
+
+		printk(KERN_INFO "lftl: phyaddr = %llu blk =
%llu",phy_addr,phy_addr/mtdblk->pages_per_blk);
+
+
+		if((map_table_size -(size+mtd->writesize)) > 0)
+		{
+				wr_len = mtd->writesize;
+				temp_buf = ((uint8_t*)map_table)+size;
+		}
+		else
+		{
+				wr_len = map_table_size -size;
+				temp_buf = ((uint8_t*)map_table)+size;
+				memset(wr_buf,0xFF,mtd->writesize);
+				memcpy(wr_buf,temp_buf,wr_len);
+				temp_buf = wr_buf;
+		}
+
+
+
+		memcpy(oob_buf,oobdata,sizeof(*oobdata));
+
+
+		ops.mode = MTD_OOB_AUTO;
+		ops.ooblen = mtd->oobsize;
+		ops.len = mtd->writesize;
+		ops.retlen = 0;
+		ops.oobretlen = 0;
+		ops.ooboffs = 0;
+		ops.datbuf = temp_buf;
+		ops.oobbuf = oob_buf;
+		retval = 1;
+
+		retval = mtd->write_oob(mtd,(phy_addr<<page_shift), &ops);
+		if(ops.retlen != ops.len)
+		{
+				printk("lftl:  mtd write fail retlen = %lu", ops.retlen);
+				BUG();
+				return -1;
+		}
+
+		size += wr_len;
+		pages_written++;
+	}
+
+	printk(KERN_INFO "lftl: map tab ckptd");
+	for(size = 0; size < blk_info_size;)
+	{
+		if(pages_written < mtdblk->pages_per_blk)
+		{
+				phy_addr++;
+		}
+		else
+		{
+				ckpt_alloc_blk_index++;
+				blk = ckpt_alloc_blk[ckpt_alloc_blk_index];
+				blks_written++;
+				if(blk == INVALID)
+				{
+						printk(KERN_ERR "lftl: no enough block to checkpoint");
+						BUG();
+				}
+				phy_addr = blk*mtdblk->pages_per_blk;
+				pages_written = 0;
+				oobdata->seq_number++;
+				oobdata->logic_page_num = ckpt_alloc_blk[ckpt_alloc_blk_index+1];
+				printk(KERN_INFO "lftl: wrckpt: blkinfo blk =%u seqnum =
%d",blk,oobdata->seq_number);
+		}
+
+
+
+
+		if((blk_info_size -(size+mtd->writesize)) > 0)
+		{
+			wr_len = mtd->writesize;
+			temp_buf = ((uint8_t*)blk_info)+size;
+		}
+		else
+		{
+			wr_len = blk_info_size -size;
+
+
+			temp_buf = ((uint8_t*)blk_info)+size;
+			memset(wr_buf,0xFF,mtd->writesize);
+			memcpy(wr_buf,temp_buf,wr_len);
+			temp_buf = wr_buf;
+		}
+
+
+		memcpy(oob_buf,oobdata,sizeof(*oobdata));
+
+		ops.mode = MTD_OOB_AUTO;
+		ops.ooblen = mtd->oobsize;
+		ops.len = mtd->writesize;
+		ops.retlen = 0;
+		ops.oobretlen = 0;
+		ops.ooboffs = 0;
+		ops.datbuf = temp_buf;
+		ops.oobbuf = oob_buf;
+		retval = 1;
+
+		retval = mtd->write_oob(mtd,(phy_addr<<page_shift), &ops);
+		if(ops.retlen != ops.len)
+		{
+
+			printk(KERN_ERR "lftl:  mtd write fail retlen = %lu", ops.retlen);
+			BUG();
+			return -1;
+		}
+
+		size += wr_len;
+		pages_written++;
+
+	}
+	printk(KERN_INFO "lftl: blkinfo ckptd");
+	for(size = 0; size < freeblkmap_size;)
+	{
+		if(pages_written < mtdblk->pages_per_blk)
+		{
+				phy_addr++;
+		}
+		else
+		{
+				ckpt_alloc_blk_index++;
+				blk = ckpt_alloc_blk[ckpt_alloc_blk_index];
+				if(blk == INVALID)
+				{
+						printk(KERN_ERR "lftl: no enough block to checkpoint");
+						BUG();
+				}
+				phy_addr = blk*mtdblk->pages_per_blk;
+				pages_written = 0;
+				oobdata->seq_number++;
+				oobdata->logic_page_num = ckpt_alloc_blk[ckpt_alloc_blk_index+1];
+				printk(KERN_INFO "lftl: wrckpt: freemap blk =%u seqnum =
%d",blk,oobdata->seq_number);
+		}
+
+
+
+
+		if((freeblkmap_size -(size+mtd->writesize)) > 0)
+		{
+			wr_len = mtd->writesize;
+			temp_buf = ((uint8_t*)mtdblk->free_blk_map)+size;
+		}
+		else
+		{
+			wr_len = freeblkmap_size-size;
+
+			temp_buf = ((uint8_t*)mtdblk->free_blk_map)+size;
+			memset(wr_buf,0xFF,mtd->writesize);
+			memcpy(wr_buf,temp_buf,wr_len);
+			temp_buf = wr_buf;
+		}
+
+
+		memcpy(oob_buf,oobdata,sizeof(*oobdata));
+
+		ops.mode = MTD_OOB_AUTO;
+		ops.ooblen = mtd->oobsize;
+		ops.len = mtd->writesize;
+		ops.retlen = 0;
+		ops.oobretlen = 0;
+		ops.ooboffs = 0;
+		ops.datbuf = temp_buf;
+		ops.oobbuf = oob_buf;
+		retval = 1;
+
+		retval = mtd->write_oob(mtd,(phy_addr<<page_shift), &ops);
+		if(ops.retlen != ops.len)
+		{
+
+			printk(KERN_ERR "lftl:  mtd write fail retlen = %lu", ops.retlen);
+			BUG();
+			return -1;
+		}
+
+		size += wr_len;
+		pages_written++;
+
+	}
+	printk(KERN_INFO "lftl: freeblkmap ckptd");
+
+	for(size = 0; size < bank_info_size;)
+	{
+		if(pages_written < mtdblk->pages_per_blk)
+		{
+				phy_addr++;
+		}
+		else
+		{
+				ckpt_alloc_blk_index++;
+				blk = ckpt_alloc_blk[ckpt_alloc_blk_index];
+				blks_written++;
+				if(blk == INVALID)
+				{
+						printk(KERN_INFO "lftl: no enough block to checkpoint");
+						BUG();
+				}
+				phy_addr = blk*mtdblk->pages_per_blk;
+				pages_written = 0;
+				oobdata->seq_number++;
+				oobdata->logic_page_num = ckpt_alloc_blk[ckpt_alloc_blk_index+1];
+				printk(KERN_INFO "lftl: wrckpt: bankinfo blk =%u seqnum =
%d",blk,oobdata->seq_number);
+		}
+
+
+
+        wrpagesize = mtd->writesize;
+		if((bank_info_size -(size+wrpagesize)) > 0)
+		{
+			wr_len = mtd->writesize;
+			temp_buf = ((uint8_t*)bank_info)+size;
+			printk(KERN_ERR "lftl: temp_buf = bankinfo size = %d", size);
+			printk(KERN_ERR "lftl: bankinfo size = %d", bank_info_size);
+			printk(KERN_ERR "lftl: wrpagesize = %d", wrpagesize);
+			printk(KERN_ERR "lftl: tempsize = %d", (size+wrpagesize));
+			printk(KERN_ERR "lftl: calcsize = %d", (bank_info_size -(size+wrpagesize)));
+			BUG();
+		}
+		else
+		{
+			wr_len = bank_info_size -size;
+			temp_buf = ((uint8_t*)bank_info)+size;
+
+			memset(wr_buf,0xFF,mtd->writesize);
+			memcpy(wr_buf,temp_buf,wr_len);
+			temp_buf = wr_buf;
+			printk(KERN_INFO "lftl: temp_buf = wr_buf wr_len = %d", wr_len);
+		}
+
+
+		memcpy(oob_buf,oobdata,sizeof(*oobdata));
+
+		ops.mode = MTD_OOB_AUTO;
+		ops.ooblen = mtd->oobsize;
+		ops.len = mtd->writesize;
+		ops.retlen = 0;
+		ops.oobretlen = 0;
+		ops.ooboffs = 0;
+		ops.datbuf = temp_buf;
+		ops.oobbuf = oob_buf;
+		retval = 1;
+
+		retval = mtd->write_oob(mtd,(phy_addr<<page_shift), &ops);
+		if(ops.retlen != ops.len)
+		{
+
+			printk(KERN_ERR "lftl:  mtd write fail retlen = %lu", ops.retlen);
+			BUG();
+			return -1;
+		}
+
+		size += wr_len;
+		pages_written++;
+
+	}
+
+	printk(KERN_INFO "lftl: bankinfo ckptd");
+
+
+	/* any extras like sequence number
+	 * allocating 1 page now, but should optimise later
+	 */
+
+
+	extrainfo.sequence_number = mtdblk->seq_num.counter;
+	extrainfobuf = &extrainfo;
+
+
+	for(size = 0; size < extra_info_size;)
+	{
+		if(pages_written < mtdblk->pages_per_blk)
+		{
+			phy_addr++;
+		}
+		else
+		{
+			ckpt_alloc_blk_index++;
+			blk = ckpt_alloc_blk[ckpt_alloc_blk_index];
+			blks_written++;
+			if(blk == INVALID)
+			{
+				printk(KERN_INFO "lftl: no enough block to checkpoint");
+				BUG();
+			}
+			phy_addr = blk*mtdblk->pages_per_blk;
+			pages_written = 0;
+			oobdata->seq_number++;
+			oobdata->logic_page_num = ckpt_alloc_blk[ckpt_alloc_blk_index+1];
+			printk(KERN_INFO "lftl: wrckpt: bankinfo blk =%u seqnum =
%d",blk,oobdata->seq_number);
+		}
+
+
+
+
+		if((extra_info_size -(size+wrpagesize)) > 0)
+		{
+			wr_len = mtd->writesize;
+			temp_buf = ((uint8_t*)extrainfobuf)+size;
+		}
+		else
+		{
+			wr_len = extra_info_size -size;
+			temp_buf = ((uint8_t*)extrainfobuf)+size;
+
+			memset(wr_buf,0xFF,mtd->writesize);
+			memcpy(wr_buf,temp_buf,wr_len);
+			temp_buf = wr_buf;
+		}
+
+
+		memcpy(oob_buf,oobdata,sizeof(*oobdata));
+
+		ops.mode = MTD_OOB_AUTO;
+		ops.ooblen = mtd->oobsize;
+		ops.len = mtd->writesize;
+		ops.retlen = 0;
+		ops.oobretlen = 0;
+		ops.ooboffs = 0;
+		ops.datbuf = temp_buf;
+		ops.oobbuf = oob_buf;
+		retval = 1;
+
+		retval = mtd->write_oob(mtd,(phy_addr<<page_shift), &ops);
+		if(ops.retlen != ops.len)
+		{
+
+			printk(KERN_ERR "lftl: mtd write fail retlen = %lu",ops.retlen);
+
+			BUG();
+			return -1;
+		}
+
+		size += wr_len;
+		pages_written++;
+
+	}
+
+	printk(KERN_INFO "lftl: seqnum ckptd = %llu", extrainfo.sequence_number);
+
+
+
+    vfree(oob_buf);
+	vfree(wr_buf);
+	vfree(ckpt_alloc_blk);
+    printk(KERN_INFO "lftl: wr_ckptblks = %d",blks_written);
+    return 0;
+
+}
+
+
+uint32_t per_bank_bounded_scan(struct lftlblk_dev *mtdblk,int bank)
+{
+	uint32_t start_blk,last_blk;
+	uint32_t blk_iter;
+	uint64_t phy_page;
+	struct mtd_oob_ops ops;
+	uint8_t *rd_buf,*oob_buf;
+	struct mtd_info *mtd;
+	struct oob_data oobvalues,*oobdata;
+	uint64_t seq_num;
+	int res;
+
+	mtd = mtdblk->mbd.mtd;
+
+
+	rd_buf = vmalloc(mtd->writesize);
+	oob_buf = vmalloc(mtd->oobsize);
+	if(rd_buf == NULL || oob_buf == NULL)
+	{
+		printk(KERN_ERR "lftl: perbank_bounded_scan vmalloc fail");
+		BUG();
+	}
+
+	start_blk = mtdblk->cur_writing[bank].first_blk;
+
+	for(blk_iter = start_blk; blk_iter < start_blk+CKPT_RANGE;blk_iter++)
+	{
+		phy_page = blk_iter*mtdblk->pages_per_blk;
+
+		ops.mode = MTD_OOB_AUTO;
+		ops.datbuf = rd_buf;
+		ops.len = mtd->writesize;
+		ops.oobbuf = oob_buf;
+		ops.ooboffs = 0;
+		ops.ooblen = mtd->oobsize;
+
+
+		res = mtd->read_oob(mtd,phy_page<<mtdblk->pageshift, &ops);
+		if(ops.retlen < mtd->writesize)
+		{
+			printk(KERN_ERR "lftl: perbank_bounded_scan read failure");
+			printk(KERN_ERR "lftl: phypage = %llu",phy_page);
+			BUG();
+		}
+		oobdata = &oobvalues;
+		memcpy(oobdata, oob_buf,sizeof(*oobdata));
+
+
+
+		if(oobdata->blk_type == MAP_BLK)
+		{
+			seq_num = oobdata->seq_number;
+			if(seq_num == 0ULL)
+			{
+				return blk_iter;
+			}
+
+		}
+	}
+	last_blk = mtdblk->cur_writing[bank].last_blk;
+	for(blk_iter = last_blk-CKPT_RANGE; blk_iter <= last_blk;blk_iter++)
+	{
+		phy_page = blk_iter*mtdblk->pages_per_blk;
+
+		ops.mode = MTD_OOB_AUTO;
+		ops.datbuf = rd_buf;
+		ops.len = mtd->writesize;
+		ops.oobbuf = oob_buf;
+		ops.ooboffs = 0;
+		ops.ooblen = mtd->oobsize;
+
+
+		res = mtd->read_oob(mtd,phy_page<<mtdblk->pageshift, &ops);
+		if(ops.retlen < mtd->writesize)
+		{
+			printk(KERN_ERR "lftl:  perbank_bounded_scan read failure");
+			printk(KERN_ERR " phypage = %llu",phy_page);
+			BUG();
+		}
+		oobdata = &oobvalues;
+		memcpy(oobdata, oob_buf,sizeof(*oobdata));
+
+
+
+		if(oobdata->blk_type == MAP_BLK)
+		{
+			seq_num = oobdata->seq_number;
+			if(seq_num == 0ULL)
+			{
+				return blk_iter;
+			}
+
+		}
+	}
+
+	return INVALID;
+}
+
+
+
+
+
+void the_scan_thread(void *arg)
+{
+	struct lftlblk_dev *mtdblk = ((struct scan_thrd_info *)arg)->mtdblk;
+	uint32_t bank=((struct scan_thrd_info *)arg)->bank;
+	uint32_t found_blk;
+
+	found_blk = per_bank_bounded_scan(mtdblk,bank);
+	if(found_blk != INVALID)
+	{
+		mtdblk->first_ckpt_blk = found_blk;
+	}
+	clear_bit(bank,  &(mtdblk->ckptrd_mask));
+	kfree(arg);
+}
+
+int the_pagescan_thread(void *arg)
+{
+
+
+	struct lftlblk_dev *mtdblk = ((struct scan_thrd_info *)arg)->mtdblk;
+	uint32_t bank=((struct scan_thrd_info *)arg)->bank;
+	uint32_t start_blk,last_blk;
+	uint32_t blk_iter;
+	uint64_t phy_page;
+	struct mtd_oob_ops ops;
+	uint8_t *rd_buf,*oob_buf;
+	struct mtd_info *mtd;
+	struct oob_data oobvalues,*oobdata;
+	int res;
+	int page;
+
+	mtd = mtdblk->mbd.mtd;
+
+
+	rd_buf = vmalloc(mtd->writesize);
+	oob_buf = vmalloc(mtd->oobsize);
+	if(rd_buf == NULL || oob_buf == NULL)
+	{
+		printk(KERN_INFO "lftl: the_pagescan_thread vmalloc fail");
+		BUG();
+	}
+
+	start_blk = mtdblk->cur_writing[bank].first_blk;
+	last_blk = mtdblk->cur_writing[bank].last_blk+1;
+	printk(KERN_INFO "lftl: scan blks %u->%u",start_blk,last_blk);
+	for(blk_iter = start_blk; blk_iter < last_blk;blk_iter++)
+	{
+		for(page = 0; page < mtdblk->pages_per_blk;page++)
+		{
+			phy_page = blk_iter*mtdblk->pages_per_blk+page;
+
+			ops.mode = MTD_OOB_AUTO;
+			ops.datbuf = rd_buf;
+			ops.len = mtd->writesize;
+			ops.oobbuf = oob_buf;
+			ops.ooboffs = 0;
+			ops.ooblen = mtd->oobsize;
+
+
+			res = mtd->read_oob(mtd,phy_page<<mtdblk->pageshift, &ops);
+			if(ops.retlen < mtd->writesize)
+			{
+				printk(KERN_ERR "lftl: the_pagescan_thread read failure");
+				printk(KERN_ERR "lftl: phypage = %llu",phy_page);
+				BUG();
+			}
+			oobdata = &oobvalues;
+			memcpy(oobdata, oob_buf,sizeof(*oobdata));
+
+			if(scanseqnumber[phy_page] <= oobdata->seq_number)
+			{
+				reverse_map_tab[phy_page] = oobdata->logic_page_num;
+				scanseqnumber[phy_page] = oobdata->seq_number;
+			}
+
+		}
+	}
+	clear_bit(bank,  &(mtdblk->ckptrd_mask));
+	kfree(arg);
+}
+
+
+void parallel_page_scan(struct lftlblk_dev *mtdblk)
+{
+	struct task_struct *scan_thread_struct;
+	int banknum;
+	struct scan_thrd_info *scan_thread_arg;
+	uint32_t start_blk,end_blk;
+
+
+	mtdblk->ckptrd_mask = 0xFFFFFFFFFFFFFFFF;
+
+	reverse_map_tab = (uint64_t
*)vmalloc(mtdblk->num_total_pages*sizeof(uint64_t));
+	if(reverse_map_tab == NULL)
+	{
+		printk(KERN_INFO "cant vmallocate the rev map tab");
+		BUG();
+	}
+
+
+	scanseqnumber = (uint64_t *)vmalloc(mtdblk->num_total_pages*sizeof(uint64_t));
+	if(scanseqnumber == NULL)
+	{
+		printk(KERN_INFO "cant vmallocate the scanseqnum");
+		BUG();
+	}
+
+	printk(KERN_INFO "lftl: parallel page scan 0 -> %d", numpllbanks);
+	for(banknum = 0; banknum < numpllbanks;banknum++)
+	{
+		start_blk = mtdblk->cur_writing[banknum].first_blk;
+		end_blk = mtdblk->cur_writing[banknum].last_blk+1;
+
+		scan_thread_arg = kmalloc(sizeof (struct scan_thrd_info),GFP_KERNEL);
+		if(scan_thread_arg == NULL)
+		{
+			printk(KERN_ERR "lftl: parallel_page_scan kmalloc ckpt_thread_arg fail");
+			BUG();
+		}
+		scan_thread_arg->mtdblk = mtdblk;
+		scan_thread_arg->bank = banknum;
+
+		scan_thread_struct  = kthread_run(the_pagescan_thread, (scan_thread_arg),
+				"pgscan_thrd %d",banknum);
+
+		if (IS_ERR(scan_thread_struct)) {
+			PTR_ERR(scan_thread_struct);
+			BUG();
+		}
+
+	}
+
+	while(mtdblk->ckptrd_mask != 0ULL)
+	{
+		schedule();
+	}
+
+	vfree(reverse_map_tab);
+	vfree(scanseqnumber);
+}
+
+int bounded_pll_blk_scan(struct lftlblk_dev *mtdblk,int *arr)
+{
+	struct task_struct *scan_thread_struct;
+	int banknum;
+	struct scan_thrd_info *scan_thread_arg;
+	uint32_t start_blk,end_blk;
+
+	uint32_t map_table_size,blk_info_size,free_map_size,bank_info_size;
+	uint32_t num_map_table_pages,num_blk_info_pages;
+	uint32_t num_freemap_pages,num_bankinfo_pages;
+	uint32_t flash_page_size;
+	uint32_t total_ckpt_pages;
+	int rdmap_blks;
+	uint32_t next_blk;
+	struct mtd_info *mtd;
+	uint32_t num_blks_req;
+
+
+
+
+	mtd = mtdblk->mbd.mtd;
+
+	map_table_size = mtdblk->pages_per_blk * mtdblk->num_blks * sizeof(uint32_t);
+	blk_info_size = mtdblk->num_blks * sizeof(struct per_blk_info);
+	bank_info_size = mtdblk->num_parallel_banks* sizeof(struct per_bank_info);
+	free_map_size = mtdblk->num_blks/8;
+
+
+
+	flash_page_size = mtd->writesize;
+
+	num_map_table_pages = (map_table_size/flash_page_size) +
+							((map_table_size)%(flash_page_size) ? 1 : 0);
+	num_blk_info_pages = (blk_info_size/flash_page_size)+
+							((blk_info_size)%(flash_page_size) ? 1 : 0);
+	num_freemap_pages = (free_map_size/flash_page_size) +
+							((free_map_size)%(flash_page_size) ? 1 : 0);
+	num_bankinfo_pages = (bank_info_size/flash_page_size)+
+							((bank_info_size)%(flash_page_size) ? 1 : 0);
+
+	total_ckpt_pages =
num_map_table_pages+num_blk_info_pages+num_freemap_pages+num_bankinfo_pages;
+	num_blks_req =
total_ckpt_pages/mtdblk->pages_per_blk+((total_ckpt_pages)%(mtdblk->pages_per_blk)
? 1 : 0);
+
+
+	printk(KERN_INFO "lftl: init ftl maptabpages = %d %d",num_map_table_pages,
+											num_map_table_pages/mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: init ftl blkinfopages = %d %d",num_blk_info_pages,
+											num_blk_info_pages/mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: init ftl freemapages = %d %d",num_freemap_pages,
+											num_freemap_pages/mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: init ftl bankinfopages = %d %d",num_bankinfo_pages,
+											num_bankinfo_pages/mtdblk->pages_per_blk);
+
+
+
+	mtdblk->ckptrd_mask = 0xFFFFFFFFFFFFFFFF;
+
+	mtdblk->first_ckpt_blk = INVALID;
+	for(banknum = 0; banknum < numpllbanks;banknum++)
+	{
+		start_blk = mtdblk->cur_writing[banknum].first_blk;
+		end_blk = mtdblk->cur_writing[banknum].last_blk+1;
+
+		scan_thread_arg = kmalloc(sizeof (struct scan_thrd_info),GFP_KERNEL);
+		if(scan_thread_arg == NULL)
+		{
+			printk(KERN_ERR "lftl: kmalloc ckpt_thread_arg fail");
+			BUG();
+		}
+		scan_thread_arg->mtdblk = mtdblk;
+		scan_thread_arg->bank = banknum;
+
+		scan_thread_struct  = kthread_run(the_scan_thread, (scan_thread_arg),
+				"scan_thrd %d",banknum);
+
+		if (IS_ERR(scan_thread_struct)) {
+			PTR_ERR(scan_thread_struct);
+			BUG();
+		}
+
+	}
+
+	while(mtdblk->ckptrd_mask != 0ULL)
+	{
+		schedule();
+	}
+
+	if(mtdblk->first_ckpt_blk != INVALID)
+	{
+		printk(KERN_INFO "lftl: first ckpt blk = %d",mtdblk->first_ckpt_blk);
+	}
+	else
+	{
+		printk(KERN_INFO "lftl: no ckpt first ckpt blk = %d
",mtdblk->first_ckpt_blk);
+	}
+
+
+
+
+
+	next_blk = mtdblk->first_ckpt_blk;
+	rdmap_blks = 0;
+	arr[0] = next_blk;
+	while(next_blk != INVALID)
+	{
+		if(next_blk < 0 || next_blk > mtdblk->num_blks)
+		{
+			printk(KERN_ERR "lftl: wrong blk = %u", next_blk);
+			BUG();
+		}
+		if(rdmap_blks > num_blks_req)
+		{
+			printk(KERN_ERR "lftl: rdmap_blks = %d > num_blks_req %u"
,rdmap_blks,num_blks_req);
+		}
+		next_blk = read_a_ckpt_blk(mtdblk,next_blk);
+		rdmap_blks++;
+		arr[rdmap_blks] = next_blk;
+
+	}
+
+	printk(KERN_INFO "lftl: rdckpt mapblks = %d",rdmap_blks);
+	return 0;
+
+
+}
+
+void flush_all_buffers(struct lftlblk_dev *mtdblk)
+{
+	uint64_t wait_jiffies = -1ULL;
+	int buf_num;
+
+	uint8_t *new_temp_buf;
+	uint64_t new_temp_buf_wmask;
+	struct oob_data oobvalues,*oobdata;
+	uint8_t *rd_buf, *oob_buf,*new_oob_buf;
+	uint64_t bumped_lpn;
+	int res;
+	uint32_t sect_idx;
+	/* needed 64bit as we do some shifting*/
+	uint64_t phy_addr;
+	uint32_t size_copied;
+	uint64_t mask;
+	uint64_t phy_page_offs,old_phy_page_offs;
+	uint32_t page_shift = mtdblk->pageshift;
+	struct mtd_oob_ops ops;
+	struct mtd_info *mtd = mtdblk->mbd.mtd;
+	int retval;
+	uint32_t oldblkno,page_in_blk;
+	uint32_t newblkno,bank_num;
+	int banknum;
+
+	struct cache_num_node *node;
+
+	for(buf_num = 0; buf_num < MAX_FTL_CACHEBUFS;buf_num++)
+	{
+		if(mtdblk->cached_buf[buf_num].cache_state != STATE_EMPTY)
+		{
+
+			mutex_lock(&(mtdblk->buf_lock[buf_num]));
+			new_temp_buf = mtdblk->buf[buf_num];
+
+			mtdblk->buf[buf_num] = get_spare_buf();
+			if(mtdblk->buf[buf_num] == NULL)
+			{
+				printk(KERN_INFO "vmalloc fail");
+				BUG();
+			}
+
+			new_temp_buf_wmask = mtdblk->cached_buf[buf_num].written_mask;
+			bumped_lpn = buf_lookup_tab[buf_num];
+
+			bumped_lpn = buf_lookup_tab[buf_num];
+			mutex_lock(&mtdblk->buf_lookup_tab_mutex);
+			buf_lookup_tab[buf_num] = INVALID_PAGE_NUMBER_32;
+			mutex_unlock(&mtdblk->buf_lookup_tab_mutex);
+
+			mtdblk->cached_buf[buf_num].written_mask = 0ULL;
+			mtdblk->cached_buf[buf_num].cache_state = STATE_EMPTY;
+			mtdblk->cached_buf[buf_num].logic_page = INVALID_PAGE_NUMBER_32;
+			mtdblk->cached_buf[buf_num].last_touch = jiffies;
+			mutex_unlock(&(mtdblk->buf_lock[buf_num]));
+
+			if(new_temp_buf_wmask != mtdblk->cache_fullmask)
+			{
+				map_table_lock(bumped_lpn);
+				phy_page_offs = map_table[bumped_lpn];
+
+				map_table_unlock(bumped_lpn);
+
+				lftl_assert(!(phy_page_offs  >= mtdblk->num_total_pages));
+				lftl_assert(!(bumped_lpn  >= mtdblk->num_total_pages));
+				lftl_assert(!(phy_page_offs  >= mtdblk->num_total_pages));
+
+				rd_buf = get_spare_buf();
+				if (!rd_buf)
+				{
+					printk(KERN_INFO "myftl: vmalloc fail");
+					BUG();
+
+				}
+
+				oob_buf = get_spare_oobbuf();
+				if (!oob_buf)
+				{
+					printk(KERN_INFO "myftl: vmalloc fail");
+					BUG();
+				}
+
+
+				ops.mode = MTD_OOB_AUTO;
+				ops.datbuf = rd_buf;
+				ops.len = mtd->writesize;
+				ops.oobbuf = oob_buf;
+				ops.ooboffs = 0;
+				ops.ooblen = mtd->oobsize;
+
+
+				res = mtd->read_oob(mtd,phy_page_offs<<mtdblk->pageshift, &ops);
+				if(ops.retlen < mtd->writesize)
+				{
+					printk(KERN_ERR "myftl: merge_with_flash read failure");
+					return -1;
+				}
+
+
+				mask = 1;
+				size_copied = 0;
+				sect_idx = 0;
+
+				while(size_copied < mtdblk->cache_size)
+				{
+					if(((mask) & (new_temp_buf_wmask)) == 0)
+					{
+
+						memcpy(new_temp_buf
+sect_idx*mtdblk->blksize,rd_buf+sect_idx*mtdblk->blksize,mtdblk->blksize);
+
+					}
+					mask = mask <<1;
+					sect_idx++;
+					size_copied += mtdblk->blksize;
+
+				}
+				put_spare_buf(rd_buf);
+				put_spare_oobbuf(oob_buf);
+
+			}
+			the_write_part:
+					;
+			int tried = 0; phy_addr = INVALID_PAGE_NUMBER;
+			while(tried < (numpllbanks*2) && phy_addr == INVALID_PAGE_NUMBER)
+			{
+				phy_addr = get_ppage(mtdblk,RAND_SEL,0);
+				tried++;
+			}
+
+			lftl_assert(!(phy_addr  >= mtdblk->num_total_pages));
+
+		
+
+			
+			
+			
+			/*physical page write to medium. do we need a lock here?*/
+			page_shift = mtdblk->pageshift;
+			banknum = phy_addr/(mtdblk->pages_per_blk*mtdblk->hwblks_per_bank);
+			new_oob_buf = get_spare_oobbuf();
+			if (!new_oob_buf)
+			{
+				printk(KERN_INFO "myftl deinit: vmalloc fail");
+				BUG();
+			}
+			oobdata = &oobvalues;
+			atomic_inc(&mtdblk->seq_num);
+			oobdata->seq_number = mtdblk->seq_num.counter;
+			oobdata->logic_page_num = bumped_lpn;
+			oobdata->blk_type = DATA_BLK;
+			memcpy(new_oob_buf,oobdata,sizeof(*oobdata));
+			if(mtdblk->activity_matrix.gc_goingon[banknum].counter == 1)
+			{
+
+				atomic_inc(&gc_on_writes_collisions);
+			}
+			ops.mode = MTD_OOB_AUTO;
+			ops.ooblen = mtd->oobsize;
+			ops.len = mtd->writesize;
+			ops.retlen = 0;
+			ops.oobretlen = 0;
+			ops.ooboffs = 0;
+			ops.datbuf = new_temp_buf;
+			ops.oobbuf = new_oob_buf;
+			retval = 1;
+
+			retval = mtd->write_oob(mtd,(phy_addr<<page_shift), &ops);
+
+
+			if(ops.retlen != mtd->writesize)
+			{
+
+				printk("myftl: mtd write %llx  %ld %d %d
fail",phy_addr<<page_shift,phy_addr,sizeof(*oobdata),ops.retlen);
+				vfree(new_temp_buf);
+				BUG();
+
+			}
+			lftl_assert(!(bumped_lpn  >= mtdblk->num_total_pages));
+			old_phy_page_offs = map_table[bumped_lpn];
+
+			{
+
+				lftl_assert(!(old_phy_page_offs  >= mtdblk->num_total_pages));
+
+				oldblkno = old_phy_page_offs/(mtdblk->pages_per_blk);
+				page_in_blk = old_phy_page_offs%(mtdblk->pages_per_blk);
+				lftl_assert(!(oldblkno >= mtdblk->num_blks));
+				lftl_assert(!(page_in_blk >= MAX_PAGES_PER_BLK));
+
+				bank_num = oldblkno/mtdblk->hwblks_per_bank;
+
+
+				test_and_clear_bit(page_in_blk,blk_info[oldblkno].valid_pages_map);
+				atomic_dec(&blk_info[oldblkno].num_valid_pages);
+				atomic_inc(&bank_info[bank_num].perbank_ndirty_pages);
+			}
+
+
+modifymaptab:
+
+			map_table_lock(bumped_lpn);
+			map_table[bumped_lpn] =  phy_addr;
+			map_table_unlock(bumped_lpn);
+			
+			lftl_assert(!(phy_addr  >= mtdblk->num_total_pages));
+			newblkno = phy_addr/(mtdblk->pages_per_blk);
+			page_in_blk = phy_addr%(mtdblk->pages_per_blk);
+			lftl_assert(!(page_in_blk >= MAX_PAGES_PER_BLK));
+			lftl_assert(!(newblkno >= mtdblk->num_blks));
+			test_and_set_bit(page_in_blk,blk_info[newblkno].valid_pages_map);
+			atomic_inc(&blk_info[newblkno].num_valid_pages);
+			put_spare_buf(new_temp_buf);
+			put_spare_oobbuf(new_oob_buf);
+			banknum = phy_addr/(mtdblk->pages_per_blk*mtdblk->hwblks_per_bank);
+			atomic_dec(&mtdblk->activity_matrix.num_writes[banknum]);
+			
+		    DEBUG(MTD_DEBUG_LEVEL2,"lftl: %x: [%d]num_wr-- = %d",
+		    						current->pid,banknum,
+		    						mtdblk->activity_matrix.num_writes[banknum].counter);
+
+		
+		}
+
+	}
+}
+
+#define BUF_HOLDTIME (60000)
+void wbuf_flush_thread(struct lftlblk_dev *mtdblk)
+{
+	uint64_t wait_jiffies = -1ULL;
+	int buf_num;
+
+
+	uint8_t *new_temp_buf;
+	uint64_t new_temp_buf_wmask;
+	struct oob_data oobvalues,*oobdata;
+	uint8_t *rd_buf, *oob_buf,*new_oob_buf;
+	uint64_t bumped_lpn;
+	int res;
+	uint32_t sect_idx;
+	/* needed 64bit as we do some shifting*/
+	uint64_t phy_addr;
+	uint32_t size_copied;
+	uint64_t mask;
+	uint64_t phy_page_offs,old_phy_page_offs;
+	uint32_t page_shift = mtdblk->pageshift;
+	struct mtd_oob_ops ops;
+	int retval;
+	struct cache_num_node *node;
+	uint32_t oldblkno,page_in_blk;
+	uint32_t newblkno,bank_num;
+	int banknum;
+	struct mtd_info *mtd = mtdblk->mbd.mtd;
+
+	
+
+	while (!kthread_should_stop()) {
+		for(buf_num = 0; buf_num < MAX_FTL_CACHEBUFS;buf_num++)
+		{
+			if(mtdblk->cached_buf[buf_num].cache_state != STATE_EMPTY)
+			{
+				if(jiffies   <  mtdblk->cached_buf[buf_num].last_touch  +
msecs_to_jiffies(BUF_HOLDTIME))
+				{
+					/* never mind*/
+				}
+				else
+				{
+
+
+					mutex_lock(&(mtdblk->buf_lock[buf_num]));
+					new_temp_buf = mtdblk->buf[buf_num];
+
+					mtdblk->buf[buf_num] = get_spare_buf();
+					if(mtdblk->buf[buf_num] == NULL)
+					{
+						printk(KERN_INFO "vmalloc fail");
+						BUG();
+					}
+
+					new_temp_buf_wmask = mtdblk->cached_buf[buf_num].written_mask;
+					bumped_lpn = buf_lookup_tab[buf_num];
+
+					bumped_lpn = buf_lookup_tab[buf_num];
+					mutex_lock(&mtdblk->buf_lookup_tab_mutex);
+					buf_lookup_tab[buf_num] = INVALID_PAGE_NUMBER_32;
+					mutex_unlock(&mtdblk->buf_lookup_tab_mutex);
+
+
+					mtdblk->cached_buf[buf_num].written_mask = 0ULL;
+					mtdblk->cached_buf[buf_num].cache_state = STATE_EMPTY;
+					mtdblk->cached_buf[buf_num].logic_page = INVALID_PAGE_NUMBER_32;
+					mtdblk->cached_buf[buf_num].last_touch = jiffies;
+					mutex_unlock(&(mtdblk->buf_lock[buf_num]));
+
+
+
+					if(new_temp_buf_wmask != mtdblk->cache_fullmask)
+					{
+
+						/* not all sectors here are new
+						* do merge with flash
+						* and write to new location
+						*/
+
+						map_table_lock(bumped_lpn);
+						phy_page_offs = map_table[bumped_lpn];
+
+						map_table_unlock(bumped_lpn);
+
+						lftl_assert(!(phy_page_offs  >= mtdblk->num_total_pages));
+
+						lftl_assert(!(bumped_lpn  >= mtdblk->num_total_pages));
+						lftl_assert(!(phy_page_offs  >= mtdblk->num_total_pages));
+
+
+						rd_buf = get_spare_buf();
+						if (!rd_buf)
+						{
+							printk(KERN_INFO "myftl: vmalloc fail");
+							BUG();
+
+						}
+
+						oob_buf = get_spare_oobbuf();
+						if (!oob_buf)
+						{
+							printk(KERN_INFO "myftl: vmalloc fail");
+							BUG();
+						}
+
+
+						ops.mode = MTD_OOB_AUTO;
+						ops.datbuf = rd_buf;
+						ops.len = mtd->writesize;
+						ops.oobbuf = oob_buf;
+						ops.ooboffs = 0;
+						ops.ooblen = mtd->oobsize;
+
+
+						res = mtd->read_oob(mtd,phy_page_offs<<mtdblk->pageshift, &ops);
+						if(ops.retlen < mtd->writesize)
+						{
+							printk(KERN_ERR "myftl: merge_with_flash read failure");
+							return -1;
+						}
+
+
+						mask = 1;
+						size_copied = 0;
+						sect_idx = 0;
+
+						while(size_copied < mtdblk->cache_size)
+						{
+							if(((mask) & (new_temp_buf_wmask)) == 0)
+							{
+
+								memcpy(new_temp_buf
+sect_idx*mtdblk->blksize,rd_buf+sect_idx*mtdblk->blksize,mtdblk->blksize);
+
+							}
+							mask = mask <<1;
+							sect_idx++;
+							size_copied += mtdblk->blksize;
+
+						}
+						put_spare_buf(rd_buf);
+						put_spare_oobbuf(oob_buf);
+
+					}
+the_write_part:
+					;
+					int tried = 0; phy_addr = INVALID_PAGE_NUMBER;
+					while(tried < (numpllbanks*2) && phy_addr == INVALID_PAGE_NUMBER)
+					{
+						phy_addr = get_ppage(mtdblk,RAND_SEL,0);
+						tried++;
+					}
+		
+		
+					lftl_assert(!(phy_addr  >= mtdblk->num_total_pages));
+	
+
+
+				
+				
+			
+					page_shift = mtdblk->pageshift;
+					banknum = phy_addr/(mtdblk->pages_per_blk*mtdblk->hwblks_per_bank);
+					new_oob_buf = get_spare_oobbuf();
+			
+					if (!new_oob_buf)
+					{
+						printk(KERN_INFO "myftl deinit: vmalloc fail");
+						BUG();
+					}
+					oobdata = &oobvalues;
+					atomic_inc(&mtdblk->seq_num);
+					oobdata->seq_number = mtdblk->seq_num.counter;
+					oobdata->logic_page_num = bumped_lpn;
+					oobdata->blk_type = DATA_BLK;
+					memcpy(new_oob_buf,oobdata,sizeof(*oobdata));
+
+					if(mtdblk->activity_matrix.gc_goingon[banknum].counter == 1)
+					{
+							atomic_inc(&gc_on_writes_collisions);
+					}
+			
+			
+					ops.mode = MTD_OOB_AUTO;
+					ops.ooblen = mtd->oobsize;
+					ops.len = mtd->writesize;
+					ops.retlen = 0;
+					ops.oobretlen = 0;
+					ops.ooboffs = 0;
+					ops.datbuf = new_temp_buf;
+					ops.oobbuf = new_oob_buf;
+					retval = 1;
+			
+					retval = mtd->write_oob(mtd,(phy_addr<<page_shift), &ops);
+				
+					if(ops.retlen != mtd->writesize)
+					{
+						printk("myftl: mtd write %llx  %ld %d %d fail",
+											phy_addr<<page_shift,
+											phy_addr,sizeof(*oobdata),ops.retlen);
+						BUG();
+			
+					}
+			
+			
+					lftl_assert(!(bumped_lpn  >= mtdblk->num_total_pages));
+					old_phy_page_offs = map_table[bumped_lpn];
+			
+					{
+			
+						lftl_assert(!(old_phy_page_offs  >= mtdblk->num_total_pages));
+			
+						oldblkno = old_phy_page_offs/(mtdblk->pages_per_blk);
+						page_in_blk = old_phy_page_offs%(mtdblk->pages_per_blk);
+						lftl_assert(!(oldblkno >= mtdblk->num_blks));
+						lftl_assert(!(page_in_blk >= MAX_PAGES_PER_BLK));
+			
+						bank_num = oldblkno/mtdblk->hwblks_per_bank;
+			
+			
+						test_and_clear_bit(page_in_blk,blk_info[oldblkno].valid_pages_map);
+						atomic_dec(&blk_info[oldblkno].num_valid_pages);
+						atomic_inc(&bank_info[bank_num].perbank_ndirty_pages);
+					}
+
+
+modifymaptab:
+	
+					map_table_lock(bumped_lpn);
+					map_table[bumped_lpn] =  phy_addr;
+					map_table_unlock(bumped_lpn);
+					lftl_assert(!(phy_addr  >= mtdblk->num_total_pages));
+					newblkno = phy_addr/(mtdblk->pages_per_blk);
+					page_in_blk = phy_addr%(mtdblk->pages_per_blk);
+					lftl_assert(!(page_in_blk >= MAX_PAGES_PER_BLK));
+					lftl_assert(!(newblkno >= mtdblk->num_blks));
+					test_and_set_bit(page_in_blk,blk_info[newblkno].valid_pages_map);
+					atomic_inc(&blk_info[newblkno].num_valid_pages);
+					put_spare_buf(new_temp_buf);
+					put_spare_oobbuf(new_oob_buf);
+					banknum = phy_addr/(mtdblk->pages_per_blk*mtdblk->hwblks_per_bank);
+					atomic_dec(&mtdblk->activity_matrix.num_writes[banknum]);
+					DEBUG(MTD_DEBUG_LEVEL2,"lftl: %x: [%d]num_wr-- = %d",
+					   current->pid,banknum,
+					   mtdblk->activity_matrix.num_writes[banknum].counter);
+
+
+
+					/* now add to the empty buffers */
+					node = kmem_cache_alloc(qnode_cache, GFP_KERNEL);
+					if (!node)
+					{
+						printk(KERN_INFO "lftl: wbuf_flushthread kmem_cache_alloc fail \n");
+						BUG();
+					}
+					node->value = buf_num;
+					lfq_node_init_rcu(&node->list);
+					rcu_read_lock();
+					lockfree_enqueue(&empty_bufsq, &node->list);
+					rcu_read_unlock();
+					printk(KERN_INFO "thrdenq E buf  %d",buf_num);
+				}
+		
+			}
+
+		}
+		wait_jiffies = msecs_to_jiffies(BUF_HOLDTIME);
+		schedule_timeout(wait_jiffies);
+	}
+
+}
+
+
+
+static int init_lftl(struct lftl_blktrans_dev *mbd)
+{
+
+	int i;
+
+	struct cache_num_node *node;
+
+	int *arr;
+	uint32_t map_table_size,blk_info_size,free_map_size,bank_info_size;
+
+	uint32_t num_blks_req;
+
+	uint64_t intermed_mask;
+	uint64_t mask;
+	int num_bits;
+	int numpages;
+	int sizeinbytes;
+
+	uint32_t num_map_table_pages;
+	uint32_t num_blk_info_pages ;
+	uint32_t num_freemap_pages ;
+	uint32_t num_bankinfo_pages ;
+	uint32_t flash_page_size;
+	uint32_t total_ckpt_pages;
+	int ckpt_not_found;
+	int num_map_table_entries;
+	int bank_count;  int j =0;
+	struct lftlblk_dev *mtdblk = container_of(mbd, struct lftlblk_dev, mbd);
+
+
+
+	
+	mtdblk->init_not_done = 1;
+
+	mtdblk->cache_size = mbd->mtd->writesize;
+	mtdblk->num_parallel_banks =  numpllbanks;
+	mtdblk->hwblks_per_bank = 4096;
+
+	mtdblk->num_blks = ((mbd->size)<<(mtdblk->blkshift))/(mbd->mtd->erasesize);
+	mtdblk->blks_per_bank = mtdblk->num_blks/mtdblk->num_parallel_banks;
+	mtdblk->pages_per_blk = mbd->mtd->erasesize/mbd->mtd->writesize;
+
+	mtdblk->num_total_pages = mtdblk->blks_per_bank*mtdblk->pages_per_blk;
+	
+	
+	/* 10% of blocks are reserved */
+	mtdblk->reserved_blks_per_bank = (10*mtdblk->blks_per_bank)/100;
+
+	/* currently supported on 64 bit machines, have to change this*/
+	if(sizeof(long unsigned int) != 8)
+	{
+		printk(KERN_INFO "written mask size is wrong");
+		return -1;
+	}
+
+
+
+	/* allocated the main map table */
+	/* the map table is of size 128MB in our case */
+	
+	numpages = (mtdblk->pages_per_blk*mtdblk->num_blks);
+	/* each map table entry is 8 bytes */
+	int size = numpages*sizeof(uint64_t);
+	unsigned long order;
+
+
+	map_table = vmalloc(size);
+	if (!map_table)
+	{
+		printk(KERN_INFO "lftl: kzalloc map_table error");
+		BUG();
+	}
+
+
+
+	/* bitmap initialisations */
+	sizeinbytes =  (numpages/BITS_PER_BYTE);
+	order = get_order(sizeinbytes);
+	printk(KERN_INFO "lftl: page_bitmap alloc 2^%lu bytes", order);
+	printk(KERN_INFO "lftl: page_bitmap %d %d
%d",sizeinbytes,sizeinbytes/1024,sizeinbytes/(1024*1024));
+	page_bitmap = (unsigned long *)kzalloc(sizeinbytes, GFP_KERNEL);
+	if (!page_bitmap)
+	{
+		printk(KERN_INFO "lftl: kzalloc page_bitmap error");
+		BUG();
+	}
+	printk(KERN_INFO "lftl: page_incache_bitmap alloc 2^%lu bytes", order);
+	printk(KERN_INFO "lftl: page_incache_bitmap %d %d
%d",sizeinbytes,sizeinbytes/1024,sizeinbytes/(1024*1024));
+	page_incache_bitmap  = (unsigned long *)kzalloc(sizeinbytes, GFP_KERNEL);
+
+	if (!page_incache_bitmap)
+	{
+		printk(KERN_INFO "lftl: kzalloc page_incache_bitmap error");
+		BUG();
+	}
+	printk(KERN_INFO " lftl: maptab_bitmap alloc 2^%lu bytes", order);
+	printk(KERN_INFO "lftl: maptab_bitmap %d %d
%d",sizeinbytes,sizeinbytes/1024,sizeinbytes/(1024*1024));
+	maptab_bitmap =   (unsigned long *)kzalloc(sizeinbytes, GFP_KERNEL);
+
+	if (!maptab_bitmap)
+	{
+		printk(KERN_ERR "lftl:init_ftl  kzalloc maptab_bitmap error");
+		BUG();
+	}
+
+	sizeinbytes = (mtdblk->num_blks/BITS_PER_BYTE);
+	printk(KERN_INFO "lftl: init_ftl  gc_map %d %d
%d",sizeinbytes,sizeinbytes/1024,sizeinbytes/(1024*1024));
+	
+	/* kmalloc can only allocate 128 K
+	 * so max 1,048,576 blks
+	 * more than that kmalloc fails*/
+	gc_map  = (unsigned long *)kzalloc((mtdblk->num_blks/BITS_PER_BYTE),
GFP_KERNEL);
+	if (!gc_map)
+	{
+		printk(KERN_ERR "lftl: init_ftl  kzalloc gc_map error");
+		BUG();
+	}
+
+	sizeinbytes = (numpllbanks/BITS_PER_BYTE);
+	printk(KERN_INFO "lftl: gc_bankbitmap %d %d
%d",sizeinbytes,sizeinbytes/1024,sizeinbytes/(1024*1024));
+	gc_bankbitmap  = (unsigned long
*)kzalloc((numpllbanks/BITS_PER_BYTE), GFP_KERNEL);
+	if (!gc_bankbitmap)
+	{
+		printk(KERN_ERR "lftl: init_ftl  kzalloc gc_bankbitmap error");
+		BUG();
+	}
+
+	sizeinbytes = (numpllbanks/BITS_PER_BYTE);
+	printk(KERN_INFO "lftl: gc_active_map %d %d
%d",sizeinbytes,sizeinbytes/1024,sizeinbytes/(1024*1024));
+	mtdblk->gc_active_map = (unsigned long
*)kzalloc((numpllbanks/BITS_PER_BYTE), GFP_KERNEL);
+	if (!mtdblk->gc_active_map)
+	{
+		printk(KERN_ERR "lftl: init_ftl  kzalloc gc_active_map error");
+		BUG();
+	}
+
+
+	blk_info = (struct per_blk_info
*)kzalloc(mtdblk->num_blks*sizeof(struct per_blk_info), GFP_KERNEL);
+
+	if(blk_info == NULL)
+	{
+		printk(KERN_ERR "lftl: init_ftl kzalloc	blk_info error");
+		BUG();
+	}
+
+
+
+	for(i = 0; i < MAX_FTL_CACHEBUFS;i++)
+	{
+
+		mutex_init(&mtdblk->buf_lock[i]);
+		mtdblk->cached_buf[i].cache_state =  STATE_EMPTY;
+		mtdblk->cached_buf[i].written_mask = 0ULL;
+		mtdblk->cached_buf[i].logic_page = INVALID_PAGE_NUMBER;
+		mtdblk->cached_buf[i].last_touch = jiffies;
+		atomic_set( &mtdblk->cached_buf[i].writes_in_progress, 0 );
+		atomic_set( &mtdblk->cached_buf[i].flush_in_progress, 0 );
+		atomic_set( &mtdblk->cached_buf[i].wait_to_flush, 0 );
+	}
+	mutex_init(&mtdblk->select_buf_lock);
+	mutex_init(&mtdblk->flush_buf_lock);
+	mutex_init(&mtdblk->exper_buf_lock);
+	mtdblk->exper_buf = vmalloc(mtdblk->cache_size);
+	if(mtdblk->exper_buf == NULL)
+	{
+		printk(KERN_ERR "lftl: vmalloc exper_buf fail");
+		BUG();
+	}
+	mtdblk->exper_buf_sect_idx = 0;
+
+
+	/* free map lock for every bank
+	 * first allocated a array of rwsem pointers
+	 * and then the rwsemaphores
+	 */
+	mtdblk->free_map_lock = kmalloc(((sizeof(struct rw_semaphore*)) *
(numpllbanks)),GFP_ATOMIC);
+	if(mtdblk->free_map_lock == NULL)
+	{
+		printk(KERN_ERR "lftl: free map alloc error");
+		BUG();
+	}
+	for(i = 0; i < numpllbanks;i++)
+	{
+		mtdblk->free_map_lock[i] = kmalloc(sizeof(struct rw_semaphore),GFP_ATOMIC);
+		if(mtdblk->free_map_lock[i] == NULL)
+		{
+			printk(KERN_ERR "lftl: not able to alloc");
+		}
+
+		init_rwsem((mtdblk->free_map_lock[i]));
+	}
+	init_rwsem(&map_tabl_lock);
+
+
+
+
+	mtdblk->pageshift = ffs(mbd->mtd->writesize)-1;
+	atomic_set(&mtdblk->freeblk_count,mtdblk->num_blks);
+
+	/*init_cur_wr info initialisation*/
+	mtdblk->num_cur_wr_blks = mtdblk->num_parallel_banks;
+
+	if(mtdblk->num_cur_wr_blks > MAX_FTL_CACHEBUFS){
+		printk(KERN_ERR "lftl: num_cur_wr_blks > MAX_FTL_CACHEBUFS");
+		BUG();
+	}
+
+	for(i = 0; i < mtdblk->num_cur_wr_blks;i++)
+	{
+
+		init_rwsem(&(mtdblk->cur_wr_state[i]));
+		mtdblk->cur_writing[i].first_blk = i*mtdblk->blks_per_bank;
+		mtdblk->cur_writing[i].last_blk = mtdblk->cur_writing[i].first_blk
+ mtdblk->blks_per_bank -1;
+		mtdblk->cur_writing[i].last_gc_blk = mtdblk->cur_writing[i].first_blk;
+		mtdblk->cur_writing[i].blk = -1;
+		mtdblk->cur_writing[i].last_wrpage = -1;
+		mtdblk->cur_writing[i].centroid = -1;
+		mtdblk->cur_writing[i].state = STATE_CLEAN;
+
+	}
+
+
+
+
+	qnode_cache = kmem_cache_create("qnode_slab",
+			sizeof(struct cache_num_node), 0,
+			       SLAB_PANIC | SLAB_DESTROY_BY_RCU, NULL);
+
+	if (!qnode_cache)
+	{
+		printk(KERN_ERR "lftl: kmemcachealloc fail");
+		BUG();
+	}
+
+
+	for(i = 0; i < MAX_FTL_CACHEBUFS; i++)
+	{
+		buf_lookup_tab[i] = INVALID_PAGE_NUMBER;
+	}
+	mutex_init(&mtdblk->buf_lookup_tab_mutex);
+
+
+	lfq_init_rcu(&empty_bufsq, call_rcu);
+	lfq_init_rcu(&full_bufsq, call_rcu);
+
+
+	for(i = 0; i < MAX_FTL_CACHEBUFS;i++)
+	{
+		node = kmem_cache_alloc(qnode_cache, GFP_KERNEL);
+		if (!node)
+		{
+			printk(KERN_INFO "lftl: kmem_cache_alloc fail \n");
+			BUG();
+		}
+		node->value = i;
+		lfq_node_init_rcu(&node->list);
+		rcu_read_lock();
+		lockfree_enqueue(&empty_bufsq, &node->list);
+		rcu_read_unlock();
+	}
+
+	/* garbage collection initialisation*/
+	atomic_set(&mtdblk->seq_num ,0);
+	/* level0 GC: freeblks is half */
+	mtdblk->gc_thresh[0] = 0;
+	/* level1 GC: freeblks is quarter */
+	mtdblk->gc_thresh[1] = mtdblk->pages_per_blk/8;
+	/* level2 GC freeblks is 1/8th*/
+	mtdblk->gc_thresh[2] = mtdblk->pages_per_blk/4;
+
+
+
+	/* activity matrix initialisation*/
+	for(i = 0; i < numpllbanks;i++)
+	{
+		atomic_set(&mtdblk->activity_matrix.num_reads[i],0);
+		atomic_set(&mtdblk->activity_matrix.num_writes[i],0);
+		atomic_set(&mtdblk->activity_matrix.gc_goingon[i],0);
+		atomic_set(&mtdblk->activity_matrix.num_reads_pref[i],0);
+
+	}
+
+
+	lfq_init_rcu(&spare_bufQ, call_rcu);
+	lfq_init_rcu(&spare_oobbufQ, call_rcu);
+	for(i = 0; i < 2*MAX_FTL_CACHEBUFS ;i++)
+	{
+		spare_cache_list_ptr[i] = vmalloc(mbd->mtd->writesize);
+		if(spare_cache_list_ptr[i] == NULL)
+		{
+			printk(KERN_ERR "lftl: sparebufs init fail");
+			BUG();
+		}
+		put_spare_buf(spare_cache_list_ptr[i]);
+	}
+
+	mtdblk->FFbuf = vmalloc(mbd->mtd->writesize);
+
+	if(mtdblk->FFbuf == NULL)
+	{
+		printk(KERN_ERR "lftl: sparebufs init fail");
+		BUG();
+	}
+	memset(mtdblk->FFbuf,0xFF,mbd->mtd->writesize);
+
+	for(i = 0; i < 2*MAX_FTL_CACHEBUFS ;i++)
+	{
+		spare_oobbuf_list_ptr[i] = vmalloc(mbd->mtd->oobsize);
+		if(spare_oobbuf_list_ptr[i] == NULL)
+		{
+			printk(KERN_ERR "lftl: sparebufs init fail");
+			BUG();
+		}
+		put_spare_oobbuf(spare_oobbuf_list_ptr[i]);
+	}
+
+
+	for(i = 0; i < MAX_FTL_CACHEBUFS;i++)
+	{
+		mtdblk->buf[i] = get_spare_buf();
+	}
+
+	mtdblk->free_blk_map = (unsigned long
*)kzalloc((mtdblk->num_blks/BITS_PER_BYTE), GFP_ATOMIC);
+	if (!mtdblk->free_blk_map)
+	{
+		printk(KERN_ERR "lftl: kzalloc free_blkmap error");
+		BUG();
+	}
+
+	map_table_size = mtdblk->pages_per_blk * mtdblk->num_blks * sizeof(uint32_t);
+	blk_info_size = mtdblk->num_blks * sizeof(struct per_blk_info);
+	bank_info_size = mtdblk->num_parallel_banks * sizeof(struct per_bank_info);
+	free_map_size = mtdblk->num_blks/8;
+
+
+
+	flash_page_size = mbd->mtd->writesize;
+
+	num_map_table_pages = (map_table_size/flash_page_size)
+((map_table_size)%(flash_page_size) ? 1 : 0);
+	num_blk_info_pages =
(blk_info_size/flash_page_size)+((blk_info_size)%(flash_page_size) ? 1
: 0);
+	num_freemap_pages = (free_map_size/flash_page_size)
+((free_map_size)%(flash_page_size) ? 1 : 0);
+	num_bankinfo_pages =
(bank_info_size/flash_page_size)+((bank_info_size)%(flash_page_size) ?
1 : 0);
+
+	total_ckpt_pages =
num_map_table_pages+num_blk_info_pages+num_freemap_pages+num_bankinfo_pages;
+	num_blks_req =
total_ckpt_pages/mtdblk->pages_per_blk+((total_ckpt_pages)%(mtdblk->pages_per_blk)
? 1 : 0);
+
+
+	printk(KERN_INFO "lftl: init ftl maptabpages = %d
%d",num_map_table_pages,num_map_table_pages/mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: init ftl blkinfopages = %d
%d",num_blk_info_pages,num_blk_info_pages/mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: init ftl freemapages = %d
%d",num_freemap_pages,num_freemap_pages/mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: init ftl bankinfopages = %d
%d",num_bankinfo_pages,num_bankinfo_pages/mtdblk->pages_per_blk);
+
+
+	printk(KERN_INFO "init ftl numblksreq = %d",num_blks_req);
+
+
+	/* assume ckpt not found now.*/
+	ckpt_not_found = 1;
+
+	if(first_time == 0)
+	{
+
+		arr = vmalloc(num_blks_req*(sizeof(int)));
+		if(arr == NULL)
+		{
+			printk(KERN_ERR "lftl: init_ftl vmalloc fail");
+			BUG();
+		}
+		for(i = 0;i < num_blks_req;i++)
+		{
+			arr[i] = -1;
+		}
+
+		extra_info = kmalloc(sizeof(struct extra_info_struct), GFP_KERNEL);
+		if(extra_info == NULL)
+		{
+			printk(KERN_INFO "lftl: init_ftl vmalloc fail");
+			BUG();
+		}
+		bounded_pll_blk_scan(mtdblk,arr);
+
+
+
+		/* we have done the scan ; probably we have found the ckpt*/
+		ckpt_not_found = 0;
+		for(i = 0;i < num_blks_req;i++)
+		{
+			if(arr[i] == -1)
+			{
+				ckpt_not_found = 1;
+				break;
+			}
+			else
+			{
+				/* clear away this particular map block*/
+				atomic_set(&blk_info[i].num_valid_pages,0);
+				bitmap_zero((blk_info[i].valid_pages_map),64);
+				erase_blk(mtdblk,i);
+				blk_free(mtdblk,i);
+			}
+		}
+		vfree(arr);
+		kfree(extra_info);
+
+	}
+
+
+
+	if(first_time == 1 || ckpt_not_found == 1 )
+
+	{
+		if(first_time != 1 && ckpt_not_found == 1)
+		{
+			parallel_page_scan(mtdblk);
+		}
+
+		num_map_table_entries = mtdblk->pages_per_blk * mtdblk->num_blks;
+
+		/*reinitialise*/
+		printk(KERN_INFO "ckpt  not found and pagescan done");
+
+		for(i = 0; i < num_map_table_entries/numpllbanks; i++)
+		{
+			for(bank_count = 0; bank_count < numpllbanks;bank_count++)
+			{
+				map_table[j] = i+bank_count*(mtdblk->blks_per_bank*mtdblk->pages_per_blk);
+				if(map_table[j] > num_map_table_entries)
+				{
+					printk(KERN_INFO "maptable wrong %llu %d %d",map_table[j],i,bank_count);
+				}
+				j++;
+			}
+		}
+		printk(KERN_INFO "%d entries init %d",j,num_map_table_entries);
+		/* blk info initialisation */
+		for(i = 0; i < mtdblk->num_blks;i++)
+		{
+
+			/* the value here should be INVALID */
+			atomic_set(&blk_info[i].num_valid_pages,0);
+
+			bitmap_zero((blk_info[i].valid_pages_map),64);
+
+		}
+		/* bank info initialisation */
+		for(i = 0; i < numpllbanks ;i++)
+		{
+			atomic_set(&bank_info[i].perbank_nfree_blks,mtdblk->blks_per_bank);
+			atomic_set(&bank_info[i].perbank_ndirty_pages,0);
+
+		}
+
+
+
+
+
+	}
+
+	/* some statistics about garbage collection */
+	atomic_set(&num_gcollected,0);
+	atomic_set(&num_gc_threads,0);
+
+	atomic_set(&gc_on_writes_collisions,0);
+	atomic_set(&num_gc_wakeups,0);
+
+	atomic_set(&num_l0_gcollected,0);
+	atomic_set(&num_l1_gcollected,0);
+	atomic_set(&num_l2_gcollected,0);
+	atomic_set(&num_erase_gcollected,0);
+	atomic_set(&num_cperase_gcollected,0);
+
+
+
+	atomic_set(&activenumgcthread,NUM_GC_THREAD);
+
+	for(i =	0; i < NUM_GC_THREAD;i++)
+	{
+		mtdblk->gcthrd_arg[i].mtdblk_ptr = mtdblk;
+		mtdblk->gcthrd_arg[i].thrdnum = i;
+
+		mtdblk->ftlgc_thrd[i]  = kthread_run(check_and_dogc_thrd,
&(mtdblk->gcthrd_arg[i]), "gcthrd");
+
+		if (IS_ERR(mtdblk->ftlgc_thrd[i])) {
+			PTR_ERR(mtdblk->ftlgc_thrd[i]);
+			BUG();
+		}
+	}
+
+
+
+	scheduled_for_gc[0] = -1;
+	scheduled_for_gc[1] = -1;
+
+
+	/* Asynch buf flushing */
+
+	mtdblk->bufflushd  = kthread_run(wbuf_flush_thread, (mtdblk),	"wbufflushdmn");
+
+	if (IS_ERR(mtdblk->bufflushd)) {
+		PTR_ERR(mtdblk->bufflushd);
+		BUG();
+	}
+
+
+	num_bits = mtdblk->cache_size/mtdblk->blksize;
+
+	printk(KERN_INFO "lftl: numbits = %d", num_bits);
+	/*mask = ~((-1)UL)<<num_bits*/
+	if(num_bits == 64)
+	{
+		mask = -1ULL;
+	}
+	else if(num_bits < 64)
+	{
+		intermed_mask = -1ULL;
+		for(i = 0;i < num_bits;i++)
+			intermed_mask = intermed_mask <<1;
+		mask = ~intermed_mask;
+	}
+	else
+	{
+		printk(KERN_ERR "lftl: cachesize blksize not supported");
+		BUG();
+	}
+
+	mtdblk->cache_fullmask = mask;
+	printk(KERN_INFO "lftl: mask = %llx, cachefullmask = %llx",
mask,mtdblk->cache_fullmask);
+	mtdblk->last_wr_time =0;
+	mtdblk->init_not_done = 0;
+	return 0;
+}
+
+
+int deinit_lftl(struct lftl_blktrans_dev *mbd)
+{
+	int i;
+	struct mtd_info *mtd;
+	int numpages;
+	unsigned long order;
+	int sizeinbytes;
+	struct lfq_node_rcu *qnode;
+	struct cache_num_node *node;
+
+	struct lftlblk_dev *mtdblk = container_of(mbd, struct lftlblk_dev, mbd);
+
+	printk(KERN_INFO "lftl: deinit_lftl\n");
+
+	mtd = mtdblk->mbd.mtd;
+	
+	/* checkpoint: write all the
+	 * important lftl structures
+	 * to flash
+	 */
+	
+	wr_ckpt_chained(mtdblk);
+
+	/* free bitmaps */
+	/* page_bitmap, page_incache_bitmap, maptab_bitmap*/
+
+	numpages = (mtdblk->pages_per_blk*mtdblk->num_blks);
+
+
+	sizeinbytes =  (numpages/BITS_PER_BYTE);
+	order = get_order(sizeinbytes);
+
+	/* bitmaps kmallocd*/
+	kfree(page_bitmap);
+	kfree(page_incache_bitmap);
+	kfree(maptab_bitmap);
+	kfree(gc_map);
+	kfree(gc_bankbitmap);
+	kfree(mtdblk->gc_active_map);
+
+	/* array of semaphore pointers, dealloc in 2 steps */
+	for(i = 0; i < numpllbanks;i++)
+		kfree(mtdblk->free_map_lock[i]);
+	kfree(mtdblk->free_map_lock);
+	kfree(mtdblk->free_blk_map);
+
+	/* free buffers */
+	vfree(mtdblk->exper_buf);
+
+	for(i = 0; i < 2*MAX_FTL_CACHEBUFS;i++)
+	{
+
+		vfree(spare_cache_list_ptr[i]);
+
+	}
+	for(i = 0; i < 2*MAX_FTL_CACHEBUFS ;i++)
+	{
+		vfree(spare_oobbuf_list_ptr[i]);
+	}
+
+
+	vfree(mtdblk->FFbuf);
+
+	/* dequeue all the
+	 * bufindexes here
+	 */
+
+
+	do{
+		rcu_read_lock();
+		qnode = lockfree_dequeue(&full_bufsq);
+		node = container_of(qnode, struct cache_num_node, list);
+		rcu_read_unlock();
+		if(node != NULL){
+
+			call_rcu(&node->rcu, free_cache_num_node);
+		}
+	}while(node != NULL);
+
+	do{
+		rcu_read_lock();
+		qnode = lockfree_dequeue(&empty_bufsq);
+		node = container_of(qnode, struct cache_num_node, list);
+		rcu_read_unlock();
+		if(node != NULL){
+			call_rcu(&node->rcu, free_cache_num_node);
+		}
+	}while(node != NULL);
+
+	rcu_barrier();
+
+	kmem_cache_destroy(qnode_cache);
+
+	/* free map table */
+
+	vfree(map_table);
+	kthread_stop(mtdblk->bufflushd);
+	lfq_destroy_rcu(&empty_bufsq);
+	lfq_destroy_rcu(&full_bufsq);
+
+	return 0;
+}
+
+
+int lftlblock_open(struct lftl_blktrans_dev *mbd)
+{
+	struct lftlblk_dev *mtdblk = container_of(mbd, struct lftlblk_dev, mbd);
+
+	uint64_t temp;
+
+	printk(KERN_INFO "lftl: FTLblock_open\n");
+
+	mutex_lock(&mtdblks_lock);
+	if (mtdblk->count) {
+		mtdblk->count++;
+		mutex_unlock(&mtdblks_lock);
+		return 0;
+	}
+
+
+
+	mtdblk->count = 1;
+	if (!(mbd->mtd->flags & MTD_NO_ERASE)) {
+		mtdblk->cache_size = mbd->mtd->writesize;
+	}
+
+
+	mutex_unlock(&mtdblks_lock);
+
+	printk(KERN_INFO "=========lftl  open===========");
+	printk(KERN_INFO "lftl: FTL mbd size = %lu",mtdblk->mbd.size);
+	printk(KERN_INFO "lftl: FTL parallel banks = %d", mtdblk->num_parallel_banks);
+	printk(KERN_INFO "lftl: FTL number of blks = %d", mtdblk->num_blks);
+	printk(KERN_INFO "lftl: FTL blksperbank = %d",mtdblk->blks_per_bank);
+	printk(KERN_INFO "lftl: FTL pagesperblk = %d",mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: FTL mtdblksize = %d", mtdblk->blksize);
+	printk(KERN_INFO "lftl: FTL pagesize = %d",mbd->mtd->writesize);
+	printk(KERN_INFO "lftl: FTL oobsize = %d",mbd->mtd->oobsize);
+	printk(KERN_INFO "lftl: FTL flashblksize = %d",mbd->mtd->erasesize);
+	printk(KERN_INFO "lftl: FTL cachesize = %d",mtdblk->cache_size);
+	printk(KERN_INFO "lftl: FTL pageshift = %d",mtdblk->pageshift);
+	printk(KERN_INFO "lftl: FTL blkshift = %d", mtdblk->blkshift);
+	printk(KERN_INFO "lftl: FTL num_cur_wr_blks = %d",mtdblk->num_cur_wr_blks);
+
+	temp = (((uint64_t)mtdblk->num_blks)*mtdblk->pages_per_blk*mbd->mtd->writesize);
+	temp = temp/512;
+
+	printk(KERN_INFO "lftl: FTL sectors 0 -> %lld",(temp));
+	printk(KERN_INFO "lftl: cache_fullmask = %llx",mtdblk->cache_fullmask);
+	printk(KERN_INFO "lftl: FTLblock_open ok\n");
+
+	return 0;
+}
+
+
+
+
+
+int lftlblock_release(struct lftl_blktrans_dev *mbd)
+{
+	struct lftlblk_dev *mtdblk = container_of(mbd, struct lftlblk_dev, mbd);
+
+	printk(KERN_INFO "lftl: lftlblock_release ");
+
+	mutex_lock(&mtdblks_lock);
+
+
+	flush_all_buffers(mtdblk);
+	if (!--mtdblk->count) {
+		if (mbd->mtd->sync)
+			mbd->mtd->sync(mbd->mtd);
+
+	}
+
+	mutex_unlock(&mtdblks_lock);
+
+	DEBUG(MTD_DEBUG_LEVEL1, "ok\n");
+
+	return 0;
+}
+
+int lftlblock_flush(struct lftl_blktrans_dev *dev)
+{
+	struct lftlblk_dev *mtdblk = container_of(dev, struct lftlblk_dev, mbd);
+
+	printk(KERN_INFO "lftl:  lftlblock_flush ");
+
+
+	flush_all_buffers(mtdblk);
+
+	if (dev->mtd->sync)
+		dev->mtd->sync(dev->mtd);
+	return 0;
+}
+
+
+void lftlblock_add_mtd(struct lftl_blktrans_ops *tr, struct mtd_info *mtd)
+{
+	struct lftlblk_dev *dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	unsigned num_tabl_sects;
+	uint64_t temp;
+
+	printk(KERN_ERR "lftl: lftlblock_add_mtd ");
+
+
+	if (!dev)
+		return;
+
+	dev->mbd.mtd = mtd;
+	dev->mbd.devnum = mtd->index;
+
+
+	dev->mbd.tr = tr;
+	dev->blksize = tr->blksize;
+	dev->blkshift = ffs(dev->blksize) - 1;
+
+
+	/* 8 bytes per table entry*/
+
+	num_tabl_sects = 0;
+	dev->mbd.size = (mtd->size >>(dev->blkshift)) - num_tabl_sects;
+
+
+
+
+	printk(KERN_INFO "lftl: mbd size = %lu",dev->mbd.size);
+	if (!(mtd->flags & MTD_WRITEABLE))
+		dev->mbd.readonly = 1;
+
+	if(init_lftl(&(dev->mbd))!= 0)
+	{
+
+		printk(KERN_ERR "FTL init fail");
+		BUG();
+	}
+
+	if (add_lftl_blktrans_dev(&dev->mbd))
+		kfree(dev);
+
+
+
+	struct lftlblk_dev *mtdblk = dev;
+
+	printk(KERN_INFO "===lftl add mtd==");
+	printk(KERN_INFO "lftl: FTL mbd size = %lu",mtdblk->mbd.size);
+	printk(KERN_INFO "lftl: FTL parallel banks = %d", mtdblk->num_parallel_banks);
+	printk(KERN_INFO "lftl: FTL number of blks = %d", mtdblk->num_blks);
+	printk(KERN_INFO "lftl: FTL blksperbank = %d",mtdblk->blks_per_bank);
+	printk(KERN_INFO "lftl: FTL res_blksperbank =
%d",mtdblk->reserved_blks_per_bank);
+	printk(KERN_INFO "lftl: FTL pagesperblk = %d",mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: FTL mtdblksize = %d", mtdblk->blksize);
+	printk(KERN_INFO "lftl: FTL pagesize = %d",dev->mbd.mtd->writesize);
+	printk(KERN_INFO "lftl: FTL oobsize = %d",dev->mbd.mtd->oobsize);
+	printk(KERN_INFO "lftl: FTL flashblksize = %d",dev->mbd.mtd->erasesize);
+	printk(KERN_INFO "lftl: FTL cachesize = %d",mtdblk->cache_size);
+	printk(KERN_INFO "lftl: FTL pageshift = %d",mtdblk->pageshift);
+	printk(KERN_INFO "lftl: FTL blkshift = %d", mtdblk->blkshift);
+	printk(KERN_INFO "lftl: FTL num_cur_wr_blks = %d",mtdblk->num_cur_wr_blks);
+
+	temp = (((uint64_t)mtdblk->num_blks)*mtdblk->pages_per_blk*dev->mbd.mtd->writesize);
+	temp = temp/512;
+
+	printk(KERN_INFO "lftl: FTL sectors 0 -> %lld",(temp));
+	printk(KERN_INFO "lftl: cache_fullmask = %llx",mtdblk->cache_fullmask);
+}
+
+
+int lftl_pr_info(struct lftl_blktrans_dev *dev)
+{
+	int i;
+	struct lftlblk_dev *mtdblk = container_of(dev, struct lftlblk_dev, mbd);
+	struct mtd_info *mtd = mtdblk->mbd.mtd;
+	uint32_t total_occupiedblks =0;
+	uint32_t freeblks =0;
+
+	printk(KERN_INFO "===lftl GET INFO==");
+	printk(KERN_INFO "lftl: FTL mbd size = %lu",mtdblk->mbd.size);
+	printk(KERN_INFO "lftl: FTL parallel banks = %d", mtdblk->num_parallel_banks);
+	printk(KERN_INFO "lftl: FTL number of blks = %d", mtdblk->num_blks);
+	printk(KERN_INFO "lftl: FTL blksperbank = %d",mtdblk->blks_per_bank);
+	printk(KERN_INFO "lftl: FTL pagesperblk = %d",mtdblk->pages_per_blk);
+	printk(KERN_INFO "lftl: FTL mtdblksize = %d", mtdblk->blksize);
+	printk(KERN_INFO "lftl: FTL pagesize = %d",mtd->writesize);
+	printk(KERN_INFO "lftl: FTL oobsize = %d",mtd->oobsize);
+	printk(KERN_INFO "lftl: FTL flashblksize = %d",mtd->erasesize);
+	printk(KERN_INFO "lftl: FTL cachesize = %d",mtdblk->cache_size);
+	printk(KERN_INFO "lftl: FTL pageshift = %d",mtdblk->pageshift);
+	printk(KERN_INFO "lftl: FTL blkshift = %d", mtdblk->blkshift);
+	printk(KERN_INFO "lftl: FTL num_cur_wr_blks = %d",mtdblk->num_cur_wr_blks);
+
+	for(i = 0; i < mtdblk->num_cur_wr_blks;i++)
+	{
+		printk(KERN_INFO "FTL bank %d = %d %d
%d",i,mtdblk->cur_writing[i].first_blk,mtdblk->cur_writing[i].last_blk,bank_info[i].perbank_nfree_blks.counter);
+		freeblks += bank_info[i].perbank_nfree_blks.counter;
+	}
+
+
+	printk(KERN_INFO "lftl: num gcL0 calls = %d ",num_l0_gcollected.counter);
+	printk(KERN_INFO "lftl: num gcL1 calls = %d ",num_l1_gcollected.counter);
+	printk(KERN_INFO "lftl: num gcL2 calls = %d ",num_l2_gcollected.counter);
+
+
+	printk(KERN_INFO "lftl: num blks gc'd = %d ",num_gcollected.counter);
+	printk(KERN_INFO "lftl: num blks only er = %d ",num_erase_gcollected.counter);
+	printk(KERN_INFO "lftl: num blks  er andcp = %d
",num_cperase_gcollected.counter);
+
+	printk(KERN_INFO "lftl: numgc wakeups = %d",num_gc_wakeups.counter);
+
+	printk(KERN_INFO "lftl: number of writes with GC on = %d
",gc_on_writes_collisions.counter);
+
+
+
+	total_occupiedblks = mtdblk->num_blks - freeblks;
+
+	printk(KERN_INFO "lftl: num blks occupied = %u %u
%u",total_occupiedblks,mtdblk->num_blks,mtdblk->blks_per_bank);
+
+
+	return 0;
+
+}
+
+void lftlblock_remove_dev(struct lftl_blktrans_dev *dev)
+{
+	printk(KERN_INFO	"lftl: FTL deinit ");
+	if(deinit_lftl((dev))!= 0)
+	{
+
+		printk(KERN_ERR "lftl: FTL diinit fail");
+		BUG();
+	}
+
+	del_lftl_blktrans_dev(dev);
+
+}
+
+
+
+
+ struct lftl_blktrans_ops lftlblock_tr = {
+	.name		= "lftl",
+	.major		= 35,
+	.part_bits	= 0,
+	.blksize 	= 4096,
+	.open		= lftlblock_open,
+	.flush		= lftlblock_flush,
+	.release	= lftlblock_release,
+	.readsect	= lftlblock_readsect,
+	.get_blkinfo = lftl_pr_info,
+	.writesect	= lftlblock_writesect,
+	.add_mtd	= lftlblock_add_mtd,
+	.remove_dev	= lftlblock_remove_dev,
+	.owner		= THIS_MODULE,
+};
+
+
+static int __init init_lftlblock(void)
+{
+	mutex_init(&mtdblks_lock);
+
+	return register_lftl_blktrans(&lftlblock_tr);
+
+}
+
+
+static void __exit cleanup_lftlblock(void)
+{
+	deregister_lftl_blktrans(&lftlblock_tr);
+	lftl_blktrans_exit();
+
+}
+
+module_init(init_lftlblock);
+module_exit(cleanup_lftlblock);
+
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Srimugunthan");
+MODULE_DESCRIPTION("lftl: multithreaded Caching FTL");
+MODULE_ALIAS_BLOCKDEV_MAJOR(LFTL_MAJOR);
diff --git a/drivers/mtd/lftl.h b/drivers/mtd/lftl.h
new file mode 100644
index 0000000..8b5efcd
--- /dev/null
+++ b/drivers/mtd/lftl.h
@@ -0,0 +1,198 @@
+#ifndef LFTL_BLKTRANS_H
+#define LFTL_BLKTRANS_H
+
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/vmalloc.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mutex.h>
+#include <linux/rwsem.h>
+#include <linux/random.h>
+
+#include <linux/mutex.h>
+#include <linux/kref.h>
+#include <linux/sysfs.h>
+#include <linux/mempool.h>
+#include <asm/delay.h>
+#include <linux/syscalls.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/fcntl.h>
+#include <asm/uaccess.h>
+#include <linux/fs.h>
+#include <asm/segment.h>
+#include <asm/uaccess.h>
+#include <linux/buffer_head.h>
+#include <linux/time.h>
+#include <asm/msr.h>
+#include <linux/timex.h>
+#include <asm/timex.h>
+
+struct hd_geometry;
+struct mtd_info;
+struct lftl_blktrans_ops;
+struct file;
+struct inode;
+
+#define VIRGO_NUM_MAX_REQ_Q 64
+
+
+
+struct thread_arg_data
+{
+	int qno;
+	struct lftl_blktrans_dev *dev;
+};
+
+
+struct lftl_bio_list
+{
+	struct list_head qelem_ptr;
+	struct bio *bio;
+};
+
+struct list_lru {
+	spinlock_t              lock;
+	struct list_head        list;
+	long                    nr_items;
+};
+
+struct cache_buf_list
+{
+	struct list_head list;
+	int value;
+};
+
+
+struct cache_buf_list *list_lru_deqhd(struct list_lru *lru);
+
+struct cache_buf_list *list_lru_del(struct list_lru *lru,   struct
list_head *item);
+
+struct lftl_blktrans_dev {
+	struct lftl_blktrans_ops *tr;
+	struct list_head list;
+	struct mtd_info *mtd;
+	struct mutex lock;
+	int devnum;
+	unsigned long size;
+	int readonly;
+	int open;
+	struct kref ref;
+	struct gendisk *disk;
+	struct attribute_group *disk_attributes;
+	struct task_struct *thread[VIRGO_NUM_MAX_REQ_Q];
+	struct request_queue *rq;
+	spinlock_t queue_lock;
+	void *priv;
+	
+	
+
+	spinlock_t  mybioq_lock[VIRGO_NUM_MAX_REQ_Q];;
+	struct lftl_bio_list qu[VIRGO_NUM_MAX_REQ_Q];
+	struct thread_arg_data thrd_arg[VIRGO_NUM_MAX_REQ_Q];
+
+	DECLARE_BITMAP(active_iokthread,64);
+
+};
+
+struct lftl_blktrans_ops {
+	char *name;
+	int major;
+	int part_bits;
+	int blksize;
+	int blkshift;
+
+	/* Access functions */
+	int (*readsect)(struct lftl_blktrans_dev *dev,
+	      unsigned long block, char *buffer);
+	int (*writesect)(struct lftl_blktrans_dev *dev,
+	      unsigned long block, char *buffer);
+	int (*discard)(struct lftl_blktrans_dev *dev,
+	      unsigned long block, unsigned nr_blocks);
+
+	/* Block layer ioctls */
+	int (*getgeo)(struct lftl_blktrans_dev *dev, struct hd_geometry *geo);
+	int (*flush)(struct lftl_blktrans_dev *dev);
+	int (*get_blkinfo)(struct lftl_blktrans_dev *dev);
+	void (*bankinfo_filewr)(struct lftl_blktrans_dev *dev);
+	
+
+	/* Called with mtd_table_mutex held; no race with add/remove */
+	int (*open)(struct lftl_blktrans_dev *dev);
+	int (*release)(struct lftl_blktrans_dev *dev);
+
+	/* Called on {de,}registration and on subsequent addition/removal
+	of devices, with mtd_table_mutex held. */
+	void (*add_mtd)(struct lftl_blktrans_ops *tr, struct mtd_info *mtd);
+	void (*remove_dev)(struct lftl_blktrans_dev *dev);
+
+	struct list_head devs;
+	struct list_head list;
+	struct module *owner;
+};
+
+
+
+int add_lftl_blktrans_dev(struct lftl_blktrans_dev *new);
+int deregister_lftl_blktrans(struct lftl_blktrans_ops *tr);
+int register_lftl_blktrans(struct lftl_blktrans_ops *tr);
+int del_lftl_blktrans_dev(struct lftl_blktrans_dev *old);
+
+/* lock free queue specific */
+
+struct lfq_node_rcu {
+	struct lfq_node_rcu *next;
+	int dummy;
+
+};
+
+struct lfq_queue_rcu {
+	struct lfq_node_rcu *head, *tail;
+	void (*queue_call_rcu)(struct rcu_head *head,
+	       void (*func)(struct rcu_head *head));
+};
+
+
+struct lfq_node_rcu_dummy {
+	struct lfq_node_rcu parent;
+	struct rcu_head head;
+	struct lfq_queue_rcu *q;
+};
+
+
+
+struct cache_num_node {
+	struct lfq_node_rcu list;
+	struct rcu_head rcu;
+	int value;
+};
+
+ struct lfq_node_rcu *make_dummy(struct lfq_queue_rcu *q,
+				 struct lfq_node_rcu *next);
+ void free_dummy_cb(struct rcu_head *head);
+ void rcu_free_dummy(struct lfq_node_rcu *node);
+ void free_dummy(struct lfq_node_rcu *node);
+ void lfq_node_init_rcu(struct lfq_node_rcu *node);
+
+ void lfq_init_rcu(struct lfq_queue_rcu *q,
+		   void queue_call_rcu(struct rcu_head *head,
+				       void (*func)(struct rcu_head *head)));
+					
+ int lfq_destroy_rcu(struct lfq_queue_rcu *q);
+
+ void lockfree_enqueue(struct lfq_queue_rcu *q,
+		       struct lfq_node_rcu *node);
+			
+ void enqueue_dummy(struct lfq_queue_rcu *q);
+
+ struct lfq_node_rcu *lockfree_dequeue(struct lfq_queue_rcu *q);
+
+ void free_cache_num_node(struct rcu_head *head);
+
+#endif
+
