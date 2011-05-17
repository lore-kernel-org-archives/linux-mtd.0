Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMLOF-0008D8-RK
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 14:36:52 +0000
Received: by pzk28 with SMTP id 28so297686pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 May 2011 07:36:49 -0700 (PDT)
From: Wanlong Gao <wanlong.gao@gmail.com>
To: dwmw2@infradead.org,
	akpm@linux-foundation.org
Subject: [PATCH 1/2] driver:mtd:use the wrapped __get_mtd_device in
	get_mtd_device_nm
Date: Tue, 17 May 2011 22:36:18 +0800
Message-Id: <1305642979-7419-1-git-send-email-wanlong.gao@gmail.com>
Cc: Wanlong Gao <wanlong.gao@gmail.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wanlong Gao <wanlong.gao@gmail.com>

Use the wrapped function __get_mtd_device in the function
get_mtd_device_nm instead of these get device reference codes.

Signed-off-by: Wanlong Gao <wanlong.gao@gmail.com>
---
 drivers/mtd/mtdcore.c |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index da69bc8..9b7ad35 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -570,21 +570,13 @@ struct mtd_info *get_mtd_device_nm(const char *name)
 	if (!mtd)
 		goto out_unlock;
 
-	if (!try_module_get(mtd->owner))
+	err = __get_mtd_device(mtd);
+	if (err)
 		goto out_unlock;
 
-	if (mtd->get_device) {
-		err = mtd->get_device(mtd);
-		if (err)
-			goto out_put;
-	}
-
-	mtd->usecount++;
 	mutex_unlock(&mtd_table_mutex);
 	return mtd;
 
-out_put:
-	module_put(mtd->owner);
 out_unlock:
 	mutex_unlock(&mtd_table_mutex);
 	return ERR_PTR(err);
-- 
1.7.4.1
