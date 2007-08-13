Received: from dsl022.labridge.com ([206.117.136.22] helo=perches.com)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IKTUd-0005WB-TH
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 07:33:36 +0100
Date: Sun, 12 Aug 2007 23:33:15 -0700
From: joe@perches.com
To: torvalds@linux-foundation.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
	akpm@linux-foundation.org
Subject: [PATCH] [357/2many] MAINTAINERS - ONENAND FLASH DRIVER
Message-ID: <46bffb2b.uRwhdNMmFUwGYeq3%joe@perches.com>
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
index dbe6a36..17970b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3432,6 +3432,8 @@ P:	Kyungmin Park
 M:	kyungmin.park@samsung.com
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
+F:	drivers/mtd/onenand/
+F:	include/linux/mtd/onenand*.h
 
 ONSTREAM SCSI TAPE DRIVER
 P:	Willem Riede
