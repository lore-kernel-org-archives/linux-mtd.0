Date: Mon, 27 Oct 2008 12:59:14 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH][nandsim] FIX RAM wasting via kmalloc
In-Reply-To: <1225091926.3833.2.camel@sauron>
Message-ID: <alpine.LFD.1.10.0810271251540.18203@casper.infradead.org>
References: <alpine.LFD.1.10.0810221611550.30499@casper.infradead.org>
	<1225091926.3833.2.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> > Nandsim consumes ~2x more RAM than the density of simulated device. 
> > It becomes critical if we need to simulate 256MB NAND and run stress tests 
> > on it.
> 
> I'm applying your patch to our local tree, just to test it. But there
> is a trailing white-space.
> 
> [dedekind@gollum ubifs-2.6]$ git-am nandsim
> Applying FIX RAM wasting via kmalloc
> .dotest/patch:64: trailing whitespace.
>                  * then kernel memory alloc runs writeback which goes to
> the FS
> warning: 1 line adds whitespace errors.
> 
> :-)
>
Thanks. I removed the trailing space. Also for just a case did an addtional
tests to make sure it works fine.
I think this one should be better :)?

Thanks,
Alexey

Signed-off-by: Alexey Korolev <akorolev@infradead.org>

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
@@ -437,6 +440,8 @@ static int alloc_device(struct nandsim *ns)
 	for (i = 0; i < ns->geom.pgnum; i++) {
 		ns->pages[i].byte = NULL;
 	}
+	ns->nand_pages_slab = kmem_cache_create("nandsim",
+						ns->geom.pgszoob, 0, 0, NULL);
 
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
