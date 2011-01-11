Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PccTz-0001u1-EA
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 11:33:48 +0000
Received: by fxm19 with SMTP id 19so19231252fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Jan 2011 03:33:46 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/5] MTD: drop MTD_CONCAT dependencies from Kconfig
Date: Tue, 11 Jan 2011 14:33:36 +0300
Message-Id: <1294745619-7142-2-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As MTD_CONCAT is becoming a part of mtd core, it's no longer necessary
to depend on it in Kconfig scripts. Drop such references.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Stefan Roese <sr@denx.de>
---
 drivers/mtd/maps/Kconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index a0dd7bb..a34e969 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -114,7 +114,7 @@ config MTD_SUN_UFLASH
 
 config MTD_SC520CDP
 	tristate "CFI Flash device mapped on AMD SC520 CDP"
-	depends on X86 && MTD_CFI && MTD_CONCAT
+	depends on X86 && MTD_CFI
 	help
 	  The SC520 CDP board has two banks of CFI-compliant chips and one
 	  Dual-in-line JEDEC chip. This 'mapping' driver supports that
@@ -262,7 +262,7 @@ config MTD_BCM963XX
 
 config MTD_DILNETPC
 	tristate "CFI Flash device mapped on DIL/Net PC"
-	depends on X86 && MTD_CONCAT && MTD_PARTITIONS && MTD_CFI_INTELEXT && BROKEN
+	depends on X86 && MTD_PARTITIONS && MTD_CFI_INTELEXT && BROKEN
 	help
 	  MTD map driver for SSV DIL/Net PC Boards "DNP" and "ADNP".
 	  For details, see <http://www.ssv-embedded.de/ssv/pc104/p169.htm>
-- 
1.7.2.3
