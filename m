Received: from 213-229-28-240.static.adsl-line.inode.at ([213.229.28.240]
	helo=contec-int.at)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2x4i-0000gb-Qs
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2004 15:16:50 -0400
From: Manfred Gruber <gruber.m@utanet.at>
To: linux-mtd@lists.infradead.org
Date: Thu, 2 Sep 2004 21:21:47 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200409022121.47855.gruber.m@utanet.at>
Subject: SLRAM - Filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I have SLRAM-Driver on my 2MB nv-ram running.

Which fs is good there to use?
JFFS2 fails because of the missing erase size. Is this correct?

Should I put a ext2 on it? 
I need a fs because i don't what to change my application, which writes files.

Thanks regards manfred
