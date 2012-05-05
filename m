Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQWFB-0003bA-2q
 for linux-mtd@lists.infradead.org; Sat, 05 May 2012 04:05:18 +0000
Received: by dajz8 with SMTP id z8so5059468daj.30
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 21:05:13 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH (mtd-www) 1/3] doc: update info for Linux 3.0
Date: Fri,  4 May 2012 21:04:58 -0700
Message-Id: <1336190700-27345-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Although 'linux-2.6.git' is still a valid repository, the preferred name is
just 'linux.git', now that Linux has reached version 3.x. And David also has
his repository under 'linux-mtd.git' now, so we might as well redirect to the
modern naming.

So:
 linux-2.6.git -> linux.git
 mtd-2.6.git -> linux-mtd.git

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 doc/git.xml |   22 +++++++++++-----------
 source.xml  |   20 ++++++++++----------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/doc/git.xml b/doc/git.xml
index 2de93d9..d22ef8e 100644
--- a/doc/git.xml
+++ b/doc/git.xml
@@ -11,9 +11,9 @@
 
 	<H2>MTD GIT HOWTO</H2>
 
-<P>The MTD GIT tree is at <TT>git://git.infradead.org/mtd-2.6.git</TT>,
+<P>The MTD GIT tree is at <TT>git://git.infradead.org/linux-mtd.git</TT>,
 and is visible through <A
-HREF="http://git.infradead.org/?p=mtd-2.6.git">gitweb</A>. Other git
+HREF="http://git.infradead.org/?p=linux-mtd.git">gitweb</A>. Other git
 trees are available and can be browsed through the gitweb interface 
 at <A HREF="http://git.infradead.org/">http://git.infradead.org/</A>.
 </P>
@@ -25,7 +25,7 @@ job runs every five minutes, indexing the available trees in users'
 gitweb.</P>
 <P>When creating GIT trees with patches you intend to be pushed upstream,
 please try to ensure that we end up with as few merges as possible.
-Anything you commit should be on top of the latest mtd-2.6 git tree,
+Anything you commit should be on top of the latest linux-mtd git tree,
 rather than against a clean tree from Linus. Avoid doing any merges of
 your own, unless absolutely necessary.</P>
 
@@ -66,19 +66,19 @@ directory by cloning from the existing trees which are in <TT>/srv/git</TT>
 
 <PRE>
 $ cd ~/public_git
-$ git clone -l -n -s --bare /srv/git/mtd-2.6.git foo-2.6.git
-$ echo 'this is my tree for playing with foobar' &amp;gt; foo-2.6.git/description
+$ git clone -l -n -s --bare /srv/git/linux-mtd.git foo.git
+$ echo 'this is my tree for playing with foobar' &amp;gt; foo.git/description
 </PRE>
 
 <P>Your new tree will be immediately accessible to the public through the
-URL <TT>git://git.infradead.org/~&lt;I&gt;user&lt;/I&gt;/foo-2.6.git</TT>.
+URL <TT>git://git.infradead.org/~&lt;I&gt;user&lt;/I&gt;/foo.git</TT>.
 </P>
 <P>Within five minutes of its creation, your tree should be visible 
 through the <A HREF="http://git.infradead.org/">gitweb</A> interface
   too.</P>
 <P>You can then make a local clone of your public tree (as shown below),
 make commits to it and push them back. For this, use the URL
-<TT>ssh://git.infradead.org/~/public_git/foo-2.6.git</TT>.</P>
+<TT>ssh://git.infradead.org/~/public_git/foo.git</TT>.</P>
 
 <P><I>Note: The git d&amp;aelig;mon exports each user's <TT>public_git</TT> directory as 
    <TT>git://git.infradead.org/~<I>user</I></TT> &amp;mdash; just as httpd would
@@ -93,17 +93,17 @@ make commits to it and push them back. For this, use the URL
 
 <H4>Clone Linus' tree</H4>
 If you don't already have a copy of Linus' tree locally, get one:
-<PRE>$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git linux-2.6</PRE>
+<PRE>$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux</PRE>
 
 <H4>Clone MTD tree</H4>
 Using Linus' tree as a reference for existing objects, clone the MTD
   tree:
-<PRE>$ git clone --reference linux-2.6 git://git.infradead.org/mtd-2.6.git mtd-2.6</PRE>
+<PRE>$ git clone --reference linux git://git.infradead.org/linux-mtd.git linux-mtd</PRE>
 
 <H4>Clone your own tree</H4>
 Now using the MTD tree as a reference for existing objects, clone your
 own tree from your <TT>public_git</TT> directory:
-<PRE>$ git clone --reference mtd-2.6 ssh://git.infradead.org/~/public_git/foo-2.6.git myfoo-2.6</PRE>
+<PRE>$ git clone --reference linux-mtd ssh://git.infradead.org/~/public_git/foo.git myfoo</PRE>
 
 Having cloned your tree, you can now commit to it using git-commit
 and push the results back with git-push.
@@ -114,7 +114,7 @@ In general, I would advise that you avoid branches; especially on the server
 much less complicated to deal with.</P>
 <P>However, it <em>is</em> useful to
 keep a 'branch' in your tree for each upstream repository that you
-pull from. The <TT>mtd-2.6.git</TT> tree has such a branch called
+pull from. The <TT>linux-mtd.git</TT> tree has such a branch called
 'linus' which shows the last merge from Linus' master kernel tree,
 thus allowing operations like <TT>git-diff linus..</TT> to work
 easily, and helping the the script which feeds the commits list to
diff --git a/source.xml b/source.xml
index 3df28da..faba4a1 100644
--- a/source.xml
+++ b/source.xml
@@ -8,9 +8,9 @@
 	
 	<INCLUDE file="inc/content.tmpl" />
 
-<h2>GIT vs. Linux 2.6.x</h2>
+<h2>GIT vs. Linux 3.x</h2>
 
-    <P>The MTD GIT tree is <TT>git://git.infradead.org/mtd-2.6.git</TT>, 
+    <P>The MTD GIT tree is <TT>git://git.infradead.org/linux-mtd.git</TT>,
     and is viewable using gitweb at <A 
     HREF="http://git.infradead.org/">http://git.infradead.org/</A>, along
     with a separate tree for the userspace tools, and users' own trees.
@@ -20,7 +20,7 @@
     <P>Gitweb can give patches between specific points in the tree. To
     obtain the full patch between Linus' official kernel tree and the
     current MTD tree, use the following URL: <A
-    HREF="http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff_plain;h=master;hp=linus">http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff_plain;h=master;hp=linus</A>. This
+    HREF="http://git.infradead.org/?p=linux-mtd.git;a=commitdiff_plain;h=master;hp=linus">http://git.infradead.org/?p=linux-mtd.git;a=commitdiff_plain;h=master;hp=linus</A>. This
     produces a full patch from the branch known as '<TT>linus</TT>' in
     the git repository, which represents the last point at which
     Linus' official kernel tree was merged into the MTD git tree. This
@@ -33,11 +33,11 @@
       of Linus' official kernel tree, share the object directory with that
       instead of downloading the same objects all over again. With GIT 1.3.0
       and onwards, that's simple enough. Assuming you have a local tree named
-      '<TT>~/git/linux-2.6</TT>' already, you can clone the MTD tree as follows:
-    <pre>
-git-clone --reference ~/git/linux-2.6 git://git.infradead.org/mtd-2.6
-</pre>
-</P>
+      '<TT>~/git/linux</TT>' already, you can clone the MTD tree as follows:</P>
+<p>
+<tt>git clone --reference ~/git/linux git://git.infradead.org/linux-mtd.git</tt>
+</p>
+
 <p>Users with accounts on git.infradead.org can create their own trees
 there, which are also accessible via public git:// URLs and visible in
 gitweb. For more details see the <A HREF="doc/git.html">GIT HOWTO</A>.</p>
@@ -51,7 +51,7 @@ gitweb. For more details see the <A HREF="doc/git.html">GIT HOWTO</A>.</p>
 If you have the facility to do so, please create a temporary git tree
 from which patches can be pulled. The <A HREF="doc/git.html">GIT
 HOWTO</A> documents how to do this. Please make sure that any such
-such GIT trees are based on the current mtd-2.6 GIT tree and not on 
+such GIT trees are based on the current linux-mtd GIT tree and not on
 Linus' tree, so that unnecessary merges are avoided.
 </p>
 <P>Users without an account on <TT>git.infradead.org</TT> (which is a
@@ -90,7 +90,7 @@ Signed-off-by: Realname &amp;lt;realmail&amp;gt;<br />
 
 <h2><a name="kernelversions">Kernel versions</a></h2>
 <p>The MTD code in the linux kernel is updated from the MTD GIT tree
-in kernel version <b>2.6.newest only</b>.  The 2.4 kernel does not
+in kernel version <b>3.x (newest) only</b>.  The 2.4 kernel does not
 have NAND support in JFFS2, and will not have anything but
 high-priority bug-fixes applied to it.</p>
 <P>As of March 2005 we dropped Linux 2.4 support from CVS head. This
-- 
1.7.5.4.2.g519b1
