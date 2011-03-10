From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Thu, 10 Mar 2011 16:26:32 +0200
Subject: [PATCH] UBIFS: do not check data crc by default
Message-ID: <mailman.169.1299767402.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Change the default UBIFS behavior WRT data CRC checking. Currently,
UBIFS checks data CRC when reading, which slows it down quite a bit,
and this is the default option. However, it looks like in average
user does not need this feature and would prefer faster read speed
over extra reliability. And this seems to be de-facto standard that
file-systems do not check data CRC every time they read from the
media.

Thus, make UBIFS default behavior so that it does not check data
CRC. This corresponds to the no_chk_data_crc mount option. Those users
who need extra protection can always enable it using the chk_data_crc
option.

Please, read more information about this feature here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_checksumming

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 Documentation/filesystems/ubifs.txt |    4 ++--
 fs/ubifs/super.c                    |    1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/ubifs.txt b/Documentation/filesystems/ubifs.txt
index 12fedb7..d7b13b0 100644
--- a/Documentation/filesystems/ubifs.txt
+++ b/Documentation/filesystems/ubifs.txt
@@ -82,12 +82,12 @@ Mount options
 bulk_read		read more in one go to take advantage of flash
 			media that read faster sequentially
 no_bulk_read (*)	do not bulk-read
-no_chk_data_crc		skip checking of CRCs on data nodes in order to
+no_chk_data_crc (*)	skip checking of CRCs on data nodes in order to
 			improve read performance. Use this option only
 			if the flash media is highly reliable. The effect
 			of this option is that corruption of the contents
 			of a file can go unnoticed.
-chk_data_crc (*)	do not skip checking CRCs on data nodes
+chk_data_crc		do not skip checking CRCs on data nodes
 compr=none              override default compressor and set it to "none"
 compr=lzo               override default compressor and set it to "lzo"
 compr=zlib              override default compressor and set it to "zlib"
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b722ebc..e5dc1e1 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1985,6 +1985,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	INIT_LIST_HEAD(&c->old_buds);
 	INIT_LIST_HEAD(&c->orph_list);
 	INIT_LIST_HEAD(&c->orph_new);
+	c->no_chk_data_crc = 1;
 
 	c->vfs_sb = sb;
 	c->highest_inum = UBIFS_FIRST_INO;
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (?????????? ????????????????)
