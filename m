Received: from emailhub.stusta.mhn.de ([141.84.69.5]
	helo=mailhub.stusta.mhn.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IL3rE-0000GC-54
	for linux-mtd@lists.infradead.org; Tue, 14 Aug 2007 17:23:26 -0400
Date: Tue, 14 Aug 2007 23:23:11 +0200
From: Adrian Bunk <bunk@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Howells <dhowells@redhat.com>, dwmw2@infradead.org
Subject: [-mm patch] drivers/mtd/mtdbdi.c is no longer an own module
Message-ID: <20070814212311.GL18945@stusta.de>
References: <20070809015106.cd0bfc53.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20070809015106.cd0bfc53.akpm@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtdbdi.c is now in the same module as mtdcore.c

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

BTW: I'd even suggest merging mtdbdi.c into mtdcore.c since it only
     contains these 3 small structs.

 drivers/mtd/mtdbdi.c |    4 ----
 1 file changed, 4 deletions(-)

12a09e985ee2fe258cecfef9b811f9202ec87c67 
diff --git a/drivers/mtd/mtdbdi.c b/drivers/mtd/mtdbdi.c
index f9f8eef..ae2c06c 100644
--- a/drivers/mtd/mtdbdi.c
+++ b/drivers/mtd/mtdbdi.c
@@ -22,7 +22,6 @@
 struct backing_dev_info mtd_bdi_unmappable = {
 	.capabilities	= BDI_CAP_MAP_COPY,
 };
-EXPORT_SYMBOL_GPL(mtd_bdi_unmappable);
 
 /*
  * backing device capabilities for R/O mappable devices (such as ROM)
@@ -33,7 +32,6 @@ struct backing_dev_info mtd_bdi_ro_mappable = {
 	.capabilities	= (BDI_CAP_MAP_COPY | BDI_CAP_MAP_DIRECT |
 			   BDI_CAP_EXEC_MAP | BDI_CAP_READ_MAP),
 };
-EXPORT_SYMBOL_GPL(mtd_bdi_ro_mappable);
 
 /*
  * backing device capabilities for writable mappable devices (such as RAM)
@@ -45,6 +43,4 @@ struct backing_dev_info mtd_bdi_rw_mappable = {
 			   BDI_CAP_EXEC_MAP | BDI_CAP_READ_MAP |
 			   BDI_CAP_WRITE_MAP),
 };
-EXPORT_SYMBOL_GPL(mtd_bdi_rw_mappable);
 
-MODULE_LICENSE("GPL v2");
