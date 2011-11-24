Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
 helo=VA3EHSOBE008.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTOZM-0004Ui-K1
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 01:57:45 +0000
From: <b35362@freescale.com>
To: <dwmw2@infradead.org>, <Artem.Bityutskiy@nokia.com>,
 <scottwood@freescale.com>
Subject: [PATCH 2/3] mtd/nand : set correct length to FBCR for a non-full-page
 write
Date: Thu, 24 Nov 2011 08:41:45 +0800
Message-ID: <1322095306-13156-2-git-send-email-b35362@freescale.com>
In-Reply-To: <1322095306-13156-1-git-send-email-b35362@freescale.com>
References: <1322095306-13156-1-git-send-email-b35362@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org,
 leoli@freescale.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
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
