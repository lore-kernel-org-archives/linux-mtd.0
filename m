Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqVf4-00018U-JY
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 19:38:55 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 6/9] doc: update info on compiling mtd-utils
Date: Mon, 8 Aug 2011 12:37:16 -0700
Message-ID: <1312832239-21759-7-git-send-email-computersforpeace@gmail.com>
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

The recursive build system for mtd-utils was rewritten enough recently
such that the description regarding builing ubi-utils by typing `make'
from its subdirectory is now incorrect. Update the UBI docs to reflect
this.

Also, I copied and edited some basic info from the UBI docs to include
in the general description on compiling mtd-utils.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 doc/ubi.xml     |   11 ++++++-----
 faq/general.xml |   21 ++++++++++++++++-----
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index d3f4516..98cb69c 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -213,15 +213,16 @@ git tree. Please, use this branch unless you are an UBI developer.</p>
 
 <h2><a name="L_usptools">User-space tools</a></h2>
 
-<p>UBI user-space tools are available from the the following git repository:</p>
+<p>UBI user-space tools, as well as other MTD user-space tools, are available
+from the the following git repository:</p>
 
 <code>git://git.infradead.org/mtd-utils.git</code>
 
-<p>Please, clone it and compile. The easiest way to compile UBI tools is to go
-straight to the <code>ubi-utils</code> sub-directory and type
-<code>make</code>. <a href="../faq/general.html#L_compile_mtd">This</a> section
+<p>Please, clone it and compile using <code>make</code> from the root mtd-utils
+directory.  <a href="../faq/general.html#L_compile_mtd">This section</a>
 provides information about how to compile the whole <code>mtd-utils</code>
-repository tree.</p>
+repository tree. You should find the UBI tools under the <code>ubi-utils</code>
+sub-directory.</p>
 
 <p>The repository contains the following UBI tools:</p>
 <ul>
diff --git a/faq/general.xml b/faq/general.xml
index 0336a32..a4e82f3 100644
--- a/faq/general.xml
+++ b/faq/general.xml
@@ -256,11 +256,22 @@ unlock them.
 <H2>How do I compile the mtd-utils tree?</H2>
 </A>
 
-<p>You have to install libraries the tools depend on. Please, find
-the information about <code>mkfs.jffs2</code> dependencies
-<a href="../faq/jffs2.html#L_mkfs_jffs2_comp">here</a> and the
-the information about <code>mkfs.ubifs</code> dependencies
-<a href="../faq/ubifs.html#L_mkfs_ubifs_comp">here</a>.</p>
+<P>
+The MTD and UBI user-space tools are available from the the following git
+repository:
+</P>
+
+<CODE>git://git.infradead.org/mtd-utils.git</CODE>
+
+<P>
+To compile, first you have to install libraries the tools depend on. You can
+find the information about <CODE>mkfs.jffs2</CODE> dependencies
+<A HREF="jffs2.html#L_mkfs_jffs2_comp">here</A> and the the information about
+<CODE>mkfs.ubifs</CODE> dependencies
+<A HREF="ubifs.html#L_mkfs_ubifs_comp">here</A>. Once you have these satisfied,
+you should be able to simply type <CODE>make</CODE> from the root mtd-utils
+directory.
+</P>
 
 
 <INCLUDE file="../inc/footer.tmpl" />
-- 
1.7.0.4
