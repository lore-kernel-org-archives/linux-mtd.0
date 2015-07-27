Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJj1Q-000115-8e
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2015 14:04:53 +0000
Message-Id: <c14fec4f9669c06d3d20ef44ad02033b6cc6d51b.1438005615.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Mon, 27 Jul 2015 15:47:10 +0200
Subject: mtd-utils: mtd_debug: check amount of data read.
To: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The kernel refuses to read more data from a MTD device than the device
size. However, mtd_debug does not check the amount of data read as
returned by read(2) and assumes the requested amount is always read when
there is no error. Reading 8M data from a 4M flash chip results in 8M
file containing the flash data at the start.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 mtd_debug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mtd_debug.c b/mtd_debug.c
index d6993ce..f3826cf 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -141,7 +141,10 @@ retry:
 			perror("read()");
 			goto err2;
 		}
-		err = write(outfd, buf, size);
+		if (err < size) {
+			fprintf(stderr, "%s: short read, requested %#x, read %#x\n", __func__, size, err);
+		}
+		err = write(outfd, buf, err);
 		if (err < 0) {
 			fprintf(stderr, "%s: write, size %#x, n %#x\n", __func__, size, n);
 			perror("write()");
-- 
2.1.4
