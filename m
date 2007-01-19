Received: from mo-p07-ob.rzone.de ([81.169.146.190])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7oMN-0004kx-8T
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 02:40:34 -0500
Received: from ubuntu	(p57BD088F.dip0.t-ipconnect.de [87.189.8.143])
	by post.webmailer.de (klopstock mo28) (RZmta 3.11)	with ESMTP
	id j0J1782b00274G	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Jan 2007 08:40:04 +0100 (MET)
Date: Fri, 19 Jan 2007 08:40:04 +0100 (MET)
From: Stefan Roese <ml@stefan-roese.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] physmap: Add support for 64 bit resources
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200701190840.26315.ml@stefan-roese.de>
Content-Type: text/plain;  charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD] physmap: Add support for 64 bit resources

This patch adds support for 64 bit resources enabled via the
CONFIG_RESOURCES_64BIT option. Now a 64 bit can be passed to the
physmap driver.

Signed-off-by: Stefan Roese <sr@denx.de>

---
commit ae296c97b72c0dc2d2fc235ceb2a7ad1b18e1e82
tree ffed7ade867181a7aee5bda99f88a33a86cd0396
parent b194c4975c5b34440fb1efda5cb2f27c8e89132a
author Stefan Roese <sr@denx.de> Fri, 19 Jan 2007 08:38:12 +0100
committer Stefan Roese <sr@denx.de> Fri, 19 Jan 2007 08:38:12 +0100

 include/linux/mtd/map.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 28d461d..81f3a31 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -183,7 +183,7 @@ typedef union {
 struct map_info {
 	char *name;
 	unsigned long size;
-	unsigned long phys;
+	resource_size_t phys;
 #define NO_XIP (-1UL)
 
 	void __iomem *virt;
