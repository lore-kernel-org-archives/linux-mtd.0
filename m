Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eomge-0003i4-Pt
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 08:57:10 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 2/2] Change Linux major number
Date: Thu, 22 Feb 2018 09:56:45 +0100
Message-Id: <20180222085645.9451-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180222085645.9451-1-boris.brezillon@bootlin.com>
References: <20180222085645.9451-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus switched to 4.x a while back. Let's update the website to reflect
that before he decides to switch to 5.x.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 source.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source.xml b/source.xml
index 648d8988c052..6f1ebc43c256 100644
--- a/source.xml
+++ b/source.xml
@@ -162,7 +162,7 @@ Signed-off-by: Realname &amp;lt;realmail&amp;gt;<br />
 
 <h2><a name="kernelversions">Kernel versions</a></h2>
 <p>The MTD code in the linux kernel is updated from the MTD GIT tree
-in kernel version <b>3.x (newest) only</b>.  The 2.4 kernel does not
+in kernel version <b>4.x (newest) only</b>.  The 2.4 kernel does not
 have NAND support in JFFS2, and will not have anything but
 high-priority bug-fixes applied to it.</p>
 <P>As of March 2005 we dropped Linux 2.4 support from CVS head. This
-- 
2.14.1
