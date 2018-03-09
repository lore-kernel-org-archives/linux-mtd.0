Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1euFd1-0008HU-1b
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2018 10:52:00 +0000
Received: by mail-io0-x242.google.com with SMTP id v6so3110700iog.7
 for <linux-mtd@lists.infradead.org>; Fri, 09 Mar 2018 02:51:48 -0800 (PST)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: use put_device() if device_register fail
Date: Fri,  9 Mar 2018 16:20:48 +0530
Message-Id: <39c4af723ea37cd05976a17cb9c1fbc975496ffd.1520592440.git.arvind.yadav.cs@gmail.com>
In-Reply-To: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
References: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
In-Reply-To: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
References: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
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
 drivers/mtd/mtdcore.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 28553c8..4d77ca2 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -586,6 +586,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	return 0;
 
 fail_added:
+	put_device(&mtd->dev);
 	of_node_put(mtd_get_of_node(mtd));
 	idr_remove(&mtd_idr, i);
 fail_locked:
-- 
1.9.1
