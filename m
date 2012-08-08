Received: from mail.windriver.com ([147.11.1.11])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Syw37-00047i-7c
 for linux-mtd@lists.infradead.org; Wed, 08 Aug 2012 02:31:05 +0000
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
 by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q782V3xe012733
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Tue, 7 Aug 2012 19:31:03 -0700 (PDT)
From: Jiang Lu <lu.jiang@windriver.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI:Force ubi driver load after mtd device drivers
Date: Wed, 8 Aug 2012 10:31:01 +0800
Message-ID: <1344393061-21037-1-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To implement rootfs on mtd device with UBIFS, kernel need create a
UBIFS device when booting:

drivers/mtd/ubi/build.c ubi_init()
for (i = 0; i < mtd_devs; i++) {
	...
	mtd = open_mtd_device(p->name);
	if (IS_ERR(mtd)) {
		err = PTR_ERR(mtd);
		goto out_detach;
	}

	ubi_attach_mtd_dev()
	...
}
module_init(ubi_init);

Kernel can not create the UBIFS device without corresponding mtd
partiton.

Some NAND device can not guarenteen the mtd patition created before
UBIFS deivce driver loading. Such as SPI NAND deivce, the mtd partition
will create after SPI bus driver loaded.

UBI device driver must load after other mtd device drivers to make sure
the mtd partition already exist when creating UBI deivce.

The patch updates the UBI device driver's initial routine to
late_initcall level.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 drivers/mtd/ubi/build.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 0fde9fc..efbcaef 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1275,7 +1275,7 @@ out:
 	ubi_err("UBI error: cannot initialize UBI, error %d", err);
 	return err;
 }
-module_init(ubi_init);
+late_initcall(ubi_init);
 
 static void __exit ubi_exit(void)
 {
-- 
1.7.9.5
