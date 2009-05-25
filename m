Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8Tf8-0001iX-F1
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 06:28:01 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mkfs.ubifs: remove duplicated code
Date: Mon, 25 May 2009 08:26:26 +0200
Message-Id: <1243232787-29108-2-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1243232787-29108-1-git-send-email-corentincj@iksaif.net>
References: <1243232787-29108-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ino->uid        = cpu_to_le32(st->st_uid);
ino->gid        = cpu_to_le32(st->st_gid);
was present twice.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 mkfs.ubifs/mkfs.ubifs.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index ebebfae..c0c1c29 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -1011,8 +1011,6 @@ static int add_inode_with_data(struct stat *st, ino_t inum, void *data,
 	ino->mtime_nsec = 0;
 	ino->uid        = cpu_to_le32(st->st_uid);
 	ino->gid        = cpu_to_le32(st->st_gid);
-	ino->uid        = cpu_to_le32(st->st_uid);
-	ino->gid        = cpu_to_le32(st->st_gid);
 	ino->mode       = cpu_to_le32(st->st_mode);
 	ino->flags      = cpu_to_le32(use_flags);
 	ino->data_len   = cpu_to_le32(data_len);
-- 
1.6.3.1
