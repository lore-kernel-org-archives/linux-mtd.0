Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T7ZHR-0001Fc-MX
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 22:01:34 +0000
Received: by pbbrq8 with SMTP id rq8so5788399pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2012 15:01:31 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] jffs2: don't fail on bitflips in OOB
Date: Fri, 31 Aug 2012 15:01:19 -0700
Message-Id: <1346450479-22400-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

JFFS2 was designed without thought for OOB bitflips, it seems, but they
can occur and will be reported to JFFS2 via mtd_read_oob()[1]. We don't
want to fail on these transactions, since the data was corrected.

[1] Few drivers report bitflips for OOB-only transactions. With such
    drivers, this patch should have no effect.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: stable@vger.kernel.org
---
 fs/jffs2/wbuf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 6f4529d..a6597d6 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1044,10 +1044,10 @@ int jffs2_check_oob_empty(struct jffs2_sb_info *c,
 	ops.datbuf = NULL;
 
 	ret = mtd_read_oob(c->mtd, jeb->offset, &ops);
-	if (ret || ops.oobretlen != ops.ooblen) {
+	if ((ret && !mtd_is_bitflip(ret)) || ops.oobretlen != ops.ooblen) {
 		pr_err("cannot read OOB for EB at %08x, requested %zd bytes, read %zd bytes, error %d\n",
 		       jeb->offset, ops.ooblen, ops.oobretlen, ret);
-		if (!ret)
+		if (!ret || mtd_is_bitflip(ret))
 			ret = -EIO;
 		return ret;
 	}
@@ -1086,10 +1086,10 @@ int jffs2_check_nand_cleanmarker(struct jffs2_sb_info *c,
 	ops.datbuf = NULL;
 
 	ret = mtd_read_oob(c->mtd, jeb->offset, &ops);
-	if (ret || ops.oobretlen != ops.ooblen) {
+	if ((ret && !mtd_is_bitflip(ret)) || ops.oobretlen != ops.ooblen) {
 		pr_err("cannot read OOB for EB at %08x, requested %zd bytes, read %zd bytes, error %d\n",
 		       jeb->offset, ops.ooblen, ops.oobretlen, ret);
-		if (!ret)
+		if (!ret || mtd_is_bitflip(ret))
 			ret = -EIO;
 		return ret;
 	}
-- 
1.7.11.3
