Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyG-0004si-0n
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:11 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/46] mtd: nandsim: Cleanup destroy handlers
Date: Wed, 31 Aug 2016 09:28:29 +0200
Message-Id: <20160831072853.27822-23-dwalter@sigma-star.at>
In-Reply-To: <20160831072853.27822-1-dwalter@sigma-star.at>
References: <20160831072853.27822-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Make sure that we free stuff only after it has been
initialized.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index f8b9e76..78c3ee4 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -770,6 +770,9 @@ static void ns_ram_destroy(struct nandsim *ns)
 	struct ns_ram_data *data = ns->backend_data;
 	int i;
 
+	if (!data)
+		return;
+
 	for (i = 0; i < ns->geom.pgnum; i++) {
 		if (data->pages[i].byte)
 			kmem_cache_free(data->nand_pages_slab,
@@ -784,15 +787,22 @@ static void ns_cachefile_destroy(struct nandsim *ns)
 {
 	struct ns_cachefile_data *data = ns->backend_data;
 
+	if (!data)
+		return;
+
 	kfree(data->file_buf);
 	vfree(data->pages_written);
 	filp_close(data->cfile, NULL);
+	kfree(data);
 }
 
 static void ns_file_destroy(struct nandsim *ns)
 {
 	struct ns_file_data *data = ns->backend_data;
 
+	if (!data)
+		return;
+
 	kfree(data->file_buf);
 	fput(data->file);
 	kfree(data);
-- 
2.8.3
