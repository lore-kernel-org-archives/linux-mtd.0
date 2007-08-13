Received: from dsl022.labridge.com ([206.117.136.22] helo=perches.com)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IKTWF-0005a6-Vx
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 07:35:17 +0100
Date: Sun, 12 Aug 2007 23:33:54 -0700
From: joe@perches.com
To: torvalds@linux-foundation.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, joern@wohnheim.fh-wedel.de,
	akpm@linux-foundation.org
Subject: [PATCH] [377/2many] MAINTAINERS - PHRAM MTD DRIVER
Message-ID: <46bffb52.iWg07DXAXPcVIyVe%joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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
index b81c8bc..e165480 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3621,6 +3621,7 @@ P:	Jörn Engel
 M:	joern@wh.fh-wedel.de
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
+F:	drivers/mtd/devices/phram.c
 
 PKTCDVD DRIVER
 P:	Peter Osterlund
