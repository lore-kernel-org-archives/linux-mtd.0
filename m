Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QellY-0001jW-BQ
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 10:25:05 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3] UBIFS: fix master node recovery
Date: Thu,  7 Jul 2011 12:25:02 +0200
Message-Id: <1310034302-9201-1-git-send-email-agust@denx.de>
In-Reply-To: <1310032278-5102-1-git-send-email-agust@denx.de>
References: <1310032278-5102-1-git-send-email-agust@denx.de>
Cc: Anatolij Gustschin <agust@denx.de>, Detlev Zundel <dzu@denx.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the 1st LEB was unmapped and written but 2nd LEB not,
the master node recovery doesn't succeed after power cut.
We see following error when mounting UBIFS partition on NOR
flash:

UBIFS error (pid 1137): ubifs_recover_master_node: failed to recover master node

Correct 2nd master node offset check is needed to fix the
problem. If the 2nd master node is at the end in the 2nd LEB,
first master node is used for recovery. When checking for this
condition we should check whether the master node is exactly at
the end of the LEB (without remaining empty space) or whether
it is followed by an empty space less than the master node size.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
v3:
  - drop unneeded brackets

v2:
  - drop incorrect check
  - revise commit description

 fs/ubifs/recovery.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 783d8e0..9820903 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -274,7 +274,8 @@ int ubifs_recover_master_node(struct ubifs_info *c)
 				if (cor1)
 					goto out_err;
 				mst = mst1;
-			} else if (offs1 == 0 && offs2 + sz >= c->leb_size) {
+			} else if (offs1 == 0 &&
+				   c->leb_size - offs2 - sz < sz) {
 				/* 1st LEB was unmapped and written, 2nd not */
 				if (cor1)
 					goto out_err;
-- 
1.7.1
