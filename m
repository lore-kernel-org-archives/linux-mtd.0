Message-Id: <200909181951.n8IJpnZg023824@imap1.linux-foundation.org>
Subject: [patch 09/13] mtd/jffs2: fix read buffer overflow
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Fri, 18 Sep 2009 12:51:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: roel.kluin@gmail.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roel Kluin <roel.kluin@gmail.com>

Prevent a read from mtd->eraseregions[-1]

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/devices/lart.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff -puN drivers/mtd/devices/lart.c~mtd-jffs2-fix-read-buffer-overflow drivers/mtd/devices/lart.c
--- a/drivers/mtd/devices/lart.c~mtd-jffs2-fix-read-buffer-overflow
+++ a/drivers/mtd/devices/lart.c
@@ -393,7 +393,8 @@ static int flash_erase (struct mtd_info 
 	* erase range is aligned with the erase size which is in
 	* effect here.
 	*/
-   if (instr->addr & (mtd->eraseregions[i].erasesize - 1)) return (-EINVAL);
+   if (i < 0 || (instr->addr & (mtd->eraseregions[i].erasesize - 1)))
+      return -EINVAL;
 
    /* Remember the erase region we start on */
    first = i;
@@ -409,7 +410,8 @@ static int flash_erase (struct mtd_info 
    i--;
 
    /* is the end aligned on a block boundary? */
-   if ((instr->addr + instr->len) & (mtd->eraseregions[i].erasesize - 1)) return (-EINVAL);
+   if (i < 0 || ((instr->addr + instr->len) & (mtd->eraseregions[i].erasesize - 1)))
+      return -EINVAL;
 
    addr = instr->addr;
    len = instr->len;
_
