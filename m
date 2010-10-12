Received: from tango.tkos.co.il ([62.219.50.35])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P5a9x-0007HW-KR
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 08:24:34 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] nanddump: verify that start address is page aligned
Date: Tue, 12 Oct 2010 10:23:54 +0200
Message-Id: <50168b5d486e28a9d7f7685537710e05242c4f12.1286871735.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make nanddump consistent with nandwrite, which does not accept non page aligned
start addresses. Thus, non page aligned dumps are useless.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 nanddump.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 0fdf736..d6d1352 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -377,6 +377,12 @@ int main(int argc, char * const argv[])
 	}
 
 	/* Initialize start/end addresses and block size */
+	if (start_addr & (meminfo.writesize - 1)) {
+		fprintf(stderr, "The start address is not page-aligned !\n"
+				"The pagesize of this NAND Flash is 0x%x.\n",
+				meminfo.writesize);
+		goto closeall;
+	}
 	if (length)
 		end_addr = start_addr + length;
 	if (!length || end_addr > meminfo.size)
-- 
1.7.1
