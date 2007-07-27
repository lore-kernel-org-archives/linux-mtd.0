Received: from host.almesberger.net ([204.10.140.10])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IEH7u-0004T9-Ic
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 00:08:31 -0400
From: "Werner Almesberger" <werner@openmoko.org>
Date: Fri, 27 Jul 2007 12:08:13 +0800
To: ben-linux@fluff.org, linux-mtd@lists.infradead.org
Subject: CONFIG_MTD_NAND_S3C2410_CLKSTOP vs. clk_disable
Message-ID: <20070727040813.GR7999@fic.tw.opemoko.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: hxd8-team@lists.internal.openmoko.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ben, linux-mtd,

in 2.6.21.6 (code looks equivalent in 2.6.23-rc1) on our HXD8
S3C2440-based system, bad things happen if opening and then
closing an MTD character device when CONFIG_MTD_NAND_S3C2410_CLKSTOP
is set. Basically the driver falls over completely.

We've tracked this down to the clock's usage count getting
decremented below zero. This happens in s3c2410_nand_select_chip
when mtd_close calls mtd->sync.

The easy work-around is not to enable
CONFIG_MTD_NAND_S3C2410_CLKSTOP, but I wonder what the proper
solution should look like.

It seems to me that s3c2410_nand_select_chip mistakenly assumes
that clk_enable/clk_disable just switch the clock on or off,
instead of actually counting activations.

Either that, or there is the assumption that select/deselect
operations are always paired, e.g., that we only call
nand_release_device after a chip has been selected. This may be
true in a lot of cases, but not in nand_sync (and in some other
code paths as well).

So, should s3c2410_nand_select_chip keep track of whether it has
actually selected a chip ?

Thanks,
- Werner
