Received: from smtp5.pp.htv.fi ([213.243.153.39])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlPYB-0002KA-BK
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 14:20:51 +0000
Date: Mon, 14 Apr 2008 17:19:46 +0300
From: Adrian Bunk <bunk@kernel.org>
To: dwmw2@infradead.org
Subject: [2.6 patch] mtd/ofpart.c: add MODULE_LICENSE
Message-ID: <20080414141946.GM6695@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the missing MODULE_LICENSE("GPL").

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
b530cd2188d467f2b157e77349baa8e854b61a17 diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index f86e069..4f80c2f 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -72,3 +72,5 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
 	return nr_parts;
 }
 EXPORT_SYMBOL(of_mtd_parse_partitions);
+
+MODULE_LICENSE("GPL");
