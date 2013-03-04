Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCTBK-0005T7-Ey
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 11:03:51 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] NAND table: alternate row colors
Date: Mon,  4 Mar 2013 13:03:47 +0200
Message-Id: <1362395027-6513-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The truly great NAND table that we have is rather difficult to follow because
it is big. Make this a bit easier by applying different background colors to
different rows. Alternate the colors with period = 4.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 nand-data/csvtohtml.py | 2 +-
 nand-data/header.tmpl  | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/nand-data/csvtohtml.py b/nand-data/csvtohtml.py
index 06b010b..36c72aa 100755
--- a/nand-data/csvtohtml.py
+++ b/nand-data/csvtohtml.py
@@ -21,7 +21,7 @@ def csvToHTML(file):
 	tmp = open(head, 'r')
 	fdout.write(tmp.read())
 	tmp.close()
-	fdout.write('<table>\n')
+	fdout.write('<table class="zebra">\n')
 	row = reader.next()
 	for i in range(len(row)):
 		if (row[i] == "All but Size"):
diff --git a/nand-data/header.tmpl b/nand-data/header.tmpl
index d0b3423..a9d5420 100644
--- a/nand-data/header.tmpl
+++ b/nand-data/header.tmpl
@@ -22,6 +22,9 @@
 	table th { background-color: #eee; }
 	.wrong-size { color: #0066FF; }
 	.exception { color: red; }
+	.zebra tbody tr:nth-child(4n+1) { background-color: #ffffef;}
+	.zebra tbody tr:nth-child(4n+2) { background-color: #ffefff;}
+	.zebra tbody tr:nth-child(4n+3) { background-color: #efffff;}
 	#footer { text-align: left; }
 </style>
 <!--
-- 
1.8.1.2
