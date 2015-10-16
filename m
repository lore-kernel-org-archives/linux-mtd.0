Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zn6jQ-0003LC-2O
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2015 15:15:45 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH 3/5] mkfs.ubifs: simplify make_path with xasprintf
Date: Fri, 16 Oct 2015 17:15:17 +0200
Message-Id: <1445008519-19928-4-git-send-email-mkl@pengutronix.de>
In-Reply-To: <1445008519-19928-1-git-send-email-mkl@pengutronix.de>
References: <1445008519-19928-1-git-send-email-mkl@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sascha Hauer <s.hauer@pengutronix.de>

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 mkfs.ubifs/mkfs.ubifs.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 049219b52cc5..a99c61382304 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -227,13 +227,9 @@ static char *make_path(const char *dir, const char *name)
 {
 	char *s;
 
-	s = malloc(strlen(dir) + strlen(name) + 2);
-	if (!s)
-		return NULL;
-	strcpy(s, dir);
-	if (dir[strlen(dir) - 1] != '/')
-		strcat(s, "/");
-	strcat(s, name);
+	xasprintf(&s, "%s%s%s",
+		  dir, dir[strlen(dir) - 1] == '/' ? "" : "/", name);
+
 	return s;
 }
 
-- 
2.6.1
