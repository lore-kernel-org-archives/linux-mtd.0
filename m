Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNbri-00072v-3Z
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 09:24:00 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add entry for Denali NAND controller driver
Date: Wed, 21 Jun 2017 18:23:11 +0900
Message-Id: <1498036992-14142-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Denali NAND controller driver (drivers/mtd/nand/denali*) has been
largely reworked by me.  Add myself as its maintainer now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c82a2d790366..a83834aa9341 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3896,6 +3896,12 @@ M:	Pali Rohár <pali.rohar@gmail.com>
 S:	Maintained
 F:	drivers/platform/x86/dell-wmi.c
 
+DENALI NAND DRIVER
+M:	Masahiro Yamada <yamada.masahiro@socionext.com>
+L:	linux-mtd@lists.infradead.org
+S:	Supported
+F:	drivers/mtd/nand/denali*
+
 DESIGNWARE USB2 DRD IP DRIVER
 M:	John Youn <johnyoun@synopsys.com>
 L:	linux-usb@vger.kernel.org
-- 
2.7.4
