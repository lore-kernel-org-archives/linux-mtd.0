Received: from sauhun.de ([89.238.76.85] helo=pokefinder.org)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Td7m8-0007jM-NR
 for linux-mtd@lists.infradead.org; Mon, 26 Nov 2012 23:07:41 +0000
From: Wolfram Sang <wolfram@the-dreams.de>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?q?=5BPATCH=5D=20mtd=3A=20nand=3A=20Kconfig=3A=20drop=20utf8=20characters?=
Date: Tue, 27 Nov 2012 00:07:25 +0100
Message-Id: <1353971245-26735-1-git-send-email-wolfram@the-dreams.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Wolfram Sang <wolfram@the-dreams.de>, Martin Walch <walch.martin@web.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Linux Kernel Configuration system (lkc) expects 8 bit characters
only (declared in scripts/kconfig/zconf.l: %option 8bit). Fix two flaws
that cause minor glitches like broken characters in xconfig.

Reported-by: Martin Walch <walch.martin@web.de>
Signed-off-by: Wolfram Sang <wolfram@the-dreams.de>
---

Fixes bugzilla entry #43067

 drivers/mtd/nand/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 4883139..5a5bae7 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -354,12 +354,12 @@ config MTD_NAND_SHARPSL
 	depends on ARCH_PXA
 
 config MTD_NAND_CAFE
-	tristate "NAND support for OLPC CAFÉ chip"
+	tristate "NAND support for OLPC CAFE chip"
 	depends on PCI
 	select REED_SOLOMON
 	select REED_SOLOMON_DEC16
 	help
-	  Use NAND flash attached to the CAFÉ chip designed for the OLPC
+	  Use NAND flash attached to the CAFE chip designed for the OLPC
 	  laptop.
 
 config MTD_NAND_CS553X
-- 
1.7.10.4
