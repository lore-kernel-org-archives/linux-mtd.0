Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctsbf-0002Ta-2C
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 09:12:32 +0000
Received: by mail-lf0-x242.google.com with SMTP id v2so6750207lfi.2
 for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2017 02:12:10 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: use dev_of_node helper in mtd_get_of_node
Date: Fri, 31 Mar 2017 11:11:48 +0200
Message-Id: <20170331091148.19816-1-zajec5@gmail.com>
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

This allows better compile-time optimizations with CONFIG_OF disabled.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 include/linux/mtd/mtd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index eebdc63cf6af..f8db5b2e4028 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -393,7 +393,7 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
 
 static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
 {
-	return mtd->dev.of_node;
+	return dev_of_node(&mtd->dev);
 }
 
 static inline int mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
-- 
2.11.0
