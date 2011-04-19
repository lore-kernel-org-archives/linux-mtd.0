Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QC6OZ-00037H-UU
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 08:34:52 +0000
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Subject: [PATCHv3 3/3] serve_image: adjust classifier and type for printf
Date: Tue, 19 Apr 2011 11:34:41 +0300
Message-Id: <158e520ae5748a6e32eeefad99dea0395dd4c2a7.1303202005.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <82d06f0b9f3ad538d5a8dabfce6ac8337e07b0ae.1303202005.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <971bada1c870aa0baf6e8d07784f95e31bb98213.1303202005.git.ext-andriy.shevchenko@nokia.com>
References: <1303195429.2779.2.camel@localhost>
	<971bada1c870aa0baf6e8d07784f95e31bb98213.1303202005.git.ext-andriy.shevchenko@nokia.com>
	<82d06f0b9f3ad538d5a8dabfce6ac8337e07b0ae.1303202005.git.ext-andriy.shevchenko@nokia.com>
References: <971bada1c870aa0baf6e8d07784f95e31bb98213.1303202005.git.ext-andriy.shevchenko@nokia.com>
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
index f8f28a1..0e7980f 100644
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
+		fprintf(stderr, "Image size %" PRIu64 " bytes is not a multiple of "
+				"erasesize %d bytes\n", st.st_size, erasesize);
 		exit(1);
 	}
 	image = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, rfd, 0);
-- 
1.6.3.3
