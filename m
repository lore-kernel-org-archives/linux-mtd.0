To: LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] mtd: nand: drop kernel-doc notation for a deleted function
 parameter
Message-ID: <88c00c96-cfd2-4ff1-e753-8875501895df@infradead.org>
Date: Sun, 4 Nov 2018 18:38:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <rdunlap@infradead.org>

Remove kernel-doc notation for a deleted function parameter to prevent
a kernel-doc warning:

../drivers/mtd/nand/raw/nand_base.c:603: warning: Excess function parameter 'mtd' description in 'panic_nand_wait'

Fixes: f1d46942e823 ("mtd: rawnand: Pass a nand_chip object to chip->waitfunc()")

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
---

 drivers/mtd/nand/raw/nand_base.c |    1 -
 1 file changed, 1 deletion(-)

--- lnx-420-rc1.orig/drivers/mtd/nand/raw/nand_base.c
+++ lnx-420-rc1/drivers/mtd/nand/raw/nand_base.c
@@ -590,7 +590,6 @@ retry:
 
 /**
  * panic_nand_wait - [GENERIC] wait until the command is done
- * @mtd: MTD device structure
  * @chip: NAND chip structure
  * @timeo: timeout
  *
