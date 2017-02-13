Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cdOFi-0008C0-U1
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 21:33:48 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, dwmw2@infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 4/5] Add information about user space ports of the mtd tests
Date: Mon, 13 Feb 2017 22:31:17 +0100
Message-Id: <20170213213118.7857-5-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170213213118.7857-1-david.oberhollenzer@sigma-star.at>
References: <20170213213118.7857-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 doc/general.xml | 75 ++++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 47 insertions(+), 28 deletions(-)

diff --git a/doc/general.xml b/doc/general.xml
index 35763e0..33cffa4 100644
--- a/doc/general.xml
+++ b/doc/general.xml
@@ -107,8 +107,21 @@ sysfs interface (referenced above) before adjusting this value.
 
 <h2><a name="L_mtd_tests">MTD tests</a></h2>
 
-<p>The MTD subsystem includes a set of tests which you may run to verify your
-flash hardware and drivers. The tests are available in the mainline kernels
+<p>The mtd-utils include a set of test programs which you may run to verify
+your flash hardware and drivers. The programs have only been recently ported
+to user space and are also available as kernel modules.</p>
+
+<p>In contrast to the modules, the user space tests also offer more fine
+grained options for controling their behaviour, such as only using specific
+erase blocks or pages.</p>
+
+<p>The user space tests are compiled automatically when
+<a href="../faq/general.html#L_compile_mtd">compiling mtd-utils</a>, but are
+not installed by default. To install the tests through
+<code>make install</code>, the configure option
+<code>--enable-install-tests</code> has to be set.</p>
+
+<p>The kernel module tests are available in the mainline kernels
 starting from kernel version <code>2.6.29</code> and they live in the
 <code>drivers/mtd/tests</code> directory of the linux kernel source codes. You
 may compile the tests as kernel modules by enabling them in the kernel
@@ -124,47 +137,53 @@ git://git.infradead.org/users/ahunter/nand-tests.git
 
 <p>The MTD test-suite contains the following tests:</p>
 <ul>
-	<li><b>mtd_nandbiterrs</b>: relevant only for NAND flashes, introduces
+	<li><b>nandbiterrs</b>: relevant only for NAND flashes, introduces
 	bit errors and tests for multi-bit error recovery on a NAND page. This
-	mostly tests the ECC controller / driver.</li>
+	mostly tests the ECC controller / driver. The kernel module version is
+	called <b>mtd_nandbiterrs</b>.</li>
 
-	<li><b>mtd_speedtest</b>: measures and reports read/write/erase speed
-	of the MTD device.</li>
+	<li><b>flash_speed</b>: measures and reports read/write/erase speed
+	of the MTD device. The kernel module version is called
+	<b>mtd_speedtest</b>.</li>
 
-	<li><b>mtd_stresstest</b>: performs random read/write/erase operations
-	and validates the MTD device I/O capabilities.</li>
+	<li><b>flash_stress</b>: performs random read/write/erase operations
+	and validates the MTD device I/O capabilities. The kernel module
+	version is called <b>mtd_stresstest</b>.</li>
 
-	<li><b>mtd_readtest</b>: this tests reads whole MTD device, one NAND
+	<li><b>flash_readtest</b>: this tests reads from an MTD device, one NAND
 	page at a time including OOB (or 512 bytes at a time in case of flashes
-	like NOR) and checks that reading works properly.</li>
+	like NOR) and checks that reading works properly. The kernel module
+	version is called <b>mtd_readtest</b>.</li>
 
-	<li><b>mtd_pagetest</b>: relevant only for NAND flashes, tests NAND page
+	<li><b>nandpagetest</b>: relevant only for NAND flashes, tests NAND page
 	writing and reading in different sizes and order; this test was
 	originally developed for testing the OneNAND driver, so it might be a
-	little OneNAND-oriented, but must work on any NAND flash.</li>
+	little OneNAND-oriented, but must work on any NAND flash. The kernel
+	module version is called <b>mtd_pagetest</b>.</li>
 
-	<li><b>mtd_oobtest</b>: relevant only for NAND flashes, tests that the
-	OOB area I/O works properly by writing data to different offsets and
-	verifying it.</li>
+	<li><b>mtd_oobtest</b>: currently only exists as a kernel module.
+	Relevant only for NAND flashes, tests that the OOB area I/O works
+	properly by writing data to different offsets and verifying it.</li>
 
-	<li><b>mtd_subpagetest</b>: relevant only for NAND flashes, tests
-	<a href="ubi.html#L_subpage">sub-page</a> I/O.</li>
+	<li><b>nandsubpagetest</b>: relevant only for NAND flashes, tests
+	<a href="ubi.html#L_subpage">sub-page</a> I/O. The kernel module
+	version is called <b>mtd_subpagetest</b>.</li>
 
-	<li><b>mtd_torturetest</b>: this test is designed to wear out flash
+	<li><b>flash_torture</b>: this test is designed to wear out flash
 	eraseblocks. It repeatedly writes and erases the same group of
-	eraseblocks until an I/O error happens, so be careful! The test
-	supports a number of options (see <code>modinfo mtd_torturetest</code>)
-	which allow you to set the amount of eraseblocks to torture and how the
-	torturing is done. You may limit the amount of torturing cycles using
-	the <code>cycles_count</code> module parameter. It may be very god idea
-	to run this test for some time and validate your flash driver and HW,
-	providing you have a spare device. For example, we caught rather rare
-	and nasty DMA issues on an OMAP2 board with OneNAND flash, just by
-	running this tests for few hours.</li>
+	eraseblocks until an I/O error happens, so be careful! It may be very
+	god idea to run this test for some time and validate your flash driver
+	and HW, providing you have a spare device. For example, we caught
+	rather rare and nasty DMA issues on an OMAP2 board with OneNAND flash,
+	just by running this tests for few hours. The kernel module version
+	is called <b>mtd_torturetest</b> and also supports a number of options
+	(see <code>modinfo mtd_torturetest</code>).</li>
 
 	<li><b>mtd_nandecctest</b>: a simple test that checks correctness of the
 	built-in software ECC for 256 and 512-byte buffers; this test is not
-	driver-specific but tests general NAND support code.</li>
+	driver-specific but tests general NAND support code. This tests only
+	exists as a kernel module, as it tests the internal software ECC
+	implementation.</li>
 </ul>
 
 
-- 
2.11.0
