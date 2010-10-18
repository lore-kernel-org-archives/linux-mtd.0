Received: from tango.tkos.co.il ([62.219.50.35])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P7k4p-00031R-8B
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 07:24:12 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] nanddump: warn when the start address is not page aligned
Date: Mon, 18 Oct 2010 09:23:25 +0200
Message-Id: <1909cbad57553279212f156a0c7cb20178981909.1287386497.git.baruch@tkos.co.il>
In-Reply-To: <1287256127.1781.32.camel@brekeke>
References: <1287256127.1781.32.camel@brekeke>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nanddump should be consistent with nandwrite, which does not accept non page
aligned start addresses. Thus, non page aligned dumps are useless.

To ease migration only warn for now. Add the plan of making this an error to
feature-removal-schedule.txt.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 feature-removal-schedule.txt |   12 +++++++++++-
 nanddump.c                   |    7 +++++++
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index 21bc8d4..f4ed2a3 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -27,5 +27,15 @@ So the plan is (to be done by Artem Bityutskiy):
 3.1 adding a warning to make users stop using them
 3.2 removing both options.
 ---------------------------
-2.
+2. nanddump: fail when the -s parameter is not page aligned
+
+nanddump should be consistent with nandwrite, and refuse accepting non page 
+aligned start addresses. These dumps are most likely useless, since nandwrite 
+won't write then at this location. Currently only a warning is issued to keep 
+backward compatibility during a transition period. This should become an error 
+after 1.5.0.
+
+To be done by Artem Bityutskiy.
+---------------------------
+3.
 ---------------------------
diff --git a/nanddump.c b/nanddump.c
index 15bf9c4..bb649da 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -360,6 +360,13 @@ int main(int argc, char * const argv[])
 	}
 
 	/* Initialize start/end addresses and block size */
+	if (start_addr & (meminfo.writesize - 1)) {
+		fprintf(stderr, "WARNING: The start address is not page-aligned !\n"
+				"The pagesize of this NAND Flash is 0x%x.\n"
+				"nandwrite doesn't allow writes starting at this location.\n"
+				"Future versions of nanddump will fail here.\n",
+				meminfo.writesize);
+	}
 	if (length)
 		end_addr = start_addr + length;
 	if (!length || end_addr > meminfo.size)
-- 
1.7.1
