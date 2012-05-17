Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUwdR-0000B9-9I
 for linux-mtd@lists.infradead.org; Thu, 17 May 2012 09:04:37 +0000
Received: by pbbrq13 with SMTP id rq13so2582433pbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 17 May 2012 02:04:35 -0700 (PDT)
From: Sidney Amani <seed95@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBIFS: fix memory leak on error path
Date: Thu, 17 May 2012 19:03:32 +1000
Message-Id: <1337245412-22222-1-git-send-email-seed95@gmail.com>
Cc: Ben Gardiner <bengardiner@nanometrics.ca>, Sidney Amani <seed95@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBIFS leaks memory on error path in 'mount_ubifs()'. In case of failure in
'ubifs_lpt_init()' or 'ubifs_fixup_free_space()', it does not call
'ubifs_lpt_free()' whereas LPT data structures can potentially be allocated.
The amount of memory leaked can be quite high -- see 'ubifs_lpt_init()'.

The bug was introduced when moving the LPT initialisation earlier in the
mount process (commit '781c5717a95a74b294beb38b8276943b0f8b5bb4').

CC: Ben Gardiner <bengardiner@nanometrics.ca>
Signed-off-by: Sidney Amani <seed95@gmail.com>
---
 fs/ubifs/super.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 76e4e05..50216ec 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1296,12 +1296,12 @@ static int mount_ubifs(struct ubifs_info *c)
 
 	err = ubifs_lpt_init(c, 1, !c->ro_mount);
 	if (err)
-		goto out_master;
+		goto out_lpt;
 
 	if (!c->ro_mount && c->space_fixup) {
 		err = ubifs_fixup_free_space(c);
 		if (err)
-			goto out_master;
+			goto out_lpt;
 	}
 
 	if (!c->ro_mount) {
-- 
1.7.5.4
