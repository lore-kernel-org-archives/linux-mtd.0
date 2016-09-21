Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeH1-00077O-Ml
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:57:18 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 40/46] mtd: nandsim: Expose BBT, delays, etc.. to userspace
Date: Wed, 21 Sep 2016 11:56:40 +0200
Message-Id: <ed72df000ff1ec36bb29b1e2a2d4080770bd0536.1474450296.git.dwalter@sigma-star.at>
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

Allow userspace to define nandsim parameters like
delays, bitflips, ...

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c  | 43 ++++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/nandsim.h |  2 +-
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 92f5efc..d1402df 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2593,11 +2593,37 @@ static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
 	nsparam->bus_width = req->bus_width;
 	nsparam->file_fd = req->file_fd;
 	nsparam->no_oob = !!req->no_oob;
-
-	if (req->parts_num > NANDSIM_MAX_PARTS || req->parts_num < 0) {
-		kfree(nsparam);
-		return -EINVAL;
-	}
+	nsparam->bbt = req->bbt_mode;
+	nsparam->bch = req->bch_strength;
+	nsparam->bitflips = req->bitflips;
+	nsparam->overridesize = req->overridesize;
+
+	if (req->bch_strength && req->no_oob)
+		goto err_inval;
+
+	if (req->access_delay && req->program_delay && req->erase_delay &&
+	    req->output_cycle && req->input_cycle) {
+		if (req->access_delay > MAX_UDELAY_MS * 1000)
+			goto err_inval;
+		if (req->program_delay > MAX_UDELAY_MS * 1000)
+			goto err_inval;
+		if (req->erase_delay > 1000)
+			goto err_inval;
+		if (req->output_cycle > MAX_UDELAY_MS * 1000)
+			goto err_inval;
+		if (req->input_cycle > MAX_UDELAY_MS * 1000)
+			goto err_inval;
+
+		nsparam->access_delay = req->access_delay;
+		nsparam->program_delay = req->program_delay;
+		nsparam->erase_delay = req->erase_delay;
+		nsparam->output_cycle = req->output_cycle;
+		nsparam->input_cycle = req->input_cycle;
+		nsparam->do_delays = true;
+	}
+
+	if (req->parts_num > NANDSIM_MAX_PARTS || req->parts_num < 0)
+		goto err_inval;
 
 	if (req->parts_num > 0) {
 		nsparam->parts_num = req->parts_num;
@@ -2618,8 +2644,7 @@ static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
 		break;
 
 		default:
-			kfree(nsparam);
-			return -EINVAL;
+			goto err_inval;
 	}
 
 	nsmtd = ns_new_instance(nsparam);
@@ -2632,6 +2657,10 @@ static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
 	ns = nand_get_controller_data(chip);
 
 	return ns->index;
+
+err_inval:
+	kfree(nsparam);
+	return -EINVAL;
 }
 
 static int ns_ctrl_destroy_instance(struct ns_destroy_instance_req *req)
diff --git a/include/linux/mtd/nandsim.h b/include/linux/mtd/nandsim.h
index 07d32a9..880c0b1 100644
--- a/include/linux/mtd/nandsim.h
+++ b/include/linux/mtd/nandsim.h
@@ -11,7 +11,7 @@ struct nandsim_params {
 	unsigned int output_cycle;
 	unsigned int input_cycle;
 	unsigned int bus_width;
-	unsigned int do_delays;
+	bool do_delays;
 	unsigned int parts[NANDSIM_MAX_PARTS];
 	unsigned int parts_num;
 	char *badblocks;
-- 
2.8.3
