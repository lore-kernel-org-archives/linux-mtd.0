Received: from smtp-vbr9.xs4all.nl ([194.109.24.29])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NAkVb-0002kC-OO
	for linux-mtd@lists.infradead.org; Wed, 18 Nov 2009 13:23:48 +0000
Received: from mail3.aimsys.nl (a80-127-156-242.adsl.xs4all.nl
	[80.127.156.242])
	by smtp-vbr9.xs4all.nl (8.13.8/8.13.8) with ESMTP id nAIDNfNq001159
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Nov 2009 14:23:42 +0100 (CET)
	(envelope-from nvbolhuis@aimvalley.nl)
Date: Wed, 18 Nov 2009 14:23:41 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Message-Id: <200911181323.nAIDNf94012115@linpc062.aimsys.nl>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] add FAQ entry for "task pdflush:110 blocked for more than 120
	seconds"
Cc: nvbolhuis@aimvalley.nl
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This FAQ entry explains the possible relationship with the
warning "INFO: task pdflush:110 blocked for more than 120 seconds" and the
UBI background thread.

Signed-off-by: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
---
 faq/ubifs.xml |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index 9a731c1..84a79d7 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -39,6 +39,7 @@
 	<li><a href="ubifs.html#L_sudden_ro">UBIFS suddenly became read-only - what is this?</a></li>
 	<li><a href="ubifs.html#L_lebsz_mismatch">I see this UBIFS error: "validate_sb: LEB size mismatch: 129024 in superblock, 126976 real"</a></li>
 	<li><a href="ubifs.html#L_ecc_error">I see this UBI error: "ubi_io_read: error -74 while reading 126976 bytes from PEB 47:4096, read 126976 bytes"</a></li>
+	<li><a href="ubifs.html#L_pdflush_blocked">Is UBI/UBIFS related to this error: "INFO: task pdflush:110 blocked for more than 120 seconds"?</a></li>
 	<li><a href="ubifs.html#L_study_ubifs">I want to study UBIFS - any recommendations?</a></li>
 </ol>
 
@@ -1146,6 +1147,33 @@ them properly. In that case the <code>-74</code> error happens when reading the
 first NAND page.</p>
 
 
+<h2><a name="L_pdflush_blocked">
+Is UBI/UBIFS related to this error: "INFO: task pdflush:110 blocked for more than 120 seconds"?
+</a></h2>
+
+<p>There is a known case for which the UBI background thread is related. If you are using
+NOR flash and UBI attaches to empty flash the UBI background thread will format it (only
+this way it can allow using the entire UBI volume). Formatting means that for
+each eraseblock it
+<ul>
+	<li>erases (very slow on NOR!)</li>
+	<li>writes the UBI headers</li>
+</ul>
+Depending on your CFI/MTD chip driver the "MTD/CFI chip lock" may be held for the time
+it needs to erase a block.
+User-space applications which manipulate files may be blocked by the UBI background thread because
+of the "MTD/CFI chip lock". This causes pdflush to block as well since it acquires the
+UBIFS journal io_mutex that the application holds. See
+<a href="http://lists.infradead.org/pipermail/linux-mtd/2009-November/027993.html">this</a>
+mail thread for details.
+There are two ways to solve this:
+<ol>
+	<li>ubiformat the entire NOR partition before UBI attaches</li>
+	<li>use erase-suspend for writing (if your chip supports this)</li>
+</ol>
+</p>
+
+
 
 <h2><a name="L_study_ubifs">I want to study UBIFS - any recommendations?</a></h2>
 
-- 
1.5.2.2
