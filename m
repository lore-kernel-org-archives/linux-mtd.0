Received: from mail-yw0-f172.google.com ([209.85.211.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NiPg9-00038Q-WB
	for linux-mtd@lists.infradead.org; Fri, 19 Feb 2010 10:01:50 +0000
Received: by ywh2 with SMTP id 2so821974ywh.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Feb 2010 02:01:44 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 19 Feb 2010 19:01:22 +0900
Message-Id: <20100219100122.6122.78528.sendpatchset@t400s>
Subject: [PATCH] mtd: enable sh_flctl on SH-Mobile ARM
Cc: dwmw2@infradead.org, lethal@linux-sh.org,
	Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Magnus Damm <damm@opensource.se>

Update the Kconfig entry for the sh_flctl driver to
enable build on SH-Mobile ARM platforms.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Applies on top of the other FLCTL changes in the sh-2.6 git tree.

 drivers/mtd/nand/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/drivers/mtd/nand/Kconfig
+++ work/drivers/mtd/nand/Kconfig	2010-02-19 18:55:44.000000000 +0900
@@ -457,7 +457,7 @@ config MTD_NAND_NOMADIK
 
 config MTD_NAND_SH_FLCTL
 	tristate "Support for NAND on Renesas SuperH FLCTL"
-	depends on MTD_NAND && SUPERH
+	depends on MTD_NAND && (SUPERH || ARCH_SHMOBILE)
 	help
 	  Several Renesas SuperH CPU has FLCTL. This option enables support
 	  for NAND Flash using FLCTL.
