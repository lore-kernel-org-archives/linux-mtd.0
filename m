Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHkL3-000853-Df
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 22:14:34 +0000
Received: by vxd2 with SMTP id 2so2073517vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2011 15:14:32 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 4 May 2011 18:14:32 -0400
Message-ID: <BANLkTik_AAvVwZrRHPP7sWbsxgAJz1e3sQ@mail.gmail.com>
Subject: [PATCH v2] mkfs.ubifs: add "-F" option for "free-space fixup"
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds a superblock flag indicating that "free-space fixup" is needed, and
allows it to be set by the user via the "-F" command-line option.  The first
time the filesystem is mounted, this flag will trigger a one-time re-mapping of
all LEBs containing free space.  This fixes problems seen on some NAND flashes
when a non-UBIFS-aware flash programmer is used.


Changes since v1: renamed "LEB fixup" to "free space fixup"

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 mkfs.ubifs/mkfs.ubifs.c  |   11 ++++++++++-
 mkfs.ubifs/ubifs-media.h |    2 ++
 mkfs.ubifs/ubifs.h       |    2 ++
 3 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index a306dd6..96e17a3 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -132,7 +132,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;

-static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:p:k:x:X:j:R:l:j:UQq";
+static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQq";

 static const struct option longopts[] = {
 	{"root",               1, NULL, 'r'},
@@ -150,6 +150,7 @@ static const struct option longopts[] = {
 	{"compr",              1, NULL, 'x'},
 	{"favor-percent",      1, NULL, 'X'},
 	{"fanout",             1, NULL, 'f'},
+	{"space-fixup",        0, NULL, 'F'},
 	{"keyhash",            1, NULL, 'k'},
 	{"log-lebs",           1, NULL, 'l'},
 	{"orph-lebs",          1, NULL, 'p'},
@@ -183,6 +184,7 @@ static const char *helptext =
 "                         how many percent better zlib should
compress to make\n"
 "                         mkfs.ubifs use zlib instead of LZO (default 20%)\n"
 "-f, --fanout=NUM         fanout NUM (default: 8)\n"
+"-F, --space-fixup        fixup free space on first mount (needed for
some NANDs)\n"
 "-k, --keyhash=TYPE       key hash type - \"r5\" or \"test\"
(default: \"r5\")\n"
 "-p, --orph-lebs=COUNT    count of erase blocks for orphans (default: 1)\n"
 "-D, --devtable=FILE      use device table FILE\n"
@@ -537,6 +539,7 @@ static int get_options(int argc, char**argv)
 	c->max_leb_cnt = -1;
 	c->max_bud_bytes = -1;
 	c->log_lebs = -1;
+	c->space_fixup = 0;

 	while (1) {
 		opt = getopt_long(argc, argv, optstring, longopts, &i);
@@ -610,6 +613,9 @@ static int get_options(int argc, char**argv)
 			if (*endp != '\0' || endp == optarg || c->fanout <= 0)
 				return err_msg("bad fanout %s", optarg);
 			break;
+		case 'F':
+			c->space_fixup = 1;
+			break;
 		case 'l':
 			c->log_lebs = strtol(optarg, &endp, 0);
 			if (*endp != '\0' || endp == optarg || c->log_lebs <= 0)
@@ -758,6 +764,7 @@ static int get_options(int argc, char**argv)
 						"r5" : "test");
 		printf("\tfanout:       %d\n", c->fanout);
 		printf("\torph_lebs:    %d\n", c->orph_lebs);
+		printf("\tspace_fixup:  %d\n", c->space_fixup);
 	}

 	if (validate_options())
@@ -1997,6 +2004,8 @@ static int write_super(void)
 	}
 	if (c->big_lpt)
 		sup.flags |= cpu_to_le32(UBIFS_FLG_BIGLPT);
+	if (c->space_fixup)
+		sup.flags |= cpu_to_le32(UBIFS_FLG_SPACE_FIXUP);

 	return write_node(&sup, UBIFS_SB_NODE_SZ, UBIFS_SB_LNUM, UBI_LONGTERM);
 }
diff --git a/mkfs.ubifs/ubifs-media.h b/mkfs.ubifs/ubifs-media.h
index a9ecbd9..fe62d0e 100644
--- a/mkfs.ubifs/ubifs-media.h
+++ b/mkfs.ubifs/ubifs-media.h
@@ -373,9 +373,11 @@ enum {
  * Superblock flags.
  *
  * UBIFS_FLG_BIGLPT: if "big" LPT model is used if set
+ * UBIFS_FLG_SPACE_FIXUP: first-mount "fixup" of free space within LEBs needed
  */
 enum {
 	UBIFS_FLG_BIGLPT = 0x02,
+	UBIFS_FLG_SPACE_FIXUP = 0x04,
 };

 /**
diff --git a/mkfs.ubifs/ubifs.h b/mkfs.ubifs/ubifs.h
index 5c29046..f94a52c 100644
--- a/mkfs.ubifs/ubifs.h
+++ b/mkfs.ubifs/ubifs.h
@@ -317,6 +317,7 @@ struct ubifs_znode
  * @nhead_lnum: LEB number of LPT head
  * @nhead_offs: offset of LPT head
  * @big_lpt: flag that LPT is too big to write whole during commit
+ * @space_fixup: flag indicating that free space in LEBs needs to be cleaned up
  * @lpt_sz: LPT size
  *
  * @ltab_lnum: LEB number of LPT's own lprops table
@@ -394,6 +395,7 @@ struct ubifs_info
 	int nhead_lnum;
 	int nhead_offs;
 	int big_lpt;
+	int space_fixup;
 	long long lpt_sz;

 	int ltab_lnum;
-- 
1.6.3.3


-- 
Matthew L. Creech
