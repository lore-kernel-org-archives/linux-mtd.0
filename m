Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cdOG6-0008LG-59
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 21:34:14 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, dwmw2@infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 5/5] mtd-www: UBI: Add sections about UBI power-cut testing
Date: Mon, 13 Feb 2017 22:31:18 +0100
Message-Id: <20170213213118.7857-6-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170213213118.7857-1-david.oberhollenzer@sigma-star.at>
References: <20170213213118.7857-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add remark about UBI power-cut testing and reference in
UBIFS section.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 doc/ubi.xml   | 11 +++++++++++
 faq/ubi.xml   | 35 +++++++++++++++++++++++++++++++++++
 faq/ubifs.xml |  5 +++++
 3 files changed, 51 insertions(+)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index 3192fbc..299b0f1 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -15,6 +15,7 @@
 <ol>
 	<li><a href="ubi.html#L_rednote">Big red note</a></li>
 	<li><a href="ubi.html#L_overview">Overview</a></li>
+	<li><a href="ubi.html#L_powercut">Power-cuts tolerance</a></li>
 	<li><a href="ubi.html#L_source">Source code</a></li>
 	<li><a href="ubi.html#L_ml">Mailing list</a></li>
 	<li><a href="ubi.html#L_usptools">User-space tools</a></li>
@@ -188,6 +189,16 @@ technology imposes.</p>
 
 
 
+<h2><a name="L_powercut">Power-cuts tolerance</a></h2>
+
+<p>Both UBI and UBIFS are designed with tolerance to power-cuts in mind.</p>
+
+<p>UBI has an internal debugging infrastructure that can emulate power
+failures for testing. The advantage of the emulation is that it emulates
+power failures at the critical points where control data structures are
+written to the device whereas the probability of interrupting the system at
+those precise moments with physical power cut testing is rather low.</p>
+
 <h2><a name="L_source">Source code</a></h2>
 
 <p>UBI is in the main-line Linux kernel starting from version
diff --git a/faq/ubi.xml b/faq/ubi.xml
index f8c40f6..fdd7abb 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -898,6 +898,41 @@ similar, just a bit simpler. Here is a similar table for UBI.</p>
 </tr>
 </table>
 
+<h3><a name="L_how_debug_recovery">Power-cut recovery testing</a></h3>
+
+<p>UBI suppors power-cut emulation for testing which emulates power-cuts after
+a random number of writes. When a power-cut is emulated, UBI switches to
+read-only mode and disallows any further write to the UBI volume, thus
+emulating a power cut. The main idea of this mode is to emulate power cuts in
+interesting places, e.g. when writing the vid header.</p>
+
+<p>Use the <code>tst_emulate_power_cut</code> debugfs file to set flags for
+when to enable power-cut emulation. Possible flags for power-cut testing
+can be seen in the table below.</p>
+
+<p>Use the files <code>tst_emulate_power_cut_min</code> and
+<code>tst_emulate_power_cut_max</code> to set the minimum and maximum number
+of successful writes, respectively, before a power-cut is emulated.</p>
+
+<p>Note that UBIFS has its own power-cut emulation functions. Please, refere
+to the corresponding
+<a href="ubifs.html#L_how_debug_recovery">Power-cut recovery testing</a>
+section.</p>
+
+<table border="2" cellpadding="4" cellspacing="0">
+<tr>
+	<td><b>Emulation type</b></td>
+	<td><b>Flag value</b></td>
+</tr>
+<tr>
+	<td>Allow power-cut to be emulated during EC header write</td>
+	<td>1</td>
+</tr>
+<tr>
+	<td>Allow power-cut to be emulated during VID header write</td>
+	<td>2</td>
+</tr>
+</table>
 
 <h2><a name="L_how_send_bugreport">How do I send an UBI bug report?</a></h2>
 
diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index 2b724f3..e223ee4 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -1405,6 +1405,11 @@ the <code>ro_error</code> file.</p>
 repository) is aware of UBIFS power cut recovery testing mode and can be used
 for UBIFS power-cut testing.</p>
 
+<p>Note that UBI also supports power-cut emulation for UBI testing. Please,
+refere to the corresponding
+<a href="ubi.html#L_how_debug_recovery">Power-cut recovery testing</a>
+section.</p>
+
 
 <h2><a name="L_how_send_bugreport">How do I send an UBIFS bug report?</a></h2>
 
-- 
2.11.0
