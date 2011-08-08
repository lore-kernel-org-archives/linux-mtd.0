Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqVeP-0000xl-QC
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 19:38:16 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 4/9] faq/doc: ubi(fs): move "bug report" questions to
 FAQ
Date: Mon, 8 Aug 2011 12:37:14 -0700
Message-ID: <1312832239-21759-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1312832239-21759-1-git-send-email-computersforpeace@gmail.com>
References: <1312832239-21759-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: brian.foster@maxim-ic.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The "How do I send XXX bug report?" questions belong in the FAQ
for easier access (plus, they're questions anyway). We can then
consolidate/link the bug report information to the "general" FAQ
to give a more unified location for bug reporting info.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 doc/ubi.xml   |   54 ------------------------------------------
 doc/ubifs.xml |   71 -------------------------------------------------------
 faq/ubi.xml   |   54 ++++++++++++++++++++++++++++++++++++++++++
 faq/ubifs.xml |   73 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 126 insertions(+), 126 deletions(-)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index 53c986a..d3f4516 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -46,7 +46,6 @@
 		</ol>
 	</li>
 	<li><a href="ubi.html#L_ubidoc">More documentation</a></li>
-	<li><a href="ubi.html#L_how_send_bugreport">How do I send a bug report?</a></li>
 </ol>
 
 
@@ -1186,58 +1185,5 @@ commands and the involved data structures),
 <code>drivers/mtd/ubi/kapi.c</code> file contains comments for each kernel API
 function (just above the body of the function).</p>
 
-
-
-<h2><a name="L_how_send_bugreport">How do I send an UBI bug report?</a></h2>
-
-<p>Before sending a bug report:</p>
-<ul>
-	<li>make sure you use up-to-date UBI; pull the latest UBI patches
-	from corresponding UBIFS back-port trees if needed, see
-	<a href="ubifs.html#L_source">here</a> (we do not maintain separate UBI
-	back-ports trees, and UBIFS trees also contain all UBI updates); no one
-	is interested in digging already fixed problems;</li>
-
-	<li>make sure you have compiled kernel symbols in
-	(<code>CONFIG_KALLSYMS_ALL=y</code> in <code>.config</code>);</li>
-
-	<li>enable UBI debugging (<code>CONFIG_MTD_UBI_DEBUG=y</code>
-	in <code>.config</code>); please, mark only the "<b>UBI debugging</b>"
-	check-box and do not mark other debugging sub-options like "UBI
-	debugging messages" unless you know what you are doing.</li>
-
-	<li>include all the messages UBI prints, not only those you see at
-	the console, but also those you see when running <code>dmesg</code>; or
-	before running your UBI test, which reproduces the error, just
-	invoke <code>dmesg -n8</code> command to make all kernel messages
-	to go to the console; another possibility is to boot the kernel
-	with <code>ignore_loglevel</code> option, in which makes the kernel
-	print all messages to the console unconditionally;
-	<a href="../faq/ubi.html#L_how_debug">this</a> section contains some
-	more information about how the messages can be collected.</li>
-
-	<li>provide UBI configuration from you your <code>.config</code>
-	file, or just attach whole file;</li>
-
-	<li>describe your flash device, attach the
-	"<code>cat /proc/mtd</code>" output;</li>
-
-	<li>specify which kernel version you are using; if your kernel is not
-	the latest one, please, explicitly tell whether you updated UBI by
-	pulling one of the back-port trees or not; if you did not, you will
-	probably be asked to do this, depending on the problem;</li>
-
-	<li>describe how the problem can be reproduced;</li>
-</ul>
-
-<p>Please, attach all the bug-related messages including the UBI messages from
-the kernel ring buffer, which may be collected using the <code>dmesg</code>
-utility or using <code>minicom</code> with serial console capturing. Please,
-describe how the problem can be reproduced (if it can be). The bug report
-should be sent to the <a href="../mail.html">MTD mailing list</a>. Please,
-<b>do not</b> send private e-mails to UBI authors, always CC the mailing
-list!</p>
-
-
 <INCLUDE file="../inc/footer.tmpl" />
 </PAGE>
diff --git a/doc/ubifs.xml b/doc/ubifs.xml
index d8770a2..a9a2ab9 100644
--- a/doc/ubifs.xml
+++ b/doc/ubifs.xml
@@ -31,7 +31,6 @@
 	<li><a href="ubifs.html#L_mountopts">Mount options</a></li>
 	<li><a href="ubifs.html#L_spaceacc">Flash space accounting issues</a></li>
 	<li><a href="ubifs.html#L_documentation">Documentation</a></li>
-	<li><a href="ubifs.html#L_how_send_bugreport">How do I send an UBIFS bug report?</a></li>
 	<li><a href="ubifs.html#L_raw_vs_ftl">Raw flash vs. FTL devices</a></li>
 </ol>
 
@@ -1207,76 +1206,6 @@ at the <a href="ubifs.html#L_ml">UBIFS mailing list.</a></p>
 
 
 
-<h2><a name="L_how_send_bugreport">How do I send an UBIFS bug report?</a></h2>
-
-<p>Before sending a bug report, please, try to do the following:</p>
-<ol>
-	<li>run the MTD tests to validate your flash (see
-	<a href="general.html#L_mtd_tests">here</a>);</li>
-
-	<li>enable the UBIFS extra self checks and try to reproduce the
-	problem. See
-	<a href="../faq/ubifs.html#L_how_debug_self_checks">this</a>
-	chapter for more information about how to enable self-checks.</li>
-</ol>
-
-<p>When sending a bug report, please:</p>
-<ol>
-	<li>make sure you use up-to-date UBIFS; pull the latest UBIFS patches
-	if needed, see <a href="ubifs.html#L_source">here</a>; no one is
-	interested in digging already fixed problems;</li>
-
-	<li>make sure you have compiled the kernel symbols in
-	(<code>CONFIG_KALLSYMS_ALL=y</code> in <code>.config</code>);</li>
-
-	<li>mark the <b>Enable debugging support</b> check-box in the UBIFS
-	kernel configuration menu (<code>CONFIG_UBIFS_FS_DEBUG=y</code> in
-	<code>.config</code>); this option will make UBIFS print more
-	informative error messages; <b>note</b>, you should enable UBIFS
-	debugging, not UBI debugging - distinguish between UBI and UBIFS please,
-	they are different things;</li>
-
-	<li>include all the messages UBIFS prints, not only those you see at
-	the console, but also those you see when running <code>dmesg</code>; or
-	before running your UBIFS test, which reproduces the error, just
-	invoke <code>dmesg -n8</code> command to make all kernel messages
-	to go to the console; another possibility is to boot the kernel
-	with <code>ignore_loglevel</code> option, in which makes the kernel
-	print all messages to the console unconditionally;
-	<a href="../faq/ubi.html#L_how_debug_printks">this</a> section contains
-	some more information about how the messages can be collected.</li>
-
-	<li>explicitly tell about whether you did any checking as described in
-	the previous list of "actions before sending a bug-report" (running MTD
-	tests, enabling UBIFS extra self-checks; and tell the results; if you
-	saw any errors/warnings, describe them and include all corresponding
-	prints from tests / UBIFS / etc;</li>
-
-	<li>provide UBIi and UBIFS configuration from you your
-	<code>.config</code> file, or just attach whole file;</li>
-
-	<li>describe your flash device, attach the
-	"<code>cat /proc/mtd</code>" output;</li>
-
-	<li>specify which kernel version you are using; if your kernel is not
-	the latest one, please, explicitly tell whether you updated UBIFS by
-	pulling one of the back-port trees or not; if you did not, you will
-	probably be asked to do this, depending on the problem;</li>
-
-	<li>describe how the problem can be reproduced;</li>
-</ol>
-
-<p>The bugreport should be sent to the
-<a href="../mail.html">MTD mailing list</a>. Please, <b>do not</b> send
-private e-mails to UBIFS authors, always CC the mailing list!</p>
-
-<p>Note, sometimes UBIFS bugs may appear to be UBI bugs. If you suspect
-there are UBI problems, please, also enable UBI debugging. Please, refer the
-<a href="../faq/ubi.html#L_how_debugt">UBI debugging</a> section for more
-information.</p>
-
-
-
 <h2><a name="L_raw_vs_ftl">Raw flash vs. FTL devices</a></h2>
 
 <p>FTL stands for "Flash Translation Layer" and it is software which emulates
diff --git a/faq/ubi.xml b/faq/ubi.xml
index 294403a..2d9ce6e 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -39,6 +39,7 @@
 	<li><a href="ubi.html#L_dyn_faster">Why a dynamic volume is faster to access than a static volume of the
 same size?</a></li>
 	<li><a href="ubi.html#L_how_debug">How do I debug UBI?</a></li>
+	<li><a href="ubi.html#L_how_send_bugreport">How do I send an UBI bug report?</a></li>
 </ol>
 
 
@@ -840,5 +841,58 @@ option. This will most probably make the ring buffer fit enough messages to
 identify the problem. And because the messages are printed to RAM, this is way
 quicker than the first method.</p>
 
+
+
+<h2><a name="L_how_send_bugreport">How do I send an UBI bug report?</a></h2>
+
+<p>Before sending a bug report:</p>
+<ul>
+	<li>make sure you use up-to-date UBI; pull the latest UBI patches
+	from corresponding UBIFS back-port trees if needed, see
+	<a href="../doc/ubifs.html#L_source">here</a> (we do not maintain separate UBI
+	back-ports trees, and UBIFS trees also contain all UBI updates); no one
+	is interested in digging already fixed problems;</li>
+
+	<li>make sure you have compiled kernel symbols in
+	(<code>CONFIG_KALLSYMS_ALL=y</code> in <code>.config</code>);</li>
+
+	<li>enable UBI debugging (<code>CONFIG_MTD_UBI_DEBUG=y</code>
+	in <code>.config</code>); please, mark only the "<b>UBI debugging</b>"
+	check-box and do not mark other debugging sub-options like "UBI
+	debugging messages" unless you know what you are doing.</li>
+
+	<li>include all the messages UBI prints, not only those you see at
+	the console, but also those you see when running <code>dmesg</code>; or
+	before running your UBI test, which reproduces the error, just
+	invoke <code>dmesg -n8</code> command to make all kernel messages
+	to go to the console; another possibility is to boot the kernel
+	with <code>ignore_loglevel</code> option, in which makes the kernel
+	print all messages to the console unconditionally;
+	<a href="ubi.html#L_how_debug">this</a> section contains some
+	more information about how the messages can be collected.</li>
+
+	<li>provide UBI configuration from you your <code>.config</code>
+	file, or just attach whole file;</li>
+
+	<li>describe your flash device, attach the
+	"<code>cat /proc/mtd</code>" output;</li>
+
+	<li>specify which kernel version you are using; if your kernel is not
+	the latest one, please, explicitly tell whether you updated UBI by
+	pulling one of the back-port trees or not; if you did not, you will
+	probably be asked to do this, depending on the problem;</li>
+
+	<li>describe how the problem can be reproduced;</li>
+</ul>
+
+<p>Please, attach all the bug-related messages including the UBI messages from
+the kernel ring buffer, which may be collected using the <code>dmesg</code>
+utility or using <code>minicom</code> with serial console capturing. Please,
+describe how the problem can be reproduced (if it can be). The bug report
+should be sent to the <a href="../mail.html">MTD mailing list</a>. Please,
+<b>do not</b> send private e-mails to UBI authors, always CC the mailing
+list!</p>
+
+
 <INCLUDE file="../inc/footer.tmpl" />
 </PAGE>
diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index f70c222..14043f5 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -44,6 +44,7 @@
 	<li><a href="ubifs.html#L_few_lebs">I get: "init_constants_early: too few LEBs (12), min. is 17"</a></li>
 	<li><a href="ubifs.html#L_study_ubifs">I want to study UBIFS - any recommendations?</a></li>
 	<li><a href="ubifs.html#L_how_debug">How do I debug UBIFS?</a></li>
+	<li><a href="ubifs.html#L_how_send_bugreport">How do I send an UBIFS bug report?</a></li>
 </ol>
 
 
@@ -1166,7 +1167,7 @@ messages. UBIFS usually prints error messages before switching to read-only
 mode. The messages may shed some light on what happened. Feel free to ask for
 help from the <a href="../mail.html">MTD mailing list</a>. If you think this is
 an UBIFS bug, please, send a
-<a href="../doc/ubifs.html#L_how_send_bugreport">bug report</a>.</p>
+<a href="ubifs.html#L_how_send_bugreport">bug report</a>.</p>
 
 
 
@@ -1434,5 +1435,75 @@ all checks: "<code>echo 127 > /sys/module/ubifs/parameters/debug_chks</code>".</
 	the real power cut testing.</li>
 </ul>
 
+
+
+<h2><a name="L_how_send_bugreport">How do I send an UBIFS bug report?</a></h2>
+
+<p>Before sending a bug report, please, try to do the following:</p>
+<ol>
+	<li>run the MTD tests to validate your flash (see
+	<a href="../doc/general.html#L_mtd_tests">here</a>);</li>
+
+	<li>enable the UBIFS extra self checks and try to reproduce the
+	problem. See
+	<a href="ubifs.html#L_how_debug_self_checks">this</a>
+	chapter for more information about how to enable self-checks.</li>
+</ol>
+
+<p>When sending a bug report, please:</p>
+<ol>
+	<li>make sure you use up-to-date UBIFS; pull the latest UBIFS patches
+	if needed, see <a href="../doc/ubifs.html#L_source">here</a>; no one is
+	interested in digging already fixed problems;</li>
+
+	<li>make sure you have compiled the kernel symbols in
+	(<code>CONFIG_KALLSYMS_ALL=y</code> in <code>.config</code>);</li>
+
+	<li>mark the <b>Enable debugging support</b> check-box in the UBIFS
+	kernel configuration menu (<code>CONFIG_UBIFS_FS_DEBUG=y</code> in
+	<code>.config</code>); this option will make UBIFS print more
+	informative error messages; <b>note</b>, you should enable UBIFS
+	debugging, not UBI debugging - distinguish between UBI and UBIFS please,
+	they are different things;</li>
+
+	<li>include all the messages UBIFS prints, not only those you see at
+	the console, but also those you see when running <code>dmesg</code>; or
+	before running your UBIFS test, which reproduces the error, just
+	invoke <code>dmesg -n8</code> command to make all kernel messages
+	to go to the console; another possibility is to boot the kernel
+	with <code>ignore_loglevel</code> option, in which makes the kernel
+	print all messages to the console unconditionally;
+	<a href="ubi.html#L_how_debug_printks">this</a> section contains
+	some more information about how the messages can be collected.</li>
+
+	<li>explicitly tell about whether you did any checking as described in
+	the previous list of "actions before sending a bug-report" (running MTD
+	tests, enabling UBIFS extra self-checks; and tell the results; if you
+	saw any errors/warnings, describe them and include all corresponding
+	prints from tests / UBIFS / etc;</li>
+
+	<li>provide UBIi and UBIFS configuration from you your
+	<code>.config</code> file, or just attach whole file;</li>
+
+	<li>describe your flash device, attach the
+	"<code>cat /proc/mtd</code>" output;</li>
+
+	<li>specify which kernel version you are using; if your kernel is not
+	the latest one, please, explicitly tell whether you updated UBIFS by
+	pulling one of the back-port trees or not; if you did not, you will
+	probably be asked to do this, depending on the problem;</li>
+
+	<li>describe how the problem can be reproduced;</li>
+</ol>
+
+<p>The bugreport should be sent to the
+<a href="../mail.html">MTD mailing list</a>. Please, <b>do not</b> send
+private e-mails to UBIFS authors, always CC the mailing list!</p>
+
+<p>Note, sometimes UBIFS bugs may appear to be UBI bugs. If you suspect
+there are UBI problems, please, also enable UBI debugging. Please, refer the
+<a href="ubi.html#L_how_debug">UBI debugging</a> section for more
+information.</p>
+
 <INCLUDE file="../inc/footer.tmpl" />
 </PAGE>
-- 
1.7.0.4
