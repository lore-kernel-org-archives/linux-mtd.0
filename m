From: Anup Patel <anup.patel@broadcom.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray
 Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Pramod KUMAR <pramodku@broadcom.com>,
 "Vikram Prakash" <vikramp@broadcom.com>, Sandeep Tripathy
 <tripathy@broadcom.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bcm-kernel-feedback-list@broadcom.com>, "Anup Patel"
 <anup.patel@broadcom.com>
Subject: [PATCH v2 2/4] mtd: nand: Allow MTD_NAND_BRCMNAND to be selected for
 ARM64
Date: Fri, 16 Oct 2015 14:38:55 +0530
Message-ID: <1444986537-28387-3-git-send-email-anup.patel@broadcom.com>
In-Reply-To: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The BRCM NAND driver can be re-used for Broadcom ARM64 SoCs hence
this patch updates Kconfig to allow selection of MTD_NAND_BRCMNAND
for ARM64.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Vikram Prakash <vikramp@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Pramod KUMAR <pramodku@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 3324281..a1b5819 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -393,7 +393,7 @@ config MTD_NAND_GPMI_NAND
 
 config MTD_NAND_BRCMNAND
 	tristate "Broadcom STB NAND controller"
-	depends on ARM || MIPS
+	depends on ARM || ARM64 || MIPS
 	help
 	  Enables the Broadcom NAND controller driver. The controller was
 	  originally designed for Set-Top Box but is used on various BCM7xxx,
-- 
1.9.1
