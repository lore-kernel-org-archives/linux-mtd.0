Received: from mms3.broadcom.com ([216.31.210.19])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TBiFL-0006bN-5z
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 08:24:31 +0000
Message-ID: <5050453F.4080504@broadcom.com>
Date: Wed, 12 Sep 2012 01:18:07 -0700
From: "Christian Daudt" <csd@broadcom.com>
MIME-Version: 1.0
To: "Arnd Bergmann" <arnd@arndb.de>,
	"Olof Johansson" <olof@lixom.net>
Subject: [PATCH 3/3] ARM: Remove BCMRING from arm/tools/mach-types
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: Christian Daudt <csd@broadcom.com>, arm@kernel.org,
 linux-mtd@lists.infradead.org, llinux-arm-kernel@lists.infradead.org,
 "JD \(Jiandong\) Zheng" <jdzheng@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove BCMRING from mach-types as that machine type is no
longer maintaned or used.

Signed-off-by: Christian Daudt <csd@broadcom.com>
Reviewed-by: Jiandong Zheng <jdzheng@broadcom.com>

---
  arch/arm/tools/mach-types |    1 -
  1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
index 2997e56..529f7e3 100644
--- a/arch/arm/tools/mach-types
+++ b/arch/arm/tools/mach-types
@@ -404,7 +404,6 @@ vexpress		MACH_VEXPRESS		VEXPRESS		2272
  d2net			MACH_D2NET		D2NET			2282
  bigdisk			MACH_BIGDISK		BIGDISK			2283
  at91sam9g20ek_2mmc	MACH_AT91SAM9G20EK_2MMC	AT91SAM9G20EK_2MMC	2288
-bcmring			MACH_BCMRING		BCMRING			2289
  mahimahi		MACH_MAHIMAHI		MAHIMAHI		2304
  smdk6442		MACH_SMDK6442		SMDK6442		2324
  openrd_base		MACH_OPENRD_BASE	OPENRD_BASE		2325
-- 
1.7.1
