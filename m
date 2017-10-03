Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzIv4-0005jN-0z
 for linux-mtd@lists.infradead.org; Tue, 03 Oct 2017 08:51:15 +0000
Received: by mail-wr0-x244.google.com with SMTP id v38so2455241wrc.4
 for <linux-mtd@lists.infradead.org>; Tue, 03 Oct 2017 01:50:52 -0700 (PDT)
From: Romain Izard <romain.izard.pro@gmail.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH] mkfs.ubifs: Apply squash-uids to the root node
Date: Tue,  3 Oct 2017 10:50:28 +0200
Message-Id: <20171003085028.31779-1-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The root node of the file system needs to be handled as a special case
when removing the owner information from the input.

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 9e69a4f..d432dfe 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1831,6 +1831,8 @@ static int write_data(void)
 		if (err)
 			return sys_err_msg("bad root file-system directory '%s'",
 					   root);
+		if (squash_owner)
+			root_st.st_uid = root_st.st_gid = 0;
 	} else {
 		root_st.st_mtime = time(NULL);
 		root_st.st_atime = root_st.st_ctime = root_st.st_mtime;
-- 
2.11.0
