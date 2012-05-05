Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQWFI-0003bA-1y
 for linux-mtd@lists.infradead.org; Sat, 05 May 2012 04:05:24 +0000
Received: by mail-pz0-f43.google.com with SMTP id z8so5059468daj.30
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 21:05:23 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH (mtd-www) 3/3] faq: ubifs: fix grammar, spelling
Date: Fri,  4 May 2012 21:05:00 -0700
Message-Id: <1336190700-27345-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1336190700-27345-1-git-send-email-computersforpeace@gmail.com>
References: <1336190700-27345-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
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
 faq/ubifs.xml |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index 6476ce0..c510400 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -27,7 +27,7 @@
 	<li><a href="ubifs.html#L_atime">Does UBIFS support atime?</a></li>
 	<li><a href="ubifs.html#L_nfs">Does UBIFS support NFS?</a></li>
 	<li><a href="ubifs.html#L_slow_when_full">Does UBIFS become slower when it is full?</a></li>
-	<li><a href="ubifs.html#L_df_report">Why <code>df</code> reports too few free space?</a></li>
+	<li><a href="ubifs.html#L_df_report">Why does <code>df</code> report too little free space?</a></li>
 	<li><a href="ubifs.html#L_jffs2_space">Why does my UBIFS volume have significantly lower capacity than my equivalent jffs2 volume?</a></li>
 	<li><a href="ubifs.html#L_comproff">How do I disable compression?</a></li>
 	<li><a href="ubifs.html#L_ubifs_nandsim">How do I use UBIFS with nandsim?</a></li>
@@ -387,7 +387,7 @@ ubiupdatevol /dev/ubi0_0 -t
 <p>It is a form of specifying file-system size. But instead of specifying the
 exact file-system size, this option defines the <i>maximum</i> file-system
 size (more strictly, maximum UBI volume size). For example, if you use
-<code>--max-leb-cnt=200</code> <code>mkfs.ubifs</code> option, than it will be
+<code>--max-leb-cnt=200</code> <code>mkfs.ubifs</code> option, then it will be
 possible to put the resulting image to smaller UBI volume and mount it. But if
 the image is put to a larger UBI volume, the file-system will anyway take only
 first 200 LEBs, and the rest of the volume will be wasted.</p>
@@ -397,8 +397,8 @@ resulting image file, which depends only on the amount of data in the
 file-system. <code>mkfs.ubifs</code> just writes the <code>--max-leb-cnt</code>
 value to the file-system superblocks.</p>
 
-<p>This feature is quite handy on NAND flashes, because they have random amount
-of initial bad eraseblocks (marked as bad in production). This means, that
+<p>This feature is quite handy on NAND flashes, because they have a random amount
+of initial bad eraseblocks (marked as bad in production). This means that
 different devices may have slightly different volume sizes (especially if the
 UBI <a href="../doc/ubi.html#L_autoresize">auto-resize</a> feature is used). So
 you may specify the maximum possible volume size and this will guarantee that
@@ -669,7 +669,7 @@ eraseblocks.</li>
 
 
 
-<h2><a name="L_df_report"> Why <code>df</code> reports too few free space?</a></h2>
+<h2><a name="L_df_report">Why does <code>df</code> report too little free space?</a></h2>
 
 <p>UBIFS flash space accounting is quite challenging and it is not always
 possible to report accurate amount of free space. The <code>df</code> utility
-- 
1.7.5.4.2.g519b1
