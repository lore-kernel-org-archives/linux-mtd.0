Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TZk3X-00065w-TN
 for linux-mtd@lists.infradead.org; Sat, 17 Nov 2012 15:11:40 +0000
Date: Sat, 17 Nov 2012 18:11:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
Message-ID: <20121117151126.GA16900@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using kmalloc_array() is a cleanup and it includes a check for integer
overflows.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index afaad07..23c2a20 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1104,7 +1104,7 @@ static int recomp_data_node(struct ubifs_data_node *dn, int *new_len)
 	int err, len, compr_type, out_len;
 
 	out_len = le32_to_cpu(dn->size);
-	buf = kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
+	buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
 	if (!buf)
 		return -ENOMEM;
 
