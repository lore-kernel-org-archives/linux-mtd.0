Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4DRC-0002Co-NH
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 16:05:49 +0000
Received: by weyr3 with SMTP id r3so743406wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 09:05:25 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH MTD-UTILS v2 1/4] libubi: factorize ubi_attach and
 ubi_attach_mtd code
Date: Wed, 22 Aug 2012 18:04:34 +0200
Message-Id: <1345651477-5301-2-git-send-email-richard.genoud@gmail.com>
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

The req->mtd_num value is now updated with the MTD device number found
by mtd_node_to_num.

If it's not acceptable, I'll do a static __ubi_detach_mtd() function to
prevent that, and still factorize code.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 ubi-utils/include/libubi.h |    5 +++--
 ubi-utils/libubi.c         |   34 ++++++++++------------------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/ubi-utils/include/libubi.h b/ubi-utils/include/libubi.h
index 11a186b..bbaa78c 100644
--- a/ubi-utils/include/libubi.h
+++ b/ubi-utils/include/libubi.h
@@ -233,8 +233,9 @@ int ubi_attach_mtd(libubi_t desc, const char *node,
  * device node. Otherwise functionality is similar than in function
  * 'ubi_attach_mtd()' where @req->mtd_num is used.
  *
- * Returns %0 in case of success and %-1 in case of failure (errno is set). The
- * newly created UBI device number is returned in @req->dev_num.
+ * Returns %0 in case of success and %-1 in case of failure (errno is set).
+ * The newly created UBI device number is returned in @req->dev_num.
+ * The MTD device number is returned in @req->mtd_num (-1 if not found)
  */
 int ubi_attach(libubi_t desc, const char *node,
 	       struct ubi_attach_request *req);
diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
index 7736dd4..dec72c7 100644
--- a/ubi-utils/libubi.c
+++ b/ubi-utils/libubi.c
@@ -770,30 +770,16 @@ static int mtd_node_to_num(const char *mtd_dev_node)
 
 int ubi_attach(libubi_t desc, const char *node, struct ubi_attach_request *req)
 {
-	struct ubi_attach_req r;
-	int ret;
-
-	if (!req->mtd_dev_node)
-		/* Fallback to opening by mtd_num */
-		return ubi_attach_mtd(desc, node, req);
-
-	memset(&r, 0, sizeof(struct ubi_attach_req));
-	r.ubi_num = req->dev_num;
-	r.vid_hdr_offset = req->vid_hdr_offset;
-
-	/*
-	 * User has passed path to device node. Lets find out MTD device number
-	 * of the device and pass it to the kernel.
-	 */
-	r.mtd_num = mtd_node_to_num(req->mtd_dev_node);
-	if (r.mtd_num == -1)
-		return -1;
-
-	ret = do_attach(node, &r);
-	if (ret == 0)
-		req->dev_num = r.ubi_num;
-
-	return ret;
+	if (req->mtd_dev_node) {
+		/*
+		 * User has passed path to device node. Lets find out MTD
+		 * device number of the device and update req->mtd_num with it
+		 */
+		req->mtd_num = mtd_node_to_num(req->mtd_dev_node);
+		if (req->mtd_num == -1)
+			return -1;
+	}
+	return ubi_attach_mtd(desc, node, req);
 }
 
 int ubi_detach_mtd(libubi_t desc, const char *node, int mtd_num)
-- 
1.7.2.5
