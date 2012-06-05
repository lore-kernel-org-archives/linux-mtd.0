Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbvPF-0004Gc-Mv
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 15:10:50 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH 4/5] UBI: fastmap: more annoying TODOs
Date: Tue,  5 Jun 2012 18:11:58 +0300
Message-Id: <1338909119-5188-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
References: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/fastmap.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index e6900e4..f938507 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -356,6 +356,14 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 		err = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
 
+		/* TODO: so here again - calling the function and checking what
+		 * it returns I consider to be one logical block which should
+		 * not contain newlines inbetween. You are inconsistent about
+		 * this and in some places you have a newline, in some you
+		 * don't. Could we please remove them globally in cases like
+		 * this?
+		 * Again my disclaimer: sorry, I hope this is not too annoying
+		 * for you. */
 		if (err == UBI_IO_FF || err == UBI_IO_FF_BITFLIPS)
 			continue;
 		else if (err == 0 || err == UBI_IO_BITFLIPS) {
@@ -394,6 +402,12 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 				list_del(&tmp_aeb->u.list);
 			}
 
+			/* TODO: could you please follow UBI style of how we
+			 * split lines? Notice that we aling arguments WRT the
+			 * bracket. We use few tabs, and then at the and use
+			 * few spaces for fine-tuning the alignment. Please,
+			 * let's be consistent. Take a look at any UBI file for
+			 * example. */
 			new_aeb = kmem_cache_alloc(ai->aeb_slab_cache,
 				GFP_KERNEL);
 			if (!new_aeb) {
-- 
1.7.10
