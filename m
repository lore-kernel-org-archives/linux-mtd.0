Received: from mail.theptrgroup.com ([209.183.211.17])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C54em-0003NB-3U
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2004 11:46:49 -0400
Received: from [192.168.180.200] ([132.250.144.104])
	by mail.theptrgroup.com (8.11.6/linuxconf) with ESMTP id i88Fkfs07480
	for <linux-mtd@lists.infradead.org>; Wed, 8 Sep 2004 11:46:44 -0400
From: Jeff Angielski <jeff@theptrgroup.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Message-Id: <1094658352.23122.7.camel@localhost.localdomain>
Mime-Version: 1.0
Date: 08 Sep 2004 11:45:52 -0400
Content-Transfer-Encoding: 7bit
Subject: 64bit support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


After downloading the official 2.4.27 PPC kernel and applying a snapshot
from 20040902, what is the "correct" way to enable 64bit support?

There is no provision in the Config or Makefiles to compile
physmap64.c.  Should I then create my own mapfile based on physmap64.c
or just fix the Makefiles so the correct file gets compiled?

Either way is fine with me, I just figured I would try to do it the
"right" way.


Thanks,
Jeff Angielski
