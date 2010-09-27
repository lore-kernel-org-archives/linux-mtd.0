Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0D0w-0002ga-9A
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 12:41:03 +0000
From: Steffen Sledz <sledz@dresearch.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ubifs: avoid kernel error if ubifs superblock read fails
Date: Mon, 27 Sep 2010 14:20:26 +0200
Message-Id: <1285590026-11629-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1285577837.16181.14.camel@localhost>
References: <1285577837.16181.14.camel@localhost>
Cc: Steffen Sledz <sledz@dresearch.de>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* .get_sb is called on mounts with automatic fs detection too, so this
  function should print an error if it cannot read the superblock in
  debug mode only
  (new behaviour conforms the other fs types)

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 fs/ubifs/super.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 4e5bf3f..bb6ed5d 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2054,8 +2054,8 @@ static int ubifs_get_sb(struct file_system_type *fs_type, int flags,
 	 */
 	ubi = open_ubi(name, UBI_READONLY);
 	if (IS_ERR(ubi)) {
-		ubifs_err("cannot open \"%s\", error %d",
-			  name, (int)PTR_ERR(ubi));
+		dbg_err("cannot open \"%s\", error %d",
+			name, (int)PTR_ERR(ubi));
 		return PTR_ERR(ubi);
 	}
 	ubi_get_volume_info(ubi, &vi);
-- 
1.7.1
