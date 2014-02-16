Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WF7xE-0007Fm-JS
 for linux-mtd@lists.infradead.org; Sun, 16 Feb 2014 20:04:46 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v6 3/3] UBI: Add block interface documentation
Date: Sun, 16 Feb 2014 17:04:01 -0300
Message-Id: <1392581041-8099-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
Applies on top of mtd-www git repo.

 doc/general.xml |  4 ++++
 doc/ubi.xml     | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 faq/ubi.xml     | 16 +++++++-------
 3 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/doc/general.xml b/doc/general.xml
index 31ea243..d5af815 100644
--- a/doc/general.xml
+++ b/doc/general.xml
@@ -182,6 +182,10 @@ use block-based file systems on top of bare flashes using
 In other words, please, <b>do not use</b> <code>mtdblock</code> unless you
 know exactly what you are doing.</p>
 
+<p>Instead, you may find the block interface provided by <code>UBI</code>
+useful. Please refer to the <a href="ubi.html#L_block">UBI section</a> for more
+details.</p>
+
 <p>There is also a read-only version of this driver which doesn't have the
 capacity to do the caching and erase/writeback, mainly for use with uCLinux
 where the extra RAM requirement was considered too large.</p>
diff --git a/doc/ubi.xml b/doc/ubi.xml
index f55c04a..dd06927 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -47,6 +47,7 @@
 		</ol>
 	</li>
 	<li><a href="ubi.html#L_fastmap">Fastmap</a></li>
+	<li><a href="ubi.html#L_block">Block interface</a></li>
 	<li><a href="ubi.html#L_ubidoc">More documentation</a></li>
 </ol>
 
@@ -173,6 +174,11 @@ because:</p>
 	mechanisms).</li>
 </ul>
 
+<p>UBI also provides a block interface that allows regular, block-oriented
+filesystems to be mounted on top of an UBI volume. This is possible because UBI
+handles bad-blocks transparently. This block interface does not peform any
+wear-leveling, and therefore write support hasn't been implemented.</p>
+
 <p>There is an additional driver called <code>gluebi</code> which emulates MTD
 devices on top of UBI volumes. This looks a little strange, because UBI works
 on top of an MTD device, then <code>gluebi</code> emulates other MTD devices
@@ -236,6 +242,8 @@ sub-directory.</p>
 	devices (the opposite to what <code>ubiattach</code> does);</li>
 	<li><code>ubimkvol</code> - creates UBI volumes on UBI devices;</li>
 	<li><code>ubirmvol</code> - removes UBI volumes from UBI devices;</li>
+	<li><code>ubiblkvol</code> - manages block interfaces for UBI volumes.
+	See <a href="ubi.html#L_block">here</a> for more information;</li>
 	<li><code>ubiupdatevol</code> - updates UBI volumes; this tool uses the
 	<a href="ubi.html#L_volupdate">UBI volume update feature</a> which
 	leaves the volume in "corrupted" state if the update was interrupted;
@@ -1261,6 +1269,65 @@ second. Therefore, fastmap makes only sense on fast and large flash devices
 where a full scan takes too long. E.g. On 4GiB NAND chips a full scan takes
 several seconds whereas a fast attach needs less than one second.</p>
 
+<h2><a name="L_block">Block interface</a></h2>
+
+<p>UBI allows to create a block device on top of each UBI volume. The block
+interface implementation currently has the following limitations:
+
+<ul>
+	<li>Read-only operation.</li>
+	<li>1-to-1 mapping between block sectors and logical eraseblocks.
+	In other words, no wear-leveling is provided.</li>
+	<li>Serialized and uncached operation.</li>
+</ul></p>
+
+<p>Write-support is still under discussion and might be implemented in a
+near future.</p>
+
+<p>Regarding the serialized, uncached operation, keep in mind the NAND driver core
+already serializes all I/O anyway. In addition, filesystems usually provides
+a much better caching. For these reasons, it's expected that these limitations
+won't impact performance heavily.</p>
+
+<p>Despite these limitations, a block interface is still very useful to mount
+read-only, regular filesystems on top of UBI volumes. This is the case
+of squashfs, which can be used as a lightweigth read-only rootfs on a NAND
+device.</p>
+
+<h4><a name="L_block_usage">Usage</a></h4>
+<p>Attaching and detaching a block interface on a UBI volume is fairly easy.
+You can do this either by using the <code>block</code> UBI module parameter
+or with the <code>ubiblkvol</code> user-space tool.</p>
+
+<p>In order to attach a block device on bootup time (e.g. to mount the rootfs
+on such a block device) you can specify the <code>block</code> parameter as
+a kernel boot arguments:</p>
+
+<p><code>ubi.mtd=5 ubi.block=0,0 root=/dev/ubiblock0_0</code></p>
+
+<p>There are several ways if specifying a volume:</p>
+<ul>
+	<li><p>Using the UBI volume path:</p>
+	<code>ubi.block=/dev/ubi0_0</code></li>
+
+	<li><p>Using the UBI device, and the volume name:</p>
+	<code>ubi.block=0,rootfs</code></li>
+
+	<li><p>Using both UBI device number and UBI volume number:</p>
+	<code>ubi.block=0,0</code></li>
+</ul>
+
+<p>If you've built UBI as a module you can use this parameter at module insertion
+time:</p>
+
+<code>$ modprobe ubi mtd=/dev/mtd5 block=/dev/ubi0_0</code>
+
+<p>A block interface can also be attached/detached dynamically at runtime, using
+the <code>ubiblkvol</code> user-space tool:</p>
+
+<p><code>$ ubiblkvol --attach /dev/ubi0_0</code></p>
+<p><code>$ ubiblkvol --detach /dev/ubi0_0</code></p>
+
 <h2><a name="L_ubidoc">More documentation</a></h2>
 
 <p>Unfortunately, there are no thorough and strict UBI documents. But there is
diff --git a/faq/ubi.xml b/faq/ubi.xml
index 2832928..69f5495 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -18,6 +18,7 @@
 	<li><a href="ubi.html#L_mkvol">How do I create/delete UBI volumes?</a></li>
 	<li><a href="ubi.html#L_run_jffs2">How do I run JFFS2 on top of an UBI volume?</a></li>
 	<li><a href="ubi.html#L_ext2_over_ubi">Can I run ext2 on top of UBI?</a></li>
+	<li><a href="ubi.html#L_squashfs_over_ubi">Can I run squashfs on top of UBI?</a></li>
 	<li><a href="ubi.html#L_format_mtd">Do I have to format my empty flash before running UBI on top of it?</a></li>
 	<li><a href="ubi.html#L_ubierase">How do I erase flash and preserve erase counters?</a></li>
 	<li><a href="ubi.html#L_ubi_mkimg">How do I create UBI images?</a></li>
@@ -159,16 +160,15 @@ Please, read the <a href="../doc/ubi.html#L_rednote">big red note</a>
 and <a href="../doc/ubi.html#L_overview">overview</a> documentation sections to
 realize why.</p>
 
-<p>But it is much easier to implement FTL on top of UBI than on top of MTD,
-because UBI takes care about many flash complexities and makes it
-possible to concentrate on on upper-level issues rather then solving flash
-media problems like wear-leveling, bit-flips, bad eraseblocks, etc.</p>
-
-<p><a
-href="http://lists.infradead.org/pipermail/linux-mtd/2008-January/020381.html">
-This</a> e-mail describes an idea of a simple FTL layer on top of UBI.</p>
+<p>However, given UBI takes care of many flash complexities, it provides a
+bad-block-free block interface on top of UBI volumes. This feature is useful to
+mount read-only filesystems.</p>
 
+<h2><a name="L_squashfs_over_ubi">Can I run squashfs on top of UBI?</a></h2>
 
+<p>Yes. UBI allows to create a read-only block interface on top of a UBI volume
+which is suitable for read-only block-oriented filesystems, such as squashfs.
+See the <a href="..doc/ubi.html#L_block">UBI block interface</a> section for more details.</p>
 
 <h2><a name="L_format_mtd">
 	Do I have to format my empty flash before running UBI on top of it?
-- 
1.8.1.5
