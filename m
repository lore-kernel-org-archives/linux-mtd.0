Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
 helo=VA3EHSOBE002.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RX4wS-0002LO-7P
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 05:48:49 +0000
From: <shuo.liu@freescale.com>
To: <dwmw2@infradead.org>, <Artem.Bityutskiy@nokia.com>,
 <scottwood@freescale.com>
Subject: [PATCH 2/3] mtd/nand : set correct length to FBCR for a non-full-page
 write
Date: Sun, 4 Dec 2011 12:31:37 +0800
Message-ID: <1322973098-2528-2-git-send-email-shuo.liu@freescale.com>
In-Reply-To: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
References: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-kernel@vger.kernel.org, shuo.liu@freescale.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org, leoli@freescale.com,
 linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Liu Shuo <b35362@freescale.com>

When we do a non-full-page write, the length be set to FBCR should
not be 'elbc_fcm_ctrl->index', it should be 'elbc_fcm_ctrl->index -
elbc_fcm_ctrl->column'.

Signed-off-by: Liu Shuo <b35362@freescale.com>
Signed-off-by: Li Yang <leoli@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 6fce7da..d634c5f 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -474,7 +474,8 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		 */
 		if (elbc_fcm_ctrl->oob || elbc_fcm_ctrl->column != 0 ||
 		    elbc_fcm_ctrl->index != mtd->writesize + mtd->oobsize)
-			out_be32(&lbc->fbcr, elbc_fcm_ctrl->index);
+			out_be32(&lbc->fbcr,
+				elbc_fcm_ctrl->index - elbc_fcm_ctrl->column);
 		else
 			out_be32(&lbc->fbcr, 0);
 
-- 
1.7.1
