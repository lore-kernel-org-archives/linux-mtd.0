Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCToA-0005ka-U4
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 09:34:51 +0000
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCHv4 3/3] serve_image: adjust classifier and type for printf
Date: Wed, 20 Apr 2011 12:35:10 +0300
Message-Id: <015098d0d8cd7afd0df9d6f294896e585aa48a85.1303292025.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <0bd629717df8aefb5b2eca07fcf6c1abe8c67c70.1303292025.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <54dce27649702199efe5afb3d14e8f3f6103da00.1303292025.git.ext-andriy.shevchenko@nokia.com>
References: <BANLkTi=gsiTx9PHQ7HJpzuZT2DvzGU_OqA@mail.gmail.com>
	<54dce27649702199efe5afb3d14e8f3f6103da00.1303292025.git.ext-andriy.shevchenko@nokia.com>
	<0bd629717df8aefb5b2eca07fcf6c1abe8c67c70.1303292025.git.ext-andriy.shevchenko@nokia.com>
References: <54dce27649702199efe5afb3d14e8f3f6103da00.1303292025.git.ext-andriy.shevchenko@nokia.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The argument type of printf is __off64_t, meanwhile the classifier is "%ld".
We agreed to use PRIu64 in such case.

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 serve_image.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/serve_image.c b/serve_image.c
index f8f28a1..d1037a9 100644
--- a/serve_image.c
+++ b/serve_image.c
@@ -2,7 +2,6 @@
 #define _POSIX_C_SOURCE 199309
 
 #include <time.h>
-
 #include <errno.h>  	
 #include <error.h> 	
 #include <netdb.h> 	
@@ -18,6 +17,8 @@
 #include <netinet/in.h>
 #include <sys/time.h>
 #include <crc32.h>
+#include <inttypes.h>
+
 #include "mcast_image.h"
 
 int tx_rate = 80000;
@@ -126,8 +127,8 @@ int main(int argc, char **argv)
 	}
 
 	if (st.st_size % erasesize) {
-		fprintf(stderr, "Image size %ld bytes is not a multiple of erasesize %d bytes\n",
-			st.st_size, erasesize);
+		fprintf(stderr, "Image size %" PRIu64 " bytes is not a multiple of erasesize %d bytes\n"
+				st.st_size, erasesize);
 		exit(1);
 	}
 	image = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, rfd, 0);
-- 
1.6.3.3
