Received: from mail-fx0-f211.google.com ([209.85.220.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NHdW4-0001wU-Rv
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 13:20:45 +0000
Received: by fxm3 with SMTP id 3so4691139fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Dec 2009 05:20:38 -0800 (PST)
Message-ID: <4B1D0169.3040507@gmail.com>
Date: Mon, 07 Dec 2009 14:21:45 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind@infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>,
	linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] UBIFS: PTR_ERR return of wrong pointer in check_leaf()
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Return the PTR_ERR of the correct pointer.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
 fs/ubifs/debug.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index dbc093a..8a771c5 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2014,7 +2014,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		inum = key_inum_flash(c, &dent->key);
 		fscki1 = read_add_inode(c, priv, inum);
 		if (IS_ERR(fscki1)) {
-			err = PTR_ERR(fscki);
+			err = PTR_ERR(fscki1);
 			ubifs_err("error %d while processing entry node and "
 				  "trying to find parent inode node %lu",
 				  err, (unsigned long)inum);
