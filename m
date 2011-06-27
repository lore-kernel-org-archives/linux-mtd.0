Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbGXY-0003Dh-1g
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 18:28:08 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 01/10] mtd-tests: checkfs: fix size_t related warning
Date: Mon, 27 Jun 2011 11:27:18 -0700
Message-ID: <1309199247-19248-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Depending on your compiler, size_t may or may not be long unsigned int.
Use printf's %zu format to clarify.

Warning message:

   checkfs.c:524:28: warning: format '%lu' expects type
   'long unsigned int', but argument 2 has type 'unsigned int'

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 tests/checkfs/checkfs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/checkfs/checkfs.c b/tests/checkfs/checkfs.c
index 8e74da8..0e67626 100644
--- a/tests/checkfs/checkfs.c
+++ b/tests/checkfs/checkfs.c
@@ -520,7 +520,7 @@ void processCmdLine(int argc, char **argv)
                 FileSizeMax = (float)atoi(argv[++cnt]);
                 if(FileSizeMax > (MAX_INTS_ALLOW*sizeof(int)))
                 {
-                    printf("Max file size allowed is %lu.\n",
+                    printf("Max file size allowed is %zu.\n",
                            MAX_INTS_ALLOW*sizeof(int));
                     exit(0);
                 }
-- 
1.7.0.4
