Received: from mail-yh0-f52.google.com ([209.85.213.52])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHy0L-0001av-6Z
 for linux-mtd@lists.infradead.org; Thu, 14 Aug 2014 16:35:59 +0000
Received: by mail-yh0-f52.google.com with SMTP id t59so1229725yho.25
 for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2014 09:35:30 -0700 (PDT)
From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] nandtest: fix --reads argument
Date: Thu, 14 Aug 2014 13:29:45 -0300
Message-Id: <1408033785-20264-1-git-send-email-guido@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Ezequiel=20Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The --reads option specifies the argument as optional, but doesn't check
for a null optarg, which means that nandtest segfaults when run as
"nandtest --reads".

Fix this by making the argument required, and changing the help text to
not specify it as optional. Argument -r already specifies the argument
as required, so we fix this inconsistency too.

Signed-off-by: Guido Martínez <guido@vanguardiasur.com.ar>
---
 nandtest.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index 8ea39d3..0805387 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -24,7 +24,7 @@ void usage(int status)
 		"  -m, --markbad        Mark blocks bad if they appear so\n"
 		"  -s, --seed           Supply random seed\n"
 		"  -p, --passes         Number of passes\n"
-		"  -r, --reads          Read & check iterations per pass (default=4)\n"
+		"  -r <n>, --reads=<n>  Read & check <n> times per pass\n"
 		"  -o, --offset         Start offset on flash\n"
 		"  -l, --length         Length of flash to test\n"
 		"  -k, --keep           Restore existing contents after test\n",
@@ -166,7 +166,7 @@ int main(int argc, char **argv)
 			{ "passes", required_argument, 0, 'p' },
 			{ "offset", required_argument, 0, 'o' },
 			{ "length", required_argument, 0, 'l' },
-			{ "reads", optional_argument, 0, 'r' },
+			{ "reads", required_argument, 0, 'r' },
 			{ "keep", no_argument, 0, 'k' },
 			{0, 0, 0, 0},
 		};
-- 
2.0.1
