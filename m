Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XofD8-0007Cg-KW
 for linux-mtd@lists.infradead.org; Wed, 12 Nov 2014 21:12:20 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd-www: UBI: Fastmap: Add a notes section
Date: Wed, 12 Nov 2014 22:11:44 +0100
Message-Id: <1415826705-7510-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a notes section to clarify that fastmap is an optional
feature and it can happen that a full scan is still done if fastmap
is enabled.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 doc/ubi.xml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index 393b27b..4bded98 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -1269,6 +1269,16 @@ where a full scan takes too long. E.g. On 4GiB NAND chips a full scan takes
 several seconds whereas a fast attach needs less than one second.</p>
 
 
+<h4><a name="L_fastmap_notes">Notes</a></h4>
+
+<p>Enabling fastmap does not guarantee that every attach process can be done
+in a fast way. In some situations a full scan is still needed.
+This can happen in two cases, (i) if a power cut occurred while a fastmap was
+written to the flash or (ii) UBI ran out of PEBs while writing the fastmap.
+The latter case can happen if a massive amount of IO errors happen while writing
+and UBI cannot find an usable PEB.
+</p>
+
 
 <h2><a name="L_ubiblock">R/O block devices on top of UBI volumes</a></h2>
 
-- 
2.1.0
