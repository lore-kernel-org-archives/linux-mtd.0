Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGM1d-00069B-TF
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 03:41:34 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq8so14273168pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 20:41:33 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/9] mtd: nand: increase max OOB size to 640
Date: Mon, 24 Sep 2012 20:40:53 -0700
Message-Id: <1348544455-17656-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
References: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
Cc: Angus Clark <angus.clark@st.com>, Mike Dunn <mikedunn@newsguy.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some Hynix and Samsung MLC NAND have 640B OOB size. Sooner or later, we should
dynamically allocate the buffers that use these macros.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/nand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index ce22824..817ff5a 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -56,7 +56,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
  * is supported now. If you add a chip with bigger oobsize/page
  * adjust this accordingly.
  */
-#define NAND_MAX_OOBSIZE	576
+#define NAND_MAX_OOBSIZE	640
 #define NAND_MAX_PAGESIZE	8192
 
 /*
-- 
1.7.11.3
