Received: from metis.extern.pengutronix.de ([83.236.181.26])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JWdlx-0003l9-Ac
	for linux-mtd@lists.infradead.org; Tue, 04 Mar 2008 20:30:02 +0000
Received: from octopus.labnet.pengutronix.de ([10.1.1.3])
	by metis.extern.pengutronix.de with esmtp (Exim 4.63)
	(envelope-from <rsc@pengutronix.de>) id 1JWdlt-0006br-AX
	for linux-mtd@lists.infradead.org; Tue, 04 Mar 2008 21:29:57 +0100
Received: from rsc by octopus.labnet.pengutronix.de with local (Exim 4.69)
	(envelope-from <rsc@pengutronix.de>) id 1JWdlt-0007wH-5D
	for linux-mtd@lists.infradead.org; Tue, 04 Mar 2008 21:29:57 +0100
Date: Tue, 4 Mar 2008 21:29:57 +0100
From: Robert Schwebel <r.schwebel@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Spansion S29WS-N MirrorBit flash chips
Message-ID: <20080304202957.GY26320@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The problem mentioned in

http://lists.infradead.org/pipermail/linux-mtd/2005-November/014339.html

hits us while working on mainline support for the Freescale MX27ADS
development board which has such a chip.

The patch outlined there is probably nothing for upstream; does by
accident have somebody have a better solution?

Robert
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
