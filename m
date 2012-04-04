Received: from mtaout02-winn.ispmail.ntl.com ([81.103.221.48])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SFXjw-0003rS-C9
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 21:27:41 +0000
Received: from aamtaout04-winn.ispmail.ntl.com ([81.103.221.35])
 by mtaout02-winn.ispmail.ntl.com
 (InterMail vM.7.08.04.00 201-2186-134-20080326) with ESMTP id
 <20120404212738.FYXJ23305.mtaout02-winn.ispmail.ntl.com@aamtaout04-winn.ispmail.ntl.com>
 for <linux-mtd@lists.infradead.org>; Wed, 4 Apr 2012 22:27:38 +0100
Received: from zog.reactivated.net ([86.14.215.141])
 by aamtaout04-winn.ispmail.ntl.com
 (InterMail vG.3.00.04.00 201-2196-133-20080908) with ESMTP id
 <20120404212738.CEBB23925.aamtaout04-winn.ispmail.ntl.com@zog.reactivated.net>
 for <linux-mtd@lists.infradead.org>; Wed, 4 Apr 2012 22:27:38 +0100
From: Daniel Drake <dsd@laptop.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI FAQ: document behaviour when lots of blocks go bad
Message-Id: <20120404212736.5DBB39D401E@zog.reactivated.net>
Date: Wed,  4 Apr 2012 22:27:36 +0100 (BST)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Based on an email from Artem.

Signed-off-by: Daniel Drake <dsd@laptop.org>
---
 faq/ubi.xml |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/faq/ubi.xml b/faq/ubi.xml
index c9f1c57..8af461e 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -26,6 +26,7 @@
 	<li><a href="ubi.html#L_restrict">Can UBI logical eraseblocks be written randomly?</a></li>
 	<li><a href="ubi.html#L_why_no_oob">Why UBI does not use OOB area of NAND flashes?</a></li>
 	<li><a href="ubi.html#L_crash_safe">Is UBI tolerant of power failures?</a></li>
+	<li><a href="ubi.html#L_bad_blocks_exceeded">What happens when the PEBs reserved for bad block handling run out?</a></li>
 	<li><a href="ubi.html#L_mlc">May UBI be used on MLC flash?</a></li>
 	<li><a href="ubi.html#L_vid_offset_mismatch">Why does ubiattach on a freshly formatted device fail with "Invalid argument"?</a></li>
 	<li><a href="ubi.html#L_subpage">What is a sub-page?</a></li>
@@ -456,6 +457,22 @@ must be an issue for UBI as well.</p>
 
 
 
+<h2><a name="L_bad_blocks_exceeded">What happens when the PEBs reserved for bad block handling run out?</a></h2>
+
+By default, 1% of the available PEBs are reserved for handling bad blocks.
+
+If the number of blocks that turn bad exceeds that allocation, an error
+will be presented and UBI will switch to read-only mode.
+
+To recover from this error you could re-flash the device. The run-time
+recovery would require deleting or shrinking one of the UBI volumes.
+
+So, you need to carefully select the amount of PEBs reserved for bad
+blocks handling. For Nokia phones like N900 (with Samsung OneNAND flash,
+256MiB in size, 128KiB PEBs) 1% was just fine.
+
+
+
 <h2><a name="L_mlc">May UBI be used on MLC flash?</a></h2>
 
 <p>Yes, it may, as long as the flash is supported by the MTD layer. UBI does
-- 
1.7.7.6
