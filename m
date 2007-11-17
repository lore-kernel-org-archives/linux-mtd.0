Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
Content-Type: text/plain
Date: Fri, 16 Nov 2007 22:46:17 -0500
Message-Id: <1195271177.2533.174.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Roman.borisov@intel.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2007-11-14 at 18:33 +0000, Alexey Korolev wrote:
> 
> We encountered issues with our power loss tests in JFFS2.
> This could be a serious problem in case of operations with databases. 
> 
> The problem appears in the following case:
> 1.      Power loss occurs at the moment of file content write.
> 2.      The header has been completely written.
> 3.      Data is written incompletely
> 
> If 1 2 and 3 occurs on next mount the partially written node is
> considered by JFFS2 as valid until we read the data.

For reasons not entirely clear to me, one of Artem's "debug cleanup"
patches seems to have completely abandoned the CRC check on data nodes.
Artem, can you explain commit 733802d974e5af42acb7cd61b16c0ce6dd03b7ed
for us?

This seems to make it happy on your two test cases. Note that in your
'NEW_FILE' test case, the original node at 0x34000C has already been
marked obsolete by a buggy kernel, so I needed to mark it valid again:
 echo -en \\xe0 | dd of=NEW_FILE bs=1 conv=notrunc seek=$((0x34000f)) count=1

Please test, and then I'll commit it.

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 8d4319c..b3f9294 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -37,23 +37,24 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 
 	BUG_ON(tn->csize == 0);
 
-	if (!jffs2_is_writebuffered(c))
-		goto adj_acc;
-
 	/* Calculate how many bytes were already checked */
 	ofs = ref_offset(ref) + sizeof(struct jffs2_raw_inode);
-	len = ofs % c->wbuf_pagesize;
-	if (likely(len))
-		len = c->wbuf_pagesize - len;
-
-	if (len >= tn->csize) {
-		dbg_readinode("no need to check node at %#08x, data length %u, data starts at %#08x - it has already been checked.\n",
-			ref_offset(ref), tn->csize, ofs);
-		goto adj_acc;
-	}
+	len = tn->csize;
+
+	if (jffs2_is_writebuffered(c)) {
+		int adj = ofs % c->wbuf_pagesize;
+		if (likely(adj))
+			adj = c->wbuf_pagesize - adj;
+
+		if (adj >= tn->csize) {
+			dbg_readinode("no need to check node at %#08x, data length %u, data starts at %#08x - it has already been checked.\n",
+				      ref_offset(ref), tn->csize, ofs);
+			goto adj_acc;
+		}
 
-	ofs += len;
-	len = tn->csize - len;
+		ofs += adj;
+		len -= adj;
+	}
 
 	dbg_readinode("check node at %#08x, data length %u, partial CRC %#08x, correct CRC %#08x, data starts at %#08x, start checking from %#08x - %u bytes.\n",
 		ref_offset(ref), tn->csize, tn->partial_crc, tn->data_crc, ofs - len, ofs, len);

-- 
dwmw2
