Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1figtq-0000mm-Dy
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 14:05:55 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH mtd-utils] ubi-utils: ubimkvol: Initialize req to zero to make
 sure no flags are set by default
Date: Thu, 26 Jul 2018 16:05:29 +0200
Message-Id: <20180726140529.6261-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The program expects req.flags to be zero-initialized, but it's not
the case. Let's explicitly initialize req to zero at declaration time.

Fixes: 7b4a65a27d26 ("ubi-utils: ubimkvol: add support for skipping CRC check of a static volume when opening")
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 ubi-utils/ubimkvol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubi-utils/ubimkvol.c b/ubi-utils/ubimkvol.c
index 195006133216..b709b43a8318 100644
--- a/ubi-utils/ubimkvol.c
+++ b/ubi-utils/ubimkvol.c
@@ -221,7 +221,7 @@ int main(int argc, char * const argv[])
 	libubi_t libubi;
 	struct ubi_dev_info dev_info;
 	struct ubi_vol_info vol_info;
-	struct ubi_mkvol_request req;
+	struct ubi_mkvol_request req = { };
 
 	err = parse_opt(argc, argv);
 	if (err)
-- 
2.14.1
