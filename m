Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dtchO-0005KN-Tk
 for linux-mtd@lists.infradead.org; Sun, 17 Sep 2017 16:45:43 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] ubifs: Fix uninitialized variable in search_dh_cookie()
Date: Sun, 17 Sep 2017 10:32:20 +0200
Message-Id: <1505637141-4700-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fs/ubifs/tnc.c: In function ‘search_dh_cookie’:
fs/ubifs/tnc.c:1893: warning: ‘err’ is used uninitialized in this function

Indeed, err is always used uninitialized.

According to an original review comment from Hyunchul, acknowledged by
Richard, err should be initialized to -ENOENT to avoid the first call to
tnc_next().  But we can achieve the same by reordering the code.

Reported-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Compile-tested only.

Still needed in v4.14-rc1, so I'm sending out the patch I wrote in July.
This avoids initializing err at the top, so we don't loose the ability to
catch future uninitialized use.
---
 fs/ubifs/tnc.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 0a213dcba2a1f0f5..ba3d0e0f86151e53 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -1890,35 +1890,28 @@ static int search_dh_cookie(struct ubifs_info *c, const union ubifs_key *key,
 	union ubifs_key *dkey;
 
 	for (;;) {
-		if (!err) {
-			err = tnc_next(c, &znode, n);
-			if (err)
-				goto out;
-		}
-
 		zbr = &znode->zbranch[*n];
 		dkey = &zbr->key;
 
 		if (key_inum(c, dkey) != key_inum(c, key) ||
 		    key_type(c, dkey) != key_type(c, key)) {
-			err = -ENOENT;
-			goto out;
+			return -ENOENT;
 		}
 
 		err = tnc_read_hashed_node(c, zbr, dent);
 		if (err)
-			goto out;
+			return err;
 
 		if (key_hash(c, key) == key_hash(c, dkey) &&
 		    le32_to_cpu(dent->cookie) == cookie) {
 			*zn = znode;
-			goto out;
+			return 0;
 		}
-	}
-
-out:
 
-	return err;
+		err = tnc_next(c, &znode, n);
+		if (err)
+			return err;
+	}
 }
 
 static int do_lookup_dh(struct ubifs_info *c, const union ubifs_key *key,
-- 
2.7.4
