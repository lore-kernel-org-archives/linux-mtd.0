Received: from metis.extern.pengutronix.de ([83.236.181.26])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DSWpY-0001GR-Sf
	for linux-mtd@lists.infradead.org; Mon, 02 May 2005 05:03:11 -0400
Received: from sha by metis.extern.pengutronix.de with local (Exim 3.36 #1
	(Debian)) id 1DSWpY-0004Yz-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 May 2005 11:03:08 +0200
Date: Mon, 2 May 2005 11:03:08 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050502090308.GA16890@metis.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Sascha Hauer <sha@pengutronix.de>
Subject: enable_vpp / disable_vpp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm using cfi_cmdset_0001.c (intel strata) on a custom pxa board. Our
mapping driver implements enable_vpp and disable_vpp. We often receive
"Chip reports voltage low on erase" errors. The driver seems to disable
vpp during erase operations. If I short-ciruit the disable_vpp function
everything works fine. A comment gives a hint on how to do this correct:

/* We should really make set_vpp() count, rather than doing this */

Is this feature planned for the future? 

Sascha
