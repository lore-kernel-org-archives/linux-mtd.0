Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iFJb-0001lm-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2002 13:49:15 +0000
Received: from pcjonashg.axis.se (pcjonashg.axis.se [10.13.8.50])
	by krynn.axis.se (8.12.1/8.12.1/Debian -5) with ESMTP id g25E06QI025762
	for <linux-mtd@lists.infradead.org>; Tue, 5 Mar 2002 15:00:06 +0100
Subject: recalc_sigpending in compatmac.h
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 05 Mar 2002 15:01:16 +0100
Message-Id: <1015336876.32356.6.camel@pcjonashg>
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

fs/jffs/intrep.c from Linux 2.4.17 won't compile:

intrep.c:3355:27: arguments given to macro `recalc_sigpending'

It looks like recalc_sigpending has been changed to handle kernel
version < 2.5.5 but it doesn't seem to work. fs/jffs/intrep.c (2.4.17
and current) calls recalc_sigpending with an argument but the macro has
no argument if kernel version < 2.5.5 according to latest compatmac.h.

/Jonas
