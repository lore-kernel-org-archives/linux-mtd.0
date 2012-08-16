Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1zqB-0008Gl-FP
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 13:10:24 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: [PATCH 2/2] arm: sam9_l9260_defconfig: adjust UBI bad eraseblocks
 limit
Date: Thu, 16 Aug 2012 16:10:27 +0300
Message-Id: <1345122627-27151-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1345122627-27151-1-git-send-email-dedekind1@gmail.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1345122627-27151-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Maling List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

UBI has changed the MTD_UBI_BEB_LIMIT semantics. It used to be a percent of
total amount of eraseblock in the partition, and now it is the maximum
amount of bad eraseblocks on the entire devise per 1024 eraseblocks. So not
only the units changed, but also the meaning. But anyway, old 3% roughly
correspond to new 30, so change the defconfig correspondingly.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 arch/arm/configs/sam9_l9260_defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/sam9_l9260_defconfig b/arch/arm/configs/sam9_l9260_defconfig
index da276f9..d11fea5 100644
--- a/arch/arm/configs/sam9_l9260_defconfig
+++ b/arch/arm/configs/sam9_l9260_defconfig
@@ -39,7 +39,7 @@ CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_ATMEL=y
 CONFIG_MTD_NAND_PLATFORM=y
 CONFIG_MTD_UBI=y
-CONFIG_MTD_UBI_BEB_LIMIT=3
+CONFIG_MTD_UBI_BEB_LIMIT=30
 CONFIG_MTD_UBI_GLUEBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
-- 
1.7.10.4
