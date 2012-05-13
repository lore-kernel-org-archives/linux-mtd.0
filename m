Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STc33-0001PJ-JA
 for linux-mtd@lists.infradead.org; Sun, 13 May 2012 16:53:34 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-www: add blurb about API changes and -EUCLEAN to
 doc/general
Date: Sun, 13 May 2012 09:53:27 -0700
Message-Id: <1336928007-3603-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here's my attempt at the documentation requested by Artem.  There was no
discussion of the API, so it seemed like some general info was needed before
discussing EUCLEAN.  Also mentioned the switch to the API wrappers.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 doc/general.xml |   37 ++++++++++++++++++++++++++++++++++++-
 1 files changed, 36 insertions(+), 1 deletions(-)

diff --git a/doc/general.xml b/doc/general.xml
index ea09556..ba76c4f 100644
--- a/doc/general.xml
+++ b/doc/general.xml
@@ -13,6 +13,7 @@
 <h2>Table of contents</h2>
 <ol>
 	<li><a href="general.html#L_overview">MTD overview</a></li>
+	<li><a href="general.html#L_mtd_api">MTD API</a></li>
 	<li><a href="general.html#L_mtd_tests">MTD tests</a></li>
 	<li><a href="general.html#L_mtdblock">The <code>mtdblock</code> driver</a></li>
 	<li><a href="general.html#L_old_docs">Old MTD documentation</a></li>
@@ -50,7 +51,10 @@ discusses this in more details.</p>
 	full information about each MTD device in the system. This interface is
 	easily extensible and developers are encouraged to use the
 	<code>sysfs</code> interface instead of older <code>ioctl</code> or
-	<code>/proc/mtd</code> interfaces, when possible.</li>
+	<code>/proc/mtd</code> interfaces, when possible. The <code>sysfs</code>
+	interface for the mtd subsystem is documentated in the kernel, and
+	currently can be found at
+	<code>Documentation/ABI/testing/sysfs-class-mtd</code>.</li>
 
 	<li>The <code>/proc/mtd</code> proc file system file provides general
 	MTD information. This is a legacy interface and the sysfs interface
@@ -69,6 +73,37 @@ not maintained very much.</p>
 
 
 
+<h2><a name="L_mtd_api">MTD API</a></h2>
+
+<p>The MTD subsystem API is defined in <code>include/linux/mtd/mtd.h</code>.
+The methods and data structures in this file are used by higher layer kernel
+code such as flash file systems to access and control the mtd devices, and also
+by device driver authors to interface their device to the mtd subsystem.  The
+various methods by which a driver provides access to the device are defined
+within <code>struct mtd_info</code>.  Prior to kernel version 3.4, higher layers
+called the driver methods directly by way of a pointer to <code>struct
+mtd_info</code>.  As of kernel 3.4, these methods are implemented within the mtd
+subsystem core code, which then calls the corresponding driver methods.  Users
+of kernel 3.4 and later should not call the driver methods directly, but instead
+use those prototyped in <code>mtd.h</code> outside of <code>struct
+mtd_info</code>.  These methods include <code>mtd_read()</code>,
+<code>mtd_write()</code>, etc.</p>
+
+Absent an error, the API methods will return zero, with one notable exception.
+<code>mtd_read()</code> may return <code>-EUCLEAN</code> in some circumstances.
+This return code is applicable mainly to NAND flash devices, and is used to
+indicate that some bit errors were corrected by the device's ECC facility.
+Prior to kernel version 3.4, <code>-EUCLEAN</code> was returned if one or more
+bit errors were corrected during the read operation.  As of kernel 3.4, the
+meaning is more nuanced, and can be broadly interpreted to mean "a dangerously
+high number of bit errors were corrected".  The <code>-EUCLEAN</code> return
+code is intended to help higher layers detect degradation of erase blocks.  The
+conditions by which <code>mtd_read()</code> returns <code>-EUCLEAN</code> can be
+tuned using the <code>bitflip_threshold</code> element of the sysfs interface.
+Please see the kernel documentation for the MTD sysfs interface (referenced
+above) before adjusting this value.
+
+
 <h2><a name="L_mtd_tests">MTD tests</a></h2>
 
 <p>The MTD subsystem includes a set of tests which you may run to verify your
-- 
1.7.3.4
