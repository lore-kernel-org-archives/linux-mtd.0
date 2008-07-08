Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KGC5r-0007CC-1c
	for linux-mtd@lists.infradead.org; Tue, 08 Jul 2008 12:14:53 +0000
Message-ID: <415519054.25707@cqu.edu.cn>
Subject: [UBI][WL][PATCH] Rewrite the UBI wear-leveling unit
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2008 20:14:19 +0800
Message-Id: <1215519259.2706.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem

I've commit my patch to the 'ubi-2.6.git'.
Have not you received it? 


commit a08148c87da6b49ecd41d84007eba7c4e0d17e33
Author: root <root@xxc.(none)>
Date:   Tue Jul 8 15:25:19 2008 +0800

        UBI: Wear Leveling unit improvement.
    
        Rewrite the UBI wear-leveling unit and Implemented
        two-dimension(PEB erase counter, LEB temperature)
        wear leveling algorithm.
    
        Signed-off-by: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 3f06310..f850900 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -16,8 +16,8 @@ config MTD_UBI
 
 config MTD_UBI_WL_THRESHOLD
        int "UBI wear-leveling threshold"
-       default 4096
-       range 2 65536
+       default 20
+       range 10 100
        depends on MTD_UBI
        help
          This parameter defines the maximum difference between the
highest
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 8dc488f..2a2ad33 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -957,8 +957,8 @@ write_error:
  *     because a bit-flip was detected at the target PEB);
  *   o %2 if the volume is being deleted and this LEB should not be
moved.
  */
-int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
-                    struct ubi_vid_hdr *vid_hdr)
+int ubi_eba_copy_leb(struct ubi_device *ubi, unsigned int from,
+                       unsigned int to, struct ubi_vid_hdr *vid_hdr)
 {
        int err, vol_id, lnum, data_size, aldata_size, idx;
        struct ubi_volume *vol;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 940f6b7..dc5cea7 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -37,6 +37,8 @@
commit a08148c87da6b49ecd41d84007eba7c4e0d17e33
Author: root <root@xxc.(none)>
Date:   Tue Jul 8 15:25:19 2008 +0800

        UBI: Wear Leveling unit improvement.
    
        Rewrite the UBI wear-leveling unit and Implemented
        two-dimension(PEB erase counter, LEB temperature)
        wear leveling algorithm.
    
        Signed-off-by: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 3f06310..f850900 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -16,8 +16,8 @@ config MTD_UBI
 
 config MTD_UBI_WL_THRESHOLD
        int "UBI wear-leveling threshold"
-       default 4096
-       range 2 65536
+       default 20
+       range 10 100
        depends on MTD_UBI
        help
          This parameter defines the maximum difference between the
highest
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 8dc488f..2a2ad33 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -957,8 +957,8 @@ write_error:
  *     because a bit-flip was detected at the target PEB);
  *   o %2 if the volume is being deleted and this LEB should not be
moved.
commit a08148c87da6b49ecd41d84007eba7c4e0d17e33
Author: root <root@xxc.(none)>
Date:   Tue Jul 8 15:25:19 2008 +0800

        UBI: Wear Leveling unit improvement.
    
        Rewrite the UBI wear-leveling unit and Implemented
        two-dimension(PEB erase counter, LEB temperature)
        wear leveling algorithm.
    
        Signed-off-by: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 3f06310..f850900 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -16,8 +16,8 @@ config MTD_UBI
 
 config MTD_UBI_WL_THRESHOLD
        int "UBI wear-leveling threshold"
-       default 4096
-       range 2 65536
+       default 20
+       range 10 100
        depends on MTD_UBI
        help
          This parameter defines the maximum difference between the
highest
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 8dc488f..2a2ad33 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -957,8 +957,8 @@ write_error:
  *     because a bit-flip was detected at the target PEB);
  *   o %2 if the volume is being deleted and this LEB should not be
moved.
  */
commit a08148c87da6b49ecd41d84007eba7c4e0d17e33
Author: root <root@xxc.(none)>
Date:   Tue Jul 8 15:25:19 2008 +0800

        UBI: Wear Leveling unit improvement.
    
        Rewrite the UBI wear-leveling unit and Implemented
        two-dimension(PEB erase counter, LEB temperature)
        wear leveling algorithm.
    
        Signed-off-by: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 3f06310..f850900 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -16,8 +16,8 @@ config MTD_UBI
 
 config MTD_UBI_WL_THRESHOLD
        int "UBI wear-leveling threshold"
-       default 4096
-       range 2 65536
+       default 20
+       range 10 100
        depends on MTD_UBI
        help
          This parameter defines the maximum difference between the
highest
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 8dc488f..2a2ad33 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -957,8 +957,8 @@ write_error:
  *     because a bit-flip was detected at the target PEB);
  *   o %2 if the volume is being deleted and this LEB should not be
moved.
  */
-int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
-                    struct ubi_vid_hdr *vid_hdr)
commit a08148c87da6b49ecd41d84007eba7c4e0d17e33
Author: root <root@xxc.(none)>
Date:   Tue Jul 8 15:25:19 2008 +0800

        UBI: Wear Leveling unit improvement.
    
        Rewrite the UBI wear-leveling unit and Implemented
        two-dimension(PEB erase counter, LEB temperature)
        wear leveling algorithm.
    
        Signed-off-by: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 3f06310..f850900 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -16,8 +16,8 @@ config MTD_UBI
 
 config MTD_UBI_WL_THRESHOLD
        int "UBI wear-leveling threshold"
-       default 4096
-       range 2 65536
+       default 20
+       range 10 100
        depends on MTD_UBI
        help
          This parameter defines the maximum difference between the
highest
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 8dc488f..2a2ad33 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -957,8 +957,8 @@ write_error:
  *     because a bit-flip was detected at the target PEB);
  *   o %2 if the volume is being deleted and this LEB should not be
moved.
  */
-int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
-                    struct ubi_vid_hdr *vid_hdr)
+int ubi_eba_copy_leb(struct ubi_device *ubi, unsigned int from,
+                       unsigned int to, struct ubi_vid_hdr *vid_hdr)
 {
        int err, vol_id, lnum, data_size, aldata_size, idx;
commit a08148c87da6b49ecd41d84007eba7c4e0d17e33
Author: root <root@xxc.(none)>
Date:   Tue Jul 8 15:25:19 2008 +0800

        UBI: Wear Leveling unit improvement.
    
        Rewrite the UBI wear-leveling unit and Implemented
        two-dimension(PEB erase counter, LEB temperature)
        wear leveling algorithm.
    
        Signed-off-by: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 3f06310..f850900 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -16,8 +16,8 @@ config MTD_UBI
 
 config MTD_UBI_WL_THRESHOLD
        int "UBI wear-leveling threshold"
-       default 4096
-       range 2 65536
+       default 20
+       range 10 100
        depends on MTD_UBI
        help
          This parameter defines the maximum difference between the
highest
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 8dc488f..2a2ad33 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -957,8 +957,8 @@ write_error:
  *     because a bit-flip was detected at the target PEB);
  *   o %2 if the volume is being deleted and this LEB should not be
moved.
  */
-int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
-                    struct ubi_vid_hdr *vid_hdr)
+int ubi_eba_copy_leb(struct ubi_device *ubi, unsigned int from,
+                       unsigned int to, struct ubi_vid_hdr *vid_hdr)
 {
        int err, vol_id, lnum, data_size, aldata_size, idx;
        struct ubi_volume *vol;
commit a08148c87da6b49ecd41d84007eba7c4e0d17e33
Author: root <root@xxc.(none)>
Date:   Tue Jul 8 15:25:19 2008 +0800

        UBI: Wear Leveling unit improvement.
    
        Rewrite the UBI wear-leveling unit and Implemented
        two-dimension(PEB erase counter, LEB temperature)
        wear leveling algorithm.
    
        Signed-off-by: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 3f06310..f850900 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -16,8 +16,8 @@ config MTD_UBI
 
 config MTD_UBI_WL_THRESHOLD
        int "UBI wear-leveling threshold"
-       default 4096
-       range 2 65536
+       default 20
+       range 10 100
        depends on MTD_UBI
        help
          This parameter defines the maximum difference between the
highest
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 8dc488f..2a2ad33 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -957,8 +957,8 @@ write_error:
  *     because a bit-flip was detected at the target PEB);
  *   o %2 if the volume is being deleted and this LEB should not be
moved.
  */
-int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
-                    struct ubi_vid_hdr *vid_hdr)
+int ubi_eba_copy_leb(struct ubi_device *ubi, unsigned int from,
+                       unsigned int to, struct ubi_vid_hdr *vid_hdr)
 {
        int err, vol_id, lnum, data_size, aldata_size, idx;
        struct ubi_volume *vol;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
commit a08148c87da6b49ecd41d84007eba7c4e0d17e33
Author: root <root@xxc.(none)>
Date:   Tue Jul 8 15:25:19 2008 +0800

        UBI: Wear Leveling unit improvement.
    
        Rewrite the UBI wear-leveling unit and Implemented
        two-dimension(PEB erase counter, LEB temperature)
        wear leveling algorithm.
    
        Signed-off-by: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 3f06310..f850900 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -16,8 +16,8 @@ config MTD_UBI
 
 config MTD_UBI_WL_THRESHOLD
        int "UBI wear-leveling threshold"
-       default 4096
-       range 2 65536
+       default 20
+       range 10 100
        depends on MTD_UBI
        help
          This parameter defines the maximum difference between the
highest
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 8dc488f..2a2ad33 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -957,8 +957,8 @@ write_error:
  *     because a bit-flip was detected at the target PEB);
  *   o %2 if the volume is being deleted and this LEB should not be
moved.
  */
-int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
-                    struct ubi_vid_hdr *vid_hdr)
+int ubi_eba_copy_leb(struct ubi_device *ubi, unsigned int from,
+                       unsigned int to, struct ubi_vid_hdr *vid_hdr)
 {
        int err, vol_id, lnum, data_size, aldata_size, idx;
        struct ubi_volume *vol;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 940f6b7..dc5cea7 100644
commit a08148c87da6b49ecd41d84007eba7c4e0d17e33
Author: root <root@xxc.(none)>
Date:   Tue Jul 8 15:25:19 2008 +0800

        UBI: Wear Leveling unit improvement.
    
        Rewrite the UBI wear-leveling unit and Implemented
        two-dimension(PEB erase counter, LEB temperature)
        wear leveling algorithm.
    
        Signed-off-by: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 3f06310..f850900 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -16,8 +16,8 @@ config MTD_UBI
 
 config MTD_UBI_WL_THRESHOLD
        int "UBI wear-leveling threshold"
-       default 4096
-       range 2 65536
+       default 20
+       range 10 100
        depends on MTD_UBI
        help
          This parameter defines the maximum difference between the
highest
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 8dc488f..2a2ad33 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -957,8 +957,8 @@ write_error:
  *     because a bit-flip was detected at the target PEB);
  *   o %2 if the volume is being deleted and this LEB should not be
moved.
  */
-int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
-                    struct ubi_vid_hdr *vid_hdr)
+int ubi_eba_copy_leb(struct ubi_device *ubi, unsigned int from,
+                       unsigned int to, struct ubi_vid_hdr *vid_hdr)
 {
        int err, vol_id, lnum, data_size, aldata_size, idx;
        struct ubi_volume *vol;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 940f6b7..dc5cea7 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -37,6 +37,8 @@
 #include <linux/string.h>
 #include <linux/vmalloc.h>
 #include <linux/mtd/mtd.h>
+
+//#include <mtd/ubi-header.h>
 #include <linux/mtd/ubi.h>
 
 #include "ubi-media.h"
@@ -54,9 +56,11 @@
 /* UBI warning messages */
 #define ubi_warn(fmt, ...) printk(KERN_WARNING "UBI warning: %s: " fmt
"\n", \
                                  __func__, ##__VA_ARGS__)
+                                 //__FUNCTION__, ##__VA_ARGS__)
 /* UBI error messages */
 #define ubi_err(fmt, ...) printk(KERN_ERR "UBI error: %s: " fmt "\n", \
                                 __func__, ##__VA_ARGS__)
+                                //__FUNCTION__, ##__VA_ARGS__)
 
 /* Lowest number PEBs reserved for bad PEB handling */
 #define MIN_RESEVED_PEBS 2
@@ -95,9 +99,11 @@ enum {
 
 /**
  * struct ubi_wl_entry - wear-leveling entry.
- * @rb: link in the corresponding RB-tree
- * @ec: erase counter
+ * @rb: link in the corresponding (free or used) RB-tree 
+ * @ec: erase counter, the key of free RB-tree
+ * @temp: data temperature,i.e., data change frequentation
  * @pnum: physical eraseblock number
+ * @status: the status of this entry
  *
  * This data structure is used in the WL unit. Each physical eraseblock
has a
  * corresponding &struct wl_entry object which may be kept in different
@@ -105,8 +111,10 @@ enum {
  */
 struct ubi_wl_entry {
        struct rb_node rb;
-       int ec;
-       int pnum;
+       unsigned int ec;
+       unsigned int pnum;
+       unsigned long long temp;
+       //unsigned short status;
 };
 
 /**
@@ -369,21 +377,17 @@ struct ubi_device {
        struct rb_root used;
        struct rb_root free;
        struct rb_root scrub;
-       struct {
-               struct rb_root pnum;
-               struct rb_root aec;
-       } prot;
-       spinlock_t wl_lock;
-       struct mutex move_mutex;
-       struct rw_semaphore work_sem;
+       spinlock_t wl_lock;     //protect free tree & used tree
+       
+       struct list_head works;
+//     spinlock_t work_lock;   //protect work queue
+
        int wl_scheduled;
+       struct mutex move_mutex; //protect used tree from put while wear
levelin
+       
+       struct rw_semaphore work_sem;
        struct ubi_wl_entry **lookuptbl;
-       unsigned long long abs_ec;
-       struct ubi_wl_entry *move_from;
-       struct ubi_wl_entry *move_to;
-       int move_to_put;
-       struct list_head works;
-       int works_count;
+
        struct task_struct *bgt_thread;
        int thread_enabled;
        char bgt_name[sizeof(UBI_BGT_NAME_PATTERN)+2];
@@ -474,9 +478,10 @@ int ubi_eba_write_leb_st(struct ubi_device *ubi,
struct ubi
                         int used_ebs);
 int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume
*vol,
                              int lnum, const void *buf, int len, int
dtype);
-int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
+int ubi_eba_copy_leb(struct ubi_device *ubi, unsigned int from,
unsigned int to
                     struct ubi_vid_hdr *vid_hdr);
 int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_scan_info
*si);
+void ubi_eba_close(const struct ubi_device *ubi);
 
 /* wl.c */
 int ubi_wl_get_peb(struct ubi_device *ubi, int dtype);
@@ -629,3 +634,4 @@ static inline int idx2vol_id(const struct ubi_device
*ubi, i
 }
 
 #endif /* !__UBI_UBI_H__ */
+
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index cc8fe29..b25c491 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -16,6 +16,12 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
USA
  *
  * Authors: Artem Bityutskiy (Битюцкий Артём), Thomas Gleixner
+ *
+ *
+ * 2008-07-07  Xiaochuan-Xu (xiaochuan-xu@cqu.edu.cn)
+ *                     Rewrite the UBI wear-leveling unit and
Implemented 
+ *                     two-dimension(PEB erase counter, LEB
temperature) 
+ *                     wear leveling algorithm.                
  */
 
 /*
@@ -52,132 +58,89 @@
  * physical eraseblock, it has to be moved. Technically this is the
same as
  * moving it for wear-leveling reasons.
  *
- * As it was said, for the UBI unit all physical eraseblocks are either
"free"
- * or "used". Free eraseblock are kept in the @wl->free RB-tree, while
used
- * eraseblocks are kept in a set of different RB-trees: @wl->used,
- * @wl->prot.pnum, @wl->prot.aec, and @wl->scrub.
+ * the KEY algorithm is in the 'ubi_wl_get_peb()' function and
@ubi->used 
+ * RB-tree the former is get a 'optimal' physical eraseblock (PEB) and
insert 
+ * it int to @ubi->used RB-tree. Look at the function for the details.
and the 
+ * later uses (PEB erase counter, LEB 'temperature') pair as it's key
wods in
+ * the RB-tree. NOTICE, erase counter first, temperature second, which
make
+ * the younger PEB the earlier to be wear-leveled. and the second key 
+ * @e->temp ensures that the younger LEB the earlier to be
wear-leveled.
+ * So, younger PEB stores younger LEB, older LEB resides in older PEB.
  *
- * Note, in this implementation, we keep a small in-RAM object for each
physica
- * eraseblock. This is surely not a scalable solution. But it appears
to be goo
- * enough for moderately large flashes and it is simple. In future, one
may
- * re-work this unit and make it more scalable.
+ * AND, in order to impove the unit's concurrency, i.e., @ubi->wl_lock
should
+ * be used more fine grit(has not been finished), SEVEN status of
wl-entryare 
+ * maintained AMONG wear-leveling working and share the @e->temp.
+ * State diagram is following:
  *
- * At the moment this unit does not utilize the sequence number, which
was
- * introduced relatively recently. But it would be wise to do this
because the
- * sequence number of a logical eraseblock characterizes how old is it.
For
- * example, when we move a PEB with low erase counter, and we need to
pick the
- * target PEB, we pick a PEB with the highest EC if our PEB is "old"
and we
- * pick target PEB with an average EC if our PEB is not very "old".
This is a
- * room for future re-works of the WL unit.
+ *        -----<----------PUT -------<----------- 
+ *        |               |   |                 |
+ *     FREE---<---\      |   |       ---<---USED/SCRUB
+ *        |         \     |   |       |         |    
+ *        |         \    | MOVE_FROM--->-------     
+ *        |           \   |                     |
+ *        ----->---- MOVE_TO------------->-------     
+ *
+ * the last status is DIRTY, which is a error status.
+ * USED status stands for wl-entry with @e->temp is not smaller then 
+ * UBI_WL_USED_INIT.
  *
- * FIXME: looks too complex, should be simplified (later).
  */
 
+ 
 #include <linux/slab.h>
 #include <linux/crc32.h>
 #include <linux/freezer.h>
 #include <linux/kthread.h>
 #include "ubi.h"
 
-/* Number of physical eraseblocks reserved for wear-leveling purposes
*/
-#define WL_RESERVED_PEBS 1
 
-/*
- * How many erase cycles are short term, unknown, and long term
physical
- * eraseblocks protected.
- */
-#define ST_PROTECTION 16
-#define U_PROTECTION  10
-#define LT_PROTECTION 4
+#define UBI_WL_EC_DELTA                CONFIG_MTD_UBI_WL_THRESHOLD
+#define UBI_WL_TEMP_DELTA              10
 
 /*
- * Maximum difference between two erase counters. If this threshold is
- * exceeded, the WL unit starts moving data from used physical
eraseblocks with
- * low erase counter to free physical eraseblocks with high erase
counter.
+ * global temperature of wear leveling entries. I don't use
@ubi->global_sqnum
+ * to implement this function. Because with my own @global_temp, some
other
+ * function can be implement easily. such as @e->temp uniqueness and
entry 
+ * status,the later is useful to improve the concurrency of WL unit 
+ * (has not implement yet)
  */
-#define UBI_WL_THRESHOLD CONFIG_MTD_UBI_WL_THRESHOLD
+static unsigned long long global_temp;
 
 /*
- * When a physical eraseblock is moved, the WL unit has to pick the
target
- * physical eraseblock to move to. The simplest way would be just to
pick the
- * one with the highest erase counter. But in certain workloads this
could lead
- * to an unlimited wear of one or few physical eraseblock. Indeed,
imagine a
- * situation when the picked physical eraseblock is constantly erased
after the
- * data is written to it. So, we have a constant which limits the
highest erase
- * counter of the free physical eraseblock to pick. Namely, the WL unit
does
- * not pick eraseblocks with erase counter greater then the lowest
erase
- * counter plus %WL_FREE_MAX_DIFF.
+ * Maximum number of consecutive background thread failures 
+ * which is enough to switch to read-only mode.
  */
-#define WL_FREE_MAX_DIFF (2*UBI_WL_THRESHOLD)
+#define WL_MAX_FAILURES 32
+
+/* Number of physical eraseblocks reserved for wear-leveling purposes
*/
+#define WL_RESERVED_PEBS 1
+
+enum {
+       UBI_WL_ENTRY_MIN = 0,
+       UBI_WL_ENTRY_QUARTER,
+       UBI_WL_ENTRY_HALF,
+       UBI_WL_ENTRY_SPEC
+};
 
 /*
- * Maximum number of consecutive background thread failures which is
enough to
- * switch to read-only mode.
+ * the status of wear-leveling entry, with is share the @e->temp 
+ * with temperature.
  */
-#define WL_MAX_FAILURES 32
+#define UBI_WL_SCRUB                   ((unsigned long long)0)
+#define UBI_WL_FREE                    ((unsigned long long)1)
+#define UBI_WL_PUT                     ((unsigned long long)2)
+#define UBI_WL_MOVE_FROME              ((unsigned long long)3)
+#define UBI_WL_MOVE_TO                 ((unsigned long long)4)
+#define UBI_WL_DIRTY                   ((unsigned long long)5)
+#define UBI_WL_USED_INIT               ((unsigned long long)6)
 
-/**
- * struct ubi_wl_prot_entry - PEB protection entry.
- * @rb_pnum: link in the @wl->prot.pnum RB-tree
- * @rb_aec: link in the @wl->prot.aec RB-tree
- * @abs_ec: the absolute erase counter value when the protection ends
- * @e: the wear-leveling entry of the physical eraseblock under
protection
- *
- * When the WL unit returns a physical eraseblock, the physical
eraseblock is
- * protected from being moved for some "time". For this reason, the
physical
- * eraseblock is not directly moved from the @wl->free tree to the
@wl->used
- * tree. There is one more tree in between where this physical
eraseblock is
- * temporarily stored (@wl->prot).
- *
- * All this protection stuff is needed because:
- *  o we don't want to move physical eraseblocks just after we have
given them
- *    to the user; instead, we first want to let users fill them up
with data;
- *
- *  o there is a chance that the user will put the physical eraseblock
very
- *    soon, so it makes sense not to move it for some time, but wait;
this is
- *    especially important in case of "short term" physical
eraseblocks.
- *
- * Physical eraseblocks stay protected only for limited time. But the
"time" is
- * measured in erase cycles in this case. This is implemented with help
of the
- * absolute erase counter (@wl->abs_ec). When it reaches certain value,
the
- * physical eraseblocks are moved from the protection trees
(@wl->prot.*) to
- * the @wl->used tree.
- *
- * Protected physical eraseblocks are searched by physical eraseblock
number
- * (when they are put) and by the absolute erase counter (to check if
it is
- * time to move them to the @wl->used tree). So there are actually 2
RB-trees
- * storing the protected physical eraseblocks: @wl->prot.pnum and
- * @wl->prot.aec. They are referred to as the "protection" trees. The
- * first one is indexed by the physical eraseblock number. The second
one is
- * indexed by the absolute erase counter. Both trees store
- * &struct ubi_wl_prot_entry objects.
- *
- * Each physical eraseblock has 2 main states: free and used. The
former state
- * corresponds to the @wl->free tree. The latter state is split up on
several
- * sub-states:
- * o the WL movement is allowed (@wl->used tree);
- * o the WL movement is temporarily prohibited (@wl->prot.pnum and
- * @wl->prot.aec trees);
- * o scrubbing is needed (@wl->scrub tree).
- *
- * Depending on the sub-state, wear-leveling entries of the used
physical
- * eraseblocks may be kept in one of those trees.
- */
-struct ubi_wl_prot_entry {
-       struct rb_node rb_pnum;
-       struct rb_node rb_aec;
-       unsigned long long abs_ec;
-       struct ubi_wl_entry *e;
-};
 
 /**
  * struct ubi_work - UBI work description data structure.
  * @list: a link in the list of pending works
  * @func: worker function
- * @priv: private data of the worker function
- *
  * @e: physical eraseblock to erase
- * @torture: if the physical eraseblock has to be tortured
+ * @flag: the argument of @func function
  *
  * The @func pointer points to the worker function. If the @cancel
argument is
  * not zero, the worker has to free the resources and exit immediately.
The
@@ -189,34 +152,27 @@ struct ubi_work {
        int (*func)(struct ubi_device *ubi, struct ubi_work *wrk, int
cancel);
        /* The below fields are only relevant to erasure works */
        struct ubi_wl_entry *e;
-       int torture;
+       int flag;
 };
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
-static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec);
-static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e,
-                                    struct rb_root *root);
-#else
-#define paranoid_check_ec(ubi, pnum, ec) 0
-#define paranoid_check_in_wl_tree(e, root)
-#endif
 
 /**
- * wl_tree_add - add a wear-leveling entry to a WL RB-tree.
+ * wl_add_free_tree - add a wear-leveling entry to the free RB-tree.
  * @e: the wear-leveling entry to add
  * @root: the root of the tree
  *
  * Note, we use (erase counter, physical eraseblock number) pairs as
keys in
- * the @ubi->used and @ubi->free RB-trees.
+ * the @ubi->free RB-trees. LOCK must hold before beeing invoked.
  */
-static void wl_tree_add(struct ubi_wl_entry *e, struct rb_root *root)
+static void wl_add_free_tree(struct ubi_wl_entry *e, struct rb_root
*root)
 {
        struct rb_node **p, *parent = NULL;
+       struct ubi_wl_entry *e1;
+       
+       ubi_assert(e);
 
        p = &root->rb_node;
        while (*p) {
-               struct ubi_wl_entry *e1;
-
                parent = *p;
                e1 = rb_entry(parent, struct ubi_wl_entry, rb);
 
@@ -233,204 +189,294 @@ static void wl_tree_add(struct ubi_wl_entry *e,
struct r
                }
        }
 
+       e->temp = UBI_WL_FREE;
        rb_link_node(&e->rb, parent, p);
        rb_insert_color(&e->rb, root);
+       dbg_wl("added PEB %d ec %u temp %llu to free tree",
+                       e->pnum, e->ec, e->temp);
 }
 
 /**
- * do_work - do one pending work.
- * @ubi: UBI device description object
+ * wl_add_used_tree - add a wear-leveling entry to the used RB-tree.
+ * @e: the wear-leveling entry to add
+ * @root: the root of the tree
  *
- * This function returns zero in case of success and a negative error
code in
- * case of failure.
+ * Note, we use (temperature, physical eraseblock number) pairs as keys
in
+ * the @ubi->used RB-trees. LOCK must hold before beeing invoked.
  */
-static int do_work(struct ubi_device *ubi)
+static void wl_add_used_tree(struct ubi_wl_entry *e, struct rb_root
*root)
 {
-       int err;
-       struct ubi_work *wrk;
+       struct rb_node **p, *parent = NULL;
 
-       cond_resched();
+       ubi_assert(e);
 
-       /*
-        * @ubi->work_sem is used to synchronize with the workers.
Workers take
-        * it in read mode, so many of them may be doing works at a
time. But
-        * the queue flush code has to be sure the whole queue of works
is
-        * done, and it takes the mutex in write mode.
-        */
-       down_read(&ubi->work_sem);
-       spin_lock(&ubi->wl_lock);
-       if (list_empty(&ubi->works)) {
-               spin_unlock(&ubi->wl_lock);
-               up_read(&ubi->work_sem);
-               return 0;
-       }
+       p = &root->rb_node;
+       e->temp = global_temp++;  
+       
+       while (*p) {
+               struct ubi_wl_entry *e1;
 
-       wrk = list_entry(ubi->works.next, struct ubi_work, list);
-       list_del(&wrk->list);
-       ubi->works_count -= 1;
-       ubi_assert(ubi->works_count >= 0);
-       spin_unlock(&ubi->wl_lock);
+               parent = *p;
+               e1 = rb_entry(parent, struct ubi_wl_entry, rb);
 
-       /*
-        * Call the worker function. Do not touch the work structure
-        * after this call as it will have been freed or reused by that
-        * time by the worker function.
-        */
-       err = wrk->func(ubi, wrk, 0);
-       if (err)
-               ubi_err("work failed with error code %d", err);
-       up_read(&ubi->work_sem);
+               if (e->ec < e1->ec)
+                       p = &(*p)->rb_left;
+               else if (e->ec > e1->ec)
+                       p = &(*p)->rb_right;
+               else {
+                       if (e->temp < e1->temp)
+                               p = &(*p)->rb_left;
+                       else if (e->temp > e1->temp)
+                               p = &(*p)->rb_right;
+                       else {
+                               ubi_assert(e->pnum != e1->pnum);
+                               if (e->pnum < e1->pnum)
+                                       p = &(*p)->rb_left;
+                               else
+                                       p = &(*p)->rb_right;
+                       }
+               }
+       }
 
-       return err;
+       rb_link_node(&e->rb, parent, p);
+       rb_insert_color(&e->rb, root);
+       dbg_wl("added PEB %d ec %u temp %llu to used tree",
+                       e->pnum, e->ec, e->temp);
 }
 
+
 /**
- * produce_free_peb - produce a free physical eraseblock.
- * @ubi: UBI device description object
+ * wl_add_scrub_tree - add a scrub entry to the scrub RB-tree.
+ * @e: the wear-leveling entry to add
+ * @root: the root of the tree
  *
- * This function tries to make a free PEB by means of synchronous
execution of
- * pending works. This may be needed if, for example the background
thread is
- * disabled. Returns zero in case of success and a negative error code
in case
- * of failure.
+ * Note, we use physical eraseblock number as keys in the @ubi->scrub
+ * RB-trees. LOCK must hold before beeing invoked.
  */
-static int produce_free_peb(struct ubi_device *ubi)
+static void wl_add_scrub_tree(struct ubi_wl_entry *e, struct rb_root
*root)
 {
-       int err;
+       struct rb_node **p, *parent = NULL;
 
-       spin_lock(&ubi->wl_lock);
-       while (!ubi->free.rb_node) {
-               spin_unlock(&ubi->wl_lock);
+       ubi_assert(e);
+       p = &root->rb_node;
+       
+       while (*p) {
+               struct ubi_wl_entry *e1;
 
-               dbg_wl("do one work synchronously");
-               err = do_work(ubi);
-               if (err)
-                       return err;
+               parent = *p;
+               e1 = rb_entry(parent, struct ubi_wl_entry, rb);
 
-               spin_lock(&ubi->wl_lock);
+               if (e->pnum < e1->pnum)
+                       p = &(*p)->rb_left;
+               else if (e->pnum> e1->pnum)
+                       p = &(*p)->rb_right;
+               else 
+                       return;
        }
-       spin_unlock(&ubi->wl_lock);
 
-       return 0;
+       e->temp = UBI_WL_SCRUB;  
+       rb_link_node(&e->rb, parent, p);
+       rb_insert_color(&e->rb, root);
+       dbg_wl("added PEB %d ec %u temp %llu to used tree",
+                       e->pnum, e->ec, e->temp);       
 }
 
 /**
- * in_wl_tree - check if wear-leveling entry is present in a WL
RB-tree.
- * @e: the wear-leveling entry to check
- * @root: the root of the tree
+ * wl_move_free_to_used - move a free PEB to used RB-tree
+ * @ubi: ubi device
+ * @e: wear leveling entry of the moved PEB
+ * 
+ * NOTICE: LOCK must be held before being invoked, 
+ * and %e->temp must be initialized.
+ */
+ static inline void wl_move_free_to_used(struct ubi_device *ubi, 
+                                       struct ubi_wl_entry *e)
+{
+       /*
+        * firstly, erase the entry %e from free RB-tree.
+        * secondly, insort the entry %e into used RB-tree.
+        * and the, change the status
+        */
+       rb_erase(&e->rb, &ubi->free);
+       wl_add_used_tree(e, &ubi->used);
+}
+
+
+/**
+ * wl_find_free_entry - find a free entry from free RB-tree.
+ * @root: free RB-tree's root
+ * @key: the key (ec) of entry looked for. UBI_WL_ENTRY_*
+ * @ec: the number of the key only when key is equal to
UBI_WL_ENTRY_SPEC
  *
- * This function returns non-zero if @e is in the @root RB-tree and
zero if it
- * is not.
+ * This function looks for a wear leveling entry with ec  equal to or 
+ * closest to @ec. the address of such ubi_wl_entry expected is
returned
+ * in case of successl, nor NULL.
  */
-static int in_wl_tree(struct ubi_wl_entry *e, struct rb_root *root)
+static struct ubi_wl_entry* wl_find_free_entry(struct rb_root *root, 
+                                               int key, unsigned int
ec)
 {
-       struct rb_node *p;
+       struct ubi_wl_entry *e = NULL;
+       struct rb_node *p = root->rb_node;
+
+       if (!p)
+               goto out_fault;
+       
+       switch(key) {
+               case UBI_WL_ENTRY_MIN:
+                       e = rb_entry(rb_first(root), struct
ubi_wl_entry, rb);
+                       goto out_found;
+               case UBI_WL_ENTRY_QUARTER:
+                       ec = (rb_entry(p, struct ubi_wl_entry, rb))->ec;
+                       ec+=(rb_entry(rb_first(root), 
+                               struct ubi_wl_entry, rb))->ec;
+                       ec >>= 1;
+                       break;
+               case UBI_WL_ENTRY_HALF:
+                       e = rb_entry(p, struct ubi_wl_entry, rb);
+                       goto out_found;
+               case UBI_WL_ENTRY_SPEC:
+                       break;
+               default:
+                       ubi_err("error, unkown parameter of key");
+                       goto out_fault;
+       }
 
-       p = root->rb_node;
-       while (p) {
+       while (p) {     
                struct ubi_wl_entry *e1;
-
                e1 = rb_entry(p, struct ubi_wl_entry, rb);
-
-               if (e->pnum == e1->pnum) {
-                       ubi_assert(e == e1);
-                       return 1;
-               }
-
-               if (e->ec < e1->ec)
+               
+               if (e1->ec > ec) {
                        p = p->rb_left;
-               else if (e->ec > e1->ec)
+               } else if (e1->ec == ec) {
+                       e = e1;
+                       break;
+               } else {
                        p = p->rb_right;
-               else {
-                       ubi_assert(e->pnum != e1->pnum);
-                       if (e->pnum < e1->pnum)
-                               p = p->rb_left;
-                       else
-                               p = p->rb_right;
+                       e = e1;
                }
        }
+       
+out_found:
+       dbg_wl("found PEB %d ec %u temp %llu in free tree",
+               e->pnum, e->ec, e->temp);
+       return e;
+out_fault:
+       dbg_wl("can NOT found a PEB in free tree");     
+       return NULL;
+}
 
-       return 0;
+
+/**
+ * wl_find_used_min_entry - find the minisum used entry from used
RB-tree.
+ * @root: used RB-tree's root
+ *
+ * the address of such ubi_wl_entry expected is returned
+ * in case of successl, nor NULL.
+ */
+static struct ubi_wl_entry* wl_find_used_min_entry(struct rb_root
*root)
+{
+       struct ubi_wl_entry *e = NULL;
+       struct rb_node *p = root->rb_node;
+
+       ubi_assert(p);
+       
+       e = rb_entry(rb_first(root), struct ubi_wl_entry, rb);
+
+       if (e) {
+               dbg_wl("found PEB %d ec %u temp %llu in used tree",
+                                               e->pnum, e->ec,
e->temp);
+       } else {
+               dbg_wl("can NOT found a PEB in used tree");     
+       }
+       
+       return e;       
 }
 
 /**
- * prot_tree_add - add physical eraseblock to protection trees.
+ * wl_do_work - do one pending work synchronously.
  * @ubi: UBI device description object
- * @e: the physical eraseblock to add
- * @pe: protection entry object to use
- * @abs_ec: absolute erase counter value when this physical eraseblock
has
- * to be removed from the protection trees.
  *
- * @wl->lock has to be locked.
+ * This function do a pending work if any on the works queue. 
+ * returns: 
+ *   o %0: in case of success
+ *   o %1: has no pending work AT PRESENT. and
+ *   o a negative error code if error.
  */
-static void prot_tree_add(struct ubi_device *ubi, struct ubi_wl_entry
*e,
-                         struct ubi_wl_prot_entry *pe, int abs_ec)
+static int wl_do_work(struct ubi_device *ubi)
 {
-       struct rb_node **p, *parent = NULL;
-       struct ubi_wl_prot_entry *pe1;
-
-       pe->e = e;
-       pe->abs_ec = ubi->abs_ec + abs_ec;
+       int err = 0;
+       struct ubi_work *work;
 
-       p = &ubi->prot.pnum.rb_node;
-       while (*p) {
-               parent = *p;
-               pe1 = rb_entry(parent, struct ubi_wl_prot_entry,
rb_pnum);
+       cond_resched();
 
-               if (e->pnum < pe1->e->pnum)
-                       p = &(*p)->rb_left;
-               else
-                       p = &(*p)->rb_right;
+       /*
+        * @ubi->work_sem is used to synchronize with the workers.
Workers take
+        * it in read mode, so many of them may be doing works at a
time. But
+        * the queue flush code has to be sure the whole queue of works
is
+        * done, and it takes the mutex in write mode.
+        */
+       down_read(&ubi->work_sem);
+       //spin_lock(&ubi->work_lock);
+       spin_lock(&ubi->wl_lock);
+       if (list_empty(&ubi->works)) {
+               //spin_unlock(&ubi->work_lock);
+               spin_unlock(&ubi->wl_lock);
+               up_read(&ubi->work_sem);
+               return 1;
        }
-       rb_link_node(&pe->rb_pnum, parent, p);
-       rb_insert_color(&pe->rb_pnum, &ubi->prot.pnum);
 
-       p = &ubi->prot.aec.rb_node;
-       parent = NULL;
-       while (*p) {
-               parent = *p;
-               pe1 = rb_entry(parent, struct ubi_wl_prot_entry,
rb_aec);
+       work = list_entry(ubi->works.next, struct ubi_work, list);
+       list_del(&work->list);
+       //spin_unlock(&ubi->work_lock);
+       spin_unlock(&ubi->wl_lock);
+       
+       /*
+        * Call the worker function. Do not touch the work structure
+        * after this call as it will have been freed or reused by that
+        * time by the worker function.
+        */
+       err = work->func(ubi, work, 0);
+       up_read(&ubi->work_sem);
+       
+       if (err)
+               ubi_err("work failed with error code %d", err); 
 
-               if (pe->abs_ec < pe1->abs_ec)
-                       p = &(*p)->rb_left;
-               else
-                       p = &(*p)->rb_right;
-       }
-       rb_link_node(&pe->rb_aec, parent, p);
-       rb_insert_color(&pe->rb_aec, &ubi->prot.aec);
+       return err;
 }
 
+
 /**
- * find_wl_entry - find wear-leveling entry closest to certain erase
counter.
- * @root: the RB-tree where to look for
- * @max: highest possible erase counter
+ * wl_produce_free_peb - produce a free physical eraseblock
synchronosly.
+ * @ubi: UBI device description object
  *
- * This function looks for a wear leveling entry with erase counter
closest to
- * @max and less then @max.
+ * This function tries to make a free PEB by means of synchronous
execution of
+ * pending works. This may be needed if, for example the background
thread is
+ * disabled. Returns 
+ *   o %0: in case of success
+ *   o %1: has not any PEB for erase
+ *   o and a negative error code in case of failure.
  */
-static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int
max)
+static int wl_produce_free_peb(struct ubi_device *ubi)
 {
-       struct rb_node *p;
-       struct ubi_wl_entry *e;
+       int err;
 
-       e = rb_entry(rb_first(root), struct ubi_wl_entry, rb);
-       max += e->ec;
+       dbg_wl("produce a free PEB synchronously");
+       spin_lock(&ubi->wl_lock);
+       while (!ubi->free.rb_node) {
+               spin_unlock(&ubi->wl_lock);
 
-       p = root->rb_node;
-       while (p) {
-               struct ubi_wl_entry *e1;
+               err = wl_do_work(ubi);
+               if (err)
+                       return err;
 
-               e1 = rb_entry(p, struct ubi_wl_entry, rb);
-               if (e1->ec >= max)
-                       p = p->rb_left;
-               else {
-                       p = p->rb_right;
-                       e = e1;
-               }
+               spin_lock(&ubi->wl_lock);
        }
+       spin_unlock(&ubi->wl_lock);
 
-       return e;
+       return 0;
 }
 
+
 /**
  * ubi_wl_get_peb - get a physical eraseblock.
  * @ubi: UBI device description object
@@ -441,140 +487,186 @@ static struct ubi_wl_entry *find_wl_entry(struct
rb_root
  */
 int ubi_wl_get_peb(struct ubi_device *ubi, int dtype)
 {
-       int err, protect, medium_ec;
-       struct ubi_wl_entry *e, *first, *last;
-       struct ubi_wl_prot_entry *pe;
-
-       ubi_assert(dtype == UBI_LONGTERM || dtype == UBI_SHORTTERM ||
-                  dtype == UBI_UNKNOWN);
-
-       pe = kmalloc(sizeof(struct ubi_wl_prot_entry), GFP_NOFS);
-       if (!pe)
-               return -ENOMEM;
-
+       struct ubi_wl_entry *e;
+       int err;
+       
+       ubi_assert(dtype == UBI_UNKNOWN ||
+                               dtype == UBI_SHORTTERM ||
+                               dtype == UBI_LONGTERM);
 retry:
+
+       /*
+       * Checking if the free RB-tree is empty, and product one free
PEB
+       * synchronosly when empty.
+       */
        spin_lock(&ubi->wl_lock);
        if (!ubi->free.rb_node) {
-               if (ubi->works_count == 0) {
-                       ubi_assert(list_empty(&ubi->works));
-                       ubi_err("no free eraseblocks");
+               //spin_lock(&ubi->work_lock);
+               if (list_empty(&ubi->works)) {
+                       //spin_unlock(&ubi->work_lock);
                        spin_unlock(&ubi->wl_lock);
-                       kfree(pe);
+                       ubi_err("no space for using in the ubi device");
                        return -ENOSPC;
                }
+               //spin_unlock(&ubi->work_lock);
                spin_unlock(&ubi->wl_lock);
 
-               err = produce_free_peb(ubi);
+               err = wl_produce_free_peb(ubi);
                if (err < 0) {
-                       kfree(pe);
                        return err;
                }
                goto retry;
        }
 
+       /*
+        * For %unknown data we pick a physical eraseblock with
+        * quarter erase counter. 
+        *
+        * For %short term data we pick a physical eraseblock
+        * with the lowest erase counter as we expect it will
+        * be erased soon.
+        *
+        * For %long term data we pick a physical eraseblock
+        * with the middle erase counter. 
+        */     
        switch (dtype) {
-               case UBI_LONGTERM:
-                       /*
-                        * For long term data we pick a physical
eraseblock
-                        * with high erase counter. But the highest
erase
-                        * counter we can pick is bounded by the the
lowest
-                        * erase counter plus %WL_FREE_MAX_DIFF.
-                        */
-                       e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
-                       protect = LT_PROTECTION;
-                       break;
                case UBI_UNKNOWN:
-                       /*
-                        * For unknown data we pick a physical
eraseblock with
-                        * medium erase counter. But we by no means can
pick a
-                        * physical eraseblock with erase counter
greater or
-                        * equivalent than the lowest erase counter plus
-                        * %WL_FREE_MAX_DIFF.
-                        */
-                       first = rb_entry(rb_first(&ubi->free),
-                                        struct ubi_wl_entry, rb);
-                       last = rb_entry(rb_last(&ubi->free),
-                                       struct ubi_wl_entry, rb);
-
-                       if (last->ec - first->ec < WL_FREE_MAX_DIFF)
-                               e = rb_entry(ubi->free.rb_node,
-                                               struct ubi_wl_entry,
rb);
-                       else {
-                               medium_ec = (first->ec +
WL_FREE_MAX_DIFF)/2;
-                               e = find_wl_entry(&ubi->free,
medium_ec);
-                       }
-                       protect = U_PROTECTION;
+                       e = wl_find_free_entry(&ubi->free, 
+                                       UBI_WL_ENTRY_QUARTER, 0);       
                        break;
                case UBI_SHORTTERM:
-                       /*
-                        * For short term data we pick a physical
eraseblock
-                        * with the lowest erase counter as we expect it
will
-                        * be erased soon.
-                        */
-                       e = rb_entry(rb_first(&ubi->free),
-                                    struct ubi_wl_entry, rb);
-                       protect = ST_PROTECTION;
+                       e = wl_find_free_entry(&ubi->free, 
+                                       UBI_WL_ENTRY_MIN, 0);
+                       break;
+               case UBI_LONGTERM:
+                       e = wl_find_free_entry(&ubi->free, 
+                                       UBI_WL_ENTRY_HALF, 0);
                        break;
                default:
-                       protect = 0;
                        e = NULL;
-                       BUG();
+                       ubi_err("bad parameter dtype");
        }
+       
+       if (e == NULL) {
+               spin_unlock(&ubi->wl_lock);
+               ubi_err("error, get no PEB");
+               return -ENOSPC;
+       } 
 
        /*
-        * Move the physical eraseblock to the protection trees where it
will
-        * be protected from being moved for some time.
+        * Move the physical eraseblock to the used RB-tree.
         */
-       paranoid_check_in_wl_tree(e, &ubi->free);
-       rb_erase(&e->rb, &ubi->free);
-       prot_tree_add(ubi, e, pe, protect);
-
-       dbg_wl("PEB %d EC %d, protection %d", e->pnum, e->ec, protect);
+       wl_move_free_to_used(ubi, e);
        spin_unlock(&ubi->wl_lock);
+               
+       dbg_wl("PEB %d ec %u temp %llu has moved into used RB-tree", 
+               e->pnum, e->ec, e->temp);
 
        return e->pnum;
 }
 
+
 /**
- * prot_tree_del - remove a physical eraseblock from the protection
trees
+ * schedule_ubi_work - schedule a work.
  * @ubi: UBI device description object
- * @pnum: the physical eraseblock to remove
+ * @wrk: the work to schedule
  *
- * This function returns PEB @pnum from the protection trees and
returns zero
- * in case of success and %-ENODEV if the PEB was not found in the
protection
- * trees.
+ * This function enqueues a work defined by @wrk to the tail of the
pending
+ * works list.
  */
-static int prot_tree_del(struct ubi_device *ubi, int pnum)
+static void schedule_ubi_work(struct ubi_device *ubi, struct ubi_work
*work)
 {
-       struct rb_node *p;
-       struct ubi_wl_prot_entry *pe = NULL;
+       //spin_lock(&ubi->work_lock);
+       spin_lock(&ubi->wl_lock);
+       list_add_tail(&work->list, &ubi->works);
+       
+       if (ubi->thread_enabled)
+               wake_up_process(ubi->bgt_thread);
+       //spin_unlock(&ubi->work_lock);
+       spin_unlock(&ubi->wl_lock);
+}
 
-       p = ubi->prot.pnum.rb_node;
-       while (p) {
+static int erase_worker(struct ubi_device *ubi, struct ubi_work
*wl_wrk, 
+                       int cancel);
 
-               pe = rb_entry(p, struct ubi_wl_prot_entry, rb_pnum);
+/**
+ * wl_schedule_erase - schedule an erase work (asynchronously).
+ * @ubi: UBI device description object
+ * @e: the WL entry of the physical eraseblock to erase
+ * @flag: 
+ *     o       %0x1:  if the physical eraseblock has to be tortured
+ *     o       %0x2:  if then erase worker has to schedule wl worker
+ *     o       %0x3:  if both.
+ * This function returns zero in case of success and a %-ENOMEM in case
of
+ * failure.
+ */
+static int wl_schedule_erase(struct ubi_device *ubi, struct
ubi_wl_entry *e,
+                         int flag)
+{
+       struct ubi_work *erase_work;
+
+       dbg_wl("schedule erasure of PEB %d, EC %d, flag %d",
+              e->pnum, e->ec, flag);
+       ubi_assert(e->temp == UBI_WL_PUT);
+       
+       erase_work = kmalloc(sizeof(struct ubi_work), GFP_NOFS);
+       if (!erase_work) {
+               e->temp = UBI_WL_DIRTY;
+               return -ENOMEM;
+       }
+       erase_work->func = &erase_worker;
+       erase_work->e = e;
+       erase_work->flag = flag;
 
-               if (pnum == pe->e->pnum)
-                       goto found;
+       schedule_ubi_work(ubi, erase_work);
+       return 0;
+}
 
-               if (pnum < pe->e->pnum)
-                       p = p->rb_left;
-               else
-                       p = p->rb_right;
+
+static int wear_leveling_worker(struct ubi_device *ubi, 
+                                       struct ubi_work *wrk, int
cancel);
+/**
+ * wl_schedule_wear_leveling - schedule wear-leveling if it is needed.
+ * @ubi: UBI device description object
+ *
+ * This function checks if it is time to start wear-leveling and
schedules it
+ * if yes. This function returns zero in case of success and a negative
error
+ * code in case of failure.
+ */
+static int wl_schedule_wear_leveling(struct ubi_device *ubi)
+{
+       int err = 0;
+       struct ubi_work *wl_work;
+
+       dbg_wl("schedule wear leveling worker");
+
+       spin_lock(&ubi->wl_lock);
+       if (ubi->wl_scheduled)
+               goto out_cancel;
+       ubi->wl_scheduled = 1;
+       spin_unlock(&ubi->wl_lock);
+
+       wl_work = kmalloc(sizeof(struct ubi_work),  GFP_NOFS);
+       if (!wl_work) {
+               err = -ENOMEM;
+               spin_lock(&ubi->wl_lock);
+               ubi->wl_scheduled = 0;
+               goto out_cancel;
        }
 
-       return -ENODEV;
+       wl_work->func = &wear_leveling_worker;
+       schedule_ubi_work(ubi, wl_work);
+       return err;
+                                               
+out_cancel:
 
-found:
-       ubi_assert(pe->e->pnum == pnum);
-       rb_erase(&pe->rb_aec, &ubi->prot.aec);
-       rb_erase(&pe->rb_pnum, &ubi->prot.pnum);
-       kfree(pe);
-       return 0;
+       spin_unlock(&ubi->wl_lock);
+       return err;
 }
 
+
 /**
- * sync_erase - synchronously erase a physical eraseblock.
+ * wl_erase_sync - synchronously erase a physical eraseblock.
  * @ubi: UBI device description object
  * @e: the the physical eraseblock to erase
  * @torture: if the physical eraseblock has to be tortured
@@ -582,17 +674,12 @@ found:
  * This function returns zero in case of success and a negative error
code in
  * case of failure.
  */
-static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
int tortu
+static int wl_erase_sync(struct ubi_device *ubi, struct ubi_wl_entry
*e, 
+int torture)
 {
        int err;
        struct ubi_ec_hdr *ec_hdr;
-       unsigned long long ec = e->ec;
-
-       dbg_wl("erase PEB %d, old EC %llu", e->pnum, ec);
-
-       err = paranoid_check_ec(ubi, e->pnum, e->ec);
-       if (err > 0)
-               return -EINVAL;
+       unsigned int ec = e->ec;
 
        ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
        if (!ec_hdr)
@@ -608,13 +695,13 @@ static int sync_erase(struct ubi_device *ubi,
struct ubi_w
                 * Erase counter overflow. Upgrade UBI and use 64-bit
                 * erase counters internally.
                 */
-               ubi_err("erase counter overflow at PEB %d, EC %llu",
-                       e->pnum, ec);
+               ubi_err("fail to erase PEB %d, EC %u, erase counter
overflow", 
+                                               e->pnum, ec);
                err = -EINVAL;
                goto out_free;
        }
 
-       dbg_wl("erased PEB %d, new EC %llu", e->pnum, ec);
+       dbg_wl("PEB %d, new EC %u has been erased", e->pnum, ec);
 
        ec_hdr->ec = cpu_to_be64(ec);
 
@@ -623,6 +710,7 @@ static int sync_erase(struct ubi_device *ubi, struct
ubi_wl_
                goto out_free;
 
        e->ec = ec;
+       
        spin_lock(&ubi->wl_lock);
        if (e->ec > ubi->max_ec)
                ubi->max_ec = e->ec;
@@ -634,446 +722,192 @@ out_free:
 }
 
 /**
- * check_protection_over - check if it is time to stop protecting some
- * physical eraseblocks.
- * @ubi: UBI device description object
+ * wl_free_tree_present - check if wearleveling entry is present 
+ * in the free RB-tree.
+ * @e: the wear-leveling entry to check
+ * @root: the root of the tree
  *
- * This function is called after each erase operation, when the
absolute erase
- * counter is incremented, to check if some physical eraseblock  have
not to be
- * protected any longer. These physical eraseblocks are moved from the
- * protection trees to the used tree.
+ * This function returns non-zero if @e is in the @root RB-tree and
+ *  zero if it is not.
  */
-static void check_protection_over(struct ubi_device *ubi)
+static int wl_free_tree_present(struct ubi_wl_entry *e, struct rb_root
*root)
 {
-       struct ubi_wl_prot_entry *pe;
+       struct rb_node *p;
 
-       /*
-        * There may be several protected physical eraseblock to remove,
-        * process them all.
-        */
-       while (1) {
-               spin_lock(&ubi->wl_lock);
-               if (!ubi->prot.aec.rb_node) {
-                       spin_unlock(&ubi->wl_lock);
-                       break;
-               }
+       if (!e)
+               return 0;
+
+       p = root->rb_node;
+       while (p) {
+               struct ubi_wl_entry *e1;
 
-               pe = rb_entry(rb_first(&ubi->prot.aec),
-                             struct ubi_wl_prot_entry, rb_aec);
+               e1 = rb_entry(p, struct ubi_wl_entry, rb);
 
-               if (pe->abs_ec > ubi->abs_ec) {
-                       spin_unlock(&ubi->wl_lock);
-                       break;
+               if (e->pnum == e1->pnum) {
+                       ubi_assert(e == e1);
+                       return 1;
                }
 
-               dbg_wl("PEB %d protection over, abs_ec %llu, PEB abs_ec
%llu",
-                      pe->e->pnum, ubi->abs_ec, pe->abs_ec);
-               rb_erase(&pe->rb_aec, &ubi->prot.aec);
-               rb_erase(&pe->rb_pnum, &ubi->prot.pnum);
-               wl_tree_add(pe->e, &ubi->used);
-               spin_unlock(&ubi->wl_lock);
-
-               kfree(pe);
-               cond_resched();
+               if (e->ec < e1->ec)
+                       p = p->rb_left;
+               else if (e->ec > e1->ec)
+                       p = p->rb_right;
+               else {
+                       ubi_assert(e->pnum != e1->pnum);
+                       if (e->pnum < e1->pnum)
+                               p = p->rb_left;
+                       else
+                               p = p->rb_right;
+               }
        }
-}
 
-/**
- * schedule_ubi_work - schedule a work.
- * @ubi: UBI device description object
- * @wrk: the work to schedule
- *
- * This function enqueues a work defined by @wrk to the tail of the
pending
- * works list.
- */
-static void schedule_ubi_work(struct ubi_device *ubi, struct ubi_work
*wrk)
-{
-       spin_lock(&ubi->wl_lock);
-       list_add_tail(&wrk->list, &ubi->works);
-       ubi_assert(ubi->works_count >= 0);
-       ubi->works_count += 1;
-       if (ubi->thread_enabled)
-               wake_up_process(ubi->bgt_thread);
-       spin_unlock(&ubi->wl_lock);
+       return 0;
 }
 
-static int erase_worker(struct ubi_device *ubi, struct ubi_work
*wl_wrk,
-                       int cancel);
-
-/**
- * schedule_erase - schedule an erase work.
- * @ubi: UBI device description object
- * @e: the WL entry of the physical eraseblock to erase
- * @torture: if the physical eraseblock has to be tortured
- *
- * This function returns zero in case of success and a %-ENOMEM in case
of
- * failure.
- */
-static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry
*e,
-                         int torture)
-{
-       struct ubi_work *wl_wrk;
-
-       dbg_wl("schedule erasure of PEB %d, EC %d, torture %d",
-              e->pnum, e->ec, torture);
-
-       wl_wrk = kmalloc(sizeof(struct ubi_work), GFP_NOFS);
-       if (!wl_wrk)
-               return -ENOMEM;
 
-       wl_wrk->func = &erase_worker;
-       wl_wrk->e = e;
-       wl_wrk->torture = torture;
-
-       schedule_ubi_work(ubi, wl_wrk);
-       return 0;
-}
 
 /**
- * wear_leveling_worker - wear-leveling worker function.
- * @ubi: UBI device description object
- * @wrk: the work object
- * @cancel: non-zero if the worker has to free memory and exit
+ * wl_used_tree_present - check if wear-leveling entry is present
+ * in the used RB-tree.
+ * @e: the wear-leveling entry to check
+ * @root: the root of the tree
  *
- * This function copies a more worn out physical eraseblock to a less
worn out
- * one. Returns zero in case of success and a negative error code in
case of
- * failure.
+ * This function returns non-zero if @e is in the @root RB-tree and
+ * zero if it is not.
  */
-static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work
*wrk,
-                               int cancel)
+static int wl_used_tree_present(struct ubi_wl_entry *e, struct rb_root
*root)
 {
-       int err, put = 0, scrubbing = 0, protect = 0;
-       struct ubi_wl_prot_entry *uninitialized_var(pe);
-       struct ubi_wl_entry *e1, *e2;
-       struct ubi_vid_hdr *vid_hdr;
-
-       kfree(wrk);
+       struct rb_node *p;
 
-       if (cancel)
+       if (!e)
                return 0;
 
-       vid_hdr = ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
-       if (!vid_hdr)
-               return -ENOMEM;
-
-       mutex_lock(&ubi->move_mutex);
-       spin_lock(&ubi->wl_lock);
-       ubi_assert(!ubi->move_from && !ubi->move_to);
-       ubi_assert(!ubi->move_to_put);
-
-       if (!ubi->free.rb_node ||
-           (!ubi->used.rb_node && !ubi->scrub.rb_node)) {
-               /*
-                * No free physical eraseblocks? Well, they must be
waiting in
-                * the queue to be erased. Cancel movement - it will be
-                * triggered again when a free physical eraseblock
appears.
-                *
-                * No used physical eraseblocks? They must be
temporarily
-                * protected from being moved. They will be moved to the
-                * @ubi->used tree later and the wear-leveling will be
-                * triggered again.
-                */
-               dbg_wl("cancel WL, a list is empty: free %d, used %d",
-                      !ubi->free.rb_node, !ubi->used.rb_node);
-               goto out_cancel;
-       }
-
-       if (!ubi->scrub.rb_node) {
-               /*
-                * Now pick the least worn-out used physical eraseblock
and a
-                * highly worn-out free physical eraseblock. If the
erase
-                * counters differ much enough, start wear-leveling.
-                */
-               e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry,
rb);
-               e2 = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
-
-               if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD)) {
-                       dbg_wl("no WL needed: min used EC %d, max free
EC %d",
-                              e1->ec, e2->ec);
-                       goto out_cancel;
-               }
-               paranoid_check_in_wl_tree(e1, &ubi->used);
-               rb_erase(&e1->rb, &ubi->used);
-               dbg_wl("move PEB %d EC %d to PEB %d EC %d",
-                      e1->pnum, e1->ec, e2->pnum, e2->ec);
-       } else {
-               /* Perform scrubbing */
-               scrubbing = 1;
-               e1 = rb_entry(rb_first(&ubi->scrub), struct
ubi_wl_entry, rb);
-               e2 = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
-               paranoid_check_in_wl_tree(e1, &ubi->scrub);
-               rb_erase(&e1->rb, &ubi->scrub);
-               dbg_wl("scrub PEB %d to PEB %d", e1->pnum, e2->pnum);
-       }
-
-       paranoid_check_in_wl_tree(e2, &ubi->free);
-       rb_erase(&e2->rb, &ubi->free);
-       ubi->move_from = e1;
-       ubi->move_to = e2;
-       spin_unlock(&ubi->wl_lock);
+       p = root->rb_node;
+       while (p) {
+               struct ubi_wl_entry *e1;
 
-       /*
-        * Now we are going to copy physical eraseblock @e1->pnum to
@e2->pnum.
-        * We so far do not know which logical eraseblock our physical
-        * eraseblock (@e1) belongs to. We have to read the volume
identifier
-        * header first.
-        *
-        * Note, we are protected from this PEB being unmapped and
erased. The
-        * 'ubi_wl_put_peb()' would wait for moving to be finished if
the PEB
-        * which is being moved was unmapped.
-        */
+               e1 = rb_entry(p, struct ubi_wl_entry, rb);
 
-       err = ubi_io_read_vid_hdr(ubi, e1->pnum, vid_hdr, 0);
-       if (err && err != UBI_IO_BITFLIPS) {
-               if (err == UBI_IO_PEB_FREE) {
-                       /*
-                        * We are trying to move PEB without a VID
header. UBI
-                        * always write VID headers shortly after the
PEB was
-                        * given, so we have a situation when it did not
have
-                        * chance to write it down because it was
preempted.
-                        * Just re-schedule the work, so that next time
it will
-                        * likely have the VID header in place.
-                        */
-                       dbg_wl("PEB %d has no VID header", e1->pnum);
-                       goto out_not_moved;
+               if (e->pnum == e1->pnum) {
+                       ubi_assert(e == e1);
+                       return 1;
                }
 
-               ubi_err("error %d while reading VID header from PEB %d",
-                       err, e1->pnum);
-               if (err > 0)
-                       err = -EIO;
-               goto out_error;
-       }
-
-       err = ubi_eba_copy_leb(ubi, e1->pnum, e2->pnum, vid_hdr);
-       if (err) {
-
-               if (err < 0)
-                       goto out_error;
-               if (err == 1)
-                       goto out_not_moved;
-
-               /*
-                * For some reason the LEB was not moved - it might be
because
-                * the volume is being deleted. We should prevent this
PEB from
-                * being selected for wear-levelling movement for some
"time",
-                * so put it to the protection tree.
-                */
-
-               dbg_wl("cancelled moving PEB %d", e1->pnum);
-               pe = kmalloc(sizeof(struct ubi_wl_prot_entry),
GFP_NOFS);
-               if (!pe) {
-                       err = -ENOMEM;
-                       goto out_error;
+               if (e->ec < e1->ec)
+                       p = p->rb_left;
+               else if (e->ec> e1->ec)
+                       p = p->rb_right;
+               else {
+                       if (e->temp < e1->temp)
+                               p = p->rb_left;
+                       else if (e->temp > e1->temp)
+                               p = p->rb_right;
+                       else {
+                               /*
+                               if (e->pnum < e1->pnum)
+                                       p = p->rb_left;
+                               else
+                                       p = p->rb_right;
+                               */
+                               ubi_assert(0);
+                               
+                       }
                }
-
-               protect = 1;
        }
 
-       ubi_free_vid_hdr(ubi, vid_hdr);
-       spin_lock(&ubi->wl_lock);
-       if (protect)
-               prot_tree_add(ubi, e1, pe, protect);
-       if (!ubi->move_to_put)
-               wl_tree_add(e2, &ubi->used);
-       else
-               put = 1;
-       ubi->move_from = ubi->move_to = NULL;
-       ubi->move_to_put = ubi->wl_scheduled = 0;
-       spin_unlock(&ubi->wl_lock);
-
-       if (put) {
-               /*
-                * Well, the target PEB was put meanwhile, schedule it
for
-                * erasure.
-                */
-               dbg_wl("PEB %d was put meanwhile, erase", e2->pnum);
-               err = schedule_erase(ubi, e2, 0);
-               if (err)
-                       goto out_error;
-       }
-
-       if (!protect) {
-               err = schedule_erase(ubi, e1, 0);
-               if (err)
-                       goto out_error;
-       }
-
-
-       dbg_wl("done");
-       mutex_unlock(&ubi->move_mutex);
-       return 0;
-
-       /*
-        * For some reasons the LEB was not moved, might be an error,
might be
-        * something else. @e1 was not changed, so return it back. @e2
might
-        * be changed, schedule it for erasure.
-        */
-out_not_moved:
-       ubi_free_vid_hdr(ubi, vid_hdr);
-       spin_lock(&ubi->wl_lock);
-       if (scrubbing)
-               wl_tree_add(e1, &ubi->scrub);
-       else
-               wl_tree_add(e1, &ubi->used);
-       ubi->move_from = ubi->move_to = NULL;
-       ubi->move_to_put = ubi->wl_scheduled = 0;
-       spin_unlock(&ubi->wl_lock);
-
-       err = schedule_erase(ubi, e2, 0);
-       if (err)
-               goto out_error;
-
-       mutex_unlock(&ubi->move_mutex);
-       return 0;
-
-out_error:
-       ubi_err("error %d while moving PEB %d to PEB %d",
-               err, e1->pnum, e2->pnum);
-
-       ubi_free_vid_hdr(ubi, vid_hdr);
-       spin_lock(&ubi->wl_lock);
-       ubi->move_from = ubi->move_to = NULL;
-       ubi->move_to_put = ubi->wl_scheduled = 0;
-       spin_unlock(&ubi->wl_lock);
-
-       kmem_cache_free(ubi_wl_entry_slab, e1);
-       kmem_cache_free(ubi_wl_entry_slab, e2);
-       ubi_ro_mode(ubi);
-
-       mutex_unlock(&ubi->move_mutex);
-       return err;
-
-out_cancel:
-       ubi->wl_scheduled = 0;
-       spin_unlock(&ubi->wl_lock);
-       mutex_unlock(&ubi->move_mutex);
-       ubi_free_vid_hdr(ubi, vid_hdr);
        return 0;
 }
 
+
 /**
- * ensure_wear_leveling - schedule wear-leveling if it is needed.
- * @ubi: UBI device description object
+ * wl_scrub_tree_present - check if scrub entry is present 
+ * in the scrub RB-tree.
+ * @e: the wear-leveling entry to check
+ * @root: the root of the tree
  *
- * This function checks if it is time to start wear-leveling and
schedules it
- * if yes. This function returns zero in case of success and a negative
error
- * code in case of failure.
+ * This function returns non-zero if @e is in the @root RB-tree and
+ *  zero if it is not.
  */
-static int ensure_wear_leveling(struct ubi_device *ubi)
+static int wl_scrub_tree_present(struct ubi_wl_entry *e, struct rb_root
*root)
 {
-       int err = 0;
-       struct ubi_wl_entry *e1;
-       struct ubi_wl_entry *e2;
-       struct ubi_work *wrk;
-
-       spin_lock(&ubi->wl_lock);
-       if (ubi->wl_scheduled)
-               /* Wear-leveling is already in the work queue */
-               goto out_unlock;
+       struct rb_node *p;
 
-       /*
-        * If the ubi->scrub tree is not empty, scrubbing is needed, and
the
-        * the WL worker has to be scheduled anyway.
-        */
-       if (!ubi->scrub.rb_node) {
-               if (!ubi->used.rb_node || !ubi->free.rb_node)
-                       /* No physical eraseblocks - no deal */
-                       goto out_unlock;
+       if (!e)
+               return 0;
 
-               /*
-                * We schedule wear-leveling only if the difference
between the
-                * lowest erase counter of used physical eraseblocks and
a high
-                * erase counter of free physical eraseblocks is greater
then
-                * %UBI_WL_THRESHOLD.
-                */
-               e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry,
rb);
-               e2 = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
+       p = root->rb_node;
+       while (p) {
+               struct ubi_wl_entry *e1;
 
-               if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD))
-                       goto out_unlock;
-               dbg_wl("schedule wear-leveling");
-       } else
-               dbg_wl("schedule scrubbing");
+               e1 = rb_entry(p, struct ubi_wl_entry, rb);
 
-       ubi->wl_scheduled = 1;
-       spin_unlock(&ubi->wl_lock);
+               if (e->pnum == e1->pnum) {
+                       ubi_assert(e == e1);
+                       return 1;
+               }
 
-       wrk = kmalloc(sizeof(struct ubi_work), GFP_NOFS);
-       if (!wrk) {
-               err = -ENOMEM;
-               goto out_cancel;
+               if (e->pnum < e1->pnum)
+                       p = p->rb_left;
+               else
+                       p = p->rb_right;
        }
 
-       wrk->func = &wear_leveling_worker;
-       schedule_ubi_work(ubi, wrk);
-       return err;
-
-out_cancel:
-       spin_lock(&ubi->wl_lock);
-       ubi->wl_scheduled = 0;
-out_unlock:
-       spin_unlock(&ubi->wl_lock);
-       return err;
+       return 0;
 }
 
+
 /**
  * erase_worker - physical eraseblock erase worker function.
  * @ubi: UBI device description object
  * @wl_wrk: the work object
- * @cancel: non-zero if the worker has to free memory and exit
+ * @cancel: %1: do NOTHING but free memory
  *
  * This function erases a physical eraseblock and perform torture
testing if
  * needed. It also takes care about marking the physical eraseblock bad
if
  * needed. Returns zero in case of success and a negative error code in
case of
  * failure.
  */
-static int erase_worker(struct ubi_device *ubi, struct ubi_work
*wl_wrk,
+static int erase_worker(struct ubi_device *ubi, struct ubi_work
*erase_wrk,
                        int cancel)
 {
-       struct ubi_wl_entry *e = wl_wrk->e;
-       int pnum = e->pnum, err, need;
-
+       struct ubi_wl_entry *e = erase_wrk->e;
+       int err, need, pnum = e->pnum;
+       int flag = erase_wrk->flag;
+
+       kfree(erase_wrk);
+       
+       ubi_assert(!wl_free_tree_present(e, &ubi->free));
+       ubi_assert(!wl_used_tree_present(e, &ubi->used));
+       
        if (cancel) {
                dbg_wl("cancel erasure of PEB %d EC %d", pnum, e->ec);
-               kfree(wl_wrk);
                kmem_cache_free(ubi_wl_entry_slab, e);
                return 0;
        }
 
-       dbg_wl("erase PEB %d EC %d", pnum, e->ec);
-
-       err = sync_erase(ubi, e, wl_wrk->torture);
+       err = wl_erase_sync(ubi, e, (flag & 0x1));
+       
        if (!err) {
                /* Fine, we've erased it successfully */
-               kfree(wl_wrk);
-
                spin_lock(&ubi->wl_lock);
-               ubi->abs_ec += 1;
-               wl_tree_add(e, &ubi->free);
+               wl_add_free_tree(e, &ubi->free);
                spin_unlock(&ubi->wl_lock);
-
-               /*
-                * One more erase operation has happened, take care
about protec
-                * physical eraseblocks.
-                */
-               check_protection_over(ubi);
-
+               dbg_wl("PEB[%u,%u,%llu] has been erased & inserted into
free tre
+                                               e->pnum, e->ec,
e->temp);
                /* And take care about wear-leveling */
-               err = ensure_wear_leveling(ubi);
+               if (flag & 0x2)
+                       err = wl_schedule_wear_leveling(ubi);
                return err;
        }
 
-       ubi_err("failed to erase PEB %d, error %d", pnum, err);
-       kfree(wl_wrk);
-       kmem_cache_free(ubi_wl_entry_slab, e);
+       ubi_err("failed to erase PEB %u, error %d", pnum, err);
 
-       if (err == -EINTR || err == -ENOMEM || err == -EAGAIN ||
-           err == -EBUSY) {
+       if (err == -EINTR || err == -ENOMEM || 
+               err == -EAGAIN ||err == -EBUSY) {
                int err1;
 
                /* Re-schedule the LEB for erasure */
-               err1 = schedule_erase(ubi, e, 0);
+               err1 = wl_schedule_erase(ubi, e, flag);         
                if (err1) {
                        err = err1;
                        goto out_ro;
@@ -1131,225 +965,390 @@ static int erase_worker(struct ubi_device *ubi,
struct 
        return err;
 
 out_ro:
+       kmem_cache_free(ubi_wl_entry_slab, e);
        ubi_ro_mode(ubi);
        return err;
 }
 
 /**
- * ubi_wl_put_peb - return a physical eraseblock to the wear-leveling
unit.
+ * wear_leveling_worker - wear-leveling worker function.
  * @ubi: UBI device description object
- * @pnum: physical eraseblock to return
- * @torture: if this physical eraseblock has to be tortured
+ * @wrk: the work object
+ * @cancel: non-zero if the worker has to free memory and exit
  *
- * This function is called to return physical eraseblock @pnum to the
pool of
- * free physical eraseblocks. The @torture flag has to be set if an I/O
error
- * occurred to this @pnum and it has to be tested. This function
returns zero
- * in case of success, and a negative error code in case of failure.
+ * This function is the KEY issure of the WL unit.
+ *     o WEAR_LEVELING: 
+ * Returns zero in case of success and a negative error code in case of
+ * failure.
  */
-int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture)
+static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work
*wrk,
+                               int cancel)
 {
-       int err;
-       struct ubi_wl_entry *e;
-
-       dbg_wl("PEB %d", pnum);
-       ubi_assert(pnum >= 0);
-       ubi_assert(pnum < ubi->peb_count);
+       struct ubi_wl_entry *e_used, *e_free;   
+       struct ubi_wl_entry *e_free1;
+       struct ubi_vid_hdr *vid_hdr;
+       int err = 0;
+       int dirty = 0;
+       int scrubbing = 0;
+       
+       kfree(wrk);
+       
+       vid_hdr = ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
+       if (!vid_hdr) 
+               return -ENOMEM;
 
-retry:
+       mutex_lock(&ubi->move_mutex);
        spin_lock(&ubi->wl_lock);
-       e = ubi->lookuptbl[pnum];
-       if (e == ubi->move_from) {
-               /*
-                * User is putting the physical eraseblock which was
selected to
-                * be moved. It will be scheduled for erasure in the
-                * wear-leveling worker.
-                */
-               dbg_wl("PEB %d is being moved, wait", pnum);
-               spin_unlock(&ubi->wl_lock);
 
-               /* Wait for the WL worker by taking the @ubi->move_mutex
*/
-               mutex_lock(&ubi->move_mutex);
-               mutex_unlock(&ubi->move_mutex);
-               goto retry;
-       } else if (e == ubi->move_to) {
+       if (cancel)
+               goto out_cancel;        
+       
+       if (ubi->free.rb_node == NULL 
+               ||(ubi->used.rb_node == NULL && ubi->scrub.rb_node ==
NULL)) {
                /*
-                * User is putting the physical eraseblock which was
selected
-                * as the target the data is moved to. It may happen if
the EBA
-                * unit already re-mapped the LEB in
'ubi_eba_copy_leb()' but
-                * the WL unit has not put the PEB to the "used" tree
yet, but
-                * it is about to do this. So we just set a flag which
will
-                * tell the WL worker that the PEB is not needed anymore
and
-                * should be scheduled for erasure.
+                * No free physical eraseblocks? Well, they must be
waiting in
+                * the queue to be erased. Cancel movement - it will be
+                * triggered again when a free physical eraseblock
appears.
+                *
+                * No used physical eraseblocks? They must be
temporarily
+                * protected from being moved. They will be moved to the
+                * @ubi->used tree later and the wear-leveling will be
+                * triggered again.
                 */
-               dbg_wl("PEB %d is the target of data moving", pnum);
-               ubi_assert(!ubi->move_to_put);
-               ubi->move_to_put = 1;
-               spin_unlock(&ubi->wl_lock);
-               return 0;
+               
+               dbg_wl("cancel WL, free RB-tree is %s, used RB-tree is %
s.",
+                      !ubi->free.rb_node? "empty":"having", 
+                      !ubi->used.rb_node? "empty":"having");
+               goto out_cancel;
+       }
+
+       if (ubi->scrub.rb_node) {
+               /*scrubbing is needed*/
+               scrubbing = 1;
+               
+               e_free = wl_find_free_entry(&ubi->free,
UBI_WL_ENTRY_HALF, 0);
+               ubi_assert(e_free);
+               e_used = rb_entry(ubi->scrub.rb_node, struct
ubi_wl_entry, rb);
+               ubi_assert(e_used);
+               rb_erase(&e_used->rb, &ubi->scrub);
+               
        } else {
-               if (in_wl_tree(e, &ubi->used)) {
-                       paranoid_check_in_wl_tree(e, &ubi->used);
-                       rb_erase(&e->rb, &ubi->used);
-               } else if (in_wl_tree(e, &ubi->scrub)) {
-                       paranoid_check_in_wl_tree(e, &ubi->scrub);
-                       rb_erase(&e->rb, &ubi->scrub);
-               } else {
-                       err = prot_tree_del(ubi, e->pnum);
-                       if (err) {
-                               ubi_err("PEB %d not found", pnum);
-                               ubi_ro_mode(ubi);
-                               spin_unlock(&ubi->wl_lock);
-                               return err;
-                       }
+               /*check wear leveling is needed or not*/
+               e_used = wl_find_used_min_entry(&ubi->used);
+               ubi_assert(e_used);
+               e_free1 = wl_find_free_entry(&ubi->free,
UBI_WL_ENTRY_HALF, 0);
+               ubi_assert(e_free1);
+
+               if ((e_used->ec > (e_free1->ec - UBI_WL_EC_DELTA)) ||
+                       e_used->temp > (global_temp -
UBI_WL_TEMP_DELTA)){
+                       /* need not to wear leveling. */
+                       goto out_cancel;
                }
+               
+               e_free = wl_find_free_entry(&ubi->free,
UBI_WL_ENTRY_SPEC,
+                                               e_free1->ec +
UBI_WL_EC_DELTA);
+               
+               rb_erase(&e_used->rb, &ubi->used);
        }
+
+       e_used->temp = UBI_WL_MOVE_FROME;
+       rb_erase(&e_free->rb, &ubi->free);
+       e_free->temp = UBI_WL_MOVE_TO;
+       /* 
+        * Be careful such PEB entry %e_free and %e_used is 
+        * IN THE SKY. At this present, if %ubi_wl_put_peb() 
+        * is called, what should we do? Look at the 
+        * %ubi_wl_put_peb() for more detail.
+        */
        spin_unlock(&ubi->wl_lock);
 
-       err = schedule_erase(ubi, e, torture);
+       err = ubi_io_read_vid_hdr(ubi, e_used->pnum, vid_hdr, 0);
+
+       if (err == UBI_IO_PEB_FREE) {
+               /*
+                * We are trying to move PEB without a VID header. UBI
+                * always write VID headers shortly after the PEB was
+                * given, so we have a situation when it did not have
+                * chance to write it down because it was preempted.
+                * Just re-schedule the work, so that next time it will
+                * likely have the VID header in place.
+                */
+               dbg_wl("PEB %d has no VID header", e_used->pnum);
+               goto out_not_moved;
+       } else if (err && err != UBI_IO_BITFLIPS) {
+       
+               //ubi_err("error while reading VID header form PEB[%u,%
u,%llu]",
+               printk("error while reading VID header form PEB[%u,%u,%
llu]\n",
+                               e_used->pnum, e_used->ec, e_used->temp);
+
+               if (err>0)
+                       err = -EIO;
+               goto out_error;
+       }       
+       
+       err = ubi_eba_copy_leb(ubi, e_used->pnum, e_free->pnum,
vid_hdr);
+       dirty = 1;
+
        if (err) {
-               spin_lock(&ubi->wl_lock);
-               wl_tree_add(e, &ubi->used);
+               /*
+                * For some reason the LEB was not moved - it might be
because
+                * the volume is being deleted. We should prevent this
PEB from
+                * being selected for wear-levelling movement for some
"time",
+                */
+               
+               dbg_wl("error %d, cancelled moving PEB %d ec %u temp %
llu", 
+                     err, e_used->pnum, e_used->ec, e_used->temp);
+               
+               goto out_not_moved;
+       }
+       
+       ubi_free_vid_hdr(ubi, vid_hdr);
+
+       spin_lock(&ubi->wl_lock);
+       wl_add_used_tree(e_free, &ubi->used);
+       ubi->wl_scheduled = 0;
+       dbg_wl("%s form PEB[%u,%u,%llu] to PEB[%u,%u,%llu]   [ OK ]",
+                               (scrubbing? "SCRUBBING" : "WEAR
LEVELING"),
+                               e_used->pnum, e_used->ec, e_used->temp,
+                               e_free->pnum, e_free->ec, e_free->temp);
+       e_used->temp = UBI_WL_PUT;
+       spin_unlock(&ubi->wl_lock);     
+
+       if (scrubbing)
+               err = wl_schedule_erase(ubi, e_used, 0x0);
+       else
+               err = wl_schedule_erase(ubi, e_used, 0x2);
+
+       if (err)
+               goto out_error;
+       mutex_unlock(&ubi->move_mutex);
+       return 0;
+
+       /*
+        * For some reasons the LEB was not moved, might be an error, 
+        * might be something else. @e1 was not changed, so return it 
+        * back. @e2 might be changed, schedule it for erasure.
+        */
+out_not_moved:
+       ubi_free_vid_hdr(ubi, vid_hdr);
+       spin_lock(&ubi->wl_lock);
+       ubi->wl_scheduled = 0;
+
+       if (scrubbing)
+               wl_add_scrub_tree(e_used, &ubi->scrub);
+       else
+               wl_add_used_tree(e_used, &ubi->used);   
+
+       if (!dirty) {
+               /*
+                * date has not been copied to the PEB entry %e_free
yet. 
+                * insert it back into the free RB-tree.
+                */
+               wl_add_free_tree(e_free, &ubi->free);
+               err = 0;
+       } else {
+               /*
+                * Maybe some date has been copied to PEB entry %
e_free. 
+                * schedule a erase worker to erase this PEB.
+                */
+               e_free->temp = UBI_WL_PUT;
                spin_unlock(&ubi->wl_lock);
+               err = wl_schedule_erase(ubi, e_free, 0x2);
+               spin_lock(&ubi->wl_lock);
        }
+       spin_unlock(&ubi->wl_lock);
+
+       if (err)
+               goto out_error;
+
+       mutex_unlock(&ubi->move_mutex);
+       return 0;
+       
+out_error:
+       ubi_err("error %d while moving PEB %d to PEB %d",
+               err, e_used->pnum, e_free->pnum);
+
+       ubi_free_vid_hdr(ubi, vid_hdr); 
+
+       kmem_cache_free(ubi_wl_entry_slab, e_used);
+       kmem_cache_free(ubi_wl_entry_slab, e_free);
+       ubi_ro_mode(ubi);
+
+       mutex_unlock(&ubi->move_mutex);
+       return err;
 
+out_cancel:
+       ubi->wl_scheduled = 0;
+       spin_unlock(&ubi->wl_lock);
+       mutex_unlock(&ubi->move_mutex);
        return err;
 }
 
+
 /**
- * ubi_wl_scrub_peb - schedule a physical eraseblock for scrubbing.
+ * ubi_wl_put_peb - return a physical eraseblock to the wear-leveling
unit.
  * @ubi: UBI device description object
- * @pnum: the physical eraseblock to schedule
+ * @pnum: physical eraseblock to return
+ * @torture: if this physical eraseblock has to be tortured
  *
- * If a bit-flip in a physical eraseblock is detected, this physical
eraseblock
- * needs scrubbing. This function schedules a physical eraseblock for
- * scrubbing which is done in background. This function returns zero in
case of
- * success and a negative error code in case of failure.
+ * This function is called to return physical eraseblock @pnum to 
+ * the pool of free physical eraseblocks. The @torture flag has to 
+ * be set if an I/O error occurred to this @pnum and it has to be
tested. 
+ * This function returns zero in case of success, and a negative error 
+ * code in case of failure.
  */
-int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum)
+int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture)
 {
+       int err = 0;
        struct ubi_wl_entry *e;
 
-       ubi_msg("schedule PEB %d for scrubbing", pnum);
+       ubi_assert(pnum >= 0);
+       ubi_assert(pnum < ubi->peb_count);
 
-retry:
+retry: 
        spin_lock(&ubi->wl_lock);
        e = ubi->lookuptbl[pnum];
-       if (e == ubi->move_from || in_wl_tree(e, &ubi->scrub)) {
+       ubi_assert(e);
+
+       if (e->temp >= UBI_WL_USED_INIT) {
+               int err1 = wl_used_tree_present(e, &ubi->used);
+               if (!err1) {
+                       ubi_err("Put PEB[%u,%u,%llu] with is not in the
used RB-
+                               e->pnum, e->ec,
e->temp);                       
+                       ubi_assert(0);
+               }
+               
+               rb_erase(&e->rb, &ubi->used);
+               e->temp = UBI_WL_PUT;
                spin_unlock(&ubi->wl_lock);
-               return 0;
-       }
+               err = wl_schedule_erase(ubi, e, torture | 0x2);
+               return err;
 
-       if (e == ubi->move_to) {
+       } else if (e->temp == UBI_WL_SCRUB) {
+               int err1 = wl_scrub_tree_present(e, &ubi->scrub);
+               if (!err1) {
+                       ubi_err("Put PEB[%u,%u,%llu] with is not in the
scrub RB
+                               e->pnum, e->ec,
e->temp);                       
+                       ubi_assert(0);
+               }
+               
+               rb_erase(&e->rb, &ubi->scrub);
+               e->temp = UBI_WL_PUT;
+               spin_unlock(&ubi->wl_lock);
+
+               /*
+                * When to scrub a PEB, wear-leveling worker will not
be 
+                * scheduled specially
+                */
+               err = wl_schedule_erase(ubi, e, torture);
+               return err;
+       } else if(e->temp == UBI_WL_MOVE_FROME
+                       ||e->temp == UBI_WL_MOVE_TO) {
                /*
-                * This physical eraseblock was used to move data to.
The data
-                * was moved but the PEB was not yet inserted to the
proper
-                * tree. We should just wait a little and let the WL
worker
-                * proceed.
+                * When to PUT peb in the sky (whoes status is FROM or
TO)
+                * such peb must be in the wear-leveling (or scrubbing)
process
+                * the peb will be PUT or insert back to USED/SCRUB
RB-tree 
+                * soon. So, nothing we should do but wait now.
                 */
+               
                spin_unlock(&ubi->wl_lock);
-               dbg_wl("the PEB %d is not in proper tree, retry", pnum);
-               yield();
+               mutex_lock(&ubi->move_mutex);
+               mutex_unlock(&ubi->move_mutex);
                goto retry;
-       }
+       } else if (e->temp == UBI_WL_PUT) {
+               /*
+                * Only after wait for the MOVE_TO peb being insert
into 
+                * the PUT workqueue due to wear-leveling error, can
this 
+                * situation be happened. I still do a erasure although 
+                * maybe not have to do. what a active boy. :-)
+                */
+               spin_unlock(&ubi->wl_lock);
+               err = wl_do_work(ubi);
+               /*if %err is equal to 1, no peb in the workqueue */
+               err = (err == 1)? 0 : err;
+               return err;
+       } else if (e->temp == UBI_WL_DIRTY) {
+               /*
+                * In case of the PEB had be scheduled to erase, but
fail 
+                * to alloc @ubi_work stucture in @wl_schedule_erase 
+                * function, such PEB entry is in the sky, Thanks to
this
+                * PUT function for REput it called by UBI client. 
+                */
+               e->temp = UBI_WL_PUT;
+               spin_unlock(&ubi->wl_lock);
+               err = wl_schedule_erase(ubi, e, torture|0x2);
+               return err;     
 
-       if (in_wl_tree(e, &ubi->used)) {
-               paranoid_check_in_wl_tree(e, &ubi->used);
-               rb_erase(&e->rb, &ubi->used);
        } else {
-               int err;
-
-               err = prot_tree_del(ubi, e->pnum);
-               if (err) {
-                       ubi_err("PEB %d not found", pnum);
-                       ubi_ro_mode(ubi);
-                       spin_unlock(&ubi->wl_lock);
-                       return err;
-               }
+               /*
+                * What happened? the other possible statuses are
+                * %FREE, but PEB entry whith such status has not 
+                * mapped to LEB, There is no choice to PUT these PEBs
+                */             
+               ubi_err("Put PEB[%u,%u,%llu] is error",
+                               e->pnum, e->ec, e->temp);
+               ubi_assert(0);
        }
-
-       wl_tree_add(e, &ubi->scrub);
-       spin_unlock(&ubi->wl_lock);
-
-       /*
-        * Technically scrubbing is the same as wear-leveling, so it is
done
-        * by the WL worker.
-        */
-       return ensure_wear_leveling(ubi);
 }
 
+
 /**
- * ubi_wl_flush - flush all pending works.
+ * ubi_wl_scrub_peb - schedule a physical eraseblock for scrubbing.
  * @ubi: UBI device description object
+ * @pnum: the physical eraseblock to schedule
  *
- * This function returns zero in case of success and a negative error
code in
- * case of failure.
+ * If a bit-flip in a physical eraseblock is detected, this physical
+ * eraseblock needs scrubbing. This function get the @pnum PEB form 
+ * used RB-tree and make its %temp = 0, then put it back to used
RB-tree. 
+ * This function returns zero in case of success and a negative error
+ * code in case of failure.
  */
-int ubi_wl_flush(struct ubi_device *ubi)
+int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum)
 {
-       int err;
-
-       /*
-        * Erase while the pending works queue is not empty, but not
more then
-        * the number of currently pending works.
-        */
-       dbg_wl("flush (%d pending works)", ubi->works_count);
-       while (ubi->works_count) {
-               err = do_work(ubi);
-               if (err)
-                       return err;
-       }
+       int err = 0;
+       struct ubi_wl_entry *e;
+       ubi_msg("schedule PEB %d for scrubbing", pnum);
 
-       /*
-        * Make sure all the works which have been done in parallel are
-        * finished.
-        */
-       down_write(&ubi->work_sem);
-       up_write(&ubi->work_sem);
+retry: 
+       spin_lock(&ubi->wl_lock);
+       e = ubi->lookuptbl[pnum];
+       ubi_assert(e);
 
        /*
-        * And in case last was the WL worker and it cancelled the LEB
-        * movement, flush again.
+        * do the scrubbing in a similar way to @ubi_wl_put_peb
         */
-       while (ubi->works_count) {
-               dbg_wl("flush more (%d pending works)",
ubi->works_count);
-               err = do_work(ubi);
-               if (err)
-                       return err;
+       if (e->temp >= UBI_WL_USED_INIT) {
+               ubi_assert(wl_used_tree_present(e, &ubi->used));
+               rb_erase(&e->rb, &ubi->used);
+               wl_add_scrub_tree(e, &ubi->scrub);
+               spin_unlock(&ubi->wl_lock);
+               
+               err = wl_schedule_wear_leveling(ubi);
+               return err;
+               
+       } else if (e->temp == UBI_WL_SCRUB) {
+               ubi_assert(wl_scrub_tree_present(e, &ubi->scrub));
+               spin_unlock(&ubi->wl_lock);
+               err = wl_schedule_wear_leveling(ubi);
+               return err;             
+               
+       } else if (e->temp == UBI_WL_MOVE_FROME
+                       || e->temp == UBI_WL_MOVE_TO) {
+               spin_unlock(&ubi->wl_lock);
+               mutex_lock(&ubi->move_mutex);
+               mutex_unlock(&ubi->move_mutex);
+               goto retry;
+       } else if (e->temp == UBI_WL_PUT) {
+               spin_unlock(&ubi->wl_lock);
+               return 0;
+               
+       } else {
+               spin_unlock(&ubi->wl_lock);
+               ubi_assert(0);
        }
 
-       return 0;
 }
 
-/**
- * tree_destroy - destroy an RB-tree.
- * @root: the root of the tree to destroy
- */
-static void tree_destroy(struct rb_root *root)
-{
-       struct rb_node *rb;
-       struct ubi_wl_entry *e;
-
-       rb = root->rb_node;
-       while (rb) {
-               if (rb->rb_left)
-                       rb = rb->rb_left;
-               else if (rb->rb_right)
-                       rb = rb->rb_right;
-               else {
-                       e = rb_entry(rb, struct ubi_wl_entry, rb);
-
-                       rb = rb_parent(rb);
-                       if (rb) {
-                               if (rb->rb_left == &e->rb)
-                                       rb->rb_left = NULL;
-                               else
-                                       rb->rb_right = NULL;
-                       }
-
-                       kmem_cache_free(ubi_wl_entry_slab, e);
-               }
-       }
-}
 
 /**
  * ubi_thread - UBI background thread.
@@ -1383,14 +1382,14 @@ int ubi_thread(void *u)
                }
                spin_unlock(&ubi->wl_lock);
 
-               err = do_work(ubi);
-               if (err) {
+               err = wl_do_work(ubi);
+               if (err < 0) {
                        ubi_err("%s: work failed with error code %d",
                                ubi->bgt_name, err);
-                       if (failures++ > WL_MAX_FAILURES) {
+                       if (++failures > WL_MAX_FAILURES) {
                                /*
-                                * Too many failures, disable the thread
and
-                                * switch to read-only mode.
+                                * Too many failures, disable the
thread 
+                                * and switch to read-only mode.
                                 */
                                ubi_msg("%s: %d consecutive failures",
                                        ubi->bgt_name, WL_MAX_FAILURES);
@@ -1407,6 +1406,47 @@ int ubi_thread(void *u)
        return 0;
 }
 
+
+/**
+ * ubi_wl_flush - flush all pending works.
+ * @ubi: UBI device description object
+ *
+ * This function returns zero in case of success and 
+ * a negative error code in case of failure.
+ */
+int ubi_wl_flush(struct ubi_device *ubi)
+{
+       int err, repeat = 0;
+
+       /*
+        * Erase while the pending works queue is not empty, 
+        * but not more then the number of currently pending works.
+        */
+       dbg_wl("flush pending works");
+       do {
+               err = wl_do_work(ubi);
+               
+               if (err < 0)
+                       return err;
+               if (err == 1) {
+                       /*
+                        * the work queue is empty at the moment.
+                        * Make sure all the works which have been done 
+                        * in parallel are finished.     
+                        */
+                       down_write(&ubi->work_sem);
+                       up_write(&ubi->work_sem);       
+                       /*
+                        * And in case last was the WL worker and it 
+                        * cancelled the LEB movement, flush a second
time.
+                        */
+                       repeat++;
+               }
+       } while (!err || (repeat < 2));
+       
+       return 0;
+}
+
 /**
  * cancel_pending - cancel all pending works.
  * @ubi: UBI device description object
@@ -1414,13 +1454,42 @@ int ubi_thread(void *u)
 static void cancel_pending(struct ubi_device *ubi)
 {
        while (!list_empty(&ubi->works)) {
-               struct ubi_work *wrk;
+               struct ubi_work *work;
+
+               work = list_entry(ubi->works.next, struct ubi_work,
list);
+               list_del(&work->list);
+               work->func(ubi, work, 1);
+       }
+}
+
+/**
+ * tree_destroy - destroy an RB-tree.
+ * @root: the root of the tree to destroy
+ */
+static void tree_destroy(struct rb_root *root)
+{
+       struct rb_node *rb;
+       struct ubi_wl_entry *e;
+
+       rb = root->rb_node;
+       while (rb) {
+               if (rb->rb_left)
+                       rb = rb->rb_left;
+               else if (rb->rb_right)
+                       rb = rb->rb_right;
+               else {
+                       e = rb_entry(rb, struct ubi_wl_entry, rb);
+
+                       rb = rb_parent(rb);
+                       if (rb) {
+                               if (rb->rb_left == &e->rb)
+                                       rb->rb_left = NULL;
+                               else
+                                       rb->rb_right = NULL;
+                       }
 
-               wrk = list_entry(ubi->works.next, struct ubi_work,
list);
-               list_del(&wrk->list);
-               wrk->func(ubi, wrk, 1);
-               ubi->works_count -= 1;
-               ubi_assert(ubi->works_count >= 0);
+                       kmem_cache_free(ubi_wl_entry_slab, e);
+               }
        }
 }
 
@@ -1430,32 +1499,32 @@ static void cancel_pending(struct ubi_device
*ubi)
  * @ubi: UBI device description object
  * @si: scanning information
  *
- * This function returns zero in case of success, and a negative error
code in
- * case of failure.
+ * This function returns zero in case of success, 
+ * and a negative error code in case of failure.
  */
 int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
 {
-       int err;
+       int err = 0;
        struct rb_node *rb1, *rb2;
        struct ubi_scan_volume *sv;
        struct ubi_scan_leb *seb, *tmp;
        struct ubi_wl_entry *e;
 
+       ubi->max_ec = si->max_ec;
 
        ubi->used = ubi->free = ubi->scrub = RB_ROOT;
-       ubi->prot.pnum = ubi->prot.aec = RB_ROOT;
        spin_lock_init(&ubi->wl_lock);
+       INIT_LIST_HEAD(&ubi->works);
        mutex_init(&ubi->move_mutex);
+       ubi->wl_scheduled = 0;
        init_rwsem(&ubi->work_sem);
-       ubi->max_ec = si->max_ec;
-       INIT_LIST_HEAD(&ubi->works);
-
+       global_temp = UBI_WL_USED_INIT;
+       
        sprintf(ubi->bgt_name, UBI_BGT_NAME_PATTERN, ubi->ubi_num);
 
-       err = -ENOMEM;
        ubi->lookuptbl = kzalloc(ubi->peb_count * sizeof(void *),
GFP_KERNEL);
        if (!ubi->lookuptbl)
-               return err;
+               return -ENOMEM;
 
        list_for_each_entry_safe(seb, tmp, &si->erase, u.list) {
                cond_resched();
@@ -1467,7 +1536,8 @@ int ubi_wl_init_scan(struct ubi_device *ubi,
struct ubi_sc
                e->pnum = seb->pnum;
                e->ec = seb->ec;
                ubi->lookuptbl[e->pnum] = e;
-               if (schedule_erase(ubi, e, 0)) {
+               e->temp = UBI_WL_PUT;
+               if (wl_schedule_erase(ubi, e, 0x0)) {
                        kmem_cache_free(ubi_wl_entry_slab, e);
                        goto out_free;
                }
@@ -1483,7 +1553,7 @@ int ubi_wl_init_scan(struct ubi_device *ubi,
struct ubi_sc
                e->pnum = seb->pnum;
                e->ec = seb->ec;
                ubi_assert(e->ec >= 0);
-               wl_tree_add(e, &ubi->free);
+               wl_add_free_tree(e, &ubi->free);
                ubi->lookuptbl[e->pnum] = e;
        }
 
@@ -1496,8 +1566,9 @@ int ubi_wl_init_scan(struct ubi_device *ubi,
struct ubi_sc
 
                e->pnum = seb->pnum;
                e->ec = seb->ec;
+               e->temp = UBI_WL_PUT;
                ubi->lookuptbl[e->pnum] = e;
-               if (schedule_erase(ubi, e, 0)) {
+               if (wl_schedule_erase(ubi, e, 0x0)) {
                        kmem_cache_free(ubi_wl_entry_slab, e);
                        goto out_free;
                }
@@ -1515,13 +1586,14 @@ int ubi_wl_init_scan(struct ubi_device *ubi,
struct ubi_
                        e->ec = seb->ec;
                        ubi->lookuptbl[e->pnum] = e;
                        if (!seb->scrub) {
-                               dbg_wl("add PEB %d EC %d to the used
tree",
-                                      e->pnum, e->ec);
-                               wl_tree_add(e, &ubi->used);
+                               dbg_wl("add PEB %d ec %u temp %llu to
the used t
+                                      e->pnum, e->ec,
e->temp);                
+                               wl_add_used_tree(e, &ubi->used);
                        } else {
-                               dbg_wl("add PEB %d EC %d to the scrub
tree",
-                                      e->pnum, e->ec);
-                               wl_tree_add(e, &ubi->scrub);
+                               dbg_wl("PEB %d ec %u temp %llu need to
scrub",
+                                      e->pnum, e->ec, e->temp);        
+                               e->temp = UBI_WL_SCRUB;
+                               wl_add_scrub_tree(e, &ubi->scrub);
                        }
                }
        }
@@ -1534,53 +1606,16 @@ int ubi_wl_init_scan(struct ubi_device *ubi,
struct ubi_
        ubi->avail_pebs -= WL_RESERVED_PEBS;
        ubi->rsvd_pebs += WL_RESERVED_PEBS;
 
-       /* Schedule wear-leveling if needed */
-       err = ensure_wear_leveling(ubi);
-       if (err)
-               goto out_free;
-
        return 0;
 
 out_free:
        cancel_pending(ubi);
        tree_destroy(&ubi->used);
        tree_destroy(&ubi->free);
-       tree_destroy(&ubi->scrub);
        kfree(ubi->lookuptbl);
        return err;
 }
 
-/**
- * protection_trees_destroy - destroy the protection RB-trees.
- * @ubi: UBI device description object
- */
-static void protection_trees_destroy(struct ubi_device *ubi)
-{
-       struct rb_node *rb;
-       struct ubi_wl_prot_entry *pe;
-
-       rb = ubi->prot.aec.rb_node;
-       while (rb) {
-               if (rb->rb_left)
-                       rb = rb->rb_left;
-               else if (rb->rb_right)
-                       rb = rb->rb_right;
-               else {
-                       pe = rb_entry(rb, struct ubi_wl_prot_entry,
rb_aec);
-
-                       rb = rb_parent(rb);
-                       if (rb) {
-                               if (rb->rb_left == &pe->rb_aec)
-                                       rb->rb_left = NULL;
-                               else
-                                       rb->rb_right = NULL;
-                       }
-
-                       kmem_cache_free(ubi_wl_entry_slab, pe->e);
-                       kfree(pe);
-               }
-       }
-}
 
 /**
  * ubi_wl_close - close the wear-leveling unit.
@@ -1589,78 +1624,9 @@ static void protection_trees_destroy(struct
ubi_device *u
 void ubi_wl_close(struct ubi_device *ubi)
 {
        dbg_wl("close the UBI wear-leveling unit");
-
        cancel_pending(ubi);
-       protection_trees_destroy(ubi);
        tree_destroy(&ubi->used);
-       tree_destroy(&ubi->free);
-       tree_destroy(&ubi->scrub);
+       tree_destroy(&ubi->free);;
        kfree(ubi->lookuptbl);
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
-
-/**
- * paranoid_check_ec - make sure that the erase counter of a physical
erasebloc
- * is correct.
- * @ubi: UBI device description object
- * @pnum: the physical eraseblock number to check
- * @ec: the erase counter to check
- *
- * This function returns zero if the erase counter of physical
eraseblock @pnum
- * is equivalent to @ec, %1 if not, and a negative error code if an
error
- * occurred.
- */
-static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec)
-{
-       int err;
-       long long read_ec;
-       struct ubi_ec_hdr *ec_hdr;
-
-       ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
-       if (!ec_hdr)
-               return -ENOMEM;
-
-       err = ubi_io_read_ec_hdr(ubi, pnum, ec_hdr, 0);
-       if (err && err != UBI_IO_BITFLIPS) {
-               /* The header does not have to exist */
-               err = 0;
-               goto out_free;
-       }
-
-       read_ec = be64_to_cpu(ec_hdr->ec);
-       if (ec != read_ec) {
-               ubi_err("paranoid check failed for PEB %d", pnum);
-               ubi_err("read EC is %lld, should be %d", read_ec, ec);
-               ubi_dbg_dump_stack();
-               err = 1;
-       } else
-               err = 0;
-
-out_free:
-       kfree(ec_hdr);
-       return err;
-}
-
-/**
- * paranoid_check_in_wl_tree - make sure that a wear-leveling entry is
present
- * in a WL RB-tree.
- * @e: the wear-leveling entry to check
- * @root: the root of the tree
- *
- * This function returns zero if @e is in the @root RB-tree and %1 if
it
- * is not.
- */
-static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e,
-                                    struct rb_root *root)
-{
-       if (in_wl_tree(e, root))
-               return 0;
-
-       ubi_err("paranoid check failed for PEB %d, EC %d, RB-tree %p ",
-               e->pnum, e->ec, root);
-       ubi_dbg_dump_stack();
-       return 1;
-}
-
-#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID */


-- 
Yours sincerely
xiaochuan-xu(cqu.edu.cn)
