Received: from e-post15.km.ru ([217.197.114.155] helo=e-post15)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IFRoD-0000Jp-LY
	for linux-mtd@lists.infradead.org; Mon, 30 Jul 2007 05:45:03 -0400
From: <alex_khrist@km.ru>
To: linux-mtd@lists.infradead.org
Subject: mmap for JFFS2
Date: Mon, 30 Jul 2007 13:35:30 +0400
Message-Id: <46ADB0E2.00996E.05372@e-post15>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: Text/Plain;
  charset="windows-1251"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!
I use JFFS2 on NAND flash. Some apps require memory mapped file
opened with MAP_SHARED for read/write. But 'mmap' returns EINVAL,
since 'writepage'doesn't implemented for JFFS2 (even in 2.6.22 kernel).
It seems what I have to do it by myself. But I have some doubts.
Why it is not imlemented yet? What the troubles occur for JFFS2 developers?
Does anybody know some workarounds?
P.S. I can't change anything within given apps.

WBR, Alex Khristianovsky.
__________________________________________________________________
