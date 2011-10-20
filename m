Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGvLc-0007OY-WE
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 16:20:02 +0000
Received: by wwj40 with SMTP id 40so2959018wwj.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2011 09:19:59 -0700 (PDT)
Sender: Ivan Djelic <ivantchek@gmail.com>
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: doc: add a few explanations on NAND errors and fix typos
Date: Thu, 20 Oct 2011 18:19:38 +0200
Message-Id: <863be8772d7f0a57713d1ff7d9614942c3e1f0e0.1319127029.git.ivan.djelic@parrot.com>
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Your UBI/UBIFS doc update looks fine to me, here's a patch with a few typo
fixes and some additional info.
BR,

Ivan

---
 doc/ubifs.xml |   60 +++++++++++++++++++++++++++++++++-----------------------
 1 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/doc/ubifs.xml b/doc/ubifs.xml
index 9943508..0a1de11 100644
--- a/doc/ubifs.xml
+++ b/doc/ubifs.xml
@@ -171,8 +171,8 @@ tolerant to power-cuts, and they were designed with this property in mind.</p>
 <p><b>Year 2011 note</b>: however, there is an unsolved
 <a href="../doc/ubifs.html#L_unstable_bits">unstable bits</a> issue which makes
 UBI/UBIFS fail to recover after a power cut on modern SLC and MLC flashes. This
-issues has not been observed on older SLC NANDs back at the time UBI/UBIFS has
-been developed. Note, the below text is quite old and has been written before
+issue has not been observed on older SLC NANDs back at the time UBI/UBIFS was
+being developed. Note, the below text is quite old and has been written before
 the unstable bits issue has been first discovered.</p>
 
 <p>UBIFS has internal debugging infrastructure to emulate power failures and
@@ -187,8 +187,8 @@ which performs a lot of random I/O operations and checks the integrity of the
 FS after remount. This test can also handle emulated power-cuts and check the
 FS integrity.</p>
 
-<p>Real power-cut tests have also done on OneNAND flash. We used Power
-Node devices which are controlled via serial line and may switch the power of
+<p>Real power-cut tests have also been done on OneNAND flash. We used Power
+Node devices which are controlled via serial line and can switch the power of
 the connected device on and off. UBIFS survived more than 100000 power-cuts
 while running stress tests.</p>
 
@@ -236,15 +236,20 @@ some specific aspects of MLC NAND flashes:</p>
 	<li>[<b>NEED WORK</b>] MLC flashes exhibit bit-flips as a result of
 	"program disturb" and "read disturb" errors (see
 	<a href="http://www.klabs.org/richcontent/MemoryContent/nvmt_symp/nvmts_2002/docs/12/12_dan_p.pdf">here</a>).
+	These errors are sometimes referred to as "reversible" errors in NAND
+	datasheets, meaning that they disappear once the block in which they
+	are located is erased; as opposed to "irreversible" errors which are
+	due to cell wear and cause permanent bit failures.
 	Note that SLC flashes have these same errors, but they are much more
 	common on MLC:
 	<ul>
 		<li>NAND flashes have a so called "read-disturb" property, which
-		means that a NAND page read operation may introduce a permanent
-		bit change; the ECC code would fix it, but more read operations
-		may introduce more bit changes and soft ECC errors may turn
-		into hard ECC errors; however, when these errors occur on the
-		same page that is being read, this should not be a problem
+		means that a NAND page read operation may introduce a persistent
+		bit change, not necessarily located in the page being read;
+		the ECC code would fix it, but more read operations
+		may introduce more bit changes and correctable ECC errors may turn
+		into uncorrectable ECC errors; however, when these errors occur
+		on the same page that is being read, this should not be a problem
 		because UBI is doing scrubbing; in other words, once UBI notices
 		that there is a correctable bit-flip in an eraseblock, it moves
 		the contents of this physical eraseblock to a different physical
@@ -254,13 +259,13 @@ some specific aspects of MLC NAND flashes:</p>
 
 		<li>"Read-disturb" errors can also occur on a page <i>other</i>
 		that the one being read, but which is within the same
-		eraseblock. This is not a problem if the read operations are
+		eraseblock. This is not a problem if page read operations are
 		spread around somewhat evenly within the eraseblock, since the
 		bit-flip will soon be detected and corrected through the
-		"scrubbing" process described above.  However if a particular
+		"scrubbing" process described above.  However, if a particular
 		page within a block is rarely read, scrubbing will not have a
 		chance to fix errors, and they may accumulate over time until
-		they are unfixable. This is very similar the next problem.</li>
+		they become unfixable. This is very similar the next problem.</li>
 
 		<li>NAND flashes also have a "program-disturb" property,
 		which means that if you program a NAND page, you may introduce
@@ -304,7 +309,7 @@ some specific aspects of MLC NAND flashes:</p>
 	so this should probably be optional. The way to attack this issue is to
 	improve UBIFS power cut emulation and implement "paired-pages"
 	emulation, then use the <code>integck</code> test for testing. After
-	all the issues are fixed, a real power-cut tests could be carried
+	all the issues are fixed, real power-cut tests could be carried
 	out.</p></li>
 
 	<li>[<b>NEED WORK</b>] The "unstable bits issue", which is not
@@ -317,7 +322,7 @@ some specific aspects of MLC NAND flashes:</p>
 <h2><a name="L_unstable_bits">The unstable bits issue</a></h2>
 
 <p>In the MTD community the "unstable bits" term is used to describe data
-instabilities caused by power cuts while writing ore erasing. The unstable bits
+instabilities caused by power cuts while writing or erasing. The unstable bits
 issue is still not resolved in UBI and UBIFS, and it was reported several times
 in the MTD mailing list. In theory, this issue should be visible in any flash,
 but for some reason back at the times when we developed UBI/UBIFS and
@@ -325,34 +330,39 @@ extensively tested them on a robust SLC NAND, we did not observe it. No one
 reported about this issue for NOR flash yet. However, on modern SLC and MLC
 flashes this problem is reproducible.</p>
 
-<p>The unstable bits are the result of a power cut during the program or erase
+<p>The unstable bits are the result of a power cut during a program or erase
 operation. Depending on when the power cut has happened, they can corrupt the
 data or the free space. Consider the following 4 situations:</p>
 
 <ol>
 	<li>The power cut happens just before the NAND page program operation
-	finishes. After the reboot the page may be read correctly and without
+	finishes. After reboot the page may be read correctly and without
 	a single bit-flip say, 2 times, and the 3rd time you may get an ECC
-	error. This happens because the page contain a number of unstable bits
+	error. This happens because the page contains a number of unstable bits
 	which are sometimes read correctly and sometimes not.</li>
 
 	<li>The power cut happens just after the NAND page program operation
-	starts. After the reboot the page may be read correctly (return all
+	starts. After reboot, the page may be read correctly (return all
 	0xFFs) most of the time, but sometimes you may get some bits set to
 	zero. Moreover, if you then program this page, it also may be sometimes
-	read correctly, but sometimes return ECC error. The reason is again the
-	unstable bits in the NAND page.</li>
+	read correctly, but sometimes return an ECC error. The reason is again
+	the unstable bits in the NAND page.</li>
 
 	<li>The power cut happens just before the eraseblock erase operation
-	finishes. After the reboot the eraseblock may contain unstable bits and
-	the data in this eraseblock may suddenly become corrupted.</li>
+	finishes. After reboot, the eraseblock may contain unstable bits and
+	data in this eraseblock may suddenly become corrupted.</li>
 
 	<li>The power cut happens just after the eraseblock erase operation
-	starts. After the reboot the eraseblock may contain unstable bits and
+	starts. After reboot, the eraseblock may contain unstable bits and
 	sometimes return zero bits on read, or corrupted data if you program
 	it.</li>
 </ol>
 
+<p>The number of unstable bits resulting from a power-cut may be greater than
+what the ECC algorithm is able to correct. This is why a previously readable
+page may suddenly become unreadable, or conversely a previously unreadable page
+may suddenly become readable.</p>
+
 <p>Here is an example scenario how UBIFS may fail. UBIFS writes data node A to
 the journal LEB, and a power cut of type 1 happens. After the reboot, UBIFS
 recovery code reads that LEB, no bit-flips are reported by MTD, all the CRCs
@@ -372,7 +382,7 @@ journal LEBs, but also LPT, log, master and orphan LEBs. This means that the
 valid data from this LEB has to be read (and only once!) and then it should be
 written back to this LEB using the
 <a href="../doc/ubi.html#L_lebchange">atomic LEB change</a> UBI operation.
-This has to be done even if the LEB look all-right - no corruptions, all 0xFFs
+This has to be done even if the LEB looks all-right - no corruptions, all 0xFFs
 at the end.</p>
 
 <p>Similarly, UBI has to erase-cycle every eraseblock which could potentially be
@@ -384,7 +394,7 @@ example. The delayed recovery happens when after a power cut the file-system is
 mounted R/O, in which case UBIFS must not write anything to the flash, and the
 real recovery is delayed until the FS is re-mounted R/W. Currently UBIFS just
 scans the journal during mounting R/O, drops (or "remembers") corrupted nodes,
-and "does not let" users to read them. But there is no guarantee that UBIFS
+and "does not let" users read them. But there is no guarantee that UBIFS
 spots all the corrupted nodes during the first scanning, so users may get
 <code>EIO</code> while reading data from the R/O-mounted FS.</p>
 
-- 
1.7.5.1
