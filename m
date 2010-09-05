Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsK1c-0000na-Hr
	for linux-mtd@lists.infradead.org; Sun, 05 Sep 2010 18:33:09 +0000
Received: by ewy9 with SMTP id 9so2056353ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 05 Sep 2010 11:33:06 -0700 (PDT)
From: Kulikov Vasiliy <segooon@gmail.com>
To: kernel-janitors@vger.kernel.org
Subject: [PATCH 11/14] ubifs: check return code of ubifs_lpt_lookup
Date: Sun,  5 Sep 2010 22:33:00 +0400
Message-Id: <1283711580-7546-1-git-send-email-segooon@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Vasiliy Kulikov <segooon@gmail.com>,
	linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>,
	Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Vasiliy Kulikov <segooon@gmail.com>

Function ubifs_lpt_lookup may return ERR_PTR(...). Check for it.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 fs/ubifs/lpt.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 0084a33..841bb36 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1351,6 +1351,7 @@ static int read_lsave(struct ubifs_info *c)
 {
 	int err, i;
 	void *buf;
+	struct ubifs_lprops *perr;
 
 	buf = vmalloc(c->lsave_sz);
 	if (!buf)
@@ -1370,7 +1371,11 @@ static int read_lsave(struct ubifs_info *c)
 		 */
 		if (lnum >= c->leb_cnt)
 			continue;
-		ubifs_lpt_lookup(c, lnum);
+		perr = ubifs_lpt_lookup(c, lnum);
+		if (IS_ERR(perr)) {
+			err = PTR_ERR(perr);
+			goto out;
+		}
 	}
 out:
 	vfree(buf);
-- 
1.7.0.4
