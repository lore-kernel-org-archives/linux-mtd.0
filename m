Received: from xes-mad.com ([216.165.139.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8dpa-0007r9-T9
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 21:37:31 +0000
Date: Thu, 21 Feb 2013 15:37:27 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Kumar Gala <galak@kernel.crashing.org>
Subject: [PATCH v2 2/3] powerpc/fsl_lbc: Disable UPM interrupt
Message-ID: <8c255900-acee-4676-a86e-cb66aa5c777c@zimbra>
In-Reply-To: <9972caad-7c5a-4934-9a80-462fb1049973@zimbra>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Nate Case <ncase@xes-inc.com>,
 David Woodhouse <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Nate Case <ncase@xes-inc.com>

We aren't doing anything with the UPM event in the localbus interrupt
handler, so there is no point in enabling it.  This interrupt was
being triggered constantly during UPM NAND flash activity.

Signed-off-by: Nate Case <ncase@xes-inc.com>
---
 arch/powerpc/include/asm/fsl_lbc.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/fsl_lbc.h b/arch/powerpc/include/asm/fsl_lbc.h
index 19e0cd2..8971a9f 100644
--- a/arch/powerpc/include/asm/fsl_lbc.h
+++ b/arch/powerpc/include/asm/fsl_lbc.h
@@ -137,7 +137,7 @@ struct fsl_lbc_regs {
 #define LTESR_CLEAR	0xFFFFFFFF
 #define LTECCR_CLEAR	0xFFFFFFFF
 #define LTESR_STATUS	LTESR_MASK
-#define LTEIR_ENABLE	LTESR_MASK
+#define LTEIR_ENABLE	(LTESR_MASK & ~LTESR_UPM)
 #define LTEDR_ENABLE	0x00000000
 	__be32 ltedr;           /**< Transfer Error Disable Register */
 	__be32 lteir;           /**< Transfer Error Interrupt Register */
-- 
1.7.9.5
