Received: from outbox.allstream.net ([207.245.244.41])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKyAJ-00043f-Fm
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 16:55:27 +0000
Subject: Writing a ubinize'd image to fresh NANDFlash with a burner
From: Pontus Hedman <pontushedman@navcast.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 08 Jan 2009 11:55:26 -0500
Message-Id: <1231433726.16113.8.camel@phedman.navcastinc.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So I have used ubinize to create a UBIFS image.  I would now
like to burn it to fresh-from-the factory blank nandflash

Do I just tell the burner to skip bad blocks on write, like nandwrite
does?

This will happen only once; after that Linux will mount the
filesystem and take of it itself.
-- 
Pontus Hedman
Navcast
