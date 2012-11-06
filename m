Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TVmGe-00079N-S8
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2012 16:44:49 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so317724bkw.36
 for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2012 08:44:46 -0800 (PST)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 1/3] omap gpmc : add support of setting CYCLE2CYCLEDELAY and
 BUSTURNAROUND
Date: Tue,  6 Nov 2012 17:44:35 +0100
Message-Id: <1352220277-4251-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 arch/arm/mach-omap2/gpmc.c             |    7 ++++++-
 arch/arm/plat-omap/include/plat/gpmc.h |    2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
index 8ab1e1b..3957ffc 100644
--- a/arch/arm/mach-omap2/gpmc.c
+++ b/arch/arm/mach-omap2/gpmc.c
@@ -333,8 +333,13 @@ int gpmc_cs_set_timings(int cs, const struct gpmc_timings *t)
 
 	if (gpmc_capability & GPMC_HAS_WR_DATA_MUX_BUS)
 		GPMC_SET_ONE(GPMC_CS_CONFIG6, 16, 19, wr_data_mux_bus);
-	if (gpmc_capability & GPMC_HAS_WR_ACCESS)
+	if (gpmc_capability & GPMC_HAS_WR_ACCESS) {
+		/* XXX check on which hardware it is supported */
+		GPMC_SET_ONE(GPMC_CS_CONFIG6,  0,  3, busturnaround);
+		GPMC_SET_ONE(GPMC_CS_CONFIG6,  8, 11, cycle2cycledelay);
+
 		GPMC_SET_ONE(GPMC_CS_CONFIG6, 24, 28, wr_access);
+	}
 
 	/* caller is expected to have initialized CONFIG1 to cover
 	 * at least sync vs async
diff --git a/arch/arm/plat-omap/include/plat/gpmc.h b/arch/arm/plat-omap/include/plat/gpmc.h
index 2e6e259..34ca454 100644
--- a/arch/arm/plat-omap/include/plat/gpmc.h
+++ b/arch/arm/plat-omap/include/plat/gpmc.h
@@ -131,6 +131,8 @@ struct gpmc_timings {
 	/* The following are only on OMAP3430 */
 	u16 wr_access;		/* WRACCESSTIME */
 	u16 wr_data_mux_bus;	/* WRDATAONADMUXBUS */
+	u16 cycle2cycledelay;	/* CYCLE2CYCLEDELAY */
+	u16 busturnaround;		/* BUSTURNAROUND */
 };
 
 struct gpmc_nand_regs {
-- 
1.7.10.4
