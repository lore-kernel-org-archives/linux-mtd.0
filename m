Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NwaiK-0006BT-5m
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2010 12:38:40 +0000
Received: from guests.acceleratorcentre.net ([209.222.173.41]
	helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NwaiJ-0006sG-DR
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2010 08:38:35 -0400
Date: Tue, 30 Mar 2010 08:36:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: unused MTD-related config variable
Message-ID: <alpine.LFD.2.00.1003300831210.6174@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  just FYI:

drivers/mtd/nand/Kconfig:342:config MTD_NAND_ATMEL_ECC_SOFT

there appears to be no reference to that variable anywhere so it seems
to be superfluous.

  also, the opposite situations hold here, where there *are* tests of
config variables that don't appear to be defined in any Kconfig file:

>>>>> MTD_NAND_OMAP_HWECC
drivers/mtd/nand/omap2.c:528:#ifdef CONFIG_MTD_NAND_OMAP_HWECC
drivers/mtd/nand/omap2.c:980:#ifdef CONFIG_MTD_NAND_OMAP_HWECC
>>>>> MTD_SUPERH_RESERVE
drivers/mtd/maps/solutionengine.c:38:#ifdef CONFIG_MTD_SUPERH_RESERVE
drivers/mtd/maps/solutionengine.c:44:		.size = CONFIG_MTD_SUPERH_RESERVE,
drivers/mtd/maps/solutionengine.c:54:#endif /* CONFIG_MTD_SUPERH_RESERVE */
drivers/mtd/maps/solutionengine.c:97:#ifdef CONFIG_MTD_SUPERH_RESERVE
drivers/mtd/maps/solutionengine.c:100:		       CONFIG_MTD_SUPERH_RESERVE);
drivers/mtd/maps/solutionengine.c:104:#endif /* CONFIG_MTD_SUPERH_RESERVE */
>>>>> REDWOOD_6
drivers/net/smc91x.h:86:#elif defined(CONFIG_REDWOOD_5) || defined(CONFIG_REDWOOD_6)
drivers/mtd/maps/redwood.c:25:#if !defined (CONFIG_REDWOOD_6)
drivers/mtd/maps/redwood.c:72:#else /* CONFIG_REDWOOD_6 */
drivers/mtd/maps/redwood.c:111:#endif /* CONFIG_REDWOOD_6 */
arch/powerpc/platforms/40x/Kconfig:82:#config REDWOOD_6
drivers/net/Kconfig:909:	depends on ARM || REDWOOD_5 || REDWOOD_6 || M32R || SUPERH || \
drivers/mtd/maps/Kconfig:324:	depends on MTD_CFI && ( REDWOOD_4 || REDWOOD_5 || REDWOOD_6 )


rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
