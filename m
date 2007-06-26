Received: from agminet01.oracle.com ([141.146.126.228])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I3JWU-0004MF-56
	for linux-mtd@lists.infradead.org; Tue, 26 Jun 2007 18:28:35 -0400
Date: Tue, 26 Jun 2007 15:30:27 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -mm] UBI: one less BUG usage
Message-Id: <20070626153027.cbe757f0.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: akpm <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

Eliminate one BUG() usage.  The callers of major_to_device() already
handle and report errors.  This is just another error to return.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/ubi/cdev.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- linux-2622-rc4mm2.orig/drivers/mtd/ubi/cdev.c
+++ linux-2622-rc4mm2/drivers/mtd/ubi/cdev.c
@@ -63,7 +63,7 @@ static struct ubi_device *major_to_devic
 	for (i = 0; i < ubi_devices_cnt; i++)
 		if (ubi_devices[i] && ubi_devices[i]->major == major)
 			return ubi_devices[i];
-	BUG();
+	return ERR_PTR(-ENODEV);
 }
 
 /**
@@ -127,6 +127,9 @@ static int vol_cdev_open(struct inode *i
 	int vol_id = iminor(inode) - 1;
 	int mode;
 
+	if (IS_ERR(ubi))
+		return PTR_ERR(ubi);
+
 	if (file->f_mode & FMODE_WRITE)
 		mode = UBI_READWRITE;
 	else
