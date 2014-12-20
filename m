Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y29wd-0006yo-4I
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 02:39:07 +0000
Received: by mail-pd0-f174.google.com with SMTP id fp1so2303850pdb.5
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 18:38:41 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-www 3/4] doc / faq: spelling, grammar, etc.
Date: Fri, 19 Dec 2014 18:38:25 -0800
Message-Id: <1419043106-16453-3-git-send-email-computersforpeace@gmail.com>
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

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 doc/ubi.xml   | 10 +++++-----
 doc/ubifs.xml |  2 +-
 faq/nand.xml  |  2 +-
 faq/ubi.xml   |  6 +++---
 faq/ubifs.xml | 14 +++++++-------
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index 5cb160306c61..3192fbce3144 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -535,7 +535,7 @@ amount of flash space available for UBI users. Namely:</p>
 	type and is explained below.</li>
 </ul>
 
-<p>Lets introduce symbols:</p>
+<p>Let's introduce symbols:</p>
 
 <ul>
 	<li><i>W</i> - total number of physical eraseblocks on the flash
@@ -665,10 +665,10 @@ which might be difficult to debug later. So we recommend to always do this.</p>
 For example, suppose the first NAND page of a PEB has some data, the second one
 is empty, the third one also has some data, the fourth one and the rest of NAND
 pages are empty as well. In this case UBIFS will treat all NAND pages starting
-from the fourth one as free, and will write data there. However, if the flasher
-program has already written <code>0xFF</code>'s to these pages, so they will be
-written to twice! However, many NAND flashes require NAND pages to be written
-only once, even if the data contains only <code>0xFF</code> bytes.</p>
+from the fourth one as free, and will write data there. If the flasher program
+has already written <code>0xFF</code>'s to these pages, then any new UBIFS data
+will cause a second write. However, many NAND flashes require NAND pages to be
+written only once, even if the data contains only <code>0xFF</code> bytes.</p>
 
 <p>To put it differently, writing <code>0xFF</code> bytes may have side-effects.
 What the flasher has to do is to drop all empty NAND pages from the end of the
diff --git a/doc/ubifs.xml b/doc/ubifs.xml
index 44405d67aec5..c1f54b54744f 100644
--- a/doc/ubifs.xml
+++ b/doc/ubifs.xml
@@ -666,7 +666,7 @@ NOTES
 </pre>
 
 <p>This is true for UBIFS (except of the "some buggy implementations" part,
-because UBIFS does reserves space for cached dirty data). This is also true for
+because UBIFS does reserve space for cached dirty data). This is also true for
 JFFS2, as well as for any other Linux file system.</p>
 
 <p>However, some (perhaps not very good) user-space programmers do not take
diff --git a/faq/nand.xml b/faq/nand.xml
index e142de88a4c8..05f0fbf09f65 100644
--- a/faq/nand.xml
+++ b/faq/nand.xml
@@ -92,7 +92,7 @@ necessary before you copy a filesystem image to the chip.
 
 <P>
 Technically yes, as long as this MTD partition does not contain bad blocks. But
-it is generally a bad idea. For bad block aware copying, batter use nandwrite
+it is generally a bad idea. For bad block aware copying, use nandwrite
 from the <CODE>mtd-utils</CODE> package.
 </P>
 
diff --git a/faq/ubi.xml b/faq/ubi.xml
index e20786203005..9b2165def9c3 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -501,7 +501,7 @@ Why does ubiattach on a freshly formatted device fail with "Invalid argument"?
 
 <p>On NAND devices that support sub-page accesses, <code>ubiformat</code>
 may choose a different location for the
-<a href="../doc/ubi.html#L_ubi_headers">VID header</a> to the kernel UBI driver
+<a href="../doc/ubi.html#L_ubi_headers">VID header</a> to the kernel UBI driver.
 This can result in the following error when attaching to a UBI device:</p>
 
 <pre>
@@ -559,7 +559,7 @@ ubi.mtd=0,2048
 
 <h2><a name="L_subpage">What is a sub-page?</a></h2>
 
-<p>Please, refer <a href="../doc/ubi.html#L_subpage">this</a> section.</p>
+<p>Please, refer to <a href="../doc/ubi.html#L_subpage">this</a> section.</p>
 
 
 
@@ -857,7 +857,7 @@ is a similar table for UBI.</p>
 <h3>Extra self-checks</h3>
 
 <p>UBI contains various internal self-check functions which are often
-very useful for debugging or testing. Please, refer the corresponding
+very useful for debugging or testing. Please, refer to the corresponding
 <a href="ubifs.html#L_how_debug_self_checks">UBIFS self-checks</a>
 section for more information, because UBI extra self-checks are very
 similar, just a bit simpler. Here is a similar table for UBI.</p>
diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index 0274b52958d5..8b61fc741967 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -188,7 +188,7 @@ by running the <a href="../doc/ubi.html#L_usptools"><code>mtdinfo</code></a>
 tool with <code>-u</code> parameter. Of course, the tool has to be run on
 the target system.</p>
 
-<p>Please, refer <a href="ubi.html#L_find_min_io_size">this</a> for more
+<p>Please, refer to <a href="ubi.html#L_find_min_io_size">this</a> for more
 information about how to find these parameters.</p>
 
 <p>And optionally, you should decide which compression algorithm you want
@@ -264,7 +264,7 @@ vol_flags=autoresize
 </ul>
 
 <p>The <code>ubinize</code> utility requires volumes description file. Please,
-refer <a href="ubi.html#L_ubi_mkimg">this</a> section for more
+refer to <a href="ubi.html#L_ubi_mkimg">this</a> section for more
 <code>ubinize</code> usage information.</p>
 
 <p>In the example, the <code>ubinize.cfg</code> file tells <code>ubinize</code>
@@ -628,7 +628,7 @@ provably want the file-system doing inode updates every time they are read.</p>
 
 <h2><a name="L_nfs">Does UBIFS support NFS?</a></h2>
 
-<p>Not, it does not, which means you cannot export UBIFS file-system via NFS.
+<p>No, it does not, which means you cannot export UBIFS file-systems via NFS.
 We did make an attempt to support NFS, but the support was not exactly correct
 so it was dropped, and we have never found time to come back to that. Please,
 refer to <a href="http://marc.info/?l=linux-next&amp;m=121852228611051&amp;w=2">this thread</a>
@@ -682,15 +682,15 @@ compression, write-back, space wastage at the end of logical eraseblocks,
 garbage-collection, etc. Please, refer
 <a href="../doc/ubifs.html#L_spaceacc">this</a> section for details.</p>
 
-<p>Note, JFFS2 also has problems with free space predictions, but in average,
-it reports much more accurate amount of free space. However, JFFS2 may lie and
+<p>Note, JFFS2 also has problems with free space predictions, but on average,
+it reports free space much more accurately. However, JFFS2 may lie and
 report more free space than it actually has. For example, we experienced
 situations when JFFS2 reported 8MiB free space, while we were able to write
 only 2 MiB of data. This makes some user-space applications very unhappy.</p>
 
-<p>UBIFS also lies, but it always report <i>less</i> space that user may
+<p>UBIFS also lies, but it always reports <i>less</i> space than the user may
 actually write. For example, it may report 2MiB of free space, but if you
-start writing to it, may be able to write 4MiB there (even if you have
+start writing to it, you may be able to write 4MiB (even if you have
 compression disabled).</p>
 
 <p>Thus, the only way to find out <i>precise</i> amount of free space is to
-- 
1.9.1
