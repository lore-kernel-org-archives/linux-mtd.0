Received: from dsl022.labridge.com ([206.117.136.22] helo=perches.com)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IKTUQ-0005Vy-Bt
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 07:33:23 +0100
Date: Sun, 12 Aug 2007 23:31:57 -0700
From: joe@perches.com
To: torvalds@linux-foundation.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, dedekind@infradead.org,
	akpm@linux-foundation.org
Subject: [PATCH] [316/2many] MAINTAINERS - UNSORTED BLOCK IMAGES (UBI)
Message-ID: <46bffadd.MOYXflWOCrfSrneX%joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add file pattern to MAINTAINER entry

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index e4aa236..2667601 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3045,6 +3045,9 @@ W:	http://www.linux-mtd.infradead.org/
 L:	linux-mtd@lists.infradead.org
 T:	git git://git.infradead.org/~dedekind/ubi-2.6.git
 S:	Maintained
+F:	drivers/mtd/ubi
+F:	include/linux/mtd/ubi.h
+F:	include/mtd/ubi-*
 
 MICROTEK X6 SCANNER
 P:	Oliver Neukum
