Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI9Ey-0006Lr-Ag
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:54:07 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 1/3] ubiformat: process command line arguments first
Date: Mon, 14 May 2018 10:53:23 +0200
Message-Id: <20180514085325.6793-2-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20180514085325.6793-1-david.oberhollenzer@sigma-star.at>
References: <20180514085325.6793-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If libmtd_open fails, the program always exists with failure status
and prints "MTD subsystem is not present".

Even `ubiformat --help` produces the same result, which is definitely
undesired.

This patch moves command line option processing first to get the desired
behavior.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 ubi-utils/ubiformat.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index c38b9b4..694ab4c 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -692,13 +692,14 @@ int main(int argc, char * const argv[])
 	struct ubigen_info ui;
 	struct ubi_scan_info *si;
 
-	libmtd = libmtd_open();
-	if (!libmtd)
-		return errmsg("MTD subsystem is not present");
 
 	err = parse_opt(argc, argv);
 	if (err)
-		goto out_close_mtd;
+		return -1;
+
+	libmtd = libmtd_open();
+	if (!libmtd)
+		return errmsg("MTD subsystem is not present");
 
 	err = mtd_get_info(libmtd, &mtd_info);
 	if (err) {
-- 
2.17.0
