Date: Thu, 13 Nov 2008 13:40:38 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, Artem.Bityutskiy@nokia.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH][nandsim]Fix RAM wasting via kmalloc (added check for
	kmem_cache_create)
Message-ID: <alpine.LFD.2.00.0811131335310.31593@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Nandsim consumes ~2x more RAM than the density of simulated device. 
It becomes critical if we need to simulate 256MB NAND and run stress tests 
on it.

We investigated the reasons. nandsim allocates space for pages using kmalloc
function. The size of LP nand page is 2112 bytes.
kmalloc gets space from slab pools by chunks 2^n. So if we need to kmalloc
2112 bytes, 4096 bytes will be consumed by system.
The best way to avoid this issue would be using kmem_cache allocations. AFAIK
this mechanism specially designed to handle cases when arrays of allocations
are used.

The following patch solves allocation issues.

Thanks,
Alexey


Signed-off-by: Alexey Korolev <akorolev@infradead.org>
Tested-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

---

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index ae7c577..0551cbf 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -295,6 +295,9 @@ struct nandsim {
 	/* The simulated NAND flash pages array */
 	union ns_mem *pages;
 
+	/* Slab allocator for nand pages */
+	struct kmem_cache *nand_pages_slab;
+
 	/* Internal buffer of page + OOB size bytes */
 	union ns_mem buf;
 
@@ -420,8 +423,8 @@ static struct mtd_info *nsmtd;
 static u_char ns_verify_buf[NS_LARGEST_PAGE_SIZE];
 
 /*
- * Allocate array of page pointers and initialize the array to NULL
- * pointers.
+ * Allocate array of page pointers, create slab allocation for an array
+ * and initialize the array by NULL pointers.
  *
  * RETURNS: 0 if success, -ENOMEM if memory alloc fails.
  */
@@ -437,6 +440,12 @@ static int alloc_device(struct nandsim *ns)
 	for (i = 0; i < ns->geom.pgnum; i++) {
 		ns->pages[i].byte = NULL;
 	}
+	ns->nand_pages_slab = kmem_cache_create("nandsim",
+						ns->geom.pgszoob, 0, 0, NULL);
+	if (!ns->nand_pages_slab) {
+		NS_ERR("cache_create: unable to create kmem_cache\n");
+		return -ENOMEM;
+	}
 
 	return 0;
 }
@@ -451,8 +456,10 @@ static void free_device(struct nandsim *ns)
 	if (ns->pages) {
 		for (i = 0; i < ns->geom.pgnum; i++) {
 			if (ns->pages[i].byte)
-				kfree(ns->pages[i].byte);
+				kmem_cache_free(ns->nand_pages_slab,
+						ns->pages[i].byte);
 		}
+		kmem_cache_destroy(ns->nand_pages_slab);
 		vfree(ns->pages);
 	}
 }
@@ -1279,7 +1286,7 @@ static void erase_sector(struct nandsim *ns)
 	for (i = 0; i < ns->geom.pgsec; i++) {
 		if (mypage->byte != NULL) {
 			NS_DBG("erase_sector: freeing page %d\n", ns->regs.row+i);
-			kfree(mypage->byte);
+			kmem_cache_free(ns->nand_pages_slab, mypage->byte);
 			mypage->byte = NULL;
 		}
 		mypage++;
@@ -1301,10 +1308,10 @@ static int prog_page(struct nandsim *ns, int num)
 		/*
 		 * We allocate memory with GFP_NOFS because a flash FS may
 		 * utilize this. If it is holding an FS lock, then gets here,
-		 * then kmalloc runs writeback which goes to the FS again
-		 * and deadlocks. This was seen in practice.
+		 * then kernel memory alloc runs writeback which goes to the FS
+		 * again and deadlocks. This was seen in practice.
 		 */
-		mypage->byte = kmalloc(ns->geom.pgszoob, GFP_NOFS);
+		mypage->byte = kmem_cache_alloc(ns->nand_pages_slab, GFP_NOFS);
 		if (mypage->byte == NULL) {
 			NS_ERR("prog_page: error allocating memory for page %d\n", ns->regs.row);
 			return -1;
