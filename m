Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R4ACZ-0001oj-Tn
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2011 11:33:56 +0000
Received: from gallifrey.ext.pengutronix.de
	([2001:6f8:1178:4:5054:ff:fe8d:eefb] helo=localhost)
	by metis.ext.pengutronix.de with esmtp (Exim 4.72)
	(envelope-from <jbe@pengutronix.de>) id 1R4ACS-0000cs-CF
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2011 13:33:49 +0200
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: How to distinguish MLC and SLC NANDs?
Date: Thu, 15 Sep 2011 13:33:48 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201109151333.48684.jbe@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

my NAND controller is able to handle different corrections sum types (a weak 
one for SLC, a more stronger one for MLC). Is there a unique pattern for MLC 
or SLC in the mtd structure available after calling nand_scan_ident() to 
select what correction sum type should be used for the attached NAND?
Or should I always use the strongest type, independent of the NAND type?

Thanks in advance for some hints.

jbe

-- 
Pengutronix e.K.                              | Juergen Beisert             |
Linux Solutions for Science and Industry      | http://www.pengutronix.de/  |
