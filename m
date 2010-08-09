From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/2] mxc_nand: fix build error
Date: Mon,  9 Aug 2010 14:38:13 +0300
Message-Id: <4db426cd74bc8aae80ddcbf666681c3cd439dfc7.1281353601.git.baruch@tkos.co.il>
In-Reply-To: <cover.1281353601.git.baruch@tkos.co.il>
References: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
	<cover.1281353601.git.baruch@tkos.co.il>
Cc: John Ogness <john.ogness@linutronix.de>, Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

drivers/mtd/nand/mxc_nand.c: In function 'mxc_nand_command':
drivers/mtd/nand/mxc_nand.c:908: error: implicit declaration of function 'send_cmd'

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/mxc_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 4032e0b..3092240 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -905,13 +905,13 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 
 			/* Set program pointer to spare region */
 			if (mtd->writesize == 512)
-				send_cmd(host, NAND_CMD_READOOB, false);
+				host->send_cmd(host, NAND_CMD_READOOB, false);
 		} else {
 			host->buf_start = column;
 
 			/* Set program pointer to page start */
 			if (mtd->writesize == 512)
-				send_cmd(host, NAND_CMD_READ0, false);
+				host->send_cmd(host, NAND_CMD_READ0, false);
 		}
 
 		host->send_cmd(host, command, false);
-- 
1.7.1
