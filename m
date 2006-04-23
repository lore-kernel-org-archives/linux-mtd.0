Received: from list.admingilde.org ([2001:780:0:13::80]
	helo=mail.admingilde.org)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FXkN0-0000JM-SO
	for linux-mtd@lists.infradead.org; Sun, 23 Apr 2006 15:37:31 -0400
Received: from martin by mail.admingilde.org with local  (Exim 4.50 #1)
	id 1FXkMr-0003j7-BO
	for linux-mtd@lists.infradead.org; Sun, 23 Apr 2006 21:35:37 +0200
Date: Sun, 23 Apr 2006 21:35:37 +0200
From: Martin Waitz <tali@admingilde.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20060423193537.GG29948@admingilde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: "Martin Waitz, Lachnerstrasse 65, +49 179 8230 463, +49 9131 6878391,
	91058 Erlangen" <martin@mail.admingilde.org>
Subject: [PATCH] MTD: remove mtd_info->bank_size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to the comment the variable should go away in 2.5.
There are no in-tree users of this variable left.

Signed-off-by: Martin Waitz <tali@admingilde.org>

---

 drivers/mtd/mtdpart.c   |    1 -
 include/linux/mtd/mtd.h |    3 ---
 2 files changed, 0 insertions(+), 4 deletions(-)

e973bcb6279c0d772afe4e969a3323265dcb0e00
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 9939591..41cbe11 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -404,7 +404,6 @@ int add_mtd_partitions(struct mtd_info *
 		slave->mtd.eccsize = master->eccsize;
 
 		slave->mtd.name = parts[i].name;
-		slave->mtd.bank_size = master->bank_size;
 		slave->mtd.owner = master->owner;
 
 		slave->mtd.read = part_read;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 886f481..e267370 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -97,9 +97,6 @@ #define MTD_PROGREGION_CTRLMODE_INVALID(
 	int numeraseregions;
 	struct mtd_erase_region_info *eraseregions;
 
-	/* This really shouldn't be here. It can go away in 2.5 */
-	u_int32_t bank_size;
-
 	int (*erase) (struct mtd_info *mtd, struct erase_info *instr);
 
 	/* This stuff for eXecute-In-Place */
-- 
1.3.0.gc5417


-- 
Martin Waitz
