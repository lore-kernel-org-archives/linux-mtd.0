Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPH5g-00026P-M6
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 21:28:13 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, joerg.krause@embedded.rocks,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubi: fastmap: Implement produce_free_peb()
Date: Tue, 11 Aug 2015 23:27:44 +0200
Message-Id: <1439328464-5521-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If fastmap requests a free PEB for a pool and UBI is busy
with erasing PEBs we need to offer a function to wait for one.
We can reuse produce_free_peb() from the non-fastmap WL code
but with different locking semantics.

Reported-and-tested-by: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
This time the correct patch with error handling.
I need some sleep. ;-\

---
 drivers/mtd/ubi/fastmap-wl.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index b2a6653..30d3999 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -172,6 +172,30 @@ void ubi_refill_pools(struct ubi_device *ubi)
 }
 
 /**
+ * produce_free_peb - produce a free physical eraseblock.
+ * @ubi: UBI device description object
+ *
+ * This function tries to make a free PEB by means of synchronous execution of
+ * pending works. This may be needed if, for example the background thread is
+ * disabled. Returns zero in case of success and a negative error code in case
+ * of failure.
+ */
+static int produce_free_peb(struct ubi_device *ubi)
+{
+	int err;
+
+	while (!ubi->free.rb_node && ubi->works_count) {
+		dbg_wl("do one work synchronously");
+		err = do_work(ubi);
+
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
  * ubi_wl_get_peb - get a physical eraseblock.
  * @ubi: UBI device description object
  *
@@ -213,6 +237,11 @@ again:
 		}
 		retried = 1;
 		up_read(&ubi->fm_eba_sem);
+		ret = produce_free_peb(ubi);
+		if (ret < 0) {
+			down_read(&ubi->fm_eba_sem);
+			goto out;
+		}
 		goto again;
 	}
 
-- 
1.8.4.5
