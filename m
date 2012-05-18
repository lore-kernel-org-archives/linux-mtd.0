Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVLPD-0005Kn-NN
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:31:36 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sidney Amani <seed95@gmail.com>
Subject: [PATCH 1/2] UBIFS: make ubifs_lpt_init clean-up in case of failure
Date: Fri, 18 May 2012 14:32:36 +0300
Message-Id: <1337340757-26127-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337245412-22222-1-git-send-email-seed95@gmail.com>
References: <1337245412-22222-1-git-send-email-seed95@gmail.com>
Cc: Ben Gardiner <bengardiner@nanometrics.ca>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Most functions in UBIFS follow the following designn pattern: if the function
allocates multiple resources, and failss at some point, it frees what it has
allocated and returns an error. So the caller can rely on the fact that the
callee has cleaned up everything after own failure.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/lpt.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 2054e81..b4280c4 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1740,16 +1740,20 @@ int ubifs_lpt_init(struct ubifs_info *c, int rd, int wr)
 	if (rd) {
 		err = lpt_init_rd(c);
 		if (err)
-			return err;
+			goto out_err;
 	}
 
 	if (wr) {
 		err = lpt_init_wr(c);
 		if (err)
-			return err;
+			goto out_err;
 	}
 
 	return 0;
+
+out_err:
+	ubifs_lpt_free(c, 0);
+	return err;
 }
 
 /**
-- 
1.7.10
