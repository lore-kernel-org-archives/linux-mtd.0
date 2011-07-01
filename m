Received: from mx1.zhaw.ch ([160.85.104.50])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QccFk-0004th-0E
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2011 11:51:20 +0000
From: Tobias Klauser <tklauser@distanz.ch>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: plat-nand: Fixup kerneldoc for struct platform_nand_chip
Date: Fri,  1 Jul 2011 13:51:15 +0200
Message-Id: <1309521075-18106-1-git-send-email-tklauser@distanz.ch>
Cc: Randy Dunlap <rdunlap@xenotime.net>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The set_parts and priv members of struct platform_nand_chip where
removed in commit c36a6ef3845262ade529afb9f458738b1f196f83 but the
kerneldoc wasn't updated.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 include/linux/mtd/nand.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 38a2fb6..6060f49 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -605,8 +605,6 @@ extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
  * @options:		Option flags, e.g. 16bit buswidth
  * @ecclayout:		ECC layout info structure
  * @part_probe_types:	NULL-terminated array of probe types
- * @set_parts:		platform specific function to set partitions
- * @priv:		hardware controller specific settings
  */
 struct platform_nand_chip {
 	int nr_chips;
-- 
1.7.5.4
