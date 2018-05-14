Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIBbw-0005B1-FP
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 11:25:52 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, goliath@sigma-star.at,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/5] ubinize: Don't stat image file twice
Date: Mon, 14 May 2018 13:25:25 +0200
Message-Id: <20180514112528.24092-3-richard@nod.at>
In-Reply-To: <20180514112528.24092-1-richard@nod.at>
References: <20180514112528.24092-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubi-utils/ubinize.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
index c85ff9b22c58..3390d0d95305 100644
--- a/ubi-utils/ubinize.c
+++ b/ubi-utils/ubinize.c
@@ -335,16 +335,11 @@ static int read_section(const struct ubigen_info *ui, const char *sname,
 				      sname, *img, (long long)st->st_size, vi->bytes);
 		verbose(args.verbose, "volume size: %lld bytes", vi->bytes);
 	} else {
-		struct stat st;
-
 		if (!*img)
 			return errmsg("neither image file (\"image=\") nor volume size "
 				      "(\"vol_size=\") specified in section \"%s\"", sname);
 
-		if (stat(*img, &st))
-			return sys_errmsg("cannot stat \"%s\"", *img);
-
-		vi->bytes = st.st_size;
+		vi->bytes = st->st_size;
 
 		if (vi->bytes == 0)
 			return errmsg("file \"%s\" referred from section \"%s\" is empty",
-- 
2.13.6
