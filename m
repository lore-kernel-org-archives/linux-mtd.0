Received: from pd9eb9138.dip.t-dialin.net ([217.235.145.56] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bO2D-0004Jn-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 15:42:57 +0000
Content-Type: text/plain;
  charset="iso-8859-15"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: JFFS2 & NAND
Date: Thu, 14 Feb 2002 16:57:00 +0100
Cc: linux-mtd@lists.infradead.org, <jffs-dev@axis.com>
MIME-Version: 1.0
Message-Id: <02021416570005.29375@thomas>
Content-Transfer-Encoding: 8bit
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

Since the discussion is broken and I'm answering my question to myself for a 
few days, I ask me, if the interest on this problem is gone.

I have spent a lot of time to make this running. It does, except one 
unresolved issue, when we fail in flush_wbuf and wbuf contains more than the 
actual node.
I'm willing to solve this too, but as I mentioned before, my knowlegde of 
JFFS2 is not deep enough yet. Is there anybody, who want's to implement this 
basicly or give me at least some pointers how to do it.

Thomas
