Received: from mail-bw0-f12.google.com ([209.85.218.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LJq7Q-0005eC-KZ
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 14:07:48 +0000
Received: by bwz5 with SMTP id 5so16342971bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Jan 2009 06:07:47 -0800 (PST)
Message-ID: <71cd59b00901050606m5630aa05ra30b6d6b86d21932@mail.gmail.com>
Date: Mon, 5 Jan 2009 15:06:14 +0100
From: "Corentin Chary" <corentincj@iksaif.net>
Sender: corentin.chary@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] UBI: unmap operation via ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Corentin Chary <corentincj@iksaif.net>

UBI: unmap operation via ioctl

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/mtd/ubi/cdev.c |   12 ++++++++++++
 include/mtd/ubi-user.h |    3 ++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index db47121..7a9080c 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -530,6 +530,18 @@ static int vol_cdev_ioctl(struct inode *inode,
struct file *file,
 		err = ubi_leb_map(desc, req.lnum, req.dtype);
 		break;
 	}
+	case UBI_IOUNMAP:
+	{
+		int32_t lnum;
+
+		err = get_user(lnum, (__user int32_t *)argp);
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+		err = ubi_leb_unmap(desc, lnum);
+		break;
+	}

 #endif

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 8222f12..bcff3a0 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -135,7 +135,8 @@
 #define UBI_IOCEBCH _IOW(UBI_VOL_IOC_MAGIC, 2, int32_t)
 /* Map an eraseblock */
 #define UBI_IOMAP   _IOW(UBI_VOL_IOC_MAGIC, 3, struct ubi_map_req)
-
+/* Unmap an eraseblock */
+#define UBI_IOUNMAP _IOW(UBI_VOL_IOC_MAGIC, 4, int32_t)

 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
-- 
1.6.0.6
