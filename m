Received: from 81-7-68-229.static.zebra.lt ([81.7.68.229] helo=teltonika.lt)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LqobM-0007dY-E0
	for linux-mtd@lists.infradead.org; Mon, 06 Apr 2009 13:11:07 +0000
Received: from unknown (HELO [127.0.0.1]) (paulius.zaleckas@[217.147.39.138])
	(envelope-sender <paulius.zaleckas@teltonika.lt>)
	by teltonika.lt (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 6 Apr 2009 13:13:48 -0000
From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Subject: [PATCH] mtd: fix Kconfig comment about 'armflash'
To: linux-mtd@lists.infradead.org, trivial@kernel.org
Date: Mon, 06 Apr 2009 16:10:54 +0300
Message-ID: <20090406131054.16163.11343.stgit@Programuotojas>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The real 'armflash' map driver is selected by CONFIG_MTD_ARM_INTEGRATOR

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
---

 drivers/mtd/Kconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)


diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 7d04fb9..b8e35a0 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -154,7 +154,8 @@ config MTD_AFS_PARTS
 
 	  You will still need the parsing functions to be called by the driver
 	  for your particular device. It won't happen automatically. The
-	  'armflash' map driver (CONFIG_MTD_ARMFLASH) does this, for example.
+	  'armflash' map driver (CONFIG_MTD_ARM_INTEGRATOR) does this, for
+	  example.
 
 config MTD_OF_PARTS
 	tristate "Flash partition map based on OF description"
