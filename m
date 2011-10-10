Received: from mtaout02-winn.ispmail.ntl.com ([81.103.221.48])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RDEdO-0006P4-Py
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2011 12:07:07 +0000
Received: from aamtaout02-winn.ispmail.ntl.com ([81.103.221.35])
	by mtaout02-winn.ispmail.ntl.com
	(InterMail vM.7.08.04.00 201-2186-134-20080326) with ESMTP id
	<20111010120704.XFVG21463.mtaout02-winn.ispmail.ntl.com@aamtaout02-winn.ispmail.ntl.com>
	for <linux-mtd@lists.infradead.org>; Mon, 10 Oct 2011 13:07:04 +0100
Received: from zog.reactivated.net ([86.14.215.141])
	by aamtaout02-winn.ispmail.ntl.com
	(InterMail vG.3.00.04.00 201-2196-133-20080908) with ESMTP id
	<20111010120703.CZUZ5924.aamtaout02-winn.ispmail.ntl.com@zog.reactivated.net>
	for <linux-mtd@lists.infradead.org>; Mon, 10 Oct 2011 13:07:03 +0100
From: Daniel Drake <dsd@laptop.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBIFS FAQ: document reasons for loss of space efficiency
Message-Id: <20111010120701.C525F9D401E@zog.reactivated.net>
Date: Mon, 10 Oct 2011 13:07:01 +0100 (BST)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OLPC is suffering a bit from the loss of space efficiency of UBIFS,
document reasons for this based on an IRC discussion with Artem.

Also document the difference in default compression schemes between
JFFS2 and UBIFS which bit us at first.

Signed-off-by: Daniel Drake <dsd@laptop.org>
---
 faq/ubifs.xml |   58 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index b6b0b14..a39ef46 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -29,6 +29,7 @@
 	<li><a href="ubifs.html#L_nfs">Does UBIFS support NFS?</a></li>
 	<li><a href="ubifs.html#L_slow_when_full">Does UBIFS become slower when it is full?</a></li>
 	<li><a href="ubifs.html#L_df_report">Why <code>df</code> reports too few free space?</a></li>
+	<li><a href="ubifs.html#L_jffs2_space">Why does my UBIFS volume have significantly lower capacity than my equivalent jffs2 volume?</a></li>
 	<li><a href="ubifs.html#L_comproff">How do I disable compression?</a></li>
 	<li><a href="ubifs.html#L_ubifs_nandsim">How do I use UBIFS with nandsim?</a></li>
 	<li><a href="ubifs.html#L_ubifs_extract">How do I extract files from an UBI/UBIFS image?</a></li>
@@ -871,6 +872,63 @@ accurate is free space reporting.</p>
 
 
 
+<h2><a name="L_jffs2_space">Why does my UBIFS volume have significantly lower
+capacity than my equivalent JFFS2 volume?</a></h2>
+
+<p>When migrating a filesystem image from JFFS2 to UBIFS you may notice some
+or all of the following:</p>
+
+<ul>
+	<li>The size of the image file to be flashed is significantly larger
+	than before.</li>
+	<li><code>df</code> reports significantly less available free space
+	than before (while there may be <em>some</em> truth in this, please be
+	aware of the other considerations that must be applied to
+	<code>df</code> values described elsewhere in this FAQ).</li>
+	<li>When measuring the capacity of the disk by seeing how much data
+	can be written, JFFS2 is able to store significantly more data than
+	UBIFS.</li>
+</ul>
+
+<p>There are several reasons for this.</p>
+
+<p>Firstly, did you create your volumes with default arguments to
+<code>mkfs.jffs2</code> and <code>mkfs.ubifs</code>? This alone introduces
+a significant difference: <code>mkfs.jffs2</code> effectively defaults to zlib
+compression and disables lzo, but <code>mkfs.ubifs</code> defaults to LZO
+compression. zlib compresses significantly better, but is noticeably slower to
+compress/decompress at runtime. Using zlib compression with
+<code>mkfs.ubifs</code> will probably reduce the size of your NAND image file
+by 10-15%, put it on-par with an equivalent JFFS2 image, and increase the available capacity, at the price of performance.</p>
+
+<p>Secondly, did you choose a good value for <code>vol_size</code> or enable
+autoresize in your ubinize configuration? It is possible that your UBI volume
+is not utilising the full space of the available flash.</p>
+
+<p>Beyond that, it is unfortunately true that UBI/UBIFS has higher space
+overhead than its predecessors. OLPC has
+<a href="http://lists.laptop.org/pipermail/devel/2011-September/033274.html">measured</a>
+this overhead to be approximately 50mb per 1GB of storage (using JFFS2 as a
+baseline). While UBIFS cannot be made as good as JFFS2 in this respect, work
+could be undertaken to improve space efficiency for current or future
+UBI/UBIFS versions. Reasons for overhead and opportunities for improvement
+include:</p>
+
+<ul>
+	<li>For MTD controllers (such as CaFe) that do not support sub-page
+	writes, 2 KiB is taken from each eraseblock. If such controller drivers
+	were adapted (or hacked) to use software ECC for the first NAND page of
+	every eraseblock, around 8 MiB could be recovered per 1GB of
+	storage.</li>
+	<li>UBIFS on-flash data structures could be reduced in size. These
+	headers currently include many unused fields that are reserved for
+	future use.</li>
+	<li>UBIFS could be improved to reserve less space for internal needs,
+	but touching this part of the code is risky.</li>
+</ul>
+
+
+
 <h2><a name="L_comproff">How do I disable compression?</a></h2>
 
 <p>UBIFS compression may be disabled for whole file system during the image
-- 
1.7.6.4
