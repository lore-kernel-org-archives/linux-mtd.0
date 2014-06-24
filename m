Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzHhn-0008Ba-PZ
 for linux-mtd@lists.infradead.org; Tue, 24 Jun 2014 03:47:36 +0000
Message-ID: <53A8F49C.9000805@huawei.com>
Date: Tue, 24 Jun 2014 11:46:36 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: Remove useless @ecc in struct ubifs_scan_leb
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We set @ecc in ubifs_scan_leb only if leb_read returns EBADMSG and
do not use it any more. This patch removes this variable and adds
comments about EBADMSG handling.


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/scan.c  | 7 +++++--
 fs/ubifs/ubifs.h | 2 --
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 58aa05d..5468836 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -157,8 +157,11 @@ struct ubifs_scan_leb *ubifs_start_scan(const struct ubifs_info *c, int lnum,
 		return ERR_PTR(err);
 	}

-	if (err == -EBADMSG)
-		sleb->ecc = 1;
+	/*
+	 * If err == -EBADMSG, we scan this leb first because we
+	 * can detect corruptions by checking NODEs and return an
+	 * error if it is really corruptted.
+	 */

 	return sleb;
 }
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c1f71fe..977a01b 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -314,7 +314,6 @@ struct ubifs_scan_node {
  * @nodes_cnt: number of nodes scanned
  * @nodes: list of struct ubifs_scan_node
  * @endpt: end point (and therefore the start of empty space)
- * @ecc: read returned -EBADMSG
  * @buf: buffer containing entire LEB scanned
  */
 struct ubifs_scan_leb {
@@ -322,7 +321,6 @@ struct ubifs_scan_leb {
 	int nodes_cnt;
 	struct list_head nodes;
 	int endpt;
-	int ecc;
 	void *buf;
 };

-- 
1.8.1.4
