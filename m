Received: from mail-we0-x22f.google.com ([2a00:1450:400c:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBNg6-0001LZ-4z
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 10:59:03 +0000
Received: by mail-we0-f175.google.com with SMTP id x8so2430471wey.34
 for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2013 02:59:00 -0800 (PST)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutski <artem.bityutskiy@linux.intel.com>
Subject: [UBI-WWW] UBI: correct bad href in table of contents
Date: Fri,  1 Mar 2013 11:58:38 +0100
Message-Id: <1362135518-12761-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 doc/ubi.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index d912b8f..f55c04a 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -32,7 +32,7 @@
 	<li><a href="ubi.html#L_scalability">Scalability issues</a>
 		<ul><li><a href="ubi.html#L_scalability_det">Implementation details</a></li></ul>
 	</li>
-	<li><a name="L_max_beb">Reserved blocks for bad block handling (only for NAND chips)</a></li>
+	<li><a href="ubi.html#L_max_beb">Reserved blocks for bad block handling (only for NAND chips)</a></li>
 	<li><a href="ubi.html#L_autoresize">Volume auto-resize</a></li>
 	<li><a href="ubi.html#L_ubi_operations">UBI operations</a>
 		<ol>
-- 
1.7.2.5
