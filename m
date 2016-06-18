Received: from fudo.makrotopia.org ([2001:41d0:8:c75d::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEIZn-0006qs-9b
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 15:54:28 +0000
Date: Sat, 18 Jun 2016 17:53:45 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>
Subject: [PATCH v3] ubifs: silence error output if MS_SILENT is set
Message-ID: <20160618155318.GA4285@makrotopia.org>
References: <5765615E.5010409@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5765615E.5010409@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This change completes
commit 90bea5a3f0bf680b87b90516f3c231997f4b8f3b
which already implements support for MS_SILENT except for that one
error message which is still being displayed despite MS_SILENT being
set. Suppress that error message as well in case MS_SILENT is set.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: logic was accidentally inverted, fix that.
v3: add patch description

 fs/ubifs/super.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7034995..736dd58 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2108,8 +2108,9 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 	 */
 	ubi = open_ubi(name, UBI_READONLY);
 	if (IS_ERR(ubi)) {
-		pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
-		       current->pid, name, (int)PTR_ERR(ubi));
+		if (!(flags & MS_SILENT))
+			pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
+			       current->pid, name, (int)PTR_ERR(ubi));
 		return ERR_CAST(ubi);
 	}
 
-- 
2.8.3
