Date: Mon, 22 Oct 2007 11:01:52 +0900
From: Kyungmin Park <kmpark@infradead.org>
To: dwmw2@infradead.org
Subject: [PATCH] [MTD] [OneNAND] Fix wrong free the static address
Message-ID: <20071022020152.GA2826@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[MTD] [OneNAND] Fix wrong free the static address

Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_sim.c b/drivers/mtd/onenand/onenand_sim.c
index 0d89ad5..288cbd7 100644
--- a/drivers/mtd/onenand/onenand_sim.c
+++ b/drivers/mtd/onenand/onenand_sim.c
@@ -424,7 +424,6 @@ static void flash_exit(struct onenand_flash *flash)
 {
 	vfree(ONENAND_CORE(flash));
 	kfree(flash->base);
-	kfree(flash);
 }
 
 static int __init onenand_sim_init(void)
