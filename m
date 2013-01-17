Received: from mail.prodrive.nl ([212.61.153.67])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tvu6Y-0007Sx-G0
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 18:22:26 +0000
From: Stef van Os <stef.van.os@prodrive.nl>
To: <dwmw2@infradead.org>, <artem.bityutskiy@linux.intel.com>,
 <wfp5p@virginia.edu>, <gregkh@linuxfoundation.org>, <sr@denx.de>,
 <plagnioj@jcrosoft.com>
Subject: [PATCH 1/1] mtd: physmap_of: fix illegal dereference
Date: Thu, 17 Jan 2013 19:22:12 +0100
Message-ID: <1358446932-7238-1-git-send-email-stef.van.os@prodrive.nl>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stef van Os <stef.van.os@prodrive.nl>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

d68cbdd introduced a new way of getting the name of an mtd
partion. The character pointer is not initialized, and only
checked against NULL, not at other random garbage.
This patch fixes the resulting panic.

Signed-off-by: Stef van Os <stef.van.os@prodrive.nl>
---
 drivers/mtd/maps/physmap_of.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 67cc73c..7901d72 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -170,7 +170,7 @@ static int of_flash_probe(struct platform_device *dev)
 	resource_size_t res_size;
 	struct mtd_part_parser_data ppdata;
 	bool map_indirect;
-	const char *mtd_name;
+	const char *mtd_name = NULL;
 
 	match = of_match_device(of_flash_match, &dev->dev);
 	if (!match)
-- 
1.7.2.5
