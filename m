Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RuYp9-0002EY-If
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 00:22:21 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] Introduce CONFIG_GENERIC_IO
Date: Tue,  7 Feb 2012 01:22:46 +0100
Message-Id: <1328574170-2286-1-git-send-email-richard@nod.at>
Cc: Artem.Bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 viro@zeniv.linux.org.uk, user-mode-linux-devel@lists.sourceforge.net,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are situations where CONFIG_HAS_IOMEM is too restrictive.
For example CONFIG_MTD_NAND_NANDSIM depends on CONFIG_HAS_IOMEM
but it works perfectly fine if an architecture without io memory
just includes asm-generic/io.h or implements everything defined in it.
UML is such a corner case.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 lib/Kconfig |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/lib/Kconfig b/lib/Kconfig
index d69d321..c3c4c1c 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -26,6 +26,10 @@ config GENERIC_IOMAP
 	bool
 	select GENERIC_PCI_IOMAP
 
+config GENERIC_IO
+	boolean
+	default n
+
 config CRC_CCITT
 	tristate "CRC-CCITT functions"
 	help
@@ -221,6 +225,7 @@ config BTREE
 config HAS_IOMEM
 	boolean
 	depends on !NO_IOMEM
+	select GENERIC_IO
 	default y
 
 config HAS_IOPORT
-- 
1.7.6
