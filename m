Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O99kC-00018i-3v
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 04:28:29 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Mon, 3 May 2010 21:14:39 -0700
Subject: [PATCH] nanddump: Support 4096+218 and 4096+224 page sizes
Message-Id: <fd9a371bd2bc8bea4119df47b82550901f017e10@localhost.localdomain>
To: <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested with Samsung K9GAG08U0D.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 nanddump.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 678d684..ae0e425 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -209,7 +209,9 @@ int main(int argc, char * const argv[])
 	}
 
 	/* Make sure device page sizes are valid */
-	if (!(meminfo.oobsize == 128 && meminfo.writesize == 4096) &&
+	if (!(meminfo.oobsize == 224 && meminfo.writesize == 4096) &&
+			!(meminfo.oobsize == 218 && meminfo.writesize == 4096) &&
+			!(meminfo.oobsize == 128 && meminfo.writesize == 4096) &&
 			!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
 			!(meminfo.oobsize == 32 && meminfo.writesize == 1024) &&
 			!(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
-- 
1.6.3.1
