Received: from fep01-mail.bloor.is.net.cable.rogers.com ([66.185.86.71])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wli0-0002rt-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2002 16:46:44 +0100
Received: from AladinSane.stewart.net ([65.48.166.20])
          by fep01-mail.bloor.is.net.cable.rogers.com
          (InterMail vM.5.01.05.06 201-253-122-126-106-20020509) with ESMTP
          id <20021002154556.QQVF252125.fep01-mail.bloor.is.net.cable.rogers.com@AladinSane.stewart.net>
          for <linux-mtd@lists.infradead.org>;
          Wed, 2 Oct 2002 11:45:56 -0400
Subject: nor and nand on same system
From: Jim Stewart <jstewart@celerox.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 02 Oct 2002 11:46:59 -0400
Message-Id: <1033573620.5141.6.camel@AladinSane>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Dear list:

I am designing a system that may contain both nor and nand flash in the
same system (NAND flash for future expansion and nor for boot and root
fs).
I have looked over the MTD documentation, how-to's, etc. and it seems
that the driver level is linked to a SINGLE specific hardware
implementation. Is it possible to have two separate drivers -- one for
the nor device (probably using the current CFI drivers) and one for a
NAND device?

I plan on using the JFFS as the MTD client

Thanks,

Jim Stewart
Celerox Digital Solutions
