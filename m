Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0omt-0007zv-FT
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 13:37:21 +0000
Received: by mail-lf0-x242.google.com with SMTP id v207-v6so33354127lfa.10
 for <linux-mtd@lists.infradead.org>; Tue, 27 Mar 2018 06:37:07 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: update documentation of mtd_device_parse_register()
Date: Tue, 27 Mar 2018 15:36:47 +0200
Message-Id: <20180327133647.15110-1-zajec5@gmail.com>
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

From: Rafał Miłecki <rafal@milecki.pl>

In the commit 2c77c57d22adb ("mtd: move code adding master MTD out of
mtd_add_device_partitions()") behavior of mtd_device_parse_register()
has very slightly changed. It's a pretty non-significant order change
to match updated function behavior.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/mtdcore.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index f25d65ea7149..20d5262c5b5c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -673,14 +673,13 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
  * 'parse_mtd_partitions()') and MTD device and partitions registering. It
  * basically follows the most common pattern found in many MTD drivers:
  *
- * * It first tries to probe partitions on MTD device @mtd using parsers
+ * * If the MTD_PARTITIONED_MASTER option is set, then the device as a whole is
+ *   registered first.
+ * * Then It tries to probe partitions on MTD device @mtd using parsers
  *   specified in @types (if @types is %NULL, then the default list of parsers
  *   is used, see 'parse_mtd_partitions()' for more information). If none are
  *   found this functions tries to fallback to information specified in
  *   @parts/@nr_parts.
- * * If any partitioning info was found, this function registers the found
- *   partitions. If the MTD_PARTITIONED_MASTER option is set, then the device
- *   as a whole is registered first.
  * * If no partitions were found this function just registers the MTD device
  *   @mtd and exits.
  *
-- 
2.11.0
