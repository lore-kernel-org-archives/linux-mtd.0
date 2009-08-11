Received: from rv-out-0708.google.com ([209.85.198.249])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mafyh-0000NS-V7
	for linux-mtd@lists.infradead.org; Tue, 11 Aug 2009 01:16:44 +0000
Received: by rv-out-0708.google.com with SMTP id c5so1062675rvf.42
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Aug 2009 18:16:35 -0700 (PDT)
Date: Tue, 11 Aug 2009 09:25:24 +0800
From: JiSheng Zhang <jszhang3@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: Fix allocation of volume table
Message-ID: <20090811092524.12e4494b@ustc>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, rmk@arm.linux.org.uk, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


We can't use vmalloc for the buffer used for volume table for some NAND
or NOR drivers may pass the buffer to DMA. And the volume table size
a.k.a vtbl_size is small so we can use kmalloc or kzalloc for it instead.

Signed-off-by: JiSheng Zhang <jszhang3@gmail.com>
---
 drivers/mtd/ubi/vtbl.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 1afc61e..9dcc7ba 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -424,12 +424,11 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 
 	/* Read both LEB 0 and LEB 1 into memory */
 	ubi_rb_for_each_entry(rb, seb, &sv->root, u.rb) {
-		leb[seb->lnum] = vmalloc(ubi->vtbl_size);
+		leb[seb->lnum] = kzalloc(ubi->vtbl_size, GFP_KERNEL);
 		if (!leb[seb->lnum]) {
 			err = -ENOMEM;
 			goto out_free;
 		}
-		memset(leb[seb->lnum], 0, ubi->vtbl_size);
 
 		err = ubi_io_read_data(ubi, leb[seb->lnum], seb->pnum, 0,
 				       ubi->vtbl_size);
@@ -515,10 +514,9 @@ static struct ubi_vtbl_record *create_empty_lvol(struct ubi_device *ubi,
 	int i;
 	struct ubi_vtbl_record *vtbl;
 
-	vtbl = vmalloc(ubi->vtbl_size);
+	vtbl = kzalloc(ubi->vtbl_size, GFP_KERNEL);
 	if (!vtbl)
 		return ERR_PTR(-ENOMEM);
-	memset(vtbl, 0, ubi->vtbl_size);
 
 	for (i = 0; i < ubi->vtbl_slots; i++)
 		memcpy(&vtbl[i], &empty_vtbl_record, UBI_VTBL_RECORD_SIZE);
-- 
1.6.3.3
