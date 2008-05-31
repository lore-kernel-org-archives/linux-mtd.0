Received: from mx1.riseup.net ([204.13.164.18])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K2RTK-0000sL-2s
	for linux-mtd@lists.infradead.org; Sat, 31 May 2008 13:50:15 +0000
Resent-Message-ID: <20080531133004.GG3075@traven>
Message-Id: <20080531132809.319282660@kaehlcke.net>
References: <20080531132808.644758754@kaehlcke.net>
Date: Sat, 31 May 2008 15:28:10 +0200
From: matthias@kaehlcke.net
To: dwmw2@infradead.org,
 linux-mtd@lists.infradead.org
Subject: [patch 2/2] MTD: use list_for_each_entry() in del_mtd_device()
Content-Disposition: inline;
	filename=mtd-del_mtd_device-use-list_for_each_entry.patch
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Matthias Kaehlcke <matthias@kaehlcke.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD: use list_for_each_entry() instead of list_for_each() in del_mtd_device()

Signed-off-by: Matthias Kaehlcke <matthias@kaehlcke.net>

Index: linux-2.6/drivers/mtd/mtdcore.c
===================================================================
--- linux-2.6.orig/drivers/mtd/mtdcore.c	2008-05-31 15:18:13.000000000 +0200
+++ linux-2.6/drivers/mtd/mtdcore.c	2008-05-31 15:21:04.000000000 +0200
@@ -112,12 +112,11 @@
 		       mtd->index, mtd->name, mtd->usecount);
 		ret = -EBUSY;
 	} else {
-		struct list_head *this;
+		struct mtd_notifier *not;
 
 		/* No need to get a refcount on the module containing
 		   the notifier, since we hold the mtd_table_mutex */
-		list_for_each(this, &mtd_notifiers) {
-			struct mtd_notifier *not = list_entry(this, struct mtd_notifier, list);
+		list_for_each_entry(not, &mtd_notifiers, list) {
 			not->remove(mtd);
 		}
 

-- 
Matthias Kaehlcke
Embedded Linux Engineer
Barcelona

              We build too many walls and not enough bridges
                             (Isaac Newton)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
