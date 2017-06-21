Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNZ78-0003bS-31
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 06:27:45 +0000
Received: by mail-lf0-x242.google.com with SMTP id u62so18684011lfg.0
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 23:27:23 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Dan Ehrenberg <dehrenberg@chromium.org>
Subject: [PATCH V7 2/6] mtd: partitions: remove sysfs files when deleting all
 master's partitions
Date: Wed, 21 Jun 2017 08:26:43 +0200
Message-Id: <20170621062647.6072-3-zajec5@gmail.com>
In-Reply-To: <20170621062647.6072-1-zajec5@gmail.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170621062647.6072-1-zajec5@gmail.com>
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

When support for sysfs "offset" file was added it missed to update the
del_mtd_partitions function. It deletes partitions just like
mtd_del_partition does so both should also take care of removing sysfs
files.

This change moves sysfs_remove_files call to the shared function to fix
this issue.

Fixes: a62c24d755291 ("mtd: part: Add sysfs variable for offset of partition")
Cc: Dan Ehrenberg <dehrenberg@chromium.org>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V7: Introduction of this patch, it was separated from the 1/6. It should
    be clear now that this change is introduced. If something goes wrong
    it should also be easier to revert it this way.
---
 drivers/mtd/mtdpart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index bcec72148d0b..9434050accc7 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -660,6 +660,8 @@ static int __mtd_del_partition(struct mtd_part *priv)
 {
 	int err;
 
+	sysfs_remove_files(&priv->mtd.dev.kobj, mtd_partition_attrs);
+
 	err = del_mtd_device(&priv->mtd);
 	if (err)
 		return err;
@@ -700,8 +702,6 @@ int mtd_del_partition(struct mtd_info *master, int partno)
 	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
 		if ((slave->master == master) &&
 		    (slave->mtd.index == partno)) {
-			sysfs_remove_files(&slave->mtd.dev.kobj,
-					   mtd_partition_attrs);
 			ret = __mtd_del_partition(slave);
 			break;
 		}
-- 
2.11.0
