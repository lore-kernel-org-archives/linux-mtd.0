From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Sun, 10 Jan 2010 01:33:31 +0200
Subject: [PATCH 1/2] ubiformat: always initialize seq number
Message-ID: <mailman.133.1263081099.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

For some reasons sequence number was set to 0 in some case, which
is wrong.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 ubi-utils/src/ubiformat.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 3b0f49b..80f3a6d 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -912,7 +912,8 @@ int main(int argc, char * const argv[])
 				printf("yes\n");
 		} else
 			ubigen_info_init(&ui, mtd.eb_size, mtd.min_io_size, 0,
-					 si->vid_hdr_offs, args.ubi_ver, 0);
+					 si->vid_hdr_offs, args.ubi_ver,
+					 args.image_seq);
 		normsg("use offsets %d and %d",  ui.vid_hdr_offs, ui.data_offs);
 	}
 
-- 
1.6.2.5


--=-Pxdd5oR40ZW7sJDJsgWn
Content-Disposition: attachment; filename="0002-ubiformat-be-consistent-with-sequence-numbers.patch"
Content-Type: text/x-patch; name="0002-ubiformat-be-consistent-with-sequence-numbers.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit
