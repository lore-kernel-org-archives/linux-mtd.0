Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7JkR-0003Rl-DE
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 12:25:57 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH mtd-www] Remove references to the "unstable bits" issue
Date: Tue,  2 Oct 2018 14:25:23 +0200
Message-Id: <20181002122523.12422-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In 2011, several sections about an issue with SLC and MLC NAND flashes of
that time were added. The problem was referred to as "unstable bits" issue
throughout the documentation and the FAQ.

As of writing, the issue could not be reproduced with modern NADN flashes
for several years and the section on the web site actually caused some
confusion, with some users of MTD/UBI/UBIFS attributing actual bugs to the
unstable bits issue instead of reporting on the mailing list.

To avoid future confusion, this patch removes the section about the issue
and all references to it.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 doc/ubifs.xml | 141 --------------------------------------------------
 faq/ubi.xml   |  12 -----
 2 files changed, 153 deletions(-)

diff --git a/doc/ubifs.xml b/doc/ubifs.xml
index c1f54b5..6520d79 100644
--- a/doc/ubifs.xml
+++ b/doc/ubifs.xml
@@ -16,7 +16,6 @@
 	<li><a href="ubifs.html#L_overview">Overview</a></li>
 	<li><a href="ubifs.html#L_powercut">Power-cuts tolerance</a></li>
 	<li><a href="ubifs.html#L_ubifs_mlc">UBIFS and MLC NAND flash</a></li>
-	<li><a href="ubifs.html#L_unstable_bits">The unstable bits issue</a></li>
 	<li><a href="ubifs.html#L_source">Source code</a></li>
 	<li><a href="ubifs.html#L_ml">Mailing list</a></li>
 	<li><a href="ubifs.html#L_usptools">User-space tools</a></li>
@@ -168,13 +167,6 @@ subsystems involved:</p>
 <p>Both UBI (see <a href="../faq/ubi.html#L_crash_safe">here</a>) and UBIFS are
 tolerant to power-cuts, and they were designed with this property in mind.</p>
 
-<p><b>Year 2011 note</b>: however, there is an unsolved
-<a href="../doc/ubifs.html#L_unstable_bits">unstable bits</a> issue which makes
-UBI/UBIFS fail to recover after a power cut on modern SLC and MLC flashes. This
-issue has not been observed on older SLC NANDs back at the time UBI/UBIFS was
-being developed. Note, the below text is quite old and has been written before
-the unstable bits issue has been first discovered.</p>
-
 <p>UBIFS has internal debugging infrastructure to emulate power failures and
 the authors used it for extensive testing. It was tested for long time with
 power-fail emulation. The advantage of the emulation is that it emulates power
@@ -311,141 +303,8 @@ some specific aspects of MLC NAND flashes:</p>
 	emulation, then use the <code>integck</code> test for testing. After
 	all the issues are fixed, real power-cut tests could be carried
 	out.</p></li>
-
-	<li>[<b>NEED WORK</b>] The "unstable bits issue", which is not
-	MLC-specific, described
-	<a href="ubifs.html#L_unstable_bits">here</a>.</li>
 </ul>
 
-
-
-<h2><a name="L_unstable_bits">The unstable bits issue</a></h2>
-
-<p>In the MTD community the "unstable bits" term is used to describe data
-instabilities caused by power cuts while writing or erasing. The unstable bits
-issue is still not resolved in UBI and UBIFS, and it was reported several times
-in the MTD mailing list. In theory, this issue should be visible in any flash,
-but for some reason back at the times when we developed UBI/UBIFS and
-extensively tested them on a robust SLC NAND, we did not observe it. No one
-reported about this issue for NOR flash yet. However, on modern SLC and MLC
-flashes this problem is reproducible.</p>
-
-<p>The unstable bits are the result of a power cut during a program or erase
-operation. Depending on when the power cut has happened, they can corrupt the
-data or the free space. Consider the following 4 situations:</p>
-
-<ol>
-	<li>The power cut happens just before the NAND page program operation
-	finishes. After reboot the page may be read correctly and without
-	a single bit-flip say, 2 times, and the 3rd time you may get an ECC
-	error. This happens because the page contains a number of unstable bits
-	which are sometimes read correctly and sometimes not.</li>
-
-	<li>The power cut happens just after the NAND page program operation
-	starts. After reboot, the page may be read correctly (return all
-	0xFFs) most of the time, but sometimes you may get some bits set to
-	zero. Moreover, if you then program this page, it also may be sometimes
-	read correctly, but sometimes return an ECC error. The reason is again
-	the unstable bits in the NAND page.</li>
-
-	<li>The power cut happens just before the eraseblock erase operation
-	finishes. After reboot, the eraseblock may contain unstable bits and
-	data in this eraseblock may suddenly become corrupted.</li>
-
-	<li>The power cut happens just after the eraseblock erase operation
-	starts. After reboot, the eraseblock may contain unstable bits and
-	sometimes return zero bits on read, or corrupted data if you program
-	it.</li>
-</ol>
-
-<p>The number of unstable bits resulting from a power-cut may be greater than
-what the ECC algorithm is able to correct. This is why a previously readable
-page may suddenly become unreadable, or conversely a previously unreadable page
-may suddenly become readable.</p>
-
-<p>Here is an example scenario how UBIFS may fail. UBIFS writes data node A to
-the journal LEB, and a power cut of type 1 happens. After the reboot, UBIFS
-recovery code reads that LEB, no bit-flips are reported by MTD, all the CRCs
-match, everything looks fine. UBIFS just assume that this LEB is all-right and
-the free space at the end of this LEB can be used for writing more data. UBIFS
-performs the commit operations, writes more user data, and everything works
-fine until the user reads node A by reading the corresponding file: an ECC
-error happens and the user gets the <code>EIO</code> error.</p>
-
-<p>The <code>EIO</code> may be what the user gets instead of his/her data also
-if a type 2 power cut happens, and UBIFS re-uses the corrupted free space for
-writing new nodes, and then these nodes are read.</p>
-
-<p>The solution is to teach UBIFS to erase-cycle any LEB which could potentially
-be written to when the power cut happened. This is not only about the
-journal LEBs, but also LPT, log, master and orphan LEBs. This means that the
-valid data from this LEB has to be read (and only once!) and then it should be
-written back to this LEB using the
-<a href="../doc/ubi.html#L_lebchange">atomic LEB change</a> UBI operation.
-This has to be done even if the LEB looks all-right - no corruptions, all 0xFFs
-at the end.</p>
-
-<p>Similarly, UBI has to erase-cycle every eraseblock which could potentially be
-erased when the power cut happened.</p>
-
-<p>The other requirement is that during the recovery UBI/UBIFS should read data
-from the media only once. This is easy to demonstrate on the delayed recovery
-example. The delayed recovery happens when after a power cut the file-system is
-mounted R/O, in which case UBIFS must not write anything to the flash, and the
-real recovery is delayed until the FS is re-mounted R/W. Currently UBIFS just
-scans the journal during mounting R/O, drops (or "remembers") corrupted nodes,
-and "does not let" users read them. But there is no guarantee that UBIFS
-spots all the corrupted nodes during the first scanning, so users may get
-<code>EIO</code> while reading data from the R/O-mounted FS.</p>
-
-<p>When UBIFS is then remounted R/W, it actually drops the corrupted nodes from
-the flash media by erase-cycling the corresponding LEBs. And UBIFS re-reads
-all the LEB data again. And there is no guarantee that UBIFS will get the same
-corruptions again.</p>
-
-<p>So it is important to make sure that the corrupted LEBs are read only once.
-E.g., we can cache the results of the first scanning, and then use that data
-when running the delayed recovery, instead of re-reading the data. Probably we
-may remember only the last NAND page containing valid nodes, not whole LEB,
-since for the journal only unstable bits of type 1 and 2 are relevant.</p>
-
-<p>There are similar double-read issues in UBI scanning - when it finds 2 PEBs
-belonging to the same LEB and it has to find out which one is newer. The volume
-table has to be erase-cycled as well in UBI.</p>
-
-<p>There are more issues related to unstable bits of type 2 and 3 in UBI, I
-think. This all needs a very careful look, and this is not trivial to fix
-because of the complexity: UBIFS as any file-system has many interfaces and a
-lot of states. The best strategy to attack this problem would be:</p>
-
-<ol>
-	<li>Improve the existing power cut emulation infrastructure in UBIFS
-	and start emulating unstable bits. Start with emulating only one type
-	of unstable bits, e.g., type 1.</li>
-
-	<li>Use the <code>integck</code> test to stress the file-system with
-	power cut emulation enabled - the test can re-start when an emulated
-	power cut happens. This will allow you to very quickly emulate hundreds
-	of power cuts in interesting places. Fix all the bugs. Make sure it is
-	rock solid. Of course, if you have various independent issues, you may
-	temporary hack the power cut emulation code to emulate unstable bits
-	only at certain places, to temporarily limit the amount of problems you
-	have to simultaneously deal with.</li>
-
-	<li>Start emulating other types of unstable bits, and fix all the
-	issues one-by-one.</li>
-
-	<li>Go down to UBI and add a similar power cut emulation
-	infrastructure. But emulate unstable bits only in UBI-specific on-flash
-	data structures - the EC/VID headers and the volume table. Improve the
-	<code>integck</code> test to support that infrastructure and fix all the
-	issues.</li>
-
-	<li>Run real power cut tests on real hardware.</li>
-</ol>
-
-
-
 <h2><a name="L_source">Source code</a></h2>
 
 <p>The UBIFS git tree is</p>
diff --git a/faq/ubi.xml b/faq/ubi.xml
index fdd7abb..f9a76b3 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -449,12 +449,6 @@ probably do this.</p>
 <p>Yes, UBI is designed to be tolerant of power failures and unclean
 reboots.</p>
 
-<p><b>Year 2011 note</b>: however, there is an unsolved
-<a href="../doc/ubifs.html#L_unstable_bits">unstable bits</a> issue which may make
-UBI fail to recover after a power cut on modern SLC and MLC flashes. This has
-never been reported yet for UBI, but has been reported for UBIFS and we believe
-must be an issue for UBI as well.</p>
-
 
 
 <h2><a name="L_bad_blocks_exceeded">What happens when the PEBs reserved for bad block handling run out?</a></h2>
@@ -480,12 +474,6 @@ life-cycle (about 1000-10000, unlike 100000-1000000 for SLC NAND and NOR
 flashes), the threshold has to be set to a lower value (e.g., 256). This may be
 done via the Linux kernel configuration menu.</p>
 
-<p><b>Year 2011 note</b>: however, there is an unsolved
-<a href="../doc/ubifs.html#L_unstable_bits">unstable bits</a> issue which may make
-UBI fail to recover after a power cut on modern SLC and MLC flashes. This has
-never been reported yet for UBI, but has been reported for UBIFS and we believe
-must be an issue for UBI as well.</p>
-
 <p>Note, unlike UBI, JFFS2 uses random wear-leveling algorithm, which is in
 fact not completely random, because JFFS2 makes it more probable to
 garbage collect eraseblocks with more dirty data. This means that JFFS2 is not
-- 
2.17.1
