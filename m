Received: from xes-mad.com ([216.165.139.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8d4w-0002um-Uk
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 20:49:19 +0000
Date: Thu, 21 Feb 2013 14:49:07 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Kumar Gala <galak@kernel.crashing.org>
Subject: [PATCH 1/3] powerpc/fsl_lbc: Synchronize MAR/MxMR writes
Message-ID: <b7cb37fa-dd4e-4d47-8aca-2acc9dfabc25@zimbra>
In-Reply-To: <f227ad8a-d116-4c4c-b758-92d004e71086@zimbra>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Nate Case <ncase@xes-inc.com>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Author: Nate Case <ncase@xes-inc.com>

According to Freescale documentation, it is necessary to perform
a dummy read after writing to the MxMR/MDR registers.  This dummy
read will ensure that the write took effect before performing the
subsequent write to the UPM region.

Although the documentation does not mention the MAR register (only
MxMR and MDR), it has been shown on a P4080 platform that UPM cycles
would on rare occurrence utilize a stale value for MAR from the
previous pattern.  Inserting a dummy read after writing MAR corrects
this problem.

This fixes a problem observed using a UPM NAND flash device where
NAND commands would occasionally get corrupted.

Signed-off-by: Nate Case <ncase@xes-inc.com>
---
 arch/powerpc/include/asm/fsl_lbc.h |    1 +
 arch/powerpc/sysdev/fsl_lbc.c      |    5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/powerpc/include/asm/fsl_lbc.h b/arch/powerpc/include/asm/fsl_lbc.h
index 420b453..19e0cd2 100644
--- a/arch/powerpc/include/asm/fsl_lbc.h
+++ b/arch/powerpc/include/asm/fsl_lbc.h
@@ -263,6 +263,7 @@ extern int fsl_upm_find(phys_addr_t addr_base, struct fsl_upm *upm);
 static inline void fsl_upm_start_pattern(struct fsl_upm *upm, u8 pat_offset)
 {
 	clrsetbits_be32(upm->mxmr, MxMR_MAD, MxMR_OP_RP | pat_offset);
+	(void) in_be32(upm->mxmr);
 }
 
 /**
diff --git a/arch/powerpc/sysdev/fsl_lbc.c b/arch/powerpc/sysdev/fsl_lbc.c
index 6bc5a54..9b4f0cf 100644
--- a/arch/powerpc/sysdev/fsl_lbc.c
+++ b/arch/powerpc/sysdev/fsl_lbc.c
@@ -163,6 +163,11 @@ int fsl_upm_run_pattern(struct fsl_upm *upm, void __iomem *io_base, u32 mar)
 	spin_lock_irqsave(&fsl_lbc_lock, flags);
 
 	out_be32(&fsl_lbc_ctrl_dev->regs->mar, mar);
+	/*
+	 * Dummy read required to ensure that the MAR write takes effect
+	 * before running the pattern
+	 */
+	(void) in_be32(&fsl_lbc_ctrl_dev->regs->mar);
 
 	switch (upm->width) {
 	case 8:
-- 
1.7.9.5
