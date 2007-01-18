Received: from mo-p07-ob.rzone.de ([81.169.146.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7akM-00019o-Fb
	for linux-mtd@lists.infradead.org; Thu, 18 Jan 2007 12:08:26 -0500
Received: from ubuntu	(p57BD001F.dip0.t-ipconnect.de [87.189.0.31])
	by post.webmailer.de (mrclete mo34) (RZmta 3.11)	with ESMTP	id
	j0IGVP9T00282D for <linux-mtd@lists.infradead.org>;
	Thu, 18 Jan 2007 18:07:53 +0100 (MET)
Date: Thu, 18 Jan 2007 18:07:53 +0100 (MET)
From: Stefan Roese <ml@stefan-roese.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] physmap: Add support for 64 bit resources on PPC44x
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200701181808.11143.ml@stefan-roese.de>
Content-Type: text/plain;  charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD] physmap: Add support for 64 bit resources on PPC44x

This patch adds support for 64 bit resources and can be used on
PPC440 platforms to pass the complete 64 bit address from the
platform file to the physmap driver. This is first used on the
AMCC Taishan 440GX evaluation board.

Signed-off-by: Stefan Roese <sr@denx.de>

---
commit 428858620a600f991662969be6d6b3e3720da1ac
tree cf3c861fbdddd841401a1e66f441623f0b3fb83c
parent d637c5644df789f15dfe06550fab1dddb87083ca
author Stefan Roese <sr@denx.de> Thu, 18 Jan 2007 14:40:53 +0100
committer Stefan Roese <sr@denx.de> Thu, 18 Jan 2007 14:40:53 +0100

 drivers/mtd/maps/physmap.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index d171776..23072e3 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -116,7 +116,14 @@ static int physmap_flash_probe(struct platform_device 
*dev)
 	info->map.bankwidth = physmap_data->width;
 	info->map.set_vpp = physmap_data->set_vpp;
 
+#ifdef CONFIG_44x
+	if (sizeof(dev->resource->start) == 4)
+		info->map.virt = ioremap(info->map.phys, info->map.size);
+	else
+		info->map.virt = ioremap64(dev->resource->start, info->map.size);
+#else
 	info->map.virt = ioremap(info->map.phys, info->map.size);
+#endif
 	if (info->map.virt == NULL) {
 		dev_err(&dev->dev, "Failed to ioremap flash region\n");
 		err = EIO;
