Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8FVP-0008UO-6Z
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2015 22:52:39 +0000
Subject: [PATCH linux-next v4 10/11] mtd: bcm63xxpart: Move NOR flash layout
 to a separate function
To: Ralf Baechle <ralf@linux-mips.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
References: <566DF43B.5010400@simon.arlott.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <566DF69F.5090700@simon.arlott.org.uk>
Date: Sun, 13 Dec 2015 22:52:15 +0000
MIME-Version: 1.0
In-Reply-To: <566DF43B.5010400@simon.arlott.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move the NOR flash layout to a separate function to allow the NAND flash
layout to be supported.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
v4: New patch.

 drivers/mtd/bcm63xxpart.c | 54 ++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 41aa202..26c38a1 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -124,13 +124,11 @@ static int bcm63xx_read_image_tag(struct mtd_info *master, const char *name,
 	return 1;
 }
 
-static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
-					const struct mtd_partition **pparts,
-					struct mtd_part_parser_data *data)
+static int bcm63xx_parse_cfe_nor_partitions(struct mtd_info *master,
+	const struct mtd_partition **pparts, struct bcm963xx_nvram *nvram)
 {
 	/* CFE, NVRAM and global Linux are always present */
 	int nrparts = 3, curpart = 0;
-	struct bcm963xx_nvram *nvram = NULL;
 	struct bcm_tag *buf = NULL;
 	struct mtd_partition *parts;
 	int ret;
@@ -141,17 +139,6 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	int i;
 	bool rootfs_first = false;
 
-	if (bcm63xx_detect_cfe(master))
-		return -EINVAL;
-
-	nvram = vzalloc(sizeof(*nvram));
-	if (!nvram)
-		return -ENOMEM;
-
-	ret = bcm63xx_read_nvram(master, nvram);
-	if (ret)
-		goto out;
-
 	cfe_erasesize = max_t(uint32_t, master->erasesize,
 			      BCM963XX_CFE_BLOCK_SIZE);
 
@@ -159,12 +146,9 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	nvramlen = nvram->psi_size * SZ_1K;
 	nvramlen = roundup(nvramlen, cfe_erasesize);
 
-	/* Allocate memory for buffer */
 	buf = vmalloc(sizeof(struct bcm_tag));
-	if (!buf) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!buf)
+		return -ENOMEM;
 
 	/* Get the tag */
 	ret = bcm63xx_read_image_tag(master, "rootfs", cfelen, buf);
@@ -234,7 +218,6 @@ invalid_tag:
 	if (kernellen > 0)
 		nrparts++;
 
-	/* Ask kernel for more memory */
 	parts = kzalloc(sizeof(*parts) * nrparts + 10 * nrparts, GFP_KERNEL);
 	if (!parts) {
 		ret = -ENOMEM;
@@ -292,13 +275,40 @@ invalid_tag:
 	ret = 0;
 
 out:
-	vfree(nvram);
 	vfree(buf);
 
 	if (ret)
 		return ret;
 
 	return nrparts;
+}
+
+static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
+					const struct mtd_partition **pparts,
+					struct mtd_part_parser_data *data)
+{
+	struct bcm963xx_nvram *nvram = NULL;
+	int ret;
+
+	if (bcm63xx_detect_cfe(master))
+		return -EINVAL;
+
+	nvram = vzalloc(sizeof(*nvram));
+	if (!nvram)
+		return -ENOMEM;
+
+	ret = bcm63xx_read_nvram(master, nvram);
+	if (ret)
+		goto out;
+
+	if (!mtd_type_is_nand(master))
+		ret = bcm63xx_parse_cfe_nor_partitions(master, pparts, nvram);
+	else
+		ret = -EINVAL;
+
+out:
+	vfree(nvram);
+	return ret;
 };
 
 static struct mtd_part_parser bcm63xx_cfe_parser = {
-- 
2.1.4

-- 
Simon Arlott
