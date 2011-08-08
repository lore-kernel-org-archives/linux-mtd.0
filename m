Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqVfL-0001D7-CT
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 19:39:13 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 9/9] faq: general: add bug reporting FAQ
Date: Mon, 8 Aug 2011 12:37:19 -0700
Message-ID: <1312832239-21759-10-git-send-email-computersforpeace@gmail.com>
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

It's surprising to note that we do not have a general "how to send a bug
report" FAQ. This patch provides a starting point and (most importantly)
directs UBI/UBIFS users to the appropriate bug reporting information.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 faq/general.xml |   54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 mail.xml        |    4 +++-
 2 files changed, 57 insertions(+), 1 deletions(-)

diff --git a/faq/general.xml b/faq/general.xml
index a4e82f3..92469ab 100644
--- a/faq/general.xml
+++ b/faq/general.xml
@@ -20,6 +20,7 @@
 	<LI><A HREF="general.html#L_point">What are the point() and unpoint() functions used for?</A></LI>
 	<LI><A HREF="general.html#L_unlock">Why do I keep getting errors whenever I try to write to or erase my MTD device?</A></LI>
 	<LI><A HREF="general.html#L_compile_mtd">How do I compile the mtd-utils tree?</A></LI>
+	<LI><A HREF="general.html#L_bug_report">How do I report bugs?</A></LI>
 </OL>
 
 
@@ -274,5 +275,58 @@ directory.
 </P>
 
 
+
+<A NAME="L_bug_report">
+<H2>How do I report bugs?</H2>
+</A>
+
+<P>
+First, you need to figure out what you're reporting a bug against. This website
+(and its accompanying <A HREF="../mail.html">mailing list</A>) supports several
+related aspects of Linux, from the MTD kernel subsystem to its user-space
+utilities, including the generic MTD and NAND interface layers, several MTD
+hardware drivers, the UBI volume management system, several flash filesystems
+(e.g., JFFS2, UBIFS), and the user-space MTD utils. People on the mailing list
+will often support the YAFFS/YAFFS2 filesystems; however, YAFFS has its own
+dedicated <A HREF="http://www.yaffs.net/">website</A> and
+<A HREF="http://stoneboat.aleph1.co.uk/cgi-bin/mailman/listinfo/yaffs">mailing
+list</A>, and its code is kept out of tree.
+</P>
+
+<P>
+Now, bug reports for any of the above areas are more than welcome on the
+<A HREF="../mail.html">MTD mailing list</A>, provided you include sufficient
+information for reproducing and debugging your problem. This means:
+</P>
+
+<UL>
+	<LI>include all kernel 'oopses', stack traces, debug messages, or
+	relevant logs along with a clear description of the problem you're
+	having, what system(s) are affected, and anything else you think might
+	help understand your issue;</LI>
+
+	<LI>include information about flash parameters found from
+	"<CODE>mtdinfo -a</CODE>" (or the less useful info from
+	"<CODE>cat /proc/mtd</CODE>");</LI>
+
+	<LI>specify which kernel version you are using;</LI>
+
+	<LI>specify which mtd-utils version you are using, if applicable. In
+	past releases of mtd-utils, different tools had different versions, so
+	be sure to check the relevant tool (e.g., use "<CODE>nanddump
+	--version</CODE>); newer releases give the same version to most/all the
+	tools.</LI>
+</UL>
+
+<P>
+You may also want to read one of the other related FAQs:
+</P>
+
+<UL>
+	<LI><A HREF="ubifs.html#L_how_send_bugreport">How do I send an UBIFS bug report?</A></LI>
+	<LI><A HREF="ubi.html#L_how_send_bugreport">How do I send an UBI bug report?</A></LI>
+</UL>
+
+
 <INCLUDE file="../inc/footer.tmpl" />
 </PAGE>
diff --git a/mail.xml b/mail.xml
index d79ac51..e3734f1 100644
--- a/mail.xml
+++ b/mail.xml
@@ -18,7 +18,9 @@
 	    <ul>
 		<li>my <a href="http://www.infradead.org/~dwmw2/email.html">notes on etiquette</a>.</li> 
 		<li>the section about <a href="source.html#kernelversions">kernel versions</a></li>
-		<li>the <a href="faq/general.html">MTD-FAQ</a></li>
+		<li>the <a href="faq/general.html">MTD-FAQ</a>, especially the
+			<a href="faq/general.html#L_bug_report">bug reporting
+			FAQ</a>, if applicable</li>
 		<li>the available <a href="doc/general.html">documentation</a></li>
 		<li>the mailing list archives at <a href="http://lists.infradead.org/pipermail/linux-mtd/">
 			http://lists.infradead.org/pipermail/linux-mtd/</a></li>
-- 
1.7.0.4
