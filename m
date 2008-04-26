Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JpnbJ-00034t-H6
	for linux-mtd@lists.infradead.org; Sat, 26 Apr 2008 16:50:15 +0000
Date: Sun, 27 Apr 2008 01:51:12 +0900 (JST)
Message-Id: <20080427.015112.25909517.anemo@mba.ocn.ne.jp>
To: avictor.za@gmail.com
Subject: Re: [PATCH] at91_nand: control NCE signal
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <cd73a99e0804251354pbcde429jb86f9a02825e0358@mail.gmail.com>
References: <20080424.235129.82088339.anemo@mba.ocn.ne.jp>
	<cd73a99e0804251354pbcde429jb86f9a02825e0358@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 25 Apr 2008 22:54:08 +0200, "Andrew Victor" <avictor.za@gmail.com> wrote:
> > This driver did not control NCE signal during normal operations (only
> >  enable NCE on probing and disable NCE on removing).  This patch make
> >  NCE signal inactive on idle state.
> 
> It might be better to call the existing at91_nand_enable() and
> at91_nand_disable() functions.
> ie,
>         if (ctrl & NAND_CTRL_CHANGE) {
>                 if (ctrl & NAND_NCE)
>                         at91_nand_enable(host)
>                 else
>                         at91_nand_disable(host);
>         }

Well, it might be.  I did not use at91_nand_enable/at91_nand_disable
just because they had been defined after at91_nand_cmd_ctrl() and they
were both very simple.

My patch already have been mainlined, so here is a patch against
latest linux-2.6 tree.

------------------------------------------------------
Subject: at91_nand: refactoring enable_pin manipulations

Use at91_nand_enable(), at91_nand_disable() to manipulate enable_pin.
No functional changes.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
 drivers/mtd/nand/at91_nand.c |   42 +++++++++++++++++++++---------------------
 1 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/at91_nand.c b/drivers/mtd/nand/at91_nand.c
index 414ceae..0adb287 100644
--- a/drivers/mtd/nand/at91_nand.c
+++ b/drivers/mtd/nand/at91_nand.c
@@ -94,6 +94,24 @@ struct at91_nand_host {
 };
 
 /*
+ * Enable NAND.
+ */
+static void at91_nand_enable(struct at91_nand_host *host)
+{
+	if (host->board->enable_pin)
+		at91_set_gpio_value(host->board->enable_pin, 0);
+}
+
+/*
+ * Disable NAND.
+ */
+static void at91_nand_disable(struct at91_nand_host *host)
+{
+	if (host->board->enable_pin)
+		at91_set_gpio_value(host->board->enable_pin, 1);
+}
+
+/*
  * Hardware specific access to control-lines
  */
 static void at91_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
@@ -101,11 +119,11 @@ static void at91_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	struct nand_chip *nand_chip = mtd->priv;
 	struct at91_nand_host *host = nand_chip->priv;
 
-	if (host->board->enable_pin && (ctrl & NAND_CTRL_CHANGE)) {
+	if (ctrl & NAND_CTRL_CHANGE) {
 		if (ctrl & NAND_NCE)
-			at91_set_gpio_value(host->board->enable_pin, 0);
+			at91_nand_enable(host);
 		else
-			at91_set_gpio_value(host->board->enable_pin, 1);
+			at91_nand_disable(host);
 	}
 	if (cmd == NAND_CMD_NONE)
 		return;
@@ -128,24 +146,6 @@ static int at91_nand_device_ready(struct mtd_info *mtd)
 }
 
 /*
- * Enable NAND.
- */
-static void at91_nand_enable(struct at91_nand_host *host)
-{
-	if (host->board->enable_pin)
-		at91_set_gpio_value(host->board->enable_pin, 0);
-}
-
-/*
- * Disable NAND.
- */
-static void at91_nand_disable(struct at91_nand_host *host)
-{
-	if (host->board->enable_pin)
-		at91_set_gpio_value(host->board->enable_pin, 1);
-}
-
-/*
  * write oob for small pages
  */
 static int at91_nand_write_oob_512(struct mtd_info *mtd,
