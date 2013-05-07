Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZbUU-0004KS-KX
 for linux-mtd@lists.infradead.org; Tue, 07 May 2013 06:35:11 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMF00DBM0XP02A0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 07 May 2013 15:34:48 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 13/26] mtd: nand: docg4: remove unnecessary
 platform_set_drvdata()
Date: Tue, 07 May 2013 15:34:48 +0900
Message-id: <005101ce4aec$f89a6b90$e9cf42b0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, Jingoo Han <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Mike Dunn' <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver core clears the driver data to NULL after device_release
or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
(device-core: Ensure drvdata = NULL when no driver is bound).
Thus, it is not needed to manually clear the device driver data to NULL.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/docg4.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index fa25e7a..dc86d4a 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1368,7 +1368,6 @@ static int __init probe_docg4(struct platform_device *pdev)
 		struct nand_chip *nand = mtd->priv;
 		struct docg4_priv *doc = nand->priv;
 		nand_release(mtd); /* deletes partitions and mtd devices */
-		platform_set_drvdata(pdev, NULL);
 		free_bch(doc->bch);
 		kfree(mtd);
 	}
@@ -1380,7 +1379,6 @@ static int __exit cleanup_docg4(struct platform_device *pdev)
 {
 	struct docg4_priv *doc = platform_get_drvdata(pdev);
 	nand_release(doc->mtd);
-	platform_set_drvdata(pdev, NULL);
 	free_bch(doc->bch);
 	kfree(doc->mtd);
 	iounmap(doc->virtadr);
-- 
1.7.2.5
