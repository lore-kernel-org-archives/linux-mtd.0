Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtHcE-0002tL-UB
 for linux-mtd@lists.infradead.org; Tue, 25 Nov 2014 15:01:19 +0000
Message-ID: <1416927654.5858.45.camel@sauron.fi.intel.com>
Subject: Re: potential memory corruption in check_leaf()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Nov 2014 17:00:54 +0200
In-Reply-To: <20141106100901.GA19282@mwanda>
References: <20141106100901.GA19282@mwanda>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-11-06 at 13:09 +0300, Dan Carpenter wrote:
>   1988                  ubifs_err("bad leaf length %d (LEB %d:%d)",
>   1989                            zbr->len, zbr->lnum, zbr->offs);
>   1990                  return -EINVAL;
>   1991          }

Yes, this code is a small sanity check. zbr->len is supposed to be the
length of whatever node type is referred by this znode branch.


>   1993          node = kmalloc(zbr->len, GFP_NOFS);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Allocate node.

Supposedly we allocate enough to store the node we refer to.

>   2031          if (type == UBIFS_DATA_KEY) {
>   2032                  long long blk_offs;
>   2033                  struct ubifs_data_node *dn = node;
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> But it's not large enough for "dn".

Well, this should not happen, but let's add an assert here to check that
we have enough space for 'dn'.

Something like this.


>From 6785baa1697c15a51408e7317709cbf078604695 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Tue, 25 Nov 2014 16:41:26 +0200
Subject: [PATCH] UBIFS: add a couple of extra asserts

... to catch possible memory corruptions.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/debug.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 7ed13e1..4cfb3e8 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2032,6 +2032,8 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		long long blk_offs;
 		struct ubifs_data_node *dn = node;
 
+		ubifs_assert(zbr->len >= UBIFS_DATA_NODE_SZ);
+
 		/*
 		 * Search the inode node this data node belongs to and insert
 		 * it to the RB-tree of inodes.
@@ -2060,6 +2062,8 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		struct ubifs_dent_node *dent = node;
 		struct fsck_inode *fscki1;
 
+		ubifs_assert(zbr->len >= UBIFS_DENT_NODE_SZ);
+
 		err = ubifs_validate_entry(c, dent);
 		if (err)
 			goto out_dump;
-- 
1.9.3
