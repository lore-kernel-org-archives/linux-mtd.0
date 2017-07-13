Received: from ca-mx01.263.net ([50.18.194.75] helo=smtphy.263.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dVSAG-000617-33
 for linux-mtd@lists.infradead.org; Thu, 13 Jul 2017 00:39:34 +0000
Received: from transport.263xmail.com (unknown [38.83.106.156])
 by smtphy.263.net (Postfix) with ESMTPS id 097D9120425
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2017 08:39:08 +0800 (CST)
Received: from lucky1.263xmail.com (unknown [192.168.165.181])
 by transportlucky.263xmail.com (Postfix) with ESMTP id 7F3AC406F
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2017 08:39:05 +0800 (CST)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] mtd: spi-nor: remove a bogus check of header.minor
Date: Thu, 13 Jul 2017 08:38:31 +0800
Message-Id: <1499906311-75170-1-git-send-email-shawn.lin@rock-chips.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

header.minor is a unsigned data type and this check should
never happen. So remove this bogus check.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/mtd/spi-nor/spi-nor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 196b52f..fea8675 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2237,8 +2237,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 
 	/* Check the SFDP header version. */
 	if (le32_to_cpu(header.signature) != SFDP_SIGNATURE ||
-	    header.major != SFDP_JESD216_MAJOR ||
-	    header.minor < SFDP_JESD216_MINOR)
+	    header.major != SFDP_JESD216_MAJOR)
 		return -EINVAL;
 
 	/*
-- 
1.9.1
