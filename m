From: "Govindarajan, Sriramakrishnan" <srk@ti.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 12 Nov 2009 21:28:58 +0530
Subject: NAND: failure reported with mtd_oobtest(read delay violated)
Message-ID: <FCCFB4CDC6E5564B9182F639FC35608702FA5CC012@dbde02.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
On the OMAP3 EVM platform we are seeing failures when we run the mtd_oobtes=
t repeatedly (overnight). Usually the failures are reported after 40-45 ite=
rations.

Further analysis with logic analyzer seems to indicate that for the specifi=
c instance where failure is observed, the time delay between dispatching th=
e READ0 command and the start of read operation is violated. (udelay loop w=
ould start even before the write is reflected on the HW)

OMAP3EVM implementation relies on command delay(chip_delay set to 50ms) and=
 doesn't use wait pin monitoring. By adding a data memory barrier dmb() ins=
truction right after the command phase the issue seems to be resolved.

Have we seen similar behavior on other platforms that rely on command delay=
 and do we specifically require a dmb() after the command is written?

DIFF Details:(will post this a patch once I hear your review comments)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2211386..8df3780 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -651,6 +651,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsig=
ned int command,
                               NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
                chip->cmd_ctrl(mtd, NAND_CMD_NONE,
                               NAND_NCE | NAND_CTRL_CHANGE);
+               dmb();

                /* This applies to read commands */
        default:


Regards
Sriram
