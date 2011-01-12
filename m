Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PcwUD-0000Mu-AA
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2011 08:55:22 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBIFS FAQ: fix grammar, style, spelling
Date: Wed, 12 Jan 2011 00:53:08 -0800
Message-ID: <1294822388-28396-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
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
 doc/ubifs.xml |   70 ++++++++++++++++++++++++++++----------------------------
 1 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/doc/ubifs.xml b/doc/ubifs.xml
index 1e0e199..4886ddf 100644
--- a/doc/ubifs.xml
+++ b/doc/ubifs.xml
@@ -397,27 +397,27 @@ following is a list of useful hints and advices.</p>
 <ul>
 	<li>If you want to switch into synchronous mode, use the
 	<code>-o sync</code> option when mounting UBIFS; however, the file
-	system performance will drop - be careful; Also remember that UBIFS
+	system performance will drop - be careful. Also remember that UBIFS
 	mounted in synchronous mode provides less guarantees than JFFS2 - refer
 	<a href="ubi.html#L_sync_semantics">this</a> section for details.</li>
 
 	<li>Always keep in mind the above statement from the manual pages and
 	run <code>fsync()</code> for all important files you change; of
 	course, there is no need to synchronize "throw-away" temporary files;
-	Just think how important is the file data and decide; and do not
+	Just think how important the file data is and decide; do not
 	use <code>fsync()</code> unnecessarily, because this will hit the
-	performance;</li>
+	performance.</li>
 
 	<li>If you want to be more accurate, you may use
 	<code>fdatasync()</code>, in which cases only data changes will be
 	flushed, but not inode meta-data changes (e.g., "<i>mtime</i>"
 	or permissions); this might be more optimal than using
 	<code>fsync()</code> if the synchronization is done often, e.g., in
-	a loop; otherwise just stick with <code>fsync()</code>;</li>
+	a loop; otherwise just stick with <code>fsync()</code>.</li>
 
 	<li>In shell, the <code>sync</code> command may be used, but it
-	synchronizes whole file system which might be not very optimal; and
-	there is a similar <i>libc</i> <code>sync()</code> function;</li>
+	synchronizes the whole file system which might not be optimal; and
+	there is a similar <i>libc</i> <code>sync()</code> function.</li>
 
 	<li>You may use the <code>O_SYNC</code> flag of the
 	<code>open()</code> call; this will make sure all the data (but not
@@ -425,7 +425,7 @@ following is a list of useful hints and advices.</p>
 	operation returns; but in general, it is better to use
 	<code>fsync()</code>, because <code>O_SYNC</code> makes each
 	write to be synchronous, while <code>fsync()</code> allows to
-	accumulate many writes and synchronize them at once;</li>
+	accumulate many writes and synchronize them at once.</li>
 
 	<li>It is possible to make certain inodes to be synchronous by
 	default by setting the "<i>sync</i>" inode flag; in a shell, the
@@ -1324,8 +1324,8 @@ which have bare flashes and do not use FTL. Those are mostly various handheld
 devices and embedded systems. Raw flash devices are very different to block
 devices. They have different work model, they have tighter constraints and more
 issues than block devices. In case of FTL devices these constraints and issues
-are hidden, but in case of raw flash the software has to deal with them. Please,
-refer <a href="../faq/general.html#L_mtd_vs_hdd">this</a> table for the some
+are hidden, but in case of raw flash the software has to deal with them. Please
+refer to <a href="../faq/general.html#L_mtd_vs_hdd">this</a> table for some
 more details about the difference between block devices and raw flashes.</p>
 
 <p>UBIFS file system has been designed for raw flash. It doesn't work with block
@@ -1351,12 +1351,12 @@ requirements.</p>
 	<li>Bare NAND chips are cheaper and simpler, which is very important
 	for small system. However, it seems like the industry pushes FTL
 	devices forward and the situation is not that simple and obvious
-	anymore. Indeed, an FTL devise is more complex than a raw NAND of
-	similar size, because FTL device has additional controller inside,
+	anymore. Indeed, an FTL device is more complex than a raw NAND of
+	similar size, because an FTL device has an additional controller inside,
 	and so on. But since the industry tends to produce a lot of FTL devices,
 	and actually sell a lot of them, the price is going down.</li>
 
-	<li>If you need an flash storage where you are going to use FAT file
+	<li>If you need a flash storage where you are going to use FAT file
 	system, then in most cases you should stick with an FTL device (eMMC,
 	MMC, SD or whatever). Just make sure the FTL device is doing proper
 	wear-leveling.</li>
@@ -1391,7 +1391,7 @@ requirements.</p>
 	<li>We have heard reports that some USB flash drives wear out very
 	quickly, i.e., they start reporting I/O errors after few weeks of
 	intensive use. This means that FTL does not do proper wear-leveling.
-	But this does not mean that all USB flash drives are bad, but you just
+	This does not mean that all USB flash drives are bad - just that you
 	should be careful.</li>
 
 	<li>We have heard reports that MMC, eMMC, and SD cards corrupt and lose
@@ -1409,54 +1409,54 @@ requirements.</p>
 	to lose a couple of photos. However, it is crucial to make sure that
 	system libraries do not corrupt because of power-cuts.</li>
 
-	<li>Good FTL, especially if it deals with MLC NAND (which is used in
-	modern mass storage devices) must be a rather complex piece of
-	software. Implementing it in firmware might be a difficult task.
-	And running it might require a powerful controller. Obviously, we may
-	suspect that vendors go for various kind of tricks or compromises to
+	<li>Good FTL must be a rather complex piece of software, especially if
+	it deals with MLC NAND (which is used in most modern mass storage
+	devices). Implementing it in firmware might be a difficult task,
+	and running it might require a powerful controller. Instead, we
+	suspect that vendors may user various tricks or compromises to
 	keep their devices "good enough" and cheap. For example, it is known
 	that some vendors optimize their FTL devices for FAT, and if you start
-	using ext3 on top of it, you might face some unexpected problems or the
-	device may become not as good as you would imagine. And with closed
-	FTL it is often difficult to verify this.</li>
+	using ext3 on top of one, you might face some unexpected problems or the
+	device may become worse than you would imagine. Of course, it is often
+	difficult to verify this with closed FTL.</li>
 
 	<li>SSD drives are probably very different to eMMC, MMC/SD etc. We have
-	not worked with SSD drives. They are expensive and they probably have
-	powerful CPUs inside, which run complex	firmware which is probably
-	getting things righ.</li>
+	not worked with SSD drives. They are expensive and probably have
+	powerful CPUs that run complex firmware which probably gets things
+	right.</li>
 
 	<li>FTL devices are becoming more popular and better, although it is
 	not easy to distinguish between good and bad FTL devices (of course
 	vendors would assure you their device is perfect). Generally, there
-	is nothing wrong in using an FTL device as long as you trust it, or
-	have tested it, or it simply fit your system requirements.</li>
+	is nothing wrong in using an FTL device as long as you trust it, you
+	have tested it, or it simply fits your system requirements.</li>
 
 	<li>In case of raw flash we know exactly what we are doing. UBI/UBIFS
 	handles	all aspects of NAND flash like bad erase-blocks and
 	wear-leveling. It guarantees power-cut tolerance. It is open and
-	available, so you may always validate, test, and fix it. There is not
-	lie about what it can and what it cannot. In opposite, with FTL devices
+	available, so you may always validate, test, and fix it. There is no
+	lie about what it can and cannot do. On the other hand, with FTL devices
 	you do not have much visibility to what is going on inside, vendors
 	may lie about how good their FTL device is. If you find a bug in the
 	firmware, vendors do not usually provide you a fast and easy way to
 	update it, and so on.</li>
 
-	<li>Theoretically, UBIFS may do better job, because it knows much more
+	<li>Theoretically, UBIFS may do a better job because it knows much more
 	information about the files than FTL. For example, UBIFS knows about
 	deleted files, while FTL does not, so FTL may do unneeded work trying
 	to preserve the sectors belonging to deleted files. However, some FTL
 	devices support "discard" requests and may benefit from the file system
-	hints about unused sectors. Nevertheless, in general, UBIFS should do
-	better job on a bare NAND, than a traditional FS on an FTL device with
+	hints about unused sectors. Nevertheless, in general, UBIFS should do a
+	better job on a bare NAND than a traditional FS on an FTL device with
 	a similar NAND chip. On the other hand, FTL devices may	include
 	multiple NAND chips, highly parallelize things and provide fast I/O.
-	Probably SSD is a good example.</li>
+	SSDs are probably good examples.</li>
 
 	<li>Obviously, the advantage of FTL devices is that you use old and
-	trusted software on top of them. But be careful, sometimes this may
-	be not 100% true. UBIFS authors once tested a good brand eMMC with
+	trusted software on top of them. Be careful, though, as sometimes this
+	may not be 100% true. UBIFS authors once tested a good brand eMMC with
 	respect to the power cut tolerance. Some severe problems were found.
-	But also, it was found that ext3 was not really usable with that
+	Also, it was found that ext3 was not really usable with that
 	eMMC either. What happened was that power cuts sometimes left some
 	eMMC sectors not readable - the read operation returned ECC errors.
 	But for ext3 read errors are fatal - it is not designed to handle
-- 
1.7.0.4
