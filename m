Message-Id: <201004272114.o3RLEA5m020256@imap1.linux-foundation.org>
Subject: [patch 1/2] mtd: nandsim: fix typo: struct nandsin_geometry
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 27 Apr 2010 14:14:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: akpm@linux-foundation.org, wferi@niif.hu, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ferenc Wagner <wferi@niif.hu>

The name was spelled wrong.  We don't need an identifier on this struct
anyway, so remove it altogether.

Signed-off-by: Ferenc Wagner <wferi@niif.hu>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/nandsim.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/nand/nandsim.c~mtd-nandsim-fix-typo-struct-nandsin_geometry drivers/mtd/nand/nandsim.c
--- a/drivers/mtd/nand/nandsim.c~mtd-nandsim-fix-typo-struct-nandsin_geometry
+++ a/drivers/mtd/nand/nandsim.c
@@ -315,7 +315,7 @@ struct nandsim {
 	union ns_mem buf;
 
 	/* NAND flash "geometry" */
-	struct nandsin_geometry {
+	struct {
 		uint64_t totsz;     /* total flash size, bytes */
 		uint32_t secsz;     /* flash sector (erase block) size, bytes */
 		uint pgsz;          /* NAND flash page size, bytes */
_
