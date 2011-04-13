Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9zxB-0002M0-Mg
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 13:17:54 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DDHoEc031498
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 16:17:50 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 2/5] serve_image: adjust type for printf
Date: Wed, 13 Apr 2011 16:20:26 +0300
Message-Id: <865774bea767bf615bbaf79139448aef65d55202.1302700658.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
References: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
References: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
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
 serve_image.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/serve_image.c b/serve_image.c
index f8f28a1..9eaf9dd 100644
--- a/serve_image.c
+++ b/serve_image.c
@@ -127,7 +127,7 @@ int main(int argc, char **argv)
 
 	if (st.st_size % erasesize) {
 		fprintf(stderr, "Image size %ld bytes is not a multiple of erasesize %d bytes\n",
-			st.st_size, erasesize);
+			(long)st.st_size, erasesize);
 		exit(1);
 	}
 	image = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, rfd, 0);
-- 
1.6.3.3
