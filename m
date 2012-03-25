Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SBuD0-0003yq-A8
 for linux-mtd@lists.infradead.org; Sun, 25 Mar 2012 20:38:39 +0000
Date: Sun, 25 Mar 2012 22:38:34 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [patch] Move CRC computation to separate function
In-Reply-To: <1332521515.22278.2.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1203252234440.5527@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1202202112220.21022@eristoteles.iwoars.net>
 <1330531826.3545.128.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203191635030.22256@eristoteles.iwoars.net>
 <1332511796.18717.72.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203231739330.22944@eristoteles.iwoars.net>
 <1332521515.22278.2.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CRC computation now an inline header function which will be used in
multiple places in the future.

--

Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>

 fs/ubifs/io.c   |    4 +---
 fs/ubifs/misc.h |   15 +++++++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 9228950..103532e 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -379,7 +379,6 @@ static unsigned long long next_sqnum(struct ubifs_info *c)
  */
 void ubifs_prepare_node(struct ubifs_info *c, void *node, int len, int pad)
 {
-	uint32_t crc;
 	struct ubifs_ch *ch = node;
 	unsigned long long sqnum = next_sqnum(c);

@@ -390,8 +389,7 @@ void ubifs_prepare_node(struct ubifs_info *c, void *node, int len, int pad)
 	ch->group_type = UBIFS_NO_NODE_GROUP;
 	ch->sqnum = cpu_to_le64(sqnum);
 	ch->padding[0] = ch->padding[1] = 0;
-	crc = crc32(UBIFS_CRC32_INIT, node + 8, len - 8);
-	ch->crc = cpu_to_le32(crc);
+	ubifs_set_node_crc(node);

 	if (pad) {
 		len = ALIGN(len, 8);
diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index ee7cb5e..ffda6a5 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -27,6 +27,9 @@
 #ifndef __UBIFS_MISC_H__
 #define __UBIFS_MISC_H__

+#include <linux/crc32.h>
+#include "ubifs-media.h"
+
 /**
  * ubifs_zn_dirty - check if znode is dirty.
  * @znode: znode to check
@@ -300,4 +303,16 @@ static inline int ubifs_next_log_lnum(const struct ubifs_info *c, int lnum)
 	return lnum;
 }

+/**
+ * ubifs_set_crc - computes and writes the crc for a ubifs node to the common
+ * header.
+ * @node: the data node
+ */
+static inline void ubifs_set_node_crc(void *node)
+{
+	struct ubifs_ch *ch = (struct ubifs_ch *) node;
+	int len = le32_to_cpu(ch->len);
+	ch->crc = cpu_to_le32(crc32(UBIFS_CRC32_INIT, node + 8, len - 8));
+}
+
 #endif /* __UBIFS_MISC_H__ */
-- 
1.7.1
