Received: from [65.117.135.105] (helo=yoda.timesys)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CK18r-0006Oa-6k
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 17:03:38 -0400
Received: from scott by yoda.timesys with local (Exim 3.36 #1 (Debian))
	id 1CK18n-0005Bu-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Oct 2004 17:03:33 -0400
Date: Tue, 19 Oct 2004 17:03:33 -0400
To: linux-mtd@lists.infradead.org
Message-ID: <20041019210333.GA15953@yoda.timesys>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: Scott Wood <scott@timesys.com>
Subject: [PATCH] Interleave order while probing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current 2.6 MTD code probes starting with minimal interleave.
This can result in false positives, if the flash happens to contain
zeroes at the QRY address.  For example, two interleaved 16-bit chips
can be detected as a non-interleaved 32-bit chip when only one of the
chips is put into read-CFI-query mode, and the "\0\0\0Q" that it gets
back is the same as what a real 32-bit chip would produce.

The patch below (against the latest MTD CVS snapshot) starts with the
highest interleave first; I don't think there are any situations
where that would produce a false positive (short of having QRY as the
actual flash data at the relevant addresses).

Signed-off-by: Scott Wood <scott.wood@timesys.com> under TS0068

diff -urN mtd.orig/drivers/mtd/chips/gen_probe.c mtd/drivers/mtd/chips/gen_probe.c
--- mtd.orig/drivers/mtd/chips/gen_probe.c	2004-08-14 18:00:11.000000000 -0400
+++ mtd/drivers/mtd/chips/gen_probe.c	2004-10-19 16:42:11.000000000 -0400
@@ -162,7 +162,7 @@
 	int max_chips = map_bankwidth(map); /* And minimum 1 */
 	int nr_chips, type;
 
-	for (nr_chips = min_chips; nr_chips <= max_chips; nr_chips <<= 1) {
+	for (nr_chips = max_chips; nr_chips >= min_chips; nr_chips >>= 1) {
 
 		if (!cfi_interleave_supported(nr_chips))
 		    continue;
