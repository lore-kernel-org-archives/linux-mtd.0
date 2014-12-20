Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y29wd-0006yn-48
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 02:39:07 +0000
Received: by mail-pa0-f50.google.com with SMTP id bj1so2318765pad.37
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 18:38:39 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-www 2/4] source: update git tree information
Date: Fri, 19 Dec 2014 18:38:24 -0800
Message-Id: <1419043106-16453-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1419043106-16453-1-git-send-email-computersforpeace@gmail.com>
References: <1419043106-16453-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Include information about the l2-mtd.git and linux-ubifs.git trees, and
add a nice table to catalog them.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 doc/git.xml |  8 +++---
 source.xml  | 90 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 88 insertions(+), 10 deletions(-)

diff --git a/doc/git.xml b/doc/git.xml
index d22ef8ec6cb4..c3d0b88b87f8 100644
--- a/doc/git.xml
+++ b/doc/git.xml
@@ -11,10 +11,8 @@
 
 	<H2>MTD GIT HOWTO</H2>
 
-<P>The MTD GIT tree is at <TT>git://git.infradead.org/linux-mtd.git</TT>,
-and is visible through <A
-HREF="http://git.infradead.org/?p=linux-mtd.git">gitweb</A>. Other git
-trees are available and can be browsed through the gitweb interface 
+<P>The MTD GIT trees are documented <A HREF="../source.html">here</A>
+and can be browsed through the gitweb interface
 at <A HREF="http://git.infradead.org/">http://git.infradead.org/</A>.
 </P>
 
@@ -25,7 +23,7 @@ job runs every five minutes, indexing the available trees in users'
 gitweb.</P>
 <P>When creating GIT trees with patches you intend to be pushed upstream,
 please try to ensure that we end up with as few merges as possible.
-Anything you commit should be on top of the latest linux-mtd git tree,
+Anything you commit should be on top of the development tree (see <A HREF="../source.html">here</A>),
 rather than against a clean tree from Linus. Avoid doing any merges of
 your own, unless absolutely necessary.</P>
 
diff --git a/source.xml b/source.xml
index 01c359fd20d4..a557a23d45f7 100644
--- a/source.xml
+++ b/source.xml
@@ -10,12 +10,88 @@
 
 <h2>GIT vs. Linux 3.x</h2>
 
-    <P>The MTD GIT tree is <TT>git://git.infradead.org/linux-mtd.git</TT>,
-    and is viewable using gitweb at <A 
+    <P>MTD development is kept in GIT and managed according to standard Linux
+    development practices. Development is based off of one of several trees,
+    depending on what you're targeting. For MTD development, patches are kept
+    in the <TT>linux-mtd.git</TT> and <TT>l2-mtd.git</TT> repositories. The
+    former targets the current release cycle (use this only for bugfixes other
+    material that's worthy of rapid integration into Linus' tree), while the
+    latter targets the next Linux release (use this for most development).
+    UBI and UBIFS development is tracked separately, in
+    <TT>linux-ubifs.git</TT>. User-space tools are kept in
+    <TT>mtd-utils.git</TT>.</P>
+
+    <P>All of the kernel trees are included in the
+    <a href="http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git">linux-next</a>
+    tree and are viewable using gitweb at <A
     HREF="http://git.infradead.org/">http://git.infradead.org/</A>, along
-    with a separate tree for the userspace tools, and users' own trees.
-    From time to time, other trees will exist which contain development work
-    which is not yet ready to be merged with the mainstream kernel.</P>
+    with a separate tree for the userspace tools, and users' own trees.</P>
+
+<table cellpadding="8">
+    <tr>
+        <th>Tree Name</th><th>GIT URL</th><th>Gitweb URL</th>
+    </tr>
+    <tr>
+        <td>
+            MTD
+        </td>
+        <td>
+            <tt>git://git.infradead.org/linux-mtd.git</tt>
+        </td>
+        <td>
+            <a href="http://git.infradead.org/linux-mtd.git">
+                http://git.infradead.org/linux-mtd.git</a>
+        </td>
+    </tr>
+    <tr>
+        <td>
+            MTD (next)
+        </td>
+        <td>
+            <tt>git://git.infradead.org/l2-mtd.git</tt>
+        </td>
+        <td>
+            <a href="http://git.infradead.org/l2-mtd.git">
+                http://git.infradead.org/l2-mtd.git</a>
+        </td>
+    </tr>
+    <tr>
+        <td>
+            UBI / UBIFS
+        </td>
+        <td>
+            <tt>git://git.infradead.org/linux-ubifs.git</tt>
+        </td>
+        <td>
+            <a href="http://git.infradead.org/linux-ubifs.git">
+                http://git.infradead.org/linux-ubifs.git</a>
+        </td>
+    </tr>
+    <tr>
+        <td>
+            MTD user-space tools
+        </td>
+        <td>
+            <tt>git://git.infradead.org/mtd-utils.git</tt>
+        </td>
+        <td>
+            <a href="http://git.infradead.org/mtd-utils.git">
+                http://git.infradead.org/mtd-utils.git</a>
+        </td>
+    </tr>
+    <tr>
+        <td>
+            This website
+        </td>
+        <td>
+            <tt>git://git.infradead.org/mtd-www.git</tt>
+        </td>
+        <td>
+            <a href="http://git.infradead.org/mtd-www.git">
+                http://git.infradead.org/mtd-www.git</a>
+        </td>
+    </tr>
+</table>
 
     <P>Gitweb can give patches between specific points in the tree. To
     obtain the full patch between Linus' official kernel tree and the
@@ -59,6 +135,10 @@ different machine to the old <tt>cvs.infradead.org</tt>) may send trivial patche
 to the mailing list -- but expect to be given an account and expected to
 use git if you make a habit of it.</P>
 
+<p>If you are sending patches to the <a href="mail.html">mailing list</a>,
+please remember to base them on the appropriate tree listed above, not Linus'
+tree.</p>
+
 <h3>Patch Format Guidelines</h3>
 <p>
 In order to make the lives of the patchmonkeys/maintainers easier, a few
-- 
1.9.1
