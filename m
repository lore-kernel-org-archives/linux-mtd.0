Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4DRH-0002Dz-Nc
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 16:05:57 +0000
Received: by wgbez12 with SMTP id ez12so676174wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 09:05:30 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH MTD-UTILS v2 4/4] ubiattach: fail if kernel ignores
 max_beb_per1024
Date: Wed, 22 Aug 2012 18:04:37 +0200
Message-Id: <1345651477-5301-5-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
References: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the kernel doesn't know the max_beb_per1024 parameter in the attach
ioctl, but the call still succeeded ubi_attach and ubi_attach_mtd will
return 1 instead of 0.

In this case, the ubiattach command will detach the device and fail with
an error message.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 ubi-utils/include/libubi.h |    7 +++++--
 ubi-utils/libubi.c         |   34 ++++++++++++++++++++++++++++++++++
 ubi-utils/ubiattach.c      |    9 ++++++++-
 3 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/ubi-utils/include/libubi.h b/ubi-utils/include/libubi.h
index 28c8782..da3956d 100644
--- a/ubi-utils/include/libubi.h
+++ b/ubi-utils/include/libubi.h
@@ -218,7 +218,9 @@ int mtd_num2ubi_dev(libubi_t desc, int mtd_num, int *dev_num);
  * @req: MTD attach request.
  *
  * This function creates a new UBI device by attaching an MTD device as
- * described by @req. Returns %0 in case of success and %-1 in case of failure.
+ * described by @req.
+ * Returns %0 in case of success, %-1 in case of failure (errno is set) and %1
+ * if parameter @req->max_beb_per1024 was ignored by kernel.
  * The newly created UBI device number is returned in @req->dev_num.
  */
 int ubi_attach_mtd(libubi_t desc, const char *node,
@@ -235,7 +237,8 @@ int ubi_attach_mtd(libubi_t desc, const char *node,
  * device node. Otherwise functionality is similar than in function
  * 'ubi_attach_mtd()' where @req->mtd_num is used.
  *
- * Returns %0 in case of success and %-1 in case of failure (errno is set).
+ * Returns %0 in case of success, %-1 in case of failure (errno is set) and %1
+ * if parameter @req->max_beb_per1024 was ignored by kernel.
  * The newly created UBI device number is returned in @req->dev_num.
  * The MTD device number is returned in @req->mtd_num (-1 if not found)
  */
diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
index 1b62e59..cc20667 100644
--- a/ubi-utils/libubi.c
+++ b/ubi-utils/libubi.c
@@ -719,6 +719,40 @@ int ubi_attach_mtd(libubi_t desc, const char *node,
 	r.ubi_num = req->dev_num;
 	r.mtd_num = req->mtd_num;
 	r.vid_hdr_offset = req->vid_hdr_offset;
+
+	if (req->max_beb_per1024) {
+		/*
+		 * max_beb_per1024 was provided by user.
+		 * In this case, we have to check if it's supported by kernel
+		 * or not.
+		 * For that, we're going to make a first call with a wrong
+		 * value.
+		 * If the return value is OK, it means that the kernel doesn't
+		 * support the feature.
+		 * If the return value is not OK nor -EINVAL, another error
+		 * happened.
+		 * If the return value is -EINVAL, we're making a second call,
+		 * with the real value this time.
+		 */
+		r.max_beb_per1024 = -1;
+		ret = do_attach(node, &r);
+		if (ret == 0) {
+			req->dev_num = r.ubi_num;
+			/*
+			 * The call succeeded. It means that the kernel ignored
+			 * max_beb_per1024 parameter. We return 1 to let the
+			 * user know about this.
+			 */
+			return 1;
+		} else {
+			if (errno != EINVAL)
+				return ret;
+			/*
+			 * max_beb_per1024 may be supported,
+			 * let's make the 2nd call.
+			 */
+		}
+	}
 	r.max_beb_per1024 = req->max_beb_per1024;
 
 	ret = do_attach(node, &r);
diff --git a/ubi-utils/ubiattach.c b/ubi-utils/ubiattach.c
index 4521788..1cf0025 100644
--- a/ubi-utils/ubiattach.c
+++ b/ubi-utils/ubiattach.c
@@ -214,12 +214,19 @@ int main(int argc, char * const argv[])
 	req.max_beb_per1024 = args.max_beb_per1024;
 
 	err = ubi_attach(libubi, args.node, &req);
-	if (err) {
+	if (err < 0) {
 		if (args.dev)
 			sys_errmsg("cannot attach \"%s\"", args.dev);
 		else
 			sys_errmsg("cannot attach mtd%d", args.mtdn);
 		goto out_libubi;
+	} else if (err == 1) {
+		/*
+		 * The kernel did not support the max_beb_per1024 parameter.
+		 */
+		(void) ubi_detach_mtd(libubi, args.node, req.mtd_num);
+		errmsg("Your UBI driver does not allow changing the reserved PEBs count, probably you run an old kernel ? The support was added in kernel version 3.7.");
+		goto out_libubi;
 	}
 
 	/* Print some information about the new UBI device */
-- 
1.7.2.5
