Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MR0zw-0002zY-6f
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 09:42:13 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: tytso@mit.edu
Subject: [PATCH 2/2] blkid: add ubifs support
Date: Wed, 15 Jul 2009 11:38:44 +0200
Message-Id: <1247650724-16288-3-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1247650724-16288-2-git-send-email-corentincj@iksaif.net>
References: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
	<1247650724-16288-2-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 lib/blkid/probe.c |   14 +++++++++
 lib/blkid/probe.h |   81 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 0 deletions(-)

diff --git a/lib/blkid/probe.c b/lib/blkid/probe.c
index 8f6cfa6..86278cb 100644
--- a/lib/blkid/probe.c
+++ b/lib/blkid/probe.c
@@ -1384,6 +1384,19 @@ static int probe_btrfs(struct blkid_probe *probe,
 	set_uuid(probe->dev, bs->fsid, 0);
 	return 0;
 }
+
+static int probe_ubifs(struct blkid_probe *probe,
+		       struct blkid_magic *id,
+		       unsigned char *buf)
+{
+	struct ubifs_sb_node *sb;
+
+	sb = (struct ubifs_sb_node *)buf;
+
+	set_uuid(probe->dev, sb->uuid, 0);
+	return 0;
+}
+
 /*
  * Various filesystem magics that we can check for.  Note that kboff and
  * sboff are in kilobytes and bytes respectively.  All magics are in
@@ -1391,6 +1404,7 @@ static int probe_btrfs(struct blkid_probe *probe,
  */
 static struct blkid_magic type_array[] = {
 /*  type     kboff   sboff len  magic			probe */
+  { "ubifs",	 0,      0,  4, "\x31\x18\x10\x06",	probe_ubifs },
   { "oracleasm", 0,	32,  8, "ORCLDISK",		probe_oracleasm },
   { "ntfs",	 0,	 3,  8, "NTFS    ",		probe_ntfs },
   { "jbd",	 1,   0x38,  2, "\123\357",		probe_jbd },
diff --git a/lib/blkid/probe.h b/lib/blkid/probe.h
index 37fc9c0..f71c224 100644
--- a/lib/blkid/probe.h
+++ b/lib/blkid/probe.h
@@ -725,6 +725,87 @@ struct btrfs_super_block {
 	__u8 sys_chunk_array[BTRFS_SYSTEM_CHUNK_ARRAY_SIZE];
 } __attribute__ ((__packed__));
 
+/**
+ * struct ubifs_ch - common header node.
+ * @magic: UBIFS node magic number (%UBIFS_NODE_MAGIC)
+ * @crc: CRC-32 checksum of the node header
+ * @sqnum: sequence number
+ * @len: full node length
+ * @node_type: node type
+ * @group_type: node group type
+ * @padding: reserved for future, zeroes
+ *
+ * Every UBIFS node starts with this common part. If the node has a key, the
+ * key always goes next.
+ */
+struct ubifs_ch {
+	__u32 magic;
+	__u32 crc;
+	__u64 sqnum;
+	__u32 len;
+	__u8 node_type;
+	__u8 group_type;
+	__u8 padding[2];
+} __attribute__ ((packed));
+
+/**
+ * struct ubifs_sb_node - superblock node.
+ * @ch: common header
+ * @padding: reserved for future, zeroes
+ * @key_hash: type of hash function used in keys
+ * @key_fmt: format of the key
+ * @flags: file-system flags (%UBIFS_FLG_BIGLPT, etc)
+ * @min_io_size: minimal input/output unit size
+ * @leb_size: logical eraseblock size in bytes
+ * @leb_cnt: count of LEBs used by file-system
+ * @max_leb_cnt: maximum count of LEBs used by file-system
+ * @max_bud_bytes: maximum amount of data stored in buds
+ * @log_lebs: log size in logical eraseblocks
+ * @lpt_lebs: number of LEBs used for lprops table
+ * @orph_lebs: number of LEBs used for recording orphans
+ * @jhead_cnt: count of journal heads
+ * @fanout: tree fanout (max. number of links per indexing node)
+ * @lsave_cnt: number of LEB numbers in LPT's save table
+ * @fmt_version: UBIFS on-flash format version
+ * @default_compr: default compression algorithm (%UBIFS_COMPR_LZO, etc)
+ * @padding1: reserved for future, zeroes
+ * @rp_uid: reserve pool UID
+ * @rp_gid: reserve pool GID
+ * @rp_size: size of the reserved pool in bytes
+ * @padding2: reserved for future, zeroes
+ * @time_gran: time granularity in nanoseconds
+ * @uuid: UUID generated when the file system image was created
+ * @ro_compat_version: UBIFS R/O compatibility version
+ */
+struct ubifs_sb_node {
+	struct ubifs_ch ch;
+	__u8 padding[2];
+	__u8 key_hash;
+	__u8 key_fmt;
+	__u32 flags;
+	__u32 min_io_size;
+	__u32 leb_size;
+	__u32 leb_cnt;
+	__u32 max_leb_cnt;
+	__u64 max_bud_bytes;
+	__u32 log_lebs;
+	__u32 lpt_lebs;
+	__u32 orph_lebs;
+	__u32 jhead_cnt;
+	__u32 fanout;
+	__u32 lsave_cnt;
+	__u32 fmt_version;
+	__u16 default_compr;
+	__u8 padding1[2];
+	__u32 rp_uid;
+	__u32 rp_gid;
+	__u64 rp_size;
+	__u32 time_gran;
+	__u8 uuid[16];
+	__u32 ro_compat_version;
+	__u8 padding2[3968];
+} __attribute__ ((packed));
+
 /*
  * Byte swap functions
  */
-- 
1.6.3.3
