Received: from mail.x-arc.de ([217.6.246.34] helo=root.phytec.de)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QBiIU-0008Tq-78
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 06:51:02 +0000
From: Jan Weitzel <j.weitzel@phytec.de>
To: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	Artem.Bityutskiy@nokia.com
Subject: [PATCH v2] ARM: omap2: mtd split nand_scan in ident and tail
Date: Mon, 18 Apr 2011 08:50:38 +0200
Message-Id: <1303109438-24309-1-git-send-email-j.weitzel@phytec.de>
In-Reply-To: <1302876214.3220.62.camel@localhost>
References: <1302876214.3220.62.camel@localhost>
Cc: tony@atomide.com, Jan Weitzel <j.weitzel@phytec.de>, s.hauer@pengutronix.de,
	s-ghorai@ti.com, vimalsingh@ti.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_scan calls nand_scan_tail and here we got a ecc.layout and calculate
oobavail for this layout. After calling nand_scan, we change the layout pointer
if OMAP_ECC_HAMMING_CODE_HW_ROMCODE is set. This results in not calcluated
oobavail. Mountig as jffs2 is not possible.

To fix that nand_scan has to split up in nand_scan_ident and nand_scan_tail
setting ecc.layout between these calls. So nand_scan_tail calculates oobvail
for the used layout. This is also done in serveral other platforms.

v2:
update commit message

Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
---
 drivers/mtd/nand/omap2.c |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index da9a351..288423f 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1073,9 +1073,9 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 	/* DIP switches on some boards change between 8 and 16 bit
 	 * bus widths for flash.  Try the other width if the first try fails.
 	 */
-	if (nand_scan(&info->mtd, 1)) {
+	if (nand_scan_ident(&info->mtd, 1, NULL)) {
 		info->nand.options ^= NAND_BUSWIDTH_16;
-		if (nand_scan(&info->mtd, 1)) {
+		if (nand_scan_ident(&info->mtd, 1, NULL)) {
 			err = -ENXIO;
 			goto out_release_mem_region;
 		}
@@ -1101,6 +1101,12 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 		info->nand.ecc.layout = &omap_oobinfo;
 	}
 
+	/* second phase scan */
+	if (nand_scan_tail(&info->mtd)) {
+		err = -ENXIO;
+		goto out_release_mem_region;
+	}
+
 #ifdef CONFIG_MTD_PARTITIONS
 	err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);
 	if (err > 0)
-- 
1.7.0.4
