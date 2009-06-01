Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MAxGg-0007La-An
	for linux-mtd@lists.infradead.org; Mon, 01 Jun 2009 02:29:00 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KKJ001LPFY53G80@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Sun, 31 May 2009 22:22:53 -0400 (EDT)
Date: Sun, 31 May 2009 22:22:53 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: linux-mtd@lists.infradead.org
Subject: git pull request: Marvell Orion/Kirkwood support updates
Message-id: <alpine.LFD.2.00.0905312214120.3906@xanadu.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Minor stuff (for now)...

Please pull mtd branch of:

	git://git.marvell.com/orion mtd

to receive 2 small patches on top of current content of
git://git.infradead.org/mtd-2.6.git.  Those patches are:

   mtd m25p80: add support for Macronix MX25L12805D

   mtd orion_nand: use burst reads with double word accesses

The first patch was already posted to this mailing list on May 20th.  
The second one follows this mail.


Nicolas
