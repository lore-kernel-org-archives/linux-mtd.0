Received: from mail-qa0-x22d.google.com ([2607:f8b0:400d:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6Kjt-0004MT-HY
 for linux-mtd@lists.infradead.org; Wed, 31 Dec 2014 14:59:09 +0000
Received: by mail-qa0-f45.google.com with SMTP id f12so9770196qad.4
 for <linux-mtd@lists.infradead.org>; Wed, 31 Dec 2014 06:58:48 -0800 (PST)
From: Joe Balough <jbb5044@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: ubiformat: Add confirmation fail exit
Date: Wed, 31 Dec 2014 09:58:45 -0500
Message-Id: <1420037925-31156-3-git-send-email-jbb5044@gmail.com>
In-Reply-To: <1420037925-31156-1-git-send-email-jbb5044@gmail.com>
References: <1420037925-31156-1-git-send-email-jbb5044@gmail.com>
Cc: Joe Balough <jbb5044@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If flashing fails, ubiformat will exit with the value of 1.
If confirmation fails, ubiformat will exit with the value of 2.

Signed-off-by: Joe Balough <jbb5044@gmail.com>
---
 ubi-utils/ubiformat.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 4129404..3b8a22e 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -548,7 +548,7 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			err = mtd_read(mtd, args.node_fd, eb, 0, read_buf, new_len);
 			if (err) {
 				sys_errmsg("cannot readback eraseblock %d for confirmation", eb);
-				goto out_close;
+				goto out_confirm_fail;
 			}
 			
 			if (memcmp(buf, read_buf, new_len) != 0) {
@@ -568,6 +568,10 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 out_close:
 	close(fd);
 	return -1;
+	
+out_confirm_fail:
+	close(fd);
+	return -2;
 }
 
 static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
@@ -702,7 +706,7 @@ out_free:
 
 int main(int argc, char * const argv[])
 {
-	int err, verbose;
+	int err, verbose, confirm_fail = 0;
 	libmtd_t libmtd;
 	struct mtd_info mtd_info;
 	struct mtd_dev_info mtd;
@@ -932,6 +936,8 @@ int main(int argc, char * const argv[])
 
 	if (args.image) {
 		err = flash_image(libmtd, &mtd, &ui, si);
+		if (err == -2)
+			confirm_fail = 1;
 		if (err < 0)
 			goto out_free;
 
@@ -955,5 +961,8 @@ out_close:
 	close(args.node_fd);
 out_close_mtd:
 	libmtd_close(libmtd);
-	return -1;
+	if (confirm_fail)
+		return 2;
+	else
+		return 1;
 }
-- 
2.1.3
