Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqT6-0004a0-Af
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:15 +0000
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
Subject: [RESEND PATCH v2 41/53] mtd: nand: do not check R/B# for
 CMD_SET_FEATURES in nand_command(_lp)
Date: Thu, 23 Mar 2017 09:17:50 +0900
Message-Id: <1490228282-10805-15-git-send-email-yamada.masahiro@socionext.com>
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

Set Features (0xEF) command toggles the R/B# pin after 4 sub feature
parameters are written.

Currently, nand_command(_lp) calls chip->dev_ready immediately after
the address cycle because NAND_CMD_SET_FEATURES falls into default:
label.  No wait is needed at this point.

If you see nand_onfi_set_features(), R/B# is already cared by the
chip->waitfunc call.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/nand_base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c4c3329..e13f959 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -669,6 +669,7 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_STATUS:
 	case NAND_CMD_READID:
+	case NAND_CMD_SET_FEATURES:
 		return;
 
 	case NAND_CMD_RESET:
@@ -788,6 +789,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_STATUS:
 	case NAND_CMD_READID:
+	case NAND_CMD_SET_FEATURES:
 		return;
 
 	case NAND_CMD_RNDIN:
-- 
2.7.4
