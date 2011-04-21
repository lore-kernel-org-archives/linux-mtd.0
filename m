Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QCxRV-0003HE-5e
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 17:13:25 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] serve_image: missing comma
Date: Thu, 21 Apr 2011 10:09:12 -0700
Message-ID: <1303405752-24614-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <158e520ae5748a6e32eeefad99dea0395dd4c2a7.1303202005.git.ext-andriy.shevchenko@nokia.com>
References: <158e520ae5748a6e32eeefad99dea0395dd4c2a7.1303202005.git.ext-andriy.shevchenko@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, ext-andriy.shevchenko@nokia.com,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Somebody didn't compile-test commit 9f4e6840.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 serve_image.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/serve_image.c b/serve_image.c
index d1037a9..f7f6315 100644
--- a/serve_image.c
+++ b/serve_image.c
@@ -127,7 +127,7 @@ int main(int argc, char **argv)
 	}
 
 	if (st.st_size % erasesize) {
-		fprintf(stderr, "Image size %" PRIu64 " bytes is not a multiple of erasesize %d bytes\n"
+		fprintf(stderr, "Image size %" PRIu64 " bytes is not a multiple of erasesize %d bytes\n",
 				st.st_size, erasesize);
 		exit(1);
 	}
-- 
1.7.0.4
