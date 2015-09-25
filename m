Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfUhG-0004JR-Gm
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 15:14:03 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Andrea Scian <rnd4@dave-tech.it>,
 =?UTF-8?q?Bean=20Huo=20=E9=9C=8D=E6=96=8C=E6=96=8C=20=28beanhuo=29?=
 <beanhuo@micron.com>,
 =?UTF-8?q?Karl=20Zhang=20=E5=BC=A0=E5=8F=8C=E9=94=A3=20=28karlzhang=29?=
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 3/5] UBI: switch the UBI device in read-only mode when mtd
 returns -EROFS
Date: Fri, 25 Sep 2015 17:09:16 +0200
Message-Id: <1443193758-22071-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND layer is now able to forward power-cut emulation errors from
a NAND driver to the MTD user.
Check for this kind of errors in UBI and switch the UBI device in read-only
mode if such an error occurs.
The error will also be forwarded to the UBI user requesting the operation
if any, thus allowing UBIFS to act accordingly.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/io.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 5bbd1f0..c5ebef7 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -303,6 +303,8 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		len = ubi->peb_size - offset;
 		if (len)
 			err = ubi_self_check_all_ff(ubi, pnum, offset, len);
+	} else if (err == -EROFS) {
+		ubi_ro_mode(ubi);
 	}
 
 	return err;
@@ -355,7 +357,7 @@ retry:
 
 	err = mtd_erase(ubi->mtd, &ei);
 	if (err) {
-		if (retries++ < UBI_IO_RETRIES) {
+		if (err != -EROFS && retries++ < UBI_IO_RETRIES) {
 			ubi_warn(ubi, "error %d while erasing PEB %d, retry",
 				 err, pnum);
 			yield();
-- 
1.9.1
