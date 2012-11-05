Received: from blu0-omc1-s13.blu0.hotmail.com ([65.55.116.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TVRKD-0005lZ-94
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2012 18:23:06 +0000
Message-ID: <BLU0-SMTP308EDE3F432519B05D37A0B8640@phx.gbl>
From: Bill Pringlemeir <bpringle@sympatico.ca>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] ubi-tests/integ: Add PRIxxx_t defines.
Date: Mon, 5 Nov 2012 13:04:33 -0500
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Message-ID: <87ehk7nc1l.fsf@sympatico.ca>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
--text follows this line--
I doubt this is the 'correct' solution, but it does show the issue.

common.h is shadowed by local copy of the same name.
Also include inttype.h in case the c library does not.

Signed-off-by: Bill Pringlemeir <bpringlemeir@nbsps.com>
---
 tests/ubi-tests/integ.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/ubi-tests/integ.c b/tests/ubi-tests/integ.c
index e48f533..9b1347f 100644
--- a/tests/ubi-tests/integ.c
+++ b/tests/ubi-tests/integ.c
@@ -7,6 +7,7 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <stdint.h>
+#include <inttypes.h>
 #include <string.h>
 #include <errno.h>
 
@@ -16,6 +17,17 @@
 #include "libubi.h"
 #include "common.h"
 
+/* Duplicate: of common.h in top 'include'. */
+/* Define a print format specifier for off_t */
+#ifdef __USE_FILE_OFFSET64
+#define PRIxoff_t PRIx64
+#define PRIdoff_t PRId64
+#else
+#define PRIxoff_t "l"PRIx32
+#define PRIdoff_t "l"PRId32
+#endif
+
+
 struct erase_block_info;
 struct volume_info;
 struct ubi_device_info;
-- 
1.7.10.4
