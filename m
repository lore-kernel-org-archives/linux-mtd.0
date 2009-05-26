Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9695-0000xX-UM
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 23:33:36 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mtd/maps: uclinux: do not allow to be built as a module
Date: Tue, 26 May 2009 19:33:18 -0400
Message-Id: <1243380798-10089-3-git-send-email-vapier@gentoo.org>
In-Reply-To: <20090526231902.GA6295@linux-sh.org>
References: <20090526231902.GA6295@linux-sh.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, Paul Mundt <lethal@linux-sh.org>,
	linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org,
	Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There isn't any benefit to building the uClinux MTD map as a module as the
rootfs it requires in order to actually be usable is appended to the
kernel image, not the module.  No known system builds it this way either,
so change the option to "bool".

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
CC: Paul Mundt <lethal@linux-sh.org>
CC: Greg Ungerer <gerg@uclinux.org>
CC: uclinux-dev@uclinux.org
CC: linux-mtd@lists.infradead.org
---
 drivers/mtd/maps/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 82923bd..907873b 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -501,7 +501,7 @@ config MTD_BFIN_ASYNC
 	  If compiled as a module, it will be called bfin-async-flash.
 
 config MTD_UCLINUX
-	tristate "Generic uClinux RAM/ROM filesystem support"
+	bool "Generic uClinux RAM/ROM filesystem support"
 	depends on MTD_PARTITIONS && MTD_RAM && !MMU
 	help
 	  Map driver to support image based filesystems for uClinux.
-- 
1.6.3.1
