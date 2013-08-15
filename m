Date: Thu, 15 Aug 2013 10:56:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: create_freezable_workqueue() doesn't return an ERR_PTR
Message-ID: <20130815075628.GC19280@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The create_freezable_workqueue() returns a NULL on error, it doesn't
return an ERR_PTR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index f9d5615..3441e73 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -1274,10 +1274,10 @@ static struct mtd_blktrans_ops sm_ftl_ops = {
 static __init int sm_module_init(void)
 {
 	int error = 0;
-	cache_flush_workqueue = create_freezable_workqueue("smflush");
 
-	if (IS_ERR(cache_flush_workqueue))
-		return PTR_ERR(cache_flush_workqueue);
+	cache_flush_workqueue = create_freezable_workqueue("smflush");
+	if (!cache_flush_workqueue)
+		return -ENOMEM;
 
 	error = register_mtd_blktrans(&sm_ftl_ops);
 	if (error)
