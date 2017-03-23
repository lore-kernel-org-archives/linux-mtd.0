Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqT6-0004a2-Am
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:12 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 thorsten.christiansson@idquantique.com, laurent.monat@idquantique.com,
 Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RESEND PATCH v2 40/53] mtd: nand: do not check R/B# for CMD_READID
 in nand_command(_lp)
Date: Thu, 23 Mar 2017 09:17:49 +0900
Message-Id: <1490228282-10805-14-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Read ID (0x90) command does not toggle the R/B# pin.  Without this
patch, NAND_CMD_READID falls into the default: label, then R/B# is
checked by chip->dev_ready().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/nand_base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 807398d..c4c3329 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -668,6 +668,7 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_ERASE2:
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_STATUS:
+	case NAND_CMD_READID:
 		return;
 
 	case NAND_CMD_RESET:
@@ -786,6 +787,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_ERASE2:
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_STATUS:
+	case NAND_CMD_READID:
 		return;
 
 	case NAND_CMD_RNDIN:
-- 
2.7.4
