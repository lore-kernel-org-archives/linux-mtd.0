Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewND3-0003tA-9D
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 07:21:58 +0000
Received: by mail-io0-x243.google.com with SMTP id e30so7399989ioc.3
 for <linux-mtd@lists.infradead.org>; Thu, 15 Mar 2018 00:21:45 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/2 v2] mtd: ubi: use put_device() if device_register fail
Date: Thu, 15 Mar 2018 12:50:31 +0530
Message-Id: <1521098431-29565-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

if device_register() returned an error! Always use put_device()
to give up the reference initialized.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
change in v2:
        Fix use-after-free bug. move put_device() after cdev_del().

 drivers/mtd/ubi/vmt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 3fd8d7f..93c6163 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -610,6 +610,7 @@ int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 
 out_cdev:
 	cdev_del(&vol->cdev);
+	put_device(&vol->dev);
 	return err;
 }
 
-- 
1.9.1
