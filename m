Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFzPP-0006zf-84
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 08:55:19 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: fstests@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, richard@nod.at,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v2 3/4] Accept failing with EPERM in addition to ENOKEY for
 rename without key
Date: Wed, 31 May 2017 10:54:32 +0200
Message-Id: <20170531085433.26865-4-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170531085433.26865-1-david.oberhollenzer@sigma-star.at>
References: <20170531085433.26865-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some filesystems (e.g. UBIFS) fail with EPERM when trying to move a
file into an encrypted directory via cross rename, without having
access to the encryption key.

Since rename is perfectly allowed to return EPERM, which is also tested
for, and no precise specification seems to exist that clarifies when to
expect EPERM and when ENOKEY, this patch modifies the generic/398 test
to accept both, for the test case where the key is not available.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 tests/generic/398     | 10 ++++++++--
 tests/generic/398.out |  4 ++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/generic/398 b/tests/generic/398
index b486b9c5..53b092d8 100755
--- a/tests/generic/398
+++ b/tests/generic/398
@@ -43,6 +43,12 @@ _cleanup()
 	rm -f $tmp.*
 }
 
+_filter_enokey()
+{
+	# rename without key can also fail with EPERM instead of ENOKEY
+	sed -e "s/Required key not available/Operation not permitted/g"
+}
+
 # get standard environment, filters and checks
 . ./common/rc
 . ./common/filter
@@ -149,9 +155,9 @@ efile1=$(find $edir1 -type f)
 efile2=$(find $edir2 -type f)
 
 echo -e "\n\n*** Exchange encrypted <=> encrypted without key ***"
-src/renameat2 -x $efile1 $efile2
+src/renameat2 -x $efile1 $efile2 |& _filter_enokey
 echo -e "\n*** Exchange encrypted <=> unencrypted without key ***"
-src/renameat2 -x $efile1 $udir/ufile
+src/renameat2 -x $efile1 $udir/ufile |& _filter_enokey
 
 # success, all done
 status=0
diff --git a/tests/generic/398.out b/tests/generic/398.out
index 8e08270d..f9274878 100644
--- a/tests/generic/398.out
+++ b/tests/generic/398.out
@@ -39,7 +39,7 @@ Operation not permitted
 
 
 *** Exchange encrypted <=> encrypted without key ***
-Required key not available
+Operation not permitted
 
 *** Exchange encrypted <=> unencrypted without key ***
-Required key not available
+Operation not permitted
-- 
2.12.0
