Date: Mon, 7 Apr 2014 11:58:18 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Message-ID: <1267734566.831894.1396889898472.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <118076373.831770.1396889778297.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH 2/2] mtd: fsl_ifc_nand: Workaround bogus WP on 16-bit NAND
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Prabhakar Kushwaha <prabhakar@freescale.com>,
 Joe Schultz <jschultz@xes-inc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Joe Schultz <jschultz@xes-inc.com>

A workaround was already in place that set the WP bit in the
IFC_CSPR0 register after a STATUS command, however it used an 8-bit
write method. As a result, the WP bit was never set on 16-bit devices,
and these devices would eventually be incorrectly marked as
write-protected.

This patch checks the chip options for a 16-bit device and uses the
appropriate write method to set the WP bit after a STATUS command.

Signed-off-by: Joe Schultz <jschultz@xes-inc.com>
Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 79941c4..cb329794 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -592,7 +592,10 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		 * The chip always seems to report that it is
 		 * write-protected, even when it is not.
 		 */
-		setbits8(ifc_nand_ctrl->addr, NAND_STATUS_WP);
+		if (chip->options & NAND_BUSWIDTH_16)
+			setbits16(ifc_nand_ctrl->addr, NAND_STATUS_WP);
+		else
+			setbits8(ifc_nand_ctrl->addr, NAND_STATUS_WP);
 		return;
 
 	case NAND_CMD_RESET:
-- 
1.7.9.5
