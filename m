Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CtCEX-00048t-PJ
	for linux-mtd@lists.infradead.org; Mon, 24 Jan 2005 16:58:54 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Estelle HAMMACHE <estelle.hammache@st.com>
Content-Type: text/plain
Date: Mon, 24 Jan 2005 22:58:48 +0100
Message-Id: <1106603928.5081.50.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: mtd/fs/jffs2 nodemgmt.c,1.115,1.116
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> - avoid filing blocks on the clean list when they have wasted
> space

That's plain wrong. 

Wasted space was introduced to prevent endless garbage collection.
Wasted space is unreclaimable, because it is less than the minimum node
size. It's totally correct to file those blocks on the clean list,
because GC _cannot_ reclaim the wasted space. 

This patch just reinvents the endless GC loop. Please revert.

tglx
