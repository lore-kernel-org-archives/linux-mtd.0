Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWtQw-00076O-SV
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 18:03:48 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: ABI documentation: clarification of bitflip_threshold
Date: Tue, 22 May 2012 11:03:42 -0700
Message-Id: <1337709822-11587-1-git-send-email-mikedunn@newsguy.com>
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
only mtd_read() was mentioned in the blurd on bitflip_threshold in the ABI
documentation.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

Sorry to keep revisiting this, but this seems like a big omission.  It looks
like a big rewrite because of reformatting, but only the words "and
mtd_read_oob()" are added to the first paragraph.  I deliberately left ambiguous
the question of whether -EUCLEAN can be returned if mtd_read_oob() is used to
read oob-only ;)

 Documentation/ABI/testing/sysfs-class-mtd |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index db1ad7e..938ef71 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -142,13 +142,14 @@ KernelVersion:	3.4
 Contact:	linux-mtd@lists.infradead.org
 Description:
 		This allows the user to examine and adjust the criteria by which
-		mtd returns -EUCLEAN from mtd_read().  If the maximum number of
-		bit errors that were corrected on any single region comprising
-		an ecc step (as reported by the driver) equals or exceeds this
-		value, -EUCLEAN is returned.  Otherwise, absent an error, 0 is
-		returned.  Higher layers (e.g., UBI) use this return code as an
-		indication that an erase block may be degrading and should be
-		scrutinized as a candidate for being marked as bad.
+		mtd returns -EUCLEAN from mtd_read() and mtd_read_oob().  If the
+		maximum number of bit errors that were corrected on any single
+		region comprising an ecc step (as reported by the driver) equals
+		or exceeds this value, -EUCLEAN is returned.  Otherwise, absent
+		an error, 0 is returned.  Higher layers (e.g., UBI) use this
+		return code as an indication that an erase block may be
+		degrading and should be scrutinized as a candidate for being
+		marked as bad.
 
 		The initial value may be specified by the flash device driver.
 		If not, then the default value is ecc_strength.
@@ -167,7 +168,7 @@ Description:
 		block degradation, but high enough to avoid the consequences of
 		a persistent return value of -EUCLEAN on devices where sticky
 		bitflips occur.  Note that if bitflip_threshold exceeds
-		ecc_strength, -EUCLEAN is never returned by mtd_read().
+		ecc_strength, -EUCLEAN is never returned by the read operations.
 		Conversely, if bitflip_threshold is zero, -EUCLEAN is always
 		returned, absent a hard error.
 
-- 
1.7.3.4
