Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMyit-0004m1-U8
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 08:04:32 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/8] nanddump: Refactor pretty print code into an
 sprintf()
Date: Mon, 29 Nov 2010 00:01:57 -0800
Message-ID: <1291017722-23985-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
References: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A do-while loop in pretty_dump_to_buffer() can be refactored into a
single sprintf() statement. MAX() and MIN() are used to ensure that:
(1) We have at least a single space between hex and ASCII output
(2) We don't overflow the line buffer

This patch was suggested by Mike Frysinger.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index bf95e81..14a8816 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -252,9 +252,10 @@ static void pretty_dump_to_buffer(const unsigned char *buf, size_t len,
 	if (!ascii)
 		goto nil;
 
-	do {
-		linebuf[lx++] = ' ';
-	} while (lx < (linebuflen - 1) && lx < (ascii_column - 1));
+	/* Spacing between hex and ASCII - ensure at least one space */
+	lx += sprintf(linebuf + lx, "%*s",
+			MAX((int)MIN(linebuflen, ascii_column) - 1 - lx, 1),
+			" ");
 
 	linebuf[lx++] = '|';
 	for (j = 0; (j < len) && (lx + 2) < linebuflen; j++)
-- 
1.7.0.4
