Received: from mgw-sa02.nokia.com ([147.243.1.48])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Osu9M-0000In-LS
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 09:07:33 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: do not override root inode permissions
Date: Tue,  7 Sep 2010 11:36:02 +0300
Message-Id: <1283848562-19564-1-git-send-email-dedekind1@gmail.com>
Cc: Arno Steffen <arno.steffen@googlemail.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When mkfs.ubifs is used with -r dir, it does not make the root UBIFS
inode uid/gid/permissions to be equivalent to dir's permissions, but
it makes root inode permissions to be equivalent to uid = git = 0
(root) and permissions = u+rwx go+rx.

This patch changes the behavior and makes mkfs.ubifs use the
permissions of the directory containing the original files on the host.
I.e., it will be <dir>'s uid/git/permissions if case of mkfs.ubifs
-r <dir>.

This patch is a bit dangerous because it changes the behavior and may
have security implications if someone used the older version, relied
on this bug, and upgrades to the newer version.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 mkfs.ubifs/mkfs.ubifs.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 9f2a226..a4aebcb 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -1639,9 +1639,8 @@ static int write_data(void)
 	} else {
 		root_st.st_mtime = time(NULL);
 		root_st.st_atime = root_st.st_ctime = root_st.st_mtime;
+		root_st.st_mode = S_IFDIR | S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
 	}
-	root_st.st_uid = root_st.st_gid = 0;
-	root_st.st_mode = S_IFDIR | S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
 
 	head_flags = 0;
 	err = add_directory(root, UBIFS_ROOT_INO, &root_st, !root);
-- 
1.7.1.1
