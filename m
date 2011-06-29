Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbzHY-0004De-Vp
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 18:14:37 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH] flash_erase: fix incorrect help message
Date: Wed, 29 Jun 2011 11:14:18 -0700
Message-ID: <1309371258-18936-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_erase.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/flash_erase.c b/flash_erase.c
index 220f85a..fe2eaca 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -66,7 +66,7 @@ static void display_help (void)
 			"  -j, --jffs2       format the device for jffs2\n"
 			"  -N, --noskipbad   don't skip bad blocks\n"
 			"  -u, --unlock      unlock sectors before erasing\n"
-			"  -q, --quiet       display progress messages\n"
+			"  -q, --quiet       do not display progress messages\n"
 			"      --silent      same as --quiet\n"
 			"      --help        display this help and exit\n"
 			"      --version     output version information and exit\n",
-- 
1.7.0.4
