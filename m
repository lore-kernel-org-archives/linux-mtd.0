Received: from gate.sewerin.de ([77.75.200.26] helo=sew-notes-gt.sewerin.de)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9DBh-00047N-Ay
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2011 09:13:37 +0000
From: Bastian Ruppert <Bastian.Ruppert@Sewerin.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI FAQ: add "why a dynamic volume is faster to access than a
	static..." chapter.
Date: Mon, 11 Apr 2011 11:13:02 +0200
Message-Id: <1302513182-3960-1-git-send-email-Bastian.Ruppert@Sewerin.de>
Cc: Bastian Ruppert <Bastian.Ruppert@Sewerin.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Bastian Ruppert <Bastian.Ruppert@Sewerin.de>
---
 faq/ubi.xml |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/faq/ubi.xml b/faq/ubi.xml
index 48629ea..4a4b3bd 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -36,6 +36,8 @@
 	<li><a href="ubi.html#L_flasher">How do I implement UBI flasher?</a></li>
 	<li><a href="ubi.html#L_bgt_thread">What does the "ubi_bgt0d" thread do?</a></li>
 	<li><a href="ubi.html#L_attach_faster">How do I speed up UBI initialization</a></li>
+	<li><a href="ubi.html#L_dynamic_vs_static">Why a dynamic volume is faster to access than a static volume of the
+same size?</a></li>
 	<li><a href="ubi.html#L_how_debug">How do I debug UBI?</a></li>
 </ol>
 
@@ -704,6 +706,13 @@ can do about it but without re-designing. Here are some ideas</p>
 	here</a>. Indeed, it is easier to solve one problem at a time.</li>
 </ul>
 
+<h2><a name="L_dynamic_vs_static">Why a dynamic volume is faster to
+access than a static volume of the same size?</a></h2>
+
+
+<p>A static UBI volume is designed to store short blobs of data like a
+configuration file. UBI holds a CRC of the hole static volume, so it
+needs more time to mount a static volume than a dynamic one.</p>
 
 
 <h2><a name="L_how_debug">How do I debug UBI?</a></h2>
-- 
1.6.3.3
