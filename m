Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPJBS-0007e9-JF
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 19:56:27 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: use ecc_strength to determine whether to perform
 bitflip_threshold test
Date: Tue,  1 May 2012 12:56:21 -0700
Message-Id: <1335902181-18110-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a minor change to the recent EUCLEAN patch set that I think makes it
more correct.  Currently, the test in mtd_read() that determines whether or not
to return -EUCLEAN is skipped if bitflip_threshold == 0.  This logic was added
(without much thought) to fix a bug in an earlier version of the patch set that
would have caused devices lacking ecc to always return -EUCLEAN [1].

This patch replaces bitflip_threshold with ecc_strength as the value used to
determine whether the device has ecc capability.  I think this is more correct
because bitflip_threshold can be changed via sysfs.  Currently, if the user sets
it to zero, -EUCLEAN is never returned.  This is also what happens if the user
sets it to a value exceeding ecc_strength.  With this patch, if the user sets it
to zero, -EUCLEAN will always be returned (provided ecc_strength > 0), which
makes more sense, and may even be useful occasionally.

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-March/040468.html

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

Sorry for wanting to make tweaks after reviews and Ivan's testing.  It's
optional, low risk, and I did test it.  Thanks!

 Documentation/ABI/testing/sysfs-class-mtd |    7 +++++--
 drivers/mtd/mtdcore.c                     |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 7883508..db1ad7e 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -167,7 +167,10 @@ Description:
 		block degradation, but high enough to avoid the consequences of
 		a persistent return value of -EUCLEAN on devices where sticky
 		bitflips occur.  Note that if bitflip_threshold exceeds
-		ecc_strength, -EUCLEAN is never returned by the read functions.
+		ecc_strength, -EUCLEAN is never returned by mtd_read().
+		Conversely, if bitflip_threshold is zero, -EUCLEAN is always
+		returned, absent a hard error.
 
 		This is generally applicable only to NAND flash devices with ECC
-		capability.  It is ignored on devices lacking ECC capability.
+		capability.  It is ignored on devices lacking ECC capability;
+		i.e., devices for which ecc_strength is zero.
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b5bb628..5757307 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -815,7 +815,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	ret_code = mtd->_read(mtd, from, len, retlen, buf);
 	if (unlikely(ret_code < 0))
 		return ret_code;
-	if (mtd->bitflip_threshold == 0)
+	if (mtd->ecc_strength == 0)
 		return 0;	/* device lacks ecc */
 	return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;
 }
-- 
1.7.3.4
