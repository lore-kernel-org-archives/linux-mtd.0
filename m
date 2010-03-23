Received: from tac.ki.iif.hu ([2001:738:0:401:20c:6eff:fe71:b2db])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nu7az-00050z-PV
	for linux-mtd@lists.infradead.org; Tue, 23 Mar 2010 17:08:51 +0000
From: Ferenc Wagner <wferi@niif.hu>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Replace the dangerous to_fsl_upm_nand macro with an
	inline function
Date: Tue, 23 Mar 2010 18:08:16 +0100
Message-ID: <87iq8n0xvj.fsf@tac.ki.iif.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The original macro worked only when applied to variables named 'mtd'.
While this could have been fixed by simply renaming the macro argument,
a more type-safe replacement is preferred.

Signed-off-by: Ferenc Wagner <wferi@niif.hu>
---
 drivers/mtd/nand/fsl_upm.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 071a60c..02d1688 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -48,7 +48,10 @@ struct fsl_upm_nand {
 	uint32_t wait_flags;
 };
 
-#define to_fsl_upm_nand(mtd) container_of(mtd, struct fsl_upm_nand, mtd)
+inline struct fsl_upm_nand *to_fsl_upm_nand(struct mtd_info *mtdinfo)
+{
+	return container_of(mtdinfo, struct fsl_upm_nand, mtd);
+}
 
 static int fun_chip_ready(struct mtd_info *mtd)
 {
-- 
1.5.6.5
