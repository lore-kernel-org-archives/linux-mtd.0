Received: from mail-he1eur01on0072.outbound.protection.outlook.com
 ([104.47.0.72] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIXWO-0004D9-6b
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 10:49:33 +0000
From: Jagdish Gediya <jagdish.gediya@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: Issue while oops and panic message logging to MTD partition
Date: Tue, 15 May 2018 10:49:15 +0000
Message-ID: <HE1PR0402MB2778B83183DA25027369540A90930@HE1PR0402MB2778.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Setup details:
Board - Freescale ls1046ardb(ARM64)
MTD device - nand(IFC)

CONFIG_MTD_OOPS is enabled to collect oops and panic logs.=20
Added bootargs to collect logs : mtdoops.mtddev=3D3 mtdoops.record_size=3D1=
6384

Issue:
Kernel hangs during oops log collection in function :fsl_ifc_run_command".
Below is the code location where it hangs exactly,

/*
 * execute IFC NAND command and wait for it to complete
 */
static void fsl_ifc_run_command(struct mtd_info *mtd)
{		.
		.
		.
		.
		.

        /* wait for command complete flag or timeout */
        wait_event_timeout(ctrl->nand_wait, ctrl->nand_stat,
                           msecs_to_jiffies(IFC_TIMEOUT_MSECS));

		.
		.
		.
		.
}

"wait_event_timeout" is the exact culrit where kernel hangs. As panic(...) =
disables the local interrupt by calling local_irq_disable(),
It looks like behavior is expected because timer interrupts are disabled an=
d because of that "wait_event_timeout" hangs forever.

The odd behaviour is sometimes "wait_event_timeout" does not hang. The reas=
on could be being a multicore processor, some other core would receive the
timer interrupt and as a result "wait_event_timeout" gets unblocked.

How the other driver accomplish the timer replated work if any during the p=
anic path or in general when local interrupts are disabled?

Thanks,
Jagdish
