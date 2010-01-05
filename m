From: vimalsingh@ti.com (Vimal Singh)
Date: Tue, 5 Jan 2010 16:37:03 +0530
Subject: [PATCH] NAND: OMAP: Fixing issue in oamp nand driver in
Message-ID: <mailman.126.1262786821.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

prefetch mode read

There is a bug in nand prefetch read routine, which comes into effect
only if nand device is a 16-bit device (as we have in zoom boards).
This bug is effective only with below combination of conditions:
1. nand deivce, in use, is a 16 bit device
2. nand driver supports 'subpage' read
3. SW ECC is in use

This was not seen old  kernel (ex: .23), because when, in early days,
we tested this (nand prefetch read in LDP boards) there was no
'subpage read' support.
Later when we had subpage read in (.27) kernel, we had hw ecc enabled
always in our internal tree. So, we missed this bug.

This patch fixes the issue.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/omap2.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 16120e2..7df303a 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -295,11 +295,14 @@ static void omap_read_buf_pref(struct mtd_info
*mtd, u_char *buf, int len)
 	u32 *p = (u32 *)buf;

 	/* take care of subpage reads */
-	for (; len % 4 != 0; ) {
-		*buf++ = __raw_readb(info->nand.IO_ADDR_R);
-		len--;
+	if (len % 4) {
+		if (info->nand.options & NAND_BUSWIDTH_16)
+			omap_read_buf16(mtd, buf, len % 4);
+		else
+			omap_read_buf8(mtd, buf, len % 4);
+		p = (u32 *) (buf + len % 4);
+		len -= len % 4;
 	}
-	p = (u32 *) buf;

 	/* configure and start prefetch transfer */
 	ret = gpmc_prefetch_enable(info->gpmc_cs, 0x0, len, 0x0);
-- 
1.5.5
