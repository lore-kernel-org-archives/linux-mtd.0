Received: from smtp.newsguy.com ([74.209.136.69])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVC80-0004FM-JW
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 01:04:56 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] backport mtd api change to ubi
Date: Mon, 28 Nov 2011 17:04:28 -0800
Message-Id: <1322528668-19768-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mike Dunn <mikedunn@newsguy.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Sukumar Ghorai <s-ghorai@ti.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Backport of the mtd api change to UBI.  Just adheres to the api, doesn't do
anything with it.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/ubi/io.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index f20b6f2..b082b58 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -135,6 +135,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 	int err, retries = 0;
 	size_t read;
 	loff_t addr;
+	unsigned int max_bitflips;
 
 	dbg_io("read %d bytes from PEB %d:%d", len, pnum, offset);
 
@@ -170,7 +171,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 
 	addr = (loff_t)pnum * ubi->peb_size + offset;
 retry:
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
+	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf, &max_bitflips);
 	if (err) {
 		const char *errstr = mtd_is_eccerr(err) ? " (ECC error)" : "";
 
@@ -1346,6 +1347,7 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 	int err, i;
 	size_t read;
 	void *buf1;
+	unsigned int max_bitflips;
 	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
 
 	if (!ubi->dbg->chk_io)
@@ -1357,7 +1359,7 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 		return 0;
 	}
 
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf1);
+	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf1, &max_bitflips);
 	if (err && !mtd_is_bitflip(err))
 		goto out_free;
 
@@ -1410,6 +1412,7 @@ int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 	size_t read;
 	int err;
 	void *buf;
+	unsigned int max_bitflips;
 	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
 
 	if (!ubi->dbg->chk_io)
@@ -1421,7 +1424,7 @@ int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 		return 0;
 	}
 
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
+	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf, &max_bitflips);
 	if (err && !mtd_is_bitflip(err)) {
 		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
 			"read %zd bytes", err, len, pnum, offset, read);
-- 
1.7.3.4
