Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm5-0002YY-QC
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:02 +0000
Received: by mail-pf0-x242.google.com with SMTP id 66so7810510pfe.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:42 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 08/17] drivers:mtd:ubi:disable bakvol function while
 writing volume table
Date: Tue,  2 Feb 2016 02:30:43 +0000
Message-Id: <1454380252-16170-9-git-send-email-jackyard88@gmail.com>
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bean Huo <beanhuo@micron.com>

This file patch is to modify ubi_io_write_data() function,
and disable bakvol function while wirting volume table since
volume table is rarely modified.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/ubi/vtbl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 80bdd5b..6103f4e 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -329,7 +329,7 @@ retry:
 		goto write_error;
 
 	/* Write the layout volume contents */
-	err = ubi_io_write_data(ubi, vtbl, new_aeb->pnum, 0, ubi->vtbl_size);
+	err = ubi_io_write_data(ubi, vtbl, new_aeb->pnum, 0, ubi->vtbl_size, 0);
 	if (err)
 		goto write_error;
 
-- 
1.9.1
