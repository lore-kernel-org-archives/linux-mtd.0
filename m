Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qlvnu-00078O-Pe
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2011 04:33:08 +0000
Received: by vws8 with SMTP id 8so1012478vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2011 21:33:04 -0700 (PDT)
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] UBIFS FAQ: clarify NAND "disturb" errors
Date: Wed, 27 Jul 2011 00:32:56 -0400
Message-Id: <1311741176-8850-3-git-send-email-mlcreech@gmail.com>
In-Reply-To: <1311741176-8850-1-git-send-email-mlcreech@gmail.com>
References: <1311741176-8850-1-git-send-email-mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 faq/ubifs.xml |   78 ++++++++++++++++++++++++++++++++++++--------------------
 1 files changed, 50 insertions(+), 28 deletions(-)

diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index 3348da4..bd91733 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -67,8 +67,10 @@ some specific aspects of MLC NAND flashes:</p>
 
 <ul>
 	<li>MLC NAND flashes are more "faulty" than SLC, so they use stronger
-	ECC codes which occupy whole OOB area; this is not a problem
-	for UBI/UBIFS, because neither UBIFS nor UBI use OOB area;</li>
+	ECC codes; these ECC codes often occupy whole OOB area (as do the
+	ECC codes on some newer SLC flashes, which are more error-prone than
+	previous generations of flash); this is not a problem for UBI/UBIFS,
+	because neither UBIFS nor UBI use OOB area;</li>
 
 	<li>when the data are written to an eraseblock, they have to be written
 	sequentially, from the beginning of the eraseblock to the end of it;
@@ -80,22 +82,54 @@ some specific aspects of MLC NAND flashes:</p>
 	uses deterministic wear-leveling algorithm
 	(see <a href="ubi.html#L_mlc">this</a> section);</li>
 
-	<li>MLC flashes have so called "read-disturb" property, which means
-	that NAND page read operation may introduce a permanent bit change; the
-	ECC code would fix it, but more read operations may introduce more bit
-	changes and soft ECC errors may turn into hard ECC errors; well, even
-	SLC NAND flashes have this property, but the probability of bit changes
-	is much lower in SLC NAND; however, this should not be a problem
-	because UBI is doing scrubbing; in other words, once UBI notices that
-	there is a correctable bit-flip in an eraseblock, it moves the contents
-	of this physical eraseblock to a different physical eraseblocks, and
-	re-maps corresponding logical eraseblocks to the new physical
-	eraseblock; so UBI refreshes the data and gets rid of bit-flips, thus
-	improving data integrity.</li>
+	<li>MLC flashes exhibit bit flips as a result of "program disturb" and
+	"read disturb" errors (see
+	<a href="http://www.klabs.org/richcontent/MemoryContent/nvmt_symp/nvmts_2002/docs/12/12_dan_p.pdf">here</a>).
+	Note that SLC flashes have these same errors, but they are much more
+	common on MLC:
+	<ul>
+		<li>NAND flashes have a so called "read-disturb" property, which
+		means that a NAND page read operation may introduce a permanent
+		bit change; the ECC code would fix it, but more read operations
+		may introduce more bit changes and soft ECC errors may turn
+		into hard ECC errors; however, when these errors occur on the
+		same page that is being read, this should not be a problem
+		because UBI is doing scrubbing; in other words, once UBI notices
+		that there is a correctable bit-flip in an eraseblock, it moves
+		the contents of this physical eraseblock to a different physical
+		eraseblock, and re-maps the corresponding logical eraseblock to
+		the new physical eraseblock; so UBI refreshes the data and gets
+		rid of bit-flips, thus improving data integrity.</li>
+
+		<li>"Read-disturb" errors can also occur on a page <i>other</i>
+		that the one being read, but which is within the same
+		eraseblock. This is not a problem if the read operations are
+		spread around somewhat evenly within the eraseblock, since the
+		bit-flip will soon be detected and corrected through the
+		"scrubbing" process described above.  However if a particular
+		page within a block is rarely read, scrubbing will not have a
+		chance to fix errors, and they may accumulate over time until
+		they are unfixable. This is very similar the next problem:</li>
+
+		<li>NAND flashes also have a "program-disturb" property,
+		which means that if you program a NAND page, you may introduce
+		a bit-flip in a different NAND page.  The bit change can be
+		fixed by ECC, but with time the changes may accumulate
+		and become unfixable.  Current UBI bit-flip handling only
+		partially helps here, because it is passive, which means that
+		UBI notices bit-flips only when performing users' read requests.
+		So if you never read the NAND page which accumulates bit-flips,
+		UBI will never notice this. One solution to these problems is
+		to implement a kind of "flash crawler" which would read all of
+		the NAND pages in the background from time to time, making UBI
+		notice and fix bit-flips.  However, this is not implemented
+		today.
+		</li>
+	</ul></li>
 </ul>
 
-<p>However, there are 2 other aspects which may need closer attention. The
-first one is the "paired pages" problem (e.g., see
+<p>There is another aspect of MLC flashes which may need closer attention: the
+"paired pages" problem (e.g., see
 <a href="http://www.celinux.org/elc08_presentations/ELC2008 Filesystem support on Multi Level Cell flash in open source.ppt">this</a>
 Power Point presentation). Namely, MLC NAND pages are coupled in a sense
 that if you cut power while writing to a page, you corrupt not only this page,
@@ -106,18 +140,6 @@ distances). So if you write data to, say, page 3 and cut the power, you may
 end up with corrupted data in page 0. UBIFS is not ready to handle this
 problem at the moment and this needs some work.</p>
 
-<p>The second aspect is the "program-disturb" MLC NAND property (see
-<a href="http://www.klabs.org/richcontent/MemoryContent/nvmt_symp/nvmts_2002/docs/12/12_dan_p.pdf">here</a>),
-which means that if you program an MLC NAND page, you may introduce a bit-change
-in a different NAND page. Well, the bit change will be fixed by ECC, but with time
-the changes may accumulate and become unfixable. Current UBI bit-flip handling
-only partially helps here, because it is passive, which means that UBI notices
-bit-flips only when performing users read requests, so if you never read the
-MLC NAND area which accumulates bit-flips, UBI will never notice this. However,
-it is not difficult to implement a kind of "flash crawler" which would read the
-flash in background from time to time and make UBI notice and fix
-bit-flips.</p>
-
 <p>Nevertheless, UBIFS authors never worked with real raw MLC NAND flash, so we
 might have missed or misinterpreted some MLC NAND aspects. Any feed-back is
 appreciated.</p>
-- 
1.7.4.1
