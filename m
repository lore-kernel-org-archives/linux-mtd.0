Received: from mailout06.t-online.de ([194.25.134.19])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccamS-0003bw-6h
 for linux-mtd@lists.infradead.org; Sat, 11 Feb 2017 16:44:18 +0000
From: torfl@t-online.de
To: linux-mtd@lists.infradead.org
Cc: Torsten Fleischer <torfl@t-online.de>,
 Torsten Fleischer <torfl6749@gmail.com>
Subject: [PATCH 2/2] mtd-utils: serve_image: Use PRIdoff_t as format specifier.
Date: Sat, 11 Feb 2017 17:43:32 +0100
Message-Id: <1486831412-30409-3-git-send-email-torfl@t-online.de>
In-Reply-To: <1486831412-30409-1-git-send-email-torfl@t-online.de>
References: <1486831412-30409-1-git-send-email-torfl@t-online.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Torsten Fleischer <torfl@t-online.de>

To be independent on the size of off_t the format specifier determined of
common.h should be used instead of PRIu64.

Signed-off-by: Torsten Fleischer <torfl6749@gmail.com>
---
 misc-utils/serve_image.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/misc-utils/serve_image.c b/misc-utils/serve_image.c
index cbcf3b7..26632e3 100644
--- a/misc-utils/serve_image.c
+++ b/misc-utils/serve_image.c
@@ -18,6 +18,8 @@
 #include <crc32.h>
 #include <inttypes.h>
 
+#include <common.h>
+
 #include "mcast_image.h"
 
 int tx_rate = 80000;
@@ -126,7 +128,7 @@ int main(int argc, char **argv)
 	}
 
 	if (st.st_size % erasesize) {
-		fprintf(stderr, "Image size %" PRIu64 " bytes is not a multiple of erasesize %d bytes\n",
+		fprintf(stderr, "Image size %" PRIdoff_t " bytes is not a multiple of erasesize %d bytes\n",
 				st.st_size, erasesize);
 		exit(1);
 	}
-- 
2.1.4
