Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SvqUH-00031R-T2
 for linux-mtd@lists.infradead.org; Mon, 30 Jul 2012 13:58:22 +0000
Received: by bkcji2 with SMTP id ji2so2949654bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2012 06:58:14 -0700 (PDT)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: [PATCH 5/5] arm: sam9_l9260_defconfig: remove non-existing config
 option
Date: Mon, 30 Jul 2012 16:57:41 +0300
Message-Id: <1343656661-8096-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1343656661-8096-1-git-send-email-dedekind1@gmail.com>
References: <1343656661-8096-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shmulik Ladkani <shmulik.ladkani@gmail.com>

CONFIG_MTD_UBI_BEB_RESERVE has been removed and now we use
CONFIG_MTD_UBI_BEB_LIMIT instead.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 arch/arm/configs/sam9_l9260_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/sam9_l9260_defconfig b/arch/arm/configs/sam9_l9260_defconfig
index f6917c9..da276f9 100644
--- a/arch/arm/configs/sam9_l9260_defconfig
+++ b/arch/arm/configs/sam9_l9260_defconfig
@@ -39,7 +39,6 @@ CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_ATMEL=y
 CONFIG_MTD_NAND_PLATFORM=y
 CONFIG_MTD_UBI=y
-CONFIG_MTD_UBI_BEB_RESERVE=3
 CONFIG_MTD_UBI_BEB_LIMIT=3
 CONFIG_MTD_UBI_GLUEBI=y
 CONFIG_BLK_DEV_LOOP=y
-- 
1.7.11.2
