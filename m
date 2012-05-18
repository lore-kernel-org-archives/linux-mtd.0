Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVLPD-0005Kt-NO
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:31:36 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sidney Amani <seed95@gmail.com>
Subject: [PATCH 2/2] UBIFS: fix memory leak on error path
Date: Fri, 18 May 2012 14:32:37 +0300
Message-Id: <1337340757-26127-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337340757-26127-1-git-send-email-dedekind1@gmail.com>
References: <1337245412-22222-1-git-send-email-seed95@gmail.com>
 <1337340757-26127-1-git-send-email-dedekind1@gmail.com>
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

From: Sidney Amani <seed95@gmail.com>

UBIFS leaks memory on error path in 'mount_ubifs()'. In case of failure in
'ubifs_fixup_free_space()', it does not call 'ubifs_lpt_free()' whereas LPT
data structures can potentially be allocated. The amount of memory leaked can
be quite high -- see 'ubifs_lpt_init()'.

The bug was introduced when moving the LPT initialisation earlier in the
mount process (commit '781c5717a95a74b294beb38b8276943b0f8b5bb4').

Signed-off-by: Sidney Amani <seed95@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/super.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 5b30c4d..675b781 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1301,7 +1301,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (!c->ro_mount && c->space_fixup) {
 		err = ubifs_fixup_free_space(c);
 		if (err)
-			goto out_master;
+			goto out_lpt;
 	}
 
 	if (!c->ro_mount) {
-- 
1.7.10
