Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSYt-0003fN-03
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:08:51 +0000
Received: by pzk4 with SMTP id 4so7209431pzk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:08:49 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 02/10] mtd_debug: replace #defines with enum
Date: Fri, 19 Aug 2011 10:07:48 -0700
Message-Id: <1313773676-12879-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
References: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

enum provides a cleaner mechanism that creating single-purpose `#define`s.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 mtd_debug.c |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/mtd_debug.c b/mtd_debug.c
index a348a4c..b98de50 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -342,16 +342,18 @@ void showusage(void)
 	exit(EXIT_FAILURE);
 }
 
-#define OPT_INFO	1
-#define OPT_READ	2
-#define OPT_WRITE	3
-#define OPT_ERASE	4
-
 int main(int argc, char *argv[])
 {
-	int err = 0, fd, option = OPT_INFO;
+	int err = 0, fd;
 	int open_flag;
 
+	enum {
+		OPT_INFO,
+		OPT_READ,
+		OPT_WRITE,
+		OPT_ERASE
+	} option = OPT_INFO;
+
 	/* parse command-line options */
 	if (argc == 3 && !strcmp(argv[1], "info"))
 		option = OPT_INFO;
-- 
1.7.6
