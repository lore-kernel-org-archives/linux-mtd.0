Received: from 2.mo5.mail-out.ovh.net ([178.33.109.111])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT7LH-0007jP-WB
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 13:29:00 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 21E476CB3E
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 14:28:33 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/3] mtd: name the mtd device with an optional label property
Date: Mon, 16 Jan 2017 14:27:03 +0100
Message-Id: <1484573225-19095-2-git-send-email-clg@kaod.org>
In-Reply-To: <1484573225-19095-1-git-send-email-clg@kaod.org>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This can be used to easily identify a specific chip on a system with
multiple chips.

Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/mtdcore.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 052772f7caef..bf61557b599d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -654,6 +654,13 @@ static int mtd_add_device_partitions(struct mtd_info *mtd,
  */
 static void mtd_set_dev_defaults(struct mtd_info *mtd)
 {
+	/*
+	 * If DT support is enabled and we have a valid of_node pointer, try to
+	 * extract the MTD name from the label property.
+	 */
+	if (IS_ENABLED(CONFIG_OF) && mtd->dev.of_node)
+		of_property_read_string(mtd->dev.of_node, "label", &mtd->name);
+
 	if (mtd->dev.parent) {
 		if (!mtd->owner && mtd->dev.parent->driver)
 			mtd->owner = mtd->dev.parent->driver->owner;
-- 
2.7.4
