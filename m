Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eBuH4-00067X-Kl
 for linux-mtd@lists.infradead.org; Tue, 07 Nov 2017 03:10:04 +0000
Received: by mail-pg0-x241.google.com with SMTP id s75so9912120pgs.0
 for <linux-mtd@lists.infradead.org>; Mon, 06 Nov 2017 19:09:42 -0800 (PST)
From: Roy Franz <rfranz@cavium.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: roy.franz@cavium.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: docs: Add mention of patchwork to patch submission
 section
Date: Mon,  6 Nov 2017 19:07:55 -0800
Message-Id: <20171107030755.17822-1-roy.franz@cavium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mention that patches submitted to the mailing list are tracked in
the MTD patchwork system.

Signed-off-by: Roy Franz <roy.franz@cavium.com>
---
 source.xml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/source.xml b/source.xml
index a557a23..991e861 100644
--- a/source.xml
+++ b/source.xml
@@ -137,7 +137,9 @@ use git if you make a habit of it.</P>
 
 <p>If you are sending patches to the <a href="mail.html">mailing list</a>,
 please remember to base them on the appropriate tree listed above, not Linus'
-tree.</p>
+tree.  Patches submitted to the mailing list are tracked in
+<A HREF="https://patchwork.ozlabs.org/project/linux-mtd/list/">Patchwork</A>.</p>
+
 
 <h3>Patch Format Guidelines</h3>
 <p>
-- 
2.11.0
