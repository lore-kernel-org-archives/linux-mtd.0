Received: from web80207.mail.yahoo.com ([66.218.79.42])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ay2jG-0005as-K5
	for linux-mtd@lists.infradead.org; Tue, 02 Mar 2004 05:46:06 +0000
Message-ID: <20040302054544.49317.qmail@web80207.mail.yahoo.com>
Date: Mon, 1 Mar 2004 21:45:44 -0800 (PST)
From: Pete Popov <pete_popov@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: CONFIG_FS_JFFS2_NAND bug
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


It looks like in the cvs tree, the fs/Kconfig sets
CONFIG_JFFS2_FS_NAND, if the option is selected.
However, there are a couple of harmless references in
the fs/jffs2 code to CONFIG_FS_JFFS2_NAND. 

Pete
