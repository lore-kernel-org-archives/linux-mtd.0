Received: from zmc.proxad.net ([212.27.53.206])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkeuu-0001gi-88
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 16:51:21 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: make panic_write() conditional to CONFIG_MTD_OOPS
Date: Tue, 10 Jan 2012 17:51:03 +0100
Message-Id: <1326214263-9843-1-git-send-email-ffainelli@freebox.fr>
In-Reply-To: <4F0C061B.9030802@freebox.fr>
References: <4F0C061B.9030802@freebox.fr>
Cc: Florian Fainelli <ffainelli@freebox.fr>, iws@ovro.caltech.edu,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtdoops driver is the only user of the panic_write callback
make all panic_write related code conditionnal to CONFIG_MTD_OOPS
so we can save some code. Since CONFIG_MTD_OOPS can be a module
use the newly introduced IS_ENABLED() macro to cope with that.

It is safe to define the panic_write callback as NULL when
CONFIG_MTD_OOPS is disabled since the mtdoops drivers check for the
callback being non-NULL and returns an error if this the case.

Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
---
 drivers/mtd/mtdpart.c              |    5 +++++
 drivers/mtd/nand/nand_base.c       |    7 +++++++
 drivers/mtd/onenand/onenand_base.c |    5 +++++
 3 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a3d44c3..0322388 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -189,6 +189,7 @@ static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return mtd_write(part->master, to + part->offset, len, retlen, buf);
 }
 
+#if IS_ENABLED(CONFIG_MTD_OOPS)
 static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
@@ -202,6 +203,10 @@ static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return mtd_panic_write(part->master, to + part->offset, len, retlen,
 			       buf);
 }
+#else
+#define part_panic_write	NULL
+#endif
+
 
 static int part_write_oob(struct mtd_info *mtd, loff_t to,
 		struct mtd_oob_ops *ops)
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8a393f9..da8d4a6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -753,6 +753,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
  *
  * Used when in panic, no locks are taken.
  */
+#if IS_ENABLED(CONFIG_MTD_OOPS)
 static void panic_nand_get_device(struct nand_chip *chip,
 		      struct mtd_info *mtd, int new_state)
 {
@@ -760,6 +761,7 @@ static void panic_nand_get_device(struct nand_chip *chip,
 	chip->controller->active = chip;
 	chip->state = new_state;
 }
+#endif
 
 /**
  * nand_get_device - [GENERIC] Get chip for selected access
@@ -2286,6 +2288,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
  * NAND write with ECC. Used when performing writes in interrupt context, this
  * may for example be called by mtdoops when writing an oops while in panic.
  */
+#if IS_ENABLED(CONFIG_MTD_OOPS)
 static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, const uint8_t *buf)
 {
@@ -2315,6 +2318,10 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	*retlen = ops.retlen;
 	return ret;
 }
+#else
+#define panic_nand_write	NULL
+#endif
+
 
 /**
  * nand_write - [MTD Interface] NAND write with ECC
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a061bc1..9f6a2a9 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1736,6 +1736,7 @@ static void onenand_panic_wait(struct mtd_info *mtd)
  *
  * Write with ECC
  */
+#if IS_ENABLED(CONFIG_MTD_OOPS)
 static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 			 size_t *retlen, const u_char *buf)
 {
@@ -1819,6 +1820,10 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	*retlen = written;
 	return ret;
 }
+#else
+#define onenand_panic_write	NULL
+#endif
+
 
 /**
  * onenand_fill_auto_oob - [INTERN] oob auto-placement transfer
-- 
1.7.5.4
