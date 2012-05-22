Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWuAp-0000iv-5Q
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 18:51:11 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-www: clarification to -EUCLEAN explanation
Date: Tue, 22 May 2012 11:51:09 -0700
Message-Id: <1337712669-11801-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The -EUCLEAN return value applies to mtd_read_oob() as well as mtd_read(), but
only mtd_read() was mentioned in the explanation of -EUCLEAN. 

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

Again, trivial change that looks bigger because of reformatting.

 doc/general.xml |   27 ++++++++++++++-------------
 1 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/doc/general.xml b/doc/general.xml
index ba76c4f..31ea243 100644
--- a/doc/general.xml
+++ b/doc/general.xml
@@ -89,19 +89,20 @@ use those prototyped in <code>mtd.h</code> outside of <code>struct
 mtd_info</code>.  These methods include <code>mtd_read()</code>,
 <code>mtd_write()</code>, etc.</p>
 
-Absent an error, the API methods will return zero, with one notable exception.
-<code>mtd_read()</code> may return <code>-EUCLEAN</code> in some circumstances.
-This return code is applicable mainly to NAND flash devices, and is used to
-indicate that some bit errors were corrected by the device's ECC facility.
-Prior to kernel version 3.4, <code>-EUCLEAN</code> was returned if one or more
-bit errors were corrected during the read operation.  As of kernel 3.4, the
-meaning is more nuanced, and can be broadly interpreted to mean "a dangerously
-high number of bit errors were corrected".  The <code>-EUCLEAN</code> return
-code is intended to help higher layers detect degradation of erase blocks.  The
-conditions by which <code>mtd_read()</code> returns <code>-EUCLEAN</code> can be
-tuned using the <code>bitflip_threshold</code> element of the sysfs interface.
-Please see the kernel documentation for the MTD sysfs interface (referenced
-above) before adjusting this value.
+Absent an error, the API methods will return zero, with two notable exceptions.
+<code>mtd_read()</code> and <code>mtd_read_oob()</code> may return
+<code>-EUCLEAN</code> in some circumstances.  This return code is applicable
+mainly to NAND flash devices, and is used to indicate that some bit errors were
+corrected by the device's ECC facility.  Prior to kernel version 3.4,
+<code>-EUCLEAN</code> was returned if one or more bit errors were corrected
+during the read operation.  As of kernel 3.4, the meaning is more nuanced, and
+can be broadly interpreted to mean "a dangerously high number of bit errors were
+corrected".  The <code>-EUCLEAN</code> return code is intended to help higher
+layers detect degradation of erase blocks.  The conditions by which
+<code>mtd_read()</code> and <code>mtd_read_oob()</code> return
+<code>-EUCLEAN</code> can be tuned using the <code>bitflip_threshold</code>
+element of the sysfs interface.  Please see the kernel documentation for the MTD
+sysfs interface (referenced above) before adjusting this value.
 
 
 <h2><a name="L_mtd_tests">MTD tests</a></h2>
-- 
1.7.3.4
