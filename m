Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMvqT-0000xj-IS
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 05:32:26 +0000
Received: by vxd2 with SMTP id 2so2094864vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 May 2011 22:32:24 -0700 (PDT)
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBIFS: document the "free space fixup" flag
Date: Thu, 19 May 2011 01:32:17 -0400
Message-Id: <1305783137-13374-1-git-send-email-mlcreech@gmail.com>
In-Reply-To: <1305197870.2713.95.camel@localhost>
References: <1305197870.2713.95.camel@localhost>
Cc: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Several parts of the UBI and UBIFS documentation already mention the need to
use ubiformat when flashing UBIFS images.  Add a new FAQ entry for the "free
space fixup" flag as an alternative in recent kernels, and put links to it in
these existing locations.
---
 doc/ubi.xml   |    6 ++++++
 faq/ubi.xml   |    8 +++++---
 faq/ubifs.xml |   34 +++++++++++++++++++++++++++++++++-
 3 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index d22884f..b3ca4ee 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -699,6 +699,12 @@ and the writes did not fail. But later we observed weird ECC errors. It took a
 while to find out the problem. In other words, this is also relevant to JFFS2
 images.</p>
 
+<p>An alternative to this approach is to enable the "free space fixup" option
+when generating the UBIFS file system using <code>mkfs.ubifs</code>.  This will
+allow your flasher to not have to worry about <code>0xFF</code> bytes at the end
+of PEBs, which is particularly useful if you need to use an industrial flash
+programmer to write a UBI image.  More information is available
+<a href="../faq/ubifs.html#L_free_space_fixup">here</a>.</p>
 
 
 <h2><a name="L_torturing">Marking eraseblocks as bad</a></h2>
diff --git a/faq/ubi.xml b/faq/ubi.xml
index 8a48a48..f616cfe 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -567,9 +567,11 @@ any image, and check if you still have these errors.</p>
 related to how you flash the UBI/UBIFS images. One typical problem is related
 to ECC calculation algorithm - read
 <a name="ubifs.html#L_why_ubiformat">here</a> for more information. Make sure
-that you use <a name="../doc/ubifs.html#L_usptools">ubiformat</a>), or make sure
-your flashing program skips 0xFF properly (see
-<a href="../doc/ubi.html#L_flasher_algo">here</a>).</p>
+that you use <a href="../doc/ubifs.html#L_usptools">ubiformat</a>, or make sure
+either that your flashing program skips <code>0xFF</code> properly (see
+<a href="../doc/ubi.html#L_flasher_algo">here</a>) or that your UBIFS image
+was generated with the "free space fixup" flag set (see
+<a href="ubifs.html#L_free_space_fixup">here</a>).</p>
 
 <p>Another possibility is that your flash reports that it supports
 <a href="../doc/ubi.html#L_subpage">sub-pages</a>, but does not actually support
diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index f1e063c..6e010b5 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -20,6 +20,7 @@
 	<li><a href="ubifs.html#L_emptyflash">May an empty UBI volume be mounted?</a></li>
 	<li><a href="ubifs.html#L_max_leb_cnt">What is the purpose of -c (--max-leb-cnt) mkfs.ubifs option?</a></li>
 	<li><a href="ubifs.html#L_why_ubiformat">Why do I have to use ubiformat?</a></li>
+	<li><a href="ubifs.html#L_free_space_fixup">What is the the purpose of the -F (--space-fixup) mkfs.ubifs option?</a></li>
 	<li><a href="ubifs.html#L_mkfs_ubifs_comp">How do I compile mkfs.ubifs?</a></li>
 	<li><a href="ubifs.html#L_favor_lzo">What is "favor LZO" compression?</a></li>
 	<li><a href="ubifs.html#L_loop_mount">Can UBIFS mount loop-back devices?</a></li>
@@ -397,7 +398,9 @@ vol_flags=autoresize
 (<a href="../doc/ubi.html#L_flasher_algo">here</a> you may find some
 hints). Please, read
 <a href="ubifs.html#L_why_ubiformat">this</a> section for more information
-why you should use <code>ubiformat</code>.</p>
+why you should use <code>ubiformat</code>, or generate your UBIFS images with
+the <a href="ubifs.html#L_free_space_fixup">free space fixup</a> flag if that
+is not possible.</p>
 
 
 
@@ -594,6 +597,35 @@ written once and only once after the erasure. If you use
 <code>nandwrite</code>, some pages are written twice - once by
 <code>nandwrite</code>, and once by UBIFS.</p>
 
+<p>If you can not use <code>ubiformat</code>, an alternative is to set the
+"free space fixup" flag when generating the UBIFS image (see
+<a href="ubifs.html#L_free_space_fixup">here</a>).</p>
+
+
+<h2><a name="L_free_space_fixup">What is the the purpose of the -F
+(--space-fixup) mkfs.ubifs option?</a></h2>
+
+<p>Because of subtle ECC errors that can arise when programming NAND flash
+(see <a href="ubifs.html#L_why_ubiformat">here</a>), <code>ubiformat</code>
+is the recommended way of flashing a UBI image which contains a UBIFS file
+system.  However, this is not always possible - for example, some embedded
+devices are manufactured using an industrial NAND flash programmer which has
+no knowledge of UBI or UBIFS.</p>
+
+<p>The <code>-F</code> option causes <code>mkfs.ubifs</code> to set a special
+flag in the superblock, which triggers a "free space fixup" procedure in the
+kernel the very first time the filesystem is mounted.  This fixup procedure
+involves finding all empty pages in the UBIFS file system and re-erasing them.
+This ensures that NAND pages which contain all <code>0xFF</code> data get
+fully erased, which removes any problematic non-<code>0xFF</code> data from
+their OOB areas.</p>
+
+<p>This option is supported if you are running a kernel version
+<code>2.6.40</code> or higher.  Note that <code>ubiformat</code> is still the
+preferred flashing method if the image is not being flashed for the first time,
+since it preserves existing erase counters (while using <code>nandwrite</code>
+or its equivalent does not).</p>
+
 
 
 <h2><a name="L_mkfs_ubifs_comp">How do I compile mkfs.ubifs?</a></h2>
-- 
1.7.4.1
