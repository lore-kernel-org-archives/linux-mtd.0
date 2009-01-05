Received: from mail-bw0-f12.google.com ([209.85.218.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LJq8Z-0005bB-V1
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 14:09:00 +0000
Received: by mail-bw0-f12.google.com with SMTP id 5so16342293bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Jan 2009 06:08:59 -0800 (PST)
Message-ID: <71cd59b00901050607l4356c850y2be8ea93d8437fbd@mail.gmail.com>
Date: Mon, 5 Jan 2009 15:07:19 +0100
From: "Corentin Chary" <corentincj@iksaif.net>
Sender: corentin.chary@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] UBI: is_mapped operation via ioctl
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

UBI: is_mapped operation via ioctl

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/mtd/ubi/cdev.c |   12 ++++++++++++
 include/mtd/ubi-user.h |    2 ++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 7a9080c..1bf21eb 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -542,6 +542,18 @@ static int vol_cdev_ioctl(struct inode *inode,
struct file *file,
 		err = ubi_leb_unmap(desc, lnum);
 		break;
 	}
+	case UBI_IOISMAP:
+	{
+		int32_t lnum;
+
+		err = get_user(lnum, (__user int32_t *)argp);
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+		err = ubi_is_mapped(desc, lnum);
+		break;
+	}

 #endif

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index bcff3a0..a65c4ab 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -137,6 +137,8 @@
 #define UBI_IOMAP   _IOW(UBI_VOL_IOC_MAGIC, 3, struct ubi_map_req)
 /* Unmap an eraseblock */
 #define UBI_IOUNMAP _IOW(UBI_VOL_IOC_MAGIC, 4, int32_t)
+/* check whether an eraseblock is mapped */
+#define UBI_IOISMAP _IOW(UBI_VOL_IOC_MAGIC, 5, int32_t)

 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
-- 
1.6.0.6
