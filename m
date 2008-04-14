Received: from smtp6.pp.htv.fi ([213.243.153.40])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlPYN-0002Wk-BH
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 14:21:03 +0000
Date: Mon, 14 Apr 2008 17:19:58 +0300
From: Adrian Bunk <bunk@kernel.org>
To: dwmw2@infradead.org
Subject: [2.6 patch] mtd: proper prototypes for inftl_{read,write}_oob()
Message-ID: <20080414141958.GO6695@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds proper prototypes for inftl_{read,write}_oob() in 
include/linux/mtd/inftl.h

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 drivers/mtd/inftlmount.c  |    5 -----
 include/linux/mtd/inftl.h |    5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

12972b4c2d014aa68e0293aef11b1c97e42a821d diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index b8917be..c551d2f 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -41,11 +41,6 @@
 
 char inftlmountrev[]="$Revision: 1.18 $";
 
-extern int inftl_read_oob(struct mtd_info *mtd, loff_t offs, size_t len,
-			  size_t *retlen, uint8_t *buf);
-extern int inftl_write_oob(struct mtd_info *mtd, loff_t offs, size_t len,
-			   size_t *retlen, uint8_t *buf);
-
 /*
  * find_boot_record: Find the INFTL Media Header and its Spare copy which
  *	contains the various device information of the INFTL partition and
diff --git a/include/linux/mtd/inftl.h b/include/linux/mtd/inftl.h
index 6977780..85fd041 100644
--- a/include/linux/mtd/inftl.h
+++ b/include/linux/mtd/inftl.h
@@ -57,6 +57,11 @@ extern char inftlmountrev[];
 void INFTL_dumptables(struct INFTLrecord *s);
 void INFTL_dumpVUchains(struct INFTLrecord *s);
 
+int inftl_read_oob(struct mtd_info *mtd, loff_t offs, size_t len,
+		   size_t *retlen, uint8_t *buf);
+int inftl_write_oob(struct mtd_info *mtd, loff_t offs, size_t len,
+		    size_t *retlen, uint8_t *buf);
+
 #endif /* __KERNEL__ */
 
 #endif /* __MTD_INFTL_H__ */
