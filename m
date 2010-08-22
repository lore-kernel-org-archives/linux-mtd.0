Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1On280-0005Db-5W
	for linux-mtd@lists.infradead.org; Sun, 22 Aug 2010 04:25:53 +0000
Received: by fxm12 with SMTP id 12so2938307fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 21 Aug 2010 21:25:50 -0700 (PDT)
Subject: Re: [PATCHv2 7/9] UBIFS: do not write rubbish into truncation
	scanning node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4C5E901E.5060802@nokia.com>
References: <1281261452-9868-1-git-send-email-dedekind1@gmail.com>
	<1281261452-9868-8-git-send-email-dedekind1@gmail.com>
	<4C5E8F15.9080505@nokia.com>  <4C5E901E.5060802@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 22 Aug 2010 07:25:46 +0300
Message-ID: <1282451146.16502.4.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-08-08 at 14:08 +0300, Adrian Hunter wrote:
> Still, trun_key_init might be better here because the all-zeroes key has a key-type
> of UBIFS_INO_KEY.  What do you think?

I've left this patch as it is, since it is the simplest fix for the
issue. But on top of it I've applied the patch below. I've also amended
comments in patch 2/7, as Vitaly Wool suggested. Pushed to
ubifs-2.6.git / master. Only compile-tested the last series so far.

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] UBIFS: mark unused key objects as invalid

When scanning the flash, UBIFS builds a list of flash nodes of type
'struct ubifs_scan_node'. Each scanned node has a 'snod->key' field. This field
is valid for most of the nodes, but invalid for some node type, e.g., truncation
nodes. It is safer to explicitly initialize such keys to something invalid,
rather than leaving them initialized to all zeros, which has key type of
UBIFS_INO_KEY.

This patch introduces new "fake" key type UBIFS_INVALID_KEY and initializes
unused 'snod->key' objects to this type. It also adds debugging assertions in
the TNC code to make sure no one ever tries to look these nodes up in the TNC.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/key.h   |   14 ++++++++++++++
 fs/ubifs/scan.c  |    5 ++++-
 fs/ubifs/tnc.c   |    5 ++++-
 fs/ubifs/ubifs.h |    6 +++++-
 4 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
index 0f530c6..92a8491 100644
--- a/fs/ubifs/key.h
+++ b/fs/ubifs/key.h
@@ -306,6 +306,20 @@ static inline void trun_key_init(const struct ubifs_info *c,
 }
 
 /**
+ * invalid_key_init - initialize invalid node key.
+ * @c: UBIFS file-system description object
+ * @key: key to initialize
+ *
+ * This is a helper function which marks a @key object as invalid.
+ */
+static inline void invalid_key_init(const struct ubifs_info *c,
+				    union ubifs_key *key)
+{
+	key->u32[0] = 0xDEADBEAF;
+	key->u32[1] = UBIFS_INVALID_KEY;
+}
+
+/**
  * key_type - get key type.
  * @c: UBIFS file-system description object
  * @key: key to get type of
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index a0a305c..3e1ee57 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -197,7 +197,7 @@ int ubifs_add_snod(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	struct ubifs_ino_node *ino = buf;
 	struct ubifs_scan_node *snod;
 
-	snod = kzalloc(sizeof(struct ubifs_scan_node), GFP_NOFS);
+	snod = kmalloc(sizeof(struct ubifs_scan_node), GFP_NOFS);
 	if (!snod)
 		return -ENOMEM;
 
@@ -218,6 +218,9 @@ int ubifs_add_snod(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 		 */
 		key_read(c, &ino->key, &snod->key);
 		break;
+	default:
+		invalid_key_init(c, &snod->key);
+		break;
 	}
 	list_add_tail(&snod->list, &sleb->nodes);
 	sleb->nodes_cnt += 1;
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 2194915..ad9cf01 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -1177,6 +1177,7 @@ int ubifs_lookup_level0(struct ubifs_info *c, const union ubifs_key *key,
 	unsigned long time = get_seconds();
 
 	dbg_tnc("search key %s", DBGKEY(key));
+	ubifs_assert(key_type(c, key) < UBIFS_INVALID_KEY);
 
 	znode = c->zroot.znode;
 	if (unlikely(!znode)) {
@@ -2966,7 +2967,7 @@ static struct ubifs_znode *right_znode(struct ubifs_info *c,
  *
  * This function searches an indexing node by its first key @key and its
  * address @lnum:@offs. It looks up the indexing tree by pulling all indexing
- * nodes it traverses to TNC. This function is called fro indexing nodes which
+ * nodes it traverses to TNC. This function is called for indexing nodes which
  * were found on the media by scanning, for example when garbage-collecting or
  * when doing in-the-gaps commit. This means that the indexing node which is
  * looked for does not have to have exactly the same leftmost key @key, because
@@ -2988,6 +2989,8 @@ static struct ubifs_znode *lookup_znode(struct ubifs_info *c,
 	struct ubifs_znode *znode, *zn;
 	int n, nn;
 
+	ubifs_assert(key_type(c, key) < UBIFS_INVALID_KEY);
+
 	/*
 	 * The arguments have probably been read off flash, so don't assume
 	 * they are valid.
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 0431087..a5928b1 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -119,8 +119,12 @@
  * in TNC. However, when replaying, it is handy to introduce fake "truncation"
  * keys for truncation nodes because the code becomes simpler. So we define
  * %UBIFS_TRUN_KEY type.
+ *
+ * But otherwise, out of the journal reply scope, the truncation keys are
+ * invalid.
  */
-#define UBIFS_TRUN_KEY UBIFS_KEY_TYPES_CNT
+#define UBIFS_TRUN_KEY    UBIFS_KEY_TYPES_CNT
+#define UBIFS_INVALID_KEY UBIFS_KEY_TYPES_CNT
 
 /*
  * How much a directory entry/extended attribute entry adds to the parent/host
-- 
1.7.2.1
