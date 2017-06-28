Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dQAqJ-0006Zz-Rn
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 11:09:11 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id EDB3124E0019
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 13:08:42 +0200 (CEST)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 4/9] Move libfec declarations to public header in global
 include directory
Date: Wed, 28 Jun 2017 13:08:14 +0200
Message-Id: <20170628110819.30563-5-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
References: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 include/libfec.h         | 37 +++++++++++++++++++++++++++++++++++++
 lib/libfec.c             |  1 +
 misc-utils/fectest.c     |  1 +
 misc-utils/mcast_image.h | 32 --------------------------------
 misc-utils/recv_image.c  |  1 +
 misc-utils/serve_image.c |  1 +
 6 files changed, 41 insertions(+), 32 deletions(-)
 create mode 100644 include/libfec.h

diff --git a/include/libfec.h b/include/libfec.h
new file mode 100644
index 0000000..356ac28
--- /dev/null
+++ b/include/libfec.h
@@ -0,0 +1,37 @@
+#ifndef LIBFEC_H
+#define LIBFEC_H
+
+struct fec_parms;
+
+/* k - number of actual data packets
+ * n - total number of packets including data and redundant packets
+ *   (actual packet size isn't relevant here) */
+struct fec_parms *fec_new(int k, int n);
+void fec_free(struct fec_parms *p);
+
+/* src   - array of (n) pointers to data packets
+ * fec   - buffer for packet to be generated
+ * index - index of packet to be generated (0 <= index < n)
+ * sz    - data packet size
+ *
+ * _linear version just takes a pointer to the raw data; no
+ * mucking about with packet pointers.
+ */
+void fec_encode(struct fec_parms *code, unsigned char *src[],
+		unsigned char *fec, int index, int sz);
+void fec_encode_linear(struct fec_parms *code, unsigned char *src,
+		       unsigned char *fec, int index, int sz);
+
+/* data  - array of (k) pointers to data packets, in arbitrary order (see i)
+ * i     - indices of (data) packets
+ * sz    - data packet size
+ *
+ * Will never fail as long as you give it (k) individual data packets.
+ * Will re-order the (data) pointers but not the indices -- data packets
+ * are ordered on return.
+ */
+int fec_decode(struct fec_parms *code, unsigned char *data[],
+	       int i[], int sz);
+
+#endif /* LIBFEC_H */
+
diff --git a/lib/libfec.c b/lib/libfec.c
index bf68381..0d8056a 100644
--- a/lib/libfec.c
+++ b/lib/libfec.c
@@ -45,6 +45,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include "libfec.h"
 
 /*
  * stuff used for testing purposes only
diff --git a/misc-utils/fectest.c b/misc-utils/fectest.c
index fd577f3..fcba513 100644
--- a/misc-utils/fectest.c
+++ b/misc-utils/fectest.c
@@ -8,6 +8,7 @@
 #include <sys/stat.h>
 
 #include "mcast_image.h"
+#include "libfec.h"
 #include <crc32.h>
 
 #define ERASE_SIZE 131072
diff --git a/misc-utils/mcast_image.h b/misc-utils/mcast_image.h
index 8e94ffa..5264659 100644
--- a/misc-utils/mcast_image.h
+++ b/misc-utils/mcast_image.h
@@ -20,35 +20,3 @@ struct image_pkt {
 	struct image_pkt_hdr hdr;
 	unsigned char data[PKT_SIZE];
 };
-
-struct fec_parms;
-
-/* k - number of actual data packets
- * n - total number of packets including data and redundant packets
- *   (actual packet size isn't relevant here) */
-struct fec_parms *fec_new(int k, int n);
-void fec_free(struct fec_parms *p);
-
-/* src   - array of (n) pointers to data packets
- * fec   - buffer for packet to be generated
- * index - index of packet to be generated (0 <= index < n)
- * sz    - data packet size
- *
- * _linear version just takes a pointer to the raw data; no
- * mucking about with packet pointers.
- */
-void fec_encode(struct fec_parms *code, unsigned char *src[],
-		unsigned char *fec, int index, int sz);
-void fec_encode_linear(struct fec_parms *code, unsigned char *src,
-		       unsigned char *fec, int index, int sz);
-
-/* data  - array of (k) pointers to data packets, in arbitrary order (see i)
- * i     - indices of (data) packets
- * sz    - data packet size
- *
- * Will never fail as long as you give it (k) individual data packets.
- * Will re-order the (data) pointers but not the indices -- data packets
- * are ordered on return.
- */
-int fec_decode(struct fec_parms *code, unsigned char *data[],
-	       int i[], int sz);
diff --git a/misc-utils/recv_image.c b/misc-utils/recv_image.c
index 8bd7356..7f6662b 100644
--- a/misc-utils/recv_image.c
+++ b/misc-utils/recv_image.c
@@ -20,6 +20,7 @@
 #include <crc32.h>
 #include "mtd/mtd-user.h"
 #include "mcast_image.h"
+#include "libfec.h"
 
 #include "common.h"
 
diff --git a/misc-utils/serve_image.c b/misc-utils/serve_image.c
index 26632e3..f2475d6 100644
--- a/misc-utils/serve_image.c
+++ b/misc-utils/serve_image.c
@@ -21,6 +21,7 @@
 #include <common.h>
 
 #include "mcast_image.h"
+#include "libfec.h"
 
 int tx_rate = 80000;
 int pkt_delay;
-- 
2.12.3
