Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eomge-0003i5-U4
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 08:57:10 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 1/2] Stop mentioning l2-mtd
Date: Thu, 22 Feb 2018 09:56:44 +0100
Message-Id: <20180222085645.9451-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All developments happen on linux-mtd now, so let's stop mentioning
l2-mtd on the website.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 source.xml | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/source.xml b/source.xml
index 991e86118f48..648d8988c052 100644
--- a/source.xml
+++ b/source.xml
@@ -13,10 +13,12 @@
     <P>MTD development is kept in GIT and managed according to standard Linux
     development practices. Development is based off of one of several trees,
     depending on what you're targeting. For MTD development, patches are kept
-    in the <TT>linux-mtd.git</TT> and <TT>l2-mtd.git</TT> repositories. The
-    former targets the current release cycle (use this only for bugfixes other
+    in the <TT>linux-mtd.git</TT> repository. The <TT>master</TT> (also called
+    <TT>mtd/fixes</TT>), <TT>nand/fixes</TT> and <TT>spi-nor/fixes</TT>
+    branches target the current release cycle (use this only for bugfixes other
     material that's worthy of rapid integration into Linus' tree), while the
-    latter targets the next Linux release (use this for most development).
+    <TT>mtd/next</TT>, <TT>nand/next</TT> and <TT>spi-nor/next</TT> branches
+    target the next Linux release (use this for most development).
     UBI and UBIFS development is tracked separately, in
     <TT>linux-ubifs.git</TT>. User-space tools are kept in
     <TT>mtd-utils.git</TT>.</P>
@@ -43,18 +45,6 @@
                 http://git.infradead.org/linux-mtd.git</a>
         </td>
     </tr>
-    <tr>
-        <td>
-            MTD (next)
-        </td>
-        <td>
-            <tt>git://git.infradead.org/l2-mtd.git</tt>
-        </td>
-        <td>
-            <a href="http://git.infradead.org/l2-mtd.git">
-                http://git.infradead.org/l2-mtd.git</a>
-        </td>
-    </tr>
     <tr>
         <td>
             UBI / UBIFS
-- 
2.14.1
