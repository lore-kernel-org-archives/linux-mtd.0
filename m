Received: from [213.165.64.20] (helo=mail.gmx.net)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NShhu-0004bs-Cg
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 02:02:42 +0000
From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd/nand: Fix build failure caused by typo
Date: Thu, 7 Jan 2010 03:01:58 +0100
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201001070301.58260.PeterHuewe@gmx.de>
Cc: Nicolas Pitre <nico@marvell.com>, linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	linux-mtd@lists.infradead.org, Uwe
	=?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Peter Huewe <peterhuewe@gmx.de>
Date: Thu, 7 Jan 2010 02:51:13 +0100

This patch fixes a build failure[1] introduced by the patch
    mtd: orion_nand.c: add error handling and use resource_size()
    by H Hartley Sweeten [2]
The patch assigns something to a undeclared variable 'err', whereas the
rest of the code uses 'ret' for this task.

This patch fixes this typo and thus removes the build failure.

References:
[1] http://kisskb.ellerman.id.au/kisskb/buildresult/1983354/
[2] http://git.kernel.org/?p=linux/kernel/git/sfr/linux-next.git;a=commitdiff;h=e99030609e27abff7e1a868cb56384c678b09984

Patch against linux-next of Do 7. Jan 02:58:41 CET 2010

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/mtd/nand/orion_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 9903460..f16050c 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -92,7 +92,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
-		err = -ENODEV;
+		ret = -ENODEV;
 		goto no_res;
 	}
 
-- 
1.6.4.4
