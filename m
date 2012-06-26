Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjWks-0001Hs-Gn
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 14:28:35 +0000
Received: by bkwj4 with SMTP id j4so4665848bkw.36
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 07:28:32 -0700 (PDT)
Date: Tue, 26 Jun 2012 17:28:28 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Better comment NAND_BBT_NO_OOB
Message-ID: <20120626172828.4a458196@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Amend the comment to reflect the fact NAND_BBT_NO_OOB refers to the
location of the bad block table marker.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 5d9fcb7..211ff67 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -108,7 +108,10 @@ struct nand_bbt_descr {
  * OOB area. This option is passed to the default bad block table function.
  */
 #define NAND_BBT_USE_FLASH	0x00020000
-/* Do not store flash based bad block table in OOB area; store it in-band */
+/*
+ * Do not store flash based bad block table marker in the OOB area; store it
+ * in-band.
+ */
 #define NAND_BBT_NO_OOB		0x00040000
 /*
  * Do not write new bad block markers to OOB; useful, e.g., when ECC covers
