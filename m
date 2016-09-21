Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeGR-0006nH-VG
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:56:57 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 38/46] mtd: nandsim: Expose partition creation logic to
 user space
Date: Wed, 21 Sep 2016 11:56:05 +0200
Message-Id: <f3421b9e45b6ba5f1fc54f6ce3ed954115da8e00.1474450296.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c  | 12 +++++++++++-
 include/linux/mtd/nandsim.h |  2 +-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 615dde3..6b7570b 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2585,6 +2585,16 @@ static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
 	nsparam->file_fd = req->file_fd;
 	nsparam->no_oob = !!req->no_oob;
 
+	if (req->parts_num > NANDSIM_MAX_PARTS || req->parts_num < 0) {
+		kfree(nsparam);
+		return -EINVAL;
+	}
+
+	if (req->parts_num > 0) {
+		nsparam->parts_num = req->parts_num;
+		memcpy(nsparam->parts, req->parts, sizeof(nsparam->parts));
+	}
+
 	switch (req->backend) {
 		case NANDSIM_BACKEND_RAM:
 			nsparam->bops = &ns_ram_bops;
@@ -2979,7 +2989,7 @@ static int __init ns_init_default(void)
 	nsparam->input_cycle = input_cycle;
 	nsparam->bus_width = bus_width;
 	nsparam->do_delays = do_delays;
-	nsparam->parts = parts;
+	memcpy(nsparam->parts, parts, sizeof(nsparam->parts));
 	nsparam->parts_num = parts_num;
 	nsparam->badblocks = badblocks;
 	nsparam->weakblocks = weakblocks;
diff --git a/include/linux/mtd/nandsim.h b/include/linux/mtd/nandsim.h
index 61ff5dd..07d32a9 100644
--- a/include/linux/mtd/nandsim.h
+++ b/include/linux/mtd/nandsim.h
@@ -12,7 +12,7 @@ struct nandsim_params {
 	unsigned int input_cycle;
 	unsigned int bus_width;
 	unsigned int do_delays;
-	unsigned int *parts;
+	unsigned int parts[NANDSIM_MAX_PARTS];
 	unsigned int parts_num;
 	char *badblocks;
 	char *weakblocks;
-- 
2.8.3
