Received: from smtp123.sbc.mail.sp1.yahoo.com ([69.147.64.96])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MRtAu-0004HW-Ni
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 19:33:01 +0000
From: David Brownell <david-b@pacbell.net>
To: davinci-linux-open-source@linux.davincidsp.com
Subject: Re: [PATCH v3 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large
	page NAND chips
Date: Fri, 17 Jul 2009 12:32:53 -0700
References: <1247781590-11323-1-git-send-email-nsnehaprabha@ti.com>
In-Reply-To: <1247781590-11323-1-git-send-email-nsnehaprabha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907171232.53725.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, nsnehaprabha@ti.com,
	dwmw2@infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 16 July 2009, nsnehaprabha@ti.com wrote:
> 	It also fixes a bug in the ECC correction handler.
> When we introduce 5 bit-errors in chunk, error correction stops working. When
> errors are detected the 4BITECC_START bit was left high, which should be
> cleared. 

Agreed that needs to be fixed, but there should be a comment
about this being an *undocumented* behavior in the hardware.

The reason that the bug exists at all is because this step
has never been documented.  So, please roll in this update.

- Dave

---
 drivers/mtd/nand/davinci_nand.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -350,13 +350,16 @@ compare:
 
 	/*
 	 * Clear any previous address calculation by doing a dummy read of an
-	 * error address register.
+	 * error address register.  UNDOCUMENTED that the ECC engine won't
+	 * recover after 5-bit ECC errors without this step.
 	 */
 	davinci_nand_readl(info, NAND_ERR_ADD1_OFFSET);
 
 	/* Start address calculation, and wait for it to complete.
 	 * We _could_ start reading more data while this is working,
-	 * to speed up the overall page read.
+	 * to speed up the overall page read.  UNDOCUMENTED that
+	 * reading some ERRVAL register is needed in all cases, not
+	 * just when an error must be corrected.
 	 */
 	davinci_nand_writel(info, NANDFCR_OFFSET,
 			davinci_nand_readl(info, NANDFCR_OFFSET) | BIT(13));
