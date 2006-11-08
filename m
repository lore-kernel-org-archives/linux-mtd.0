Received: from server37.tchmachines.com ([69.50.193.27])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhrTQ-0005P1-BG
	for linux-mtd@lists.infradead.org; Wed, 08 Nov 2006 12:44:32 -0500
Received: from archite by server37.tchmachines.com with local (Exim 4.52)
	id 1GhrTZ-0000Gf-Ub
	for linux-mtd@lists.infradead.org; Wed, 08 Nov 2006 12:44:37 -0500
Message-ID: <44194.69.30.123.186.1163007877.squirrel@www.architechnical.net>
Date: Wed, 8 Nov 2006 12:44:37 -0500 (EST)
Subject: OneNAND on PXA-270?
From: "Pete MacKay" <linux@architechnical.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We're evaluating the Samsung OneNAND to replace the NAND and NOR chips in
our PXA-270-based device.  We're using 2.6.18 and it looks like the MTD
drivers are there, and we understand a little about x-loader and u-boot
sharing the first 128K block.  Does anyone have experience booting Linux
from the OneNAND on a PXA machine?  Specifically, we're interested in:

1) flashing the OneNAND over JTAG (we use Abatron bdi-2000)
2) how to modify u-boot, if needed, to be entered by x-load
3) JFFS2 performance, funky mkfs parameters/caveats

The version of x-load that I found online has support for three OMAP
boards and no cpu/pxa folder (which I assume is taken straight from
u-boot).  Can someone send source for x-load adopted to their pxa machine?

Please let me know your experiences with this part and what we can expect
as we evaluate a board turn.

Thanks Much,
Pete MacKay
