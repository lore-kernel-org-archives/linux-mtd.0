Received: from fep02-mail.bloor.is.net.cable.rogers.com ([66.185.86.72])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184hhG-0002mv-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Oct 2002 14:06:47 +0100
Received: from AladinSane.stewart.net ([65.48.166.20])
          by fep02-mail.bloor.is.net.cable.rogers.com
          (InterMail vM.5.01.05.06 201-253-122-126-106-20020509) with ESMTP
          id <20021024133514.SGE4551.fep02-mail.bloor.is.net.cable.rogers.com@AladinSane.stewart.net>
          for <linux-mtd@lists.infradead.org>;
          Thu, 24 Oct 2002 09:35:14 -0400
Subject: intel 28F016B3 flash
From: Jim Stewart <jstewart@celerox.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 24 Oct 2002 09:37:33 -0400
Message-Id: <1035466654.1993.19.camel@AladinSane>
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

Can some one list for me the list of kernel configuration options/files
needed to use the MTD with JFFS2 on the following system:

4 - TE28F016B3 flash chips connected as a 32 bit wide x 2Mb flash bank

These chips do not support CFI and are physically connected to the
processor memory bus (0x0C00_0000-0x0C7f_ffff)

Thanks....
