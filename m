Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBjoY-0000tj-PD
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 08:28:14 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3I8S7gi006247
	for <linux-mtd@lists.infradead.org>; Mon, 18 Apr 2011 11:28:08 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv2 1/2] serve_image: adjust classificator and type for printf
Date: Mon, 18 Apr 2011 11:31:47 +0300
Message-Id: <802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <1302783893.2796.27.camel@localhost>
References: <1302783893.2796.27.camel@localhost>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The argument type of printf is __off64_t, meanwhile the classificator is "%ld".

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 serve_image.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/serve_image.c b/serve_image.c
index f8f28a1..d86e372 100644
--- a/serve_image.c
+++ b/serve_image.c
@@ -126,8 +126,9 @@ int main(int argc, char **argv)
 	}
 
 	if (st.st_size % erasesize) {
-		fprintf(stderr, "Image size %ld bytes is not a multiple of erasesize %d bytes\n",
-			st.st_size, erasesize);
+		fprintf(stderr, "Image size %llu bytes is not a multiple of "
+				"erasesize %d bytes\n",
+				(unsigned long long)st.st_size, erasesize);
 		exit(1);
 	}
 	image = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, rfd, 0);
-- 
1.6.3.3
