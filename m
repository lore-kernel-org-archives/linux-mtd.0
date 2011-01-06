Received: from mail-px0-f177.google.com ([209.85.212.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PaepF-0007hS-4u
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2011 01:39:37 +0000
Received: by pxi7 with SMTP id 7so3836483pxi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jan 2011 17:39:35 -0800 (PST)
From: Charles Manning <cdhmanning@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 2/2] omap2 nand: Align subpage reads.
Date: Thu,  6 Jan 2011 14:39:02 +1300
Message-Id: <1294277942-1252-3-git-send-email-cdhmanning@gmail.com>
In-Reply-To: <1294277942-1252-1-git-send-email-cdhmanning@gmail.com>
References: <1294277942-1252-1-git-send-email-cdhmanning@gmail.com>
Cc: Charles Manning <cdhmanning@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Set align_subpage to align buffer to u32 to use the prefetch engine.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
---
 drivers/mtd/nand/omap2.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index cd41c58..3630971 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -886,6 +886,7 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 #else
 	info->nand.ecc.mode = NAND_ECC_SOFT;
 #endif
+	info->nand.align_subpage = nand_align_subpage32;
 
 	/* DIP switches on some boards change between 8 and 16 bit
 	 * bus widths for flash.  Try the other width if the first try fails.
-- 
1.7.1.5.g49342
